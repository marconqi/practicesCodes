#!/usr/bin/env python


import os
import subprocess
import string
import re, collections

def main():
    # command
    # mmdf gpfs0 --block-size auto
    p = subprocess.Popen(['/usr/lpp/mmfs/bin/mmdf','gpfs0','--block-size','auto'],stdout=subprocess.PIPE,
                                    stderr=subprocess.PIPE)
    out, err = p.communicate()
    out = str(out) 
    outlines = out.split("\n")
    name = []
    size = []
    for line in outlines:
        if "Disks" in line:
            temp = re.split(r"\s+",line)
            name.append(temp[4])
        elif "pool total" in line:
            temp = re.split(r"\s+",line)
            size.append(temp[3])
    for pname,size in zip(name,size):
        print "node_poolsize{pool=\""+pname+"\"} "+size[:-1]

    # this part to get the inode information.
    # the command. 
    # mmlsfileset gpfs0  -L
    p = subprocess.Popen(['/usr/lpp/mmfs/bin/mmlsfileset','gpfs0','-L'],stdout=subprocess.PIPE,
                                    stderr=subprocess.PIPE)
    out, err = p.communicate()
    out = str(out) 
    outlines = out.split("\n")
    name = []
    size = []
    for line in outlines:
        if "root" in line:
            temp = re.split(r"\s+",line)
            name.append("root_total")
            size.append(temp[10])
            name.append("root_alloc")
            size.append(temp[11])
        elif "home" in line:
            temp = re.split(r"\s+",line)
            name.append("home_total")
            size.append(temp[10])
            name.append("home_alloc")
            size.append(temp[11])
    for pname,size in zip(name,size):
        print "node_fileset{inode=\""+pname+"\"} "+size

if __name__ == "__main__":
    main()