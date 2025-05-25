#!/bin/bash

JB="ini"

chkwl () {
	JB=`netstat -tulpn | grep -i :80 | wc -l`
	prnt
}

prnt.ini () {
	if [ "$JB" == "ini" ]
	then
		echo "`date` : Checking was initialized ... :)"
                sleep 1
                chkwl
	else
		prnt
	fi
}

prnt () {
	if [ "$JB" -le "0" ]
	then
		echo "`date` : JBoss is ****down**** ... :("
		sleep 1
		chkwl
	else
		echo ""
		echo "*******************************************************"
		echo "`date` : JBoss is now ...            "
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
