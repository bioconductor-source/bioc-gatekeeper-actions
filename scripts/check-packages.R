#!/usr/bin/env Rscript

# check-packages.R
# Performs detailed checks on packages that have changed

library(yaml)
library(jsonlite)
library(httr2)

# Load configuration
load_config <- function() {
  config_file <- "config.yaml"
  if (file.exists(config_file)) {
    return(yaml::read_yaml(config_file))
  } else {
    # Default configuration
    return(list(
      bioconductor = list(
        version = "3.21",
        cycle = "devel", 
        expected_minor_parity = "odd"
      ),
      checks = list(
        max_file_size_mb = 5,
        bioccheck = list(enabled = TRUE, blocking = FALSE)
      )
    ))
  }
}

log_message <- function(message, level = "INFO", package = NULL) {
  timestamp <- format(Sys.time(), "%Y-%m-%d %H:%M:%S UTC", tz = "UTC")
  pkg_prefix <- if (!is.null(package)) sprintf("[%s] ", package) else ""
  full_message <- sprintf("[%s] %s: %s%s", timestamp, level, pkg_prefix, message)
  cat(full_message, "\n")
  
  # Also write to log file
  log_file <- file.path("logs", paste0("check-", Sys.Date(), ".log"))
  if (!dir.exists("logs")) dir.create("logs", recursive = TRUE)
  cat(full_message, "\n", file = log_file, append = TRUE)
}

# Download and extract package source
download_package <- function(package_name) {
  log_message(sprintf("Downloading source for package %s", package_name), package = package_name)
  
  # Create temp directory for this package
  temp_dir <- file.path("temp", package_name)
  if (dir.exists(temp_dir)) {
    unlink(temp_dir, recursive = TRUE)
  }
  dir.create(temp_dir, recursive = TRUE)
  
  tryCatch({
    # Get package info from R-universe API
    api_url <- sprintf("https://bioconductor-source.r-universe.dev/api/packages/%s", package_name)
    
    pkg_info <- httr2::request(api_url) |>
      httr2::req_user_agent("Bioconductor Gatekeeper") |>
      httr2::req_perform() |>
      httr2::resp_body_json()
    
    download_url <- NULL
    
    # Try different source URL patterns
    if (!is.null(pkg_info$`_src`)) {
      download_url <- pkg_info$`_src`
    } else if (!is.null(pkg_info$`Package`) && !is.null(pkg_info$`Version`)) {
      # Construct standard tarball URL
      download_url <- sprintf("https://bioconductor-source.r-universe.dev/src/contrib/%s_%s.tar.gz", 
                             pkg_info$Package, pkg_info$Version)
    } else {
      stop("No source URL found and cannot construct standard URL")
    }
    
    log_message(sprintf("Downloading from: %s", download_url), package = package_name)
    
    tarball_file <- file.path(temp_dir, paste0(package_name, ".tar.gz"))
    
    # Download with better error handling
    download_result <- httr2::request(download_url) |>
      httr2::req_user_agent("Bioconductor Gatekeeper") |>
      httr2::req_perform()
    
    # Write the downloaded content
    writeBin(httr2::resp_body_raw(download_result), tarball_file)
    
    # Verify download
    if (!file.exists(tarball_file) || file.info(tarball_file)$size == 0) {
      stop("Downloaded file is empty or missing")
    }
    
    log_message(sprintf("Downloaded tarball size: %d bytes", file.info(tarball_file)$size), package = package_name)
    
    # Extract tarball
    extract_dir <- file.path(temp_dir, "extracted")
    dir.create(extract_dir)
    
    # Use R's untar function with better error handling
    result <- untar(tarball_file, exdir = extract_dir, verbose = FALSE)
    if (result != 0) {
      stop("Failed to extract tarball")
    }
    
    # Find the package directory
    pkg_dirs <- list.dirs(extract_dir, recursive = FALSE)
    if (length(pkg_dirs) == 0) {
      stop("No package directory found after extraction")
    }
    
    pkg_dir <- pkg_dirs[1]  # Usually just one directory
    
    # Verify it looks like a package directory
    if (!file.exists(file.path(pkg_dir, "DESCRIPTION"))) {
      stop("DESCRIPTION file not found in extracted package")
    }
    
    log_message(sprintf("Successfully downloaded and extracted %s to %s", package_name, pkg_dir), package = package_name)
    return(pkg_dir)
    
  }, error = function(e) {
    log_message(sprintf("Error downloading package: %s", e$message), "ERROR", package = package_name)
    return(NULL)
  })
}

