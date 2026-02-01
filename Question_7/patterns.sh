#!/bin/bash

# Check if input file is provided
if [ -z "$1" ]; then
    echo "Usage: ./patterns.sh <input_file>"
    exit 1
fi

INPUT_FILE=$1

# 1. Words containing ONLY vowels
grep -iE '^[aeiou]+$' "$INPUT_FILE" > vowels.txt

# 2. Words containing ONLY consonants
grep -vE '[aeiou]' "$INPUT_FILE" > consonants.txt

# 3. Words with both, but starting with a consonant
# We ignore words already caught by the "consonants only" rule
grep -iE '^[^aeiou].*[aeiou]' "$INPUT_FILE" > mixed.txt

echo "Processing complete. Results saved in vowels.txt, consonants.txt, and mixed.txt."
