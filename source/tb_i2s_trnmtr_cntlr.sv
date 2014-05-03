// $Id: $
// File name:   tb_i2s_trnmtr_cntlr.sv
// Created:     4/29/2014
// Author:      Clarence Beutel
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: I2S Transmitter Controller Test Bench

`timescale 1ns / 10ps

module tb_i2s_trnmtr_cntlr();
  parameter CLK_PERIOD = 708;
  parameter MAX_CYCLES = 64;
  
  reg tb_clk;
  reg tb_n_rst;
  reg tb_ws;
  reg tb_start;
  integer tb_cycles;
  
  always begin
    tb_clk = 1'b1;
    #(CLK_PERIOD/2);
    tb_clk = 1'b0;
    #(CLK_PERIOD/2);
  end
  
  i2s_trnmtr_cntlr CONTROLLER(.clk(tb_clk),
                              .n_rst(tb_n_rst),
                              .ws(tb_ws),
                              .start(tb_start));
                              
  initial begin
    tb_n_rst = 1'b0;
    //tb_clear = 1'b1;
    @(negedge tb_clk)
    tb_n_rst = 1'b1;
    for (tb_cycles = 0; tb_cycles < MAX_CYCLES; tb_cycles += 1) begin
      @(negedge tb_clk);
    end
  end
endmodule