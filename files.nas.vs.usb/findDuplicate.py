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
            #  print(f[0])
            if f[0] != '.':
                fnamelist.append(os.path.join(root,f))

    # iter = 0
    # read the md5 code
    if dry:
        for file in fnamelist:
            fhash = hashlib.md5(open(file,'rb').read()).hexdigest()
            if fhash in sourcePd.values: 
                print("duplicated: {}".format(file))
    else:
        for file in fnamelist:
            fhash = hashlib.md5(open(file,'rb').read()).hexdigest()
            if fhash in sourcePd.values: 
                # print("Remove: {}".format(file))
                os.remove(file)
        # print("fhash is {}".format(fhash))

    # search if the file is in the source or not.

    # print("{} \t {}".format(target, dry))



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

    if args.dry:
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