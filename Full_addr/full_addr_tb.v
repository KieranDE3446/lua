`timescale 1ns/1ps
module tb_full_addr;

	//Declare testbench signals
	reg a, b, c_in;
	wire sum, carry_out;

	//instantiate the full addr module
	full_addr dut (a, b, c_in, sum, carry_out);
	initial begin
		$dumpfile("full_addr_tb.vcd"); //specifiy dump file name
		$dumpvars(0, tb_full_addr); //Dump all signals in the testbench
	end
//apply test stimulus
initial begin
$display("testing Full Adder");
$monitor("a=%b, b=%b, c_in=%b, sum=%b, carry_out=%b", a, b, c_in, sum, carry_out);

//apply test cases
a=0; b=0; c_in=0; #10; //expect sum=0, carry_out = 0
a=0; b=0; c_in=1; #10; //expect sum=1, carry_out =0
a=0; b=1; c_in=0; #10; //expect sum = 1, carry_out = 0
a=0; b=1; c_in=1; #10; //expect sum = 0, carry_out = 1
a=1; b=0; c_in=0; #10; //expect sum = 1, carry_out = 0
a=1; b=0; c_in=1; #10; //expect sum = 0, carry_out = 1
a=1; b=1; c_in=1; #10; //expect sum = 1, carry_out = 1

$finish;
end
endmodule
