// $Id: $
// File name:   i2s_trnmtr.sv
// Created:     4/27/2014
// Author:      Clarence Beutel
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: I2S Transmitter Top Level File

module i2s_trnmtr(
  wire input clk,
  wire input n_rst,
  wire input [32:0] parallel_data,
  wire output ws,
  wire output serial_data,
  wire output sck);
  
  reg edge_detected;
  reg shift;
  reg load;
  
  i2s_trnmtr_edge_detector EDGE_DETECTOR (.clk(clk),
                                          .n_rst(n_rst),
                                          .edge_detected(edge_detected));
                                          
  i2s_trnmter_cntlr CONTROLLER (.clk(clk),
                                .n_rst(n_rst),
                                .edge_detected(edge_detected),
                                .shift(shift),
                                .load(load),
                                .ws(ws));
                                
  i2s_trnmter_shift_reg SHIFT_REGISTER (.clk(clk),
                                        .n_rst(n_rst),
                                        .shift(shift),
                                        .load(load),
                                        .data_in(parallel_data),
                                        .data_out(serial_data));
  
  assign sck = clk;
  
endmodule