# an equivalent playground for tcl scripts
mol top 0
set name [lindex $argv 0]
mol addfile $name step 1000 waitfor all
#mol addfile 7.1.dcd first 50 last 100 step 2 waitfor all
