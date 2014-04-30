// $Id: $
// File name:   i2s_rcvr_double_reg.sv
// Created:     4/30/2014
// Author:      Clarence Beutel
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Double Register for I2S Receiver

module i2s_rcvr_double_reg(
  input wire clk,
  input wire n_rst,
  input wire wsd,
  input wire wsp,
  input wire [15:0] data_in,
  output wire [15:0] data_left,
  output wire [15:0] data_right);
  
  reg [15:0] ff_left;
  reg [15:0] ff_right;
  reg [15:0] new_left;
  reg [15:0] new_right;
  
  assign data_left = ff_left;
  assign data_right = ff_right;
  
  always_ff @ (posedge clk, negedge n_rst) begin
    if (!n_rst) begin
      ff_left <= '0;
    end
    else begin
      ff_left <= new_left;
    end
  end
  
  always_ff @ (posedge clk, negedge n_rst) begin
    if (!n_rst) begin
      ff_right <= '0;
    end
    else begin
      ff_right <= new_right;
    end
  end
  
  always_comb begin
    if (!wsd & wsp) begin
      new_left = data_left;
    end
    else begin
      new_left = ff_left;
    end
  end
  
  always_comb begin
    if (wsd & wsp) begin
      new_right = data_right;
    end
    else begin
      new_right = ff_right;
    end
  end
  
endmodule