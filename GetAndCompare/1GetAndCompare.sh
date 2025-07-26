#!/bin/bash

for sftpfiles in `cat mysftpfiles.txt`
do
	echo "### $sftpfiles ###"
	if [ -e SFTPFiles/1/$sftpfiles ]; 
	then 
		echo "$sftpfiles - exist on host1"; 
<<<<<<< HEAD
		#echo 'declare -A $sftpfiles1=([exist]="yes")'
		#echo ${$sftpfiles1[exist]}
=======
		echo 'declare -A $sftpfiles1=([exist]="yes")'
		echo ${$sftpfiles1[exist]}
>>>>>>> 5d575730544c9d08d7a4760d1f42459d02237827
	else 
		echo "$sftpfiles - don't exist on host1"; 
	fi
	if [ -e SFTPFiles/2/$sftpfiles ]; then echo "$sftpfiles - exist on host2"; else echo "$sftpfiles - don't exist on host2"; fi
done
