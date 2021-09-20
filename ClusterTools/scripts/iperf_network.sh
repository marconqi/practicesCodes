#!/usr/bin/env bash

if [[ $1 == 'x' ]]; then
  pkill iperf3
  pkill ib_read_bw
  echo "iperf3, ib_read_bw processes stop."
  exit 0
fi

echo "Running iperf3 demons: $(pidof iperf3)";

iperf3 -s -D -p 5201
iperf3 -s -D --file /mnt/beegfs/metadata/tmp/1mb.file -p 5202
#iperf3 -s -D --file /mnt/beegfs/storage/tmp/1mb.file -p 5203
#iperf3 -s -D --file /mnt/beegfs/metadata/tmp/10mb.file -p 5212
#iperf3 -s -D --file /mnt/beegfs/storage/tmp/10mb.file -p 5213
#iperf3 -s -D --file /mnt/beegfs/metadata/tmp/100mb.file -p 5222
#iperf3 -s -D --file /mnt/beegfs/storage/tmp/100mb.file -p 5223

port='mlx4_0'
if [[ "$HOSTNAME" == 'biko' ]]; then
   echo "boko"
  port='mlx5_1'
fi

ib_read_bw --ib-dev="$port" &

echo "Running ib_read_bw in bg $port: $(pidof ib_read_bw)";
