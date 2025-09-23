module mux4to1_4bit(
	input logic [3:0] A,
	input logic [3:0] B,
	input logic [3:0] C,
	input logic [3:0] D,
	input logic [1:0] s,
	output logic [3:0] Y
);

genvar i;
generate
	for (i = 0; i < 4; i++) begin : mux4to1_slice
		mux4to1_slice ms (
		.a(A[i]),
		.b(B[i]),
		.c(C[i]),
		.d(D[i]),
		.s(s),
		.y(Y[i])
	);
	end
endgenerate
endmodule
