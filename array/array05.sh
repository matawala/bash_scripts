#!/bin/sh

for members in bong reya yuan yuri
do
	myarray+=($members)
done
myarray+=(yuna)
echo "Members of my array: ${myarray[@]}"
echo "Number of my array: ${#myarray[@]}"
