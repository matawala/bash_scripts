#!/bin/bash
LIST_OF_FILES=temp.txt
vi $LIST_OF_FILES

SFTP_COMMANDS=$(mktemp)
while IFS= read -r line; do echo "get $line">>$SFTP_COMMANDS; done<$LIST_OF_FILES

echo $SFTP_COMMANDS

