// $Id: $
// File name:   daf.sv
// Created:     4/29/2014
// Author:      Hong Shick Pak
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: top level
module daf(
	   input reg tb_clk,
	   input reg tb_n_rst,
	   input reg [31:0] temp,
	   input reg [3:0] pot_vol,
	   input reg [3:0] pot_amp,
	   input reg [3:0] swch_mode_en,  // order: flanger : amp clip : amp comp : fader
	   output reg [31:0] parallel_fad
);

  // intermmediate
  reg tb_sck;
  reg tb_ws;
  reg [31:0] tb_parallel_i2s;

  reg tb_clk_div;
  reg tb_shift_en;

  // reg [31:0] tb_parallel_buf_vol;
  // reg [15:0] tb_parallel_vol_upper;
  // reg [15:0] tb_parallel_vol_lower;
  reg [31:0] tb_parallel_buf_flang;
  reg [31:0] tb_parallel_flang;
  reg [31:0] tb_parallel_buf_ampclp;
  reg [31:0] tb_parallel_ampclp;
  // reg [31:0] tb_parallel_buf_acmcop;
  // reg [31:0] tb_parallel_ampcop;
  // reg [31:0] tb_parallel_buf_trns;
  reg [31:0] tb_parallel_buf_fad;
  reg [31:0] tb_parallel_fad;

  //reg [31:0] temp;
   assign parallel_fad = tb_parallel_fad;
   
  
  clk_div DIVIDER(
    .clk(tb_clk),
    .n_rst(tb_n_rst),
    .clk_div(tb_clk_div),
    .shift_en(tb_shift_en)
  );

  flex_buffer #(32) BFLANG(
    .clk(tb_clk_div),
    .n_rst(tb_n_rst),
    // .input_data({tb_parallel_vol_upper,tb_parallel_vol_lower}),
    .input_data(temp),
    .output_data(tb_parallel_buf_flang)
  );

  flanger FLANG(
    .clk(tb_clk),
    .n_rst(tb_n_rst),
    .flanger_en(swch_mode_en[3]),
    .shift_en(tb_shift_en),
    .input_data(tb_parallel_buf_flang),
    .output_data(tb_parallel_flang)
  );

  flex_buffer #(32) BAMPCL(
    .clk(tb_clk_div),
    .n_rst(tb_n_rst),
    .input_data(tb_parallel_flang),
    .output_data(tb_parallel_buf_ampclp)
  );

  amp_clip AMPCLP1(
      .inchan(tb_parallel_buf_ampclp[31:16]),
      .comp_in(pot_amp),
      .outchan(tb_parallel_ampclp[31:16])
  );

  amp_clip AMPCLP2(
      .inchan(tb_parallel_buf_ampclp[15:0]),
      .comp_in(pot_amp),
      .outchan(tb_parallel_ampclp[15:0])
  );
  
  flex_buffer #(32) BFAD(
    .clk(tb_clk_div),
    .n_rst(tb_n_rst),
    .input_data(tb_parallel_ampclp),
    .output_data(tb_parallel_buf_fad)
  );

  fader FAD(
    .clk(tb_clk),
    .n_reset(tb_n_rst),
    .clear(1'b0),
    .fad_enable(swch_mode_en[0]),
    .signal_in(tb_parallel_buf_fad),
    .signal_out(tb_parallel_fad)
  );  
  
endmodule