# Check for merge markers
check_merge_markers <- function(pkg_dir, package_name) {
  log_message("Checking for merge markers", package = package_name)
  
  issues <- character(0)
  
  # Recursively check all text files
  files <- list.files(pkg_dir, recursive = TRUE, full.names = TRUE)
  text_files <- files[!grepl("\\.(png|jpg|jpeg|gif|pdf|so|dll|exe|zip|tar\\.gz)$", files, ignore.case = TRUE)]
  
  for (file in text_files) {
    if (file.info(file)$size > 10 * 1024 * 1024) next  # Skip very large files
    
    tryCatch({
      content <- readLines(file, warn = FALSE)
      
      # Check each line for actual Git merge conflict markers
      for (line_num in seq_along(content)) {
        line <- content[line_num]
        
        # Check for Git conflict start marker: <<<<<<< followed by space and branch/ref name
        if (grepl("^<{7}\\s", line)) {
          rel_path <- gsub(paste0("^", pkg_dir, "/"), "", file)
          issues <- c(issues, sprintf("Git conflict start marker '<<<<<<< ' found in %s (line %d): %s", 
                                    rel_path, line_num, trimws(line)))
        }
        
        # Check for Git conflict separator: exactly 7 equals signs at start of line
        if (grepl("^={7}$", line)) {
          rel_path <- gsub(paste0("^", pkg_dir, "/"), "", file)
          issues <- c(issues, sprintf("Git conflict separator '=======' found in %s (line %d)", 
                                    rel_path, line_num))
        }
        
        # Check for Git conflict end marker: >>>>>>> followed by space and branch/ref name
        if (grepl("^>{7}\\s", line)) {
          rel_path <- gsub(paste0("^", pkg_dir, "/"), "", file)
          issues <- c(issues, sprintf("Git conflict end marker '>>>>>>> ' found in %s (line %d): %s", 
                                    rel_path, line_num, trimws(line)))
        }
      }
    }, error = function(e) {
      # Skip files that can't be read as text
    })
  }
  
  if (length(issues) > 0) {
    log_message(sprintf("Found %d merge marker issues", length(issues)), "WARN", package = package_name)
    return(list(passed = FALSE, issues = issues))
  } else {
    log_message("No merge markers found", package = package_name)
    return(list(passed = TRUE, issues = character(0)))
  }
}

# Check for large files
check_large_files <- function(pkg_dir, package_name, config) {
  max_size_mb <- config$checks$max_file_size_mb %||% 5
  log_message(sprintf("Checking for files larger than %d MB", max_size_mb), package = package_name)
  
  max_size_bytes <- max_size_mb * 1024 * 1024
  large_files <- character(0)
  
  files <- list.files(pkg_dir, recursive = TRUE, full.names = TRUE)
  
  for (file in files) {
    if (file.info(file)$size > max_size_bytes) {
      rel_path <- gsub(paste0("^", pkg_dir, "/"), "", file)
      size_mb <- round(file.info(file)$size / (1024 * 1024), 2)
      large_files <- c(large_files, sprintf("%s (%s MB)", rel_path, size_mb))
    }
  }
  
  if (length(large_files) > 0) {
    log_message(sprintf("Found %d large files", length(large_files)), "WARN", package = package_name)
    return(list(passed = FALSE, issues = large_files))
  } else {
    log_message("No large files found", package = package_name)
    return(list(passed = TRUE, issues = character(0)))
  }
}

