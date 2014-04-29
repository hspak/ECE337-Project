// $Id: $
// File name:   fader_state.sv
// Created:     4/23/2014
// Author:      Patrick Gohier
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Fader State Machine
module fader_state (
    input wire clk,
    input wire n_reset,
    input wire clear,
    input wire fad_enable,
    output reg [21:0] countVal
);

  typedef enum bit [3:0] {
  idle,
  countUp,
  countDown
  } stateType;
  
  reg upCnt=1'b0;
  reg dnCnt=1'b0;
  reg roll_flag;
  //reg [21:0] countVal = 21'b101011000100010100001;
  
ud_flex_counter #(.NUM_CNT_BITS(22)) DUT(
  .clk(clk),
  .n_rst(n_reset),
  .clear(clear),
  .up_count_enable(upCnt),
  .down_count_enable(dnCnt),
  .rollover_val(22'b1111111111111111111111),
  .count_out(countVal),
  .rollover_flag(roll_flag)
  );
  
  stateType state;
  stateType nxt_state;
  
  always_ff @ (negedge n_reset, posedge clk)
  begin
    if(1'b0 == n_reset)
    begin
      state <= idle;
    end
    else
      begin
        state <= nxt_state;
      end        
  end 
  //starts idle, if enabled, starts counting down from 1,411,233 or 21'b101011000100010100001 (2 secs), then reaches 0, and starts counting back up to (2 secs)
always_comb
  begin  
    case (state)       
      idle:
      begin
        if (fad_enable == 1'b1)
          begin
            nxt_state = countDown;
          end
        else
          begin
            nxt_state = idle;
          end
      end
      
      countDown:
      begin  
        if(countVal=='0)
          begin
            nxt_state = countUp;
          end
        else
          begin
            nxt_state = countDown;
          end
      end 
           
      countUp:
      begin
        if(countVal == 21'b111111111111111111111)
          begin
            nxt_state = idle;
          end
        else
          begin
            nxt_state = countUp;
          end
      end
      default:
      begin
        nxt_state = idle;
      end          
    endcase
  end  
  
  //Combinational (effect) logic - bits thrown into counter
  always_comb
  begin
        upCnt = 1'b0;
        dnCnt = 1'b0;
    case (state)       
      idle:
      begin
        upCnt = 1'b0;
        dnCnt = 1'b0;
      end
      
      countUp:
      begin
        upCnt = 1'b1;
        dnCnt = 1'b0;
      end 

      countDown:
      begin
        upCnt = 1'b0;
        dnCnt = 1'b1;
      end
      
      default:
      begin
        upCnt = 1'b0;
        dnCnt = 1'b0;
      end          
    endcase
  end  
  
endmodule

