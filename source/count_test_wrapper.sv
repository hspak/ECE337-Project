// $Id: $
// File name:   count_test_wrapper.sv
// Created:     5/3/2014
// Author:      Clarence Beutel
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Count Test Wrapper

module count_test_wrapper(
  input wire clk,
  input wire n_rst,
  input wire clear,
  input wire count_enable,
  input wire [5:0] rollover_val,
  output wire [5:0] count_out,
  output wire rollover_flag
  );
  
  localparam BITS = 6;
  
  reg [5:0] count;
  reg flag;
  
  flex_counter #(BITS) COUNTER (.clk(clk),
                        .n_rst(n_rst),
                        .clear(clear),
                        .count_enable(count_enable),
                        .rollover_val(rollover_val),
                        .count_out(count),
                        .rollover_flag(flag));
  
  assign count_out = count;
  assign rollover_flag = flag;
  
endmodule