// $Id: $
// File name:   tb_i2s_test_wrapper.sv
// Created:     4/30/2014
// Author:      Clarence Beutel
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Testbench for I2S

`timescale 1ns / 10ps

module tb_i2s_test_wrapper();
  parameter CLK_PERIOD = 708;
  parameter MAX_VAL = 10;  //44100
  
  reg tb_clk;
  reg tb_n_rst;
  reg [15:0] tb_clocks;
  reg [31:0] tb_parallel_data_in;
  //reg [15:0] tb_test_case;
  reg [31:0] tb_parallel_data_out;
  
  i2s_test_wrapper TEST_WRAPPER  (.clk(tb_clk),
                                  .n_rst(tb_n_rst),
                                  .parallel_data_in(tb_parallel_data_in),
                                  .parallel_data_out(tb_parallel_data_out));
                                  
  always begin
    tb_clk = 1'b1;
    #(CLK_PERIOD/2);
    tb_clk = 1'b0;
    #(CLK_PERIOD/2);
  end
  
  initial begin
    tb_n_rst = 1'b0;
    @(negedge tb_clk);
    tb_n_rst = 1'b1;
    
    tb_parallel_data_in = 32'hFAAAAAA0;
    for (tb_clocks = 0; tb_clocks < 34; tb_clocks += 1) begin
      @(negedge tb_clk);
    end
    
    tb_parallel_data_in = 32'h80000001;
    for (tb_clocks = 0; tb_clocks < 34; tb_clocks += 1) begin
      @(negedge tb_clk);
    end
  
    tb_parallel_data_in = 32'h1FFFFFF8;
    for (tb_clocks = 0; tb_clocks < 34; tb_clocks += 1) begin
      @(negedge tb_clk);
    end
  
    tb_parallel_data_in = 32'hFBBBBBB0;
    for (tb_clocks = 0; tb_clocks < 34; tb_clocks += 1) begin
      @(negedge tb_clk);
    end
  
    /*
    for (tb_test_case = 1; tb_test_case < MAX_VAL; tb_test_case += 1) begin
      tb_parallel_data_in = {tb_test_case, tb_test_case + 2'b11};
      for (tb_clocks = 0; tb_clocks < 34; tb_clocks += 1) begin
        @(negedge tb_clk);
      end
      tb_parallel_data_out = {tb_left_channel, tb_right_channel};
      if (tb_parallel_data_out == tb_parallel_data_in) begin
        $info("Test Vector %0d:: PASSED", tb_test_case);
      end
      else begin
        $error("Test Vector %0d:: FAILED", tb_test_case);
      end
    end
    */
  end
endmodule