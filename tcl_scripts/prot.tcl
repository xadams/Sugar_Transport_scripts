mol top 0
set prot [atomselect top "protein"]
set name [lindex $argv 0]
set com [measure center $prot]
$prot moveby [vecinvert $com]
$prot writepdb pore.pdb 
$prot delete
exit
