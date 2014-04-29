// $Id: $
// File name:   flex_counter.sv
// Created:     2/12/2014
// Author:      Hong Shick Pak
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: counter
module flex_counter
#(
  NUM_CNT_BITS = 4
)
(
  input wire clk,
  input wire n_rst,
  input wire clear,
  input wire count_enable,
  input wire [NUM_CNT_BITS-1:0] rollover_val,
  output wire [NUM_CNT_BITS-1:0] count_out,
  output wire rollover_flag
);

reg [NUM_CNT_BITS:0] curr;
reg [NUM_CNT_BITS:0] next;

always_ff @ (posedge clk, negedge n_rst) begin
  if (!n_rst) begin
    curr <= '0;
  end else begin
    curr <= next;
  end
end

always_comb begin
  if (count_enable) begin
    if (curr[NUM_CNT_BITS-1:0] == (rollover_val-1)) begin
      // next = {1'b1, {(NUM_CNT_BITS-1){1'b0}}, 1'b1};
      next = {1'b1, rollover_val};
    end else begin
      if (curr[NUM_CNT_BITS]) begin
        next = {{(NUM_CNT_BITS){1'b0}}, 1'b1};
      end else begin
        next = curr + 1;
      end
    end
  end else begin
    next = curr;
  end

  if (clear) begin
    next = '0;
  end
end

assign count_out = curr[NUM_CNT_BITS-1:0];
assign rollover_flag = curr[NUM_CNT_BITS];

endmodule
