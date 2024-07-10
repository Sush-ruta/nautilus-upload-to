#!/bin/bash

# Function to upload file to Gofile
upload_file() {
    # Get the file from the context menu
    file="$1"

    # Prompt for expiry time
    expiry=$(zenity --entry --title "Expiry Time" --text "Enter expiry time (e.g., 1w, 3d):" --entry-text "2w")
    if [[ $? -ne 0 ]]; then
      exit 0
    fi

    # Upload the file
    response=$(curl -s -F "file=@${file}" "https://file.io/?expires=${expiry}")

    # Check if the upload was successful
    success=$(echo "$response" | jq -r '.success')
    if [[ "$success" != "true" ]]; then
      zenity --error --title "File Upload Error" --text "Failed to upload the file.\n$response"
      exit 1
    fi

    # Extract the link and key
    link=$(echo "$response" | jq -r '.link')
    key=$(echo "$response" | jq -r '.key')

    # Save the upload details in a hidden log file
    log_file="$HOME/.file_io_upload_log"
    echo "$(date): $file, $key" >> "$log_file"

    # Display the result and copy to clipboard
    echo "$link" | xclip -selection clipboard
    zenity --info --title "File Upload Success" --text "File uploaded successfully.\n\nLink: $link\nExpire Until: $expiry\n\n(Link copied to clipboard)"
}

# Call the function with the file from Nautilus context menu
upload_file "$1"
