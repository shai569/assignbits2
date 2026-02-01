#!/bin/bash

FILE="marks.txt"

# Check if input file exists
if [ ! -f "$FILE" ]; then
    echo "Error: $FILE not found!"
    exit 1
fi

# Initialize counters
failed_one_count=0
passed_all_count=0

echo "--- Processing Student Results ---"

# Read file line by line
while IFS=',' read -r roll name m1 m2 m3 || [ -n "$roll" ]; do
    # Skip header if it exists (checks if RollNo is numeric)
    [[ ! $roll =~ ^[0-9]+$ ]] && continue

    fail_count=0
    
    # Check each mark against passing score of 33
    ((m1 < 33)) && ((fail_count++))
    ((m2 < 33)) && ((fail_count++))
    ((m3 < 33)) && ((fail_count++))

    # Category 1: Passed in ALL subjects
    if ((fail_count == 0)); then
        echo "PASSED ALL: $name (Roll: $roll)"
        ((passed_all_count++))
    
    # Category 2: Failed in exactly ONE subject
    elif ((fail_count == 1)); then
        echo "FAILED ONE: $name (Roll: $roll)"
        ((failed_one_count++))
    fi

done < "$FILE"

# Print final category counts
echo -e "\n--- Summary Report ---"
echo "Students who passed all subjects: $passed_all_count"
echo "Students who failed exactly one subject: $failed_one_count"
