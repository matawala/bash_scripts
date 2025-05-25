#!/bin/bash

# Clear Screen
clear

# Debugging
#echo "$#"

# Configure defaults value of variables
usrn="Yuan Bourne"

PrintUsage () {
	echo "Usage: $0 {Start|Stop|Status}"
	exit 1
}

# Check for arguments
if [[ "$#" -le "0" ]]; then
	PrintUsage
fi

while getopts hu:m opt; do
	case $opt in
		h)
			PrintUsage
			;;
		u)
			usrn=${OPTARG}
			;;
		m)
			echo "Menu"
			;;
	esac
done
