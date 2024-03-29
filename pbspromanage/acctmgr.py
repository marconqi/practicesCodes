#!/usr/bin/env /opt/anaconda3/bin/python3

#####################################################
# To collect the information about the users' usage 
# of the cluster.
# When PBSpro running, it will log all the information
# of each job in its accounting folder. The job script
# will parse these information and calculate the daily
# usage of each user.
# Author: Zhiguo Qi
# Date: 2020-10-20
# Usage: acctmgr.py /dist/folder/20201010
#####################################################
import sys
import re
import ast
from pprint import pprint

# parse the log file and return the date about the job
def getTime(dtime):
    tmp = re.split(r"\s+",dtime)[0]
    tmp2 = re.split(r"\/",tmp)
    return "{}-{}-{}".format(tmp2[2],tmp2[0],tmp2[1])

# get the job state, the job state is instead by one
# Capital work.
def getState(state):
    pass

# get the job No. And remove other information, only 
# kept the number part.
def getJobNo(job):
    return re.split(r"\.",job)[0]

def getHours(hourstring):
    tmp = re.split(r'\:',hourstring)
    hour = int(tmp[0])
    mininute = int(tmp[1])
    second = int(tmp[2])
    return (hour*3600+mininute*60+second)/3600.


def getCPUGPU(reslist):
    # print(reslist)
    tmp = re.split(":", reslist)
    cpu_core = 0
    gpu_card = 0
    select = 1
    for item in tmp:
        if "select" in item:
            select = int(re.split("=", item)[-1])
        if "ncpus" in item:
            cpu_core = int(re.split("=", item)[-1])
        if "ngpu" in item:
            gpu_card = int(re.split("=", item)[-1])
    return cpu_core * select, gpu_card * select
    # pprint(D)
    # return int(D["job.cgpus"]), int(D["job.ngpus"])
# get the resource usage of the job, and return a dictionary
# 
def getRes(resource):
    tmp = re.split(r"\s+",resource)
    user = ''
    cpu_core = 1
    gpu_core = 0
    cpu_hrs = 0.0
    gpu_hrs = 0.0
    project = ""
    queue = ""
    host = ""
    mem = ""
    for item in tmp:
        if "user" in item:
            user = re.split(r"=",item)[-1]
        if "project" in item:
            project = re.split(r"=",item)[-1]
        if "queue" in item:
            queue = re.split(r"=",item)[-1]
        if "exec_host" in item:
            host = re.split(r"=",item)[-1]
        if "resources_used.mem" in item:
            mem = re.split(r"=",item)[-1]
        if "resources_used.walltime" in item:
            cpu_hrs = getHours(re.split(r"=",item)[-1])
            gpu_hrs = cpu_hrs
        if "Resource_List.select" in item:
            cpu_core, gpu_core = getCPUGPU(item)
    ## resources_used.walltime
    # print("{} - {} - {} - {} - {} - {} - {} - {} - {}".format(user, project, 
    #                    queue, host, cpu_hrs, gpu_hrs, mem, cpu_core, gpu_core))
    return {
        "user"  :   user,
        "project": project,
        "queue": queue,
        "host": host,
        "cpu_hrs": cpu_hrs * cpu_core,
        "gpu_hrs": gpu_hrs * gpu_core,
        "mem"   : mem
    }

# this function is generating the resources comsumption of each user
def getSummary(rDicts):
    cpus = 0.0
    gpus = 0.0
    jobid = []
    for key in rDicts.keys():
        for item in rDicts[key]:
            cpus += item["cpu_hrs"]
            gpus += item['gpu_hrs']
            jobid.append(item['jobid'])
        print("{0:s} used {1:6.2f} CPU-Hours and {2:6.2f} GPU-Hours with {3:d} jobs".format(key, cpus, gpus, len(jobid)))
        # print(jobid)
        cpus = 0.
        gpus = 0.
        jobid = []

# here print the result on the screen.
def outputJobs(rDicts):
    if len(rDicts) == 0:
        print("Oops! No one run jobs!")
        return 0
    for key in rDicts.keys():
        for item in rDicts[key]:
            print("{} used {:.6f} CPU-HRS and {:.6f} GPU-HRS in job {} on {}".format(item['user'],item['cpu_hrs'],item['gpu_hrs'],item['jobid'], item['date']))


# print(sys.argv[1])
# filename is the account log file
filename = sys.argv[1]

# initial the resourse usage data dictionary
resDicts = {}

# read the log file
with open(filename,"r") as fp:
    Lines = fp.readlines() # read all the lines at once, Note: maybe the file could be closed here.
    for line in Lines: # parse the log file line by line
        tmp = re.split(r";",line)
        if len(tmp) == 4:
            if tmp[1] == "E":
                jobNo = getJobNo(tmp[2])
                tmp2 = getRes(tmp[3])
                date = getTime(tmp[0])
                tmp2["jobid"] = jobNo
                tmp2['date'] = date
                if tmp2['user'] in resDicts.keys():
                    resDicts[tmp2['user']].append(tmp2.copy())
                else:
                    resDicts[tmp2['user']] = [tmp2.copy()]
# pprint(resDicts)
getSummary(resDicts)
# outputJobs(resDicts)
