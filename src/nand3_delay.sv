module nand3_delay (
    input  logic a,
    input  logic b,
    input logic c,
    output logic y
);
assign y = ~(a & b & c);
  //TODO: Complete the code
endmodule