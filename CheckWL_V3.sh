#!/bin/bash

WL="ini"

chkwl () {
	WL=`netstat -tulpn | grep -i :80 | wc -l`
	prnt
}

prnt.ini () {
	if [ "$WL" == "ini" ]
	then
		echo "`date` : Checking was initialized ... :)"
                sleep 1
                chkwl
	else
		prnt
	fi
}

prnt () {
	if [ "$WL" -le "0" ]
	then
		echo "`date` : Weblogic is ****down**** ... :("
		sleep 1
		chkwl
	else
		echo ""
		echo "*******************************************************"
		echo "`date` : Weblogic is now ...            "
		echo "`date` :                                "
		echo "`date` :     *   *  ****           "
		echo "`date` :     *   *  *   *          "
		echo "`date` :     *   *  ****           "
		echo "`date` :     *   *  *              "
		echo "`date` :      ***   *              "
		echo "`date` :                                "
		echo "*******************************************************"
		echo ""
		sleep 1
		exit 0
	fi
}

prnt.ini
