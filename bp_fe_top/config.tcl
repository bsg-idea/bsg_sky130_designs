
set ::env(DESIGN_NAME) "bp_fe_top"

# Change if needed
set ::env(VERILOG_FILES) [glob $::env(DESIGN_DIR)/src/*.v]
set ::env(SDC_FILE)  [glob $::env(DESIGN_DIR)/src/*.sdc]

set ::env(VERILOG_FILES_BLACKBOX) [glob $::env(DESIGN_DIR)/src/*.bb.v]
set ::env(DESIGN_IS_CORE) 1
set ::env(FP_PDN_CORE_RING) 1
#set ::env(GLB_RT_MAXLAYER) 5

set ::env(VDD_NETS) [list {vccd1}]
set ::env(GND_NETS) [list {vssd1}]
set ::env(SYNTH_USE_PG_PINS_DEFINES) "USE_POWER_PINS"
#set ::env(PL_BASIC_PLACEMENT) "1"
set ::env(PL_DIAMOND_SEARCH_HEIGHT) "500"

# Fill this
set ::env(CLOCK_PERIOD) "100.000"
set ::env(CLOCK_PORT) "clk_i"


#START Extra Options
set ::env(FP_PDN_CHECK_NODES) 0
#~END Extra Options
set ::env(PDN_CFG) [glob $::env(DESIGN_DIR)/pdn.tcl]
set ::env(CLOCK_NET) $::env(CLOCK_PORT)

set ::env(EXTRA_LEFS) [glob $::env(DESIGN_DIR)/src/*.lef]


# These values must be multiples of placement site
# x=0.19 y=1.4
#export DIE_AREA    = 0 0 999.97 799.4
#export CORE_AREA   = 10.07 9.8 989.9 789.6


#export PLACE_DENSITY = 0.12
#export PLACE_DENSITY_MAX_POST_HOLD = 0.12
