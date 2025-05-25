#!/bin/bash

# Save the current terminal settings
stty_save=$(stty -g)

# Function to make the cursor blink
blink_cursor() {
  while true; do
    printf "\e[?25h"  # Show the cursor
    sleep 0.5        # Wait for 0.5 second
    printf "\e[?25l"  # Hide the cursor
    sleep 0.5        # Wait for 0.5 second
  done
}

# Start the blinking cursor in the background
blink_cursor &
blink_pid=$!

# Your script's main logic goes here
echo "This is the main part of the script."
sleep 5 # Simulate some work

# Stop the blinking cursor
kill $blink_pid

# Restore the original terminal settings
stty "$stty_save"

echo "Script finished."
