module sky130_sram_2kbyte_1rw1r_32x512_8 (
    input  wire clk0,      // clock for port 0 (read/write)
    input  wire csb0,      // active-low chip select for port 0
    input  wire web0,      // active-low write enable for port 0
    input  wire [8:0] addr0, // 9-bit address (512 depth)
    input  wire [31:0] din0, // data input
    output wire [31:0] dout0,// data output
    input  wire clk1,      // clock for port 1 (read-only)
    input  wire csb1,      // active-low chip select for port 1
    input  wire [8:0] addr1,// address for read-only port
    output wire [31:0] dout1,// data output for read-only port
    input  wire vccd1,     // power
    input  wire vssd1      // ground
);