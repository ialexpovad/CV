#!/bin/bash

# Enable verbose mode
set -x

# Set variables for the options
CSS_PATH="assets/styles.css"
PAPER_BORDER="0.4in"
MARKDOWN_FILE="README.md"

# Get current date and time
CURRENT_DATETIME=$(date +"%Y%m%d_%H%M%S")

# Set output path with current date and time
OUTPUT_PATH="out/CV_ALIKSANDR_POVAD_$CURRENT_DATETIME.pdf"

# Ensure markdown-pdf is available
if ! command -v markdown-pdf &> /dev/null; then
    echo "markdown-pdf could not be found. Please install it with 'npm install -g markdown-pdf'."
    exit 1
fi

# Create the output directory if it doesn't exist
mkdir -p out

# Run the markdown-pdf command with options
markdown-pdf --css-path "$CSS_PATH" --paper-border "$PAPER_BORDER" --out "$OUTPUT_PATH" "$MARKDOWN_FILE"
