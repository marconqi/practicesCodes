#!/usr/bin/env python


############################################################################
# Auth: Zhiguo Qi
# read and sort the source file
# Date: 23/10/2021
############################################################################

import argparse
import pandas as pd
import re


# Function: to split the directory string and return the file name string
def getFileNameString(sdir):
    fileString = re.split(r"\/",sdir)[-1]
    print(fileString)
    return fileString


# read the source file and output the sorted file.
# Return: nil
def sortSource(inputFile, outputFile):
    # pandas read the input file.
    sourceFiles = pd.read_csv(inputFile)
    


if __name__ == "__main__":
    # get the names of input file and the output file.
    parser = argparse.ArgumentParser(description='sort the source file data.')
    parser.add_argument('--input', type=str,
                        help='Input the Source file to process.')
    parser.add_argument('--output', type=str,
                        help='the output file')
    args = parser.parse_args()
    sortSource(args.input, args.output)