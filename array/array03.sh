#!/bin/sh

clear

array=(Volvo BMW Toyota);
# Add entry in the array
array+=(Suzuki);
array+=(Kawasaki);

echo "### Print the count of array"
echo "Array count : ${#array[@]}"

echo "### Print the second entry in the array"
echo ${array[1]};

echo "### Print the all entries in the array"
echo ${array[@]};

echo "### for loop to print the all entries in the array"
for arr in ${array[@]}
do
	echo "=== $arr ==="
done

declare -A family=([mommy]="rhea" [bunso]="yuri" [panaganay]="yuan" [daddy]="bong")
echo ${family[bunso]}

