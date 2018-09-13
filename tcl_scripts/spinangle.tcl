# this tcl script outputs orientational quaternions for the C and N domain of XylE
# requires eq.pdb as a reference
cv molid top
cv configfile spinangle.in
set file [open "spinangle.log" w]
puts $file [cv printframelabels]
set n [expr {int([molinfo top get numframes])}]
for {set i 0 } { $i < $n } { incr i } {
    cv frame $i
    cv update
    puts $file [cv printframe]
}
close $file
