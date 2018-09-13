set start 0
set n [expr {int([molinfo top get numframes])}]
set file [open "rmsd_handshake.2.txt" w]
set sel [atomselect top "alpha and resid 8 to 220 276 to 463"]
set sel1 [atomselect top "alpha and resid 8 to 220 276 to 463"]
for {set i $start } { $i < $n } { incr i } {
#    puts $i
    $sel frame $i
    $sel update
    set k [expr {$i+1}]
    for {set j $k } { $j < $n } { incr j } {
        $sel1 frame $j
        $sel1 update
        set M [measure fit $sel1 $sel]
        $sel1 move $M
        set rmsd [measure rmsd $sel $sel1]
        puts -nonewline $file "$rmsd "
        unset sel1
        unset M
        unset rmsd
    } 
    puts $file ""
    unset k
}
close $file
