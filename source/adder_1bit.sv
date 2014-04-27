//adds two 1-bit wires along with a carry-in wire
//outputs the sum and carry-out bits


module adder_1bit
(
	input wire a,
	input wire b,
	input wire carry_in,
	output wire sum,
	output wire carry_out
);

assign sum = carry_in ^ (a ^ b);
assign carry_out = ((~carry_in) & b & a)|(carry_in & (b | a));
	
endmodule
