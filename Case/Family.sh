#!/bin/bash
read -p "Enter a family name: " inputted_name
case $inputted_name in
	Bong | bong ) echo "Daddy"
		;;
	rhea ) echo "Mommy"
		;;
	yuan ) echo "Panganay"
		;;
	yuri ) echo "Bunso"
		;;
	*) echo "Invalid"
	;;
esac
