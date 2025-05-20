#!/bin/bash

#A script that takes seconds as input and counts down to zero

if [ $# -gt 0 ]; then
    seconds=$1
    while [ $seconds -gt 0 ]; do
        echo "$seconds"
        sleep 1
        ((seconds--))
    done
    echo "Time's up!"
else
    echo "No arguments found"
    echo "Usage: ./countdown_timer.sh <seconds>"
    exit 1
fi