# Check DESCRIPTION dependencies
check_description_deps <- function(pkg_dir, package_name) {
  log_message("Checking DESCRIPTION dependencies", package = package_name)
  
  desc_file <- file.path(pkg_dir, "DESCRIPTION")
  if (!file.exists(desc_file)) {
    return(list(passed = FALSE, issues = "DESCRIPTION file not found"))
  }
  
  desc_content <- readLines(desc_file)
  
  issues <- character(0)
  
  # Get all dependency fields
  dep_fields <- c("Depends", "Imports", "Suggests", "LinkingTo", "Enhances")
  
  for (i in seq_along(desc_content)) {
    line <- desc_content[i]
    
    # Check for remote:: dependencies (GitHub, GitLab, etc.)
    if (grepl("remote::", line, ignore.case = TRUE)) {
      issues <- c(issues, sprintf("Remote dependency found on line %d: %s", i, trimws(line)))
    }
    
    # Check for github:: dependencies  
    if (grepl("github::", line, ignore.case = TRUE)) {
      issues <- c(issues, sprintf("GitHub dependency found on line %d: %s", i, trimws(line)))
    }
    
    # Check for gitlab:: dependencies
    if (grepl("gitlab::", line, ignore.case = TRUE)) {
      issues <- c(issues, sprintf("GitLab dependency found on line %d: %s", i, trimws(line)))
    }
    
    # Check for bitbucket:: dependencies
    if (grepl("bitbucket::", line, ignore.case = TRUE)) {
      issues <- c(issues, sprintf("Bitbucket dependency found on line %d: %s", i, trimws(line)))
    }
    
    # Check for url:: dependencies
    if (grepl("url::", line, ignore.case = TRUE)) {
      issues <- c(issues, sprintf("URL dependency found on line %d: %s", i, trimws(line)))
    }
    
    # Check for any other :: patterns that aren't standard R version specs
    if (grepl("::", line) && !grepl("R \\(", line, ignore.case = TRUE)) {
      # Allow standard dependency field patterns and R version specs
      is_dep_field <- any(sapply(dep_fields, function(field) grepl(paste0("^", field, ":"), line)))
      is_r_version <- grepl("R \\(.*\\)", line)
      
      if (!is_dep_field && !is_r_version) {
        issues <- c(issues, sprintf("Potential non-standard dependency on line %d: %s", i, trimws(line)))
      }
    }
  }
  
  # Additional check for remotes field in DESCRIPTION (if present)
  remotes_lines <- grep("^Remotes:", desc_content, value = TRUE, ignore.case = TRUE)
  if (length(remotes_lines) > 0) {
    for (remote_line in remotes_lines) {
      issues <- c(issues, sprintf("Remotes field found (not allowed): %s", trimws(remote_line)))
    }
  }
  
  # Check for non-CRAN/Bioconductor repositories
  additional_repos <- grep("^Additional_repositories:", desc_content, value = TRUE, ignore.case = TRUE)
  if (length(additional_repos) > 0) {
    for (repo_line in additional_repos) {
      issues <- c(issues, sprintf("Additional_repositories field found (review required): %s", trimws(repo_line)))
    }
  }
  
  if (length(issues) > 0) {
    log_message(sprintf("Found %d dependency issues", length(issues)), "WARN", package = package_name)
    return(list(passed = FALSE, issues = issues))
  } else {
    log_message("Dependencies look good", package = package_name)
    return(list(passed = TRUE, issues = character(0)))
  }
}

# Check version numbers
check_version_numbers <- function(pkg_dir, package_name, config) {
  log_message("Checking version numbers", package = package_name)
  
  desc_file <- file.path(pkg_dir, "DESCRIPTION")
  if (!file.exists(desc_file)) {
    return(list(passed = FALSE, issues = "DESCRIPTION file not found"))
  }
  
  desc_content <- readLines(desc_file)
  version_line <- grep("^Version:", desc_content, value = TRUE)
  
  if (length(version_line) == 0) {
    return(list(passed = FALSE, issues = "No Version field found in DESCRIPTION"))
  }
  
  version <- trimws(gsub("^Version:", "", version_line[1]))
  version_parts <- strsplit(version, "\\.")[[1]]
  
  issues <- character(0)
  
  # Check version format - must be at least x.y.z
  if (length(version_parts) < 3) {
    issues <- c(issues, sprintf("Invalid version format: %s (must be at least x.y.z)", version))
  } else {
    major <- as.numeric(version_parts[1])
    minor <- as.numeric(version_parts[2])
    patch <- as.numeric(version_parts[3])
    
    if (is.na(major) || is.na(minor) || is.na(patch)) {
      issues <- c(issues, sprintf("Invalid version numbers: %s (non-numeric components)", version))
    } else {
      # Check for negative version numbers
      if (major < 0 || minor < 0 || patch < 0) {
        issues <- c(issues, sprintf("Negative version numbers not allowed: %s", version))
      }
      
      # Check for extremely high version numbers
      if (major > 99 || minor > 99) {
        issues <- c(issues, sprintf("Suspiciously high version numbers: %s", version))
      }
      
      # Bioconductor version policy checks using config
      bioc_config <- config$bioconductor
      expected_parity <- bioc_config$expected_minor_parity %||% "odd"
      bioc_cycle <- bioc_config$cycle %||% "devel"
      
      is_even_minor <- (minor %% 2 == 0)
      expected_even <- (expected_parity == "even")
      
      if (is_even_minor != expected_even) {
        issues <- c(issues, sprintf("Version %s minor number %d is %s, but Bioconductor %s expects %s minor versions", 
                                   version, minor,
                                   if(is_even_minor) "even" else "odd",
                                   bioc_cycle,
                                   expected_parity))
      }
      
      log_message(sprintf("Version: %s - minor version %d is %s (Bioc %s cycle expects %s)", 
                         version, minor, 
                         if(is_even_minor) "even" else "odd",
                         bioc_cycle, expected_parity), 
                 package = package_name)
    }
  }
  
  if (length(issues) > 0) {
    log_message(sprintf("Found %d version issues", length(issues)), "WARN", package = package_name)
    return(list(passed = FALSE, issues = issues))
  } else {
    log_message("Version numbers look good", package = package_name)
    return(list(passed = TRUE, issues = character(0)))
  }
}

