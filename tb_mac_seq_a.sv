`timescale 1ns/1ps

module tb_mac_seq_a;

    logic clk = 0;
    logic reset_n = 0;
    logic valid_in = 0;

    logic signed [7:0] data_in;
    logic signed [7:0] weight_in;
    logic signed [19:0] mac_out;
    logic out_valid;

    integer i;
    integer expected;

    mac_seq_a dut (
        .clk(clk),
        .reset_n(reset_n),
        .valid_in(valid_in),
        .data_in(data_in),
        .weight_in(weight_in),
        .mac_out(mac_out),
        .out_valid(out_valid)
    );

    always #5 clk = ~clk;

    initial begin
        data_in = 0;
        weight_in = 0;
        expected = 0;

        repeat (2) @(negedge clk);
        reset_n = 1;

        for (i = 0; i < 8; i = i + 1) begin
            @(negedge clk);
            valid_in = 1;
            data_in = i - 3;
            weight_in = i - 2;

            expected = expected
                     + (i - 3) * (i - 2);
        end

        @(negedge clk);
        valid_in = 0;

        // Wait for the output-valid pulse.
        wait (out_valid === 1'b1);
        #1;

        if (mac_out === expected)
            $display("PASS: output=%0d expected=%0d",
                     mac_out, expected);
        else
            $display("FAIL: output=%0d expected=%0d",
                     mac_out, expected);

        $finish;
    end

endmodule
