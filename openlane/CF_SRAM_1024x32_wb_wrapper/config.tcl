# ======================================================
# Config file for CF_SRAM_1024x32_wb_wrapper hardening
# ======================================================

set ::env(DESIGN_NAME) CF_SRAM_1024x32_wb_wrapper

# Path to SRAM macro source
set ::env(MACRO_PLACEMENT_CFG) "$::env(DESIGN_DIR)/macro.cfg"

# Include SRAM LEF and GDS files
set ::env(MACRO_LEFS) "$::env(DESIGN_DIR)/../../ip/CF_SRAM_1024x32/lef/CF_SRAM_1024x32.lef"
set ::env(MACRO_GDS_FILES) "$::env(DESIGN_DIR)/../../ip/CF_SRAM_1024x32/gds/CF_SRAM_1024x32.gds"

# --- Verilog Sources ---
set ::env(VERILOG_FILES) "\
    $::env(DESIGN_DIR)/../../ip/CF_SRAM_1024x32/hdl/CF_SRAM_1024x32.v \
    $::env(DESIGN_DIR)/../../ip/CF_SRAM_1024x32/hdl/bus_wrapper/CF_SRAM_1024x32_wb_wrapper.v \
    $::env(DESIGN_DIR)/../../ip/CF_SRAM_1024x32/hdl/controllers/ram_controller_wb.v \
"


set ::env(EXTRA_VERILOG_MODELS) "\
    $::env(DESIGN_DIR)/../../ip/CF_SRAM_1024x32/hdl/CF_SRAM_1024x32_stub.v \
"

# --- Library and GDS/LEF files ---
set ::env(EXTRA_LIBS) "\
    $::env(DESIGN_DIR)/../../ip/CF_SRAM_1024x32/lib/CF_SRAM_1024x32_tt_180V_25C.lib \
"
set ::env(EXTRA_GDS_FILES) "\
    $::env(DESIGN_DIR)/../../ip/CF_SRAM_1024x32/gds/CF_SRAM_1024x32.gds \
"
set ::env(EXTRA_LEFS) "\
    $::env(DESIGN_DIR)/../../ip/CF_SRAM_1024x32/lef/CF_SRAM_1024x32.lef \
"

# --- Basic Flow Settings ---
set ::env(CLOCK_PORT) "wb_clk_i"
set ::env(CLOCK_PERIOD) "25.0"

set ::env(FP_SIZING) "absolute"
set ::env(DIE_AREA) "0.000 0.000 380 435"
set ::env(CORE_AREA) "5.000 5.000 375 430"


set ::env(VDD_NETS) "vccd1 vpwrac vpwrpc"
set ::env(GND_NETS) "vssd1 vssd1 vssd1"
set ::env(FP_PDN_MACRO_HOOKS) "vpwrac:vssd1 vpwrpc:vssd1"


# --- Power Grid Settings ---
set ::env(FP_PDN_CORE_RING) 0
set ::env(FP_PDN_CFG) "$::env(DESIGN_DIR)/pdn.tcl"

# Hook macro power pins

# --- Placement and Routing ---
set ::env(PL_TARGET_DENSITY) 0.15
set ::env(PL_TIME_DRIVEN) 0
set ::env(PL_ROUTABILITY_DRIVEN) 1

# --- Misc Options ---
set ::env(QUIT_ON_LINTER_ERRORS) 0
set ::env(QUIT_ON_SYNTH_CHECKS) 0
set ::env(QUIT_ON_YOSYS_WARNINGS) 0
set ::env(QUIT_ON_MAGIC_DRC) 0
set ::env(MAGIC_EXT_USE_GDS) 0
