#!/usr/bin/env python
import subprocess
import sys
import os

DEF_TOP = '../step5_assembly.xplor_ext.psf'
argv = sys.argv[1:]

if len(argv[:]) < 1 and not os.path.isfile(DEF_TOP):
  print("No argument provided and default psf {} not found. Please include a psf file".format(DEF_TOP))
  exit(2)
if not argv[0]:
  argv[0] = DEF_TOP

subprocess.call(["vmd", "-dispdev", "text", "-e", "/Users/xadams/bin/tcl_scripts/indices_sugar_protein.tcl", argv[0]])
