#!/bin/bash

#############################
#############################
# BASH STATUS HELP 
# You should have isntalled "figlet" and the font Big-Money-nw
# > sudo apt install figlet wget jq
# > sudo wget https://raw.githubusercontent.com/xero/figlet-fonts/master/Big%20Money-nw.flf -O /usr/share/figlet/Big-Money-nw.flf 
# > sudo wget https://raw.githubusercontent.com/xero/figlet-fonts/master/ANSI%20Shadow.flf -O /usr/share/figlet/ANSI-Shadow.flf
#############################
#############################

source ./config.bash

function FLIGET {
	/usr/bin/figlet -f ANSI-Shadow -p -c -w $CONSOLEWITH $1 | awk 'NF'
}
function FLIGETMSG {
	/usr/bin/figlet -f small -n -c -w $CONSOLEWITH "$1" | awk 'NF'
}
function CHECK_DNS {
	source ./check-dns.bash
}



mkdir -p /var/run/status/

echo $$ > /var/run/status/status.pid
while [ 1 ]
do
	if [ $(date +"%S") -le "10" ]; then
		$UPATH/check-inet.bash &
		$UPATH/check-dns.bash &
		$UPATH/check-weather.bash &
	fi	
	
	/usr/bin/clear > $CONSOLE
	
	#SHOW TIME
	echo -e "$OWM_COLOR" > $CONSOLE
	FLIGET $(date +"%H:%M") > $CONSOLE

	#PRINT WHEATHER
	if [ -f /dev/shm/STS-WEATHER ]; then
		source /dev/shm/STS-WEATHER
		FLIGETMSG "$RTN_WEATHER_CITY" > $CONSOLE
		echo -e "\n" > $CONSOLE
		FLIGET "$RTN_WEATHER_TEMP" > $CONSOLE
		FLIGET "$RTN_WEATHER_MAIN" > $CONSOLE
	fi

	#PRINT DNS STATUS
	if [ -f /dev/shm/STS-DNS ]; then
		source /dev/shm/STS-DNS
		echo -e "$RTN_DNS_C \n" > $CONSOLE
		FLIGET "DNS" > $CONSOLE
		[ -n "$RTN_DNS_MSG" ] && FLIGETMSG "$RTN_DNS_MSG" > $CONSOLE		
	fi

	#PRINT INET STATUS
	if [ -f /dev/shm/STS-INET ]; then
		source /dev/shm/STS-INET
		echo -e "$RTN_INET_C \n"  > $CONSOLE
		FLIGET "INET" >  $CONSOLE
		FLIGETMSG "$RTN_INET_MSG"  > $CONSOLE
	fi
	sleep 10
done
