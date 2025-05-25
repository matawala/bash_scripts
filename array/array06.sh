#!/bin/bash
declare -A my_fam=([daddy]="Bong" [mommy]="Rhea")
my_fam+=([panganay]="Yuan" [bunso]="Yuri")
echo ${my_fam[@]}
echo ${my_fam[0]}
