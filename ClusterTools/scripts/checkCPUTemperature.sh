#!/bin/bash

z=$(/sbin/ipmi-sensors | grep CPU)
    #echo $(awk '{print "cpu_temperature{device=\"cpu\",cpu=\"1\"},$8}');
#     echo $(awk '{print $7$8}')
t=$(echo $z | awk '{print $8}')

echo cpu_temperature\{device=\"cpu\",cpu=\"1\"\}  $t
for i in 0 1; do echo ib_card_temperature\{device=\"mlx5_$i\", ib=\"$i\"\} `mget_temp -d mlx5_$i` ; done

