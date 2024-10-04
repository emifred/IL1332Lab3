module nand2_delay (
    input  logic a,
    input  logic b,
    output logic y
);
assign y = ~(a & b);
  //TODO: Complete the code
endmodule
