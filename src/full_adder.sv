module full_adder (
    input logic a,
    input logic b,
    input logic cin,
    output logic sum,
    output logic co
);
    assign sum = a ^ b ^ cin;
    assign co = (a & b) | (cin & (a ^ b));
endmodule
