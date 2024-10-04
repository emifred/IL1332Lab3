module shifter_rotator(
	input logic[7:0] x,
	input logic[7:0] y,
	input logic[1:0] m,
	output logic[3:0] z
	);
//


// --------- 1st MUX ( 1st bit LSB ) ---------------

	mux4to1_module m0 (
		.a(1'b0),
		.b(x[1]),
		.c(x[3]),
		.d(x[1]),
		.s(select),
		.y(y[0])
		);

// --------- 2nd MUX ( 2nd bit ) ---------------

	mux4to1_module m1 (
		.a(x[0]),
		.b(x[2]),
		.c(x[0]),
		.d(x[2]),
		.s(select),
		.y(y[1])
		);

// --------- 3rd MUX ( 3rd bit ) ---------------

	mux4to1_module m2 (
		.a(x[1]),
		.b(x[3]),
		.c(x[1]),
		.d(x[3]),
		.s(select),
		.y(y[2])
		);

// --------- 4th MUX ( 4th bit MSB ) ---------------

	mux4to1_module m3 (
		.a(x[2]),
		.b(1'b0),
		.c(x[2]),
		.d(x[0]),
		.s(select),
		.y(y[3])
		);

endmodule