#!/bin/bash

WL="0"

chkwl () {
	WL=`grep -i up /tmp/wl.txt | wc -l`
	prnt
}

prnt () {
	if [ "$WL" -le "0" ]
	then
		echo "`date` : Weblogic is ***down*** ... :("
		sleep 1
		chkwl
	else
		echo "`date` : Weblogic is *** up *** ... :)"
		sleep 1
		exit 0
	fi
}

prnt
