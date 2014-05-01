// $Id: $
// File name:   i2s_trnmtr_shift_reg.sv
// Created:     4/27/2014
// Author:      Clarence Beutel
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: I2S Transmitter Shift Register

module i2s_trnmtr_shift_reg(
  input wire clk,
  input wire n_rst,
  input wire shift,
  input wire load,
  input wire wsd,
  input wire [15:0] data_left,
  input wire [15:0] data_right,
  output wire data_out);
  
  reg [15:0] data;
  
  flex_pts_sr # (16) SHIFT_REGISTER (.clk(clk),
                                     .n_rst(n_rst),
                                     .shift_enable(shift),
                                     .load_enable(load),
                                     .parallel_in(data),
                                     .serial_out(data_out));
  
  always_comb begin
    if (!wsd) begin
      data = data_left;
    end
    else begin
      data = data_right;
    end
  end
endmodule