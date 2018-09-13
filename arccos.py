#!/usr/bin/env python
import numpy as np
import sys

argv = sys.argv[1:]

if len(argv) < 1:
  print("No arguments provided. Please include at least cosine value to be converted to degrees.")
  exit(2)
for arg in argv:
  y = np.arccos(float(arg))*360/np.pi
  print("x = {}, y = {} ".format(arg,y))

