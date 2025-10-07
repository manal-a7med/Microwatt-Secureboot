module verif_unit (
    input  wire [31:0] instr,
    output wire        verified
);

    // Dummy rule: valid only if instr == DEADBEEF
    assign verified = (instr == 32'hDEADBEEF);

endmodule
