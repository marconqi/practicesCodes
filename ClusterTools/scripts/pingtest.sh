#!/bin/bash

echo `date` >> /root/log.of.ping
echo ping via 100gb >> /root/log.of.ping
ping -c 4 172.19.89.16 >> /root/log.of.ping 2>&1
echo -e "\t\t\t\t" >> /root/log.of.ping
echo `date` >> /root/log.of.ping
echo ping via 10gb >> /root/log.of.ping
ping -c 4 172.18.140.96 >> /root/log.of.ping 2>&1
echo Temperature of 100gb NUS is `/usr/bin/mget_temp -d /dev/mst/mt4115_pciconf0` >> /root/log.of.ping
echo `date` >> /root/log.of.ping 
echo -e "\t\t\t\t" >> /root/log.of.ping
echo ping hpc-dtn 100gb >> /root/log.of.ping
ping -c 4 172.19.89.13 >> /root/log.of.ping 2>&1
echo `date` >> /root/log.of.ping
echo "end of ping" >> /root/log.of.ping
