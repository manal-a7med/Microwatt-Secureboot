module verif_unit (
    input  wire clk,
    input  wire reset_n,
    input  wire [31:0] data_in,
    output wire [7:0] addr,
    output wire verif_ok
);

    // Combinational mock of the verification logic
    // This assumes data_in[0] indicates validity for demo purposes
    assign addr = 8'h00;
    assign verif_ok = reset_n & data_in[0];

endmodule