#!/bin/sh
read -p "Enter your arrays: " array_raw
IFS=' ' read -ra array1 <<< "$array_raw"
#array1=(Theodore Yuan Bourne Pamintuan Malagiona)
for a in "${array1[@]}"
do
	echo $a
done
