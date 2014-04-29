// $Id: $
// File name:   tb_clk_div.sv
// Created:     4/28/2014
// Author:      Hong Shick Pak
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: .
`timescale 1ns / 10ps

module tb_clk_div();
  localparam CLK_PERIOD = 5;

  // input
  reg tb_clk;
  reg tb_n_rst;

  // output
  reg tb_clk_div;
  reg tb_shift_en;

  // call
  clk_div DUT(
    .clk(tb_clk),
    .n_rst(tb_n_rst),
    .clk_div(tb_clk_div),
    .shift_en(tb_shift_en)
  );

  always begin
    tb_clk = 1'b1;
    #(CLK_PERIOD/2);
    tb_clk = 1'b0;
    #(CLK_PERIOD/2);
  end

  initial begin
    tb_n_rst = 1'b1;
  end
endmodule
