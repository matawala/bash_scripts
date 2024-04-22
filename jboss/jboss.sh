#!/bin/sh
clear
case $1 in
	stop)
		echo "JBoss Stopped ..."
		sleep 5
		exit
                ;;
	start)
		echo "JBoss Started ..."
		sleep 5
		exit
                ;;
	status)
		echo "JBoss Status ..."
		sleep 5
		exit
                ;;
	*)
		echo "Usage : ./jboss.sh stop|start|status"
		sleep 5
		exit
                ;;
esac
clear
