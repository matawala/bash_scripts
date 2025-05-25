#!/bin/bash

usrn=defaultusername
dept=defaultdept

while getopts hmu: opts; do
	case $opts in
		h)
			echo "Usage : $0 {start|stop}"
			;;
		m)
			echo "menu"
			;;
		u)
			usrn=${OPTARG}
			;;
		d)
			dept=${OPTARG}
			;;
	esac 
done

echo $usrn
echo $dept
