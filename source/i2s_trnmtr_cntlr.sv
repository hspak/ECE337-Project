// $Id: $
// File name:   i2s_trnmtr_cntlr.sv
// Created:     4/27/2014
// Author:      Clarence Beutel
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: I2S Transmitter Controller

module i2s_trnmtr_cntlr(
  input wire clk,
  input wire n_rst,
  input wire edge_detected,
  output wire shift,
  output wire load,
  output wire ws);
  
  reg clear = 1'b0;
  reg enable = 1'b1;
  //reg down_count_enable = 0;
  reg [5:0] sample_rollover = 6'b100000;
  reg [4:0] ws_rollover = 5'b10000;
  reg data_ready;
  reg ws_switch;
  reg ws_current;
  reg ws_next;
  reg [5:0] count_out_1;
  reg [4:0] count_out_2;
  
  reg shift_flag;
  reg load_flag;
  
  assign ws = ws_current;
  assign shift = shift_flag;
  assign load = load_flag;
  
  flex_counter # (6) EDGE_COUNTER_1    (.clk(clk),
                                        .n_rst(n_rst),
                                        .clear(clear),
                                        .count_enable(enable),
                                        .rollover_val(sample_rollover),
                                        .count_out(count_out_1),
                                        .rollover_flag(data_ready));
                                                    
  flex_counter # (5) EDGE_COUNTER_2    (.clk(clk),
                                        .n_rst(n_rst),
                                        .clear(clear),
                                        .count_enable(enable),
                                        .rollover_val(ws_rollover),
                                        .count_out(count_out_2),
                                        .rollover_flag(ws_switch));
  
  //shift out registers
  always_comb begin
    if(data_ready) begin
      shift_flag = 1'b0;
      load_flag = 1'b1;
    end
    else begin
      shift_flag = 1'b1;
      load_flag = 1'b0;
    end
  end
  
  //switch ws
  always_ff @ (posedge clk, negedge n_rst) begin
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