`timescale 1ns/1ps
module sub_tb;
  reg a, b, b_in;
  wire d, b_out;
  
  sub dut (a, b, b_in, d, b_out);

  
initial begin
  $monitor("At time %0t: a=%b b=%b, b_in=%b, difference=%b, borrow=%b",$time, a,b,b_in,d,b_out);
    a = 0; b = 0; b_in = 0; #10;
    a = 0; b = 0; b_in = 1; #10;
    a = 0; b = 1; b_in = 0; #10;
    a = 0; b = 1; b_in = 1; #10;
    a = 1; b = 0; b_in = 0; #10;
    a = 1; b = 0; b_in = 1; #10;
    a = 1; b = 1; b_in = 0; #10;
    a = 1; b = 1; b_in = 1;
  end
endmodule
