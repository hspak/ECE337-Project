// $Id: $
// File name:   i2s_rcvr.sv
// Created:     4/27/2014
// Author:      Clarence Beutel
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: I2S Receiver Top Level Module

module i2s_rcvr(
  input wire clk,
  input wire n_rst,
  input wire ws,
  input wire serial_data,
  output wire [31:0] parallel_data);
  
  reg detected;
  reg shift;
  
  i2s_rcvr_edge_detector EDGE_DETECTOR (.clk(clk),
                                        .n_rst(n_rst),
                                        .ws(ws),
                                        .edge_detected(detected));
                                        
  i2s_rcvr_input_cntlr INPUT_CONTROLLER(.clk(clk),
                                        .n_rst(n_rst),
                                        .edge_detected(detected),
                                        .shift(shift));
                                        
  i2s_rcvr_shift_reg SHIFT_REGISTER(.clk(clk),
                                    .n_rst(n_rst),
                                    .shift(shift),
                                    .data_in(serial_data),
                                    .data_out(parallel_data));
  
endmodule