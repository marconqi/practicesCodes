#!/bin/bash

dmidecode -t slot | grep Bus | awk -F ' ' '{print $3}' > buslist
for bus in `sed -e "s/0000://g" buslist`;
do 
    echo $bus 
    lspci -vvnn | grep $bus
done
rm -rf buslist
