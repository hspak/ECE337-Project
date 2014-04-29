// $Id: $
// File name:   flex_buffer.sv
// Created:     4/23/2014
// Author:      Hong Shick Pak
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: .
module flex_buffer
#(
  NUM_BITS = 32
)
(
  input wire clk,
  input wire n_rst,
  input wire [NUM_BITS-1:0] input_data,
  output reg [NUM_BITS-1:0] output_data
);

  always_ff @ (posedge clk, negedge n_rst) begin
    if (!n_rst) begin
      output_data <= '0;
    end else begin
      output_data <= input_data;
    end
  end
endmodule
