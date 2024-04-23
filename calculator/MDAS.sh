#!/bin/sh

mdas () {
optr=$choice
	case $optr in
		"1")
			echo "Multiplication"
			getthenumbers
			total=$(($fn * $sn))
			echo "the product of $fn and $sn is $total"
			;;
		"2")
			echo "Division"
			getthenumbers
			total=$(($fn / $sn))
			echo "the quotient of $fn and $sn is $total"
			;;
		"3")
			echo "Addition"
			getthenumbers
			total=$(($fn + $sn))
			echo "the sum of $fn and $sn is $total"
			;;

		"4")
			echo "Subtraction"
			getthenumbers
			total=$(($fn - $sn))
			echo "the sum of $fn and $sn is $total"
			;;

		*)
			echo "Invalid choice"
			sleep 2
			closeMe	
			;;
	esac
}

getthenumbers () {
clear
read -p "Enter first number : " fn
read -p "Enter second number : " sn
}

closeMe () {
clear
exit
}

# The script will start to run here ... :)
clear

echo -e "
[1] Multiplication
[2] Division
[3] Addition
[4] Subtraction
"

read -p "Enter your choice : " choice
mdas
