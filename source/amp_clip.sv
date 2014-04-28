// $Id: $
// File name:   amp_clip.sv
// Created:     4/27/2014
// Author:      Brian Rybarczyk
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Soft amplitude clipping

module amp_clip(
  input wire [15:0] inchan,
  input wire [3:0] comp_in,
  output wire [15:0] outchan
  );
  
  wire [15:0] pos_comp_out;
  wire [15:0] neg_comp_out;
  wire [15:0] amp_comp_val;
  wire mid_neg_flag;
  wire out_neg_flag;
  wire [15:0] pos_clipped;
  wire [15:0] neg_clipped;
  wire [15:0] clipped_out;
  
  assign amp_comp_val={1'b0,comp_in,11'b00000000000};
  assign mid_neg_flag=inchan[15];
  assign out_neg_flag=mid_neg_flag?neg_comp_out[15]:~pos_comp_out[15];
  assign clipped_out=mid_neg_flag?neg_clipped:pos_clipped;
  assign outchan=out_neg_flag?clipped_out:inchan;

  cla_16bit A1(.a(inchan), .b(~amp_comp_val), .cin(1'b1), .sum(pos_comp_out));
  cla_16bit A2(.a(inchan), .b(amp_comp_val), .cin(0'b0), .sum(neg_comp_out));
  cla_16bit A3(.a({1'b00,pos_comp_out[14:1]}), .b(amp_comp_val), .cin(0'b0), .sum(pos_clipped));
  cla_16bit A4(.a({1'b10,neg_comp_out[14:1]}), .b(~amp_comp_val), .cin(1'b1), .sum(neg_clipped));
  
endmodule