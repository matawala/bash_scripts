#!/bin/sh
cnt=$1
while [[ $cnt -ge 1 ]]
do 
	echo $cnt
        cnt=$(( $cnt - 1 ))
	sleep 1
done
