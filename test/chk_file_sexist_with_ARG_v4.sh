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
	echo "Input some args please ... " && sleep 3
	exit
else
	check_file $fl
fi
}

chk_args $fl
