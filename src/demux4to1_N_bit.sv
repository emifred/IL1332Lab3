module demux4to1_N_bit #(parameter N=8)  // Parameterized for N-bit data
(
    input  logic [N-1:0] a,    // N-bit input data
    input  logic [1:0] s,      // 2-bit select lines
    output logic [N-1:0] z0,   // Output 0 (N-bit)
    output logic [N-1:0] z1,   // Output 1 (N-bit)
    output logic [N-1:0] z2,   // Output 2 (N-bit)
    output logic [N-1:0] z3    // Output 3 (N-bit)
);

    // Instantiate the 4:1 mux for each bit of the input
    genvar i;
    generate
        for (i = 0; i < N; i++) begin : gen_mux
            logic mux_out0, mux_out1, mux_out2, mux_out3;

            // Instantiate the mux for each bit
            demux4to1_slice mux_instance (
                .a(a[i]),                  // Connect single bit input
                .s(s),                     // Select lines
                .out0(mux_out0),          // Output for first
                .out1(mux_out1),          // Output for second
                .out2(mux_out2),          // Output for third
                .out3(mux_out3)           // Output for fourth
            );

            // Assign outputs based on mux output
            assign z0[i] = mux_out0;
            assign z1[i] = mux_out1;
            assign z2[i] = mux_out2;
            assign z3[i] = mux_out3;
        end
    endgenerate

endmodule
