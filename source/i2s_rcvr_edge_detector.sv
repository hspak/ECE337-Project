// $Id: $
// File name:   i2s_rcvr_edge_detector.sv
// Created:     4/27/2014
// Author:      Clarence Beutel
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: I2S Receiver Edge Detector

module i2s_rcvr_edge_detector(
  wire input clk,
  wire input n_rst,
  wire input ws,
  wire output edge_detected);
  
  reg ff_out_1;
  reg ff_out_2;
  
  //First flip-flop
  always_ff @ (posedge clk, negedge n_rst) begin
    if(n_rst == 1'b0) begin
      ff_out_1 <= 1'b0;
    end
    else begin
      ff_out_1 <= ws;
    end
  end
  
  //Second flip-flop
  always_ff @ (posedge clk, negedge n_rst) begin
    if(n_rst == 1'b0) begin
      ff_out_2 <= 1'b0;
    end
    else begin
      ff_out_2 <= ff_out_1;
    end
  end
  
  //Detection logic
  always_comb begin
    edge_detected = ff_out_1 ^ ff_out_2;
  end
  
endmodule