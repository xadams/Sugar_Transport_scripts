#!/usr/bin/env bash
# This program generates a pdb ready for submission to the H++ server

# first check that at least 1 argument has been received
if [ -z "$1" ]; then
    echo "Please provide psf and pdb inputs. If only coordinates are provided the standard psf will be used"
    exit
fi

# help text
if [ $1 = "help" ]; then
    echo "This script, when provided with the psf and pdb files as arguments, generates a pdb ready for submission to the H++ server."
    exit
fi

# check if the pdb/coordinate file exists 
if [ -f $1 ]
then
    echo "$1 exists"
else
    echo "Hey buddy, $1 doesn't exist"
    exit
fi

# if one argument is provided, assume the standard psf file
if [ -z "$2" ]; then
#call VMD without a display window and build a pdb from the inputs
    /Applications/VMD\ 1.9.3.app/Contents/Resources/VMD.app/Contents/MacOS/vmd -e $tclhome/charmm2amber.tcl -dispdev text ../step5_assembly.xplor_ext.psf $1
else
    if [ -f $2 ]
    then
#call VMD without a display window and build a pdb from the inputs
        /Applications/VMD\ 1.9.3.app/Contents/Resources/VMD.app/Contents/MacOS/vmd -e $tclhome/charmm2amber.tcl -dispdev text $1 $2
    else
        echo "Hey buddy, $2 doesn't exist"
    exit
    fi
fi
# combine the lipid and protein pdb files
mv lipid.pdb tmp.pdb
# this line searches based on time of creation, grabs the most recent and takes the base name of the file
name=$(ls -t | head -1 | cut -f 1 -d '.')
echo $name
cat tmp.pdb >> $name.pdb
rm tmp.pdb
# modify pdb file to be ready for H++ submission
sed /CRYST/d ./$name.pdb > tmp.pdb
sed -i -e s/END/TER/g tmp.pdb
rm $name.pdb
mv tmp.pdb $name.pdb
# move to the location where the other amber compliant files are
mv $name.pdb ~/PycharmProjects/Oldpython
cd ~/PycharmProjects/Oldpython
# produce the pdb file with appropriate membrane atom names
~/miniconda2/bin/python charmmlipid2amber.py -i $name.pdb -o $name\amber.pdb -c charmmlipid2amber.csv
