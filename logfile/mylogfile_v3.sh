#!/bin/sh

#
# 20250525 v1 Tabbed logs
# 20250525 v2 Use of while to print per line instead of awk needs to complete before append the log file
# 20250525 v3 Added additional task and added also new lines after/before descriptions

#MYDATE=`date +%Y%m%d%H%M%S`
MYDATE=`date +%Y%m%d`
LOGDATE=`date +%Y-%m-%d" "%H:%M:%S`
LOGPREFIX="                      "
PROJECT_PATH=`pwd`
LOGFILE=$PROJECT_PATH/logs/$MYDATE.log

touch $LOGFILE
echo -e "$LOGDATE : Start executing Ping\n" | tee -a $LOGFILE
ping -c 4 8.8.8.8 | while IFS= read -r line;
do
	echo -e "                      $line" | tee -a $LOGFILE
done
echo -e "\n$LOGDATE : Finished executing Ping" | tee -a $LOGFILE
echo -e "$LOGDATE : Start listing all the files under /var/log\n" | tee -a $LOGFILE
ls -lt /var/log | while IFS= read -r line;
do
	echo -e "                      $line" | tee -a $LOGFILE
done
echo -e "\n$LOGDATE : Finished listing all files under /var/log" | tee -a $LOGFILE

echo -e "\nLogfile : $LOGFILE"
