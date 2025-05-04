#!/bin/bash

echo "Select one of the following options of the menu"
echo "1. Show date"
echo "2. Show uptime"
echo "3. Quit"
read -p "Enter option: " option

case "$option" in
    1)
        date "+%Y-%m-%d"
        ;;
    2)
        uptime
        ;;
    3)
        echo "GoodBye!"
        exit 0
        ;;
    *)
        echo "❌ Invalid option. Please run the script again and choose 1, 2, or 3."
        exit 1
        ;;
esac