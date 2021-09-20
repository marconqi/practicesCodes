#! /bin/bash

# Reconfigure the 100 GbE interface for faster data transfers.  ACD Mar 2021

# This script is called from the systemctl service: 100gether

if [ "$1" == "-h" ] ; then
    echo "Usage: `basename $0` [-h | -def | -sta]"
    exit
fi

#  *** Insert the names of the 100 GbE interfaces for this system ***

INTERFACES="enp65s0 enp129s0"

DEFAULT="FALSE"
if [[ "$1" == "-def" ]] ; then
    DEFAULT=TRUE
    TXQUELEN=1000
    LRO="off"
    RTXVAL=1024
    shift
else
    TXQUELEN=20000
    LRO="on"
    RTXVAL=8192
fi

STATUS="FALSE"
if [[ "$1" == "-sta" ]] ; then
    STATUS="TRUE"
    shift
fi

for interface in ${INTERFACES} ; do
    if [[ "${STATUS}" == "TRUE" ]] ; then
        echo -e " Current tuning state for interface ${interface}\n"
        ip link show ${interface}
        echo -e "\nFeatures for ${interface} :"
        ethtool -k ${interface} | grep receive-offload
        echo
        ethtool -g ${interface}
        continue
    fi

    if [[ "${DEFAULT}" == "TRUE" ]] ; then
        echo " Setting default tuning for interface ${interface}"
    else
        echo " Setting enhanced tuning of interface ${interface}"
    fi

    # Increase the interface Transmission Queue Length

    /usr/sbin/ip link set ${interface} txqueuelen ${TXQUELEN}

    # Enaable Device Large Recieve Offload

    /usr/sbin/ethtool -K ${interface} lro ${LRO}

    # Increase transmit and receive buffers

    /usr/sbin/ethtool -G ${interface} rx ${RTXVAL} tx ${RTXVAL}

    # Update the sysctl network kernel settings - do this in /etc/sysctl.conf

done

exit 0
