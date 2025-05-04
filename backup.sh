#!/bin/bash

#check if a directory path was passed
if [ $# -gt 0]; then
    SOURCE_DIR="$1"
    TIMESTAMP=$(date +%Y%m%d_H%M%S)
    BACKUP_DIR="backup_$TIMESTAMP"

    #CREATE BACKUP DIRECTORY
    mkdir p "$BACKUP_DIR"

    # find "$SOURCE_DIR" Start searching in the directory you passed
    # -type f only look for files (not directory)
    # -name "*.txt" only match files ending in .txt
    # -exec for each file found, execute the following command
    # cp {} the {} is a placeholder -- it gets replaced with the current file name that find found
    # "BACKUP_DIR" the destination for the copied file
    # \; Ends the -exec command. The backslash escapes the semicolon so it's passed correctly to find
    find $SOURCE_DIR -type f -name "*.txt" -exec cp {} "$BACKUP_DIR" \;

    #compress the backup
    tar -czf "${BACKUP_DIR}.tar.gz" "${BACKUP_DIR}"
    rm -r "BACKUP_DIR"

    echo "Backup completed: $BACKUP_DIR"

else
    echo "No directory specified."
    echo "Usage: ./backup.sh /path/to/source_directory"
    exit 1
fi