#!/usr/bin/env python


import re
import pandas as pd
import os

# Qi Zhiguo
# collect the user's storage usage

# only to get the total usage
def getTotalUsage(filename):
    total = { "total":0,
            "used":0,
            "totalinodes":0,
            "usedinodes":0}

    # get time 
    tmp = re.split(r"\_",filename)
    tmp = re.split(r"\.",tmp[1])
    date = tmp[0]
    block = True
    with open(filename,'r') as f:
        for line in f:
            if "gpfs0" in line and block:
                tmp = re.split(r"\s+",line)
                total['total'] = tmp[1][:-1]
                total['used'] = tmp[2][:-1]
                block = False
                continue
            if "gpfs0" in line:
                tmp = re.split(r"\s+",line)
                total['totalinodes'] = tmp[1][:-1]
                total['usedinodes'] = tmp[2][:-1]
                break
                
    print("{},{},{},{},{}".format(date,total['total'],total['used'],total['totalinodes'],total["usedinodes"]))

if __name__ == "__main__":
    directory = "/Users/qizhiguo/Projects/mbidiskusagedata/2020"
    for root,dirs,files in os.walk(directory):
        for file in files:
            if file.endswith(".log"):
                getTotalUsage(os.path.join(root,file))
    # getTotalUsage("/Users/qizhiguo/Projects/practicesCodes/mbiStorageUsage/diskUsageMBI_2020-01-06.log")

"""
with open("diskUsageMBI_2020-01-06.log",'r') as logfile:
    lines = logfile.readlines()

print(len(lines))
print(lines[10:15])
"""