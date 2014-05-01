// $Id: $
// File name:   i2s_trnmtr_double_reg.sv
// Created:     4/30/2014
// Author:      Clarence Beutel
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Double Register for I2S Transmitter

module i2s_trnmtr_double_reg(
  input wire clk,
  input wire n_rst,
  input wire [31:0] data_in,
  output wire [15:0] data_left,
  output wire [15:0] data_right);
  
  reg [15:0] ff_left;
  reg [15:0] ff_right;
  
  assign data_left = ff_left;
  assign data_right = ff_right;
  
  always_ff @ (posedge clk, negedge n_rst) begin
    if (!n_rst) begin
      ff_left <= '0;
    end
    else begin
      ff_left <= data_in[31:16];
    end
  end
  
  always_ff @ (posedge clk, negedge n_rst) begin
    if (!n_rst) begin
      ff_right <= '0;
    end
    else begin
      ff_right <= data_in[15:0];
    end
  end
  
endmodule