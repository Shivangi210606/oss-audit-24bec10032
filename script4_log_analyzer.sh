#!/bin/bash
# ============================================================
# Script 4: Log File Analyzer
# Author: Shivangi Panigrahy | Reg No: 24BEC10032
# Course: Open Source Software | Chosen Software: LibreOffice
# Description: Reads a log file line by line, counts matches
#              for a keyword, and prints a summary with last
#              5 matching lines.
# Usage: ./script4_log_analyzer.sh <logfile> [keyword]
# Example: ./script4_log_analyzer.sh /var/log/syslog error
# ============================================================

# --- Accept command-line arguments ---
LOGFILE=$1                   # First argument: path to the log file
KEYWORD=${2:-"error"}        # Second argument: keyword to search (default: "error")

# --- Counter for matched lines ---
COUNT=0

# --- Maximum retry attempts if log file is empty ---
MAX_RETRIES=3
ATTEMPT=0

echo "============================================================"
echo "          LOG FILE ANALYZER                                 "
echo "============================================================"
echo "  Log File : $LOGFILE"
echo "  Keyword  : $KEYWORD"
echo "------------------------------------------------------------"

# --- Validate: check that a log file path was actually provided ---
if [ -z "$LOGFILE" ]; then
    echo "  Error: No log file specified."
    echo "  Usage: $0 <logfile> [keyword]"
    echo "  Example: $0 /var/log/syslog error"
    exit 1
fi

# --- Check if the file exists ---
if [ ! -f "$LOGFILE" ]; then
    echo "  Error: File '$LOGFILE' not found."
    echo "  Make sure the path is correct and you have read permission."
    exit 1
fi

# --- Do-while style retry loop: retry if file is empty ---
# Bash doesn't have a do-while; we simulate it with a while loop and a flag
while true; do
    ATTEMPT=$((ATTEMPT + 1))

    # Check if the file has any content (not empty)
    if [ -s "$LOGFILE" ]; then
        echo "  File validated. Starting analysis... (Attempt $ATTEMPT)"
        break   # File has content — exit the retry loop
    else
        # File exists but is empty
        echo "  Warning: '$LOGFILE' is empty. (Attempt $ATTEMPT of $MAX_RETRIES)"

        # If we've hit the retry limit, give up
        if [ "$ATTEMPT" -ge "$MAX_RETRIES" ]; then
            echo "  Max retries reached. The file appears to be empty."
            echo "  Try a different log file, e.g. /var/log/auth.log"
            exit 1
        fi

        # Wait briefly before retrying (useful if a process is writing to it)
        echo "  Waiting 2 seconds before retry..."
        sleep 2
    fi
done

echo ""
echo "  Scanning for keyword: '$KEYWORD' ..."
echo ""

# --- While-read loop: read each line of the file one at a time ---
# IFS= preserves leading whitespace; -r prevents backslash escapes
while IFS= read -r LINE; do

    # --- If-then: check if this line contains our keyword (case-insensitive) ---
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))   # Increment counter each time keyword is found
    fi

done < "$LOGFILE"    # Feed the file into the while loop via input redirection

# --- Print the summary ---
echo "------------------------------------------------------------"
echo "  ANALYSIS SUMMARY"
echo "------------------------------------------------------------"
echo "  File    : $LOGFILE"
echo "  Keyword : '$KEYWORD'"
echo "  Matches : $COUNT line(s) found"
echo ""

# --- Show the last 5 matching lines using a pipeline of grep and tail ---
if [ "$COUNT" -gt 0 ]; then
    echo "  Last 5 matching lines:"
    echo "  ..............................."
    # grep -i = case insensitive | tail -5 = last 5 results
    grep -i "$KEYWORD" "$LOGFILE" | tail -5 | while IFS= read -r MATCH_LINE; do
        echo "  > $MATCH_LINE"
    done
else
    echo "  No lines matched '$KEYWORD' in this log file."
    echo "  Try keywords like: error, warn, fail, denied, critical"
fi

echo "============================================================"
