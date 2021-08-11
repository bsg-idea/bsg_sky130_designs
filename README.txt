
directory structure:
├── bsg_manycore
│   ├── config.tcl
│   ├── sky130A_sky130_fd_sc_hd_config.tcl
│   └── src
│       ├── bsg_manycore_tile_compute_mesh.sdc
│       ├── bsg_manycore_tile_compute_mesh.v
│       ├── hard_mem_1rw_byte_mask_d1024_w32_wrapper.v
│       ├── hard_mem_1rw_d1024_w46_wrapper.v
│       ├── sky130_sram_1kbyte_1rw1r_8x1024_8.bb.v
│       ├── sky130_sram_1kbyte_1rw1r_8x1024_8.lef
│       └── sky130_sram_1kbyte_1rw1r_8x1024_8_TT_1p8V_25C.lib

This bsg_manycore directory can be placed directly in the OpenLane 'designs' folder.

config.tcl & sky130A..._config.tcl contains all the variables that control the flow.

hard_mem_1rw_byte_mask_d1024_w32_wrapper.v & hard_mem_1rw_d1024_w46_wrapper.v are the hacks to use the existing real sram in place of the required srams.

Just one real sram is only used and that is 8x1024 (hacked to get the required configs) and the black box file for this sram is sky130_sram_1kbyte_1rw1r_8x1024_8.bb.v
