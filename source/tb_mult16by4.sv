// $Id: $
// File name:   tb_mult16by4.sv
// Created:     4/23/2014
// Author:      Brian Rybarczyk
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: tb
`timescale 1ns / 100ps
module tb_mult16by4;
    // Inputs
    reg [15:0] A;
    reg [3:0] B;

    // Outputs
    reg [19:0] product;

    int expected=A*B;

    // Instantiate the Unit Under Test (UUT)
    mult16by4 DUT(
    .a(A),
    .b(B),
    .product(product)
    );

    initial begin
    // Initialize Inputs
    A = 0;  B = 0;
    // Wait 100 ns for global reset to finish
    #100;
        
    // Add stimulus here
    #10 A=16'b1111111111111111;B=4'b1111;
    expected=A*B;
    #10 A=16'b1111111111111111;B=4'b0111;
    expected=A*B;
    #10 A=16'b1111111111111111;B=4'b0110;
    expected=A*B;
    #10 A=16'b0010101010101011;B=4'b0101;
    expected=A*B;
    #10 A=16'b1111111111111111;B=4'b1111;
    expected=A*B;
    #10 A=16'b0010101010101011;B=4'b0000;
    expected=A*B;
    #10 A=16'b1111000000000000;B=4'b0101;
    expected=A*B;
    #10 A=16'b0000000000000000;B=4'b0000;
    expected=A*B;
    #10 A=16'b0010101010101011;B=4'b1010;
    expected=A*B;
    #10 A=16'b0000000000000101;B=4'b0101;
    expected=A*B;
    #10 A=16'b0000000000000000;B=4'b0001;
    expected=A*B;
    end 
 
    initial begin
 $monitor("time=",$time,, "A=%b B=%b Product=%b Expected=%20b || %d*%d=%d",A,B,product,expected,A,B,product);
    end      
endmodule
