// $Id: $
// File name:   tb_cla_4bit.sv
// Created:     4/23/2014
// Author:      Hong Shick Pak
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: tb
module tb_cla_16bit;
    // Inputs
    reg [15:0] A;
    reg [3:0] B;

    // Outputs
    reg [19:0] product

    // Instantiate the Unit Under Test (UUT)
    mult16by4 DUT(
    .a(A),
    .b(B),
    .product(product)
    );

    initial begin
    // Initialize Inputs
    A = 0;  B = 0;  Cin = 0;
    // Wait 100 ns for global reset to finish
    #100;
        
    // Add stimulus here
    #10 A=16'b1010101010101010;B=4'b0101;
    #10 A=16'b1010101010101010;B=4'b0101;
    #10 A=16'b1010101010101010;B=4'b0101;
    #10 A=16'b1010101010101010;B=4'b0101;

    // #10 A=4'b100;B=4'b0011;Cin=1'b0;
    // #10 A=4'b1101;B=4'b1010;Cin=1'b1;
    // #10 A=4'b1110;B=4'b1001;Cin=1'b0;
    // #10 A=4'b1111;B=4'b1010;Cin=1'b0;
    end 
 
    initial begin
 $monitor("time=",$time,, "A=%b B=%b Product=%b",A,B,product);
    end      
endmodule
