mol top 0
set prot [atomselect top "protein and not hydrogen"]
puts "Enter a filename:"
set name [gets stdin]
set lipid [atomselect top "lipid"]
$prot writepdb $name.pdb 
$lipid writepdb lipid.pdb
$prot delete
$lipid delete
exit
