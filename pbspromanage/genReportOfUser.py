#!/bin/env /mnt/mbi/sys/UserApps/anaconda/3/bin/python3


import pandas as pd
import csv
import sys
import subprocess
import re


def printResource(projectname, begindate, enddate):
    ## userCsv = pd.read_csv("Sep_2020_report.csv",sep=',', delimiter=None, header='infer')
    startdate=begindate
    enddate=enddate

    userBudget = subprocess.Popen(["amgr", "report", "project", "-n", projectname, "-S",'{}'.format(startdate), "-E",'{}'.format(enddate), "-l", "-o", "tmp.csv"],
                            stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

    output, errors = userBudget.communicate()
    userBudget.wait()

    # print(errors)
    userCsv = pd.read_csv("tmp.csv",sep=',', delimiter=None, header='infer')

    UserDict = {}
    userAccount = {'cpu_hrs':0.0, 'gpu_hrs':0.0}


    for index, row in userCsv.iterrows():
        if "pbsadmin" == row['transaction_user']:
            continue
        user = row['transaction_user']
        if user not in UserDict.keys():
            UserDict[user] = userAccount.copy()
            UserDict[user][row['serviceunit']] += row['amount'] if row['transaction_type'] == 'acquired' else -row['amount']
        else:
            UserDict[user][row['serviceunit']] += row['amount'] if row['transaction_type'] == 'acquired' else -row['amount']


    for key in UserDict.keys():
        print("{} used CPU-Hours is {} and GPU-Hours is {}".format(key, UserDict[key]['cpu_hrs'], UserDict[key]['gpu_hrs']))

    rmTmp = subprocess.Popen(["rm", "-rf", "tmp.csv"], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    output, errors = rmTmp.communicate()
    rmTmp.wait()


if __name__ == '__main__':
    projectlist = ["qubits_test",
                    "hiraiwa_test",
                    "sesha_test",
                    "limct_test",
                    "shiva_test",
                    "yuhanry_test",
                    "yanjie_test",
                    "mbinfo_test",
                    "rongli_test",
                    "toyama_test",
                    "hongyi"]

    datelist = ["2020-10-01 00:00:00",
                "2020-11-01 00:00:00",
                "2020-12-01 00:00:00",
                "2021-01-01 00:00:00",
                "2021-02-01 00:00:00",
                "2021-03-01 00:00:00"]
    for i in range(len(datelist) -1):
        for proj in projectlist:
            print("{} : from {} to {}".format(proj,datelist[i],datelist[i+1]))
            printResource(proj,datelist[i],datelist[i+1])
        