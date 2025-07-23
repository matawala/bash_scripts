#!/bin/bash

for sftpfiles in `cat mysftpfiles.txt`
do
	echo "### $sftpfiles ###"
	if [ -e SFTPFiles/1/$sftpfiles ]; then echo "$sftpfiles - exist on host1"; else echo "$sftpfiles - don't exist on host1"; fi
	if [ -e SFTPFiles/2/$sftpfiles ]; then echo "$sftpfiles - exist on host2"; else echo "$sftpfiles - don't exist on host2"; fi
done
