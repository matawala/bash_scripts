#!/bin/sh

check_file () {
if [ -f $1 ];
then
	echo "The file $1 exist ... :)"
else
	echo "The file $1 doesn't exist ... :("
fi
}

check_file $1
