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
  
  reg [21:0] mult_val;//mult_val is value (out of 1,411,233 or 21'b101011000100010100001) that the signal is being multiplied by
  
  fader_state POOP(
    .clk(clk),
    .n_reset(n_reset),
    .clear(clear),
    .fad_enable(fad_enable),
    .countVal(mult_val)
  );
  
  fader_wrapper POO(
  (signal_in)
  (mult_val)
  (signal_out)
  );



endmodule