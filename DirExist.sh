#!/bin/bash
logdate="$(date +%Y%m%d)"
logdesc="$(date +%H%M%S)"

if [[ $# -le 0 ]]; then
	echo "Usage : $0 {BeforeLDOM|AfterLDOM}"
	exit 1
else
	logdesc="$1"
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
