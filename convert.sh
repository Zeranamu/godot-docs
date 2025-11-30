#!/bin/bash
TMP_DIR=$(mktemp -d)
find . -name "*.rst" -print0 | while IFS= read -r -d $'\0' file; do
  # Create the output directory structure
  mkdir -p "$TMP_DIR/$(dirname "$file")"
  # Convert the file
  pandoc "$file" -o "$TMP_DIR/${file%.rst}.md"
done
zip -r notebooklm_docs.zip "$TMP_DIR"
rm -rf "$TMP_DIR"
