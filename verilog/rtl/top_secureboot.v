module top_secureboot (
    input  wire clk,
    input  wire reset_n,
    output wire boot_ok,
    output wire boot_fail,
    input  wire VPWR,
    input  wire VGND
);

    // Boot ROM wires
    wire [31:0] rom_data;
    wire [7:0]  rom_addr;

    // Verification unit wires
    wire verif_ok;

    // Internal SRAM interface
    wire [31:0] sram_din;
    wire [31:0] sram_dout;
    wire [8:0]  sram_addr;
    wire        sram_we;
    wire        sram_cs;

    // Boot ROM instance
    boot_rom rom_inst (
        .addr(rom_addr),
        .data(rom_data)
    );

    // Verification unit instance
    verif_unit verif_inst (
        .clk(clk),
        .reset_n(reset_n),
        .data_in(rom_data),
        .addr(rom_addr),
        .verif_ok(verif_ok)
    );

    // Fail peripheral
    fail_peripheral fail_inst (
        .clk(clk),
        .reset_n(reset_n),
        .verif_ok(verif_ok),
        .boot_ok(boot_ok),
        .boot_fail(boot_fail)
    );

    // SRAM instance (1RW + 1R)
    sky130_sram_2kbyte_1rw1r_32x512_8 u_sram (
        // Port 0 : Read/Write
        .clk0  (clk),
        .csb0  (~sram_cs),   // active-low
        .web0  (~sram_we),   // active-low
        .addr0 (sram_addr),
        .din0  (sram_din),
        .dout0 (sram_dout),

        // Port 1 : Unused read-only port (tie off)
        .clk1  (1'b0),
        .csb1  (1'b1),
        .addr1 (9'd0),
        .dout1 (),

        // Power connections
        .vccd1 (VPWR),
        .vssd1 (VGND)
    );

endmodule
