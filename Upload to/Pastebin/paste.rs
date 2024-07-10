#!/bin/bash

# Function to upload file to paste.rs
upload_file() {
    FILE_PATH="$1"

    # Upload the file
    RESPONSE=$(curl -s --data-binary "@${FILE_PATH}" https://paste.rs/)

    # Check if the upload was successful
    if [[ "$RESPONSE" == http* ]]; then
        # Display the result and copy to clipboard
        echo "$RESPONSE" | xclip -selection clipboard
        zenity --info --title="Upload Complete" --text="File uploaded successfully.\nLink: $RESPONSE\n(Link copied to clipboard)"
    else
        zenity --error --title="Error" --text="Failed to upload the file."
        exit 1
    fi
}

# Main script
for FILE in "$@"; do
    upload_file "$FILE"
done
