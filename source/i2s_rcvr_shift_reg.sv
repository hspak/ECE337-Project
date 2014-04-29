// $Id: $
// File name:   i2s_rcvr_shift_reg.sv
// Created:     4/27/2014
// Author:      Clarence Beutel
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: I2S Receiver Shift Register

module i2s_rcvr_shift_reg(
  input wire clk,
  input wire n_rst,
  input wire shift,
  input wire data_in,
  output wire [32:0] data_out);
  
  flex_stp_sr # (32) SHIFT_REGISTER(.clk(clk),
                                    .n_rst(n_rst),
                                    .shift_enable(shift),
                                    .serial_in(data_in),
                                    .parallel_out(data_out));
                                                
endmodule