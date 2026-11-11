`timescale 1ns/1ps
module gpio_soc_tb;
    reg RESET = 1'b1;
    reg RXD = 1'b1;
    wire [4:0] LEDS;
    wire TXD;

    SOC dut (.RESET(RESET), .LEDS(LEDS), .RXD(RXD), .TXD(TXD));

    initial begin
        $dumpfile("gpio_soc.vcd");
        $dumpvars(0, gpio_soc_tb);

        #100 RESET = 1'b0;

        #20000000;

        $display("DEBUG: clk_int=%b clk=%b resetn=%b PC=%h GPIO=%h",
                 dut.clk_int, dut.clk, dut.resetn,
                 dut.CPU.PC, dut.GPIO_IP.gpio_reg);

        $finish;
    end
endmodule
