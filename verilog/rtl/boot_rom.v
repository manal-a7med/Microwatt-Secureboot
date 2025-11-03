
module boot_rom(
    input [7:0] addr, 
    output [31:0] data
    );

    // Ultra-simple 16-entry ROM
    assign data = (addr < 8'h10) ? {28'h0, addr[3:0]} : 32'h0;
endmodule