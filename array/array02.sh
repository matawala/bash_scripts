#!/bin/sh

while read -r line;
do
	echo $line
	#declare -A member=([rank]='`echo $line | awk {print $1}`') 
	#declare -A member=([rank]='`echo $line | awk "{print $1}"`') 
	declare -A member=([rank]="`echo $line | awk '{print \$1}'`" [fn]="`echo $line | awk '{print \$2}'`" [mn]="`echo $line | awk '{print \$3}'`" [ln]="`echo $line | awk '{print \$4}'`") 
	echo "rank: ${member[rank]}"
	echo "fn: ${member[fn]}"
	echo "mn: ${member[mn]}"
	echo "ln: ${member[ln]}"
	echo ""
done < family_members.txt
