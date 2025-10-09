module top_secureboot (
    input  wire clk,
    input  wire reset_n,
    output wire boot_ok,
    output wire boot_fail
);
    // Boot ROM wires
    wire [31:0] rom_data;
    wire [7:0]  rom_addr;

    // Verification unit wires
    wire verif_ok;

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

endmodule
