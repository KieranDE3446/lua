`timescale 1ns/1ps

//describe sub module
module sub(
input a,
input b,
input b_in,
output wire d,
output wire b_out
);

//describe logic
//d = (A XOR B) XOR (b_in)
//b_out = (`(b xor b_in) and a) or (`b and b_in)
// expected output
// a b b_in d b_out
// 0 0 0    0 0
// 0 0 1    1 1
// 0 1 0    1 1
// 0 1 1    0 1
// 1 0 0    1 0
// 1 0 1    0 0
// 1 1 0    0 0
// 1 1 1    1 1
// 
assign d = a ^ b ^ b_in;
assign b_out = (~a * b) | (~(a ^ b) & b_in);

endmodule
