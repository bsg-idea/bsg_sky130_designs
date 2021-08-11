

Once you have OpenLane ready, all that is needed is to place the 'fakeram_512x64_test' and 'realram_8x1024' folders in the 'designs' folder in OpenLane.

Then for example, if using docker,

> make mount
> ./flow.tcl -design realram_8x1024 
For running the flow non-interactively on realram design,

> make mount
> ./flow.tcl -interactive -design fakeram_512x64_test
For running the flow interactively on the fakeram design

(In interactive case, the steps have to be run manually and the commands for the basic steps are:
 run_synthesis
 run_floorplan
 run_placement
 run_cts 
 run_resizer_timing
 run_routing
 ...in tha order)
