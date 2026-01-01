#!/usr/bin/env bash

SCRIPT_NAME=$(basename "$0")
ORGANIZE_DIR="./"

mkdir -p "$ORGANIZE_DIR"

for file in ./*; do
  # # Skip if not a file or if it's the script itself
  # if [ ! -f "$file" ] || [ "$(basename "$file")" = "$SCRIPT_NAME" ]; then
  if [ ! -f "$file" ] ; then
    continue
  fi

  # Extract date from file modification time
  date=$(stat -c %y "$file" | cut -d' ' -f1)
  
  # Create directory and move file
  mkdir -p "$ORGANIZE_DIR/$date"
  mv "$file" "$ORGANIZE_DIR/$date/"
done

