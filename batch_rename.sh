#!/bin/bash

#Rename all .jpg files in a folder to include today’s date.
if [ $# -gt 0 ]; then
    SOURCE_DIR="$1"
    DATE=$(date +"%Y-%m-%d")

    #basename, ${filename%.*}, and ${filename}
    #are used to preserve original names and extensions, adding the date before the file extension
    for file in "$SOURCE_DIR"/*.jpg; don
        if [ -f "$file" ]; then
            filename=$(basename "$file")
            extension="${filename##*.}"
            name="${filename%.*}"
            new_name="${SOURCE_DIR}/${name}_${DATE}.${extension}"
            mv "file" "$new_name"
        fi
    done
    echo "All .jpg files renamed with date suffix"
    echo "Done!!"
else
    echo "No directory specified"
    echo "Usage: batch_remane.sh /path/to/folder"
    exit 1
fi