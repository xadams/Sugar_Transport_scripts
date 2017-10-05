mol top 0
set dcd [lindex $argv 0]
# snap of every 5 ns
mol addfile $dcd step 1000 waitfor all
set sel [atomselect top "protein"]
#puts "Enter a filename: "
#set name [gets stdin]
puts "Enter the start time (in ns): "
set start [gets stdin]
set n [expr {int([molinfo top get numframes])}]
for { set i 0 } { $i <= $n } { incr i } {
    set current [expr {int($i+1)}]    
    animate goto $current 
    set time [expr {$start+$i*5}]
#    $sel update
    $sel writepdb ${time}ns.pdb
}
$sel delete
exit
