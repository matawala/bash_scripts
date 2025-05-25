#!/bin/sh
sleep 60 &
PSSLEEP_PID=$!
PSSLEEP=`ps -ef | grep $PSSLEEP_PID | grep -v grep | wc -l`
while [[ $PSSLEEP -gt "0" ]];
do
	#echo "$PSSLEEP : Still running...";
	echo -n ".";
	PSSLEEP=`ps -ef | grep $PSSLEEP_PID | grep -v grep | wc -l`
	sleep 1
done
