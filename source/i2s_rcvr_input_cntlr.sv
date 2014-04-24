// $Id: $
// File name:   i2s_rcvr_input_cntlr.sv
// Created:     4/24/2014
// Author:      Clarence Beutel
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: I2S Receiver Input Controller

module i2s_rcvr_input_cntlr(
  wire input clk,
  wire input n_rst,
  wire input edge_detected,
  wire output shift_out);
  
  reg clear = 0;
  reg down_count_enable = 0;
  reg rollover_val = 5'b10000;
  reg data_ready;
  
  ud_flex_counter EDGE_COUNTER # (NUM_CNT_BITS = 1)(.clk(clk),
                                                    .n_rst(n_rst),
                                                    .clear(clear),
                                                    .up_count_enable(edge_detected),
                                                    .down_count_enable(down_count_enable)
                                                    .rollover_val(rollover_val)
                                                    .rollover_flag(data_ready);
  
  //shift out registers
  always_comb begin
    if(data_ready) begin
      shift_out = 1'b1;
    end
    else begin
      shift_out = 1'b0;
    end
  end