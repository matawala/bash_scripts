i#!/bin/sh
clear
for fls in txt1.txt txt1.scr txt1.sql txt2.sql
do
echo $fls
subfls=${fls: -3}
echo $subfls
	case $subfls in
		txt)
			echo "the file is TXT file"
			;;
		scr)
			echo "the file is SCR file"
			;;
		sql)
			echo "the file is SQL file"
			;;
		*)
			echo "$fls" >>deploy_`date +%Y%m%d`.err
			;;
	esac
done

