#!/bin/bash
### BEGIN INIT INFO
# Provides:          CliStatus
# Required-Start:    $all
# Required-Stop:
# Default-Start:     2 3 4 5
# Default-Stop:
# Short-Description: Time and wheader on your display
### END INIT INFO
cd /opt/status  
source ./config.bash
if [ "$1" != "" ]; then
	if [ "$1" == "start" ]; then
		echo "Starting Status Services"
		./status.bash &
	elif [ "$1" == "restart" ]; then
		echo "Stoping Status Services"
		kill $(cat /var/run/status/status.pid)
		rm /var/run/status/status.pid 
		sleep 5
		echo "Starting Status Services"
		./status.bash &
	elif [ "$1" == "stop" ]; then
		echo "Stoping Status Services"
		kill $(cat /var/run/status/status.pid)
		clear > $CONSOLE
		rm /var/run/status/status.pid 
	elif [ "$1" == "status" ]; then
		if [ -f '/var/run/status/status.pid' ]; then
			echo "The process is running"
			ps ax | grep $(cat /var/run/status/status.pid) | grep -v "grep" 
		else
			echo "The process is not running"
		fi
	else
		echo "Usage"
	fi
else
	echo "Usage"
fi
