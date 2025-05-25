#!/bin/bash

# Created by SysAd Bong
# 20241214 - Added functions
# 20250112 - Created custom report
# 20250322 - Added Batches
# 20250508 - Add functionality to check port 9990

mylogfile=Logs/CheckJBossStatus_`date +%Y%m%d_%H%M%S`.log
JBOSS_PORT=9990

PreChecks () {

#
# Perform prechecks
#
echo -e "\n========================================================="
echo -e "Initializing Pre-checks : Checking JBOSSPORT ($JBOSS_PORT) if listening"
echo -e "=========================================================\n"

	for svr in $final_list
	do
		ssh $svr 'echo "### `uname -n` ###"; \
		if [[ -n `netstat -an | grep 9990` ]];then echo -e "JBOSS PORT : \e[32mLISTENING\e[0m"; else echo -e "JBOSS PORT : \e[31mNOT LISTENING\e[0m"; fi'
	done
#
# Ask confirmation to proceed JBOSS Checks
#

echo -e "\n========================================================="
echo -e "MAIN TASK : Checking JBOSS"
echo -e "=========================================================\n"
read -p "Do you want to proceed with JBOSS Checking [y/Y]?" ProceedJBossChecking
if [[ $ProceedJBossChecking == "y" ]] || [[ $ProceedJBossChecking == "Y" ]];
then
	Generate_Rpt
else
	echo "Invalid response or the user choosed NOT to proceed."
	sleep 5
	exit 0
fi	
}

Generate_Rpt () {
	for svr in $final_list
	do
		ssh $svr 'echo "### `uname -n` ###"; \
		echo "Checking Enabled timestamp for all deployments";
		/opt/webadm/EAP-7.3.0/bin/jboss-cli.sh --connect --timeout=60000 --commands="/deployment=*:read-resource(include-runtime=true)" | grep enabled-timestamp; \
		echo ""; \
		/opt/webadm/EAP-7.3.0/bin/jboss-cli.sh --connect --controller=localhost:9990 --timeout=60000 --commands=deployment\ info; \
		echo ""'
	done | tee -a $mylogfile

echo "========================"
echo "Checking for failures..."
echo "========================"
cat $mylogfile | egrep -i "###|fail"
echo -e "\nLogfile location: $mylogfile\n"
}

Printnodelist () {
echo -e "Hostname               - IP Address
------------------------------------
convergentjbossprod1   - 10.51.22.22
convergentjbossprod2   - 10.51.22.24
convergentjbossprod3   - 10.51.22.28
convergentjbossprod4   - 10.51.22.100
convergentjbossprod5   - 10.51.22.199
convergentjbossprod6   - 10.51.22.200
convergentjbossprod7   - 10.51.22.221
convergentjbossprod8   - 10.51.22.230
convergentjbossprod9   - 10.51.22.211
convergentjbossprod10  - 10.51.22.212
convergentjbossprod11  - 10.51.22.71
convergentjbossprod12  - 10.51.22.72
convergentjbossprod13  - 10.51.22.93
convergentjbossprod14  - 10.51.22.94
convergentjbossprod15  - 10.51.22.95
convergentjbossprod16  - 10.51.22.96
convergentjbossprod17  - 10.51.22.97
convergentjbossprod18  - 10.51.22.98
convergentjbossprod19  - 10.51.22.5
convergentjbossprod20  - 10.51.22.6
convergentjbossprod21  - 10.51.22.7
convergentjbossprod22  - 10.51.22.250
convergentjbossprod23  - 10.51.22.251
convergentjbossprod24  - 10.51.22.252
convergentjbossprodBO1 - 10.51.22.57

Please enter IP Addresses (separated by space. e.g. 192.168.0.1 192.168.0.2 ) \n"
}

ChkJBossStat_custom () {
	Printnodelist
	read -p ">> " CustomIPs
        final_list=$CustomIPs
	#Generate_Rpt
	PreChecks
}


if [[ $1 < "1" ]]; then
  echo "Usage: sh $0 {all|batch1|batch2|batch3|custom}"
  exit 0
else
  case $1 in
     all) ChkType="all"
	final_list="10.51.22.22 10.51.22.230 10.51.22.28 10.51.22.100 10.51.22.221 10.51.22.200 10.51.22.24 10.51.22.199 10.51.22.211 10.51.22.212 10.51.22.71 10.51.22.72 10.51.22.93 10.51.22.94 10.51.22.95 10.51.22.96 10.51.22.97 10.51.22.98 10.51.22.5 10.51.22.6 10.51.22.7 10.51.22.250 10.51.22.251 10.51.22.252 10.51.22.57"
	#Generate_Rpt
	PreChecks
	;;
     batch1) ChkType="batch1"
         final_list="10.51.22.22"
         #Generate_Rpt
	 PreChecks
        ;;
     batch2) ChkType="batch2"
         final_list="10.51.22.24 10.51.22.28 10.51.22.100 10.51.22.95 10.51.22.96 10.51.22.97 10.51.22.98 10.51.22.211 10.51.22.71 10.51.22.5 10.51.22.6 10.51.22.7"
         #Generate_Rpt
	 PreChecks
        ;;
     batch3) ChkType="batch3"
         final_list="10.51.22.199 10.51.22.200 10.51.22.221 10.51.22.230 10.51.22.212 10.51.22.72 10.51.22.93 10.51.22.94 10.51.22.250 10.51.22.251 10.51.22.252 10.51.22.57"
         #Generate_Rpt
	 PreChecks
        ;;
     custom) ChkType="custom"
       ChkJBossStat_custom
       ;;
     *) echo "Usage: sh $0 {all|batch1|batch2|batch3|custom}"
       ;;
  esac
fi
