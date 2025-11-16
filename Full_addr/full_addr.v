`timescale 1ns/1ps

//describe full_addr module
module full_addr (
input a,
input b,
input c_in,
output wire sum,
output wire carry_out
);

//Assign sum using XOR for efficient bitwise addition
assign sum = a ^ b ^ c_in;
//      
// a  ---|
// b  ---|D0-----|
//               |D0-- sum
//cin -----------|
//

//Assign carry based on two-bit product terms for clarity
assign carry_out = (a & b) | (a & c_in) | (c_in & b );

endmodule
