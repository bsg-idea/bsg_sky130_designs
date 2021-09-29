Folders/Designs:
i) bp_fe -> Black Parrot Front End with fakerams
ii) bsg_cache_dma_mem -> Cache DMA design with fakeram
iii) bsg_manycore_tile_compute_mesh_real -> Manycore tile design with a hacked-up real SRAM 
iv) serv_fr -> Serv Processor design with fakeram
v) tinyRocket ->  tinyRocket processor design with fakerams

To run any design in OpenROAD, simply place the respective folder in OpenROAD directory -> designs/sky130hd/ and,
give the usual make command to run it.

Eg:- make DESIGN_CONFIG=designs/sky130hd/bp_fe/config.mk

The logs (of the run) for each of the designs are included in their respective folders.

Eg:- bp_fe/logs/


Issues:
-The BlackParrot frontend design (bp_fe) fails at global routing stage with routing congestion too high error. 
-The Serv Processor (serv_fr) and tinyRocket processor designs fail with 'no ap for pin wmask_in[0]' error.
-The Manycore tile design (bsg_manycore_tile_compute_mesh_real) for some reason keeps skipping macro placement though the macro is provided.
-The Cache DMA design (bsg_cache_dma_mem) is the design with an SRAM macro that was put through the flow successfully.
