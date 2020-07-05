CONSOLE="/dev/tty1"
UPATH="/opt/status"
DNSS=("10.0.0.10" "10.0.0.31" "10.0.0.62")
PING_TEST='8.8.8.8'
PING_COUNT='30'
BAD='\033[0;31m'
WAR='\033[1;33m'
OK='\033[1;32m'
CONSOLEWITH='60'

# WEATHER EXTENSION
# I'm gonna use the openweathermap.org api to get the weather data.

OWM_AK=''                   #https://home.openweathermap.org/api_keys
OWM_CITYID='3435910'        #https://openweathermap.org/city/3435910