# Run BiocCheck
run_bioccheck <- function(pkg_dir, package_name, config) {
  bioc_config <- config$checks$bioccheck
  
  if (!bioc_config$enabled %||% TRUE) {
    log_message("BiocCheck disabled in configuration", package = package_name)
    return(list(
      passed = TRUE,
      warnings = character(0),
      errors = "BiocCheck disabled",
      full_output = character(0)
    ))
  }
  
  log_message("Running BiocCheck (non-blocking)", package = package_name)
  
  # Check if BiocCheck is available
  if (!requireNamespace("BiocCheck", quietly = TRUE)) {
    log_message("BiocCheck package not available, skipping", "WARN", package = package_name)
    return(list(
      passed = TRUE,  # Non-blocking
      warnings = character(0),
      errors = "BiocCheck package not available",
      full_output = character(0)
    ))
  }
  
  # Create output capture file
  output_file <- file.path("temp", paste0("bioccheck_", package_name, "_output.txt"))
  
  # Run BiocCheck directly in R to avoid system call issues
  tryCatch({
    # Capture output
    sink(output_file, type = "output")
    sink(output_file, type = "message", append = TRUE)
    
    # Load BiocCheck
    library(BiocCheck, quietly = TRUE)
    
    # Run BiocCheck with basic options
    result <- BiocCheck::BiocCheck(pkg_dir, 
                                  `quit-with-status` = FALSE,
                                  `no-check-vignettes` = TRUE,  # Skip vignette checks for speed
                                  `new-package` = FALSE)
    
    # Reset sinks
    sink()
    sink(type = "message")
    
    cat("BiocCheck completed successfully\n", file = output_file, append = TRUE)
    
  }, error = function(e) {
    # Reset sinks in case of error
    sink()
    sink(type = "message")
    
    cat("BiocCheck error:", e$message, "\n", file = output_file, append = TRUE)
    log_message(sprintf("BiocCheck error: %s", e$message), "ERROR", package = package_name)
  })
  
  # Read the output
  if (file.exists(output_file)) {
    output <- readLines(output_file)
    
    # Look for warnings and errors
    warnings <- grep("WARNING|WARN", output, value = TRUE, ignore.case = TRUE)
    errors <- grep("ERROR|FAIL", output, value = TRUE, ignore.case = TRUE)
    
    # Filter out some common non-critical warnings/errors
    warnings <- warnings[!grepl("cannot open file.*DESCRIPTION", warnings, ignore.case = TRUE)]
    errors <- errors[!grepl("cannot open file.*DESCRIPTION", errors, ignore.case = TRUE)]
    
    log_message(sprintf("BiocCheck completed - Warnings: %d, Errors: %d", 
                       length(warnings), length(errors)), package = package_name)
    
    # BiocCheck is always non-blocking
    return(list(
      passed = TRUE,  # Always pass - BiocCheck is non-blocking
      warnings = warnings,
      errors = errors,
      full_output = output
    ))
  } else {
    log_message("BiocCheck output file not found", "ERROR", package = package_name)
    return(list(
      passed = TRUE,  # Non-blocking even on failure
      warnings = character(0), 
      errors = "BiocCheck failed to run - no output file",
      full_output = character(0)
    ))
  }
}

