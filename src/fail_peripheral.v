module fail_peripheral (
    input  wire clk,
    input  wire rst,
    input  wire fail_in,
    output reg  [7:0] gpio
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            gpio <= 8'h00;
        else if (fail_in)
            gpio <= 8'hFF;
    end

endmodule
