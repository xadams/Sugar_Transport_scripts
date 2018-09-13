proc swing {} {
    # get rid of everything else (if there is anything)
    if [expr [molinfo top] != -1] { mol off all }
    # create a new graphics molecule to handle just this
    mol load graphics "swing"
    set mol [molinfo top]
    set center {0 0.5 0}
    set radius 0.125
    set offset ".25 0 0"
    set length 1
    set firsttime 1
    display resetview
    axes location off
    stage location off
    for {set i 0} {$i < 1000} {incr i} {
        display update off
        #scale by 1.003
        rotate y by 5
        display update on
        set top1 [vecsub $center $offset]
        set top2 $center
        set top3 [vecadd $center $offset]
        # compute the bottom location
        set bot1 [vecsub $top1 "0 $length 0"]
        set bot2 [vecsub $top2 "0 $length 0"]
        set bot3 [vecsub $top3 "0 $length 0"]
        set xdiff [expr sin($i/10.0)]
        set ydiff [expr 1.0 - abs(cos($i/10.0))]

        if [expr $xdiff < 0] {
            set bot1 [vecadd $bot1 "$xdiff $ydiff 0"]
        } else {
            set bot3 [vecadd $bot3 "$xdiff $ydiff 0"]
        }
        if $firsttime {
            set firsttime 0
            display resetview
        } else {
            graphics $mol delete all
        }
        # draw the three different balls/strings in different colors
        graphics $mol color red
        graphics $mol sphere $bot1 radius $radius resolution 20
        graphics $mol color green
        graphics $mol sphere $bot2 radius $radius resolution 20
        graphics $mol color blue
        graphics $mol sphere $bot3 radius $radius resolution 20
        graphics $mol materials off
        graphics $mol color red
        graphics $mol line $top1 $bot1
        graphics $mol color green
        graphics $mol line $top2 $bot2
        graphics $mol color blue
        graphics $mol line $top3 $bot3
        display update ui 
    }
    display update on
}

