module nand2_delay (
	input logic a, b,
	output logic y
);
	assign y = ~(a & b);
endmodule

module nand3_delay (
	input logic a, b, c,
	output logic y
);
	assign y = ~(a & b & c);
endmodule

module nand4_delay (
	input logic a, b, c, d,
	output logic y
);
 	assign y = ~(a & b & c & d);
endmodule

module nand5_delay (
	input logic a, b, c, d, e,
	output logic y
);
	logic u1_out, u1_out_inv;
	logic u2_out, u2_out_inv;

	//u1
	nand3_delay u1 (.a(a), .b(b), .c(c), .y(u1_out));
	nand2_delay u1_inv (.a(u1_out), .b(u1_out), .y(u1_out_inv));

	//u2
	nand2_delay u2 (.a(d), .b(e), .y(u2_out));
	nand2_delay u2_inv (.a(u2_out), .b(u2_out), .y(u2_out_inv));
	
	//u3
	nand2_delay u3 (.a(u1_out_inv), .b(u2_out_inv), .y(y));
endmodule


module nand6_delay (
	input logic a, b, c, d, e, f,
	output logic y
);
	logic u1_out, u1_out_inv;
	logic u2_out, u2_out_inv;
	//u1
	nand3_delay u1 (.a(a), .b(b), .c(c), .y(u1_out));
	nand2_delay u1_inv (.a(u1_out), .b(u1_out), .y(u1_out_inv));

	//u2
	nand3_delay u2 (.a(d), .b(e), .c(f), .y(u2_out));
	nand2_delay u2_inv (.a(u2_out), .b(u2_out), .y(u2_out_inv));

	//u3
	nand2_delay u3 (.a(u1_out_inv), .b(u2_out_inv), .y(y));
endmodule


module nand7_delay (
	input logic a, b, c, d, e, f, g,
	output logic y
);

	logic u1_out, u1_out_inv;
	logic u2_out, u2_out_inv;

	//u1
	nand4_delay u1 (.a(a), .b(b), .c(c), .d(d), .y(u1_out));
	nand2_delay u1_inv (.a(u1_out), .b(u1_out), .y(u1_out_inv));

	//u2
	nand3_delay u2 (.a(e), .b(f), .c(g), .y(u2_out));
	nand2_delay u2_inv (.a(u2_out), .b(u2_out), .y(u2_out_inv));

	//u3
	nand2_delay u3 (.a(u1_out_inv), .b(u2_out_inv), .y(y));
endmodule

module nand8_delay (
	input logic a, b, c, d, e, f, g, h,
	output logic y
);

	logic u1_out, u1_out_inv;
	logic u2_out, u2_out_inv;

	//u1
	nand4_delay u1 (.a(a), .b(b), .c(c), .d(d), .y(u1_out));
	nand2_delay u1_inv (.a(u1_out), .b(u1_out), .y(u1_out_inv));

	//u2
	nand4_delay u2 (.a(e), .b(f), .c(g), .d(h), .y(u2_out));
	nand2_delay u2_inv (.a(u2_out), .b(u2_out), .y(u2_out_inv));

	//u3
	nand2_delay u3 (.a(u1_out_inv), .b(u2_out_inv), .y(y));
endmodule


module nand9_delay (
	input  logic a, b, c, d, e, f, g, h, i,
	output logic y
);
	logic u1_out, u1_out_inv;
	logic u2_out, u2_out_inv;

	//u1
	nand5_delay u1 (.a(a), .b(b), .c(c), .d(d), .e(e), .y(u1_out));
	nand2_delay u1_inv (.a(u1_out), .b(u1_out), .y(u1_out_inv));
	//u2
	nand4_delay u2 (.a(f), .b(g), .c(h), .d(i), .y(u2_out));
	nand2_delay u2_inv (.a(u2_out), .b(u2_out), .y(u2_out_inv));
	//u3
	nand2_delay u3 (.a(u1_out_inv), .b(u2_out_inv), .y(y));
endmodule



