# hopefully this will automate the restructuring 
mkdir builder
mv * builder/
cd builder
#mv *.vmd ..
mv namd/ ..
mv step5_assembly.pdb ..
mv step5_assembly.namd.pdb ..
mv step5_assembly.xplor_ext.psf ..
mv step5_assembly.str ..
mv checkfft.py ..
cd ..
