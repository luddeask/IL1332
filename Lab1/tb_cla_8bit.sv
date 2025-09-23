`timescale 1ns / 1ps

module tb_cla_8bit;
    parameter N = 8;

    // Testsignaler
    logic signed [N-1:0] A, B;
    logic signed [N:0]   Sum_cla;
    logic signed [N:0]   Sum_ref;  // Referenssumma
    int x, y;

    // Instansiera DUT (CLA)
    CLA_8bit dut_cla (
        .A(A),
        .B(B),
        .Sum(Sum_cla)
    );

    // Testsekvens
    initial begin
        $display("=== Startar CLA Testbench ===");

        // Kör alla kombinationer
        for (x = -128; x <= 127; x++) begin
            for (y = -128; y <= 127; y++) begin
                A = x;
                B = y;
                Sum_ref = A + B;  // Golden model
                #1; // vänta lite på signaler
                // Jämför resultaten
                if (Sum_cla != Sum_ref) begin
                    $display("FEL: A=%0d B=%0d | CLA=%0d, REF=%0d",
                              A, B, Sum_cla, Sum_ref);
                end
            end
        end

        $display("=== Testbench klar ===");
        $stop;
    end

endmodule
