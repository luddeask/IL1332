`timescale 1ns / 1ps

module tb_cla_eightbit;
parameter N = 8;

// Test signals
logic signed [N-1:0] A, B;
logic signed [N:0]   Sum_cla;
logic signed [N:0]   Sum_ref;

// Instantiate DUT
cla_8bit dut_cla (
.A(A),
.B(B),
.Sum(Sum_cla)
);

// Test sequence
initial begin
$display("=== Startar CLA Testbench ===");

// --- Test cases ---
A = 8'd127; B = 1'd1;   #1;
Sum_ref = A + B;
$display("A=%0d, B=%0d => Sum_cla=%0d", $signed(A), $signed(B), $signed(Sum_cla));

A = -8'd128; B = 8'd1;  #1;
Sum_ref = A + B;
$display("A=%0d, B=%0d => Sum_cla=%0d", $signed(A), $signed(B), $signed(Sum_cla));

A = 8'd50; B = 8'd80;   #1;
Sum_ref = A + B;
$display("A=%0d, B=%0d => Sum_cla=%0d", $signed(A), $signed(B), $signed(Sum_cla));

A = -8'd100; B = -8'd50; #1;
Sum_ref = A + B;
$display("A=%0d, B=%0d => Sum_cla=%0d", $signed(A), $signed(B), $signed(Sum_cla));

A = 8'd10;  B = 8'd20; #1;
Sum_ref = A + B;
$display("A=%0d, B=%0d => Sum_cla=%0d", $signed(A), $signed(B), $signed(Sum_cla));

A = -8'd128;  B = -8'd128; #1;
Sum_ref = A + B;
$display("A=%0d, B=%0d => Sum_cla=%0d", $signed(A), $signed(B), $signed(Sum_cla));

$display("=== Testbench complete ===");
$stop;
end
endmodule