`timescale 1ns / 1ps

module tb_comparator_Nbit;

parameter N = 4;

logic [N-1:0] A;
logic [N-1:0] B;
logic g, l;

// Instantiate the comparator
comparator_Nbit #(N) uut (
.A(A),
.B(B),
.g(g),
.l(l) 
);

initial begin
A = 10; B = 11; #30;
A = 10; B = 8; #30;
A = 10; B = 10; #30;
A = 0; B = 1; #30;

$stop;
end

endmodule
