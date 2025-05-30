#!/bin/bash
# This script manages log files by compressing them and removing old logs.
# Usage: ./log-management.sh [directory] [days_to_keep]
# Example: ./log-management.sh /var/log/myapp 30
set -e
# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 [directory] [days_to_keep]"
    exit 1
fi
# Assign arguments to variables
LOG_DIR="$1"
DAYS_TO_KEEP="$2"
# Check if the directory exists
if [ ! -d "$LOG_DIR" ]; then
    echo "Directory $LOG_DIR does not exist."
    exit 1
fi
# Compress log files older than the specified number of days
find "$LOG_DIR" -type f -name "*.log" -mtime +$DAYS_TO_KEEP -exec gzip {} \;
# Remove compressed log files older than the specified number of days
find "$LOG_DIR" -type f -name "*.log.gz" -mtime +$DAYS_TO_KEEP -exec rm {} \;
# Print a message indicating completion
echo "Log management completed for $LOG_DIR. Compressed logs older than $DAYS_TO_KEEP days and removed old compressed logs."
# Exit the script successfully
exit 0
# End of script
# This script is designed to manage log files by compressing them and removing old logs.
# It takes two arguments: the directory containing the logs and the number of days to keep logs.
# It uses the `find` command to locate log files, compress them with `gzip`, and remove old compressed logs.
# Ensure that the script has execute permissions before running it.
# You can set execute permissions with: chmod +x log-management.sh
# This script is useful for maintaining log files in a manageable state, especially in production environments.
# It helps in saving disk space by compressing old logs and removing logs that are no longer needed.