package require topotools
set midlist {}
set mol [mol new [lindex $argv 0] waitfor all]
mol addfile [lindex $argv 1]
lappend midlist $mol
set mol [mol new [lindex $argv 2] waitfor all]
mol addfile [lindex $argv 3] 
lappend midlist $mol
set mol [::TopoTools::mergemols $midlist]
animate write psf merged.psf $mol
animate write pdb merged.pdb $mol
exit
