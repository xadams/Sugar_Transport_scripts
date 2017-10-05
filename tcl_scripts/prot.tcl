mol top 0
set prot [atomselect top "protein"]
puts "Enter a filename:"
set name [gets stdin]
$prot writepdb $name.pdb 
$prot delete
exit
