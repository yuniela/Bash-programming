#!/bin/bash

# Rename only .jpg files created or modified today include today's date

if [ $# -gt 0 ]; then
    SOURCE_DIR="$1"
    DATE=$(date+"%Y-%m-%d")

    #find .jpg files modified today
    find "$SOURCE_DIR" -type f -iname "*.jpg" -newermt "$DATE" ! -newermt "$DATE +1 day" | while read -r file; do
        if [ -f "$file" ]; then
            filename=$(basename "$file")
            extension="${filename##*.}"
            name="${filename%.*}"
            dir=$(dirname "$file")
            new_name="${dir}/${name}_${DATE}.${extension}"
            mv "$file" "$new_name"
        fi
    done

    echo "Rename .jpg files modified today" 
else
    echo "No directory specified"
    echo "Usage: ./batch_rename_date /path/to/directory"
    exit 1
fi