#!/usr/bin/env Rscript

# deploy-packages.R
# Deploys passing packages to production using rclone

library(yaml)

log_message <- function(message, level = "INFO") {
  timestamp <- format(Sys.time(), "%Y-%m-%d %H:%M:%S UTC", tz = "UTC")
  cat(sprintf("[%s] %s: %s\n", timestamp, level, message))
  
  # Also write to log file
  log_file <- file.path("logs", paste0("deploy-", Sys.Date(), ".log"))
  if (!dir.exists("logs")) dir.create("logs", recursive = TRUE)
  cat(sprintf("[%s] %s: %s\n", timestamp, level, message), 
      file = log_file, append = TRUE)
}

# Load configuration
load_config <- function() {
  config_file <- "config.yaml"
  if (file.exists(config_file)) {
    return(yaml::read_yaml(config_file))
  } else {
    return(list(
      deployment = list(
        rclone = list(
          enabled = FALSE,
          bucket = "bioc-production",
          remote = "production"
        )
      )
    ))
  }
}

# Deploy passing packages
deploy_packages <- function() {
  log_message("Starting package deployment")
  
  config <- load_config()
  rclone_config <- config$deployment$rclone
  
  if (!rclone_config$enabled %||% FALSE) {
    log_message("rclone deployment disabled in configuration")
    return()
  }
  
  # Check if rclone is available
  rclone_check <- system2("which", args = "rclone", stdout = FALSE, stderr = FALSE)
  if (rclone_check != 0) {
    log_message("rclone not found in PATH", "ERROR")
    return()
  }
  
  # Check if passing directory exists
  passing_dir <- file.path("temp", "passing")
  if (!dir.exists(passing_dir)) {
    log_message("No passing packages directory found")
    return()
  }
  
  # List passing packages
  passing_files <- list.files(passing_dir, pattern = "\\.tar\\.gz$", full.names = TRUE)
  
  if (length(passing_files) == 0) {
    log_message("No passing packages to deploy")
    return()
  }
  
  log_message(sprintf("Found %d passing packages to deploy", length(passing_files)))
  
  # Deploy each package
  remote_name <- rclone_config$remote %||% "production"
  bucket_name <- rclone_config$bucket %||% "bioc-production"
  
  success_count <- 0
  
  for (file in passing_files) {
    package_name <- basename(file)
    log_message(sprintf("Deploying %s", package_name))
    
    # rclone copy command
    remote_path <- sprintf("%s:%s/src/contrib/", remote_name, bucket_name)
    
    tryCatch({
      result <- system2("rclone", 
                       args = c("copy", file, remote_path, "--progress"),
                       stdout = TRUE, 
                       stderr = TRUE)
      
      if (length(attr(result, "status")) == 0 || attr(result, "status") == 0) {
        log_message(sprintf("Successfully deployed %s", package_name))
        success_count <- success_count + 1
      } else {
        log_message(sprintf("Failed to deploy %s: %s", package_name, paste(result, collapse = " ")), "ERROR")
      }
      
    }, error = function(e) {
      log_message(sprintf("Error deploying %s: %s", package_name, e$message), "ERROR")
    })
  }
  
  log_message(sprintf("Deployment completed: %d/%d packages successfully deployed", 
                     success_count, length(passing_files)))
  
  # Clean up deployed packages
  if (success_count > 0) {
    log_message("Cleaning up deployed packages")
    unlink(passing_dir, recursive = TRUE)
  }
}

# Helper function for null coalescing
`%||%` <- function(x, y) if (is.null(x)) y else x

# Main function
main <- function() {
  deploy_packages()
}

# Run main function
if (!interactive()) {
  main()
}
