#!/bin/bash
my_arr_fam=(Rhea Yuan Yuri Bong $@)
echo "Total # of arg in array is ${#my_arr_fam[@]}"

declare -A my_arr_FamilyMember=([Father]="Bong" [Mother]="Rhea")
declare -A my_arr_FamilyMember+=([Panganay]="Yuan")
echo ${my_arr_FamilyMember[Panganay]}
