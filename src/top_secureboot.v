module top_secureboot (
    input  wire clk,
    input  wire rst,
    output wire [7:0] gpio
);

    wire [31:0] instr;
    wire        verified;

    reg  [7:0] addr = 0;

    // Boot ROM
    boot_rom rom_inst (
        .clk(clk),
        .addr(addr),
        .data(instr)
    );

    // Verification
    verif_unit verif_inst (
        .instr(instr),
        .verified(verified)
    );

    // Fail peripheral
    fail_peripheral fail_inst (
        .clk(clk),
        .rst(rst),
        .fail_in(~verified),
        .gpio(gpio)
    );

    always @(posedge clk or posedge rst) begin
        if (rst)
            addr <= 0;
        else
            addr <= addr + 1;
    end

endmodule
