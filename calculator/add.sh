#!/bin/sh
read -p "Enter First Number : " fn
read -p "Enter Second Number : " sn
sum=$(( $fn + $sn ))
echo "The sum of $fn and $sn is $sum"
