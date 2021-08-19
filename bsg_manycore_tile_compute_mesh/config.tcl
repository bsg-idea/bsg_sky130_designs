# Design
set ::env(DESIGN_NAME) "bsg_manycore_tile_compute_mesh"

#set ::env(FP_PDN_VOFFSET) 0
#set ::env(FP_PDN_VPITCH) 30

set ::env(VERILOG_FILES) "$::env(DESIGN_DIR)/src/*.v"
#puts $::env(VERILOG_FILES)
#set ::env(VERILOG_FILES) $::env(DESIGN_DIR)/src/bsg_manycore_tile_compute_mesh.v"
#set ::env(VERILOG_FILES) "$::env(DESIGN_DIR)/src/bsg_manycore_pkg.v"
#set ::env(VERILOG_FILES) "$::env(DESIGN_DIR)/src/bsg_defines.v"
#set ::env(VERILOG_FILES) "$::env(DESIGN_DIR)/src/bsg_noc_pkg.v"
#set ::env(VERILOG_FILES) "$::env(DESIGN_DIR)/src/bsg_noc_links.v"

set ::env(VERILOG_FILES_BLACKBOX) [glob $::env(DESIGN_DIR)/src/*.bb.v]
set ::env(SDC_FILE) "$::env(DESIGN_DIR)/src/bsg_manycore_tile_compute_mesh.sdc"
set ::env(DESIGN_IS_CORE) 1

#set ::env(LIB_SYNTH_COMPLETE) [glob $::env(DESIGN_DIR)/src/*.lib]
set ::env(FP_HORIZONTAL_HALO) "5"
set ::env(FP_VERTICAL_HALO) "5"
set ::env(CELL_PAD) "4"
set ::env(ROUTING_CORES) "6"
set ::env(PL_DIAMOND_SEARCH_HEIGHT) "415"
set ::env(CLOCK_PERIOD) "50"
set ::env(CLOCK_PORT) "clk_i"
set ::env(CLOCK_NET) $::env(CLOCK_PORT)
#set ::env(CLOCK_TREE_SYNTH) "0"
set ::env(GLB_RT_ALLOW_CONGESTION) "1"

set ::env(EXTRA_LEFS) [glob $::env(DESIGN_DIR)/src/*.lef]
set ::env(SYNTH_READ_BLACKBOX_LIB) 1

set filename $::env(OPENLANE_ROOT)/designs/$::env(DESIGN_NAME)/$::env(PDK)_$::env(STD_CELL_LIBRARY)_config.tcl
if { [file exists $filename] == 1} {
        source $filename
}

