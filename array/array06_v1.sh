#!/bin/sh
declare -A my_arr=([panganay]="Yuan")
my_arr+=([bunso]="Yuri" [daddy]="Bong" [mommy]="Rhea")
echo "${my_arr[panganay]}"
echo "${my_arr[bunso]}"
echo "${my_arr[@]}"

for my_arr_loop in ${my_arr[@]}
do
	echo "### $my_arr_loop ###"
done
