#!/usr/bin/env Rscript

# update-status.R
# Updates package status files with check results

library(yaml)

log_message <- function(message, level = "INFO") {
  timestamp <- format(Sys.time(), "%Y-%m-%d %H:%M:%S UTC", tz = "UTC")
  cat(sprintf("[%s] %s: %s\n", timestamp, level, message))
  
  # Also write to log file
  log_file <- file.path("logs", paste0("update-", Sys.Date(), ".log"))
  if (!dir.exists("logs")) dir.create("logs", recursive = TRUE)
  cat(sprintf("[%s] %s: %s\n", timestamp, level, message), 
      file = log_file, append = TRUE)
}

# Load package status
load_package_status <- function(package_name) {
  status_file <- file.path("package-status", paste0(package_name, ".yaml"))
  
  if (file.exists(status_file)) {
    return(yaml::read_yaml(status_file))
  } else {
    return(list(
      package = package_name,
      version = NULL,
      commit_hash = NULL,
      last_check = NULL,
      last_successful_check = NULL,
      status = "never_checked"
    ))
  }
}

# Save package status
save_package_status <- function(package_name, status) {
  if (!dir.exists("package-status")) {
    dir.create("package-status", recursive = TRUE)
  }
  
  status_file <- file.path("package-status", paste0(package_name, ".yaml"))
  yaml::write_yaml(status, status_file)
}

# Update status from check results
update_package_status <- function(package_name, check_result) {
  log_message(sprintf("Updating status for package %s", package_name))
  
  # Load current status
  status <- load_package_status(package_name)
  
  # Update with check results
  status$last_check <- check_result$timestamp
  status$status <- check_result$status
  
  if (check_result$status == "passed") {
    status$last_successful_check <- check_result$timestamp
  }
  
  # Store detailed check results
  status$last_check_details <- list(
    timestamp = check_result$timestamp,
    status = check_result$status,
    checks = check_result$checks
  )
  
  # Add summary of issues
  if (check_result$status == "failed") {
    issues <- character(0)
    
    for (check_name in names(check_result$checks)) {
      check_info <- check_result$checks[[check_name]]
      if (!is.null(check_info$passed) && !check_info$passed) {
        if (!is.null(check_info$issues)) {
          issues <- c(issues, paste0(check_name, ": ", check_info$issues))
        }
      }
    }
    
    status$issues <- issues
  } else {
    status$issues <- NULL
  }
  
  # Add BiocCheck warnings (these don't fail the package but should be tracked)
  if (!is.null(check_result$checks$bioccheck$warnings) && 
      length(check_result$checks$bioccheck$warnings) > 0) {
    status$bioccheck_warnings <- check_result$checks$bioccheck$warnings
  } else {
    status$bioccheck_warnings <- NULL
  }
  
  # Save updated status
  save_package_status(package_name, status)
  
  log_message(sprintf("Status updated for %s: %s", package_name, check_result$status))
}

# Generate summary report
generate_summary_report <- function() {
  log_message("Generating summary report")
  
  # Find all package status files
  if (!dir.exists("package-status")) {
    log_message("No package-status directory found")
    return()
  }
  
  status_files <- list.files("package-status", pattern = "\\.yaml$", full.names = TRUE)
  
  if (length(status_files) == 0) {
    log_message("No package status files found")
    return()
  }
  
  summary <- list(
    timestamp = format(Sys.time(), "%Y-%m-%d %H:%M:%S UTC", tz = "UTC"),
    total_packages = length(status_files),
    packages = list()
  )
  
  status_counts <- list(
    passed = 0,
    failed = 0,
    pending_check = 0,
    never_checked = 0
  )
  
  for (file in status_files) {
    status <- yaml::read_yaml(file)
    
    # Count statuses - handle both single values and vectors
    if (!is.null(status$status)) {
      current_status <- status$status
      if (length(current_status) > 1) {
        current_status <- current_status[1]  # Take first element if vector
      }
      if (current_status %in% names(status_counts)) {
        status_counts[[current_status]] <- status_counts[[current_status]] + 1
      }
    }
    
    # Add to summary (minimal info)
    if (!is.null(status$package) && is.character(status$package) && length(status$package) == 1) {
      summary$packages[[status$package]] <- list(
        version = status$version,
        status = status$status,
        last_check = status$last_check,
        last_successful_check = status$last_successful_check,
        has_issues = !is.null(status$issues) && length(status$issues) > 0,
        has_bioccheck_warnings = !is.null(status$bioccheck_warnings) && length(status$bioccheck_warnings) > 0
      )
    }
  }
  
  summary$status_counts <- status_counts
  
  # Save summary
  summary_file <- file.path("logs", paste0("summary-", Sys.Date(), ".yaml"))
  yaml::write_yaml(summary, summary_file)
  
  # Also save a latest summary
  latest_summary_file <- file.path("package-status", "summary.yaml")
  yaml::write_yaml(summary, latest_summary_file)
  
  log_message(sprintf("Summary report generated: %d total packages, %d passed, %d failed, %d pending, %d never checked",
                     summary$total_packages,
                     status_counts$passed,
                     status_counts$failed,
                     status_counts$pending_check,
                     status_counts$never_checked))
}

# Main function
main <- function() {
  log_message("Starting status update")
  
  # Look for check result files
  if (!dir.exists("temp")) {
    log_message("No temp directory found, no results to process")
    generate_summary_report()
    return()
  }
  
  result_files <- list.files("temp", pattern = "_result\\.yaml$", full.names = TRUE)
  
  if (length(result_files) == 0) {
    log_message("No check result files found")
    generate_summary_report()
    return()
  }
  
  log_message(sprintf("Processing %d result files", length(result_files)))
  
  # Process each result file
  for (file in result_files) {
    tryCatch({
      result <- yaml::read_yaml(file)
      update_package_status(result$package, result)
    }, error = function(e) {
      log_message(sprintf("Error processing result file %s: %s", file, e$message), "ERROR")
    })
  }
  
  # Generate summary report
  generate_summary_report()
  
  log_message("Status update completed")
}

# Run main function
if (!interactive()) {
  main()
}
