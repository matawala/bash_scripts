#!/bin/sh
read -p "Enter First Number : " fn
read -p "Enter Second Number : " sn
product=$(( $fn * $sn ))
echo "The product of $fn and $sn is $product"
