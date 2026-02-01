#!/bin/bash

# Check if both directory arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: ./sync.sh <dirA> <dirB>"
    exit 1
fi

DIR_A=$1
DIR_B=$2

echo "--- Comparing $DIR_A and $DIR_B ---"

# 1. List files present ONLY in dirA
echo "Files only in $DIR_A:"
comm -23 <(ls "$DIR_A" | sort) <(ls "$DIR_B" | sort)

# 2. List files present ONLY in dirB
echo -e "\nFiles only in $DIR_B:"
comm -13 <(ls "$DIR_A" | sort) <(ls "$DIR_B" | sort)

# 3. Check common files for content matches
echo -e "\nChecking contents of common files:"
for file in $(comm -12 <(ls "$DIR_A" | sort) <(ls "$DIR_B" | sort)); do
    if cmp -s "$DIR_A/$file" "$DIR_B/$file"; then
        echo "[MATCH] $file: Contents are identical."
    else
        echo "[DIFFERENT] $file: Contents do not match."
    fi
done
