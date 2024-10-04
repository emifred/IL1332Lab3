module mux4to1_N_bit #(parameter N=4)
    (   input  logic [N-1:0] a,
        input  logic [N-1:0] b,
        input  logic cin,
        output logic cout,
        output logic [N-1:0] sum  // N+1 bit for sum
    );

    // Internal carry signals
    logic [N:0] c;  // Carry in signals
    assign c[0] = cin;  // Initial carry is the input carry (cin)

    // Generate N-bit 4-to-1 mux
    genvar i;
    generate
        for (i = 0; i < N; i++) begin : gen_4to1_mux
            mux4to1_slice ms (
                .a(a[i]),
                .b(b[i]),
                .cin(c[i]),
                .cout(c[i+1]),  // Connecting carry for the next stage
                .sum(sum[i])  // sum[i] connects to each bit of sum
            );
        end
    endgenerate

    // Additional mux4to1_slice for the MSB (N-th bit)
    mux4to1_slice ms_msb (
        .a(a[N-1]),   // Most significant bit for a
        .b(b[N-1]),   // Most significant bit for b
        .cin(c[N]),   // Last carry input
        .cout(cout),      // Final carry out (not used)
        .sum(sum[N])  // MSB (N-th bit) of sum
    );

endmodule

