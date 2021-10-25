#!/usr/bin/env python

##########################################################################
# Author: Zhiguo Qi
# Goal: read the sorted base file. And scan the target folder. If it find
#       some data is still have, then delete this file.
# Date: 24/10/2021
##########################################################################

import argparse
import pandas as pd

# the main function
def findDuplicate(source, target, dry):
    pass


if __name__ == "__main__":
    # get the names of input file and the output file.
    parser = argparse.ArgumentParser(description='Find and Remove the duplicated file.')
    parser.add_argument('--source', type=str,
                        help='Input the Source file to process.')
    parser.add_argument('--target', type=str,
                        help='The target folder/files.')
    parser.add_argument('--dry',type=str,
                        help='Dry run, print the duplicated file on the screen')
    args = parser.parse_args()
    sortSource(args.source, args.target, args.dry)
