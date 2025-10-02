module alu(
	input logic [7:0] x,
	input logic [7:0] y,
	input logic [1:0] m,
	input logic [1:0] s,
	output logic [15:0] z
	
):


//MUX, INVETER, AND, OR,COMPARITOR, ADDER

//input X Y 8 bitar
//Select signal M S
//Output Z 16 bitar

logic [15:0],
	final_mux_out,
	arithmetic_out,
	shift_rotate_out,
	comparitor_out,
	logic_out;


mux4to1_Nbit #(16) final_mux (
	.A(arithmetic_out),
	.B(shift_rotate_out),
	.C(comparitor_out),
	.D(logic_out),
	.s(s),
	.Y(z)
);

arithmetic_func u_arit (
	.a(x),
	.b(y),
	.sel(m),
	.y(arithmetic_out)
);

shift_rotate_func u_shift_rotate (
	.a(x),
	.b(y),
	.sel(m),
	.y(shift_rotate_out)
);

comparitor_func u_comp(
	.a(x),
	.b(y),
	.sel(m),
	.y(comparitor_out)
);

logic_func u_logic(
	.a(x),
	.b(y),
	.sel(m),
	.y(logic_out)
);

endmodule 