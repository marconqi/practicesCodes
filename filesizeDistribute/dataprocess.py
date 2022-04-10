#!/usr/bin/env python

import pandas as pd
import os

# Read the files in the home data directory

datafilelist = {}
for root, dirs, files in os.walk("data/scratchdist"):
    # datafilelist = files
    for file in files:
        if ("txt" in file or "csv" in file) and "gpfs" in file:
            temp = file.split("_")
            userid = temp[-2]+"_"+temp[-1][:-4]
            #print(userid)
            datafilelist[userid] = os.path.join(root, file) 
#  print(datafilelist)

datapd = pd.DataFrame()
# print(datapd.shape)
first = True
for key in datafilelist.keys():
    print(key)
    l,w = datapd.shape
    if first:
        datapd = pd.read_csv(datafilelist[key])
        datapd.drop("Accumulated size",axis=1,inplace=True)
        datapd.rename(columns={"Number":key},inplace=True)
        first = False
        continue
    else:
        if l == 0:
            continue
        temp = pd.read_csv(datafilelist[key])
        temp.drop("Accumulated size",axis=1,inplace=True)
        temp.rename(columns={"Number":key},inplace=True)
        tl,tw = temp.shape
        if l >= tl :
            datapd = datapd.merge(temp,on="Order",how="left")
        else:
            datapd = datapd.merge(temp,on="Order",how="right")

"""
datasize = pd.read_csv("./testdata/_gpfsnyu_scratch_jw6800.csv")
datasize.drop("Accumulated size",axis=1,inplace=True)
datasize.rename(columns={"Number":"jw6800"},inplace=True)
print(datasize.shape)

newone = pd.read_csv("./testdata/_gpfsnyu_home_al4951.txt")
newone.drop("Accumulated size",axis=1,inplace=True)
newone.rename(columns={"Number":"al4951"},inplace=True)
print(newone.shape)
# print(datasize.merge(newone,on="Order",how="left"))
"""
datapd.to_csv("scratchdir.csv",index=False)