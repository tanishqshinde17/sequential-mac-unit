`timescale 1ns/1ps

module mac_seq_a (
    input logic clk, reset_n, valid_in,
    input logic signed [7:0] data_in, weight_in,
    output logic signed [19:0] mac_out,
    output logic out_valid
);

    logic [3:0] count;
    logic signed [19:0] acc;
    logic signed [15:0] product;

    assign product = data_in * weight_in;

    always_ff @(posedge clk) begin
        if (!reset_n) begin
            count <= 0;
            acc <= 0;
            mac_out <= 0;
            out_valid <= 0;
        end else begin
            out_valid <= 0;
            if (valid_in && count < 8) begin
                if (count == 0)
                    acc <= product;
                else
                    acc <= acc + product;

                if (count == 7) begin
                    mac_out <= acc + product;
                    out_valid <= 1;
                    count <= 0;
                    acc <= 0;
                end else begin
                    count <= count + 1;
                end
            end
        end
    end
endmodule
