# this tcl script extracts coordinate and box information from a dcd file given a list of indices. Primarily for SMwST preparation
package require pbctools
#set indices "0   21   44  121  130  281  344  392  411  469  473  495  520  537  561 583  652  670  687  738  768  798  900  916 1087 1095 1131 1173 1193"
#set indices "0   820  7976  8167  8992  9399 10824"
set indices "700 1633 2498"
set name init
set sel [atomselect top all]
set j 29
foreach i $indices {
    $sel frame $i
    $sel update
    $sel writenamdbin SMwST_input/${j}_${name}.coor
    pbc writexst SMwST_input/${j}_${name}.xsc -first $i -last $i
    incr j
}
$sel delete
exit
