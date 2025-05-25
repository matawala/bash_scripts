#!/bin/bash

s_time=$1
if [[ $# -le "0" ]]; then
	echo "Usage: $0 {# of time }"
	exit 0
fi
echo "Start: `date`"
sleep $s_time && sleep 5 &
wait $!
echo "Ended: `date`"
