#!/usr/bin/env python

import os
import sys
import numpy as np
import time

if len(sys.argv) != 3:
    print("Usage: memoryAlloc <n GB> <n second>")
    sys.exit(1)

sn, ss = sys.argv[1:]

jobs = []
tm = int(sn)
for i in range(tm):
    n = 268435456
    jobs.append(np.arange(n).astype(np.float32))
print("it allocated {} GB memory".format(sn))
print("now sleeping {}s".format(ss))
time.sleep(int(ss))
