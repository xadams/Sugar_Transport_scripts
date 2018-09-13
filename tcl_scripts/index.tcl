#Print out the indices for a user specified continuous group of residues
mol top 0
puts "Enter the first resid:"
set first [gets stdin]
puts "Enter the last resid:"
set last [gets stdin] 
set sel [atomselect top "alpha and resid $first to $last"]
$sel writepdb index.pdb
$sel delete
exit
