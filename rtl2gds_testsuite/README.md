This test suite is tailored for OpenLane flow for the Skywater 130nm technology node. For use with the other flows/nodes modification would be required as necessary.

<h2> *This work was part of Google Summer of Code 2021* </h2>

Each folder is a design that can be put through the openlane flow just by placing it in the 'designs' folder in the OpenLane directory structure. This process is automated with a 'Makefile' so that you dont have to bother about the specifics.

The stable version of OpenLane frozen by efabless for the 2021 MPW-TWO tapeout shuttle is used throughout.

To setup and run designs through OpenLane:
1) Clone and install OpenLane and bsg fakeram generator:
>make tools
2) Install the Skywater 130 PDK (may take some time):
>make pdk
3) Setup any preferred design (loads docker image):
>make <design_name>.design
4) Run the flow
>./flow.tcl -design <design_name>

If you just want to setup openLane or the bsgfakeram generator individually then you can do so using 'make openlane' and 'make bsg_fakeram' respectively.

