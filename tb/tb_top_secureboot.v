`timescale 1ns/1ps
module tb_top_secureboot;

    reg clk = 0;
    reg rst = 1;
    wire [7:0] gpio;

    top_secureboot dut (
        .clk(clk),
        .rst(rst),
        .gpio(gpio)
    );

    always #5 clk = ~clk; // 100 MHz

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_top_secureboot);

        #20 rst = 0;       // release reset
        #200 $finish;
    end

endmodule
