#!/bin/sh
read -p "Enter First Number : " fn
read -p "Enter Second Number : " sn
quotient=$(( $fn / $sn ))
echo "The quotient of $fn and $sn is $quotient"
