module cla_8bit_sat(
input logic [7:0] A,
input logic [7:0] B,
output logic [7:0] Sum,
output logic [8:0] Final_Sum,
output logic UDF,
output logic OVF
);

logic [7:0]P, G;
logic [8:0]C;
assign C[0] = 1'b0;

assign OVF = (~A[7] & ~B[7] & Sum[7]);
assign UDF = (A[7] & B[7] & ~Sum[7]);

//assign sat = OVF ? 8'd127 :
//UDF ? -8'd128 :
//Sum[7:0];


genvar i;
generate
for(i=0;i<8; i++)
	begin : generate_PL
	propagate_logic pl (.a(A[i]), .b(B[i]), .p(P[i]));
	end
endgenerate

genvar j;
generate
for(j=0; j<8; j=j+1) begin : generate_GL
generate_logic gl (.a(A[j]), .b(B[j]), .g(G[j]));
end
endgenerate


genvar k;
generate
for(k = 0; k < 8; k = k + 1) begin : sum_block
sum_logic sl (
.a(A[k]),
.b(B[k]),
.Cin(C[k]),// C[0] = 0 for first bit
.s(Sum[k]));
end
endgenerate

sum_logic sl_8 (.a(A[7]), // sign extension
.b(B[7]), // sign extension
.Cin(C[8]), // carry out from the fourth slice
.s(Sum[8])); // sign extended 5th sum bit


//assign Sum[8] = Sum[7] ^ (C[7] ^ C[8]);
// Assign carry-out as final MSB
//assign Sum[8] = C[8];

