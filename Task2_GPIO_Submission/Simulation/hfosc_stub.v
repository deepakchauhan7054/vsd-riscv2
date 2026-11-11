`timescale 1ns/1ps

module SB_HFOSC #(
    parameter CLKHF_DIV = "0b00"
) (
    input CLKHFPU,
    input CLKHFEN,
    output reg CLKHF = 1'b0
);
    always #5 CLKHF = ~CLKHF;
endmodule
