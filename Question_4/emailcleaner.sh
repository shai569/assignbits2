#!/bin/bash

# Define the source file
INPUT="emails.txt"

# 1. Extraction of Valid Emails
# We use grep with Extended Regex (-E) to match the format
# Redirection (>) sends the output to valid.txt
grep -iE '^[a-z0-9]+@[a-z]+\.com$' "$INPUT" | sort | uniq > valid.txt

# 2. Extraction of Invalid Emails
# The -v flag inverts the match to find anything that DOES NOT fit the pattern
grep -ivE '^[a-z0-9]+@[a-z]+\.com$' "$INPUT" > invalid.txt

echo "Cleanup complete. Check valid.txt and invalid.txt."
