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
  input wire clear,
  output wire shift);
  
  reg enable = 1'b1;
  reg [4:0] sample_rollover = 5'b10000;
  reg [4:0] count_out;
  reg data_ready;
  reg shift_flag;
  
  assign shift = shift_flag;
  
  flex_counter # (5) EDGE_COUNTER_1    (.clk(clk),
                                        .n_rst(n_rst),
                                        .clear(clear),
                                        .count_enable(enable),
                                        .rollover_val(sample_rollover),
                                        .count_out(count_out),
                                        .rollover_flag(data_ready));
  
  //shift in registers
  /*
  always_comb begin
    if(edge_detected) begin
      shift_flag = 1'b0;
    end
    else begin
      shift_flag = 1'b1;
    end
  end
  */
  always_comb begin
    if(data_ready | clear) begin
      shift_flag = 1'b0;
    end
    else begin
      shift_flag = 1'b1;
    end
  end
  
endmodule