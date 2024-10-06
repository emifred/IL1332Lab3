module rca_nbit #(parameter N = 4)(
    input logic [N-1:0] a,
    input logic [N-1:0] b,
    input logic cin,
    output logic [N-1:0] sum,
    output logic co
);
    // Internal carry signals
    logic [N:0] c; // Carry signals (N+1 for final carry-out)
    
    assign c[0] = cin; // Initial carry-in

    // Generate block to create the N full adders
    genvar i;
    generate
        for (i = 0; i < N; i++) begin : gen_full_adders
            full_adder fa (
                .a(a[i]),
                .b(b[i]),
                .cin(c[i]),
                .sum(sum[i]),
                .co(c[i+1]) // Carry-out for the next full adder
            );
        end
    endgenerate

    assign co = c[N]; // Final carry-out from the last full adder

endmodule
