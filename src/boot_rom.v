module boot_rom (
    input  wire [7:0] addr,
    output reg  [31:0] data
);
    reg [31:0] mem [0:255];

    initial begin
        $readmemh("src/firmware.hex", mem);
    end

    always @(*) begin
        data = mem[addr];
    end
endmodule
