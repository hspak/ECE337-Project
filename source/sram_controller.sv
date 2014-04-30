// $Id: $
// File name:   sram_controller.sv
// Created:     4/30/2014
// Author:      Hong Shick Pak
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: .

module sram_controller(
  input wire clk,
  input wire n_rst,
  input wire rw_trigger,
  input wire mem_clr,
  input wire mem_init,
  input wire mem_dump,
  input wire [31:0] write_data,
  output wire [31:0] sram_data
);
  localparam START_ADDR = 16'b0;
  localparam LAST_ADDR = 16'h1b90;

  reg r_en;
  reg w_en;

  reg [15:0] address;
  reg [15:0] next_address;
  reg [15:0] r_addr;
  reg [15:0] w_addr;
  reg [15:0] next_r_addr;
  reg [15:0] next_w_addr;
  reg [15:0] write_data_half;
  reg [15:0] read_data_half;
  reg [31:0] read_data;
  reg [31:0] next_read_data;

  reg manual; // quick hack to turn on mem dump

  on_chip_sram_wrapper SRAM(
    .init_file_number(0),
    .dump_file_number(0),
    .mem_clr(mem_clr),
    .mem_init(mem_init),
    .mem_dump(mem_dump | manual),
    .verbose(1'b1),
    .start_address(START_ADDR),
    .last_address(LAST_ADDR),
    .read_enable(r_en),
    .write_enable(w_en),
    .address(address),
    .read_data(read_data_half), // output
    .write_data(write_data_half)
  );

  typedef enum bit [2:0] {
    idle,
    read_setup,
    read,
    read_full_setup,
    read_full,
    write,
    write_wait,
    write_full,
    // write_full_setup not needed since it goes to idle anyway
  } state;

  state curr_st;
  state next_st;

  always @ (posedge clk, negedge n_rst) begin
    if (!n_rst) begin
      curr_st <= idle;
      address <= START_ADDR;
      r_addr <= 16'h0010;
      w_addr <= 16'h0000;
      read_data <= 32'h00000000;
    end else if (r_addr == LAST_ADDR) begin
      r_addr <= 16'h0010;
    end else if (w_addr == LAST_ADDR) begin
      w_addr <= 16'h0000;
    end else begin
      curr_st <= next_st;
      address <= next_address;
      r_addr <= next_r_addr;
      w_addr <= next_w_addr;
      read_data <= next_read_data;
    end
  end

  // next_st state logic
  always_comb begin
    case(curr_st)
      idle: begin
        next_st = idle;
        if (rw_trigger)
          next_st = read_setup;
      end
       
      read_setup:
        next_st = read;

      read:
        next_st = read_full_setup;
      
      read_full_setup:
        next_st = read_full;

      read_full:
        next_st = write;

      write:
        next_st = write_wait;

      write_wait:
        next_st = write_full;

      write_full:
        next_st = idle;

      default: 
        next_st = idle;
    endcase
  end

  // output logic
  always_comb begin
    case(curr_st)
      idle: begin
        r_en = 1'b0;
        w_en = 1'b0;

        // save these states during idle
        next_r_addr = r_addr;
        next_w_addr = w_addr;
        next_address = r_addr;
        next_read_data = read_data;

        write_data_half = 16'b0; // reset write data
        manual = 1'b1; // dump!
      end

      read_setup: begin
        r_en = 1'b0;
        w_en = 1'b0;
        next_r_addr = w_addr;
        next_r_addr = r_addr;
        next_address = r_addr; // give read address
        next_read_data[31:16] = read_data_half; // doesn't hurt to be early
        write_data_half = 16'b0;
        manual = 1'b0;
      end

      read: begin
        r_en = 1'b1; // start SRAM read
        w_en = 1'b0;
        next_r_addr = w_addr;
        next_r_addr = r_addr + 16; // increment next since we've read
        next_address = r_addr;
        next_read_data[31:16] = read_data_half; // data from sram yay
        write_data_half = 16'b0;
        manual = 1'b0;
      end

      read_full_setup: begin
        r_en = 1'b0;
        w_en = 1'b0;
        next_r_addr = w_addr;     
        next_r_addr = r_addr;
        next_address = r_addr; // ready with new address
        write_data_half = 16'b0;
        next_read_data[31:16] = read_data_half; // early again
        manual = 1'b0;
      end

      read_full: begin
        r_en = 1'b1; // reading
        w_en = 1'b0;
        next_r_addr = w_addr;
        next_r_addr = r_addr + 16; // inc
        next_address = w_addr;
        next_read_data[31:16] = read_data_half; // data from sram yay
        write_data_half = write_data[15:0]; // just have it ready
        manual = 1'b0;
      end

      write: begin
        r_en = 1'b0;
        w_en = 1'b1; // start write
        next_w_addr = w_addr + 16; // increment since sram is busy now
        next_r_addr = r_addr;
        next_address = w_addr;
        next_read_data = read_data; // just save
        write_data_half = write_data[15:0];
        manual = 1'b0;
      end

      write_wait: begin
        r_en = 1'b0;
        w_en = 1'b0; // needs to be asserted low after finished
        next_r_addr = w_addr;
        next_r_addr = r_addr;
        next_address = w_addr;
        next_read_data = read_data; // just save
        write_data_half = write_data[31:16]; // just have it ready
        manual = 1'b0;
      end

      write_full: begin
        r_en = 1'b0;
        w_en = 1'b1; // writing again
        next_w_addr = w_addr + 16; // sram busy
        next_r_addr = r_addr;
        next_address = address;
        next_read_data = read_data; // just save
        write_data_half = write_data[31:16];
        manual = 1'b0;
      end
    endcase
  end

  assign sram_data = read_data;
endmodule
