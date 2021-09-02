#!/usr/bin/env python


import os
import subprocess
import string
import re



def main():
    # command
    # qstat
    p = subprocess.Popen(['/opt/pbs/bin/qstat'],stdout=subprocess.PIPE,
                                    stderr=subprocess.PIPE)
    out, err = p.communicate()
    out = str(out) 
    outlines = out.split("\n")

    user = {}
    
    for i in range(2,len(outlines)-1):
        line = outlines[i]
        temp = re.split(r"\s+",line)
        
        userName = temp[2]
        jobState = temp[4]
        if userName in user.keys():
            if jobState == "Q":
                user[userName]["Q"] += 1
            elif jobState == "R":
                user[userName]["R"] += 1
            else:
                user[userName]["O"] += 1
        else:
            user.update({userName:{"Q":0,
                                    "R":0,
                                    "O":0}})
            if jobState == "Q":
                user[userName]["Q"] += 1
            elif jobState == "R":
                user[userName]["R"] += 1
            else:
                user[userName]["O"] += 1
        
    for items in user:
        print "node_cluster_jobs{user=\""+items+"\", state=\"Q\"} ", user[items]["Q"]
        print "node_cluster_jobs{user=\""+items+"\", state=\"R\"} ", user[items]["R"]
        print "node_cluster_jobs{user=\""+items+"\", state=\"O\"} ", user[items]["O"]
    #for pname,size in zip(name,size):
    #    print "node_user_disk_usage{user=\""+pname+"\"} "+size


if __name__ == "__main__":
    main()
