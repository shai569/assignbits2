#!/bin/bash

# 1. The script must accept the log file name as a command-line argument
LOGFILE=$1

# 2. Validate that the file exists and is readable
if [[ ! -f "$LOGFILE" ]]; then
    echo "Error: File '$LOGFILE' does not exist."
    exit 1
fi

# 3. Count and display log entries
TOTAL=$(wc -l < "$LOGFILE")
INFO_COUNT=$(grep -c "INFO" "$LOGFILE")
WARN_COUNT=$(grep -c "WARNING" "$LOGFILE")
ERR_COUNT=$(grep -c "ERROR" "$LOGFILE")

echo "Total number of log entries: $TOTAL"
echo "Number of INFO messages: $INFO_COUNT"
echo "Number of WARNING messages: $WARN_COUNT"
echo "Number of ERROR messages: $ERR_COUNT"

# 4. Display the most recent ERROR message
RECENT_ERR=$(grep "ERROR" "$LOGFILE" | tail -1)
echo "Most recent ERROR message: $RECENT_ERR"

# 5. Generate a report file named logsummary_<date>.txt
REPORT_FILE="logsummary_$(date +%Y-%m-%d).txt"
{
    echo "Log Summary Report - Generated on $(date)"
    echo "Total Entries: $TOTAL"
    echo "INFO: $INFO_COUNT, WARNING: $WARN_COUNT, ERROR: $ERR_COUNT"
} > "$REPORT_FILE"

echo "Report generated: $REPORT_FILE"
