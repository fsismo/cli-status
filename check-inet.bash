#!/bin/bash
source ./config.bash

PING=$(ping -c $PING_COUNT -q $PING_TEST)
PING_LOST=$(echo "$PING" |grep 'packet loss' | cut -d ',' -f 3 | cut -d '%' -f 1 | xargs)
PING_AVG=$(echo "$PING" |grep avg | cut -d '/' -f 5 | cut -d '.' -f 1)

if [ "$PING_LOST" -lt "5" ] && [ -n "$PING_LOST" ] && [ "$PING_AVG" -lt "30" ] && [ -n "$PING_AVG" ]; then
    RTN_INET_C="$OK"
elif ([ "$PING_LOST" -lt "15" ] && [ -n "$PING_LOST" ]) && ([ "$PING_AVG" -lt "200" ] && [ -n "$PING_AVG" ] ) ; then
    RTN_INET_C="$WARN"
else
    RTN_INET_C="$BAD"
fi

echo "RTN_INET_C=\"$RTN_INET_C\"" > /dev/shm/STS-INET
echo "RTN_INET_MSG=\"PL $PING_LOST% - PA ${PING_AVG}ms\"" >> /dev/shm/STS-INET