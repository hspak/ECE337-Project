// $Id: $
// File name:   cla_16bit.sv
// Created:     4/24/2014
// Author:      Hong Shick Pak
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: 4bit wrapper
module cla_16bit (
  input wire [15:0] a,
  input wire [15:0] b,
  input wire cin,
  output wire cout,
  output wire pg, // propagate group
  output wire gg, // generate group 
  output wire [15:0] sum
);

reg [3:0] p;
reg [3:0] g;
reg [2:0] icout;

assign icout[0] = g[0] | (p[0] & cin);
assign icout[1] = g[1] | (g[0] & p[1]) | (cin & p[0] & p[1]);
assign icout[2] = g[2] | (g[1] & p[2]) | (g[0] & p[1] & p[2]) | (cin & p[0] & p[1] & p[2]);

cla_4bit A1(a[3:0], b[3:0], cin, , p[0], g[0], sum[3:0]);
cla_4bit A2(a[7:4], b[7:4], icout[0], , p[1], g[1], sum[7:4]);
cla_4bit A3(a[11:8], b[11:8], icout[1], , p[2], g[2], sum[11:8]);
cla_4bit A4(a[15:12], b[15:12], icout[2], , p[3], g[3], sum[15:12]);

assign pg = p[0] & p[1] & p[2] & p[3];
assign gg = g[3] | (g[2] & p[3]) | (g[1] & p[2] & p[3]) | (g[0] & p[1] & p[2] & p[3]) | (cin & p[0] & p[1] & p[2] & p[3]);
assign cout = gg;

endmodule
