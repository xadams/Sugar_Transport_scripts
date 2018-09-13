## Save the sugar and protein alpha carbon indices to files for plotting
set file [open "sugar_protein_indices.txt" w]
set prot [atomselect top "protein and alpha"]
puts $file [$prot get index]
set sugar [atomselect top "resname BXYL BGLC"]
puts $file [$sugar get index]
close $file
exit
