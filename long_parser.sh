#!/bin/bash

#count how many times a specific IP appears in a web server log

if [ $# -eq 2 ]; then
    SERVER_LOG=$1
    IP_ADDRESS=$2

    if [ -f "$SERVER_LOG" ]; then
        count=$(grep -wc $IP_ADDRESS $SERVER_LOG)
        echo "The IP Adress $IP_ADDRESS was found $count times in the log $SERVER_LOG"
    else
        echo "Error: Log file '$SERVER_LOG' not found"
        exit 1
    fi
else
    echo "Serverlog no specified"
    echo "Usage: ./long_parser.sh /path/to/server.log <ip_address>"
    exit 1
fi
