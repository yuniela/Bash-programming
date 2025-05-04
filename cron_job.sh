#!/bin/bash

#Cron Job Script –  Write a script that rotates logs and set it up via cron

if [ $# -gt 0 ]; then
    SERVER_LOG=$1
    DATE=$(date +"%Y-%m-%d")

    if [ -f "$SERVER_LOG" ]; then
        new_name="${SERVER_LOG}.${DATE}"
        mv "$SERVER_LOG" "$new_name"
        touch "$SERVER_LOG"
        echo "Log rotated: $new_name"
        
    else
        echo "Error: Log file '$SERVER_LOG' not found"
        exit 1
    fi
else
    echo "No log specified"
    echo "Usage: ./cron_jobs /path/to/server.log"
    exit 1
fi

#Set it via Cron
#crontab -e
#0 0 * * * /path/to/cron_jobs.sh /path/to/your/logfile.log