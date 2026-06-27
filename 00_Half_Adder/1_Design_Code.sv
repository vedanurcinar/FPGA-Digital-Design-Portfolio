module Half_Adder(
    input wire A,
    input wire B,
    output wire Sum,
    output wire Carry
);

    assign Sum = A^B;
    

    assign Carry = A&B;
    

endmodule