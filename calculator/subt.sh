#!/bin/sh
read -p "Enter First Number : " fn
read -p "Enter Second Number : " sn
diff=$(( $fn - $sn ))
echo "The difference of $fn and $sn is $diff"
