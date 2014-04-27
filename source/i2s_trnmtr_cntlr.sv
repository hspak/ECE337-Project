// $Id: $
// File name:   i2s_trnmtr_cntlr.sv
// Created:     4/27/2014
// Author:      Clarence Beutel
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: I2S Transmitter Controller

module i2s_trnmtr_cntlr(
  wire input clk,
  wire input n_rst,
  wire input edge_detected,
  wire output shift,
  wire output load,
  wire output ws);
  
  reg clear = 0;
  reg down_count_enable = 0;
  reg sample_rollover = 6'b100000;
  reg ws_rollover = 5'b10000;
  reg data_ready;
  reg ws_switch;
  reg ws_current;
  reg ws_next;
  
  assign ws = ws_current;
  
  ud_flex_counter EDGE_COUNTER # (NUM_CNT_BITS = 1)(.clk(clk),
                                                    .n_rst(n_rst),
                                                    .clear(clear),
                                                    .up_count_enable(edge_detected),
                                                    .down_count_enable(down_count_enable)
                                                    .rollover_val(sample_rollover)
                                                    .rollover_flag(data_ready);
                                                    
  ud_flex_counter EDGE_COUNTER # (NUM_CNT_BITS = 1)(.clk(clk),
                                                    .n_rst(n_rst),
                                                    .clear(clear),
                                                    .up_count_enable(edge_detected),
                                                    .down_count_enable(down_count_enable)
                                                    .rollover_val(ws_rollover)
                                                    .rollover_flag(ws_switch);
  
  //shift out registers
  always_comb begin
    if(data_ready) begin
      shift = 1'b0;
      load = 1'b1;
    end
    else begin
      shift = 1'b1;
      load = 1'b0;
    end
  end
  
  //switch ws
  always_ff (posedge clk, negedge n_rst) begin
    if(!n_rst) begin
      ws_current <= 1'b1;
    end
    else begin
      ws_current <= ws_next;
    end
  end
  
  always_comb begin
    if(ws_switch) begin
      ws_next = !ws_current;
    end
    else begin
      ws_next = ws_current;
    end
  end
  
endmodule