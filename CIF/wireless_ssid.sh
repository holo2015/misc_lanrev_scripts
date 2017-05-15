#!/bin/bash

services=$(networksetup -listnetworkserviceorder | grep 'Hardware Port')
currentservice=""
while read line; do
    sname=$(echo $line | awk -F  "(, )|(: )|[)]" '{print $2}')
    sdev=$(echo $line | awk -F  "(, )|(: )|[)]" '{print $4}')
#    echo "Current service: $sname, [$sdev]"
    if [ -n "$sdev" ]; then
        ifconfig $sdev 2>/dev/null | grep 'status: active' > /dev/null 2>&1
        rc="$?"
        if [ "$rc" -eq 0 ]; then
            currentservice="$sname"
        break
        fi  
    fi  
done <<< "$(echo "$services")"

if [[ $currentservice = "Wi-Fi" ]]; then
    networksetup -getairportnetwork $sdev | awk -F "Current Wi-Fi Network: " '{print $2}'
fi
