wipe 
wipeAnalysis
set current(startTime) [clock clicks -millisec]
model BasicBuilder -ndm 2 -ndf 2



source setPar.tcl
set dataDir $modelName; # Name of output folder
if { [file exists $dataDir] == 0 } {
file mkdir $dataDir;
}

source analyze.tcl;