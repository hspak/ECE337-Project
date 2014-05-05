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
  output wire ws,
  output wire load);
  
  reg ws_switch;
  reg ws_current;
  reg ws_next;
  reg [4:0] count_out_2;
  
  reg load_flag;
  
  assign ws = ws_current;
  assign load = load_flag;
                                                 
  flex_counter # (5) EDGE_COUNTER_2    (.clk(clk),
                                        .n_rst(n_rst),
                                        .clear(1'b0),
                                        .count_enable(1'b1),
                                        .rollover_val(5'b10000),
                                        .count_out(count_out_2),
                                        .rollover_flag(ws_switch));
                                 
  typedef enum bit [2:0] {START, LOAD_L, LOAD_R, TRANSMIT_L, TRANSMIT_R} stateType;
  stateType state;
  stateType next_state;
  
  always_ff @ (posedge clk, negedge n_rst) begin
    if (!n_rst) begin
      state <= START;
    end
    else begin
      state <= next_state;
    end
  end
  
  
  always_comb begin
    ws_current = 1'b1;
    load_flag = 1'b0;
    next_state = START;
    case(state)
      START:
      begin
        load_flag = 1'b0;
        ws_current = 1'b0;
        next_state = LOAD_L;
      end
      LOAD_L:
      begin
        load_flag = 1'b1;
        ws_current = 1'b0;
        next_state = TRANSMIT_L;
      end
      LOAD_R:
      begin
        load_flag = 1'b1;
        ws_current = 1'b1;
        next_state = TRANSMIT_R;
      end
      TRANSMIT_L:
      begin
        load_flag = 1'b0;
        ws_current = 1'b0;
        if(ws_switch) next_state = LOAD_R;
        else next_state = TRANSMIT_L;
      end
      TRANSMIT_R:
      begin
        load_flag = 1'b0;
        ws_current = 1'b1;
        if(ws_switch) next_state = LOAD_L;
        else next_state = TRANSMIT_R;
      end
    endcase
  end
  
endmodule