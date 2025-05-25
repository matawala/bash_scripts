#!/bin/bash
while IFS= read -r line
do
echo $line | awk -F ":" '{ print $1}'
done < userlist.txt
