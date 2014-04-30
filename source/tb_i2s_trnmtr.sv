// $Id: $
// File name:   tb_i2s_trnmtr.sv
// Created:     4/28/2014
// Author:      Clarence Beutel
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Transmitter (and Receiver) Test Bench

`timescale 1ns / 10ps

module tb_i2s_trnmtr();
  parameter CLK_PERIOD = 708;
  parameter MAX_VAL = 10;  //44100
  
  reg tb_clk;
  reg tb_n_rst;
  reg [31:0] tb_parallel_data_in;
  reg [31:0] tb_parallel_data_out;
  reg tb_ws;
  reg tb_serial_data;
  reg tb_sck;
  integer tb_clocks;
  
  i2s_trnmtr TRANSMITTER (.clk(tb_clk),
                          .n_rst(tb_n_rst),
                          .parallel_data(tb_parallel_data_in),
                          .ws(tb_ws),
                          .serial_data(tb_serial_data),
                          .sck(tb_sck));
                          
  i2s_rcvr RECEIVER(.clk(tb_sck),
                    .n_rst(tb_n_rst),
                    .ws(tb_ws),
                    .serial_data(tb_serial_data),
                    .parallel_data(tb_parallel_data_out));
                    
  always begin
    tb_clk = 1'b1;
    #(CLK_PERIOD/2);
    tb_clk = 1'b0;
    #(CLK_PERIOD/2);
  end
  
  integer tb_test_case;
  
  initial begin
    tb_n_rst = 1'b1;
    tb_parallel_data_in = 32'hFAAAAAA0; //{tb_test_case,tb_test_case};
    for (tb_clocks = 0; tb_clocks < 32; tb_clocks += 1) begin
      @(negedge tb_clk);
    end
    for (tb_test_case = 1; tb_test_case < MAX_VAL; tb_test_case += 1) begin
      tb_parallel_data_in = {tb_test_case, tb_test_case};
      for (tb_clocks = 0; tb_clocks < 32; tb_clocks += 1) begin
        @(negedge tb_clk);
      end
      if (tb_parallel_data_out == tb_parallel_data_in) begin
        $info("Test Vector %0d:: PASSED", tb_test_case);
      end
      else begin
        $error("Test Vector %0d:: FAILED", tb_test_case);
      end
    end
  end
endmodule