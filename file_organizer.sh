#!/bin/bash
#Move files into folders based on their extensions

if [ $# -gt 0 ]; then
    valid_extensions=("jpg" "png" "pdf" "docx" "txt" "csv")
    is_valid=false
    archive=$1
    extension=${archive##*.}

    for ext in "${valid_extensions[@]}"; do
        if [ "$extension" == "$ext" ]; then
            is_valid=true
            break
        fi
    done

    if [ "$is_valid"=true ]; then
        if [[ "$extension"==jpg || "$extension"==png ]]; then
            mkdir -p ./images
            mv "$archive" ./images/
            echo "Image moved into Image folder"
        else
            mkdir -p ./documents
            mv "$archive" ./documents
            echo "Document moved into Documents folder"
        fi
    else
        echo "'$extension' is not valid/handled file extension"
    fi

else
    echo "No file specified"
    echo "Usage:  ./file_organizer /path/to/file"
    exit 1
fi