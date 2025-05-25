#!/bin/bash

while getopts a:b:c: abc
do
	case $abc in
		a)
			echo "aaa"
			username=${OPTARG}
			;;
		b)
			echo "bbb"
			;;
		c)
			echo "ccc"
			;;
	esac
done
echo $username

echo "Arg1 : $1"
echo "Arg2 : $2"
