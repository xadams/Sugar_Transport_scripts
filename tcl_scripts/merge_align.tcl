# REQUIRES:
# 1. 1 pdb file (protein)
# 2. 1 psf file (protein)
# 3. psfgen

# Load psfgen
#package require psfgen

#accept the arg from sugar_setup.sh

if { ([file extension [file tail [lindex $argv 1]]] == ".pdb") &&   ([info exists [lindex $argv 2]])}   {

    set protein_pdb [lindex $argv 1]
    set protein_psf [lindex $argv 2]

} elseif { ([file extension [file tail [lindex $argv 1]]] == ".psf") &&   ([info exists [lindex $argv 2]]) } {
    
    set protein_psf [lindex $argv 1]
    set protein_pdb [lindex $argv 2]

} else {

    set protein_psf [lindex $argv 2]
    set protein_pdb [lindex $argv 1]

}

set tclhome [lindex $argv 3]

#sugar, CHANGE DIRECTORY TO MATCH
if { ([lindex $argv 0]=="BGLC") } {
    set sugar_psf $tclhome/glucose.psf
    set sugar_pdb $tclhome/glucose.pdb
    set sugar_res "BGLC"
} else {
    set sugar_psf $tclhome/xylose.psf
    set sugar_pdb $tclhome/xylose.pdb
    set sugar_res "BXYL"
}

package require topotools 1.1
set midlist {}
set mol [mol new $protein_psf waitfor all]
mol addfile $protein_pdb
lappend midlist $mol
set mol [mol new $sugar_psf waitfor all]
mol addfile $sugar_pdb $mol
lappend midlist $mol
set mol [::TopoTools::mergemols $midlist]
animate write psf merged.psf $mol
animate write pdb merged.pdb $mol

mol new merged.psf waitfor all
mol addfile merged.pdb
# selecting the transporter and its ligand, CHANGE THIS
set protein [atomselect top "protein"]
set sugar [atomselect top "resname $sugar_res"]


# move sugar to the COM of protein
set com_protein [measure center $protein weight mass]
set com_sugar [measure center $sugar weight mass]
$sugar moveby [vecinvert $com_sugar]
$sugar moveby $com_protein


# move sugar up +30 Angstroms, just outside the transporter
$sugar moveby {0 0 35}

# checks if sugar is closer to res 27 (extracellular) or res 260 (intracellular) in z-direction, 
# and adjusts the sugar by -60 Angstroms if it's on the intracellular side
set res27 [atomselect top "resid 27"]
set res260 [atomselect top "resid 260"]
set sugar_center [measure center $sugar weight mass]
set res27_center [measure center $res27 weight mass]
set res260_center [measure center $res260 weight mass]
set diff27 [expr {[lindex $sugar_center 2] - [lindex $res27_center 2]}]
set diff260 [expr {[lindex $sugar_center 2] - [lindex $res260_center 2]}]

if {abs($diff27) > abs($diff260)} {$sugar moveby {0 0 -70}}


# Write pdb file
set new_sel [atomselect top "all and not water within 2 of resname $sugar_res"]
$new_sel writepdb output.pdb
$new_sel writepsf output.psf

# exit in order to return the user to command line
exit
