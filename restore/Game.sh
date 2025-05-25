#!/bin/bash

# Function to calculate the next number in a custom sequence pattern
predict_next() {
    local sequence=("$@")
    local pattern=(1 2)  # Define the pattern to predict next number
    
    local pattern_length=${#pattern[@]}
    local seq_length=${#sequence[@]}
    
    local index=$((seq_length % pattern_length))
    local next_pattern_number=${pattern[$index]}
    
    echo $next_pattern_number
}

# Function to print the current sequence
print_sequence() {
    local sequence=("$@")
    local seq_string=""
    for num in "${sequence[@]}"; do
        seq_string+="$num "
    done
    echo "Current sequence: $seq_string"
}

# Main loop
echo "Enter the initial sequence:"
read -a initial_sequence

while true; do
    print_sequence "${initial_sequence[@]}"
    
    next_pattern_number=$(predict_next "${initial_sequence[@]}")
    echo "The next number in the sequence is: $next_pattern_number"
    
    echo "Enter the next number in the sequence (or type 'exit' to quit):"
    read user_input
    
    if [[ "$user_input" == "exit" ]]; then
        echo "Goodbye!"
        break
    elif [[ "$user_input" =~ ^-?[0-9]+$ ]]; then
        initial_sequence+=("$user_input")
    else
        echo "Please enter a valid number."
    fi
done

