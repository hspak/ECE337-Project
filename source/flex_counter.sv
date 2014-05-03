//Counter
//counts clock cycles

module flex_counter
#(
	parameter NUM_CNT_BITS = 4
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

reg r_flag;
wire r_flag_next;
reg [NUM_CNT_BITS-1:0] counter;
integer roll_reset_val = 1;
assign rollover_flag=r_flag;
assign count_out=counter;


assign r_flag_next=(counter==rollover_val);


always_ff@(posedge clk, negedge n_rst) begin
  if (n_rst==0) begin
    r_flag=0;
  end
  else begin
    r_flag=r_flag_next;
  end
end

always_ff@(posedge clk, negedge n_rst) begin
  if (n_rst==0) begin
    counter<='0;
  end
  else if (clear==1) begin
    counter<='0;
  end
  else if (count_enable==1) begin
    if (r_flag_next) begin
      counter<=1;
    end
    else if (counter == (2**NUM_CNT_BITS-1)) begin
      counter<=1;
    end
    else begin
      counter<=counter+1;
    end
  end
  else begin
    counter<=counter;
  end
end

endmodule
