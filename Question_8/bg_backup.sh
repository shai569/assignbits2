#!/bin/bash

# Check if a directory argument was provided
if [ -z "$1" ]; then
    echo "Usage: ./bg_backup.sh <directory_name>"
    exit 1
fi

DIR=$1
mkdir -p "$DIR/backup_folder"

echo "Starting background backup for files in $DIR..."

# Loop through files and move them to the background
for file in "$DIR"/*; do
    if [ -f "$file" ]; then
        # The '&' symbol at the end sends this specific move command to the background
        mv "$file" "$DIR/backup_folder/" & 
        echo "Moving $(basename "$file") in background (PID: $!)"
    fi
done

# Wait for all background processes to complete before finishing the script
wait
echo "Success: All files have been moved to $DIR/backup_folder/."
