export DESIGN_NICKNAME = bp_fe
export DESIGN_NAME = bp_fe_top
export PLATFORM    = sky130hd

export VERILOG_FILES = ./designs/src/$(DESIGN_NAME)/pickled.v \
                       ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/macros.v
export SDC_FILE      = ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/constraint.sdc

export ADDITIONAL_LEFS = $(sort $(wildcard ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/*.lef))
export ADDITIONAL_LIBS = $(sort $(wildcard ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/*.lib))

export MACRO_PLACE_HALO = 100 100
export MACRO_PLACE_CHANNEL = 200 200
# These values must be multiples of placement site
# x=0.19 y=1.4
export DIE_AREA    = 0 0 4940 4340
export CORE_AREA   = 57 28 4560 4060
#export CORE_UTILIZATION = 20 
#export CORE_ASPECT_RATIO = 1
#export CORE_MARGIN = 2

export PLACE_DENSITY = 0.03
export PLACE_DENSITY_MAX_POST_HOLD = 0.03
