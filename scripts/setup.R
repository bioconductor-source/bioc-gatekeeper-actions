#!/usr/bin/env Rscript

# setup.R
# Sets up the local environment for gatekeeper development

cat("Setting up Bioconductor Gatekeeper environment...\n\n")

# Check R version
r_version <- R.Version()
cat(sprintf("R version: %s.%s.%s\n", r_version$major, r_version$minor, r_version$patch))

if (as.numeric(paste0(r_version$major, ".", r_version$minor)) < 4.0) {
  cat("WARNING: R version 4.0 or higher is recommended\n")
}

# Install required packages
required_packages <- c("httr2", "yaml", "jsonlite", "BiocManager", "remotes")

cat("\nInstalling required CRAN packages...\n")
for (pkg in required_packages) {
  if (!require(pkg, character.only = TRUE, quietly = TRUE)) {
    cat(sprintf("Installing %s...\n", pkg))
    install.packages(pkg, repos = "https://cloud.r-project.org/")
  } else {
    cat(sprintf("%s is already installed\n", pkg))
  }
}

# Install Bioconductor packages
cat("\nInstalling Bioconductor packages...\n")
if (!require("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager")
}

bioc_packages <- c("BiocCheck")
for (pkg in bioc_packages) {
  if (!require(pkg, character.only = TRUE, quietly = TRUE)) {
    cat(sprintf("Installing %s...\n", pkg))
    BiocManager::install(pkg)
  } else {
    cat(sprintf("%s is already installed\n", pkg))
  }
}

# Create directories
directories <- c("package-status", "logs", "temp")
cat("\nCreating directories...\n")
for (dir in directories) {
  if (!dir.exists(dir)) {
    dir.create(dir, recursive = TRUE)
    cat(sprintf("Created directory: %s\n", dir))
  } else {
    cat(sprintf("Directory already exists: %s\n", dir))
  }
}

# Test basic functionality
cat("\nTesting basic functionality...\n")

# Test httr2
tryCatch({
  httr2::request("https://httpbin.org/get") |>
    httr2::req_perform() |>
    httr2::resp_status()
  cat("✓ httr2 is working\n")
}, error = function(e) {
  cat("✗ httr2 test failed:", e$message, "\n")
})

# Test yaml
tryCatch({
  test_data <- list(test = "value", number = 42)
  yaml_text <- yaml::as.yaml(test_data)
  parsed <- yaml::yaml.load(yaml_text)
  if (parsed$test == "value" && parsed$number == 42) {
    cat("✓ yaml is working\n")
  } else {
    cat("✗ yaml test failed\n")
  }
}, error = function(e) {
  cat("✗ yaml test failed:", e$message, "\n")
})

# Test BiocCheck
tryCatch({
  if (require("BiocCheck", quietly = TRUE)) {
    cat("✓ BiocCheck is available\n")
  } else {
    cat("✗ BiocCheck is not available\n")
  }
}, error = function(e) {
  cat("✗ BiocCheck test failed:", e$message, "\n")
})

cat("\n", paste(rep("=", 50), collapse=""), "\n")
cat("Setup completed!\n\n")
cat("To test the system with a single package, run:\n")
cat("Rscript scripts/test-single-package.R <package-name>\n\n")
cat("Example:\n")
cat("Rscript scripts/test-single-package.R BiocGenerics\n\n")
cat("To generate a dashboard after running checks:\n")
cat("Rscript scripts/generate-markdown-dashboard.R\n")
cat(paste(rep("=", 50), collapse=""), "\n")
