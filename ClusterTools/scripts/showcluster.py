#!/usr/bin/env /bin/python

import optparse
import os
import codecs
from time import strftime,localtime
import subprocess
import string
import re, collections

class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'

class Colorcodes(object):
    """
    Provides ANSI terminal color codes which are gathered via the ``tput``
    utility. That way, they are portable. If there occurs any error with
    ``tput``, all codes are initialized as an empty string.
    The provides fields are listed below.
    Control:
    - bold
    - reset
    Colors:
    - blue
    - green
    - orange
    - red
    :license: MIT
    """
    def __init__(self):
        try:
            self.bold = subprocess.check_output("tput bold".split())
            self.reset = subprocess.check_output("tput sgr0".split())

            self.blue = subprocess.check_output("tput setaf 4".split())
            self.green = subprocess.check_output("tput setaf 2".split())
            self.orange = subprocess.check_output("tput setaf 3".split())
            self.red = subprocess.check_output("tput setaf 1".split())
        except subprocess.CalledProcessError as e:
            self.bold = ""
            self.reset = ""

            self.blue = ""
            self.green = ""
            self.orange = ""
            self.red = ""

# _c = Colorcodes()

def main():
	# sinfo  -o "%13n %8t %4c %8z %15C %8O %8m %8G %18P %f"
	p = subprocess.Popen(['sinfo','-o','\"%13n %8t %4c %15C %8O %8m %18G %18P %f\"'],stdout=subprocess.PIPE,
									stderr=subprocess.PIPE)
	out, err = p.communicate()
	outstr = out.split("\n")
	#print outstr
	nodedict = {}
	itemno = 0
	for line in outstr:
		line = re.sub('\"', '', line)
		if itemno == 0:
			print line
			itemno = itemno+1
		else:
			#line = re.sub('\"', '', line)
			temp1 = re.split(r"\s+",line)
                        tempstr = temp1[0]
                        match = re.match(r"([a-z]+)([0-9]+)", tempstr, re.I)
			if match:
				n0 = match.groups()[0]
				n1 = match.groups()[1]
				if len(n1)==1:
					dd = '00'
				elif len(n1)==2:
					dd = '0'
				else:
					dd = ''
				namestr = n0+dd+n1
				# print namestr
				nodedict[namestr] = line
	nnd = collections.OrderedDict(sorted(nodedict.items()))
	# keys = nodedict.keys()
        # keys.sort(key = lambda x : int(x[1:]))
	_c = Colorcodes()
        for key in nnd:
		if 'idle' in nnd[key]:
			print _c.green + _c.bold + nnd[key] + _c.reset
		elif 'alloc' in nnd[key]:
			print _c.red + nnd[key] + _c.reset
		else:
			print _c.orange + nnd[key] + _c.reset

#if __name__=='__name__':
main()

