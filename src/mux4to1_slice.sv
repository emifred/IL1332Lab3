module mux4to1_slice(   
    input  logic a,
    input  logic b,
    input  logic cin,
    output logic sum,
	output logic cout
    );

logic u1_out, u2_out, u3_out, u4_out, u5_out, u6_out, u7_out, u8_out;
logic a_inv, b_inv, b2_inv, cin_inv, cin2_inv, carry_out;
    
    assign a_inv = ~a;


// --------- Sum MUX ---------------

    nand2_delay inv0 (
                .a(b),
                .b(b),
                .y(b_inv)
            );
    // Disparity in lecture slide, possible error. In the above inv0 the slide said s0 and in inv1 it says s[1]
    nand2_delay inv1 (
                .a(cin),
                .b(cin),
                .y(cin_inv)
            );
    // MUX input 0
    nand3_delay U1 (
                .a(a),
                .b(b_inv),
                .c(cin_inv),
                .y(u1_out)
            );
    // MUX SUM input 1
    nand3_delay U2 (
                .a(a_inv),
                .b(b),
                .c(cin_inv),
                .y(u2_out)
            );
    // MUX SUM input 2
    nand3_delay U3 (
                .a(a_inv),
                .b(b_inv),
                .c(cin),
                .y(u3_out)
            );
    // MUX SUM input 3
    nand3_delay U4 (
                .a(a),
                .b(b),
                .c(cin),
                .y(u4_out)
            );
    // MUX SUM output
    nand4_delay U5 (
                .a(u1_out),
                .b(u2_out),
                .c(u3_out),
                .d(u4_out),
                .y(sum)
            );

// --------- Carry out MUX ---------------


    nand2_delay inv2 (
                .a(b),
                .b(b),
                .y(b2_inv)
            );

    // Disparity in lecture slide, possible error. In the above inv0 the slide said s0 and in inv1 it says s[1]
    nand2_delay inv3 (
                .a(cin),
                .b(cin),
                .y(cin2_inv)
            );
    // MUX CARRY input 0
    nand3_delay U6 (
                .a(1'b0),
                .b(b2_inv),
                .c(cin2_inv),
                .y(u5_out)
            );
    // MUX CARRY input 1
    nand3_delay U7 (
                .a(a),
                .b(b),
                .c(cin2_inv),
                .y(u6_out)
            );
    // MUX CARRY input 2
    nand3_delay U8 (
                .a(a),
                .b(b2_inv),
                .c(cin),
                .y(u7_out)
            );
    // MUX CARRY input 3
    nand3_delay U9 (
                .a(1'b1),
                .b(b),
                .c(cin),
                .y(u8_out)
            );

    nand4_delay U10 (
                .a(u5_out),
                .b(u6_out),
                .c(u7_out),
                .d(u8_out),
                .y(cout)
            );

endmodule