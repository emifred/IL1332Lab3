module tb_demux4to1_N_bit;

    // Parameters
    parameter N = 8; // Define the bit-width of the input data

    // Declare test signals
    logic [N-1:0] a;       // 8-bit input data
    logic [1:0] s;         // 2-bit select lines
    logic [N-1:0] z0, z1, z2, z3; // Outputs from the demux

    // Instantiate the demux
    demux4to1_N_bit #(N) uut (
        .a(a),
        .s(s),
        .z0(z0),
        .z1(z1),
        .z2(z2),
        .z3(z3)
    );

    // Testbench procedure
    initial begin
        // Initialize inputs
        a = 8'b00000000; // Default value
        s = 2'b00; // Default select value

        // Test different combinations of inputs and selects
        // Test 1: Select 00
        a = 8'b11010101; s = 2'b00; #10;
        $display("s=%b, a=%b => z0=%b, z1=%b, z2=%b, z3=%b", s, a, z0, z1, z2, z3);

        // Test 2: Select 01
        a = 8'b11010101; s = 2'b01; #10;
        $display("s=%b, a=%b => z0=%b, z1=%b, z2=%b, z3=%b", s, a, z0, z1, z2, z3);

        // Test 3: Select 10
        a = 8'b11010101; s = 2'b10; #10;
        $display("s=%b, a=%b => z0=%b, z1=%b, z2=%b, z3=%b", s, a, z0, z1, z2, z3);

        // Test 4: Select 11
        a = 8'b11010101; s = 2'b11; #10;
        $display("s=%b, a=%b => z0=%b, z1=%b, z2=%b, z3=%b", s, a, z0, z1, z2, z3);

        // Test 5: Different input value
        a = 8'b10101010; s = 2'b00; #10;
        $display("s=%b, a=%b => z0=%b, z1=%b, z2=%b, z3=%b", s, a, z0, z1, z2, z3);

        // Test 6: Another different input value
        a = 8'b11110000; s = 2'b01; #10;
        $display("s=%b, a=%b => z0=%b, z1=%b, z2=%b, z3=%b", s, a, z0, z1, z2, z3);

        // End the simulation
        $finish;
    end
endmodule
