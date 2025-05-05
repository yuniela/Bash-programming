#!/bin/bash

#Interactive Installer – Build a script that installs packages and configures a system
# A interactive installer is a Bash Script that: 
#   1. Asks the user which packages or tools they want to install.
#   2. Installs them using a package manager (apt, yum, dnf, pacman, bew, etc)
#   3. Optionally configures things afterwars (e.g., editing config files, enabling services, setting aliases)
#   4. Provides feedback and handles errors interactively

echo "Welcome to the Interactive Installer"
echo "this script will help install common packages"

#List of packages
packages=("git" "curl" "vim" "htop" "docker.io")
for pkg in "${packages[@]}"; do
    #read user input
    read -p "Do you want to install $pkg? (y/n): " answer

    # [[ ... ]] is Bash conditional expression syntax  
    # we are comparing values this way is safer and easier
    if [[ "$answer" == "y" || "$answer" == 'Y' ]]; then
        echo "Installing $pkg..."
        #install witout prompting
        sudo apt update -y
        sudo apt install -y "$pkg"
        # $? checks and return code of the last command (0=success)
        if [ $? -eq 0 ]; then
            echo "$pkg installled successfully."
        else
            echo "Failed to install $pkg"
        fi
    else
        echo "Skipping $pkg"
    fi
done

echo "Installation  process completed"