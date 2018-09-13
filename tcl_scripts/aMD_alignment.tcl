mol new protg_prot.psf
mol addfile eq_100ns_protonated.pdb
mol new inocg.psf
mol addfile 32_alpha.pdb
# after loading in all molecules, align the entire outward
# facing protein by fitting to TMD alphas
set sel [atomselect 1 "alpha and resid 8 to 220 276 to 463"]
#set prot [atomselect 0 protein]
set sel1 [atomselect 0 "alpha and resid 8 to 220 276 to 463"]
set prot1 [atomselect 0 "segname PROA CARA CARB"]
set M [measure fit $sel1 $sel] 
$prot1 move $M
unset M
unset sel
unset sel1
unset prot1

# Align a few residues with different protonations
set inocg_res [atomselect 1 "protein and resid 262"]
set protg_res [atomselect 0 "protein and resid 262 and not index 4008"]
set M [measure fit $inocg_res $protg_res]
$inocg_res move $M
set inocg_res [atomselect 1 "protein and resid 440 and not index 6786"]
set protg_res [atomselect 0 "protein and resid 440"]
set M [measure fit $inocg_res $protg_res]
set inocg_res [atomselect 1 "protein and resid 440"]
$inocg_res move $M

unset M
# one by one align all of the atoms atop their new 
# coordinates from protg
for {set i 0 } { $i <= 6 } { incr i } {
    set prot [atomselect 0 "index $i"]
    set inoc [atomselect 1 "index $i"]
    set pos [$prot get {x y z}]
    $inoc moveto [lindex $pos 0]
    $prot delete
    $inoc delete
    unset pos
}

for {set i 7 } { $i <= 3991 } { incr i } {
    set j [expr {$i+10}]
    set prot [atomselect 0 "index $j"]
    set inoc [atomselect 1 "index $i"]
    set pos [$prot get {x y z}]
    $inoc moveto [lindex $pos 0]
    $prot delete
    $inoc delete
    unset j
    unset pos
}

for {set i 4002 } { $i <= 6779 } { incr i } {
    set j [expr {$i+11}]
    set prot [atomselect 0 "index $j"]
    set inoc [atomselect 1 "index $i"]
    set pos [$prot get {x y z}]
    $inoc moveto [lindex $pos 0]
    $prot delete
    $inoc delete
    unset j
    unset pos
}

for {set i 6792 } { $i <= 7524 } { incr i } {
    set j [expr {$i+10}]
    set prot [atomselect 0 "index $j"]
    set inoc [atomselect 1 "index $i"]
    set pos [$prot get {x y z}]
    $inoc moveto [lindex $pos 0]
    $prot delete
    $inoc delete
    unset j
    unset pos
}

set all [atomselect 1 all]
$all writepdb eq_100ns_inocg.pdb
$all delete
