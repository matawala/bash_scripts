#!/bin/sh
clear
currentdatetime=$(date +%Y%m%d%H%M)
deployCDT_lst="deploy"$currentdatetime".lst"
deployCDT_err="deploy"$currentdatetime".err"

ls deploy | tr " " "\n" >deployCDT_lst

#list files for deployment
echo "list files for deployment"
ls -lt deploy/

bkp_fls_4_dplymnt () {
echo "list backup files for deployment"
for fls in `cat deployCDT_lst`
do
subfls=${fls: -3}
	case $subfls in
		txt)
			if [ -f /tmp/data/$subfls/$fls ]
			then
				cp -ip deploy/$fls /tmp/data/$subfls/$fls_`date +%Y%m%d`bkp
				ls -lt /tmp/data/$subfls/$fls /tmp/data/$subfls/$fls_`date +%Y%m%d`bkp
			else
				echo "/tmp/data/$subfls/$fls doesn't exist. backup is N/A."
			fi
			;;
		scr)
			if [ -f /tmp/data/$subfls/$fls ]
			then
				cp -ip deploy/$fls /tmp/data/$subfls/$fls_`date +%Y%m%d`bkp
				ls -lt /tmp/data/$subfls/$fls /tmp/data/$subfls/$fls_`date +%Y%m%d`bkp
			else
				echo "/tmp/data/$subfls/$fls doesn't exist. backup is N/A."
			fi
			;;
		sql)
			if [ -f /tmp/data/$subfls/$fls ]
			then
				cp -ip deploy/$fls /tmp/data/$subfls/$fls_`date +%Y%m%d`bkp
				ls -lt /tmp/data/$subfls/$fls /tmp/data/$subfls/$fls_`date +%Y%m%d`bkp
			else
				echo "/tmp/data/$subfls/$fls doesn't exist. backup is N/A."
			fi
			;;
		*)
			echo "$fls" >>$deployCDT_err
			;;
	esac
done
}

read -p "\nProceed to backup? [y/Y] : " proCd

if [ "$proCd" = "Y" ] || [ "$proCd" = "y" ]
then
	clear
	bkp_fls_4_dplymnt
else
	echo "Exit in 3 seconds ..."
	sleep 3
	exit 0;
fi





