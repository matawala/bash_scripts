#!/bin/sh

array=(Volvo BMW Toyota);
echo ${array[1]};
#echo ${array[@]};


declare -A family=([mommy]="rhea" [bunso]="yuri" [panaganay]="yuan" [daddy]="bong")
echo ${family[bunso]}

#my_array=array('rhea', 'yuan', 'yuri')
#echo $my_array[0]
