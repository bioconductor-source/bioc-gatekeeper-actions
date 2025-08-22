# Bioconductor Package Gatekeeper

This repository contains a GitHub Actions-based gatekeeper system for monitoring Bioconductor packages from the R-universe and performing automated quality checks.

## Overview

The gatekeeper system:

1. **Monitors** packages from `bioconductor-source.r-universe.dev` for changes
2. **Tracks** package versions, commit hashes, and modification dates
3. **Performs** comprehensive quality checks when changes are detected
4. **Reports** results and maintains package status history

## Features

### Package Monitoring
- Fetches package information from R-universe API every 2 hours
- Compares current state with stored state to detect changes
- Triggers checks only when version or commit hash changes
- Supports force checking of all packages via manual workflow dispatch

### Quality Checks

#### 1. Merge Marker Detection
- Scans all text files for unresolved merge conflict markers
- Detects patterns: `<<<<<<<`, `=======`, `>>>>>>>`
- Prevents packages with merge conflicts from passing

#### 2. Large File Detection
- Identifies files larger than 5MB (configurable)
- Helps maintain repository size limits
- Reports file sizes for review

#### 3. DESCRIPTION Dependency Analysis
- Checks for non-standard dependencies (remote::, github::)
- Ensures only CRAN and Bioconductor dependencies are used
- Validates dependency declarations

#### 4. Version Number Validation
- Verifies proper semantic versioning format
- Validates Bioconductor version policy compliance
- Checks for appropriate version bumps

#### 5. BiocCheck Integration
- Runs official Bioconductor package checker
- Reports warnings (non-blocking) and errors (blocking)
- Provides detailed feedback on package quality

## Repository Structure

```
.github/
  workflows/
    gatekeeper.yml          # Main workflow file
scripts/
  monitor-packages.R        # Package monitoring logic
  check-packages.R          # Quality checking logic
  update-status.R           # Status management
package-status/             # Individual package status files
  {package-name}.yaml       # Status for each package
  summary.yaml              # Overall summary
logs/                       # Detailed logs and reports
  monitor-{date}.log        # Monitoring logs
  check-{date}.log          # Checking logs
  update-{date}.log         # Update logs
  summary-{date}.yaml       # Daily summaries
```

## Package Status Files

Each package has a YAML status file with the following structure:

```yaml
package: "PackageName"
version: "1.2.3"
commit_hash: "abc123..."
last_check: "2025-01-01 12:00:00 UTC"
last_successful_check: "2025-01-01 12:00:00 UTC"
status: "passed" | "failed" | "pending_check" | "never_checked"
issues:
  - "Large file found: data/big_file.csv (8.5 MB)"
  - "Merge marker found in R/analysis.R"
bioccheck_warnings:
  - "Consider using BiocStyle for vignettes"
last_check_details:
  timestamp: "2025-01-01 12:00:00 UTC"
  status: "passed"
  checks:
    merge_markers:
      passed: true
      issues: []
    large_files:
      passed: false
      issues: ["data/big_file.csv (8.5 MB)"]
    # ... other check results
```

## Workflow Triggers

### Automatic (Scheduled)
- Runs every 2 hours: `0 */2 * * *`
- Only checks packages that have changed

### Manual (Workflow Dispatch)
- Supports force checking all packages
- Useful for testing or after system updates

## Configuration

### Environment Variables
- `FORCE_CHECK`: Set to "true" to check all packages regardless of changes
- `GITHUB_TOKEN`: Automatically provided by GitHub Actions

### Customizable Parameters
- Maximum file size threshold (default: 5MB)
- Check frequency (default: every 2 hours)
- BiocCheck options

## Usage

### Viewing Results

1. **Package Status**: Check individual files in `package-status/`
2. **Summary**: View `package-status/summary.yaml` for overview
3. **Detailed Logs**: Check files in `logs/` directory
4. **GitHub Actions**: View workflow runs for real-time status

### Manual Execution

To force check all packages:
1. Go to Actions tab in GitHub
2. Select "Bioconductor Package Gatekeeper" workflow
3. Click "Run workflow"
4. Check "Force check all packages"
5. Click "Run workflow"

### Local Development

To run scripts locally:

```bash
# Install dependencies
Rscript -e "install.packages(c('httr2', 'yaml', 'jsonlite', 'BiocManager', 'remotes'))"
Rscript -e "BiocManager::install('BiocCheck')"

# Run monitoring
Rscript scripts/monitor-packages.R

# Run checks (if packages found)
Rscript scripts/check-packages.R "package1,package2"

# Update status
Rscript scripts/update-status.R
```

## Interpreting Results

### Status Values
- **passed**: All checks passed
- **failed**: One or more blocking checks failed
- **pending_check**: Changes detected, check in progress
- **never_checked**: Package not yet processed

### Check Types
- **Blocking**: Merge markers, large files, invalid dependencies, version issues, BiocCheck errors
- **Warning**: BiocCheck warnings (reported but don't block)

### Issue Resolution
When issues are found:
1. Review the specific issues in the package status file
2. Check detailed logs for more context
3. Contact package maintainers if needed
4. Re-run checks after fixes are applied

## Monitoring and Alerts

The system provides several ways to monitor status:
- GitHub Actions workflow status
- Daily summary reports in logs
- Package-specific status files
- Overall summary dashboard

## Contributing

To modify the gatekeeper system:
1. Edit the appropriate R scripts in `scripts/`
2. Update workflow configuration in `.github/workflows/gatekeeper.yml`
3. Test changes with manual workflow runs
4. Monitor logs for any issues

## License

This project follows the same license as the main Bioconductor project.
