module verif_unit (
    input  wire clk,
    input  wire reset_n,
    input  wire [31:0] data_in,
    output reg  [7:0] addr,
    output reg  verif_ok
);

    reg [31:0] checksum;
    reg [7:0]  count;

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            checksum <= 0;
            count    <= 0;
            addr     <= 0;
            verif_ok <= 0;
        end else begin
            checksum <= checksum ^ data_in; // XOR checksum
            addr <= addr + 1;
            count <= count + 1;

            if (count == 8'd10) begin
                // Expected checksum = 32'hA5A5A5A5 for "valid firmware"
                if (checksum == 32'hA5A5A5A5)
                    verif_ok <= 1;
                else
                    verif_ok <= 0;
            end
        end
    end
endmodule
