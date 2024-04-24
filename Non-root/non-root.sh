#!/bin/sh
clear
root_msg="Terminating ... Please run this as NOT root user."
if [ $USER == "root" ]; 
	then echo $root_msg && sleep 5; clear; exit; 
else
	echo "$USER is permitted to run this script ... "
	echo "Happy coding ...."
fi
