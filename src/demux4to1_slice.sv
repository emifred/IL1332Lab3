module demux4to1_module
                (   input  logic a,
                    input  logic [1:0] s,
                    output logic out0,
                    output logic out1,
                    output logic out2,
                    output logic out3
                );

    // Internal wires for inverted select lines and intermediate signals
    logic s0_n, s1_n;
    logic a_s1n_s0n, a_s1n_s0, a_s1_s0n, a_s1_s0;

    // Generate inverted select lines using NAND gates
    nand (s0_n, s[0], s[0]);   // s0_n = NOT(s[0])
    nand (s1_n, s[1], s[1]);   // s1_n = NOT(s[1])

    // Implement AND logic using NAND gates for each output
    // out0 = a & s1_n & s0_n
    nand (a_s1n_s0n, s1_n, s0_n);           // Intermediate: s1_n & s0_n
    nand (out0, a, a_s1n_s0n);               // Final: a & (s1_n & s0_n)

    // out1 = a & s1_n & s[0]
    nand (a_s1n_s0, s1_n, s[0]);             // Intermediate: s1_n & s[0]
    nand (out1, a, a_s1n_s0);                // Final: a & (s1_n & s[0])

    // out2 = a & s[1] & s0_n
    nand (a_s1_s0n, s[1], s0_n);             // Intermediate: s[1] & s0_n
    nand (out2, a, a_s1_s0n);                // Final: a & (s[1] & s0_n)

    // out3 = a & s[1] & s[0]
    nand (a_s1_s0, s[1], s[0]);              // Intermediate: s[1] & s[0]
    nand (out3, a, a_s1_s0);                 // Final: a & (s[1] & s[0])

endmodule
