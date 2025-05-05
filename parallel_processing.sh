#!/bin/bash

#Parallel Processing -- Process multiple files in parallel using background jobs

#Check if any arguments (files) were passed
if [ $# -gt 0 ]; then
    #get all the file arguments passed
    files=("$@")

    #Loop over each file provided as an argument
    for file in "${files[@]}"; do
        #check if the file exist
        if [ -f "$file" ]; then
            #background process is started by wrapping the operation
            #in parentheses (...) and appending an ampersand at the end 
            (
                #This block runs in the background
                echo "Processing file: $file..."
                #Count the number of lines in the file 
                count=$(wc -l < "$file")
                echo "$file has $count lines"
            )&
        else
            echo "File '$file' not found; skipping"
        fi
    done

    #Wait for all background processes to finish
    wait
    echo "All files processed"
else
    echo "Usage: $0 file1 file2 ..."
    exit 1
fi