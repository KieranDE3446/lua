`timescale 1ns/1ps

//describe the alu module
module alu(
input [7:0] a, //input signal a
input [7:0] b, //input signal b
input [3:0] alu_sel, //selector signal
output [7:0] alu_out,
output carry
);

//define result as reg
reg [7:0] alu_result;

//define temporary value
wire [8:0] tmp;

assign alu_out = alu_result; //ALU out
assign tmp = {1'b0, a} + {1'b0, b};
assign carry = tmp[8]; //carry flag
always @(*)
begin
	case(alu_sel)
	4'b0000: //addition
		alu_result = a + b;
	4'b0001: //subtraction
		alu_result = a - b;
	4'b0010: //multiplication
		alu_result = a * b;
	4'b0011: //division
		alu_result = a / b;
	4'b0100: //logical shift left
		alu_result = a << 1;
	4'b0101: //logical shift right
		alu_result = a >> 1;
	endcase
end
endmodule
