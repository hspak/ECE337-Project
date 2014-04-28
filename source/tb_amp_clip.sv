// $Id: $
// File name:   tb_amp_clip.sv
// Created:     4/23/2014
// Author:      Brian Rybarczyk
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: tb
`timescale 1ns / 100ps
module tb_amp_clip;
    // Inputs
    reg [15:0] A;
    reg [3:0] B;

    // Outputs
    reg [15:0] Out;

    int expected;
    reg [15:0] amp_comp;
    assign amp_comp={1'b0,B,11'b00000000000};

    // Instantiate the Unit Under Test (UUT)
    amp_clip DUT(
    .inchan(A),
    .comp_in(B),
    .outchan(Out)
    );

    initial begin
    // Initialize Inputs
    A = 0;  B = 0;
    // Wait 100 ns for global reset to finish
    #100;
        
    // Add stimulus here
    #10 A=16'b0101000000000000;B=4'b1010;
    expected=A;
    #10 A=16'b1011111111111111;B=4'b1010;
    expected=A;
    #10 A=16'b0101000000000010;B=4'b1010;
    expected=amp_comp+((A-amp_comp)/2);
    #10 A=16'b1010111111111110;B=4'b1010;
    expected=-expected;
    #10 A=16'b0111100000000001;B=4'b1010;
    expected=amp_comp+((A-amp_comp)/2);
    #10 A=16'b1000011111111111;B=4'b1010;
    expected=-expected;
    end 
 
    initial begin
 $monitor("time=",$time,, "inchan=%b comp_in=%b outchan=%b expected=%16b",A,B,Out,expected);
    end      
endmodule
