// $Id: $
// File name:   flanger.sv
// Created:     4/21/2014
// Author:      Hong Shick Pak
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: .
module flanger(
  input wire clk,
  input wire n_rst,
  input wire flanger_en,
  input wire shift_en,
  input wire [31:0] input_data,
  input wire [31:0] read_data,
  output reg [31:0] output_data,
  output reg sram_rw
);

  reg [31:0] adder_data;

  flanger_adder ADD(
    .flanger_data(input_data),
    .sram_data(read_data),
    .output_data(adder_data)
  );

  typedef enum bit {
    idle,
    rw_data
  } state;

  state next_st;
  state curr_st;

  always_ff @ (posedge clk, negedge n_rst) begin
    if (!n_rst)
      curr_st <= idle;
    else 
      curr_st <= next_st;
  end

  // next state logic
  always_comb begin
    case(curr_st)
      idle:
        if (shift_en)
          next_st = rw_data;
        else
          next_st = idle;

      rw_data:
        next_st = idle;

      default:
        next_st = idle;
    endcase

    if (!flanger_en)
      next_st = idle;
  end

  // output logic
  always_comb begin
    case(curr_st)
      idle:
        sram_rw = 1'b0;

      rw_data:
        sram_rw = 1'b1;

      default:
        sram_rw = 1'b0;
    endcase

    if (!flanger_en)
      sram_rw = 1'b0;
  end

  assign output_data = (!flanger_en ? input_data : adder_data);
endmodule
