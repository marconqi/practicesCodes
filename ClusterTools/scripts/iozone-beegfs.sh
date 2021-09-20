#!/bin/bash

# /opt/iozone/bin/iozone -i 0 -i 1 -c -e -w -r 1m -t 8 -s $((2560/8))g -+n
#  /opt/iozone/bin/iozone -i 0 -i 1 -c -e -w -r 1m -t 2 -s $((2560/2))g -+n -+m /opt/iozone/nodes-list

work_dir=/mnt/beegfs/iozone
iozone_dir=/opt/iozone
nodes_file=${iozone_dir}/nodes-list
results_file=${iozone_dir}/result-`date +%Y%m%d%H%M`.log

cd ~
rm -rf ${work_dir}
mkdir ${work_dir}
echo "work dir: $work_dir"
export RSH=ssh
cd ${work_dir} || exit

for (( x=0; x <= 6; x++ )); do
 num_procs=$((2**${x}));
 header="processes: ${num_procs}"
 echo ${header}
 printf "\n\n\n${header}\n\n" >> ${results_file}
 ${iozone_dir}/bin/iozone -i 0 -i 1 -c -e -w -r 1m -t ${num_procs} \
 -s $((2560/${num_procs}))g -+n  >> ${results_file}
done