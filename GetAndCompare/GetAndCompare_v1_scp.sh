#!/bin/bash

clear

read -p "Enter Source: " MYSRC
read -p "Enter Destination: " MYDEST

VI_SLEEP=5
MYDATE=`date +%Y%m%d%H%M%S`
LIST_OF_FILES="FilesToGC/$MYDATE/FilesToGC_$MYDATE.txt"

mkdir -p FilesToGC/$MYDATE/$MYSRC
mkdir -p FilesToGC/$MYDATE/$MYDEST

echo -e "\nThe script will open a "VI Editor" after $VI_SLEEP seconds.
Input the files to compare with the absolute path.

Once done. save (wq!) it.\n"

read -p "Press 'ENTER KEY' to continue ..."

vi $LIST_OF_FILES

while IFS= read -r line;do
	echo "### $line ###"
	scp $MYSRC:$line FilesToGC/$MYDATE/$MYSRC/
	scp $MYDEST:$line FilesToGC/$MYDATE/$MYDEST/
done < $LIST_OF_FILES
