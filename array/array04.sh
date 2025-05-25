#!/bin/sh

for additional_arr in {a..z}
do
	my_additional_arr+=$additional_arr
	echo $my_additional_arr[@]
sleep 3
done
