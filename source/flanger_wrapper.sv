// $Id: $
// File name:   flanger_wrapper.sv
// Created:     4/30/2014
// Author:      Hong Shick Pak
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: .
module flanger_wrapper(
  input wire clk,
  input wire n_rst,
  input wire flanger_en,
  input wire [31:0] input_data,
  output reg [31:0] output_data
);
  reg clk_div;
  reg shift_en;
  reg [31:0] output_buffer;

  clk_div DIV(
    .clk(clk),
    .n_rst(n_rst),
    .clk_div(clk_div),
    .shift_en(shift_en)
  );

  flex_buffer #(32) BUF(
    .clk(clk_div),
    .n_rst(n_rst),
    .input_data(input_data),
    .output_data(output_buffer)
  );

  flanger DUT(
    .clk(clk),
    .n_rst(n_rst),
    .flanger_en(flanger_en),
    .shift_en(shift_en),
    .input_data(output_buffer),
    .output_data(output_data)
  );
endmodule 
