#!/bin/bash

#Get disk usage percentage (without the % sing for the root partition)
# df -H / limits the check to the root filesystem (/) -- which is usually what you care about for alerts 
# remove the % sign using gsub(/%/,"",$5) inside awk
# awk is a text processing tool by columns 
# NR=2 {....} NR means number of registres, number of line that is awk processing 
#  NR=2 makes that the code block {...} only runs in the second line of the entrance
#why the second line, because df -H / command returns in the first line all the headers and in the second line the values
# gsub(/%/,"",$5) 
# gsub global substitution 
# gsub(/%/,"",$5)  search % symbol in the fifth column ($5) and replace it with ""
# $5 is where normally shows the disk usage, as 92%
# print $5 after removing %, just print the number 
disk_usage=$(df -H / | awk 'NR==2 {gsub(/%/,"",$5); print $5}')

if [ "$disk_usage" -gt 90 ]; then
    echo "⚠️  Alert: Disk usage is at ${disk_usage}%. Running out of space!"
else
    echo "✅ Disk usage is at ${disk_usage}%. All good."
fi
