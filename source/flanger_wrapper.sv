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
  output reg [31:0] output_data,

  input wire mem_clr,
  input wire mem_init,
  input wire mem_dump
);
  reg clk_div;
  reg shift_en;
  reg [31:0] output_buffer;
  reg [31:0] read_data;
  reg sram_rw;

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
    .read_data(read_data),
    .output_data(output_data),  // output
    .sram_rw(sram_rw)           // output
  );

  sram_controller RAMC(
    .clk(clk),
    .n_rst(n_rst),
    .rw_trigger(sram_rw),
    .mem_clr(mem_clr),
    .mem_init(mem_init),
    .mem_dump(mem_dump),
    .write_data(input_data),
    .sram_data(read_data) // output
  );
endmodule 
