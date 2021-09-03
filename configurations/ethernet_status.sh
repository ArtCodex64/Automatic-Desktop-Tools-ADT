#!/bin/bash

IFACE=$(/usr/sbin/ifconfig | grep eth0 | awk '{print $1}' | tr -d ':')
IFACE1=$(/usr/sbin/ifconfig | grep enp0s3 | awk '{print $1}' | tr -d ':')

if [[ $IFACE == "eth0" ]];then
  echo "%{F#2495e7} %{F#ffffff}$(/usr/sbin/ifconfig eth0 | grep "inet " | awk '{print $2}')%{u-}"
elif [[ $IFACE1 == "enp0s3" ]];then
  echo "%{F#2495e7} %{F#ffffff}$(/usr/sbin/ifconfig enp0s3 | grep "inet " | awk '{print $2}')%{u-}"
else
  echo "%{F#2495e7}¿ WTF ?%{u-}"
fi
