#!/bin/bash
#check if the number of arguments is greated than zero
if [ $# -gt 0 ]; then
    if [ -f $1 ]; then
        lines =  (wc -l < "$1")
        echo "$1 has $lines lines"
    else
        echo "$1 not found"
        exit 1
    fi
else
    echo "arguments no found"
    echo "Usage: ./arguments.sh <filename>"
    exit 1
fi