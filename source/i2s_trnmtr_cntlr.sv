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
  
  //reg clear = 1'b0;
  //reg enable = 1'b1;
  //reg down_count_enable = 0;
  //reg [5:0] sample_rollover = 6'b100000;
  //reg [4:0] ws_rollover = 5'b10000;
  //reg data_ready;
  reg ws_switch;
  reg ws_current;
  reg ws_next;
  //reg start_flag;
  //reg [5:0] count_out_1;
  reg [4:0] count_out_2;
  
  //reg shift_flag;
  reg load_flag;
  
  assign ws = ws_current;
  //assign start = start_flag;
  //assign shift = shift_flag;
  assign load = load_flag;
  /*
  flex_counter # (6) EDGE_COUNTER_1    (.clk(clk),
                                        .n_rst(n_rst),
                                        .clear(clear),
                                        .count_enable(enable),
                                        .rollover_val(sample_rollover),
                                        .count_out(count_out_1),
                                        .rollover_flag(data_ready));
  */                                                  
  flex_counter # (5) EDGE_COUNTER_2    (.clk(clk),
                                        .n_rst(n_rst),
                                        .clear(1'b0),
                                        .count_enable(1'b1),
                                        .rollover_val(5'b10000),
                                        .count_out(count_out_2),
                                        .rollover_flag(ws_switch));
  
  //switch ws
  /*
  always_ff @ (posedge clk, negedge n_rst) begin
    if(!n_rst) begin
      ws_current <= 1'b0; //been toggling this back and forth
    end
    else begin
      ws_current <= ws_next;
    end
  end
  
  always_comb begin
    if(ws_switch) begin //or is a hail marry | (count_out_2 == 6'b000000)
      clear = 1'b1;
      ws_next = !ws_current;
    end
    else begin
      clear = 1'b0;
      ws_next = ws_current;
    end
  end
  
  always_comb begin
    if(count_out_2 == 5'b00001) begin
      start_flag = 1'b1;
    end
    else begin
      start_flag = 1'b0;
    end
  end
  */                                 
  typedef enum bit [2:0] {START, LOAD_L, LOAD_R, TRANSMIT_L, TRANSMIT_R} stateType;
  stateType state;
  stateType next_state;
  
  always_ff @ (posedge clk, negedge n_rst) begin
    if (!n_rst) begin
      state <= START;
      //ws_current <= !'b0;
    end
    else begin
      state <= next_state;
      //ws_current <= ws_next;
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
  
  //shift out registers
  /*
  always_comb begin
    if(data_ready | (count_out_1 == 6'b000000)) begin
      ws = 
    end
    else begin
      shift_flag = 1'b1;
      load_flag = 1'b0;
    end
  end
  */
  
endmodule