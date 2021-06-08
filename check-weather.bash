#!/bin/bash
source ./config.bash
#echo "api.openweathermap.org/data/2.5/weather?id=$OWM_CITYID&appid=$OWM_AK&units=$OWM_UNITS"
WEATHER=$(curl -s "api.openweathermap.org/data/2.5/weather?id=$OWM_CITYID&appid=$OWM_AK&units=$OWM_UNITS")
RTN_WEATHER_TEMP=$(echo "$WEATHER" | jq -r '.main.temp')
RTN_WEATHER_CITY=$(echo "$WEATHER" | jq -r '.name')
RTN_WEATHER_MAIN=$(echo "$WEATHER" | jq -r '.weather[0].main')

echo "RTN_WEATHER_TEMP=\"$RTN_WEATHER_TEMP\"" > /dev/shm/STS-WEATHER
echo "RTN_WEATHER_MAIN=\"$RTN_WEATHER_MAIN\"" >> /dev/shm/STS-WEATHER
echo "RTN_WEATHER_CITY=\"$RTN_WEATHER_CITY\"" >> /dev/shm/STS-WEATHER
