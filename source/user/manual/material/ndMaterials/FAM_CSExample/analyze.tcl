set IDctrlDOF 1;


recorder Node -file $dataDir/Dtop.txt -time -node $IDctrlNode $IDctrlNode2  -dof $IDctrlDOF disp
recorder Node -file $dataDir/basereactions.txt -time -node 1 101 102 103 104 105 106 107 108 109 2 -dof 1 2 reaction
recorder Node -file $dataDir/Force.txt -time -node $IDctrlNode -dof 1 2 reaction

# Create a Plain load pattern with a linear TimeSeries
pattern Plain 1 "Linear" {
 
    # Create the nodal load - command: load nodeID xForce yForce
    load $IDctrlNode  0 [expr 0.5*$Nsum]
    load $IDctrlNode2  0 [expr 0.5*$Nsum]
}           

# Create the system of equation, a sparse solver with partial pivoting
constraints Transformation  
numberer RCM    
system BandGeneral      
test NormDispIncr 1e-5  $iterg 0
algorithm KrylovNewton -maxDim 50
integrator LoadControl $loadcontrolfactor1
analysis Static
set dispswitch 0

set counter 1
set printPer 10


puts "Total Steps: [expr $Nsteps1]"

for {set i 0} {$i < $Nsteps1} {incr i} {

    set ok [analyze 1]
    # ----------------------------------------------if convergence failure-------------------------
    if {$ok != 0} {
        # if analysis fails, we try some other stuff
        # performance is slower inside this loop    global maxNumIterStatic;# max no. of iterations performed before "failure to converge" is ret'd
        if {$ok != 0} {
            puts "Loose1"
            test NormDispIncr   $Loose1 $iterg 2
            set ok [analyze 1]
            test NormDispIncr $Tol $iterg $dispswitch
        }
        if {$ok != 0} {
            puts "Loose2"
            test NormDispIncr   $Loose2 $iterg 2
            set ok [analyze 1]
            test NormDispIncr $Tol $iterg $dispswitch
        }
        if {$ok != 0} {
            puts "Loose3"
            test NormDispIncr   $Loose3 $iterg 2
            set ok [analyze 1]
            test NormDispIncr $Tol $iterg $dispswitch
        }
        if {$ok != 0} {
            puts "LooseN"
            test NormDispIncr 1e0 10 5
            set ok [analyze 1]
            test NormDispIncr $Tol $iterg $dispswitch
        }
        if {$ok != 0} {
            set putout [format  "PROBLEM" ]
            puts $putout
            return -1
        }; # end if
    }; # end if
    if {$i >= [expr $counter*$printPer]} {
    puts "Load Step: [expr $i]/[expr $Nsteps1]. Time consumption: [expr ([clock clicks -millisec]-$current(startTime)) / 1000.]s."
    set counter [expr $counter+1]
    }
}

# Set the gravity loads to be constant & reset the time in the domain
loadConst -time 0.0


puts "Gravity analysis finished"

set LunitTXT "mm";

set fmt1 "%s Cyclic analysis: CtrlNode %.3i, dof %.1i, Disp=%.4f %s";   # format for screen/file output of DONE/PROBLEM analysis

timeSeries Path 1 -dt 1 -filePath $dataDir/loaddisp.txt ;
pattern Plain 2 1 {
  sp $IDctrlNode $IDctrlDOF 1

 }

set dispswitch 0

constraints Transformation  
numberer RCM    
system BandGeneral
# system UmfPack 
test NormDispIncr $Tol $iter1 $dispswitch;              
# algorithm NewtonLineSearch 
algorithm KrylovNewton -maxDim 50
integrator LoadControl $loadcontrolfactor2;          
analysis Static 


set counter 1
set printPer 10


puts "Total Steps: [expr $Nsteps2]"

for {set i 0} {$i < $Nsteps2} {incr i} {

    set ok [analyze 1]
    # ----------------------------------------------if convergence failure-------------------------
    if {$ok != 0} {
        # if analysis fails, we try some other stuff
        # performance is slower inside this loop    global maxNumIterStatic;# max no. of iterations performed before "failure to converge" is ret'd
        if {$ok != 0} {
            puts "Loose1"
            test NormDispIncr   $Loose1 $iter2 2
            set ok [analyze 1]
            test NormDispIncr $Tol $iter1 $dispswitch
        }
        if {$ok != 0} {
            puts "Loose2"
            test NormDispIncr   $Loose2 $iter2 2
            set ok [analyze 1]
            test NormDispIncr $Tol $iter1 $dispswitch
        }
        if {$ok != 0} {
            puts "Loose3"
            test NormDispIncr   $Loose3 $iter2 2
            set ok [analyze 1]
            test NormDispIncr $Tol $iter1 $dispswitch
        }
        if {$ok != 0} {
            puts "LooseN"
            test NormDispIncr 1e-1 $iter2 2
            set ok [analyze 1]
            test NormDispIncr $Tol $iter1 $dispswitch
        }
        if {$ok != 0} {
            puts "LooseN"
            #test NormDispIncr 2 3 5 for SW1 - SW4 AND SW6
            #for SW5
            test NormDispIncr 2 3 5 
            set ok [analyze 1]
            test NormDispIncr $Tol $iter1 $dispswitch
        }
        if {$ok != 0} {
            set putout [format $fmt1 "PROBLEM" $IDctrlNode $IDctrlDOF [nodeDisp $IDctrlNode $IDctrlDOF] $LunitTXT]
            puts $putout
            return -1
        }; # end if
    }; # end if
    
    if {$i >= [expr $counter*$printPer]} {
    puts "Load Step: [expr $i]/[expr $Nsteps2]. Time consumption: [expr ([clock clicks -millisec]-$current(startTime)) / 1000.]s."
    set counter [expr $counter+1]
    }

#   set load_step [expr $load_step+1]
}

# # -----------------------------------------------------------------------------------------------------
if {$ok != 0 } {
    puts [format $fmt1 "PROBLEM" $IDctrlNode $IDctrlDOF [nodeDisp $IDctrlNode $IDctrlDOF] $LunitTXT]
} else {
    puts [format $fmt1 "DONE"  $IDctrlNode $IDctrlDOF [nodeDisp $IDctrlNode $IDctrlDOF] $LunitTXT]
}

# # Print the state at control node
# print node $IDctrlNode

puts "Time consumption: [expr ([clock clicks -millisec]-$current(startTime)) / 1000.]s."