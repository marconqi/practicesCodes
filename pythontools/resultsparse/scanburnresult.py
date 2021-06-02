#!/bin/bash python

import os
import re
import pandas as pd
from pprint import pprint


def getGPUInfor(line):
    GPUinfo = {}
    summary = ''
#results = pd.DataFrame( columns=["process","Perf_1","Perf_1","Perf_1","Perf_1","err_1","err_2","err_3","err_4","tem1","tem2","tem3","tem4"])
    # print(re.split(r"\s+",line))
    if "GPU" in line and "UUID" in line:
        temp = re.split(r"\s+",line)
        gpuid = temp[1]
        gputype = temp[2]
        gpuuid = temp[4][:-1]
        if gpuid not in GPUinfo.keys():
            GPUinfo[gpuid] = { "GPU type": gputype,
                                "GPU UUID": gpuuid}
    elif "Gflop" in line and "errors" in line:
        # print(line)
        temp = re.split(r"\s+",line)
        process = temp[0][:-1]
        gpu1 = temp[3][1:]
        gpu2 = temp[7][1:]
        gpu3 = temp[11][1:]
        gpu4 = temp[15][1:]
        gpue1 = temp[18]
        gpue2 = temp[20]
        gpue3 = temp[22]
        gpue4 = temp[24]
        gput1 = temp[26]
        gput2 = temp[29]
        gput3 = temp[32]
        gput4 = temp[35]
        e1 = float(gpue1)
        if e1 != 0.0:
            return True
        # print("{},{},{},{},{},{},{},{},{},{},{},{},{}".format(process,gpu1,gpu2,gpu3,gpu4,gpue1,gpue2,gpue3,gpue4,gput1,gput2,gput3,gput4))
    return False    
    #elif "Summary" in line:
    #    print(line)
    

if __name__ == "__main__":

    file = open('burnresult.2020.1.7','r')

    filecontext = file.read(611139584)

    linestring = ""
    error = False
    for line in filecontext:
        # print(line)
        if line == "\n":
            if error:
                print(linestring)
            else:
                error = getGPUInfor(linestring)
            linestring = ''
            continue
        linestring += line
     


    file.close()