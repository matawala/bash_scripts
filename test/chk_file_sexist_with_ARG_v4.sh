#!/bin/sh
fl=$1
check_file () {
if [ -f $1 ];
then
	echo "The file $1 exist ... :)"
else
	echo "The file $1 doesn't exist ... :("
fi
}

#check_file $fl

chk_args () {
if [ "$fl" == "" ];
then
	clear
	echo "Input some args please ... " && sleep 3
	exit
else
	clear
	check_file $fl
fi
}

chk_args $fl
