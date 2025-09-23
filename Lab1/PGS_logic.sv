module propogate_logic (
input logic a,
input logic b,
output logic p
);
logic nand1_out;
logic nand2_out;
nand2_delay u1 (
.a(a),
.b(a),
.y(nand1_out)
);
nand2_delay u2 (
.a(b),
.b(b),
.y(nand2_out)
);
nand2_delay u3 (
.a(nand1_out),
.b(nand2_out),
.y(p)
);
endmodule



module generate_logic(
input logic a,
input logic b,
output logic g);

logic nand_out;
nand2_delay u1(
.a(a),
.b(b),
.y(nand_out));

nand2_delay u2(
.a(nand_out),
.b(nand_out),
.y(g));

endmodule


module sum_logic(
input logic a,
input logic b,
input logic Cin,
output logic s);


logic xor1_out;
xor2_delay u1(
.a(a),
.b(b),
.y(xor1_out));

xor2_delay u2(
.a(xor1_out),
.b(Cin),
.y(s));
endmodule;