module shifter_rotator(
	input logic[3:0] x,
	input logic[1:0] select,
	output logic[3:0] y
);
/*
s1	s0
0	0	shift left
0	1	shift right
1	0	rotate left
1	1	rotate right
*/

//Slice 0
mux4to1_slice u0 (
	.a(1'b0),
	.b(x[1]),
	.c(x[3]),
	.d(x[1]),
	.s(select),
	.y(y[0])
);

//slice 1
mux4to1_slice u1 (
	.a(x[0]),
	.b(x[2]),
	.c(x[0]),
	.d(x[2]),
	.s(select),
	.y(y[1])
);

//slice 2
mux4to1_slice u2 (
	.a(x[1]),
	.b(x[3]),
	.c(x[1]),
	.d(x[3]),
	.s(select),
	.y(y[2])
);

//slice 3
mux4to1_slice u3 (
	.a(x[2]),
	.b(1'b0),
	.c(x[2]),
	.d(x[0]),
	.s(select),
	.y(y[3])
);
endmodule
