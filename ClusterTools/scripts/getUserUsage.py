#!/usr/bin/env python


import os
import subprocess
import string
import re


# /usr/lpp/mmfs/bin/mmrepquota -u --block-size G gpfs0:home

def main():
    # command
    # mmdf gpfs0 --block-size auto
    p = subprocess.Popen(['/usr/lpp/mmfs/bin/mmrepquota','-u','--block-size','G','gpfs0:home'],stdout=subprocess.PIPE,
                                    stderr=subprocess.PIPE)
    out, err = p.communicate()
    out = str(out) 
    outlines = out.split("\n")
    name = []
    size = []
    for line in outlines:
        if "USR" in line:
            temp = re.split(r"\s+",line)
            name.append(temp[0])
            size.append(temp[3])

    for pname,size in zip(name,size):
        print "node_user_disk_usage{user=\""+pname+"\"} "+size


if __name__ == "__main__":
    main()