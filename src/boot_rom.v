//module boot_rom (
//    input  wire [7:0] addr,
//    output reg  [31:0] data
//);
//    reg [31:0] mem [0:255];

//`ifndef SYNTHESIS
//    initial begin
      //  $readmemh("src/firmware.hex", mem);
      // $readmemh("../../src/firmware.hex", mem);
     //   $readmemh("../../../src/firmware.hex", mem);
   //  $readmemh("/home/mana/Microwatt-Hackathon/Microwatt-Secureboot/src/firmware.hex", mem);
//    end
//`endif

//    always @(*) begin
//        data = mem[addr];
//    end
//endmodule


// ======================================================
// boot_rom.v — Final Version (Fully Synthesis-Safe for OpenLane)
// ======================================================
module boot_rom (
    input  wire [7:0]  addr,
    output wire [31:0] data
);

    // 256 x 32-bit ROM implemented with assign statements (no always blocks)
    wire [31:0] rom [0:255];

    assign rom[8'h00] = 32'h00000000;
    assign rom[8'h01] = 32'h00000001;
    assign rom[8'h02] = 32'h00000002;
    assign rom[8'h03] = 32'h00000003;
    assign rom[8'h04] = 32'h00000004;
    assign rom[8'h05] = 32'h00000005;
    assign rom[8'h06] = 32'h00000006;
    assign rom[8'h07] = 32'h00000007;
    assign rom[8'h08] = 32'h00000008;
    assign rom[8'h09] = 32'h00000009;
    assign rom[8'h0A] = 32'h0000000A;
    assign rom[8'h0B] = 32'h0000000B;
    assign rom[8'h0C] = 32'h0000000C;
    assign rom[8'h0D] = 32'h0000000D;
    assign rom[8'h0E] = 32'h0000000E;
    assign rom[8'h0F] = 32'h0000000F;

    // Zero-fill the rest (optional)
    genvar i;
    generate
        for (i = 16; i < 256; i = i + 1) begin : rom_fill
            assign rom[i] = 32'h00000000;
        end
    endgenerate

    // direct combinational read
    assign data = rom[addr];

endmodule


