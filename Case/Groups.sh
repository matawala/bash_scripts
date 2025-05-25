#!/bin/bash

grp=""

printgroups () {
   echo $grp
   for svr in `grep ^$grp Groups.lst | awk '{ print $2 }' | tr "\n" " "`
   do
	   echo "### $svr ###"
   done
}

case $1 in
   all) grp=All
        printgroups
        ;;
   batch1) grp=AllBtch1
        printgroups
        ;;
   batch2) grp=AllBtch1
        printgroups
        ;;
   custom) read -p "Enter the list of IP Address. separate with space." custom_svr

	;;
   *) echo "Usage: sh $0 {all|batch1|batch2|custom}";
   ;;
esac
