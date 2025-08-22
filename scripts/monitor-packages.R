#!/usr/bin/env Rscript

# monitor-packages.R
# Monitors R-universe API for package changes and determines which packages need checking

library(httr2)
library(yaml)
library(jsonlite)

# Create output for GitHub Actions
set_output <- function(name, value) {
  cat(sprintf("%s=%s\n", name, value), file = Sys.getenv("GITHUB_OUTPUT"), append = TRUE)
}

log_message <- function(message, level = "INFO") {
  timestamp <- format(Sys.time(), "%Y-%m-%d %H:%M:%S UTC", tz = "UTC")
  cat(sprintf("[%s] %s: %s\n", timestamp, level, message))
  
  # Also write to log file
  log_file <- file.path("logs", paste0("monitor-", Sys.Date(), ".log"))
  if (!dir.exists("logs")) dir.create("logs", recursive = TRUE)
  cat(sprintf("[%s] %s: %s\n", timestamp, level, message), 
      file = log_file, append = TRUE)
}

# Fetch packages from R-universe API
fetch_packages <- function() {
  log_message("Fetching packages from bioconductor-source.r-universe.dev")
  
  tryCatch({
    packages <- httr2::request("https://bioconductor-source.r-universe.dev/api/packages") |>
      httr2::req_user_agent("Bioconductor Gatekeeper") |>
      httr2::req_perform() |>
      httr2::resp_body_json()
    
    log_message(sprintf("Successfully fetched %d packages", length(packages)))
    return(packages)
  }, error = function(e) {
    log_message(sprintf("Error fetching packages: %s", e$message), "ERROR")
    return(NULL)
  })
}

# Load existing package status
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

# Check if package needs checking
needs_checking <- function(current_package, stored_status, force_check = FALSE) {
  if (force_check) {
    log_message(sprintf("Force check enabled for %s", current_package$Package))
    return(TRUE)
  }
  
  # If never checked before, need to check
  if (is.null(stored_status$version)) {
    log_message(sprintf("Package %s never checked before", current_package$Package))
    return(TRUE)
  }
  
  # Check if version changed
  if (current_package$Version != stored_status$version) {
    log_message(sprintf("Version changed for %s: %s -> %s", 
                       current_package$Package, 
                       stored_status$version, 
                       current_package$Version))
    return(TRUE)
  }
  
  # Check if commit hash changed
  if (!is.null(current_package$RemoteSha) && 
      current_package$RemoteSha != stored_status$commit_hash) {
    log_message(sprintf("Commit hash changed for %s: %s -> %s", 
                       current_package$Package, 
                       stored_status$commit_hash, 
                       current_package$RemoteSha))
    return(TRUE)
  }
  
  return(FALSE)
}

# Main monitoring logic
main <- function() {
  log_message("Starting package monitoring")
  
  force_check <- tolower(Sys.getenv("FORCE_CHECK", "false")) == "true"
  if (force_check) {
    log_message("Force check mode enabled")
  }
  
  # Fetch current packages
  packages <- fetch_packages()
  if (is.null(packages)) {
    log_message("Failed to fetch packages, exiting", "ERROR")
    quit(status = 1)
  }
  
  packages_to_check <- character(0)
  
  # Check each package
  for (pkg in packages) {
    if (is.null(pkg$Package)) {
      log_message("Skipping package with no name", "WARN")
      next
    }
    
    stored_status <- load_package_status(pkg$Package)
    
    if (needs_checking(pkg, stored_status, force_check)) {
      packages_to_check <- c(packages_to_check, pkg$Package)
      
      # Update status with new info but mark as pending check
      new_status <- stored_status
      new_status$version <- pkg$Version
      new_status$commit_hash <- pkg$RemoteSha %||% ""
      new_status$last_modified <- pkg$`_lastmodified` %||% ""
      new_status$status <- "pending_check"
      new_status$last_check_attempt <- format(Sys.time(), "%Y-%m-%d %H:%M:%S UTC", tz = "UTC")
      
      save_package_status(pkg$Package, new_status)
    } else {
      log_message(sprintf("No changes detected for %s", pkg$Package))
    }
  }
  
  log_message(sprintf("Found %d packages that need checking: %s", 
                     length(packages_to_check), 
                     paste(packages_to_check, collapse = ", ")))
  
  # Set output for GitHub Actions
  set_output("packages_to_check", paste(packages_to_check, collapse = ","))
  
  # Save summary
  summary <- list(
    timestamp = format(Sys.time(), "%Y-%m-%d %H:%M:%S UTC", tz = "UTC"),
    total_packages = length(packages),
    packages_to_check = length(packages_to_check),
    package_list = packages_to_check,
    force_check = force_check
  )
  
  yaml::write_yaml(summary, file.path("logs", paste0("monitor-summary-", Sys.Date(), ".yaml")))
  
  log_message("Package monitoring completed")
}

# Helper function for null coalescing
`%||%` <- function(x, y) if (is.null(x)) y else x

# Run main function
if (!interactive()) {
  main()
}
