set prot [atomselect top "helix and alpha"]
set start [measure center $sel]
set n [expr {int([molinfo top get numframes])}]
set file [open "drift.log" w]
for { set i 0 } { $i <= $n } { incr i } {
    set current [expr {int($i+1)}]
    animate goto $current
    set position [measure center $sel]
    puts $file [veclength [vecsub $start $position]]
}
close $file
