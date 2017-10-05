mol top 0
set filename "abf_indices"
set fileId [open $filename "w"]
set sugar [atomselect top "resname BXYL"]
# cannot use this line at the moment as the detergent is named BGLC as well :/
#set sugar [atomselect top "resname BXYL and resname BGLC"]
set prot [atomselect top "protein and alpha"]
puts $fileId [$sugar get index]
puts $fileId [$prot get index]
close $fileId
exit
