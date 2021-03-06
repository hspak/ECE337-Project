// $Id: $
// File name:   clk_divider.sv
// Created:     4/28/2014
// Author:      Hong Shick Pak
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: 
module clk_div(
  input wire clk,
  input wire n_rst,
  output reg clk_div,
  output reg shift_en
);

  reg [4:0] curr_c;
  reg [4:0] next_c;
  reg clk_div_next;

  always_ff @ (posedge clk, negedge n_rst) begin
    if (!n_rst) begin
      curr_c <= '0;
      clk_div <= '0;
    end else begin
      curr_c <= next_c;
      clk_div <= clk_div_next;
    end
  end

  always_comb begin
    if (curr_c == 5'b10001) begin
      next_c = 5'b0;
      clk_div_next = !clk_div;
      shift_en = clk_div;
    end else begin
      next_c = curr_c + 1'b1;
      clk_div_next = clk_div;
      shift_en = 1'b0;
    end
  end
endmodule
