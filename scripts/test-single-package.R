#!/usr/bin/env Rscript

# test-single-package.R
# Script for testing the gatekeeper system on a single package

args <- commandArgs(trailingOnly = TRUE)

if (length(args) == 0) {
  cat("Usage: Rscript scripts/test-single-package.R <package-name>\n")
  cat("Example: Rscript scripts/test-single-package.R BiocGenerics\n")
  quit(status = 1)
}

package_name <- args[1]

cat(sprintf("Testing gatekeeper system on package: %s\n", package_name))

# Create necessary directories
dirs <- c("package-status", "logs", "temp")
for (dir in dirs) {
  if (!dir.exists(dir)) {
    dir.create(dir, recursive = TRUE)
    cat(sprintf("Created directory: %s\n", dir))
  }
}

# Set environment variables
Sys.setenv(FORCE_CHECK = "true")

cat("\n=== Step 1: Monitoring (fetching package info) ===\n")
system("Rscript scripts/monitor-packages.R")

cat("\n=== Step 2: Checking package ===\n")
system(sprintf("Rscript scripts/check-packages.R %s", package_name))

cat("\n=== Step 3: Updating status ===\n")
system("Rscript scripts/update-status.R")

cat("\n=== Results ===\n")

# Show the package status
status_file <- file.path("package-status", paste0(package_name, ".yaml"))
if (file.exists(status_file)) {
  cat(sprintf("Package status saved to: %s\n", status_file))
  cat("Status content:\n")
  status_content <- readLines(status_file)
  cat(paste(status_content, collapse = "\n"))
  cat("\n")
} else {
  cat("No status file found. Check logs for errors.\n")
}

# Show summary if available
summary_file <- file.path("package-status", "summary.yaml")
if (file.exists(summary_file)) {
  cat(sprintf("\nSummary saved to: %s\n", summary_file))
}

cat(sprintf("\nTest completed for package: %s\n", package_name))
cat("Check the logs/ directory for detailed output.\n")
