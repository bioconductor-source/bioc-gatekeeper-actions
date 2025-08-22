# Bioconductor Gatekeeper System - Implementation

## Overview

GitHub Actions-based gatekeeper system for monitoring Bioconductor packages from R-universe and performing quality checks.

## Quality Checks

### Merge Marker Detection
- Scans text files for unresolved merge conflict markers
- Blocks packages containing `<<<<<<<`, `=======`, `>>>>>>>` patterns

### Large File Detection  
- Identifies files larger than configured limit (default: 5MB)
- Reports specific files and sizes

### Dependency Validation
- Checks DESCRIPTION for non-standard dependencies
- Blocks packages using `remote::`, `github::`, `gitlab::`, etc.
- Ensures only CRAN and Bioconductor dependencies

### Version Number Validation
- Validates semantic versioning format (x.y.z minimum)
- Enforces Bioconductor release/devel cycle compliance
- Uses configurable Bioconductor version for even/odd minor version checking

### BiocCheck Integration
- Runs official Bioconductor package checker
- **Non-blocking**: Reports issues but does not fail packages
- Records warnings and errors separately

## Configuration

### Bioconductor Version Settings
Configure in `config.yaml`:
```yaml
bioconductor:
  version: "3.21"
  cycle: "devel" 
  expected_minor_parity: "odd"  # even for release, odd for devel
```

### Check Settings
```yaml
checks:
  max_file_size_mb: 5
  bioccheck:
    enabled: true
    blocking: false  # BiocCheck never blocks packages
```

### Deployment Settings
```yaml
deployment:
  rclone:
    enabled: true
    bucket: "bioc-production"
    remote: "production"
```

## Workflow Process

1. **Monitor** - Check R-universe API for package changes
2. **Download** - Fetch and extract changed packages  
3. **Check** - Run quality checks (blocking: merge markers, large files, dependencies, versions)
4. **BiocCheck** - Run BiocCheck (non-blocking, informational only)
5. **Deploy** - Use rclone to copy passing packages to production bucket
6. **Report** - Generate markdown dashboard and update status

## Status Tracking

Package status format:
```yaml
package: "PackageName"
status: "passed|failed|pending_check"
checks:
  merge_markers: {passed: true|false, issues: [...]}
  large_files: {passed: true|false, issues: [...]}
  dependencies: {passed: true|false, issues: [...]}
  version: {passed: true|false, issues: [...]}
  bioccheck: {passed: true, warnings: [...], errors: [...]}
```

## Deployment

### Requirements
- rclone configured with production credentials
- GitHub repository secrets for rclone configuration

### rclone Environment Variables
```
RCLONE_CONFIG_PRODUCTION_TYPE
RCLONE_CONFIG_PRODUCTION_ACCESS_KEY_ID  
RCLONE_CONFIG_PRODUCTION_SECRET_ACCESS_KEY
RCLONE_CONFIG_PRODUCTION_ENDPOINT
RCLONE_CONFIG_PRODUCTION_REGION
```

## File Structure

```
.github/workflows/gatekeeper.yml           # GitHub Actions workflow
scripts/
  ├── monitor-packages.R                   # R-universe monitoring
  ├── check-packages.R                     # Quality checking
  ├── update-status.R                      # Status management  
  ├── generate-markdown-dashboard.R        # Dashboard generation
  ├── deploy-packages.R                    # rclone deployment
  └── test-single-package.R               # Local testing
config.yaml                               # System configuration
package-status/                           # Package status files
logs/                                     # Execution logs
```

## Dashboard

- `gatekeeper-dashboard.md` - Markdown report focusing on failures
- `status.txt` - Single-line status summary
- Failed packages highlighted with specific blocking issues
- BiocCheck warnings reported separately

## Local Testing

```bash
# Test single package
Rscript scripts/test-single-package.R BiocGenerics

# Generate dashboard  
Rscript scripts/generate-markdown-dashboard.R
```

## Key Features

- Only checks packages when version/commit hash changes
- BiocCheck runs but never blocks package deployment
- Configurable Bioconductor version for policy compliance
- Automatic deployment of passing packages via rclone
- Comprehensive logging and status tracking
