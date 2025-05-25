#!/bin/sh

read -p "Enter destination directory: " dest
mkdir -p $dest

echo -e "Enter the filenames with complete path.\nOpenning \"VI Editor\". Save (wq!) the files once done."
sleep 5
vi srcfiles.txt

for srcfl in `cat srcfiles.txt`; do echo "### $srcfl ###";cp -ip $srcfl $dest && echo "copied: $srcfl to $dest" || echo "failed to $srcfl to $dest"; done

