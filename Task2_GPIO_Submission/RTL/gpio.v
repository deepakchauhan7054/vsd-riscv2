module GPIO (
    input         clk,
    input         gpio_write,
    input  [31:0] gpio_wdata,
    output [31:0] gpio_rdata,
    output [31:0] gpio_out
);

    reg [31:0] gpio_reg = 32'b0;

    always @(posedge clk) begin
        if (gpio_write)
            gpio_reg <= gpio_wdata;
    end

    assign gpio_rdata = gpio_reg;
    assign gpio_out   = gpio_reg;

endmodule
