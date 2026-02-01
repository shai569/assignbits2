#!/bin/bash

# Check if exactly one argument is provided
if [ "$#" -ne 1 ]; then
    echo "Error: Please provide exactly one argument."
    exit 1
fi

ITEM=$1

# Check if it is a file
if [ -f "$ITEM" ]; then
    echo "Analyzing file: $ITEM"
    wc "$ITEM" # Displays lines, words, and characters
# Check if it is a directory
elif [ -d "$ITEM" ]; then
    echo "Analyzing directory: $ITEM"
    TOTAL_FILES=$(ls -1 "$ITEM" | wc -l)
    TXT_FILES=$(ls -1 "$ITEM"/*.txt 2>/dev/null | wc -l)
    echo "Total files: $TOTAL_FILES"
    echo "Number of .txt files: $TXT_FILES"
else
    echo "Error: Path does not exist or is invalid."
    exit 1
fi
