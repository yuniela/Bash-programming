#!/bin/bash
#Add prefix/sufix to all files in a folder 
if [ $# -gt 1 ]; then
    SOURCE_DIR=$1
    PREFIX=$2

    if [ -d "$SOURCE_DIR" ]; then
        #utilizamos -maxdepth 1 para solo buscar en el directorio actual y no en subdirectorios
        find "$SOURCE_DIR" -maxdepth 1 -type f | while read -r file; do
            filename=$(basename "$file")
            new_name="${PREFIX}_${filename}"
            mv "$file" "$SOURCE_DIR/$new_name"
            echo "$filename were change to $new_name"
        done
        echo "All archive names were modified"
    else
        echo "$SOURCE_DIR is not valid directory"
    fi
else
    echo "No argument found"
    echo "Usage: ./file_renamer.sh /path/to/folder"
    exit 1
fi