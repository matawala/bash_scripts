#!/bin/bash

Generate_Rpt () {
   for svr in $final_list
   do
       echo "### $svr ###"
   done
}

ChkJBossStat () {
   
   echo "$ChkType"
   for jb in `cat Nodes.lst`
   do
       echo "### $jb ###"
   done
}

Printnodelist () {
echo -e "Enter IPs separated by space.

convergentjbossprod1  - 10.51.22.22
convergentjbossprod2  - 10.51.22.230
convergentjbossprod3  - 10.51.22.28
convergentjbossprod4  - 10.51.22.100
convergentjbossprod5  - 10.51.22.221
convergentjbossprod6  - 10.51.22.200
convergentjbossprod7  - 10.51.22.24
convergentjbossprod8  - 10.51.22.199
convergentjbossprod9  - 10.51.22.211
convergentjbossprod10 - 10.51.22.212
convergentjbossprod11 - 10.51.22.71
convergentjbossprod12 - 10.51.22.72
convergentjbossprod13 - 10.51.22.93
convergentjbossprod14 - 10.51.22.94
convergentjbossprod15 - 10.51.22.95
convergentjbossprod16 - 10.51.22.96
convergentjbossprod17 - 10.51.22.97
convergentjbossprod18 - 10.51.22.98
convergentjbossprod19 - 10.51.22.5
convergentjbossprod20 - 10.51.22.6
convergentjbossprod21 - 10.51.22.7
convergentjbossprod22 - 10.51.22.250
convergentjbossprod23 - 10.51.22.251
convergentjbossprod24 - 10.51.22.252
convergentjbossprodBO1 - 10.51.22.57

e.g. : 192.168.0.1 192.168.0.2\n"
}

ChkJBossStat_custom () {
	Printnodelist
	read CustomIPs
        final_list=$CustomIPs
	Generate_Rpt
}


if [[ $1 < "1" ]]; then
  echo "Usage: sh $0 {all|custom}"
  exit 0
else
  case $1 in
     all) ChkType="all"
	final_list="10.51.22.22 10.51.22.230 10.51.22.28 10.51.22.100 10.51.22.221 10.51.22.200 10.51.22.24 10.51.22.199 10.51.22.211 10.51.22.212 10.51.22.71 10.51.22.72 10.51.22.93 10.51.22.94 10.51.22.95 10.51.22.96 10.51.22.97 10.51.22.98 10.51.22.5 10.51.22.6 10.51.22.7 10.51.22.250 10.51.22.251 10.51.22.252 10.51.22.57"
	Generate_Rpt
	;;
     custom) ChkType="custom"
       ChkJBossStat_custom
       ;;
     *) echo "Usage: sh $0 {all|custom}"
       ;;
  esac
fi
