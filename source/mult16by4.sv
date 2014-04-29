// $Id: $
// File name:   mult16by4.sv
// Created:     4/27/2014
// Author:      Brian Rybarczyk
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Uses bit operations to multiply a 16 bit binary number by a 4 bit binary number

module mult16by4(
  input wire [15:0] a,
  input wire [3:0] b,
  output reg [19:0] product
);

  reg [16:0] ab0;
  reg [16:0] ab1;
  reg [17:0] ab2;
  reg [18:0] ab3;
  reg [18:0] sums [2:0];
  wire couts[5:0];

  assign ab0={1'b0,a & {16{b[0]}}};
  assign ab1={(a & {16{b[1]}}),1'b0};
  assign ab2={(a & {16{b[2]}}),2'b00};
  assign ab3={(a & {16{b[3]}}),3'b000};
  
  //add 17 bits
  cla_16bit A1(.a(ab0[15:0]), .b(ab1[15:0]), .cin(1'b0), .cout(couts[0]), .sum(sums[0][15:0])); //get first 16 bits and carry
  adder_1bit A1_1(.a(ab0[16]), .b(ab2[16]), .carry_in(couts[0]), .sum(sums[0][16]), .carry_out(sums[0][17])); //get 17th bit and carry
  assign sums[0][18]=1'b0;
  
  //add 18 bits
  cla_16bit A2(.a(sums[0][15:0]), .b(ab2[15:0]), .cin(1'b0), .cout(couts[1]), .sum(sums[1][15:0])); //get first 16 bits and carry
  adder_1bit A2_1(.a(sums[0][16]), .b(ab2[16]), .carry_in(couts[1]), .sum(sums[1][16]), .carry_out(couts[2])); //get 17th bit
  adder_1bit A2_2(.a(sums[0][17]), .b(ab2[17]), .carry_in(couts[2]), .sum(sums[1][17]), .carry_out(sums[1][18])); //get 18th bit and carry
  
  //add 19 bits
  cla_16bit A3(.a(sums[1][15:0]), .b(ab3[15:0]), .cin(1'b0), .cout(couts[3]), .sum(sums[2][15:0])); //get first 16 bits and carry
  adder_1bit A3_1(.a(sums[1][16]), .b(ab3[16]), .carry_in(couts[3]), .sum(sums[2][16]), .carry_out(couts[4])); //get 17th bit
  adder_1bit A3_2(.a(sums[1][17]), .b(ab3[17]), .carry_in(couts[4]), .sum(sums[2][17]), .carry_out(couts[5])); //get 18th bit
  adder_1bit A3_3(.a(sums[1][18]), .b(ab3[18]), .carry_in(couts[5]), .sum(sums[2][18]), .carry_out(product[19])); //get 19th bit and carry
  
  assign product[18:0]=sums[2];
  
endmodule
