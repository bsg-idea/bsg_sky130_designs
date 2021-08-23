This test suite is tailored for OpenLane flow for the Skywater 130nm technology node. For use with the other flows/nodes modification would be required as necessary.

<h2> *This work was part of Google Summer of Code 2021* </h2>

Each folder is a design that can be put through the openlane flow just by placing it in the 'designs' folder in the OpenLane directory structure. This process is automated with a 'Makefile' so that you dont have to bother about the specifics.
The stable
A brief on setting up the stable version of OpenLane frozen by efabless for the 2021 MPW-TWO tapeout shuttle:
```
 git clone https://github.com/The-OpenROAD-Project/OpenLane
 make openlane
 export PDK_ROOT=<any location for installing the skywater PDK>
 make pdk
 make test                   
```
'make test' is just to test the setup using a basic design. PDK installation is a one time process and can take time.

Once you have OpenLane ready, all that is needed is to place the design (any of the folders here) in the 'designs' folder in OpenLane.

Then for example, if using docker, from the root of the OpenLane directory structure,
```
 make mount
 ./flow.tcl -design <design_folder_name>
```
