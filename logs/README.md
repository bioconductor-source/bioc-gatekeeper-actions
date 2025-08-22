# Logs Directory

This directory contains detailed logs and reports from the gatekeeper system.

## Log Files

- `monitor-{date}.log` - Package monitoring activity
- `check-{date}.log` - Quality check execution logs  
- `update-{date}.log` - Status update logs
- `summary-{date}.yaml` - Daily summary reports
- `check-results-{date}.yaml` - Detailed check results

## Log Retention

Logs are retained for 30 days by default. Older logs are automatically cleaned up to prevent storage issues.

## Viewing Logs

Logs are in plain text format and can be viewed with any text editor. YAML files can be processed programmatically for analysis and reporting.
