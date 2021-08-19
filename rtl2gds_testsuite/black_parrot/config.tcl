# Design
set ::env(DESIGN_NAME) "black_parrot"


#set ::env(FP_PDN_VOFFSET) 0
#set ::env(FP_PDN_VPITCH) 30

set ::env(VERILOG_FILES) [glob $::env(DESIGN_DIR)/src/*.v]
set ::env(VERILOG_FILES_BLACKBOX) [glob $::env(DESIGN_DIR)/src/*.bb.v]
set ::env(SDC_FILE) "./designs/black_parrot/src/black_parrot.sdc"
set ::env(DESIGN_IS_CORE) 1
set ::env(FP_PDN_CORE_RING) 1
set ::env(VDD_NETS) [list {vccd1}]
set ::env(GND_NETS) [list {vssd1}]
set ::env(SYNTH_USE_PG_PINS_DEFINES) "USE_POWER_PINS"

set ::env(LIB_SYNTH_COMPLETE) [glob $::env(DESIGN_DIR)/src/*.lib]
set ::env(FP_PDN_CHECK_NODES) 0

set ::env(CELL_PAD) "4"
set ::env(PL_DIAMOND_SEARCH_HEIGHT) "800"
set ::env(CLOCK_PERIOD) "320"
set ::env(CLOCK_PORT) "clk_i"
set ::env(CLOCK_NET) $::env(CLOCK_PORT)
set ::env(ALLOW_CONGESTION) 0
set ::env(EXTRA_LEFS) [glob $::env(DESIGN_DIR)/src/*.lef]
set ::env(SYNTH_READ_BLACKBOX_LIB) 1
set ::env(PL_OPENPHYSYN_OPTIMIZATIONS) 0
#set ::env(PL_OPTIMIZE_MIRRORING) 0
set ::env(PL_SKIP_INITIAL_PLACEMENT) 1
set ::env(PL_RESIZER_DESIGN_OPTIMIZATIONS) 0

set ::env(RUN_KLAYOUT_DRC) 0
set ::env(RUN_KLAYOUT_XOR) 0

set filename $::env(OPENLANE_ROOT)/designs/$::env(DESIGN_NAME)/$::env(PDK)_$::env(STD_CELL_LIBRARY)_config.tcl
if { [file exists $filename] == 1} {
	source $filename
}
