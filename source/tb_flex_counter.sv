// $Id: $
// File name:   tb_flex_counter.sv
// Created:     4/29/2014
// Author:      Clarence Beutel
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Testing flex_counters

`timescale 1ns / 10ps

module tb_flex_counter();
  parameter CLK_PERIOD = 5;
  parameter CYCLES = 64;
  
  reg tb_clk;
  reg tb_n_rst;
  reg tb_clear;
  reg tb_enable;
  reg [5:0] tb_sample_rollover;
  reg [5:0] tb_count_out;
  reg tb_flag;
  
  integer tb_test_vector;
  
  always begin
    tb_clk = 1'b1;
    #(CLK_PERIOD/2);
    tb_clk = 1'b0;
    #(CLK_PERIOD/2);
  end
  
  flex_counter # (6) COUNTER (.clk(tb_clk),
                        .n_rst(tb_n_rst),
                        .clear(tb_clear),
                        .count_enable(tb_enable),
                        .rollover_val(tb_sample_rollover),
                        .count_out(tb_count_out),
                        .rollover_flag(tb_flag));
  
  initial begin
    tb_n_rst = 1'b0;
    @(posedge tb_clk);
    tb_n_rst = 1'b1;
    tb_enable = 1'b1;
    tb_clear = 1'b0;
    tb_sample_rollover = 6'b100000;
  end
endmodule