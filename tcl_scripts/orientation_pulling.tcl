set angle 10
set pro [atomselect top "protein and helix"]
# axis of rotation = first (yaw) principal axis
set u [lindex [measure inertia $pro] 1 0]
set cosine [expr cos(($angle/2)*$M_PI/180)]
set sine [expr sin(($angle/2)*$M_PI/180)]
set sin_u [vecscale $sine $u]
set neg_sin_u [vecscale -1 $sin_u]
set file [open "orientation.out" w]

puts $file "q1_6 ( $cosine , [lindex $neg_sin_u 0] , [lindex $neg_sin_u 1] , [lindex $neg_sin_u 2] )"
puts $file "q7_12 ( $cosine , [lindex $sin_u 0] , [lindex $sin_u 1] , [lindex $sin_u 2] )"
close $file

quit
