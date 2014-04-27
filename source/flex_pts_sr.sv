// $Id: $
// File name:   flex_pts_sr.sv
// Created:     2/10/2014
// Author:      Clarence Beutel
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Flexible Parallel to Serial Shift Register

module flex_pts_sr
  #(
  parameter NUM_BITS = 4,
  parameter SHIFT_MSB = 1)
  (
  input wire clk,
  input wire n_rst,
  input wire shift_enable,
  input wire load_enable,
  input wire [(NUM_BITS - 1):0] parallel_in,
  output wire serial_out);
  
  reg ff_out;
  reg [(NUM_BITS - 1):0] ff_in;
  
  assign serial_out = ff_out;
  
  always_ff @ (posedge clk, negedge n_rst)
  begin
    if(1'b0 == n_rst)
    begin
      ff_in <= '1;
    end
    else if(load_enable == 1'b1)
    begin
      ff_in <= parallel_in;
    end
    else if(shift_enable == 1'b1)
    begin
      if(SHIFT_MSB == 1)
      begin
        ff_in <= {ff_in[(NUM_BITS - 2):0], 1'b1};
      end
      else
      begin
        ff_in <= {1'b1, ff_in[(NUM_BITS - 1):1]};
      end
    end
  end
  
  always_comb
  begin
    if(SHIFT_MSB == 1)
    begin
      ff_out = ff_in[NUM_BITS - 1];
      //ff_in <= {ff_in[(NUM_BITS - 2):0], 1'b1};
    end
    else
    begin
      ff_out = ff_in[0];
      //ff_in <= {1'b1, ff_in[(NUM_BITS - 1):1]};
    end
  end
  
endmodule
