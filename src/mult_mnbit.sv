module mult_mnbit #(parameter M, parameter N)(
    input logic[M-1:0] a,
    input logic [N-1:0] b,
    output logic [M+N-1:0]prod,
    output logic [N-1:0][M-1:0] prod_terms
);

//logic [M-1:0][N-1:0] prod_terms;
logic [N-1:0][M-1:0] A;
logic [N-1:0][M-1:0] B;
logic [N-1:0][M-1:0] Sum;
logic co [N-1:0];

// Generate product terms
genvar i, j;
generate
    for (i = 0; i < M; i++) begin : B_loop
        for (j = 0; j < N; j++) begin : A_loop
            and2 u_and (
                .a(a[i]),
                .b(b[j]),
                .y(prod_terms[j][i])
            );
        end
    end
endgenerate

// Assignments and RCA instances
assign prod[0] = prod_terms[0][0];
assign A[0][M-1] = 1'b0;
assign A[0][M-2:0] = prod_terms[0][M-1:1];
assign B[0] = prod_terms[1];

rca_nbit #(M) u0 (
    .a(A[0]),
    .b(B[0]),
    .cin(1'b0),
    .sum(Sum[0]),
    .co(co[0])
);

generate
    for (i = 1; i < N-1; i++) begin
        assign A[i][M-1] = co[i-1];
        assign A[i][M-2:0] = Sum[i-1][M-1:1];
        assign prod[i] = Sum[i-1][0];
        assign B[i] = prod_terms[i+1];

        rca_nbit #(M) u_rca (
            .a(A[i]),
            .b(B[i]),
            .cin(1'b0),
            .sum(Sum[i]),
            .co(co[i])
        );
    end
    endgenerate

assign prod[M+N-2:N-1] = Sum[N-2];
assign prod[M+N-1] = co[N-2];
//assign prod[M+N-1:N-1] = 1'b0;
endmodule