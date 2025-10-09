module fail_peripheral (
    input  wire clk,
    input  wire reset_n,
    input  wire verif_ok,
    output reg  boot_ok,
    output reg  boot_fail
);

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            boot_ok   <= 0;
            boot_fail <= 0;
        end else begin
            if (verif_ok) begin
                boot_ok   <= 1;
                boot_fail <= 0;
            end else begin
                boot_ok   <= 0;
                boot_fail <= 1;
            end
        end
    end
endmodule
