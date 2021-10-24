#!/usr/bin/env python

##########################################################################
# Author: Zhiguo Qi
# Goal: read the sorted base file. And scan the target folder. If it find
#       some data is still have, then delete this file.
# Date: 24/10/2021
##########################################################################

# the main function
def findDuplicate(source, target, dry):
    pass


if __name__ == "__main__":
    # get the names of input file and the output file.
    parser = argparse.ArgumentParser(description='Find and Remove the duplicated file.')
    parser.add_argument('--source', type=str,
                        help='Input the Source file to process.')
    parser.add_argument('--target', type=str,
                        help='the output file')
    parser.add_argument('--dry',type=?,
                        help='print the duplicated file on the screen')
    args = parser.parse_args()
    sortSource(args.source, args.target, args.dry)
