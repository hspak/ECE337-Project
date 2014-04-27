// $Id: $
// File name:   flanger_adder.sv
// Created:     4/27/2014
// Author:      Hong Shick Pak
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: .
module flanger_adder(
  input wire [31:0] flanger_data,
  input wire [31:0] sram_data,
  output reg [31:0] output_data
);

  reg [15:0] upper_sum;
  reg [15:0] lower_sum;

  cla_16bit ADD1(
    .a(flanger_data[15:0]), 
    .b(sram_data[15:0]),
    .sum(lower_sum),
    .cin(0)
  );

  cla_16bit ADD2(
    .a(flanger_data[31:16]), 
    .b(sram_data[31:16]),
    .sum(upper_sum),
    .cin(0)
  );

  assign output_data = {upper_sum, lower_sum};
endmodule
