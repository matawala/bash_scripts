#!/bin/bash

# Function to calculate the next number in an arithmetic sequence
predict_next() {
    local sequence=("$@")
    local length=${#sequence[@]}
    
    # Calculate the common difference
    local diff=$((sequence[1] - sequence[0]))
    
    # Predict the next number
    local next_number=$((sequence[length-1] + diff))
    
    echo $next_number
}

# Main script
if [ "$#" -lt 2 ]; then
    echo "Usage: $0 num1 num2 [num3 ...]"
    exit 1
fi

# Read the input sequence
input_sequence=("$@")

# Predict the next number
next_number=$(predict_next "${input_sequence[@]}")
echo "The next number in the sequence is: $next_number"

