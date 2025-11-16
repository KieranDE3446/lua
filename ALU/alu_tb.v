`timescale 1ns/1ps

module alu_tb;
//inputs
	reg [7:0] a,b;
	reg [3:0] alu_sel;

//outputs
	wire [7:0] alu_out;
	wire carry;
//verilog code for ALU	
	integer i;
	alu test_unit(
		a,b, //ALU 8-bit inputs
		alu_sel, //alu selection
		alu_out, //alu 8-bit output
		carry //carry out flag
	);
	initial begin 
	//hold reset state for 100 ns
	//$monitor ("At time %0t: a=%b, b=%b, alu_sel=%b, alu_out=%b", $time, a, b, alu_sel, alu_out);
	a = 8'h0A;
	b = 8'h02;
	alu_sel = 4'h0;

	for (i=0;i<=15;i=i+1)
	begin
	alu_sel = i;
	#1;
	case (alu_sel)
		4'b0000: $display("%d +%d = %d", a, b, alu_out);
		4'b0001: $display("%d -%d = %d", a, b, alu_out);
		4'b0010: $display("%d *%d = %d", a, b, alu_out);
		4'b0011: $display("%d /%d = %d", a, b, alu_out);
	endcase
	#9;
	end

	a = 8'hF6;
	b = 8'h0A;

	end

endmodule
