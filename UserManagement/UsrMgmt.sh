#!/bin/sh

usrmgmt () {
	case $choice in
		1)
			echo "Add User"
			closeMe
			;;
		2)
			echo "Delete User"
			closeMe
			;;
		3)
			echo "Modify User"
			closeMe
			;;
		*)
			echo "Invalid input"
			closeMe
			;;
	esac

}

closeMe () {
sleep 3
exit
}


### The Scripts starts to run here ... :)

echo -e "
Please select below options:

[1] Add User
[2] Delete User
[3] Modify User

"

read -p "Enter your choice : " choice
clear
usrmgmt
