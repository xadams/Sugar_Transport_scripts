package require topotools
set midlist {}
set mol [mol new [lindex $argv 0] waitfor all]
lappend midlist $mol
set mol [mol new [lindex $argv 1] waitfor all]
lappend midlist $mol
set mol [::TopoTools::mergemols $midlist]
animate write pdb merged.pdb $mol
exit
