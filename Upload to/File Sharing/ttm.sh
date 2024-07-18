#!/bin/bash

# Get the file path from the context menu
FILE_PATH="$1"

# Check file size (maximum 64 MB)
FILE_SIZE=$(stat --printf="%s" "$FILE_PATH")
MAX_SIZE=$((64 * 1024 * 1024))
if [ "$FILE_SIZE" -gt "$MAX_SIZE" ]; then
    zenity --error --title="Error" --text="File size exceeds the 64 MB limit."
    exit 1
fi

# Upload the file to ttm.sh
UPLOAD_RESPONSE=$(curl -s -F "file=@$FILE_PATH" https://ttm.sh)

# Check if the upload was successful
if [ -z "$UPLOAD_RESPONSE" ]; then
    zenity --error --title="Upload Failed" --text="File upload failed. Please try again."
    exit 1
fi

# Show success message with the file URL and copy it to clipboard
zenity --info --title="Upload Complete" --text="File uploaded successfully.\nURL: $UPLOAD_RESPONSE\n(Link copied to clipboard)"
echo -n "$UPLOAD_RESPONSE" | xclip -selection clipboard
