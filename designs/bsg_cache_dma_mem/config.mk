
export DESIGN_NICKNAME = bsg_cache_dma_mem
export DESIGN_NAME = bsg_cache_dma
export PLATFORM    = sky130hd

export VERILOG_FILES_BLACKBOX = ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/*.bb.v


export VERILOG_FILES = ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/top.v \
./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/bsg_mem_1r1w_width_p32_els_p8_read_write_same_addr_p0.v\
					   $(VERILOG_FILES_BLACKBOX)

export SDC_FILE      = ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/constraint.sdc
export RCX_RULES     = $(PLATFORM_DIR)/rcx_patterns.rules

export DIE_AREA 	= 0 0 2920 3520
export CORE_AREA 	= 20 20 2900 3500

export chameleon_DIR = $(PLATFORM_DIR)/chameleon

# gds files are massive and are zipped in platforms/sky130hd/chameleon/gds -- Please unzip them locally 
#export ADDITIONAL_GDS_FILES  = $(chameleon_DIR)/gds/apb_sys_0.gds \
#                               $(chameleon_DIR)/gds/DMC_32x16HC.gds \
#                               $(chameleon_DIR)/gds/DFFRAM_4K.gds \
#                               $(chameleon_DIR)/gds/ibex_wrapper.gds

export ADDITIONAL_LEFS  = ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/sram_32x8.lef

#export MACRO_PLACEMENT = $(chameleon_DIR)/chameleon.macro_placment.cfg

#export PDN_CFG = $(chameleon_DIR)/pdn.cfg
#
export _VDD_NET_NAME = vccd1
export _GND_NET_NAME = vssd1
#export _V_OFFSET = 14
#export _H_OFFSET = $(_V_OFFSET)
#export _V_PITCH = 180
#export _H_PITCH = 180
#export _V_PDN_OFFSET = 0
#export _H_PDN_OFFSET = 0
#export _SPACING = 1.7
#export _WIDTH = 3
#export CONNECT_GRIDS = 1

export FP_PDN_RAIL_WIDTH = 0.48
export FP_PDN_RAIL_OFFSET = 0

# IR drop estimation supply net name to be analyzed and supply voltage variable
# For multiple nets: PWR_NETS_VOLTAGES  = "VDD1 1.8 VDD2 1.2"
export PWR_NETS_VOLTAGES  = "VDD 1.8"
export GND_NETS_VOLTAGES  = "VSS 0.0"
