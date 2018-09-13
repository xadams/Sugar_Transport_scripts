#!/usr/bin/env python
import os
import subprocess
import sys

DEF_TOP = ['../protein.psf','protein.psf','../step5_assembly.xplor_ext.psf']
OUT = 'orientation_new.log'
argv = sys.argv[1:]
arg_num = len(argv[:])

if arg_num < 1:
  print("No arguments provided. Please include a psf and coordinate/trajectory file.")
  exit(2)
elif arg_num == 1:
  for TOP in DEF_TOP:
    if os.path.isfile(TOP):
      argv.append(argv[0])
      argv[0] = TOP
      break
if os.path.isfile(OUT):
  print("{} already exists, please rename or delete file.".format(OUT))
  exit(2)
#if not os.path.isfile("eq.pdb"):
#  print("Requires eq.pdb in current directory. Exiting.")
#  exit(2)
  #subprocess.call(["cp", "/pylon5/mc562gp/adamsa/UnbiasedOpening/namd/eq.pdb", "."])

subprocess.call(["vmd", "-e", "/Users/xadams/bin/tcl_scripts/orientation.tcl", "-dispdev", "text", argv[0], argv[1]])
#subprocess.call(["remove_blank_lines.py", OUT])
