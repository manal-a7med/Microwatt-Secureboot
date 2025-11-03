module fail_peripheral (
    input  wire clk,
    input  wire reset_n,
    input  wire verif_ok,
    output wire boot_ok,
    output wire boot_fail
);

    // Pure combinational version
    assign boot_ok   = reset_n & verif_ok;
    assign boot_fail = reset_n & ~verif_ok;

endmodule