cv molid top
cv configfile /Users/xadams/bin/tcl_scripts/orientation_new.in
set file [open "orientation_test.log" a]
puts -nonewline $file [cv printframelabels]
set n [expr {int([molinfo top get numframes])}]
for {set i 0 } { $i < $n } { incr i } {
    cv frame $i
    cv update
    puts -nonewline $file [cv printframe]
}
close $file
exit
