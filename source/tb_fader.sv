// $Id: $
// File name:   tb_fader.sv
// Created:     4/28/2014
// Author:      Patrick Gohier
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: .
`timescale 1ns / 10ps

// 1.4112 MHz

module tb_fader();
  localparam CLK_PERIOD = 708;

  reg tb_clk;
  reg tb_n_rst;
  reg tb_fader_en;
  reg tb_clear = 1'b0;
  reg [31:0] tb_input_data;
  reg [31:0] tb_output_data;



  fader DUT(
    .clk(tb_clk),
    .n_reset(tb_n_rst),
    .clear(tb_clear),
    .fad_enable(tb_fader_en),
    .signal_in(tb_input_data),
    .signal_out(tb_output_data)
  );

  always begin
    tb_clk = 1'b1;
    #(CLK_PERIOD/2);
    tb_clk = 1'b0;
    #(CLK_PERIOD/2);
  end

  integer tb_test_case;

  initial begin
    // init
    tb_test_case = 0;
    tb_n_rst = 1'b0;

    //tb_shift_en = 1'b1;
    tb_fader_en = 1'b1;
    tb_input_data = 32'h1f50d713;

    @(posedge tb_clk);
    tb_n_rst = 1'b1;
  end
endmodule
