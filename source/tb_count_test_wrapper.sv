// $Id: $
// File name:   tb_count_test_wrapper.sv
// Created:     5/3/2014
// Author:      Clarence Beutel
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Test Bench for Counter

`timescale 1ns / 10ps

module tb_count_test_wrapper();
  parameter CLK_PERIOD = 5;
  parameter CYCLES = 64;
  
  reg tb_clk;
  reg tb_n_rst;
  reg tb_clear;
  reg tb_enable;
  reg [5:0] tb_sample_rollover;
  reg [5:0] tb_count_out;
  reg tb_flag;
  reg tb_cycles;
  
  //integer tb_test_vector;
  
  always begin
    tb_clk = 1'b1;
    #(CLK_PERIOD/2);
    tb_clk = 1'b0;
    #(CLK_PERIOD/2);
  end
  
  count_test_wrapper COUNTER (.clk(tb_clk),
                        .n_rst(tb_n_rst),
                        .clear(tb_clear),
                        .count_enable(tb_enable),
                        .rollover_val(tb_sample_rollover),
                        .count_out(tb_count_out),
                        .rollover_flag(tb_flag));
  
  initial begin
    tb_enable = 1'b1;
    tb_clear = 1'b0;
    tb_sample_rollover = 6'b100000;
    tb_n_rst = 1'b0;
    @(negedge tb_clk);
    tb_n_rst = 1'b1;
    for (tb_cycles = 0; tb_cycles < CYCLES; tb_cycles += 1) begin
      @(negedge tb_clk);
      $display("count: 0%d, flag: 0%d", tb_count_out, tb_flag);
    end
  end
endmodule