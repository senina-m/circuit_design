`timescale 1ns / 1ps
module mul_tb;

reg clk_reg, start, in_rst;
reg [7:0] in_a, in_b;
wire [15:0] out;
wire out_busy;

mul mul_inst(
    .clk_i(clk_reg),
    .rst_i(in_rst),
    .a_bi(in_a),
    .b_bi(in_b),
    .start_i(start),
    .busy_o(out_busy),
    .y_bo(out)
);    

initial begin
    clk_reg = 1;
    forever
        #10
        clk_reg = ~clk_reg;
end

initial begin
    in_a = 3;
    in_b = 5;
    in_rst = 1;
    #10
    in_rst = 0;
    start = 1;
    #20
    start = 0;
    
    #120
    
    $display("Output: 0x%h", out);
    
end

endmodule