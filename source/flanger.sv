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
  input wire [31:0] input_data,
  output wire [31:0] output_data
);


reg r_en;
reg w_en;
reg [15:0] addr;
reg [15:0] r_data;
reg [15:0] w_data;
reg [31:0] mod_data;

on_chip_sram_wrapper DUT(
  .read_enable(r_en),
  .write_enable(w_en),
  .address(addr),
  .read_data(r_data),
  .write_data(w_data)
);

reg clear;
reg [31:0] count_out;
reg rollover_flag;

ud_flex_counter #(32) (clk, n_rst, clear, 1'b1, 1'b0, 32'hFFFFFFFF, count_out, rollover_flag);
// address counter too somwhere

// 16bit counter
typedef enum bit [3:0] {idle, enable_init_write, start_write_1, start_write_2, enable_read, read_1, read_2, enable_write, write_1, write_2} stateType;

stateType next;
stateType curr;

// reg
always @ (posedge clk, negedge n_rst) begin
  if (!n_rst) begin
    curr <= idle;
  end else begin
    curr <= next;
  end
end

// next state
always_comb begin
  case(curr)
    idle: begin
      if (flanger_en) begin
        next = enable_write;
      end
    end

    enable_init_write: begin
      next = start_write1;
    end

    start_write1: begin
      if (!rollover_flag) begin
        next = start_write2;
      end else begin
        next = read_1;
      end
    end
    start_write2: begin
      if (!rollover_flag) begin
        next = start_write1;
      end else begin
        next = read_1;
      end
    end

    enable_read: begin
      if (flanger_en) begin
        next = read_1;
      end else begin
        next = idle;
      end
    end

    read_1: begin
      if (flanger_en) begin
        next = read_2;
      end else begin
        next = idle;
      end
    end
    read_2: begin
      if (flanger_en) begin
        next = write_1;
      end else begin
        next = idle;
      end
    end

    enable_write: begin
      if (flanger_en) begin
        next = write_1;
      end else begin
        next = idle;
      end
    end

    write_1: begin
      if (flanger_en) begin
        next = write_2;
      end else begin
        next = idle;
      end
    end
    write_2: begin
      if (flanger_en) begin
        next = read_1;
      end else begin
        next = idle;
      end
    end
end

always_comb begin

  case(curr)
    idle: begin
      r_en = 1'b0;
      w_en = 1'b0;
      addr = 16'b0;
      r_data = 16'b0;
      w_data = 16'b0;
      mod_data = 32'b0;
    end

    enable_init_write: begin
      r_en = 1'b0;
      w_en = 1'b0;
      addr = 16'b0;
      r_data = 16'b0;
      w_data = 16'b0;
      mod_data = 32'b0;
    end
    
    start_write1: begin
      r_en = 1'b0;
      w_en = 1'b0;
      addr = 16'b0;
      r_data = 16'b0;
      w_data = 16'b0;
      mod_data = 32'b0;
    end

    start_write2: begin
      r_en = 1'b0;
      w_en = 1'b0;
      addr = 16'b0;
      r_data = 16'b0;
      w_data = 16'b0;
      mod_data = 32'b0;
    end

    enable_read: begin
      r_en = 1'b0;
      w_en = 1'b0;
      addr = 16'b0;
      r_data = 16'b0;
      w_data = 16'b0;
      mod_data = 32'b0;
    end

    read_1: begin
      r_en = 1'b0;
      w_en = 1'b0;
      addr = 16'b0;
      r_data = 16'b0;
      w_data = 16'b0;
      mod_data = 32'b0;
    end

    read_2: begin
      r_en = 1'b0;
      w_en = 1'b0;
      addr = 16'b0;
      r_data = 16'b0;
      w_data = 16'b0;
      mod_data = 32'b0;
    end

    enable_write: begin
      r_en = 1'b0;
      w_en = 1'b0;
      addr = 16'b0;
      r_data = 16'b0;
      w_data = 16'b0;
      mod_data = 32'b0;
    end

    write_1: begin
      r_en = 1'b0;
      w_en = 1'b0;
      addr = 16'b0;
      r_data = 16'b0;
      w_data = 16'b0;
      mod_data = 32'b0;
    end

    write_2: begin
      r_en = 1'b0;
      w_en = 1'b0;
      addr = 16'b0;
      r_data = 16'b0;
      w_data = 16'b0;
      mod_data = 32'b0;
    end
end

assign output_data = (!flanger_en ? input_data : mod_data);

endmodule
