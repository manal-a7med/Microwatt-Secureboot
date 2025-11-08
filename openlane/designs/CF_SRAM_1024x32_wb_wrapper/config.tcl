# =========================================================
# OpenLane Configuration for CF_SRAM_1024x32_wb_wrapper
# =========================================================

# Power connections for SRAM macro
set ::env(VDD_NETS) "VPWR"
set ::env(GND_NETS) "VGND"
set ::env(FP_PDN_MACRO_HOOKS) "i_sram VPWR VGND VPWR VGND"

set ::env(MACRO_POWER_PINS) "VPWR VGND vpb vnb"


# Design name
set ::env(DESIGN_NAME) CF_SRAM_1024x32_wb_wrapper

# Path to Verilog source
set ::env(VERILOG_FILES) "$::env(DESIGN_DIR)/../../ip/CF_SRAM_1024x32/hdl/bus_wrapper/CF_SRAM_1024x32_wb_wrapper.v"

# Library file (timing)
set ::env(LIB_FILES) "$::env(DESIGN_DIR)/../../ip/CF_SRAM_1024x32/lib/CF_SRAM_1024x32.lib"

# LEF file (physical abstract)
set ::env(MACRO_LEFS) "$::env(DESIGN_DIR)/../../ip/CF_SRAM_1024x32/lef/CF_SRAM_1024x32.lef"

# GDS file (for hard macro integration)
set ::env(GDS_FILES) "$::env(DESIGN_DIR)/../../ip/CF_SRAM_1024x32/gds/CF_SRAM_1024x32.gds"

# Clock configuration
set ::env(CLOCK_PORT) clk
set ::env(CLOCK_PERIOD) 10.0

# Skip IO mismatch warnings for hard macros
set ::env(DONT_TOUCH_MACROS) 1
