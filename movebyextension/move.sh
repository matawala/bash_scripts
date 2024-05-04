#!/bin/sh


#listing all files under deploy
clear
echo "List of files for deployment"
ls -lt ./deploy


mkbkp () {
for fls in `ls deploy/* | tr " " "\n"`
do
echo mkbackup for $fls
done
}

mkbkp