CLA_carry_logic_0 cl0 (
.p0(P[0]),
.g0(G[0]),
.ci0(1'b0),
.co(C[1])
);

CLA_carry_logic_1 cl1 (
.p0(P[0]),
.g0(G[0]),
.p1(P[1]),
.g1(G[1]),
.ci0(1'b0),
.co(C[2])
);

CLA_carry_logic_2 cl2 (
.p0(P[0]),
.g0(G[0]),
.p1(P[1]),
.g1(G[1]),
.p2(P[2]),
.g2(G[2]),
.ci0(1'b0),
.co(C[3])
);

CLA_carry_logic_3 cl3 (
.p0(P[0]),
.g0(G[0]),
.p1(P[1]),
.g1(G[1]),
.p2(P[2]),
.g2(G[2]),
.p3(P[3]),
.g3(G[3]),
.ci0(1'b0),
.co(C[4])
);

CLA_carry_logic_4 cl4 (
.p0(P[0]),
.g0(G[0]),
.p1(P[1]),
.g1(G[1]),
.p2(P[2]),
.g2(G[2]),
.p3(P[3]),
.g3(G[3]),
.p4(P[4]),
.g4(G[4]),
.ci0(1'b0),
.co(C[5])
);

CLA_carry_logic_5 cl5 (
.p0(P[0]),
.g0(G[0]),
.p1(P[1]),
.g1(G[1]),
.p2(P[2]),
.g2(G[2]),
.p3(P[3]),
.g3(G[3]),
.p4(P[4]),
.g4(G[4]),
.p5(P[5]),
.g5(G[5]),
.ci0(1'b0),
.co(C[6])
);

CLA_carry_logic_6 cl6 (
.p0(P[0]),
.g0(G[0]),
.p1(P[1]),
.g1(G[1]),
.p2(P[2]),
.g2(G[2]),
.p3(P[3]),
.g3(G[3]),
.p4(P[4]),
.g4(G[4]),
.p5(P[5]),
.g5(G[5]),
.p6(P[6]),
.g6(G[6]),
.ci0(1'b0),
.co(C[7])
);

CLA_carry_logic_7 cl7 (
.p0(P[0]),
.g0(G[0]),
.p1(P[1]),
.g1(G[1]),
.p2(P[2]),
.g2(G[2]),
.p3(P[3]),
.g3(G[3]),
.p4(P[4]),
.g4(G[4]),
.p5(P[5]),
.g5(G[5]),
.p6(P[6]),
.g6(G[6]),
.p7(P[7]),
.g7(G[7]),
.ci0(1'b0),
.co(C[8])
);

//assign Sum[8] = Sum[7] ^ (C[7] ^ C[8]);
endmodule

module CLA_carry_logic_1(
input logic p0, g0,
input logic p1, g1,
input logic ci0,
output logic co);

logic nand1_out;
logic nand2_out;
logic nand3_out;

nand3_delay u1 (.a(p1), .b(p0), .c(ci0), .y(nand1_out));

nand2_delay u2 (.a(p1), .b(g0), .y(nand2_out));

nand2_delay u3 (.a(g1), .b(g1), .y(nand3_out));

nand3_delay u4 (.a(nand1_out), .b(nand2_out), .c(nand3_out), .y(co));
endmodule

module CLA_carry_logic_2(
input logic p0,
input logic g0,
input logic p1,
input logic g1,
input logic p2,
input logic g2,
input logic ci0,
output logic co);

logic nand1_out, nand2_out, nand3_out, nand4_out;

nand4_delay u1 (.a(p2), .b(p1), .c(p0), .d(ci0), .y(nand1_out));

nand3_delay u2 (.a(p2), .b(p1), .c(g0), .y(nand2_out));

nand2_delay u3 (.a(p2), .b(g1), .y(nand3_out));

nand2_delay u4 (.a(g2), .b(g2), .y(nand4_out));

nand4_delay u5 (.a(nand1_out), .b(nand2_out), .c(nand3_out), .d(nand4_out), .y(co));
endmodule

module CLA_carry_logic_3(
input logic p0, g0,
input logic p1, g1,
input logic p2, g2,
input logic p3,g3,
input logic ci0,
output logic co);

logic nand1_out, nand2_out, nand3_out;
logic nand4_out, nand5_out;

nand5_delay u1 (.a(p3), .b(p2), .c(p1), .d(p0), .e(ci0), .y(nand1_out));

nand4_delay u2 (.a(p3), .b(p2), .c(p1), .d(g0), .y(nand2_out));

nand3_delay u3 (.a(p3), .b(p2), .c(g1), .y(nand3_out));

nand2_delay u4 (.a(p3), .b(g2), .y(nand4_out));

nand2_delay u5 (.a(g3), .b(g3), .y(nand5_out));

nand5_delay u6 (.a(nand1_out), .b(nand2_out), .c(nand3_out), .d(nand4_out), .e(nand5_out), .y(co));

endmodule

module CLA_carry_logic_4(
input logic p0, g0,
input logic p1, g1,
input logic p2, g2,
input logic p3, g3,
input logic p4, g4,
input logic ci0,
output logic co);

logic nand1_out, nand2_out, nand3_out, nand4_out, nand5_out, nand6_out;

nand6_delay u1 (.a(p4), .b(p3), .c(p2), .d(p1), .e(p0), .f(ci0), .y(nand1_out));

nand5_delay u2 (.a(p4), .b(p3), .c(p2), .d(p1), .e(g0), .y(nand2_out));

nand4_delay u3 (.a(p4), .b(p3), .c(p2), .d(g1), .y(nand3_out));

nand3_delay u4 (.a(p4), .b(p3), .c(g2), .y(nand4_out));

nand2_delay u5 (.a(p4), .b(g3), .y(nand5_out));

nand2_delay u6 (.a(g4), .b(g4), .y(nand6_out));

nand6_delay u7 (.a(nand1_out), .b(nand2_out), .c(nand3_out), .d(nand4_out), .e(nand5_out), .f(nand6_out), .y(co));

endmodule

module CLA_carry_logic_5(
input logic p0, g0,
input logic p1, g1,
input logic p2, g2,
input logic p3, g3,
input logic p4, g4,
input logic p5, g5,
input logic ci0,
output logic co);

logic nand1_out, nand2_out, nand3_out, nand4_out, nand5_out, nand6_out, nand7_out;

nand7_delay u1 (.a(p5), .b(p4), .c(p3), .d(p2), .e(p1), .f(p0), .g(ci0), .y(nand1_out));

nand6_delay u2 (.a(p5), .b(p4), .c(p3), .d(p2), .e(p1), .f(g0), .y(nand2_out));

nand5_delay u3 (.a(p5), .b(p4), .c(p3), .d(p2), .e(g1), .y(nand3_out));

nand4_delay u4 (.a(p5), .b(p4), .c(p3), .d(g2), .y(nand4_out));

nand3_delay u5 (.a(p5), .b(p4), .c(g3), .y(nand5_out));

nand2_delay u6 (.a(p5), .b(g4), .y(nand6_out));

nand2_delay u7 (.a(g5), .b(g5), .y(nand7_out));

nand7_delay u8 (.a(nand1_out), .b(nand2_out), .c(nand3_out), .d(nand4_out), .e(nand5_out), .f(nand6_out), .g(nand7_out), .y(co));
endmodule

module CLA_carry_logic_6(
input logic p0, g0,
input logic p1, g1,
input logic p2, g2,
input logic p3, g3,
input logic p4, g4,
input logic p5, g5,
input logic p6, g6,
input logic ci0,
output logic co);

logic nand1_out, nand2_out, nand3_out, nand4_out, nand5_out, nand6_out, nand7_out, nand8_out;

nand8_delay u1 (.a(p6), .b(p5), .c(p4), .d(p3), .e(p2), .f(p1), .g(p0), .h(ci0), .y(nand1_out));

nand7_delay u2 (.a(p6), .b(p5), .c(p4), .d(p3), .e(p2), .f(p1), .g(g0), .y(nand2_out));

nand6_delay u3 (.a(p6), .b(p5), .c(p4), .d(p3), .e(p2), .f(g1), .y(nand3_out));

nand5_delay u4 (.a(p6), .b(p5), .c(p4), .d(p3), .e(g2), .y(nand4_out));

nand4_delay u5 (.a(p6), .b(p5), .c(p4), .d(g3), .y(nand5_out));

nand3_delay u6 (.a(p6), .b(p5), .c(g4), .y(nand6_out));

nand2_delay u7 (.a(p6), .b(g5), .y(nand7_out));

nand2_delay u8 (.a(g6), .b(g6), .y(nand8_out));

nand8_delay u9 (.a(nand1_out), .b(nand2_out), .c(nand3_out), .d(nand4_out), .e(nand5_out), .f(nand6_out), .g(nand7_out), .h(nand8_out), .y(co));

endmodule

module CLA_carry_logic_7(
input logic p0, g0,
input logic p1, g1,
input logic p2, g2,
input logic p3, g3,
input logic p4, g4,
input logic p5, g5,
input logic p6, g6,
input logic p7, g7,
input logic ci0,
output logic co);

logic nand1_out, nand2_out, nand3_out, nand4_out, nand5_out, nand6_out, nand7_out, nand8_out, nand9_out;

nand9_delay u1 (.a(p7), .b(p6), .c(p5), .d(p4), .e(p3), .f(p2), .g(p1), .h(p0), .i(ci0), .y(nand1_out));

nand8_delay u2 (.a(p7), .b(p6), .c(p5), .d(p4), .e(p3), .f(p2), .g(p1), .h(g0), .y(nand2_out));

nand7_delay u3 (.a(p7), .b(p6), .c(p5), .d(p4), .e(p3), .f(p2), .g(g1), .y(nand3_out));

nand6_delay u4 (.a(p7), .b(p6), .c(p5), .d(p4), .e(p3), .f(g2), .y(nand4_out));

nand5_delay u5 (.a(p7), .b(p6), .c(p5), .d(p4), .e(g3), .y(nand5_out));

nand4_delay u6 (.a(p7), .b(p6), .c(p5), .d(g4), .y(nand6_out));

nand3_delay u7 (.a(p7), .b(p6), .c(g5), .y(nand7_out));

nand2_delay u8 (.a(p7), .b(g6), .y(nand8_out));

nand2_delay u9 (.a(g7), .b(g7), .y(nand9_out));

nand9_delay u10 (.a(nand1_out), .b(nand2_out), .c(nand3_out), .d(nand4_out), 
 .e(nand5_out), .f(nand6_out), .g(nand7_out), .h(nand8_out), 
 .i(nand9_out), .y(co));
endmodule

module mulPlex(
input logic a, b,
input logic [7:0] c,
output logic [7:0] y
);

always_comb begin
if (a == 1'd0 & b == 1'd0)
	y = c;
if(a == 1'd1)
	y = 8'd127;	
if(b == 1'd1)
	y = -8'd128;
end
endmodule