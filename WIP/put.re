#!/bin/bash

# Function to upload file to put.re
upload_file() {
    FILE_PATH="$1"
    LOG_FILE="$HOME/.put_re_uploads.log"

    # Upload the file
    RESPONSE=$(curl -s -F "file=@${FILE_PATH}" "https://api.put.re/upload")

    # Check if response contains success
    if echo "$RESPONSE" | grep -q '"status":"success"'; then
        # Extract data from response
        UPLOAD_LINK=$(echo "$RESPONSE" | jq -r '.data.link')
        DELETE_LINK=$(echo "$RESPONSE" | jq -r '.data.deleteLink')

        if [ -z "$UPLOAD_LINK" ] || [ -z "$DELETE_LINK" ]; then
            zenity --error --title="Error" --text="Failed to upload the file."
            exit 1
        fi

        # Display the result and copy to clipboard
        echo "$UPLOAD_LINK" | xclip -selection clipboard
        zenity --info --title="Upload Complete" --text="File uploaded successfully.\nLink: $UPLOAD_LINK\n(Link copied to clipboard)"

        # Log the upload details
        echo "$(date '+%Y-%m-%d %H:%M:%S') : $(basename "$FILE_PATH") : $DELETE_LINK" >> "$LOG_FILE"
    else
        zenity --error --title="Error" --text="Failed to upload the file."
        exit 1
    fi
}

# Main script
for FILE in "$@"; do
    upload_file "$FILE"
done
