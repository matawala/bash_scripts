#!/bin/sh

#
# 20250525 v1 Tabbed logs
# 20250525 v2 Use of while to print per line instead of awk needs to complete before append the log file

#MYDATE=`date +%Y%m%d%H%M%S`
MYDATE=`date +%Y%m%d`
LOGDATE=`date +%Y-%m-%d" "%H:%M:%S`
LOGPREFIX="                      "
PROJECT_PATH=`pwd`
LOGFILE=$PROJECT_PATH/logs/$MYDATE.log

touch $LOGFILE
echo -e "$LOGDATE : Start Executing Ping" | tee -a $LOGFILE
#ping -c 4 8.8.8.8 | awk '{print "                      "$0}' |  tee -a $LOGFILE
ping -c 4 8.8.8.8 | while IFS= read -r line;
do
	echo -e "                      $line" | tee -a $LOGFILE
done
echo -e "$LOGDATE : Finish Executing Ping" | tee -a $LOGFILE

echo -e "\nLogfile : $LOGFILE"
