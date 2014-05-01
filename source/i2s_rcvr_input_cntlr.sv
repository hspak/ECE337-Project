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
  //input wire enable,
  //input wire clear,
  output wire shift);
  
  reg enable = 1'b1;
  reg [4:0] sample_rollover = 5'b10001;
  reg [4:0] count_out;
  reg data_ready;
  //reg shift_flag;
  reg clear = 1'b0;
  reg shift_current;
  reg shift_next;
  
  assign shift = shift_current;
  
  flex_counter # (5) EDGE_COUNTER_1    (.clk(!clk),
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
  always_ff @ (posedge clk, negedge n_rst) begin
    if(!n_rst) begin
      shift_current <= 1'b0; //been toggling this back and forth
    end
    else begin
      shift_current <= shift_next;
    end
  end
  
  always_comb begin
    if(data_ready) begin //| clear
      shift_next = 1'b0;
      //clear = 1'b1;
      //enable = 1'b0;
    end
    else begin
      shift_next = 1'b1;
      //clear = 1'b0;
    end
  end
  
endmodule