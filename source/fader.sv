// $Id: $
// File name:   fader.sv
// Created:     4/23/2014
// Author:      Patrick Gohier
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Fader Top level
module fader (
    input wire clk,
    input wire n_reset,
    input wire clear,
    input wire fad_enable,
    input wire [31:0] signal_in,
    output wire [31:0] signal_out
);
  
  reg [21:0] mult_val;//mult_val is value (out of 2,097,151 or 21'b111111111111111111111) that the signal is being multiplied by
  reg [19:0] prod1;
  reg [19:0] prod2;
  
  fader_state POOP(
    .clk(clk),
    .n_reset(n_reset),
    .clear(clear),
    .fad_enable(fad_enable),
    .countVal(mult_val)
  );
  
  mult16by4 P1(
  .a(signal_in[31:16]),
  .b(mult_val[21:18]),
  .product(prod1)
  );
  
  mult16by4 P2(
  .a(signal_in[15:0]),
  .b(mult_val[21:18]),
  .product(prod2)
  );

assign signal_out[31:16] = prod1[19:4];
assign signal_out[15:0] = prod2[19:4];

endmodule