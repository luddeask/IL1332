module mux4to1_slice (
	input logic a, b, c, d,
	input logic [1:0] s,
	output logic y
);
always_comb begin
	case (s)
		2'b00: y = a;
		2'b01: y = b;
		2'b10: y = c;
		2'b11: y = d;
		default: y = 1'bx;
	endcase
	end
endmodule