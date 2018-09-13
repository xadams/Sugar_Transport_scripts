#Outputs the distance between 2 user specified atoms
## Read in user input
puts "Enter first vmd index: "
set ind1 [gets stdin]
puts "Enter second vmd index: "
set ind2 [gets stdin]
## Compute distance
set sel1 [atomselect top "index $ind1"]
set sel2 [atomselect top "index $ind2"]
set com1 [measure center $sel1]
set com2 [measure center $sel2]
veclength [vecsub $com1 $com2]
