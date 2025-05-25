#!/bin/sh

while IFS=' ' read -r rank fn mn ln; do
    echo "$rank $fn $mn $ln"
    declare -A member=([rank]="$rank" [fn]="$fn" [mn]="$mn" [ln]="$ln")
    echo "rank: ${member[rank]}"
    echo "fn: ${member[fn]}"
    echo "mn: ${member[mn]}"
    echo "ln: ${member[ln]}"
    echo ""
done < family_members.txt

