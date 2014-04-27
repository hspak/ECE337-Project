// $Id: $
// File name:   i2s_trnmtr_shift_reg.sv
// Created:     4/27/2014
// Author:      Clarence Beutel
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: I2S Transmitter Shift Register

module i2s_trnmtr_shift_reg(
  wire input clk,
  wire input n_rst,
  wire input shift,
  wire input load,
  wire input [32:0] data_in,
  wire output data_out));
  
  flex_pts_sr SHIFT_REGISTER # (NUM_BITS = 32) (.clk(clk),
                                                .n_rst(n_rst),
                                                .shift_enable(shift),
                                                .load_enable(load),
                                                .parallel_in(data_in),
                                                .serial_out(data_out));
                                                
endmodule