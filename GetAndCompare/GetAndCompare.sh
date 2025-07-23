#!/bin/bash

############################################################################################
#
# [X] V1.1 Added PROJECT_PATH to fix the issue in changing directory for server2 
# [X] V1.2 Check only the files successfully copied
# [X] V1.3 Add error trap on the case of connectivity in the 2 inputted source
# [X] V1.4 Add error trap if $LIST_OF_FILES is empty
# [X] V1.5 Make invisible the connectivity test
# [X] V1.6 Added message when a connectivity failed or passed
# [X] V1.7 List all invalid file entries
# [X] V1.8 Update the code to get invalid file entries and update the output of comparing files
# [X] V1.9 Archive artifacts
# [ ] V2.0 Tag the Status of files
#
############################################################################################

clear

echo "192.168.56.10"
read -p "Enter Source1: " MYSRC1
read -p "Enter Source2: " MYSRC2

# Prechecks: Checking of the connectivity of the sources
echo ""
echo -e "=========================================="
echo "Prechecks : Connectivity testing"
echo -e "=========================================="
ssh -q $MYSRC1 exit 0
if [[ $? != 0 ]]; then echo -e "\e[31mfailure\e[0m: Connectivity test to $MYSRC1"; exit 1; else echo -e "\e[32mSuccessful\e[0m: Connectivity test to $MYSRC1"; fi
ssh -q $MYSRC2 exit 0
if [[ $? != 0 ]]; then echo -e "\e[31mfailure\e[0m: Connectivity test to $MYSRC2"; exit 1; else echo -e "\e[32mSuccessful\e[0m: Connectivity test to $MYSRC2"; fi

VI_SLEEP=5
MYDATE=`date +%Y%m%d%H%M%S`
PROJECT_PATH=`pwd`
LIST_OF_FILES="FilesToGC/$MYDATE/FilesToGC_$MYDATE.txt"
BSNM_OF_FILES="FilesToGC/$MYDATE/BSNMsToGC_$MYDATE.txt"
FNLS_OF_FILES="FilesToGC/$MYDATE/FNLSsToGC_$MYDATE.txt"

mkdir -p FilesToGC/$MYDATE/$MYSRC1
mkdir -p FilesToGC/$MYDATE/$MYSRC2

echo -e "\nThe script will open a "VI Editor" after your confirmation.
Input the files to compare with the absolute path.

Once done. save (wq!) it.\n"

read -p "Press 'ENTER KEY' to continue ..."

vi $LIST_OF_FILES
if [[ ! -s $LIST_OF_FILES ]]; then echo "$LIST_OF_FILES is empty..."; exit 1; fi

SFTP_COMMANDS=$(mktemp)
while IFS= read -r line; do echo "get $line">>$SFTP_COMMANDS; done<$LIST_OF_FILES

cd $PROJECT_PATH/FilesToGC/$MYDATE/$MYSRC1/
sftp $MYSRC1 <<EOF
`cat $SFTP_COMMANDS`
exit
EOF

cd $PROJECT_PATH/FilesToGC/$MYDATE/$MYSRC2/
sftp $MYSRC2 <<EOF
`cat $SFTP_COMMANDS`
exit
EOF

rm "$SFTP_COMMANDS"

#create a basename for the files
cd $PROJECT_PATH
while IFS= read -r line; do basename $FILE $line>>$BSNM_OF_FILES; done<$LIST_OF_FILES

#List files successfully transferred
cd $PROJECT_PATH
ls FilesToGC/$MYDATE/* | egrep -v "^FilesToGC|^$|BSNMsToGC*.txt|FilesToGC*.txt" | uniq > $FNLS_OF_FILES

#List files failed to transfer
cd $PROJECT_PATH

# List of files failed to transfer
echo -e "\n=========================================="
echo "LIST OF FILES FAILED TO TRANSFER"
echo -e "==========================================\n"

cat $LIST_OF_FILES | egrep -v "`cat $FNLS_OF_FILES | tr "\n" "|"`ExtraEntryOnly"

# Comparison of files
echo -e "\n=========================================="
echo "COMPARE FILES"
echo -e "==========================================\n"

for bsnm_fls in `cat $FNLS_OF_FILES`
do
	echo "### CHECKSUM OF $bsnm_fls ###"
	echo "$MYSRC1: `cksum FilesToGC/$MYDATE/$MYSRC1/$bsnm_fls | awk '{print $1}'` AND $MYSRC2: `cksum FilesToGC/$MYDATE/$MYSRC2/$bsnm_fls | awk '{print $1}'`"
	echo ""
	echo "### DIFF OF $MYSRC1:$bsnm_fls vs $MYSRC2:$bsnm_fls ###"
	echo "`sdiff -s FilesToGC/$MYDATE/$MYSRC1/$bsnm_fls FilesToGC/$MYDATE/$MYSRC2/$bsnm_fls`"
	echo ""
done

#
# Archiving of artifacts
#
echo -e "\n=========================================="
echo "ARTIFACTS ARCHIVAL"
echo -e "==========================================\n"

cd $PROJECT_PATH/FilesToGC/
find $PROJECT_PATH/FilesToGC/ -maxdepth 1 -type d -name $MYDATE -exec bash -c "tar -czf {}.tar {}; rm -rf {}" \;
if [[ $? = 0 ]] && [[ -e $PROJECT_PATH/FilesToGC/$MYDATE.tar ]]; then echo -e "\n$PROJECT_PATH/FilesToGC/$MYDATE.tar was created.\nSuccessfully archived the artifacts...\n"; else echo -e "\nFailed to archive the artifacts...\n"; fi
