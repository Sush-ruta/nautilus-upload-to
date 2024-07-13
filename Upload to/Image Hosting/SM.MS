#!/bin/bash

CONFIG_FILE="$HOME/.config/.smms.conf"
LOG_FILE="$HOME/.smms_uploads.log"

# Function to create a sample config file if it doesn't exist
create_config_file() {
    touch "$CONFIG_FILE"
}

# Check if config file exists, if not, create it
if [ ! -f "$CONFIG_FILE" ]; then
    create_config_file
fi

# Load configuration
source "$CONFIG_FILE"

# Prompt for API key if not set
if [ -z "$SMMS_API_KEY" ]; then
    SMMS_API_KEY=$(zenity --entry --title="SM.MS API Key" --text="Enter your SM.MS API Key:")
    echo "SMMS_API_KEY=\"$SMMS_API_KEY\"" >> "$CONFIG_FILE"
fi

# Get the file path from the context menu
FILE_PATH="$1"

if [ -z "$FILE_PATH" ]; then
    zenity --error --title="Error" --text="No file selected."
    exit 1
fi

# Check file size (maximum 5 MB)
FILE_SIZE=$(stat --printf="%s" "$FILE_PATH")
MAX_SIZE=$((5 * 1024 * 1024))
if [ "$FILE_SIZE" -gt "$MAX_SIZE" ]; then
    zenity --error --title="Error" --text="File size exceeds the 5 MB limit."
    exit 1
fi

# Check if the file is an image
MIME_TYPE=$(file --mime-type -b "$FILE_PATH")
if [[ ! $MIME_TYPE =~ ^image/ ]]; then
    zenity --error --title="Error" --text="Selected file is not an image."
    exit 1
fi

# Upload the image to SM.MS
UPLOAD_RESPONSE=$(curl -s -H "Authorization: $SMMS_API_KEY" -F "smfile=@$FILE_PATH" -F "format=json" "https://sm.ms/api/v2/upload")

# Extract data from the response
SUCCESS=$(echo "$UPLOAD_RESPONSE" | jq -r '.success')
URL=$(echo "$UPLOAD_RESPONSE" | jq -r '.data.url')
DELETE_URL=$(echo "$UPLOAD_RESPONSE" | jq -r '.data.delete')
FILE_NAME=$(basename "$FILE_PATH")

# Check if the upload was successful
if [ "$SUCCESS" != "true" ]; then
    zenity --error --title="Upload Failed" --text="File upload failed. Please try again."
    exit 1
fi

# Log the upload details
echo "$(date '+%Y-%m-%d %H:%M:%S') | $FILE_NAME | $DELETE_URL" >> "$LOG_FILE"

# Show success message with the file URL and copy it to clipboard
zenity --info --title="Upload Complete" --text="File uploaded successfully.\nURL: $URL\n(Link copied to clipboard)"
echo -n "$URL" | xclip -selection clipboard
