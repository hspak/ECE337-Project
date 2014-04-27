// $Id: $
// File name:   volume_mult.sv
// Created:     4/27/2014
// Author:      Hong Shick Pak
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: .
module volume_mult(
  input wire [15:0] channel_data,
  input wire [3:0] pot_data,
  output reg [15:0] output_data
);

  reg [19:0] buffer;
  
  mult16by4 DUT(
    .a(channel_data),
    .b(pot_data),
    .product(buffer)
  );

  assign output_data = (buffer >> 4);
endmodule
