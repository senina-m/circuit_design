`timescale 1ns / 1ps
module my_xor(input a, input b, output out);
wire ab, r_a, r_b;

    nand(ab, a, b);
    nand(r_a, ab, a);
    nand(r_b, ab, b);
    nand(out, r_a, r_b);
endmodule