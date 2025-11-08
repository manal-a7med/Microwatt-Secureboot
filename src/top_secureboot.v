module top_secureboot (
    input  wire        clk,
    input  wire        reset_n,
    output wire        boot_ok,
    output wire        boot_fail,
    input  wire        VPWR,
    input  wire        VGND
);

    // Boot ROM wires
    wire [31:0] rom_data;
    wire [8:0]  rom_addr;    // 9-bit internal
    wire [7:0]  verif_addr;  // 8-bit addr produced by verif_unit

    // Verification unit wires
    wire verif_ok;

    // Internal SRAM interface
    wire [31:0] sram_din;
    wire [31:0] sram_dout;
    wire [8:0]  sram_addr;
    wire        sram_we;
    wire        sram_cs;

    // --- Instances ---

    // Boot ROM instance (boot_rom expects 8-bit addr)
    boot_rom rom_inst (
        .addr(verif_addr),    // connect verif_addr (8-bit) directly to ROM
        .data(rom_data)
    );

    // Verification unit instance — ensure your verif_unit module
    // actually declares an 8-bit output `addr`.
    verif_unit verif_inst (
        .clk(clk),
        .reset_n(reset_n),
        .data_in(rom_data),
        .addr(verif_addr),
        .verif_ok(verif_ok)
        // If verif_unit will later drive sram control/data, add ports here.
    );

    // Fail peripheral
    fail_peripheral fail_inst (
        .clk(clk),
        .reset_n(reset_n),
        .verif_ok(verif_ok),
        .boot_ok(boot_ok),
        .boot_fail(boot_fail)
    );

    // Connect rom_addr (9-bit) from verif_addr (8-bit) — zero-extend MSB
    assign rom_addr = {1'b0, verif_addr};
    // For simple flow now: map sram_addr <- rom_addr
    assign sram_addr = rom_addr;

    // Default safe values for SRAM control/data until you implement writes:
    // - keep chip enabled when needed (example defaults)
    assign sram_cs  = 1'b1;     // active-high in your top logic (invert for csb)
    assign sram_we  = 1'b0;     // default read-only
    assign sram_din = 32'b0;    // safe default (drives the blackbox port)

    // SRAM instance (blackbox)
    sky130_sram_2kbyte_1rw1r_32x512_8 u_sram (
        .clk0(clk),
        .csb0(~sram_cs),      // macro expects active-low csb0
        .web0(~sram_we),      // macro expects active-low web0
        .addr0(sram_addr),
        .din0(sram_din),
        .dout0(sram_dout),
        .vccd1(VPWR),
        .vssd1(VGND),
        .clk1(clk),
        .csb1(1'b1),          // disable second port
        .addr1(9'b0),
        .dout1()
    );

endmodule
