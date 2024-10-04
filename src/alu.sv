module alu(
input logic [7:0] x,
input logic [7:0] y,
input logic [1:0] m,
input logic [1:0] s,
output logic[15:0] z);
//


    mux4to1_module m_x (
		.a(1'b0),
		.b(x[1]),
		.c(x[3]),
		.d(x[1]),
		.s(s),
		.y(y[0])
		);

    mux4to1_module m_y (
		.a(1'b0),
		.b(x[1]),
		.c(x[3]),
		.d(x[1]),
		.s(s),
		.y(y[0])
	);

endmodule