// $Id: $
// File name:   i2s_trnmtr.sv
// Created:     4/27/2014
// Author:      Clarence Beutel
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: I2S Transmitter Top Level File

module i2s_trnmtr(
  input wire clk,
  input wire n_rst,
  input wire [31:0] parallel_data,
  output wire ws,
  output wire serial_data,
  output wire sck);
  
  reg edge_detected;
  reg shift;
  reg load;
  
  i2s_trnmtr_edge_detector EDGE_DETECTOR (.clk(clk),
                                          .n_rst(n_rst),
                                          .edge_detected(edge_detected));
                                          
  i2s_trnmtr_cntlr CONTROLLER (.clk(clk),
                                .n_rst(n_rst),
                                .edge_detected(edge_detected),
                                .shift(shift),
                                .load(load),
                                .ws(ws));
                                
  i2s_trnmtr_shift_reg SHIFT_REGISTER (.clk(clk),
                                        .n_rst(n_rst),
                                        .shift(shift),
                                        .load(load),
                                        .data_in(parallel_data),
                                        .data_out(serial_data));
  
  assign sck = clk;
  
endmodule