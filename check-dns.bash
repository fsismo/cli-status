#!/bin/bash
source ./config.bash

RTN='DNS'
for DNS in "${DNSS[@]}"
do
    RESP=$(dig +short +timeout=1 www.google.com @$DNS|grep 'connection timed out')
    if [ -n "$RESP" ]; then
        RTN_DNS_MSG=$(echo -e "$RTN_DNS_MSG\n$DNS" | awk 'NF')
    fi
    #echo $DNS
done

if [ -z "$RTN_DNS_MSG" ]; then
    RTN_DNS_C="$OK"
else
    RTN_DNS_C="$BAD"
    RTN_DNS_A="1"
fi
RTN_DNS="$RTN"

echo "RTN_DNS_A=\"$RTN_DNS_A\"" > /dev/shm/STS-DNS
echo "RTN_DNS_C=\"$RTN_DNS_C\"" >> /dev/shm/STS-DNS
echo "RTN_DNS_MSG=\"$RTN_DNS_MSG\"" >> /dev/shm/STS-DNS