#!/bin/bash
# to run this function first chmod +x > ./process_webp jpeg, ./process_webp jpg, ./process_webp png
# Check if an argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <extension>"
  echo "Example: $0 jpg"
  exit 1
fi

# Set the file extension to the provided argument
extension=$1

# Convert files with the specified extension to WebP
for file in *.$extension; do
  # Check if there are files with the given extension
  if [ -e "$file" ]; then
    cwebp "$file" -o "${file%.$extension}.webp"
    echo "Converted $file to ${file%.$extension}.webp"
  else
    echo "No files found with the .$extension extension."
  fi
done
