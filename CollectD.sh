#!/bin/bash

compareit="no"

logdate="$(date +%Y%m%d)"
logdesc="$(date +%H%M%S)"

if [[ $# -le 0 ]]; then
	echo "Usage : $0 {BeforeLDOM|AfterLDOM}"
	exit 1
else
	logdesc="$1"
	if [[ "$1" == "AfterLDOM" ]]; then
		compareit="yes"
	fi
fi

logfile="${logdate}_${logdesc}"

if [ -d Report ]; then
	echo "exist"
else
	mkdir Report
fi

echo "Logdate : $logdate"
echo "Logdesc : $logdesc"
echo "Logfile : $logfile"
echo "Compare : $compareit"
