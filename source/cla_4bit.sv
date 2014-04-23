// $Id: $
// File name:   cla_4bit.sv
// Created:     4/23/2014
// Author:      Hong Shick Pak
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: carry lookup adder
module cla_4bit (
  input wire [3:0] a,
  input wire [3:0] b,
  input wire cin,
  output reg cout,
  output reg pg, // propagate group
  output reg gg, // generate group 
  output reg [3:0] sum
);

  reg [3:0] carry;
  reg [3:0] p;
  reg [3:0] g;

  assign g = a & b;
  assign p = a | b;
  assign carry[0] = cin;
  assign carry[1] = g[0] | (p[0] & carry[0]);
  assign carry[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & carry[0]);
  assign carry[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & carry[0]);

  assign cout = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & p[0] & carry[0]);
  assign sum = p ^ carry;
  assign pg = p[3] & p[2] & p[1] & p[0];
  assign gg = g[3] | (p[3] & g[2]) |(p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]);
endmodule
