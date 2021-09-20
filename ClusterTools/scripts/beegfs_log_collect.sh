#!/bin/bash

# This script collects logs from BeeGFS servers to support troubleshooting.
# last update 19.07.2019, 11:45


function print_help {
    echo "
Usage:
-h          Print this help message
-p <path>   Full path to the mount point in multimount clients
" >&2
}


parameter=""
parameter2=""

# parse the options
while getopts ":hp:" opt ; do
    case "$opt" in
        h)  print_help ; exit
            ;;

        p)  if ! [[ -d "$OPTARG" ]] ; then
                echo "ERROR: the mount point \"$OPTARG\" doesn't exist." >&2
                exit 1
            fi
            parameter="--mount=$OPTARG"
            parameter2="-p $OPTARG"
            ;;

        :)  echo "ERROR: option \"-$OPTARG\" requires an argument." >&2
            print_help ; exit 1
            ;;

        *)  echo "ERROR: unknown option: \"-$OPTARG\"" >&2
            print_help ; exit 1
    esac
done


if ! type "tar" &> /dev/null; then
  echo 'ERROR: Command "tar" not found, please install it.\n' >&2
  exit 1
fi

if ! type "xz" &> /dev/null; then
  echo 'ERROR: Command "xz" not found, please install it.\n' >&2
  exit 1
fi


version="1.0.10"
hostname=$(hostname)
pathname=beegfs-support-$hostname-$(date +%d%m%Y%H%M)
work_dir=/tmp/$pathname
tar_ball=$work_dir.tar
compressed=$tar_ball.xz
command_output=$work_dir/commands.out


commands1=( )

if which beegfs-ctl &> /dev/null ; then
    # assume that if beegfs-ctl is present, the other commands are too
    commands1+=(
        "beegfs-df $parameter2"
        "beegfs-net"
        "beegfs-check-servers $parameter2"
		"beegfs-ctl --liststoragepools $parameter"
        "beegfs-ctl --listmirrorgroups --nodetype=storage $parameter"
		"beegfs-ctl --listtargets --mirrorgroups --nodetype=storage --state –longnodes –spaceinfo --pools $parameter"
        "beegfs-ctl --listmirrorgroups --nodetype=metadata $parameter"
        "beegfs-ctl --listtargets --mirrorgroups --nodetype=meta --state –longnodes –spaceinfo --pools $parameter"
        "beegfs-ctl --listnodes --nodetype=management --nicdetails --route --showversion $parameter"
        "beegfs-ctl --listnodes --nodetype=metadata --nicdetails --route --showversion $parameter"
        "beegfs-ctl --listnodes --nodetype=storage --nicdetails --route --showversion $parameter"
        "beegfs-ctl --listnodes --nodetype=client --nicdetails --route --showversion $parameter"
		"beegfs-ctl --listnodes --ping --nodetype=management --pingretries=30"
		"beegfs-ctl --listnodes --ping --nodetype=meta --pingretries=30"
		"beegfs-ctl --listnodes --ping --nodetype=storage --pingretries=30"
		"beegfs-ctl --getquota --defaultlimits $parameter"
		"beegfs-ctl --getentryinfo --verbose /mnt/beegfs"
        )
fi

if which fhgfs-ctl &> /dev/null ; then
    # assume that if fhgfs-ctl is present, the other commands are too
    commands1+=(
        "fhgfs-df"
        "fhgfs-net"
        "fhgfs-check-servers"
        "fhgfs-ctl --listnodes --details --nodetype=metadata"
        )
fi


commands2=(
  "timedatectl"
  "uptime -s"
  "uname -a" 
  "df -h"
  "df -ih"
  "mount"
  "showmount --all"
  "fdisk -l"
  "lsblk"
  "zpool status -v"
  "zdb"
  "zfs list"
  "zpool get all"
  "zfs get all"
  "netstat -lptu"
  "ifconfig"
  "route -n"
  "ip a"
  "ip route"
  "ip rule"
  "ip route show table all"
  "ibstatus"
  "opainfo"
  "ps -ef"
  "service --status-all"
  "systemctl --all --state=failed"
  "ls -lisa /var/crash"
  "ls -lisa /sys/block/*"
  "crm configure show xml"
  "crm status"
  "drbdadm status"
  "yum list installed"
  "dpkg -l"
  "lsmod"
)

paths=(
  /etc/apt/sources.list
  /etc/beegfs
  /etc/corosync
  /etc/exports
  /etc/fhgfs
  /etc/fstab
  /etc/grafana
  /etc/hosts
  /etc/influxdb
  /etc/iproute2/rt_tables
  /etc/issue
  /etc/pacemaker
  /etc/rc.d/rc.local
  /etc/rdma
  /etc/security
  /etc/selinux/config
  /etc/sysconfig/network*
  /etc/yum.repos.d
  /etc/ntp.conf
  /proc/cpuinfo
  /proc/meminfo
  /proc/sys/vm
  /sys/block/*/queue/max_sectors_kb
  /sys/block/*/queue/nr_requests
  /sys/block/*/queue/read_ahead_kb
  /sys/block/*/queue/scheduler
  /sys/kernel/mm/transparent_hugepage
  /var/log/beegfs*
  /var/log/cluster
  /var/log/dmesg*
  /var/log/fhgfs*
  /var/log/grafana
  /var/log/influxdb
  /var/log/messages*
  /var/log/syslog*
  /var/log/yum*
  /var/log/sa
  /var/tmp/beeond.tmp
)

printf "\nCollecting support data from host: $hostname\n"

rm -rf $work_dir $tar_ball $compressed
mkdir $work_dir

printf "\nExecuting commands...\n"

printf "Script version: %s\n" "$version" >> $command_output
printf "Host: %s\n" "$hostname" >> $command_output
printf "Date: %s\n\n" "$(date)">> $command_output


running_services=0

# check the open IB FS for all running beegfs-storage and beegfs-meta
for service in beegfs-{storage,meta} ; do
    for pid in $(pidof /opt/beegfs/sbin/$service) ; do
        echo -e "\nOpen InfiniBand file descriptors for $service [PID $pid]:" >> $command_output
        ls -lahR /proc/$pid/fd/* | grep -i inf | wc -l >> $command_output
        running_services=1
    done
done

(( running_services )) || echo -e "\nNo running BeeGFS storage or meta service found." >> $command_output


for command in "${commands1[@]}"
do
  printf "  $command\n"
  printf "\n\n-------------------------\n%s\n\n" "$command" >> $command_output
  eval $command &>> $command_output
done

unset command

for command in "${commands2[@]}"
do
  printf "  $command\n"
  printf "\n\n-------------------------\n%s\n\n" "$command" >> $command_output
  eval $command &>> $command_output
done


cd /tmp

for path in "${paths[@]}"
do
  if [[ -e "$path" ]]
  then
    printf "  %s\n" "$path"
    cp -r --parents "$path" "$pathname" &> /dev/null
    # Chmods are necessary to fix the permissions of the various parent
    # directories in the path (--no-preserve=mode only works for the final
    # member of the path, not the parent dirs!).
    # *Repeated* chmods are necessary to avoid having the permissions from
    # one copied path block the copy of another path sharing some parent dirs.
    chmod -R u+rw "$pathname"
  fi
done


printf "\nCompressing files...\n"
tar --mode="u+rw" -cf $tar_ball $pathname

xz -9 $tar_ball
rm -rf $work_dir


printf "\nGenerated file:"
ls -l $compressed
echo ""
echo -e "Please upload the following file to ThinkParQ (RT) for analysis:\n  $compressed"
echo ""

