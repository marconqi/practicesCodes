#!/usr/bin/env python

import pandas as pd
from drex2 import findTheNotMatched

nasFiles = pd.read_csv("photo.nas.files",delimiter=',',header=None,names=["name","size","mtime"])
usbFiles = pd.read_csv("usbbk.files",delimiter=',',header=None,names=["name","size","mtime"])

fl_list = findTheNotMatched(usbFiles,nasFiles)
fl_list.to_csv("notmatch.csv",sep=',')

# print(usbFiles.head())



