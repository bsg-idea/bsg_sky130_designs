
To setup OpenLane:
> git clone https://github.com/The-OpenROAD-Project/OpenLane
> make openlane
> export PDK_ROOT=<any location for installing the skywater PDK>
> make pdk
> make test                   
'make test' is just to test the setup using a basic design. PDK installation is a one time process and can take time.

Once you have OpenLane ready, all that is needed is to place the 'bp_fe_top' folder in the 'designs' folder in OpenLane.

Then for example, if using docker,

> make mount
> ./flow.tcl -design bp_fe_top
