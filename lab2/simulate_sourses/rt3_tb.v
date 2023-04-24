`timescale 1ns / 1ps
module rt3_tb;
reg clk_reg, start, in_rst;
reg [7:0] in;
wire [3:0] out;
wire out_busy;

rt3 rt3_inst(
    .clk_i(clk_reg),
    .rst_i(in_rst),
    .a_i(in),
    .start_i(start),
    .y_bo(out),
    .busy_o(out_busy)
);

initial begin
    clk_reg = 1;
    forever
        #1
        clk_reg = ~clk_reg;
end

initial begin
    in = 64;
    in_rst = 1;
    #2
    in_rst = 0;
    start = 1;
    #4
    start = 0;
    #500
    if (~out_busy) begin
        $display("Output: 0x%h", out);
    end else begin
        $display("Still not ready");
    end 
end
endmodule
