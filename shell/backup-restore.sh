#!/bin/bash
# Automted backup and restore script for a shell environment
# This script will create a backup of specified directories and allow for restoration from those backups.
# Usage: ./backup-restore.sh [backup|restore] [directory]
# Ensure the script is run with appropriate arguments
set -e
if [ "$#" -lt 2 ]; then
    echo "Usage: $0 [backup|restore] [directory]"
    exit 1
fi
ACTION=$1
DIRECTORY=$2
BACKUP_DIR="/backups"
# Ensure the backup directory exists
mkdir -p "$BACKUP_DIR"
# Function to create a backup
backup() {
    TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
    BACKUP_FILE="$BACKUP_DIR/$(basename "$DIRECTORY")_$TIMESTAMP.tar.gz"
    echo "Creating backup of $DIRECTORY to $BACKUP_FILE..."
    tar -czf "$BACKUP_FILE" -C "$(dirname "$DIRECTORY")" "$(basename "$DIRECTORY")"
    echo "Backup created successfully."
}
# Function to restore from a backup 
backup_restore() {
    BACKUP_FILE="$BACKUP_DIR/$(basename "$DIRECTORY")_*.tar.gz"
    if [ ! -f "$BACKUP_FILE" ]; then
        echo "No backup file found for $DIRECTORY."
        exit 1
    fi
    echo "Restoring from backup $BACKUP_FILE..."
    tar -xzf "$BACKUP_FILE" -C "$(dirname "$DIRECTORY")"
    echo "Restoration completed successfully."
}
# Main logic to handle backup or restore action
if [ "$ACTION" == "backup" ]; then
    backup
elif [ "$ACTION" == "restore" ]; then
    backup_restore
else
    echo "Invalid action: $ACTION. Use 'backup' or 'restore'."
    exit 1
fi
# End of script
# Ensure the script is executable
chmod +x backup-restore.sh
# To run the script, use:
# ./backup-restore.sh backup /path/to/directory
# or
# ./backup-restore.sh restore /path/to/directory