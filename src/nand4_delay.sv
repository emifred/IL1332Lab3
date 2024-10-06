module nand4_delay (
    input  logic a,
    input  logic b,
    input logic c,
    input logic d,
    output logic y
);
assign y = ~(a & b & c & d);
  //TODO: Complete the code
endmodule