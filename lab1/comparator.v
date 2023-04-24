`timescale 1ns / 1ps

module comparator (
    input [3:0] a,
    input [3:0] b,
    output out);

wire [3:0] c;
wire [3:0] d;
wire [1:0] e;
wire [1:0] f;
wire n_out;

my_xor xor1(.out(c[0]), .a(a[0]), .b(b[0]));
my_xor xor2(.out(c[1]), .a(a[1]), .b(b[1]));
my_xor xor3(.out(c[2]), .a(a[2]), .b(b[2]));
my_xor xor4(.out(c[3]), .a(a[3]), .b(b[3]));

nand(d[0], c[0], c[0]);
nand(d[1], c[1], c[1]);
nand(d[2], c[2], c[2]);
nand(d[3], c[3], c[3]);

nand(e[0], d[0], d[1]);
nand(e[1], d[2], d[3]);

nand(f[0], e[0], e[0]);
nand(f[1], e[1], e[1]);

nand(n_out, f[0], f[1]);
nand(out, n_out, n_out);

endmodule
