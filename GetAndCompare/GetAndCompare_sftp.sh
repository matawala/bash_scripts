#!/bin/bash

############################################################################################
#
# Added PROJECT_PATH to fix the issue in changing directory for server2 
# SFTP is successfull for multiple files
# make diff of the files
#
############################################################################################

clear

read -p "Enter Source1: " MYSRC1
read -p "Enter Source2: " MYSRC2

VI_SLEEP=5
MYDATE=`date +%Y%m%d%H%M%S`
PROJECT_PATH=`pwd`
LIST_OF_FILES="FilesToGC/$MYDATE/FilesToGC_$MYDATE.txt"
BSNM_OF_FILES="FilesToGC/$MYDATE/BSNMsToGC_$MYDATE.txt"

mkdir -p FilesToGC/$MYDATE/$MYSRC1
mkdir -p FilesToGC/$MYDATE/$MYSRC2

echo -e "\nThe script will open a "VI Editor" after your confirmation.
Input the files to compare with the absolute path.

Once done. save (wq!) it.\n"

read -p "Press 'ENTER KEY' to continue ..."

vi $LIST_OF_FILES

cd $PROJECT_PATH/FilesToGC/$MYDATE/$MYSRC1/
sftp $MYSRC1 <<EOF
get /tmp/hosts
exit
EOF

cd $PROJECT_PATH/FilesToGC/$MYDATE/$MYSRC2/
sftp $MYSRC2 <<EOF
get /tmp/hosts
exit
EOF

#create a basename for the files
while IFS= read -r line;
do
	basename $FILE $line>>$BSNM_OF_FILES
done<$LIST_OF_FILES

cat $BSNM_OF_FILES
