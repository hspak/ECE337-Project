// $Id: $
// File name:   tb_i2s.sv
// Created:     4/28/2014
// Author:      Clarence Beutel
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: I2S Transmitter and Receiver Testbench

`timescale 1ns / 10ps

module tb_i2s();
  parameter CLK_PERIOD = 709;
  parameter MAX_VAL = 44100;
  
  reg tb_clk;
  reg tb_n_rst;
  reg [32:0] tb_parallel_data;
  reg tb_ws;
  reg tb_serial_data;
  reg tb_sck;
  
  i2s_trnmtr TRANSMITTER (.clk(tb_clk),
                          .n_rst(tb_n_rst),
                          .parallel_data(tb_parallel_data),
                          .ws(tb_ws),
                          .serial_data(tb_serial_data),
                          .sck(tb_sck));
                          
  i2s_rcvr RECEIVER(.clk(tb_sck),
                    .n_rst(tb_n_rst),
                    .ws(tb_ws),
                    .serial_data(tb_serial_data),
                    .parallel_data(tb_parallel_data));
                    
  always begin
    tb_clk = 1'b1;
    #(CLK_PERIOD/2);
    tb_clk = 1'b0;
    #(CLK_PERIOD/2);
  end
  
  integer tb_test_case;
  
  initial begin
    for (tb_test_case = 1; tb_test_case < MAX_VAL; tb_test_case += 1) begin
      tb_parallel_data = {tb_test_case,tb_test_case}
    end
  end
endmodule