// $Id: $
// File name:   daf.sv
// Created:     4/29/2014
// Author:      Hong Shick Pak
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: top level
module daf(
	   input reg clk,
	   input reg n_rst,
	   input reg [3:0] pot_vol,
	   input reg [3:0] pot_amp_com,
	   input reg [3:0] pot_amp_clp,
	   input reg [3:0] swch_mode_en,  // order: flanger : amp clip : amp comp : fader
     input reg mem_clr,
     input reg [31:0] test_in,
     output reg [31:0] test_out
);

  // intermmediate
  reg sram_rw;
  reg [31:0] sram_read_data;
  reg [31:0] parallel_i2s;

  reg clk_div;
  reg shift_en;

  reg [31:0] parallel_buf_vol;
  reg [31:0] parallel_vol;

  reg [31:0] parallel_buf_flang;
  reg [31:0] parallel_flang;

  reg [31:0] parallel_buf_ampclp;
  reg [31:0] parallel_ampclp;
  reg [31:0] parallel_ampclp_out;

  reg [31:0] parallel_buf_ampcom;
  reg [31:0] parallel_ampcom;
  reg [31:0] parallel_ampcom_out;

  reg [31:0] parallel_buf_fad;
  reg [31:0] parallel_fad;

  reg [31:0] parallel_buf_trns;

  // temporary out
  assign test_out = parallel_fad;

  // enables for amp clp/amp com
  assign parallel_ampclp = (swch_mode_en[2] ? parallel_ampclp_out : parallel_buf_ampclp);
  assign parallel_ampcom = (swch_mode_en[1] ? parallel_ampcom_out : parallel_buf_ampcom);
   
  clk_div DIVIDER(
    .clk(clk),
    .n_rst(n_rst),
    .clk_div(clk_div),
    .shift_en(shift_en)
  );

  i2s_test_wrapper I2SST(
    .clk(clk),
    .n_rst(n_rst),
    .parallel_data_in(test_in),
    .parallel_data_out(parallel_i2s)
  );

  // ENTRY POINT
  flex_buffer #(32) BVOL(
    .clk(clk_div),
    .n_rst(n_rst),
    .input_data(parallel_i2s),
    .output_data(parallel_buf_vol)
  );

  volume_mult VOL1(
    .channel_data(parallel_buf_vol[31:16]),
    .pot_data(pot_vol),
    .output_data(parallel_vol[31:16])
  );
  volume_mult VOL2(
    .channel_data(parallel_buf_vol[15:0]),
    .pot_data(pot_vol),
    .output_data(parallel_vol[15:0])
  );

  flex_buffer #(32) BFLANG(
    .clk(clk_div),
    .n_rst(n_rst),
    .input_data(parallel_vol),
    .output_data(parallel_buf_flang)
  );

  flanger FLANG(
    .clk(clk),
    .n_rst(n_rst),
    .flanger_en(swch_mode_en[3]),
    .shift_en(shift_en),
    .input_data(parallel_buf_flang),
    .read_data(sram_read_data),
    .output_data(parallel_flang),
    .sram_rw(sram_rw)
  );
  sram_controller SRAMC(
    .clk(clk),
    .n_rst(n_rst),
    .rw_trigger(sram_rw),
    .mem_clr(mem_clr),
    .mem_init(1'b0),
    .mem_dump(1'b0),
    .write_data(parallel_buf_flang), // direct input to sram also
    .sram_data(sram_read_data)
  );

  flex_buffer #(32) BAMPCLP(
    .clk(clk_div),
    .n_rst(n_rst),
    .input_data(parallel_flang),
    .output_data(parallel_buf_ampclp)
  );

  amp_clip AMPCLP1(
      .inchan(parallel_buf_ampclp[31:16]),
      .comp_in(pot_amp_clp),
      .outchan(parallel_ampclp_out[31:16])
  );
  amp_clip AMPCLP2(
      .inchan(parallel_buf_ampclp[15:0]),
      .comp_in(pot_amp_clp),
      .outchan(parallel_ampclp_out[15:0])
  );

  flex_buffer #(32) BAMPCOMP(
    .clk(clk_div),
    .n_rst(n_rst),
    .input_data(parallel_ampclp),
    .output_data(parallel_buf_ampcom)
  );

  amp_comp AMPCMP1(
    .clk(clk_div),
    .n_rst(n_rst),
    .inchan(parallel_buf_ampcom[31:16]),
    .in_thresh(pot_amp_com),
    .outchan(parallel_ampcom_out[31:16])
  );
  amp_comp AMPCMP2(
    .clk(clk_div),
    .n_rst(n_rst),
    .inchan(parallel_buf_ampcom[15:0]),
    .in_thresh(pot_amp_com),
    .outchan(parallel_ampcom_out[15:0])
  );
  
  flex_buffer #(32) BFAD(
    .clk(clk_div),
    .n_rst(n_rst),
    .input_data(parallel_ampcom),
    .output_data(parallel_buf_fad)
  );

  fader FAD(
    .clk(clk),
    .n_reset(n_rst),
    .clear(1'b0),
    .fad_enable(swch_mode_en[0]),
    .signal_in(parallel_buf_fad),
    .signal_out(parallel_fad)
  );  
endmodule
