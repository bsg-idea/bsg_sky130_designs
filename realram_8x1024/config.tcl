# Design
set ::env(DESIGN_NAME) "realram_8x1024"

#set ::env(FP_PDN_VOFFSET) 0
#set ::env(FP_PDN_VPITCH) 30

set ::env(VERILOG_FILES) [glob $::env(DESIGN_DIR)/src/*.v]
set ::env(VERILOG_FILES_BLACKBOX) [glob $::env(DESIGN_DIR)/src/*.bb.v]
set ::env(SDC_FILE) "./designs/realram_8x1024/src/realram_8x1024.sdc"
set ::env(DESIGN_IS_CORE) 1
set ::env(FP_PDN_CORE_RING) 1
set ::env(VDD_NETS) [list {vccd1}]
set ::env(GND_NETS) [list {vssd1}]
set ::env(SYNTH_USE_PG_PINS_DEFINES) "USE_POWER_PINS"
set ::env(MACRO_PLACEMENT_CFG) $::env(DESIGN_DIR)/macro_placement.cfg
set ::env(PL_BASIC_PLACEMENT) 1

set ::env(LIB_SYNTH_COMPLETE) [glob $::env(DESIGN_DIR)/src/*.lib]

set ::env(CELL_PAD) "6"
set ::env(PL_DIAMOND_SEARCH_HEIGHT) "850"
set ::env(CLOCK_PERIOD) "50"
set ::env(CLOCK_PORT) "clk"
set ::env(CLOCK_NET) $::env(CLOCK_PORT)
set ::env(CLOCK_TREE_SYNTH) "0"
set ::env(GLB_RT_ALLOW_CONGESTION) "0"
set ::env(PL_SKIP_INITIAL_PLACEMENT) "0"

set ::env(EXTRA_LEFS) [glob $::env(DESIGN_DIR)/src/*.lef]
set ::env(SYNTH_READ_BLACKBOX_LIB) 1
set ::env(PDN_CFG) [glob $::env(DESIGN_DIR)/pdn.tcl]

set filename $::env(OPENLANE_ROOT)/designs/$::env(DESIGN_NAME)/$::env(PDK)_$::env(STD_CELL_LIBRARY)_config.tcl
if { [file exists $filename] == 1} {
	source $filename
}
