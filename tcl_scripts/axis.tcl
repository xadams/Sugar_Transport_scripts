# vmd/tcl script to extract the axis of rotation for spinAngle

#set mol [mol new [lindex $argv 0] waitfor all]
#mol addfile [lindex $argv 1] 

set pro [atomselect top "protein and helix"]
# axis of rotation = first (yaw) principal axis
set u [lindex [measure inertia $pro] 1 0]
set file [open "axis.out" w]
puts $file "u ( [lindex $u 0] , [lindex $u 1] , [lindex $u 2] )"
close $file

quit
