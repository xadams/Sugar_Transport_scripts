# this tcl script takes 1 ns snapshots from a longer conf output file
mol top 0
set dcd [lindex $argv 0]
mol addfile $dcd step 200 waitfor all
set sel [atomselect top "protein"]
#puts "Enter a filename: "
#set name [gets stdin]
puts "Enter the start time (in ns): "
set start [gets stdin]
set n [expr {int([molinfo top get numframes])}]
for { set i 0 } { $i <= $n } { incr i } {
    set current [expr {int($i+1)}]    
    animate goto $current 
    set time [expr {$start+$i*1}]
#    $sel update
  # center protein before writing each pdb
    set com [measure center $sel]
    $sel moveby [vecinvert $com]
    $sel writepdb ${time}ns.pdb
}
$sel delete
exit
