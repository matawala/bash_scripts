#!/bin/sh

mdas () {
optr=$choice
	case $optr in
		"1")
			echo "Multiplication"
			sleep 2
			closeMe
			;;
		"2")
			echo "Division"
			sleep 2
			closeMe
			;;
		"3")
			echo "Addition"
			sleep 2
			closeMe
			;;

		"4")
			echo "Subtraction"
			sleep 2
			closeMe
			;;

		*)
			echo "Invalid choice"
			sleep 2
			closeMe	
			;;
	esac
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
