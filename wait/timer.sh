#!/bin/bash

# Function to display the countdown
function countdown {
    local i=$1
    while [ $i -gt 0 ]; do
        echo -ne "Countdown: $i\033[0K\r" # \033[0K clears the line
        sleep 1
        ((i--))
    done
}

# Main
clear
read -p "Enter countdown time (seconds): " seconds

countdown $seconds
echo "Time's up!"
