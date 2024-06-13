#!/bin/bash

# Clear Screen
clear

# Check for current user
current_user=`whoami`
if [ $current_user != "root" ]
then
	echo "(!) This must be run by root user..."
	exit 1
fi


# define services variables
alll_svcs="httpd mariadb"
stop_svcs="httpd mariadb"
strt_svcs="mariadb httpd"
# --- Sleep duration in seconds
sleep_duration="60"

# Variables for f_progress function
stop_httpd=" "
stop_mariadb=" "
waiting=" "
start_httpd=" "
start_mariadb=" "

# Timings
dt_strt=""
dt_done=""


# Check for the services status
f_stat_mysvcs () {
#systemctl -l --no-pager status $svcs_stat
systemctl status $alll_svcs --lines=0
echo ""
date
}

# Stop Services Function
f_stop_mysvcs () {
	for svcs_stop in $stop_svcs
	do
        	#echo "### $svcs_stop ###"
        	nohup systemctl stop $svcs_stop &
		wait $!
		export stop_"$svcs_stop"="X"
		f_progress
	done
}

# Start Services Function
f_strt_mysvcs () {
        for svcs_strt in $strt_svcs
        do
                #echo "### $svcs_strt ###"
                nohup systemctl start $svcs_strt &
		wait $!
		export start_"$svcs_strt"="X"
		f_progress
        done

	dt_done=`date`
}

# Print progress
f_progress () {
	clear
	echo -e "Status of Service Restart:
	[$stop_httpd] Stopping of httpd Service
	[$stop_mariadb] Stopping of mariadb Service
	[$waiting] Wait for $sleep_duration seconds before starting the services
	[$start_httpd] Starting of mariadb Service
	[$start_mariadb] Starting of  httpd Service

	Date/Time Started   : $dt_strt
	Date/Time Completed : $dt_done
	"
}

# Print the current state of the service/s
f_stat_mysvcs
f_progress

read -p "Do you want to proceed with the service restart of \"$alll_svcs\"? [Y/y]:" rep
#rep="X"
if [ -z $rep ]
then
	exit 0
elif [ $rep == "Y" ] || [ $rep == "y" ]
then
	dt_strt=`date`
	f_stop_mysvcs
	sleep $sleep_duration
	export waiting="X"
	f_strt_mysvcs
	echo ""
	f_progress
	read -p "Done with the restart of services. Press enter to generate the status of services" rpts
	clear
	f_stat_mysvcs
	
fi
