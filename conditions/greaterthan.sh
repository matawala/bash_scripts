#!/bin/sh
x=10
while [ $x -gt 0 ]
do
	echo $x; x=$(( $x-1 ))
	sleep 1
done
