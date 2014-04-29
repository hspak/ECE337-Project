// $Id: $
// File name:   i2s_rcvr_input_cntlr.sv
// Created:     4/24/2014
// Author:      Clarence Beutel
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: I2S Receiver Input Controller

module i2s_rcvr_input_cntlr(
  input wire clk,
  input wire n_rst,
  input wire edge_detected,
  output wire shift);
  
  reg shift_flag;
  
  assign shift = shift_flag;
  
  //shift in registers
  always_comb begin
    if(edge_detected) begin
      shift_flag = 1'b0;
    end
    else begin
      shift_flag = 1'b1;
    end
  end
  
endmodule