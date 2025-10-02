module arithmetic_func(
	input logic[7:0] a,
	input logic[7:0] b,
	input logic[1:0] sel,
	output logic [15:0] y 
);

//logic [15:0] add_out, sub_out, multi_out;

logic [7:0] result;

always_comb begin
	result = '0; //Output regeln

	case (sel)
		2'b00: result = a + b;
		2'b01: result = a - b;
		2'b10: result = a * b;
		default: result = '0;
	endcase
	
	y = {8'b0, result};
end


/*Lab 2 uppgift 1
mult_mnbit #(8, 8) u_multi (
	.a(a),
	.b(b),
	.product(multi_out)
);
*/
//Lägg in multi, add och sub istället för färdiga operationer


endmodule