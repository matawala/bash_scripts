#!/bin/sh
clear

check_file_exist () {
#file=/etc/passwds
file=$1
if [ -f $file ]; 
	then echo "The file $file exist..."; 
else 
	echo "The file $file doesn't exist...";
fi
}

check_args () {
if [ -z $1 ];
	then; echo "Input a filename" && sleep 3
	exit
else
	then check_file_exist
fi
}

debugging () {
echo $1
}

#debugging $1
check_args $1
