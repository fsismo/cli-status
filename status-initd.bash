#!/bin/bash
cd /opt/status  
if [ "$1" != "" ]; then
	if [ "$1" == "start" ]; then
		echo "Starting Status Services"
		./status.bash &
	elif [ "$1" == "restart" ]; then
		echo "Stoping Status Services"
		kill $(cat /var/run/Status/Status.pid)
		rm /var/run/Status/Status.pid 
		sleep 5
		echo "Starting Status Services"
		./status.bash &
	elif [ "$1" == "stop" ]; then
		echo "Stoping Status Services"
		kill $(cat /var/run/Status/Status.pid)
		rm /var/run/Status/Status.pid 
	elif [ "$1" == "status" ]; then
		if [ -f '/var/run/Status/Status.pid' ]; then
			echo "The process is running"
			ps ax | grep $(cat /var/run/Status/Status.pid) | grep -v "grep" 
		else
			echo "The process is not running"
		fi
	else
		echo "Usage"
	fi
else
	echo "Usage"
fi
