#!/usr/bin/env python

##########################################################################
# Author: Zhiguo Qi
# Goal: read the sorted base file. And scan the target folder. If it find
#       some data is still have, then delete this file.
# Date: 24/10/2021
##########################################################################

import argparse
import pandas as pd
import os
import hashlib


# the main function
def findDuplicate(source, target, dry):

    # to find the source file is exist or not.
    if os.path.isfile(source):
        sourcePd = pd.read_csv(source,sep=',',header=0)
    else:
        print("Could not find source file!")
        exit(1)

    # if the path is exist or not.
    if not os.path.isdir(target):
        print("Target fold is not exist!")
        exit(1)
    
    


    # to check if it read the csv file correctly.
    # print(sourcePd.head())

    # walk through the target folder and find the files
    fnamelist = []
    for root, d_name, f_names in os.walk(target):
        for f in f_names:
            fnamelist.append(os.path.join(root,f))

    iter = 0
    for file in fnamelist:
        fhash = hashlib.md5(open(file,'r').read().encode('gbk')).hexdigest()
        print("fhash is {}".format(fhash))
        iter += 1
        if iter > 10:
            exit(2)
    # read the md5 code
    # search if the file is in the source or not.

    print("{} \t {}".format(target, dry))



if __name__ == "__main__":
    # get the names of input file and the output file.
    parser = argparse.ArgumentParser(description='Find and Remove the duplicated file.')
    parser.add_argument('--source', type=str,
                        help='Input the Source file to process.')
    parser.add_argument('--target', type=str,
                        help='The target folder/files.')
    parser.add_argument('--dry',
                        help='Dry run, print the duplicated file on the screen',
                        action="store_true")
    args = parser.parse_args()

    if not args.dry:
        print("Dry run!")
    findDuplicate(args.source, args.target, args.dry)


"""
    try:
        sourceFile = open(source)
    except FileNotFoundError:
        print("{} is not found.".format(source))
        exit(1)
    finally:
        sourceFile.close()
        sourcePd = pd.read_csv(source,sep=',',header=0)
"""