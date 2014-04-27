// $Id: $
// File name:   flex_stp_sr.sv
// Created:     2/6/2014
// Author:      Clarence Beutel
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: N-bit Serial to Parallel Shift Register

module flex_stp_sr
  #(
  parameter NUM_BITS = 4,
  parameter SHIFT_MSB = 1)
  (
  input wire clk,
  input wire n_rst,
  input wire shift_enable,
  input wire serial_in,
  output wire [(NUM_BITS - 1):0] parallel_out);
  
  reg [(NUM_BITS - 1):0] ff_out;
  genvar i;
  
  assign parallel_out = ff_out;
  
  always_ff @ (posedge clk, negedge n_rst)
  begin
    if(1'b0 == n_rst)
    begin
      ff_out <= 32'b11111111111111111111111111111111;
    end
    else
    begin
      if(shift_enable == 1'b1)
      begin
        if(SHIFT_MSB == 1)
        begin
          ff_out <= {ff_out[(NUM_BITS - 2):0], serial_in};
        end
        else
        begin
          ff_out <= {serial_in, ff_out[(NUM_BITS - 1):1]};
        end
      end
    end
  end
  
endmodule