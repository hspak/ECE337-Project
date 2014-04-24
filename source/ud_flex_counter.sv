// $Id: $
// File name:   flex_counter.sv
// Created:     2/12/2014
// Author:      Patrick Gohier
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Flexible & Scalable Counter with Controlled Rollover
module ud_flex_counter
  #(
  parameter NUM_CNT_BITS = 21
  )
  (
  input wire clk,
  input wire n_rst,
  input wire clear,
  input wire up_count_enable,
  input wire down_count_enable,
  //input wire [NUM_CNT_BITS-1:0] rollover_val,
  output wire [NUM_CNT_BITS-1:0] count_out,
  //output wire rollover_flag
  );
  reg [NUM_CNT_BITS:0] current;
  reg [NUM_CNT_BITS:0] next;
  
  always_ff @ (posedge clk, negedge n_rst)
  begin
    if (1'b0 == n_rst)
      begin
        current <= 21'b101011000100010100001;
      end
    else
      begin
        current <= next;
      end   
    end


  always_comb
  begin
    if (up_count_enable)
      begin
        /*if(current[NUM_CNT_BITS-1:0] == (rollover_val-1))
          begin
            next = {1'b1,rollover_val};
          end*/
        //else
          //begin
            if(current[NUM_CNT_BITS] == 1'b1)
              begin
                next = {{(NUM_CNT_BITS){1'b0}},1'b1};
              end
            else
              begin
                next = current + 1;
              end
          //end
      end
    else if (down_count_enable)
      begin
        /*if(current[NUM_CNT_BITS-1:0] == (rollover_val-1))
          begin
            next = {1'b1,rollover_val};
          end
        else
          begin*/
            if(current[NUM_CNT_BITS] == 1'b1)
              begin
                next = {{(NUM_CNT_BITS){1'b0}},1'b1};
              end
            else
              begin
                next = current - 1;
              end
          //end
      end
    else
      begin
        next = current;
      end      
    if (clear)
      begin
        next = 21'b101011000100010100001;
      end
  end
  
  assign count_out = current[NUM_CNT_BITS-1:0];
  //assign rollover_flag = current[NUM_CNT_BITS];
endmodule