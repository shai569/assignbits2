#!/bin/bash

# Check if input.txt exists
FILE="input.txt"
if [ ! -f "$FILE" ]; then
    echo "Error: $FILE not found!"
    exit 1
fi

# Use tr to ensure one word per line, remove punctuation, and convert to lowercase
# This makes it easier to analyze word by word
WORDS=$(tr -sc '[:alpha:]' '[\n*]' < "$FILE" | tr '[:upper:]' '[:lower:]' | sed '/^$/d')

# 1. Total number of unique words
UNIQUE_COUNT=$(echo "$WORDS" | sort | uniq | wc -l)

# 2. Longest word
LONGEST=$(echo "$WORDS" | awk '{ if (length($0) > max) {max = length($0); word = $0} } END { print word }')

# 3. Shortest word
SHORTEST=$(echo "$WORDS" | awk '{ if (min == "" || length($0) < min) {min = length($0); word = $0} } END { print word }')

# 4. Average word length
AVG_LENGTH=$(echo "$WORDS" | awk '{ sum += length($0); count++ } END { if (count > 0) print sum / count; else print 0 }')

# Display results
echo "--- Word Metrics for $FILE ---"
echo "Longest word: $LONGEST"
echo "Shortest word: $SHORTEST"
echo "Average word length: $AVG_LENGTH"
echo "Total unique words: $UNIQUE_COUNT"
