This test suite is tailored for OpenLane flow for the Skywater 130nm technology node. For use with the other flows/nodes modification would be required as necessary.

<h2> *This work was part of Google Summer of Code 2021* </h2>

Each folder is a design that can be put through the openlane flow just by placing it in the 'designs' folder in the OpenLane directory structure. All of that is automated with a 'Makefile' so that you dont have to bother about the specifics.

The stable version of OpenLane frozen by efabless for the 2021 MPW-TWO tapeout shuttle is used throughout.

Tools:
* OpenLane
* BSG fakeram generator

Designs:
* bsg_fakeram_wrapper
* bsg_realram_wrapper
* bsg_manycore_withfakeram
* bsg_manycore_withrealsram
* black_parrot_fe
* black_parrot

To setup and run designs through the flow:
1) Clone and install OpenLane and BSG fakeram generator:
>make tools
2) Install the Skywater 130 PDK (may take some time):
>make pdk
3) Setup any preferred design (loads docker image):
>make <design_name>.design
4) Run the flow
>./flow.tcl -design <design_name>

[OpenLane](https://github.com/The-OpenROAD-Project/OpenLane) is the open-source RTL to GDS flow that wraps together a number of open-source tools across the different stages of the flow to make open-source RTL to GDS possible.

[BSG fakeram generator](https://github.com/bespoke-silicon-group/bsg_fakeram) is the tool used to generate fake placeholders for SRAMs so that designs can be put through the flow even when the SRAM configurations required by them are not yet available.

If you just want to setup openLane or the bsgfakeram generator individually, then you can do so using 'make openlane' and 'make bsg_fakeram' respectively.

[bsg_fakeram_wrapper](fakeram_512x64) is a simple wrapper around a fakeram generated using the BSG fakeram generator. The only logic it contains is an inverter logic at the fakeram output. This design is able to complete the flow DRC and LVS clean.

[bsg_realram_wrapper](realram_8x1024) is a simple wrapper around a Sky130 SRAM (obtained from [here](https://github.com/efabless/sky130_sram_macros)). The only logic it contains is an inverter logic at the SRAM output. This design is able to complete the flow DRC and LVS clean.

[bsg_manycore_withfakeram](bsg_manycore_tile_compute_mesh) is a manycore tile compute mesh design [from BSG](https://github.com/bespoke-silicon-group/bsg_manycore). Here fakerams generated using BSG fakeram generator is used as placeholders for the SRAMs that this design needs.

[bsg_manycore_withsram](bsg_manycore_tile_compute_mesh_real) is the same manycore tile design stitched together with an existing SRAM from [here](https://github.com/efabless/sky130_sram_macros)(a configuration different from what it actually needs) to meet it's memory requirements.

[black_parrot_fe](black_parrot_fe)

[black_parrot](black_parrot)



