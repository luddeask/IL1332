`timescale 1ns/1ps

module tb_shifter_rotator;
logic [3:0] x;
logic [1:0] select;
logic [3:0] y;

shifter_rotator dut (
	.x(x),
	.select(select),
	.y(y)
);

initial begin
	$display("Test av shifter rotator");
	//Test 1: Shift left
	x = 4'b0001;
	select = 2'b00;
	$display("x=%b select=%b => y=%b", x, select, y);
	#1;
	x = 4'b1001;
	select = 2'b00;
	$display("x=%b select=%b => y=%b", x, select, y);
	#1;
	//Test 2: Shift right
	x = 4'b0100;
	select = 2'b01;
	$display("x=%b select=%b => y=%b", x, select, y);
	#1;
	x = 4'b0110;
	select = 2'b01;
	$display("x=%b select=%b => y=%b", x, select, y);
	#1;
	//Test 3: Rotate left
	x = 4'b1100;
	select = 2'b10;
	$display("x=%b select=%b => y=%b", x, select, y);
	#1;
	x = 4'b1001;
	select = 2'b10;
	$display("x=%b select=%b => y=%b", x, select, y);
	#1;
	
	//Test 4: Rotate right
	x = 4'b0011;
	select = 2'b11;
	$display("x=%b select=%b => y=%b", x, select, y);
	#1;
	x = 4'b1010;
	select = 2'b11;
	$display("x=%b select=%b => y=%b", x, select, y);
	#1;
$display("Test klart");
$finish;
end

endmodule


/*
initial begin
	$display("==== Test av shifter_rotator ====");
	// Testa alla möjliga x-värden
	for (int i = 0; i < 16; i++) begin
		x = i;
	// Testa alla operationer (00,01,10,11)
		for (int s = 0; s < 4; s++) begin
			select = s[1:0];
			#1; // liten delay för att utvärdera combinational logik
			$display("x=%b select=%b => y=%b", x, select, y);
		end
	end
	$display("==== Test klart ====");
	$finish;
end

endmodule
*/