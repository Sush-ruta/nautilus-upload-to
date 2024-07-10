#!/bin/bash

CONFIG_FILE="$HOME/.config/.ufile.conf"
API_CREATE_SESSION_URL="https://up.ufile.io/v1/upload/create_session"
API_FINALISE_URL="https://up.ufile.io/v1/upload/finalise"
MAX_FILE_SIZE=$((5 * 1024 * 1024 * 1024)) # 5GB

# Create the hidden config file if it doesn't exist
if [ ! -f "$CONFIG_FILE" ]; then
    touch "$CONFIG_FILE"
    echo "# Add your API key below" > "$CONFIG_FILE"
    echo "API_KEY=" >> "$CONFIG_FILE"
fi

# Function to get API key from the config file
get_api_key() {
    API_KEY=$(grep "API_KEY=" "$CONFIG_FILE" | cut -d'=' -f2)
    echo "$API_KEY"
}

# Function to create a session and get fuid
create_session() {
    FILE_SIZE=$1
    API_KEY=$2

    if [ -z "$API_KEY" ]; then
        RESPONSE=$(curl -s -X POST "$API_CREATE_SESSION_URL" \
            -d "file_size=$FILE_SIZE")
    else
        RESPONSE=$(curl -s -X POST "$API_CREATE_SESSION_URL" \
            -H "X-API-KEY: $API_KEY" \
            -d "file_size=$FILE_SIZE")
    fi

    FUID=$(echo "$RESPONSE" | jq -r '.fuid')

    if [ -z "$FUID" ]; then
        zenity --error --title="Session Creation Error" --text="Failed to create session. Please try again."
        exit 1
    fi

    echo "$FUID"
}

# Function to finalise the upload
finalise_upload() {
    FUID=$1
    FILE_NAME=$2
    FILE_TYPE=$3
    TOTAL_CHUNKS=$4

    RESPONSE=$(curl -s -X POST "$API_FINALISE_URL" \
        -d "fuid=$FUID" \
        -d "file_name=$FILE_NAME" \
        -d "file_type=$FILE_TYPE" \
        -d "total_chunks=$TOTAL_CHUNKS")

    URL=$(echo "$RESPONSE" | jq -r '.url')

    if [ -z "$URL" ]; then
        zenity --error --title="Upload Finalisation Error" --text="Failed to finalise the upload. Please try again."
        exit 1
    fi

    # Display the result and copy to clipboard
    echo "$URL" | xclip -selection clipboard
    zenity --info --title="Upload Complete" --text="File uploaded successfully.\nLink: $URL\n(Link copied to clipboard)"
}

# Main script
API_KEY=$(get_api_key)

for FILE in "$@"; do
    FILE_SIZE=$(stat -c%s "$FILE")
    if [ "$FILE_SIZE" -gt "$MAX_FILE_SIZE" ]; then
        zenity --error --title="File Size Error" --text="The file size exceeds the 5GB limit."
    else
        FUID=$(create_session "$FILE_SIZE" "$API_KEY")
        FILE_NAME=$(basename "$FILE")
        FILE_TYPE="${FILE_NAME##*.}"
        finalise_upload "$FUID" "$FILE_NAME" "$FILE_TYPE" 1
    fi
done
