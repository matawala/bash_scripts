#!/bin/sh
clear
file=/etc/passw
if [ -f $file ]; 
	then echo "The file $file exist..."; 
else 
	echo "The file $file doesn't exist...";
fi
