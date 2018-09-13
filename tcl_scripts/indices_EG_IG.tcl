## Save the EG and IG alpha carbon indices to files for PCA plotting
## First write the EG indices to a file
set file [open "EG_indices.txt" w]
set EG1 [atomselect top "alpha and resid 28 to 34 58 to 63 178 to 183"]
puts $file [$EG1 get index]
set EG2 [atomselect top "alpha and resid 295 to 301 315 to 320 423 to 428"]
puts $file [$EG2 get index]
close $file

## Close the EG file and write to the IG file
set file [open "IG_indices.txt" w]
set IG1 [atomselect top "alpha and resid 75 to 80 148 to 154 160 to 166"]
puts $file [$IG1 get index]
set IG2 [atomselect top "alpha and resid 332 to 337 391 to 397 404 to 410"]
puts $file [$IG2 get index]
close $file
exit
