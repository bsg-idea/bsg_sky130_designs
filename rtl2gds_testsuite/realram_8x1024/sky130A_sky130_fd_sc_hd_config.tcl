# SCL Configs
set ::env(GLB_RT_ADJUSTMENT) 0.2

#set ::env(FP_SIZING) "absolute"
#set ::env(DIE_AREA) "0 0 1000 1000"
set ::env(SYNTH_MAX_FANOUT) 6
set ::env(CLOCK_PERIOD) "50"
set ::env(FP_CORE_UTIL) "15"
set ::env(PL_TARGET_DENSITY) [ expr ($::env(FP_CORE_UTIL)+5) / 100.0 ]
#set ::env(PL_TARGET_DENSITY) "10"

