// $Id: $
// File name:   daf.sv
// Created:     4/29/2014
// Author:      Hong Shick Pak
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: top level
module daf_flanger(
	   input reg tb_clk,
	   input reg tb_n_rst,
	   input reg [3:0] pot_vol,
	   input reg [3:0] pot_amp_com,
	   input reg [3:0] pot_amp_clp,
	   input reg [3:0] swch_mode_en,  // order: flanger : amp clip : amp comp : fader

     input reg mem_clr,
     input reg mem_init,
     input reg mem_dump,

     // input reg serial_data_in,
     // output reg serial_data_out
     input reg [31:0] temp_in,
     output reg [31:0] temp_out
);

  // intermmediate
  // reg tb_sck;
  // reg tb_ws;  
  // reg [31:0] tb_parallel_i2s;

  reg sram_rw;
  reg [31:0] sram_read_data;

  reg tb_clk_div;
  reg tb_shift_en;

  reg [31:0] tb_parallel_buf_vol;
  reg [31:0] tb_parallel_vol;

  reg [31:0] tb_parallel_buf_flang;
  reg [31:0] tb_parallel_flang;

  reg [31:0] tb_parallel_buf_ampclp;
  reg [31:0] tb_parallel_ampclp;
  reg [31:0] tb_parallel_ampclp_out;

  reg [31:0] tb_parallel_buf_ampcom;
  reg [31:0] tb_parallel_ampcom;
  reg [31:0] tb_parallel_ampcom_out;

  reg [31:0] tb_parallel_buf_fad;
  reg [31:0] tb_parallel_fad;

  reg [31:0] tb_parallel_buf_trns;

  // temporary out
  assign temp_out = tb_parallel_flang;

  // enables for amp clp/amp com
  // assign tb_parallel_ampclp = (swch_mode_en[2] ? tb_parallel_ampclp_out : tb_parallel_buf_ampclp);
  // assign tb_parallel_ampcom = (swch_mode_en[1] ? tb_parallel_ampcom_out : tb_parallel_buf_ampcom);
   
  clk_div DIVIDER(
    .clk(tb_clk),
    .n_rst(tb_n_rst),
    .clk_div(tb_clk_div),
    .shift_en(tb_shift_en)
  );

  // i2s_rcvr SRECV(
    // .clk(tb_clk),
    // .n_rst(tb_n_rst),
    // .ws(ws),
    // .serial_data(serial_data_in),
    // .parallel_data(tb_parallel_i2s)
  // );

  // ENTRY POINT
  flex_buffer #(32) BVOL(
    .clk(tb_clk_div),
    .n_rst(tb_n_rst),
    // .input_data(tb_parallel_i2s),
    .input_data(temp_in),
    .output_data(tb_parallel_buf_vol)
  );

  volume_mult VOL1(
    .channel_data(tb_parallel_buf_vol[31:16]),
    .pot_data(pot_vol),
    .output_data(tb_parallel_vol[31:16])
  );
  volume_mult VOL2(
    .channel_data(tb_parallel_buf_vol[15:0]),
    .pot_data(pot_vol),
    .output_data(tb_parallel_vol[15:0])
  );

  flex_buffer #(32) BFLANG(
    .clk(tb_clk_div),
    .n_rst(tb_n_rst),
    .input_data(tb_parallel_vol),
    .output_data(tb_parallel_buf_flang)
  );

  flanger FLANG(
    .clk(tb_clk),
    .n_rst(tb_n_rst),
    .flanger_en(1'b1),
    .shift_en(tb_shift_en),
    .input_data(tb_parallel_buf_flang),
    .read_data(sram_read_data),
    .output_data(tb_parallel_flang),
    .sram_rw(sram_rw)
  );
  sram_controller SRAMC(
    .clk(tb_clk),
    .n_rst(tb_n_rst),
    .rw_trigger(sram_rw),
    .mem_clr(mem_clr),
    .mem_init(mem_init),
    .mem_dump(mem_dump),
    .write_data(tb_parallel_buf_flang), // direct input to sram also
    .sram_data(sram_read_data)
  );

  // flex_buffer #(32) BAMPCLP(
    // .clk(tb_clk_div),
    // .n_rst(tb_n_rst),
    // .input_data(tb_parallel_flang),
    // .output_data(tb_parallel_buf_ampclp)
  // );

  // amp_clip AMPCLP1(
      // .inchan(tb_parallel_buf_vol[31:16]),
      // .comp_in(pot_amp_clp),
      // .outchan(tb_parallel_ampclp_out[31:16])
  // );
  // amp_clip AMPCLP2(
      // .inchan(tb_parallel_buf_vol[15:0]),
      // .comp_in(pot_amp_clp),
      // .outchan(tb_parallel_ampclp_out[15:0])
  // );

  // flex_buffer #(32) BAMPCOMP(
    // .clk(tb_clk_div),
    // .n_rst(tb_n_rst),
    // .input_data(tb_parallel_ampclp),
    // .output_data(tb_parallel_buf_ampcom)
  // );

  // amp_comp AMPCMP1(
    // .clk(tb_clk_div),
    // .n_rst(tb_n_rst),
    // .inchan(tb_parallel_buf_ampcom[31:16]),
    // .in_thresh(pot_amp_com),
    // .outchan(tb_parallel_ampcom_out[31:16])
  // );
  // amp_comp AMPCMP2(
    // .clk(tb_clk_div),
    // .n_rst(tb_n_rst),
    // .inchan(tb_parallel_buf_ampcom[15:0]),
    // .in_thresh(pot_amp_com),
    // .outchan(tb_parallel_ampcom_out[15:0])
  // );
  
  // flex_buffer #(32) BFAD(
    // .clk(tb_clk_div),
    // .n_rst(tb_n_rst),
    // .input_data(tb_parallel_ampcom),
    // .output_data(tb_parallel_buf_fad)
  // );

  // fader FAD(
    // .clk(tb_clk),
    // .n_reset(tb_n_rst),
    // .clear(1'b0),
    // .fad_enable(swch_mode_en[0]),
    // .signal_in(tb_parallel_buf_fad),
    // .signal_out(tb_parallel_fad)
  // );  

  // flex_buffer #(32) BUFTRNS(
    // .clk(tb_clk),
    // .n_rst(tb_n_rst),
    // .input_data(tb_parallel_fad),
    // .output_data(tb_parallel_buf_trns)
  // );

  // i2s_trnmtr TRNS(
    // .clk(tb_clk),
    // .n_rst(tb_n_rst),
    // .parallel_data(tb_parallel_buf_trns),
    // .ws_flag(ws),
    // .serial_data(serial_data_output),
    // .sck(sck)
  // );
endmodule
