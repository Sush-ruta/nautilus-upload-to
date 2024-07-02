#!/bin/bash

# Function to upload file to Temp.sh
upload_file() {
    FILE_PATH="$1"
    MAX_SIZE=$((4 * 1024 * 1024 * 1024))  # 4GB limit

    # Check if file size is greater than 4GB
    if [ $(stat -c%s "$FILE_PATH") -gt "$MAX_SIZE" ]; then
        zenity --error --title="Error" --text="Only files less than 4GB are allowed."
        exit 1
    fi

    # Upload the file
    RESPONSE=$(curl -s -F "file=@$FILE_PATH" "https://temp.sh/upload")

    # Check if response contains error
    if [ -z "$RESPONSE" ]; then
        zenity --error --title="Error" --text="Failed to upload the file."
        exit 1
    fi

    # Display the result and copy to clipboard
    echo "$RESPONSE" | xclip -selection clipboard
    zenity --info --title="Upload Complete" --text="File uploaded successfully.\nLink: $RESPONSE\n(Link copied to clipboard)"
}

# Main script
for FILE in "$@"; do
    upload_file "$FILE"
done
