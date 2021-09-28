# User config
#set ::env(DESIGN_NAME) "bp_multi_top"
#set ::env(DESIGN_NAME) "icache_eaddr_width_p64_paddr_width_p22_data_width_p64_instr_width_p32_num_cce_p1_num_lce_p2_ways_p8_sets_p64"
set ::env(DESIGN_NAME) "bsg_mem_1rw_sync_mask_write_byte_els_p512_data_width_p64"

# Change if needed
set ::env(VERILOG_FILES) [glob $::env(DESIGN_DIR)/src/*.v]
set ::env(SDC_FILE)  [glob $::env(DESIGN_DIR)/src/*.sdc]

set ::env(VERILOG_FILES_BLACKBOX) [glob $::env(DESIGN_DIR)/src/sram/*.bb.v]
set ::env(DESIGN_IS_CORE) 0
set ::env(FP_PDN_CORE_RING) 0
set ::env(GLB_RT_MAXLAYER) 5

#set ::env(PL_RANDOM_GLB_PLACEMENT) 1

set ::env(VDD_NETS) [list {vccd1}]
set ::env(GND_NETS) [list {vssd1}]
set ::env(SYNTH_USE_PG_PINS_DEFINES) "USE_POWER_PINS"


set ::env(CELL_PAD) 100
set ::env(PL_DIAMOND_SEARCH_HEIGHT) 600

set ::env(FP_SIZING) absolute
set ::env(DIE_AREA) "0.0 0.0 5200.0 5000.0"
#set ::env(FP_CORE_UTIL) 30
#set ::env(PL_TARGET_DENSITY) [ expr ($::env(FP_CORE_UTIL)+5) / 100.0 ]

set ::env(FP_IO_MODE) 0

set ::env(MACRO_PLACEMENT_CFG) [glob $::env(DESIGN_DIR)/macro.cfg]

set ::env(FP_PDN_ENABLE_GLOBAL_CONNECTIONS) 1

set ::env(FP_PDN_IRDROP) 0

# Fill this
set ::env(CLOCK_PERIOD) "100.000"
set ::env(CLOCK_PORT) "clk_i"


#START Extra Options
set ::env(FP_PDN_CHECK_NODES) 1
#~END Extra Options

set ::env(CLOCK_NET) $::env(CLOCK_PORT)

set ::env(EXTRA_LEFS) [glob $::env(DESIGN_DIR)/src/sram/*.lef]
set ::env(EXTRA_GDS_FILES) [glob $::env(DESIGN_DIR)/src/sram/*.gds]




## SYNTHESIS

## FLOORPLAN

## PLACEMENT
#set ::env(PDN_CFG) [glob $::env(DESIGN_DIR)/pdn2.tcl]



#~


set filename $::env(DESIGN_DIR)/$::env(PDK)_$::env(STD_CELL_LIBRARY)_config.tcl
if { [file exists $filename] == 1} {
	source $filename
}

