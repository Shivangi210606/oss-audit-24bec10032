#!/bin/bash
# ============================================================
# Script 5: The Open Source Manifesto Generator
# Author: Shivangi Panigrahy | Reg No: 24BEC10032
# Course: Open Source Software | Chosen Software: LibreOffice
# Description: Asks the user three questions interactively
#              and composes a personalised open source
#              philosophy statement, saved to a .txt file.
# ============================================================

# --- Alias concept demonstrated via comment and function ---
# In an interactive shell, you could define: alias today='date +%d\ %B\ %Y'
# Here we use a function to achieve the same reusable shorthand:
get_today() {
    date '+%d %B %Y'   # Returns formatted date, e.g. 15 October 2025
}

# --- Output filename: personalised with current username ---
OUTPUT="manifesto_$(whoami).txt"

# --- Display header ---
echo "============================================================"
echo "     THE OPEN SOURCE MANIFESTO GENERATOR                   "
echo "============================================================"
echo ""
echo "  This script will generate your personal open source"
echo "  philosophy statement based on your answers."
echo "  The manifesto will be saved to: $OUTPUT"
echo ""
echo "------------------------------------------------------------"
echo "  Please answer the following three questions:"
echo "------------------------------------------------------------"
echo ""

# --- Read user input interactively using 'read' ---
# -p flag displays the prompt inline before waiting for input

read -p "  1. Name one open-source tool you use every day: " TOOL
echo ""

read -p "  2. In one word, what does 'freedom' mean to you? " FREEDOM
echo ""

read -p "  3. Name one thing you would build and share freely: " BUILD
echo ""

# --- Get the current date using our alias-style function ---
DATE=$(get_today)

# --- Get the username for personalising the manifesto ---
AUTHOR=$(whoami)

# --- Compose the manifesto using string concatenation ---
# We build it in a variable first, then write it to file with >

echo "------------------------------------------------------------"
echo "  Generating your manifesto..."
echo "------------------------------------------------------------"
echo ""

# --- Write the manifesto to the output file using > (overwrite) ---
# Each echo >> appends a new line to the file
# First echo uses > to create/overwrite the file cleanly

echo "============================================================" > "$OUTPUT"
echo "             MY OPEN SOURCE MANIFESTO                       " >> "$OUTPUT"
echo "============================================================" >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "  Author  : $AUTHOR" >> "$OUTPUT"
echo "  Date    : $DATE" >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "------------------------------------------------------------" >> "$OUTPUT"
echo "" >> "$OUTPUT"

# --- The main manifesto paragraph, composed from user's answers ---
# String concatenation happens naturally in bash when variables sit in strings

PARA1="I believe that software should be free — not as in free beer,"
PARA2="but free as in $FREEDOM. Every day, I rely on $TOOL, a tool"
PARA3="built by people who chose to share their work with the world"
PARA4="rather than lock it away. That choice made me better at what I do."

PARA5="Open source is not just a licensing model. It is a philosophy"
PARA6="that says knowledge grows when it is shared. The developers who"
PARA7="built Linux, LibreOffice, Python, and Git did not hoard their"
PARA8="work — they gave it away, and the world built on top of it."

PARA9="I commit to continuing that tradition. I will build $BUILD and"
PARA10="share it freely, because I understand that I am standing on the"
PARA11="shoulders of every developer who shared their code before me."
PARA12="Open source is how civilisation builds software together."

# Write each paragraph line to the file
echo "  $PARA1" >> "$OUTPUT"
echo "  $PARA2" >> "$OUTPUT"
echo "  $PARA3" >> "$OUTPUT"
echo "  $PARA4" >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "  $PARA5" >> "$OUTPUT"
echo "  $PARA6" >> "$OUTPUT"
echo "  $PARA7" >> "$OUTPUT"
echo "  $PARA8" >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "  $PARA9" >> "$OUTPUT"
echo "  $PARA10" >> "$OUTPUT"
echo "  $PARA11" >> "$OUTPUT"
echo "  $PARA12" >> "$OUTPUT"

echo "" >> "$OUTPUT"
echo "------------------------------------------------------------" >> "$OUTPUT"
echo "  Signed: $AUTHOR | $DATE" >> "$OUTPUT"
echo "============================================================" >> "$OUTPUT"

# --- Confirm save and display the result ---
echo "  Manifesto saved to: $OUTPUT"
echo ""
echo "============================================================"
echo "  YOUR MANIFESTO:"
echo "============================================================"
echo ""

# --- cat reads and prints the saved file to screen ---
cat "$OUTPUT"
