// $Id: $
// File name:   i2s_test_wrapper.sv
// Created:     4/30/2014
// Author:      Clarence Beutel
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Testing Wrapper for I2S

module i2s_test_wrapper(
  input wire clk,
  input wire n_rst,
  input wire [31:0] parallel_data_in,
  output wire [31:0] parallel_data_out);
  
  reg ws;
  reg serial_data;
  reg sck;
  
  i2s_trnmtr TRANSMITTER (.clk(clk),
                          .n_rst(n_rst),
                          .parallel_data(parallel_data_in),
                          .ws_flag(ws),
                          .serial_data(serial_data),
                          .sck(sck));
                          
  i2s_rcvr RECEIVER(.clk(sck),
                    .n_rst(n_rst),
                    .ws(ws),
                    .serial_data(serial_data),
                    .parallel_data(parallel_data_out));
endmodule