# Prepare package for deployment
prepare_for_deployment <- function(pkg_dir, package_name) {
  log_message("Preparing package for deployment", package = package_name)
  
  # Create passing directory structure
  passing_dir <- file.path("temp", "passing")
  if (!dir.exists(passing_dir)) {
    dir.create(passing_dir, recursive = TRUE)
  }
  
  # Copy source tarball to passing directory
  tryCatch({
    tarball_source <- file.path("temp", package_name, paste0(package_name, ".tar.gz"))
    if (file.exists(tarball_source)) {
      tarball_dest <- file.path(passing_dir, paste0(package_name, ".tar.gz"))
      file.copy(tarball_source, tarball_dest, overwrite = TRUE)
      log_message(sprintf("Source tarball prepared for deployment: %s", tarball_dest), package = package_name)
    }
  }, error = function(e) {
    log_message(sprintf("Failed to prepare source for deployment: %s", e$message), "ERROR", package = package_name)
  })
}

# Check a single package
check_package <- function(package_name) {
  log_message(sprintf("Starting comprehensive check for package %s", package_name), package = package_name)
  
  # Load configuration
  config <- load_config()
  
  # Download and extract package
  pkg_dir <- download_package(package_name)
  if (is.null(pkg_dir)) {
    return(list(
      package = package_name,
      status = "failed",
      error = "Failed to download package",
      checks = list()
    ))
  }
  
  # Run all checks
  checks <- list()
  overall_passed <- TRUE
  
  # Check for merge markers
  checks$merge_markers <- check_merge_markers(pkg_dir, package_name)
  if (!checks$merge_markers$passed) overall_passed <- FALSE
  
  # Check for large files
  checks$large_files <- check_large_files(pkg_dir, package_name, config)
  if (!checks$large_files$passed) overall_passed <- FALSE
  
  # Check DESCRIPTION dependencies
  checks$dependencies <- check_description_deps(pkg_dir, package_name)
  if (!checks$dependencies$passed) overall_passed <- FALSE
  
  # Check version numbers
  checks$version <- check_version_numbers(pkg_dir, package_name, config)
  if (!checks$version$passed) overall_passed <- FALSE
  
  # Run BiocCheck (always non-blocking)
  checks$bioccheck <- run_bioccheck(pkg_dir, package_name, config)
  # BiocCheck is non-blocking - never affects overall pass/fail status
  
  # If passed, prepare for deployment
  if (overall_passed) {
    prepare_for_deployment(pkg_dir, package_name)
  }
  
  # Clean up
  unlink(file.path("temp", package_name), recursive = TRUE)
  
  result <- list(
    package = package_name,
    status = if (overall_passed) "passed" else "failed",
    timestamp = format(Sys.time(), "%Y-%m-%d %H:%M:%S UTC", tz = "UTC"),
    checks = checks
  )
  
  log_message(sprintf("Comprehensive check completed - Status: %s", result$status), package = package_name)
  
  return(result)
}

# Main function
main <- function() {
  args <- commandArgs(trailingOnly = TRUE)
  if (length(args) == 0) {
    log_message("No packages specified for checking")
    return()
  }
  
  packages_str <- args[1]
  if (packages_str == "") {
    log_message("Empty package list")
    return()
  }
  
  packages <- strsplit(packages_str, ",")[[1]]
  packages <- trimws(packages)
  packages <- packages[packages != ""]
  
  if (length(packages) == 0) {
    log_message("No valid packages to check")
    return()
  }
  
  log_message(sprintf("Starting checks for %d packages: %s", 
                     length(packages), paste(packages, collapse = ", ")))
  
  # Create temp directory
  if (!dir.exists("temp")) dir.create("temp", recursive = TRUE)
  
  # Check each package
  results <- list()
  for (pkg in packages) {
    results[[pkg]] <- check_package(pkg)
  }
  
  # Save results
  results_file <- file.path("logs", paste0("check-results-", Sys.Date(), ".yaml"))
  yaml::write_yaml(results, results_file)
  
  # Save individual results for updating status
  for (pkg in names(results)) {
    pkg_result_file <- file.path("temp", paste0(pkg, "_result.yaml"))
    yaml::write_yaml(results[[pkg]], pkg_result_file)
  }
  
  log_message("All package checks completed")
}

# Helper function for null coalescing
`%||%` <- function(x, y) if (is.null(x)) y else x

# Run main function
if (!interactive()) {
  main()
}
