#!/bin/bash

export MUNGEUSER=494
groupadd -g $MUNGEUSER munge
useradd -m -c "Munge Emporium" -d /var/lib/munge -u $MUNGEUSER -g munge -s /sbin/nologin munge
export SLURMUSER=501
groupadd -g $SLURMUSER slurm
useradd -m -c "Slurm workload manager" -d /var/lib/slurm -u $SLURMUSER -g slurm -s /bin/bash slurm
