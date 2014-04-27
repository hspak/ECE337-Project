// $Id: $
// File name:   i2s_rcvr_shift_reg.sv
// Created:     4/27/2014
// Author:      Clarence Beutel
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: I2S Receiver Shift Register

module i2s_rcvr_shift_reg(
  wire input clk,
  wire input n_rst,
  wire input shift,
  wire input data_in,
  wire output data_out);
  
  flex_stp_sr SHIFT_REGISTER # (NUM_BITS = 32) (.clk(clk),
                                                .n_rst(n_rst),
                                                .shift_enable(shift),
                                                .serial_in(data_in),
                                                .parallel_out(data_out));
                                                
endmodule