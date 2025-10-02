module demux_4to1 (
input logic x, // Data input
input logic [1:0] sel, // Select lines (S1, S0)
output logic [3:0] y// Outputs (x0..x3)
);

// Interna signaler för inverterade select-signaler
logic S1n, S0n;

// Inverterare
assign S1n = ~sel[1];
assign S0n = ~sel[0];

// AND-grindar för respektive utgång
assign y[0] = x & S1n & S0n;	// x0 när sel=00
assign y[1] = x & S1n & sel[0];		// x1 när sel=01
assign y[2] = x & sel[1] & S0n; 	// x2 när sel=10
assign y[3] = x & sel[1] & sel[0];	 // x3 när sel=11

endmodule
