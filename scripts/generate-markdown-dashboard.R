#!/usr/bin/env Rscript

# generate-markdown-dashboard.R
# Generates a markdown dashboard focused on failures and issues

library(yaml)

log_message <- function(message, level = "INFO") {
  timestamp <- format(Sys.time(), "%Y-%m-%d %H:%M:%S UTC", tz = "UTC")
  cat(sprintf("[%s] %s: %s\n", timestamp, level, message))
}

# Generate markdown dashboard
generate_markdown_dashboard <- function() {
  log_message("Generating markdown dashboard...")
  
  # Load summary
  summary_file <- file.path("package-status", "summary.yaml")
  if (!file.exists(summary_file)) {
    cat("No summary file found. Run the gatekeeper first.\n")
    return()
  }
  
  summary <- yaml::read_yaml(summary_file)
  
  # Start markdown
  md <- paste0("# Bioconductor Gatekeeper Dashboard\n\n")
  md <- paste0(md, sprintf("**Last Updated:** %s\n\n", summary$timestamp))
  
  # Quick stats
  md <- paste0(md, "## 📊 Quick Statistics\n\n")
  md <- paste0(md, sprintf("- **Total Packages:** %d\n", summary$total_packages))
  md <- paste0(md, sprintf("- **✅ Passed:** %d\n", summary$status_counts$passed))
  md <- paste0(md, sprintf("- **❌ Failed:** %d\n", summary$status_counts$failed))
  md <- paste0(md, sprintf("- **⏳ Pending:** %d\n", summary$status_counts$pending_check))
  md <- paste0(md, sprintf("- **❓ Never Checked:** %d\n\n", summary$status_counts$never_checked))
  
  # Alert section for failures
  failed_packages <- names(summary$packages)[sapply(names(summary$packages), function(x) {
    summary$packages[[x]]$status == "failed"
  })]
  
  if (length(failed_packages) > 0) {
    md <- paste0(md, "## 🚨 URGENT: Failed Packages\n\n")
    md <- paste0(md, sprintf("**%d packages are currently failing checks:**\n\n", length(failed_packages)))
    
    # Create quick failure table
    md <- paste0(md, "| Package | Version | Last Check | Issues | Warnings |\n")
    md <- paste0(md, "|---------|---------|------------|--------|----------|\n")
    
    for (pkg_name in failed_packages) {
      pkg <- summary$packages[[pkg_name]]
      issues_icon <- if (!is.null(pkg$has_issues) && pkg$has_issues) "🔴" else "✅"
      warnings_icon <- if (!is.null(pkg$has_bioccheck_warnings) && pkg$has_bioccheck_warnings) "⚠️" else "✅"
      
      md <- paste0(md, sprintf("| **%s** | %s | %s | %s | %s |\n",
                              pkg_name,
                              pkg$version %||% "Unknown",
                              pkg$last_check %||% "Never",
                              issues_icon,
                              warnings_icon))
    }
    md <- paste0(md, "\n")
    
    # Detailed failure information
    md <- paste0(md, "### 📋 Detailed Failure Information\n\n")
    
    for (pkg_name in failed_packages) {
      # Load detailed package status
      status_file <- file.path("package-status", paste0(pkg_name, ".yaml"))
      if (file.exists(status_file)) {
        pkg_status <- yaml::read_yaml(status_file)
        
        md <- paste0(md, sprintf("#### %s\n\n", pkg_name))
        md <- paste0(md, sprintf("- **Version:** %s\n", pkg_status$version %||% "Unknown"))
        md <- paste0(md, sprintf("- **Status:** %s\n", pkg_status$status %||% "Unknown"))
        md <- paste0(md, sprintf("- **Last Check:** %s\n", pkg_status$last_check %||% "Never"))
        
        # Show issues if present
        if (!is.null(pkg_status$issues) && length(pkg_status$issues) > 0) {
          md <- paste0(md, "- **Issues:**\n")
          for (issue in pkg_status$issues) {
            md <- paste0(md, sprintf("  - %s\n", issue))
          }
        }
        
        # Show BiocCheck warnings if present
        if (!is.null(pkg_status$bioccheck_warnings) && length(pkg_status$bioccheck_warnings) > 0) {
          md <- paste0(md, "- **BiocCheck Warnings:**\n")
          for (warning in pkg_status$bioccheck_warnings) {
            md <- paste0(md, sprintf("  - %s\n", warning))
          }
        }
        
        # Show detailed check results if available
        if (!is.null(pkg_status$last_check_details) && !is.null(pkg_status$last_check_details$checks)) {
          checks <- pkg_status$last_check_details$checks
          failed_checks <- names(checks)[sapply(names(checks), function(x) {
            !is.null(checks[[x]]$passed) && !checks[[x]]$passed
          })]
          
          if (length(failed_checks) > 0) {
            md <- paste0(md, "- **Failed Checks:**\n")
            for (check_name in failed_checks) {
              check_info <- checks[[check_name]]
              md <- paste0(md, sprintf("  - **%s:** ", check_name))
              if (!is.null(check_info$issues) && length(check_info$issues) > 0) {
                md <- paste0(md, sprintf("%d issues\n", length(check_info$issues)))
                for (issue in check_info$issues[1:min(3, length(check_info$issues))]) {  # Show first 3 issues
                  md <- paste0(md, sprintf("    - %s\n", issue))
                }
                if (length(check_info$issues) > 3) {
                  md <- paste0(md, sprintf("    - ... and %d more issues\n", length(check_info$issues) - 3))
                }
              } else {
                md <- paste0(md, "Failed\n")
              }
            }
          }
        }
        
        md <- paste0(md, "\n")
      }
    }
  } else {
    md <- paste0(md, "## ✅ No Failed Packages\n\n")
    md <- paste0(md, "All packages are currently passing checks or pending review.\n\n")
  }
  
  # Packages with warnings
  warning_packages <- names(summary$packages)[sapply(names(summary$packages), function(x) {
    !is.null(summary$packages[[x]]$has_bioccheck_warnings) && summary$packages[[x]]$has_bioccheck_warnings
  })]
  
  if (length(warning_packages) > 0) {
    md <- paste0(md, "## ⚠️ Packages with BiocCheck Warnings\n\n")
    md <- paste0(md, sprintf("**%d packages have BiocCheck warnings (non-blocking):**\n\n", length(warning_packages)))
    
    for (pkg_name in warning_packages) {
      pkg <- summary$packages[[pkg_name]]
      md <- paste0(md, sprintf("- **%s** (v%s) - Last checked: %s\n",
                              pkg_name,
                              pkg$version %||% "Unknown",
                              pkg$last_check %||% "Never"))
    }
    md <- paste0(md, "\n")
  }
  
  # Status breakdown
  md <- paste0(md, "## 📈 Status Breakdown\n\n")
  
  # All packages table
  md <- paste0(md, "### All Packages Status\n\n")
  md <- paste0(md, "| Package | Version | Status | Last Check | Last Success | Issues | Warnings |\n")
  md <- paste0(md, "|---------|---------|--------|------------|--------------|--------|----------|\n")
  
  # Sort packages: failed first, then pending, then passed
  all_packages <- summary$packages
  package_names <- names(all_packages)
  
  status_order <- c("failed", "pending_check", "never_checked", "passed")
  sorted_names <- character(0)
  
  for (status in status_order) {
    status_packages <- package_names[sapply(package_names, function(x) all_packages[[x]]$status == status)]
    sorted_names <- c(sorted_names, sort(status_packages))
  }
  
  for (pkg_name in sorted_names) {
    pkg <- all_packages[[pkg_name]]
    
    # Status icon
    status_icon <- switch(pkg$status %||% "never_checked",
                         "passed" = "✅",
                         "failed" = "❌",
                         "pending_check" = "⏳",
                         "❓")
    
    issues_icon <- if (!is.null(pkg$has_issues) && pkg$has_issues) "🔴" else "✅"
    warnings_icon <- if (!is.null(pkg$has_bioccheck_warnings) && pkg$has_bioccheck_warnings) "⚠️" else "✅"
    
    md <- paste0(md, sprintf("| %s | %s | %s %s | %s | %s | %s | %s |\n",
                            pkg_name,
                            pkg$version %||% "Unknown",
                            status_icon,
                            pkg$status %||% "never_checked",
                            pkg$last_check %||% "Never",
                            pkg$last_successful_check %||% "Never",
                            issues_icon,
                            warnings_icon))
  }
  
  md <- paste0(md, "\n")
  
  # Action items
  md <- paste0(md, "## 🎯 Action Items\n\n")
  
  if (length(failed_packages) > 0) {
    md <- paste0(md, "### High Priority\n")
    md <- paste0(md, sprintf("1. **Fix %d failed packages** - These are blocking issues that need immediate attention\n", length(failed_packages)))
    
    # Group failures by type
    merge_issues <- 0
    large_file_issues <- 0
    dep_issues <- 0
    version_issues <- 0
    bioccheck_errors <- 0
    
    for (pkg_name in failed_packages) {
      status_file <- file.path("package-status", paste0(pkg_name, ".yaml"))
      if (file.exists(status_file)) {
        pkg_status <- yaml::read_yaml(status_file)
        if (!is.null(pkg_status$issues)) {
          for (issue in pkg_status$issues) {
            if (grepl("merge marker|merge conflict", issue, ignore.case = TRUE)) {
              merge_issues <- merge_issues + 1
            } else if (grepl("large file", issue, ignore.case = TRUE)) {
              large_file_issues <- large_file_issues + 1
            } else if (grepl("dependency|remote::", issue, ignore.case = TRUE)) {
              dep_issues <- dep_issues + 1
            } else if (grepl("version", issue, ignore.case = TRUE)) {
              version_issues <- version_issues + 1
            } else if (grepl("bioccheck|check", issue, ignore.case = TRUE)) {
              bioccheck_errors <- bioccheck_errors + 1
            }
          }
        }
      }
    }
    
    if (merge_issues > 0) {
      md <- paste0(md, sprintf("   - **%d packages** with merge conflicts\n", merge_issues))
    }
    if (large_file_issues > 0) {
      md <- paste0(md, sprintf("   - **%d packages** with large files (>5MB)\n", large_file_issues))
    }
    if (dep_issues > 0) {
      md <- paste0(md, sprintf("   - **%d packages** with dependency issues\n", dep_issues))
    }
    if (version_issues > 0) {
      md <- paste0(md, sprintf("   - **%d packages** with version number issues\n", version_issues))
    }
    if (bioccheck_errors > 0) {
      md <- paste0(md, sprintf("   - **%d packages** with BiocCheck errors\n", bioccheck_errors))
    }
    
    md <- paste0(md, "\n")
  }
  
  if (length(warning_packages) > 0) {
    md <- paste0(md, "### Medium Priority\n")
    md <- paste0(md, sprintf("2. **Review %d packages with warnings** - These should be addressed when possible\n\n", length(warning_packages)))
  }
  
  pending_packages <- summary$status_counts$pending_check
  if (pending_packages > 0) {
    md <- paste0(md, "### Monitoring\n")
    md <- paste0(md, sprintf("3. **Monitor %d pending packages** - These will be checked automatically\n\n", pending_packages))
  }
  
  # Footer
  md <- paste0(md, "---\n\n")
  md <- paste0(md, "*Generated by Bioconductor Gatekeeper System*  \n")
  md <- paste0(md, sprintf("*Report generated: %s*  \n", format(Sys.time(), "%Y-%m-%d %H:%M:%S UTC", tz = "UTC")))
  md <- paste0(md, "*For detailed logs, check the `logs/` directory*\n")
  
  # Write markdown file
  dashboard_file <- "gatekeeper-dashboard.md"
  writeLines(md, dashboard_file)
  
  log_message(sprintf("Markdown dashboard generated: %s", dashboard_file))
  
  # Also generate a simple status summary
  status_summary <- sprintf("Status: %d failed, %d pending, %d passed (%s)",
                           summary$status_counts$failed,
                           summary$status_counts$pending_check, 
                           summary$status_counts$passed,
                           format(Sys.time(), "%Y-%m-%d %H:%M UTC", tz = "UTC"))
  
  writeLines(status_summary, "status.txt")
  log_message("Status summary written to status.txt")
}

# Helper function for null coalescing
`%||%` <- function(x, y) if (is.null(x)) y else x

# Run if called directly
if (!interactive()) {
  generate_markdown_dashboard()
}
