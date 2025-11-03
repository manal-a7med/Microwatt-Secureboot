`timescale 1ns/1ps

module tb_top_secureboot;
    reg clk;
    reg reset_n;
    wire boot_ok, boot_fail;

    // DUT
    top_secureboot dut (
        .clk(clk),
        .reset_n(reset_n),
        .boot_ok(boot_ok),
        .boot_fail(boot_fail)
    );

    // Clock generation
    always #5 clk = ~clk;

    task run_test(input [255*8:1] firmware_file, input expect_pass);
        begin
            $display("=========================================");
            $display(" Running test with %s", firmware_file);
            $display("=========================================");

            // Load firmware
            $readmemh(firmware_file, dut.rom_inst.mem);

            // Reset cycle
            reset_n = 0; clk = 0;
            #20 reset_n = 1;

            // Run simulation
            #300;

            if (expect_pass && boot_ok)
                $display("✅ PASS: Boot Successful as expected.");
            else if (!expect_pass && boot_fail)
                $display("✅ PASS: Boot Failed as expected.");
            else
                $display("❌ FAIL: Unexpected result!");

            #20;
        end
    endtask

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_top_secureboot);

        // Test with valid firmware
        run_test("src/firmware.hex", 1);

        // Test with tampered firmware
        run_test("src/firmware_tampered.hex", 0);

        $finish;
    end
endmodule
