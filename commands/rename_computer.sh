#!/bin/sh
macaddress=`/sbin/ifconfig en0 | awk '/ether/ { gsub(":", ""); print $2 }' | cut -c 7-12`
compname="MAC-${macaddress}"
scutil --set LocalHostName ${compname}
scutil --set ComputerName ${compname}
echo ${compname}
