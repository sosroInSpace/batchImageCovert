#!/bin/bash
# Check if an argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <extension>"
  echo "Example: $0 jpg"
  exit 1
fi

# Set the file extension to the provided argument
extension=$1

# Flag to check if any files were processed
files_processed=false

# Convert files with the specified extension to WebP
for file in *.$extension; do
  # Check if there are files with the given extension
  if [ -e "$file" ]; then
    # Convert the file to WebP
    cwebp "$file" -o "${file%.$extension}.webp"
    echo "Converted $file to ${file%.$extension}.webp"
    
    # Mark that we have processed files
    files_processed=true
  fi
done

# If files were processed, delete the original files
if $files_processed; then
  echo "Deleting all .$extension files..."
  rm *.$extension
  echo "All .$extension files have been deleted."
else
  echo "No files found with the .$extension extension."
fi
