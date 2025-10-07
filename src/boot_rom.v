module boot_rom #(
    parameter ADDR_WIDTH = 8,
    parameter DATA_WIDTH = 32
) (
    input  wire                  clk,
    input  wire [ADDR_WIDTH-1:0] addr,
    output reg  [DATA_WIDTH-1:0] data
);

    reg [DATA_WIDTH-1:0] rom [0:(1<<ADDR_WIDTH)-1];

    initial begin
        $readmemh("src/firmware.hex", rom);
    end

    always @(posedge clk) begin
        data <= rom[addr];
    end

endmodule
