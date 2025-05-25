#!/bin/bash

WL="0"

chkwl () {
	WL=`netstat -tulpn | grep -i :80 | wc -l`
	prnt
}

prnt () {
	if [ "$WL" -le "0" ]
	then
		echo "`date` : Weblogic is ****down**** ... :("
		sleep 1
		chkwl
	else
		echo ""
		echo "****************************************"
		echo "`date` : Weblogic is *  * up ***  ... :)"
		echo "`date` : Weblogic is *  * up *  * ... :)"
		echo "`date` : Weblogic is *  * up ***  ... :)"
		echo "`date` : Weblogic is *  * up *    ... :)"
		echo "`date` : Weblogic is  **  up *    ... :)"
		echo "****************************************"
		echo ""
		sleep 1
		exit 0
	fi
}

prnt
