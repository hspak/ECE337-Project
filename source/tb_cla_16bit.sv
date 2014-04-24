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
    reg [15:0] B;
    reg Cin;

    // Outputs
    wire [15:0] S;
    wire Cout;
    wire PG;
    wire GG;

    // Instantiate the Unit Under Test (UUT)
    cla_16bit DUT(
    .sum(S), 
    .cout(Cout), 
    .pg(PG), 
    .gg(GG), 
    .a(A), 
    .b(B), 
    .cin(Cin)
    );

    initial begin
    // Initialize Inputs
    A = 0;  B = 0;  Cin = 0;
    // Wait 100 ns for global reset to finish
    #100;
        
    // Add stimulus here
    #10 A=16'b1010101010101010;B=16'b0101010101010101;Cin=1'b0;
    #10 A=16'b1010101010101011;B=16'b0101010101010100;Cin=1'b0;
    #10 A=16'b1010101010101010;B=16'b0101010101010100;Cin=1'b1;
    #10 A=16'b1110000000000000;B=16'b0000111111111111;Cin=1'b0;
    #10 A=16'b0000000000000001;B=16'b0000000000000001;Cin=1'b0;
    #10 A=16'b0000000000000001;B=16'b0000000000000001;Cin=1'b1;
    // #10 A=4'b100;B=4'b0011;Cin=1'b0;
    // #10 A=4'b1101;B=4'b1010;Cin=1'b1;
    // #10 A=4'b1110;B=4'b1001;Cin=1'b0;
    // #10 A=4'b1111;B=4'b1010;Cin=1'b0;
    end 
 
    initial begin
 $monitor("time=",$time,, "A=%b B=%b Cin=%b : Sum=%b Cout=%b PG=%b GG=%b",A,B,Cin,S,Cout,PG,GG);
    end      
endmodule
