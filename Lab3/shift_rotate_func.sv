module shift_rotate_func(
	input logic[7:0] a,
	input logic[7:0] b,
	input logic[1:0] sel,
	output logic [15:0] y
);

//Lägg in shift och rotate funktionerna ifrån lab 2

logic [7:0] result;

always_comb begin
	y = '0; //outpul rule
	
	case(sel)
		2'b00: a;
		2'b01: a;
		2'b10: result = a >> b;
		2'b11: result = a << b;
		default: y = '0;
	endcase
	
	y = {8'b0, result}
end


endmodule