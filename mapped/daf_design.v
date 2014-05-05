
module clk_div ( clk, n_rst, clk_div, shift_en );
  input clk, n_rst;
  output clk_div, shift_en;
  wire   N4, N5, N6, N7, N8, n1, n3, n4, n10, \add_35/carry[4] ,
         \add_35/carry[3] , \add_35/carry[2] , n2;
  wire   [4:0] curr_c;
  wire   [4:0] next_c;

  DFFSR \curr_c_reg[0]  ( .D(next_c[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        curr_c[0]) );
  DFFSR clk_div_reg ( .D(n10), .CLK(clk), .R(n_rst), .S(1'b1), .Q(clk_div) );
  DFFSR \curr_c_reg[1]  ( .D(next_c[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        curr_c[1]) );
  DFFSR \curr_c_reg[2]  ( .D(next_c[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        curr_c[2]) );
  DFFSR \curr_c_reg[3]  ( .D(next_c[3]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        curr_c[3]) );
  DFFSR \curr_c_reg[4]  ( .D(next_c[4]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        curr_c[4]) );
  NOR2X1 U3 ( .A(n1), .B(n2), .Y(shift_en) );
  XOR2X1 U9 ( .A(n2), .B(n1), .Y(n10) );
  NAND3X1 U10 ( .A(curr_c[4]), .B(curr_c[0]), .C(n3), .Y(n1) );
  NOR2X1 U11 ( .A(curr_c[1]), .B(n4), .Y(n3) );
  AND2X2 U4 ( .A(N8), .B(n1), .Y(next_c[4]) );
  AND2X2 U5 ( .A(N7), .B(n1), .Y(next_c[3]) );
  AND2X2 U6 ( .A(N6), .B(n1), .Y(next_c[2]) );
  AND2X2 U7 ( .A(N5), .B(n1), .Y(next_c[1]) );
  AND2X2 U8 ( .A(N4), .B(n1), .Y(next_c[0]) );
  OR2X2 U12 ( .A(curr_c[3]), .B(curr_c[2]), .Y(n4) );
  HAX1 \add_35/U1_1_1  ( .A(curr_c[1]), .B(curr_c[0]), .YC(\add_35/carry[2] ), 
        .YS(N5) );
  HAX1 \add_35/U1_1_2  ( .A(curr_c[2]), .B(\add_35/carry[2] ), .YC(
        \add_35/carry[3] ), .YS(N6) );
  HAX1 \add_35/U1_1_3  ( .A(curr_c[3]), .B(\add_35/carry[3] ), .YC(
        \add_35/carry[4] ), .YS(N7) );
  INVX2 U13 ( .A(clk_div), .Y(n2) );
  XOR2X1 U20 ( .A(\add_35/carry[4] ), .B(curr_c[4]), .Y(N8) );
  INVX2 U21 ( .A(curr_c[0]), .Y(N4) );
endmodule


module i2s_trnmtr_edge_detector_1 ( clk, n_rst, ws, wsd, edge_detected );
  input clk, n_rst, ws;
  output wsd, edge_detected;
  wire   ff_out_2;

  DFFSR ff_out_1_reg ( .D(ws), .CLK(clk), .R(n_rst), .S(1'b1), .Q(wsd) );
  DFFSR ff_out_2_reg ( .D(wsd), .CLK(clk), .R(n_rst), .S(1'b1), .Q(ff_out_2)
         );
  XOR2X1 U5 ( .A(wsd), .B(ff_out_2), .Y(edge_detected) );
endmodule


module flex_counter_NUM_CNT_BITS5_1 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [4:0] rollover_val;
  output [4:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n36, n37, n38, n39, n40, n1, n2, n3, n4, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34;

  DFFSR \counter_reg[0]  ( .D(n40), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR r_flag_reg ( .D(n34), .CLK(clk), .R(n_rst), .S(1'b1), .Q(rollover_flag) );
  DFFSR \counter_reg[1]  ( .D(n39), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \counter_reg[2]  ( .D(n38), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \counter_reg[3]  ( .D(n37), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \counter_reg[4]  ( .D(n36), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[4]) );
  XOR2X1 U9 ( .A(rollover_val[1]), .B(count_out[1]), .Y(n2) );
  XOR2X1 U10 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n1) );
  NOR2X1 U11 ( .A(n2), .B(n1), .Y(n13) );
  INVX2 U12 ( .A(count_out[4]), .Y(n24) );
  XOR2X1 U13 ( .A(n24), .B(rollover_val[4]), .Y(n12) );
  XOR2X1 U14 ( .A(rollover_val[3]), .B(count_out[3]), .Y(n4) );
  XOR2X1 U15 ( .A(rollover_val[2]), .B(count_out[2]), .Y(n3) );
  NOR2X1 U16 ( .A(n4), .B(n3), .Y(n11) );
  NAND3X1 U17 ( .A(n13), .B(n12), .C(n11), .Y(n33) );
  INVX2 U18 ( .A(clear), .Y(n14) );
  OR2X2 U19 ( .A(count_enable), .B(clear), .Y(n27) );
  NAND3X1 U20 ( .A(n33), .B(n14), .C(n27), .Y(n28) );
  INVX2 U21 ( .A(count_out[0]), .Y(n15) );
  NOR2X1 U22 ( .A(count_out[2]), .B(n15), .Y(n16) );
  MUX2X1 U23 ( .B(count_out[2]), .A(n16), .S(count_out[1]), .Y(n18) );
  OAI21X1 U24 ( .A(count_out[0]), .B(n28), .C(n27), .Y(n30) );
  NAND2X1 U25 ( .A(count_out[2]), .B(n30), .Y(n17) );
  OAI21X1 U26 ( .A(n28), .B(n18), .C(n17), .Y(n38) );
  NAND3X1 U27 ( .A(count_out[1]), .B(count_out[0]), .C(count_out[2]), .Y(n22)
         );
  INVX2 U28 ( .A(n22), .Y(n19) );
  INVX2 U29 ( .A(n28), .Y(n29) );
  NAND2X1 U30 ( .A(n19), .B(n29), .Y(n21) );
  OAI21X1 U31 ( .A(n19), .B(n28), .C(n27), .Y(n20) );
  INVX2 U32 ( .A(n20), .Y(n25) );
  MUX2X1 U33 ( .B(n21), .A(n25), .S(count_out[3]), .Y(n37) );
  NOR2X1 U34 ( .A(count_out[4]), .B(n22), .Y(n23) );
  MUX2X1 U35 ( .B(count_out[4]), .A(n23), .S(count_out[3]), .Y(n26) );
  OAI22X1 U36 ( .A(n26), .B(n28), .C(n25), .D(n24), .Y(n36) );
  MUX2X1 U37 ( .B(n28), .A(n27), .S(count_out[0]), .Y(n40) );
  NAND2X1 U38 ( .A(count_out[0]), .B(n29), .Y(n32) );
  INVX2 U39 ( .A(n30), .Y(n31) );
  MUX2X1 U40 ( .B(n32), .A(n31), .S(count_out[1]), .Y(n39) );
  INVX2 U41 ( .A(n33), .Y(n34) );
endmodule


module i2s_rcvr_input_cntlr ( clk, n_rst, shift );
  input clk, n_rst;
  output shift;
  wire   data_ready, n2, n3;

  DFFSR shift_current_reg ( .D(n2), .CLK(clk), .R(n_rst), .S(1'b1), .Q(shift)
         );
  flex_counter_NUM_CNT_BITS5_1 EDGE_COUNTER_1 ( .clk(n3), .n_rst(n_rst), 
        .clear(1'b0), .count_enable(1'b1), .rollover_val({1'b1, 1'b0, 1'b0, 
        1'b0, 1'b0}), .rollover_flag(data_ready) );
  INVX2 U4 ( .A(data_ready), .Y(n2) );
  INVX2 U5 ( .A(clk), .Y(n3) );
endmodule


module flex_stp_sr_NUM_BITS32 ( clk, n_rst, shift_enable, serial_in, 
        parallel_out );
  output [31:0] parallel_out;
  input clk, n_rst, shift_enable, serial_in;
  wire   n36, n38, n40, n42, n44, n46, n48, n50, n52, n54, n56, n58, n60, n62,
         n64, n66, n68, n70, n72, n74, n76, n78, n80, n82, n84, n86, n88, n90,
         n92, n94, n96, n98, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n99, n100, n101;

  DFFSR \ff_out_reg[0]  ( .D(n98), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[0]) );
  DFFSR \ff_out_reg[1]  ( .D(n96), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[1]) );
  DFFSR \ff_out_reg[2]  ( .D(n94), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[2]) );
  DFFSR \ff_out_reg[3]  ( .D(n92), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[3]) );
  DFFSR \ff_out_reg[4]  ( .D(n90), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[4]) );
  DFFSR \ff_out_reg[5]  ( .D(n88), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[5]) );
  DFFSR \ff_out_reg[6]  ( .D(n86), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[6]) );
  DFFSR \ff_out_reg[7]  ( .D(n84), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[7]) );
  DFFSR \ff_out_reg[8]  ( .D(n82), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[8]) );
  DFFSR \ff_out_reg[9]  ( .D(n80), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[9]) );
  DFFSR \ff_out_reg[10]  ( .D(n78), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[10]) );
  DFFSR \ff_out_reg[11]  ( .D(n76), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[11]) );
  DFFSR \ff_out_reg[12]  ( .D(n74), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[12]) );
  DFFSR \ff_out_reg[13]  ( .D(n72), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[13]) );
  DFFSR \ff_out_reg[14]  ( .D(n70), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[14]) );
  DFFSR \ff_out_reg[15]  ( .D(n68), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[15]) );
  DFFSR \ff_out_reg[16]  ( .D(n66), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[16]) );
  DFFSR \ff_out_reg[17]  ( .D(n64), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[17]) );
  DFFSR \ff_out_reg[18]  ( .D(n62), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[18]) );
  DFFSR \ff_out_reg[19]  ( .D(n60), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[19]) );
  DFFSR \ff_out_reg[20]  ( .D(n58), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[20]) );
  DFFSR \ff_out_reg[21]  ( .D(n56), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[21]) );
  DFFSR \ff_out_reg[22]  ( .D(n54), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[22]) );
  DFFSR \ff_out_reg[23]  ( .D(n52), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[23]) );
  DFFSR \ff_out_reg[24]  ( .D(n50), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[24]) );
  DFFSR \ff_out_reg[25]  ( .D(n48), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[25]) );
  DFFSR \ff_out_reg[26]  ( .D(n46), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[26]) );
  DFFSR \ff_out_reg[27]  ( .D(n44), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[27]) );
  DFFSR \ff_out_reg[28]  ( .D(n42), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[28]) );
  DFFSR \ff_out_reg[29]  ( .D(n40), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[29]) );
  DFFSR \ff_out_reg[30]  ( .D(n38), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[30]) );
  DFFSR \ff_out_reg[31]  ( .D(n36), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[31]) );
  INVX2 U2 ( .A(shift_enable), .Y(n4) );
  INVX2 U3 ( .A(n4), .Y(n1) );
  INVX2 U4 ( .A(n4), .Y(n2) );
  INVX2 U5 ( .A(n4), .Y(n3) );
  MUX2X1 U6 ( .B(parallel_out[0]), .A(serial_in), .S(n1), .Y(n5) );
  INVX2 U7 ( .A(n5), .Y(n98) );
  INVX2 U8 ( .A(parallel_out[1]), .Y(n7) );
  INVX2 U9 ( .A(parallel_out[0]), .Y(n6) );
  MUX2X1 U10 ( .B(n7), .A(n6), .S(n1), .Y(n96) );
  INVX2 U11 ( .A(parallel_out[2]), .Y(n8) );
  MUX2X1 U12 ( .B(n8), .A(n7), .S(n1), .Y(n94) );
  INVX2 U13 ( .A(parallel_out[3]), .Y(n9) );
  MUX2X1 U14 ( .B(n9), .A(n8), .S(n1), .Y(n92) );
  INVX2 U15 ( .A(parallel_out[4]), .Y(n10) );
  MUX2X1 U16 ( .B(n10), .A(n9), .S(n1), .Y(n90) );
  INVX2 U17 ( .A(parallel_out[5]), .Y(n11) );
  MUX2X1 U18 ( .B(n11), .A(n10), .S(n1), .Y(n88) );
  INVX2 U19 ( .A(parallel_out[6]), .Y(n12) );
  MUX2X1 U20 ( .B(n12), .A(n11), .S(n1), .Y(n86) );
  INVX2 U21 ( .A(parallel_out[7]), .Y(n13) );
  MUX2X1 U22 ( .B(n13), .A(n12), .S(n1), .Y(n84) );
  INVX2 U23 ( .A(parallel_out[8]), .Y(n14) );
  MUX2X1 U24 ( .B(n14), .A(n13), .S(n1), .Y(n82) );
  INVX2 U25 ( .A(parallel_out[9]), .Y(n15) );
  MUX2X1 U26 ( .B(n15), .A(n14), .S(n1), .Y(n80) );
  INVX2 U27 ( .A(parallel_out[10]), .Y(n16) );
  MUX2X1 U28 ( .B(n16), .A(n15), .S(n1), .Y(n78) );
  INVX2 U29 ( .A(parallel_out[11]), .Y(n17) );
  MUX2X1 U30 ( .B(n17), .A(n16), .S(n1), .Y(n76) );
  INVX2 U31 ( .A(parallel_out[12]), .Y(n18) );
  MUX2X1 U32 ( .B(n18), .A(n17), .S(n1), .Y(n74) );
  INVX2 U33 ( .A(parallel_out[13]), .Y(n19) );
  MUX2X1 U34 ( .B(n19), .A(n18), .S(n2), .Y(n72) );
  INVX2 U35 ( .A(parallel_out[14]), .Y(n20) );
  MUX2X1 U36 ( .B(n20), .A(n19), .S(n2), .Y(n70) );
  INVX2 U37 ( .A(parallel_out[15]), .Y(n21) );
  MUX2X1 U38 ( .B(n21), .A(n20), .S(n2), .Y(n68) );
  INVX2 U39 ( .A(parallel_out[16]), .Y(n22) );
  MUX2X1 U40 ( .B(n22), .A(n21), .S(n2), .Y(n66) );
  INVX2 U41 ( .A(parallel_out[17]), .Y(n23) );
  MUX2X1 U42 ( .B(n23), .A(n22), .S(n2), .Y(n64) );
  INVX2 U43 ( .A(parallel_out[18]), .Y(n24) );
  MUX2X1 U44 ( .B(n24), .A(n23), .S(n2), .Y(n62) );
  INVX2 U45 ( .A(parallel_out[19]), .Y(n25) );
  MUX2X1 U46 ( .B(n25), .A(n24), .S(n2), .Y(n60) );
  INVX2 U47 ( .A(parallel_out[20]), .Y(n26) );
  MUX2X1 U48 ( .B(n26), .A(n25), .S(n2), .Y(n58) );
  INVX2 U49 ( .A(parallel_out[21]), .Y(n27) );
  MUX2X1 U50 ( .B(n27), .A(n26), .S(n2), .Y(n56) );
  INVX2 U51 ( .A(parallel_out[22]), .Y(n28) );
  MUX2X1 U52 ( .B(n28), .A(n27), .S(n2), .Y(n54) );
  INVX2 U53 ( .A(parallel_out[23]), .Y(n29) );
  MUX2X1 U54 ( .B(n29), .A(n28), .S(n2), .Y(n52) );
  INVX2 U55 ( .A(parallel_out[24]), .Y(n30) );
  MUX2X1 U56 ( .B(n30), .A(n29), .S(n2), .Y(n50) );
  INVX2 U57 ( .A(parallel_out[25]), .Y(n31) );
  MUX2X1 U58 ( .B(n31), .A(n30), .S(n2), .Y(n48) );
  INVX2 U59 ( .A(parallel_out[26]), .Y(n32) );
  MUX2X1 U60 ( .B(n32), .A(n31), .S(n3), .Y(n46) );
  INVX2 U61 ( .A(parallel_out[27]), .Y(n33) );
  MUX2X1 U62 ( .B(n33), .A(n32), .S(n3), .Y(n44) );
  INVX2 U63 ( .A(parallel_out[28]), .Y(n34) );
  MUX2X1 U64 ( .B(n34), .A(n33), .S(n3), .Y(n42) );
  INVX2 U65 ( .A(parallel_out[29]), .Y(n99) );
  MUX2X1 U66 ( .B(n99), .A(n34), .S(n3), .Y(n40) );
  INVX2 U67 ( .A(parallel_out[30]), .Y(n100) );
  MUX2X1 U100 ( .B(n100), .A(n99), .S(n3), .Y(n38) );
  INVX2 U101 ( .A(parallel_out[31]), .Y(n101) );
  MUX2X1 U102 ( .B(n101), .A(n100), .S(n3), .Y(n36) );
endmodule


module i2s_rcvr_shift_reg ( clk, n_rst, shift, data_in, data_out );
  output [31:0] data_out;
  input clk, n_rst, shift, data_in;


  flex_stp_sr_NUM_BITS32 SHIFT_REGISTER ( .clk(clk), .n_rst(n_rst), 
        .shift_enable(shift), .serial_in(data_in), .parallel_out(data_out) );
endmodule


module i2s_rcvr ( clk, n_rst, ws, serial_data, parallel_data );
  output [31:0] parallel_data;
  input clk, n_rst, ws, serial_data;
  wire   shift, n1;

  i2s_trnmtr_edge_detector_1 EDGE_DETECTOR ( .clk(clk), .n_rst(n_rst), .ws(ws)
         );
  i2s_rcvr_input_cntlr INPUT_CONTROLLER ( .clk(clk), .n_rst(n_rst), .shift(
        shift) );
  i2s_rcvr_shift_reg SHIFT_REGISTER ( .clk(n1), .n_rst(n_rst), .shift(shift), 
        .data_in(serial_data), .data_out(parallel_data) );
  INVX2 U1 ( .A(clk), .Y(n1) );
endmodule


module flex_buffer_NUM_BITS32_5 ( clk, n_rst, input_data, output_data );
  input [31:0] input_data;
  output [31:0] output_data;
  input clk, n_rst;
  wire   n33, n34, n35, n36, n37;

  DFFSR \output_data_reg[31]  ( .D(input_data[31]), .CLK(n33), .R(n36), .S(
        1'b1), .Q(output_data[31]) );
  DFFSR \output_data_reg[30]  ( .D(input_data[30]), .CLK(clk), .R(n36), .S(
        1'b1), .Q(output_data[30]) );
  DFFSR \output_data_reg[29]  ( .D(input_data[29]), .CLK(n33), .R(n36), .S(
        1'b1), .Q(output_data[29]) );
  DFFSR \output_data_reg[28]  ( .D(input_data[28]), .CLK(clk), .R(n36), .S(
        1'b1), .Q(output_data[28]) );
  DFFSR \output_data_reg[27]  ( .D(input_data[27]), .CLK(n33), .R(n36), .S(
        1'b1), .Q(output_data[27]) );
  DFFSR \output_data_reg[26]  ( .D(input_data[26]), .CLK(clk), .R(n36), .S(
        1'b1), .Q(output_data[26]) );
  DFFSR \output_data_reg[25]  ( .D(input_data[25]), .CLK(n33), .R(n36), .S(
        1'b1), .Q(output_data[25]) );
  DFFSR \output_data_reg[24]  ( .D(input_data[24]), .CLK(clk), .R(n36), .S(
        1'b1), .Q(output_data[24]) );
  DFFSR \output_data_reg[23]  ( .D(input_data[23]), .CLK(n33), .R(n35), .S(
        1'b1), .Q(output_data[23]) );
  DFFSR \output_data_reg[22]  ( .D(input_data[22]), .CLK(clk), .R(n35), .S(
        1'b1), .Q(output_data[22]) );
  DFFSR \output_data_reg[21]  ( .D(input_data[21]), .CLK(n33), .R(n35), .S(
        1'b1), .Q(output_data[21]) );
  DFFSR \output_data_reg[20]  ( .D(input_data[20]), .CLK(n33), .R(n35), .S(
        1'b1), .Q(output_data[20]) );
  DFFSR \output_data_reg[19]  ( .D(input_data[19]), .CLK(n33), .R(n35), .S(
        1'b1), .Q(output_data[19]) );
  DFFSR \output_data_reg[18]  ( .D(input_data[18]), .CLK(n33), .R(n35), .S(
        1'b1), .Q(output_data[18]) );
  DFFSR \output_data_reg[17]  ( .D(input_data[17]), .CLK(n33), .R(n35), .S(
        1'b1), .Q(output_data[17]) );
  DFFSR \output_data_reg[16]  ( .D(input_data[16]), .CLK(n33), .R(n35), .S(
        1'b1), .Q(output_data[16]) );
  DFFSR \output_data_reg[15]  ( .D(input_data[15]), .CLK(n33), .R(n35), .S(
        1'b1), .Q(output_data[15]) );
  DFFSR \output_data_reg[14]  ( .D(input_data[14]), .CLK(n33), .R(n35), .S(
        1'b1), .Q(output_data[14]) );
  DFFSR \output_data_reg[13]  ( .D(input_data[13]), .CLK(n33), .R(n35), .S(
        1'b1), .Q(output_data[13]) );
  DFFSR \output_data_reg[12]  ( .D(input_data[12]), .CLK(n33), .R(n35), .S(
        1'b1), .Q(output_data[12]) );
  DFFSR \output_data_reg[11]  ( .D(input_data[11]), .CLK(n33), .R(n36), .S(
        1'b1), .Q(output_data[11]) );
  DFFSR \output_data_reg[10]  ( .D(input_data[10]), .CLK(n33), .R(n35), .S(
        1'b1), .Q(output_data[10]) );
  DFFSR \output_data_reg[9]  ( .D(input_data[9]), .CLK(n33), .R(n36), .S(1'b1), 
        .Q(output_data[9]) );
  DFFSR \output_data_reg[8]  ( .D(input_data[8]), .CLK(n33), .R(n35), .S(1'b1), 
        .Q(output_data[8]) );
  DFFSR \output_data_reg[7]  ( .D(input_data[7]), .CLK(n33), .R(n36), .S(1'b1), 
        .Q(output_data[7]) );
  DFFSR \output_data_reg[6]  ( .D(input_data[6]), .CLK(n33), .R(n35), .S(1'b1), 
        .Q(output_data[6]) );
  DFFSR \output_data_reg[5]  ( .D(input_data[5]), .CLK(clk), .R(n36), .S(1'b1), 
        .Q(output_data[5]) );
  DFFSR \output_data_reg[4]  ( .D(input_data[4]), .CLK(clk), .R(n35), .S(1'b1), 
        .Q(output_data[4]) );
  DFFSR \output_data_reg[3]  ( .D(input_data[3]), .CLK(clk), .R(n36), .S(1'b1), 
        .Q(output_data[3]) );
  DFFSR \output_data_reg[2]  ( .D(input_data[2]), .CLK(clk), .R(n36), .S(1'b1), 
        .Q(output_data[2]) );
  DFFSR \output_data_reg[1]  ( .D(input_data[1]), .CLK(clk), .R(n36), .S(1'b1), 
        .Q(output_data[1]) );
  DFFSR \output_data_reg[0]  ( .D(input_data[0]), .CLK(clk), .R(n36), .S(1'b1), 
        .Q(output_data[0]) );
  INVX2 U35 ( .A(n34), .Y(n33) );
  INVX2 U36 ( .A(clk), .Y(n34) );
  INVX2 U37 ( .A(n37), .Y(n35) );
  INVX2 U38 ( .A(n37), .Y(n36) );
  INVX2 U39 ( .A(n_rst), .Y(n37) );
endmodule


module cla_4bit_111 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n4), .B(n5), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n4), .B(n5), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n4), .B(n5), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(b[3]), .Y(n4) );
  INVX2 U10 ( .A(a[3]), .Y(n5) );
endmodule


module cla_4bit_110 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n4), .B(n5), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n4), .B(n5), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n4), .B(n5), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(b[3]), .Y(n4) );
  INVX2 U10 ( .A(a[3]), .Y(n5) );
endmodule


module cla_4bit_109 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n4), .B(n5), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n4), .B(n5), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n4), .B(n5), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(b[3]), .Y(n4) );
  INVX2 U10 ( .A(a[3]), .Y(n5) );
endmodule


module cla_4bit_108 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n1), .C(n4), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n3), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n1), .C(n39), .D(n4), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n1), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n2), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n3), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(a[3]), .Y(n1) );
  INVX2 U7 ( .A(n36), .Y(n2) );
  INVX2 U8 ( .A(n23), .Y(n3) );
  INVX2 U9 ( .A(n28), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_16bit_27 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   cout, n2, n3, n4, n11, n12, n13, n14, n15, n16;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  NOR2X1 U5 ( .A(n16), .B(n15), .Y(pg) );
  NAND2X1 U6 ( .A(p[3]), .B(p[2]), .Y(n15) );
  NAND2X1 U7 ( .A(p[1]), .B(p[0]), .Y(n16) );
  AOI21X1 U8 ( .A(n2), .B(p[3]), .C(g[3]), .Y(n14) );
  AOI21X1 U9 ( .A(n3), .B(p[2]), .C(g[2]), .Y(n13) );
  AOI21X1 U10 ( .A(n4), .B(p[1]), .C(g[1]), .Y(n12) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n11) );
  cla_4bit_111 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_110 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n4), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_109 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n3), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_108 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n2), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  INVX2 U1 ( .A(n14), .Y(cout) );
  INVX2 U2 ( .A(n13), .Y(n2) );
  INVX2 U3 ( .A(n12), .Y(n3) );
  INVX2 U4 ( .A(n11), .Y(n4) );
endmodule


module cla_4bit_107 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n3), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n5), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n3), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n3), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n4), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n5), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(b[3]), .Y(n3) );
  INVX2 U9 ( .A(n36), .Y(n4) );
  INVX2 U10 ( .A(n23), .Y(n5) );
endmodule


module cla_4bit_106 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n4), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n4), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n4), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(a[3]), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_105 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n4), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n4), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n4), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(a[3]), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_104 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n4), .B(n5), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n4), .B(n5), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n4), .B(n5), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(b[3]), .Y(n4) );
  INVX2 U10 ( .A(a[3]), .Y(n5) );
endmodule


module cla_16bit_26 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   cout, n2, n3, n4, n11, n12, n13, n14, n15, n16;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  NOR2X1 U5 ( .A(n16), .B(n15), .Y(pg) );
  NAND2X1 U6 ( .A(p[3]), .B(p[2]), .Y(n15) );
  NAND2X1 U7 ( .A(p[1]), .B(p[0]), .Y(n16) );
  AOI21X1 U8 ( .A(n2), .B(p[3]), .C(g[3]), .Y(n14) );
  AOI21X1 U9 ( .A(n3), .B(p[2]), .C(g[2]), .Y(n13) );
  AOI21X1 U10 ( .A(n4), .B(p[1]), .C(g[1]), .Y(n12) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n11) );
  cla_4bit_107 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_106 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n4), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_105 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n3), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_104 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n2), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  INVX2 U1 ( .A(n14), .Y(cout) );
  INVX2 U2 ( .A(n13), .Y(n2) );
  INVX2 U3 ( .A(n12), .Y(n3) );
  INVX2 U4 ( .A(n11), .Y(n4) );
endmodule


module adder_1bit_35 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n2, n3;

  XOR2X1 U2 ( .A(carry_in), .B(n2), .Y(sum) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n2), .D(carry_in), .Y(n3) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n2) );
  INVX2 U1 ( .A(n3), .Y(carry_out) );
endmodule


module cla_4bit_103 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_102 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_101 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n3), .C(n2), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n3), .C(n39), .D(n2), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n3), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n28), .Y(n2) );
  INVX2 U8 ( .A(a[3]), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_100 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n3), .C(n2), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n3), .C(n39), .D(n2), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n3), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n28), .Y(n2) );
  INVX2 U8 ( .A(a[3]), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_16bit_25 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   cout, n2, n3, n4, n11, n12, n13, n14, n15, n16;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  NOR2X1 U5 ( .A(n16), .B(n15), .Y(pg) );
  NAND2X1 U6 ( .A(p[3]), .B(p[2]), .Y(n15) );
  NAND2X1 U7 ( .A(p[1]), .B(p[0]), .Y(n16) );
  AOI21X1 U8 ( .A(n2), .B(p[3]), .C(g[3]), .Y(n14) );
  AOI21X1 U9 ( .A(n3), .B(p[2]), .C(g[2]), .Y(n13) );
  AOI21X1 U10 ( .A(n4), .B(p[1]), .C(g[1]), .Y(n12) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n11) );
  cla_4bit_103 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_102 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n4), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_101 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n3), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_100 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n2), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  INVX2 U1 ( .A(n14), .Y(cout) );
  INVX2 U2 ( .A(n13), .Y(n2) );
  INVX2 U3 ( .A(n12), .Y(n3) );
  INVX2 U4 ( .A(n11), .Y(n4) );
endmodule


module adder_1bit_34 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n4, n5;

  XOR2X1 U2 ( .A(carry_in), .B(n5), .Y(sum) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n5), .D(carry_in), .Y(n4) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n5) );
  INVX2 U1 ( .A(n4), .Y(carry_out) );
endmodule


module adder_1bit_33 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n4, n5;

  XOR2X1 U2 ( .A(carry_in), .B(n5), .Y(sum) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n5), .D(carry_in), .Y(n4) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n5) );
  INVX2 U1 ( .A(n4), .Y(carry_out) );
endmodule


module cla_4bit_99 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_98 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_97 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_96 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n3), .C(n2), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n3), .C(n39), .D(n2), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n3), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n28), .Y(n2) );
  INVX2 U8 ( .A(a[3]), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_16bit_24 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   cout, n2, n3, n4, n11, n12, n13, n14, n15, n16;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  NOR2X1 U5 ( .A(n16), .B(n15), .Y(pg) );
  NAND2X1 U6 ( .A(p[3]), .B(p[2]), .Y(n15) );
  NAND2X1 U7 ( .A(p[1]), .B(p[0]), .Y(n16) );
  AOI21X1 U8 ( .A(n2), .B(p[3]), .C(g[3]), .Y(n14) );
  AOI21X1 U9 ( .A(n3), .B(p[2]), .C(g[2]), .Y(n13) );
  AOI21X1 U10 ( .A(n4), .B(p[1]), .C(g[1]), .Y(n12) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n11) );
  cla_4bit_99 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_98 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n4), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_97 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n3), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_96 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n2), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  INVX2 U1 ( .A(n14), .Y(cout) );
  INVX2 U2 ( .A(n13), .Y(n2) );
  INVX2 U3 ( .A(n12), .Y(n3) );
  INVX2 U4 ( .A(n11), .Y(n4) );
endmodule


module adder_1bit_32 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n4, n5;

  XOR2X1 U2 ( .A(carry_in), .B(n5), .Y(sum) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n5), .D(carry_in), .Y(n4) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n5) );
  INVX2 U1 ( .A(n4), .Y(carry_out) );
endmodule


module adder_1bit_31 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n4, n5;

  XOR2X1 U2 ( .A(carry_in), .B(n5), .Y(sum) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n5), .D(carry_in), .Y(n4) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n5) );
  INVX2 U1 ( .A(n4), .Y(carry_out) );
endmodule


module adder_1bit_30 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n4, n5;

  XOR2X1 U2 ( .A(carry_in), .B(n5), .Y(sum) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n5), .D(carry_in), .Y(n4) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n5) );
  INVX2 U1 ( .A(n4), .Y(carry_out) );
endmodule


module cla_4bit_95 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_94 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_93 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_92 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_16bit_23 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   cout, n2, n3, n4, n11, n12, n13, n14, n15, n16;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  NOR2X1 U5 ( .A(n16), .B(n15), .Y(pg) );
  NAND2X1 U6 ( .A(p[3]), .B(p[2]), .Y(n15) );
  NAND2X1 U7 ( .A(p[1]), .B(p[0]), .Y(n16) );
  AOI21X1 U8 ( .A(n2), .B(p[3]), .C(g[3]), .Y(n14) );
  AOI21X1 U9 ( .A(n3), .B(p[2]), .C(g[2]), .Y(n13) );
  AOI21X1 U10 ( .A(n4), .B(p[1]), .C(g[1]), .Y(n12) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n11) );
  cla_4bit_95 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_94 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n4), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_93 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n3), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_92 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n2), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  INVX2 U1 ( .A(n14), .Y(cout) );
  INVX2 U2 ( .A(n13), .Y(n2) );
  INVX2 U3 ( .A(n12), .Y(n3) );
  INVX2 U4 ( .A(n11), .Y(n4) );
endmodule


module cla_4bit_227 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n1, n2, n3, n4, n5;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n13) );
  AND2X2 U2 ( .A(cin), .B(n18), .Y(n12) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n18) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n19) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n20) );
  XNOR2X1 U11 ( .A(n6), .B(n7), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n7) );
  XOR2X1 U13 ( .A(n8), .B(n9), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n8) );
  XOR2X1 U15 ( .A(n10), .B(n11), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n12), .B(n13), .Y(n11) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n10) );
  XOR2X1 U18 ( .A(a[0]), .B(n14), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n14) );
  NOR2X1 U20 ( .A(n15), .B(n16), .Y(pg) );
  NAND2X1 U21 ( .A(n17), .B(n18), .Y(n16) );
  NAND2X1 U22 ( .A(n19), .B(n20), .Y(n15) );
  OAI22X1 U23 ( .A(n5), .B(n4), .C(n3), .D(n21), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n20), .C(b[2]), .D(a[2]), .Y(n21) );
  OAI22X1 U25 ( .A(n5), .B(n4), .C(n6), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n4), .Y(n17) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n20), .D(n1), .Y(n6) );
  AOI21X1 U28 ( .A(n19), .B(n12), .C(n2), .Y(n9) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n19), .D(n13), .Y(n22) );
  INVX2 U6 ( .A(n9), .Y(n1) );
  INVX2 U7 ( .A(n22), .Y(n2) );
  INVX2 U8 ( .A(n17), .Y(n3) );
  INVX2 U9 ( .A(a[3]), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module mult16by4_3 ( a, b, product );
  input [15:0] a;
  input [3:0] b;
  output [19:0] product;
  wire   \sums[2][18] , \sums[2][17] , \sums[2][16] , \sums[2][15] ,
         \sums[2][14] , \sums[2][13] , \sums[2][12] , \sums[2][11] ,
         \sums[2][10] , \sums[2][9] , \sums[2][8] , \sums[2][7] , \sums[2][6] ,
         \sums[2][5] , \sums[2][4] , \sums[2][3] , \sums[2][2] , \sums[2][1] ,
         \sums[2][0] , \sums[1][18] , \sums[1][17] , \sums[1][16] ,
         \sums[1][15] , \sums[1][14] , \sums[1][13] , \sums[1][12] ,
         \sums[1][11] , \sums[1][10] , \sums[1][9] , \sums[1][8] ,
         \sums[1][7] , \sums[1][6] , \sums[1][5] , \sums[1][4] , \sums[1][3] ,
         \sums[1][2] , \sums[1][1] , \sums[1][0] , \sums[0][17] ,
         \sums[0][16] , \sums[0][15] , \sums[0][14] , \sums[0][13] ,
         \sums[0][12] , \sums[0][11] , \sums[0][10] , \sums[0][9] ,
         \sums[0][8] , \sums[0][7] , \sums[0][6] , \sums[0][5] , \sums[0][4] ,
         \sums[0][3] , \sums[0][2] , \sums[0][1] , \sums[0][0] , n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n93, n94, n95;
  wire   [15:0] in_opp_sign;
  wire   [15:0] ab0;
  wire   [15:1] ab1;
  wire   [17:2] ab2;
  wire   [18:3] ab3;
  wire   [7:0] couts;
  wire   [19:0] out_neg;

  OAI21X1 U43 ( .A(n2), .B(n15), .C(n42), .Y(product[9]) );
  NAND2X1 U44 ( .A(out_neg[9]), .B(n3), .Y(n42) );
  OAI21X1 U45 ( .A(a[15]), .B(n16), .C(n43), .Y(product[8]) );
  NAND2X1 U46 ( .A(out_neg[8]), .B(n3), .Y(n43) );
  OAI21X1 U47 ( .A(a[15]), .B(n17), .C(n44), .Y(product[7]) );
  NAND2X1 U48 ( .A(out_neg[7]), .B(n3), .Y(n44) );
  OAI21X1 U49 ( .A(a[15]), .B(n18), .C(n45), .Y(product[6]) );
  NAND2X1 U50 ( .A(out_neg[6]), .B(n3), .Y(n45) );
  OAI21X1 U51 ( .A(a[15]), .B(n19), .C(n46), .Y(product[5]) );
  NAND2X1 U52 ( .A(out_neg[5]), .B(n3), .Y(n46) );
  OAI21X1 U53 ( .A(a[15]), .B(n20), .C(n47), .Y(product[4]) );
  NAND2X1 U54 ( .A(out_neg[4]), .B(n3), .Y(n47) );
  OAI21X1 U55 ( .A(a[15]), .B(n21), .C(n48), .Y(product[3]) );
  NAND2X1 U56 ( .A(out_neg[3]), .B(n3), .Y(n48) );
  OAI21X1 U57 ( .A(a[15]), .B(n22), .C(n49), .Y(product[2]) );
  NAND2X1 U58 ( .A(out_neg[2]), .B(n3), .Y(n49) );
  OAI21X1 U59 ( .A(n2), .B(n23), .C(n50), .Y(product[1]) );
  NAND2X1 U60 ( .A(out_neg[1]), .B(n3), .Y(n50) );
  OAI21X1 U61 ( .A(a[15]), .B(n12), .C(n51), .Y(product[19]) );
  NAND2X1 U62 ( .A(out_neg[19]), .B(n3), .Y(n51) );
  OAI21X1 U63 ( .A(a[15]), .B(n11), .C(n52), .Y(product[18]) );
  NAND2X1 U64 ( .A(out_neg[18]), .B(n3), .Y(n52) );
  OAI21X1 U65 ( .A(a[15]), .B(n10), .C(n53), .Y(product[17]) );
  NAND2X1 U66 ( .A(out_neg[17]), .B(n3), .Y(n53) );
  OAI21X1 U67 ( .A(n2), .B(n9), .C(n54), .Y(product[16]) );
  NAND2X1 U68 ( .A(out_neg[16]), .B(n3), .Y(n54) );
  OAI21X1 U69 ( .A(a[15]), .B(n5), .C(n55), .Y(product[15]) );
  NAND2X1 U70 ( .A(out_neg[15]), .B(n3), .Y(n55) );
  OAI21X1 U71 ( .A(n2), .B(n6), .C(n56), .Y(product[14]) );
  NAND2X1 U72 ( .A(out_neg[14]), .B(n3), .Y(n56) );
  OAI21X1 U73 ( .A(n2), .B(n7), .C(n57), .Y(product[13]) );
  NAND2X1 U74 ( .A(out_neg[13]), .B(n3), .Y(n57) );
  OAI21X1 U75 ( .A(n2), .B(n8), .C(n58), .Y(product[12]) );
  NAND2X1 U76 ( .A(out_neg[12]), .B(n3), .Y(n58) );
  OAI21X1 U77 ( .A(n2), .B(n13), .C(n59), .Y(product[11]) );
  NAND2X1 U78 ( .A(out_neg[11]), .B(n3), .Y(n59) );
  OAI21X1 U79 ( .A(n2), .B(n14), .C(n60), .Y(product[10]) );
  NAND2X1 U80 ( .A(out_neg[10]), .B(n3), .Y(n60) );
  OAI21X1 U81 ( .A(n2), .B(n24), .C(n61), .Y(product[0]) );
  NAND2X1 U82 ( .A(out_neg[0]), .B(n2), .Y(n61) );
  NOR2X1 U83 ( .A(n62), .B(n40), .Y(ab3[9]) );
  NOR2X1 U84 ( .A(n63), .B(n40), .Y(ab3[8]) );
  NOR2X1 U85 ( .A(n64), .B(n40), .Y(ab3[7]) );
  NOR2X1 U86 ( .A(n65), .B(n40), .Y(ab3[6]) );
  NOR2X1 U87 ( .A(n66), .B(n40), .Y(ab3[5]) );
  NOR2X1 U88 ( .A(n67), .B(n40), .Y(ab3[4]) );
  NOR2X1 U89 ( .A(n68), .B(n40), .Y(ab3[3]) );
  NOR2X1 U90 ( .A(n69), .B(n40), .Y(ab3[17]) );
  NOR2X1 U91 ( .A(n70), .B(n40), .Y(ab3[16]) );
  NOR2X1 U92 ( .A(n71), .B(n40), .Y(ab3[15]) );
  NOR2X1 U93 ( .A(n72), .B(n40), .Y(ab3[14]) );
  NOR2X1 U94 ( .A(n73), .B(n40), .Y(ab3[13]) );
  NOR2X1 U95 ( .A(n74), .B(n40), .Y(ab3[12]) );
  NOR2X1 U96 ( .A(n75), .B(n40), .Y(ab3[11]) );
  NOR2X1 U97 ( .A(n76), .B(n40), .Y(ab3[10]) );
  NOR2X1 U98 ( .A(n76), .B(n93), .Y(ab2[9]) );
  NOR2X1 U99 ( .A(n62), .B(n93), .Y(ab2[8]) );
  NOR2X1 U100 ( .A(n63), .B(n93), .Y(ab2[7]) );
  NOR2X1 U101 ( .A(n64), .B(n93), .Y(ab2[6]) );
  NOR2X1 U102 ( .A(n65), .B(n93), .Y(ab2[5]) );
  NOR2X1 U103 ( .A(n66), .B(n93), .Y(ab2[4]) );
  NOR2X1 U104 ( .A(n67), .B(n93), .Y(ab2[3]) );
  NOR2X1 U105 ( .A(n68), .B(n93), .Y(ab2[2]) );
  NOR2X1 U106 ( .A(n69), .B(n93), .Y(ab2[16]) );
  NOR2X1 U107 ( .A(n70), .B(n93), .Y(ab2[15]) );
  NOR2X1 U108 ( .A(n71), .B(n93), .Y(ab2[14]) );
  NOR2X1 U109 ( .A(n72), .B(n93), .Y(ab2[13]) );
  NOR2X1 U110 ( .A(n73), .B(n93), .Y(ab2[12]) );
  NOR2X1 U111 ( .A(n74), .B(n93), .Y(ab2[11]) );
  NOR2X1 U112 ( .A(n75), .B(n93), .Y(ab2[10]) );
  NOR2X1 U113 ( .A(n75), .B(n94), .Y(ab1[9]) );
  NOR2X1 U114 ( .A(n76), .B(n94), .Y(ab1[8]) );
  NOR2X1 U115 ( .A(n62), .B(n94), .Y(ab1[7]) );
  NOR2X1 U116 ( .A(n63), .B(n94), .Y(ab1[6]) );
  NOR2X1 U117 ( .A(n64), .B(n94), .Y(ab1[5]) );
  NOR2X1 U118 ( .A(n65), .B(n94), .Y(ab1[4]) );
  NOR2X1 U119 ( .A(n66), .B(n94), .Y(ab1[3]) );
  NOR2X1 U120 ( .A(n67), .B(n94), .Y(ab1[2]) );
  NOR2X1 U121 ( .A(n68), .B(n94), .Y(ab1[1]) );
  NOR2X1 U122 ( .A(n69), .B(n94), .Y(ab1[15]) );
  NOR2X1 U123 ( .A(n70), .B(n94), .Y(ab1[14]) );
  NOR2X1 U124 ( .A(n71), .B(n94), .Y(ab1[13]) );
  NOR2X1 U125 ( .A(n72), .B(n94), .Y(ab1[12]) );
  NOR2X1 U126 ( .A(n73), .B(n94), .Y(ab1[11]) );
  NOR2X1 U127 ( .A(n74), .B(n94), .Y(ab1[10]) );
  NOR2X1 U128 ( .A(n74), .B(n95), .Y(ab0[9]) );
  AOI21X1 U129 ( .A(in_opp_sign[9]), .B(n1), .C(n77), .Y(n74) );
  OAI21X1 U130 ( .A(n2), .B(n30), .C(n78), .Y(n77) );
  NOR2X1 U131 ( .A(n75), .B(n95), .Y(ab0[8]) );
  AOI21X1 U132 ( .A(in_opp_sign[8]), .B(n3), .C(n79), .Y(n75) );
  OAI21X1 U133 ( .A(n2), .B(n31), .C(n78), .Y(n79) );
  NOR2X1 U134 ( .A(n76), .B(n95), .Y(ab0[7]) );
  AOI21X1 U135 ( .A(in_opp_sign[7]), .B(n1), .C(n80), .Y(n76) );
  OAI21X1 U136 ( .A(n2), .B(n32), .C(n78), .Y(n80) );
  NOR2X1 U137 ( .A(n62), .B(n95), .Y(ab0[6]) );
  AOI21X1 U138 ( .A(in_opp_sign[6]), .B(n1), .C(n81), .Y(n62) );
  OAI21X1 U139 ( .A(n2), .B(n33), .C(n78), .Y(n81) );
  NOR2X1 U140 ( .A(n63), .B(n95), .Y(ab0[5]) );
  AOI21X1 U141 ( .A(in_opp_sign[5]), .B(n1), .C(n82), .Y(n63) );
  OAI21X1 U142 ( .A(n2), .B(n34), .C(n78), .Y(n82) );
  NOR2X1 U143 ( .A(n64), .B(n95), .Y(ab0[4]) );
  AOI21X1 U144 ( .A(in_opp_sign[4]), .B(n1), .C(n83), .Y(n64) );
  OAI21X1 U145 ( .A(n1), .B(n35), .C(n78), .Y(n83) );
  NOR2X1 U146 ( .A(n65), .B(n95), .Y(ab0[3]) );
  AOI21X1 U147 ( .A(in_opp_sign[3]), .B(n1), .C(n84), .Y(n65) );
  OAI21X1 U148 ( .A(n3), .B(n36), .C(n78), .Y(n84) );
  NOR2X1 U149 ( .A(n66), .B(n95), .Y(ab0[2]) );
  AOI21X1 U150 ( .A(in_opp_sign[2]), .B(n1), .C(n85), .Y(n66) );
  OAI21X1 U151 ( .A(n2), .B(n37), .C(n78), .Y(n85) );
  NOR2X1 U152 ( .A(n67), .B(n95), .Y(ab0[1]) );
  AOI21X1 U153 ( .A(in_opp_sign[1]), .B(n1), .C(n86), .Y(n67) );
  OAI21X1 U154 ( .A(n1), .B(n38), .C(n78), .Y(n86) );
  NOR2X1 U156 ( .A(n69), .B(n95), .Y(ab0[14]) );
  AOI21X1 U157 ( .A(in_opp_sign[14]), .B(n1), .C(n87), .Y(n69) );
  OAI21X1 U158 ( .A(n3), .B(n25), .C(n78), .Y(n87) );
  NOR2X1 U159 ( .A(n70), .B(n95), .Y(ab0[13]) );
  AOI21X1 U160 ( .A(in_opp_sign[13]), .B(n1), .C(n88), .Y(n70) );
  OAI21X1 U161 ( .A(n2), .B(n26), .C(n78), .Y(n88) );
  NOR2X1 U162 ( .A(n71), .B(n95), .Y(ab0[12]) );
  AOI21X1 U163 ( .A(in_opp_sign[12]), .B(n1), .C(n89), .Y(n71) );
  OAI21X1 U164 ( .A(n1), .B(n27), .C(n78), .Y(n89) );
  NOR2X1 U165 ( .A(n72), .B(n95), .Y(ab0[11]) );
  AOI21X1 U166 ( .A(in_opp_sign[11]), .B(n1), .C(n90), .Y(n72) );
  OAI21X1 U167 ( .A(n3), .B(n28), .C(n78), .Y(n90) );
  NOR2X1 U168 ( .A(n73), .B(n95), .Y(ab0[10]) );
  AOI21X1 U169 ( .A(in_opp_sign[10]), .B(n1), .C(n91), .Y(n73) );
  OAI21X1 U170 ( .A(n2), .B(n29), .C(n78), .Y(n91) );
  NOR2X1 U171 ( .A(n68), .B(n95), .Y(ab0[0]) );
  AOI21X1 U172 ( .A(in_opp_sign[0]), .B(n1), .C(n92), .Y(n68) );
  OAI21X1 U173 ( .A(n1), .B(n39), .C(n78), .Y(n92) );
  NAND2X1 U174 ( .A(in_opp_sign[15]), .B(n3), .Y(n78) );
  cla_16bit_27 AOPS1 ( .a({n4, n25, n26, n27, n28, n29, n30, n31, n32, n33, 
        n34, n35, n36, n37, n38, n39}), .b({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .cin(
        1'b1), .sum(in_opp_sign) );
  cla_16bit_26 A1 ( .a({1'b0, ab0[14:0]}), .b({ab1, 1'b0}), .cin(1'b0), .cout(
        couts[0]), .sum({\sums[0][15] , \sums[0][14] , \sums[0][13] , 
        \sums[0][12] , \sums[0][11] , \sums[0][10] , \sums[0][9] , 
        \sums[0][8] , \sums[0][7] , \sums[0][6] , \sums[0][5] , \sums[0][4] , 
        \sums[0][3] , \sums[0][2] , \sums[0][1] , \sums[0][0] }) );
  adder_1bit_35 A1_1 ( .a(1'b0), .b(ab2[16]), .carry_in(couts[0]), .sum(
        \sums[0][16] ), .carry_out(\sums[0][17] ) );
  cla_16bit_25 A2 ( .a({\sums[0][15] , \sums[0][14] , \sums[0][13] , 
        \sums[0][12] , \sums[0][11] , \sums[0][10] , \sums[0][9] , 
        \sums[0][8] , \sums[0][7] , \sums[0][6] , \sums[0][5] , \sums[0][4] , 
        \sums[0][3] , \sums[0][2] , \sums[0][1] , \sums[0][0] }), .b({
        ab2[15:2], 1'b0, 1'b0}), .cin(1'b0), .cout(couts[1]), .sum({
        \sums[1][15] , \sums[1][14] , \sums[1][13] , \sums[1][12] , 
        \sums[1][11] , \sums[1][10] , \sums[1][9] , \sums[1][8] , \sums[1][7] , 
        \sums[1][6] , \sums[1][5] , \sums[1][4] , \sums[1][3] , \sums[1][2] , 
        \sums[1][1] , \sums[1][0] }) );
  adder_1bit_34 A2_1 ( .a(\sums[0][16] ), .b(ab2[16]), .carry_in(couts[1]), 
        .sum(\sums[1][16] ), .carry_out(couts[2]) );
  adder_1bit_33 A2_2 ( .a(\sums[0][17] ), .b(1'b0), .carry_in(couts[2]), .sum(
        \sums[1][17] ), .carry_out(\sums[1][18] ) );
  cla_16bit_24 A3 ( .a({\sums[1][15] , \sums[1][14] , \sums[1][13] , 
        \sums[1][12] , \sums[1][11] , \sums[1][10] , \sums[1][9] , 
        \sums[1][8] , \sums[1][7] , \sums[1][6] , \sums[1][5] , \sums[1][4] , 
        \sums[1][3] , \sums[1][2] , \sums[1][1] , \sums[1][0] }), .b({
        ab3[15:3], 1'b0, 1'b0, 1'b0}), .cin(1'b0), .cout(couts[3]), .sum({
        \sums[2][15] , \sums[2][14] , \sums[2][13] , \sums[2][12] , 
        \sums[2][11] , \sums[2][10] , \sums[2][9] , \sums[2][8] , \sums[2][7] , 
        \sums[2][6] , \sums[2][5] , \sums[2][4] , \sums[2][3] , \sums[2][2] , 
        \sums[2][1] , \sums[2][0] }) );
  adder_1bit_32 A3_1 ( .a(\sums[1][16] ), .b(ab3[16]), .carry_in(couts[3]), 
        .sum(\sums[2][16] ), .carry_out(couts[4]) );
  adder_1bit_31 A3_2 ( .a(\sums[1][17] ), .b(ab3[17]), .carry_in(couts[4]), 
        .sum(\sums[2][17] ), .carry_out(couts[5]) );
  adder_1bit_30 A3_3 ( .a(\sums[1][18] ), .b(1'b0), .carry_in(couts[5]), .sum(
        \sums[2][18] ), .carry_out(couts[6]) );
  cla_16bit_23 A4 ( .a({n5, n6, n7, n8, n13, n14, n15, n16, n17, n18, n19, n20, 
        n21, n22, n23, n24}), .b({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .cin(1'b1), 
        .cout(couts[7]), .sum(out_neg[15:0]) );
  cla_4bit_227 A5 ( .a({n12, n11, n10, n9}), .b({1'b0, 1'b0, 1'b0, 1'b0}), 
        .cin(couts[7]), .sum(out_neg[19:16]) );
  INVX2 U3 ( .A(n4), .Y(n1) );
  INVX2 U4 ( .A(n4), .Y(n2) );
  INVX2 U5 ( .A(n4), .Y(n3) );
  INVX2 U6 ( .A(a[15]), .Y(n4) );
  INVX2 U7 ( .A(b[1]), .Y(n94) );
  INVX2 U8 ( .A(b[0]), .Y(n95) );
  INVX2 U9 ( .A(b[2]), .Y(n93) );
  INVX2 U10 ( .A(b[3]), .Y(n40) );
  INVX2 U11 ( .A(\sums[2][15] ), .Y(n5) );
  INVX2 U12 ( .A(\sums[2][14] ), .Y(n6) );
  INVX2 U13 ( .A(\sums[2][13] ), .Y(n7) );
  INVX2 U14 ( .A(\sums[2][12] ), .Y(n8) );
  INVX2 U15 ( .A(\sums[2][16] ), .Y(n9) );
  INVX2 U16 ( .A(\sums[2][17] ), .Y(n10) );
  INVX2 U17 ( .A(\sums[2][18] ), .Y(n11) );
  INVX2 U18 ( .A(couts[6]), .Y(n12) );
  INVX2 U19 ( .A(\sums[2][11] ), .Y(n13) );
  INVX2 U20 ( .A(\sums[2][10] ), .Y(n14) );
  INVX2 U21 ( .A(\sums[2][9] ), .Y(n15) );
  INVX2 U22 ( .A(\sums[2][8] ), .Y(n16) );
  INVX2 U23 ( .A(\sums[2][7] ), .Y(n17) );
  INVX2 U24 ( .A(\sums[2][6] ), .Y(n18) );
  INVX2 U25 ( .A(\sums[2][5] ), .Y(n19) );
  INVX2 U26 ( .A(\sums[2][4] ), .Y(n20) );
  INVX2 U27 ( .A(\sums[2][3] ), .Y(n21) );
  INVX2 U28 ( .A(\sums[2][2] ), .Y(n22) );
  INVX2 U29 ( .A(\sums[2][1] ), .Y(n23) );
  INVX2 U30 ( .A(\sums[2][0] ), .Y(n24) );
  INVX2 U31 ( .A(a[14]), .Y(n25) );
  INVX2 U32 ( .A(a[13]), .Y(n26) );
  INVX2 U33 ( .A(a[12]), .Y(n27) );
  INVX2 U34 ( .A(a[11]), .Y(n28) );
  INVX2 U35 ( .A(a[10]), .Y(n29) );
  INVX2 U36 ( .A(a[9]), .Y(n30) );
  INVX2 U37 ( .A(a[8]), .Y(n31) );
  INVX2 U38 ( .A(a[7]), .Y(n32) );
  INVX2 U39 ( .A(a[6]), .Y(n33) );
  INVX2 U40 ( .A(a[5]), .Y(n34) );
  INVX2 U41 ( .A(a[4]), .Y(n35) );
  INVX2 U42 ( .A(a[3]), .Y(n36) );
  INVX2 U175 ( .A(a[2]), .Y(n37) );
  INVX2 U176 ( .A(a[1]), .Y(n38) );
  INVX2 U177 ( .A(a[0]), .Y(n39) );
endmodule


module volume_mult_1 ( channel_data, pot_data, output_data );
  input [15:0] channel_data;
  input [3:0] pot_data;
  output [15:0] output_data;

  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3;

  mult16by4_3 DUT ( .a(channel_data), .b(pot_data), .product({output_data, 
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3}) );
endmodule


module cla_4bit_91 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n4), .B(n5), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n4), .B(n5), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n4), .B(n5), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(b[3]), .Y(n4) );
  INVX2 U10 ( .A(a[3]), .Y(n5) );
endmodule


module cla_4bit_90 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n4), .B(n5), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n4), .B(n5), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n4), .B(n5), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(b[3]), .Y(n4) );
  INVX2 U10 ( .A(a[3]), .Y(n5) );
endmodule


module cla_4bit_89 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n4), .B(n5), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n4), .B(n5), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n4), .B(n5), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(b[3]), .Y(n4) );
  INVX2 U10 ( .A(a[3]), .Y(n5) );
endmodule


module cla_4bit_88 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n1), .C(n4), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n3), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n1), .C(n39), .D(n4), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n1), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n2), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n3), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(a[3]), .Y(n1) );
  INVX2 U7 ( .A(n36), .Y(n2) );
  INVX2 U8 ( .A(n23), .Y(n3) );
  INVX2 U9 ( .A(n28), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_16bit_22 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   cout, n2, n3, n4, n11, n12, n13, n14, n15, n16;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  NOR2X1 U5 ( .A(n16), .B(n15), .Y(pg) );
  NAND2X1 U6 ( .A(p[3]), .B(p[2]), .Y(n15) );
  NAND2X1 U7 ( .A(p[1]), .B(p[0]), .Y(n16) );
  AOI21X1 U8 ( .A(n2), .B(p[3]), .C(g[3]), .Y(n14) );
  AOI21X1 U9 ( .A(n3), .B(p[2]), .C(g[2]), .Y(n13) );
  AOI21X1 U10 ( .A(n4), .B(p[1]), .C(g[1]), .Y(n12) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n11) );
  cla_4bit_91 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_90 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n4), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_89 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n3), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_88 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n2), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  INVX2 U1 ( .A(n14), .Y(cout) );
  INVX2 U2 ( .A(n13), .Y(n2) );
  INVX2 U3 ( .A(n12), .Y(n3) );
  INVX2 U4 ( .A(n11), .Y(n4) );
endmodule


module cla_4bit_87 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n3), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n5), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n3), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n3), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n4), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n5), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(b[3]), .Y(n3) );
  INVX2 U9 ( .A(n36), .Y(n4) );
  INVX2 U10 ( .A(n23), .Y(n5) );
endmodule


module cla_4bit_86 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n4), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n4), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n4), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(a[3]), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_85 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n4), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n4), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n4), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(a[3]), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_84 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n4), .B(n5), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n4), .B(n5), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n4), .B(n5), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(b[3]), .Y(n4) );
  INVX2 U10 ( .A(a[3]), .Y(n5) );
endmodule


module cla_16bit_21 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   cout, n2, n3, n4, n11, n12, n13, n14, n15, n16;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  NOR2X1 U5 ( .A(n16), .B(n15), .Y(pg) );
  NAND2X1 U6 ( .A(p[3]), .B(p[2]), .Y(n15) );
  NAND2X1 U7 ( .A(p[1]), .B(p[0]), .Y(n16) );
  AOI21X1 U8 ( .A(n2), .B(p[3]), .C(g[3]), .Y(n14) );
  AOI21X1 U9 ( .A(n3), .B(p[2]), .C(g[2]), .Y(n13) );
  AOI21X1 U10 ( .A(n4), .B(p[1]), .C(g[1]), .Y(n12) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n11) );
  cla_4bit_87 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_86 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n4), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_85 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n3), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_84 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n2), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  INVX2 U1 ( .A(n14), .Y(cout) );
  INVX2 U2 ( .A(n13), .Y(n2) );
  INVX2 U3 ( .A(n12), .Y(n3) );
  INVX2 U4 ( .A(n11), .Y(n4) );
endmodule


module adder_1bit_29 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n4, n5;

  XOR2X1 U2 ( .A(carry_in), .B(n5), .Y(sum) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n5), .D(carry_in), .Y(n4) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n5) );
  INVX2 U1 ( .A(n4), .Y(carry_out) );
endmodule


module cla_4bit_83 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_82 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_81 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n3), .C(n2), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n3), .C(n39), .D(n2), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n3), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n28), .Y(n2) );
  INVX2 U8 ( .A(a[3]), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_80 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n3), .C(n2), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n3), .C(n39), .D(n2), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n3), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n28), .Y(n2) );
  INVX2 U8 ( .A(a[3]), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_16bit_20 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   cout, n2, n3, n4, n11, n12, n13, n14, n15, n16;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  NOR2X1 U5 ( .A(n16), .B(n15), .Y(pg) );
  NAND2X1 U6 ( .A(p[3]), .B(p[2]), .Y(n15) );
  NAND2X1 U7 ( .A(p[1]), .B(p[0]), .Y(n16) );
  AOI21X1 U8 ( .A(n2), .B(p[3]), .C(g[3]), .Y(n14) );
  AOI21X1 U9 ( .A(n3), .B(p[2]), .C(g[2]), .Y(n13) );
  AOI21X1 U10 ( .A(n4), .B(p[1]), .C(g[1]), .Y(n12) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n11) );
  cla_4bit_83 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_82 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n4), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_81 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n3), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_80 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n2), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  INVX2 U1 ( .A(n14), .Y(cout) );
  INVX2 U2 ( .A(n13), .Y(n2) );
  INVX2 U3 ( .A(n12), .Y(n3) );
  INVX2 U4 ( .A(n11), .Y(n4) );
endmodule


module adder_1bit_28 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n4, n5;

  XOR2X1 U2 ( .A(carry_in), .B(n5), .Y(sum) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n5), .D(carry_in), .Y(n4) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n5) );
  INVX2 U1 ( .A(n4), .Y(carry_out) );
endmodule


module adder_1bit_27 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n4, n5;

  XOR2X1 U2 ( .A(carry_in), .B(n5), .Y(sum) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n5), .D(carry_in), .Y(n4) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n5) );
  INVX2 U1 ( .A(n4), .Y(carry_out) );
endmodule


module cla_4bit_79 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_78 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_77 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_76 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n3), .C(n2), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n3), .C(n39), .D(n2), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n3), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n28), .Y(n2) );
  INVX2 U8 ( .A(a[3]), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_16bit_19 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   cout, n2, n3, n4, n11, n12, n13, n14, n15, n16;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  NOR2X1 U5 ( .A(n16), .B(n15), .Y(pg) );
  NAND2X1 U6 ( .A(p[3]), .B(p[2]), .Y(n15) );
  NAND2X1 U7 ( .A(p[1]), .B(p[0]), .Y(n16) );
  AOI21X1 U8 ( .A(n2), .B(p[3]), .C(g[3]), .Y(n14) );
  AOI21X1 U9 ( .A(n3), .B(p[2]), .C(g[2]), .Y(n13) );
  AOI21X1 U10 ( .A(n4), .B(p[1]), .C(g[1]), .Y(n12) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n11) );
  cla_4bit_79 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_78 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n4), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_77 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n3), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_76 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n2), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  INVX2 U1 ( .A(n14), .Y(cout) );
  INVX2 U2 ( .A(n13), .Y(n2) );
  INVX2 U3 ( .A(n12), .Y(n3) );
  INVX2 U4 ( .A(n11), .Y(n4) );
endmodule


module adder_1bit_26 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n4, n5;

  XOR2X1 U2 ( .A(carry_in), .B(n5), .Y(sum) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n5), .D(carry_in), .Y(n4) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n5) );
  INVX2 U1 ( .A(n4), .Y(carry_out) );
endmodule


module adder_1bit_25 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n4, n5;

  XOR2X1 U2 ( .A(carry_in), .B(n5), .Y(sum) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n5), .D(carry_in), .Y(n4) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n5) );
  INVX2 U1 ( .A(n4), .Y(carry_out) );
endmodule


module adder_1bit_24 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n4, n5;

  XOR2X1 U2 ( .A(carry_in), .B(n5), .Y(sum) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n5), .D(carry_in), .Y(n4) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n5) );
  INVX2 U1 ( .A(n4), .Y(carry_out) );
endmodule


module cla_4bit_75 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_74 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_73 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_72 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_16bit_18 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   cout, n2, n3, n4, n11, n12, n13, n14, n15, n16;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  NOR2X1 U5 ( .A(n16), .B(n15), .Y(pg) );
  NAND2X1 U6 ( .A(p[3]), .B(p[2]), .Y(n15) );
  NAND2X1 U7 ( .A(p[1]), .B(p[0]), .Y(n16) );
  AOI21X1 U8 ( .A(n2), .B(p[3]), .C(g[3]), .Y(n14) );
  AOI21X1 U9 ( .A(n3), .B(p[2]), .C(g[2]), .Y(n13) );
  AOI21X1 U10 ( .A(n4), .B(p[1]), .C(g[1]), .Y(n12) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n11) );
  cla_4bit_75 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_74 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n4), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_73 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n3), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_72 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n2), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  INVX2 U1 ( .A(n14), .Y(cout) );
  INVX2 U2 ( .A(n13), .Y(n2) );
  INVX2 U3 ( .A(n12), .Y(n3) );
  INVX2 U4 ( .A(n11), .Y(n4) );
endmodule


module cla_4bit_226 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n4), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n4), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n4), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(a[3]), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module mult16by4_2 ( a, b, product );
  input [15:0] a;
  input [3:0] b;
  output [19:0] product;
  wire   \sums[2][18] , \sums[2][17] , \sums[2][16] , \sums[2][15] ,
         \sums[2][14] , \sums[2][13] , \sums[2][12] , \sums[2][11] ,
         \sums[2][10] , \sums[2][9] , \sums[2][8] , \sums[2][7] , \sums[2][6] ,
         \sums[2][5] , \sums[2][4] , \sums[2][3] , \sums[2][2] , \sums[2][1] ,
         \sums[2][0] , \sums[1][18] , \sums[1][17] , \sums[1][16] ,
         \sums[1][15] , \sums[1][14] , \sums[1][13] , \sums[1][12] ,
         \sums[1][11] , \sums[1][10] , \sums[1][9] , \sums[1][8] ,
         \sums[1][7] , \sums[1][6] , \sums[1][5] , \sums[1][4] , \sums[1][3] ,
         \sums[1][2] , \sums[1][1] , \sums[1][0] , \sums[0][17] ,
         \sums[0][16] , \sums[0][15] , \sums[0][14] , \sums[0][13] ,
         \sums[0][12] , \sums[0][11] , \sums[0][10] , \sums[0][9] ,
         \sums[0][8] , \sums[0][7] , \sums[0][6] , \sums[0][5] , \sums[0][4] ,
         \sums[0][3] , \sums[0][2] , \sums[0][1] , \sums[0][0] , n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n93, n94;
  wire   [15:0] in_opp_sign;
  wire   [15:0] ab0;
  wire   [15:1] ab1;
  wire   [17:2] ab2;
  wire   [18:3] ab3;
  wire   [7:0] couts;
  wire   [19:0] out_neg;

  OAI21X1 U43 ( .A(n2), .B(n14), .C(n42), .Y(product[9]) );
  NAND2X1 U44 ( .A(out_neg[9]), .B(n2), .Y(n42) );
  OAI21X1 U45 ( .A(a[15]), .B(n15), .C(n43), .Y(product[8]) );
  NAND2X1 U46 ( .A(out_neg[8]), .B(n1), .Y(n43) );
  OAI21X1 U47 ( .A(a[15]), .B(n16), .C(n44), .Y(product[7]) );
  NAND2X1 U48 ( .A(out_neg[7]), .B(n2), .Y(n44) );
  OAI21X1 U49 ( .A(a[15]), .B(n17), .C(n45), .Y(product[6]) );
  NAND2X1 U50 ( .A(out_neg[6]), .B(n2), .Y(n45) );
  OAI21X1 U51 ( .A(a[15]), .B(n18), .C(n46), .Y(product[5]) );
  NAND2X1 U52 ( .A(out_neg[5]), .B(n1), .Y(n46) );
  OAI21X1 U53 ( .A(a[15]), .B(n19), .C(n47), .Y(product[4]) );
  NAND2X1 U54 ( .A(out_neg[4]), .B(n2), .Y(n47) );
  OAI21X1 U55 ( .A(a[15]), .B(n20), .C(n48), .Y(product[3]) );
  NAND2X1 U56 ( .A(out_neg[3]), .B(n2), .Y(n48) );
  OAI21X1 U57 ( .A(a[15]), .B(n21), .C(n49), .Y(product[2]) );
  NAND2X1 U58 ( .A(out_neg[2]), .B(n1), .Y(n49) );
  OAI21X1 U59 ( .A(n2), .B(n22), .C(n50), .Y(product[1]) );
  NAND2X1 U60 ( .A(out_neg[1]), .B(n2), .Y(n50) );
  OAI21X1 U61 ( .A(a[15]), .B(n11), .C(n51), .Y(product[19]) );
  NAND2X1 U62 ( .A(out_neg[19]), .B(n2), .Y(n51) );
  OAI21X1 U63 ( .A(a[15]), .B(n10), .C(n52), .Y(product[18]) );
  NAND2X1 U64 ( .A(out_neg[18]), .B(n1), .Y(n52) );
  OAI21X1 U65 ( .A(a[15]), .B(n9), .C(n53), .Y(product[17]) );
  NAND2X1 U66 ( .A(out_neg[17]), .B(n2), .Y(n53) );
  OAI21X1 U67 ( .A(n2), .B(n8), .C(n54), .Y(product[16]) );
  NAND2X1 U68 ( .A(out_neg[16]), .B(n1), .Y(n54) );
  OAI21X1 U69 ( .A(a[15]), .B(n4), .C(n55), .Y(product[15]) );
  NAND2X1 U70 ( .A(out_neg[15]), .B(n2), .Y(n55) );
  OAI21X1 U71 ( .A(n2), .B(n5), .C(n56), .Y(product[14]) );
  NAND2X1 U72 ( .A(out_neg[14]), .B(n2), .Y(n56) );
  OAI21X1 U73 ( .A(n2), .B(n6), .C(n57), .Y(product[13]) );
  NAND2X1 U74 ( .A(out_neg[13]), .B(n1), .Y(n57) );
  OAI21X1 U75 ( .A(n2), .B(n7), .C(n58), .Y(product[12]) );
  NAND2X1 U76 ( .A(out_neg[12]), .B(n1), .Y(n58) );
  OAI21X1 U77 ( .A(n2), .B(n12), .C(n59), .Y(product[11]) );
  NAND2X1 U78 ( .A(out_neg[11]), .B(n1), .Y(n59) );
  OAI21X1 U79 ( .A(n2), .B(n13), .C(n60), .Y(product[10]) );
  NAND2X1 U80 ( .A(out_neg[10]), .B(n1), .Y(n60) );
  OAI21X1 U81 ( .A(n2), .B(n23), .C(n61), .Y(product[0]) );
  NAND2X1 U82 ( .A(out_neg[0]), .B(n2), .Y(n61) );
  NOR2X1 U83 ( .A(n62), .B(n39), .Y(ab3[9]) );
  NOR2X1 U84 ( .A(n63), .B(n39), .Y(ab3[8]) );
  NOR2X1 U85 ( .A(n64), .B(n39), .Y(ab3[7]) );
  NOR2X1 U86 ( .A(n65), .B(n39), .Y(ab3[6]) );
  NOR2X1 U87 ( .A(n66), .B(n39), .Y(ab3[5]) );
  NOR2X1 U88 ( .A(n67), .B(n39), .Y(ab3[4]) );
  NOR2X1 U89 ( .A(n68), .B(n39), .Y(ab3[3]) );
  NOR2X1 U90 ( .A(n69), .B(n39), .Y(ab3[17]) );
  NOR2X1 U91 ( .A(n70), .B(n39), .Y(ab3[16]) );
  NOR2X1 U92 ( .A(n71), .B(n39), .Y(ab3[15]) );
  NOR2X1 U93 ( .A(n72), .B(n39), .Y(ab3[14]) );
  NOR2X1 U94 ( .A(n73), .B(n39), .Y(ab3[13]) );
  NOR2X1 U95 ( .A(n74), .B(n39), .Y(ab3[12]) );
  NOR2X1 U96 ( .A(n75), .B(n39), .Y(ab3[11]) );
  NOR2X1 U97 ( .A(n76), .B(n39), .Y(ab3[10]) );
  NOR2X1 U98 ( .A(n76), .B(n40), .Y(ab2[9]) );
  NOR2X1 U99 ( .A(n62), .B(n40), .Y(ab2[8]) );
  NOR2X1 U100 ( .A(n63), .B(n40), .Y(ab2[7]) );
  NOR2X1 U101 ( .A(n64), .B(n40), .Y(ab2[6]) );
  NOR2X1 U102 ( .A(n65), .B(n40), .Y(ab2[5]) );
  NOR2X1 U103 ( .A(n66), .B(n40), .Y(ab2[4]) );
  NOR2X1 U104 ( .A(n67), .B(n40), .Y(ab2[3]) );
  NOR2X1 U105 ( .A(n68), .B(n40), .Y(ab2[2]) );
  NOR2X1 U106 ( .A(n69), .B(n40), .Y(ab2[16]) );
  NOR2X1 U107 ( .A(n70), .B(n40), .Y(ab2[15]) );
  NOR2X1 U108 ( .A(n71), .B(n40), .Y(ab2[14]) );
  NOR2X1 U109 ( .A(n72), .B(n40), .Y(ab2[13]) );
  NOR2X1 U110 ( .A(n73), .B(n40), .Y(ab2[12]) );
  NOR2X1 U111 ( .A(n74), .B(n40), .Y(ab2[11]) );
  NOR2X1 U112 ( .A(n75), .B(n40), .Y(ab2[10]) );
  NOR2X1 U113 ( .A(n75), .B(n93), .Y(ab1[9]) );
  NOR2X1 U114 ( .A(n76), .B(n93), .Y(ab1[8]) );
  NOR2X1 U115 ( .A(n62), .B(n93), .Y(ab1[7]) );
  NOR2X1 U116 ( .A(n63), .B(n93), .Y(ab1[6]) );
  NOR2X1 U117 ( .A(n64), .B(n93), .Y(ab1[5]) );
  NOR2X1 U118 ( .A(n65), .B(n93), .Y(ab1[4]) );
  NOR2X1 U119 ( .A(n66), .B(n93), .Y(ab1[3]) );
  NOR2X1 U120 ( .A(n67), .B(n93), .Y(ab1[2]) );
  NOR2X1 U121 ( .A(n68), .B(n93), .Y(ab1[1]) );
  NOR2X1 U122 ( .A(n69), .B(n93), .Y(ab1[15]) );
  NOR2X1 U123 ( .A(n70), .B(n93), .Y(ab1[14]) );
  NOR2X1 U124 ( .A(n71), .B(n93), .Y(ab1[13]) );
  NOR2X1 U125 ( .A(n72), .B(n93), .Y(ab1[12]) );
  NOR2X1 U126 ( .A(n73), .B(n93), .Y(ab1[11]) );
  NOR2X1 U127 ( .A(n74), .B(n93), .Y(ab1[10]) );
  NOR2X1 U128 ( .A(n74), .B(n94), .Y(ab0[9]) );
  AOI21X1 U129 ( .A(in_opp_sign[9]), .B(n1), .C(n77), .Y(n74) );
  OAI21X1 U130 ( .A(n2), .B(n29), .C(n78), .Y(n77) );
  NOR2X1 U131 ( .A(n75), .B(n94), .Y(ab0[8]) );
  AOI21X1 U132 ( .A(in_opp_sign[8]), .B(n2), .C(n79), .Y(n75) );
  OAI21X1 U133 ( .A(n2), .B(n30), .C(n78), .Y(n79) );
  NOR2X1 U134 ( .A(n76), .B(n94), .Y(ab0[7]) );
  AOI21X1 U135 ( .A(in_opp_sign[7]), .B(n1), .C(n80), .Y(n76) );
  OAI21X1 U136 ( .A(n2), .B(n31), .C(n78), .Y(n80) );
  NOR2X1 U137 ( .A(n62), .B(n94), .Y(ab0[6]) );
  AOI21X1 U138 ( .A(in_opp_sign[6]), .B(n1), .C(n81), .Y(n62) );
  OAI21X1 U139 ( .A(n2), .B(n32), .C(n78), .Y(n81) );
  NOR2X1 U140 ( .A(n63), .B(n94), .Y(ab0[5]) );
  AOI21X1 U141 ( .A(in_opp_sign[5]), .B(n1), .C(n82), .Y(n63) );
  OAI21X1 U142 ( .A(n2), .B(n33), .C(n78), .Y(n82) );
  NOR2X1 U143 ( .A(n64), .B(n94), .Y(ab0[4]) );
  AOI21X1 U144 ( .A(in_opp_sign[4]), .B(n1), .C(n83), .Y(n64) );
  OAI21X1 U145 ( .A(n1), .B(n34), .C(n78), .Y(n83) );
  NOR2X1 U146 ( .A(n65), .B(n94), .Y(ab0[3]) );
  AOI21X1 U147 ( .A(in_opp_sign[3]), .B(n1), .C(n84), .Y(n65) );
  OAI21X1 U148 ( .A(n1), .B(n35), .C(n78), .Y(n84) );
  NOR2X1 U149 ( .A(n66), .B(n94), .Y(ab0[2]) );
  AOI21X1 U150 ( .A(in_opp_sign[2]), .B(n1), .C(n85), .Y(n66) );
  OAI21X1 U151 ( .A(n2), .B(n36), .C(n78), .Y(n85) );
  NOR2X1 U152 ( .A(n67), .B(n94), .Y(ab0[1]) );
  AOI21X1 U153 ( .A(in_opp_sign[1]), .B(n1), .C(n86), .Y(n67) );
  OAI21X1 U154 ( .A(n1), .B(n37), .C(n78), .Y(n86) );
  NOR2X1 U156 ( .A(n69), .B(n94), .Y(ab0[14]) );
  AOI21X1 U157 ( .A(in_opp_sign[14]), .B(n1), .C(n87), .Y(n69) );
  OAI21X1 U158 ( .A(n2), .B(n24), .C(n78), .Y(n87) );
  NOR2X1 U159 ( .A(n70), .B(n94), .Y(ab0[13]) );
  AOI21X1 U160 ( .A(in_opp_sign[13]), .B(n1), .C(n88), .Y(n70) );
  OAI21X1 U161 ( .A(n2), .B(n25), .C(n78), .Y(n88) );
  NOR2X1 U162 ( .A(n71), .B(n94), .Y(ab0[12]) );
  AOI21X1 U163 ( .A(in_opp_sign[12]), .B(n1), .C(n89), .Y(n71) );
  OAI21X1 U164 ( .A(n1), .B(n26), .C(n78), .Y(n89) );
  NOR2X1 U165 ( .A(n72), .B(n94), .Y(ab0[11]) );
  AOI21X1 U166 ( .A(in_opp_sign[11]), .B(n1), .C(n90), .Y(n72) );
  OAI21X1 U167 ( .A(n1), .B(n27), .C(n78), .Y(n90) );
  NOR2X1 U168 ( .A(n73), .B(n94), .Y(ab0[10]) );
  AOI21X1 U169 ( .A(in_opp_sign[10]), .B(n1), .C(n91), .Y(n73) );
  OAI21X1 U170 ( .A(n2), .B(n28), .C(n78), .Y(n91) );
  NOR2X1 U171 ( .A(n68), .B(n94), .Y(ab0[0]) );
  AOI21X1 U172 ( .A(in_opp_sign[0]), .B(n1), .C(n92), .Y(n68) );
  OAI21X1 U173 ( .A(n1), .B(n38), .C(n78), .Y(n92) );
  NAND2X1 U174 ( .A(in_opp_sign[15]), .B(n1), .Y(n78) );
  cla_16bit_22 AOPS1 ( .a({n3, n24, n25, n26, n27, n28, n29, n30, n31, n32, 
        n33, n34, n35, n36, n37, n38}), .b({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .cin(
        1'b1), .sum(in_opp_sign) );
  cla_16bit_21 A1 ( .a({1'b0, ab0[14:0]}), .b({ab1, 1'b0}), .cin(1'b0), .cout(
        couts[0]), .sum({\sums[0][15] , \sums[0][14] , \sums[0][13] , 
        \sums[0][12] , \sums[0][11] , \sums[0][10] , \sums[0][9] , 
        \sums[0][8] , \sums[0][7] , \sums[0][6] , \sums[0][5] , \sums[0][4] , 
        \sums[0][3] , \sums[0][2] , \sums[0][1] , \sums[0][0] }) );
  adder_1bit_29 A1_1 ( .a(1'b0), .b(ab2[16]), .carry_in(couts[0]), .sum(
        \sums[0][16] ), .carry_out(\sums[0][17] ) );
  cla_16bit_20 A2 ( .a({\sums[0][15] , \sums[0][14] , \sums[0][13] , 
        \sums[0][12] , \sums[0][11] , \sums[0][10] , \sums[0][9] , 
        \sums[0][8] , \sums[0][7] , \sums[0][6] , \sums[0][5] , \sums[0][4] , 
        \sums[0][3] , \sums[0][2] , \sums[0][1] , \sums[0][0] }), .b({
        ab2[15:2], 1'b0, 1'b0}), .cin(1'b0), .cout(couts[1]), .sum({
        \sums[1][15] , \sums[1][14] , \sums[1][13] , \sums[1][12] , 
        \sums[1][11] , \sums[1][10] , \sums[1][9] , \sums[1][8] , \sums[1][7] , 
        \sums[1][6] , \sums[1][5] , \sums[1][4] , \sums[1][3] , \sums[1][2] , 
        \sums[1][1] , \sums[1][0] }) );
  adder_1bit_28 A2_1 ( .a(\sums[0][16] ), .b(ab2[16]), .carry_in(couts[1]), 
        .sum(\sums[1][16] ), .carry_out(couts[2]) );
  adder_1bit_27 A2_2 ( .a(\sums[0][17] ), .b(1'b0), .carry_in(couts[2]), .sum(
        \sums[1][17] ), .carry_out(\sums[1][18] ) );
  cla_16bit_19 A3 ( .a({\sums[1][15] , \sums[1][14] , \sums[1][13] , 
        \sums[1][12] , \sums[1][11] , \sums[1][10] , \sums[1][9] , 
        \sums[1][8] , \sums[1][7] , \sums[1][6] , \sums[1][5] , \sums[1][4] , 
        \sums[1][3] , \sums[1][2] , \sums[1][1] , \sums[1][0] }), .b({
        ab3[15:3], 1'b0, 1'b0, 1'b0}), .cin(1'b0), .cout(couts[3]), .sum({
        \sums[2][15] , \sums[2][14] , \sums[2][13] , \sums[2][12] , 
        \sums[2][11] , \sums[2][10] , \sums[2][9] , \sums[2][8] , \sums[2][7] , 
        \sums[2][6] , \sums[2][5] , \sums[2][4] , \sums[2][3] , \sums[2][2] , 
        \sums[2][1] , \sums[2][0] }) );
  adder_1bit_26 A3_1 ( .a(\sums[1][16] ), .b(ab3[16]), .carry_in(couts[3]), 
        .sum(\sums[2][16] ), .carry_out(couts[4]) );
  adder_1bit_25 A3_2 ( .a(\sums[1][17] ), .b(ab3[17]), .carry_in(couts[4]), 
        .sum(\sums[2][17] ), .carry_out(couts[5]) );
  adder_1bit_24 A3_3 ( .a(\sums[1][18] ), .b(1'b0), .carry_in(couts[5]), .sum(
        \sums[2][18] ), .carry_out(couts[6]) );
  cla_16bit_18 A4 ( .a({n4, n5, n6, n7, n12, n13, n14, n15, n16, n17, n18, n19, 
        n20, n21, n22, n23}), .b({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .cin(1'b1), 
        .cout(couts[7]), .sum(out_neg[15:0]) );
  cla_4bit_226 A5 ( .a({n11, n10, n9, n8}), .b({1'b0, 1'b0, 1'b0, 1'b0}), 
        .cin(couts[7]), .sum(out_neg[19:16]) );
  INVX2 U3 ( .A(n3), .Y(n1) );
  INVX2 U4 ( .A(n3), .Y(n2) );
  INVX2 U5 ( .A(a[15]), .Y(n3) );
  INVX2 U6 ( .A(b[1]), .Y(n93) );
  INVX2 U7 ( .A(b[0]), .Y(n94) );
  INVX2 U8 ( .A(b[2]), .Y(n40) );
  INVX2 U9 ( .A(b[3]), .Y(n39) );
  INVX2 U10 ( .A(\sums[2][15] ), .Y(n4) );
  INVX2 U11 ( .A(\sums[2][14] ), .Y(n5) );
  INVX2 U12 ( .A(\sums[2][13] ), .Y(n6) );
  INVX2 U13 ( .A(\sums[2][12] ), .Y(n7) );
  INVX2 U14 ( .A(\sums[2][16] ), .Y(n8) );
  INVX2 U15 ( .A(\sums[2][17] ), .Y(n9) );
  INVX2 U16 ( .A(\sums[2][18] ), .Y(n10) );
  INVX2 U17 ( .A(couts[6]), .Y(n11) );
  INVX2 U18 ( .A(\sums[2][11] ), .Y(n12) );
  INVX2 U19 ( .A(\sums[2][10] ), .Y(n13) );
  INVX2 U20 ( .A(\sums[2][9] ), .Y(n14) );
  INVX2 U21 ( .A(\sums[2][8] ), .Y(n15) );
  INVX2 U22 ( .A(\sums[2][7] ), .Y(n16) );
  INVX2 U23 ( .A(\sums[2][6] ), .Y(n17) );
  INVX2 U24 ( .A(\sums[2][5] ), .Y(n18) );
  INVX2 U25 ( .A(\sums[2][4] ), .Y(n19) );
  INVX2 U26 ( .A(\sums[2][3] ), .Y(n20) );
  INVX2 U27 ( .A(\sums[2][2] ), .Y(n21) );
  INVX2 U28 ( .A(\sums[2][1] ), .Y(n22) );
  INVX2 U29 ( .A(\sums[2][0] ), .Y(n23) );
  INVX2 U30 ( .A(a[14]), .Y(n24) );
  INVX2 U31 ( .A(a[13]), .Y(n25) );
  INVX2 U32 ( .A(a[12]), .Y(n26) );
  INVX2 U33 ( .A(a[11]), .Y(n27) );
  INVX2 U34 ( .A(a[10]), .Y(n28) );
  INVX2 U35 ( .A(a[9]), .Y(n29) );
  INVX2 U36 ( .A(a[8]), .Y(n30) );
  INVX2 U37 ( .A(a[7]), .Y(n31) );
  INVX2 U38 ( .A(a[6]), .Y(n32) );
  INVX2 U39 ( .A(a[5]), .Y(n33) );
  INVX2 U40 ( .A(a[4]), .Y(n34) );
  INVX2 U41 ( .A(a[3]), .Y(n35) );
  INVX2 U42 ( .A(a[2]), .Y(n36) );
  INVX2 U175 ( .A(a[1]), .Y(n37) );
  INVX2 U176 ( .A(a[0]), .Y(n38) );
endmodule


module volume_mult_0 ( channel_data, pot_data, output_data );
  input [15:0] channel_data;
  input [3:0] pot_data;
  output [15:0] output_data;

  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3;

  mult16by4_2 DUT ( .a(channel_data), .b(pot_data), .product({output_data, 
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3}) );
endmodule


module flex_buffer_NUM_BITS32_4 ( clk, n_rst, input_data, output_data );
  input [31:0] input_data;
  output [31:0] output_data;
  input clk, n_rst;
  wire   n33, n34, n35;

  DFFSR \output_data_reg[31]  ( .D(input_data[31]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[31]) );
  DFFSR \output_data_reg[30]  ( .D(input_data[30]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[30]) );
  DFFSR \output_data_reg[29]  ( .D(input_data[29]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[29]) );
  DFFSR \output_data_reg[28]  ( .D(input_data[28]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[28]) );
  DFFSR \output_data_reg[27]  ( .D(input_data[27]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[27]) );
  DFFSR \output_data_reg[26]  ( .D(input_data[26]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[26]) );
  DFFSR \output_data_reg[25]  ( .D(input_data[25]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[25]) );
  DFFSR \output_data_reg[24]  ( .D(input_data[24]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[24]) );
  DFFSR \output_data_reg[23]  ( .D(input_data[23]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[23]) );
  DFFSR \output_data_reg[22]  ( .D(input_data[22]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[22]) );
  DFFSR \output_data_reg[21]  ( .D(input_data[21]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[21]) );
  DFFSR \output_data_reg[20]  ( .D(input_data[20]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[20]) );
  DFFSR \output_data_reg[19]  ( .D(input_data[19]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[19]) );
  DFFSR \output_data_reg[18]  ( .D(input_data[18]), .CLK(n34), .R(n_rst), .S(
        1'b1), .Q(output_data[18]) );
  DFFSR \output_data_reg[17]  ( .D(input_data[17]), .CLK(n34), .R(n_rst), .S(
        1'b1), .Q(output_data[17]) );
  DFFSR \output_data_reg[16]  ( .D(input_data[16]), .CLK(n34), .R(n_rst), .S(
        1'b1), .Q(output_data[16]) );
  DFFSR \output_data_reg[15]  ( .D(input_data[15]), .CLK(n34), .R(n_rst), .S(
        1'b1), .Q(output_data[15]) );
  DFFSR \output_data_reg[14]  ( .D(input_data[14]), .CLK(n34), .R(n_rst), .S(
        1'b1), .Q(output_data[14]) );
  DFFSR \output_data_reg[13]  ( .D(input_data[13]), .CLK(n34), .R(n_rst), .S(
        1'b1), .Q(output_data[13]) );
  DFFSR \output_data_reg[12]  ( .D(input_data[12]), .CLK(n34), .R(n_rst), .S(
        1'b1), .Q(output_data[12]) );
  DFFSR \output_data_reg[11]  ( .D(input_data[11]), .CLK(n34), .R(n_rst), .S(
        1'b1), .Q(output_data[11]) );
  DFFSR \output_data_reg[10]  ( .D(input_data[10]), .CLK(n34), .R(n_rst), .S(
        1'b1), .Q(output_data[10]) );
  DFFSR \output_data_reg[9]  ( .D(input_data[9]), .CLK(n34), .R(n_rst), .S(
        1'b1), .Q(output_data[9]) );
  DFFSR \output_data_reg[8]  ( .D(input_data[8]), .CLK(n34), .R(n_rst), .S(
        1'b1), .Q(output_data[8]) );
  DFFSR \output_data_reg[7]  ( .D(input_data[7]), .CLK(n34), .R(n_rst), .S(
        1'b1), .Q(output_data[7]) );
  DFFSR \output_data_reg[6]  ( .D(input_data[6]), .CLK(n34), .R(n_rst), .S(
        1'b1), .Q(output_data[6]) );
  DFFSR \output_data_reg[5]  ( .D(input_data[5]), .CLK(n34), .R(n_rst), .S(
        1'b1), .Q(output_data[5]) );
  DFFSR \output_data_reg[4]  ( .D(input_data[4]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[4]) );
  DFFSR \output_data_reg[3]  ( .D(input_data[3]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[3]) );
  DFFSR \output_data_reg[2]  ( .D(input_data[2]), .CLK(n34), .R(n_rst), .S(
        1'b1), .Q(output_data[2]) );
  DFFSR \output_data_reg[1]  ( .D(input_data[1]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[1]) );
  DFFSR \output_data_reg[0]  ( .D(input_data[0]), .CLK(n34), .R(n_rst), .S(
        1'b1), .Q(output_data[0]) );
  INVX2 U35 ( .A(n35), .Y(n34) );
  INVX2 U36 ( .A(n35), .Y(n33) );
  INVX2 U37 ( .A(clk), .Y(n35) );
endmodule


module cla_4bit_71 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_70 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_69 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_68 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_16bit_17 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   cout, n2, n3, n4, n11, n12, n13, n14, n15, n16;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  NOR2X1 U5 ( .A(n16), .B(n15), .Y(pg) );
  NAND2X1 U6 ( .A(p[3]), .B(p[2]), .Y(n15) );
  NAND2X1 U7 ( .A(p[1]), .B(p[0]), .Y(n16) );
  AOI21X1 U8 ( .A(n2), .B(p[3]), .C(g[3]), .Y(n14) );
  AOI21X1 U9 ( .A(n3), .B(p[2]), .C(g[2]), .Y(n13) );
  AOI21X1 U10 ( .A(n4), .B(p[1]), .C(g[1]), .Y(n12) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n11) );
  cla_4bit_71 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_70 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n4), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_69 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n3), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_68 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n2), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  INVX2 U1 ( .A(n14), .Y(cout) );
  INVX2 U2 ( .A(n13), .Y(n2) );
  INVX2 U3 ( .A(n12), .Y(n3) );
  INVX2 U4 ( .A(n11), .Y(n4) );
endmodule


module cla_4bit_67 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_66 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_65 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_64 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_16bit_16 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   cout, n2, n3, n4, n11, n12, n13, n14, n15, n16;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  NOR2X1 U5 ( .A(n16), .B(n15), .Y(pg) );
  NAND2X1 U6 ( .A(p[3]), .B(p[2]), .Y(n15) );
  NAND2X1 U7 ( .A(p[1]), .B(p[0]), .Y(n16) );
  AOI21X1 U8 ( .A(n2), .B(p[3]), .C(g[3]), .Y(n14) );
  AOI21X1 U9 ( .A(n3), .B(p[2]), .C(g[2]), .Y(n13) );
  AOI21X1 U10 ( .A(n4), .B(p[1]), .C(g[1]), .Y(n12) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n11) );
  cla_4bit_67 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_66 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n4), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_65 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n3), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_64 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n2), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  INVX2 U1 ( .A(n14), .Y(cout) );
  INVX2 U2 ( .A(n13), .Y(n2) );
  INVX2 U3 ( .A(n12), .Y(n3) );
  INVX2 U4 ( .A(n11), .Y(n4) );
endmodule


module flanger_adder ( flanger_data, sram_data, output_data );
  input [31:0] flanger_data;
  input [31:0] sram_data;
  output [31:0] output_data;


  cla_16bit_17 ADD1 ( .a(flanger_data[15:0]), .b(sram_data[15:0]), .cin(1'b0), 
        .sum(output_data[15:0]) );
  cla_16bit_16 ADD2 ( .a(flanger_data[31:16]), .b(sram_data[31:16]), .cin(1'b0), .sum(output_data[31:16]) );
endmodule


module flanger ( clk, n_rst, flanger_en, shift_en, input_data, read_data, 
        output_data, sram_rw );
  input [31:0] input_data;
  input [31:0] read_data;
  output [31:0] output_data;
  input clk, n_rst, flanger_en, shift_en;
  output sram_rw;
  wire   curr_st, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n2, n3, n4, n5, n6, n7, n8, n9,
         n10, n76, n77;
  wire   [31:0] adder_data;

  DFFSR curr_st_reg ( .D(n76), .CLK(clk), .R(n_rst), .S(1'b1), .Q(curr_st) );
  NOR2X1 U39 ( .A(n77), .B(n3), .Y(sram_rw) );
  AOI22X1 U40 ( .A(adder_data[9]), .B(n4), .C(input_data[9]), .D(n3), .Y(n37)
         );
  AOI22X1 U41 ( .A(adder_data[8]), .B(n4), .C(input_data[8]), .D(n2), .Y(n38)
         );
  AOI22X1 U42 ( .A(adder_data[7]), .B(n4), .C(input_data[7]), .D(n3), .Y(n39)
         );
  AOI22X1 U43 ( .A(adder_data[6]), .B(n5), .C(input_data[6]), .D(n2), .Y(n40)
         );
  AOI22X1 U44 ( .A(adder_data[5]), .B(n5), .C(input_data[5]), .D(n3), .Y(n41)
         );
  AOI22X1 U45 ( .A(adder_data[4]), .B(n5), .C(input_data[4]), .D(n2), .Y(n42)
         );
  AOI22X1 U46 ( .A(adder_data[3]), .B(n6), .C(input_data[3]), .D(n3), .Y(n43)
         );
  AOI22X1 U47 ( .A(adder_data[31]), .B(n6), .C(input_data[31]), .D(n3), .Y(n44) );
  AOI22X1 U48 ( .A(adder_data[30]), .B(n6), .C(input_data[30]), .D(n3), .Y(n45) );
  AOI22X1 U49 ( .A(adder_data[2]), .B(n7), .C(input_data[2]), .D(n3), .Y(n46)
         );
  AOI22X1 U50 ( .A(adder_data[29]), .B(n7), .C(input_data[29]), .D(n3), .Y(n47) );
  AOI22X1 U51 ( .A(adder_data[28]), .B(n7), .C(input_data[28]), .D(n3), .Y(n48) );
  AOI22X1 U52 ( .A(adder_data[27]), .B(n7), .C(input_data[27]), .D(n3), .Y(n49) );
  AOI22X1 U53 ( .A(adder_data[26]), .B(n7), .C(input_data[26]), .D(n3), .Y(n50) );
  AOI22X1 U54 ( .A(adder_data[25]), .B(n7), .C(input_data[25]), .D(n3), .Y(n51) );
  AOI22X1 U55 ( .A(adder_data[24]), .B(n7), .C(input_data[24]), .D(n3), .Y(n52) );
  AOI22X1 U56 ( .A(adder_data[23]), .B(n8), .C(input_data[23]), .D(n3), .Y(n53) );
  AOI22X1 U57 ( .A(adder_data[22]), .B(n8), .C(input_data[22]), .D(n3), .Y(n54) );
  AOI22X1 U58 ( .A(adder_data[21]), .B(n8), .C(input_data[21]), .D(n3), .Y(n55) );
  AOI22X1 U59 ( .A(adder_data[20]), .B(n8), .C(input_data[20]), .D(n2), .Y(n56) );
  AOI22X1 U60 ( .A(adder_data[1]), .B(n8), .C(input_data[1]), .D(n2), .Y(n57)
         );
  AOI22X1 U61 ( .A(adder_data[19]), .B(n8), .C(input_data[19]), .D(n2), .Y(n58) );
  AOI22X1 U62 ( .A(adder_data[18]), .B(n8), .C(input_data[18]), .D(n2), .Y(n59) );
  AOI22X1 U63 ( .A(adder_data[17]), .B(n9), .C(input_data[17]), .D(n2), .Y(n60) );
  AOI22X1 U64 ( .A(adder_data[16]), .B(n9), .C(input_data[16]), .D(n2), .Y(n61) );
  AOI22X1 U65 ( .A(adder_data[15]), .B(n9), .C(input_data[15]), .D(n2), .Y(n62) );
  AOI22X1 U66 ( .A(adder_data[14]), .B(n9), .C(input_data[14]), .D(n2), .Y(n63) );
  AOI22X1 U67 ( .A(adder_data[13]), .B(n9), .C(input_data[13]), .D(n2), .Y(n64) );
  AOI22X1 U68 ( .A(adder_data[12]), .B(n9), .C(input_data[12]), .D(n2), .Y(n65) );
  AOI22X1 U69 ( .A(adder_data[11]), .B(n9), .C(input_data[11]), .D(n2), .Y(n66) );
  AOI22X1 U70 ( .A(adder_data[10]), .B(n10), .C(input_data[10]), .D(n2), .Y(
        n67) );
  AOI22X1 U71 ( .A(adder_data[0]), .B(n10), .C(input_data[0]), .D(n2), .Y(n68)
         );
  NAND3X1 U72 ( .A(n10), .B(n77), .C(shift_en), .Y(n69) );
  flanger_adder ADD ( .flanger_data(input_data), .sram_data(read_data), 
        .output_data(adder_data) );
  INVX2 U4 ( .A(n6), .Y(n2) );
  INVX2 U5 ( .A(n5), .Y(n3) );
  BUFX2 U6 ( .A(flanger_en), .Y(n5) );
  BUFX2 U7 ( .A(flanger_en), .Y(n4) );
  BUFX2 U8 ( .A(flanger_en), .Y(n6) );
  BUFX2 U9 ( .A(flanger_en), .Y(n9) );
  BUFX2 U10 ( .A(flanger_en), .Y(n8) );
  BUFX2 U11 ( .A(flanger_en), .Y(n7) );
  BUFX2 U12 ( .A(flanger_en), .Y(n10) );
  INVX2 U13 ( .A(n44), .Y(output_data[31]) );
  INVX2 U14 ( .A(n45), .Y(output_data[30]) );
  INVX2 U15 ( .A(n47), .Y(output_data[29]) );
  INVX2 U16 ( .A(n48), .Y(output_data[28]) );
  INVX2 U17 ( .A(n49), .Y(output_data[27]) );
  INVX2 U18 ( .A(n50), .Y(output_data[26]) );
  INVX2 U19 ( .A(n51), .Y(output_data[25]) );
  INVX2 U20 ( .A(n52), .Y(output_data[24]) );
  INVX2 U21 ( .A(n53), .Y(output_data[23]) );
  INVX2 U22 ( .A(n54), .Y(output_data[22]) );
  INVX2 U23 ( .A(n55), .Y(output_data[21]) );
  INVX2 U24 ( .A(n56), .Y(output_data[20]) );
  INVX2 U25 ( .A(n58), .Y(output_data[19]) );
  INVX2 U26 ( .A(n59), .Y(output_data[18]) );
  INVX2 U27 ( .A(n60), .Y(output_data[17]) );
  INVX2 U28 ( .A(n61), .Y(output_data[16]) );
  INVX2 U29 ( .A(n62), .Y(output_data[15]) );
  INVX2 U30 ( .A(n63), .Y(output_data[14]) );
  INVX2 U31 ( .A(n64), .Y(output_data[13]) );
  INVX2 U32 ( .A(n65), .Y(output_data[12]) );
  INVX2 U33 ( .A(n66), .Y(output_data[11]) );
  INVX2 U34 ( .A(n67), .Y(output_data[10]) );
  INVX2 U35 ( .A(n37), .Y(output_data[9]) );
  INVX2 U36 ( .A(n38), .Y(output_data[8]) );
  INVX2 U37 ( .A(n39), .Y(output_data[7]) );
  INVX2 U38 ( .A(n40), .Y(output_data[6]) );
  INVX2 U73 ( .A(n41), .Y(output_data[5]) );
  INVX2 U74 ( .A(n42), .Y(output_data[4]) );
  INVX2 U75 ( .A(n43), .Y(output_data[3]) );
  INVX2 U76 ( .A(n46), .Y(output_data[2]) );
  INVX2 U77 ( .A(n57), .Y(output_data[1]) );
  INVX2 U78 ( .A(n68), .Y(output_data[0]) );
  INVX2 U79 ( .A(n69), .Y(n76) );
  INVX2 U80 ( .A(curr_st), .Y(n77) );
endmodule


module sram_controller ( clk, n_rst, rw_trigger, mem_clr, mem_init, mem_dump, 
        write_data, sram_data );
  input [31:0] write_data;
  output [31:0] sram_data;
  input clk, n_rst, rw_trigger, mem_clr, mem_init, mem_dump;
  wire   n213, n247, n249, n251, n253, n255, n257, n259, n261, n263, n265,
         n267, n269, n271, n273, n305, n307, n309, n312, n335, n336, n337,
         n338, n339, n340, n341, n342, n343, n344, n345, n346, n347, n348,
         n349, n350, n352, n353, n354, n355, n356, n357, n358, n359, n360,
         n361, n362, n363, n364, n365, n366, n367, n368, n369, n370, n371,
         n372, n373, n374, n375, n376, n377, n378, n382, n383, n384, n385,
         n386, n387, n388, n389, n390, n391, n392, n393, n394, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169,
         n170, n171, n172, n173, n174, n175, n176, n177, n178, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n195, n196, n197, n198, n199, n200, n201, n202,
         n203, n204, n205, n206, n207, n208, n209, n210, n211, n275, n276,
         n277, n299, n300, n301, n303, n313, n314, n315, n316, n317, n318,
         n319, n320, n321, n322, n323, n324, n325, n326, n327, n328, n329,
         n330, n331, n332, n333, n351, n379, n380, n381, n395, n396, n397,
         n398, n399, n400, n401, n402, n403, n404, n405, n406, n409, n410,
         n411, n412, n413, n414, n415, n416, n417, n418, n419, n420, n421,
         n422, n423, n424;
  wire   [2:0] curr_st;
  wire   [15:0] r_addr;
  wire   [15:0] w_addr;
  tri   mem_clr;
  tri   mem_init;
  tri   mem_dump;
  tri   r_en;
  tri   w_en;
  tri   [15:0] address;
  tri   [15:0] read_data_half;
  tri   [15:0] write_data_half;
  tri   n407;
  tri   n408;

  OR2X2 C1564 ( .A(n11), .B(n405), .Y(w_en) );
  OR2X2 C1560 ( .A(n404), .B(n403), .Y(r_en) );
  DFFSR \address_reg[0]  ( .D(n312), .CLK(clk), .R(n23), .S(1'b1), .Q(
        address[0]) );
  DFFSR \w_addr_reg[15]  ( .D(n368), .CLK(clk), .R(n23), .S(1'b1), .Q(
        w_addr[15]) );
  DFFSR \curr_st_reg[2]  ( .D(n309), .CLK(clk), .R(n23), .S(1'b1), .Q(
        curr_st[2]) );
  DFFSR \curr_st_reg[0]  ( .D(n307), .CLK(clk), .R(n23), .S(1'b1), .Q(
        curr_st[0]) );
  DFFSR \curr_st_reg[1]  ( .D(n305), .CLK(clk), .R(n23), .S(1'b1), .Q(
        curr_st[1]) );
  DFFSR \r_addr_reg[15]  ( .D(n383), .CLK(clk), .R(n23), .S(1'b1), .Q(
        r_addr[15]) );
  DFFSR \r_addr_reg[4]  ( .D(n394), .CLK(clk), .R(1'b1), .S(n29), .Q(r_addr[4]) );
  DFFSR \r_addr_reg[5]  ( .D(n393), .CLK(clk), .R(n23), .S(1'b1), .Q(r_addr[5]) );
  DFFSR \r_addr_reg[6]  ( .D(n392), .CLK(clk), .R(n23), .S(1'b1), .Q(r_addr[6]) );
  DFFSR \r_addr_reg[7]  ( .D(n391), .CLK(clk), .R(n24), .S(1'b1), .Q(r_addr[7]) );
  DFFSR \r_addr_reg[8]  ( .D(n390), .CLK(clk), .R(n24), .S(1'b1), .Q(r_addr[8]) );
  DFFSR \r_addr_reg[9]  ( .D(n389), .CLK(clk), .R(n24), .S(1'b1), .Q(r_addr[9]) );
  DFFSR \r_addr_reg[10]  ( .D(n388), .CLK(clk), .R(n24), .S(1'b1), .Q(
        r_addr[10]) );
  DFFSR \r_addr_reg[11]  ( .D(n387), .CLK(clk), .R(n24), .S(1'b1), .Q(
        r_addr[11]) );
  DFFSR \r_addr_reg[12]  ( .D(n386), .CLK(clk), .R(n24), .S(1'b1), .Q(
        r_addr[12]) );
  DFFSR \r_addr_reg[13]  ( .D(n385), .CLK(clk), .R(n24), .S(1'b1), .Q(
        r_addr[13]) );
  DFFSR \r_addr_reg[14]  ( .D(n384), .CLK(clk), .R(n24), .S(1'b1), .Q(
        r_addr[14]) );
  DFFSR \w_addr_reg[13]  ( .D(n369), .CLK(clk), .R(n24), .S(1'b1), .Q(
        w_addr[13]) );
  DFFSR \w_addr_reg[12]  ( .D(n370), .CLK(clk), .R(n24), .S(1'b1), .Q(
        w_addr[12]) );
  DFFSR \w_addr_reg[11]  ( .D(n371), .CLK(clk), .R(n24), .S(1'b1), .Q(
        w_addr[11]) );
  DFFSR \w_addr_reg[10]  ( .D(n372), .CLK(clk), .R(n24), .S(1'b1), .Q(
        w_addr[10]) );
  DFFSR \w_addr_reg[9]  ( .D(n373), .CLK(clk), .R(n25), .S(1'b1), .Q(w_addr[9]) );
  DFFSR \w_addr_reg[8]  ( .D(n374), .CLK(clk), .R(n25), .S(1'b1), .Q(w_addr[8]) );
  DFFSR \w_addr_reg[7]  ( .D(n375), .CLK(clk), .R(n25), .S(1'b1), .Q(w_addr[7]) );
  DFFSR \w_addr_reg[6]  ( .D(n376), .CLK(clk), .R(n25), .S(1'b1), .Q(w_addr[6]) );
  DFFSR \w_addr_reg[5]  ( .D(n377), .CLK(clk), .R(n25), .S(1'b1), .Q(w_addr[5]) );
  DFFSR \w_addr_reg[4]  ( .D(n378), .CLK(clk), .R(n25), .S(1'b1), .Q(w_addr[4]) );
  DFFSR \w_addr_reg[14]  ( .D(n382), .CLK(clk), .R(n25), .S(1'b1), .Q(
        w_addr[14]) );
  DFFSR \address_reg[1]  ( .D(n273), .CLK(clk), .R(n29), .S(1'b1), .Q(
        address[1]) );
  DFFSR \address_reg[2]  ( .D(n271), .CLK(clk), .R(n29), .S(1'b1), .Q(
        address[2]) );
  DFFSR \address_reg[3]  ( .D(n269), .CLK(clk), .R(n29), .S(1'b1), .Q(
        address[3]) );
  DFFSR \address_reg[4]  ( .D(n267), .CLK(clk), .R(n29), .S(1'b1), .Q(
        address[4]) );
  DFFSR \address_reg[5]  ( .D(n265), .CLK(clk), .R(n29), .S(1'b1), .Q(
        address[5]) );
  DFFSR \address_reg[6]  ( .D(n263), .CLK(clk), .R(n29), .S(1'b1), .Q(
        address[6]) );
  DFFSR \address_reg[7]  ( .D(n261), .CLK(clk), .R(n29), .S(1'b1), .Q(
        address[7]) );
  DFFSR \address_reg[8]  ( .D(n259), .CLK(clk), .R(n29), .S(1'b1), .Q(
        address[8]) );
  DFFSR \address_reg[9]  ( .D(n257), .CLK(clk), .R(n29), .S(1'b1), .Q(
        address[9]) );
  DFFSR \address_reg[10]  ( .D(n255), .CLK(clk), .R(n29), .S(1'b1), .Q(
        address[10]) );
  DFFSR \address_reg[11]  ( .D(n253), .CLK(clk), .R(n28), .S(1'b1), .Q(
        address[11]) );
  DFFSR \address_reg[12]  ( .D(n251), .CLK(clk), .R(n28), .S(1'b1), .Q(
        address[12]) );
  DFFSR \address_reg[13]  ( .D(n249), .CLK(clk), .R(n28), .S(1'b1), .Q(
        address[13]) );
  DFFSR \address_reg[14]  ( .D(n247), .CLK(clk), .R(n28), .S(1'b1), .Q(
        address[14]) );
  DFFSR \read_data_reg[15]  ( .D(n424), .CLK(clk), .R(n25), .S(1'b1), .Q(
        sram_data[15]) );
  DFFSR \read_data_reg[14]  ( .D(n423), .CLK(clk), .R(n25), .S(1'b1), .Q(
        sram_data[14]) );
  DFFSR \read_data_reg[13]  ( .D(n422), .CLK(clk), .R(n26), .S(1'b1), .Q(
        sram_data[13]) );
  DFFSR \read_data_reg[12]  ( .D(n421), .CLK(clk), .R(n26), .S(1'b1), .Q(
        sram_data[12]) );
  DFFSR \read_data_reg[11]  ( .D(n420), .CLK(clk), .R(n26), .S(1'b1), .Q(
        sram_data[11]) );
  DFFSR \read_data_reg[10]  ( .D(n419), .CLK(clk), .R(n26), .S(1'b1), .Q(
        sram_data[10]) );
  DFFSR \read_data_reg[9]  ( .D(n418), .CLK(clk), .R(n26), .S(1'b1), .Q(
        sram_data[9]) );
  DFFSR \read_data_reg[8]  ( .D(n417), .CLK(clk), .R(n26), .S(1'b1), .Q(
        sram_data[8]) );
  DFFSR \read_data_reg[7]  ( .D(n416), .CLK(clk), .R(n26), .S(1'b1), .Q(
        sram_data[7]) );
  DFFSR \read_data_reg[6]  ( .D(n415), .CLK(clk), .R(n26), .S(1'b1), .Q(
        sram_data[6]) );
  DFFSR \read_data_reg[5]  ( .D(n414), .CLK(clk), .R(n26), .S(1'b1), .Q(
        sram_data[5]) );
  DFFSR \read_data_reg[4]  ( .D(n413), .CLK(clk), .R(n26), .S(1'b1), .Q(
        sram_data[4]) );
  DFFSR \read_data_reg[3]  ( .D(n412), .CLK(clk), .R(n26), .S(1'b1), .Q(
        sram_data[3]) );
  DFFSR \read_data_reg[2]  ( .D(n411), .CLK(clk), .R(n27), .S(1'b1), .Q(
        sram_data[2]) );
  DFFSR \read_data_reg[1]  ( .D(n410), .CLK(clk), .R(n27), .S(1'b1), .Q(
        sram_data[1]) );
  DFFSR \read_data_reg[0]  ( .D(n409), .CLK(clk), .R(n27), .S(1'b1), .Q(
        sram_data[0]) );
  DFFSR \read_data_reg[16]  ( .D(n367), .CLK(clk), .R(n27), .S(1'b1), .Q(
        sram_data[16]) );
  DFFSR \read_data_reg[17]  ( .D(n366), .CLK(clk), .R(n27), .S(1'b1), .Q(
        sram_data[17]) );
  DFFSR \read_data_reg[18]  ( .D(n365), .CLK(clk), .R(n27), .S(1'b1), .Q(
        sram_data[18]) );
  DFFSR \read_data_reg[19]  ( .D(n364), .CLK(clk), .R(n27), .S(1'b1), .Q(
        sram_data[19]) );
  DFFSR \read_data_reg[20]  ( .D(n363), .CLK(clk), .R(n27), .S(1'b1), .Q(
        sram_data[20]) );
  DFFSR \read_data_reg[21]  ( .D(n362), .CLK(clk), .R(n27), .S(1'b1), .Q(
        sram_data[21]) );
  DFFSR \read_data_reg[22]  ( .D(n361), .CLK(clk), .R(n27), .S(1'b1), .Q(
        sram_data[22]) );
  DFFSR \read_data_reg[23]  ( .D(n360), .CLK(clk), .R(n27), .S(1'b1), .Q(
        sram_data[23]) );
  DFFSR \read_data_reg[24]  ( .D(n359), .CLK(clk), .R(n27), .S(1'b1), .Q(
        sram_data[24]) );
  DFFSR \read_data_reg[25]  ( .D(n358), .CLK(clk), .R(n28), .S(1'b1), .Q(
        sram_data[25]) );
  DFFSR \read_data_reg[26]  ( .D(n357), .CLK(clk), .R(n28), .S(1'b1), .Q(
        sram_data[26]) );
  DFFSR \read_data_reg[27]  ( .D(n356), .CLK(clk), .R(n28), .S(1'b1), .Q(
        sram_data[27]) );
  DFFSR \read_data_reg[28]  ( .D(n355), .CLK(clk), .R(n28), .S(1'b1), .Q(
        sram_data[28]) );
  DFFSR \read_data_reg[29]  ( .D(n354), .CLK(clk), .R(n28), .S(1'b1), .Q(
        sram_data[29]) );
  DFFSR \read_data_reg[30]  ( .D(n353), .CLK(clk), .R(n28), .S(1'b1), .Q(
        sram_data[30]) );
  DFFSR \read_data_reg[31]  ( .D(n352), .CLK(clk), .R(n28), .S(1'b1), .Q(
        sram_data[31]) );
  DFFSR \address_reg[15]  ( .D(n213), .CLK(clk), .R(n28), .S(1'b1), .Q(
        address[15]) );
  OAI21X1 U398 ( .A(n406), .B(1'b1), .C(n335), .Y(write_data_half[15]) );
  OAI21X1 U399 ( .A(n406), .B(1'b1), .C(n336), .Y(write_data_half[14]) );
  OAI21X1 U400 ( .A(n406), .B(1'b1), .C(n337), .Y(write_data_half[13]) );
  OAI21X1 U401 ( .A(n406), .B(1'b1), .C(n338), .Y(write_data_half[12]) );
  OAI21X1 U402 ( .A(n406), .B(1'b1), .C(n339), .Y(write_data_half[11]) );
  OAI21X1 U403 ( .A(n406), .B(1'b1), .C(n340), .Y(write_data_half[10]) );
  OAI21X1 U404 ( .A(n406), .B(1'b1), .C(n341), .Y(write_data_half[9]) );
  OAI21X1 U405 ( .A(n406), .B(1'b1), .C(n342), .Y(write_data_half[8]) );
  OAI21X1 U406 ( .A(n406), .B(1'b1), .C(n343), .Y(write_data_half[7]) );
  OAI21X1 U407 ( .A(n406), .B(1'b1), .C(n344), .Y(write_data_half[6]) );
  OAI21X1 U408 ( .A(n406), .B(1'b1), .C(n345), .Y(write_data_half[5]) );
  OAI21X1 U409 ( .A(n406), .B(1'b1), .C(n346), .Y(write_data_half[4]) );
  OAI21X1 U410 ( .A(n406), .B(1'b1), .C(n347), .Y(write_data_half[3]) );
  OAI21X1 U411 ( .A(n406), .B(1'b1), .C(n348), .Y(write_data_half[2]) );
  OAI21X1 U412 ( .A(n406), .B(1'b1), .C(n349), .Y(write_data_half[1]) );
  OAI21X1 U413 ( .A(n406), .B(1'b1), .C(n350), .Y(write_data_half[0]) );
  on_chip_sram_wrapper SRAM ( .init_file_number({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0}), .dump_file_number({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0}), .mem_clr(mem_clr), .mem_init(mem_init), .mem_dump(
        mem_dump), .verbose(1'b0), .start_address({1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .last_address({1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b0, 1'b1, 1'b1, 1'b1, 1'b0, 
        1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0}), .read_enable(r_en), 
        .write_enable(w_en), .address(address), .read_data(read_data_half), 
        .write_data(write_data_half) );
  INVX2 U3 ( .A(n32), .Y(n33) );
  INVX2 U4 ( .A(n42), .Y(n45) );
  INVX2 U5 ( .A(r_addr[5]), .Y(n43) );
  INVX2 U6 ( .A(r_addr[15]), .Y(n42) );
  INVX2 U7 ( .A(w_addr[15]), .Y(n30) );
  AND2X2 U9 ( .A(n101), .B(n90), .Y(n2) );
  NAND2X1 U10 ( .A(n148), .B(n147), .Y(n3) );
  INVX1 U11 ( .A(n144), .Y(n98) );
  AND2X1 U12 ( .A(r_addr[4]), .B(n8), .Y(n13) );
  AND2X2 U13 ( .A(n404), .B(n315), .Y(n4) );
  INVX2 U14 ( .A(n3), .Y(n22) );
  AND2X2 U15 ( .A(n9), .B(n90), .Y(n5) );
  INVX4 U16 ( .A(n19), .Y(n20) );
  INVX2 U17 ( .A(n130), .Y(n19) );
  INVX4 U18 ( .A(n2), .Y(n18) );
  AND2X2 U19 ( .A(n10), .B(n8), .Y(n6) );
  INVX2 U20 ( .A(n3), .Y(n21) );
  AND2X2 U21 ( .A(n22), .B(n317), .Y(n7) );
  AND2X2 U22 ( .A(n100), .B(n99), .Y(n8) );
  AND2X2 U23 ( .A(n89), .B(n14), .Y(n9) );
  AND2X2 U24 ( .A(n131), .B(n16), .Y(n10) );
  AND2X2 U25 ( .A(n406), .B(n316), .Y(n11) );
  AND2X2 U26 ( .A(n22), .B(curr_st[2]), .Y(n12) );
  AND2X2 U27 ( .A(w_addr[11]), .B(w_addr[12]), .Y(n14) );
  AND2X2 U28 ( .A(w_addr[7]), .B(w_addr[8]), .Y(n15) );
  AND2X2 U29 ( .A(r_addr[12]), .B(r_addr[11]), .Y(n16) );
  XNOR2X1 U30 ( .A(curr_st[1]), .B(n50), .Y(n305) );
  BUFX2 U31 ( .A(n_rst), .Y(n27) );
  BUFX2 U32 ( .A(n_rst), .Y(n28) );
  BUFX2 U33 ( .A(n_rst), .Y(n24) );
  BUFX2 U34 ( .A(n_rst), .Y(n26) );
  BUFX2 U35 ( .A(n_rst), .Y(n29) );
  BUFX2 U36 ( .A(n_rst), .Y(n25) );
  BUFX2 U37 ( .A(n_rst), .Y(n23) );
  INVX4 U38 ( .A(n141), .Y(n406) );
  INVX4 U39 ( .A(n142), .Y(n405) );
  INVX4 U40 ( .A(n150), .Y(n315) );
  INVX4 U41 ( .A(n151), .Y(n182) );
  INVX4 U42 ( .A(n186), .Y(n303) );
  INVX2 U43 ( .A(curr_st[1]), .Y(n316) );
  INVX2 U44 ( .A(curr_st[2]), .Y(n317) );
  NAND2X1 U45 ( .A(n316), .B(n317), .Y(n144) );
  INVX2 U46 ( .A(w_addr[10]), .Y(n78) );
  INVX2 U47 ( .A(w_addr[13]), .Y(n31) );
  NAND3X1 U48 ( .A(n78), .B(n31), .C(n30), .Y(n34) );
  NOR2X1 U49 ( .A(w_addr[5]), .B(w_addr[6]), .Y(n32) );
  OR2X2 U50 ( .A(n34), .B(n33), .Y(n55) );
  INVX2 U51 ( .A(w_addr[14]), .Y(n17) );
  NAND3X1 U52 ( .A(w_addr[7]), .B(w_addr[4]), .C(n17), .Y(n36) );
  NAND3X1 U53 ( .A(w_addr[9]), .B(w_addr[8]), .C(n14), .Y(n35) );
  OR2X2 U54 ( .A(n36), .B(n35), .Y(n48) );
  INVX2 U55 ( .A(r_addr[13]), .Y(n37) );
  INVX2 U56 ( .A(r_addr[14]), .Y(n136) );
  NAND3X1 U57 ( .A(n37), .B(n136), .C(n16), .Y(n41) );
  INVX2 U58 ( .A(r_addr[8]), .Y(n111) );
  INVX2 U59 ( .A(r_addr[9]), .Y(n38) );
  NOR2X1 U60 ( .A(n111), .B(n38), .Y(n39) );
  NAND3X1 U61 ( .A(r_addr[7]), .B(r_addr[4]), .C(n39), .Y(n40) );
  NOR2X1 U62 ( .A(n41), .B(n40), .Y(n47) );
  INVX2 U63 ( .A(r_addr[6]), .Y(n105) );
  INVX2 U64 ( .A(r_addr[10]), .Y(n119) );
  NAND3X1 U65 ( .A(n105), .B(n119), .C(n43), .Y(n44) );
  NOR2X1 U66 ( .A(n45), .B(n44), .Y(n46) );
  NAND2X1 U67 ( .A(n47), .B(n46), .Y(n52) );
  OAI21X1 U68 ( .A(n55), .B(n48), .C(n52), .Y(n143) );
  INVX2 U69 ( .A(n143), .Y(n101) );
  OAI21X1 U70 ( .A(rw_trigger), .B(n144), .C(n101), .Y(n49) );
  MUX2X1 U71 ( .B(n49), .A(n101), .S(curr_st[0]), .Y(n307) );
  NAND2X1 U72 ( .A(curr_st[0]), .B(n101), .Y(n50) );
  NOR2X1 U73 ( .A(n316), .B(n50), .Y(n51) );
  XOR2X1 U74 ( .A(curr_st[2]), .B(n51), .Y(n309) );
  INVX2 U75 ( .A(n52), .Y(n58) );
  NAND2X1 U76 ( .A(curr_st[0]), .B(curr_st[2]), .Y(n141) );
  NAND3X1 U77 ( .A(w_addr[4]), .B(n52), .C(n17), .Y(n54) );
  NAND3X1 U78 ( .A(n14), .B(w_addr[9]), .C(n15), .Y(n53) );
  NOR2X1 U79 ( .A(n54), .B(n53), .Y(n57) );
  INVX2 U80 ( .A(n55), .Y(n56) );
  NAND2X1 U81 ( .A(n57), .B(n56), .Y(n99) );
  OAI21X1 U82 ( .A(n58), .B(n141), .C(n99), .Y(n90) );
  MUX2X1 U83 ( .B(n18), .A(n90), .S(w_addr[4]), .Y(n378) );
  NAND2X1 U84 ( .A(n2), .B(w_addr[4]), .Y(n60) );
  NAND2X1 U85 ( .A(w_addr[4]), .B(n90), .Y(n63) );
  INVX2 U86 ( .A(n63), .Y(n59) );
  MUX2X1 U87 ( .B(n60), .A(n59), .S(w_addr[5]), .Y(n377) );
  INVX2 U88 ( .A(w_addr[4]), .Y(n61) );
  NOR2X1 U89 ( .A(w_addr[6]), .B(n61), .Y(n62) );
  MUX2X1 U90 ( .B(w_addr[6]), .A(n62), .S(w_addr[5]), .Y(n65) );
  NAND2X1 U91 ( .A(w_addr[6]), .B(n63), .Y(n64) );
  OAI21X1 U92 ( .A(n18), .B(n65), .C(n64), .Y(n376) );
  NAND3X1 U93 ( .A(w_addr[6]), .B(w_addr[5]), .C(w_addr[4]), .Y(n68) );
  INVX2 U94 ( .A(n68), .Y(n73) );
  NAND2X1 U95 ( .A(n2), .B(n73), .Y(n67) );
  OAI21X1 U96 ( .A(n73), .B(n18), .C(n90), .Y(n70) );
  INVX2 U97 ( .A(n70), .Y(n66) );
  MUX2X1 U98 ( .B(n67), .A(n66), .S(w_addr[7]), .Y(n375) );
  NOR2X1 U99 ( .A(w_addr[8]), .B(n68), .Y(n69) );
  MUX2X1 U100 ( .B(w_addr[8]), .A(n69), .S(w_addr[7]), .Y(n72) );
  NAND2X1 U101 ( .A(w_addr[8]), .B(n70), .Y(n71) );
  OAI21X1 U102 ( .A(n18), .B(n72), .C(n71), .Y(n374) );
  NAND2X1 U103 ( .A(n73), .B(n15), .Y(n76) );
  INVX2 U104 ( .A(n76), .Y(n81) );
  NAND2X1 U105 ( .A(n2), .B(n81), .Y(n75) );
  OAI21X1 U106 ( .A(n81), .B(n18), .C(n90), .Y(n74) );
  INVX2 U107 ( .A(n74), .Y(n79) );
  MUX2X1 U108 ( .B(n75), .A(n79), .S(w_addr[9]), .Y(n373) );
  NOR2X1 U109 ( .A(w_addr[10]), .B(n76), .Y(n77) );
  MUX2X1 U110 ( .B(w_addr[10]), .A(n77), .S(w_addr[9]), .Y(n80) );
  OAI22X1 U111 ( .A(n80), .B(n18), .C(n79), .D(n78), .Y(n372) );
  NAND3X1 U112 ( .A(w_addr[10]), .B(w_addr[9]), .C(n81), .Y(n84) );
  INVX2 U113 ( .A(n84), .Y(n89) );
  NAND2X1 U114 ( .A(n2), .B(n89), .Y(n83) );
  OAI21X1 U115 ( .A(n89), .B(n18), .C(n90), .Y(n86) );
  INVX2 U116 ( .A(n86), .Y(n82) );
  MUX2X1 U117 ( .B(n83), .A(n82), .S(w_addr[11]), .Y(n371) );
  NOR2X1 U118 ( .A(w_addr[12]), .B(n84), .Y(n85) );
  MUX2X1 U119 ( .B(w_addr[12]), .A(n85), .S(w_addr[11]), .Y(n88) );
  NAND2X1 U120 ( .A(w_addr[12]), .B(n86), .Y(n87) );
  OAI21X1 U121 ( .A(n18), .B(n88), .C(n87), .Y(n370) );
  NAND2X1 U122 ( .A(n2), .B(n9), .Y(n91) );
  MUX2X1 U123 ( .B(n91), .A(n5), .S(w_addr[13]), .Y(n369) );
  NAND3X1 U124 ( .A(n9), .B(w_addr[13]), .C(n2), .Y(n93) );
  NAND2X1 U125 ( .A(w_addr[13]), .B(n5), .Y(n95) );
  INVX2 U126 ( .A(n95), .Y(n92) );
  MUX2X1 U127 ( .B(n93), .A(n92), .S(w_addr[14]), .Y(n382) );
  INVX2 U128 ( .A(n93), .Y(n94) );
  NAND2X1 U129 ( .A(n94), .B(w_addr[14]), .Y(n97) );
  NOR2X1 U130 ( .A(n95), .B(n17), .Y(n96) );
  MUX2X1 U131 ( .B(n97), .A(n96), .S(w_addr[15]), .Y(n368) );
  OAI21X1 U132 ( .A(n317), .B(n316), .C(n145), .Y(n140) );
  OAI21X1 U133 ( .A(n98), .B(n140), .C(n101), .Y(n100) );
  NAND2X1 U134 ( .A(n101), .B(n8), .Y(n130) );
  MUX2X1 U135 ( .B(n20), .A(n8), .S(r_addr[4]), .Y(n394) );
  NAND2X1 U136 ( .A(n19), .B(r_addr[4]), .Y(n102) );
  MUX2X1 U137 ( .B(n102), .A(n13), .S(r_addr[5]), .Y(n393) );
  INVX2 U138 ( .A(r_addr[4]), .Y(n103) );
  NOR2X1 U139 ( .A(r_addr[6]), .B(n103), .Y(n104) );
  MUX2X1 U140 ( .B(r_addr[6]), .A(n104), .S(r_addr[5]), .Y(n106) );
  OAI22X1 U141 ( .A(n106), .B(n20), .C(n13), .D(n105), .Y(n392) );
  NAND3X1 U142 ( .A(r_addr[5]), .B(r_addr[4]), .C(r_addr[6]), .Y(n109) );
  INVX2 U143 ( .A(n109), .Y(n114) );
  NAND2X1 U144 ( .A(n19), .B(n114), .Y(n108) );
  OAI21X1 U145 ( .A(n114), .B(n20), .C(n8), .Y(n107) );
  INVX2 U146 ( .A(n107), .Y(n112) );
  MUX2X1 U147 ( .B(n108), .A(n112), .S(r_addr[7]), .Y(n391) );
  NOR2X1 U148 ( .A(r_addr[8]), .B(n109), .Y(n110) );
  MUX2X1 U149 ( .B(r_addr[8]), .A(n110), .S(r_addr[7]), .Y(n113) );
  OAI22X1 U150 ( .A(n113), .B(n20), .C(n112), .D(n111), .Y(n390) );
  NAND3X1 U151 ( .A(r_addr[8]), .B(r_addr[7]), .C(n114), .Y(n117) );
  INVX2 U152 ( .A(n117), .Y(n122) );
  NAND2X1 U153 ( .A(n19), .B(n122), .Y(n116) );
  OAI21X1 U154 ( .A(n122), .B(n20), .C(n8), .Y(n115) );
  INVX2 U155 ( .A(n115), .Y(n120) );
  MUX2X1 U156 ( .B(n116), .A(n120), .S(r_addr[9]), .Y(n389) );
  NOR2X1 U157 ( .A(r_addr[10]), .B(n117), .Y(n118) );
  MUX2X1 U158 ( .B(r_addr[10]), .A(n118), .S(r_addr[9]), .Y(n121) );
  OAI22X1 U159 ( .A(n121), .B(n20), .C(n120), .D(n119), .Y(n388) );
  NAND3X1 U160 ( .A(r_addr[10]), .B(r_addr[9]), .C(n122), .Y(n125) );
  INVX2 U161 ( .A(n125), .Y(n131) );
  NAND2X1 U162 ( .A(n19), .B(n131), .Y(n124) );
  OAI21X1 U163 ( .A(n131), .B(n20), .C(n8), .Y(n127) );
  INVX2 U164 ( .A(n127), .Y(n123) );
  MUX2X1 U165 ( .B(n124), .A(n123), .S(r_addr[11]), .Y(n387) );
  NOR2X1 U166 ( .A(r_addr[12]), .B(n125), .Y(n126) );
  MUX2X1 U167 ( .B(r_addr[12]), .A(n126), .S(r_addr[11]), .Y(n129) );
  NAND2X1 U168 ( .A(r_addr[12]), .B(n127), .Y(n128) );
  OAI21X1 U169 ( .A(n20), .B(n129), .C(n128), .Y(n386) );
  NAND2X1 U170 ( .A(n19), .B(n10), .Y(n132) );
  MUX2X1 U171 ( .B(n132), .A(n6), .S(r_addr[13]), .Y(n385) );
  NAND3X1 U172 ( .A(n10), .B(r_addr[13]), .C(n19), .Y(n134) );
  NAND2X1 U173 ( .A(r_addr[13]), .B(n6), .Y(n137) );
  INVX2 U174 ( .A(n137), .Y(n133) );
  MUX2X1 U175 ( .B(n134), .A(n133), .S(r_addr[14]), .Y(n384) );
  INVX2 U176 ( .A(n134), .Y(n135) );
  NAND2X1 U177 ( .A(n135), .B(r_addr[14]), .Y(n139) );
  NOR2X1 U178 ( .A(n137), .B(n136), .Y(n138) );
  MUX2X1 U179 ( .B(n139), .A(n138), .S(r_addr[15]), .Y(n383) );
  INVX2 U180 ( .A(sram_data[0]), .Y(n153) );
  INVX2 U181 ( .A(read_data_half[0]), .Y(n152) );
  INVX2 U182 ( .A(n140), .Y(n149) );
  NAND2X1 U183 ( .A(curr_st[1]), .B(n406), .Y(n142) );
  NOR2X1 U184 ( .A(n405), .B(n143), .Y(n148) );
  INVX2 U185 ( .A(n144), .Y(n146) );
  INVX2 U186 ( .A(curr_st[0]), .Y(n145) );
  NAND2X1 U187 ( .A(n146), .B(n145), .Y(n147) );
  NAND2X1 U188 ( .A(n149), .B(n22), .Y(n150) );
  NAND3X1 U189 ( .A(curr_st[1]), .B(n145), .C(n317), .Y(n187) );
  NAND2X1 U190 ( .A(n315), .B(n187), .Y(n151) );
  MUX2X1 U191 ( .B(n153), .A(n152), .S(n182), .Y(n409) );
  INVX2 U192 ( .A(sram_data[1]), .Y(n155) );
  INVX2 U193 ( .A(read_data_half[1]), .Y(n154) );
  MUX2X1 U194 ( .B(n155), .A(n154), .S(n182), .Y(n410) );
  INVX2 U195 ( .A(sram_data[2]), .Y(n157) );
  INVX2 U196 ( .A(read_data_half[2]), .Y(n156) );
  MUX2X1 U197 ( .B(n157), .A(n156), .S(n182), .Y(n411) );
  INVX2 U198 ( .A(sram_data[3]), .Y(n159) );
  INVX2 U199 ( .A(read_data_half[3]), .Y(n158) );
  MUX2X1 U200 ( .B(n159), .A(n158), .S(n182), .Y(n412) );
  INVX2 U201 ( .A(sram_data[4]), .Y(n161) );
  INVX2 U202 ( .A(read_data_half[4]), .Y(n160) );
  MUX2X1 U203 ( .B(n161), .A(n160), .S(n182), .Y(n413) );
  INVX2 U204 ( .A(sram_data[5]), .Y(n163) );
  INVX2 U205 ( .A(read_data_half[5]), .Y(n162) );
  MUX2X1 U206 ( .B(n163), .A(n162), .S(n182), .Y(n414) );
  INVX2 U207 ( .A(sram_data[6]), .Y(n165) );
  INVX2 U208 ( .A(read_data_half[6]), .Y(n164) );
  MUX2X1 U209 ( .B(n165), .A(n164), .S(n182), .Y(n415) );
  INVX2 U210 ( .A(sram_data[7]), .Y(n167) );
  INVX2 U211 ( .A(read_data_half[7]), .Y(n166) );
  MUX2X1 U212 ( .B(n167), .A(n166), .S(n182), .Y(n416) );
  INVX2 U213 ( .A(sram_data[8]), .Y(n169) );
  INVX2 U214 ( .A(read_data_half[8]), .Y(n168) );
  MUX2X1 U215 ( .B(n169), .A(n168), .S(n182), .Y(n417) );
  INVX2 U216 ( .A(sram_data[9]), .Y(n171) );
  INVX2 U217 ( .A(read_data_half[9]), .Y(n170) );
  MUX2X1 U218 ( .B(n171), .A(n170), .S(n182), .Y(n418) );
  INVX2 U219 ( .A(sram_data[10]), .Y(n173) );
  INVX2 U220 ( .A(read_data_half[10]), .Y(n172) );
  MUX2X1 U221 ( .B(n173), .A(n172), .S(n182), .Y(n419) );
  INVX2 U222 ( .A(sram_data[11]), .Y(n175) );
  INVX2 U223 ( .A(read_data_half[11]), .Y(n174) );
  MUX2X1 U224 ( .B(n175), .A(n174), .S(n182), .Y(n420) );
  INVX2 U225 ( .A(sram_data[12]), .Y(n177) );
  INVX2 U226 ( .A(read_data_half[12]), .Y(n176) );
  MUX2X1 U227 ( .B(n177), .A(n176), .S(n182), .Y(n421) );
  INVX2 U228 ( .A(sram_data[13]), .Y(n179) );
  INVX2 U229 ( .A(read_data_half[13]), .Y(n178) );
  MUX2X1 U230 ( .B(n179), .A(n178), .S(n182), .Y(n422) );
  INVX2 U231 ( .A(sram_data[14]), .Y(n181) );
  INVX2 U232 ( .A(read_data_half[14]), .Y(n180) );
  MUX2X1 U233 ( .B(n181), .A(n180), .S(n182), .Y(n423) );
  INVX2 U234 ( .A(sram_data[15]), .Y(n184) );
  INVX2 U235 ( .A(read_data_half[15]), .Y(n183) );
  MUX2X1 U236 ( .B(n184), .A(n183), .S(n182), .Y(n424) );
  INVX2 U237 ( .A(sram_data[16]), .Y(n189) );
  NAND3X1 U238 ( .A(curr_st[2]), .B(n316), .C(n145), .Y(n185) );
  INVX2 U239 ( .A(n185), .Y(n403) );
  NAND2X1 U240 ( .A(n403), .B(n315), .Y(n186) );
  INVX2 U241 ( .A(n187), .Y(n404) );
  AOI22X1 U242 ( .A(sram_data[0]), .B(n303), .C(read_data_half[0]), .D(n4), 
        .Y(n188) );
  OAI21X1 U243 ( .A(n315), .B(n189), .C(n188), .Y(n367) );
  INVX2 U244 ( .A(sram_data[17]), .Y(n191) );
  AOI22X1 U245 ( .A(sram_data[1]), .B(n303), .C(read_data_half[1]), .D(n4), 
        .Y(n190) );
  OAI21X1 U246 ( .A(n315), .B(n191), .C(n190), .Y(n366) );
  INVX2 U247 ( .A(sram_data[18]), .Y(n193) );
  AOI22X1 U248 ( .A(sram_data[2]), .B(n303), .C(read_data_half[2]), .D(n4), 
        .Y(n192) );
  OAI21X1 U249 ( .A(n315), .B(n193), .C(n192), .Y(n365) );
  INVX2 U250 ( .A(sram_data[19]), .Y(n195) );
  AOI22X1 U251 ( .A(sram_data[3]), .B(n303), .C(read_data_half[3]), .D(n4), 
        .Y(n194) );
  OAI21X1 U252 ( .A(n315), .B(n195), .C(n194), .Y(n364) );
  INVX2 U253 ( .A(sram_data[20]), .Y(n197) );
  AOI22X1 U254 ( .A(sram_data[4]), .B(n303), .C(read_data_half[4]), .D(n4), 
        .Y(n196) );
  OAI21X1 U255 ( .A(n315), .B(n197), .C(n196), .Y(n363) );
  INVX2 U256 ( .A(sram_data[21]), .Y(n199) );
  AOI22X1 U257 ( .A(sram_data[5]), .B(n303), .C(read_data_half[5]), .D(n4), 
        .Y(n198) );
  OAI21X1 U258 ( .A(n315), .B(n199), .C(n198), .Y(n362) );
  INVX2 U259 ( .A(sram_data[22]), .Y(n201) );
  AOI22X1 U260 ( .A(sram_data[6]), .B(n303), .C(read_data_half[6]), .D(n4), 
        .Y(n200) );
  OAI21X1 U261 ( .A(n315), .B(n201), .C(n200), .Y(n361) );
  INVX2 U262 ( .A(sram_data[23]), .Y(n203) );
  AOI22X1 U263 ( .A(sram_data[7]), .B(n303), .C(read_data_half[7]), .D(n4), 
        .Y(n202) );
  OAI21X1 U264 ( .A(n315), .B(n203), .C(n202), .Y(n360) );
  INVX2 U265 ( .A(sram_data[24]), .Y(n205) );
  AOI22X1 U266 ( .A(sram_data[8]), .B(n303), .C(read_data_half[8]), .D(n4), 
        .Y(n204) );
  OAI21X1 U267 ( .A(n315), .B(n205), .C(n204), .Y(n359) );
  INVX2 U268 ( .A(sram_data[25]), .Y(n207) );
  AOI22X1 U269 ( .A(sram_data[9]), .B(n303), .C(read_data_half[9]), .D(n4), 
        .Y(n206) );
  OAI21X1 U270 ( .A(n315), .B(n207), .C(n206), .Y(n358) );
  INVX2 U271 ( .A(sram_data[26]), .Y(n209) );
  AOI22X1 U272 ( .A(sram_data[10]), .B(n303), .C(read_data_half[10]), .D(n4), 
        .Y(n208) );
  OAI21X1 U273 ( .A(n315), .B(n209), .C(n208), .Y(n357) );
  INVX2 U274 ( .A(sram_data[27]), .Y(n211) );
  AOI22X1 U275 ( .A(sram_data[11]), .B(n303), .C(read_data_half[11]), .D(n4), 
        .Y(n210) );
  OAI21X1 U276 ( .A(n315), .B(n211), .C(n210), .Y(n356) );
  INVX2 U277 ( .A(sram_data[28]), .Y(n276) );
  AOI22X1 U278 ( .A(sram_data[12]), .B(n303), .C(read_data_half[12]), .D(n4), 
        .Y(n275) );
  OAI21X1 U279 ( .A(n315), .B(n276), .C(n275), .Y(n355) );
  INVX2 U280 ( .A(sram_data[29]), .Y(n299) );
  AOI22X1 U281 ( .A(sram_data[13]), .B(n303), .C(read_data_half[13]), .D(n4), 
        .Y(n277) );
  OAI21X1 U282 ( .A(n315), .B(n299), .C(n277), .Y(n354) );
  INVX2 U283 ( .A(sram_data[30]), .Y(n301) );
  AOI22X1 U284 ( .A(sram_data[14]), .B(n303), .C(read_data_half[14]), .D(n4), 
        .Y(n300) );
  OAI21X1 U285 ( .A(n315), .B(n301), .C(n300), .Y(n353) );
  INVX2 U286 ( .A(sram_data[31]), .Y(n314) );
  AOI22X1 U287 ( .A(sram_data[15]), .B(n303), .C(read_data_half[15]), .D(n4), 
        .Y(n313) );
  OAI21X1 U288 ( .A(n315), .B(n314), .C(n313), .Y(n352) );
  AOI22X1 U289 ( .A(write_data[0]), .B(n405), .C(write_data[16]), .D(n11), .Y(
        n350) );
  AOI22X1 U290 ( .A(write_data[1]), .B(n405), .C(write_data[17]), .D(n11), .Y(
        n349) );
  AOI22X1 U291 ( .A(write_data[2]), .B(n405), .C(write_data[18]), .D(n11), .Y(
        n348) );
  AOI22X1 U292 ( .A(write_data[3]), .B(n405), .C(write_data[19]), .D(n11), .Y(
        n347) );
  AOI22X1 U293 ( .A(write_data[4]), .B(n405), .C(write_data[20]), .D(n11), .Y(
        n346) );
  AOI22X1 U294 ( .A(write_data[5]), .B(n405), .C(write_data[21]), .D(n11), .Y(
        n345) );
  AOI22X1 U295 ( .A(write_data[6]), .B(n405), .C(write_data[22]), .D(n11), .Y(
        n344) );
  AOI22X1 U296 ( .A(write_data[7]), .B(n405), .C(write_data[23]), .D(n11), .Y(
        n343) );
  AOI22X1 U297 ( .A(write_data[8]), .B(n405), .C(write_data[24]), .D(n11), .Y(
        n342) );
  AOI22X1 U298 ( .A(write_data[9]), .B(n405), .C(write_data[25]), .D(n11), .Y(
        n341) );
  AOI22X1 U299 ( .A(write_data[10]), .B(n405), .C(write_data[26]), .D(n11), 
        .Y(n340) );
  AOI22X1 U300 ( .A(write_data[11]), .B(n405), .C(write_data[27]), .D(n11), 
        .Y(n339) );
  AOI22X1 U301 ( .A(write_data[12]), .B(n405), .C(write_data[28]), .D(n11), 
        .Y(n338) );
  AOI22X1 U302 ( .A(write_data[13]), .B(n405), .C(write_data[29]), .D(n11), 
        .Y(n337) );
  AOI22X1 U303 ( .A(write_data[14]), .B(n405), .C(write_data[30]), .D(n11), 
        .Y(n336) );
  AOI22X1 U304 ( .A(write_data[15]), .B(n405), .C(write_data[31]), .D(n11), 
        .Y(n335) );
  INVX2 U305 ( .A(address[15]), .Y(n319) );
  AOI22X1 U306 ( .A(r_addr[15]), .B(n7), .C(w_addr[15]), .D(n12), .Y(n318) );
  OAI21X1 U307 ( .A(n21), .B(n319), .C(n318), .Y(n213) );
  INVX2 U308 ( .A(address[14]), .Y(n321) );
  AOI22X1 U309 ( .A(r_addr[14]), .B(n7), .C(w_addr[14]), .D(n12), .Y(n320) );
  OAI21X1 U310 ( .A(n21), .B(n321), .C(n320), .Y(n247) );
  INVX2 U311 ( .A(address[13]), .Y(n323) );
  AOI22X1 U312 ( .A(r_addr[13]), .B(n7), .C(w_addr[13]), .D(n12), .Y(n322) );
  OAI21X1 U313 ( .A(n21), .B(n323), .C(n322), .Y(n249) );
  INVX2 U362 ( .A(address[12]), .Y(n325) );
  AOI22X1 U363 ( .A(n7), .B(r_addr[12]), .C(n12), .D(w_addr[12]), .Y(n324) );
  OAI21X1 U364 ( .A(n21), .B(n325), .C(n324), .Y(n251) );
  INVX2 U386 ( .A(address[11]), .Y(n327) );
  AOI22X1 U387 ( .A(n7), .B(r_addr[11]), .C(n12), .D(w_addr[11]), .Y(n326) );
  OAI21X1 U388 ( .A(n21), .B(n327), .C(n326), .Y(n253) );
  INVX2 U390 ( .A(address[10]), .Y(n329) );
  AOI22X1 U396 ( .A(r_addr[10]), .B(n7), .C(w_addr[10]), .D(n12), .Y(n328) );
  OAI21X1 U414 ( .A(n21), .B(n329), .C(n328), .Y(n255) );
  INVX2 U415 ( .A(address[9]), .Y(n331) );
  AOI22X1 U416 ( .A(n7), .B(r_addr[9]), .C(n12), .D(w_addr[9]), .Y(n330) );
  OAI21X1 U417 ( .A(n21), .B(n331), .C(n330), .Y(n257) );
  INVX2 U418 ( .A(address[8]), .Y(n333) );
  AOI22X1 U419 ( .A(n7), .B(r_addr[8]), .C(n12), .D(w_addr[8]), .Y(n332) );
  OAI21X1 U420 ( .A(n21), .B(n333), .C(n332), .Y(n259) );
  INVX2 U421 ( .A(address[7]), .Y(n379) );
  AOI22X1 U422 ( .A(n7), .B(r_addr[7]), .C(n12), .D(w_addr[7]), .Y(n351) );
  OAI21X1 U423 ( .A(n21), .B(n379), .C(n351), .Y(n261) );
  INVX2 U424 ( .A(address[6]), .Y(n381) );
  AOI22X1 U425 ( .A(r_addr[6]), .B(n7), .C(w_addr[6]), .D(n12), .Y(n380) );
  OAI21X1 U426 ( .A(n22), .B(n381), .C(n380), .Y(n263) );
  INVX2 U427 ( .A(address[5]), .Y(n396) );
  AOI22X1 U428 ( .A(r_addr[5]), .B(n7), .C(w_addr[5]), .D(n12), .Y(n395) );
  OAI21X1 U429 ( .A(n22), .B(n396), .C(n395), .Y(n265) );
  INVX2 U430 ( .A(address[4]), .Y(n398) );
  AOI22X1 U431 ( .A(n7), .B(r_addr[4]), .C(n12), .D(w_addr[4]), .Y(n397) );
  OAI21X1 U432 ( .A(n22), .B(n398), .C(n397), .Y(n267) );
  INVX2 U433 ( .A(address[3]), .Y(n399) );
  OAI21X1 U434 ( .A(n22), .B(n399), .C(1'b1), .Y(n269) );
  INVX2 U435 ( .A(address[2]), .Y(n400) );
  OAI21X1 U436 ( .A(n22), .B(n400), .C(1'b1), .Y(n271) );
  INVX2 U437 ( .A(address[1]), .Y(n401) );
  OAI21X1 U438 ( .A(n22), .B(n401), .C(1'b1), .Y(n273) );
  INVX2 U439 ( .A(address[0]), .Y(n402) );
  OAI21X1 U440 ( .A(n22), .B(n402), .C(1'b1), .Y(n312) );
endmodule


module flex_buffer_NUM_BITS32_3 ( clk, n_rst, input_data, output_data );
  input [31:0] input_data;
  output [31:0] output_data;
  input clk, n_rst;
  wire   n33, n34;

  DFFSR \output_data_reg[31]  ( .D(input_data[31]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[31]) );
  DFFSR \output_data_reg[30]  ( .D(input_data[30]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[30]) );
  DFFSR \output_data_reg[29]  ( .D(input_data[29]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[29]) );
  DFFSR \output_data_reg[28]  ( .D(input_data[28]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[28]) );
  DFFSR \output_data_reg[27]  ( .D(input_data[27]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[27]) );
  DFFSR \output_data_reg[26]  ( .D(input_data[26]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[26]) );
  DFFSR \output_data_reg[25]  ( .D(input_data[25]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[25]) );
  DFFSR \output_data_reg[24]  ( .D(input_data[24]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[24]) );
  DFFSR \output_data_reg[23]  ( .D(input_data[23]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[23]) );
  DFFSR \output_data_reg[22]  ( .D(input_data[22]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[22]) );
  DFFSR \output_data_reg[21]  ( .D(input_data[21]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[21]) );
  DFFSR \output_data_reg[20]  ( .D(input_data[20]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[20]) );
  DFFSR \output_data_reg[19]  ( .D(input_data[19]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[19]) );
  DFFSR \output_data_reg[18]  ( .D(input_data[18]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[18]) );
  DFFSR \output_data_reg[17]  ( .D(input_data[17]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[17]) );
  DFFSR \output_data_reg[16]  ( .D(input_data[16]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[16]) );
  DFFSR \output_data_reg[15]  ( .D(input_data[15]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[15]) );
  DFFSR \output_data_reg[14]  ( .D(input_data[14]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[14]) );
  DFFSR \output_data_reg[13]  ( .D(input_data[13]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[13]) );
  DFFSR \output_data_reg[12]  ( .D(input_data[12]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[12]) );
  DFFSR \output_data_reg[11]  ( .D(input_data[11]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[11]) );
  DFFSR \output_data_reg[10]  ( .D(input_data[10]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[10]) );
  DFFSR \output_data_reg[9]  ( .D(input_data[9]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[9]) );
  DFFSR \output_data_reg[8]  ( .D(input_data[8]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[8]) );
  DFFSR \output_data_reg[7]  ( .D(input_data[7]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[7]) );
  DFFSR \output_data_reg[6]  ( .D(input_data[6]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[6]) );
  DFFSR \output_data_reg[5]  ( .D(input_data[5]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[5]) );
  DFFSR \output_data_reg[4]  ( .D(input_data[4]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[4]) );
  DFFSR \output_data_reg[3]  ( .D(input_data[3]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[3]) );
  DFFSR \output_data_reg[2]  ( .D(input_data[2]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[2]) );
  DFFSR \output_data_reg[1]  ( .D(input_data[1]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[1]) );
  DFFSR \output_data_reg[0]  ( .D(input_data[0]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[0]) );
  INVX2 U35 ( .A(n34), .Y(n33) );
  INVX2 U36 ( .A(clk), .Y(n34) );
endmodule


module cla_4bit_225 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_224 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_223 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_222 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_16bit_55 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n5, n6, n7, n8, n9, n10, cout, n2, n3, n4;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  NOR2X1 U5 ( .A(n5), .B(n6), .Y(pg) );
  NAND2X1 U6 ( .A(p[3]), .B(p[2]), .Y(n6) );
  NAND2X1 U7 ( .A(p[1]), .B(p[0]), .Y(n5) );
  AOI21X1 U8 ( .A(n2), .B(p[3]), .C(g[3]), .Y(n7) );
  AOI21X1 U9 ( .A(n3), .B(p[2]), .C(g[2]), .Y(n8) );
  AOI21X1 U10 ( .A(n4), .B(p[1]), .C(g[1]), .Y(n9) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n10) );
  cla_4bit_225 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_224 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n4), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_223 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n3), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_222 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n2), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  INVX2 U1 ( .A(n7), .Y(cout) );
  INVX2 U2 ( .A(n8), .Y(n2) );
  INVX2 U3 ( .A(n9), .Y(n3) );
  INVX2 U4 ( .A(n10), .Y(n4) );
endmodule


module cla_4bit_221 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_220 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_219 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_218 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_16bit_54 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   cout, n2, n3, n4, n11, n12, n13, n14, n15, n16;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  NOR2X1 U5 ( .A(n16), .B(n15), .Y(pg) );
  NAND2X1 U6 ( .A(p[3]), .B(p[2]), .Y(n15) );
  NAND2X1 U7 ( .A(p[1]), .B(p[0]), .Y(n16) );
  AOI21X1 U8 ( .A(n2), .B(p[3]), .C(g[3]), .Y(n14) );
  AOI21X1 U9 ( .A(n3), .B(p[2]), .C(g[2]), .Y(n13) );
  AOI21X1 U10 ( .A(n4), .B(p[1]), .C(g[1]), .Y(n12) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n11) );
  cla_4bit_221 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_220 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n4), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_219 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n3), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_218 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n2), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  INVX2 U1 ( .A(n14), .Y(cout) );
  INVX2 U2 ( .A(n13), .Y(n2) );
  INVX2 U3 ( .A(n12), .Y(n3) );
  INVX2 U4 ( .A(n11), .Y(n4) );
endmodule


module cla_4bit_217 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_216 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_215 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_214 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n4), .B(n5), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n4), .B(n5), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n4), .B(n5), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(b[3]), .Y(n4) );
  INVX2 U10 ( .A(a[3]), .Y(n5) );
endmodule


module cla_16bit_53 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   cout, n2, n3, n4, n11, n12, n13, n14, n15, n16;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  NOR2X1 U5 ( .A(n16), .B(n15), .Y(pg) );
  NAND2X1 U6 ( .A(p[3]), .B(p[2]), .Y(n15) );
  NAND2X1 U7 ( .A(p[1]), .B(p[0]), .Y(n16) );
  AOI21X1 U8 ( .A(n2), .B(p[3]), .C(g[3]), .Y(n14) );
  AOI21X1 U9 ( .A(n3), .B(p[2]), .C(g[2]), .Y(n13) );
  AOI21X1 U10 ( .A(n4), .B(p[1]), .C(g[1]), .Y(n12) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n11) );
  cla_4bit_217 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_216 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n4), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_215 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n3), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_214 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n2), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  INVX2 U1 ( .A(n14), .Y(cout) );
  INVX2 U2 ( .A(n13), .Y(n2) );
  INVX2 U3 ( .A(n12), .Y(n3) );
  INVX2 U4 ( .A(n11), .Y(n4) );
endmodule


module cla_4bit_213 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_212 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_211 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_210 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n4), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n4), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n4), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(a[3]), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_16bit_52 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   cout, n2, n3, n4, n11, n12, n13, n14, n15, n16;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  NOR2X1 U5 ( .A(n16), .B(n15), .Y(pg) );
  NAND2X1 U6 ( .A(p[3]), .B(p[2]), .Y(n15) );
  NAND2X1 U7 ( .A(p[1]), .B(p[0]), .Y(n16) );
  AOI21X1 U8 ( .A(n2), .B(p[3]), .C(g[3]), .Y(n14) );
  AOI21X1 U9 ( .A(n3), .B(p[2]), .C(g[2]), .Y(n13) );
  AOI21X1 U10 ( .A(n4), .B(p[1]), .C(g[1]), .Y(n12) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n11) );
  cla_4bit_213 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_212 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n4), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_211 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n3), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_210 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n2), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  INVX2 U1 ( .A(n14), .Y(cout) );
  INVX2 U2 ( .A(n13), .Y(n2) );
  INVX2 U3 ( .A(n12), .Y(n3) );
  INVX2 U4 ( .A(n11), .Y(n4) );
endmodule


module amp_clip_1 ( inchan, comp_in, outchan );
  input [15:0] inchan;
  input [3:0] comp_in;
  output [15:0] outchan;
  wire   n23, n24, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n25, n26, n44;
  wire   [15:0] neg_comp_out;
  wire   [15:0] pos_comp_out;
  wire   [15:0] neg_clipped;
  wire   [15:0] pos_clipped;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1;

  OAI21X1 U26 ( .A(n4), .B(n12), .C(n24), .Y(outchan[9]) );
  AOI22X1 U27 ( .A(neg_clipped[9]), .B(n2), .C(pos_clipped[9]), .D(n5), .Y(n24) );
  OAI21X1 U28 ( .A(n4), .B(n13), .C(n27), .Y(outchan[8]) );
  AOI22X1 U29 ( .A(neg_clipped[8]), .B(n2), .C(pos_clipped[8]), .D(n5), .Y(n27) );
  OAI21X1 U30 ( .A(n4), .B(n14), .C(n28), .Y(outchan[7]) );
  AOI22X1 U31 ( .A(neg_clipped[7]), .B(n2), .C(pos_clipped[7]), .D(n5), .Y(n28) );
  OAI21X1 U32 ( .A(n4), .B(n15), .C(n29), .Y(outchan[6]) );
  AOI22X1 U33 ( .A(neg_clipped[6]), .B(n2), .C(pos_clipped[6]), .D(n5), .Y(n29) );
  OAI21X1 U34 ( .A(n4), .B(n16), .C(n30), .Y(outchan[5]) );
  AOI22X1 U35 ( .A(neg_clipped[5]), .B(n2), .C(pos_clipped[5]), .D(n5), .Y(n30) );
  OAI21X1 U36 ( .A(n4), .B(n17), .C(n31), .Y(outchan[4]) );
  AOI22X1 U37 ( .A(neg_clipped[4]), .B(n2), .C(pos_clipped[4]), .D(n5), .Y(n31) );
  OAI21X1 U38 ( .A(n4), .B(n18), .C(n32), .Y(outchan[3]) );
  AOI22X1 U39 ( .A(neg_clipped[3]), .B(n2), .C(pos_clipped[3]), .D(n5), .Y(n32) );
  OAI21X1 U40 ( .A(n4), .B(n19), .C(n33), .Y(outchan[2]) );
  AOI22X1 U41 ( .A(neg_clipped[2]), .B(n2), .C(pos_clipped[2]), .D(n5), .Y(n33) );
  OAI21X1 U42 ( .A(n23), .B(n20), .C(n34), .Y(outchan[1]) );
  AOI22X1 U43 ( .A(neg_clipped[1]), .B(n2), .C(pos_clipped[1]), .D(n5), .Y(n34) );
  OAI21X1 U44 ( .A(n1), .B(n6), .C(n35), .Y(outchan[15]) );
  OAI21X1 U45 ( .A(n3), .B(neg_clipped[15]), .C(inchan[15]), .Y(n35) );
  OAI21X1 U46 ( .A(n23), .B(n7), .C(n36), .Y(outchan[14]) );
  AOI22X1 U47 ( .A(neg_clipped[14]), .B(n2), .C(pos_clipped[14]), .D(n5), .Y(
        n36) );
  OAI21X1 U48 ( .A(n23), .B(n8), .C(n37), .Y(outchan[13]) );
  AOI22X1 U49 ( .A(neg_clipped[13]), .B(n2), .C(pos_clipped[13]), .D(n5), .Y(
        n37) );
  OAI21X1 U50 ( .A(n23), .B(n9), .C(n38), .Y(outchan[12]) );
  AOI22X1 U51 ( .A(neg_clipped[12]), .B(n2), .C(pos_clipped[12]), .D(n5), .Y(
        n38) );
  OAI21X1 U52 ( .A(n23), .B(n10), .C(n39), .Y(outchan[11]) );
  AOI22X1 U53 ( .A(neg_clipped[11]), .B(n2), .C(pos_clipped[11]), .D(n5), .Y(
        n39) );
  OAI21X1 U54 ( .A(n23), .B(n11), .C(n40), .Y(outchan[10]) );
  AOI22X1 U55 ( .A(neg_clipped[10]), .B(n2), .C(pos_clipped[10]), .D(n5), .Y(
        n40) );
  OAI21X1 U56 ( .A(n23), .B(n21), .C(n41), .Y(outchan[0]) );
  AOI22X1 U57 ( .A(neg_clipped[0]), .B(n2), .C(pos_clipped[0]), .D(n5), .Y(n41) );
  OAI21X1 U59 ( .A(pos_comp_out[15]), .B(inchan[15]), .C(n42), .Y(n23) );
  NAND2X1 U60 ( .A(neg_comp_out[15]), .B(inchan[15]), .Y(n42) );
  cla_16bit_55 A1 ( .a(inchan), .b({1'b1, n22, n25, n26, n44, 1'b1, 1'b1, 1'b1, 
        1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1}), .cin(1'b1), .sum({
        pos_comp_out[15:1], SYNOPSYS_UNCONNECTED__0}) );
  cla_16bit_54 A2 ( .a(inchan), .b({1'b0, comp_in, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .cin(1'b0), .sum({
        neg_comp_out[15:1], SYNOPSYS_UNCONNECTED__1}) );
  cla_16bit_53 A3 ( .a({1'b0, 1'b0, pos_comp_out[14:1]}), .b({1'b0, comp_in, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), 
        .cin(1'b0), .sum(pos_clipped) );
  cla_16bit_52 A4 ( .a({1'b1, 1'b1, neg_comp_out[14:1]}), .b({1'b1, n22, n25, 
        n26, n44, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 
        1'b1}), .cin(1'b1), .sum(neg_clipped) );
  OR2X2 U3 ( .A(n3), .B(inchan[15]), .Y(n1) );
  AND2X2 U4 ( .A(inchan[15]), .B(n4), .Y(n2) );
  INVX2 U5 ( .A(n3), .Y(n4) );
  INVX2 U6 ( .A(n23), .Y(n3) );
  INVX2 U7 ( .A(n1), .Y(n5) );
  INVX2 U8 ( .A(pos_clipped[15]), .Y(n6) );
  INVX2 U9 ( .A(inchan[14]), .Y(n7) );
  INVX2 U10 ( .A(inchan[13]), .Y(n8) );
  INVX2 U11 ( .A(inchan[12]), .Y(n9) );
  INVX2 U12 ( .A(inchan[11]), .Y(n10) );
  INVX2 U13 ( .A(inchan[10]), .Y(n11) );
  INVX2 U14 ( .A(inchan[9]), .Y(n12) );
  INVX2 U15 ( .A(inchan[8]), .Y(n13) );
  INVX2 U16 ( .A(inchan[7]), .Y(n14) );
  INVX2 U17 ( .A(inchan[6]), .Y(n15) );
  INVX2 U18 ( .A(inchan[5]), .Y(n16) );
  INVX2 U19 ( .A(inchan[4]), .Y(n17) );
  INVX2 U20 ( .A(inchan[3]), .Y(n18) );
  INVX2 U21 ( .A(inchan[2]), .Y(n19) );
  INVX2 U22 ( .A(inchan[1]), .Y(n20) );
  INVX2 U23 ( .A(inchan[0]), .Y(n21) );
  INVX2 U24 ( .A(comp_in[3]), .Y(n22) );
  INVX2 U25 ( .A(comp_in[2]), .Y(n25) );
  INVX2 U58 ( .A(comp_in[1]), .Y(n26) );
  INVX2 U62 ( .A(comp_in[0]), .Y(n44) );
endmodule


module cla_4bit_209 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n4), .B(n5), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n4), .B(n5), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n4), .B(n5), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(b[3]), .Y(n4) );
  INVX2 U10 ( .A(a[3]), .Y(n5) );
endmodule


module cla_4bit_208 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n4), .B(n5), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n4), .B(n5), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n4), .B(n5), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(b[3]), .Y(n4) );
  INVX2 U10 ( .A(a[3]), .Y(n5) );
endmodule


module cla_4bit_207 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n4), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n4), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n4), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(a[3]), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_206 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n3), .B(n4), .C(n2), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n5), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n3), .B(n4), .C(n39), .D(n2), .Y(cout) );
  NAND2X1 U26 ( .A(n3), .B(n4), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n5), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n28), .Y(n2) );
  INVX2 U8 ( .A(b[3]), .Y(n3) );
  INVX2 U9 ( .A(a[3]), .Y(n4) );
  INVX2 U10 ( .A(n23), .Y(n5) );
endmodule


module cla_16bit_51 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   cout, n2, n3, n4, n11, n12, n13, n14, n15, n16;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  NOR2X1 U5 ( .A(n16), .B(n15), .Y(pg) );
  NAND2X1 U6 ( .A(p[3]), .B(p[2]), .Y(n15) );
  NAND2X1 U7 ( .A(p[1]), .B(p[0]), .Y(n16) );
  AOI21X1 U8 ( .A(n2), .B(p[3]), .C(g[3]), .Y(n14) );
  AOI21X1 U9 ( .A(n3), .B(p[2]), .C(g[2]), .Y(n13) );
  AOI21X1 U10 ( .A(n4), .B(p[1]), .C(g[1]), .Y(n12) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n11) );
  cla_4bit_209 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_208 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n4), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_207 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n3), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_206 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n2), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  INVX2 U1 ( .A(n14), .Y(cout) );
  INVX2 U2 ( .A(n13), .Y(n2) );
  INVX2 U3 ( .A(n12), .Y(n3) );
  INVX2 U4 ( .A(n11), .Y(n4) );
endmodule


module cla_4bit_205 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n4), .B(n5), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n4), .B(n5), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n4), .B(n5), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(b[3]), .Y(n4) );
  INVX2 U10 ( .A(a[3]), .Y(n5) );
endmodule


module cla_4bit_204 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n4), .B(n5), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n4), .B(n5), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n4), .B(n5), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(b[3]), .Y(n4) );
  INVX2 U10 ( .A(a[3]), .Y(n5) );
endmodule


module cla_4bit_203 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n4), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n4), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n4), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(a[3]), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_202 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n3), .B(n4), .C(n2), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n5), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n3), .B(n4), .C(n39), .D(n2), .Y(cout) );
  NAND2X1 U26 ( .A(n3), .B(n4), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n5), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n28), .Y(n2) );
  INVX2 U8 ( .A(b[3]), .Y(n3) );
  INVX2 U9 ( .A(a[3]), .Y(n4) );
  INVX2 U10 ( .A(n23), .Y(n5) );
endmodule


module cla_16bit_50 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   cout, n2, n3, n4, n11, n12, n13, n14, n15, n16;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  NOR2X1 U5 ( .A(n16), .B(n15), .Y(pg) );
  NAND2X1 U6 ( .A(p[3]), .B(p[2]), .Y(n15) );
  NAND2X1 U7 ( .A(p[1]), .B(p[0]), .Y(n16) );
  AOI21X1 U8 ( .A(n2), .B(p[3]), .C(g[3]), .Y(n14) );
  AOI21X1 U9 ( .A(n3), .B(p[2]), .C(g[2]), .Y(n13) );
  AOI21X1 U10 ( .A(n4), .B(p[1]), .C(g[1]), .Y(n12) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n11) );
  cla_4bit_205 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_204 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n4), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_203 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n3), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_202 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n2), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  INVX2 U1 ( .A(n14), .Y(cout) );
  INVX2 U2 ( .A(n13), .Y(n2) );
  INVX2 U3 ( .A(n12), .Y(n3) );
  INVX2 U4 ( .A(n11), .Y(n4) );
endmodule


module cla_4bit_201 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n4), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n4), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n4), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(a[3]), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_200 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n4), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n4), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n4), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(a[3]), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_199 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n4), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n4), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n4), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(a[3]), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_198 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n4), .B(n5), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n4), .B(n5), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n4), .B(n5), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(b[3]), .Y(n4) );
  INVX2 U10 ( .A(a[3]), .Y(n5) );
endmodule


module cla_16bit_49 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   cout, n2, n3, n4, n11, n12, n13, n14, n15, n16;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  NOR2X1 U5 ( .A(n16), .B(n15), .Y(pg) );
  NAND2X1 U6 ( .A(p[3]), .B(p[2]), .Y(n15) );
  NAND2X1 U7 ( .A(p[1]), .B(p[0]), .Y(n16) );
  AOI21X1 U8 ( .A(n2), .B(p[3]), .C(g[3]), .Y(n14) );
  AOI21X1 U9 ( .A(n3), .B(p[2]), .C(g[2]), .Y(n13) );
  AOI21X1 U10 ( .A(n4), .B(p[1]), .C(g[1]), .Y(n12) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n11) );
  cla_4bit_201 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_200 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n4), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_199 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n3), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_198 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n2), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  INVX2 U1 ( .A(n14), .Y(cout) );
  INVX2 U2 ( .A(n13), .Y(n2) );
  INVX2 U3 ( .A(n12), .Y(n3) );
  INVX2 U4 ( .A(n11), .Y(n4) );
endmodule


module cla_4bit_197 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n4), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n4), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n4), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(a[3]), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_196 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n4), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n4), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n4), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(a[3]), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_195 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n4), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n4), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n4), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(a[3]), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_194 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n3), .C(n2), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n3), .C(n39), .D(n2), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n3), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n28), .Y(n2) );
  INVX2 U8 ( .A(a[3]), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_16bit_48 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   cout, n2, n3, n4, n11, n12, n13, n14, n15, n16;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  NOR2X1 U5 ( .A(n16), .B(n15), .Y(pg) );
  NAND2X1 U6 ( .A(p[3]), .B(p[2]), .Y(n15) );
  NAND2X1 U7 ( .A(p[1]), .B(p[0]), .Y(n16) );
  AOI21X1 U8 ( .A(n2), .B(p[3]), .C(g[3]), .Y(n14) );
  AOI21X1 U9 ( .A(n3), .B(p[2]), .C(g[2]), .Y(n13) );
  AOI21X1 U10 ( .A(n4), .B(p[1]), .C(g[1]), .Y(n12) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n11) );
  cla_4bit_197 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_196 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n4), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_195 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n3), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_194 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n2), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  INVX2 U1 ( .A(n14), .Y(cout) );
  INVX2 U2 ( .A(n13), .Y(n2) );
  INVX2 U3 ( .A(n12), .Y(n3) );
  INVX2 U4 ( .A(n11), .Y(n4) );
endmodule


module amp_clip_0 ( inchan, comp_in, outchan );
  input [15:0] inchan;
  input [3:0] comp_in;
  output [15:0] outchan;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n25, n26, n44, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63;
  wire   [15:0] neg_comp_out;
  wire   [15:0] pos_comp_out;
  wire   [15:0] neg_clipped;
  wire   [15:0] pos_clipped;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1;

  OAI21X1 U26 ( .A(n4), .B(n12), .C(n62), .Y(outchan[9]) );
  AOI22X1 U27 ( .A(neg_clipped[9]), .B(n2), .C(pos_clipped[9]), .D(n5), .Y(n62) );
  OAI21X1 U28 ( .A(n4), .B(n13), .C(n61), .Y(outchan[8]) );
  AOI22X1 U29 ( .A(neg_clipped[8]), .B(n2), .C(pos_clipped[8]), .D(n5), .Y(n61) );
  OAI21X1 U30 ( .A(n4), .B(n14), .C(n60), .Y(outchan[7]) );
  AOI22X1 U31 ( .A(neg_clipped[7]), .B(n2), .C(pos_clipped[7]), .D(n5), .Y(n60) );
  OAI21X1 U32 ( .A(n4), .B(n15), .C(n59), .Y(outchan[6]) );
  AOI22X1 U33 ( .A(neg_clipped[6]), .B(n2), .C(pos_clipped[6]), .D(n5), .Y(n59) );
  OAI21X1 U34 ( .A(n4), .B(n16), .C(n58), .Y(outchan[5]) );
  AOI22X1 U35 ( .A(neg_clipped[5]), .B(n2), .C(pos_clipped[5]), .D(n5), .Y(n58) );
  OAI21X1 U36 ( .A(n4), .B(n17), .C(n57), .Y(outchan[4]) );
  AOI22X1 U37 ( .A(neg_clipped[4]), .B(n2), .C(pos_clipped[4]), .D(n5), .Y(n57) );
  OAI21X1 U38 ( .A(n4), .B(n18), .C(n56), .Y(outchan[3]) );
  AOI22X1 U39 ( .A(neg_clipped[3]), .B(n2), .C(pos_clipped[3]), .D(n5), .Y(n56) );
  OAI21X1 U40 ( .A(n4), .B(n19), .C(n55), .Y(outchan[2]) );
  AOI22X1 U41 ( .A(neg_clipped[2]), .B(n2), .C(pos_clipped[2]), .D(n5), .Y(n55) );
  OAI21X1 U42 ( .A(n63), .B(n20), .C(n54), .Y(outchan[1]) );
  AOI22X1 U43 ( .A(neg_clipped[1]), .B(n2), .C(pos_clipped[1]), .D(n5), .Y(n54) );
  OAI21X1 U44 ( .A(n1), .B(n6), .C(n53), .Y(outchan[15]) );
  OAI21X1 U45 ( .A(n3), .B(neg_clipped[15]), .C(inchan[15]), .Y(n53) );
  OAI21X1 U46 ( .A(n63), .B(n7), .C(n52), .Y(outchan[14]) );
  AOI22X1 U47 ( .A(neg_clipped[14]), .B(n2), .C(pos_clipped[14]), .D(n5), .Y(
        n52) );
  OAI21X1 U48 ( .A(n63), .B(n8), .C(n51), .Y(outchan[13]) );
  AOI22X1 U49 ( .A(neg_clipped[13]), .B(n2), .C(pos_clipped[13]), .D(n5), .Y(
        n51) );
  OAI21X1 U50 ( .A(n63), .B(n9), .C(n50), .Y(outchan[12]) );
  AOI22X1 U51 ( .A(neg_clipped[12]), .B(n2), .C(pos_clipped[12]), .D(n5), .Y(
        n50) );
  OAI21X1 U52 ( .A(n63), .B(n10), .C(n49), .Y(outchan[11]) );
  AOI22X1 U53 ( .A(neg_clipped[11]), .B(n2), .C(pos_clipped[11]), .D(n5), .Y(
        n49) );
  OAI21X1 U54 ( .A(n63), .B(n11), .C(n48), .Y(outchan[10]) );
  AOI22X1 U55 ( .A(neg_clipped[10]), .B(n2), .C(pos_clipped[10]), .D(n5), .Y(
        n48) );
  OAI21X1 U56 ( .A(n63), .B(n21), .C(n47), .Y(outchan[0]) );
  AOI22X1 U57 ( .A(neg_clipped[0]), .B(n2), .C(pos_clipped[0]), .D(n5), .Y(n47) );
  OAI21X1 U59 ( .A(pos_comp_out[15]), .B(inchan[15]), .C(n46), .Y(n63) );
  NAND2X1 U60 ( .A(neg_comp_out[15]), .B(inchan[15]), .Y(n46) );
  cla_16bit_51 A1 ( .a(inchan), .b({1'b1, n22, n25, n26, n44, 1'b1, 1'b1, 1'b1, 
        1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1}), .cin(1'b1), .sum({
        pos_comp_out[15:1], SYNOPSYS_UNCONNECTED__0}) );
  cla_16bit_50 A2 ( .a(inchan), .b({1'b0, comp_in, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .cin(1'b0), .sum({
        neg_comp_out[15:1], SYNOPSYS_UNCONNECTED__1}) );
  cla_16bit_49 A3 ( .a({1'b0, 1'b0, pos_comp_out[14:1]}), .b({1'b0, comp_in, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), 
        .cin(1'b0), .sum(pos_clipped) );
  cla_16bit_48 A4 ( .a({1'b1, 1'b1, neg_comp_out[14:1]}), .b({1'b1, n22, n25, 
        n26, n44, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 
        1'b1}), .cin(1'b1), .sum(neg_clipped) );
  OR2X2 U3 ( .A(n3), .B(inchan[15]), .Y(n1) );
  AND2X2 U4 ( .A(inchan[15]), .B(n4), .Y(n2) );
  INVX2 U5 ( .A(n3), .Y(n4) );
  INVX2 U6 ( .A(n63), .Y(n3) );
  INVX2 U7 ( .A(n1), .Y(n5) );
  INVX2 U8 ( .A(pos_clipped[15]), .Y(n6) );
  INVX2 U9 ( .A(inchan[14]), .Y(n7) );
  INVX2 U10 ( .A(inchan[13]), .Y(n8) );
  INVX2 U11 ( .A(inchan[12]), .Y(n9) );
  INVX2 U12 ( .A(inchan[11]), .Y(n10) );
  INVX2 U13 ( .A(inchan[10]), .Y(n11) );
  INVX2 U14 ( .A(inchan[9]), .Y(n12) );
  INVX2 U15 ( .A(inchan[8]), .Y(n13) );
  INVX2 U16 ( .A(inchan[7]), .Y(n14) );
  INVX2 U17 ( .A(inchan[6]), .Y(n15) );
  INVX2 U18 ( .A(inchan[5]), .Y(n16) );
  INVX2 U19 ( .A(inchan[4]), .Y(n17) );
  INVX2 U20 ( .A(inchan[3]), .Y(n18) );
  INVX2 U21 ( .A(inchan[2]), .Y(n19) );
  INVX2 U22 ( .A(inchan[1]), .Y(n20) );
  INVX2 U23 ( .A(inchan[0]), .Y(n21) );
  INVX2 U24 ( .A(comp_in[3]), .Y(n22) );
  INVX2 U25 ( .A(comp_in[2]), .Y(n25) );
  INVX2 U58 ( .A(comp_in[1]), .Y(n26) );
  INVX2 U62 ( .A(comp_in[0]), .Y(n44) );
endmodule


module flex_buffer_NUM_BITS32_2 ( clk, n_rst, input_data, output_data );
  input [31:0] input_data;
  output [31:0] output_data;
  input clk, n_rst;
  wire   n33, n34;

  DFFSR \output_data_reg[31]  ( .D(input_data[31]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[31]) );
  DFFSR \output_data_reg[30]  ( .D(input_data[30]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[30]) );
  DFFSR \output_data_reg[29]  ( .D(input_data[29]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[29]) );
  DFFSR \output_data_reg[28]  ( .D(input_data[28]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[28]) );
  DFFSR \output_data_reg[27]  ( .D(input_data[27]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[27]) );
  DFFSR \output_data_reg[26]  ( .D(input_data[26]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[26]) );
  DFFSR \output_data_reg[25]  ( .D(input_data[25]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[25]) );
  DFFSR \output_data_reg[24]  ( .D(input_data[24]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[24]) );
  DFFSR \output_data_reg[23]  ( .D(input_data[23]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[23]) );
  DFFSR \output_data_reg[22]  ( .D(input_data[22]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[22]) );
  DFFSR \output_data_reg[21]  ( .D(input_data[21]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[21]) );
  DFFSR \output_data_reg[20]  ( .D(input_data[20]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[20]) );
  DFFSR \output_data_reg[19]  ( .D(input_data[19]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[19]) );
  DFFSR \output_data_reg[18]  ( .D(input_data[18]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[18]) );
  DFFSR \output_data_reg[17]  ( .D(input_data[17]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[17]) );
  DFFSR \output_data_reg[16]  ( .D(input_data[16]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[16]) );
  DFFSR \output_data_reg[15]  ( .D(input_data[15]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[15]) );
  DFFSR \output_data_reg[14]  ( .D(input_data[14]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[14]) );
  DFFSR \output_data_reg[13]  ( .D(input_data[13]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[13]) );
  DFFSR \output_data_reg[12]  ( .D(input_data[12]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[12]) );
  DFFSR \output_data_reg[11]  ( .D(input_data[11]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[11]) );
  DFFSR \output_data_reg[10]  ( .D(input_data[10]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[10]) );
  DFFSR \output_data_reg[9]  ( .D(input_data[9]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[9]) );
  DFFSR \output_data_reg[8]  ( .D(input_data[8]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[8]) );
  DFFSR \output_data_reg[7]  ( .D(input_data[7]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[7]) );
  DFFSR \output_data_reg[6]  ( .D(input_data[6]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[6]) );
  DFFSR \output_data_reg[5]  ( .D(input_data[5]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[5]) );
  DFFSR \output_data_reg[4]  ( .D(input_data[4]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[4]) );
  DFFSR \output_data_reg[3]  ( .D(input_data[3]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[3]) );
  DFFSR \output_data_reg[2]  ( .D(input_data[2]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[2]) );
  DFFSR \output_data_reg[1]  ( .D(input_data[1]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[1]) );
  DFFSR \output_data_reg[0]  ( .D(input_data[0]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[0]) );
  INVX2 U35 ( .A(n34), .Y(n33) );
  INVX2 U36 ( .A(clk), .Y(n34) );
endmodule


module flex_buffer_NUM_BITS16_7 ( clk, n_rst, input_data, output_data );
  input [15:0] input_data;
  output [15:0] output_data;
  input clk, n_rst;


  DFFSR \output_data_reg[15]  ( .D(input_data[15]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[15]) );
  DFFSR \output_data_reg[14]  ( .D(input_data[14]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[14]) );
  DFFSR \output_data_reg[13]  ( .D(input_data[13]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[13]) );
  DFFSR \output_data_reg[12]  ( .D(input_data[12]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[12]) );
  DFFSR \output_data_reg[11]  ( .D(input_data[11]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[11]) );
  DFFSR \output_data_reg[10]  ( .D(input_data[10]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[10]) );
  DFFSR \output_data_reg[9]  ( .D(input_data[9]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[9]) );
  DFFSR \output_data_reg[8]  ( .D(input_data[8]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[8]) );
  DFFSR \output_data_reg[7]  ( .D(input_data[7]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[7]) );
  DFFSR \output_data_reg[6]  ( .D(input_data[6]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[6]) );
  DFFSR \output_data_reg[5]  ( .D(input_data[5]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[5]) );
  DFFSR \output_data_reg[4]  ( .D(input_data[4]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[4]) );
  DFFSR \output_data_reg[3]  ( .D(input_data[3]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[3]) );
  DFFSR \output_data_reg[2]  ( .D(input_data[2]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[2]) );
  DFFSR \output_data_reg[1]  ( .D(input_data[1]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[1]) );
  DFFSR \output_data_reg[0]  ( .D(input_data[0]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[0]) );
endmodule


module flex_buffer_NUM_BITS16_6 ( clk, n_rst, input_data, output_data );
  input [15:0] input_data;
  output [15:0] output_data;
  input clk, n_rst;


  DFFSR \output_data_reg[15]  ( .D(input_data[15]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[15]) );
  DFFSR \output_data_reg[14]  ( .D(input_data[14]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[14]) );
  DFFSR \output_data_reg[13]  ( .D(input_data[13]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[13]) );
  DFFSR \output_data_reg[12]  ( .D(input_data[12]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[12]) );
  DFFSR \output_data_reg[11]  ( .D(input_data[11]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[11]) );
  DFFSR \output_data_reg[10]  ( .D(input_data[10]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[10]) );
  DFFSR \output_data_reg[9]  ( .D(input_data[9]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[9]) );
  DFFSR \output_data_reg[8]  ( .D(input_data[8]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[8]) );
  DFFSR \output_data_reg[7]  ( .D(input_data[7]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[7]) );
  DFFSR \output_data_reg[6]  ( .D(input_data[6]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[6]) );
  DFFSR \output_data_reg[5]  ( .D(input_data[5]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[5]) );
  DFFSR \output_data_reg[4]  ( .D(input_data[4]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[4]) );
  DFFSR \output_data_reg[3]  ( .D(input_data[3]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[3]) );
  DFFSR \output_data_reg[2]  ( .D(input_data[2]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[2]) );
  DFFSR \output_data_reg[1]  ( .D(input_data[1]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[1]) );
  DFFSR \output_data_reg[0]  ( .D(input_data[0]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[0]) );
endmodule


module flex_buffer_NUM_BITS16_5 ( clk, n_rst, input_data, output_data );
  input [15:0] input_data;
  output [15:0] output_data;
  input clk, n_rst;
  wire   n17, n18;

  DFFSR \output_data_reg[15]  ( .D(input_data[15]), .CLK(clk), .R(n17), .S(
        1'b1), .Q(output_data[15]) );
  DFFSR \output_data_reg[14]  ( .D(input_data[14]), .CLK(clk), .R(n17), .S(
        1'b1), .Q(output_data[14]) );
  DFFSR \output_data_reg[13]  ( .D(input_data[13]), .CLK(clk), .R(n17), .S(
        1'b1), .Q(output_data[13]) );
  DFFSR \output_data_reg[12]  ( .D(input_data[12]), .CLK(clk), .R(n17), .S(
        1'b1), .Q(output_data[12]) );
  DFFSR \output_data_reg[11]  ( .D(input_data[11]), .CLK(clk), .R(n17), .S(
        1'b1), .Q(output_data[11]) );
  DFFSR \output_data_reg[10]  ( .D(input_data[10]), .CLK(clk), .R(n17), .S(
        1'b1), .Q(output_data[10]) );
  DFFSR \output_data_reg[9]  ( .D(input_data[9]), .CLK(clk), .R(n17), .S(1'b1), 
        .Q(output_data[9]) );
  DFFSR \output_data_reg[8]  ( .D(input_data[8]), .CLK(clk), .R(n17), .S(1'b1), 
        .Q(output_data[8]) );
  DFFSR \output_data_reg[7]  ( .D(input_data[7]), .CLK(clk), .R(n17), .S(1'b1), 
        .Q(output_data[7]) );
  DFFSR \output_data_reg[6]  ( .D(input_data[6]), .CLK(clk), .R(n17), .S(1'b1), 
        .Q(output_data[6]) );
  DFFSR \output_data_reg[5]  ( .D(input_data[5]), .CLK(clk), .R(n17), .S(1'b1), 
        .Q(output_data[5]) );
  DFFSR \output_data_reg[4]  ( .D(input_data[4]), .CLK(clk), .R(n17), .S(1'b1), 
        .Q(output_data[4]) );
  DFFSR \output_data_reg[3]  ( .D(input_data[3]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[3]) );
  DFFSR \output_data_reg[2]  ( .D(input_data[2]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[2]) );
  DFFSR \output_data_reg[1]  ( .D(input_data[1]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[1]) );
  DFFSR \output_data_reg[0]  ( .D(input_data[0]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[0]) );
  INVX2 U19 ( .A(n18), .Y(n17) );
  INVX2 U20 ( .A(n_rst), .Y(n18) );
endmodule


module flex_buffer_NUM_BITS16_4 ( clk, n_rst, input_data, output_data );
  input [15:0] input_data;
  output [15:0] output_data;
  input clk, n_rst;
  wire   n17, n18;

  DFFSR \output_data_reg[15]  ( .D(input_data[15]), .CLK(clk), .R(n17), .S(
        1'b1), .Q(output_data[15]) );
  DFFSR \output_data_reg[14]  ( .D(input_data[14]), .CLK(clk), .R(n17), .S(
        1'b1), .Q(output_data[14]) );
  DFFSR \output_data_reg[13]  ( .D(input_data[13]), .CLK(clk), .R(n17), .S(
        1'b1), .Q(output_data[13]) );
  DFFSR \output_data_reg[12]  ( .D(input_data[12]), .CLK(clk), .R(n17), .S(
        1'b1), .Q(output_data[12]) );
  DFFSR \output_data_reg[11]  ( .D(input_data[11]), .CLK(clk), .R(n17), .S(
        1'b1), .Q(output_data[11]) );
  DFFSR \output_data_reg[10]  ( .D(input_data[10]), .CLK(clk), .R(n17), .S(
        1'b1), .Q(output_data[10]) );
  DFFSR \output_data_reg[9]  ( .D(input_data[9]), .CLK(clk), .R(n17), .S(1'b1), 
        .Q(output_data[9]) );
  DFFSR \output_data_reg[8]  ( .D(input_data[8]), .CLK(clk), .R(n17), .S(1'b1), 
        .Q(output_data[8]) );
  DFFSR \output_data_reg[7]  ( .D(input_data[7]), .CLK(clk), .R(n17), .S(1'b1), 
        .Q(output_data[7]) );
  DFFSR \output_data_reg[6]  ( .D(input_data[6]), .CLK(clk), .R(n17), .S(1'b1), 
        .Q(output_data[6]) );
  DFFSR \output_data_reg[5]  ( .D(input_data[5]), .CLK(clk), .R(n17), .S(1'b1), 
        .Q(output_data[5]) );
  DFFSR \output_data_reg[4]  ( .D(input_data[4]), .CLK(clk), .R(n17), .S(1'b1), 
        .Q(output_data[4]) );
  DFFSR \output_data_reg[3]  ( .D(input_data[3]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[3]) );
  DFFSR \output_data_reg[2]  ( .D(input_data[2]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[2]) );
  DFFSR \output_data_reg[1]  ( .D(input_data[1]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[1]) );
  DFFSR \output_data_reg[0]  ( .D(input_data[0]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[0]) );
  INVX2 U19 ( .A(n18), .Y(n17) );
  INVX2 U20 ( .A(n_rst), .Y(n18) );
endmodule


module cla_4bit_193 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_192 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_191 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_190 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n1), .C(n2), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n1), .C(n39), .D(n2), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n1), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(a[3]), .Y(n1) );
  INVX2 U7 ( .A(n28), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_16bit_47 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   cout, n2, n3, n4, n11, n12, n13, n14, n15, n16;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  NOR2X1 U5 ( .A(n16), .B(n15), .Y(pg) );
  NAND2X1 U6 ( .A(p[3]), .B(p[2]), .Y(n15) );
  NAND2X1 U7 ( .A(p[1]), .B(p[0]), .Y(n16) );
  AOI21X1 U8 ( .A(n2), .B(p[3]), .C(g[3]), .Y(n14) );
  AOI21X1 U9 ( .A(n3), .B(p[2]), .C(g[2]), .Y(n13) );
  AOI21X1 U10 ( .A(n4), .B(p[1]), .C(g[1]), .Y(n12) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n11) );
  cla_4bit_193 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_192 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n4), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_191 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n3), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_190 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n2), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  INVX2 U1 ( .A(n14), .Y(cout) );
  INVX2 U2 ( .A(n13), .Y(n2) );
  INVX2 U3 ( .A(n12), .Y(n3) );
  INVX2 U4 ( .A(n11), .Y(n4) );
endmodule


module cla_4bit_189 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_188 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_187 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_186 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n1), .C(n2), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n1), .C(n39), .D(n2), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n1), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(a[3]), .Y(n1) );
  INVX2 U7 ( .A(n28), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_16bit_46 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   cout, n2, n3, n4, n11, n12, n13, n14, n15, n16;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  NOR2X1 U5 ( .A(n16), .B(n15), .Y(pg) );
  NAND2X1 U6 ( .A(p[3]), .B(p[2]), .Y(n15) );
  NAND2X1 U7 ( .A(p[1]), .B(p[0]), .Y(n16) );
  AOI21X1 U8 ( .A(n2), .B(p[3]), .C(g[3]), .Y(n14) );
  AOI21X1 U9 ( .A(n3), .B(p[2]), .C(g[2]), .Y(n13) );
  AOI21X1 U10 ( .A(n4), .B(p[1]), .C(g[1]), .Y(n12) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n11) );
  cla_4bit_189 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_188 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n4), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_187 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n3), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_186 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n2), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  INVX2 U1 ( .A(n14), .Y(cout) );
  INVX2 U2 ( .A(n13), .Y(n2) );
  INVX2 U3 ( .A(n12), .Y(n3) );
  INVX2 U4 ( .A(n11), .Y(n4) );
endmodule


module cla_4bit_185 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_184 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_183 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_182 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n1), .C(n2), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n1), .C(n39), .D(n2), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n1), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(a[3]), .Y(n1) );
  INVX2 U7 ( .A(n28), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_16bit_45 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   cout, n2, n3, n4, n11, n12, n13, n14, n15, n16;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  NOR2X1 U5 ( .A(n16), .B(n15), .Y(pg) );
  NAND2X1 U6 ( .A(p[3]), .B(p[2]), .Y(n15) );
  NAND2X1 U7 ( .A(p[1]), .B(p[0]), .Y(n16) );
  AOI21X1 U8 ( .A(n2), .B(p[3]), .C(g[3]), .Y(n14) );
  AOI21X1 U9 ( .A(n3), .B(p[2]), .C(g[2]), .Y(n13) );
  AOI21X1 U10 ( .A(n4), .B(p[1]), .C(g[1]), .Y(n12) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n11) );
  cla_4bit_185 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_184 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n4), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_183 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n3), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_182 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n2), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  INVX2 U1 ( .A(n14), .Y(cout) );
  INVX2 U2 ( .A(n13), .Y(n2) );
  INVX2 U3 ( .A(n12), .Y(n3) );
  INVX2 U4 ( .A(n11), .Y(n4) );
endmodule


module cla_4bit_181 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_180 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_179 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_178 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n1), .C(n2), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n1), .C(n39), .D(n2), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n1), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(a[3]), .Y(n1) );
  INVX2 U7 ( .A(n28), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_16bit_44 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   cout, n2, n3, n4, n11, n12, n13, n14, n15, n16;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  NOR2X1 U5 ( .A(n16), .B(n15), .Y(pg) );
  NAND2X1 U6 ( .A(p[3]), .B(p[2]), .Y(n15) );
  NAND2X1 U7 ( .A(p[1]), .B(p[0]), .Y(n16) );
  AOI21X1 U8 ( .A(n2), .B(p[3]), .C(g[3]), .Y(n14) );
  AOI21X1 U9 ( .A(n3), .B(p[2]), .C(g[2]), .Y(n13) );
  AOI21X1 U10 ( .A(n4), .B(p[1]), .C(g[1]), .Y(n12) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n11) );
  cla_4bit_181 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_180 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n4), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_179 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n3), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_178 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n2), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  INVX2 U1 ( .A(n14), .Y(cout) );
  INVX2 U2 ( .A(n13), .Y(n2) );
  INVX2 U3 ( .A(n12), .Y(n3) );
  INVX2 U4 ( .A(n11), .Y(n4) );
endmodule


module cla_4bit_177 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n4), .B(n5), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n4), .B(n5), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n4), .B(n5), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(b[3]), .Y(n4) );
  INVX2 U10 ( .A(a[3]), .Y(n5) );
endmodule


module cla_4bit_176 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n4), .B(n5), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n4), .B(n5), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n4), .B(n5), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(b[3]), .Y(n4) );
  INVX2 U10 ( .A(a[3]), .Y(n5) );
endmodule


module cla_4bit_175 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n3), .B(n5), .C(n2), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n3), .B(n5), .C(n39), .D(n2), .Y(cout) );
  NAND2X1 U26 ( .A(n3), .B(n5), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n28), .Y(n2) );
  INVX2 U8 ( .A(b[3]), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(a[3]), .Y(n5) );
endmodule


module cla_4bit_174 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n4), .B(n5), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n4), .B(n5), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n4), .B(n5), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(b[3]), .Y(n4) );
  INVX2 U10 ( .A(a[3]), .Y(n5) );
endmodule


module cla_16bit_43 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   cout, n2, n3, n4, n11, n12, n13, n14, n15, n16;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  NOR2X1 U5 ( .A(n16), .B(n15), .Y(pg) );
  NAND2X1 U6 ( .A(p[3]), .B(p[2]), .Y(n15) );
  NAND2X1 U7 ( .A(p[1]), .B(p[0]), .Y(n16) );
  AOI21X1 U8 ( .A(n2), .B(p[3]), .C(g[3]), .Y(n14) );
  AOI21X1 U9 ( .A(n3), .B(p[2]), .C(g[2]), .Y(n13) );
  AOI21X1 U10 ( .A(n4), .B(p[1]), .C(g[1]), .Y(n12) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n11) );
  cla_4bit_177 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_176 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n4), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_175 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n3), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_174 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n2), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  INVX2 U1 ( .A(n14), .Y(cout) );
  INVX2 U2 ( .A(n13), .Y(n2) );
  INVX2 U3 ( .A(n12), .Y(n3) );
  INVX2 U4 ( .A(n11), .Y(n4) );
endmodule


module cla_4bit_173 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n4), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n4), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n4), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(a[3]), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_172 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n4), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n4), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n4), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(a[3]), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_171 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n3), .C(n2), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n3), .C(n39), .D(n2), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n3), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n28), .Y(n2) );
  INVX2 U8 ( .A(a[3]), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_170 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n4), .B(n5), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n4), .B(n5), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n4), .B(n5), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(b[3]), .Y(n4) );
  INVX2 U10 ( .A(a[3]), .Y(n5) );
endmodule


module cla_16bit_42 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   cout, n2, n3, n4, n11, n12, n13, n14, n15, n16;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  NOR2X1 U5 ( .A(n16), .B(n15), .Y(pg) );
  NAND2X1 U6 ( .A(p[3]), .B(p[2]), .Y(n15) );
  NAND2X1 U7 ( .A(p[1]), .B(p[0]), .Y(n16) );
  AOI21X1 U8 ( .A(n2), .B(p[3]), .C(g[3]), .Y(n14) );
  AOI21X1 U9 ( .A(n3), .B(p[2]), .C(g[2]), .Y(n13) );
  AOI21X1 U10 ( .A(n4), .B(p[1]), .C(g[1]), .Y(n12) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n11) );
  cla_4bit_173 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_172 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n4), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_171 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n3), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_170 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n2), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  INVX2 U1 ( .A(n14), .Y(cout) );
  INVX2 U2 ( .A(n13), .Y(n2) );
  INVX2 U3 ( .A(n12), .Y(n3) );
  INVX2 U4 ( .A(n11), .Y(n4) );
endmodule


module cla_4bit_169 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n4), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n4), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n4), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(a[3]), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_168 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n4), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n4), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n4), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(a[3]), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_167 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n3), .C(n2), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n3), .C(n39), .D(n2), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n3), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n28), .Y(n2) );
  INVX2 U8 ( .A(a[3]), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_166 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n4), .B(n5), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n4), .B(n5), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n4), .B(n5), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(b[3]), .Y(n4) );
  INVX2 U10 ( .A(a[3]), .Y(n5) );
endmodule


module cla_16bit_41 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   cout, n2, n3, n4, n11, n12, n13, n14, n15, n16;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  NOR2X1 U5 ( .A(n16), .B(n15), .Y(pg) );
  NAND2X1 U6 ( .A(p[3]), .B(p[2]), .Y(n15) );
  NAND2X1 U7 ( .A(p[1]), .B(p[0]), .Y(n16) );
  AOI21X1 U8 ( .A(n2), .B(p[3]), .C(g[3]), .Y(n14) );
  AOI21X1 U9 ( .A(n3), .B(p[2]), .C(g[2]), .Y(n13) );
  AOI21X1 U10 ( .A(n4), .B(p[1]), .C(g[1]), .Y(n12) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n11) );
  cla_4bit_169 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_168 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n4), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_167 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n3), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_166 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n2), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  INVX2 U1 ( .A(n14), .Y(cout) );
  INVX2 U2 ( .A(n13), .Y(n2) );
  INVX2 U3 ( .A(n12), .Y(n3) );
  INVX2 U4 ( .A(n11), .Y(n4) );
endmodule


module cla_4bit_165 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n4), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n4), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n4), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(a[3]), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_164 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n4), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n4), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n4), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(a[3]), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_163 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n3), .C(n2), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n3), .C(n39), .D(n2), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n3), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n28), .Y(n2) );
  INVX2 U8 ( .A(a[3]), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_162 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n4), .B(n5), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n4), .B(n5), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n4), .B(n5), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(b[3]), .Y(n4) );
  INVX2 U10 ( .A(a[3]), .Y(n5) );
endmodule


module cla_16bit_40 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   cout, n2, n3, n4, n11, n12, n13, n14, n15, n16;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  NOR2X1 U5 ( .A(n16), .B(n15), .Y(pg) );
  NAND2X1 U6 ( .A(p[3]), .B(p[2]), .Y(n15) );
  NAND2X1 U7 ( .A(p[1]), .B(p[0]), .Y(n16) );
  AOI21X1 U8 ( .A(n2), .B(p[3]), .C(g[3]), .Y(n14) );
  AOI21X1 U9 ( .A(n3), .B(p[2]), .C(g[2]), .Y(n13) );
  AOI21X1 U10 ( .A(n4), .B(p[1]), .C(g[1]), .Y(n12) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n11) );
  cla_4bit_165 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_164 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n4), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_163 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n3), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_162 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n2), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  INVX2 U1 ( .A(n14), .Y(cout) );
  INVX2 U2 ( .A(n13), .Y(n2) );
  INVX2 U3 ( .A(n12), .Y(n3) );
  INVX2 U4 ( .A(n11), .Y(n4) );
endmodule


module cla_4bit_63 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n4), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n4), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n4), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(a[3]), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_62 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n4), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n4), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n4), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(a[3]), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_61 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n3), .C(n2), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n3), .C(n39), .D(n2), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n3), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n28), .Y(n2) );
  INVX2 U8 ( .A(a[3]), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_60 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n4), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n4), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n4), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(a[3]), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_16bit_15 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   cout, n2, n3, n4, n11, n12, n13, n14, n15, n16;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  NOR2X1 U5 ( .A(n16), .B(n15), .Y(pg) );
  NAND2X1 U6 ( .A(p[3]), .B(p[2]), .Y(n15) );
  NAND2X1 U7 ( .A(p[1]), .B(p[0]), .Y(n16) );
  AOI21X1 U8 ( .A(n2), .B(p[3]), .C(g[3]), .Y(n14) );
  AOI21X1 U9 ( .A(n3), .B(p[2]), .C(g[2]), .Y(n13) );
  AOI21X1 U10 ( .A(n4), .B(p[1]), .C(g[1]), .Y(n12) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n11) );
  cla_4bit_63 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_62 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n4), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_61 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n3), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_60 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n2), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  INVX2 U1 ( .A(n14), .Y(cout) );
  INVX2 U2 ( .A(n13), .Y(n2) );
  INVX2 U3 ( .A(n12), .Y(n3) );
  INVX2 U4 ( .A(n11), .Y(n4) );
endmodule


module adder_1bit_23 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n4, n5;

  XOR2X1 U2 ( .A(carry_in), .B(n5), .Y(sum) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n5), .D(carry_in), .Y(n4) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n5) );
  INVX2 U1 ( .A(n4), .Y(carry_out) );
endmodule


module cla_4bit_59 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_58 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n3), .C(n2), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n3), .C(n39), .D(n2), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n3), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n28), .Y(n2) );
  INVX2 U8 ( .A(a[3]), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_57 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n3), .C(n2), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n3), .C(n39), .D(n2), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n3), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n28), .Y(n2) );
  INVX2 U8 ( .A(a[3]), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_56 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n3), .C(n2), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n3), .C(n39), .D(n2), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n3), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n28), .Y(n2) );
  INVX2 U8 ( .A(a[3]), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_16bit_14 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   cout, n2, n3, n4, n11, n12, n13, n14, n15, n16;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  NOR2X1 U5 ( .A(n16), .B(n15), .Y(pg) );
  NAND2X1 U6 ( .A(p[3]), .B(p[2]), .Y(n15) );
  NAND2X1 U7 ( .A(p[1]), .B(p[0]), .Y(n16) );
  AOI21X1 U8 ( .A(n2), .B(p[3]), .C(g[3]), .Y(n14) );
  AOI21X1 U9 ( .A(n3), .B(p[2]), .C(g[2]), .Y(n13) );
  AOI21X1 U10 ( .A(n4), .B(p[1]), .C(g[1]), .Y(n12) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n11) );
  cla_4bit_59 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_58 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n4), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_57 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n3), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_56 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n2), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  INVX2 U1 ( .A(n14), .Y(cout) );
  INVX2 U2 ( .A(n13), .Y(n2) );
  INVX2 U3 ( .A(n12), .Y(n3) );
  INVX2 U4 ( .A(n11), .Y(n4) );
endmodule


module adder_1bit_22 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n4, n5;

  XOR2X1 U2 ( .A(carry_in), .B(n5), .Y(sum) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n5), .D(carry_in), .Y(n4) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n5) );
  INVX2 U1 ( .A(n4), .Y(carry_out) );
endmodule


module adder_1bit_21 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n4, n5;

  XOR2X1 U2 ( .A(carry_in), .B(n5), .Y(sum) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n5), .D(carry_in), .Y(n4) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n5) );
  INVX2 U1 ( .A(n4), .Y(carry_out) );
endmodule


module cla_4bit_55 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_54 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_53 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n3), .C(n2), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n3), .C(n39), .D(n2), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n3), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n28), .Y(n2) );
  INVX2 U8 ( .A(a[3]), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_52 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n3), .C(n2), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n3), .C(n39), .D(n2), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n3), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n28), .Y(n2) );
  INVX2 U8 ( .A(a[3]), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_16bit_13 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   cout, n2, n3, n4, n11, n12, n13, n14, n15, n16;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  NOR2X1 U5 ( .A(n16), .B(n15), .Y(pg) );
  NAND2X1 U6 ( .A(p[3]), .B(p[2]), .Y(n15) );
  NAND2X1 U7 ( .A(p[1]), .B(p[0]), .Y(n16) );
  AOI21X1 U8 ( .A(n2), .B(p[3]), .C(g[3]), .Y(n14) );
  AOI21X1 U9 ( .A(n3), .B(p[2]), .C(g[2]), .Y(n13) );
  AOI21X1 U10 ( .A(n4), .B(p[1]), .C(g[1]), .Y(n12) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n11) );
  cla_4bit_55 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_54 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n4), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_53 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n3), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_52 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n2), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  INVX2 U1 ( .A(n14), .Y(cout) );
  INVX2 U2 ( .A(n13), .Y(n2) );
  INVX2 U3 ( .A(n12), .Y(n3) );
  INVX2 U4 ( .A(n11), .Y(n4) );
endmodule


module adder_1bit_20 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n4, n5;

  XOR2X1 U2 ( .A(carry_in), .B(n5), .Y(sum) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n5), .D(carry_in), .Y(n4) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n5) );
  INVX2 U1 ( .A(n4), .Y(carry_out) );
endmodule


module adder_1bit_19 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n4, n5;

  XOR2X1 U2 ( .A(carry_in), .B(n5), .Y(sum) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n5), .D(carry_in), .Y(n4) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n5) );
  INVX2 U1 ( .A(n4), .Y(carry_out) );
endmodule


module adder_1bit_18 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n4, n5;

  XOR2X1 U2 ( .A(carry_in), .B(n5), .Y(sum) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n5), .D(carry_in), .Y(n4) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n5) );
  INVX2 U1 ( .A(n4), .Y(carry_out) );
endmodule


module unsigned_mult16by4_1 ( a, b, product );
  input [15:0] a;
  input [3:0] b;
  output [19:0] product;
  wire   \sums[1][18] , \sums[1][17] , \sums[1][16] , \sums[1][15] ,
         \sums[1][14] , \sums[1][13] , \sums[1][12] , \sums[1][11] ,
         \sums[1][10] , \sums[1][9] , \sums[1][8] , \sums[1][7] , \sums[1][6] ,
         \sums[1][5] , \sums[1][4] , \sums[1][3] , \sums[1][2] , \sums[1][1] ,
         \sums[1][0] , \sums[0][17] , \sums[0][16] , \sums[0][15] ,
         \sums[0][14] , \sums[0][13] , \sums[0][12] , \sums[0][11] ,
         \sums[0][10] , \sums[0][9] , \sums[0][8] , \sums[0][7] , \sums[0][6] ,
         \sums[0][5] , \sums[0][4] , \sums[0][3] , \sums[0][2] , \sums[0][1] ,
         \sums[0][0] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20;
  wire   [15:0] ab0;
  wire   [15:1] ab1;
  wire   [17:2] ab2;
  wire   [18:3] ab3;
  wire   [5:0] couts;

  NOR2X1 U22 ( .A(n16), .B(n2), .Y(ab3[9]) );
  NOR2X1 U23 ( .A(n2), .B(n15), .Y(ab3[8]) );
  NOR2X1 U24 ( .A(n2), .B(n14), .Y(ab3[7]) );
  NOR2X1 U25 ( .A(n2), .B(n13), .Y(ab3[6]) );
  NOR2X1 U26 ( .A(n2), .B(n12), .Y(ab3[5]) );
  NOR2X1 U27 ( .A(n2), .B(n11), .Y(ab3[4]) );
  NOR2X1 U28 ( .A(n2), .B(n5), .Y(ab3[3]) );
  NOR2X1 U29 ( .A(n2), .B(n20), .Y(ab3[18]) );
  NOR2X1 U30 ( .A(n2), .B(n10), .Y(ab3[17]) );
  NOR2X1 U31 ( .A(n2), .B(n9), .Y(ab3[16]) );
  NOR2X1 U32 ( .A(n2), .B(n8), .Y(ab3[15]) );
  NOR2X1 U33 ( .A(n2), .B(n7), .Y(ab3[14]) );
  NOR2X1 U34 ( .A(n2), .B(n6), .Y(ab3[13]) );
  NOR2X1 U35 ( .A(n2), .B(n19), .Y(ab3[12]) );
  NOR2X1 U36 ( .A(n2), .B(n18), .Y(ab3[11]) );
  NOR2X1 U37 ( .A(n2), .B(n17), .Y(ab3[10]) );
  NOR2X1 U38 ( .A(n17), .B(n3), .Y(ab2[9]) );
  NOR2X1 U39 ( .A(n16), .B(n3), .Y(ab2[8]) );
  NOR2X1 U40 ( .A(n15), .B(n3), .Y(ab2[7]) );
  NOR2X1 U41 ( .A(n14), .B(n3), .Y(ab2[6]) );
  NOR2X1 U42 ( .A(n13), .B(n3), .Y(ab2[5]) );
  NOR2X1 U43 ( .A(n12), .B(n3), .Y(ab2[4]) );
  NOR2X1 U44 ( .A(n11), .B(n3), .Y(ab2[3]) );
  NOR2X1 U45 ( .A(n5), .B(n3), .Y(ab2[2]) );
  NOR2X1 U46 ( .A(n20), .B(n3), .Y(ab2[17]) );
  NOR2X1 U47 ( .A(n10), .B(n3), .Y(ab2[16]) );
  NOR2X1 U48 ( .A(n9), .B(n3), .Y(ab2[15]) );
  NOR2X1 U49 ( .A(n8), .B(n3), .Y(ab2[14]) );
  NOR2X1 U50 ( .A(n7), .B(n3), .Y(ab2[13]) );
  NOR2X1 U51 ( .A(n6), .B(n3), .Y(ab2[12]) );
  NOR2X1 U52 ( .A(n19), .B(n3), .Y(ab2[11]) );
  NOR2X1 U53 ( .A(n18), .B(n3), .Y(ab2[10]) );
  NOR2X1 U54 ( .A(n18), .B(n4), .Y(ab1[9]) );
  NOR2X1 U55 ( .A(n17), .B(n4), .Y(ab1[8]) );
  NOR2X1 U56 ( .A(n16), .B(n4), .Y(ab1[7]) );
  NOR2X1 U57 ( .A(n15), .B(n4), .Y(ab1[6]) );
  NOR2X1 U58 ( .A(n14), .B(n4), .Y(ab1[5]) );
  NOR2X1 U59 ( .A(n13), .B(n4), .Y(ab1[4]) );
  NOR2X1 U60 ( .A(n12), .B(n4), .Y(ab1[3]) );
  NOR2X1 U61 ( .A(n11), .B(n4), .Y(ab1[2]) );
  NOR2X1 U62 ( .A(n5), .B(n4), .Y(ab1[1]) );
  NOR2X1 U63 ( .A(n10), .B(n4), .Y(ab1[15]) );
  NOR2X1 U64 ( .A(n9), .B(n4), .Y(ab1[14]) );
  NOR2X1 U65 ( .A(n8), .B(n4), .Y(ab1[13]) );
  NOR2X1 U66 ( .A(n7), .B(n4), .Y(ab1[12]) );
  NOR2X1 U67 ( .A(n6), .B(n4), .Y(ab1[11]) );
  NOR2X1 U68 ( .A(n19), .B(n4), .Y(ab1[10]) );
  NOR2X1 U69 ( .A(n19), .B(n1), .Y(ab0[9]) );
  NOR2X1 U70 ( .A(n18), .B(n1), .Y(ab0[8]) );
  NOR2X1 U71 ( .A(n17), .B(n1), .Y(ab0[7]) );
  NOR2X1 U72 ( .A(n16), .B(n1), .Y(ab0[6]) );
  NOR2X1 U73 ( .A(n15), .B(n1), .Y(ab0[5]) );
  NOR2X1 U74 ( .A(n14), .B(n1), .Y(ab0[4]) );
  NOR2X1 U75 ( .A(n13), .B(n1), .Y(ab0[3]) );
  NOR2X1 U76 ( .A(n12), .B(n1), .Y(ab0[2]) );
  NOR2X1 U77 ( .A(n11), .B(n1), .Y(ab0[1]) );
  NOR2X1 U78 ( .A(n20), .B(n1), .Y(ab0[15]) );
  NOR2X1 U79 ( .A(n10), .B(n1), .Y(ab0[14]) );
  NOR2X1 U80 ( .A(n9), .B(n1), .Y(ab0[13]) );
  NOR2X1 U81 ( .A(n8), .B(n1), .Y(ab0[12]) );
  NOR2X1 U82 ( .A(n7), .B(n1), .Y(ab0[11]) );
  NOR2X1 U83 ( .A(n6), .B(n1), .Y(ab0[10]) );
  NOR2X1 U84 ( .A(n5), .B(n1), .Y(ab0[0]) );
  cla_16bit_15 A1 ( .a(ab0), .b({ab1, 1'b0}), .cin(1'b0), .cout(couts[0]), 
        .sum({\sums[0][15] , \sums[0][14] , \sums[0][13] , \sums[0][12] , 
        \sums[0][11] , \sums[0][10] , \sums[0][9] , \sums[0][8] , \sums[0][7] , 
        \sums[0][6] , \sums[0][5] , \sums[0][4] , \sums[0][3] , \sums[0][2] , 
        \sums[0][1] , \sums[0][0] }) );
  adder_1bit_23 A1_1 ( .a(1'b0), .b(ab2[16]), .carry_in(couts[0]), .sum(
        \sums[0][16] ), .carry_out(\sums[0][17] ) );
  cla_16bit_14 A2 ( .a({\sums[0][15] , \sums[0][14] , \sums[0][13] , 
        \sums[0][12] , \sums[0][11] , \sums[0][10] , \sums[0][9] , 
        \sums[0][8] , \sums[0][7] , \sums[0][6] , \sums[0][5] , \sums[0][4] , 
        \sums[0][3] , \sums[0][2] , \sums[0][1] , \sums[0][0] }), .b({
        ab2[15:2], 1'b0, 1'b0}), .cin(1'b0), .cout(couts[1]), .sum({
        \sums[1][15] , \sums[1][14] , \sums[1][13] , \sums[1][12] , 
        \sums[1][11] , \sums[1][10] , \sums[1][9] , \sums[1][8] , \sums[1][7] , 
        \sums[1][6] , \sums[1][5] , \sums[1][4] , \sums[1][3] , \sums[1][2] , 
        \sums[1][1] , \sums[1][0] }) );
  adder_1bit_22 A2_1 ( .a(\sums[0][16] ), .b(ab2[16]), .carry_in(couts[1]), 
        .sum(\sums[1][16] ), .carry_out(couts[2]) );
  adder_1bit_21 A2_2 ( .a(\sums[0][17] ), .b(ab2[17]), .carry_in(couts[2]), 
        .sum(\sums[1][17] ), .carry_out(\sums[1][18] ) );
  cla_16bit_13 A3 ( .a({\sums[1][15] , \sums[1][14] , \sums[1][13] , 
        \sums[1][12] , \sums[1][11] , \sums[1][10] , \sums[1][9] , 
        \sums[1][8] , \sums[1][7] , \sums[1][6] , \sums[1][5] , \sums[1][4] , 
        \sums[1][3] , \sums[1][2] , \sums[1][1] , \sums[1][0] }), .b({
        ab3[15:3], 1'b0, 1'b0, 1'b0}), .cin(1'b0), .cout(couts[3]), .sum(
        product[15:0]) );
  adder_1bit_20 A3_1 ( .a(\sums[1][16] ), .b(ab3[16]), .carry_in(couts[3]), 
        .sum(product[16]), .carry_out(couts[4]) );
  adder_1bit_19 A3_2 ( .a(\sums[1][17] ), .b(ab3[17]), .carry_in(couts[4]), 
        .sum(product[17]), .carry_out(couts[5]) );
  adder_1bit_18 A3_3 ( .a(\sums[1][18] ), .b(ab3[18]), .carry_in(couts[5]), 
        .sum(product[18]), .carry_out(product[19]) );
  INVX2 U2 ( .A(b[2]), .Y(n3) );
  INVX2 U3 ( .A(b[0]), .Y(n1) );
  INVX2 U4 ( .A(b[3]), .Y(n2) );
  INVX2 U5 ( .A(b[1]), .Y(n4) );
  INVX2 U6 ( .A(a[0]), .Y(n5) );
  INVX2 U7 ( .A(a[10]), .Y(n6) );
  INVX2 U8 ( .A(a[11]), .Y(n7) );
  INVX2 U9 ( .A(a[12]), .Y(n8) );
  INVX2 U10 ( .A(a[13]), .Y(n9) );
  INVX2 U11 ( .A(a[14]), .Y(n10) );
  INVX2 U12 ( .A(a[1]), .Y(n11) );
  INVX2 U13 ( .A(a[2]), .Y(n12) );
  INVX2 U14 ( .A(a[3]), .Y(n13) );
  INVX2 U15 ( .A(a[4]), .Y(n14) );
  INVX2 U16 ( .A(a[5]), .Y(n15) );
  INVX2 U17 ( .A(a[6]), .Y(n16) );
  INVX2 U18 ( .A(a[7]), .Y(n17) );
  INVX2 U19 ( .A(a[8]), .Y(n18) );
  INVX2 U20 ( .A(a[9]), .Y(n19) );
  INVX2 U21 ( .A(a[15]), .Y(n20) );
endmodule


module cla_4bit_161 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n2), .B(n5), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n2), .B(n5), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n2), .B(n5), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(b[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(a[3]), .Y(n5) );
endmodule


module cla_4bit_160 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n4), .B(n5), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n4), .B(n5), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n4), .B(n5), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(b[3]), .Y(n4) );
  INVX2 U10 ( .A(a[3]), .Y(n5) );
endmodule


module cla_4bit_159 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n4), .B(n5), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n4), .B(n5), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n4), .B(n5), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(b[3]), .Y(n4) );
  INVX2 U10 ( .A(a[3]), .Y(n5) );
endmodule


module cla_4bit_158 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n1), .C(n4), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n3), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n1), .C(n39), .D(n4), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n1), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n2), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n3), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(a[3]), .Y(n1) );
  INVX2 U7 ( .A(n36), .Y(n2) );
  INVX2 U8 ( .A(n23), .Y(n3) );
  INVX2 U9 ( .A(n28), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_16bit_39 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   cout, n2, n3, n4, n11, n12, n13, n14, n15, n16;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  NOR2X1 U5 ( .A(n16), .B(n15), .Y(pg) );
  NAND2X1 U6 ( .A(p[3]), .B(p[2]), .Y(n15) );
  NAND2X1 U7 ( .A(p[1]), .B(p[0]), .Y(n16) );
  AOI21X1 U8 ( .A(n2), .B(p[3]), .C(g[3]), .Y(n14) );
  AOI21X1 U9 ( .A(n3), .B(p[2]), .C(g[2]), .Y(n13) );
  AOI21X1 U10 ( .A(n4), .B(p[1]), .C(g[1]), .Y(n12) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n11) );
  cla_4bit_161 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_160 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n4), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_159 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n3), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_158 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n2), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  INVX2 U1 ( .A(n14), .Y(cout) );
  INVX2 U2 ( .A(n13), .Y(n2) );
  INVX2 U3 ( .A(n12), .Y(n3) );
  INVX2 U4 ( .A(n11), .Y(n4) );
endmodule


module cla_4bit_157 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n2), .B(n5), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n2), .B(n5), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n2), .B(n5), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(b[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(a[3]), .Y(n5) );
endmodule


module cla_4bit_156 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n4), .B(n5), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n4), .B(n5), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n4), .B(n5), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(b[3]), .Y(n4) );
  INVX2 U10 ( .A(a[3]), .Y(n5) );
endmodule


module cla_4bit_155 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n4), .B(n5), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n4), .B(n5), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n4), .B(n5), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(b[3]), .Y(n4) );
  INVX2 U10 ( .A(a[3]), .Y(n5) );
endmodule


module cla_4bit_154 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n1), .C(n4), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n3), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n1), .C(n39), .D(n4), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n1), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n2), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n3), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(a[3]), .Y(n1) );
  INVX2 U7 ( .A(n36), .Y(n2) );
  INVX2 U8 ( .A(n23), .Y(n3) );
  INVX2 U9 ( .A(n28), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_16bit_38 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   cout, n2, n3, n4, n11, n12, n13, n14, n15, n16;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  NOR2X1 U5 ( .A(n16), .B(n15), .Y(pg) );
  NAND2X1 U6 ( .A(p[3]), .B(p[2]), .Y(n15) );
  NAND2X1 U7 ( .A(p[1]), .B(p[0]), .Y(n16) );
  AOI21X1 U8 ( .A(n2), .B(p[3]), .C(g[3]), .Y(n14) );
  AOI21X1 U9 ( .A(n3), .B(p[2]), .C(g[2]), .Y(n13) );
  AOI21X1 U10 ( .A(n4), .B(p[1]), .C(g[1]), .Y(n12) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n11) );
  cla_4bit_157 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_156 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n4), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_155 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n3), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_154 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n2), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  INVX2 U1 ( .A(n14), .Y(cout) );
  INVX2 U2 ( .A(n13), .Y(n2) );
  INVX2 U3 ( .A(n12), .Y(n3) );
  INVX2 U4 ( .A(n11), .Y(n4) );
endmodule


module amp_comp_1 ( clk, n_rst, inchan, in_thresh, outchan );
  input [15:0] inchan;
  input [3:0] in_thresh;
  output [15:0] outchan;
  input clk, n_rst;
  wire   \AcmpB[15] , \CcmpD[15] , \diff1[15] , n156, n157, n158, n159, n160,
         n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171,
         n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, n182,
         n183, n184, n185, n186, n187, n188, n190, n191, n192, n193, n194,
         n195, n196, n197, n198, n199, n200, n201, n202, n203, n204, n205,
         n206, n207, n208, n209, n210, n211, n212, n213, n214, n215, n216,
         n217, n218, n219, n220, n221, n222, n223, n224, n225, n226, n227,
         n228, n229, n230, n231, n232, n233, n235, n236, n237, n238, n239,
         n240, n241, n242, n243, n244, n245, n246, n247, n248, n249, n251,
         n252, n253, n254, n255, n256, n257, n258, n259, n260, n261, n262,
         n263, n264, n265, n267, n269, n270, n271, n272, n273, n274, n275,
         n276, n277, n278, n279, n280, n281, n282, n283, n284, n285, n286,
         n287, n288, n289, n290, n291, n292, n293, n294, n295, n296, n297,
         n298, n299, n300, n301, n302, n303, n304, n305, n306, n307, n308,
         n309, n310, n311, n312, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n40, n42, n44, n46, n48, n50, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83,
         n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97,
         n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109,
         n110, n111, n112, n113, n114, n115, n116, n117, n118, n119, n120,
         n121, n122, n123, n124, n125, n126, n127, n128, n129, n130, n131,
         n132, n133, n134, n135, n136, n137, n138, n139, n140, n141, n142,
         n143, n144, n145, n146, n147, n148, n149, n150, n151, n152, n153,
         n189, n234, n250, n266, n268, n314, n315, n316, n317, n318, n319,
         n320, n321, n322, n323, n324, n325, n326, n327, n328, n329, n330;
  wire   [15:0] reg_1_out;
  wire   [15:0] reg_2_out;
  wire   [15:0] reg_3_out;
  wire   [15:0] reg_4_out;
  wire   [15:0] A_opp_sign;
  wire   [15:0] A;
  wire   [15:0] B_opp_sign;
  wire   [15:0] C_opp_sign;
  wire   [15:0] C;
  wire   [15:0] D_opp_sign;
  wire   [15:0] D;
  wire   [15:0] max;
  wire   [15:0] diff2;
  wire   [19:0] product;
  wire   [14:0] modifier;
  wire   [15:0] out_pos_val;
  wire   [15:0] out_neg_val;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29, 
        SYNOPSYS_UNCONNECTED__30, SYNOPSYS_UNCONNECTED__31, 
        SYNOPSYS_UNCONNECTED__32, SYNOPSYS_UNCONNECTED__33, 
        SYNOPSYS_UNCONNECTED__34, SYNOPSYS_UNCONNECTED__35, 
        SYNOPSYS_UNCONNECTED__36, SYNOPSYS_UNCONNECTED__37, 
        SYNOPSYS_UNCONNECTED__38, SYNOPSYS_UNCONNECTED__39, 
        SYNOPSYS_UNCONNECTED__40, SYNOPSYS_UNCONNECTED__41, 
        SYNOPSYS_UNCONNECTED__42, SYNOPSYS_UNCONNECTED__43, 
        SYNOPSYS_UNCONNECTED__44, SYNOPSYS_UNCONNECTED__45, 
        SYNOPSYS_UNCONNECTED__46, SYNOPSYS_UNCONNECTED__47, 
        SYNOPSYS_UNCONNECTED__48, SYNOPSYS_UNCONNECTED__49, 
        SYNOPSYS_UNCONNECTED__50, SYNOPSYS_UNCONNECTED__51, 
        SYNOPSYS_UNCONNECTED__52, SYNOPSYS_UNCONNECTED__53, 
        SYNOPSYS_UNCONNECTED__54, SYNOPSYS_UNCONNECTED__55, 
        SYNOPSYS_UNCONNECTED__56, SYNOPSYS_UNCONNECTED__57, 
        SYNOPSYS_UNCONNECTED__58, SYNOPSYS_UNCONNECTED__59, 
        SYNOPSYS_UNCONNECTED__60;

  AOI22X1 U160 ( .A(out_neg_val[9]), .B(n14), .C(out_pos_val[9]), .D(n18), .Y(
        n156) );
  AOI22X1 U161 ( .A(out_neg_val[8]), .B(n13), .C(out_pos_val[8]), .D(n17), .Y(
        n157) );
  AOI22X1 U162 ( .A(out_neg_val[7]), .B(n14), .C(out_pos_val[7]), .D(n17), .Y(
        n158) );
  AOI22X1 U163 ( .A(out_neg_val[6]), .B(n13), .C(out_pos_val[6]), .D(n17), .Y(
        n159) );
  AOI22X1 U164 ( .A(out_neg_val[5]), .B(n14), .C(out_pos_val[5]), .D(n18), .Y(
        n160) );
  AOI22X1 U165 ( .A(out_neg_val[4]), .B(n13), .C(out_pos_val[4]), .D(n18), .Y(
        n161) );
  AOI22X1 U166 ( .A(out_neg_val[3]), .B(n14), .C(out_pos_val[3]), .D(n18), .Y(
        n162) );
  AOI22X1 U167 ( .A(out_neg_val[2]), .B(n13), .C(out_pos_val[2]), .D(n18), .Y(
        n163) );
  AOI22X1 U168 ( .A(out_neg_val[1]), .B(n14), .C(out_pos_val[1]), .D(n18), .Y(
        n164) );
  AOI22X1 U169 ( .A(out_neg_val[15]), .B(n13), .C(out_pos_val[15]), .D(n18), 
        .Y(n165) );
  AOI22X1 U170 ( .A(out_neg_val[14]), .B(n14), .C(out_pos_val[14]), .D(n19), 
        .Y(n166) );
  AOI22X1 U171 ( .A(out_neg_val[13]), .B(n13), .C(out_pos_val[13]), .D(n19), 
        .Y(n167) );
  AOI22X1 U172 ( .A(out_neg_val[12]), .B(n14), .C(out_pos_val[12]), .D(n19), 
        .Y(n168) );
  AOI22X1 U173 ( .A(out_neg_val[11]), .B(n13), .C(out_pos_val[11]), .D(n19), 
        .Y(n169) );
  AOI22X1 U174 ( .A(out_neg_val[10]), .B(n13), .C(out_pos_val[10]), .D(n19), 
        .Y(n170) );
  AOI22X1 U175 ( .A(out_neg_val[0]), .B(n14), .C(out_pos_val[0]), .D(n16), .Y(
        n171) );
  NAND2X1 U177 ( .A(n187), .B(n188), .Y(modifier[9]) );
  AOI22X1 U178 ( .A(product[14]), .B(n63), .C(product[15]), .D(n64), .Y(n188)
         );
  AOI22X1 U179 ( .A(product[16]), .B(n62), .C(n15), .D(product[17]), .Y(n187)
         );
  NAND2X1 U180 ( .A(n190), .B(n191), .Y(modifier[8]) );
  AOI22X1 U181 ( .A(product[13]), .B(n63), .C(product[14]), .D(n64), .Y(n191)
         );
  AOI22X1 U182 ( .A(product[15]), .B(n62), .C(n15), .D(product[16]), .Y(n190)
         );
  NAND2X1 U183 ( .A(n192), .B(n193), .Y(modifier[7]) );
  AOI22X1 U184 ( .A(product[12]), .B(n63), .C(product[13]), .D(n64), .Y(n193)
         );
  AOI22X1 U185 ( .A(product[14]), .B(n62), .C(product[15]), .D(n15), .Y(n192)
         );
  NAND2X1 U186 ( .A(n194), .B(n195), .Y(modifier[6]) );
  AOI22X1 U187 ( .A(product[11]), .B(n63), .C(product[12]), .D(n64), .Y(n195)
         );
  AOI22X1 U188 ( .A(product[13]), .B(n62), .C(product[14]), .D(n15), .Y(n194)
         );
  NAND2X1 U189 ( .A(n196), .B(n197), .Y(modifier[5]) );
  AOI22X1 U190 ( .A(product[10]), .B(n63), .C(product[11]), .D(n64), .Y(n197)
         );
  AOI22X1 U191 ( .A(product[12]), .B(n62), .C(product[13]), .D(n15), .Y(n196)
         );
  NAND2X1 U192 ( .A(n198), .B(n199), .Y(modifier[4]) );
  AOI22X1 U193 ( .A(product[9]), .B(n63), .C(product[10]), .D(n64), .Y(n199)
         );
  AOI22X1 U194 ( .A(product[11]), .B(n62), .C(product[12]), .D(n15), .Y(n198)
         );
  NAND2X1 U195 ( .A(n200), .B(n201), .Y(modifier[3]) );
  AOI22X1 U196 ( .A(product[8]), .B(n63), .C(product[9]), .D(n64), .Y(n201) );
  AOI22X1 U197 ( .A(product[10]), .B(n62), .C(product[11]), .D(n15), .Y(n200)
         );
  NAND2X1 U198 ( .A(n202), .B(n203), .Y(modifier[2]) );
  AOI22X1 U199 ( .A(product[7]), .B(n63), .C(product[8]), .D(n64), .Y(n203) );
  AOI22X1 U200 ( .A(product[9]), .B(n62), .C(product[10]), .D(n15), .Y(n202)
         );
  NAND2X1 U201 ( .A(n204), .B(n205), .Y(modifier[1]) );
  AOI22X1 U202 ( .A(product[6]), .B(n63), .C(product[7]), .D(n64), .Y(n205) );
  AOI22X1 U203 ( .A(product[8]), .B(n62), .C(product[9]), .D(n15), .Y(n204) );
  NOR2X1 U204 ( .A(n61), .B(n206), .Y(modifier[14]) );
  AOI22X1 U205 ( .A(product[19]), .B(n64), .C(n63), .D(product[18]), .Y(n297)
         );
  OAI21X1 U206 ( .A(n61), .B(n207), .C(n208), .Y(modifier[12]) );
  AOI22X1 U207 ( .A(product[17]), .B(n63), .C(n64), .D(product[18]), .Y(n208)
         );
  NAND2X1 U208 ( .A(n209), .B(n210), .Y(modifier[11]) );
  AOI22X1 U209 ( .A(product[16]), .B(n63), .C(product[17]), .D(n64), .Y(n210)
         );
  AOI22X1 U210 ( .A(n62), .B(product[18]), .C(n15), .D(product[19]), .Y(n209)
         );
  NAND2X1 U211 ( .A(n211), .B(n212), .Y(modifier[10]) );
  AOI22X1 U212 ( .A(product[15]), .B(n63), .C(product[16]), .D(n64), .Y(n212)
         );
  AOI22X1 U213 ( .A(n62), .B(product[17]), .C(n15), .D(product[18]), .Y(n211)
         );
  NAND2X1 U214 ( .A(n213), .B(n214), .Y(modifier[0]) );
  AOI22X1 U215 ( .A(product[5]), .B(n63), .C(product[6]), .D(n64), .Y(n214) );
  NAND3X1 U216 ( .A(max[12]), .B(n65), .C(n216), .Y(n215) );
  NAND3X1 U217 ( .A(n216), .B(max[11]), .C(n217), .Y(n206) );
  NOR2X1 U218 ( .A(max[13]), .B(max[12]), .Y(n217) );
  AOI22X1 U219 ( .A(product[7]), .B(n62), .C(product[8]), .D(n15), .Y(n213) );
  NAND2X1 U221 ( .A(n216), .B(max[13]), .Y(n207) );
  NOR2X1 U222 ( .A(max[14]), .B(diff2[15]), .Y(n216) );
  OAI22X1 U223 ( .A(n303), .B(n10), .C(\diff1[15] ), .D(n218), .Y(max[9]) );
  OAI22X1 U224 ( .A(D[9]), .B(n8), .C(\CcmpD[15] ), .D(C[9]), .Y(n303) );
  OAI22X1 U225 ( .A(n304), .B(n10), .C(\diff1[15] ), .D(n219), .Y(max[8]) );
  OAI22X1 U226 ( .A(D[8]), .B(n8), .C(\CcmpD[15] ), .D(C[8]), .Y(n304) );
  OAI22X1 U227 ( .A(n305), .B(n10), .C(\diff1[15] ), .D(n220), .Y(max[7]) );
  OAI22X1 U228 ( .A(D[7]), .B(n8), .C(\CcmpD[15] ), .D(C[7]), .Y(n305) );
  OAI22X1 U229 ( .A(n306), .B(n10), .C(\diff1[15] ), .D(n221), .Y(max[6]) );
  OAI22X1 U230 ( .A(D[6]), .B(n8), .C(\CcmpD[15] ), .D(C[6]), .Y(n306) );
  OAI22X1 U231 ( .A(n307), .B(n10), .C(\diff1[15] ), .D(n222), .Y(max[5]) );
  OAI22X1 U232 ( .A(D[5]), .B(n8), .C(\CcmpD[15] ), .D(C[5]), .Y(n307) );
  OAI22X1 U233 ( .A(n308), .B(n10), .C(n11), .D(n223), .Y(max[4]) );
  OAI22X1 U234 ( .A(D[4]), .B(n8), .C(n9), .D(C[4]), .Y(n308) );
  OAI22X1 U235 ( .A(n309), .B(n10), .C(n11), .D(n224), .Y(max[3]) );
  OAI22X1 U236 ( .A(D[3]), .B(n8), .C(n9), .D(C[3]), .Y(n309) );
  OAI22X1 U237 ( .A(n310), .B(n10), .C(n11), .D(n225), .Y(max[2]) );
  OAI22X1 U238 ( .A(D[2]), .B(n8), .C(n9), .D(C[2]), .Y(n310) );
  OAI22X1 U239 ( .A(n311), .B(n10), .C(n11), .D(n226), .Y(max[1]) );
  OAI22X1 U240 ( .A(D[1]), .B(n8), .C(n9), .D(C[1]), .Y(n311) );
  OAI22X1 U241 ( .A(n298), .B(n10), .C(n11), .D(n227), .Y(max[14]) );
  OAI22X1 U242 ( .A(D[14]), .B(n8), .C(n9), .D(C[14]), .Y(n298) );
  OAI22X1 U243 ( .A(n299), .B(n10), .C(n11), .D(n228), .Y(max[13]) );
  OAI22X1 U244 ( .A(D[13]), .B(n8), .C(n9), .D(C[13]), .Y(n299) );
  OAI22X1 U245 ( .A(n300), .B(n10), .C(n11), .D(n229), .Y(max[12]) );
  OAI22X1 U246 ( .A(D[12]), .B(n8), .C(n9), .D(C[12]), .Y(n300) );
  OAI22X1 U247 ( .A(n301), .B(n10), .C(n11), .D(n230), .Y(max[11]) );
  OAI22X1 U248 ( .A(D[11]), .B(n8), .C(n9), .D(C[11]), .Y(n301) );
  OAI22X1 U249 ( .A(n302), .B(n10), .C(n11), .D(n231), .Y(max[10]) );
  OAI22X1 U250 ( .A(D[10]), .B(n8), .C(n9), .D(C[10]), .Y(n302) );
  OAI22X1 U251 ( .A(n312), .B(n10), .C(n11), .D(n232), .Y(max[0]) );
  OAI22X1 U252 ( .A(D[0]), .B(n8), .C(n9), .D(C[0]), .Y(n312) );
  OAI21X1 U253 ( .A(n14), .B(n147), .C(n233), .Y(D[9]) );
  AOI21X1 U254 ( .A(D_opp_sign[9]), .B(n12), .C(n2), .Y(n233) );
  OAI21X1 U255 ( .A(n13), .B(n148), .C(n235), .Y(D[8]) );
  AOI21X1 U256 ( .A(D_opp_sign[8]), .B(n12), .C(n2), .Y(n235) );
  OAI21X1 U257 ( .A(n14), .B(n149), .C(n236), .Y(D[7]) );
  AOI21X1 U258 ( .A(D_opp_sign[7]), .B(n12), .C(n2), .Y(n236) );
  OAI21X1 U259 ( .A(n13), .B(n150), .C(n237), .Y(D[6]) );
  AOI21X1 U260 ( .A(D_opp_sign[6]), .B(n12), .C(n2), .Y(n237) );
  OAI21X1 U261 ( .A(n14), .B(n151), .C(n238), .Y(D[5]) );
  AOI21X1 U262 ( .A(D_opp_sign[5]), .B(n12), .C(n2), .Y(n238) );
  OAI21X1 U263 ( .A(n13), .B(n152), .C(n239), .Y(D[4]) );
  AOI21X1 U264 ( .A(D_opp_sign[4]), .B(n12), .C(n2), .Y(n239) );
  OAI21X1 U265 ( .A(n14), .B(n153), .C(n240), .Y(D[3]) );
  AOI21X1 U266 ( .A(D_opp_sign[3]), .B(n14), .C(n2), .Y(n240) );
  OAI21X1 U267 ( .A(n13), .B(n189), .C(n241), .Y(D[2]) );
  AOI21X1 U268 ( .A(D_opp_sign[2]), .B(n13), .C(n2), .Y(n241) );
  OAI21X1 U269 ( .A(n14), .B(n234), .C(n242), .Y(D[1]) );
  AOI21X1 U270 ( .A(D_opp_sign[1]), .B(n14), .C(n2), .Y(n242) );
  OAI21X1 U271 ( .A(n13), .B(n142), .C(n243), .Y(D[14]) );
  AOI21X1 U272 ( .A(D_opp_sign[14]), .B(n13), .C(n2), .Y(n243) );
  OAI21X1 U273 ( .A(n14), .B(n143), .C(n244), .Y(D[13]) );
  AOI21X1 U274 ( .A(D_opp_sign[13]), .B(n14), .C(n2), .Y(n244) );
  OAI21X1 U275 ( .A(n13), .B(n144), .C(n245), .Y(D[12]) );
  AOI21X1 U276 ( .A(D_opp_sign[12]), .B(n13), .C(n2), .Y(n245) );
  OAI21X1 U277 ( .A(n14), .B(n145), .C(n246), .Y(D[11]) );
  AOI21X1 U278 ( .A(D_opp_sign[11]), .B(n14), .C(n2), .Y(n246) );
  OAI21X1 U279 ( .A(n13), .B(n146), .C(n247), .Y(D[10]) );
  AOI21X1 U280 ( .A(D_opp_sign[10]), .B(n13), .C(n2), .Y(n247) );
  OAI21X1 U281 ( .A(n14), .B(n250), .C(n248), .Y(D[0]) );
  AOI21X1 U282 ( .A(D_opp_sign[0]), .B(n12), .C(n2), .Y(n248) );
  OAI21X1 U283 ( .A(reg_3_out[15]), .B(n117), .C(n249), .Y(C[9]) );
  AOI21X1 U284 ( .A(C_opp_sign[9]), .B(reg_3_out[15]), .C(n4), .Y(n249) );
  OAI21X1 U285 ( .A(reg_3_out[15]), .B(n118), .C(n251), .Y(C[8]) );
  AOI21X1 U286 ( .A(C_opp_sign[8]), .B(reg_3_out[15]), .C(n4), .Y(n251) );
  OAI21X1 U287 ( .A(n20), .B(n119), .C(n252), .Y(C[7]) );
  AOI21X1 U288 ( .A(C_opp_sign[7]), .B(n20), .C(n4), .Y(n252) );
  OAI21X1 U289 ( .A(n20), .B(n120), .C(n253), .Y(C[6]) );
  AOI21X1 U290 ( .A(C_opp_sign[6]), .B(n20), .C(n4), .Y(n253) );
  OAI21X1 U291 ( .A(n20), .B(n121), .C(n254), .Y(C[5]) );
  AOI21X1 U292 ( .A(C_opp_sign[5]), .B(n20), .C(n4), .Y(n254) );
  OAI21X1 U293 ( .A(n20), .B(n122), .C(n255), .Y(C[4]) );
  AOI21X1 U294 ( .A(C_opp_sign[4]), .B(n20), .C(n4), .Y(n255) );
  OAI21X1 U295 ( .A(n20), .B(n123), .C(n256), .Y(C[3]) );
  AOI21X1 U296 ( .A(C_opp_sign[3]), .B(n20), .C(n4), .Y(n256) );
  OAI21X1 U297 ( .A(n20), .B(n124), .C(n257), .Y(C[2]) );
  AOI21X1 U298 ( .A(C_opp_sign[2]), .B(n20), .C(n4), .Y(n257) );
  OAI21X1 U299 ( .A(n20), .B(n125), .C(n258), .Y(C[1]) );
  AOI21X1 U300 ( .A(C_opp_sign[1]), .B(n20), .C(n4), .Y(n258) );
  OAI21X1 U301 ( .A(reg_3_out[15]), .B(n112), .C(n259), .Y(C[14]) );
  AOI21X1 U302 ( .A(C_opp_sign[14]), .B(n20), .C(n4), .Y(n259) );
  OAI21X1 U303 ( .A(reg_3_out[15]), .B(n113), .C(n260), .Y(C[13]) );
  AOI21X1 U304 ( .A(C_opp_sign[13]), .B(n20), .C(n4), .Y(n260) );
  OAI21X1 U305 ( .A(reg_3_out[15]), .B(n114), .C(n261), .Y(C[12]) );
  AOI21X1 U306 ( .A(C_opp_sign[12]), .B(n20), .C(n4), .Y(n261) );
  OAI21X1 U307 ( .A(reg_3_out[15]), .B(n115), .C(n262), .Y(C[11]) );
  AOI21X1 U308 ( .A(C_opp_sign[11]), .B(n20), .C(n4), .Y(n262) );
  OAI21X1 U309 ( .A(reg_3_out[15]), .B(n116), .C(n263), .Y(C[10]) );
  AOI21X1 U310 ( .A(C_opp_sign[10]), .B(n20), .C(n4), .Y(n263) );
  OAI21X1 U311 ( .A(reg_3_out[15]), .B(n126), .C(n264), .Y(C[0]) );
  AOI21X1 U312 ( .A(C_opp_sign[0]), .B(n20), .C(n4), .Y(n264) );
  AOI22X1 U313 ( .A(n6), .B(A[9]), .C(n177), .D(\AcmpB[15] ), .Y(n218) );
  OAI21X1 U314 ( .A(reg_2_out[15]), .B(n102), .C(n265), .Y(n177) );
  AOI21X1 U315 ( .A(B_opp_sign[9]), .B(reg_2_out[15]), .C(n1), .Y(n265) );
  OAI21X1 U316 ( .A(reg_1_out[15]), .B(n317), .C(n267), .Y(A[9]) );
  AOI21X1 U317 ( .A(A_opp_sign[9]), .B(reg_1_out[15]), .C(n3), .Y(n267) );
  AOI22X1 U318 ( .A(n6), .B(A[8]), .C(n178), .D(\AcmpB[15] ), .Y(n219) );
  OAI21X1 U319 ( .A(reg_2_out[15]), .B(n103), .C(n269), .Y(n178) );
  AOI21X1 U320 ( .A(B_opp_sign[8]), .B(reg_2_out[15]), .C(n1), .Y(n269) );
  OAI21X1 U321 ( .A(reg_1_out[15]), .B(n318), .C(n270), .Y(A[8]) );
  AOI21X1 U322 ( .A(A_opp_sign[8]), .B(reg_1_out[15]), .C(n3), .Y(n270) );
  AOI22X1 U323 ( .A(n6), .B(A[7]), .C(n179), .D(\AcmpB[15] ), .Y(n220) );
  OAI21X1 U324 ( .A(n22), .B(n104), .C(n271), .Y(n179) );
  AOI21X1 U325 ( .A(B_opp_sign[7]), .B(n22), .C(n1), .Y(n271) );
  OAI21X1 U326 ( .A(n24), .B(n319), .C(n272), .Y(A[7]) );
  AOI21X1 U327 ( .A(A_opp_sign[7]), .B(n24), .C(n3), .Y(n272) );
  AOI22X1 U328 ( .A(n6), .B(A[6]), .C(n180), .D(\AcmpB[15] ), .Y(n221) );
  OAI21X1 U329 ( .A(n22), .B(n105), .C(n273), .Y(n180) );
  AOI21X1 U330 ( .A(B_opp_sign[6]), .B(n22), .C(n1), .Y(n273) );
  OAI21X1 U331 ( .A(n24), .B(n320), .C(n274), .Y(A[6]) );
  AOI21X1 U332 ( .A(A_opp_sign[6]), .B(n24), .C(n3), .Y(n274) );
  AOI22X1 U333 ( .A(n6), .B(A[5]), .C(n181), .D(\AcmpB[15] ), .Y(n222) );
  OAI21X1 U334 ( .A(n22), .B(n106), .C(n275), .Y(n181) );
  AOI21X1 U335 ( .A(B_opp_sign[5]), .B(n22), .C(n1), .Y(n275) );
  OAI21X1 U336 ( .A(n24), .B(n321), .C(n276), .Y(A[5]) );
  AOI21X1 U337 ( .A(A_opp_sign[5]), .B(n24), .C(n3), .Y(n276) );
  AOI22X1 U338 ( .A(n6), .B(A[4]), .C(n182), .D(n7), .Y(n223) );
  OAI21X1 U339 ( .A(n22), .B(n107), .C(n277), .Y(n182) );
  AOI21X1 U340 ( .A(B_opp_sign[4]), .B(n22), .C(n1), .Y(n277) );
  OAI21X1 U341 ( .A(n24), .B(n322), .C(n278), .Y(A[4]) );
  AOI21X1 U342 ( .A(A_opp_sign[4]), .B(n24), .C(n3), .Y(n278) );
  AOI22X1 U343 ( .A(n6), .B(A[3]), .C(n183), .D(n7), .Y(n224) );
  OAI21X1 U344 ( .A(n22), .B(n108), .C(n279), .Y(n183) );
  AOI21X1 U345 ( .A(B_opp_sign[3]), .B(n22), .C(n1), .Y(n279) );
  OAI21X1 U346 ( .A(n24), .B(n323), .C(n280), .Y(A[3]) );
  AOI21X1 U347 ( .A(A_opp_sign[3]), .B(n24), .C(n3), .Y(n280) );
  AOI22X1 U348 ( .A(n6), .B(A[2]), .C(n184), .D(n7), .Y(n225) );
  OAI21X1 U349 ( .A(n22), .B(n109), .C(n281), .Y(n184) );
  AOI21X1 U350 ( .A(B_opp_sign[2]), .B(n22), .C(n1), .Y(n281) );
  OAI21X1 U351 ( .A(n24), .B(n324), .C(n282), .Y(A[2]) );
  AOI21X1 U352 ( .A(A_opp_sign[2]), .B(n24), .C(n3), .Y(n282) );
  AOI22X1 U353 ( .A(n6), .B(A[1]), .C(n185), .D(n7), .Y(n226) );
  OAI21X1 U354 ( .A(n22), .B(n110), .C(n283), .Y(n185) );
  AOI21X1 U355 ( .A(B_opp_sign[1]), .B(n22), .C(n1), .Y(n283) );
  OAI21X1 U356 ( .A(n24), .B(n325), .C(n284), .Y(A[1]) );
  AOI21X1 U357 ( .A(A_opp_sign[1]), .B(n24), .C(n3), .Y(n284) );
  AOI22X1 U359 ( .A(n6), .B(A[14]), .C(n172), .D(n7), .Y(n227) );
  OAI21X1 U360 ( .A(reg_2_out[15]), .B(n97), .C(n285), .Y(n172) );
  AOI21X1 U361 ( .A(B_opp_sign[14]), .B(n22), .C(n1), .Y(n285) );
  OAI21X1 U362 ( .A(reg_1_out[15]), .B(n266), .C(n286), .Y(A[14]) );
  AOI21X1 U363 ( .A(A_opp_sign[14]), .B(n24), .C(n3), .Y(n286) );
  AOI22X1 U364 ( .A(n6), .B(A[13]), .C(n173), .D(n7), .Y(n228) );
  OAI21X1 U365 ( .A(reg_2_out[15]), .B(n98), .C(n287), .Y(n173) );
  AOI21X1 U366 ( .A(B_opp_sign[13]), .B(n22), .C(n1), .Y(n287) );
  OAI21X1 U367 ( .A(reg_1_out[15]), .B(n268), .C(n288), .Y(A[13]) );
  AOI21X1 U368 ( .A(A_opp_sign[13]), .B(n24), .C(n3), .Y(n288) );
  AOI22X1 U369 ( .A(n6), .B(A[12]), .C(n174), .D(n7), .Y(n229) );
  OAI21X1 U370 ( .A(reg_2_out[15]), .B(n99), .C(n289), .Y(n174) );
  AOI21X1 U371 ( .A(B_opp_sign[12]), .B(n22), .C(n1), .Y(n289) );
  OAI21X1 U372 ( .A(reg_1_out[15]), .B(n314), .C(n290), .Y(A[12]) );
  AOI21X1 U373 ( .A(A_opp_sign[12]), .B(n24), .C(n3), .Y(n290) );
  AOI22X1 U374 ( .A(n6), .B(A[11]), .C(n175), .D(n7), .Y(n230) );
  OAI21X1 U375 ( .A(reg_2_out[15]), .B(n100), .C(n291), .Y(n175) );
  AOI21X1 U376 ( .A(B_opp_sign[11]), .B(n22), .C(n1), .Y(n291) );
  OAI21X1 U377 ( .A(reg_1_out[15]), .B(n315), .C(n292), .Y(A[11]) );
  AOI21X1 U378 ( .A(A_opp_sign[11]), .B(n24), .C(n3), .Y(n292) );
  AOI22X1 U379 ( .A(n6), .B(A[10]), .C(n176), .D(n7), .Y(n231) );
  OAI21X1 U380 ( .A(reg_2_out[15]), .B(n101), .C(n293), .Y(n176) );
  AOI21X1 U381 ( .A(B_opp_sign[10]), .B(n22), .C(n1), .Y(n293) );
  OAI21X1 U382 ( .A(reg_1_out[15]), .B(n316), .C(n294), .Y(A[10]) );
  AOI21X1 U383 ( .A(A_opp_sign[10]), .B(n24), .C(n3), .Y(n294) );
  AOI22X1 U384 ( .A(n6), .B(A[0]), .C(n186), .D(n7), .Y(n232) );
  OAI21X1 U385 ( .A(reg_2_out[15]), .B(n111), .C(n295), .Y(n186) );
  AOI21X1 U386 ( .A(B_opp_sign[0]), .B(n22), .C(n1), .Y(n295) );
  OAI21X1 U387 ( .A(reg_1_out[15]), .B(n326), .C(n296), .Y(A[0]) );
  AOI21X1 U388 ( .A(A_opp_sign[0]), .B(n24), .C(n3), .Y(n296) );
  flex_buffer_NUM_BITS16_7 BUFFER1 ( .clk(n26), .n_rst(n29), .input_data(
        inchan), .output_data(reg_1_out) );
  flex_buffer_NUM_BITS16_6 BUFFER2 ( .clk(n26), .n_rst(n28), .input_data(
        reg_1_out), .output_data(reg_2_out) );
  flex_buffer_NUM_BITS16_5 BUFFER3 ( .clk(n26), .n_rst(n28), .input_data(
        reg_2_out), .output_data(reg_3_out) );
  flex_buffer_NUM_BITS16_4 BUFFER4 ( .clk(n26), .n_rst(n29), .input_data(
        reg_3_out), .output_data(reg_4_out) );
  cla_16bit_47 ABSA ( .a({n25, n266, n268, n314, n315, n316, n317, n318, n319, 
        n320, n321, n322, n323, n324, n325, n326}), .b({1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .cin(1'b1), .sum(A_opp_sign) );
  cla_16bit_46 ABSB ( .a({n23, n97, n98, n99, n100, n101, n102, n103, n104, 
        n105, n106, n107, n108, n109, n110, n111}), .b({1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .cin(1'b1), .sum(B_opp_sign) );
  cla_16bit_45 ABSC ( .a({n21, n112, n113, n114, n115, n116, n117, n118, n119, 
        n120, n121, n122, n123, n124, n125, n126}), .b({1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .cin(1'b1), .sum(C_opp_sign) );
  cla_16bit_44 ABSD ( .a({n16, n142, n143, n144, n145, n146, n147, n148, n149, 
        n150, n151, n152, n153, n189, n234, n250}), .b({1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .cin(1'b1), .sum(D_opp_sign) );
  cla_16bit_43 A2 ( .a({1'b0, A[14:0]}), .b({1'b1, n87, n86, n85, n84, n83, 
        n96, n95, n94, n93, n92, n91, n90, n89, n88, n82}), .cin(1'b1), .sum({
        \AcmpB[15] , SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14}) );
  cla_16bit_42 A3 ( .a({1'b0, C[14:0]}), .b({1'b1, n132, n131, n130, n129, 
        n128, n141, n140, n139, n138, n137, n136, n135, n134, n133, n127}), 
        .cin(1'b1), .sum({\CcmpD[15] , SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29}) );
  cla_16bit_41 A4 ( .a({1'b0, n72, n71, n70, n69, n68, n81, n80, n79, n78, n77, 
        n76, n75, n74, n73, n67}), .b({1'b1, n298, n299, n300, n301, n302, 
        n303, n304, n305, n306, n307, n308, n309, n310, n311, n312}), .cin(
        1'b1), .sum({\diff1[15] , SYNOPSYS_UNCONNECTED__30, 
        SYNOPSYS_UNCONNECTED__31, SYNOPSYS_UNCONNECTED__32, 
        SYNOPSYS_UNCONNECTED__33, SYNOPSYS_UNCONNECTED__34, 
        SYNOPSYS_UNCONNECTED__35, SYNOPSYS_UNCONNECTED__36, 
        SYNOPSYS_UNCONNECTED__37, SYNOPSYS_UNCONNECTED__38, 
        SYNOPSYS_UNCONNECTED__39, SYNOPSYS_UNCONNECTED__40, 
        SYNOPSYS_UNCONNECTED__41, SYNOPSYS_UNCONNECTED__42, 
        SYNOPSYS_UNCONNECTED__43, SYNOPSYS_UNCONNECTED__44}) );
  cla_16bit_40 A5 ( .a({1'b0, max[14:0]}), .b({1'b1, n327, n328, n329, n330, 
        1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1}), 
        .cin(1'b1), .sum({diff2[15:11], SYNOPSYS_UNCONNECTED__45, 
        SYNOPSYS_UNCONNECTED__46, SYNOPSYS_UNCONNECTED__47, 
        SYNOPSYS_UNCONNECTED__48, SYNOPSYS_UNCONNECTED__49, 
        SYNOPSYS_UNCONNECTED__50, SYNOPSYS_UNCONNECTED__51, 
        SYNOPSYS_UNCONNECTED__52, SYNOPSYS_UNCONNECTED__53, 
        SYNOPSYS_UNCONNECTED__54, SYNOPSYS_UNCONNECTED__55}) );
  unsigned_mult16by4_1 M1 ( .a({1'b0, D[14:0]}), .b(diff2[14:11]), .product({
        product[19:5], SYNOPSYS_UNCONNECTED__56, SYNOPSYS_UNCONNECTED__57, 
        SYNOPSYS_UNCONNECTED__58, SYNOPSYS_UNCONNECTED__59, 
        SYNOPSYS_UNCONNECTED__60}) );
  cla_16bit_39 A6 ( .a({n12, reg_4_out[14:0]}), .b({1'b1, n60, n297, n58, n57, 
        n56, n53, n54, n55, n40, n42, n44, n46, n48, n50, n52}), .cin(1'b1), 
        .sum(out_pos_val) );
  cla_16bit_38 A7 ( .a({n12, reg_4_out[14:0]}), .b({1'b0, modifier[14], n59, 
        modifier[12:0]}), .cin(1'b0), .sum(out_neg_val) );
  AND2X2 U3 ( .A(B_opp_sign[15]), .B(reg_2_out[15]), .Y(n1) );
  AND2X2 U4 ( .A(D_opp_sign[15]), .B(n13), .Y(n2) );
  AND2X2 U5 ( .A(A_opp_sign[15]), .B(reg_1_out[15]), .Y(n3) );
  AND2X2 U6 ( .A(C_opp_sign[15]), .B(reg_3_out[15]), .Y(n4) );
  INVX2 U7 ( .A(n206), .Y(n63) );
  INVX2 U8 ( .A(n207), .Y(n62) );
  INVX2 U9 ( .A(n16), .Y(n14) );
  INVX2 U10 ( .A(n16), .Y(n13) );
  INVX2 U11 ( .A(n17), .Y(n12) );
  INVX4 U12 ( .A(n27), .Y(n26) );
  INVX2 U13 ( .A(clk), .Y(n27) );
  INVX2 U14 ( .A(n215), .Y(n64) );
  INVX2 U15 ( .A(n23), .Y(n22) );
  INVX2 U16 ( .A(n25), .Y(n24) );
  INVX2 U17 ( .A(n21), .Y(n20) );
  INVX2 U18 ( .A(n5), .Y(n15) );
  OR2X2 U19 ( .A(n66), .B(diff2[15]), .Y(n5) );
  INVX2 U20 ( .A(reg_4_out[15]), .Y(n17) );
  INVX2 U21 ( .A(reg_4_out[15]), .Y(n18) );
  INVX2 U22 ( .A(reg_2_out[15]), .Y(n23) );
  INVX2 U23 ( .A(n6), .Y(n7) );
  INVX2 U24 ( .A(n10), .Y(n11) );
  INVX2 U25 ( .A(n8), .Y(n9) );
  INVX2 U26 ( .A(reg_4_out[15]), .Y(n19) );
  INVX2 U27 ( .A(reg_1_out[15]), .Y(n25) );
  INVX2 U28 ( .A(reg_3_out[15]), .Y(n21) );
  BUFX2 U29 ( .A(n_rst), .Y(n28) );
  BUFX2 U30 ( .A(n_rst), .Y(n29) );
  INVX2 U31 ( .A(\diff1[15] ), .Y(n10) );
  INVX2 U32 ( .A(\AcmpB[15] ), .Y(n6) );
  INVX2 U33 ( .A(\CcmpD[15] ), .Y(n8) );
  INVX2 U34 ( .A(reg_4_out[15]), .Y(n16) );
  INVX2 U35 ( .A(n158), .Y(outchan[7]) );
  INVX2 U36 ( .A(n169), .Y(outchan[11]) );
  INVX2 U37 ( .A(n170), .Y(outchan[10]) );
  INVX2 U38 ( .A(n156), .Y(outchan[9]) );
  INVX2 U39 ( .A(n157), .Y(outchan[8]) );
  INVX2 U40 ( .A(n165), .Y(outchan[15]) );
  INVX2 U41 ( .A(n166), .Y(outchan[14]) );
  INVX2 U42 ( .A(n167), .Y(outchan[13]) );
  INVX2 U43 ( .A(n168), .Y(outchan[12]) );
  INVX2 U44 ( .A(n159), .Y(outchan[6]) );
  INVX2 U45 ( .A(modifier[6]), .Y(n40) );
  INVX2 U46 ( .A(n160), .Y(outchan[5]) );
  INVX2 U47 ( .A(modifier[5]), .Y(n42) );
  INVX2 U48 ( .A(n161), .Y(outchan[4]) );
  INVX2 U49 ( .A(modifier[4]), .Y(n44) );
  INVX2 U50 ( .A(n162), .Y(outchan[3]) );
  INVX2 U51 ( .A(modifier[3]), .Y(n46) );
  INVX2 U52 ( .A(n163), .Y(outchan[2]) );
  INVX2 U53 ( .A(modifier[2]), .Y(n48) );
  INVX2 U54 ( .A(n164), .Y(outchan[1]) );
  INVX2 U55 ( .A(modifier[1]), .Y(n50) );
  INVX2 U56 ( .A(n171), .Y(outchan[0]) );
  INVX2 U57 ( .A(modifier[0]), .Y(n52) );
  INVX2 U58 ( .A(modifier[9]), .Y(n53) );
  INVX2 U59 ( .A(modifier[8]), .Y(n54) );
  INVX2 U60 ( .A(modifier[7]), .Y(n55) );
  INVX2 U61 ( .A(modifier[10]), .Y(n56) );
  INVX2 U62 ( .A(modifier[11]), .Y(n57) );
  INVX2 U63 ( .A(modifier[12]), .Y(n58) );
  INVX2 U64 ( .A(n297), .Y(n59) );
  INVX2 U65 ( .A(modifier[14]), .Y(n60) );
  INVX2 U66 ( .A(product[19]), .Y(n61) );
  INVX2 U67 ( .A(max[13]), .Y(n65) );
  INVX2 U68 ( .A(max[14]), .Y(n66) );
  INVX2 U69 ( .A(n232), .Y(n67) );
  INVX2 U70 ( .A(n231), .Y(n68) );
  INVX2 U71 ( .A(n230), .Y(n69) );
  INVX2 U72 ( .A(n229), .Y(n70) );
  INVX2 U73 ( .A(n228), .Y(n71) );
  INVX2 U74 ( .A(n227), .Y(n72) );
  INVX2 U75 ( .A(n226), .Y(n73) );
  INVX2 U76 ( .A(n225), .Y(n74) );
  INVX2 U77 ( .A(n224), .Y(n75) );
  INVX2 U78 ( .A(n223), .Y(n76) );
  INVX2 U79 ( .A(n222), .Y(n77) );
  INVX2 U80 ( .A(n221), .Y(n78) );
  INVX2 U81 ( .A(n220), .Y(n79) );
  INVX2 U82 ( .A(n219), .Y(n80) );
  INVX2 U83 ( .A(n218), .Y(n81) );
  INVX2 U84 ( .A(n186), .Y(n82) );
  INVX2 U85 ( .A(n176), .Y(n83) );
  INVX2 U86 ( .A(n175), .Y(n84) );
  INVX2 U87 ( .A(n174), .Y(n85) );
  INVX2 U88 ( .A(n173), .Y(n86) );
  INVX2 U89 ( .A(n172), .Y(n87) );
  INVX2 U90 ( .A(n185), .Y(n88) );
  INVX2 U91 ( .A(n184), .Y(n89) );
  INVX2 U92 ( .A(n183), .Y(n90) );
  INVX2 U93 ( .A(n182), .Y(n91) );
  INVX2 U94 ( .A(n181), .Y(n92) );
  INVX2 U95 ( .A(n180), .Y(n93) );
  INVX2 U96 ( .A(n179), .Y(n94) );
  INVX2 U97 ( .A(n178), .Y(n95) );
  INVX2 U98 ( .A(n177), .Y(n96) );
  INVX2 U99 ( .A(reg_2_out[14]), .Y(n97) );
  INVX2 U100 ( .A(reg_2_out[13]), .Y(n98) );
  INVX2 U101 ( .A(reg_2_out[12]), .Y(n99) );
  INVX2 U102 ( .A(reg_2_out[11]), .Y(n100) );
  INVX2 U103 ( .A(reg_2_out[10]), .Y(n101) );
  INVX2 U104 ( .A(reg_2_out[9]), .Y(n102) );
  INVX2 U105 ( .A(reg_2_out[8]), .Y(n103) );
  INVX2 U106 ( .A(reg_2_out[7]), .Y(n104) );
  INVX2 U107 ( .A(reg_2_out[6]), .Y(n105) );
  INVX2 U108 ( .A(reg_2_out[5]), .Y(n106) );
  INVX2 U109 ( .A(reg_2_out[4]), .Y(n107) );
  INVX2 U110 ( .A(reg_2_out[3]), .Y(n108) );
  INVX2 U111 ( .A(reg_2_out[2]), .Y(n109) );
  INVX2 U112 ( .A(reg_2_out[1]), .Y(n110) );
  INVX2 U113 ( .A(reg_2_out[0]), .Y(n111) );
  INVX2 U114 ( .A(reg_3_out[14]), .Y(n112) );
  INVX2 U115 ( .A(reg_3_out[13]), .Y(n113) );
  INVX2 U116 ( .A(reg_3_out[12]), .Y(n114) );
  INVX2 U117 ( .A(reg_3_out[11]), .Y(n115) );
  INVX2 U118 ( .A(reg_3_out[10]), .Y(n116) );
  INVX2 U119 ( .A(reg_3_out[9]), .Y(n117) );
  INVX2 U120 ( .A(reg_3_out[8]), .Y(n118) );
  INVX2 U121 ( .A(reg_3_out[7]), .Y(n119) );
  INVX2 U122 ( .A(reg_3_out[6]), .Y(n120) );
  INVX2 U123 ( .A(reg_3_out[5]), .Y(n121) );
  INVX2 U124 ( .A(reg_3_out[4]), .Y(n122) );
  INVX2 U125 ( .A(reg_3_out[3]), .Y(n123) );
  INVX2 U126 ( .A(reg_3_out[2]), .Y(n124) );
  INVX2 U127 ( .A(reg_3_out[1]), .Y(n125) );
  INVX2 U128 ( .A(reg_3_out[0]), .Y(n126) );
  INVX2 U129 ( .A(D[0]), .Y(n127) );
  INVX2 U130 ( .A(D[10]), .Y(n128) );
  INVX2 U131 ( .A(D[11]), .Y(n129) );
  INVX2 U132 ( .A(D[12]), .Y(n130) );
  INVX2 U133 ( .A(D[13]), .Y(n131) );
  INVX2 U134 ( .A(D[14]), .Y(n132) );
  INVX2 U135 ( .A(D[1]), .Y(n133) );
  INVX2 U136 ( .A(D[2]), .Y(n134) );
  INVX2 U137 ( .A(D[3]), .Y(n135) );
  INVX2 U138 ( .A(D[4]), .Y(n136) );
  INVX2 U139 ( .A(D[5]), .Y(n137) );
  INVX2 U140 ( .A(D[6]), .Y(n138) );
  INVX2 U141 ( .A(D[7]), .Y(n139) );
  INVX2 U142 ( .A(D[8]), .Y(n140) );
  INVX2 U143 ( .A(D[9]), .Y(n141) );
  INVX2 U144 ( .A(reg_4_out[14]), .Y(n142) );
  INVX2 U145 ( .A(reg_4_out[13]), .Y(n143) );
  INVX2 U146 ( .A(reg_4_out[12]), .Y(n144) );
  INVX2 U147 ( .A(reg_4_out[11]), .Y(n145) );
  INVX2 U148 ( .A(reg_4_out[10]), .Y(n146) );
  INVX2 U149 ( .A(reg_4_out[9]), .Y(n147) );
  INVX2 U150 ( .A(reg_4_out[8]), .Y(n148) );
  INVX2 U151 ( .A(reg_4_out[7]), .Y(n149) );
  INVX2 U152 ( .A(reg_4_out[6]), .Y(n150) );
  INVX2 U153 ( .A(reg_4_out[5]), .Y(n151) );
  INVX2 U154 ( .A(reg_4_out[4]), .Y(n152) );
  INVX2 U155 ( .A(reg_4_out[3]), .Y(n153) );
  INVX2 U156 ( .A(reg_4_out[2]), .Y(n189) );
  INVX2 U157 ( .A(reg_4_out[1]), .Y(n234) );
  INVX2 U158 ( .A(reg_4_out[0]), .Y(n250) );
  INVX2 U159 ( .A(reg_1_out[14]), .Y(n266) );
  INVX2 U220 ( .A(reg_1_out[13]), .Y(n268) );
  INVX2 U390 ( .A(reg_1_out[12]), .Y(n314) );
  INVX2 U391 ( .A(reg_1_out[11]), .Y(n315) );
  INVX2 U392 ( .A(reg_1_out[10]), .Y(n316) );
  INVX2 U393 ( .A(reg_1_out[9]), .Y(n317) );
  INVX2 U394 ( .A(reg_1_out[8]), .Y(n318) );
  INVX2 U395 ( .A(reg_1_out[7]), .Y(n319) );
  INVX2 U396 ( .A(reg_1_out[6]), .Y(n320) );
  INVX2 U397 ( .A(reg_1_out[5]), .Y(n321) );
  INVX2 U398 ( .A(reg_1_out[4]), .Y(n322) );
  INVX2 U399 ( .A(reg_1_out[3]), .Y(n323) );
  INVX2 U400 ( .A(reg_1_out[2]), .Y(n324) );
  INVX2 U401 ( .A(reg_1_out[1]), .Y(n325) );
  INVX2 U402 ( .A(reg_1_out[0]), .Y(n326) );
  INVX2 U403 ( .A(in_thresh[3]), .Y(n327) );
  INVX2 U404 ( .A(in_thresh[2]), .Y(n328) );
  INVX2 U405 ( .A(in_thresh[1]), .Y(n329) );
  INVX2 U406 ( .A(in_thresh[0]), .Y(n330) );
endmodule


module flex_buffer_NUM_BITS16_3 ( clk, n_rst, input_data, output_data );
  input [15:0] input_data;
  output [15:0] output_data;
  input clk, n_rst;
  wire   n17, n18;

  DFFSR \output_data_reg[15]  ( .D(input_data[15]), .CLK(clk), .R(n17), .S(
        1'b1), .Q(output_data[15]) );
  DFFSR \output_data_reg[14]  ( .D(input_data[14]), .CLK(clk), .R(n17), .S(
        1'b1), .Q(output_data[14]) );
  DFFSR \output_data_reg[13]  ( .D(input_data[13]), .CLK(clk), .R(n17), .S(
        1'b1), .Q(output_data[13]) );
  DFFSR \output_data_reg[12]  ( .D(input_data[12]), .CLK(clk), .R(n17), .S(
        1'b1), .Q(output_data[12]) );
  DFFSR \output_data_reg[11]  ( .D(input_data[11]), .CLK(clk), .R(n17), .S(
        1'b1), .Q(output_data[11]) );
  DFFSR \output_data_reg[10]  ( .D(input_data[10]), .CLK(clk), .R(n17), .S(
        1'b1), .Q(output_data[10]) );
  DFFSR \output_data_reg[9]  ( .D(input_data[9]), .CLK(clk), .R(n17), .S(1'b1), 
        .Q(output_data[9]) );
  DFFSR \output_data_reg[8]  ( .D(input_data[8]), .CLK(clk), .R(n17), .S(1'b1), 
        .Q(output_data[8]) );
  DFFSR \output_data_reg[7]  ( .D(input_data[7]), .CLK(clk), .R(n17), .S(1'b1), 
        .Q(output_data[7]) );
  DFFSR \output_data_reg[6]  ( .D(input_data[6]), .CLK(clk), .R(n17), .S(1'b1), 
        .Q(output_data[6]) );
  DFFSR \output_data_reg[5]  ( .D(input_data[5]), .CLK(clk), .R(n17), .S(1'b1), 
        .Q(output_data[5]) );
  DFFSR \output_data_reg[4]  ( .D(input_data[4]), .CLK(clk), .R(n17), .S(1'b1), 
        .Q(output_data[4]) );
  DFFSR \output_data_reg[3]  ( .D(input_data[3]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[3]) );
  DFFSR \output_data_reg[2]  ( .D(input_data[2]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[2]) );
  DFFSR \output_data_reg[1]  ( .D(input_data[1]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[1]) );
  DFFSR \output_data_reg[0]  ( .D(input_data[0]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[0]) );
  INVX2 U19 ( .A(n18), .Y(n17) );
  INVX2 U20 ( .A(n_rst), .Y(n18) );
endmodule


module flex_buffer_NUM_BITS16_2 ( clk, n_rst, input_data, output_data );
  input [15:0] input_data;
  output [15:0] output_data;
  input clk, n_rst;


  DFFSR \output_data_reg[15]  ( .D(input_data[15]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[15]) );
  DFFSR \output_data_reg[14]  ( .D(input_data[14]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[14]) );
  DFFSR \output_data_reg[13]  ( .D(input_data[13]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[13]) );
  DFFSR \output_data_reg[12]  ( .D(input_data[12]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[12]) );
  DFFSR \output_data_reg[11]  ( .D(input_data[11]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[11]) );
  DFFSR \output_data_reg[10]  ( .D(input_data[10]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[10]) );
  DFFSR \output_data_reg[9]  ( .D(input_data[9]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[9]) );
  DFFSR \output_data_reg[8]  ( .D(input_data[8]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[8]) );
  DFFSR \output_data_reg[7]  ( .D(input_data[7]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[7]) );
  DFFSR \output_data_reg[6]  ( .D(input_data[6]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[6]) );
  DFFSR \output_data_reg[5]  ( .D(input_data[5]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[5]) );
  DFFSR \output_data_reg[4]  ( .D(input_data[4]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[4]) );
  DFFSR \output_data_reg[3]  ( .D(input_data[3]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[3]) );
  DFFSR \output_data_reg[2]  ( .D(input_data[2]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[2]) );
  DFFSR \output_data_reg[1]  ( .D(input_data[1]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[1]) );
  DFFSR \output_data_reg[0]  ( .D(input_data[0]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[0]) );
endmodule


module flex_buffer_NUM_BITS16_1 ( clk, n_rst, input_data, output_data );
  input [15:0] input_data;
  output [15:0] output_data;
  input clk, n_rst;
  wire   n17, n18;

  DFFSR \output_data_reg[15]  ( .D(input_data[15]), .CLK(clk), .R(n17), .S(
        1'b1), .Q(output_data[15]) );
  DFFSR \output_data_reg[14]  ( .D(input_data[14]), .CLK(clk), .R(n17), .S(
        1'b1), .Q(output_data[14]) );
  DFFSR \output_data_reg[13]  ( .D(input_data[13]), .CLK(clk), .R(n17), .S(
        1'b1), .Q(output_data[13]) );
  DFFSR \output_data_reg[12]  ( .D(input_data[12]), .CLK(clk), .R(n17), .S(
        1'b1), .Q(output_data[12]) );
  DFFSR \output_data_reg[11]  ( .D(input_data[11]), .CLK(clk), .R(n17), .S(
        1'b1), .Q(output_data[11]) );
  DFFSR \output_data_reg[10]  ( .D(input_data[10]), .CLK(clk), .R(n17), .S(
        1'b1), .Q(output_data[10]) );
  DFFSR \output_data_reg[9]  ( .D(input_data[9]), .CLK(clk), .R(n17), .S(1'b1), 
        .Q(output_data[9]) );
  DFFSR \output_data_reg[8]  ( .D(input_data[8]), .CLK(clk), .R(n17), .S(1'b1), 
        .Q(output_data[8]) );
  DFFSR \output_data_reg[7]  ( .D(input_data[7]), .CLK(clk), .R(n17), .S(1'b1), 
        .Q(output_data[7]) );
  DFFSR \output_data_reg[6]  ( .D(input_data[6]), .CLK(clk), .R(n17), .S(1'b1), 
        .Q(output_data[6]) );
  DFFSR \output_data_reg[5]  ( .D(input_data[5]), .CLK(clk), .R(n17), .S(1'b1), 
        .Q(output_data[5]) );
  DFFSR \output_data_reg[4]  ( .D(input_data[4]), .CLK(clk), .R(n17), .S(1'b1), 
        .Q(output_data[4]) );
  DFFSR \output_data_reg[3]  ( .D(input_data[3]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[3]) );
  DFFSR \output_data_reg[2]  ( .D(input_data[2]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[2]) );
  DFFSR \output_data_reg[1]  ( .D(input_data[1]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[1]) );
  DFFSR \output_data_reg[0]  ( .D(input_data[0]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[0]) );
  INVX2 U19 ( .A(n18), .Y(n17) );
  INVX2 U20 ( .A(n_rst), .Y(n18) );
endmodule


module flex_buffer_NUM_BITS16_0 ( clk, n_rst, input_data, output_data );
  input [15:0] input_data;
  output [15:0] output_data;
  input clk, n_rst;
  wire   n17, n18;

  DFFSR \output_data_reg[15]  ( .D(input_data[15]), .CLK(clk), .R(n17), .S(
        1'b1), .Q(output_data[15]) );
  DFFSR \output_data_reg[14]  ( .D(input_data[14]), .CLK(clk), .R(n17), .S(
        1'b1), .Q(output_data[14]) );
  DFFSR \output_data_reg[13]  ( .D(input_data[13]), .CLK(clk), .R(n17), .S(
        1'b1), .Q(output_data[13]) );
  DFFSR \output_data_reg[12]  ( .D(input_data[12]), .CLK(clk), .R(n17), .S(
        1'b1), .Q(output_data[12]) );
  DFFSR \output_data_reg[11]  ( .D(input_data[11]), .CLK(clk), .R(n17), .S(
        1'b1), .Q(output_data[11]) );
  DFFSR \output_data_reg[10]  ( .D(input_data[10]), .CLK(clk), .R(n17), .S(
        1'b1), .Q(output_data[10]) );
  DFFSR \output_data_reg[9]  ( .D(input_data[9]), .CLK(clk), .R(n17), .S(1'b1), 
        .Q(output_data[9]) );
  DFFSR \output_data_reg[8]  ( .D(input_data[8]), .CLK(clk), .R(n17), .S(1'b1), 
        .Q(output_data[8]) );
  DFFSR \output_data_reg[7]  ( .D(input_data[7]), .CLK(clk), .R(n17), .S(1'b1), 
        .Q(output_data[7]) );
  DFFSR \output_data_reg[6]  ( .D(input_data[6]), .CLK(clk), .R(n17), .S(1'b1), 
        .Q(output_data[6]) );
  DFFSR \output_data_reg[5]  ( .D(input_data[5]), .CLK(clk), .R(n17), .S(1'b1), 
        .Q(output_data[5]) );
  DFFSR \output_data_reg[4]  ( .D(input_data[4]), .CLK(clk), .R(n17), .S(1'b1), 
        .Q(output_data[4]) );
  DFFSR \output_data_reg[3]  ( .D(input_data[3]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[3]) );
  DFFSR \output_data_reg[2]  ( .D(input_data[2]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[2]) );
  DFFSR \output_data_reg[1]  ( .D(input_data[1]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[1]) );
  DFFSR \output_data_reg[0]  ( .D(input_data[0]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[0]) );
  INVX2 U19 ( .A(n18), .Y(n17) );
  INVX2 U20 ( .A(n_rst), .Y(n18) );
endmodule


module cla_4bit_153 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_152 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_151 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_150 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n1), .C(n2), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n1), .C(n39), .D(n2), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n1), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(a[3]), .Y(n1) );
  INVX2 U7 ( .A(n28), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_16bit_37 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   cout, n2, n3, n4, n11, n12, n13, n14, n15, n16;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  NOR2X1 U5 ( .A(n16), .B(n15), .Y(pg) );
  NAND2X1 U6 ( .A(p[3]), .B(p[2]), .Y(n15) );
  NAND2X1 U7 ( .A(p[1]), .B(p[0]), .Y(n16) );
  AOI21X1 U8 ( .A(n2), .B(p[3]), .C(g[3]), .Y(n14) );
  AOI21X1 U9 ( .A(n3), .B(p[2]), .C(g[2]), .Y(n13) );
  AOI21X1 U10 ( .A(n4), .B(p[1]), .C(g[1]), .Y(n12) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n11) );
  cla_4bit_153 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_152 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n4), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_151 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n3), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_150 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n2), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  INVX2 U1 ( .A(n14), .Y(cout) );
  INVX2 U2 ( .A(n13), .Y(n2) );
  INVX2 U3 ( .A(n12), .Y(n3) );
  INVX2 U4 ( .A(n11), .Y(n4) );
endmodule


module cla_4bit_149 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_148 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_147 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_146 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n1), .C(n2), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n1), .C(n39), .D(n2), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n1), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(a[3]), .Y(n1) );
  INVX2 U7 ( .A(n28), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_16bit_36 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   cout, n2, n3, n4, n11, n12, n13, n14, n15, n16;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  NOR2X1 U5 ( .A(n16), .B(n15), .Y(pg) );
  NAND2X1 U6 ( .A(p[3]), .B(p[2]), .Y(n15) );
  NAND2X1 U7 ( .A(p[1]), .B(p[0]), .Y(n16) );
  AOI21X1 U8 ( .A(n2), .B(p[3]), .C(g[3]), .Y(n14) );
  AOI21X1 U9 ( .A(n3), .B(p[2]), .C(g[2]), .Y(n13) );
  AOI21X1 U10 ( .A(n4), .B(p[1]), .C(g[1]), .Y(n12) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n11) );
  cla_4bit_149 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_148 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n4), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_147 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n3), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_146 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n2), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  INVX2 U1 ( .A(n14), .Y(cout) );
  INVX2 U2 ( .A(n13), .Y(n2) );
  INVX2 U3 ( .A(n12), .Y(n3) );
  INVX2 U4 ( .A(n11), .Y(n4) );
endmodule


module cla_4bit_145 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_144 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_143 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_142 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n1), .C(n2), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n1), .C(n39), .D(n2), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n1), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(a[3]), .Y(n1) );
  INVX2 U7 ( .A(n28), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_16bit_35 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   cout, n2, n3, n4, n11, n12, n13, n14, n15, n16;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  NOR2X1 U5 ( .A(n16), .B(n15), .Y(pg) );
  NAND2X1 U6 ( .A(p[3]), .B(p[2]), .Y(n15) );
  NAND2X1 U7 ( .A(p[1]), .B(p[0]), .Y(n16) );
  AOI21X1 U8 ( .A(n2), .B(p[3]), .C(g[3]), .Y(n14) );
  AOI21X1 U9 ( .A(n3), .B(p[2]), .C(g[2]), .Y(n13) );
  AOI21X1 U10 ( .A(n4), .B(p[1]), .C(g[1]), .Y(n12) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n11) );
  cla_4bit_145 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_144 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n4), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_143 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n3), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_142 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n2), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  INVX2 U1 ( .A(n14), .Y(cout) );
  INVX2 U2 ( .A(n13), .Y(n2) );
  INVX2 U3 ( .A(n12), .Y(n3) );
  INVX2 U4 ( .A(n11), .Y(n4) );
endmodule


module cla_4bit_141 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_140 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_139 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_138 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n1), .C(n2), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n1), .C(n39), .D(n2), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n1), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(a[3]), .Y(n1) );
  INVX2 U7 ( .A(n28), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_16bit_34 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   cout, n2, n3, n4, n11, n12, n13, n14, n15, n16;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  NOR2X1 U5 ( .A(n16), .B(n15), .Y(pg) );
  NAND2X1 U6 ( .A(p[3]), .B(p[2]), .Y(n15) );
  NAND2X1 U7 ( .A(p[1]), .B(p[0]), .Y(n16) );
  AOI21X1 U8 ( .A(n2), .B(p[3]), .C(g[3]), .Y(n14) );
  AOI21X1 U9 ( .A(n3), .B(p[2]), .C(g[2]), .Y(n13) );
  AOI21X1 U10 ( .A(n4), .B(p[1]), .C(g[1]), .Y(n12) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n11) );
  cla_4bit_141 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_140 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n4), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_139 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n3), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_138 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n2), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  INVX2 U1 ( .A(n14), .Y(cout) );
  INVX2 U2 ( .A(n13), .Y(n2) );
  INVX2 U3 ( .A(n12), .Y(n3) );
  INVX2 U4 ( .A(n11), .Y(n4) );
endmodule


module cla_4bit_137 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n4), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n4), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n4), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(a[3]), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_136 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n4), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n4), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n4), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(a[3]), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_135 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n3), .C(n2), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n3), .C(n39), .D(n2), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n3), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n28), .Y(n2) );
  INVX2 U8 ( .A(a[3]), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_134 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n4), .B(n5), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n4), .B(n5), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n4), .B(n5), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(b[3]), .Y(n4) );
  INVX2 U10 ( .A(a[3]), .Y(n5) );
endmodule


module cla_16bit_33 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   cout, n2, n3, n4, n11, n12, n13, n14, n15, n16;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  NOR2X1 U5 ( .A(n16), .B(n15), .Y(pg) );
  NAND2X1 U6 ( .A(p[3]), .B(p[2]), .Y(n15) );
  NAND2X1 U7 ( .A(p[1]), .B(p[0]), .Y(n16) );
  AOI21X1 U8 ( .A(n2), .B(p[3]), .C(g[3]), .Y(n14) );
  AOI21X1 U9 ( .A(n3), .B(p[2]), .C(g[2]), .Y(n13) );
  AOI21X1 U10 ( .A(n4), .B(p[1]), .C(g[1]), .Y(n12) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n11) );
  cla_4bit_137 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_136 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n4), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_135 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n3), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_134 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n2), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  INVX2 U1 ( .A(n14), .Y(cout) );
  INVX2 U2 ( .A(n13), .Y(n2) );
  INVX2 U3 ( .A(n12), .Y(n3) );
  INVX2 U4 ( .A(n11), .Y(n4) );
endmodule


module cla_4bit_133 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n4), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n4), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n4), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(a[3]), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_132 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n4), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n4), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n4), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(a[3]), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_131 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n3), .C(n2), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n3), .C(n39), .D(n2), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n3), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n28), .Y(n2) );
  INVX2 U8 ( .A(a[3]), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_130 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n4), .B(n5), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n4), .B(n5), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n4), .B(n5), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(b[3]), .Y(n4) );
  INVX2 U10 ( .A(a[3]), .Y(n5) );
endmodule


module cla_16bit_32 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   cout, n2, n3, n4, n11, n12, n13, n14, n15, n16;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  NOR2X1 U5 ( .A(n16), .B(n15), .Y(pg) );
  NAND2X1 U6 ( .A(p[3]), .B(p[2]), .Y(n15) );
  NAND2X1 U7 ( .A(p[1]), .B(p[0]), .Y(n16) );
  AOI21X1 U8 ( .A(n2), .B(p[3]), .C(g[3]), .Y(n14) );
  AOI21X1 U9 ( .A(n3), .B(p[2]), .C(g[2]), .Y(n13) );
  AOI21X1 U10 ( .A(n4), .B(p[1]), .C(g[1]), .Y(n12) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n11) );
  cla_4bit_133 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_132 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n4), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_131 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n3), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_130 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n2), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  INVX2 U1 ( .A(n14), .Y(cout) );
  INVX2 U2 ( .A(n13), .Y(n2) );
  INVX2 U3 ( .A(n12), .Y(n3) );
  INVX2 U4 ( .A(n11), .Y(n4) );
endmodule


module cla_4bit_129 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n4), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n4), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n4), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(a[3]), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_128 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n4), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n4), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n4), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(a[3]), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_127 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n3), .C(n2), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n3), .C(n39), .D(n2), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n3), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n28), .Y(n2) );
  INVX2 U8 ( .A(a[3]), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_126 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n4), .B(n5), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n4), .B(n5), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n4), .B(n5), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(b[3]), .Y(n4) );
  INVX2 U10 ( .A(a[3]), .Y(n5) );
endmodule


module cla_16bit_31 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   cout, n2, n3, n4, n11, n12, n13, n14, n15, n16;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  NOR2X1 U5 ( .A(n16), .B(n15), .Y(pg) );
  NAND2X1 U6 ( .A(p[3]), .B(p[2]), .Y(n15) );
  NAND2X1 U7 ( .A(p[1]), .B(p[0]), .Y(n16) );
  AOI21X1 U8 ( .A(n2), .B(p[3]), .C(g[3]), .Y(n14) );
  AOI21X1 U9 ( .A(n3), .B(p[2]), .C(g[2]), .Y(n13) );
  AOI21X1 U10 ( .A(n4), .B(p[1]), .C(g[1]), .Y(n12) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n11) );
  cla_4bit_129 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_128 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n4), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_127 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n3), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_126 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n2), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  INVX2 U1 ( .A(n14), .Y(cout) );
  INVX2 U2 ( .A(n13), .Y(n2) );
  INVX2 U3 ( .A(n12), .Y(n3) );
  INVX2 U4 ( .A(n11), .Y(n4) );
endmodule


module cla_4bit_125 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n4), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n4), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n4), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(a[3]), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_124 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n4), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n4), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n4), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(a[3]), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_123 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n3), .C(n2), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n3), .C(n39), .D(n2), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n3), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n28), .Y(n2) );
  INVX2 U8 ( .A(a[3]), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_122 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n4), .B(n5), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n4), .B(n5), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n4), .B(n5), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(b[3]), .Y(n4) );
  INVX2 U10 ( .A(a[3]), .Y(n5) );
endmodule


module cla_16bit_30 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   cout, n2, n3, n4, n11, n12, n13, n14, n15, n16;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  NOR2X1 U5 ( .A(n16), .B(n15), .Y(pg) );
  NAND2X1 U6 ( .A(p[3]), .B(p[2]), .Y(n15) );
  NAND2X1 U7 ( .A(p[1]), .B(p[0]), .Y(n16) );
  AOI21X1 U8 ( .A(n2), .B(p[3]), .C(g[3]), .Y(n14) );
  AOI21X1 U9 ( .A(n3), .B(p[2]), .C(g[2]), .Y(n13) );
  AOI21X1 U10 ( .A(n4), .B(p[1]), .C(g[1]), .Y(n12) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n11) );
  cla_4bit_125 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_124 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n4), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_123 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n3), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_122 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n2), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  INVX2 U1 ( .A(n14), .Y(cout) );
  INVX2 U2 ( .A(n13), .Y(n2) );
  INVX2 U3 ( .A(n12), .Y(n3) );
  INVX2 U4 ( .A(n11), .Y(n4) );
endmodule


module cla_4bit_51 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n4), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n4), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n4), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(a[3]), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_50 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n4), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n4), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n4), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(a[3]), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_49 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n3), .C(n2), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n3), .C(n39), .D(n2), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n3), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n28), .Y(n2) );
  INVX2 U8 ( .A(a[3]), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_48 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n4), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n4), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n4), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(a[3]), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_16bit_12 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   cout, n2, n3, n4, n11, n12, n13, n14, n15, n16;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  NOR2X1 U5 ( .A(n16), .B(n15), .Y(pg) );
  NAND2X1 U6 ( .A(p[3]), .B(p[2]), .Y(n15) );
  NAND2X1 U7 ( .A(p[1]), .B(p[0]), .Y(n16) );
  AOI21X1 U8 ( .A(n2), .B(p[3]), .C(g[3]), .Y(n14) );
  AOI21X1 U9 ( .A(n3), .B(p[2]), .C(g[2]), .Y(n13) );
  AOI21X1 U10 ( .A(n4), .B(p[1]), .C(g[1]), .Y(n12) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n11) );
  cla_4bit_51 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_50 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n4), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_49 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n3), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_48 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n2), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  INVX2 U1 ( .A(n14), .Y(cout) );
  INVX2 U2 ( .A(n13), .Y(n2) );
  INVX2 U3 ( .A(n12), .Y(n3) );
  INVX2 U4 ( .A(n11), .Y(n4) );
endmodule


module adder_1bit_17 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n4, n5;

  XOR2X1 U2 ( .A(carry_in), .B(n5), .Y(sum) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n5), .D(carry_in), .Y(n4) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n5) );
  INVX2 U1 ( .A(n4), .Y(carry_out) );
endmodule


module cla_4bit_47 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_46 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n3), .C(n2), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n3), .C(n39), .D(n2), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n3), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n28), .Y(n2) );
  INVX2 U8 ( .A(a[3]), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_45 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n3), .C(n2), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n3), .C(n39), .D(n2), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n3), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n28), .Y(n2) );
  INVX2 U8 ( .A(a[3]), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_44 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n3), .C(n2), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n3), .C(n39), .D(n2), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n3), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n28), .Y(n2) );
  INVX2 U8 ( .A(a[3]), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_16bit_11 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   cout, n2, n3, n4, n11, n12, n13, n14, n15, n16;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  NOR2X1 U5 ( .A(n16), .B(n15), .Y(pg) );
  NAND2X1 U6 ( .A(p[3]), .B(p[2]), .Y(n15) );
  NAND2X1 U7 ( .A(p[1]), .B(p[0]), .Y(n16) );
  AOI21X1 U8 ( .A(n2), .B(p[3]), .C(g[3]), .Y(n14) );
  AOI21X1 U9 ( .A(n3), .B(p[2]), .C(g[2]), .Y(n13) );
  AOI21X1 U10 ( .A(n4), .B(p[1]), .C(g[1]), .Y(n12) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n11) );
  cla_4bit_47 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_46 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n4), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_45 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n3), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_44 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n2), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  INVX2 U1 ( .A(n14), .Y(cout) );
  INVX2 U2 ( .A(n13), .Y(n2) );
  INVX2 U3 ( .A(n12), .Y(n3) );
  INVX2 U4 ( .A(n11), .Y(n4) );
endmodule


module adder_1bit_16 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n4, n5;

  XOR2X1 U2 ( .A(carry_in), .B(n5), .Y(sum) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n5), .D(carry_in), .Y(n4) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n5) );
  INVX2 U1 ( .A(n4), .Y(carry_out) );
endmodule


module adder_1bit_15 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n4, n5;

  XOR2X1 U2 ( .A(carry_in), .B(n5), .Y(sum) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n5), .D(carry_in), .Y(n4) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n5) );
  INVX2 U1 ( .A(n4), .Y(carry_out) );
endmodule


module cla_4bit_43 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_42 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n2), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n2), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n2), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(a[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_41 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n3), .C(n2), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n3), .C(n39), .D(n2), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n3), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n28), .Y(n2) );
  INVX2 U8 ( .A(a[3]), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_4bit_40 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n3), .C(n2), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n3), .C(n39), .D(n2), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n3), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n28), .Y(n2) );
  INVX2 U8 ( .A(a[3]), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_16bit_10 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   cout, n2, n3, n4, n11, n12, n13, n14, n15, n16;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  NOR2X1 U5 ( .A(n16), .B(n15), .Y(pg) );
  NAND2X1 U6 ( .A(p[3]), .B(p[2]), .Y(n15) );
  NAND2X1 U7 ( .A(p[1]), .B(p[0]), .Y(n16) );
  AOI21X1 U8 ( .A(n2), .B(p[3]), .C(g[3]), .Y(n14) );
  AOI21X1 U9 ( .A(n3), .B(p[2]), .C(g[2]), .Y(n13) );
  AOI21X1 U10 ( .A(n4), .B(p[1]), .C(g[1]), .Y(n12) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n11) );
  cla_4bit_43 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_42 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n4), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_41 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n3), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_40 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n2), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  INVX2 U1 ( .A(n14), .Y(cout) );
  INVX2 U2 ( .A(n13), .Y(n2) );
  INVX2 U3 ( .A(n12), .Y(n3) );
  INVX2 U4 ( .A(n11), .Y(n4) );
endmodule


module adder_1bit_14 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n4, n5;

  XOR2X1 U2 ( .A(carry_in), .B(n5), .Y(sum) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n5), .D(carry_in), .Y(n4) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n5) );
  INVX2 U1 ( .A(n4), .Y(carry_out) );
endmodule


module adder_1bit_13 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n4, n5;

  XOR2X1 U2 ( .A(carry_in), .B(n5), .Y(sum) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n5), .D(carry_in), .Y(n4) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n5) );
  INVX2 U1 ( .A(n4), .Y(carry_out) );
endmodule


module adder_1bit_12 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n4, n5;

  XOR2X1 U2 ( .A(carry_in), .B(n5), .Y(sum) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n5), .D(carry_in), .Y(n4) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n5) );
  INVX2 U1 ( .A(n4), .Y(carry_out) );
endmodule


module unsigned_mult16by4_0 ( a, b, product );
  input [15:0] a;
  input [3:0] b;
  output [19:0] product;
  wire   \sums[1][18] , \sums[1][17] , \sums[1][16] , \sums[1][15] ,
         \sums[1][14] , \sums[1][13] , \sums[1][12] , \sums[1][11] ,
         \sums[1][10] , \sums[1][9] , \sums[1][8] , \sums[1][7] , \sums[1][6] ,
         \sums[1][5] , \sums[1][4] , \sums[1][3] , \sums[1][2] , \sums[1][1] ,
         \sums[1][0] , \sums[0][17] , \sums[0][16] , \sums[0][15] ,
         \sums[0][14] , \sums[0][13] , \sums[0][12] , \sums[0][11] ,
         \sums[0][10] , \sums[0][9] , \sums[0][8] , \sums[0][7] , \sums[0][6] ,
         \sums[0][5] , \sums[0][4] , \sums[0][3] , \sums[0][2] , \sums[0][1] ,
         \sums[0][0] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20;
  wire   [15:0] ab0;
  wire   [15:1] ab1;
  wire   [17:2] ab2;
  wire   [18:3] ab3;
  wire   [5:0] couts;

  NOR2X1 U22 ( .A(n16), .B(n2), .Y(ab3[9]) );
  NOR2X1 U23 ( .A(n2), .B(n15), .Y(ab3[8]) );
  NOR2X1 U24 ( .A(n2), .B(n14), .Y(ab3[7]) );
  NOR2X1 U25 ( .A(n2), .B(n13), .Y(ab3[6]) );
  NOR2X1 U26 ( .A(n2), .B(n12), .Y(ab3[5]) );
  NOR2X1 U27 ( .A(n2), .B(n11), .Y(ab3[4]) );
  NOR2X1 U28 ( .A(n2), .B(n5), .Y(ab3[3]) );
  NOR2X1 U29 ( .A(n2), .B(n20), .Y(ab3[18]) );
  NOR2X1 U30 ( .A(n2), .B(n10), .Y(ab3[17]) );
  NOR2X1 U31 ( .A(n2), .B(n9), .Y(ab3[16]) );
  NOR2X1 U32 ( .A(n2), .B(n8), .Y(ab3[15]) );
  NOR2X1 U33 ( .A(n2), .B(n7), .Y(ab3[14]) );
  NOR2X1 U34 ( .A(n2), .B(n6), .Y(ab3[13]) );
  NOR2X1 U35 ( .A(n2), .B(n19), .Y(ab3[12]) );
  NOR2X1 U36 ( .A(n2), .B(n18), .Y(ab3[11]) );
  NOR2X1 U37 ( .A(n2), .B(n17), .Y(ab3[10]) );
  NOR2X1 U38 ( .A(n17), .B(n3), .Y(ab2[9]) );
  NOR2X1 U39 ( .A(n16), .B(n3), .Y(ab2[8]) );
  NOR2X1 U40 ( .A(n15), .B(n3), .Y(ab2[7]) );
  NOR2X1 U41 ( .A(n14), .B(n3), .Y(ab2[6]) );
  NOR2X1 U42 ( .A(n13), .B(n3), .Y(ab2[5]) );
  NOR2X1 U43 ( .A(n12), .B(n3), .Y(ab2[4]) );
  NOR2X1 U44 ( .A(n11), .B(n3), .Y(ab2[3]) );
  NOR2X1 U45 ( .A(n5), .B(n3), .Y(ab2[2]) );
  NOR2X1 U46 ( .A(n20), .B(n3), .Y(ab2[17]) );
  NOR2X1 U47 ( .A(n10), .B(n3), .Y(ab2[16]) );
  NOR2X1 U48 ( .A(n9), .B(n3), .Y(ab2[15]) );
  NOR2X1 U49 ( .A(n8), .B(n3), .Y(ab2[14]) );
  NOR2X1 U50 ( .A(n7), .B(n3), .Y(ab2[13]) );
  NOR2X1 U51 ( .A(n6), .B(n3), .Y(ab2[12]) );
  NOR2X1 U52 ( .A(n19), .B(n3), .Y(ab2[11]) );
  NOR2X1 U53 ( .A(n18), .B(n3), .Y(ab2[10]) );
  NOR2X1 U54 ( .A(n18), .B(n4), .Y(ab1[9]) );
  NOR2X1 U55 ( .A(n17), .B(n4), .Y(ab1[8]) );
  NOR2X1 U56 ( .A(n16), .B(n4), .Y(ab1[7]) );
  NOR2X1 U57 ( .A(n15), .B(n4), .Y(ab1[6]) );
  NOR2X1 U58 ( .A(n14), .B(n4), .Y(ab1[5]) );
  NOR2X1 U59 ( .A(n13), .B(n4), .Y(ab1[4]) );
  NOR2X1 U60 ( .A(n12), .B(n4), .Y(ab1[3]) );
  NOR2X1 U61 ( .A(n11), .B(n4), .Y(ab1[2]) );
  NOR2X1 U62 ( .A(n5), .B(n4), .Y(ab1[1]) );
  NOR2X1 U63 ( .A(n10), .B(n4), .Y(ab1[15]) );
  NOR2X1 U64 ( .A(n9), .B(n4), .Y(ab1[14]) );
  NOR2X1 U65 ( .A(n8), .B(n4), .Y(ab1[13]) );
  NOR2X1 U66 ( .A(n7), .B(n4), .Y(ab1[12]) );
  NOR2X1 U67 ( .A(n6), .B(n4), .Y(ab1[11]) );
  NOR2X1 U68 ( .A(n19), .B(n4), .Y(ab1[10]) );
  NOR2X1 U69 ( .A(n19), .B(n1), .Y(ab0[9]) );
  NOR2X1 U70 ( .A(n18), .B(n1), .Y(ab0[8]) );
  NOR2X1 U71 ( .A(n17), .B(n1), .Y(ab0[7]) );
  NOR2X1 U72 ( .A(n16), .B(n1), .Y(ab0[6]) );
  NOR2X1 U73 ( .A(n15), .B(n1), .Y(ab0[5]) );
  NOR2X1 U74 ( .A(n14), .B(n1), .Y(ab0[4]) );
  NOR2X1 U75 ( .A(n13), .B(n1), .Y(ab0[3]) );
  NOR2X1 U76 ( .A(n12), .B(n1), .Y(ab0[2]) );
  NOR2X1 U77 ( .A(n11), .B(n1), .Y(ab0[1]) );
  NOR2X1 U78 ( .A(n20), .B(n1), .Y(ab0[15]) );
  NOR2X1 U79 ( .A(n10), .B(n1), .Y(ab0[14]) );
  NOR2X1 U80 ( .A(n9), .B(n1), .Y(ab0[13]) );
  NOR2X1 U81 ( .A(n8), .B(n1), .Y(ab0[12]) );
  NOR2X1 U82 ( .A(n7), .B(n1), .Y(ab0[11]) );
  NOR2X1 U83 ( .A(n6), .B(n1), .Y(ab0[10]) );
  NOR2X1 U84 ( .A(n5), .B(n1), .Y(ab0[0]) );
  cla_16bit_12 A1 ( .a(ab0), .b({ab1, 1'b0}), .cin(1'b0), .cout(couts[0]), 
        .sum({\sums[0][15] , \sums[0][14] , \sums[0][13] , \sums[0][12] , 
        \sums[0][11] , \sums[0][10] , \sums[0][9] , \sums[0][8] , \sums[0][7] , 
        \sums[0][6] , \sums[0][5] , \sums[0][4] , \sums[0][3] , \sums[0][2] , 
        \sums[0][1] , \sums[0][0] }) );
  adder_1bit_17 A1_1 ( .a(1'b0), .b(ab2[16]), .carry_in(couts[0]), .sum(
        \sums[0][16] ), .carry_out(\sums[0][17] ) );
  cla_16bit_11 A2 ( .a({\sums[0][15] , \sums[0][14] , \sums[0][13] , 
        \sums[0][12] , \sums[0][11] , \sums[0][10] , \sums[0][9] , 
        \sums[0][8] , \sums[0][7] , \sums[0][6] , \sums[0][5] , \sums[0][4] , 
        \sums[0][3] , \sums[0][2] , \sums[0][1] , \sums[0][0] }), .b({
        ab2[15:2], 1'b0, 1'b0}), .cin(1'b0), .cout(couts[1]), .sum({
        \sums[1][15] , \sums[1][14] , \sums[1][13] , \sums[1][12] , 
        \sums[1][11] , \sums[1][10] , \sums[1][9] , \sums[1][8] , \sums[1][7] , 
        \sums[1][6] , \sums[1][5] , \sums[1][4] , \sums[1][3] , \sums[1][2] , 
        \sums[1][1] , \sums[1][0] }) );
  adder_1bit_16 A2_1 ( .a(\sums[0][16] ), .b(ab2[16]), .carry_in(couts[1]), 
        .sum(\sums[1][16] ), .carry_out(couts[2]) );
  adder_1bit_15 A2_2 ( .a(\sums[0][17] ), .b(ab2[17]), .carry_in(couts[2]), 
        .sum(\sums[1][17] ), .carry_out(\sums[1][18] ) );
  cla_16bit_10 A3 ( .a({\sums[1][15] , \sums[1][14] , \sums[1][13] , 
        \sums[1][12] , \sums[1][11] , \sums[1][10] , \sums[1][9] , 
        \sums[1][8] , \sums[1][7] , \sums[1][6] , \sums[1][5] , \sums[1][4] , 
        \sums[1][3] , \sums[1][2] , \sums[1][1] , \sums[1][0] }), .b({
        ab3[15:3], 1'b0, 1'b0, 1'b0}), .cin(1'b0), .cout(couts[3]), .sum(
        product[15:0]) );
  adder_1bit_14 A3_1 ( .a(\sums[1][16] ), .b(ab3[16]), .carry_in(couts[3]), 
        .sum(product[16]), .carry_out(couts[4]) );
  adder_1bit_13 A3_2 ( .a(\sums[1][17] ), .b(ab3[17]), .carry_in(couts[4]), 
        .sum(product[17]), .carry_out(couts[5]) );
  adder_1bit_12 A3_3 ( .a(\sums[1][18] ), .b(ab3[18]), .carry_in(couts[5]), 
        .sum(product[18]), .carry_out(product[19]) );
  INVX2 U2 ( .A(b[2]), .Y(n3) );
  INVX2 U3 ( .A(b[0]), .Y(n1) );
  INVX2 U4 ( .A(b[3]), .Y(n2) );
  INVX2 U5 ( .A(b[1]), .Y(n4) );
  INVX2 U6 ( .A(a[0]), .Y(n5) );
  INVX2 U7 ( .A(a[10]), .Y(n6) );
  INVX2 U8 ( .A(a[11]), .Y(n7) );
  INVX2 U9 ( .A(a[12]), .Y(n8) );
  INVX2 U10 ( .A(a[13]), .Y(n9) );
  INVX2 U11 ( .A(a[14]), .Y(n10) );
  INVX2 U12 ( .A(a[1]), .Y(n11) );
  INVX2 U13 ( .A(a[2]), .Y(n12) );
  INVX2 U14 ( .A(a[3]), .Y(n13) );
  INVX2 U15 ( .A(a[4]), .Y(n14) );
  INVX2 U16 ( .A(a[5]), .Y(n15) );
  INVX2 U17 ( .A(a[6]), .Y(n16) );
  INVX2 U18 ( .A(a[7]), .Y(n17) );
  INVX2 U19 ( .A(a[8]), .Y(n18) );
  INVX2 U20 ( .A(a[9]), .Y(n19) );
  INVX2 U21 ( .A(a[15]), .Y(n20) );
endmodule


module cla_4bit_121 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n2), .B(n5), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n2), .B(n5), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n2), .B(n5), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(b[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(a[3]), .Y(n5) );
endmodule


module cla_4bit_120 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n4), .B(n5), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n4), .B(n5), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n4), .B(n5), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(b[3]), .Y(n4) );
  INVX2 U10 ( .A(a[3]), .Y(n5) );
endmodule


module cla_4bit_119 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n2), .B(n5), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n2), .B(n5), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n2), .B(n5), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(b[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(a[3]), .Y(n5) );
endmodule


module cla_4bit_118 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n1), .C(n4), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n3), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n1), .C(n39), .D(n4), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n1), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n2), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n3), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(a[3]), .Y(n1) );
  INVX2 U7 ( .A(n36), .Y(n2) );
  INVX2 U8 ( .A(n23), .Y(n3) );
  INVX2 U9 ( .A(n28), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_16bit_29 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   cout, n2, n3, n4, n11, n12, n13, n14, n15, n16;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  NOR2X1 U5 ( .A(n16), .B(n15), .Y(pg) );
  NAND2X1 U6 ( .A(p[3]), .B(p[2]), .Y(n15) );
  NAND2X1 U7 ( .A(p[1]), .B(p[0]), .Y(n16) );
  AOI21X1 U8 ( .A(n2), .B(p[3]), .C(g[3]), .Y(n14) );
  AOI21X1 U9 ( .A(n3), .B(p[2]), .C(g[2]), .Y(n13) );
  AOI21X1 U10 ( .A(n4), .B(p[1]), .C(g[1]), .Y(n12) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n11) );
  cla_4bit_121 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_120 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n4), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_119 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n3), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_118 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n2), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  INVX2 U1 ( .A(n14), .Y(cout) );
  INVX2 U2 ( .A(n13), .Y(n2) );
  INVX2 U3 ( .A(n12), .Y(n3) );
  INVX2 U4 ( .A(n11), .Y(n4) );
endmodule


module cla_4bit_117 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n2), .B(n5), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n2), .B(n5), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n2), .B(n5), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(b[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(a[3]), .Y(n5) );
endmodule


module cla_4bit_116 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n4), .B(n5), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n4), .B(n5), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n4), .B(n5), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(b[3]), .Y(n4) );
  INVX2 U10 ( .A(a[3]), .Y(n5) );
endmodule


module cla_4bit_115 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n2), .B(n5), .C(n1), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n4), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n2), .B(n5), .C(n39), .D(n1), .Y(cout) );
  NAND2X1 U26 ( .A(n2), .B(n5), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n3), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n4), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n28), .Y(n1) );
  INVX2 U7 ( .A(b[3]), .Y(n2) );
  INVX2 U8 ( .A(n36), .Y(n3) );
  INVX2 U9 ( .A(n23), .Y(n4) );
  INVX2 U10 ( .A(a[3]), .Y(n5) );
endmodule


module cla_4bit_114 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n1), .C(n4), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n3), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n1), .C(n39), .D(n4), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n1), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n2), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n3), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(a[3]), .Y(n1) );
  INVX2 U7 ( .A(n36), .Y(n2) );
  INVX2 U8 ( .A(n23), .Y(n3) );
  INVX2 U9 ( .A(n28), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_16bit_28 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   cout, n2, n3, n4, n11, n12, n13, n14, n15, n16;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  NOR2X1 U5 ( .A(n16), .B(n15), .Y(pg) );
  NAND2X1 U6 ( .A(p[3]), .B(p[2]), .Y(n15) );
  NAND2X1 U7 ( .A(p[1]), .B(p[0]), .Y(n16) );
  AOI21X1 U8 ( .A(n2), .B(p[3]), .C(g[3]), .Y(n14) );
  AOI21X1 U9 ( .A(n3), .B(p[2]), .C(g[2]), .Y(n13) );
  AOI21X1 U10 ( .A(n4), .B(p[1]), .C(g[1]), .Y(n12) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n11) );
  cla_4bit_117 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_116 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n4), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_115 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n3), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_114 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n2), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  INVX2 U1 ( .A(n14), .Y(cout) );
  INVX2 U2 ( .A(n13), .Y(n2) );
  INVX2 U3 ( .A(n12), .Y(n3) );
  INVX2 U4 ( .A(n11), .Y(n4) );
endmodule


module amp_comp_0 ( clk, n_rst, inchan, in_thresh, outchan );
  input [15:0] inchan;
  input [3:0] in_thresh;
  output [15:0] outchan;
  input clk, n_rst;
  wire   \AcmpB[15] , \CcmpD[15] , \diff1[15] , n156, n157, n158, n159, n160,
         n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171,
         n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, n182,
         n183, n184, n185, n186, n187, n188, n190, n191, n192, n193, n194,
         n195, n196, n197, n198, n199, n200, n201, n202, n203, n204, n205,
         n206, n207, n208, n209, n210, n211, n212, n213, n214, n215, n216,
         n217, n218, n219, n220, n221, n222, n223, n224, n225, n226, n227,
         n228, n229, n230, n231, n232, n233, n235, n236, n237, n238, n239,
         n240, n241, n242, n243, n244, n245, n246, n247, n248, n249, n251,
         n252, n253, n254, n255, n256, n257, n258, n259, n260, n261, n262,
         n263, n264, n265, n267, n269, n270, n271, n272, n273, n274, n275,
         n276, n277, n278, n279, n280, n281, n282, n283, n284, n285, n286,
         n287, n288, n289, n290, n291, n292, n293, n294, n295, n296, n297,
         n298, n299, n300, n301, n302, n303, n304, n305, n306, n307, n308,
         n309, n310, n311, n312, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n34, n35, n36, n37, n39, n41, n43, n45, n48, n50,
         n52, n54, n56, n58, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83,
         n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97,
         n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109,
         n110, n111, n112, n113, n114, n115, n116, n117, n118, n119, n120,
         n121, n122, n123, n124, n125, n126, n127, n128, n129, n130, n131,
         n132, n133, n134, n135, n136, n137, n138, n139, n140, n141, n142,
         n143, n144, n145, n146, n147, n148, n149, n150, n151, n152, n153,
         n189, n234, n250, n266, n268, n314, n315, n316, n317, n318, n319,
         n320, n321, n322, n323, n324, n325, n326, n327, n328, n329, n330;
  wire   [15:0] reg_1_out;
  wire   [15:0] reg_2_out;
  wire   [15:0] reg_3_out;
  wire   [15:0] reg_4_out;
  wire   [15:0] A_opp_sign;
  wire   [15:0] A;
  wire   [15:0] B_opp_sign;
  wire   [15:0] C_opp_sign;
  wire   [15:0] C;
  wire   [15:0] D_opp_sign;
  wire   [15:0] D;
  wire   [15:0] max;
  wire   [15:0] diff2;
  wire   [19:0] product;
  wire   [14:0] modifier;
  wire   [15:0] out_pos_val;
  wire   [15:0] out_neg_val;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29, 
        SYNOPSYS_UNCONNECTED__30, SYNOPSYS_UNCONNECTED__31, 
        SYNOPSYS_UNCONNECTED__32, SYNOPSYS_UNCONNECTED__33, 
        SYNOPSYS_UNCONNECTED__34, SYNOPSYS_UNCONNECTED__35, 
        SYNOPSYS_UNCONNECTED__36, SYNOPSYS_UNCONNECTED__37, 
        SYNOPSYS_UNCONNECTED__38, SYNOPSYS_UNCONNECTED__39, 
        SYNOPSYS_UNCONNECTED__40, SYNOPSYS_UNCONNECTED__41, 
        SYNOPSYS_UNCONNECTED__42, SYNOPSYS_UNCONNECTED__43, 
        SYNOPSYS_UNCONNECTED__44, SYNOPSYS_UNCONNECTED__45, 
        SYNOPSYS_UNCONNECTED__46, SYNOPSYS_UNCONNECTED__47, 
        SYNOPSYS_UNCONNECTED__48, SYNOPSYS_UNCONNECTED__49, 
        SYNOPSYS_UNCONNECTED__50, SYNOPSYS_UNCONNECTED__51, 
        SYNOPSYS_UNCONNECTED__52, SYNOPSYS_UNCONNECTED__53, 
        SYNOPSYS_UNCONNECTED__54, SYNOPSYS_UNCONNECTED__55, 
        SYNOPSYS_UNCONNECTED__56, SYNOPSYS_UNCONNECTED__57, 
        SYNOPSYS_UNCONNECTED__58, SYNOPSYS_UNCONNECTED__59, 
        SYNOPSYS_UNCONNECTED__60;

  AOI22X1 U160 ( .A(out_neg_val[9]), .B(n14), .C(out_pos_val[9]), .D(n18), .Y(
        n156) );
  AOI22X1 U161 ( .A(out_neg_val[8]), .B(n13), .C(out_pos_val[8]), .D(n17), .Y(
        n157) );
  AOI22X1 U162 ( .A(out_neg_val[7]), .B(n14), .C(out_pos_val[7]), .D(n17), .Y(
        n158) );
  AOI22X1 U163 ( .A(out_neg_val[6]), .B(n13), .C(out_pos_val[6]), .D(n17), .Y(
        n159) );
  AOI22X1 U164 ( .A(out_neg_val[5]), .B(n14), .C(out_pos_val[5]), .D(n18), .Y(
        n160) );
  AOI22X1 U165 ( .A(out_neg_val[4]), .B(n13), .C(out_pos_val[4]), .D(n18), .Y(
        n161) );
  AOI22X1 U166 ( .A(out_neg_val[3]), .B(n14), .C(out_pos_val[3]), .D(n18), .Y(
        n162) );
  AOI22X1 U167 ( .A(out_neg_val[2]), .B(n13), .C(out_pos_val[2]), .D(n18), .Y(
        n163) );
  AOI22X1 U168 ( .A(out_neg_val[1]), .B(n14), .C(out_pos_val[1]), .D(n18), .Y(
        n164) );
  AOI22X1 U169 ( .A(out_neg_val[15]), .B(n13), .C(out_pos_val[15]), .D(n18), 
        .Y(n165) );
  AOI22X1 U170 ( .A(out_neg_val[14]), .B(n14), .C(out_pos_val[14]), .D(n19), 
        .Y(n166) );
  AOI22X1 U171 ( .A(out_neg_val[13]), .B(n13), .C(out_pos_val[13]), .D(n19), 
        .Y(n167) );
  AOI22X1 U172 ( .A(out_neg_val[12]), .B(n14), .C(out_pos_val[12]), .D(n19), 
        .Y(n168) );
  AOI22X1 U173 ( .A(out_neg_val[11]), .B(n13), .C(out_pos_val[11]), .D(n19), 
        .Y(n169) );
  AOI22X1 U174 ( .A(out_neg_val[10]), .B(n13), .C(out_pos_val[10]), .D(n19), 
        .Y(n170) );
  AOI22X1 U175 ( .A(out_neg_val[0]), .B(n14), .C(out_pos_val[0]), .D(n16), .Y(
        n171) );
  NAND2X1 U177 ( .A(n187), .B(n188), .Y(modifier[9]) );
  AOI22X1 U178 ( .A(product[14]), .B(n63), .C(product[15]), .D(n64), .Y(n188)
         );
  AOI22X1 U179 ( .A(product[16]), .B(n62), .C(n15), .D(product[17]), .Y(n187)
         );
  NAND2X1 U180 ( .A(n190), .B(n191), .Y(modifier[8]) );
  AOI22X1 U181 ( .A(product[13]), .B(n63), .C(product[14]), .D(n64), .Y(n191)
         );
  AOI22X1 U182 ( .A(product[15]), .B(n62), .C(n15), .D(product[16]), .Y(n190)
         );
  NAND2X1 U183 ( .A(n192), .B(n193), .Y(modifier[7]) );
  AOI22X1 U184 ( .A(product[12]), .B(n63), .C(product[13]), .D(n64), .Y(n193)
         );
  AOI22X1 U185 ( .A(product[14]), .B(n62), .C(product[15]), .D(n15), .Y(n192)
         );
  NAND2X1 U186 ( .A(n194), .B(n195), .Y(modifier[6]) );
  AOI22X1 U187 ( .A(product[11]), .B(n63), .C(product[12]), .D(n64), .Y(n195)
         );
  AOI22X1 U188 ( .A(product[13]), .B(n62), .C(product[14]), .D(n15), .Y(n194)
         );
  NAND2X1 U189 ( .A(n196), .B(n197), .Y(modifier[5]) );
  AOI22X1 U190 ( .A(product[10]), .B(n63), .C(product[11]), .D(n64), .Y(n197)
         );
  AOI22X1 U191 ( .A(product[12]), .B(n62), .C(product[13]), .D(n15), .Y(n196)
         );
  NAND2X1 U192 ( .A(n198), .B(n199), .Y(modifier[4]) );
  AOI22X1 U193 ( .A(product[9]), .B(n63), .C(product[10]), .D(n64), .Y(n199)
         );
  AOI22X1 U194 ( .A(product[11]), .B(n62), .C(product[12]), .D(n15), .Y(n198)
         );
  NAND2X1 U195 ( .A(n200), .B(n201), .Y(modifier[3]) );
  AOI22X1 U196 ( .A(product[8]), .B(n63), .C(product[9]), .D(n64), .Y(n201) );
  AOI22X1 U197 ( .A(product[10]), .B(n62), .C(product[11]), .D(n15), .Y(n200)
         );
  NAND2X1 U198 ( .A(n202), .B(n203), .Y(modifier[2]) );
  AOI22X1 U199 ( .A(product[7]), .B(n63), .C(product[8]), .D(n64), .Y(n203) );
  AOI22X1 U200 ( .A(product[9]), .B(n62), .C(product[10]), .D(n15), .Y(n202)
         );
  NAND2X1 U201 ( .A(n204), .B(n205), .Y(modifier[1]) );
  AOI22X1 U202 ( .A(product[6]), .B(n63), .C(product[7]), .D(n64), .Y(n205) );
  AOI22X1 U203 ( .A(product[8]), .B(n62), .C(product[9]), .D(n15), .Y(n204) );
  NOR2X1 U204 ( .A(n36), .B(n206), .Y(modifier[14]) );
  AOI22X1 U205 ( .A(product[19]), .B(n64), .C(n63), .D(product[18]), .Y(n297)
         );
  OAI21X1 U206 ( .A(n36), .B(n207), .C(n208), .Y(modifier[12]) );
  AOI22X1 U207 ( .A(product[17]), .B(n63), .C(n64), .D(product[18]), .Y(n208)
         );
  NAND2X1 U208 ( .A(n209), .B(n210), .Y(modifier[11]) );
  AOI22X1 U209 ( .A(product[16]), .B(n63), .C(product[17]), .D(n64), .Y(n210)
         );
  AOI22X1 U210 ( .A(n62), .B(product[18]), .C(n15), .D(product[19]), .Y(n209)
         );
  NAND2X1 U211 ( .A(n211), .B(n212), .Y(modifier[10]) );
  AOI22X1 U212 ( .A(product[15]), .B(n63), .C(product[16]), .D(n64), .Y(n212)
         );
  AOI22X1 U213 ( .A(n62), .B(product[17]), .C(n15), .D(product[18]), .Y(n211)
         );
  NAND2X1 U214 ( .A(n213), .B(n214), .Y(modifier[0]) );
  AOI22X1 U215 ( .A(product[5]), .B(n63), .C(product[6]), .D(n64), .Y(n214) );
  NAND3X1 U216 ( .A(max[12]), .B(n65), .C(n216), .Y(n215) );
  NAND3X1 U217 ( .A(n216), .B(max[11]), .C(n217), .Y(n206) );
  NOR2X1 U218 ( .A(max[13]), .B(max[12]), .Y(n217) );
  AOI22X1 U219 ( .A(product[7]), .B(n62), .C(product[8]), .D(n15), .Y(n213) );
  NAND2X1 U221 ( .A(n216), .B(max[13]), .Y(n207) );
  NOR2X1 U222 ( .A(max[14]), .B(diff2[15]), .Y(n216) );
  OAI22X1 U223 ( .A(n303), .B(n10), .C(\diff1[15] ), .D(n218), .Y(max[9]) );
  OAI22X1 U224 ( .A(D[9]), .B(n8), .C(\CcmpD[15] ), .D(C[9]), .Y(n303) );
  OAI22X1 U225 ( .A(n304), .B(n10), .C(\diff1[15] ), .D(n219), .Y(max[8]) );
  OAI22X1 U226 ( .A(D[8]), .B(n8), .C(\CcmpD[15] ), .D(C[8]), .Y(n304) );
  OAI22X1 U227 ( .A(n305), .B(n10), .C(\diff1[15] ), .D(n220), .Y(max[7]) );
  OAI22X1 U228 ( .A(D[7]), .B(n8), .C(\CcmpD[15] ), .D(C[7]), .Y(n305) );
  OAI22X1 U229 ( .A(n306), .B(n10), .C(\diff1[15] ), .D(n221), .Y(max[6]) );
  OAI22X1 U230 ( .A(D[6]), .B(n8), .C(\CcmpD[15] ), .D(C[6]), .Y(n306) );
  OAI22X1 U231 ( .A(n307), .B(n10), .C(\diff1[15] ), .D(n222), .Y(max[5]) );
  OAI22X1 U232 ( .A(D[5]), .B(n8), .C(\CcmpD[15] ), .D(C[5]), .Y(n307) );
  OAI22X1 U233 ( .A(n308), .B(n10), .C(n11), .D(n223), .Y(max[4]) );
  OAI22X1 U234 ( .A(D[4]), .B(n8), .C(n9), .D(C[4]), .Y(n308) );
  OAI22X1 U235 ( .A(n309), .B(n10), .C(n11), .D(n224), .Y(max[3]) );
  OAI22X1 U236 ( .A(D[3]), .B(n8), .C(n9), .D(C[3]), .Y(n309) );
  OAI22X1 U237 ( .A(n310), .B(n10), .C(n11), .D(n225), .Y(max[2]) );
  OAI22X1 U238 ( .A(D[2]), .B(n8), .C(n9), .D(C[2]), .Y(n310) );
  OAI22X1 U239 ( .A(n311), .B(n10), .C(n11), .D(n226), .Y(max[1]) );
  OAI22X1 U240 ( .A(D[1]), .B(n8), .C(n9), .D(C[1]), .Y(n311) );
  OAI22X1 U241 ( .A(n298), .B(n10), .C(n11), .D(n227), .Y(max[14]) );
  OAI22X1 U242 ( .A(D[14]), .B(n8), .C(n9), .D(C[14]), .Y(n298) );
  OAI22X1 U243 ( .A(n299), .B(n10), .C(n11), .D(n228), .Y(max[13]) );
  OAI22X1 U244 ( .A(D[13]), .B(n8), .C(n9), .D(C[13]), .Y(n299) );
  OAI22X1 U245 ( .A(n300), .B(n10), .C(n11), .D(n229), .Y(max[12]) );
  OAI22X1 U246 ( .A(D[12]), .B(n8), .C(n9), .D(C[12]), .Y(n300) );
  OAI22X1 U247 ( .A(n301), .B(n10), .C(n11), .D(n230), .Y(max[11]) );
  OAI22X1 U248 ( .A(D[11]), .B(n8), .C(n9), .D(C[11]), .Y(n301) );
  OAI22X1 U249 ( .A(n302), .B(n10), .C(n11), .D(n231), .Y(max[10]) );
  OAI22X1 U250 ( .A(D[10]), .B(n8), .C(n9), .D(C[10]), .Y(n302) );
  OAI22X1 U251 ( .A(n312), .B(n10), .C(n11), .D(n232), .Y(max[0]) );
  OAI22X1 U252 ( .A(D[0]), .B(n8), .C(n9), .D(C[0]), .Y(n312) );
  OAI21X1 U253 ( .A(n14), .B(n317), .C(n233), .Y(D[9]) );
  AOI21X1 U254 ( .A(D_opp_sign[9]), .B(n12), .C(n2), .Y(n233) );
  OAI21X1 U255 ( .A(n13), .B(n318), .C(n235), .Y(D[8]) );
  AOI21X1 U256 ( .A(D_opp_sign[8]), .B(n12), .C(n2), .Y(n235) );
  OAI21X1 U257 ( .A(n14), .B(n319), .C(n236), .Y(D[7]) );
  AOI21X1 U258 ( .A(D_opp_sign[7]), .B(n12), .C(n2), .Y(n236) );
  OAI21X1 U259 ( .A(n13), .B(n320), .C(n237), .Y(D[6]) );
  AOI21X1 U260 ( .A(D_opp_sign[6]), .B(n12), .C(n2), .Y(n237) );
  OAI21X1 U261 ( .A(n14), .B(n321), .C(n238), .Y(D[5]) );
  AOI21X1 U262 ( .A(D_opp_sign[5]), .B(n12), .C(n2), .Y(n238) );
  OAI21X1 U263 ( .A(n13), .B(n322), .C(n239), .Y(D[4]) );
  AOI21X1 U264 ( .A(D_opp_sign[4]), .B(n12), .C(n2), .Y(n239) );
  OAI21X1 U265 ( .A(n14), .B(n323), .C(n240), .Y(D[3]) );
  AOI21X1 U266 ( .A(D_opp_sign[3]), .B(n14), .C(n2), .Y(n240) );
  OAI21X1 U267 ( .A(n13), .B(n324), .C(n241), .Y(D[2]) );
  AOI21X1 U268 ( .A(D_opp_sign[2]), .B(n13), .C(n2), .Y(n241) );
  OAI21X1 U269 ( .A(n14), .B(n325), .C(n242), .Y(D[1]) );
  AOI21X1 U270 ( .A(D_opp_sign[1]), .B(n14), .C(n2), .Y(n242) );
  OAI21X1 U271 ( .A(n13), .B(n266), .C(n243), .Y(D[14]) );
  AOI21X1 U272 ( .A(D_opp_sign[14]), .B(n13), .C(n2), .Y(n243) );
  OAI21X1 U273 ( .A(n14), .B(n268), .C(n244), .Y(D[13]) );
  AOI21X1 U274 ( .A(D_opp_sign[13]), .B(n14), .C(n2), .Y(n244) );
  OAI21X1 U275 ( .A(n13), .B(n314), .C(n245), .Y(D[12]) );
  AOI21X1 U276 ( .A(D_opp_sign[12]), .B(n13), .C(n2), .Y(n245) );
  OAI21X1 U277 ( .A(n14), .B(n315), .C(n246), .Y(D[11]) );
  AOI21X1 U278 ( .A(D_opp_sign[11]), .B(n14), .C(n2), .Y(n246) );
  OAI21X1 U279 ( .A(n13), .B(n316), .C(n247), .Y(D[10]) );
  AOI21X1 U280 ( .A(D_opp_sign[10]), .B(n13), .C(n2), .Y(n247) );
  OAI21X1 U281 ( .A(n14), .B(n326), .C(n248), .Y(D[0]) );
  AOI21X1 U282 ( .A(D_opp_sign[0]), .B(n12), .C(n2), .Y(n248) );
  OAI21X1 U283 ( .A(reg_3_out[15]), .B(n132), .C(n249), .Y(C[9]) );
  AOI21X1 U284 ( .A(C_opp_sign[9]), .B(reg_3_out[15]), .C(n4), .Y(n249) );
  OAI21X1 U285 ( .A(reg_3_out[15]), .B(n133), .C(n251), .Y(C[8]) );
  AOI21X1 U286 ( .A(C_opp_sign[8]), .B(reg_3_out[15]), .C(n4), .Y(n251) );
  OAI21X1 U287 ( .A(n20), .B(n134), .C(n252), .Y(C[7]) );
  AOI21X1 U288 ( .A(C_opp_sign[7]), .B(n20), .C(n4), .Y(n252) );
  OAI21X1 U289 ( .A(n20), .B(n135), .C(n253), .Y(C[6]) );
  AOI21X1 U290 ( .A(C_opp_sign[6]), .B(n20), .C(n4), .Y(n253) );
  OAI21X1 U291 ( .A(n20), .B(n136), .C(n254), .Y(C[5]) );
  AOI21X1 U292 ( .A(C_opp_sign[5]), .B(n20), .C(n4), .Y(n254) );
  OAI21X1 U293 ( .A(n20), .B(n137), .C(n255), .Y(C[4]) );
  AOI21X1 U294 ( .A(C_opp_sign[4]), .B(n20), .C(n4), .Y(n255) );
  OAI21X1 U295 ( .A(n20), .B(n138), .C(n256), .Y(C[3]) );
  AOI21X1 U296 ( .A(C_opp_sign[3]), .B(n20), .C(n4), .Y(n256) );
  OAI21X1 U297 ( .A(n20), .B(n139), .C(n257), .Y(C[2]) );
  AOI21X1 U298 ( .A(C_opp_sign[2]), .B(n20), .C(n4), .Y(n257) );
  OAI21X1 U299 ( .A(n20), .B(n140), .C(n258), .Y(C[1]) );
  AOI21X1 U300 ( .A(C_opp_sign[1]), .B(n20), .C(n4), .Y(n258) );
  OAI21X1 U301 ( .A(reg_3_out[15]), .B(n127), .C(n259), .Y(C[14]) );
  AOI21X1 U302 ( .A(C_opp_sign[14]), .B(n20), .C(n4), .Y(n259) );
  OAI21X1 U303 ( .A(reg_3_out[15]), .B(n128), .C(n260), .Y(C[13]) );
  AOI21X1 U304 ( .A(C_opp_sign[13]), .B(n20), .C(n4), .Y(n260) );
  OAI21X1 U305 ( .A(reg_3_out[15]), .B(n129), .C(n261), .Y(C[12]) );
  AOI21X1 U306 ( .A(C_opp_sign[12]), .B(n20), .C(n4), .Y(n261) );
  OAI21X1 U307 ( .A(reg_3_out[15]), .B(n130), .C(n262), .Y(C[11]) );
  AOI21X1 U308 ( .A(C_opp_sign[11]), .B(n20), .C(n4), .Y(n262) );
  OAI21X1 U309 ( .A(reg_3_out[15]), .B(n131), .C(n263), .Y(C[10]) );
  AOI21X1 U310 ( .A(C_opp_sign[10]), .B(n20), .C(n4), .Y(n263) );
  OAI21X1 U311 ( .A(reg_3_out[15]), .B(n141), .C(n264), .Y(C[0]) );
  AOI21X1 U312 ( .A(C_opp_sign[0]), .B(n20), .C(n4), .Y(n264) );
  AOI22X1 U313 ( .A(n6), .B(A[9]), .C(n177), .D(\AcmpB[15] ), .Y(n218) );
  OAI21X1 U314 ( .A(reg_2_out[15]), .B(n117), .C(n265), .Y(n177) );
  AOI21X1 U315 ( .A(B_opp_sign[9]), .B(reg_2_out[15]), .C(n1), .Y(n265) );
  OAI21X1 U316 ( .A(reg_1_out[15]), .B(n87), .C(n267), .Y(A[9]) );
  AOI21X1 U317 ( .A(A_opp_sign[9]), .B(reg_1_out[15]), .C(n3), .Y(n267) );
  AOI22X1 U318 ( .A(n6), .B(A[8]), .C(n178), .D(\AcmpB[15] ), .Y(n219) );
  OAI21X1 U319 ( .A(reg_2_out[15]), .B(n118), .C(n269), .Y(n178) );
  AOI21X1 U320 ( .A(B_opp_sign[8]), .B(reg_2_out[15]), .C(n1), .Y(n269) );
  OAI21X1 U321 ( .A(reg_1_out[15]), .B(n88), .C(n270), .Y(A[8]) );
  AOI21X1 U322 ( .A(A_opp_sign[8]), .B(reg_1_out[15]), .C(n3), .Y(n270) );
  AOI22X1 U323 ( .A(n6), .B(A[7]), .C(n179), .D(\AcmpB[15] ), .Y(n220) );
  OAI21X1 U324 ( .A(n22), .B(n119), .C(n271), .Y(n179) );
  AOI21X1 U325 ( .A(B_opp_sign[7]), .B(n22), .C(n1), .Y(n271) );
  OAI21X1 U326 ( .A(n24), .B(n89), .C(n272), .Y(A[7]) );
  AOI21X1 U327 ( .A(A_opp_sign[7]), .B(n24), .C(n3), .Y(n272) );
  AOI22X1 U328 ( .A(n6), .B(A[6]), .C(n180), .D(\AcmpB[15] ), .Y(n221) );
  OAI21X1 U329 ( .A(n22), .B(n120), .C(n273), .Y(n180) );
  AOI21X1 U330 ( .A(B_opp_sign[6]), .B(n22), .C(n1), .Y(n273) );
  OAI21X1 U331 ( .A(n24), .B(n90), .C(n274), .Y(A[6]) );
  AOI21X1 U332 ( .A(A_opp_sign[6]), .B(n24), .C(n3), .Y(n274) );
  AOI22X1 U333 ( .A(n6), .B(A[5]), .C(n181), .D(\AcmpB[15] ), .Y(n222) );
  OAI21X1 U334 ( .A(n22), .B(n121), .C(n275), .Y(n181) );
  AOI21X1 U335 ( .A(B_opp_sign[5]), .B(n22), .C(n1), .Y(n275) );
  OAI21X1 U336 ( .A(n24), .B(n91), .C(n276), .Y(A[5]) );
  AOI21X1 U337 ( .A(A_opp_sign[5]), .B(n24), .C(n3), .Y(n276) );
  AOI22X1 U338 ( .A(n6), .B(A[4]), .C(n182), .D(n7), .Y(n223) );
  OAI21X1 U339 ( .A(n22), .B(n122), .C(n277), .Y(n182) );
  AOI21X1 U340 ( .A(B_opp_sign[4]), .B(n22), .C(n1), .Y(n277) );
  OAI21X1 U341 ( .A(n24), .B(n92), .C(n278), .Y(A[4]) );
  AOI21X1 U342 ( .A(A_opp_sign[4]), .B(n24), .C(n3), .Y(n278) );
  AOI22X1 U343 ( .A(n6), .B(A[3]), .C(n183), .D(n7), .Y(n224) );
  OAI21X1 U344 ( .A(n22), .B(n123), .C(n279), .Y(n183) );
  AOI21X1 U345 ( .A(B_opp_sign[3]), .B(n22), .C(n1), .Y(n279) );
  OAI21X1 U346 ( .A(n24), .B(n93), .C(n280), .Y(A[3]) );
  AOI21X1 U347 ( .A(A_opp_sign[3]), .B(n24), .C(n3), .Y(n280) );
  AOI22X1 U348 ( .A(n6), .B(A[2]), .C(n184), .D(n7), .Y(n225) );
  OAI21X1 U349 ( .A(n22), .B(n124), .C(n281), .Y(n184) );
  AOI21X1 U350 ( .A(B_opp_sign[2]), .B(n22), .C(n1), .Y(n281) );
  OAI21X1 U351 ( .A(n24), .B(n94), .C(n282), .Y(A[2]) );
  AOI21X1 U352 ( .A(A_opp_sign[2]), .B(n24), .C(n3), .Y(n282) );
  AOI22X1 U353 ( .A(n6), .B(A[1]), .C(n185), .D(n7), .Y(n226) );
  OAI21X1 U354 ( .A(n22), .B(n125), .C(n283), .Y(n185) );
  AOI21X1 U355 ( .A(B_opp_sign[1]), .B(n22), .C(n1), .Y(n283) );
  OAI21X1 U356 ( .A(n24), .B(n95), .C(n284), .Y(A[1]) );
  AOI21X1 U357 ( .A(A_opp_sign[1]), .B(n24), .C(n3), .Y(n284) );
  AOI22X1 U359 ( .A(n6), .B(A[14]), .C(n172), .D(n7), .Y(n227) );
  OAI21X1 U360 ( .A(reg_2_out[15]), .B(n112), .C(n285), .Y(n172) );
  AOI21X1 U361 ( .A(B_opp_sign[14]), .B(n22), .C(n1), .Y(n285) );
  OAI21X1 U362 ( .A(reg_1_out[15]), .B(n82), .C(n286), .Y(A[14]) );
  AOI21X1 U363 ( .A(A_opp_sign[14]), .B(n24), .C(n3), .Y(n286) );
  AOI22X1 U364 ( .A(n6), .B(A[13]), .C(n173), .D(n7), .Y(n228) );
  OAI21X1 U365 ( .A(reg_2_out[15]), .B(n113), .C(n287), .Y(n173) );
  AOI21X1 U366 ( .A(B_opp_sign[13]), .B(n22), .C(n1), .Y(n287) );
  OAI21X1 U367 ( .A(reg_1_out[15]), .B(n83), .C(n288), .Y(A[13]) );
  AOI21X1 U368 ( .A(A_opp_sign[13]), .B(n24), .C(n3), .Y(n288) );
  AOI22X1 U369 ( .A(n6), .B(A[12]), .C(n174), .D(n7), .Y(n229) );
  OAI21X1 U370 ( .A(reg_2_out[15]), .B(n114), .C(n289), .Y(n174) );
  AOI21X1 U371 ( .A(B_opp_sign[12]), .B(n22), .C(n1), .Y(n289) );
  OAI21X1 U372 ( .A(reg_1_out[15]), .B(n84), .C(n290), .Y(A[12]) );
  AOI21X1 U373 ( .A(A_opp_sign[12]), .B(n24), .C(n3), .Y(n290) );
  AOI22X1 U374 ( .A(n6), .B(A[11]), .C(n175), .D(n7), .Y(n230) );
  OAI21X1 U375 ( .A(reg_2_out[15]), .B(n115), .C(n291), .Y(n175) );
  AOI21X1 U376 ( .A(B_opp_sign[11]), .B(n22), .C(n1), .Y(n291) );
  OAI21X1 U377 ( .A(reg_1_out[15]), .B(n85), .C(n292), .Y(A[11]) );
  AOI21X1 U378 ( .A(A_opp_sign[11]), .B(n24), .C(n3), .Y(n292) );
  AOI22X1 U379 ( .A(n6), .B(A[10]), .C(n176), .D(n7), .Y(n231) );
  OAI21X1 U380 ( .A(reg_2_out[15]), .B(n116), .C(n293), .Y(n176) );
  AOI21X1 U381 ( .A(B_opp_sign[10]), .B(n22), .C(n1), .Y(n293) );
  OAI21X1 U382 ( .A(reg_1_out[15]), .B(n86), .C(n294), .Y(A[10]) );
  AOI21X1 U383 ( .A(A_opp_sign[10]), .B(n24), .C(n3), .Y(n294) );
  AOI22X1 U384 ( .A(n6), .B(A[0]), .C(n186), .D(n7), .Y(n232) );
  OAI21X1 U385 ( .A(reg_2_out[15]), .B(n126), .C(n295), .Y(n186) );
  AOI21X1 U386 ( .A(B_opp_sign[0]), .B(n22), .C(n1), .Y(n295) );
  OAI21X1 U387 ( .A(reg_1_out[15]), .B(n96), .C(n296), .Y(A[0]) );
  AOI21X1 U388 ( .A(A_opp_sign[0]), .B(n24), .C(n3), .Y(n296) );
  flex_buffer_NUM_BITS16_3 BUFFER1 ( .clk(n26), .n_rst(n28), .input_data(
        inchan), .output_data(reg_1_out) );
  flex_buffer_NUM_BITS16_2 BUFFER2 ( .clk(n26), .n_rst(n28), .input_data(
        reg_1_out), .output_data(reg_2_out) );
  flex_buffer_NUM_BITS16_1 BUFFER3 ( .clk(n26), .n_rst(n29), .input_data(
        reg_2_out), .output_data(reg_3_out) );
  flex_buffer_NUM_BITS16_0 BUFFER4 ( .clk(n26), .n_rst(n29), .input_data(
        reg_3_out), .output_data(reg_4_out) );
  cla_16bit_37 ABSA ( .a({n25, n82, n83, n84, n85, n86, n87, n88, n89, n90, 
        n91, n92, n93, n94, n95, n96}), .b({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .cin(
        1'b1), .sum(A_opp_sign) );
  cla_16bit_36 ABSB ( .a({n23, n112, n113, n114, n115, n116, n117, n118, n119, 
        n120, n121, n122, n123, n124, n125, n126}), .b({1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .cin(1'b1), .sum(B_opp_sign) );
  cla_16bit_35 ABSC ( .a({n21, n127, n128, n129, n130, n131, n132, n133, n134, 
        n135, n136, n137, n138, n139, n140, n141}), .b({1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .cin(1'b1), .sum(C_opp_sign) );
  cla_16bit_34 ABSD ( .a({n16, n266, n268, n314, n315, n316, n317, n318, n319, 
        n320, n321, n322, n323, n324, n325, n326}), .b({1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .cin(1'b1), .sum(D_opp_sign) );
  cla_16bit_33 A2 ( .a({1'b0, A[14:0]}), .b({1'b1, n102, n101, n100, n99, n98, 
        n111, n110, n109, n108, n107, n106, n105, n104, n103, n97}), .cin(1'b1), .sum({\AcmpB[15] , SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14}) );
  cla_16bit_32 A3 ( .a({1'b0, C[14:0]}), .b({1'b1, n147, n146, n145, n144, 
        n143, n250, n234, n189, n153, n152, n151, n150, n149, n148, n142}), 
        .cin(1'b1), .sum({\CcmpD[15] , SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29}) );
  cla_16bit_31 A4 ( .a({1'b0, n72, n71, n70, n69, n68, n81, n80, n79, n78, n77, 
        n76, n75, n74, n73, n67}), .b({1'b1, n298, n299, n300, n301, n302, 
        n303, n304, n305, n306, n307, n308, n309, n310, n311, n312}), .cin(
        1'b1), .sum({\diff1[15] , SYNOPSYS_UNCONNECTED__30, 
        SYNOPSYS_UNCONNECTED__31, SYNOPSYS_UNCONNECTED__32, 
        SYNOPSYS_UNCONNECTED__33, SYNOPSYS_UNCONNECTED__34, 
        SYNOPSYS_UNCONNECTED__35, SYNOPSYS_UNCONNECTED__36, 
        SYNOPSYS_UNCONNECTED__37, SYNOPSYS_UNCONNECTED__38, 
        SYNOPSYS_UNCONNECTED__39, SYNOPSYS_UNCONNECTED__40, 
        SYNOPSYS_UNCONNECTED__41, SYNOPSYS_UNCONNECTED__42, 
        SYNOPSYS_UNCONNECTED__43, SYNOPSYS_UNCONNECTED__44}) );
  cla_16bit_30 A5 ( .a({1'b0, max[14:0]}), .b({1'b1, n327, n328, n329, n330, 
        1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1}), 
        .cin(1'b1), .sum({diff2[15:11], SYNOPSYS_UNCONNECTED__45, 
        SYNOPSYS_UNCONNECTED__46, SYNOPSYS_UNCONNECTED__47, 
        SYNOPSYS_UNCONNECTED__48, SYNOPSYS_UNCONNECTED__49, 
        SYNOPSYS_UNCONNECTED__50, SYNOPSYS_UNCONNECTED__51, 
        SYNOPSYS_UNCONNECTED__52, SYNOPSYS_UNCONNECTED__53, 
        SYNOPSYS_UNCONNECTED__54, SYNOPSYS_UNCONNECTED__55}) );
  unsigned_mult16by4_0 M1 ( .a({1'b0, D[14:0]}), .b(diff2[14:11]), .product({
        product[19:5], SYNOPSYS_UNCONNECTED__56, SYNOPSYS_UNCONNECTED__57, 
        SYNOPSYS_UNCONNECTED__58, SYNOPSYS_UNCONNECTED__59, 
        SYNOPSYS_UNCONNECTED__60}) );
  cla_16bit_29 A6 ( .a({n12, reg_4_out[14:0]}), .b({1'b1, n35, n297, n34, n39, 
        n41, n43, n45, n61, n48, n50, n52, n54, n56, n58, n60}), .cin(1'b1), 
        .sum(out_pos_val) );
  cla_16bit_28 A7 ( .a({n12, reg_4_out[14:0]}), .b({1'b0, modifier[14], n37, 
        modifier[12:0]}), .cin(1'b0), .sum(out_neg_val) );
  AND2X2 U3 ( .A(B_opp_sign[15]), .B(reg_2_out[15]), .Y(n1) );
  AND2X2 U4 ( .A(D_opp_sign[15]), .B(n13), .Y(n2) );
  AND2X2 U5 ( .A(A_opp_sign[15]), .B(reg_1_out[15]), .Y(n3) );
  AND2X2 U6 ( .A(C_opp_sign[15]), .B(reg_3_out[15]), .Y(n4) );
  INVX2 U7 ( .A(n206), .Y(n63) );
  INVX2 U8 ( .A(n207), .Y(n62) );
  INVX2 U9 ( .A(n16), .Y(n14) );
  INVX2 U10 ( .A(n16), .Y(n13) );
  INVX2 U11 ( .A(n17), .Y(n12) );
  INVX4 U12 ( .A(n27), .Y(n26) );
  INVX2 U13 ( .A(clk), .Y(n27) );
  INVX2 U14 ( .A(n215), .Y(n64) );
  INVX2 U15 ( .A(n23), .Y(n22) );
  INVX2 U16 ( .A(n25), .Y(n24) );
  INVX2 U17 ( .A(n21), .Y(n20) );
  INVX2 U18 ( .A(n5), .Y(n15) );
  OR2X2 U19 ( .A(n66), .B(diff2[15]), .Y(n5) );
  INVX2 U20 ( .A(reg_4_out[15]), .Y(n17) );
  INVX2 U21 ( .A(reg_4_out[15]), .Y(n18) );
  INVX2 U22 ( .A(reg_2_out[15]), .Y(n23) );
  INVX2 U23 ( .A(n6), .Y(n7) );
  INVX2 U24 ( .A(n10), .Y(n11) );
  INVX2 U25 ( .A(n8), .Y(n9) );
  INVX2 U26 ( .A(reg_4_out[15]), .Y(n19) );
  INVX2 U27 ( .A(reg_1_out[15]), .Y(n25) );
  INVX2 U28 ( .A(reg_3_out[15]), .Y(n21) );
  BUFX2 U29 ( .A(n_rst), .Y(n28) );
  BUFX2 U30 ( .A(n_rst), .Y(n29) );
  INVX2 U31 ( .A(\diff1[15] ), .Y(n10) );
  INVX2 U32 ( .A(\AcmpB[15] ), .Y(n6) );
  INVX2 U33 ( .A(\CcmpD[15] ), .Y(n8) );
  INVX2 U34 ( .A(reg_4_out[15]), .Y(n16) );
  INVX2 U35 ( .A(n165), .Y(outchan[15]) );
  INVX2 U36 ( .A(n166), .Y(outchan[14]) );
  INVX2 U37 ( .A(n167), .Y(outchan[13]) );
  INVX2 U38 ( .A(n168), .Y(outchan[12]) );
  INVX2 U39 ( .A(modifier[12]), .Y(n34) );
  INVX2 U40 ( .A(modifier[14]), .Y(n35) );
  INVX2 U41 ( .A(product[19]), .Y(n36) );
  INVX2 U42 ( .A(n297), .Y(n37) );
  INVX2 U43 ( .A(n169), .Y(outchan[11]) );
  INVX2 U44 ( .A(modifier[11]), .Y(n39) );
  INVX2 U45 ( .A(n170), .Y(outchan[10]) );
  INVX2 U46 ( .A(modifier[10]), .Y(n41) );
  INVX2 U47 ( .A(n156), .Y(outchan[9]) );
  INVX2 U48 ( .A(modifier[9]), .Y(n43) );
  INVX2 U49 ( .A(n157), .Y(outchan[8]) );
  INVX2 U50 ( .A(modifier[8]), .Y(n45) );
  INVX2 U51 ( .A(n158), .Y(outchan[7]) );
  INVX2 U52 ( .A(n159), .Y(outchan[6]) );
  INVX2 U53 ( .A(modifier[6]), .Y(n48) );
  INVX2 U54 ( .A(n160), .Y(outchan[5]) );
  INVX2 U55 ( .A(modifier[5]), .Y(n50) );
  INVX2 U56 ( .A(n161), .Y(outchan[4]) );
  INVX2 U57 ( .A(modifier[4]), .Y(n52) );
  INVX2 U58 ( .A(n162), .Y(outchan[3]) );
  INVX2 U59 ( .A(modifier[3]), .Y(n54) );
  INVX2 U60 ( .A(n163), .Y(outchan[2]) );
  INVX2 U61 ( .A(modifier[2]), .Y(n56) );
  INVX2 U62 ( .A(n164), .Y(outchan[1]) );
  INVX2 U63 ( .A(modifier[1]), .Y(n58) );
  INVX2 U64 ( .A(n171), .Y(outchan[0]) );
  INVX2 U65 ( .A(modifier[0]), .Y(n60) );
  INVX2 U66 ( .A(modifier[7]), .Y(n61) );
  INVX2 U67 ( .A(max[13]), .Y(n65) );
  INVX2 U68 ( .A(max[14]), .Y(n66) );
  INVX2 U69 ( .A(n232), .Y(n67) );
  INVX2 U70 ( .A(n231), .Y(n68) );
  INVX2 U71 ( .A(n230), .Y(n69) );
  INVX2 U72 ( .A(n229), .Y(n70) );
  INVX2 U73 ( .A(n228), .Y(n71) );
  INVX2 U74 ( .A(n227), .Y(n72) );
  INVX2 U75 ( .A(n226), .Y(n73) );
  INVX2 U76 ( .A(n225), .Y(n74) );
  INVX2 U77 ( .A(n224), .Y(n75) );
  INVX2 U78 ( .A(n223), .Y(n76) );
  INVX2 U79 ( .A(n222), .Y(n77) );
  INVX2 U80 ( .A(n221), .Y(n78) );
  INVX2 U81 ( .A(n220), .Y(n79) );
  INVX2 U82 ( .A(n219), .Y(n80) );
  INVX2 U83 ( .A(n218), .Y(n81) );
  INVX2 U84 ( .A(reg_1_out[14]), .Y(n82) );
  INVX2 U85 ( .A(reg_1_out[13]), .Y(n83) );
  INVX2 U86 ( .A(reg_1_out[12]), .Y(n84) );
  INVX2 U87 ( .A(reg_1_out[11]), .Y(n85) );
  INVX2 U88 ( .A(reg_1_out[10]), .Y(n86) );
  INVX2 U89 ( .A(reg_1_out[9]), .Y(n87) );
  INVX2 U90 ( .A(reg_1_out[8]), .Y(n88) );
  INVX2 U91 ( .A(reg_1_out[7]), .Y(n89) );
  INVX2 U92 ( .A(reg_1_out[6]), .Y(n90) );
  INVX2 U93 ( .A(reg_1_out[5]), .Y(n91) );
  INVX2 U94 ( .A(reg_1_out[4]), .Y(n92) );
  INVX2 U95 ( .A(reg_1_out[3]), .Y(n93) );
  INVX2 U96 ( .A(reg_1_out[2]), .Y(n94) );
  INVX2 U97 ( .A(reg_1_out[1]), .Y(n95) );
  INVX2 U98 ( .A(reg_1_out[0]), .Y(n96) );
  INVX2 U99 ( .A(n186), .Y(n97) );
  INVX2 U100 ( .A(n176), .Y(n98) );
  INVX2 U101 ( .A(n175), .Y(n99) );
  INVX2 U102 ( .A(n174), .Y(n100) );
  INVX2 U103 ( .A(n173), .Y(n101) );
  INVX2 U104 ( .A(n172), .Y(n102) );
  INVX2 U105 ( .A(n185), .Y(n103) );
  INVX2 U106 ( .A(n184), .Y(n104) );
  INVX2 U107 ( .A(n183), .Y(n105) );
  INVX2 U108 ( .A(n182), .Y(n106) );
  INVX2 U109 ( .A(n181), .Y(n107) );
  INVX2 U110 ( .A(n180), .Y(n108) );
  INVX2 U111 ( .A(n179), .Y(n109) );
  INVX2 U112 ( .A(n178), .Y(n110) );
  INVX2 U113 ( .A(n177), .Y(n111) );
  INVX2 U114 ( .A(reg_2_out[14]), .Y(n112) );
  INVX2 U115 ( .A(reg_2_out[13]), .Y(n113) );
  INVX2 U116 ( .A(reg_2_out[12]), .Y(n114) );
  INVX2 U117 ( .A(reg_2_out[11]), .Y(n115) );
  INVX2 U118 ( .A(reg_2_out[10]), .Y(n116) );
  INVX2 U119 ( .A(reg_2_out[9]), .Y(n117) );
  INVX2 U120 ( .A(reg_2_out[8]), .Y(n118) );
  INVX2 U121 ( .A(reg_2_out[7]), .Y(n119) );
  INVX2 U122 ( .A(reg_2_out[6]), .Y(n120) );
  INVX2 U123 ( .A(reg_2_out[5]), .Y(n121) );
  INVX2 U124 ( .A(reg_2_out[4]), .Y(n122) );
  INVX2 U125 ( .A(reg_2_out[3]), .Y(n123) );
  INVX2 U126 ( .A(reg_2_out[2]), .Y(n124) );
  INVX2 U127 ( .A(reg_2_out[1]), .Y(n125) );
  INVX2 U128 ( .A(reg_2_out[0]), .Y(n126) );
  INVX2 U129 ( .A(reg_3_out[14]), .Y(n127) );
  INVX2 U130 ( .A(reg_3_out[13]), .Y(n128) );
  INVX2 U131 ( .A(reg_3_out[12]), .Y(n129) );
  INVX2 U132 ( .A(reg_3_out[11]), .Y(n130) );
  INVX2 U133 ( .A(reg_3_out[10]), .Y(n131) );
  INVX2 U134 ( .A(reg_3_out[9]), .Y(n132) );
  INVX2 U135 ( .A(reg_3_out[8]), .Y(n133) );
  INVX2 U136 ( .A(reg_3_out[7]), .Y(n134) );
  INVX2 U137 ( .A(reg_3_out[6]), .Y(n135) );
  INVX2 U138 ( .A(reg_3_out[5]), .Y(n136) );
  INVX2 U139 ( .A(reg_3_out[4]), .Y(n137) );
  INVX2 U140 ( .A(reg_3_out[3]), .Y(n138) );
  INVX2 U141 ( .A(reg_3_out[2]), .Y(n139) );
  INVX2 U142 ( .A(reg_3_out[1]), .Y(n140) );
  INVX2 U143 ( .A(reg_3_out[0]), .Y(n141) );
  INVX2 U144 ( .A(D[0]), .Y(n142) );
  INVX2 U145 ( .A(D[10]), .Y(n143) );
  INVX2 U146 ( .A(D[11]), .Y(n144) );
  INVX2 U147 ( .A(D[12]), .Y(n145) );
  INVX2 U148 ( .A(D[13]), .Y(n146) );
  INVX2 U149 ( .A(D[14]), .Y(n147) );
  INVX2 U150 ( .A(D[1]), .Y(n148) );
  INVX2 U151 ( .A(D[2]), .Y(n149) );
  INVX2 U152 ( .A(D[3]), .Y(n150) );
  INVX2 U153 ( .A(D[4]), .Y(n151) );
  INVX2 U154 ( .A(D[5]), .Y(n152) );
  INVX2 U155 ( .A(D[6]), .Y(n153) );
  INVX2 U156 ( .A(D[7]), .Y(n189) );
  INVX2 U157 ( .A(D[8]), .Y(n234) );
  INVX2 U158 ( .A(D[9]), .Y(n250) );
  INVX2 U159 ( .A(reg_4_out[14]), .Y(n266) );
  INVX2 U220 ( .A(reg_4_out[13]), .Y(n268) );
  INVX2 U390 ( .A(reg_4_out[12]), .Y(n314) );
  INVX2 U391 ( .A(reg_4_out[11]), .Y(n315) );
  INVX2 U392 ( .A(reg_4_out[10]), .Y(n316) );
  INVX2 U393 ( .A(reg_4_out[9]), .Y(n317) );
  INVX2 U394 ( .A(reg_4_out[8]), .Y(n318) );
  INVX2 U395 ( .A(reg_4_out[7]), .Y(n319) );
  INVX2 U396 ( .A(reg_4_out[6]), .Y(n320) );
  INVX2 U397 ( .A(reg_4_out[5]), .Y(n321) );
  INVX2 U398 ( .A(reg_4_out[4]), .Y(n322) );
  INVX2 U399 ( .A(reg_4_out[3]), .Y(n323) );
  INVX2 U400 ( .A(reg_4_out[2]), .Y(n324) );
  INVX2 U401 ( .A(reg_4_out[1]), .Y(n325) );
  INVX2 U402 ( .A(reg_4_out[0]), .Y(n326) );
  INVX2 U403 ( .A(in_thresh[3]), .Y(n327) );
  INVX2 U404 ( .A(in_thresh[2]), .Y(n328) );
  INVX2 U405 ( .A(in_thresh[1]), .Y(n329) );
  INVX2 U406 ( .A(in_thresh[0]), .Y(n330) );
endmodule


module flex_buffer_NUM_BITS32_1 ( clk, n_rst, input_data, output_data );
  input [31:0] input_data;
  output [31:0] output_data;
  input clk, n_rst;
  wire   n33, n34, n35;

  DFFSR \output_data_reg[31]  ( .D(input_data[31]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[31]) );
  DFFSR \output_data_reg[30]  ( .D(input_data[30]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[30]) );
  DFFSR \output_data_reg[29]  ( .D(input_data[29]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[29]) );
  DFFSR \output_data_reg[28]  ( .D(input_data[28]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[28]) );
  DFFSR \output_data_reg[27]  ( .D(input_data[27]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[27]) );
  DFFSR \output_data_reg[26]  ( .D(input_data[26]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[26]) );
  DFFSR \output_data_reg[25]  ( .D(input_data[25]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[25]) );
  DFFSR \output_data_reg[24]  ( .D(input_data[24]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[24]) );
  DFFSR \output_data_reg[23]  ( .D(input_data[23]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[23]) );
  DFFSR \output_data_reg[22]  ( .D(input_data[22]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[22]) );
  DFFSR \output_data_reg[21]  ( .D(input_data[21]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[21]) );
  DFFSR \output_data_reg[20]  ( .D(input_data[20]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[20]) );
  DFFSR \output_data_reg[19]  ( .D(input_data[19]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[19]) );
  DFFSR \output_data_reg[18]  ( .D(input_data[18]), .CLK(n34), .R(n_rst), .S(
        1'b1), .Q(output_data[18]) );
  DFFSR \output_data_reg[17]  ( .D(input_data[17]), .CLK(n34), .R(n_rst), .S(
        1'b1), .Q(output_data[17]) );
  DFFSR \output_data_reg[16]  ( .D(input_data[16]), .CLK(n34), .R(n_rst), .S(
        1'b1), .Q(output_data[16]) );
  DFFSR \output_data_reg[15]  ( .D(input_data[15]), .CLK(n34), .R(n_rst), .S(
        1'b1), .Q(output_data[15]) );
  DFFSR \output_data_reg[14]  ( .D(input_data[14]), .CLK(n34), .R(n_rst), .S(
        1'b1), .Q(output_data[14]) );
  DFFSR \output_data_reg[13]  ( .D(input_data[13]), .CLK(n34), .R(n_rst), .S(
        1'b1), .Q(output_data[13]) );
  DFFSR \output_data_reg[12]  ( .D(input_data[12]), .CLK(n34), .R(n_rst), .S(
        1'b1), .Q(output_data[12]) );
  DFFSR \output_data_reg[11]  ( .D(input_data[11]), .CLK(n34), .R(n_rst), .S(
        1'b1), .Q(output_data[11]) );
  DFFSR \output_data_reg[10]  ( .D(input_data[10]), .CLK(n34), .R(n_rst), .S(
        1'b1), .Q(output_data[10]) );
  DFFSR \output_data_reg[9]  ( .D(input_data[9]), .CLK(n34), .R(n_rst), .S(
        1'b1), .Q(output_data[9]) );
  DFFSR \output_data_reg[8]  ( .D(input_data[8]), .CLK(n34), .R(n_rst), .S(
        1'b1), .Q(output_data[8]) );
  DFFSR \output_data_reg[7]  ( .D(input_data[7]), .CLK(n34), .R(n_rst), .S(
        1'b1), .Q(output_data[7]) );
  DFFSR \output_data_reg[6]  ( .D(input_data[6]), .CLK(n34), .R(n_rst), .S(
        1'b1), .Q(output_data[6]) );
  DFFSR \output_data_reg[5]  ( .D(input_data[5]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[5]) );
  DFFSR \output_data_reg[4]  ( .D(input_data[4]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[4]) );
  DFFSR \output_data_reg[3]  ( .D(input_data[3]), .CLK(n34), .R(n_rst), .S(
        1'b1), .Q(output_data[3]) );
  DFFSR \output_data_reg[2]  ( .D(input_data[2]), .CLK(n34), .R(n_rst), .S(
        1'b1), .Q(output_data[2]) );
  DFFSR \output_data_reg[1]  ( .D(input_data[1]), .CLK(n33), .R(n_rst), .S(
        1'b1), .Q(output_data[1]) );
  DFFSR \output_data_reg[0]  ( .D(input_data[0]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[0]) );
  INVX2 U35 ( .A(n35), .Y(n34) );
  INVX2 U36 ( .A(n35), .Y(n33) );
  INVX2 U37 ( .A(clk), .Y(n35) );
endmodule


module ud_flex_counter_NUM_CNT_BITS22_DW01_dec_1 ( A, SUM );
  input [22:0] A;
  output [22:0] SUM;
  wire   n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53;

  INVX2 U1 ( .A(n39), .Y(SUM[1]) );
  INVX2 U2 ( .A(n52), .Y(SUM[11]) );
  INVX2 U3 ( .A(n49), .Y(SUM[13]) );
  INVX2 U4 ( .A(n46), .Y(SUM[15]) );
  INVX2 U5 ( .A(n43), .Y(SUM[17]) );
  INVX2 U6 ( .A(n40), .Y(SUM[19]) );
  INVX2 U7 ( .A(n36), .Y(SUM[21]) );
  INVX2 U8 ( .A(n23), .Y(SUM[9]) );
  INVX2 U9 ( .A(n27), .Y(SUM[7]) );
  INVX2 U10 ( .A(n30), .Y(SUM[5]) );
  INVX2 U11 ( .A(n33), .Y(SUM[3]) );
  INVX2 U12 ( .A(A[0]), .Y(SUM[0]) );
  INVX2 U13 ( .A(A[2]), .Y(n13) );
  INVX2 U14 ( .A(A[4]), .Y(n14) );
  INVX2 U15 ( .A(A[6]), .Y(n15) );
  INVX2 U16 ( .A(A[8]), .Y(n16) );
  INVX2 U17 ( .A(A[10]), .Y(n17) );
  INVX2 U18 ( .A(A[12]), .Y(n18) );
  INVX2 U19 ( .A(A[14]), .Y(n19) );
  INVX2 U20 ( .A(A[16]), .Y(n20) );
  INVX2 U21 ( .A(A[18]), .Y(n21) );
  INVX2 U22 ( .A(A[20]), .Y(n22) );
  AOI21X1 U23 ( .A(n24), .B(A[9]), .C(n25), .Y(n23) );
  OAI21X1 U24 ( .A(n26), .B(n16), .C(n24), .Y(SUM[8]) );
  AOI21X1 U25 ( .A(n28), .B(A[7]), .C(n26), .Y(n27) );
  OAI21X1 U26 ( .A(n29), .B(n15), .C(n28), .Y(SUM[6]) );
  AOI21X1 U27 ( .A(n31), .B(A[5]), .C(n29), .Y(n30) );
  OAI21X1 U28 ( .A(n32), .B(n14), .C(n31), .Y(SUM[4]) );
  AOI21X1 U29 ( .A(n34), .B(A[3]), .C(n32), .Y(n33) );
  OAI21X1 U30 ( .A(n35), .B(n13), .C(n34), .Y(SUM[2]) );
  AOI21X1 U31 ( .A(n37), .B(A[21]), .C(SUM[22]), .Y(n36) );
  NOR2X1 U32 ( .A(n37), .B(A[21]), .Y(SUM[22]) );
  OAI21X1 U33 ( .A(n38), .B(n22), .C(n37), .Y(SUM[20]) );
  NAND2X1 U34 ( .A(n38), .B(n22), .Y(n37) );
  AOI21X1 U35 ( .A(A[0]), .B(A[1]), .C(n35), .Y(n39) );
  AOI21X1 U36 ( .A(n41), .B(A[19]), .C(n38), .Y(n40) );
  NOR2X1 U37 ( .A(n41), .B(A[19]), .Y(n38) );
  OAI21X1 U38 ( .A(n42), .B(n21), .C(n41), .Y(SUM[18]) );
  NAND2X1 U39 ( .A(n42), .B(n21), .Y(n41) );
  AOI21X1 U40 ( .A(n44), .B(A[17]), .C(n42), .Y(n43) );
  NOR2X1 U41 ( .A(n44), .B(A[17]), .Y(n42) );
  OAI21X1 U42 ( .A(n45), .B(n20), .C(n44), .Y(SUM[16]) );
  NAND2X1 U43 ( .A(n45), .B(n20), .Y(n44) );
  AOI21X1 U44 ( .A(n47), .B(A[15]), .C(n45), .Y(n46) );
  NOR2X1 U45 ( .A(n47), .B(A[15]), .Y(n45) );
  OAI21X1 U46 ( .A(n48), .B(n19), .C(n47), .Y(SUM[14]) );
  NAND2X1 U47 ( .A(n48), .B(n19), .Y(n47) );
  AOI21X1 U48 ( .A(n50), .B(A[13]), .C(n48), .Y(n49) );
  NOR2X1 U49 ( .A(n50), .B(A[13]), .Y(n48) );
  OAI21X1 U50 ( .A(n51), .B(n18), .C(n50), .Y(SUM[12]) );
  NAND2X1 U51 ( .A(n51), .B(n18), .Y(n50) );
  AOI21X1 U52 ( .A(n53), .B(A[11]), .C(n51), .Y(n52) );
  NOR2X1 U53 ( .A(n53), .B(A[11]), .Y(n51) );
  OAI21X1 U54 ( .A(n25), .B(n17), .C(n53), .Y(SUM[10]) );
  NAND2X1 U55 ( .A(n25), .B(n17), .Y(n53) );
  NOR2X1 U56 ( .A(n24), .B(A[9]), .Y(n25) );
  NAND2X1 U57 ( .A(n26), .B(n16), .Y(n24) );
  NOR2X1 U58 ( .A(n28), .B(A[7]), .Y(n26) );
  NAND2X1 U59 ( .A(n29), .B(n15), .Y(n28) );
  NOR2X1 U60 ( .A(n31), .B(A[5]), .Y(n29) );
  NAND2X1 U61 ( .A(n32), .B(n14), .Y(n31) );
  NOR2X1 U62 ( .A(n34), .B(A[3]), .Y(n32) );
  NAND2X1 U63 ( .A(n35), .B(n13), .Y(n34) );
  NOR2X1 U64 ( .A(A[1]), .B(A[0]), .Y(n35) );
endmodule


module ud_flex_counter_NUM_CNT_BITS22_DW01_inc_1 ( A, SUM );
  input [22:0] A;
  output [22:0] SUM;
  wire   n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n54, n55, n56, n57, n58, n59, n61, n62, n63, n64, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n76, n77, n78, n79, n80, n81, n82,
         n83, n84, n85, n86, n87, n88, n89, n90, n91, n93, n94, n95, n96, n97,
         n98, n99, n100, n101, n102, n103, n104, n105, n106, n158, n159;

  XOR2X1 U3 ( .A(n7), .B(n6), .Y(SUM[21]) );
  NOR2X1 U7 ( .A(n6), .B(n9), .Y(n5) );
  XOR2X1 U9 ( .A(n10), .B(n9), .Y(SUM[20]) );
  NAND2X1 U10 ( .A(n8), .B(n159), .Y(n7) );
  NOR2X1 U11 ( .A(n9), .B(n12), .Y(n8) );
  XOR2X1 U13 ( .A(n17), .B(n16), .Y(SUM[19]) );
  NAND2X1 U14 ( .A(n11), .B(n159), .Y(n10) );
  NOR2X1 U17 ( .A(n14), .B(n26), .Y(n13) );
  NAND2X1 U18 ( .A(n15), .B(A[18]), .Y(n14) );
  XOR2X1 U21 ( .A(n22), .B(n21), .Y(SUM[18]) );
  NAND2X1 U22 ( .A(n18), .B(n159), .Y(n17) );
  NOR2X1 U23 ( .A(n21), .B(n24), .Y(n18) );
  XOR2X1 U27 ( .A(n29), .B(n28), .Y(SUM[17]) );
  NAND2X1 U28 ( .A(n23), .B(n159), .Y(n22) );
  NAND2X1 U32 ( .A(n27), .B(n30), .Y(n26) );
  XNOR2X1 U35 ( .A(n159), .B(n31), .Y(SUM[16]) );
  NAND2X1 U36 ( .A(n30), .B(n159), .Y(n29) );
  XOR2X1 U39 ( .A(n38), .B(n37), .Y(SUM[15]) );
  NAND2X1 U41 ( .A(n34), .B(n58), .Y(n33) );
  NOR2X1 U42 ( .A(n35), .B(n47), .Y(n34) );
  NAND2X1 U43 ( .A(n36), .B(n41), .Y(n35) );
  XOR2X1 U46 ( .A(n43), .B(n42), .Y(SUM[14]) );
  NAND2X1 U47 ( .A(n77), .B(n39), .Y(n38) );
  NOR2X1 U48 ( .A(n40), .B(n57), .Y(n39) );
  NAND2X1 U49 ( .A(n41), .B(n46), .Y(n40) );
  XOR2X1 U52 ( .A(n50), .B(n49), .Y(SUM[13]) );
  NAND2X1 U53 ( .A(n77), .B(n44), .Y(n43) );
  NOR2X1 U54 ( .A(n45), .B(n57), .Y(n44) );
  NAND2X1 U57 ( .A(n48), .B(A[12]), .Y(n47) );
  XOR2X1 U60 ( .A(n55), .B(n54), .Y(SUM[12]) );
  NAND2X1 U61 ( .A(n77), .B(n51), .Y(n50) );
  NOR2X1 U62 ( .A(n52), .B(n57), .Y(n51) );
  XOR2X1 U66 ( .A(n62), .B(n61), .Y(SUM[11]) );
  NAND2X1 U67 ( .A(n56), .B(n77), .Y(n55) );
  NOR2X1 U70 ( .A(n59), .B(n71), .Y(n58) );
  NAND2X1 U71 ( .A(A[11]), .B(A[10]), .Y(n59) );
  XOR2X1 U74 ( .A(n67), .B(n66), .Y(SUM[10]) );
  NAND2X1 U75 ( .A(n63), .B(n77), .Y(n62) );
  NOR2X1 U76 ( .A(n64), .B(n69), .Y(n63) );
  XOR2X1 U80 ( .A(n74), .B(n73), .Y(SUM[9]) );
  NAND2X1 U81 ( .A(n68), .B(n77), .Y(n67) );
  NAND2X1 U85 ( .A(n72), .B(A[8]), .Y(n71) );
  XNOR2X1 U88 ( .A(n77), .B(n76), .Y(SUM[8]) );
  NAND2X1 U89 ( .A(A[8]), .B(n77), .Y(n74) );
  XOR2X1 U92 ( .A(n83), .B(n82), .Y(SUM[7]) );
  NAND2X1 U94 ( .A(n95), .B(n79), .Y(n78) );
  NOR2X1 U95 ( .A(n80), .B(n87), .Y(n79) );
  NAND2X1 U96 ( .A(n81), .B(n84), .Y(n80) );
  XNOR2X1 U99 ( .A(n86), .B(n85), .Y(SUM[6]) );
  NAND2X1 U100 ( .A(n84), .B(n86), .Y(n83) );
  XNOR2X1 U103 ( .A(n90), .B(n89), .Y(SUM[5]) );
  NOR2X1 U104 ( .A(n87), .B(n94), .Y(n86) );
  NAND2X1 U105 ( .A(n88), .B(A[4]), .Y(n87) );
  XOR2X1 U108 ( .A(n94), .B(n93), .Y(SUM[4]) );
  NOR2X1 U109 ( .A(n91), .B(n94), .Y(n90) );
  XOR2X1 U113 ( .A(n99), .B(n98), .Y(SUM[3]) );
  NOR2X1 U115 ( .A(n103), .B(n96), .Y(n95) );
  NAND2X1 U116 ( .A(n97), .B(n100), .Y(n96) );
  XNOR2X1 U119 ( .A(n102), .B(n101), .Y(SUM[2]) );
  NAND2X1 U120 ( .A(n100), .B(n102), .Y(n99) );
  XNOR2X1 U123 ( .A(n105), .B(n106), .Y(SUM[1]) );
  NAND2X1 U125 ( .A(n106), .B(n104), .Y(n103) );
  INVX2 U133 ( .A(A[18]), .Y(n21) );
  INVX1 U134 ( .A(A[10]), .Y(n66) );
  INVX1 U135 ( .A(A[8]), .Y(n76) );
  INVX1 U136 ( .A(A[12]), .Y(n54) );
  INVX1 U137 ( .A(A[4]), .Y(n93) );
  INVX1 U138 ( .A(A[11]), .Y(n61) );
  AND2X2 U139 ( .A(n5), .B(n13), .Y(n158) );
  INVX1 U140 ( .A(n78), .Y(n77) );
  INVX1 U141 ( .A(n25), .Y(n24) );
  INVX1 U142 ( .A(n24), .Y(n23) );
  NOR2X1 U143 ( .A(n78), .B(n33), .Y(n159) );
  INVX1 U144 ( .A(n26), .Y(n25) );
  AND2X2 U145 ( .A(n158), .B(n159), .Y(SUM[22]) );
  INVX2 U146 ( .A(n28), .Y(n27) );
  INVX1 U147 ( .A(n58), .Y(n57) );
  INVX1 U148 ( .A(n95), .Y(n94) );
  INVX1 U149 ( .A(n13), .Y(n12) );
  INVX1 U150 ( .A(n47), .Y(n46) );
  INVX1 U151 ( .A(n103), .Y(n102) );
  INVX2 U152 ( .A(n70), .Y(n69) );
  INVX1 U153 ( .A(n71), .Y(n70) );
  INVX2 U154 ( .A(n98), .Y(n97) );
  INVX2 U155 ( .A(n82), .Y(n81) );
  INVX2 U156 ( .A(n49), .Y(n48) );
  INVX2 U157 ( .A(n73), .Y(n72) );
  INVX2 U158 ( .A(n105), .Y(n104) );
  INVX2 U159 ( .A(n89), .Y(n88) );
  INVX1 U160 ( .A(n12), .Y(n11) );
  INVX2 U161 ( .A(n37), .Y(n36) );
  INVX2 U162 ( .A(SUM[0]), .Y(n106) );
  INVX2 U163 ( .A(n85), .Y(n84) );
  INVX2 U164 ( .A(n42), .Y(n41) );
  INVX2 U165 ( .A(n101), .Y(n100) );
  INVX2 U166 ( .A(n16), .Y(n15) );
  INVX1 U167 ( .A(A[4]), .Y(n91) );
  INVX1 U168 ( .A(n69), .Y(n68) );
  INVX2 U169 ( .A(A[17]), .Y(n28) );
  INVX1 U170 ( .A(n46), .Y(n45) );
  INVX1 U171 ( .A(n57), .Y(n56) );
  INVX1 U172 ( .A(A[12]), .Y(n52) );
  INVX1 U173 ( .A(A[10]), .Y(n64) );
  INVX2 U174 ( .A(n31), .Y(n30) );
  INVX2 U175 ( .A(A[14]), .Y(n42) );
  INVX2 U176 ( .A(A[6]), .Y(n85) );
  INVX2 U177 ( .A(A[2]), .Y(n101) );
  INVX2 U178 ( .A(A[7]), .Y(n82) );
  INVX2 U179 ( .A(A[5]), .Y(n89) );
  INVX2 U180 ( .A(A[13]), .Y(n49) );
  INVX2 U181 ( .A(A[3]), .Y(n98) );
  INVX2 U182 ( .A(A[9]), .Y(n73) );
  INVX2 U183 ( .A(A[1]), .Y(n105) );
  INVX2 U184 ( .A(A[0]), .Y(SUM[0]) );
  INVX2 U185 ( .A(A[15]), .Y(n37) );
  INVX2 U186 ( .A(A[19]), .Y(n16) );
  INVX2 U187 ( .A(A[16]), .Y(n31) );
  INVX2 U188 ( .A(A[20]), .Y(n9) );
  INVX2 U189 ( .A(A[21]), .Y(n6) );
endmodule


module ud_flex_counter_NUM_CNT_BITS22_DW_mult_uns_1 ( a, b, product );
  input [22:0] a;
  output [23:0] product;
  input b;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24;

  NOR2X1 U3 ( .A(n3), .B(n2), .Y(product[21]) );
  NOR2X1 U4 ( .A(n4), .B(n2), .Y(product[20]) );
  NOR2X1 U5 ( .A(n5), .B(n2), .Y(product[19]) );
  NOR2X1 U6 ( .A(n6), .B(n2), .Y(product[18]) );
  NOR2X1 U7 ( .A(n7), .B(n2), .Y(product[17]) );
  NOR2X1 U8 ( .A(n8), .B(n2), .Y(product[16]) );
  NOR2X1 U9 ( .A(n9), .B(n2), .Y(product[15]) );
  NOR2X1 U10 ( .A(n10), .B(n2), .Y(product[14]) );
  NOR2X1 U11 ( .A(n11), .B(n2), .Y(product[13]) );
  NOR2X1 U12 ( .A(n12), .B(n2), .Y(product[12]) );
  NOR2X1 U13 ( .A(n13), .B(n2), .Y(product[11]) );
  NOR2X1 U14 ( .A(n14), .B(n1), .Y(product[10]) );
  NOR2X1 U15 ( .A(n15), .B(n1), .Y(product[9]) );
  NOR2X1 U16 ( .A(n16), .B(n1), .Y(product[8]) );
  NOR2X1 U17 ( .A(n17), .B(n1), .Y(product[7]) );
  NOR2X1 U18 ( .A(n18), .B(n1), .Y(product[6]) );
  NOR2X1 U19 ( .A(n19), .B(n1), .Y(product[5]) );
  NOR2X1 U20 ( .A(n20), .B(n1), .Y(product[4]) );
  NOR2X1 U21 ( .A(n21), .B(n1), .Y(product[3]) );
  NOR2X1 U22 ( .A(n22), .B(n1), .Y(product[2]) );
  NOR2X1 U23 ( .A(n23), .B(n1), .Y(product[1]) );
  NOR2X1 U24 ( .A(n24), .B(n1), .Y(product[0]) );
  BUFX4 U50 ( .A(a[22]), .Y(n1) );
  BUFX2 U51 ( .A(a[22]), .Y(n2) );
  INVX1 U52 ( .A(a[4]), .Y(n20) );
  INVX1 U53 ( .A(a[12]), .Y(n12) );
  INVX1 U54 ( .A(a[14]), .Y(n10) );
  INVX1 U55 ( .A(a[6]), .Y(n18) );
  INVX1 U56 ( .A(a[10]), .Y(n14) );
  INVX1 U57 ( .A(a[8]), .Y(n16) );
  INVX1 U58 ( .A(a[2]), .Y(n22) );
  INVX1 U59 ( .A(a[7]), .Y(n17) );
  INVX1 U60 ( .A(a[5]), .Y(n19) );
  INVX1 U61 ( .A(a[11]), .Y(n13) );
  INVX1 U62 ( .A(a[13]), .Y(n11) );
  INVX1 U63 ( .A(a[3]), .Y(n21) );
  INVX1 U64 ( .A(a[9]), .Y(n15) );
  INVX1 U65 ( .A(a[1]), .Y(n23) );
  INVX1 U66 ( .A(a[0]), .Y(n24) );
  INVX1 U67 ( .A(a[15]), .Y(n9) );
  INVX1 U68 ( .A(a[16]), .Y(n8) );
  INVX1 U69 ( .A(a[20]), .Y(n4) );
  INVX1 U70 ( .A(a[21]), .Y(n3) );
  INVX1 U71 ( .A(a[19]), .Y(n5) );
  INVX1 U72 ( .A(a[17]), .Y(n7) );
  INVX1 U73 ( .A(a[18]), .Y(n6) );
endmodule


module ud_flex_counter_NUM_CNT_BITS22_DW01_dec_2 ( A, SUM );
  input [22:0] A;
  output [22:0] SUM;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n16, n17, n18, n19, n20, n21, n22,
         n23, n26, n27, n28, n29, n30, n31, n32, n33, n35, n38, n39, n40, n43,
         n44, n45, n50, n54, n55, n56, n59, n60, n61, n64, n65, n66, n67, n69,
         n71, n72, n73, n74, n76, n77, n78, n80, n81, n83, n84, n85, n86, n88,
         n89, n90, n93, n95, n96, n98, n99, n100, n101, n104, n105, n108, n109,
         n110, n114, n115, n118, n119, n120, n123, n126, n127, n130, n181;
  assign n2 = A[21];
  assign n3 = A[20];
  assign n4 = A[19];
  assign n5 = A[18];
  assign n6 = A[17];
  assign n7 = A[16];
  assign n8 = A[15];
  assign n9 = A[14];
  assign n16 = A[7];
  assign n17 = A[6];
  assign n18 = A[5];
  assign n19 = A[4];
  assign n20 = A[3];
  assign n21 = A[2];
  assign n22 = A[1];
  assign n69 = A[13];
  assign n74 = A[12];
  assign n81 = A[11];
  assign n86 = A[10];
  assign n93 = A[9];
  assign n96 = A[8];
  assign n130 = A[0];

  XOR2X1 U2 ( .A(n23), .B(A[22]), .Y(SUM[22]) );
  XOR2X1 U3 ( .A(n28), .B(n2), .Y(SUM[21]) );
  NOR2X1 U4 ( .A(n181), .B(n1), .Y(n23) );
  NAND2X1 U7 ( .A(n27), .B(n30), .Y(n26) );
  XOR2X1 U10 ( .A(n31), .B(n3), .Y(SUM[20]) );
  NOR2X1 U11 ( .A(n29), .B(n1), .Y(n28) );
  NAND2X1 U12 ( .A(n30), .B(n33), .Y(n29) );
  XOR2X1 U15 ( .A(n38), .B(n4), .Y(SUM[19]) );
  NOR2X1 U16 ( .A(n32), .B(n1), .Y(n31) );
  NAND2X1 U19 ( .A(n45), .B(n35), .Y(n32) );
  NOR2X1 U20 ( .A(n5), .B(n4), .Y(n35) );
  XOR2X1 U24 ( .A(n43), .B(n5), .Y(SUM[18]) );
  NOR2X1 U25 ( .A(n39), .B(n1), .Y(n38) );
  NAND2X1 U26 ( .A(n40), .B(n45), .Y(n39) );
  XOR2X1 U31 ( .A(n50), .B(n6), .Y(SUM[17]) );
  NOR2X1 U32 ( .A(n44), .B(n1), .Y(n43) );
  NOR2X1 U36 ( .A(n7), .B(n6), .Y(n45) );
  XNOR2X1 U40 ( .A(n1), .B(n7), .Y(SUM[16]) );
  NOR2X1 U41 ( .A(n7), .B(n1), .Y(n50) );
  XOR2X1 U45 ( .A(n59), .B(n8), .Y(SUM[15]) );
  NAND2X1 U46 ( .A(n54), .B(n99), .Y(n1) );
  NOR2X1 U47 ( .A(n55), .B(n77), .Y(n54) );
  NAND2X1 U48 ( .A(n56), .B(n66), .Y(n55) );
  NOR2X1 U49 ( .A(n9), .B(n8), .Y(n56) );
  XOR2X1 U53 ( .A(n64), .B(n9), .Y(SUM[14]) );
  NOR2X1 U54 ( .A(n60), .B(n98), .Y(n59) );
  NAND2X1 U55 ( .A(n78), .B(n61), .Y(n60) );
  NOR2X1 U56 ( .A(n9), .B(n67), .Y(n61) );
  XOR2X1 U60 ( .A(n71), .B(n69), .Y(SUM[13]) );
  NOR2X1 U61 ( .A(n65), .B(n98), .Y(n64) );
  NAND2X1 U62 ( .A(n66), .B(n78), .Y(n65) );
  NOR2X1 U65 ( .A(n74), .B(n69), .Y(n66) );
  XOR2X1 U69 ( .A(n76), .B(n74), .Y(SUM[12]) );
  NOR2X1 U70 ( .A(n72), .B(n98), .Y(n71) );
  NAND2X1 U71 ( .A(n73), .B(n78), .Y(n72) );
  XOR2X1 U76 ( .A(n83), .B(n81), .Y(SUM[11]) );
  NOR2X1 U77 ( .A(n77), .B(n98), .Y(n76) );
  NAND2X1 U80 ( .A(n80), .B(n90), .Y(n77) );
  NOR2X1 U81 ( .A(n86), .B(n81), .Y(n80) );
  XOR2X1 U85 ( .A(n88), .B(n86), .Y(SUM[10]) );
  NOR2X1 U86 ( .A(n84), .B(n98), .Y(n83) );
  NAND2X1 U87 ( .A(n85), .B(n90), .Y(n84) );
  XOR2X1 U92 ( .A(n95), .B(n93), .Y(SUM[9]) );
  NOR2X1 U93 ( .A(n89), .B(n98), .Y(n88) );
  NOR2X1 U97 ( .A(n96), .B(n93), .Y(n90) );
  XNOR2X1 U101 ( .A(n98), .B(n96), .Y(SUM[8]) );
  NOR2X1 U102 ( .A(n96), .B(n98), .Y(n95) );
  XNOR2X1 U106 ( .A(n104), .B(n16), .Y(SUM[7]) );
  NOR2X1 U108 ( .A(n100), .B(n119), .Y(n99) );
  NAND2X1 U109 ( .A(n101), .B(n109), .Y(n100) );
  NOR2X1 U110 ( .A(n17), .B(n16), .Y(n101) );
  XNOR2X1 U114 ( .A(n108), .B(n17), .Y(SUM[6]) );
  NAND2X1 U115 ( .A(n118), .B(n105), .Y(n104) );
  NOR2X1 U116 ( .A(n17), .B(n110), .Y(n105) );
  XNOR2X1 U120 ( .A(n114), .B(n18), .Y(SUM[5]) );
  NAND2X1 U121 ( .A(n109), .B(n118), .Y(n108) );
  NOR2X1 U124 ( .A(n19), .B(n18), .Y(n109) );
  XOR2X1 U128 ( .A(n118), .B(n19), .Y(SUM[4]) );
  NAND2X1 U129 ( .A(n115), .B(n118), .Y(n114) );
  XOR2X1 U134 ( .A(n123), .B(n20), .Y(SUM[3]) );
  NAND2X1 U136 ( .A(n120), .B(n127), .Y(n119) );
  NOR2X1 U137 ( .A(n21), .B(n20), .Y(n120) );
  XNOR2X1 U141 ( .A(n126), .B(n21), .Y(SUM[2]) );
  NOR2X1 U142 ( .A(n21), .B(n126), .Y(n123) );
  XNOR2X1 U146 ( .A(n22), .B(n130), .Y(SUM[1]) );
  NOR2X1 U148 ( .A(n22), .B(n130), .Y(n127) );
  OR2X1 U156 ( .A(n26), .B(n32), .Y(n181) );
  INVX1 U157 ( .A(n5), .Y(n40) );
  INVX2 U158 ( .A(n99), .Y(n98) );
  INVX2 U159 ( .A(n90), .Y(n89) );
  INVX2 U160 ( .A(n86), .Y(n85) );
  INVX2 U161 ( .A(n77), .Y(n78) );
  INVX2 U162 ( .A(n74), .Y(n73) );
  INVX2 U163 ( .A(n66), .Y(n67) );
  INVX2 U164 ( .A(n45), .Y(n44) );
  INVX2 U165 ( .A(n32), .Y(n33) );
  INVX2 U166 ( .A(n3), .Y(n30) );
  INVX2 U167 ( .A(n2), .Y(n27) );
  INVX2 U168 ( .A(n127), .Y(n126) );
  INVX2 U169 ( .A(n119), .Y(n118) );
  INVX2 U170 ( .A(n19), .Y(n115) );
  INVX2 U171 ( .A(n109), .Y(n110) );
  INVX2 U172 ( .A(n130), .Y(SUM[0]) );
endmodule


module ud_flex_counter_NUM_CNT_BITS22 ( clk, n_rst, clear, up_count_enable, 
        down_count_enable, rollover_val, count_out, rollover_flag );
  input [21:0] rollover_val;
  output [21:0] count_out;
  input clk, n_rst, clear, up_count_enable, down_count_enable;
  output rollover_flag;
  wire   n161, n162, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20,
         N21, N22, N23, N24, N25, N26, N27, N28, N29, N30, N31, N33, N34, N35,
         N36, N37, N38, N39, N40, N41, N42, N43, N44, N45, N46, N47, N48, N49,
         N50, N51, N52, N53, N54, N55, N59, N60, N61, N62, N63, N64, N65, N66,
         N67, N68, N69, N70, N71, N72, N73, N74, N75, N76, N77, N78, N79, N80,
         N81, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136, n137,
         n138, n139, n140, n141, n142, n143, n144, n145, n146, n147, n148,
         n149, N157, N156, N155, N154, N153, N152, N151, N150, N149, N148,
         N147, N146, N145, N144, N143, N142, N141, N140, N139, N138, N137,
         N136, n1, n2, n4, n5, n6, n31, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82,
         n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96,
         n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108,
         n109, n110, n111, n112, n113, n114, n115, n116, n117, n118, n119,
         n120, n121, n122, n123, n124, n125, n126, n150, n151, n152, n153,
         n154, n155, n156, n157, n158, n159;
  tri   clear;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1;

  DFFSR \current_reg[0]  ( .D(n149), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        count_out[0]) );
  DFFSR \current_reg[22]  ( .D(n127), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  DFFSR \current_reg[1]  ( .D(n148), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        count_out[1]) );
  DFFSR \current_reg[2]  ( .D(n147), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        count_out[2]) );
  DFFSR \current_reg[3]  ( .D(n146), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        count_out[3]) );
  DFFSR \current_reg[4]  ( .D(n145), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        count_out[4]) );
  DFFSR \current_reg[5]  ( .D(n144), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        count_out[5]) );
  DFFSR \current_reg[6]  ( .D(n143), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        count_out[6]) );
  DFFSR \current_reg[7]  ( .D(n142), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        count_out[7]) );
  DFFSR \current_reg[8]  ( .D(n141), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        count_out[8]) );
  DFFSR \current_reg[9]  ( .D(n140), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        count_out[9]) );
  DFFSR \current_reg[10]  ( .D(n139), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        count_out[10]) );
  DFFSR \current_reg[11]  ( .D(n138), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        count_out[11]) );
  DFFSR \current_reg[12]  ( .D(n137), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        count_out[12]) );
  DFFSR \current_reg[13]  ( .D(n136), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        count_out[13]) );
  DFFSR \current_reg[14]  ( .D(n135), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        count_out[14]) );
  DFFSR \current_reg[15]  ( .D(n134), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        count_out[15]) );
  DFFSR \current_reg[16]  ( .D(n133), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        count_out[16]) );
  DFFSR \current_reg[17]  ( .D(n132), .CLK(clk), .R(1'b1), .S(n_rst), .Q(n162)
         );
  DFFSR \current_reg[18]  ( .D(n131), .CLK(clk), .R(1'b1), .S(n_rst), .Q(n161)
         );
  DFFSR \current_reg[19]  ( .D(n130), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        count_out[19]) );
  DFFSR \current_reg[20]  ( .D(n129), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        count_out[20]) );
  DFFSR \current_reg[21]  ( .D(n128), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[21]) );
  ud_flex_counter_NUM_CNT_BITS22_DW01_dec_1 sub_60 ( .A({1'b0, rollover_val}), 
        .SUM({N55, N54, N53, N52, N51, N50, N49, N48, N47, N46, N45, N44, N43, 
        N42, N41, N40, N39, N38, N37, N36, N35, N34, N33}) );
  ud_flex_counter_NUM_CNT_BITS22_DW01_inc_1 add_54_aco ( .A({1'b0, N157, N156, 
        N155, N154, N153, N152, N151, N150, N149, N148, N147, N146, N145, N144, 
        N143, N142, N141, N140, N139, N138, N137, N136}), .SUM({N31, N30, N29, 
        N28, N27, N26, N25, N24, N23, N22, N21, N20, N19, N18, N17, N16, N15, 
        N14, N13, N12, N11, N10, N9}) );
  ud_flex_counter_NUM_CNT_BITS22_DW_mult_uns_1 mult_add_54_aco ( .a({
        rollover_flag, count_out[21:19], n5, n2, count_out[16:0]}), .b(n159), 
        .product({SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, N157, N156, 
        N155, N154, N153, N152, N151, N150, N149, N148, N147, N146, N145, N144, 
        N143, N142, N141, N140, N139, N138, N137, N136}) );
  ud_flex_counter_NUM_CNT_BITS22_DW01_dec_2 sub_72 ( .A({rollover_flag, 
        count_out[21:19], n5, n2, count_out[16:0]}), .SUM({N81, N80, N79, N78, 
        N77, N76, N75, N74, N73, N72, N71, N70, N69, N68, N67, N66, N65, N64, 
        N63, N62, N61, N60, N59}) );
  INVX8 U27 ( .A(n82), .Y(n34) );
  INVX8 U28 ( .A(n78), .Y(n33) );
  INVX8 U29 ( .A(n31), .Y(count_out[18]) );
  INVX1 U30 ( .A(count_out[17]), .Y(n1) );
  INVX4 U31 ( .A(n1), .Y(n2) );
  INVX1 U32 ( .A(count_out[18]), .Y(n4) );
  INVX4 U33 ( .A(n4), .Y(n5) );
  INVX4 U34 ( .A(n76), .Y(n38) );
  INVX2 U35 ( .A(n76), .Y(n37) );
  INVX2 U36 ( .A(n83), .Y(n36) );
  INVX2 U37 ( .A(n83), .Y(n35) );
  INVX2 U38 ( .A(n162), .Y(n6) );
  INVX8 U39 ( .A(n6), .Y(count_out[17]) );
  INVX2 U40 ( .A(n161), .Y(n31) );
  XOR2X1 U41 ( .A(count_out[13]), .B(N46), .Y(n41) );
  XOR2X1 U42 ( .A(n2), .B(N50), .Y(n40) );
  XOR2X1 U43 ( .A(count_out[14]), .B(N47), .Y(n39) );
  NOR3X1 U44 ( .A(n41), .B(n40), .C(n39), .Y(n46) );
  XOR2X1 U45 ( .A(count_out[16]), .B(N49), .Y(n44) );
  XOR2X1 U46 ( .A(count_out[12]), .B(N45), .Y(n43) );
  XOR2X1 U47 ( .A(count_out[15]), .B(N48), .Y(n42) );
  NOR3X1 U48 ( .A(n44), .B(n43), .C(n42), .Y(n45) );
  NAND2X1 U49 ( .A(n46), .B(n45), .Y(n74) );
  XNOR2X1 U50 ( .A(count_out[10]), .B(N43), .Y(n49) );
  XNOR2X1 U51 ( .A(count_out[8]), .B(N41), .Y(n48) );
  XNOR2X1 U52 ( .A(count_out[6]), .B(N39), .Y(n47) );
  NAND3X1 U53 ( .A(n49), .B(n48), .C(n47), .Y(n54) );
  XNOR2X1 U54 ( .A(count_out[1]), .B(N34), .Y(n52) );
  XNOR2X1 U55 ( .A(count_out[11]), .B(N44), .Y(n51) );
  XNOR2X1 U56 ( .A(count_out[5]), .B(N38), .Y(n50) );
  NAND3X1 U57 ( .A(n52), .B(n51), .C(n50), .Y(n53) );
  NOR2X1 U58 ( .A(n54), .B(n53), .Y(n72) );
  XNOR2X1 U59 ( .A(count_out[21]), .B(N54), .Y(n56) );
  XNOR2X1 U60 ( .A(N33), .B(count_out[0]), .Y(n55) );
  NAND2X1 U61 ( .A(n56), .B(n55), .Y(n61) );
  XNOR2X1 U62 ( .A(N36), .B(count_out[3]), .Y(n59) );
  INVX2 U63 ( .A(N55), .Y(n58) );
  XNOR2X1 U64 ( .A(count_out[2]), .B(N35), .Y(n57) );
  NAND3X1 U65 ( .A(n59), .B(n58), .C(n57), .Y(n60) );
  NOR2X1 U66 ( .A(n61), .B(n60), .Y(n71) );
  XNOR2X1 U67 ( .A(count_out[7]), .B(N40), .Y(n64) );
  XNOR2X1 U68 ( .A(count_out[19]), .B(N52), .Y(n63) );
  XNOR2X1 U69 ( .A(count_out[9]), .B(N42), .Y(n62) );
  NAND3X1 U70 ( .A(n64), .B(n63), .C(n62), .Y(n69) );
  XNOR2X1 U71 ( .A(n5), .B(N51), .Y(n67) );
  XNOR2X1 U72 ( .A(count_out[4]), .B(N37), .Y(n66) );
  XNOR2X1 U73 ( .A(count_out[20]), .B(N53), .Y(n65) );
  NAND3X1 U74 ( .A(n67), .B(n66), .C(n65), .Y(n68) );
  NOR2X1 U75 ( .A(n69), .B(n68), .Y(n70) );
  NAND3X1 U76 ( .A(n72), .B(n71), .C(n70), .Y(n73) );
  NOR2X1 U77 ( .A(n74), .B(n73), .Y(n122) );
  INVX2 U78 ( .A(clear), .Y(n124) );
  INVX2 U79 ( .A(up_count_enable), .Y(n80) );
  INVX2 U80 ( .A(down_count_enable), .Y(n75) );
  NAND3X1 U81 ( .A(n124), .B(n80), .C(n75), .Y(n76) );
  NOR2X1 U82 ( .A(up_count_enable), .B(n38), .Y(n77) );
  NAND3X1 U83 ( .A(n122), .B(n124), .C(n77), .Y(n78) );
  NOR2X1 U84 ( .A(rollover_flag), .B(clear), .Y(n81) );
  NOR2X1 U85 ( .A(n122), .B(n38), .Y(n79) );
  NAND3X1 U86 ( .A(n81), .B(n80), .C(n79), .Y(n82) );
  AOI22X1 U87 ( .A(rollover_val[20]), .B(n33), .C(N79), .D(n34), .Y(n85) );
  NAND2X1 U88 ( .A(up_count_enable), .B(n124), .Y(n83) );
  AOI22X1 U89 ( .A(count_out[20]), .B(n37), .C(N29), .D(n35), .Y(n84) );
  NAND2X1 U90 ( .A(n85), .B(n84), .Y(n129) );
  AOI22X1 U91 ( .A(rollover_val[19]), .B(n33), .C(N78), .D(n34), .Y(n87) );
  AOI22X1 U92 ( .A(count_out[19]), .B(n37), .C(N28), .D(n35), .Y(n86) );
  NAND2X1 U93 ( .A(n87), .B(n86), .Y(n130) );
  AOI22X1 U94 ( .A(rollover_val[18]), .B(n33), .C(N77), .D(n34), .Y(n89) );
  AOI22X1 U95 ( .A(n5), .B(n37), .C(N27), .D(n35), .Y(n88) );
  NAND2X1 U96 ( .A(n89), .B(n88), .Y(n131) );
  AOI22X1 U97 ( .A(rollover_val[16]), .B(n33), .C(N75), .D(n34), .Y(n91) );
  AOI22X1 U98 ( .A(count_out[16]), .B(n37), .C(N25), .D(n35), .Y(n90) );
  NAND2X1 U99 ( .A(n91), .B(n90), .Y(n133) );
  AOI22X1 U100 ( .A(rollover_val[15]), .B(n33), .C(N74), .D(n34), .Y(n93) );
  AOI22X1 U101 ( .A(count_out[15]), .B(n37), .C(N24), .D(n35), .Y(n92) );
  NAND2X1 U102 ( .A(n93), .B(n92), .Y(n134) );
  AOI22X1 U103 ( .A(rollover_val[14]), .B(n33), .C(N73), .D(n34), .Y(n95) );
  AOI22X1 U104 ( .A(count_out[14]), .B(n37), .C(N23), .D(n35), .Y(n94) );
  NAND2X1 U105 ( .A(n95), .B(n94), .Y(n135) );
  AOI22X1 U106 ( .A(rollover_val[13]), .B(n33), .C(N72), .D(n34), .Y(n97) );
  AOI22X1 U107 ( .A(count_out[13]), .B(n37), .C(N22), .D(n35), .Y(n96) );
  NAND2X1 U108 ( .A(n97), .B(n96), .Y(n136) );
  AOI22X1 U109 ( .A(rollover_val[12]), .B(n33), .C(N71), .D(n34), .Y(n99) );
  AOI22X1 U110 ( .A(count_out[12]), .B(n37), .C(N21), .D(n35), .Y(n98) );
  NAND2X1 U111 ( .A(n99), .B(n98), .Y(n137) );
  AOI22X1 U112 ( .A(rollover_val[11]), .B(n33), .C(N70), .D(n34), .Y(n101) );
  AOI22X1 U113 ( .A(count_out[11]), .B(n37), .C(N20), .D(n35), .Y(n100) );
  NAND2X1 U114 ( .A(n101), .B(n100), .Y(n138) );
  AOI22X1 U115 ( .A(rollover_val[10]), .B(n33), .C(N69), .D(n34), .Y(n103) );
  AOI22X1 U116 ( .A(count_out[10]), .B(n37), .C(N19), .D(n35), .Y(n102) );
  NAND2X1 U117 ( .A(n103), .B(n102), .Y(n139) );
  AOI22X1 U118 ( .A(rollover_val[9]), .B(n33), .C(N68), .D(n34), .Y(n105) );
  AOI22X1 U119 ( .A(count_out[9]), .B(n38), .C(N18), .D(n35), .Y(n104) );
  NAND2X1 U120 ( .A(n105), .B(n104), .Y(n140) );
  AOI22X1 U121 ( .A(rollover_val[8]), .B(n33), .C(N67), .D(n34), .Y(n107) );
  AOI22X1 U122 ( .A(count_out[8]), .B(n38), .C(N17), .D(n36), .Y(n106) );
  NAND2X1 U123 ( .A(n107), .B(n106), .Y(n141) );
  AOI22X1 U124 ( .A(rollover_val[7]), .B(n33), .C(N66), .D(n34), .Y(n109) );
  AOI22X1 U125 ( .A(count_out[7]), .B(n38), .C(N16), .D(n36), .Y(n108) );
  NAND2X1 U126 ( .A(n109), .B(n108), .Y(n142) );
  AOI22X1 U127 ( .A(rollover_val[6]), .B(n33), .C(N65), .D(n34), .Y(n111) );
  AOI22X1 U128 ( .A(count_out[6]), .B(n38), .C(N15), .D(n36), .Y(n110) );
  NAND2X1 U129 ( .A(n111), .B(n110), .Y(n143) );
  AOI22X1 U130 ( .A(rollover_val[5]), .B(n33), .C(N64), .D(n34), .Y(n113) );
  AOI22X1 U131 ( .A(count_out[5]), .B(n38), .C(N14), .D(n36), .Y(n112) );
  NAND2X1 U132 ( .A(n113), .B(n112), .Y(n144) );
  AOI22X1 U133 ( .A(rollover_val[4]), .B(n33), .C(N63), .D(n34), .Y(n115) );
  AOI22X1 U134 ( .A(count_out[4]), .B(n38), .C(N13), .D(n36), .Y(n114) );
  NAND2X1 U135 ( .A(n115), .B(n114), .Y(n145) );
  AOI22X1 U136 ( .A(rollover_val[3]), .B(n33), .C(N62), .D(n34), .Y(n117) );
  AOI22X1 U137 ( .A(count_out[3]), .B(n38), .C(N12), .D(n36), .Y(n116) );
  NAND2X1 U138 ( .A(n117), .B(n116), .Y(n146) );
  AOI22X1 U139 ( .A(rollover_val[2]), .B(n33), .C(N61), .D(n34), .Y(n119) );
  AOI22X1 U140 ( .A(count_out[2]), .B(n38), .C(N11), .D(n36), .Y(n118) );
  NAND2X1 U141 ( .A(n119), .B(n118), .Y(n147) );
  AOI22X1 U142 ( .A(rollover_val[1]), .B(n33), .C(N60), .D(n34), .Y(n121) );
  AOI22X1 U143 ( .A(count_out[1]), .B(n38), .C(N10), .D(n36), .Y(n120) );
  NAND2X1 U144 ( .A(n121), .B(n120), .Y(n148) );
  AOI22X1 U145 ( .A(rollover_val[0]), .B(n33), .C(N59), .D(n34), .Y(n152) );
  NOR2X1 U146 ( .A(up_count_enable), .B(n122), .Y(n123) );
  NAND3X1 U147 ( .A(rollover_flag), .B(n124), .C(n123), .Y(n126) );
  INVX2 U148 ( .A(count_out[0]), .Y(n125) );
  MUX2X1 U149 ( .B(n126), .A(n125), .S(n37), .Y(n150) );
  AOI21X1 U150 ( .A(N9), .B(n36), .C(n150), .Y(n151) );
  NAND2X1 U151 ( .A(n152), .B(n151), .Y(n149) );
  AOI22X1 U152 ( .A(rollover_val[17]), .B(n33), .C(N76), .D(n34), .Y(n154) );
  AOI22X1 U153 ( .A(n2), .B(n37), .C(N26), .D(n36), .Y(n153) );
  NAND2X1 U154 ( .A(n154), .B(n153), .Y(n132) );
  AOI22X1 U155 ( .A(N30), .B(n36), .C(rollover_val[21]), .D(n33), .Y(n156) );
  AOI22X1 U156 ( .A(N80), .B(n34), .C(count_out[21]), .D(n37), .Y(n155) );
  NAND2X1 U157 ( .A(n156), .B(n155), .Y(n128) );
  INVX2 U158 ( .A(rollover_flag), .Y(n159) );
  AOI21X1 U159 ( .A(N31), .B(n36), .C(n33), .Y(n158) );
  AOI22X1 U160 ( .A(N81), .B(n34), .C(n37), .D(rollover_flag), .Y(n157) );
  NAND2X1 U161 ( .A(n158), .B(n157), .Y(n127) );
endmodule


module fader_state ( clk, n_reset, clear, fad_enable, countVal );
  output [21:0] countVal;
  input clk, n_reset, clear, fad_enable;
  wire   n44, n16, n17, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n3, n4, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n18;
  wire   [3:0] state;
  wire   [1:0] nxt_state;
  tri   clear;

  DFFSR \state_reg[0]  ( .D(nxt_state[0]), .CLK(clk), .R(n_reset), .S(1'b1), 
        .Q(state[0]) );
  DFFSR \state_reg[1]  ( .D(nxt_state[1]), .CLK(clk), .R(n_reset), .S(1'b1), 
        .Q(state[1]) );
  AND2X2 U7 ( .A(n40), .B(n41), .Y(n32) );
  OR2X2 U8 ( .A(countVal[0]), .B(countVal[10]), .Y(n42) );
  NAND2X1 U22 ( .A(n19), .B(n20), .Y(n17) );
  NOR2X1 U23 ( .A(n21), .B(n22), .Y(n20) );
  NAND3X1 U24 ( .A(countVal[3]), .B(countVal[2]), .C(countVal[4]), .Y(n22) );
  NAND3X1 U25 ( .A(countVal[1]), .B(countVal[19]), .C(countVal[20]), .Y(n21)
         );
  NOR2X1 U26 ( .A(n23), .B(n24), .Y(n19) );
  NAND2X1 U27 ( .A(countVal[9]), .B(countVal[8]), .Y(n24) );
  NAND3X1 U28 ( .A(countVal[6]), .B(countVal[5]), .C(countVal[7]), .Y(n23) );
  NAND2X1 U29 ( .A(n25), .B(n26), .Y(n16) );
  NOR2X1 U30 ( .A(n27), .B(n28), .Y(n26) );
  NAND3X1 U31 ( .A(countVal[12]), .B(countVal[11]), .C(countVal[13]), .Y(n28)
         );
  NAND3X1 U32 ( .A(countVal[0]), .B(n15), .C(countVal[10]), .Y(n27) );
  NOR2X1 U33 ( .A(n29), .B(n30), .Y(n25) );
  NAND2X1 U34 ( .A(n4), .B(n3), .Y(n30) );
  NAND3X1 U35 ( .A(countVal[15]), .B(countVal[14]), .C(countVal[16]), .Y(n29)
         );
  NOR2X1 U37 ( .A(n34), .B(n35), .Y(n33) );
  NAND3X1 U38 ( .A(n36), .B(n15), .C(n37), .Y(n35) );
  NOR2X1 U39 ( .A(countVal[20]), .B(countVal[1]), .Y(n37) );
  NOR2X1 U40 ( .A(countVal[3]), .B(countVal[2]), .Y(n36) );
  NAND2X1 U41 ( .A(n38), .B(n39), .Y(n34) );
  NOR3X1 U42 ( .A(countVal[5]), .B(countVal[6]), .C(countVal[4]), .Y(n39) );
  NOR3X1 U43 ( .A(countVal[8]), .B(countVal[9]), .C(countVal[7]), .Y(n38) );
  NOR3X1 U44 ( .A(countVal[15]), .B(countVal[16]), .C(countVal[14]), .Y(n41)
         );
  NOR3X1 U45 ( .A(n4), .B(countVal[19]), .C(n3), .Y(n40) );
  NOR2X1 U46 ( .A(n14), .B(n42), .Y(n31) );
  NOR3X1 U47 ( .A(countVal[12]), .B(countVal[13]), .C(countVal[11]), .Y(n43)
         );
  ud_flex_counter_NUM_CNT_BITS22 DUT ( .clk(clk), .n_rst(n_reset), .clear(
        clear), .up_count_enable(n6), .down_count_enable(n18), .rollover_val({
        1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 
        1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1}), 
        .count_out({countVal[21:20], n44, countVal[18:0]}) );
  BUFX2 U5 ( .A(countVal[17]), .Y(n3) );
  BUFX2 U6 ( .A(countVal[18]), .Y(n4) );
  BUFX4 U9 ( .A(n44), .Y(countVal[19]) );
  AND2X2 U10 ( .A(state[0]), .B(n10), .Y(n6) );
  INVX2 U11 ( .A(state[0]), .Y(n9) );
  NAND2X1 U12 ( .A(state[1]), .B(n9), .Y(n13) );
  NAND3X1 U13 ( .A(n33), .B(n32), .C(n31), .Y(n8) );
  INVX2 U14 ( .A(state[1]), .Y(n10) );
  OAI21X1 U15 ( .A(n16), .B(n17), .C(n6), .Y(n7) );
  OAI21X1 U16 ( .A(n13), .B(n8), .C(n7), .Y(nxt_state[0]) );
  INVX2 U17 ( .A(n8), .Y(n12) );
  NAND3X1 U18 ( .A(fad_enable), .B(n10), .C(n9), .Y(n11) );
  OAI21X1 U19 ( .A(n12), .B(n13), .C(n11), .Y(nxt_state[1]) );
  INVX2 U20 ( .A(n13), .Y(n18) );
  INVX2 U21 ( .A(n43), .Y(n14) );
  INVX2 U36 ( .A(countVal[21]), .Y(n15) );
endmodule


module cla_4bit_39 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n4), .B(n5), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n4), .B(n5), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n4), .B(n5), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(b[3]), .Y(n4) );
  INVX2 U10 ( .A(a[3]), .Y(n5) );
endmodule


module cla_4bit_38 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n4), .B(n5), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n4), .B(n5), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n4), .B(n5), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(b[3]), .Y(n4) );
  INVX2 U10 ( .A(a[3]), .Y(n5) );
endmodule


module cla_4bit_37 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n4), .B(n5), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n4), .B(n5), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n4), .B(n5), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(b[3]), .Y(n4) );
  INVX2 U10 ( .A(a[3]), .Y(n5) );
endmodule


module cla_4bit_36 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n1), .C(n4), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n3), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n1), .C(n39), .D(n4), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n1), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n2), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n3), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(a[3]), .Y(n1) );
  INVX2 U7 ( .A(n36), .Y(n2) );
  INVX2 U8 ( .A(n23), .Y(n3) );
  INVX2 U9 ( .A(n28), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_16bit_9 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   cout, n2, n3, n4, n11, n12, n13, n14, n15, n16;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  NOR2X1 U5 ( .A(n16), .B(n15), .Y(pg) );
  NAND2X1 U6 ( .A(p[3]), .B(p[2]), .Y(n15) );
  NAND2X1 U7 ( .A(p[1]), .B(p[0]), .Y(n16) );
  AOI21X1 U8 ( .A(n2), .B(p[3]), .C(g[3]), .Y(n14) );
  AOI21X1 U9 ( .A(n3), .B(p[2]), .C(g[2]), .Y(n13) );
  AOI21X1 U10 ( .A(n4), .B(p[1]), .C(g[1]), .Y(n12) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n11) );
  cla_4bit_39 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_38 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n4), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_37 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n3), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_36 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n2), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  INVX2 U1 ( .A(n14), .Y(cout) );
  INVX2 U2 ( .A(n13), .Y(n2) );
  INVX2 U3 ( .A(n12), .Y(n3) );
  INVX2 U4 ( .A(n11), .Y(n4) );
endmodule


module cla_4bit_35 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45;

  INVX2 U1 ( .A(a[1]), .Y(n2) );
  AND2X2 U2 ( .A(cin), .B(n34), .Y(n1) );
  INVX4 U3 ( .A(b[1]), .Y(n29) );
  XOR2X1 U4 ( .A(n4), .B(n45), .Y(n3) );
  BUFX2 U5 ( .A(b[3]), .Y(n4) );
  BUFX2 U6 ( .A(b[3]), .Y(n10) );
  INVX2 U7 ( .A(n26), .Y(n7) );
  NOR2X1 U8 ( .A(a[3]), .B(n10), .Y(n5) );
  INVX1 U9 ( .A(n5), .Y(n41) );
  BUFX2 U10 ( .A(n35), .Y(n6) );
  XNOR2X1 U11 ( .A(n4), .B(n45), .Y(n8) );
  INVX1 U12 ( .A(n21), .Y(n22) );
  AND2X1 U13 ( .A(n21), .B(n8), .Y(n20) );
  INVX1 U14 ( .A(n4), .Y(n44) );
  AND2X2 U15 ( .A(n18), .B(n21), .Y(n9) );
  OR2X2 U16 ( .A(a[0]), .B(b[0]), .Y(n34) );
  XOR2X1 U17 ( .A(b[0]), .B(a[0]), .Y(n11) );
  XOR2X1 U18 ( .A(cin), .B(n11), .Y(sum[0]) );
  NAND2X1 U19 ( .A(n29), .B(n2), .Y(n35) );
  OAI21X1 U20 ( .A(n29), .B(n2), .C(n35), .Y(n14) );
  NAND2X1 U21 ( .A(b[0]), .B(a[0]), .Y(n28) );
  INVX2 U22 ( .A(n28), .Y(n12) );
  NOR2X1 U23 ( .A(n12), .B(n1), .Y(n13) );
  XOR2X1 U24 ( .A(n14), .B(n13), .Y(sum[1]) );
  INVX2 U25 ( .A(a[2]), .Y(n27) );
  INVX2 U26 ( .A(b[2]), .Y(n26) );
  NAND2X1 U27 ( .A(n26), .B(n27), .Y(n36) );
  NAND2X1 U28 ( .A(a[2]), .B(n7), .Y(n39) );
  NAND2X1 U29 ( .A(n36), .B(n39), .Y(n16) );
  NAND2X1 U30 ( .A(n1), .B(n6), .Y(n18) );
  OAI21X1 U31 ( .A(n29), .B(n2), .C(n28), .Y(n15) );
  NAND2X1 U32 ( .A(n15), .B(n35), .Y(n21) );
  XOR2X1 U33 ( .A(n9), .B(n16), .Y(sum[2]) );
  INVX2 U34 ( .A(a[3]), .Y(n45) );
  INVX2 U35 ( .A(n36), .Y(n40) );
  OAI21X1 U36 ( .A(n40), .B(n18), .C(n39), .Y(n17) );
  OAI22X1 U37 ( .A(n8), .B(n17), .C(n40), .D(n3), .Y(n25) );
  AND2X2 U38 ( .A(n39), .B(n18), .Y(n19) );
  NAND2X1 U39 ( .A(n20), .B(n19), .Y(n24) );
  NAND3X1 U40 ( .A(n36), .B(n3), .C(n22), .Y(n23) );
  NAND3X1 U41 ( .A(n25), .B(n24), .C(n23), .Y(sum[3]) );
  AOI22X1 U42 ( .A(n7), .B(a[2]), .C(n10), .D(a[3]), .Y(n33) );
  AOI22X1 U43 ( .A(n27), .B(n26), .C(n28), .D(n29), .Y(n31) );
  OAI21X1 U44 ( .A(n29), .B(n28), .C(n2), .Y(n30) );
  NAND2X1 U45 ( .A(n30), .B(n31), .Y(n32) );
  AOI21X1 U46 ( .A(n32), .B(n33), .C(n5), .Y(gg) );
  NAND2X1 U47 ( .A(n34), .B(n41), .Y(n38) );
  NAND2X1 U48 ( .A(n36), .B(n6), .Y(n37) );
  NOR2X1 U49 ( .A(n38), .B(n37), .Y(pg) );
  OAI21X1 U50 ( .A(n9), .B(n40), .C(n39), .Y(n42) );
  NAND2X1 U51 ( .A(n42), .B(n41), .Y(n43) );
  OAI21X1 U52 ( .A(n45), .B(n44), .C(n43), .Y(cout) );
endmodule


module cla_4bit_34 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54;

  BUFX2 U1 ( .A(b[3]), .Y(n5) );
  INVX1 U2 ( .A(n52), .Y(n38) );
  XOR2X1 U3 ( .A(n24), .B(n25), .Y(sum[2]) );
  AOI21X1 U4 ( .A(n20), .B(n21), .C(n19), .Y(sum[1]) );
  BUFX2 U5 ( .A(n12), .Y(n1) );
  INVX2 U6 ( .A(n26), .Y(n6) );
  NAND2X1 U7 ( .A(n36), .B(n35), .Y(n2) );
  XNOR2X1 U8 ( .A(n36), .B(n5), .Y(n3) );
  INVX2 U9 ( .A(n3), .Y(n30) );
  BUFX2 U10 ( .A(a[0]), .Y(n4) );
  BUFX2 U11 ( .A(b[0]), .Y(n7) );
  BUFX2 U12 ( .A(cin), .Y(n8) );
  AND2X2 U13 ( .A(cin), .B(n10), .Y(n11) );
  INVX1 U14 ( .A(n48), .Y(n26) );
  INVX1 U15 ( .A(n43), .Y(n14) );
  AND2X2 U16 ( .A(n43), .B(n44), .Y(n10) );
  XOR2X1 U17 ( .A(n8), .B(n9), .Y(sum[0]) );
  XOR2X1 U18 ( .A(n7), .B(n4), .Y(n9) );
  OR2X2 U19 ( .A(b[2]), .B(a[2]), .Y(n48) );
  OR2X2 U20 ( .A(a[0]), .B(b[0]), .Y(n43) );
  OR2X2 U21 ( .A(a[1]), .B(b[1]), .Y(n44) );
  INVX1 U22 ( .A(b[3]), .Y(n35) );
  AND2X2 U23 ( .A(cin), .B(n10), .Y(n12) );
  INVX1 U24 ( .A(cin), .Y(n20) );
  NAND2X1 U25 ( .A(b[0]), .B(a[0]), .Y(n23) );
  INVX2 U26 ( .A(n23), .Y(n16) );
  NAND2X1 U27 ( .A(b[1]), .B(a[1]), .Y(n22) );
  NAND2X1 U28 ( .A(n22), .B(n44), .Y(n15) );
  INVX2 U29 ( .A(n15), .Y(n13) );
  NOR2X1 U30 ( .A(n16), .B(n13), .Y(n21) );
  NAND2X1 U31 ( .A(n13), .B(n43), .Y(n18) );
  OAI22X1 U32 ( .A(n16), .B(n15), .C(n14), .D(n13), .Y(n17) );
  OAI21X1 U33 ( .A(n20), .B(n18), .C(n17), .Y(n19) );
  NAND2X1 U34 ( .A(b[2]), .B(a[2]), .Y(n50) );
  NAND2X1 U35 ( .A(n48), .B(n50), .Y(n25) );
  NAND2X1 U36 ( .A(n23), .B(n22), .Y(n37) );
  NAND2X1 U37 ( .A(n37), .B(n44), .Y(n29) );
  INVX2 U38 ( .A(n29), .Y(n49) );
  NOR2X1 U39 ( .A(n11), .B(n49), .Y(n24) );
  INVX2 U40 ( .A(a[3]), .Y(n36) );
  NOR2X1 U41 ( .A(n26), .B(n3), .Y(n27) );
  INVX2 U42 ( .A(n50), .Y(n39) );
  AOI22X1 U43 ( .A(n49), .B(n27), .C(n39), .D(n30), .Y(n28) );
  OAI21X1 U44 ( .A(n30), .B(n6), .C(n28), .Y(n34) );
  NAND3X1 U45 ( .A(n29), .B(n50), .C(n3), .Y(n32) );
  NAND3X1 U46 ( .A(n30), .B(n6), .C(n11), .Y(n31) );
  OAI21X1 U47 ( .A(n32), .B(n12), .C(n31), .Y(n33) );
  OR2X2 U48 ( .A(n33), .B(n34), .Y(sum[3]) );
  NAND2X1 U49 ( .A(n36), .B(n35), .Y(n47) );
  NAND2X1 U50 ( .A(n47), .B(n48), .Y(n42) );
  NAND2X1 U51 ( .A(n37), .B(n44), .Y(n41) );
  NAND2X1 U52 ( .A(b[3]), .B(a[3]), .Y(n52) );
  AOI21X1 U53 ( .A(n39), .B(n47), .C(n38), .Y(n40) );
  OAI21X1 U54 ( .A(n42), .B(n41), .C(n40), .Y(gg) );
  NAND2X1 U55 ( .A(n43), .B(n2), .Y(n46) );
  NAND2X1 U56 ( .A(n44), .B(n48), .Y(n45) );
  NOR2X1 U57 ( .A(n45), .B(n46), .Y(pg) );
  INVX2 U58 ( .A(n2), .Y(n54) );
  OAI21X1 U59 ( .A(n1), .B(n49), .C(n6), .Y(n51) );
  AND2X2 U60 ( .A(n51), .B(n50), .Y(n53) );
  OAI21X1 U61 ( .A(n54), .B(n53), .C(n52), .Y(cout) );
endmodule


module cla_4bit_33 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54;

  AND2X2 U1 ( .A(n6), .B(n38), .Y(n1) );
  OR2X2 U2 ( .A(n10), .B(n39), .Y(n2) );
  NOR2X1 U3 ( .A(a[2]), .B(b[2]), .Y(n3) );
  INVX4 U4 ( .A(n3), .Y(n50) );
  BUFX2 U5 ( .A(a[0]), .Y(n4) );
  XOR2X1 U6 ( .A(n11), .B(n5), .Y(sum[0]) );
  XOR2X1 U7 ( .A(b[0]), .B(n4), .Y(n5) );
  XOR2X1 U8 ( .A(n37), .B(n36), .Y(n6) );
  INVX1 U9 ( .A(n6), .Y(n30) );
  NOR2X1 U10 ( .A(cin), .B(n2), .Y(n9) );
  INVX1 U11 ( .A(n1), .Y(n10) );
  INVX1 U12 ( .A(cin), .Y(n7) );
  BUFX2 U13 ( .A(n7), .Y(n8) );
  INVX4 U14 ( .A(n46), .Y(n39) );
  INVX2 U15 ( .A(n47), .Y(n11) );
  INVX4 U16 ( .A(cin), .Y(n47) );
  INVX2 U17 ( .A(n12), .Y(n46) );
  INVX2 U18 ( .A(n43), .Y(n13) );
  AOI21X1 U19 ( .A(n19), .B(n20), .C(n13), .Y(n12) );
  XNOR2X1 U20 ( .A(n18), .B(n17), .Y(sum[1]) );
  AND2X2 U21 ( .A(n50), .B(n38), .Y(n15) );
  OR2X2 U22 ( .A(b[1]), .B(a[1]), .Y(n43) );
  OR2X2 U23 ( .A(a[0]), .B(b[0]), .Y(n42) );
  NAND2X1 U24 ( .A(b[0]), .B(a[0]), .Y(n19) );
  NAND2X1 U25 ( .A(cin), .B(n42), .Y(n16) );
  NAND2X1 U26 ( .A(n19), .B(n16), .Y(n18) );
  NAND2X1 U27 ( .A(a[1]), .B(b[1]), .Y(n20) );
  NAND2X1 U28 ( .A(n43), .B(n20), .Y(n17) );
  NAND2X1 U29 ( .A(b[2]), .B(a[2]), .Y(n38) );
  NOR2X1 U30 ( .A(n39), .B(n15), .Y(n26) );
  NAND2X1 U31 ( .A(n42), .B(n43), .Y(n48) );
  INVX2 U32 ( .A(n48), .Y(n21) );
  NAND2X1 U33 ( .A(n15), .B(n21), .Y(n24) );
  OAI21X1 U34 ( .A(n21), .B(n15), .C(n46), .Y(n22) );
  OAI21X1 U35 ( .A(n15), .B(n46), .C(n22), .Y(n23) );
  OAI21X1 U36 ( .A(n47), .B(n24), .C(n23), .Y(n25) );
  AOI21X1 U37 ( .A(n26), .B(n7), .C(n25), .Y(sum[2]) );
  INVX2 U38 ( .A(n50), .Y(n29) );
  INVX2 U39 ( .A(a[3]), .Y(n37) );
  NAND3X1 U40 ( .A(n50), .B(n39), .C(n30), .Y(n27) );
  OAI21X1 U41 ( .A(n6), .B(n38), .C(n27), .Y(n28) );
  AOI21X1 U42 ( .A(n29), .B(n1), .C(n28), .Y(n35) );
  NAND3X1 U43 ( .A(n48), .B(n46), .C(n1), .Y(n34) );
  NAND2X1 U44 ( .A(n50), .B(n30), .Y(n31) );
  NOR2X1 U45 ( .A(n48), .B(n31), .Y(n32) );
  AOI21X1 U46 ( .A(n32), .B(n11), .C(n9), .Y(n33) );
  NAND3X1 U47 ( .A(n35), .B(n34), .C(n33), .Y(sum[3]) );
  INVX2 U48 ( .A(b[3]), .Y(n36) );
  NAND2X1 U49 ( .A(n37), .B(n36), .Y(n41) );
  INVX2 U50 ( .A(n41), .Y(n54) );
  INVX2 U51 ( .A(n38), .Y(n49) );
  AOI21X1 U52 ( .A(n39), .B(n50), .C(n49), .Y(n40) );
  NAND2X1 U53 ( .A(b[3]), .B(a[3]), .Y(n52) );
  OAI21X1 U54 ( .A(n54), .B(n40), .C(n52), .Y(gg) );
  NAND2X1 U55 ( .A(n42), .B(n41), .Y(n45) );
  NAND2X1 U56 ( .A(n43), .B(n50), .Y(n44) );
  NOR2X1 U57 ( .A(n45), .B(n44), .Y(pg) );
  OAI21X1 U58 ( .A(n48), .B(n8), .C(n46), .Y(n51) );
  AOI21X1 U59 ( .A(n51), .B(n50), .C(n49), .Y(n53) );
  OAI21X1 U60 ( .A(n54), .B(n53), .C(n52), .Y(cout) );
endmodule


module cla_4bit_32 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54;

  BUFX2 U1 ( .A(cin), .Y(n1) );
  INVX4 U2 ( .A(cin), .Y(n47) );
  OR2X2 U3 ( .A(a[2]), .B(b[2]), .Y(n50) );
  XNOR2X1 U4 ( .A(cin), .B(n2), .Y(sum[0]) );
  XNOR2X1 U5 ( .A(b[0]), .B(a[0]), .Y(n2) );
  OR2X2 U6 ( .A(a[0]), .B(b[0]), .Y(n42) );
  OR2X2 U7 ( .A(b[1]), .B(a[1]), .Y(n43) );
  NAND2X1 U8 ( .A(b[0]), .B(a[0]), .Y(n5) );
  INVX2 U9 ( .A(n5), .Y(n12) );
  NAND2X1 U10 ( .A(a[1]), .B(b[1]), .Y(n11) );
  NAND2X1 U11 ( .A(n11), .B(n43), .Y(n6) );
  INVX2 U12 ( .A(n6), .Y(n4) );
  INVX2 U13 ( .A(n42), .Y(n3) );
  OAI22X1 U14 ( .A(n12), .B(n6), .C(n4), .D(n3), .Y(n9) );
  NAND3X1 U15 ( .A(n4), .B(n42), .C(cin), .Y(n8) );
  NAND3X1 U16 ( .A(n6), .B(n5), .C(n47), .Y(n7) );
  NAND3X1 U17 ( .A(n9), .B(n8), .C(n7), .Y(n10) );
  INVX2 U18 ( .A(n10), .Y(sum[1]) );
  NAND2X1 U19 ( .A(b[2]), .B(a[2]), .Y(n23) );
  NAND2X1 U20 ( .A(n50), .B(n23), .Y(n17) );
  INVX2 U21 ( .A(n17), .Y(n16) );
  INVX2 U22 ( .A(n11), .Y(n13) );
  OAI21X1 U23 ( .A(n13), .B(n12), .C(n43), .Y(n46) );
  NAND2X1 U24 ( .A(n42), .B(n43), .Y(n48) );
  INVX2 U25 ( .A(n48), .Y(n15) );
  OAI21X1 U26 ( .A(n15), .B(n16), .C(n46), .Y(n14) );
  OAI21X1 U27 ( .A(n16), .B(n46), .C(n14), .Y(n20) );
  NAND3X1 U28 ( .A(n16), .B(n15), .C(cin), .Y(n19) );
  NAND3X1 U29 ( .A(n17), .B(n46), .C(n47), .Y(n18) );
  NAND3X1 U30 ( .A(n20), .B(n19), .C(n18), .Y(n21) );
  INVX2 U31 ( .A(n21), .Y(sum[2]) );
  INVX2 U32 ( .A(n46), .Y(n39) );
  AND2X2 U33 ( .A(n50), .B(n39), .Y(n26) );
  INVX2 U34 ( .A(a[3]), .Y(n38) );
  XOR2X1 U35 ( .A(n38), .B(b[3]), .Y(n28) );
  INVX2 U36 ( .A(n28), .Y(n22) );
  NAND2X1 U37 ( .A(n22), .B(n23), .Y(n27) );
  INVX2 U38 ( .A(n23), .Y(n49) );
  NAND2X1 U39 ( .A(n49), .B(n28), .Y(n24) );
  OAI21X1 U40 ( .A(n27), .B(n50), .C(n24), .Y(n25) );
  AOI21X1 U41 ( .A(n26), .B(n28), .C(n25), .Y(n36) );
  INVX2 U42 ( .A(n27), .Y(n30) );
  NAND3X1 U43 ( .A(n46), .B(n30), .C(n48), .Y(n35) );
  NAND2X1 U44 ( .A(n50), .B(n28), .Y(n29) );
  NOR2X1 U45 ( .A(n48), .B(n29), .Y(n33) );
  NAND3X1 U46 ( .A(n46), .B(n47), .C(n30), .Y(n31) );
  INVX2 U47 ( .A(n31), .Y(n32) );
  AOI21X1 U48 ( .A(n33), .B(n1), .C(n32), .Y(n34) );
  NAND3X1 U49 ( .A(n36), .B(n35), .C(n34), .Y(sum[3]) );
  INVX2 U50 ( .A(b[3]), .Y(n37) );
  NAND2X1 U51 ( .A(n38), .B(n37), .Y(n41) );
  INVX2 U52 ( .A(n41), .Y(n54) );
  AOI21X1 U53 ( .A(n39), .B(n50), .C(n49), .Y(n40) );
  NAND2X1 U54 ( .A(b[3]), .B(a[3]), .Y(n52) );
  OAI21X1 U55 ( .A(n54), .B(n40), .C(n52), .Y(gg) );
  NAND2X1 U56 ( .A(n42), .B(n41), .Y(n45) );
  NAND2X1 U57 ( .A(n43), .B(n50), .Y(n44) );
  NOR2X1 U58 ( .A(n45), .B(n44), .Y(pg) );
  OAI21X1 U59 ( .A(n48), .B(n47), .C(n46), .Y(n51) );
  AOI21X1 U60 ( .A(n51), .B(n50), .C(n49), .Y(n53) );
  OAI21X1 U61 ( .A(n54), .B(n53), .C(n52), .Y(cout) );
endmodule


module cla_16bit_8 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, cout, n20, n21, n22;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  NOR2X1 U5 ( .A(n22), .B(n21), .Y(pg) );
  NAND2X1 U6 ( .A(p[3]), .B(p[2]), .Y(n21) );
  NAND2X1 U7 ( .A(n2), .B(p[0]), .Y(n22) );
  cla_4bit_35 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(n17), 
        .sum(sum[3:0]) );
  cla_4bit_34 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n18), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_33 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n8), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_32 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n20), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  INVX4 U1 ( .A(n3), .Y(n8) );
  INVX1 U2 ( .A(p[1]), .Y(n1) );
  INVX2 U3 ( .A(n1), .Y(n2) );
  AND2X2 U4 ( .A(n11), .B(n10), .Y(n3) );
  INVX1 U8 ( .A(g[1]), .Y(n10) );
  AOI21X1 U9 ( .A(n8), .B(p[2]), .C(g[2]), .Y(n4) );
  INVX4 U10 ( .A(n4), .Y(n20) );
  INVX1 U11 ( .A(n20), .Y(n16) );
  BUFX2 U12 ( .A(n17), .Y(n7) );
  INVX1 U13 ( .A(n17), .Y(n13) );
  NAND2X1 U14 ( .A(p[0]), .B(cin), .Y(n12) );
  INVX2 U15 ( .A(n12), .Y(n9) );
  OAI21X1 U16 ( .A(n7), .B(n9), .C(p[1]), .Y(n11) );
  NAND2X1 U17 ( .A(n13), .B(n12), .Y(n18) );
  INVX2 U18 ( .A(p[3]), .Y(n15) );
  INVX2 U19 ( .A(g[3]), .Y(n14) );
  OAI21X1 U20 ( .A(n16), .B(n15), .C(n14), .Y(cout) );
endmodule


module adder_1bit_11 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2, n3, n4;

  XNOR2X1 U1 ( .A(carry_in), .B(n4), .Y(sum) );
  INVX2 U2 ( .A(a), .Y(n2) );
  XOR2X1 U3 ( .A(n2), .B(b), .Y(n4) );
  INVX2 U4 ( .A(carry_in), .Y(n3) );
  INVX2 U5 ( .A(b), .Y(n1) );
  OAI22X1 U6 ( .A(n4), .B(n3), .C(n2), .D(n1), .Y(carry_out) );
endmodule


module cla_4bit_31 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33;

  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n33) );
  INVX1 U1 ( .A(n2), .Y(n1) );
  INVX1 U2 ( .A(n21), .Y(n2) );
  AND2X2 U4 ( .A(n21), .B(n20), .Y(n3) );
  INVX1 U5 ( .A(n3), .Y(n27) );
  AND2X2 U6 ( .A(b[2]), .B(a[2]), .Y(n4) );
  INVX1 U7 ( .A(n4), .Y(n23) );
  AND2X1 U8 ( .A(a[1]), .B(b[1]), .Y(n6) );
  XNOR2X1 U9 ( .A(n5), .B(n32), .Y(sum[3]) );
  XNOR2X1 U10 ( .A(n1), .B(b[3]), .Y(n5) );
  OR2X2 U11 ( .A(b[2]), .B(a[2]), .Y(n28) );
  OR2X2 U12 ( .A(b[1]), .B(a[1]), .Y(n26) );
  XOR2X1 U13 ( .A(b[0]), .B(a[0]), .Y(n7) );
  XOR2X1 U14 ( .A(cin), .B(n7), .Y(sum[0]) );
  NAND2X1 U15 ( .A(n33), .B(cin), .Y(n12) );
  NAND2X1 U16 ( .A(b[0]), .B(a[0]), .Y(n10) );
  NAND2X1 U17 ( .A(n12), .B(n10), .Y(n9) );
  INVX2 U18 ( .A(n26), .Y(n13) );
  NOR2X1 U19 ( .A(n13), .B(n6), .Y(n8) );
  XOR2X1 U20 ( .A(n9), .B(n8), .Y(sum[1]) );
  NAND2X1 U21 ( .A(n28), .B(n23), .Y(n15) );
  INVX2 U22 ( .A(n10), .Y(n11) );
  OAI21X1 U23 ( .A(n6), .B(n11), .C(n26), .Y(n22) );
  OAI21X1 U24 ( .A(n13), .B(n12), .C(n22), .Y(n14) );
  INVX2 U25 ( .A(n14), .Y(n17) );
  XOR2X1 U26 ( .A(n15), .B(n17), .Y(sum[2]) );
  INVX2 U27 ( .A(a[3]), .Y(n21) );
  INVX2 U28 ( .A(n28), .Y(n16) );
  OAI21X1 U29 ( .A(n17), .B(n16), .C(n23), .Y(n19) );
  INVX2 U30 ( .A(n19), .Y(n32) );
  INVX2 U31 ( .A(b[3]), .Y(n20) );
  INVX2 U32 ( .A(n22), .Y(n24) );
  AOI21X1 U33 ( .A(n24), .B(n28), .C(n4), .Y(n25) );
  NAND2X1 U34 ( .A(n2), .B(b[3]), .Y(n31) );
  OAI21X1 U35 ( .A(n3), .B(n25), .C(n31), .Y(gg) );
  NAND2X1 U36 ( .A(n27), .B(n26), .Y(n30) );
  NAND2X1 U37 ( .A(n33), .B(n28), .Y(n29) );
  NOR2X1 U38 ( .A(n30), .B(n29), .Y(pg) );
  OAI21X1 U39 ( .A(n32), .B(n3), .C(n31), .Y(cout) );
endmodule


module cla_4bit_30 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57;

  INVX2 U1 ( .A(n7), .Y(n1) );
  INVX2 U2 ( .A(n6), .Y(n7) );
  BUFX2 U3 ( .A(n52), .Y(n2) );
  INVX1 U4 ( .A(n30), .Y(n34) );
  AND2X1 U5 ( .A(n52), .B(n30), .Y(n29) );
  AND2X2 U6 ( .A(b[3]), .B(a[3]), .Y(n3) );
  INVX1 U7 ( .A(n3), .Y(n57) );
  MUX2X1 U8 ( .B(n31), .A(n52), .S(n27), .Y(n32) );
  NAND3X1 U9 ( .A(cin), .B(n23), .C(n49), .Y(n28) );
  INVX1 U10 ( .A(n53), .Y(n4) );
  NAND2X1 U11 ( .A(n42), .B(n13), .Y(n5) );
  INVX2 U12 ( .A(a[3]), .Y(n13) );
  XNOR2X1 U13 ( .A(n43), .B(n42), .Y(n6) );
  INVX2 U14 ( .A(a[2]), .Y(n9) );
  AND2X1 U15 ( .A(a[2]), .B(b[2]), .Y(n45) );
  NAND2X1 U16 ( .A(n8), .B(n9), .Y(n10) );
  NAND2X1 U17 ( .A(n10), .B(n44), .Y(n47) );
  INVX1 U18 ( .A(b[2]), .Y(n8) );
  XNOR2X1 U19 ( .A(n43), .B(n42), .Y(n27) );
  BUFX2 U20 ( .A(cin), .Y(n11) );
  INVX1 U21 ( .A(n13), .Y(n12) );
  INVX2 U22 ( .A(a[3]), .Y(n43) );
  NAND2X1 U23 ( .A(n40), .B(n14), .Y(n15) );
  NAND2X1 U24 ( .A(n15), .B(n49), .Y(n50) );
  INVX1 U25 ( .A(b[0]), .Y(n14) );
  BUFX2 U26 ( .A(a[1]), .Y(n16) );
  AND2X1 U27 ( .A(a[0]), .B(b[0]), .Y(n17) );
  OR2X2 U28 ( .A(b[1]), .B(a[1]), .Y(n49) );
  XNOR2X1 U29 ( .A(n11), .B(n18), .Y(sum[0]) );
  XNOR2X1 U30 ( .A(a[0]), .B(b[0]), .Y(n18) );
  AND2X2 U31 ( .A(cin), .B(n23), .Y(n19) );
  NAND2X1 U32 ( .A(a[1]), .B(b[1]), .Y(n38) );
  NAND2X1 U33 ( .A(n38), .B(n49), .Y(n21) );
  INVX2 U34 ( .A(a[0]), .Y(n40) );
  NAND2X1 U35 ( .A(n14), .B(n40), .Y(n23) );
  NOR2X1 U36 ( .A(n17), .B(n19), .Y(n20) );
  XOR2X1 U37 ( .A(n20), .B(n21), .Y(sum[1]) );
  NAND2X1 U38 ( .A(n8), .B(n9), .Y(n31) );
  NAND2X1 U39 ( .A(b[2]), .B(a[2]), .Y(n52) );
  NAND2X1 U40 ( .A(n31), .B(n52), .Y(n25) );
  INVX2 U41 ( .A(n38), .Y(n22) );
  OAI21X1 U42 ( .A(n17), .B(n22), .C(n49), .Y(n30) );
  NAND3X1 U43 ( .A(n23), .B(n49), .C(cin), .Y(n24) );
  AND2X2 U44 ( .A(n30), .B(n24), .Y(n54) );
  XOR2X1 U45 ( .A(n25), .B(n54), .Y(sum[2]) );
  INVX2 U46 ( .A(n28), .Y(n26) );
  NAND3X1 U47 ( .A(n4), .B(n26), .C(n1), .Y(n37) );
  NAND3X1 U48 ( .A(n29), .B(n7), .C(n28), .Y(n36) );
  AND2X2 U49 ( .A(n6), .B(n31), .Y(n33) );
  INVX2 U50 ( .A(n31), .Y(n53) );
  AOI21X1 U51 ( .A(n34), .B(n33), .C(n32), .Y(n35) );
  NAND3X1 U52 ( .A(n37), .B(n36), .C(n35), .Y(sum[3]) );
  OAI21X1 U53 ( .A(b[1]), .B(n16), .C(b[0]), .Y(n39) );
  OAI21X1 U54 ( .A(n40), .B(n39), .C(n38), .Y(n41) );
  INVX2 U55 ( .A(n41), .Y(n48) );
  INVX2 U56 ( .A(b[3]), .Y(n42) );
  NAND2X1 U57 ( .A(n42), .B(n13), .Y(n44) );
  AOI21X1 U58 ( .A(n5), .B(n45), .C(n3), .Y(n46) );
  OAI21X1 U59 ( .A(n47), .B(n48), .C(n46), .Y(gg) );
  OAI22X1 U60 ( .A(a[3]), .B(b[3]), .C(a[2]), .D(b[2]), .Y(n51) );
  NOR2X1 U61 ( .A(n50), .B(n51), .Y(pg) );
  OAI21X1 U62 ( .A(n54), .B(n53), .C(n2), .Y(n55) );
  OAI21X1 U63 ( .A(b[3]), .B(n12), .C(n55), .Y(n56) );
  NAND2X1 U64 ( .A(n57), .B(n56), .Y(cout) );
endmodule


module cla_4bit_29 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74;

  INVX1 U1 ( .A(a[2]), .Y(n1) );
  BUFX4 U2 ( .A(n68), .Y(n23) );
  INVX2 U3 ( .A(a[0]), .Y(n65) );
  INVX2 U4 ( .A(b[1]), .Y(n16) );
  AOI21X1 U5 ( .A(n23), .B(n34), .C(n33), .Y(sum[1]) );
  INVX1 U6 ( .A(a[3]), .Y(n15) );
  INVX2 U7 ( .A(a[3]), .Y(n61) );
  NOR2X1 U8 ( .A(n53), .B(n52), .Y(n2) );
  INVX2 U9 ( .A(n2), .Y(n42) );
  INVX1 U10 ( .A(n53), .Y(n3) );
  INVX1 U11 ( .A(n3), .Y(n4) );
  XOR2X1 U12 ( .A(n39), .B(n14), .Y(sum[2]) );
  INVX1 U13 ( .A(n40), .Y(n5) );
  NOR2X1 U14 ( .A(n12), .B(n6), .Y(n48) );
  NAND2X1 U15 ( .A(n42), .B(n5), .Y(n6) );
  INVX1 U16 ( .A(n12), .Y(n67) );
  BUFX2 U17 ( .A(n70), .Y(n7) );
  INVX1 U18 ( .A(n42), .Y(n8) );
  INVX4 U19 ( .A(n70), .Y(n18) );
  BUFX2 U20 ( .A(a[0]), .Y(n9) );
  OR2X1 U21 ( .A(n46), .B(n21), .Y(n17) );
  BUFX2 U22 ( .A(n8), .Y(n10) );
  INVX1 U23 ( .A(n27), .Y(n11) );
  AND2X2 U24 ( .A(n38), .B(n37), .Y(n12) );
  AND2X2 U25 ( .A(n53), .B(n52), .Y(n13) );
  INVX4 U26 ( .A(n13), .Y(n70) );
  NOR2X1 U27 ( .A(n8), .B(n18), .Y(n14) );
  NAND2X1 U28 ( .A(n22), .B(n66), .Y(n58) );
  NAND2X1 U29 ( .A(n17), .B(n45), .Y(n47) );
  AND2X2 U30 ( .A(n35), .B(n37), .Y(n19) );
  INVX2 U31 ( .A(n19), .Y(n69) );
  BUFX2 U32 ( .A(cin), .Y(n20) );
  BUFX2 U33 ( .A(n61), .Y(n21) );
  NAND2X1 U34 ( .A(n27), .B(n16), .Y(n22) );
  NAND2X1 U35 ( .A(n22), .B(n62), .Y(n63) );
  AND2X2 U36 ( .A(n1), .B(n52), .Y(n24) );
  XNOR2X1 U37 ( .A(n20), .B(n25), .Y(sum[0]) );
  XNOR2X1 U38 ( .A(b[0]), .B(n9), .Y(n25) );
  AND2X2 U39 ( .A(b[0]), .B(a[0]), .Y(n26) );
  INVX1 U40 ( .A(n66), .Y(n74) );
  NAND2X1 U41 ( .A(a[1]), .B(b[1]), .Y(n36) );
  INVX2 U42 ( .A(a[1]), .Y(n27) );
  NAND2X1 U43 ( .A(n16), .B(n27), .Y(n37) );
  NAND2X1 U44 ( .A(n36), .B(n37), .Y(n30) );
  INVX2 U45 ( .A(n30), .Y(n28) );
  NOR2X1 U46 ( .A(n28), .B(n26), .Y(n34) );
  INVX2 U47 ( .A(cin), .Y(n68) );
  INVX2 U48 ( .A(b[0]), .Y(n64) );
  NAND2X1 U49 ( .A(n65), .B(n64), .Y(n35) );
  NAND2X1 U50 ( .A(n28), .B(n35), .Y(n32) );
  INVX2 U51 ( .A(n35), .Y(n29) );
  OAI22X1 U52 ( .A(n26), .B(n30), .C(n29), .D(n28), .Y(n31) );
  OAI21X1 U53 ( .A(n68), .B(n32), .C(n31), .Y(n33) );
  OAI21X1 U54 ( .A(n65), .B(n64), .C(n36), .Y(n38) );
  OAI21X1 U55 ( .A(n68), .B(n69), .C(n67), .Y(n39) );
  INVX2 U56 ( .A(a[2]), .Y(n53) );
  INVX2 U57 ( .A(b[2]), .Y(n52) );
  NAND2X1 U58 ( .A(cin), .B(n19), .Y(n51) );
  XOR2X1 U59 ( .A(n15), .B(b[3]), .Y(n40) );
  NAND2X1 U60 ( .A(n40), .B(n7), .Y(n50) );
  INVX2 U61 ( .A(b[3]), .Y(n60) );
  AOI22X1 U62 ( .A(n2), .B(b[3]), .C(n18), .D(n60), .Y(n46) );
  NAND2X1 U63 ( .A(a[3]), .B(b[3]), .Y(n72) );
  NAND3X1 U64 ( .A(n70), .B(n15), .C(n60), .Y(n41) );
  OAI21X1 U65 ( .A(n18), .B(n72), .C(n41), .Y(n44) );
  OAI22X1 U66 ( .A(n60), .B(n70), .C(b[3]), .D(n42), .Y(n43) );
  AOI22X1 U67 ( .A(n44), .B(n12), .C(n43), .D(n21), .Y(n45) );
  AOI21X1 U68 ( .A(n51), .B(n48), .C(n47), .Y(n49) );
  OAI21X1 U69 ( .A(n51), .B(n50), .C(n49), .Y(sum[3]) );
  NOR2X1 U70 ( .A(n24), .B(n16), .Y(n55) );
  AOI21X1 U71 ( .A(n4), .B(n52), .C(n64), .Y(n54) );
  AOI22X1 U72 ( .A(n55), .B(n11), .C(n54), .D(a[0]), .Y(n59) );
  NAND2X1 U73 ( .A(n61), .B(n60), .Y(n66) );
  INVX2 U74 ( .A(n72), .Y(n56) );
  AOI21X1 U75 ( .A(n66), .B(n2), .C(n56), .Y(n57) );
  OAI21X1 U76 ( .A(n59), .B(n58), .C(n57), .Y(gg) );
  AOI21X1 U77 ( .A(n61), .B(n60), .C(n24), .Y(n62) );
  AOI21X1 U78 ( .A(n65), .B(n64), .C(n63), .Y(pg) );
  OAI21X1 U79 ( .A(n69), .B(n23), .C(n67), .Y(n71) );
  AOI21X1 U80 ( .A(n71), .B(n7), .C(n10), .Y(n73) );
  OAI21X1 U81 ( .A(n74), .B(n73), .C(n72), .Y(cout) );
endmodule


module cla_4bit_28 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72;

  INVX1 U1 ( .A(cin), .Y(n1) );
  INVX2 U2 ( .A(cin), .Y(n13) );
  AND2X2 U3 ( .A(n35), .B(n23), .Y(n2) );
  AND2X1 U4 ( .A(n60), .B(n35), .Y(n3) );
  AND2X1 U5 ( .A(n15), .B(n14), .Y(n4) );
  OR2X2 U6 ( .A(b[2]), .B(a[2]), .Y(n5) );
  OR2X1 U7 ( .A(b[2]), .B(a[2]), .Y(n65) );
  INVX2 U8 ( .A(n29), .Y(n8) );
  INVX1 U9 ( .A(n54), .Y(n6) );
  INVX4 U10 ( .A(a[3]), .Y(n54) );
  BUFX2 U11 ( .A(n68), .Y(n7) );
  NAND2X1 U12 ( .A(n21), .B(n20), .Y(n9) );
  BUFX2 U13 ( .A(n67), .Y(n10) );
  NAND2X1 U14 ( .A(n1), .B(n4), .Y(n16) );
  INVX1 U15 ( .A(a[1]), .Y(n22) );
  AND2X2 U16 ( .A(n3), .B(cin), .Y(n67) );
  XNOR2X1 U17 ( .A(cin), .B(n11), .Y(sum[0]) );
  XNOR2X1 U18 ( .A(b[0]), .B(a[0]), .Y(n11) );
  NAND2X1 U19 ( .A(b[0]), .B(a[0]), .Y(n14) );
  INVX2 U20 ( .A(n14), .Y(n51) );
  NAND2X1 U21 ( .A(a[1]), .B(b[1]), .Y(n50) );
  INVX2 U22 ( .A(b[1]), .Y(n21) );
  INVX2 U23 ( .A(a[1]), .Y(n20) );
  NAND2X1 U24 ( .A(n21), .B(n20), .Y(n60) );
  NAND2X1 U25 ( .A(n50), .B(n60), .Y(n15) );
  INVX2 U26 ( .A(a[0]), .Y(n27) );
  INVX2 U27 ( .A(b[0]), .Y(n26) );
  NAND2X1 U28 ( .A(n27), .B(n26), .Y(n35) );
  INVX2 U29 ( .A(n35), .Y(n62) );
  INVX2 U30 ( .A(n15), .Y(n12) );
  OAI22X1 U31 ( .A(n51), .B(n15), .C(n62), .D(n12), .Y(n18) );
  NAND3X1 U32 ( .A(cin), .B(n35), .C(n12), .Y(n17) );
  NAND3X1 U33 ( .A(n18), .B(n17), .C(n16), .Y(n19) );
  INVX2 U34 ( .A(n19), .Y(sum[1]) );
  NAND2X1 U35 ( .A(a[2]), .B(b[2]), .Y(n68) );
  NAND2X1 U36 ( .A(n65), .B(n68), .Y(n29) );
  OAI21X1 U37 ( .A(n21), .B(n20), .C(n26), .Y(n24) );
  NAND2X1 U38 ( .A(n21), .B(n22), .Y(n23) );
  NAND3X1 U39 ( .A(n24), .B(n23), .C(n36), .Y(n25) );
  XOR2X1 U40 ( .A(n8), .B(n25), .Y(n34) );
  NAND2X1 U41 ( .A(n2), .B(n29), .Y(n33) );
  NAND2X1 U42 ( .A(n50), .B(n26), .Y(n37) );
  NAND2X1 U43 ( .A(n50), .B(n27), .Y(n36) );
  NAND2X1 U44 ( .A(n37), .B(n36), .Y(n28) );
  NAND3X1 U45 ( .A(n29), .B(n28), .C(n13), .Y(n31) );
  NAND3X1 U46 ( .A(n8), .B(cin), .C(n2), .Y(n30) );
  NAND2X1 U47 ( .A(n30), .B(n31), .Y(n32) );
  AOI21X1 U48 ( .A(n34), .B(n33), .C(n32), .Y(sum[2]) );
  XOR2X1 U49 ( .A(n54), .B(b[3]), .Y(n39) );
  INVX2 U50 ( .A(n39), .Y(n38) );
  NAND3X1 U51 ( .A(n37), .B(n9), .C(n36), .Y(n64) );
  NAND3X1 U52 ( .A(n38), .B(n7), .C(n64), .Y(n49) );
  NAND2X1 U53 ( .A(n39), .B(n5), .Y(n45) );
  INVX2 U54 ( .A(n45), .Y(n47) );
  INVX2 U55 ( .A(b[3]), .Y(n53) );
  NOR2X1 U56 ( .A(n53), .B(n5), .Y(n43) );
  OAI21X1 U57 ( .A(b[3]), .B(n7), .C(n54), .Y(n42) );
  INVX2 U58 ( .A(n68), .Y(n56) );
  AOI21X1 U59 ( .A(n56), .B(b[3]), .C(n54), .Y(n40) );
  OAI21X1 U60 ( .A(b[3]), .B(n5), .C(n40), .Y(n41) );
  OAI21X1 U61 ( .A(n43), .B(n42), .C(n41), .Y(n44) );
  OAI21X1 U62 ( .A(n45), .B(n64), .C(n44), .Y(n46) );
  AOI21X1 U63 ( .A(n67), .B(n47), .C(n46), .Y(n48) );
  OAI21X1 U64 ( .A(n67), .B(n49), .C(n48), .Y(sum[3]) );
  INVX2 U65 ( .A(n50), .Y(n52) );
  NOR2X1 U66 ( .A(n52), .B(n51), .Y(n59) );
  NAND2X1 U67 ( .A(n54), .B(n53), .Y(n63) );
  NAND3X1 U68 ( .A(n5), .B(n63), .C(n23), .Y(n58) );
  NAND2X1 U69 ( .A(b[3]), .B(n6), .Y(n70) );
  INVX2 U70 ( .A(n70), .Y(n55) );
  AOI21X1 U71 ( .A(n56), .B(n63), .C(n55), .Y(n57) );
  OAI21X1 U72 ( .A(n59), .B(n58), .C(n57), .Y(gg) );
  NAND3X1 U73 ( .A(n9), .B(n5), .C(n63), .Y(n61) );
  NOR2X1 U74 ( .A(n62), .B(n61), .Y(pg) );
  INVX2 U75 ( .A(n63), .Y(n72) );
  INVX2 U76 ( .A(n64), .Y(n66) );
  OAI21X1 U77 ( .A(n10), .B(n66), .C(n5), .Y(n69) );
  AND2X2 U78 ( .A(n69), .B(n7), .Y(n71) );
  OAI21X1 U79 ( .A(n72), .B(n71), .C(n70), .Y(cout) );
endmodule


module cla_16bit_7 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         cout, n19, n20, n21, n22, n23;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  NOR2X1 U5 ( .A(n23), .B(n22), .Y(pg) );
  NAND2X1 U6 ( .A(p[3]), .B(n7), .Y(n22) );
  NAND2X1 U7 ( .A(n2), .B(p[0]), .Y(n23) );
  cla_4bit_31 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_30 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n21), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_29 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n20), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_28 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n19), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  OAI21X1 U1 ( .A(n10), .B(n9), .C(n8), .Y(n1) );
  INVX1 U2 ( .A(n13), .Y(n2) );
  INVX1 U3 ( .A(n19), .Y(n3) );
  INVX1 U4 ( .A(p[1]), .Y(n4) );
  INVX1 U8 ( .A(p[1]), .Y(n13) );
  INVX2 U9 ( .A(n1), .Y(n14) );
  INVX4 U10 ( .A(n17), .Y(n19) );
  BUFX2 U11 ( .A(p[2]), .Y(n7) );
  INVX2 U12 ( .A(cin), .Y(n10) );
  INVX2 U13 ( .A(p[0]), .Y(n9) );
  INVX2 U14 ( .A(g[0]), .Y(n8) );
  OAI21X1 U15 ( .A(n10), .B(n9), .C(n8), .Y(n21) );
  INVX2 U16 ( .A(g[1]), .Y(n12) );
  OAI21X1 U17 ( .A(n14), .B(n13), .C(n12), .Y(n11) );
  AOI21X1 U18 ( .A(n11), .B(p[2]), .C(g[2]), .Y(n17) );
  OAI21X1 U19 ( .A(n14), .B(n4), .C(n12), .Y(n20) );
  INVX2 U20 ( .A(p[3]), .Y(n16) );
  INVX2 U21 ( .A(g[3]), .Y(n15) );
  OAI21X1 U22 ( .A(n3), .B(n16), .C(n15), .Y(cout) );
endmodule


module adder_1bit_10 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2, n3, n4;

  XNOR2X1 U1 ( .A(carry_in), .B(n4), .Y(sum) );
  INVX2 U2 ( .A(a), .Y(n3) );
  INVX2 U3 ( .A(b), .Y(n2) );
  XOR2X1 U4 ( .A(n3), .B(b), .Y(n4) );
  INVX2 U5 ( .A(carry_in), .Y(n1) );
  OAI22X1 U6 ( .A(n3), .B(n2), .C(n4), .D(n1), .Y(carry_out) );
endmodule


module adder_1bit_9 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2, n3, n4;

  XNOR2X1 U1 ( .A(carry_in), .B(n4), .Y(sum) );
  INVX2 U2 ( .A(a), .Y(n2) );
  XOR2X1 U3 ( .A(n2), .B(b), .Y(n4) );
  INVX2 U4 ( .A(carry_in), .Y(n3) );
  INVX2 U5 ( .A(b), .Y(n1) );
  OAI22X1 U6 ( .A(n4), .B(n3), .C(n2), .D(n1), .Y(carry_out) );
endmodule


module cla_4bit_27 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n17, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35;

  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n33) );
  NOR2X1 U20 ( .A(n35), .B(n34), .Y(pg) );
  NAND2X1 U22 ( .A(n32), .B(n31), .Y(n35) );
  XNOR2X1 U1 ( .A(n4), .B(n1), .Y(sum[1]) );
  OR2X2 U2 ( .A(n8), .B(n2), .Y(n1) );
  OR2X2 U4 ( .A(a[2]), .B(b[2]), .Y(n31) );
  OR2X2 U5 ( .A(a[1]), .B(b[1]), .Y(n32) );
  AND2X2 U6 ( .A(b[1]), .B(a[1]), .Y(n2) );
  XOR2X1 U7 ( .A(b[0]), .B(a[0]), .Y(n3) );
  XOR2X1 U8 ( .A(cin), .B(n3), .Y(sum[0]) );
  NAND2X1 U9 ( .A(cin), .B(n33), .Y(n7) );
  NAND2X1 U10 ( .A(b[0]), .B(a[0]), .Y(n5) );
  NAND2X1 U11 ( .A(n7), .B(n5), .Y(n4) );
  INVX2 U12 ( .A(n32), .Y(n8) );
  NAND2X1 U13 ( .A(b[2]), .B(a[2]), .Y(n23) );
  NAND2X1 U14 ( .A(n31), .B(n23), .Y(n10) );
  INVX2 U15 ( .A(n5), .Y(n6) );
  OAI21X1 U16 ( .A(n2), .B(n6), .C(n32), .Y(n22) );
  OAI21X1 U17 ( .A(n8), .B(n7), .C(n22), .Y(n9) );
  INVX2 U18 ( .A(n9), .Y(n11) );
  XOR2X1 U19 ( .A(n10), .B(n11), .Y(sum[2]) );
  INVX2 U21 ( .A(a[3]), .Y(n21) );
  XOR2X1 U23 ( .A(n21), .B(b[3]), .Y(n14) );
  INVX2 U24 ( .A(n31), .Y(n12) );
  OAI21X1 U25 ( .A(n12), .B(n11), .C(n23), .Y(n13) );
  INVX2 U26 ( .A(n13), .Y(n28) );
  XOR2X1 U27 ( .A(n14), .B(n28), .Y(sum[3]) );
  INVX2 U28 ( .A(b[3]), .Y(n17) );
  NAND2X1 U29 ( .A(n21), .B(n17), .Y(n30) );
  INVX2 U30 ( .A(n30), .Y(n29) );
  INVX2 U31 ( .A(n22), .Y(n25) );
  INVX2 U32 ( .A(n23), .Y(n24) );
  AOI21X1 U33 ( .A(n25), .B(n31), .C(n24), .Y(n26) );
  NAND2X1 U34 ( .A(b[3]), .B(a[3]), .Y(n27) );
  OAI21X1 U35 ( .A(n29), .B(n26), .C(n27), .Y(gg) );
  OAI21X1 U36 ( .A(n29), .B(n28), .C(n27), .Y(cout) );
  NAND2X1 U37 ( .A(n33), .B(n30), .Y(n34) );
endmodule


module cla_4bit_26 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47;

  BUFX2 U1 ( .A(n43), .Y(n1) );
  AND2X2 U2 ( .A(b[0]), .B(n3), .Y(n2) );
  BUFX4 U3 ( .A(a[0]), .Y(n3) );
  NAND2X1 U4 ( .A(n12), .B(n11), .Y(n4) );
  OAI21X1 U5 ( .A(n8), .B(n16), .C(n4), .Y(n5) );
  INVX1 U6 ( .A(n7), .Y(n6) );
  INVX1 U7 ( .A(n31), .Y(n7) );
  XNOR2X1 U8 ( .A(n43), .B(n17), .Y(sum[2]) );
  OR2X2 U9 ( .A(b[0]), .B(a[0]), .Y(n37) );
  AND2X2 U10 ( .A(b[0]), .B(n3), .Y(n8) );
  AND2X2 U11 ( .A(cin), .B(n37), .Y(n9) );
  XNOR2X1 U12 ( .A(cin), .B(n10), .Y(sum[0]) );
  XNOR2X1 U13 ( .A(b[0]), .B(n3), .Y(n10) );
  INVX1 U14 ( .A(n41), .Y(n47) );
  NAND2X1 U15 ( .A(b[1]), .B(a[1]), .Y(n15) );
  INVX2 U16 ( .A(b[1]), .Y(n12) );
  INVX2 U17 ( .A(a[1]), .Y(n11) );
  NAND2X1 U18 ( .A(n12), .B(n11), .Y(n36) );
  NAND2X1 U19 ( .A(n15), .B(n4), .Y(n14) );
  NOR2X1 U20 ( .A(n8), .B(n9), .Y(n13) );
  XOR2X1 U21 ( .A(n14), .B(n13), .Y(sum[1]) );
  INVX2 U22 ( .A(a[2]), .Y(n22) );
  INVX2 U23 ( .A(b[2]), .Y(n21) );
  NAND2X1 U24 ( .A(n22), .B(n21), .Y(n44) );
  NAND2X1 U25 ( .A(b[2]), .B(a[2]), .Y(n23) );
  NAND2X1 U26 ( .A(n44), .B(n23), .Y(n17) );
  NAND2X1 U27 ( .A(n9), .B(n4), .Y(n20) );
  INVX2 U28 ( .A(n15), .Y(n16) );
  OAI21X1 U29 ( .A(n2), .B(n16), .C(n36), .Y(n34) );
  NAND2X1 U30 ( .A(n20), .B(n34), .Y(n43) );
  INVX2 U31 ( .A(a[3]), .Y(n31) );
  XOR2X1 U32 ( .A(n6), .B(b[3]), .Y(n29) );
  INVX2 U33 ( .A(n23), .Y(n42) );
  INVX2 U34 ( .A(n20), .Y(n18) );
  NOR2X1 U35 ( .A(n42), .B(n18), .Y(n19) );
  AOI21X1 U36 ( .A(n5), .B(n19), .C(n24), .Y(n28) );
  NOR2X1 U37 ( .A(n24), .B(n20), .Y(n26) );
  NAND2X1 U38 ( .A(n22), .B(n21), .Y(n38) );
  INVX2 U39 ( .A(n38), .Y(n24) );
  OAI21X1 U40 ( .A(n24), .B(n34), .C(n23), .Y(n25) );
  OAI21X1 U41 ( .A(n26), .B(n25), .C(n29), .Y(n27) );
  OAI21X1 U42 ( .A(n28), .B(n29), .C(n27), .Y(sum[3]) );
  INVX2 U43 ( .A(b[3]), .Y(n30) );
  NAND2X1 U44 ( .A(n30), .B(n31), .Y(n41) );
  NAND2X1 U45 ( .A(n41), .B(n38), .Y(n35) );
  NAND2X1 U46 ( .A(a[3]), .B(b[3]), .Y(n45) );
  INVX2 U47 ( .A(n45), .Y(n32) );
  AOI21X1 U48 ( .A(n41), .B(n42), .C(n32), .Y(n33) );
  OAI21X1 U49 ( .A(n35), .B(n5), .C(n33), .Y(gg) );
  NAND2X1 U50 ( .A(n37), .B(n36), .Y(n40) );
  OAI21X1 U51 ( .A(n7), .B(b[3]), .C(n38), .Y(n39) );
  NOR2X1 U52 ( .A(n40), .B(n39), .Y(pg) );
  AOI21X1 U53 ( .A(n44), .B(n1), .C(n42), .Y(n46) );
  OAI21X1 U54 ( .A(n47), .B(n46), .C(n45), .Y(cout) );
endmodule


module cla_4bit_25 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63;

  AND2X1 U1 ( .A(n39), .B(n60), .Y(n1) );
  INVX2 U2 ( .A(n39), .Y(n8) );
  XOR2X1 U3 ( .A(b[0]), .B(a[0]), .Y(n2) );
  INVX1 U4 ( .A(n21), .Y(n3) );
  XNOR2X1 U5 ( .A(n4), .B(n2), .Y(sum[0]) );
  INVX1 U6 ( .A(cin), .Y(n4) );
  BUFX2 U7 ( .A(a[3]), .Y(n5) );
  NAND2X1 U8 ( .A(n47), .B(n6), .Y(n56) );
  INVX1 U9 ( .A(b[3]), .Y(n6) );
  INVX2 U10 ( .A(a[3]), .Y(n47) );
  BUFX2 U11 ( .A(cin), .Y(n7) );
  INVX1 U12 ( .A(a[2]), .Y(n9) );
  INVX1 U13 ( .A(n9), .Y(n10) );
  XOR2X1 U14 ( .A(n47), .B(b[3]), .Y(n39) );
  BUFX2 U15 ( .A(n53), .Y(n11) );
  AND2X2 U16 ( .A(n16), .B(n15), .Y(n12) );
  INVX2 U17 ( .A(n12), .Y(n60) );
  OR2X1 U18 ( .A(n44), .B(n43), .Y(sum[3]) );
  NAND2X1 U19 ( .A(n42), .B(n1), .Y(n40) );
  AND2X1 U20 ( .A(a[2]), .B(b[2]), .Y(n48) );
  OR2X2 U21 ( .A(n29), .B(n28), .Y(n13) );
  NAND2X1 U22 ( .A(n27), .B(n13), .Y(n30) );
  OR2X2 U23 ( .A(b[1]), .B(b[0]), .Y(n14) );
  NAND2X1 U24 ( .A(n14), .B(n30), .Y(n31) );
  INVX1 U25 ( .A(b[0]), .Y(n29) );
  INVX1 U26 ( .A(b[1]), .Y(n28) );
  INVX1 U27 ( .A(n56), .Y(n63) );
  NAND2X1 U28 ( .A(n15), .B(n9), .Y(n17) );
  NAND2X1 U29 ( .A(n56), .B(n17), .Y(n51) );
  INVX1 U30 ( .A(b[2]), .Y(n15) );
  INVX1 U31 ( .A(a[2]), .Y(n16) );
  AND2X2 U32 ( .A(n37), .B(n38), .Y(n18) );
  INVX1 U33 ( .A(n18), .Y(n59) );
  AND2X1 U34 ( .A(n61), .B(n49), .Y(n50) );
  INVX2 U35 ( .A(a[1]), .Y(n27) );
  NAND2X1 U36 ( .A(n28), .B(n27), .Y(n53) );
  NAND2X1 U37 ( .A(b[1]), .B(a[1]), .Y(n33) );
  NAND2X1 U38 ( .A(n53), .B(n33), .Y(n20) );
  NAND2X1 U39 ( .A(a[0]), .B(b[0]), .Y(n19) );
  NAND2X1 U40 ( .A(n20), .B(n19), .Y(n23) );
  INVX2 U41 ( .A(a[0]), .Y(n32) );
  NAND2X1 U42 ( .A(n32), .B(n29), .Y(n26) );
  OAI22X1 U43 ( .A(n23), .B(n26), .C(n3), .D(n19), .Y(n25) );
  INVX2 U44 ( .A(n20), .Y(n21) );
  NAND3X1 U45 ( .A(n21), .B(n26), .C(cin), .Y(n22) );
  OAI21X1 U46 ( .A(n23), .B(n7), .C(n22), .Y(n24) );
  NOR2X1 U47 ( .A(n25), .B(n24), .Y(sum[1]) );
  NAND2X1 U48 ( .A(b[2]), .B(n10), .Y(n57) );
  NAND2X1 U49 ( .A(n60), .B(n57), .Y(n34) );
  NAND3X1 U50 ( .A(n26), .B(n11), .C(cin), .Y(n37) );
  INVX2 U51 ( .A(n31), .Y(n46) );
  NAND2X1 U52 ( .A(n33), .B(n32), .Y(n45) );
  NAND2X1 U53 ( .A(n46), .B(n45), .Y(n38) );
  XOR2X1 U54 ( .A(n34), .B(n18), .Y(sum[2]) );
  NOR2X1 U55 ( .A(n12), .B(n38), .Y(n35) );
  AOI22X1 U56 ( .A(n39), .B(n35), .C(n12), .D(n8), .Y(n36) );
  OAI21X1 U57 ( .A(n8), .B(n57), .C(n36), .Y(n44) );
  INVX2 U58 ( .A(n37), .Y(n42) );
  NAND3X1 U59 ( .A(n38), .B(n57), .C(n8), .Y(n41) );
  OAI21X1 U60 ( .A(n41), .B(n42), .C(n40), .Y(n43) );
  NAND2X1 U61 ( .A(n46), .B(n45), .Y(n52) );
  OAI21X1 U62 ( .A(a[3]), .B(b[3]), .C(n48), .Y(n49) );
  NAND2X1 U63 ( .A(a[3]), .B(b[3]), .Y(n61) );
  OAI21X1 U64 ( .A(n51), .B(n52), .C(n50), .Y(gg) );
  OAI22X1 U65 ( .A(b[0]), .B(a[0]), .C(a[2]), .D(b[2]), .Y(n55) );
  OAI21X1 U66 ( .A(n5), .B(b[3]), .C(n53), .Y(n54) );
  NOR2X1 U67 ( .A(n55), .B(n54), .Y(pg) );
  INVX2 U68 ( .A(n57), .Y(n58) );
  AOI21X1 U69 ( .A(n60), .B(n59), .C(n58), .Y(n62) );
  OAI21X1 U70 ( .A(n63), .B(n62), .C(n61), .Y(cout) );
endmodule


module cla_4bit_24 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69;

  INVX2 U1 ( .A(n51), .Y(n53) );
  AND2X2 U2 ( .A(n18), .B(n24), .Y(n1) );
  INVX2 U3 ( .A(n65), .Y(n2) );
  INVX2 U4 ( .A(n65), .Y(n34) );
  BUFX2 U5 ( .A(n67), .Y(n3) );
  NAND2X1 U6 ( .A(n16), .B(n15), .Y(n4) );
  AND2X2 U7 ( .A(n50), .B(n5), .Y(n59) );
  INVX1 U8 ( .A(a[3]), .Y(n5) );
  INVX2 U9 ( .A(cin), .Y(n7) );
  BUFX2 U10 ( .A(n2), .Y(n6) );
  INVX2 U11 ( .A(cin), .Y(n12) );
  OR2X1 U12 ( .A(n12), .B(n63), .Y(n41) );
  INVX2 U13 ( .A(n7), .Y(n13) );
  NAND2X1 U14 ( .A(n12), .B(n1), .Y(n19) );
  OR2X2 U15 ( .A(n40), .B(n60), .Y(n8) );
  NAND2X1 U16 ( .A(n8), .B(n36), .Y(n37) );
  INVX1 U17 ( .A(n14), .Y(n35) );
  INVX1 U18 ( .A(n6), .Y(n9) );
  INVX2 U19 ( .A(a[1]), .Y(n15) );
  INVX1 U20 ( .A(n13), .Y(n62) );
  OR2X2 U21 ( .A(a[2]), .B(b[2]), .Y(n65) );
  XNOR2X1 U22 ( .A(n13), .B(n10), .Y(sum[0]) );
  XNOR2X1 U23 ( .A(b[0]), .B(a[0]), .Y(n10) );
  XNOR2X1 U24 ( .A(n35), .B(b[3]), .Y(n11) );
  INVX1 U25 ( .A(n60), .Y(n69) );
  BUFX4 U26 ( .A(a[3]), .Y(n14) );
  NAND2X1 U27 ( .A(a[1]), .B(b[1]), .Y(n46) );
  INVX2 U28 ( .A(b[1]), .Y(n16) );
  NAND2X1 U29 ( .A(n16), .B(n15), .Y(n56) );
  NAND2X1 U30 ( .A(n46), .B(n4), .Y(n18) );
  INVX2 U31 ( .A(a[0]), .Y(n48) );
  INVX2 U32 ( .A(b[0]), .Y(n47) );
  NAND2X1 U33 ( .A(n48), .B(n47), .Y(n23) );
  INVX2 U34 ( .A(n18), .Y(n17) );
  NAND2X1 U35 ( .A(b[0]), .B(a[0]), .Y(n24) );
  AOI22X1 U36 ( .A(n18), .B(n23), .C(n17), .D(n24), .Y(n22) );
  NAND2X1 U37 ( .A(n17), .B(n23), .Y(n20) );
  OAI21X1 U38 ( .A(n7), .B(n20), .C(n19), .Y(n21) );
  NOR2X1 U39 ( .A(n22), .B(n21), .Y(sum[1]) );
  NAND2X1 U40 ( .A(n23), .B(n4), .Y(n63) );
  INVX2 U41 ( .A(n46), .Y(n26) );
  INVX2 U42 ( .A(n24), .Y(n25) );
  OAI21X1 U43 ( .A(n26), .B(n25), .C(n56), .Y(n61) );
  OAI21X1 U44 ( .A(n12), .B(n63), .C(n61), .Y(n28) );
  NAND2X1 U45 ( .A(a[2]), .B(b[2]), .Y(n40) );
  INVX2 U46 ( .A(n40), .Y(n64) );
  NOR2X1 U47 ( .A(n2), .B(n64), .Y(n27) );
  XOR2X1 U48 ( .A(n28), .B(n27), .Y(sum[2]) );
  NOR2X1 U49 ( .A(n7), .B(n63), .Y(n30) );
  NOR2X1 U50 ( .A(n11), .B(n6), .Y(n29) );
  NAND2X1 U51 ( .A(n30), .B(n29), .Y(n45) );
  INVX2 U52 ( .A(b[3]), .Y(n50) );
  NAND2X1 U53 ( .A(n5), .B(n50), .Y(n60) );
  NAND2X1 U54 ( .A(b[3]), .B(n14), .Y(n67) );
  OAI22X1 U55 ( .A(n34), .B(n60), .C(n2), .D(n67), .Y(n32) );
  INVX2 U56 ( .A(n61), .Y(n31) );
  AND2X2 U57 ( .A(n32), .B(n31), .Y(n39) );
  NAND3X1 U58 ( .A(n14), .B(n50), .C(n34), .Y(n33) );
  OAI21X1 U59 ( .A(n67), .B(n40), .C(n33), .Y(n38) );
  NAND3X1 U60 ( .A(n35), .B(n2), .C(b[3]), .Y(n36) );
  NOR3X1 U61 ( .A(n38), .B(n37), .C(n39), .Y(n44) );
  AND2X2 U62 ( .A(n40), .B(n61), .Y(n42) );
  NAND3X1 U63 ( .A(n42), .B(n11), .C(n41), .Y(n43) );
  NAND3X1 U64 ( .A(n45), .B(n43), .C(n44), .Y(sum[3]) );
  OAI21X1 U65 ( .A(n48), .B(n47), .C(n46), .Y(n49) );
  OAI21X1 U66 ( .A(b[3]), .B(n14), .C(n49), .Y(n55) );
  NAND2X1 U67 ( .A(a[2]), .B(b[2]), .Y(n51) );
  NAND2X1 U68 ( .A(n50), .B(n51), .Y(n52) );
  AOI22X1 U69 ( .A(b[3]), .B(n53), .C(n14), .D(n52), .Y(n54) );
  OAI21X1 U70 ( .A(n55), .B(n57), .C(n54), .Y(gg) );
  NOR2X1 U71 ( .A(b[0]), .B(a[0]), .Y(n58) );
  OAI21X1 U72 ( .A(a[2]), .B(b[2]), .C(n56), .Y(n57) );
  NOR3X1 U73 ( .A(n58), .B(n59), .C(n57), .Y(pg) );
  OAI21X1 U74 ( .A(n63), .B(n62), .C(n61), .Y(n66) );
  AOI21X1 U75 ( .A(n66), .B(n9), .C(n64), .Y(n68) );
  OAI21X1 U76 ( .A(n69), .B(n68), .C(n3), .Y(cout) );
endmodule


module cla_16bit_6 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, cout, n20, n21, n22;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  NOR2X1 U5 ( .A(n22), .B(n21), .Y(pg) );
  NAND2X1 U6 ( .A(n2), .B(n1), .Y(n21) );
  NAND2X1 U7 ( .A(n3), .B(p[0]), .Y(n22) );
  cla_4bit_27 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_26 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n20), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_25 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n16), .pg(p[2]), .gg(n17), 
        .sum(sum[11:8]) );
  cla_4bit_24 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n18), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  OAI21X1 U1 ( .A(n13), .B(n4), .C(n12), .Y(n14) );
  INVX1 U2 ( .A(n13), .Y(n1) );
  BUFX2 U3 ( .A(p[3]), .Y(n2) );
  BUFX2 U4 ( .A(p[1]), .Y(n3) );
  AND2X2 U8 ( .A(n11), .B(n10), .Y(n4) );
  INVX2 U9 ( .A(cin), .Y(n9) );
  INVX2 U10 ( .A(p[0]), .Y(n8) );
  INVX2 U11 ( .A(g[0]), .Y(n7) );
  OAI21X1 U12 ( .A(n9), .B(n8), .C(n7), .Y(n20) );
  NAND2X1 U13 ( .A(n20), .B(p[1]), .Y(n10) );
  INVX2 U14 ( .A(g[1]), .Y(n11) );
  INVX2 U15 ( .A(p[2]), .Y(n13) );
  INVX2 U16 ( .A(n17), .Y(n12) );
  OAI21X1 U17 ( .A(n4), .B(n13), .C(n12), .Y(n18) );
  NAND2X1 U18 ( .A(n10), .B(n11), .Y(n16) );
  AOI21X1 U19 ( .A(n14), .B(p[3]), .C(g[3]), .Y(n15) );
  INVX2 U20 ( .A(n15), .Y(cout) );
endmodule


module adder_1bit_8 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2, n3, n4, n5, n6;

  BUFX2 U1 ( .A(carry_in), .Y(n1) );
  XNOR2X1 U2 ( .A(n1), .B(n2), .Y(sum) );
  XNOR2X1 U3 ( .A(b), .B(a), .Y(n2) );
  INVX2 U4 ( .A(a), .Y(n6) );
  INVX2 U5 ( .A(b), .Y(n5) );
  INVX2 U6 ( .A(carry_in), .Y(n4) );
  NAND2X1 U7 ( .A(a), .B(b), .Y(n3) );
  AOI22X1 U8 ( .A(n6), .B(n5), .C(n4), .D(n3), .Y(carry_out) );
endmodule


module adder_1bit_7 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2, n3, n4, n5, n6;

  INVX2 U1 ( .A(carry_in), .Y(n4) );
  XOR2X1 U2 ( .A(n2), .B(n1), .Y(sum) );
  XOR2X1 U3 ( .A(b), .B(a), .Y(n1) );
  INVX2 U4 ( .A(n4), .Y(n2) );
  INVX2 U5 ( .A(a), .Y(n6) );
  INVX2 U6 ( .A(b), .Y(n5) );
  NAND2X1 U7 ( .A(a), .B(b), .Y(n3) );
  AOI22X1 U8 ( .A(n6), .B(n5), .C(n4), .D(n3), .Y(carry_out) );
endmodule


module adder_1bit_6 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2, n3, n4;

  INVX1 U1 ( .A(carry_in), .Y(n3) );
  XNOR2X1 U2 ( .A(carry_in), .B(n4), .Y(sum) );
  INVX2 U3 ( .A(a), .Y(n2) );
  XOR2X1 U4 ( .A(n2), .B(b), .Y(n4) );
  INVX2 U5 ( .A(b), .Y(n1) );
  OAI22X1 U6 ( .A(n4), .B(n3), .C(n2), .D(n1), .Y(carry_out) );
endmodule


module cla_4bit_23 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n9, n12, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n34) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n36), .B(n35), .Y(sum[1]) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n36) );
  OR2X2 U2 ( .A(a[2]), .B(b[2]), .Y(n25) );
  OR2X2 U3 ( .A(a[3]), .B(b[3]), .Y(n23) );
  XNOR2X1 U4 ( .A(a[0]), .B(n1), .Y(sum[0]) );
  XNOR2X1 U5 ( .A(cin), .B(b[0]), .Y(n1) );
  INVX2 U6 ( .A(a[1]), .Y(n6) );
  INVX2 U7 ( .A(b[1]), .Y(n5) );
  NAND2X1 U8 ( .A(n6), .B(n5), .Y(n24) );
  INVX2 U9 ( .A(n24), .Y(n12) );
  INVX2 U10 ( .A(b[0]), .Y(n3) );
  INVX2 U11 ( .A(a[0]), .Y(n2) );
  NAND2X1 U13 ( .A(n3), .B(n2), .Y(n22) );
  NAND2X1 U16 ( .A(cin), .B(n22), .Y(n32) );
  INVX2 U18 ( .A(n34), .Y(n4) );
  OAI21X1 U19 ( .A(n6), .B(n5), .C(n4), .Y(n9) );
  NAND2X1 U20 ( .A(n24), .B(n9), .Y(n17) );
  OAI21X1 U21 ( .A(n12), .B(n32), .C(n17), .Y(n14) );
  INVX2 U22 ( .A(n14), .Y(n16) );
  XOR2X1 U23 ( .A(n37), .B(n16), .Y(sum[2]) );
  INVX2 U24 ( .A(n25), .Y(n15) );
  NAND2X1 U25 ( .A(b[2]), .B(a[2]), .Y(n18) );
  OAI21X1 U26 ( .A(n16), .B(n15), .C(n18), .Y(n28) );
  XOR2X1 U27 ( .A(n28), .B(n38), .Y(sum[3]) );
  INVX2 U28 ( .A(n23), .Y(n30) );
  INVX2 U29 ( .A(n17), .Y(n20) );
  INVX2 U30 ( .A(n18), .Y(n19) );
  AOI21X1 U31 ( .A(n20), .B(n25), .C(n19), .Y(n21) );
  NAND2X1 U32 ( .A(b[3]), .B(a[3]), .Y(n29) );
  OAI21X1 U33 ( .A(n30), .B(n21), .C(n29), .Y(gg) );
  NAND2X1 U34 ( .A(n23), .B(n22), .Y(n27) );
  NAND2X1 U35 ( .A(n25), .B(n24), .Y(n26) );
  NOR2X1 U36 ( .A(n27), .B(n26), .Y(pg) );
  INVX2 U37 ( .A(n28), .Y(n31) );
  OAI21X1 U38 ( .A(n31), .B(n30), .C(n29), .Y(cout) );
  INVX2 U39 ( .A(n32), .Y(n33) );
  NOR2X1 U40 ( .A(n34), .B(n33), .Y(n35) );
endmodule


module cla_4bit_22 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35;

  INVX1 U1 ( .A(n29), .Y(n16) );
  INVX1 U2 ( .A(n2), .Y(n1) );
  BUFX2 U3 ( .A(n21), .Y(n2) );
  INVX1 U4 ( .A(n30), .Y(n34) );
  OR2X2 U5 ( .A(a[2]), .B(b[2]), .Y(n29) );
  OR2X2 U6 ( .A(b[1]), .B(a[1]), .Y(n27) );
  XOR2X1 U7 ( .A(b[0]), .B(a[0]), .Y(n3) );
  XOR2X1 U8 ( .A(cin), .B(n3), .Y(sum[0]) );
  INVX2 U9 ( .A(a[0]), .Y(n5) );
  INVX2 U10 ( .A(b[0]), .Y(n4) );
  NAND2X1 U11 ( .A(n5), .B(n4), .Y(n28) );
  NAND2X1 U12 ( .A(cin), .B(n28), .Y(n12) );
  NAND2X1 U13 ( .A(b[0]), .B(a[0]), .Y(n8) );
  NAND2X1 U14 ( .A(n12), .B(n8), .Y(n7) );
  NAND2X1 U15 ( .A(a[1]), .B(b[1]), .Y(n9) );
  NAND2X1 U16 ( .A(n9), .B(n27), .Y(n6) );
  XNOR2X1 U17 ( .A(n7), .B(n6), .Y(sum[1]) );
  NAND2X1 U18 ( .A(b[2]), .B(a[2]), .Y(n23) );
  NAND2X1 U19 ( .A(n29), .B(n23), .Y(n15) );
  INVX2 U20 ( .A(n27), .Y(n13) );
  INVX2 U21 ( .A(n8), .Y(n11) );
  INVX2 U22 ( .A(n9), .Y(n10) );
  OAI21X1 U23 ( .A(n11), .B(n10), .C(n27), .Y(n22) );
  OAI21X1 U24 ( .A(n13), .B(n12), .C(n22), .Y(n14) );
  INVX2 U25 ( .A(n14), .Y(n17) );
  XOR2X1 U26 ( .A(n15), .B(n17), .Y(sum[2]) );
  INVX2 U27 ( .A(a[3]), .Y(n21) );
  XOR2X1 U28 ( .A(n2), .B(b[3]), .Y(n19) );
  OAI21X1 U29 ( .A(n17), .B(n16), .C(n23), .Y(n18) );
  INVX2 U30 ( .A(n18), .Y(n35) );
  XOR2X1 U31 ( .A(n19), .B(n35), .Y(sum[3]) );
  INVX2 U32 ( .A(b[3]), .Y(n20) );
  NAND2X1 U33 ( .A(n21), .B(n20), .Y(n30) );
  INVX2 U34 ( .A(n22), .Y(n25) );
  INVX2 U35 ( .A(n23), .Y(n24) );
  AOI21X1 U36 ( .A(n25), .B(n29), .C(n24), .Y(n26) );
  NAND2X1 U37 ( .A(b[3]), .B(n1), .Y(n33) );
  OAI21X1 U38 ( .A(n34), .B(n26), .C(n33), .Y(gg) );
  NAND2X1 U39 ( .A(n28), .B(n27), .Y(n32) );
  NAND2X1 U40 ( .A(n30), .B(n29), .Y(n31) );
  NOR2X1 U41 ( .A(n32), .B(n31), .Y(pg) );
  OAI21X1 U42 ( .A(n35), .B(n34), .C(n33), .Y(cout) );
endmodule


module cla_4bit_21 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38;

  BUFX2 U1 ( .A(n2), .Y(n1) );
  INVX2 U2 ( .A(n30), .Y(n3) );
  AOI21X1 U3 ( .A(n23), .B(n32), .C(n3), .Y(n2) );
  XNOR2X1 U4 ( .A(n4), .B(n10), .Y(sum[0]) );
  INVX1 U5 ( .A(cin), .Y(n4) );
  NAND2X1 U6 ( .A(n12), .B(n11), .Y(n5) );
  NAND2X1 U7 ( .A(n14), .B(n13), .Y(n6) );
  INVX1 U8 ( .A(n13), .Y(n7) );
  INVX1 U9 ( .A(n28), .Y(n8) );
  INVX1 U10 ( .A(a[3]), .Y(n28) );
  AND2X1 U11 ( .A(n28), .B(n27), .Y(n9) );
  OR2X2 U12 ( .A(a[2]), .B(b[2]), .Y(n32) );
  XOR2X1 U13 ( .A(b[0]), .B(a[0]), .Y(n10) );
  INVX2 U14 ( .A(a[0]), .Y(n12) );
  INVX2 U15 ( .A(b[0]), .Y(n11) );
  NAND2X1 U16 ( .A(n5), .B(cin), .Y(n21) );
  NAND2X1 U17 ( .A(b[0]), .B(a[0]), .Y(n17) );
  NAND2X1 U18 ( .A(n21), .B(n17), .Y(n16) );
  NAND2X1 U19 ( .A(n7), .B(b[1]), .Y(n18) );
  INVX2 U20 ( .A(b[1]), .Y(n14) );
  INVX2 U21 ( .A(a[1]), .Y(n13) );
  NAND2X1 U22 ( .A(n14), .B(n13), .Y(n35) );
  NAND2X1 U23 ( .A(n18), .B(n6), .Y(n15) );
  XNOR2X1 U24 ( .A(n16), .B(n15), .Y(sum[1]) );
  NAND2X1 U25 ( .A(b[2]), .B(a[2]), .Y(n30) );
  NAND2X1 U26 ( .A(n32), .B(n30), .Y(n24) );
  INVX2 U27 ( .A(n6), .Y(n22) );
  INVX2 U28 ( .A(n17), .Y(n20) );
  INVX2 U29 ( .A(n18), .Y(n19) );
  OAI21X1 U30 ( .A(n20), .B(n19), .C(n6), .Y(n29) );
  OAI21X1 U31 ( .A(n22), .B(n21), .C(n29), .Y(n23) );
  INVX2 U32 ( .A(n23), .Y(n25) );
  XOR2X1 U33 ( .A(n25), .B(n24), .Y(sum[2]) );
  XOR2X1 U34 ( .A(n28), .B(b[3]), .Y(n26) );
  XOR2X1 U35 ( .A(n2), .B(n26), .Y(sum[3]) );
  INVX2 U36 ( .A(b[3]), .Y(n27) );
  INVX2 U37 ( .A(n29), .Y(n33) );
  INVX2 U38 ( .A(n30), .Y(n31) );
  AOI21X1 U39 ( .A(n33), .B(n32), .C(n31), .Y(n34) );
  NAND2X1 U40 ( .A(b[3]), .B(n8), .Y(n38) );
  OAI21X1 U41 ( .A(n9), .B(n34), .C(n38), .Y(gg) );
  NAND2X1 U42 ( .A(n5), .B(n35), .Y(n37) );
  OAI22X1 U43 ( .A(b[3]), .B(a[3]), .C(b[2]), .D(a[2]), .Y(n36) );
  NOR2X1 U44 ( .A(n37), .B(n36), .Y(pg) );
  OAI21X1 U45 ( .A(n1), .B(n9), .C(n38), .Y(cout) );
endmodule


module cla_4bit_20 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45;

  INVX2 U1 ( .A(n26), .Y(n5) );
  AND2X2 U2 ( .A(n35), .B(n36), .Y(n1) );
  XNOR2X1 U3 ( .A(n2), .B(n12), .Y(sum[0]) );
  INVX1 U4 ( .A(cin), .Y(n2) );
  XNOR2X1 U5 ( .A(n42), .B(n24), .Y(sum[2]) );
  BUFX2 U6 ( .A(n42), .Y(n3) );
  INVX2 U7 ( .A(n7), .Y(n4) );
  INVX2 U8 ( .A(a[3]), .Y(n34) );
  BUFX2 U9 ( .A(a[1]), .Y(n6) );
  INVX1 U10 ( .A(n34), .Y(n7) );
  NAND2X1 U11 ( .A(n8), .B(n9), .Y(n10) );
  NAND2X1 U12 ( .A(n10), .B(cin), .Y(n17) );
  INVX2 U13 ( .A(b[0]), .Y(n8) );
  INVX1 U14 ( .A(a[0]), .Y(n9) );
  BUFX2 U15 ( .A(a[0]), .Y(n11) );
  OR2X1 U16 ( .A(n25), .B(n15), .Y(n27) );
  INVX1 U17 ( .A(n25), .Y(n29) );
  OR2X2 U18 ( .A(b[1]), .B(a[1]), .Y(n22) );
  XOR2X1 U19 ( .A(n11), .B(b[0]), .Y(n12) );
  AND2X1 U20 ( .A(n4), .B(n33), .Y(n13) );
  INVX2 U21 ( .A(n22), .Y(n16) );
  XNOR2X1 U22 ( .A(n5), .B(n43), .Y(n32) );
  OR2X2 U23 ( .A(a[2]), .B(b[2]), .Y(n43) );
  AND2X2 U24 ( .A(b[0]), .B(n11), .Y(n14) );
  NAND2X1 U25 ( .A(n5), .B(n43), .Y(n15) );
  OR2X2 U26 ( .A(n17), .B(n16), .Y(n25) );
  INVX1 U27 ( .A(n17), .Y(n20) );
  NAND2X1 U28 ( .A(n6), .B(b[1]), .Y(n21) );
  NAND2X1 U29 ( .A(n21), .B(n22), .Y(n19) );
  NOR2X1 U30 ( .A(n14), .B(n20), .Y(n18) );
  XOR2X1 U31 ( .A(n18), .B(n19), .Y(sum[1]) );
  NAND2X1 U32 ( .A(b[2]), .B(a[2]), .Y(n36) );
  NAND2X1 U33 ( .A(n43), .B(n36), .Y(n24) );
  INVX2 U34 ( .A(n21), .Y(n23) );
  OAI21X1 U35 ( .A(n14), .B(n23), .C(n22), .Y(n35) );
  NAND2X1 U36 ( .A(n25), .B(n35), .Y(n42) );
  XOR2X1 U37 ( .A(n34), .B(b[3]), .Y(n26) );
  NAND2X1 U38 ( .A(n1), .B(n5), .Y(n31) );
  NAND2X1 U39 ( .A(n1), .B(n26), .Y(n28) );
  OAI21X1 U40 ( .A(n29), .B(n28), .C(n27), .Y(n30) );
  AOI21X1 U41 ( .A(n32), .B(n31), .C(n30), .Y(sum[3]) );
  INVX2 U42 ( .A(b[3]), .Y(n33) );
  INVX2 U43 ( .A(n35), .Y(n37) );
  INVX2 U44 ( .A(n36), .Y(n41) );
  AOI21X1 U45 ( .A(n37), .B(n43), .C(n41), .Y(n38) );
  NAND2X1 U46 ( .A(b[3]), .B(n7), .Y(n44) );
  OAI21X1 U47 ( .A(n13), .B(n38), .C(n44), .Y(gg) );
  OAI22X1 U48 ( .A(b[0]), .B(a[0]), .C(b[1]), .D(a[1]), .Y(n40) );
  OAI22X1 U49 ( .A(a[3]), .B(b[3]), .C(b[2]), .D(a[2]), .Y(n39) );
  NOR2X1 U50 ( .A(n40), .B(n39), .Y(pg) );
  AOI21X1 U51 ( .A(n43), .B(n3), .C(n41), .Y(n45) );
  OAI21X1 U52 ( .A(n13), .B(n45), .C(n44), .Y(cout) );
endmodule


module cla_16bit_5 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         cout, n19, n20, n21, n22;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  NOR2X1 U5 ( .A(n22), .B(n21), .Y(pg) );
  NAND2X1 U6 ( .A(p[3]), .B(n4), .Y(n21) );
  NAND2X1 U7 ( .A(n2), .B(p[0]), .Y(n22) );
  cla_4bit_23 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_22 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n20), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_21 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n1), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_20 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n17), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  OAI21X1 U1 ( .A(n12), .B(n11), .C(n10), .Y(n1) );
  INVX2 U2 ( .A(p[1]), .Y(n11) );
  INVX1 U3 ( .A(n11), .Y(n2) );
  INVX1 U4 ( .A(n14), .Y(n15) );
  NAND2X1 U8 ( .A(n3), .B(n16), .Y(cout) );
  INVX1 U9 ( .A(g[3]), .Y(n3) );
  BUFX2 U10 ( .A(p[2]), .Y(n4) );
  INVX2 U11 ( .A(cin), .Y(n9) );
  INVX2 U12 ( .A(p[0]), .Y(n8) );
  INVX2 U13 ( .A(g[0]), .Y(n7) );
  OAI21X1 U14 ( .A(n9), .B(n8), .C(n7), .Y(n20) );
  INVX2 U15 ( .A(n20), .Y(n12) );
  INVX2 U16 ( .A(g[1]), .Y(n10) );
  OAI21X1 U17 ( .A(n12), .B(n11), .C(n10), .Y(n19) );
  INVX2 U18 ( .A(g[2]), .Y(n13) );
  NAND2X1 U19 ( .A(n19), .B(p[2]), .Y(n14) );
  NAND2X1 U20 ( .A(n14), .B(n13), .Y(n17) );
  OAI21X1 U21 ( .A(g[2]), .B(n15), .C(p[3]), .Y(n16) );
endmodule


module cla_4bit_113 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45;

  NAND2X1 U26 ( .A(n44), .B(n43), .Y(n45) );
  XOR2X1 U1 ( .A(n14), .B(n1), .Y(sum[1]) );
  NOR2X1 U2 ( .A(n6), .B(n12), .Y(n1) );
  INVX1 U3 ( .A(cin), .Y(n2) );
  INVX1 U4 ( .A(cin), .Y(n19) );
  BUFX2 U5 ( .A(a[1]), .Y(n3) );
  XNOR2X1 U6 ( .A(b[3]), .B(a[3]), .Y(n4) );
  BUFX2 U7 ( .A(n9), .Y(n5) );
  NOR2X1 U8 ( .A(a[1]), .B(b[1]), .Y(n6) );
  BUFX2 U9 ( .A(a[0]), .Y(n7) );
  INVX1 U10 ( .A(n33), .Y(n34) );
  NAND2X1 U11 ( .A(n38), .B(n30), .Y(n10) );
  INVX1 U12 ( .A(n38), .Y(n27) );
  INVX1 U13 ( .A(n30), .Y(n35) );
  INVX1 U14 ( .A(a[3]), .Y(n43) );
  BUFX2 U15 ( .A(a[2]), .Y(n8) );
  BUFX2 U16 ( .A(cin), .Y(n9) );
  XNOR2X1 U17 ( .A(n20), .B(n10), .Y(sum[2]) );
  XNOR2X1 U18 ( .A(n26), .B(n4), .Y(sum[3]) );
  AND2X1 U19 ( .A(n3), .B(b[1]), .Y(n12) );
  OR2X2 U20 ( .A(a[2]), .B(b[2]), .Y(n30) );
  OR2X2 U21 ( .A(a[0]), .B(b[0]), .Y(n21) );
  OR2X2 U22 ( .A(a[1]), .B(b[1]), .Y(n16) );
  XNOR2X1 U23 ( .A(n9), .B(n11), .Y(sum[0]) );
  XNOR2X1 U24 ( .A(b[0]), .B(n7), .Y(n11) );
  INVX2 U25 ( .A(n21), .Y(n13) );
  NAND2X1 U27 ( .A(b[0]), .B(n7), .Y(n15) );
  OAI21X1 U28 ( .A(n13), .B(n19), .C(n15), .Y(n14) );
  NAND2X1 U29 ( .A(n21), .B(n16), .Y(n32) );
  INVX2 U30 ( .A(n15), .Y(n18) );
  OAI21X1 U31 ( .A(n18), .B(n12), .C(n16), .Y(n22) );
  OAI21X1 U32 ( .A(n32), .B(n2), .C(n22), .Y(n20) );
  NAND2X1 U33 ( .A(b[2]), .B(n8), .Y(n38) );
  INVX2 U34 ( .A(n22), .Y(n37) );
  NOR2X1 U35 ( .A(n37), .B(cin), .Y(n25) );
  OAI21X1 U36 ( .A(a[1]), .B(b[1]), .C(n21), .Y(n23) );
  NAND2X1 U37 ( .A(n23), .B(n22), .Y(n33) );
  OAI21X1 U38 ( .A(b[2]), .B(n8), .C(n33), .Y(n24) );
  OAI21X1 U39 ( .A(n25), .B(n24), .C(n38), .Y(n26) );
  AOI21X1 U40 ( .A(n37), .B(n30), .C(n27), .Y(n29) );
  INVX2 U41 ( .A(n43), .Y(n28) );
  NAND2X1 U42 ( .A(n28), .B(b[3]), .Y(n40) );
  OAI21X1 U43 ( .A(n42), .B(n29), .C(n40), .Y(gg) );
  NAND2X1 U44 ( .A(n45), .B(n30), .Y(n31) );
  NOR2X1 U45 ( .A(n32), .B(n31), .Y(pg) );
  NOR2X1 U46 ( .A(n35), .B(n34), .Y(n36) );
  OAI21X1 U47 ( .A(n5), .B(n37), .C(n36), .Y(n39) );
  AND2X2 U48 ( .A(n39), .B(n38), .Y(n41) );
  OAI21X1 U49 ( .A(n42), .B(n41), .C(n40), .Y(cout) );
  INVX2 U50 ( .A(n45), .Y(n42) );
  INVX2 U51 ( .A(b[3]), .Y(n44) );
endmodule


module mult16by4_1 ( a, b, product );
  input [15:0] a;
  input [3:0] b;
  output [19:0] product;
  wire   \sums[2][18] , \sums[2][17] , \sums[2][16] , \sums[2][15] ,
         \sums[2][14] , \sums[2][13] , \sums[2][12] , \sums[2][11] ,
         \sums[2][10] , \sums[2][9] , \sums[2][8] , \sums[2][7] , \sums[2][6] ,
         \sums[2][5] , \sums[2][4] , \sums[2][3] , \sums[2][2] , \sums[2][1] ,
         \sums[2][0] , \sums[1][18] , \sums[1][17] , \sums[1][16] ,
         \sums[1][15] , \sums[1][14] , \sums[1][13] , \sums[1][12] ,
         \sums[1][11] , \sums[1][10] , \sums[1][9] , \sums[1][8] ,
         \sums[1][7] , \sums[1][6] , \sums[1][5] , \sums[1][4] , \sums[1][3] ,
         \sums[1][2] , \sums[1][1] , \sums[1][0] , \sums[0][17] ,
         \sums[0][16] , \sums[0][15] , \sums[0][14] , \sums[0][13] ,
         \sums[0][12] , \sums[0][11] , \sums[0][10] , \sums[0][9] ,
         \sums[0][8] , \sums[0][7] , \sums[0][6] , \sums[0][5] , \sums[0][4] ,
         \sums[0][3] , \sums[0][2] , \sums[0][1] , \sums[0][0] , n1, n2, n3,
         n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n42, n43, n44, n45, n46, n47,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n62, n63, n64, n65,
         n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n79, n80,
         n81, n82, n83, n84, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126;
  wire   [15:0] in_opp_sign;
  wire   [15:0] ab0;
  wire   [15:1] ab1;
  wire   [17:2] ab2;
  wire   [18:3] ab3;
  wire   [7:0] couts;
  wire   [19:0] out_neg;

  NAND2X1 U56 ( .A(out_neg[3]), .B(n25), .Y(n126) );
  NAND2X1 U58 ( .A(out_neg[2]), .B(n24), .Y(n125) );
  NAND2X1 U60 ( .A(out_neg[1]), .B(n25), .Y(n124) );
  NAND2X1 U82 ( .A(out_neg[0]), .B(a[15]), .Y(n123) );
  NAND2X1 U174 ( .A(in_opp_sign[15]), .B(a[15]), .Y(n122) );
  cla_16bit_9 AOPS1 ( .a({n26, n107, n108, n109, n110, n111, n112, n113, n114, 
        n115, n116, n117, n118, n119, n120, n121}), .b({1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .cin(1'b1), .sum(in_opp_sign) );
  cla_16bit_8 A1 ( .a({1'b0, ab0[14:0]}), .b({ab1, 1'b0}), .cin(1'b0), .cout(
        couts[0]), .sum({\sums[0][15] , \sums[0][14] , \sums[0][13] , 
        \sums[0][12] , \sums[0][11] , \sums[0][10] , \sums[0][9] , 
        \sums[0][8] , \sums[0][7] , \sums[0][6] , \sums[0][5] , \sums[0][4] , 
        \sums[0][3] , \sums[0][2] , \sums[0][1] , \sums[0][0] }) );
  adder_1bit_11 A1_1 ( .a(1'b0), .b(n86), .carry_in(couts[0]), .sum(
        \sums[0][16] ), .carry_out(\sums[0][17] ) );
  cla_16bit_7 A2 ( .a({\sums[0][15] , \sums[0][14] , \sums[0][13] , 
        \sums[0][12] , \sums[0][11] , \sums[0][10] , \sums[0][9] , 
        \sums[0][8] , \sums[0][7] , \sums[0][6] , \sums[0][5] , \sums[0][4] , 
        \sums[0][3] , \sums[0][2] , \sums[0][1] , \sums[0][0] }), .b({
        ab2[15:2], 1'b0, 1'b0}), .cin(1'b0), .cout(couts[1]), .sum({
        \sums[1][15] , \sums[1][14] , \sums[1][13] , \sums[1][12] , 
        \sums[1][11] , \sums[1][10] , \sums[1][9] , \sums[1][8] , \sums[1][7] , 
        \sums[1][6] , \sums[1][5] , \sums[1][4] , \sums[1][3] , \sums[1][2] , 
        \sums[1][1] , \sums[1][0] }) );
  adder_1bit_10 A2_1 ( .a(\sums[0][16] ), .b(n86), .carry_in(couts[1]), .sum(
        \sums[1][16] ), .carry_out(couts[2]) );
  adder_1bit_9 A2_2 ( .a(\sums[0][17] ), .b(1'b0), .carry_in(couts[2]), .sum(
        \sums[1][17] ), .carry_out(\sums[1][18] ) );
  cla_16bit_6 A3 ( .a({\sums[1][15] , \sums[1][14] , \sums[1][13] , 
        \sums[1][12] , \sums[1][11] , \sums[1][10] , \sums[1][9] , 
        \sums[1][8] , \sums[1][7] , \sums[1][6] , \sums[1][5] , \sums[1][4] , 
        \sums[1][3] , \sums[1][2] , \sums[1][1] , \sums[1][0] }), .b({
        ab3[15:3], 1'b0, 1'b0, 1'b0}), .cin(1'b0), .cout(couts[3]), .sum({
        \sums[2][15] , \sums[2][14] , \sums[2][13] , \sums[2][12] , 
        \sums[2][11] , \sums[2][10] , \sums[2][9] , \sums[2][8] , \sums[2][7] , 
        \sums[2][6] , \sums[2][5] , \sums[2][4] , \sums[2][3] , \sums[2][2] , 
        \sums[2][1] , \sums[2][0] }) );
  adder_1bit_8 A3_1 ( .a(\sums[1][16] ), .b(ab3[16]), .carry_in(couts[3]), 
        .sum(\sums[2][16] ), .carry_out(couts[4]) );
  adder_1bit_7 A3_2 ( .a(\sums[1][17] ), .b(ab3[17]), .carry_in(couts[4]), 
        .sum(\sums[2][17] ), .carry_out(couts[5]) );
  adder_1bit_6 A3_3 ( .a(\sums[1][18] ), .b(1'b0), .carry_in(couts[5]), .sum(
        \sums[2][18] ), .carry_out(couts[6]) );
  cla_16bit_5 A4 ( .a({n87, n88, n89, n90, n95, n96, n97, n98, n99, n100, n101, 
        n102, n103, n104, n105, n106}), .b({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .cin(
        1'b1), .cout(couts[7]), .sum(out_neg[15:0]) );
  cla_4bit_113 A5 ( .a({n94, n93, n92, n91}), .b({1'b0, 1'b0, 1'b0, 1'b0}), 
        .cin(couts[7]), .sum(out_neg[19:16]) );
  INVX1 U3 ( .A(n75), .Y(product[11]) );
  INVX4 U4 ( .A(\sums[2][17] ), .Y(n92) );
  INVX1 U5 ( .A(n17), .Y(n10) );
  AND2X2 U6 ( .A(n1), .B(n10), .Y(ab1[10]) );
  INVX8 U7 ( .A(n60), .Y(n1) );
  INVX1 U8 ( .A(n10), .Y(n9) );
  INVX2 U9 ( .A(couts[6]), .Y(n94) );
  INVX2 U10 ( .A(n51), .Y(n19) );
  INVX2 U11 ( .A(n53), .Y(n22) );
  INVX2 U12 ( .A(n54), .Y(n21) );
  INVX2 U13 ( .A(n13), .Y(n12) );
  INVX1 U14 ( .A(n72), .Y(product[8]) );
  INVX1 U15 ( .A(n73), .Y(product[9]) );
  INVX1 U16 ( .A(n96), .Y(n2) );
  INVX1 U17 ( .A(n97), .Y(n3) );
  INVX1 U18 ( .A(n100), .Y(n4) );
  INVX1 U19 ( .A(n74), .Y(product[10]) );
  INVX1 U20 ( .A(n76), .Y(product[12]) );
  INVX1 U21 ( .A(n99), .Y(n5) );
  INVX1 U22 ( .A(n77), .Y(product[13]) );
  INVX1 U23 ( .A(n81), .Y(product[16]) );
  INVX1 U24 ( .A(n93), .Y(n6) );
  MUX2X1 U25 ( .B(couts[6]), .A(out_neg[19]), .S(a[15]), .Y(n84) );
  INVX1 U26 ( .A(n92), .Y(n7) );
  INVX1 U27 ( .A(n90), .Y(n8) );
  INVX4 U28 ( .A(b[0]), .Y(n11) );
  INVX2 U29 ( .A(b[0]), .Y(n66) );
  INVX1 U30 ( .A(n11), .Y(n13) );
  INVX2 U31 ( .A(b[1]), .Y(n47) );
  INVX1 U32 ( .A(n89), .Y(n14) );
  INVX1 U33 ( .A(n88), .Y(n15) );
  INVX1 U34 ( .A(n91), .Y(n16) );
  INVX4 U35 ( .A(b[1]), .Y(n17) );
  INVX1 U36 ( .A(n98), .Y(n18) );
  AND2X2 U37 ( .A(n19), .B(b[1]), .Y(ab1[1]) );
  INVX4 U38 ( .A(\sums[2][8] ), .Y(n98) );
  INVX4 U39 ( .A(b[2]), .Y(n46) );
  INVX1 U40 ( .A(n95), .Y(n20) );
  INVX1 U41 ( .A(n79), .Y(product[14]) );
  AND2X2 U42 ( .A(n21), .B(b[0]), .Y(ab0[3]) );
  AND2X2 U43 ( .A(n22), .B(b[0]), .Y(ab0[2]) );
  INVX2 U44 ( .A(\sums[2][11] ), .Y(n95) );
  INVX1 U45 ( .A(n87), .Y(n23) );
  INVX2 U46 ( .A(n26), .Y(n25) );
  INVX2 U47 ( .A(n26), .Y(n24) );
  INVX2 U48 ( .A(a[15]), .Y(n26) );
  INVX1 U49 ( .A(n80), .Y(product[15]) );
  INVX1 U50 ( .A(n84), .Y(product[19]) );
  INVX1 U51 ( .A(n83), .Y(product[18]) );
  INVX1 U52 ( .A(n82), .Y(product[17]) );
  INVX4 U53 ( .A(b[3]), .Y(n43) );
  INVX2 U54 ( .A(\sums[2][16] ), .Y(n91) );
  INVX2 U55 ( .A(\sums[2][18] ), .Y(n93) );
  INVX2 U57 ( .A(\sums[2][0] ), .Y(n106) );
  INVX2 U59 ( .A(\sums[2][1] ), .Y(n105) );
  INVX2 U61 ( .A(\sums[2][2] ), .Y(n104) );
  INVX2 U62 ( .A(\sums[2][3] ), .Y(n103) );
  INVX2 U63 ( .A(\sums[2][4] ), .Y(n102) );
  INVX2 U64 ( .A(\sums[2][5] ), .Y(n101) );
  INVX2 U65 ( .A(\sums[2][6] ), .Y(n100) );
  INVX2 U66 ( .A(\sums[2][7] ), .Y(n99) );
  INVX2 U67 ( .A(\sums[2][9] ), .Y(n97) );
  INVX2 U68 ( .A(\sums[2][10] ), .Y(n96) );
  INVX2 U69 ( .A(\sums[2][12] ), .Y(n90) );
  INVX2 U70 ( .A(\sums[2][13] ), .Y(n89) );
  INVX2 U71 ( .A(\sums[2][14] ), .Y(n88) );
  INVX2 U72 ( .A(\sums[2][15] ), .Y(n87) );
  MUX2X1 U73 ( .B(a[14]), .A(in_opp_sign[14]), .S(n25), .Y(n27) );
  NAND2X1 U74 ( .A(n122), .B(n27), .Y(n44) );
  INVX2 U75 ( .A(n44), .Y(n67) );
  NOR2X1 U76 ( .A(n67), .B(n43), .Y(ab3[17]) );
  MUX2X1 U77 ( .B(a[13]), .A(in_opp_sign[13]), .S(a[15]), .Y(n28) );
  AND2X2 U78 ( .A(n122), .B(n28), .Y(n65) );
  NOR2X1 U79 ( .A(n65), .B(n43), .Y(ab3[16]) );
  MUX2X1 U80 ( .B(a[0]), .A(in_opp_sign[0]), .S(a[15]), .Y(n29) );
  AND2X2 U81 ( .A(n122), .B(n29), .Y(n51) );
  NOR2X1 U83 ( .A(n51), .B(n43), .Y(ab3[3]) );
  MUX2X1 U84 ( .B(a[1]), .A(in_opp_sign[1]), .S(a[15]), .Y(n30) );
  AND2X2 U85 ( .A(n122), .B(n30), .Y(n52) );
  NOR2X1 U86 ( .A(n52), .B(n43), .Y(ab3[4]) );
  MUX2X1 U87 ( .B(a[2]), .A(in_opp_sign[2]), .S(a[15]), .Y(n31) );
  AND2X2 U88 ( .A(n122), .B(n31), .Y(n53) );
  NOR2X1 U89 ( .A(n53), .B(n43), .Y(ab3[5]) );
  MUX2X1 U90 ( .B(a[3]), .A(in_opp_sign[3]), .S(n25), .Y(n32) );
  AND2X2 U91 ( .A(n122), .B(n32), .Y(n54) );
  NOR2X1 U92 ( .A(n54), .B(n43), .Y(ab3[6]) );
  MUX2X1 U93 ( .B(a[4]), .A(in_opp_sign[4]), .S(n25), .Y(n33) );
  AND2X2 U94 ( .A(n122), .B(n33), .Y(n55) );
  NOR2X1 U95 ( .A(n55), .B(n43), .Y(ab3[7]) );
  MUX2X1 U96 ( .B(a[5]), .A(in_opp_sign[5]), .S(n25), .Y(n34) );
  AND2X2 U97 ( .A(n122), .B(n34), .Y(n56) );
  NOR2X1 U98 ( .A(n56), .B(n43), .Y(ab3[8]) );
  MUX2X1 U99 ( .B(a[6]), .A(in_opp_sign[6]), .S(n25), .Y(n35) );
  AND2X2 U100 ( .A(n122), .B(n35), .Y(n57) );
  NOR2X1 U101 ( .A(n57), .B(n43), .Y(ab3[9]) );
  MUX2X1 U102 ( .B(a[7]), .A(in_opp_sign[7]), .S(n25), .Y(n36) );
  AND2X2 U103 ( .A(n122), .B(n36), .Y(n58) );
  NOR2X1 U104 ( .A(n58), .B(n43), .Y(ab3[10]) );
  MUX2X1 U105 ( .B(a[8]), .A(in_opp_sign[8]), .S(n25), .Y(n37) );
  AND2X2 U106 ( .A(n122), .B(n37), .Y(n59) );
  NOR2X1 U107 ( .A(n59), .B(n43), .Y(ab3[11]) );
  MUX2X1 U108 ( .B(a[9]), .A(in_opp_sign[9]), .S(n25), .Y(n38) );
  AND2X2 U109 ( .A(n122), .B(n38), .Y(n60) );
  NOR2X1 U110 ( .A(n60), .B(n43), .Y(ab3[12]) );
  MUX2X1 U111 ( .B(a[10]), .A(in_opp_sign[10]), .S(n25), .Y(n39) );
  AND2X2 U112 ( .A(n122), .B(n39), .Y(n62) );
  NOR2X1 U113 ( .A(n62), .B(n43), .Y(ab3[13]) );
  MUX2X1 U114 ( .B(a[11]), .A(in_opp_sign[11]), .S(n25), .Y(n40) );
  AND2X2 U115 ( .A(n122), .B(n40), .Y(n63) );
  NOR2X1 U116 ( .A(n63), .B(n43), .Y(ab3[14]) );
  MUX2X1 U117 ( .B(a[12]), .A(in_opp_sign[12]), .S(n25), .Y(n42) );
  AND2X2 U118 ( .A(n122), .B(n42), .Y(n64) );
  NOR2X1 U119 ( .A(n64), .B(n43), .Y(ab3[15]) );
  NAND2X1 U120 ( .A(b[2]), .B(n44), .Y(n45) );
  INVX2 U121 ( .A(n45), .Y(n86) );
  NOR2X1 U122 ( .A(n51), .B(n46), .Y(ab2[2]) );
  NOR2X1 U123 ( .A(n52), .B(n46), .Y(ab2[3]) );
  NOR2X1 U124 ( .A(n53), .B(n46), .Y(ab2[4]) );
  NOR2X1 U125 ( .A(n54), .B(n46), .Y(ab2[5]) );
  NOR2X1 U126 ( .A(n55), .B(n46), .Y(ab2[6]) );
  NOR2X1 U127 ( .A(n56), .B(n46), .Y(ab2[7]) );
  NOR2X1 U128 ( .A(n57), .B(n46), .Y(ab2[8]) );
  NOR2X1 U129 ( .A(n58), .B(n46), .Y(ab2[9]) );
  NOR2X1 U130 ( .A(n59), .B(n46), .Y(ab2[10]) );
  NOR2X1 U131 ( .A(n60), .B(n46), .Y(ab2[11]) );
  NOR2X1 U132 ( .A(n62), .B(n46), .Y(ab2[12]) );
  NOR2X1 U133 ( .A(n63), .B(n46), .Y(ab2[13]) );
  NOR2X1 U134 ( .A(n64), .B(n46), .Y(ab2[14]) );
  NOR2X1 U135 ( .A(n65), .B(n46), .Y(ab2[15]) );
  NOR2X1 U136 ( .A(n52), .B(n47), .Y(ab1[2]) );
  NOR2X1 U137 ( .A(n47), .B(n53), .Y(ab1[3]) );
  NOR2X1 U138 ( .A(n54), .B(n17), .Y(ab1[4]) );
  NOR2X1 U139 ( .A(n55), .B(n17), .Y(ab1[5]) );
  NOR2X1 U140 ( .A(n56), .B(n17), .Y(ab1[6]) );
  NOR2X1 U141 ( .A(n57), .B(n17), .Y(ab1[7]) );
  NOR2X1 U142 ( .A(n58), .B(n17), .Y(ab1[8]) );
  NOR2X1 U143 ( .A(n59), .B(n17), .Y(ab1[9]) );
  NOR2X1 U144 ( .A(n62), .B(n17), .Y(ab1[11]) );
  NOR2X1 U145 ( .A(n63), .B(n9), .Y(ab1[12]) );
  NOR2X1 U146 ( .A(n64), .B(n17), .Y(ab1[13]) );
  NOR2X1 U147 ( .A(n65), .B(n9), .Y(ab1[14]) );
  NOR2X1 U148 ( .A(n67), .B(n9), .Y(ab1[15]) );
  NOR2X1 U149 ( .A(n51), .B(n12), .Y(ab0[0]) );
  NOR2X1 U150 ( .A(n52), .B(n66), .Y(ab0[1]) );
  NOR2X1 U151 ( .A(n55), .B(n11), .Y(ab0[4]) );
  NOR2X1 U152 ( .A(n56), .B(n66), .Y(ab0[5]) );
  NOR2X1 U153 ( .A(n57), .B(n11), .Y(ab0[6]) );
  NOR2X1 U154 ( .A(n58), .B(n11), .Y(ab0[7]) );
  NOR2X1 U156 ( .A(n59), .B(n11), .Y(ab0[8]) );
  NOR2X1 U157 ( .A(n60), .B(n11), .Y(ab0[9]) );
  NOR2X1 U158 ( .A(n62), .B(n11), .Y(ab0[10]) );
  NOR2X1 U159 ( .A(n63), .B(n11), .Y(ab0[11]) );
  NOR2X1 U160 ( .A(n11), .B(n64), .Y(ab0[12]) );
  NOR2X1 U161 ( .A(n65), .B(n12), .Y(ab0[13]) );
  NOR2X1 U162 ( .A(n67), .B(n12), .Y(ab0[14]) );
  INVX2 U163 ( .A(a[14]), .Y(n107) );
  INVX2 U164 ( .A(a[13]), .Y(n108) );
  INVX2 U165 ( .A(a[12]), .Y(n109) );
  INVX2 U166 ( .A(a[11]), .Y(n110) );
  INVX2 U167 ( .A(a[10]), .Y(n111) );
  INVX2 U168 ( .A(a[9]), .Y(n112) );
  INVX2 U169 ( .A(a[8]), .Y(n113) );
  INVX2 U170 ( .A(a[7]), .Y(n114) );
  INVX2 U171 ( .A(a[6]), .Y(n115) );
  INVX2 U172 ( .A(a[5]), .Y(n116) );
  INVX2 U173 ( .A(a[4]), .Y(n117) );
  INVX2 U175 ( .A(a[3]), .Y(n118) );
  INVX2 U176 ( .A(a[2]), .Y(n119) );
  INVX2 U177 ( .A(a[1]), .Y(n120) );
  INVX2 U178 ( .A(a[0]), .Y(n121) );
  OAI21X1 U179 ( .A(a[15]), .B(n106), .C(n123), .Y(product[0]) );
  OAI21X1 U180 ( .A(a[15]), .B(n105), .C(n124), .Y(product[1]) );
  OAI21X1 U181 ( .A(a[15]), .B(n104), .C(n125), .Y(product[2]) );
  OAI21X1 U182 ( .A(a[15]), .B(n103), .C(n126), .Y(product[3]) );
  MUX2X1 U183 ( .B(\sums[2][4] ), .A(out_neg[4]), .S(n25), .Y(n68) );
  INVX2 U184 ( .A(n68), .Y(product[4]) );
  MUX2X1 U185 ( .B(\sums[2][5] ), .A(out_neg[5]), .S(n25), .Y(n69) );
  INVX2 U186 ( .A(n69), .Y(product[5]) );
  MUX2X1 U187 ( .B(n4), .A(out_neg[6]), .S(n24), .Y(n70) );
  INVX2 U188 ( .A(n70), .Y(product[6]) );
  MUX2X1 U189 ( .B(n5), .A(out_neg[7]), .S(n24), .Y(n71) );
  INVX2 U190 ( .A(n71), .Y(product[7]) );
  MUX2X1 U191 ( .B(n18), .A(out_neg[8]), .S(n24), .Y(n72) );
  MUX2X1 U192 ( .B(n3), .A(out_neg[9]), .S(n24), .Y(n73) );
  MUX2X1 U193 ( .B(n2), .A(out_neg[10]), .S(n24), .Y(n74) );
  MUX2X1 U194 ( .B(n20), .A(out_neg[11]), .S(n24), .Y(n75) );
  MUX2X1 U195 ( .B(n8), .A(out_neg[12]), .S(n24), .Y(n76) );
  MUX2X1 U196 ( .B(n14), .A(out_neg[13]), .S(n24), .Y(n77) );
  MUX2X1 U197 ( .B(n15), .A(out_neg[14]), .S(n24), .Y(n79) );
  MUX2X1 U198 ( .B(n23), .A(out_neg[15]), .S(n24), .Y(n80) );
  MUX2X1 U199 ( .B(n16), .A(out_neg[16]), .S(n24), .Y(n81) );
  MUX2X1 U200 ( .B(n7), .A(out_neg[17]), .S(n24), .Y(n82) );
  MUX2X1 U201 ( .B(n6), .A(out_neg[18]), .S(n24), .Y(n83) );
endmodule


module cla_4bit_19 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n4), .B(n5), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n4), .B(n5), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n4), .B(n5), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(b[3]), .Y(n4) );
  INVX2 U10 ( .A(a[3]), .Y(n5) );
endmodule


module cla_4bit_18 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n4), .B(n5), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n4), .B(n5), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n4), .B(n5), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(b[3]), .Y(n4) );
  INVX2 U10 ( .A(a[3]), .Y(n5) );
endmodule


module cla_4bit_17 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n4), .B(n5), .C(n3), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n2), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n4), .B(n5), .C(n39), .D(n3), .Y(cout) );
  NAND2X1 U26 ( .A(n4), .B(n5), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n1), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n2), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(n36), .Y(n1) );
  INVX2 U7 ( .A(n23), .Y(n2) );
  INVX2 U8 ( .A(n28), .Y(n3) );
  INVX2 U9 ( .A(b[3]), .Y(n4) );
  INVX2 U10 ( .A(a[3]), .Y(n5) );
endmodule


module cla_4bit_16 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n32) );
  AND2X2 U2 ( .A(cin), .B(n27), .Y(n33) );
  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n27) );
  OR2X2 U4 ( .A(b[1]), .B(a[1]), .Y(n26) );
  OR2X2 U5 ( .A(b[2]), .B(a[2]), .Y(n25) );
  XNOR2X1 U11 ( .A(n39), .B(n38), .Y(sum[3]) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n38) );
  XOR2X1 U13 ( .A(n37), .B(n36), .Y(sum[2]) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n37) );
  XOR2X1 U15 ( .A(n35), .B(n34), .Y(sum[1]) );
  NOR2X1 U16 ( .A(n33), .B(n32), .Y(n34) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n35) );
  XOR2X1 U18 ( .A(a[0]), .B(n31), .Y(sum[0]) );
  XOR2X1 U19 ( .A(cin), .B(b[0]), .Y(n31) );
  NOR2X1 U20 ( .A(n30), .B(n29), .Y(pg) );
  NAND2X1 U21 ( .A(n28), .B(n27), .Y(n29) );
  NAND2X1 U22 ( .A(n26), .B(n25), .Y(n30) );
  OAI22X1 U23 ( .A(n5), .B(n1), .C(n4), .D(n24), .Y(gg) );
  AOI22X1 U24 ( .A(n3), .B(n25), .C(b[2]), .D(a[2]), .Y(n24) );
  OAI22X1 U25 ( .A(n5), .B(n1), .C(n39), .D(n4), .Y(cout) );
  NAND2X1 U26 ( .A(n5), .B(n1), .Y(n28) );
  AOI22X1 U27 ( .A(a[2]), .B(b[2]), .C(n25), .D(n2), .Y(n39) );
  AOI21X1 U28 ( .A(n26), .B(n33), .C(n3), .Y(n36) );
  AOI22X1 U29 ( .A(a[1]), .B(b[1]), .C(n26), .D(n32), .Y(n23) );
  INVX2 U6 ( .A(a[3]), .Y(n1) );
  INVX2 U7 ( .A(n36), .Y(n2) );
  INVX2 U8 ( .A(n23), .Y(n3) );
  INVX2 U9 ( .A(n28), .Y(n4) );
  INVX2 U10 ( .A(b[3]), .Y(n5) );
endmodule


module cla_16bit_4 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   cout, n2, n3, n4, n11, n12, n13, n14, n15, n16;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  NOR2X1 U5 ( .A(n16), .B(n15), .Y(pg) );
  NAND2X1 U6 ( .A(p[3]), .B(p[2]), .Y(n15) );
  NAND2X1 U7 ( .A(p[1]), .B(p[0]), .Y(n16) );
  AOI21X1 U8 ( .A(n2), .B(p[3]), .C(g[3]), .Y(n14) );
  AOI21X1 U9 ( .A(n3), .B(p[2]), .C(g[2]), .Y(n13) );
  AOI21X1 U10 ( .A(n4), .B(p[1]), .C(g[1]), .Y(n12) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n11) );
  cla_4bit_19 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_18 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n4), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_17 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n3), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_16 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n2), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  INVX2 U1 ( .A(n14), .Y(cout) );
  INVX2 U2 ( .A(n13), .Y(n2) );
  INVX2 U3 ( .A(n12), .Y(n3) );
  INVX2 U4 ( .A(n11), .Y(n4) );
endmodule


module cla_4bit_15 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51;

  INVX2 U1 ( .A(b[2]), .Y(n32) );
  INVX1 U2 ( .A(n36), .Y(n1) );
  BUFX2 U3 ( .A(a[2]), .Y(n9) );
  INVX1 U4 ( .A(n1), .Y(n2) );
  INVX2 U5 ( .A(b[3]), .Y(n11) );
  AOI22X1 U6 ( .A(n42), .B(n20), .C(n19), .D(n42), .Y(n13) );
  INVX1 U7 ( .A(n12), .Y(n3) );
  NAND2X1 U8 ( .A(n36), .B(n34), .Y(n4) );
  INVX4 U9 ( .A(a[1]), .Y(n34) );
  XOR2X1 U10 ( .A(n51), .B(n11), .Y(n5) );
  INVX2 U11 ( .A(n5), .Y(n28) );
  BUFX2 U12 ( .A(b[3]), .Y(n12) );
  INVX2 U13 ( .A(a[2]), .Y(n33) );
  INVX1 U14 ( .A(n8), .Y(n6) );
  INVX2 U15 ( .A(n51), .Y(n8) );
  INVX2 U16 ( .A(a[3]), .Y(n51) );
  AND2X2 U17 ( .A(n51), .B(n11), .Y(n7) );
  INVX1 U18 ( .A(n7), .Y(n48) );
  INVX2 U19 ( .A(n32), .Y(n10) );
  INVX4 U20 ( .A(b[1]), .Y(n36) );
  INVX1 U21 ( .A(n26), .Y(n27) );
  AND2X1 U22 ( .A(n26), .B(n5), .Y(n25) );
  OR2X2 U23 ( .A(a[0]), .B(b[0]), .Y(n41) );
  XOR2X1 U24 ( .A(b[0]), .B(a[0]), .Y(n14) );
  XOR2X1 U25 ( .A(cin), .B(n14), .Y(sum[0]) );
  NAND2X1 U26 ( .A(n36), .B(n34), .Y(n42) );
  OAI21X1 U27 ( .A(n2), .B(n34), .C(n4), .Y(n18) );
  NAND2X1 U28 ( .A(b[0]), .B(a[0]), .Y(n35) );
  INVX2 U29 ( .A(n35), .Y(n16) );
  NAND2X1 U30 ( .A(cin), .B(n41), .Y(n15) );
  INVX2 U31 ( .A(n15), .Y(n19) );
  NOR2X1 U32 ( .A(n16), .B(n19), .Y(n17) );
  XOR2X1 U33 ( .A(n18), .B(n17), .Y(sum[1]) );
  NAND2X1 U34 ( .A(n33), .B(n32), .Y(n43) );
  NAND2X1 U35 ( .A(n9), .B(n10), .Y(n46) );
  NAND2X1 U36 ( .A(n43), .B(n46), .Y(n21) );
  NAND2X1 U37 ( .A(n19), .B(n4), .Y(n23) );
  OAI21X1 U38 ( .A(n36), .B(n34), .C(n35), .Y(n20) );
  NAND2X1 U39 ( .A(n20), .B(n4), .Y(n26) );
  XOR2X1 U40 ( .A(n13), .B(n21), .Y(sum[2]) );
  INVX2 U41 ( .A(n43), .Y(n47) );
  OAI21X1 U42 ( .A(n47), .B(n23), .C(n46), .Y(n22) );
  OAI22X1 U43 ( .A(n5), .B(n22), .C(n47), .D(n28), .Y(n31) );
  AND2X2 U44 ( .A(n46), .B(n23), .Y(n24) );
  NAND2X1 U45 ( .A(n25), .B(n24), .Y(n30) );
  NAND3X1 U46 ( .A(n43), .B(n28), .C(n27), .Y(n29) );
  NAND3X1 U47 ( .A(n31), .B(n29), .C(n30), .Y(sum[3]) );
  AOI22X1 U48 ( .A(n9), .B(n10), .C(n12), .D(n8), .Y(n40) );
  AOI22X1 U49 ( .A(n33), .B(n32), .C(n35), .D(n36), .Y(n38) );
  OAI21X1 U50 ( .A(n36), .B(n35), .C(n34), .Y(n37) );
  NAND2X1 U51 ( .A(n37), .B(n38), .Y(n39) );
  AOI21X1 U52 ( .A(n39), .B(n40), .C(n7), .Y(gg) );
  NAND2X1 U53 ( .A(n41), .B(n48), .Y(n45) );
  NAND2X1 U54 ( .A(n43), .B(n42), .Y(n44) );
  NOR2X1 U55 ( .A(n45), .B(n44), .Y(pg) );
  OAI21X1 U56 ( .A(n13), .B(n47), .C(n46), .Y(n49) );
  NAND2X1 U57 ( .A(n49), .B(n48), .Y(n50) );
  OAI21X1 U58 ( .A(n6), .B(n3), .C(n50), .Y(cout) );
endmodule


module cla_4bit_14 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63;

  INVX2 U1 ( .A(n57), .Y(n35) );
  AND2X2 U2 ( .A(n52), .B(n53), .Y(n16) );
  INVX2 U3 ( .A(n35), .Y(n8) );
  INVX1 U4 ( .A(b[0]), .Y(n1) );
  INVX1 U5 ( .A(b[0]), .Y(n4) );
  INVX2 U6 ( .A(a[0]), .Y(n5) );
  INVX1 U7 ( .A(n4), .Y(n2) );
  AND2X2 U8 ( .A(n4), .B(n5), .Y(n3) );
  NAND2X1 U9 ( .A(n1), .B(n5), .Y(n52) );
  OR2X2 U10 ( .A(b[1]), .B(a[1]), .Y(n6) );
  INVX1 U11 ( .A(n3), .Y(n7) );
  XOR2X1 U12 ( .A(n44), .B(n45), .Y(n12) );
  INVX2 U13 ( .A(n29), .Y(n9) );
  INVX2 U14 ( .A(cin), .Y(n29) );
  NAND2X1 U15 ( .A(n45), .B(n44), .Y(n10) );
  NOR2X1 U16 ( .A(n58), .B(n14), .Y(n11) );
  INVX2 U17 ( .A(n12), .Y(n39) );
  INVX1 U18 ( .A(n33), .Y(n20) );
  BUFX2 U19 ( .A(a[0]), .Y(n13) );
  INVX2 U20 ( .A(b[3]), .Y(n44) );
  AND2X2 U21 ( .A(cin), .B(n16), .Y(n14) );
  BUFX2 U22 ( .A(n14), .Y(n15) );
  AND2X2 U23 ( .A(cin), .B(n16), .Y(n17) );
  OR2X2 U24 ( .A(b[2]), .B(a[2]), .Y(n57) );
  XNOR2X1 U25 ( .A(n9), .B(n18), .Y(sum[0]) );
  XNOR2X1 U26 ( .A(n2), .B(n13), .Y(n18) );
  OR2X2 U27 ( .A(b[1]), .B(a[1]), .Y(n53) );
  INVX1 U28 ( .A(n10), .Y(n63) );
  NAND2X1 U29 ( .A(n34), .B(n20), .Y(n21) );
  NAND2X1 U30 ( .A(n19), .B(n11), .Y(n22) );
  NAND2X1 U31 ( .A(n21), .B(n22), .Y(sum[2]) );
  INVX2 U32 ( .A(n34), .Y(n19) );
  NAND2X1 U33 ( .A(b[0]), .B(a[0]), .Y(n32) );
  INVX2 U34 ( .A(n32), .Y(n25) );
  NAND2X1 U35 ( .A(b[1]), .B(a[1]), .Y(n31) );
  NAND2X1 U36 ( .A(n31), .B(n6), .Y(n24) );
  INVX2 U37 ( .A(n24), .Y(n23) );
  NOR2X1 U38 ( .A(n25), .B(n23), .Y(n30) );
  NAND2X1 U39 ( .A(n23), .B(n7), .Y(n27) );
  OAI22X1 U40 ( .A(n25), .B(n24), .C(n3), .D(n23), .Y(n26) );
  OAI21X1 U41 ( .A(n29), .B(n27), .C(n26), .Y(n28) );
  AOI21X1 U42 ( .A(n30), .B(n29), .C(n28), .Y(sum[1]) );
  NAND2X1 U43 ( .A(b[2]), .B(a[2]), .Y(n59) );
  NAND2X1 U44 ( .A(n8), .B(n59), .Y(n34) );
  NAND2X1 U45 ( .A(n32), .B(n31), .Y(n46) );
  NAND2X1 U46 ( .A(n46), .B(n6), .Y(n38) );
  INVX2 U47 ( .A(n38), .Y(n58) );
  NOR2X1 U48 ( .A(n58), .B(n14), .Y(n33) );
  INVX2 U49 ( .A(a[3]), .Y(n45) );
  NOR2X1 U50 ( .A(n35), .B(n12), .Y(n36) );
  INVX2 U51 ( .A(n59), .Y(n48) );
  AOI22X1 U52 ( .A(n58), .B(n36), .C(n48), .D(n39), .Y(n37) );
  OAI21X1 U53 ( .A(n39), .B(n8), .C(n37), .Y(n43) );
  NAND3X1 U54 ( .A(n38), .B(n59), .C(n12), .Y(n41) );
  NAND3X1 U55 ( .A(n39), .B(n8), .C(n17), .Y(n40) );
  OAI21X1 U56 ( .A(n17), .B(n41), .C(n40), .Y(n42) );
  OR2X2 U57 ( .A(n42), .B(n43), .Y(sum[3]) );
  NAND2X1 U58 ( .A(n45), .B(n44), .Y(n56) );
  NAND2X1 U59 ( .A(n57), .B(n10), .Y(n51) );
  NAND2X1 U60 ( .A(n46), .B(n6), .Y(n50) );
  NAND2X1 U61 ( .A(b[3]), .B(a[3]), .Y(n61) );
  INVX2 U62 ( .A(n61), .Y(n47) );
  AOI21X1 U63 ( .A(n10), .B(n48), .C(n47), .Y(n49) );
  OAI21X1 U64 ( .A(n51), .B(n50), .C(n49), .Y(gg) );
  NAND2X1 U65 ( .A(n52), .B(n56), .Y(n55) );
  NAND2X1 U66 ( .A(n57), .B(n53), .Y(n54) );
  NOR2X1 U67 ( .A(n55), .B(n54), .Y(pg) );
  OAI21X1 U68 ( .A(n15), .B(n58), .C(n8), .Y(n60) );
  AND2X2 U69 ( .A(n60), .B(n59), .Y(n62) );
  OAI21X1 U70 ( .A(n63), .B(n62), .C(n61), .Y(cout) );
endmodule


module cla_4bit_13 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58;

  OR2X2 U1 ( .A(a[1]), .B(b[1]), .Y(n1) );
  INVX2 U2 ( .A(n6), .Y(n2) );
  AND2X2 U3 ( .A(n5), .B(n51), .Y(n37) );
  NAND2X1 U4 ( .A(n2), .B(n53), .Y(n3) );
  NAND2X1 U5 ( .A(n3), .B(n33), .Y(n34) );
  BUFX2 U6 ( .A(a[0]), .Y(n9) );
  AND2X1 U7 ( .A(n40), .B(n39), .Y(n4) );
  AND2X1 U8 ( .A(n10), .B(n50), .Y(n5) );
  NAND2X1 U9 ( .A(b[0]), .B(a[0]), .Y(n25) );
  XOR2X1 U10 ( .A(n42), .B(n41), .Y(n6) );
  INVX2 U11 ( .A(b[3]), .Y(n41) );
  BUFX4 U12 ( .A(n54), .Y(n7) );
  BUFX2 U13 ( .A(cin), .Y(n8) );
  AND2X2 U14 ( .A(n6), .B(n43), .Y(n10) );
  INVX1 U15 ( .A(n27), .Y(n11) );
  NAND2X1 U16 ( .A(n38), .B(n4), .Y(sum[3]) );
  BUFX2 U17 ( .A(n25), .Y(n12) );
  OR2X1 U18 ( .A(n52), .B(n36), .Y(n13) );
  NOR2X1 U19 ( .A(a[1]), .B(b[1]), .Y(n14) );
  BUFX2 U20 ( .A(n47), .Y(n15) );
  INVX4 U21 ( .A(n18), .Y(n50) );
  OR2X2 U22 ( .A(n9), .B(b[0]), .Y(n47) );
  INVX4 U23 ( .A(n50), .Y(n44) );
  BUFX2 U24 ( .A(n51), .Y(n16) );
  NOR2X1 U25 ( .A(n13), .B(n51), .Y(n17) );
  NOR2X1 U26 ( .A(n17), .B(n37), .Y(n38) );
  AOI21X1 U27 ( .A(n25), .B(n26), .C(n14), .Y(n18) );
  INVX2 U28 ( .A(cin), .Y(n51) );
  XNOR2X1 U29 ( .A(n24), .B(n23), .Y(sum[1]) );
  AND2X2 U30 ( .A(n54), .B(n43), .Y(n20) );
  OR2X2 U31 ( .A(a[2]), .B(b[2]), .Y(n54) );
  XNOR2X1 U32 ( .A(n8), .B(n21), .Y(sum[0]) );
  XNOR2X1 U33 ( .A(b[0]), .B(n9), .Y(n21) );
  NAND2X1 U34 ( .A(n15), .B(n8), .Y(n22) );
  NAND2X1 U35 ( .A(n22), .B(n12), .Y(n24) );
  NAND2X1 U36 ( .A(a[1]), .B(b[1]), .Y(n26) );
  NAND2X1 U37 ( .A(n1), .B(n26), .Y(n23) );
  NAND2X1 U38 ( .A(b[2]), .B(a[2]), .Y(n43) );
  NOR2X1 U39 ( .A(n44), .B(n20), .Y(n32) );
  NAND2X1 U40 ( .A(n47), .B(n1), .Y(n52) );
  INVX2 U41 ( .A(n52), .Y(n27) );
  NAND2X1 U42 ( .A(n20), .B(n27), .Y(n30) );
  OAI21X1 U43 ( .A(n27), .B(n20), .C(n50), .Y(n28) );
  OAI21X1 U44 ( .A(n20), .B(n50), .C(n28), .Y(n29) );
  OAI21X1 U45 ( .A(n51), .B(n30), .C(n29), .Y(n31) );
  AOI21X1 U46 ( .A(n32), .B(n51), .C(n31), .Y(sum[2]) );
  INVX2 U47 ( .A(n7), .Y(n35) );
  INVX2 U48 ( .A(a[3]), .Y(n42) );
  NAND3X1 U49 ( .A(n7), .B(n44), .C(n2), .Y(n33) );
  AOI21X1 U50 ( .A(n35), .B(n10), .C(n34), .Y(n40) );
  NAND3X1 U51 ( .A(n52), .B(n50), .C(n10), .Y(n39) );
  NAND2X1 U52 ( .A(n54), .B(n2), .Y(n36) );
  NAND2X1 U53 ( .A(n42), .B(n41), .Y(n46) );
  INVX2 U54 ( .A(n46), .Y(n58) );
  INVX2 U55 ( .A(n43), .Y(n53) );
  AOI21X1 U56 ( .A(n7), .B(n44), .C(n53), .Y(n45) );
  NAND2X1 U57 ( .A(b[3]), .B(a[3]), .Y(n56) );
  OAI21X1 U58 ( .A(n58), .B(n45), .C(n56), .Y(gg) );
  NAND2X1 U59 ( .A(n47), .B(n46), .Y(n49) );
  NAND2X1 U60 ( .A(n1), .B(n54), .Y(n48) );
  NOR2X1 U61 ( .A(n49), .B(n48), .Y(pg) );
  OAI21X1 U62 ( .A(n11), .B(n16), .C(n50), .Y(n55) );
  AOI21X1 U63 ( .A(n55), .B(n7), .C(n53), .Y(n57) );
  OAI21X1 U64 ( .A(n58), .B(n57), .C(n56), .Y(cout) );
endmodule


module cla_4bit_12 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53;

  INVX4 U1 ( .A(cin), .Y(n46) );
  AND2X1 U2 ( .A(n19), .B(n20), .Y(n1) );
  AND2X2 U3 ( .A(n1), .B(n18), .Y(sum[2]) );
  OR2X2 U4 ( .A(a[2]), .B(b[2]), .Y(n49) );
  XNOR2X1 U5 ( .A(cin), .B(n2), .Y(sum[0]) );
  XNOR2X1 U6 ( .A(b[0]), .B(a[0]), .Y(n2) );
  OR2X2 U7 ( .A(a[0]), .B(b[0]), .Y(n41) );
  OR2X2 U8 ( .A(b[1]), .B(a[1]), .Y(n42) );
  NAND2X1 U9 ( .A(b[0]), .B(a[0]), .Y(n5) );
  INVX2 U10 ( .A(n5), .Y(n12) );
  NAND2X1 U11 ( .A(a[1]), .B(b[1]), .Y(n11) );
  NAND2X1 U12 ( .A(n11), .B(n42), .Y(n6) );
  INVX2 U13 ( .A(n6), .Y(n4) );
  INVX2 U14 ( .A(n41), .Y(n3) );
  OAI22X1 U15 ( .A(n12), .B(n6), .C(n4), .D(n3), .Y(n9) );
  NAND3X1 U16 ( .A(n4), .B(n41), .C(cin), .Y(n8) );
  NAND3X1 U17 ( .A(n6), .B(n5), .C(n46), .Y(n7) );
  NAND3X1 U18 ( .A(n9), .B(n8), .C(n7), .Y(n10) );
  INVX2 U19 ( .A(n10), .Y(sum[1]) );
  NAND2X1 U20 ( .A(b[2]), .B(a[2]), .Y(n22) );
  NAND2X1 U21 ( .A(n49), .B(n22), .Y(n17) );
  INVX2 U22 ( .A(n17), .Y(n16) );
  INVX2 U23 ( .A(n11), .Y(n13) );
  OAI21X1 U24 ( .A(n13), .B(n12), .C(n42), .Y(n45) );
  NAND2X1 U25 ( .A(n41), .B(n42), .Y(n47) );
  INVX2 U26 ( .A(n47), .Y(n15) );
  OAI21X1 U27 ( .A(n15), .B(n16), .C(n45), .Y(n14) );
  OAI21X1 U28 ( .A(n16), .B(n45), .C(n14), .Y(n20) );
  NAND3X1 U29 ( .A(n16), .B(n15), .C(cin), .Y(n19) );
  NAND3X1 U30 ( .A(n17), .B(n45), .C(n46), .Y(n18) );
  INVX2 U31 ( .A(n45), .Y(n38) );
  AND2X2 U32 ( .A(n49), .B(n38), .Y(n25) );
  INVX2 U33 ( .A(a[3]), .Y(n37) );
  XOR2X1 U34 ( .A(n37), .B(b[3]), .Y(n27) );
  INVX2 U35 ( .A(n27), .Y(n21) );
  NAND2X1 U36 ( .A(n21), .B(n22), .Y(n26) );
  INVX2 U37 ( .A(n22), .Y(n48) );
  NAND2X1 U38 ( .A(n48), .B(n27), .Y(n23) );
  OAI21X1 U39 ( .A(n26), .B(n49), .C(n23), .Y(n24) );
  AOI21X1 U40 ( .A(n25), .B(n27), .C(n24), .Y(n35) );
  INVX2 U41 ( .A(n26), .Y(n29) );
  NAND3X1 U42 ( .A(n45), .B(n29), .C(n47), .Y(n34) );
  NAND2X1 U43 ( .A(n49), .B(n27), .Y(n28) );
  NOR2X1 U44 ( .A(n47), .B(n28), .Y(n32) );
  NAND3X1 U45 ( .A(n45), .B(n46), .C(n29), .Y(n30) );
  INVX2 U46 ( .A(n30), .Y(n31) );
  AOI21X1 U47 ( .A(n32), .B(cin), .C(n31), .Y(n33) );
  NAND3X1 U48 ( .A(n35), .B(n34), .C(n33), .Y(sum[3]) );
  INVX2 U49 ( .A(b[3]), .Y(n36) );
  NAND2X1 U50 ( .A(n37), .B(n36), .Y(n40) );
  INVX2 U51 ( .A(n40), .Y(n53) );
  AOI21X1 U52 ( .A(n38), .B(n49), .C(n48), .Y(n39) );
  NAND2X1 U53 ( .A(b[3]), .B(a[3]), .Y(n51) );
  OAI21X1 U54 ( .A(n53), .B(n39), .C(n51), .Y(gg) );
  NAND2X1 U55 ( .A(n41), .B(n40), .Y(n44) );
  NAND2X1 U56 ( .A(n42), .B(n49), .Y(n43) );
  NOR2X1 U57 ( .A(n44), .B(n43), .Y(pg) );
  OAI21X1 U58 ( .A(n47), .B(n46), .C(n45), .Y(n50) );
  AOI21X1 U59 ( .A(n50), .B(n49), .C(n48), .Y(n52) );
  OAI21X1 U60 ( .A(n53), .B(n52), .C(n51), .Y(cout) );
endmodule


module cla_16bit_3 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, cout, n23, n24, n25;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  NOR2X1 U5 ( .A(n25), .B(n24), .Y(pg) );
  NAND2X1 U6 ( .A(p[3]), .B(p[2]), .Y(n24) );
  NAND2X1 U7 ( .A(n4), .B(p[0]), .Y(n25) );
  cla_4bit_15 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(n20), 
        .sum(sum[3:0]) );
  cla_4bit_14 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n21), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_13 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n7), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_12 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n9), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  INVX1 U1 ( .A(g[2]), .Y(n13) );
  INVX2 U2 ( .A(n20), .Y(n1) );
  INVX1 U3 ( .A(n9), .Y(n19) );
  INVX1 U4 ( .A(n1), .Y(n2) );
  INVX1 U8 ( .A(p[1]), .Y(n3) );
  INVX2 U9 ( .A(n3), .Y(n4) );
  NAND2X1 U10 ( .A(n12), .B(n11), .Y(n7) );
  INVX4 U11 ( .A(n23), .Y(n8) );
  INVX8 U12 ( .A(n8), .Y(n9) );
  INVX1 U13 ( .A(n7), .Y(n15) );
  NAND2X1 U14 ( .A(p[0]), .B(cin), .Y(n16) );
  INVX2 U15 ( .A(n16), .Y(n10) );
  OAI21X1 U16 ( .A(n2), .B(n10), .C(p[1]), .Y(n12) );
  INVX2 U17 ( .A(g[1]), .Y(n11) );
  INVX2 U18 ( .A(p[2]), .Y(n14) );
  OAI21X1 U19 ( .A(n15), .B(n14), .C(n13), .Y(n23) );
  NAND2X1 U20 ( .A(n1), .B(n16), .Y(n21) );
  INVX2 U21 ( .A(p[3]), .Y(n18) );
  INVX2 U22 ( .A(g[3]), .Y(n17) );
  OAI21X1 U23 ( .A(n19), .B(n18), .C(n17), .Y(cout) );
endmodule


module adder_1bit_5 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2, n3, n4;

  XNOR2X1 U1 ( .A(carry_in), .B(n4), .Y(sum) );
  INVX2 U2 ( .A(a), .Y(n2) );
  XOR2X1 U3 ( .A(n2), .B(b), .Y(n4) );
  INVX2 U4 ( .A(carry_in), .Y(n3) );
  INVX2 U5 ( .A(b), .Y(n1) );
  OAI22X1 U6 ( .A(n4), .B(n3), .C(n2), .D(n1), .Y(carry_out) );
endmodule


module cla_4bit_11 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31;

  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n31) );
  INVX1 U1 ( .A(n17), .Y(n1) );
  INVX2 U2 ( .A(a[3]), .Y(n17) );
  NOR2X1 U4 ( .A(b[3]), .B(a[3]), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n25) );
  AND2X1 U6 ( .A(a[1]), .B(b[1]), .Y(n4) );
  XNOR2X1 U7 ( .A(n3), .B(n30), .Y(sum[3]) );
  XNOR2X1 U8 ( .A(n17), .B(b[3]), .Y(n3) );
  OR2X2 U9 ( .A(a[2]), .B(b[2]), .Y(n26) );
  OR2X2 U10 ( .A(b[1]), .B(a[1]), .Y(n24) );
  XOR2X1 U11 ( .A(b[0]), .B(a[0]), .Y(n5) );
  XOR2X1 U12 ( .A(cin), .B(n5), .Y(sum[0]) );
  NAND2X1 U13 ( .A(n31), .B(cin), .Y(n10) );
  NAND2X1 U14 ( .A(b[0]), .B(a[0]), .Y(n8) );
  NAND2X1 U15 ( .A(n10), .B(n8), .Y(n7) );
  INVX2 U16 ( .A(n24), .Y(n11) );
  NOR2X1 U17 ( .A(n11), .B(n4), .Y(n6) );
  XOR2X1 U18 ( .A(n7), .B(n6), .Y(sum[1]) );
  NAND2X1 U19 ( .A(b[2]), .B(a[2]), .Y(n20) );
  NAND2X1 U20 ( .A(n26), .B(n20), .Y(n13) );
  INVX2 U21 ( .A(n8), .Y(n9) );
  OAI21X1 U22 ( .A(n4), .B(n9), .C(n24), .Y(n19) );
  OAI21X1 U23 ( .A(n11), .B(n10), .C(n19), .Y(n12) );
  INVX2 U24 ( .A(n12), .Y(n15) );
  XOR2X1 U25 ( .A(n13), .B(n15), .Y(sum[2]) );
  INVX2 U26 ( .A(n26), .Y(n14) );
  OAI21X1 U27 ( .A(n15), .B(n14), .C(n20), .Y(n16) );
  INVX2 U28 ( .A(n16), .Y(n30) );
  INVX2 U29 ( .A(n19), .Y(n22) );
  INVX2 U30 ( .A(n20), .Y(n21) );
  AOI21X1 U31 ( .A(n22), .B(n26), .C(n21), .Y(n23) );
  NAND2X1 U32 ( .A(b[3]), .B(n1), .Y(n29) );
  OAI21X1 U33 ( .A(n23), .B(n2), .C(n29), .Y(gg) );
  NAND2X1 U34 ( .A(n25), .B(n24), .Y(n28) );
  NAND2X1 U35 ( .A(n31), .B(n26), .Y(n27) );
  NOR2X1 U36 ( .A(n28), .B(n27), .Y(pg) );
  OAI21X1 U37 ( .A(n30), .B(n2), .C(n29), .Y(cout) );
endmodule


module cla_4bit_10 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52;

  NAND2X1 U1 ( .A(n33), .B(n45), .Y(n1) );
  XOR2X1 U2 ( .A(n2), .B(n11), .Y(sum[0]) );
  INVX1 U3 ( .A(cin), .Y(n2) );
  XOR2X1 U4 ( .A(n14), .B(n1), .Y(sum[1]) );
  INVX2 U5 ( .A(n26), .Y(n3) );
  INVX2 U6 ( .A(n23), .Y(n26) );
  INVX2 U7 ( .A(a[2]), .Y(n6) );
  INVX1 U8 ( .A(n22), .Y(n29) );
  AND2X2 U9 ( .A(n38), .B(n6), .Y(n4) );
  INVX2 U10 ( .A(n4), .Y(n24) );
  INVX2 U11 ( .A(a[3]), .Y(n37) );
  INVX1 U12 ( .A(n6), .Y(n5) );
  BUFX2 U13 ( .A(n4), .Y(n7) );
  AND2X1 U14 ( .A(a[0]), .B(b[0]), .Y(n9) );
  OR2X2 U15 ( .A(b[1]), .B(a[1]), .Y(n45) );
  XNOR2X1 U16 ( .A(n37), .B(b[3]), .Y(n8) );
  AND2X2 U17 ( .A(cin), .B(n16), .Y(n10) );
  XNOR2X1 U18 ( .A(a[0]), .B(b[0]), .Y(n11) );
  INVX1 U19 ( .A(n37), .Y(n12) );
  OR2X2 U20 ( .A(a[3]), .B(b[3]), .Y(n40) );
  NAND2X1 U21 ( .A(a[1]), .B(b[1]), .Y(n33) );
  INVX2 U22 ( .A(b[0]), .Y(n13) );
  INVX2 U23 ( .A(a[0]), .Y(n35) );
  NAND2X1 U24 ( .A(n13), .B(n35), .Y(n16) );
  NOR2X1 U25 ( .A(n9), .B(n10), .Y(n14) );
  INVX2 U26 ( .A(b[2]), .Y(n38) );
  NAND2X1 U27 ( .A(b[2]), .B(a[2]), .Y(n48) );
  NAND2X1 U28 ( .A(n24), .B(n48), .Y(n18) );
  INVX2 U29 ( .A(n33), .Y(n15) );
  OAI21X1 U30 ( .A(n9), .B(n15), .C(n45), .Y(n22) );
  NAND3X1 U31 ( .A(n16), .B(cin), .C(n45), .Y(n17) );
  AND2X2 U32 ( .A(n22), .B(n17), .Y(n49) );
  XOR2X1 U33 ( .A(n18), .B(n49), .Y(sum[2]) );
  NAND2X1 U34 ( .A(n45), .B(n10), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n19) );
  XOR2X1 U36 ( .A(n37), .B(b[3]), .Y(n23) );
  NAND3X1 U37 ( .A(n24), .B(n19), .C(n3), .Y(n32) );
  AND2X2 U38 ( .A(n48), .B(n22), .Y(n21) );
  NAND3X1 U39 ( .A(n21), .B(n20), .C(n26), .Y(n31) );
  AND2X2 U40 ( .A(n23), .B(n24), .Y(n28) );
  NAND2X1 U41 ( .A(n8), .B(n4), .Y(n25) );
  OAI21X1 U42 ( .A(n8), .B(n48), .C(n25), .Y(n27) );
  AOI21X1 U43 ( .A(n29), .B(n28), .C(n27), .Y(n30) );
  NAND3X1 U44 ( .A(n32), .B(n31), .C(n30), .Y(sum[3]) );
  OAI21X1 U45 ( .A(a[1]), .B(b[1]), .C(b[0]), .Y(n34) );
  OAI21X1 U46 ( .A(n35), .B(n34), .C(n33), .Y(n36) );
  INVX2 U47 ( .A(n36), .Y(n44) );
  OAI21X1 U48 ( .A(b[2]), .B(n5), .C(n40), .Y(n43) );
  NOR2X1 U49 ( .A(n38), .B(n6), .Y(n41) );
  NAND2X1 U50 ( .A(b[3]), .B(a[3]), .Y(n52) );
  INVX2 U51 ( .A(n52), .Y(n39) );
  AOI21X1 U52 ( .A(n40), .B(n41), .C(n39), .Y(n42) );
  OAI21X1 U53 ( .A(n44), .B(n43), .C(n42), .Y(gg) );
  OAI22X1 U54 ( .A(a[3]), .B(b[3]), .C(b[2]), .D(a[2]), .Y(n47) );
  OAI21X1 U55 ( .A(a[0]), .B(b[0]), .C(n45), .Y(n46) );
  NOR2X1 U56 ( .A(n47), .B(n46), .Y(pg) );
  OAI21X1 U57 ( .A(n49), .B(n7), .C(n48), .Y(n50) );
  OAI21X1 U58 ( .A(b[3]), .B(n12), .C(n50), .Y(n51) );
  NAND2X1 U59 ( .A(n52), .B(n51), .Y(cout) );
endmodule


module cla_4bit_9 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71;

  AND2X2 U1 ( .A(n12), .B(n52), .Y(n23) );
  BUFX4 U2 ( .A(n65), .Y(n19) );
  OR2X2 U3 ( .A(a[3]), .B(n1), .Y(n63) );
  INVX8 U4 ( .A(n59), .Y(n1) );
  BUFX4 U5 ( .A(n12), .Y(n18) );
  INVX2 U6 ( .A(n23), .Y(n4) );
  INVX2 U7 ( .A(a[1]), .Y(n5) );
  AND2X2 U8 ( .A(n39), .B(n4), .Y(n2) );
  NAND2X1 U9 ( .A(n12), .B(n52), .Y(n3) );
  NAND2X1 U10 ( .A(n51), .B(n5), .Y(n20) );
  NAND3X1 U11 ( .A(n63), .B(n3), .C(n20), .Y(n60) );
  AOI21X1 U12 ( .A(n18), .B(n52), .C(n51), .Y(n54) );
  INVX1 U13 ( .A(b[1]), .Y(n51) );
  INVX1 U14 ( .A(a[3]), .Y(n6) );
  INVX2 U15 ( .A(a[2]), .Y(n12) );
  OR2X1 U16 ( .A(n46), .B(n14), .Y(n13) );
  AND2X2 U17 ( .A(n33), .B(n35), .Y(n7) );
  INVX2 U18 ( .A(n7), .Y(n66) );
  BUFX2 U19 ( .A(a[1]), .Y(n16) );
  NOR2X1 U20 ( .A(a[0]), .B(n8), .Y(n9) );
  NOR2X1 U21 ( .A(n9), .B(n60), .Y(pg) );
  INVX1 U22 ( .A(n61), .Y(n8) );
  XNOR2X1 U23 ( .A(n37), .B(n10), .Y(sum[2]) );
  OR2X2 U24 ( .A(n67), .B(n23), .Y(n10) );
  INVX2 U25 ( .A(n44), .Y(n11) );
  NAND2X1 U26 ( .A(n13), .B(n45), .Y(n47) );
  BUFX2 U27 ( .A(n6), .Y(n14) );
  INVX1 U28 ( .A(cin), .Y(n15) );
  INVX1 U29 ( .A(n15), .Y(n17) );
  INVX2 U30 ( .A(cin), .Y(n65) );
  NAND2X1 U31 ( .A(n21), .B(n2), .Y(n22) );
  NAND2X1 U32 ( .A(n22), .B(n49), .Y(sum[3]) );
  INVX1 U33 ( .A(n50), .Y(n21) );
  XNOR2X1 U34 ( .A(n17), .B(n24), .Y(sum[0]) );
  XNOR2X1 U35 ( .A(b[0]), .B(a[0]), .Y(n24) );
  AND2X2 U36 ( .A(b[0]), .B(a[0]), .Y(n25) );
  INVX1 U37 ( .A(n63), .Y(n71) );
  NAND2X1 U38 ( .A(a[1]), .B(b[1]), .Y(n34) );
  NAND2X1 U39 ( .A(n51), .B(n5), .Y(n35) );
  NAND2X1 U40 ( .A(n34), .B(n35), .Y(n28) );
  INVX2 U41 ( .A(n28), .Y(n26) );
  NOR2X1 U42 ( .A(n26), .B(n25), .Y(n32) );
  INVX2 U43 ( .A(a[0]), .Y(n62) );
  INVX2 U44 ( .A(b[0]), .Y(n61) );
  NAND2X1 U45 ( .A(n62), .B(n61), .Y(n33) );
  NAND2X1 U46 ( .A(n26), .B(n33), .Y(n30) );
  INVX2 U47 ( .A(n33), .Y(n27) );
  OAI22X1 U48 ( .A(n25), .B(n28), .C(n27), .D(n26), .Y(n29) );
  OAI21X1 U49 ( .A(n15), .B(n30), .C(n29), .Y(n31) );
  AOI21X1 U50 ( .A(n32), .B(n19), .C(n31), .Y(sum[1]) );
  OAI21X1 U51 ( .A(n62), .B(n61), .C(n34), .Y(n36) );
  NAND2X1 U52 ( .A(n35), .B(n36), .Y(n64) );
  OAI21X1 U53 ( .A(n66), .B(n65), .C(n11), .Y(n37) );
  NAND2X1 U54 ( .A(b[2]), .B(a[2]), .Y(n41) );
  INVX2 U55 ( .A(n41), .Y(n67) );
  INVX2 U56 ( .A(b[2]), .Y(n52) );
  NAND2X1 U57 ( .A(cin), .B(n7), .Y(n50) );
  XOR2X1 U58 ( .A(n6), .B(b[3]), .Y(n39) );
  NAND2X1 U59 ( .A(n64), .B(n41), .Y(n38) );
  NOR2X1 U60 ( .A(n39), .B(n38), .Y(n48) );
  INVX2 U61 ( .A(b[3]), .Y(n59) );
  AOI22X1 U62 ( .A(n67), .B(b[3]), .C(n23), .D(n59), .Y(n46) );
  INVX2 U63 ( .A(n64), .Y(n44) );
  NAND2X1 U64 ( .A(a[3]), .B(b[3]), .Y(n69) );
  NAND3X1 U65 ( .A(n3), .B(n6), .C(n59), .Y(n40) );
  OAI21X1 U66 ( .A(n69), .B(n23), .C(n40), .Y(n43) );
  OAI22X1 U67 ( .A(n59), .B(n3), .C(b[3]), .D(n41), .Y(n42) );
  AOI22X1 U68 ( .A(n43), .B(n44), .C(n42), .D(n14), .Y(n45) );
  AOI21X1 U69 ( .A(n50), .B(n48), .C(n47), .Y(n49) );
  AOI21X1 U70 ( .A(n18), .B(n52), .C(n61), .Y(n53) );
  AOI22X1 U71 ( .A(n16), .B(n54), .C(n53), .D(a[0]), .Y(n58) );
  OAI21X1 U72 ( .A(n16), .B(b[1]), .C(n63), .Y(n57) );
  INVX2 U73 ( .A(n69), .Y(n55) );
  AOI21X1 U74 ( .A(n67), .B(n63), .C(n55), .Y(n56) );
  OAI21X1 U75 ( .A(n58), .B(n57), .C(n56), .Y(gg) );
  OAI21X1 U76 ( .A(n66), .B(n19), .C(n11), .Y(n68) );
  AOI21X1 U77 ( .A(n68), .B(n4), .C(n67), .Y(n70) );
  OAI21X1 U78 ( .A(n71), .B(n70), .C(n69), .Y(cout) );
endmodule


module cla_4bit_8 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77;

  INVX1 U1 ( .A(n45), .Y(n44) );
  AND2X2 U2 ( .A(n40), .B(n27), .Y(n1) );
  AND2X1 U3 ( .A(n36), .B(n37), .Y(n11) );
  INVX4 U4 ( .A(n9), .Y(n10) );
  AND2X1 U5 ( .A(n35), .B(n33), .Y(n2) );
  INVX1 U6 ( .A(n51), .Y(n53) );
  AND2X1 U7 ( .A(n27), .B(n40), .Y(n3) );
  INVX1 U8 ( .A(n16), .Y(n4) );
  NAND2X1 U9 ( .A(n70), .B(n73), .Y(n35) );
  INVX1 U10 ( .A(n56), .Y(n58) );
  INVX2 U11 ( .A(n70), .Y(n9) );
  BUFX2 U12 ( .A(n73), .Y(n5) );
  NAND2X1 U13 ( .A(n24), .B(n25), .Y(n6) );
  NAND2X1 U14 ( .A(n24), .B(n25), .Y(n7) );
  INVX1 U15 ( .A(n30), .Y(n8) );
  NAND2X1 U16 ( .A(cin), .B(n3), .Y(n41) );
  INVX2 U17 ( .A(cin), .Y(n34) );
  INVX1 U18 ( .A(cin), .Y(n17) );
  NAND2X1 U19 ( .A(n41), .B(n12), .Y(n13) );
  NAND2X1 U20 ( .A(n13), .B(n54), .Y(sum[3]) );
  INVX2 U21 ( .A(n55), .Y(n12) );
  NAND2X1 U22 ( .A(n2), .B(n34), .Y(n37) );
  NAND2X1 U23 ( .A(n39), .B(n38), .Y(n14) );
  AND2X2 U24 ( .A(n11), .B(n14), .Y(sum[2]) );
  OR2X2 U25 ( .A(b[2]), .B(a[2]), .Y(n70) );
  XNOR2X1 U26 ( .A(cin), .B(n15), .Y(sum[0]) );
  XNOR2X1 U27 ( .A(b[0]), .B(a[0]), .Y(n15) );
  NAND2X1 U28 ( .A(b[0]), .B(a[0]), .Y(n18) );
  INVX2 U29 ( .A(n18), .Y(n57) );
  NAND2X1 U30 ( .A(a[1]), .B(b[1]), .Y(n56) );
  INVX2 U31 ( .A(b[1]), .Y(n24) );
  NAND2X1 U32 ( .A(n56), .B(n7), .Y(n19) );
  INVX2 U33 ( .A(a[0]), .Y(n32) );
  INVX2 U34 ( .A(b[0]), .Y(n31) );
  NAND2X1 U35 ( .A(n32), .B(n31), .Y(n40) );
  INVX2 U36 ( .A(n40), .Y(n67) );
  INVX2 U37 ( .A(n19), .Y(n16) );
  OAI22X1 U38 ( .A(n57), .B(n19), .C(n67), .D(n16), .Y(n22) );
  NAND3X1 U39 ( .A(cin), .B(n40), .C(n16), .Y(n21) );
  NAND3X1 U40 ( .A(n4), .B(n18), .C(n17), .Y(n20) );
  NAND3X1 U41 ( .A(n21), .B(n22), .C(n20), .Y(n23) );
  INVX2 U42 ( .A(n23), .Y(sum[1]) );
  NAND2X1 U43 ( .A(a[2]), .B(b[2]), .Y(n73) );
  INVX2 U44 ( .A(n35), .Y(n30) );
  OAI21X1 U45 ( .A(n24), .B(n25), .C(n31), .Y(n28) );
  INVX2 U46 ( .A(a[1]), .Y(n25) );
  NAND2X1 U47 ( .A(n24), .B(n25), .Y(n27) );
  NAND2X1 U48 ( .A(n56), .B(n32), .Y(n26) );
  NAND3X1 U49 ( .A(n28), .B(n7), .C(n26), .Y(n29) );
  XOR2X1 U50 ( .A(n30), .B(n29), .Y(n39) );
  NAND2X1 U51 ( .A(n1), .B(n8), .Y(n38) );
  NAND2X1 U52 ( .A(n56), .B(n31), .Y(n43) );
  NAND2X1 U53 ( .A(n56), .B(n32), .Y(n42) );
  NAND2X1 U54 ( .A(n43), .B(n42), .Y(n33) );
  NAND3X1 U55 ( .A(n30), .B(n1), .C(cin), .Y(n36) );
  INVX2 U56 ( .A(n41), .Y(n72) );
  INVX2 U57 ( .A(a[3]), .Y(n60) );
  XOR2X1 U58 ( .A(n60), .B(b[3]), .Y(n45) );
  NAND3X1 U59 ( .A(n43), .B(n6), .C(n42), .Y(n69) );
  NAND3X1 U60 ( .A(n44), .B(n5), .C(n69), .Y(n55) );
  NAND2X1 U61 ( .A(n45), .B(n10), .Y(n51) );
  INVX2 U62 ( .A(b[3]), .Y(n59) );
  NOR2X1 U63 ( .A(n59), .B(n10), .Y(n49) );
  OAI21X1 U64 ( .A(b[3]), .B(n5), .C(n60), .Y(n48) );
  INVX2 U65 ( .A(n73), .Y(n62) );
  AOI21X1 U66 ( .A(n62), .B(b[3]), .C(n60), .Y(n46) );
  OAI21X1 U67 ( .A(b[3]), .B(n10), .C(n46), .Y(n47) );
  OAI21X1 U68 ( .A(n49), .B(n48), .C(n47), .Y(n50) );
  OAI21X1 U69 ( .A(n51), .B(n69), .C(n50), .Y(n52) );
  AOI21X1 U70 ( .A(n72), .B(n53), .C(n52), .Y(n54) );
  NOR2X1 U71 ( .A(n58), .B(n57), .Y(n65) );
  NAND2X1 U72 ( .A(n60), .B(n59), .Y(n68) );
  NAND3X1 U73 ( .A(n10), .B(n68), .C(n27), .Y(n64) );
  NAND2X1 U74 ( .A(b[3]), .B(a[3]), .Y(n75) );
  INVX2 U75 ( .A(n75), .Y(n61) );
  AOI21X1 U76 ( .A(n62), .B(n68), .C(n61), .Y(n63) );
  OAI21X1 U77 ( .A(n65), .B(n64), .C(n63), .Y(gg) );
  NAND3X1 U78 ( .A(n27), .B(n10), .C(n68), .Y(n66) );
  NOR2X1 U79 ( .A(n67), .B(n66), .Y(pg) );
  INVX2 U80 ( .A(n68), .Y(n77) );
  INVX2 U81 ( .A(n69), .Y(n71) );
  OAI21X1 U82 ( .A(n72), .B(n71), .C(n10), .Y(n74) );
  AND2X2 U83 ( .A(n74), .B(n5), .Y(n76) );
  OAI21X1 U84 ( .A(n77), .B(n76), .C(n75), .Y(cout) );
endmodule


module cla_16bit_2 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n7, n8, n9, n10, n11, n12, n13, cout, n15, n16, n17,
         n18, n19;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  NOR2X1 U5 ( .A(n19), .B(n18), .Y(pg) );
  NAND2X1 U6 ( .A(p[3]), .B(n4), .Y(n18) );
  NAND2X1 U7 ( .A(n3), .B(p[0]), .Y(n19) );
  cla_4bit_11 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_10 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n17), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_9 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n16), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_8 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n15), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  INVX2 U1 ( .A(g[1]), .Y(n8) );
  AOI21X1 U2 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n1) );
  INVX2 U3 ( .A(n1), .Y(n17) );
  INVX1 U4 ( .A(n15), .Y(n2) );
  INVX1 U8 ( .A(n9), .Y(n3) );
  INVX4 U9 ( .A(n13), .Y(n15) );
  INVX1 U10 ( .A(n17), .Y(n10) );
  BUFX2 U11 ( .A(p[2]), .Y(n4) );
  INVX2 U12 ( .A(p[1]), .Y(n9) );
  OAI21X1 U13 ( .A(n10), .B(n9), .C(n8), .Y(n7) );
  AOI21X1 U14 ( .A(n7), .B(p[2]), .C(g[2]), .Y(n13) );
  OAI21X1 U15 ( .A(n10), .B(n9), .C(n8), .Y(n16) );
  INVX2 U16 ( .A(p[3]), .Y(n12) );
  INVX2 U17 ( .A(g[3]), .Y(n11) );
  OAI21X1 U18 ( .A(n2), .B(n12), .C(n11), .Y(cout) );
endmodule


module adder_1bit_4 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2, n3, n4;

  XNOR2X1 U1 ( .A(carry_in), .B(n4), .Y(sum) );
  INVX2 U2 ( .A(a), .Y(n3) );
  INVX2 U3 ( .A(b), .Y(n2) );
  XOR2X1 U4 ( .A(n3), .B(b), .Y(n4) );
  INVX2 U5 ( .A(carry_in), .Y(n1) );
  OAI22X1 U6 ( .A(n3), .B(n2), .C(n4), .D(n1), .Y(carry_out) );
endmodule


module adder_1bit_3 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2, n3, n4;

  XNOR2X1 U1 ( .A(carry_in), .B(n4), .Y(sum) );
  INVX2 U2 ( .A(a), .Y(n2) );
  XOR2X1 U3 ( .A(n2), .B(b), .Y(n4) );
  INVX2 U4 ( .A(carry_in), .Y(n3) );
  INVX2 U5 ( .A(b), .Y(n1) );
  OAI22X1 U6 ( .A(n4), .B(n3), .C(n2), .D(n1), .Y(carry_out) );
endmodule


module cla_4bit_7 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n17, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35;

  OR2X2 U3 ( .A(b[0]), .B(a[0]), .Y(n33) );
  NOR2X1 U20 ( .A(n35), .B(n34), .Y(pg) );
  NAND2X1 U22 ( .A(n32), .B(n31), .Y(n35) );
  XNOR2X1 U1 ( .A(n1), .B(n28), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(n21), .B(b[3]), .Y(n1) );
  XNOR2X1 U4 ( .A(n5), .B(n2), .Y(sum[1]) );
  OR2X2 U5 ( .A(n9), .B(n3), .Y(n2) );
  OR2X2 U6 ( .A(a[2]), .B(b[2]), .Y(n31) );
  OR2X2 U7 ( .A(a[1]), .B(b[1]), .Y(n32) );
  AND2X2 U8 ( .A(b[1]), .B(a[1]), .Y(n3) );
  XOR2X1 U9 ( .A(b[0]), .B(a[0]), .Y(n4) );
  XOR2X1 U10 ( .A(cin), .B(n4), .Y(sum[0]) );
  NAND2X1 U11 ( .A(cin), .B(n33), .Y(n8) );
  NAND2X1 U12 ( .A(b[0]), .B(a[0]), .Y(n6) );
  NAND2X1 U13 ( .A(n8), .B(n6), .Y(n5) );
  INVX2 U14 ( .A(n32), .Y(n9) );
  NAND2X1 U15 ( .A(b[2]), .B(a[2]), .Y(n23) );
  NAND2X1 U16 ( .A(n31), .B(n23), .Y(n11) );
  INVX2 U17 ( .A(n6), .Y(n7) );
  OAI21X1 U18 ( .A(n3), .B(n7), .C(n32), .Y(n22) );
  OAI21X1 U19 ( .A(n9), .B(n8), .C(n22), .Y(n10) );
  INVX2 U21 ( .A(n10), .Y(n12) );
  XOR2X1 U23 ( .A(n11), .B(n12), .Y(sum[2]) );
  INVX2 U24 ( .A(a[3]), .Y(n21) );
  INVX2 U25 ( .A(n31), .Y(n13) );
  OAI21X1 U26 ( .A(n13), .B(n12), .C(n23), .Y(n14) );
  INVX2 U27 ( .A(n14), .Y(n28) );
  INVX2 U28 ( .A(b[3]), .Y(n17) );
  NAND2X1 U29 ( .A(n21), .B(n17), .Y(n30) );
  INVX2 U30 ( .A(n30), .Y(n29) );
  INVX2 U31 ( .A(n22), .Y(n25) );
  INVX2 U32 ( .A(n23), .Y(n24) );
  AOI21X1 U33 ( .A(n25), .B(n31), .C(n24), .Y(n26) );
  NAND2X1 U34 ( .A(b[3]), .B(a[3]), .Y(n27) );
  OAI21X1 U35 ( .A(n29), .B(n26), .C(n27), .Y(gg) );
  OAI21X1 U36 ( .A(n29), .B(n28), .C(n27), .Y(cout) );
  NAND2X1 U37 ( .A(n33), .B(n30), .Y(n34) );
endmodule


module cla_4bit_6 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46;

  BUFX2 U1 ( .A(a[3]), .Y(n1) );
  BUFX2 U2 ( .A(a[0]), .Y(n2) );
  AND2X2 U3 ( .A(n10), .B(n4), .Y(n3) );
  NAND2X1 U4 ( .A(n13), .B(n12), .Y(n4) );
  NAND2X1 U5 ( .A(n13), .B(n12), .Y(n5) );
  INVX2 U6 ( .A(a[1]), .Y(n12) );
  BUFX2 U7 ( .A(n42), .Y(n6) );
  OAI21X1 U8 ( .A(n9), .B(n17), .C(n5), .Y(n7) );
  INVX1 U9 ( .A(n37), .Y(n25) );
  INVX1 U10 ( .A(n1), .Y(n8) );
  OR2X2 U11 ( .A(a[3]), .B(b[3]), .Y(n40) );
  XNOR2X1 U12 ( .A(n42), .B(n18), .Y(sum[2]) );
  OR2X2 U13 ( .A(a[0]), .B(b[0]), .Y(n36) );
  AND2X2 U14 ( .A(b[0]), .B(a[0]), .Y(n9) );
  AND2X2 U15 ( .A(cin), .B(n36), .Y(n10) );
  XNOR2X1 U16 ( .A(cin), .B(n11), .Y(sum[0]) );
  XNOR2X1 U17 ( .A(b[0]), .B(n2), .Y(n11) );
  INVX1 U18 ( .A(n40), .Y(n46) );
  NAND2X1 U19 ( .A(b[1]), .B(a[1]), .Y(n16) );
  INVX2 U20 ( .A(b[1]), .Y(n13) );
  NAND2X1 U21 ( .A(n13), .B(n12), .Y(n35) );
  NAND2X1 U22 ( .A(n16), .B(n4), .Y(n15) );
  NOR2X1 U23 ( .A(n9), .B(n10), .Y(n14) );
  XOR2X1 U24 ( .A(n15), .B(n14), .Y(sum[1]) );
  INVX2 U25 ( .A(a[2]), .Y(n23) );
  INVX2 U26 ( .A(b[2]), .Y(n22) );
  NAND2X1 U27 ( .A(n23), .B(n22), .Y(n43) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n24) );
  NAND2X1 U29 ( .A(n43), .B(n24), .Y(n18) );
  NAND2X1 U30 ( .A(n10), .B(n4), .Y(n20) );
  INVX2 U31 ( .A(n16), .Y(n17) );
  OAI21X1 U32 ( .A(n9), .B(n17), .C(n5), .Y(n33) );
  NAND2X1 U33 ( .A(n20), .B(n33), .Y(n42) );
  XOR2X1 U34 ( .A(n8), .B(b[3]), .Y(n30) );
  INVX2 U35 ( .A(n24), .Y(n41) );
  NOR2X1 U36 ( .A(n41), .B(n3), .Y(n19) );
  INVX2 U37 ( .A(n43), .Y(n21) );
  AOI21X1 U38 ( .A(n19), .B(n7), .C(n21), .Y(n29) );
  NOR2X1 U39 ( .A(n21), .B(n20), .Y(n27) );
  NAND2X1 U40 ( .A(n23), .B(n22), .Y(n37) );
  OAI21X1 U41 ( .A(n25), .B(n7), .C(n24), .Y(n26) );
  OAI21X1 U42 ( .A(n27), .B(n26), .C(n30), .Y(n28) );
  OAI21X1 U43 ( .A(n30), .B(n29), .C(n28), .Y(sum[3]) );
  NAND2X1 U44 ( .A(n40), .B(n37), .Y(n34) );
  NAND2X1 U45 ( .A(a[3]), .B(b[3]), .Y(n44) );
  INVX2 U46 ( .A(n44), .Y(n31) );
  AOI21X1 U47 ( .A(n40), .B(n41), .C(n31), .Y(n32) );
  OAI21X1 U48 ( .A(n34), .B(n33), .C(n32), .Y(gg) );
  NAND2X1 U49 ( .A(n36), .B(n35), .Y(n39) );
  OAI21X1 U50 ( .A(b[3]), .B(n1), .C(n37), .Y(n38) );
  NOR2X1 U51 ( .A(n39), .B(n38), .Y(pg) );
  AOI21X1 U52 ( .A(n43), .B(n6), .C(n41), .Y(n45) );
  OAI21X1 U53 ( .A(n46), .B(n45), .C(n44), .Y(cout) );
endmodule


module cla_4bit_5 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66;

  INVX2 U1 ( .A(n6), .Y(n1) );
  INVX2 U2 ( .A(n6), .Y(n7) );
  INVX1 U3 ( .A(n24), .Y(n25) );
  INVX2 U4 ( .A(a[2]), .Y(n50) );
  INVX2 U5 ( .A(n41), .Y(n8) );
  INVX2 U6 ( .A(a[0]), .Y(n12) );
  AND2X2 U7 ( .A(n30), .B(n56), .Y(n2) );
  INVX1 U8 ( .A(b[1]), .Y(n32) );
  AND2X1 U9 ( .A(n7), .B(n2), .Y(n9) );
  BUFX2 U10 ( .A(n62), .Y(n3) );
  BUFX2 U11 ( .A(n40), .Y(n4) );
  AND2X2 U12 ( .A(n7), .B(n2), .Y(n5) );
  INVX2 U13 ( .A(cin), .Y(n6) );
  INVX2 U14 ( .A(a[3]), .Y(n14) );
  NAND3X1 U15 ( .A(n8), .B(n55), .C(n60), .Y(n43) );
  INVX1 U16 ( .A(n14), .Y(n15) );
  INVX2 U17 ( .A(n12), .Y(n13) );
  INVX1 U18 ( .A(n8), .Y(n10) );
  INVX1 U19 ( .A(n36), .Y(n11) );
  NAND2X1 U20 ( .A(n1), .B(n2), .Y(n39) );
  INVX2 U21 ( .A(n31), .Y(n17) );
  INVX1 U22 ( .A(n12), .Y(n16) );
  NAND2X1 U23 ( .A(n32), .B(n18), .Y(n19) );
  NAND2X1 U24 ( .A(n19), .B(n33), .Y(n34) );
  INVX1 U25 ( .A(b[0]), .Y(n18) );
  NAND2X1 U26 ( .A(n49), .B(n50), .Y(n20) );
  NAND2X1 U27 ( .A(n59), .B(n20), .Y(n54) );
  AND2X1 U28 ( .A(n63), .B(n60), .Y(n21) );
  XOR2X1 U29 ( .A(n62), .B(n21), .Y(sum[2]) );
  XNOR2X1 U30 ( .A(n1), .B(n22), .Y(sum[0]) );
  XNOR2X1 U31 ( .A(b[0]), .B(n16), .Y(n22) );
  INVX1 U32 ( .A(n59), .Y(n66) );
  AND2X1 U33 ( .A(a[2]), .B(b[2]), .Y(n51) );
  INVX1 U34 ( .A(b[2]), .Y(n49) );
  AND2X1 U35 ( .A(n52), .B(n64), .Y(n53) );
  INVX2 U36 ( .A(a[1]), .Y(n31) );
  NAND2X1 U37 ( .A(n32), .B(n31), .Y(n56) );
  NAND2X1 U38 ( .A(n17), .B(b[1]), .Y(n35) );
  NAND2X1 U39 ( .A(n56), .B(n35), .Y(n24) );
  NAND2X1 U40 ( .A(n13), .B(b[0]), .Y(n23) );
  NAND2X1 U41 ( .A(n24), .B(n23), .Y(n27) );
  NAND2X1 U42 ( .A(n12), .B(n18), .Y(n30) );
  OAI22X1 U43 ( .A(n27), .B(n30), .C(n24), .D(n23), .Y(n29) );
  NAND3X1 U44 ( .A(n25), .B(n7), .C(n30), .Y(n26) );
  OAI21X1 U45 ( .A(n1), .B(n27), .C(n26), .Y(n28) );
  NOR2X1 U46 ( .A(n29), .B(n28), .Y(sum[1]) );
  NAND2X1 U47 ( .A(n50), .B(n49), .Y(n63) );
  NAND2X1 U48 ( .A(a[2]), .B(b[2]), .Y(n60) );
  OAI21X1 U49 ( .A(n18), .B(n32), .C(n31), .Y(n33) );
  INVX2 U50 ( .A(n34), .Y(n47) );
  NAND2X1 U51 ( .A(n35), .B(n12), .Y(n46) );
  NAND2X1 U52 ( .A(n47), .B(n46), .Y(n40) );
  NAND2X1 U53 ( .A(n4), .B(n39), .Y(n62) );
  XOR2X1 U54 ( .A(n14), .B(b[3]), .Y(n41) );
  INVX2 U55 ( .A(n63), .Y(n36) );
  NOR2X1 U56 ( .A(n36), .B(n55), .Y(n37) );
  AOI22X1 U57 ( .A(n37), .B(n41), .C(n8), .D(n36), .Y(n38) );
  OAI21X1 U58 ( .A(n8), .B(n60), .C(n38), .Y(n45) );
  NAND3X1 U59 ( .A(n10), .B(n11), .C(n9), .Y(n42) );
  OAI21X1 U60 ( .A(n5), .B(n43), .C(n42), .Y(n44) );
  OR2X2 U61 ( .A(n44), .B(n45), .Y(sum[3]) );
  NAND2X1 U62 ( .A(n47), .B(n46), .Y(n55) );
  INVX2 U63 ( .A(b[3]), .Y(n48) );
  NAND2X1 U64 ( .A(n14), .B(n48), .Y(n59) );
  OAI21X1 U65 ( .A(a[3]), .B(b[3]), .C(n51), .Y(n52) );
  NAND2X1 U66 ( .A(a[3]), .B(b[3]), .Y(n64) );
  OAI21X1 U67 ( .A(n40), .B(n54), .C(n53), .Y(gg) );
  OAI22X1 U68 ( .A(b[0]), .B(n13), .C(b[2]), .D(a[2]), .Y(n58) );
  OAI21X1 U69 ( .A(b[3]), .B(n15), .C(n56), .Y(n57) );
  NOR2X1 U70 ( .A(n58), .B(n57), .Y(pg) );
  INVX2 U71 ( .A(n60), .Y(n61) );
  AOI21X1 U72 ( .A(n11), .B(n3), .C(n61), .Y(n65) );
  OAI21X1 U73 ( .A(n66), .B(n65), .C(n64), .Y(cout) );
endmodule


module cla_4bit_4 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71;

  NOR2X1 U1 ( .A(n66), .B(n10), .Y(n1) );
  BUFX2 U2 ( .A(a[2]), .Y(n2) );
  BUFX2 U3 ( .A(a[2]), .Y(n9) );
  AND2X1 U4 ( .A(n43), .B(n16), .Y(n3) );
  INVX1 U5 ( .A(b[3]), .Y(n51) );
  INVX1 U6 ( .A(n52), .Y(n54) );
  AND2X2 U7 ( .A(n51), .B(n4), .Y(n61) );
  INVX1 U8 ( .A(a[3]), .Y(n4) );
  NAND2X1 U9 ( .A(n51), .B(n52), .Y(n53) );
  NAND3X1 U10 ( .A(n46), .B(n44), .C(n45), .Y(sum[3]) );
  XOR2X1 U11 ( .A(n29), .B(n1), .Y(sum[2]) );
  INVX1 U12 ( .A(n67), .Y(n5) );
  INVX1 U13 ( .A(n63), .Y(n32) );
  BUFX2 U14 ( .A(cin), .Y(n14) );
  BUFX4 U15 ( .A(a[3]), .Y(n6) );
  BUFX2 U16 ( .A(a[3]), .Y(n17) );
  NAND2X1 U17 ( .A(n42), .B(n3), .Y(n44) );
  AND2X1 U18 ( .A(n11), .B(b[3]), .Y(n7) );
  OR2X2 U19 ( .A(n17), .B(b[3]), .Y(n62) );
  INVX1 U20 ( .A(n10), .Y(n8) );
  INVX2 U21 ( .A(n67), .Y(n10) );
  INVX1 U22 ( .A(n67), .Y(n35) );
  INVX1 U23 ( .A(n6), .Y(n11) );
  INVX1 U24 ( .A(n6), .Y(n12) );
  NAND2X1 U25 ( .A(n35), .B(n7), .Y(n36) );
  BUFX2 U26 ( .A(n18), .Y(n13) );
  OR2X2 U27 ( .A(b[2]), .B(a[2]), .Y(n67) );
  XNOR2X1 U28 ( .A(n14), .B(n15), .Y(sum[0]) );
  XNOR2X1 U29 ( .A(b[0]), .B(a[0]), .Y(n15) );
  XNOR2X1 U30 ( .A(n12), .B(b[3]), .Y(n16) );
  OR2X2 U31 ( .A(a[1]), .B(b[1]), .Y(n58) );
  INVX1 U32 ( .A(n62), .Y(n71) );
  INVX1 U33 ( .A(cin), .Y(n18) );
  INVX2 U34 ( .A(cin), .Y(n64) );
  NAND2X1 U35 ( .A(a[1]), .B(b[1]), .Y(n47) );
  NAND2X1 U36 ( .A(n47), .B(n58), .Y(n20) );
  INVX2 U37 ( .A(a[0]), .Y(n49) );
  INVX2 U38 ( .A(b[0]), .Y(n48) );
  NAND2X1 U39 ( .A(n49), .B(n48), .Y(n25) );
  INVX2 U40 ( .A(n20), .Y(n19) );
  NAND2X1 U41 ( .A(b[0]), .B(a[0]), .Y(n26) );
  AOI22X1 U42 ( .A(n20), .B(n25), .C(n19), .D(n26), .Y(n24) );
  NAND2X1 U43 ( .A(n19), .B(n25), .Y(n22) );
  NAND3X1 U44 ( .A(n20), .B(n26), .C(n64), .Y(n21) );
  OAI21X1 U45 ( .A(n18), .B(n22), .C(n21), .Y(n23) );
  NOR2X1 U46 ( .A(n24), .B(n23), .Y(sum[1]) );
  NAND2X1 U47 ( .A(n25), .B(n58), .Y(n65) );
  INVX2 U48 ( .A(n47), .Y(n28) );
  INVX2 U49 ( .A(n26), .Y(n27) );
  OAI21X1 U50 ( .A(n28), .B(n27), .C(n58), .Y(n63) );
  OAI21X1 U51 ( .A(n64), .B(n65), .C(n63), .Y(n29) );
  NAND2X1 U52 ( .A(a[2]), .B(b[2]), .Y(n40) );
  INVX2 U53 ( .A(n40), .Y(n66) );
  NOR2X1 U54 ( .A(n64), .B(n65), .Y(n31) );
  NOR2X1 U55 ( .A(n10), .B(n16), .Y(n30) );
  NAND2X1 U56 ( .A(n31), .B(n30), .Y(n46) );
  NAND2X1 U57 ( .A(b[3]), .B(n17), .Y(n69) );
  OAI22X1 U58 ( .A(n10), .B(n62), .C(n35), .D(n69), .Y(n33) );
  AND2X2 U59 ( .A(n33), .B(n32), .Y(n39) );
  NAND3X1 U60 ( .A(n6), .B(n51), .C(n5), .Y(n34) );
  OAI21X1 U61 ( .A(n69), .B(n40), .C(n34), .Y(n38) );
  OAI21X1 U62 ( .A(n62), .B(n40), .C(n36), .Y(n37) );
  NOR3X1 U63 ( .A(n38), .B(n37), .C(n39), .Y(n45) );
  AND2X2 U64 ( .A(n40), .B(n63), .Y(n43) );
  INVX2 U65 ( .A(n65), .Y(n41) );
  NAND2X1 U66 ( .A(n41), .B(n14), .Y(n42) );
  OAI21X1 U67 ( .A(n2), .B(b[2]), .C(n58), .Y(n57) );
  OAI21X1 U68 ( .A(n49), .B(n48), .C(n47), .Y(n50) );
  OAI21X1 U69 ( .A(b[3]), .B(n6), .C(n50), .Y(n56) );
  NAND2X1 U70 ( .A(a[2]), .B(b[2]), .Y(n52) );
  AOI22X1 U71 ( .A(n54), .B(b[3]), .C(n6), .D(n53), .Y(n55) );
  OAI21X1 U72 ( .A(n56), .B(n57), .C(n55), .Y(gg) );
  NOR2X1 U73 ( .A(b[0]), .B(a[0]), .Y(n60) );
  OAI21X1 U74 ( .A(b[2]), .B(n9), .C(n58), .Y(n59) );
  NOR3X1 U75 ( .A(n60), .B(n61), .C(n59), .Y(pg) );
  OAI21X1 U76 ( .A(n65), .B(n13), .C(n63), .Y(n68) );
  AOI21X1 U77 ( .A(n68), .B(n8), .C(n66), .Y(n70) );
  OAI21X1 U78 ( .A(n71), .B(n70), .C(n69), .Y(cout) );
endmodule


module cla_16bit_1 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, cout, n21, n22, n23;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  NOR2X1 U5 ( .A(n23), .B(n22), .Y(pg) );
  NAND2X1 U6 ( .A(n2), .B(n3), .Y(n22) );
  NAND2X1 U7 ( .A(n4), .B(p[0]), .Y(n23) );
  cla_4bit_7 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_6 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n21), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_5 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n17), .pg(p[2]), .gg(n18), 
        .sum(sum[11:8]) );
  cla_4bit_4 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n19), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  INVX1 U1 ( .A(p[2]), .Y(n1) );
  INVX1 U2 ( .A(p[2]), .Y(n14) );
  BUFX2 U3 ( .A(p[3]), .Y(n2) );
  INVX1 U4 ( .A(n14), .Y(n3) );
  BUFX2 U8 ( .A(p[1]), .Y(n4) );
  AND2X2 U9 ( .A(n12), .B(n11), .Y(n7) );
  INVX2 U10 ( .A(cin), .Y(n10) );
  INVX2 U11 ( .A(p[0]), .Y(n9) );
  INVX2 U12 ( .A(g[0]), .Y(n8) );
  OAI21X1 U13 ( .A(n10), .B(n9), .C(n8), .Y(n21) );
  NAND2X1 U14 ( .A(p[1]), .B(n21), .Y(n11) );
  INVX2 U15 ( .A(g[1]), .Y(n12) );
  INVX2 U16 ( .A(n18), .Y(n13) );
  OAI21X1 U17 ( .A(n7), .B(n1), .C(n13), .Y(n19) );
  NAND2X1 U18 ( .A(n11), .B(n12), .Y(n17) );
  OAI21X1 U19 ( .A(n7), .B(n14), .C(n13), .Y(n15) );
  AOI21X1 U20 ( .A(n15), .B(p[3]), .C(g[3]), .Y(n16) );
  INVX2 U21 ( .A(n16), .Y(cout) );
endmodule


module adder_1bit_2 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2, n3, n4, n5;

  INVX2 U1 ( .A(carry_in), .Y(n3) );
  XOR2X1 U2 ( .A(n3), .B(n1), .Y(sum) );
  XNOR2X1 U3 ( .A(b), .B(a), .Y(n1) );
  INVX2 U4 ( .A(a), .Y(n5) );
  INVX2 U5 ( .A(b), .Y(n4) );
  NAND2X1 U6 ( .A(a), .B(b), .Y(n2) );
  AOI22X1 U7 ( .A(n5), .B(n4), .C(n3), .D(n2), .Y(carry_out) );
endmodule


module adder_1bit_1 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2, n3, n4, n5;

  XOR2X1 U1 ( .A(n3), .B(n1), .Y(sum) );
  XNOR2X1 U2 ( .A(b), .B(a), .Y(n1) );
  INVX2 U3 ( .A(a), .Y(n5) );
  INVX2 U4 ( .A(b), .Y(n4) );
  INVX2 U5 ( .A(carry_in), .Y(n3) );
  NAND2X1 U6 ( .A(a), .B(b), .Y(n2) );
  AOI22X1 U7 ( .A(n5), .B(n4), .C(n2), .D(n3), .Y(carry_out) );
endmodule


module adder_1bit_0 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2, n3, n4;

  XNOR2X1 U1 ( .A(carry_in), .B(n4), .Y(sum) );
  INVX1 U2 ( .A(carry_in), .Y(n3) );
  INVX2 U3 ( .A(a), .Y(n2) );
  XOR2X1 U4 ( .A(n2), .B(b), .Y(n4) );
  INVX2 U5 ( .A(b), .Y(n1) );
  OAI22X1 U6 ( .A(n4), .B(n3), .C(n2), .D(n1), .Y(carry_out) );
endmodule


module cla_4bit_3 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n9, n12, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40;

  AND2X2 U1 ( .A(b[0]), .B(a[0]), .Y(n36) );
  XOR2X1 U12 ( .A(b[3]), .B(a[3]), .Y(n40) );
  XNOR2X1 U14 ( .A(a[2]), .B(b[2]), .Y(n39) );
  XOR2X1 U15 ( .A(n38), .B(n37), .Y(sum[1]) );
  XNOR2X1 U17 ( .A(a[1]), .B(b[1]), .Y(n38) );
  OR2X2 U2 ( .A(a[2]), .B(b[2]), .Y(n27) );
  XNOR2X1 U3 ( .A(a[0]), .B(n1), .Y(sum[0]) );
  XNOR2X1 U4 ( .A(cin), .B(b[0]), .Y(n1) );
  INVX2 U5 ( .A(a[1]), .Y(n6) );
  INVX2 U6 ( .A(b[1]), .Y(n5) );
  NAND2X1 U7 ( .A(n6), .B(n5), .Y(n26) );
  INVX2 U8 ( .A(n26), .Y(n12) );
  INVX2 U9 ( .A(b[0]), .Y(n3) );
  INVX2 U10 ( .A(a[0]), .Y(n2) );
  NAND2X1 U11 ( .A(n3), .B(n2), .Y(n24) );
  NAND2X1 U13 ( .A(cin), .B(n24), .Y(n34) );
  INVX2 U16 ( .A(n36), .Y(n4) );
  OAI21X1 U18 ( .A(n6), .B(n5), .C(n4), .Y(n9) );
  NAND2X1 U19 ( .A(n26), .B(n9), .Y(n19) );
  OAI21X1 U20 ( .A(n12), .B(n34), .C(n19), .Y(n14) );
  INVX2 U21 ( .A(n14), .Y(n16) );
  XOR2X1 U22 ( .A(n39), .B(n16), .Y(sum[2]) );
  INVX2 U23 ( .A(n27), .Y(n15) );
  NAND2X1 U24 ( .A(b[2]), .B(a[2]), .Y(n20) );
  OAI21X1 U25 ( .A(n16), .B(n15), .C(n20), .Y(n30) );
  XOR2X1 U26 ( .A(n30), .B(n40), .Y(sum[3]) );
  INVX2 U27 ( .A(a[3]), .Y(n18) );
  INVX2 U28 ( .A(b[3]), .Y(n17) );
  NAND2X1 U29 ( .A(n18), .B(n17), .Y(n25) );
  INVX2 U30 ( .A(n25), .Y(n32) );
  INVX2 U31 ( .A(n19), .Y(n22) );
  INVX2 U32 ( .A(n20), .Y(n21) );
  AOI21X1 U33 ( .A(n22), .B(n27), .C(n21), .Y(n23) );
  NAND2X1 U34 ( .A(b[3]), .B(a[3]), .Y(n31) );
  OAI21X1 U35 ( .A(n32), .B(n23), .C(n31), .Y(gg) );
  NAND2X1 U36 ( .A(n25), .B(n24), .Y(n29) );
  NAND2X1 U37 ( .A(n27), .B(n26), .Y(n28) );
  NOR2X1 U38 ( .A(n29), .B(n28), .Y(pg) );
  INVX2 U39 ( .A(n30), .Y(n33) );
  OAI21X1 U40 ( .A(n33), .B(n32), .C(n31), .Y(cout) );
  INVX2 U41 ( .A(n34), .Y(n35) );
  NOR2X1 U42 ( .A(n36), .B(n35), .Y(n37) );
endmodule


module cla_4bit_2 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37;

  OR2X1 U1 ( .A(a[3]), .B(b[3]), .Y(n33) );
  BUFX2 U2 ( .A(a[2]), .Y(n1) );
  INVX1 U3 ( .A(a[3]), .Y(n24) );
  INVX1 U4 ( .A(n19), .Y(n2) );
  INVX1 U5 ( .A(n24), .Y(n3) );
  BUFX2 U6 ( .A(n24), .Y(n4) );
  INVX1 U7 ( .A(n32), .Y(n19) );
  AND2X2 U8 ( .A(n4), .B(n23), .Y(n5) );
  OR2X2 U9 ( .A(a[2]), .B(b[2]), .Y(n32) );
  OR2X2 U10 ( .A(b[1]), .B(a[1]), .Y(n30) );
  XOR2X1 U11 ( .A(b[0]), .B(a[0]), .Y(n6) );
  XOR2X1 U12 ( .A(cin), .B(n6), .Y(sum[0]) );
  INVX2 U13 ( .A(a[0]), .Y(n8) );
  INVX2 U14 ( .A(b[0]), .Y(n7) );
  NAND2X1 U15 ( .A(n8), .B(n7), .Y(n31) );
  NAND2X1 U16 ( .A(cin), .B(n31), .Y(n15) );
  NAND2X1 U17 ( .A(b[0]), .B(a[0]), .Y(n11) );
  NAND2X1 U18 ( .A(n15), .B(n11), .Y(n10) );
  NAND2X1 U19 ( .A(a[1]), .B(b[1]), .Y(n12) );
  NAND2X1 U20 ( .A(n12), .B(n30), .Y(n9) );
  XNOR2X1 U21 ( .A(n10), .B(n9), .Y(sum[1]) );
  NAND2X1 U22 ( .A(b[2]), .B(n1), .Y(n26) );
  NAND2X1 U23 ( .A(n32), .B(n26), .Y(n18) );
  INVX2 U24 ( .A(n30), .Y(n16) );
  INVX2 U25 ( .A(n11), .Y(n14) );
  INVX2 U26 ( .A(n12), .Y(n13) );
  OAI21X1 U27 ( .A(n14), .B(n13), .C(n30), .Y(n25) );
  OAI21X1 U28 ( .A(n16), .B(n15), .C(n25), .Y(n17) );
  INVX2 U29 ( .A(n17), .Y(n20) );
  XOR2X1 U30 ( .A(n18), .B(n20), .Y(sum[2]) );
  XOR2X1 U31 ( .A(n24), .B(b[3]), .Y(n22) );
  OAI21X1 U32 ( .A(n20), .B(n19), .C(n26), .Y(n21) );
  INVX2 U33 ( .A(n21), .Y(n37) );
  XOR2X1 U34 ( .A(n22), .B(n37), .Y(sum[3]) );
  INVX2 U35 ( .A(b[3]), .Y(n23) );
  INVX2 U36 ( .A(n25), .Y(n28) );
  INVX2 U37 ( .A(n26), .Y(n27) );
  AOI21X1 U38 ( .A(n28), .B(n2), .C(n27), .Y(n29) );
  NAND2X1 U39 ( .A(b[3]), .B(n3), .Y(n36) );
  OAI21X1 U40 ( .A(n5), .B(n29), .C(n36), .Y(gg) );
  NAND2X1 U41 ( .A(n31), .B(n30), .Y(n35) );
  NAND2X1 U42 ( .A(n32), .B(n33), .Y(n34) );
  NOR2X1 U43 ( .A(n35), .B(n34), .Y(pg) );
  OAI21X1 U44 ( .A(n37), .B(n5), .C(n36), .Y(cout) );
endmodule


module cla_4bit_1 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41;

  INVX1 U1 ( .A(n16), .Y(n1) );
  INVX2 U2 ( .A(n10), .Y(n25) );
  INVX2 U3 ( .A(n9), .Y(n2) );
  INVX1 U4 ( .A(n25), .Y(n3) );
  BUFX2 U5 ( .A(cin), .Y(n4) );
  BUFX2 U6 ( .A(n6), .Y(n5) );
  INVX2 U7 ( .A(n33), .Y(n7) );
  AOI21X1 U8 ( .A(n26), .B(n34), .C(n7), .Y(n6) );
  INVX1 U9 ( .A(n26), .Y(n28) );
  BUFX2 U10 ( .A(a[0]), .Y(n8) );
  INVX1 U11 ( .A(n31), .Y(n9) );
  NAND2X1 U12 ( .A(n17), .B(n16), .Y(n10) );
  INVX1 U13 ( .A(a[3]), .Y(n31) );
  BUFX2 U14 ( .A(a[2]), .Y(n11) );
  AND2X1 U15 ( .A(n2), .B(n30), .Y(n12) );
  OR2X2 U16 ( .A(a[2]), .B(b[2]), .Y(n34) );
  XOR2X1 U17 ( .A(b[0]), .B(n8), .Y(n13) );
  XOR2X1 U18 ( .A(n4), .B(n13), .Y(sum[0]) );
  INVX2 U19 ( .A(a[0]), .Y(n15) );
  INVX2 U20 ( .A(b[0]), .Y(n14) );
  NAND2X1 U21 ( .A(n15), .B(n14), .Y(n38) );
  NAND2X1 U22 ( .A(n38), .B(cin), .Y(n24) );
  NAND2X1 U23 ( .A(b[0]), .B(n8), .Y(n20) );
  NAND2X1 U24 ( .A(n20), .B(n24), .Y(n19) );
  NAND2X1 U25 ( .A(n1), .B(b[1]), .Y(n21) );
  INVX2 U26 ( .A(b[1]), .Y(n17) );
  INVX2 U27 ( .A(a[1]), .Y(n16) );
  NAND2X1 U28 ( .A(n17), .B(n16), .Y(n37) );
  NAND2X1 U29 ( .A(n21), .B(n10), .Y(n18) );
  XNOR2X1 U30 ( .A(n19), .B(n18), .Y(sum[1]) );
  NAND2X1 U31 ( .A(b[2]), .B(n11), .Y(n33) );
  NAND2X1 U32 ( .A(n34), .B(n33), .Y(n27) );
  INVX2 U33 ( .A(n20), .Y(n23) );
  INVX2 U34 ( .A(n21), .Y(n22) );
  OAI21X1 U35 ( .A(n23), .B(n22), .C(n3), .Y(n32) );
  OAI21X1 U36 ( .A(n25), .B(n24), .C(n32), .Y(n26) );
  XOR2X1 U37 ( .A(n28), .B(n27), .Y(sum[2]) );
  XOR2X1 U38 ( .A(n31), .B(b[3]), .Y(n29) );
  XOR2X1 U39 ( .A(n6), .B(n29), .Y(sum[3]) );
  INVX2 U40 ( .A(b[3]), .Y(n30) );
  INVX2 U41 ( .A(n32), .Y(n35) );
  AOI21X1 U42 ( .A(n35), .B(n34), .C(n7), .Y(n36) );
  NAND2X1 U43 ( .A(b[3]), .B(n9), .Y(n41) );
  OAI21X1 U44 ( .A(n12), .B(n36), .C(n41), .Y(gg) );
  NAND2X1 U45 ( .A(n38), .B(n37), .Y(n40) );
  OAI22X1 U46 ( .A(b[3]), .B(a[3]), .C(b[2]), .D(a[2]), .Y(n39) );
  NOR2X1 U47 ( .A(n40), .B(n39), .Y(pg) );
  OAI21X1 U48 ( .A(n5), .B(n12), .C(n41), .Y(cout) );
endmodule


module cla_4bit_0 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46;

  OAI21X1 U1 ( .A(b[1]), .B(n3), .C(n19), .Y(n1) );
  AND2X2 U2 ( .A(n36), .B(n37), .Y(n2) );
  INVX2 U3 ( .A(n15), .Y(n3) );
  INVX2 U4 ( .A(n13), .Y(n5) );
  XNOR2X1 U5 ( .A(n4), .B(n18), .Y(sum[1]) );
  NAND2X1 U6 ( .A(n5), .B(n17), .Y(n4) );
  XNOR2X1 U7 ( .A(n43), .B(n24), .Y(sum[2]) );
  INVX1 U8 ( .A(n43), .Y(n23) );
  OAI21X1 U9 ( .A(b[0]), .B(a[0]), .C(cin), .Y(n17) );
  OAI21X1 U10 ( .A(b[1]), .B(n3), .C(n19), .Y(n25) );
  BUFX2 U11 ( .A(a[2]), .Y(n6) );
  BUFX2 U12 ( .A(a[0]), .Y(n7) );
  BUFX2 U13 ( .A(cin), .Y(n8) );
  INVX1 U14 ( .A(n23), .Y(n9) );
  INVX1 U15 ( .A(n35), .Y(n10) );
  INVX1 U16 ( .A(a[3]), .Y(n35) );
  XOR2X1 U17 ( .A(n8), .B(n11), .Y(sum[0]) );
  XOR2X1 U18 ( .A(b[0]), .B(n7), .Y(n11) );
  AND2X1 U19 ( .A(n35), .B(n34), .Y(n12) );
  XNOR2X1 U20 ( .A(n44), .B(n27), .Y(n33) );
  OR2X2 U21 ( .A(n6), .B(b[2]), .Y(n44) );
  AND2X2 U22 ( .A(b[0]), .B(n7), .Y(n13) );
  INVX1 U23 ( .A(a[1]), .Y(n15) );
  BUFX2 U24 ( .A(n6), .Y(n14) );
  NAND2X1 U25 ( .A(n3), .B(b[1]), .Y(n20) );
  INVX2 U26 ( .A(b[1]), .Y(n16) );
  NAND2X1 U27 ( .A(n16), .B(n15), .Y(n21) );
  NAND2X1 U28 ( .A(n20), .B(n21), .Y(n18) );
  INVX2 U29 ( .A(n17), .Y(n19) );
  NAND2X1 U30 ( .A(b[2]), .B(n14), .Y(n37) );
  NAND2X1 U31 ( .A(n44), .B(n37), .Y(n24) );
  INVX2 U32 ( .A(n20), .Y(n22) );
  OAI21X1 U33 ( .A(n13), .B(n22), .C(n21), .Y(n36) );
  NAND2X1 U34 ( .A(n1), .B(n36), .Y(n43) );
  XOR2X1 U35 ( .A(n35), .B(b[3]), .Y(n26) );
  INVX2 U36 ( .A(n26), .Y(n27) );
  NAND2X1 U37 ( .A(n2), .B(n27), .Y(n32) );
  INVX2 U38 ( .A(n25), .Y(n30) );
  NAND2X1 U39 ( .A(n2), .B(n26), .Y(n29) );
  NAND3X1 U40 ( .A(n27), .B(n44), .C(n30), .Y(n28) );
  OAI21X1 U41 ( .A(n30), .B(n29), .C(n28), .Y(n31) );
  AOI21X1 U42 ( .A(n33), .B(n32), .C(n31), .Y(sum[3]) );
  INVX2 U43 ( .A(b[3]), .Y(n34) );
  INVX2 U44 ( .A(n36), .Y(n38) );
  INVX2 U45 ( .A(n37), .Y(n42) );
  AOI21X1 U46 ( .A(n38), .B(n44), .C(n42), .Y(n39) );
  NAND2X1 U47 ( .A(b[3]), .B(n10), .Y(n45) );
  OAI21X1 U48 ( .A(n12), .B(n39), .C(n45), .Y(gg) );
  OAI22X1 U49 ( .A(b[0]), .B(a[0]), .C(a[1]), .D(b[1]), .Y(n41) );
  OAI22X1 U50 ( .A(a[3]), .B(b[3]), .C(b[2]), .D(a[2]), .Y(n40) );
  NOR2X1 U51 ( .A(n41), .B(n40), .Y(pg) );
  AOI21X1 U52 ( .A(n44), .B(n9), .C(n42), .Y(n46) );
  OAI21X1 U53 ( .A(n12), .B(n46), .C(n45), .Y(cout) );
endmodule


module cla_16bit_0 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, cout, n20, n21, n22, n23;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  NOR2X1 U5 ( .A(n23), .B(n22), .Y(pg) );
  NAND2X1 U6 ( .A(n7), .B(n4), .Y(n22) );
  NAND2X1 U7 ( .A(n1), .B(p[0]), .Y(n23) );
  cla_4bit_3 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_2 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n21), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_1 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n2), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_0 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n18), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  INVX1 U1 ( .A(n12), .Y(n1) );
  OAI21X1 U2 ( .A(n13), .B(n12), .C(n11), .Y(n2) );
  INVX2 U3 ( .A(p[1]), .Y(n12) );
  INVX1 U4 ( .A(n15), .Y(n16) );
  NAND2X1 U8 ( .A(n3), .B(n17), .Y(cout) );
  INVX1 U9 ( .A(g[3]), .Y(n3) );
  BUFX2 U10 ( .A(p[2]), .Y(n4) );
  BUFX2 U11 ( .A(p[3]), .Y(n7) );
  INVX2 U12 ( .A(cin), .Y(n10) );
  INVX2 U13 ( .A(p[0]), .Y(n9) );
  INVX2 U14 ( .A(g[0]), .Y(n8) );
  OAI21X1 U15 ( .A(n10), .B(n9), .C(n8), .Y(n21) );
  INVX2 U16 ( .A(n21), .Y(n13) );
  INVX2 U17 ( .A(g[1]), .Y(n11) );
  OAI21X1 U18 ( .A(n13), .B(n12), .C(n11), .Y(n20) );
  INVX2 U19 ( .A(g[2]), .Y(n14) );
  NAND2X1 U20 ( .A(n20), .B(p[2]), .Y(n15) );
  NAND2X1 U21 ( .A(n15), .B(n14), .Y(n18) );
  OAI21X1 U22 ( .A(g[2]), .B(n16), .C(p[3]), .Y(n17) );
endmodule


module cla_4bit_112 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44;

  NAND2X1 U26 ( .A(n3), .B(n43), .Y(n44) );
  INVX2 U1 ( .A(b[3]), .Y(n3) );
  BUFX2 U2 ( .A(n8), .Y(n1) );
  BUFX2 U3 ( .A(a[3]), .Y(n2) );
  XOR2X1 U4 ( .A(a[3]), .B(n3), .Y(n12) );
  NOR2X1 U5 ( .A(a[1]), .B(b[1]), .Y(n4) );
  INVX1 U6 ( .A(n34), .Y(n35) );
  BUFX2 U7 ( .A(a[1]), .Y(n5) );
  BUFX2 U8 ( .A(a[2]), .Y(n6) );
  NOR2X1 U9 ( .A(n6), .B(b[2]), .Y(n7) );
  INVX2 U10 ( .A(n20), .Y(n8) );
  NOR2X1 U11 ( .A(a[2]), .B(b[2]), .Y(n9) );
  INVX1 U12 ( .A(n7), .Y(n31) );
  AND2X1 U13 ( .A(n5), .B(b[1]), .Y(n11) );
  OR2X2 U14 ( .A(a[0]), .B(b[0]), .Y(n23) );
  OR2X2 U15 ( .A(a[1]), .B(b[1]), .Y(n18) );
  XNOR2X1 U16 ( .A(n8), .B(n10), .Y(sum[0]) );
  XNOR2X1 U17 ( .A(b[0]), .B(a[0]), .Y(n10) );
  XNOR2X1 U18 ( .A(n28), .B(n12), .Y(sum[3]) );
  INVX2 U19 ( .A(n23), .Y(n13) );
  INVX2 U20 ( .A(cin), .Y(n20) );
  NAND2X1 U21 ( .A(b[0]), .B(a[0]), .Y(n16) );
  OAI21X1 U22 ( .A(n13), .B(n20), .C(n16), .Y(n15) );
  NOR2X1 U23 ( .A(n4), .B(n11), .Y(n14) );
  XOR2X1 U24 ( .A(n15), .B(n14), .Y(sum[1]) );
  NAND2X1 U25 ( .A(n23), .B(n18), .Y(n33) );
  INVX2 U27 ( .A(n16), .Y(n19) );
  OAI21X1 U28 ( .A(n19), .B(n11), .C(n18), .Y(n24) );
  OAI21X1 U29 ( .A(n33), .B(n20), .C(n24), .Y(n22) );
  NAND2X1 U30 ( .A(b[2]), .B(n6), .Y(n38) );
  INVX2 U31 ( .A(n38), .Y(n29) );
  NOR2X1 U32 ( .A(n9), .B(n29), .Y(n21) );
  XOR2X1 U33 ( .A(n22), .B(n21), .Y(sum[2]) );
  INVX2 U34 ( .A(n24), .Y(n37) );
  NOR2X1 U35 ( .A(cin), .B(n37), .Y(n27) );
  OAI21X1 U36 ( .A(b[1]), .B(a[1]), .C(n23), .Y(n25) );
  NAND2X1 U37 ( .A(n25), .B(n24), .Y(n34) );
  OAI21X1 U38 ( .A(a[2]), .B(b[2]), .C(n34), .Y(n26) );
  OAI21X1 U39 ( .A(n26), .B(n27), .C(n38), .Y(n28) );
  AOI21X1 U40 ( .A(n37), .B(n31), .C(n29), .Y(n30) );
  NAND2X1 U41 ( .A(n2), .B(b[3]), .Y(n40) );
  OAI21X1 U42 ( .A(n42), .B(n30), .C(n40), .Y(gg) );
  NAND2X1 U43 ( .A(n44), .B(n31), .Y(n32) );
  NOR2X1 U44 ( .A(n33), .B(n32), .Y(pg) );
  NOR2X1 U45 ( .A(n7), .B(n35), .Y(n36) );
  OAI21X1 U46 ( .A(n1), .B(n37), .C(n36), .Y(n39) );
  AND2X2 U47 ( .A(n39), .B(n38), .Y(n41) );
  OAI21X1 U48 ( .A(n42), .B(n41), .C(n40), .Y(cout) );
  INVX2 U49 ( .A(n44), .Y(n42) );
  INVX2 U50 ( .A(n2), .Y(n43) );
endmodule


module mult16by4_0 ( a, b, product );
  input [15:0] a;
  input [3:0] b;
  output [19:0] product;
  wire   \sums[2][18] , \sums[2][17] , \sums[2][16] , \sums[2][15] ,
         \sums[2][14] , \sums[2][13] , \sums[2][12] , \sums[2][11] ,
         \sums[2][10] , \sums[2][9] , \sums[2][8] , \sums[2][7] , \sums[2][6] ,
         \sums[2][5] , \sums[2][4] , \sums[2][3] , \sums[2][2] , \sums[2][1] ,
         \sums[2][0] , \sums[1][18] , \sums[1][17] , \sums[1][16] ,
         \sums[1][15] , \sums[1][14] , \sums[1][13] , \sums[1][12] ,
         \sums[1][11] , \sums[1][10] , \sums[1][9] , \sums[1][8] ,
         \sums[1][7] , \sums[1][6] , \sums[1][5] , \sums[1][4] , \sums[1][3] ,
         \sums[1][2] , \sums[1][1] , \sums[1][0] , \sums[0][17] ,
         \sums[0][16] , \sums[0][15] , \sums[0][14] , \sums[0][13] ,
         \sums[0][12] , \sums[0][11] , \sums[0][10] , \sums[0][9] ,
         \sums[0][8] , \sums[0][7] , \sums[0][6] , \sums[0][5] , \sums[0][4] ,
         \sums[0][3] , \sums[0][2] , \sums[0][1] , \sums[0][0] , n1, n2, n3,
         n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n42, n43, n44, n45, n46, n47,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n62, n63, n64, n65,
         n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n79, n80,
         n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134;
  wire   [15:0] in_opp_sign;
  wire   [15:0] ab0;
  wire   [15:1] ab1;
  wire   [17:2] ab2;
  wire   [18:3] ab3;
  wire   [7:0] couts;
  wire   [19:0] out_neg;

  NAND2X1 U56 ( .A(out_neg[3]), .B(n32), .Y(n134) );
  NAND2X1 U58 ( .A(out_neg[2]), .B(n33), .Y(n133) );
  NAND2X1 U60 ( .A(out_neg[1]), .B(a[15]), .Y(n132) );
  NAND2X1 U82 ( .A(out_neg[0]), .B(a[15]), .Y(n131) );
  NAND2X1 U174 ( .A(in_opp_sign[15]), .B(a[15]), .Y(n130) );
  cla_16bit_4 AOPS1 ( .a({n34, n115, n116, n117, n118, n119, n120, n121, n122, 
        n123, n124, n125, n126, n127, n128, n129}), .b({1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .cin(1'b1), .sum(in_opp_sign) );
  cla_16bit_3 A1 ( .a({1'b0, ab0[14:0]}), .b({ab1, 1'b0}), .cin(1'b0), .cout(
        couts[0]), .sum({\sums[0][15] , \sums[0][14] , \sums[0][13] , 
        \sums[0][12] , \sums[0][11] , \sums[0][10] , \sums[0][9] , 
        \sums[0][8] , \sums[0][7] , \sums[0][6] , \sums[0][5] , \sums[0][4] , 
        \sums[0][3] , \sums[0][2] , \sums[0][1] , \sums[0][0] }) );
  adder_1bit_5 A1_1 ( .a(1'b0), .b(n94), .carry_in(couts[0]), .sum(
        \sums[0][16] ), .carry_out(\sums[0][17] ) );
  cla_16bit_2 A2 ( .a({\sums[0][15] , \sums[0][14] , \sums[0][13] , 
        \sums[0][12] , \sums[0][11] , \sums[0][10] , \sums[0][9] , 
        \sums[0][8] , \sums[0][7] , \sums[0][6] , \sums[0][5] , \sums[0][4] , 
        \sums[0][3] , \sums[0][2] , \sums[0][1] , \sums[0][0] }), .b({
        ab2[15:2], 1'b0, 1'b0}), .cin(1'b0), .cout(couts[1]), .sum({
        \sums[1][15] , \sums[1][14] , \sums[1][13] , \sums[1][12] , 
        \sums[1][11] , \sums[1][10] , \sums[1][9] , \sums[1][8] , \sums[1][7] , 
        \sums[1][6] , \sums[1][5] , \sums[1][4] , \sums[1][3] , \sums[1][2] , 
        \sums[1][1] , \sums[1][0] }) );
  adder_1bit_4 A2_1 ( .a(\sums[0][16] ), .b(n94), .carry_in(couts[1]), .sum(
        \sums[1][16] ), .carry_out(couts[2]) );
  adder_1bit_3 A2_2 ( .a(\sums[0][17] ), .b(1'b0), .carry_in(couts[2]), .sum(
        \sums[1][17] ), .carry_out(\sums[1][18] ) );
  cla_16bit_1 A3 ( .a({\sums[1][15] , \sums[1][14] , \sums[1][13] , 
        \sums[1][12] , \sums[1][11] , \sums[1][10] , \sums[1][9] , 
        \sums[1][8] , \sums[1][7] , \sums[1][6] , \sums[1][5] , \sums[1][4] , 
        \sums[1][3] , \sums[1][2] , \sums[1][1] , \sums[1][0] }), .b({
        ab3[15:3], 1'b0, 1'b0, 1'b0}), .cin(1'b0), .cout(couts[3]), .sum({
        \sums[2][15] , \sums[2][14] , \sums[2][13] , \sums[2][12] , 
        \sums[2][11] , \sums[2][10] , \sums[2][9] , \sums[2][8] , \sums[2][7] , 
        \sums[2][6] , \sums[2][5] , \sums[2][4] , \sums[2][3] , \sums[2][2] , 
        \sums[2][1] , \sums[2][0] }) );
  adder_1bit_2 A3_1 ( .a(\sums[1][16] ), .b(ab3[16]), .carry_in(couts[3]), 
        .sum(\sums[2][16] ), .carry_out(couts[4]) );
  adder_1bit_1 A3_2 ( .a(\sums[1][17] ), .b(ab3[17]), .carry_in(couts[4]), 
        .sum(\sums[2][17] ), .carry_out(couts[5]) );
  adder_1bit_0 A3_3 ( .a(\sums[1][18] ), .b(1'b0), .carry_in(couts[5]), .sum(
        \sums[2][18] ), .carry_out(couts[6]) );
  cla_16bit_0 A4 ( .a({n95, n96, n97, n98, n1, n104, n105, n106, n107, n108, 
        n109, n110, n111, n112, n113, n114}), .b({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), 
        .cin(1'b1), .cout(couts[7]), .sum(out_neg[15:0]) );
  cla_4bit_112 A5 ( .a({n102, n101, n100, n99}), .b({1'b0, 1'b0, 1'b0, 1'b0}), 
        .cin(couts[7]), .sum(out_neg[19:16]) );
  INVX2 U3 ( .A(\sums[2][11] ), .Y(n1) );
  INVX1 U4 ( .A(\sums[2][11] ), .Y(n103) );
  INVX1 U5 ( .A(b[1]), .Y(n17) );
  INVX2 U6 ( .A(n30), .Y(n2) );
  INVX2 U7 ( .A(n58), .Y(n26) );
  INVX2 U8 ( .A(n68), .Y(n11) );
  INVX2 U9 ( .A(n59), .Y(n31) );
  INVX2 U10 ( .A(n66), .Y(n12) );
  INVX2 U11 ( .A(n70), .Y(n19) );
  AND2X2 U12 ( .A(n21), .B(b[0]), .Y(ab0[4]) );
  AND2X1 U13 ( .A(n8), .B(n34), .Y(n3) );
  INVX2 U14 ( .A(n64), .Y(n21) );
  INVX1 U15 ( .A(n82), .Y(product[9]) );
  INVX1 U16 ( .A(n83), .Y(product[10]) );
  INVX1 U17 ( .A(n85), .Y(product[12]) );
  INVX1 U18 ( .A(n84), .Y(product[11]) );
  INVX1 U19 ( .A(n108), .Y(n4) );
  INVX1 U20 ( .A(n107), .Y(n5) );
  INVX1 U21 ( .A(n86), .Y(product[13]) );
  INVX1 U22 ( .A(n106), .Y(n6) );
  INVX1 U23 ( .A(n104), .Y(n7) );
  INVX2 U24 ( .A(couts[6]), .Y(n102) );
  INVX1 U25 ( .A(n87), .Y(product[14]) );
  INVX1 U26 ( .A(n89), .Y(product[16]) );
  INVX1 U27 ( .A(n88), .Y(product[15]) );
  INVX1 U28 ( .A(n102), .Y(n8) );
  INVX1 U29 ( .A(n99), .Y(n9) );
  INVX1 U30 ( .A(n101), .Y(n10) );
  INVX2 U31 ( .A(\sums[2][18] ), .Y(n101) );
  NOR2X1 U32 ( .A(n17), .B(n69), .Y(ab1[10]) );
  AOI21X1 U33 ( .A(out_neg[19]), .B(a[15]), .C(n3), .Y(n92) );
  AND2X2 U34 ( .A(n11), .B(n2), .Y(ab1[9]) );
  AND2X2 U35 ( .A(n20), .B(b[0]), .Y(ab0[7]) );
  INVX2 U36 ( .A(n67), .Y(n20) );
  AND2X2 U37 ( .A(n12), .B(b[0]), .Y(ab0[6]) );
  INVX2 U38 ( .A(b[0]), .Y(n74) );
  INVX1 U39 ( .A(n90), .Y(product[17]) );
  INVX2 U40 ( .A(\sums[2][12] ), .Y(n98) );
  AND2X2 U41 ( .A(n25), .B(b[0]), .Y(ab0[3]) );
  INVX2 U42 ( .A(n63), .Y(n25) );
  INVX1 U43 ( .A(n100), .Y(n13) );
  BUFX4 U44 ( .A(n74), .Y(n14) );
  INVX1 U45 ( .A(n105), .Y(n15) );
  AND2X2 U46 ( .A(b[0]), .B(n24), .Y(ab0[2]) );
  INVX2 U47 ( .A(n62), .Y(n24) );
  INVX1 U48 ( .A(n95), .Y(n16) );
  NOR2X1 U49 ( .A(n65), .B(n58), .Y(ab1[6]) );
  INVX1 U50 ( .A(n98), .Y(n18) );
  AND2X2 U51 ( .A(n19), .B(b[1]), .Y(ab1[11]) );
  NOR2X1 U52 ( .A(n66), .B(n58), .Y(ab1[7]) );
  INVX2 U53 ( .A(b[1]), .Y(n58) );
  AND2X2 U54 ( .A(n2), .B(n20), .Y(ab1[8]) );
  AND2X2 U55 ( .A(n26), .B(n21), .Y(ab1[5]) );
  INVX1 U57 ( .A(b[1]), .Y(n30) );
  INVX1 U59 ( .A(b[0]), .Y(n22) );
  AND2X2 U61 ( .A(n29), .B(b[0]), .Y(ab0[1]) );
  INVX2 U62 ( .A(n60), .Y(n29) );
  INVX1 U63 ( .A(n97), .Y(n23) );
  AND2X2 U64 ( .A(n24), .B(b[1]), .Y(ab1[3]) );
  AND2X2 U65 ( .A(n26), .B(n25), .Y(ab1[4]) );
  INVX4 U66 ( .A(b[2]), .Y(n57) );
  INVX1 U67 ( .A(n96), .Y(n27) );
  INVX1 U68 ( .A(n103), .Y(n28) );
  AND2X2 U69 ( .A(b[1]), .B(n29), .Y(ab1[2]) );
  AND2X2 U70 ( .A(n31), .B(b[1]), .Y(ab1[1]) );
  INVX2 U71 ( .A(n34), .Y(n33) );
  INVX2 U72 ( .A(n34), .Y(n32) );
  INVX2 U73 ( .A(a[15]), .Y(n34) );
  INVX1 U74 ( .A(n91), .Y(product[18]) );
  INVX1 U75 ( .A(n92), .Y(product[19]) );
  INVX4 U76 ( .A(b[3]), .Y(n54) );
  INVX2 U77 ( .A(\sums[2][16] ), .Y(n99) );
  INVX2 U78 ( .A(\sums[2][17] ), .Y(n100) );
  INVX2 U79 ( .A(\sums[2][0] ), .Y(n114) );
  INVX2 U80 ( .A(\sums[2][1] ), .Y(n113) );
  INVX2 U81 ( .A(\sums[2][2] ), .Y(n112) );
  INVX2 U83 ( .A(\sums[2][3] ), .Y(n111) );
  INVX2 U84 ( .A(\sums[2][4] ), .Y(n110) );
  INVX2 U85 ( .A(\sums[2][5] ), .Y(n109) );
  INVX2 U86 ( .A(\sums[2][6] ), .Y(n108) );
  INVX2 U87 ( .A(\sums[2][7] ), .Y(n107) );
  INVX2 U88 ( .A(\sums[2][8] ), .Y(n106) );
  INVX2 U89 ( .A(\sums[2][9] ), .Y(n105) );
  INVX2 U90 ( .A(\sums[2][10] ), .Y(n104) );
  INVX2 U91 ( .A(\sums[2][13] ), .Y(n97) );
  INVX2 U92 ( .A(\sums[2][14] ), .Y(n96) );
  INVX2 U93 ( .A(\sums[2][15] ), .Y(n95) );
  MUX2X1 U94 ( .B(a[14]), .A(in_opp_sign[14]), .S(n33), .Y(n35) );
  NAND2X1 U95 ( .A(n130), .B(n35), .Y(n55) );
  INVX2 U96 ( .A(n55), .Y(n75) );
  NOR2X1 U97 ( .A(n75), .B(n54), .Y(ab3[17]) );
  MUX2X1 U98 ( .B(a[13]), .A(in_opp_sign[13]), .S(a[15]), .Y(n36) );
  AND2X2 U99 ( .A(n130), .B(n36), .Y(n73) );
  NOR2X1 U100 ( .A(n73), .B(n54), .Y(ab3[16]) );
  MUX2X1 U101 ( .B(a[0]), .A(in_opp_sign[0]), .S(a[15]), .Y(n37) );
  AND2X2 U102 ( .A(n130), .B(n37), .Y(n59) );
  NOR2X1 U103 ( .A(n59), .B(n54), .Y(ab3[3]) );
  MUX2X1 U104 ( .B(a[1]), .A(in_opp_sign[1]), .S(a[15]), .Y(n38) );
  AND2X2 U105 ( .A(n130), .B(n38), .Y(n60) );
  NOR2X1 U106 ( .A(n60), .B(n54), .Y(ab3[4]) );
  MUX2X1 U107 ( .B(a[2]), .A(in_opp_sign[2]), .S(a[15]), .Y(n39) );
  AND2X2 U108 ( .A(n130), .B(n39), .Y(n62) );
  NOR2X1 U109 ( .A(n62), .B(n54), .Y(ab3[5]) );
  MUX2X1 U110 ( .B(a[3]), .A(in_opp_sign[3]), .S(n33), .Y(n40) );
  AND2X2 U111 ( .A(n130), .B(n40), .Y(n63) );
  NOR2X1 U112 ( .A(n63), .B(n54), .Y(ab3[6]) );
  MUX2X1 U113 ( .B(a[4]), .A(in_opp_sign[4]), .S(n33), .Y(n42) );
  AND2X2 U114 ( .A(n130), .B(n42), .Y(n64) );
  NOR2X1 U115 ( .A(n64), .B(n54), .Y(ab3[7]) );
  MUX2X1 U116 ( .B(a[5]), .A(in_opp_sign[5]), .S(n33), .Y(n43) );
  AND2X2 U117 ( .A(n130), .B(n43), .Y(n65) );
  NOR2X1 U118 ( .A(n65), .B(n54), .Y(ab3[8]) );
  MUX2X1 U119 ( .B(a[6]), .A(in_opp_sign[6]), .S(n33), .Y(n44) );
  AND2X2 U120 ( .A(n130), .B(n44), .Y(n66) );
  NOR2X1 U121 ( .A(n66), .B(n54), .Y(ab3[9]) );
  MUX2X1 U122 ( .B(a[7]), .A(in_opp_sign[7]), .S(n33), .Y(n45) );
  AND2X2 U123 ( .A(n130), .B(n45), .Y(n67) );
  NOR2X1 U124 ( .A(n67), .B(n54), .Y(ab3[10]) );
  MUX2X1 U125 ( .B(a[8]), .A(in_opp_sign[8]), .S(n33), .Y(n46) );
  AND2X2 U126 ( .A(n130), .B(n46), .Y(n68) );
  NOR2X1 U127 ( .A(n68), .B(n54), .Y(ab3[11]) );
  MUX2X1 U128 ( .B(a[9]), .A(in_opp_sign[9]), .S(n33), .Y(n47) );
  AND2X2 U129 ( .A(n130), .B(n47), .Y(n69) );
  NOR2X1 U130 ( .A(n69), .B(n54), .Y(ab3[12]) );
  MUX2X1 U131 ( .B(a[10]), .A(in_opp_sign[10]), .S(n33), .Y(n51) );
  AND2X2 U132 ( .A(n130), .B(n51), .Y(n70) );
  NOR2X1 U133 ( .A(n70), .B(n54), .Y(ab3[13]) );
  MUX2X1 U134 ( .B(a[11]), .A(in_opp_sign[11]), .S(n33), .Y(n52) );
  AND2X2 U135 ( .A(n130), .B(n52), .Y(n71) );
  NOR2X1 U136 ( .A(n71), .B(n54), .Y(ab3[14]) );
  MUX2X1 U137 ( .B(a[12]), .A(in_opp_sign[12]), .S(n33), .Y(n53) );
  AND2X2 U138 ( .A(n130), .B(n53), .Y(n72) );
  NOR2X1 U139 ( .A(n72), .B(n54), .Y(ab3[15]) );
  NAND2X1 U140 ( .A(b[2]), .B(n55), .Y(n56) );
  INVX2 U141 ( .A(n56), .Y(n94) );
  NOR2X1 U142 ( .A(n59), .B(n57), .Y(ab2[2]) );
  NOR2X1 U143 ( .A(n60), .B(n57), .Y(ab2[3]) );
  NOR2X1 U144 ( .A(n62), .B(n57), .Y(ab2[4]) );
  NOR2X1 U145 ( .A(n63), .B(n57), .Y(ab2[5]) );
  NOR2X1 U146 ( .A(n64), .B(n57), .Y(ab2[6]) );
  NOR2X1 U147 ( .A(n65), .B(n57), .Y(ab2[7]) );
  NOR2X1 U148 ( .A(n66), .B(n57), .Y(ab2[8]) );
  NOR2X1 U149 ( .A(n67), .B(n57), .Y(ab2[9]) );
  NOR2X1 U150 ( .A(n68), .B(n57), .Y(ab2[10]) );
  NOR2X1 U151 ( .A(n69), .B(n57), .Y(ab2[11]) );
  NOR2X1 U152 ( .A(n70), .B(n57), .Y(ab2[12]) );
  NOR2X1 U153 ( .A(n71), .B(n57), .Y(ab2[13]) );
  NOR2X1 U154 ( .A(n72), .B(n57), .Y(ab2[14]) );
  NOR2X1 U156 ( .A(n73), .B(n57), .Y(ab2[15]) );
  NOR2X1 U157 ( .A(n71), .B(n17), .Y(ab1[12]) );
  NOR2X1 U158 ( .A(n72), .B(n17), .Y(ab1[13]) );
  NOR2X1 U159 ( .A(n73), .B(n30), .Y(ab1[14]) );
  NOR2X1 U160 ( .A(n75), .B(n17), .Y(ab1[15]) );
  NOR2X1 U161 ( .A(n59), .B(n14), .Y(ab0[0]) );
  NOR2X1 U162 ( .A(n65), .B(n74), .Y(ab0[5]) );
  NOR2X1 U163 ( .A(n68), .B(n74), .Y(ab0[8]) );
  NOR2X1 U164 ( .A(n69), .B(n22), .Y(ab0[9]) );
  NOR2X1 U165 ( .A(n70), .B(n14), .Y(ab0[10]) );
  NOR2X1 U166 ( .A(n71), .B(n22), .Y(ab0[11]) );
  NOR2X1 U167 ( .A(n72), .B(n14), .Y(ab0[12]) );
  NOR2X1 U168 ( .A(n73), .B(n14), .Y(ab0[13]) );
  NOR2X1 U169 ( .A(n75), .B(n14), .Y(ab0[14]) );
  INVX2 U170 ( .A(a[14]), .Y(n115) );
  INVX2 U171 ( .A(a[13]), .Y(n116) );
  INVX2 U172 ( .A(a[12]), .Y(n117) );
  INVX2 U173 ( .A(a[11]), .Y(n118) );
  INVX2 U175 ( .A(a[10]), .Y(n119) );
  INVX2 U176 ( .A(a[9]), .Y(n120) );
  INVX2 U177 ( .A(a[8]), .Y(n121) );
  INVX2 U178 ( .A(a[7]), .Y(n122) );
  INVX2 U179 ( .A(a[6]), .Y(n123) );
  INVX2 U180 ( .A(a[5]), .Y(n124) );
  INVX2 U181 ( .A(a[4]), .Y(n125) );
  INVX2 U182 ( .A(a[3]), .Y(n126) );
  INVX2 U183 ( .A(a[2]), .Y(n127) );
  INVX2 U184 ( .A(a[1]), .Y(n128) );
  INVX2 U185 ( .A(a[0]), .Y(n129) );
  OAI21X1 U186 ( .A(a[15]), .B(n114), .C(n131), .Y(product[0]) );
  OAI21X1 U187 ( .A(a[15]), .B(n113), .C(n132), .Y(product[1]) );
  OAI21X1 U188 ( .A(a[15]), .B(n112), .C(n133), .Y(product[2]) );
  OAI21X1 U189 ( .A(a[15]), .B(n111), .C(n134), .Y(product[3]) );
  MUX2X1 U190 ( .B(\sums[2][4] ), .A(out_neg[4]), .S(n33), .Y(n76) );
  INVX2 U191 ( .A(n76), .Y(product[4]) );
  MUX2X1 U192 ( .B(\sums[2][5] ), .A(out_neg[5]), .S(n33), .Y(n77) );
  INVX2 U193 ( .A(n77), .Y(product[5]) );
  MUX2X1 U194 ( .B(n4), .A(out_neg[6]), .S(n32), .Y(n79) );
  INVX2 U195 ( .A(n79), .Y(product[6]) );
  MUX2X1 U196 ( .B(n5), .A(out_neg[7]), .S(n32), .Y(n80) );
  INVX2 U197 ( .A(n80), .Y(product[7]) );
  MUX2X1 U198 ( .B(n6), .A(out_neg[8]), .S(n32), .Y(n81) );
  INVX2 U199 ( .A(n81), .Y(product[8]) );
  MUX2X1 U200 ( .B(n15), .A(out_neg[9]), .S(n32), .Y(n82) );
  MUX2X1 U201 ( .B(n7), .A(out_neg[10]), .S(n32), .Y(n83) );
  MUX2X1 U202 ( .B(n28), .A(out_neg[11]), .S(n32), .Y(n84) );
  MUX2X1 U203 ( .B(n18), .A(out_neg[12]), .S(n32), .Y(n85) );
  MUX2X1 U204 ( .B(n23), .A(out_neg[13]), .S(n32), .Y(n86) );
  MUX2X1 U205 ( .B(n27), .A(out_neg[14]), .S(n32), .Y(n87) );
  MUX2X1 U206 ( .B(n16), .A(out_neg[15]), .S(n32), .Y(n88) );
  MUX2X1 U207 ( .B(n9), .A(out_neg[16]), .S(n32), .Y(n89) );
  MUX2X1 U208 ( .B(n13), .A(out_neg[17]), .S(n32), .Y(n90) );
  MUX2X1 U209 ( .B(n10), .A(out_neg[18]), .S(n32), .Y(n91) );
endmodule


module fader ( clk, n_reset, clear, fad_enable, signal_in, signal_out );
  input [31:0] signal_in;
  output [31:0] signal_out;
  input clk, n_reset, clear, fad_enable;

  wire   [21:0] mult_val;
  tri   clear;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25;

  fader_state POOP ( .clk(clk), .n_reset(n_reset), .clear(clear), .fad_enable(
        fad_enable), .countVal({SYNOPSYS_UNCONNECTED__0, mult_val[20:17], 
        SYNOPSYS_UNCONNECTED__1, SYNOPSYS_UNCONNECTED__2, 
        SYNOPSYS_UNCONNECTED__3, SYNOPSYS_UNCONNECTED__4, 
        SYNOPSYS_UNCONNECTED__5, SYNOPSYS_UNCONNECTED__6, 
        SYNOPSYS_UNCONNECTED__7, SYNOPSYS_UNCONNECTED__8, 
        SYNOPSYS_UNCONNECTED__9, SYNOPSYS_UNCONNECTED__10, 
        SYNOPSYS_UNCONNECTED__11, SYNOPSYS_UNCONNECTED__12, 
        SYNOPSYS_UNCONNECTED__13, SYNOPSYS_UNCONNECTED__14, 
        SYNOPSYS_UNCONNECTED__15, SYNOPSYS_UNCONNECTED__16, 
        SYNOPSYS_UNCONNECTED__17}) );
  mult16by4_1 P1 ( .a(signal_in[31:16]), .b(mult_val[20:17]), .product({
        signal_out[31:16], SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21}) );
  mult16by4_0 P2 ( .a(signal_in[15:0]), .b(mult_val[20:17]), .product({
        signal_out[15:0], SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25}) );
endmodule


module flex_buffer_NUM_BITS32_0 ( clk, n_rst, input_data, output_data );
  input [31:0] input_data;
  output [31:0] output_data;
  input clk, n_rst;


  DFFSR \output_data_reg[31]  ( .D(input_data[31]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[31]) );
  DFFSR \output_data_reg[30]  ( .D(input_data[30]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[30]) );
  DFFSR \output_data_reg[29]  ( .D(input_data[29]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[29]) );
  DFFSR \output_data_reg[28]  ( .D(input_data[28]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[28]) );
  DFFSR \output_data_reg[27]  ( .D(input_data[27]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[27]) );
  DFFSR \output_data_reg[26]  ( .D(input_data[26]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[26]) );
  DFFSR \output_data_reg[25]  ( .D(input_data[25]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[25]) );
  DFFSR \output_data_reg[24]  ( .D(input_data[24]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[24]) );
  DFFSR \output_data_reg[23]  ( .D(input_data[23]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[23]) );
  DFFSR \output_data_reg[22]  ( .D(input_data[22]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[22]) );
  DFFSR \output_data_reg[21]  ( .D(input_data[21]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[21]) );
  DFFSR \output_data_reg[20]  ( .D(input_data[20]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[20]) );
  DFFSR \output_data_reg[19]  ( .D(input_data[19]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[19]) );
  DFFSR \output_data_reg[18]  ( .D(input_data[18]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[18]) );
  DFFSR \output_data_reg[17]  ( .D(input_data[17]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[17]) );
  DFFSR \output_data_reg[16]  ( .D(input_data[16]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[16]) );
  DFFSR \output_data_reg[15]  ( .D(input_data[15]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[15]) );
  DFFSR \output_data_reg[14]  ( .D(input_data[14]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[14]) );
  DFFSR \output_data_reg[13]  ( .D(input_data[13]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[13]) );
  DFFSR \output_data_reg[12]  ( .D(input_data[12]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[12]) );
  DFFSR \output_data_reg[11]  ( .D(input_data[11]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[11]) );
  DFFSR \output_data_reg[10]  ( .D(input_data[10]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[10]) );
  DFFSR \output_data_reg[9]  ( .D(input_data[9]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[9]) );
  DFFSR \output_data_reg[8]  ( .D(input_data[8]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[8]) );
  DFFSR \output_data_reg[7]  ( .D(input_data[7]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[7]) );
  DFFSR \output_data_reg[6]  ( .D(input_data[6]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[6]) );
  DFFSR \output_data_reg[5]  ( .D(input_data[5]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[5]) );
  DFFSR \output_data_reg[4]  ( .D(input_data[4]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[4]) );
  DFFSR \output_data_reg[3]  ( .D(input_data[3]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[3]) );
  DFFSR \output_data_reg[2]  ( .D(input_data[2]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[2]) );
  DFFSR \output_data_reg[1]  ( .D(input_data[1]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[1]) );
  DFFSR \output_data_reg[0]  ( .D(input_data[0]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(output_data[0]) );
endmodule


module i2s_trnmtr_edge_detector_0 ( clk, n_rst, ws, wsd, edge_detected );
  input clk, n_rst, ws;
  output wsd, edge_detected;
  wire   ff_out_2;

  DFFSR ff_out_1_reg ( .D(ws), .CLK(clk), .R(n_rst), .S(1'b1), .Q(wsd) );
  DFFSR ff_out_2_reg ( .D(wsd), .CLK(clk), .R(n_rst), .S(1'b1), .Q(ff_out_2)
         );
  XOR2X1 U5 ( .A(wsd), .B(ff_out_2), .Y(edge_detected) );
endmodule


module flex_counter_NUM_CNT_BITS5_0 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [4:0] rollover_val;
  output [4:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n1, n2, n3, n4, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n40, n41, n42, n43;

  DFFSR \counter_reg[0]  ( .D(n35), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR r_flag_reg ( .D(n34), .CLK(clk), .R(n_rst), .S(1'b1), .Q(rollover_flag) );
  DFFSR \counter_reg[1]  ( .D(n40), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \counter_reg[2]  ( .D(n41), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \counter_reg[3]  ( .D(n42), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \counter_reg[4]  ( .D(n43), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[4]) );
  XOR2X1 U9 ( .A(rollover_val[1]), .B(count_out[1]), .Y(n2) );
  XOR2X1 U10 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n1) );
  NOR2X1 U11 ( .A(n2), .B(n1), .Y(n13) );
  INVX2 U12 ( .A(count_out[4]), .Y(n24) );
  XOR2X1 U13 ( .A(n24), .B(rollover_val[4]), .Y(n12) );
  XOR2X1 U14 ( .A(rollover_val[3]), .B(count_out[3]), .Y(n4) );
  XOR2X1 U15 ( .A(rollover_val[2]), .B(count_out[2]), .Y(n3) );
  NOR2X1 U16 ( .A(n4), .B(n3), .Y(n11) );
  NAND3X1 U17 ( .A(n13), .B(n12), .C(n11), .Y(n33) );
  INVX2 U18 ( .A(clear), .Y(n14) );
  OR2X2 U19 ( .A(count_enable), .B(clear), .Y(n27) );
  NAND3X1 U20 ( .A(n33), .B(n14), .C(n27), .Y(n28) );
  INVX2 U21 ( .A(count_out[0]), .Y(n15) );
  NOR2X1 U22 ( .A(count_out[2]), .B(n15), .Y(n16) );
  MUX2X1 U23 ( .B(count_out[2]), .A(n16), .S(count_out[1]), .Y(n18) );
  OAI21X1 U24 ( .A(count_out[0]), .B(n28), .C(n27), .Y(n30) );
  NAND2X1 U25 ( .A(count_out[2]), .B(n30), .Y(n17) );
  OAI21X1 U26 ( .A(n28), .B(n18), .C(n17), .Y(n41) );
  NAND3X1 U27 ( .A(count_out[1]), .B(count_out[0]), .C(count_out[2]), .Y(n22)
         );
  INVX2 U28 ( .A(n22), .Y(n19) );
  INVX2 U29 ( .A(n28), .Y(n29) );
  NAND2X1 U30 ( .A(n19), .B(n29), .Y(n21) );
  OAI21X1 U31 ( .A(n19), .B(n28), .C(n27), .Y(n20) );
  INVX2 U32 ( .A(n20), .Y(n25) );
  MUX2X1 U33 ( .B(n21), .A(n25), .S(count_out[3]), .Y(n42) );
  NOR2X1 U34 ( .A(count_out[4]), .B(n22), .Y(n23) );
  MUX2X1 U35 ( .B(count_out[4]), .A(n23), .S(count_out[3]), .Y(n26) );
  OAI22X1 U36 ( .A(n26), .B(n28), .C(n25), .D(n24), .Y(n43) );
  MUX2X1 U37 ( .B(n28), .A(n27), .S(count_out[0]), .Y(n35) );
  NAND2X1 U38 ( .A(count_out[0]), .B(n29), .Y(n32) );
  INVX2 U39 ( .A(n30), .Y(n31) );
  MUX2X1 U40 ( .B(n32), .A(n31), .S(count_out[1]), .Y(n40) );
  INVX2 U41 ( .A(n33), .Y(n34) );
endmodule


module i2s_trnmtr_cntlr ( clk, n_rst, ws, load );
  input clk, n_rst;
  output ws, load;
  wire   ws_switch, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14;
  wire   [2:0] state;
  wire   [2:0] next_state;

  DFFSR \state_reg[0]  ( .D(next_state[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[0]) );
  DFFSR \state_reg[1]  ( .D(n4), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[1])
         );
  DFFSR \state_reg[2]  ( .D(next_state[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[2]) );
  flex_counter_NUM_CNT_BITS5_0 EDGE_COUNTER_2 ( .clk(clk), .n_rst(n_rst), 
        .clear(1'b0), .count_enable(1'b1), .rollover_val({1'b1, 1'b0, 1'b0, 
        1'b0, 1'b0}), .rollover_flag(ws_switch) );
  AND2X1 U6 ( .A(state[0]), .B(n13), .Y(n4) );
  INVX2 U7 ( .A(state[2]), .Y(n13) );
  INVX2 U8 ( .A(state[1]), .Y(n5) );
  INVX2 U9 ( .A(state[0]), .Y(n7) );
  NAND2X1 U10 ( .A(n5), .B(n7), .Y(n11) );
  INVX2 U11 ( .A(n11), .Y(n14) );
  MUX2X1 U12 ( .B(n4), .A(n14), .S(ws_switch), .Y(n6) );
  OAI21X1 U13 ( .A(state[1]), .B(state[2]), .C(n6), .Y(next_state[0]) );
  NAND2X1 U14 ( .A(state[1]), .B(n7), .Y(n10) );
  INVX2 U15 ( .A(ws_switch), .Y(n8) );
  NAND2X1 U16 ( .A(n14), .B(n8), .Y(n9) );
  MUX2X1 U17 ( .B(n10), .A(n9), .S(state[2]), .Y(next_state[2]) );
  NAND2X1 U18 ( .A(n11), .B(n13), .Y(n12) );
  AOI21X1 U19 ( .A(state[1]), .B(state[0]), .C(n12), .Y(load) );
  AOI21X1 U20 ( .A(n14), .B(n13), .C(n4), .Y(ws) );
endmodule


module i2s_trnmtr_double_reg ( clk, n_rst, data_in, data_left, data_right );
  input [31:0] data_in;
  output [15:0] data_left;
  output [15:0] data_right;
  input clk, n_rst;


  DFFSR \ff_left_reg[15]  ( .D(data_in[31]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_left[15]) );
  DFFSR \ff_left_reg[14]  ( .D(data_in[30]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_left[14]) );
  DFFSR \ff_left_reg[13]  ( .D(data_in[29]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_left[13]) );
  DFFSR \ff_left_reg[12]  ( .D(data_in[28]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_left[12]) );
  DFFSR \ff_left_reg[11]  ( .D(data_in[27]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_left[11]) );
  DFFSR \ff_left_reg[10]  ( .D(data_in[26]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_left[10]) );
  DFFSR \ff_left_reg[9]  ( .D(data_in[25]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_left[9]) );
  DFFSR \ff_left_reg[8]  ( .D(data_in[24]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_left[8]) );
  DFFSR \ff_left_reg[7]  ( .D(data_in[23]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_left[7]) );
  DFFSR \ff_left_reg[6]  ( .D(data_in[22]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_left[6]) );
  DFFSR \ff_left_reg[5]  ( .D(data_in[21]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_left[5]) );
  DFFSR \ff_left_reg[4]  ( .D(data_in[20]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_left[4]) );
  DFFSR \ff_left_reg[3]  ( .D(data_in[19]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_left[3]) );
  DFFSR \ff_left_reg[2]  ( .D(data_in[18]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_left[2]) );
  DFFSR \ff_left_reg[1]  ( .D(data_in[17]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_left[1]) );
  DFFSR \ff_left_reg[0]  ( .D(data_in[16]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_left[0]) );
  DFFSR \ff_right_reg[15]  ( .D(data_in[15]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_right[15]) );
  DFFSR \ff_right_reg[14]  ( .D(data_in[14]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_right[14]) );
  DFFSR \ff_right_reg[13]  ( .D(data_in[13]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_right[13]) );
  DFFSR \ff_right_reg[12]  ( .D(data_in[12]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_right[12]) );
  DFFSR \ff_right_reg[11]  ( .D(data_in[11]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_right[11]) );
  DFFSR \ff_right_reg[10]  ( .D(data_in[10]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_right[10]) );
  DFFSR \ff_right_reg[9]  ( .D(data_in[9]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_right[9]) );
  DFFSR \ff_right_reg[8]  ( .D(data_in[8]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_right[8]) );
  DFFSR \ff_right_reg[7]  ( .D(data_in[7]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_right[7]) );
  DFFSR \ff_right_reg[6]  ( .D(data_in[6]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_right[6]) );
  DFFSR \ff_right_reg[5]  ( .D(data_in[5]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_right[5]) );
  DFFSR \ff_right_reg[4]  ( .D(data_in[4]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_right[4]) );
  DFFSR \ff_right_reg[3]  ( .D(data_in[3]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_right[3]) );
  DFFSR \ff_right_reg[2]  ( .D(data_in[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_right[2]) );
  DFFSR \ff_right_reg[1]  ( .D(data_in[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_right[1]) );
  DFFSR \ff_right_reg[0]  ( .D(data_in[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_right[0]) );
endmodule


module flex_pts_sr_NUM_BITS16 ( clk, n_rst, shift_enable, load_enable, 
        parallel_in, serial_out );
  input [15:0] parallel_in;
  input clk, n_rst, shift_enable, load_enable;
  output serial_out;
  wire   n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66,
         n67, n68, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87;
  wire   [14:0] ff_in;

  DFFSR \ff_in_reg[0]  ( .D(n68), .CLK(clk), .R(1'b1), .S(n_rst), .Q(ff_in[0])
         );
  DFFSR \ff_in_reg[1]  ( .D(n67), .CLK(clk), .R(1'b1), .S(n_rst), .Q(ff_in[1])
         );
  DFFSR \ff_in_reg[2]  ( .D(n66), .CLK(clk), .R(1'b1), .S(n_rst), .Q(ff_in[2])
         );
  DFFSR \ff_in_reg[3]  ( .D(n65), .CLK(clk), .R(1'b1), .S(n_rst), .Q(ff_in[3])
         );
  DFFSR \ff_in_reg[4]  ( .D(n64), .CLK(clk), .R(1'b1), .S(n_rst), .Q(ff_in[4])
         );
  DFFSR \ff_in_reg[5]  ( .D(n63), .CLK(clk), .R(1'b1), .S(n_rst), .Q(ff_in[5])
         );
  DFFSR \ff_in_reg[6]  ( .D(n62), .CLK(clk), .R(1'b1), .S(n_rst), .Q(ff_in[6])
         );
  DFFSR \ff_in_reg[7]  ( .D(n61), .CLK(clk), .R(1'b1), .S(n_rst), .Q(ff_in[7])
         );
  DFFSR \ff_in_reg[8]  ( .D(n60), .CLK(clk), .R(1'b1), .S(n_rst), .Q(ff_in[8])
         );
  DFFSR \ff_in_reg[9]  ( .D(n59), .CLK(clk), .R(1'b1), .S(n_rst), .Q(ff_in[9])
         );
  DFFSR \ff_in_reg[10]  ( .D(n58), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        ff_in[10]) );
  DFFSR \ff_in_reg[11]  ( .D(n57), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        ff_in[11]) );
  DFFSR \ff_in_reg[12]  ( .D(n56), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        ff_in[12]) );
  DFFSR \ff_in_reg[13]  ( .D(n55), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        ff_in[13]) );
  DFFSR \ff_in_reg[14]  ( .D(n54), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        ff_in[14]) );
  DFFSR \ff_in_reg[15]  ( .D(n53), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        serial_out) );
  INVX4 U19 ( .A(n17), .Y(n18) );
  INVX1 U20 ( .A(n17), .Y(n19) );
  INVX2 U21 ( .A(n24), .Y(n84) );
  INVX2 U22 ( .A(load_enable), .Y(n17) );
  INVX4 U23 ( .A(n23), .Y(n83) );
  NAND2X1 U24 ( .A(shift_enable), .B(n17), .Y(n24) );
  NAND2X1 U25 ( .A(n24), .B(n17), .Y(n23) );
  INVX2 U26 ( .A(ff_in[0]), .Y(n20) );
  OAI21X1 U27 ( .A(n23), .B(n20), .C(n24), .Y(n21) );
  AOI21X1 U28 ( .A(parallel_in[0]), .B(n18), .C(n21), .Y(n22) );
  INVX2 U29 ( .A(n22), .Y(n68) );
  NAND2X1 U30 ( .A(ff_in[1]), .B(n83), .Y(n27) );
  NAND2X1 U31 ( .A(ff_in[0]), .B(n84), .Y(n26) );
  NAND2X1 U32 ( .A(parallel_in[1]), .B(n18), .Y(n25) );
  NAND3X1 U33 ( .A(n27), .B(n26), .C(n25), .Y(n67) );
  NAND2X1 U34 ( .A(ff_in[2]), .B(n83), .Y(n30) );
  NAND2X1 U35 ( .A(ff_in[1]), .B(n84), .Y(n29) );
  NAND2X1 U36 ( .A(parallel_in[2]), .B(n18), .Y(n28) );
  NAND3X1 U37 ( .A(n30), .B(n29), .C(n28), .Y(n66) );
  NAND2X1 U38 ( .A(ff_in[3]), .B(n83), .Y(n33) );
  NAND2X1 U39 ( .A(ff_in[2]), .B(n84), .Y(n32) );
  NAND2X1 U40 ( .A(parallel_in[3]), .B(n18), .Y(n31) );
  NAND3X1 U41 ( .A(n33), .B(n32), .C(n31), .Y(n65) );
  NAND2X1 U42 ( .A(ff_in[4]), .B(n83), .Y(n36) );
  NAND2X1 U43 ( .A(ff_in[3]), .B(n84), .Y(n35) );
  NAND2X1 U44 ( .A(parallel_in[4]), .B(n18), .Y(n34) );
  NAND3X1 U45 ( .A(n36), .B(n35), .C(n34), .Y(n64) );
  NAND2X1 U46 ( .A(ff_in[5]), .B(n83), .Y(n39) );
  NAND2X1 U47 ( .A(ff_in[4]), .B(n84), .Y(n38) );
  NAND2X1 U48 ( .A(parallel_in[5]), .B(n18), .Y(n37) );
  NAND3X1 U49 ( .A(n39), .B(n38), .C(n37), .Y(n63) );
  NAND2X1 U50 ( .A(ff_in[6]), .B(n83), .Y(n42) );
  NAND2X1 U51 ( .A(ff_in[5]), .B(n84), .Y(n41) );
  NAND2X1 U52 ( .A(parallel_in[6]), .B(n18), .Y(n40) );
  NAND3X1 U53 ( .A(n42), .B(n41), .C(n40), .Y(n62) );
  NAND2X1 U54 ( .A(ff_in[7]), .B(n83), .Y(n45) );
  NAND2X1 U55 ( .A(ff_in[6]), .B(n84), .Y(n44) );
  NAND2X1 U56 ( .A(parallel_in[7]), .B(n19), .Y(n43) );
  NAND3X1 U57 ( .A(n45), .B(n44), .C(n43), .Y(n61) );
  NAND2X1 U58 ( .A(ff_in[8]), .B(n83), .Y(n48) );
  NAND2X1 U59 ( .A(ff_in[7]), .B(n84), .Y(n47) );
  NAND2X1 U60 ( .A(parallel_in[8]), .B(n19), .Y(n46) );
  NAND3X1 U61 ( .A(n48), .B(n47), .C(n46), .Y(n60) );
  NAND2X1 U62 ( .A(ff_in[9]), .B(n83), .Y(n51) );
  NAND2X1 U63 ( .A(ff_in[8]), .B(n84), .Y(n50) );
  NAND2X1 U64 ( .A(parallel_in[9]), .B(n19), .Y(n49) );
  NAND3X1 U65 ( .A(n51), .B(n50), .C(n49), .Y(n59) );
  NAND2X1 U66 ( .A(ff_in[10]), .B(n83), .Y(n70) );
  NAND2X1 U67 ( .A(ff_in[9]), .B(n84), .Y(n69) );
  NAND2X1 U68 ( .A(parallel_in[10]), .B(n19), .Y(n52) );
  NAND3X1 U69 ( .A(n70), .B(n69), .C(n52), .Y(n58) );
  NAND2X1 U70 ( .A(ff_in[11]), .B(n83), .Y(n73) );
  NAND2X1 U71 ( .A(ff_in[10]), .B(n84), .Y(n72) );
  NAND2X1 U72 ( .A(parallel_in[11]), .B(n19), .Y(n71) );
  NAND3X1 U73 ( .A(n73), .B(n72), .C(n71), .Y(n57) );
  NAND2X1 U74 ( .A(ff_in[12]), .B(n83), .Y(n76) );
  NAND2X1 U75 ( .A(ff_in[11]), .B(n84), .Y(n75) );
  NAND2X1 U76 ( .A(parallel_in[12]), .B(n19), .Y(n74) );
  NAND3X1 U77 ( .A(n76), .B(n75), .C(n74), .Y(n56) );
  NAND2X1 U78 ( .A(ff_in[13]), .B(n83), .Y(n79) );
  NAND2X1 U79 ( .A(ff_in[12]), .B(n84), .Y(n78) );
  NAND2X1 U80 ( .A(parallel_in[13]), .B(n19), .Y(n77) );
  NAND3X1 U81 ( .A(n79), .B(n78), .C(n77), .Y(n55) );
  NAND2X1 U82 ( .A(ff_in[14]), .B(n83), .Y(n82) );
  NAND2X1 U83 ( .A(ff_in[13]), .B(n84), .Y(n81) );
  NAND2X1 U84 ( .A(parallel_in[14]), .B(n19), .Y(n80) );
  NAND3X1 U85 ( .A(n82), .B(n81), .C(n80), .Y(n54) );
  NAND2X1 U86 ( .A(serial_out), .B(n83), .Y(n87) );
  NAND2X1 U87 ( .A(ff_in[14]), .B(n84), .Y(n86) );
  NAND2X1 U88 ( .A(parallel_in[15]), .B(n19), .Y(n85) );
  NAND3X1 U89 ( .A(n87), .B(n86), .C(n85), .Y(n53) );
endmodule


module i2s_trnmtr_shift_reg ( clk, n_rst, shift, load, wsd, data_left, 
        data_right, data_out );
  input [15:0] data_left;
  input [15:0] data_right;
  input clk, n_rst, shift, load, wsd;
  output data_out;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35;

  flex_pts_sr_NUM_BITS16 SHIFT_REGISTER ( .clk(clk), .n_rst(n_rst), 
        .shift_enable(shift), .load_enable(load), .parallel_in({n20, n21, n22, 
        n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35}), 
        .serial_out(data_out) );
  INVX2 U1 ( .A(n1), .Y(n2) );
  INVX2 U2 ( .A(n1), .Y(n3) );
  INVX2 U3 ( .A(wsd), .Y(n1) );
  MUX2X1 U4 ( .B(data_left[0]), .A(data_right[0]), .S(n2), .Y(n4) );
  INVX2 U5 ( .A(n4), .Y(n35) );
  MUX2X1 U6 ( .B(data_left[1]), .A(data_right[1]), .S(n3), .Y(n5) );
  INVX2 U7 ( .A(n5), .Y(n34) );
  MUX2X1 U8 ( .B(data_left[2]), .A(data_right[2]), .S(n2), .Y(n6) );
  INVX2 U9 ( .A(n6), .Y(n33) );
  MUX2X1 U10 ( .B(data_left[3]), .A(data_right[3]), .S(n3), .Y(n7) );
  INVX2 U11 ( .A(n7), .Y(n32) );
  MUX2X1 U12 ( .B(data_left[4]), .A(data_right[4]), .S(n2), .Y(n8) );
  INVX2 U13 ( .A(n8), .Y(n31) );
  MUX2X1 U14 ( .B(data_left[5]), .A(data_right[5]), .S(n3), .Y(n9) );
  INVX2 U15 ( .A(n9), .Y(n30) );
  MUX2X1 U16 ( .B(data_left[6]), .A(data_right[6]), .S(n2), .Y(n10) );
  INVX2 U17 ( .A(n10), .Y(n29) );
  MUX2X1 U18 ( .B(data_left[7]), .A(data_right[7]), .S(n3), .Y(n11) );
  INVX2 U19 ( .A(n11), .Y(n28) );
  MUX2X1 U20 ( .B(data_left[8]), .A(data_right[8]), .S(n2), .Y(n12) );
  INVX2 U21 ( .A(n12), .Y(n27) );
  MUX2X1 U22 ( .B(data_left[9]), .A(data_right[9]), .S(n3), .Y(n13) );
  INVX2 U23 ( .A(n13), .Y(n26) );
  MUX2X1 U24 ( .B(data_left[10]), .A(data_right[10]), .S(n2), .Y(n14) );
  INVX2 U25 ( .A(n14), .Y(n25) );
  MUX2X1 U26 ( .B(data_left[11]), .A(data_right[11]), .S(n3), .Y(n15) );
  INVX2 U27 ( .A(n15), .Y(n24) );
  MUX2X1 U28 ( .B(data_left[12]), .A(data_right[12]), .S(n2), .Y(n16) );
  INVX2 U29 ( .A(n16), .Y(n23) );
  MUX2X1 U30 ( .B(data_left[13]), .A(data_right[13]), .S(n3), .Y(n17) );
  INVX2 U31 ( .A(n17), .Y(n22) );
  MUX2X1 U32 ( .B(data_left[14]), .A(data_right[14]), .S(n2), .Y(n18) );
  INVX2 U33 ( .A(n18), .Y(n21) );
  MUX2X1 U34 ( .B(data_left[15]), .A(data_right[15]), .S(n3), .Y(n19) );
  INVX2 U35 ( .A(n19), .Y(n20) );
endmodule


module i2s_trnmtr ( clk, n_rst, parallel_data, ws_flag, serial_data, sck );
  input [31:0] parallel_data;
  input clk, n_rst;
  output ws_flag, serial_data, sck;
  wire   clk, load, n1, n2;
  wire   [15:0] data_left;
  wire   [15:0] data_right;
  assign sck = clk;

  i2s_trnmtr_edge_detector_0 EDGE_DETECTOR ( .clk(clk), .n_rst(n_rst), .ws(
        ws_flag) );
  i2s_trnmtr_cntlr CONTROLLER ( .clk(clk), .n_rst(n_rst), .ws(ws_flag), .load(
        load) );
  i2s_trnmtr_double_reg CHANNEL_REGISTERS ( .clk(clk), .n_rst(n_rst), 
        .data_in(parallel_data), .data_left(data_left), .data_right(data_right) );
  i2s_trnmtr_shift_reg SHIFT_REGISTER ( .clk(n2), .n_rst(n_rst), .shift(n1), 
        .load(load), .wsd(ws_flag), .data_left(data_left), .data_right(
        data_right), .data_out(serial_data) );
  INVX2 U1 ( .A(load), .Y(n1) );
  INVX2 U2 ( .A(clk), .Y(n2) );
endmodule


module daf_design_t ( clk, n_rst, ws_in, pot_vol, pot_amp_com, pot_amp_clp, 
        swch_mode_en, mem_clr, serial_data_in, serial_data_out, ws_out, sck );
  input [3:0] pot_vol;
  input [3:0] pot_amp_com;
  input [3:0] pot_amp_clp;
  input [3:0] swch_mode_en;
  input clk, n_rst, ws_in, mem_clr, serial_data_in;
  output serial_data_out, ws_out, sck;
  wire   clk_div, shift_en, sram_rw, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88,
         n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101,
         n102, n103, n104, n105, n106, n107, n108, n109, n110, n111, n112,
         n113, n114, n115, n116, n117, n118, n119, n120, n121, n122, n123,
         n124, n125, n126, n127, n128, n129, n130, n131, n132, n133, n134,
         n135, n136, n137, n138, n139, n140, n141, n142, n143, n144, n145,
         n146, n147, n148, n149, n150, n151, n152, n153, n154, n155, n156,
         n157, n158, n159, n160, n161, n162, n163, n164, n165, n166, n167,
         n168, n169, n170, n171, n172, n173, n174, n175, n176, n177, n178,
         n179, n180, n181, n182, n183, n184, n185, n186, n187, n188, n189,
         n190, n191, n192, n193, n194, n195, n196, n197, n198, n199, n200;
  wire   [31:0] parallel_ampclp_out;
  wire   [31:0] parallel_buf_ampclp;
  wire   [31:0] parallel_ampcom_out;
  wire   [31:0] parallel_buf_ampcom;
  wire   [31:0] parallel_i2s;
  wire   [31:0] parallel_buf_vol;
  wire   [31:0] parallel_vol;
  wire   [31:0] parallel_buf_flang;
  wire   [31:0] sram_read_data;
  wire   [31:0] parallel_flang;
  wire   [31:0] parallel_buf_fad;
  wire   [31:0] parallel_fad;
  wire   [31:0] parallel_buf_trns;
  tri   \*Logic0* ;
  tri   mem_clr;

  AOI22X1 U68 ( .A(swch_mode_en[1]), .B(parallel_ampcom_out[9]), .C(
        parallel_buf_ampcom[9]), .D(n133), .Y(n67) );
  AOI22X1 U69 ( .A(parallel_ampcom_out[8]), .B(swch_mode_en[1]), .C(
        parallel_buf_ampcom[8]), .D(n133), .Y(n68) );
  AOI22X1 U70 ( .A(parallel_ampcom_out[7]), .B(swch_mode_en[1]), .C(
        parallel_buf_ampcom[7]), .D(n133), .Y(n69) );
  AOI22X1 U71 ( .A(parallel_ampcom_out[6]), .B(swch_mode_en[1]), .C(
        parallel_buf_ampcom[6]), .D(n133), .Y(n70) );
  AOI22X1 U72 ( .A(parallel_ampcom_out[5]), .B(swch_mode_en[1]), .C(
        parallel_buf_ampcom[5]), .D(n133), .Y(n71) );
  AOI22X1 U73 ( .A(parallel_ampcom_out[4]), .B(swch_mode_en[1]), .C(
        parallel_buf_ampcom[4]), .D(n133), .Y(n72) );
  AOI22X1 U74 ( .A(parallel_ampcom_out[3]), .B(swch_mode_en[1]), .C(
        parallel_buf_ampcom[3]), .D(n133), .Y(n73) );
  AOI22X1 U75 ( .A(parallel_ampcom_out[31]), .B(swch_mode_en[1]), .C(
        parallel_buf_ampcom[31]), .D(n133), .Y(n74) );
  AOI22X1 U76 ( .A(parallel_ampcom_out[30]), .B(swch_mode_en[1]), .C(
        parallel_buf_ampcom[30]), .D(n133), .Y(n75) );
  AOI22X1 U77 ( .A(parallel_ampcom_out[2]), .B(swch_mode_en[1]), .C(
        parallel_buf_ampcom[2]), .D(n133), .Y(n76) );
  AOI22X1 U78 ( .A(parallel_ampcom_out[29]), .B(swch_mode_en[1]), .C(
        parallel_buf_ampcom[29]), .D(n133), .Y(n77) );
  AOI22X1 U79 ( .A(parallel_ampcom_out[28]), .B(swch_mode_en[1]), .C(
        parallel_buf_ampcom[28]), .D(n133), .Y(n78) );
  AOI22X1 U80 ( .A(parallel_ampcom_out[27]), .B(swch_mode_en[1]), .C(
        parallel_buf_ampcom[27]), .D(n133), .Y(n79) );
  AOI22X1 U81 ( .A(parallel_ampcom_out[26]), .B(swch_mode_en[1]), .C(
        parallel_buf_ampcom[26]), .D(n134), .Y(n80) );
  AOI22X1 U82 ( .A(parallel_ampcom_out[25]), .B(swch_mode_en[1]), .C(
        parallel_buf_ampcom[25]), .D(n134), .Y(n81) );
  AOI22X1 U83 ( .A(parallel_ampcom_out[24]), .B(swch_mode_en[1]), .C(
        parallel_buf_ampcom[24]), .D(n134), .Y(n82) );
  AOI22X1 U84 ( .A(parallel_ampcom_out[23]), .B(swch_mode_en[1]), .C(
        parallel_buf_ampcom[23]), .D(n134), .Y(n83) );
  AOI22X1 U85 ( .A(parallel_ampcom_out[22]), .B(swch_mode_en[1]), .C(
        parallel_buf_ampcom[22]), .D(n134), .Y(n84) );
  AOI22X1 U86 ( .A(parallel_ampcom_out[21]), .B(swch_mode_en[1]), .C(
        parallel_buf_ampcom[21]), .D(n134), .Y(n85) );
  AOI22X1 U87 ( .A(parallel_ampcom_out[20]), .B(swch_mode_en[1]), .C(
        parallel_buf_ampcom[20]), .D(n134), .Y(n86) );
  AOI22X1 U88 ( .A(parallel_ampcom_out[1]), .B(swch_mode_en[1]), .C(
        parallel_buf_ampcom[1]), .D(n134), .Y(n87) );
  AOI22X1 U89 ( .A(parallel_ampcom_out[19]), .B(swch_mode_en[1]), .C(
        parallel_buf_ampcom[19]), .D(n134), .Y(n88) );
  AOI22X1 U90 ( .A(parallel_ampcom_out[18]), .B(swch_mode_en[1]), .C(
        parallel_buf_ampcom[18]), .D(n134), .Y(n89) );
  AOI22X1 U91 ( .A(parallel_ampcom_out[17]), .B(swch_mode_en[1]), .C(
        parallel_buf_ampcom[17]), .D(n134), .Y(n90) );
  AOI22X1 U92 ( .A(parallel_ampcom_out[16]), .B(swch_mode_en[1]), .C(
        parallel_buf_ampcom[16]), .D(n134), .Y(n91) );
  AOI22X1 U93 ( .A(parallel_ampcom_out[15]), .B(swch_mode_en[1]), .C(
        parallel_buf_ampcom[15]), .D(n134), .Y(n92) );
  AOI22X1 U94 ( .A(parallel_ampcom_out[14]), .B(swch_mode_en[1]), .C(
        parallel_buf_ampcom[14]), .D(n133), .Y(n93) );
  AOI22X1 U95 ( .A(parallel_ampcom_out[13]), .B(swch_mode_en[1]), .C(
        parallel_buf_ampcom[13]), .D(n134), .Y(n94) );
  AOI22X1 U96 ( .A(parallel_ampcom_out[12]), .B(swch_mode_en[1]), .C(
        parallel_buf_ampcom[12]), .D(n133), .Y(n95) );
  AOI22X1 U97 ( .A(parallel_ampcom_out[11]), .B(swch_mode_en[1]), .C(
        parallel_buf_ampcom[11]), .D(n134), .Y(n96) );
  AOI22X1 U98 ( .A(parallel_ampcom_out[10]), .B(swch_mode_en[1]), .C(
        parallel_buf_ampcom[10]), .D(n133), .Y(n97) );
  AOI22X1 U99 ( .A(parallel_ampcom_out[0]), .B(swch_mode_en[1]), .C(
        parallel_buf_ampcom[0]), .D(n134), .Y(n98) );
  AOI22X1 U100 ( .A(swch_mode_en[2]), .B(parallel_ampclp_out[9]), .C(
        parallel_buf_ampclp[9]), .D(n135), .Y(n99) );
  AOI22X1 U101 ( .A(parallel_ampclp_out[8]), .B(swch_mode_en[2]), .C(
        parallel_buf_ampclp[8]), .D(n135), .Y(n100) );
  AOI22X1 U102 ( .A(parallel_ampclp_out[7]), .B(swch_mode_en[2]), .C(
        parallel_buf_ampclp[7]), .D(n135), .Y(n101) );
  AOI22X1 U103 ( .A(parallel_ampclp_out[6]), .B(swch_mode_en[2]), .C(
        parallel_buf_ampclp[6]), .D(n135), .Y(n102) );
  AOI22X1 U104 ( .A(parallel_ampclp_out[5]), .B(swch_mode_en[2]), .C(
        parallel_buf_ampclp[5]), .D(n135), .Y(n103) );
  AOI22X1 U105 ( .A(parallel_ampclp_out[4]), .B(swch_mode_en[2]), .C(
        parallel_buf_ampclp[4]), .D(n135), .Y(n104) );
  AOI22X1 U106 ( .A(parallel_ampclp_out[3]), .B(swch_mode_en[2]), .C(
        parallel_buf_ampclp[3]), .D(n135), .Y(n105) );
  AOI22X1 U107 ( .A(parallel_ampclp_out[31]), .B(swch_mode_en[2]), .C(
        parallel_buf_ampclp[31]), .D(n135), .Y(n106) );
  AOI22X1 U108 ( .A(parallel_ampclp_out[30]), .B(swch_mode_en[2]), .C(
        parallel_buf_ampclp[30]), .D(n135), .Y(n107) );
  AOI22X1 U109 ( .A(parallel_ampclp_out[2]), .B(swch_mode_en[2]), .C(
        parallel_buf_ampclp[2]), .D(n135), .Y(n108) );
  AOI22X1 U110 ( .A(parallel_ampclp_out[29]), .B(swch_mode_en[2]), .C(
        parallel_buf_ampclp[29]), .D(n135), .Y(n109) );
  AOI22X1 U111 ( .A(parallel_ampclp_out[28]), .B(swch_mode_en[2]), .C(
        parallel_buf_ampclp[28]), .D(n135), .Y(n110) );
  AOI22X1 U112 ( .A(parallel_ampclp_out[27]), .B(swch_mode_en[2]), .C(
        parallel_buf_ampclp[27]), .D(n135), .Y(n111) );
  AOI22X1 U113 ( .A(parallel_ampclp_out[26]), .B(swch_mode_en[2]), .C(
        parallel_buf_ampclp[26]), .D(n136), .Y(n112) );
  AOI22X1 U114 ( .A(parallel_ampclp_out[25]), .B(swch_mode_en[2]), .C(
        parallel_buf_ampclp[25]), .D(n136), .Y(n113) );
  AOI22X1 U115 ( .A(parallel_ampclp_out[24]), .B(swch_mode_en[2]), .C(
        parallel_buf_ampclp[24]), .D(n136), .Y(n114) );
  AOI22X1 U116 ( .A(parallel_ampclp_out[23]), .B(swch_mode_en[2]), .C(
        parallel_buf_ampclp[23]), .D(n136), .Y(n115) );
  AOI22X1 U117 ( .A(parallel_ampclp_out[22]), .B(swch_mode_en[2]), .C(
        parallel_buf_ampclp[22]), .D(n136), .Y(n116) );
  AOI22X1 U118 ( .A(parallel_ampclp_out[21]), .B(swch_mode_en[2]), .C(
        parallel_buf_ampclp[21]), .D(n136), .Y(n117) );
  AOI22X1 U119 ( .A(parallel_ampclp_out[20]), .B(swch_mode_en[2]), .C(
        parallel_buf_ampclp[20]), .D(n136), .Y(n118) );
  AOI22X1 U120 ( .A(parallel_ampclp_out[1]), .B(swch_mode_en[2]), .C(
        parallel_buf_ampclp[1]), .D(n136), .Y(n119) );
  AOI22X1 U121 ( .A(parallel_ampclp_out[19]), .B(swch_mode_en[2]), .C(
        parallel_buf_ampclp[19]), .D(n136), .Y(n120) );
  AOI22X1 U122 ( .A(parallel_ampclp_out[18]), .B(swch_mode_en[2]), .C(
        parallel_buf_ampclp[18]), .D(n136), .Y(n121) );
  AOI22X1 U123 ( .A(parallel_ampclp_out[17]), .B(swch_mode_en[2]), .C(
        parallel_buf_ampclp[17]), .D(n136), .Y(n122) );
  AOI22X1 U124 ( .A(parallel_ampclp_out[16]), .B(swch_mode_en[2]), .C(
        parallel_buf_ampclp[16]), .D(n136), .Y(n123) );
  AOI22X1 U125 ( .A(parallel_ampclp_out[15]), .B(swch_mode_en[2]), .C(
        parallel_buf_ampclp[15]), .D(n136), .Y(n124) );
  AOI22X1 U126 ( .A(parallel_ampclp_out[14]), .B(swch_mode_en[2]), .C(
        parallel_buf_ampclp[14]), .D(n135), .Y(n125) );
  AOI22X1 U127 ( .A(parallel_ampclp_out[13]), .B(swch_mode_en[2]), .C(
        parallel_buf_ampclp[13]), .D(n136), .Y(n126) );
  AOI22X1 U128 ( .A(parallel_ampclp_out[12]), .B(swch_mode_en[2]), .C(
        parallel_buf_ampclp[12]), .D(n135), .Y(n127) );
  AOI22X1 U129 ( .A(parallel_ampclp_out[11]), .B(swch_mode_en[2]), .C(
        parallel_buf_ampclp[11]), .D(n136), .Y(n128) );
  AOI22X1 U130 ( .A(parallel_ampclp_out[10]), .B(swch_mode_en[2]), .C(
        parallel_buf_ampclp[10]), .D(n135), .Y(n129) );
  AOI22X1 U131 ( .A(parallel_ampclp_out[0]), .B(swch_mode_en[2]), .C(
        parallel_buf_ampclp[0]), .D(n136), .Y(n130) );
  clk_div DIVIDER ( .clk(clk), .n_rst(n_rst), .clk_div(clk_div), .shift_en(
        shift_en) );
  i2s_rcvr I2SRCVR ( .clk(clk), .n_rst(n_rst), .ws(ws_in), .serial_data(
        serial_data_in), .parallel_data(parallel_i2s) );
  flex_buffer_NUM_BITS32_5 BVOL ( .clk(n131), .n_rst(n_rst), .input_data(
        parallel_i2s), .output_data(parallel_buf_vol) );
  volume_mult_1 VOL1 ( .channel_data(parallel_buf_vol[31:16]), .pot_data(
        pot_vol), .output_data(parallel_vol[31:16]) );
  volume_mult_0 VOL2 ( .channel_data(parallel_buf_vol[15:0]), .pot_data(
        pot_vol), .output_data(parallel_vol[15:0]) );
  flex_buffer_NUM_BITS32_4 BFLANG ( .clk(n131), .n_rst(n_rst), .input_data(
        parallel_vol), .output_data(parallel_buf_flang) );
  flanger FLANG ( .clk(clk), .n_rst(n_rst), .flanger_en(swch_mode_en[3]), 
        .shift_en(shift_en), .input_data(parallel_buf_flang), .read_data(
        sram_read_data), .output_data(parallel_flang), .sram_rw(sram_rw) );
  sram_controller SRAMC ( .clk(clk), .n_rst(n_rst), .rw_trigger(sram_rw), 
        .mem_clr(mem_clr), .mem_init(1'b0), .mem_dump(1'b0), .write_data(
        parallel_buf_flang), .sram_data(sram_read_data) );
  flex_buffer_NUM_BITS32_3 BAMPCLP ( .clk(n132), .n_rst(n_rst), .input_data(
        parallel_flang), .output_data(parallel_buf_ampclp) );
  amp_clip_1 AMPCLP1 ( .inchan(parallel_buf_ampclp[31:16]), .comp_in(
        pot_amp_clp), .outchan(parallel_ampclp_out[31:16]) );
  amp_clip_0 AMPCLP2 ( .inchan(parallel_buf_ampclp[15:0]), .comp_in(
        pot_amp_clp), .outchan(parallel_ampclp_out[15:0]) );
  flex_buffer_NUM_BITS32_2 BAMPCOMP ( .clk(n132), .n_rst(n_rst), .input_data({
        n185, n191, n190, n189, n188, n187, n200, n199, n198, n197, n196, n195, 
        n194, n193, n192, n186, n178, n179, n180, n181, n174, n175, n176, n177, 
        n170, n171, n172, n173, n169, n182, n183, n184}), .output_data(
        parallel_buf_ampcom) );
  amp_comp_1 AMPCMP1 ( .clk(n132), .n_rst(n_rst), .inchan(
        parallel_buf_ampcom[31:16]), .in_thresh(pot_amp_com), .outchan(
        parallel_ampcom_out[31:16]) );
  amp_comp_0 AMPCMP2 ( .clk(n132), .n_rst(n_rst), .inchan(
        parallel_buf_ampcom[15:0]), .in_thresh(pot_amp_com), .outchan(
        parallel_ampcom_out[15:0]) );
  flex_buffer_NUM_BITS32_1 BFAD ( .clk(n131), .n_rst(n_rst), .input_data({n158, 
        n159, n160, n161, n154, n155, n156, n157, n153, n162, n163, n164, n165, 
        n166, n167, n168, n137, n138, n139, n140, n141, n142, n143, n144, n145, 
        n146, n147, n148, n149, n150, n151, n152}), .output_data(
        parallel_buf_fad) );
  fader FAD ( .clk(clk), .n_reset(n_rst), .clear(1'b0), .fad_enable(
        swch_mode_en[0]), .signal_in(parallel_buf_fad), .signal_out(
        parallel_fad) );
  flex_buffer_NUM_BITS32_0 BUFTRNS ( .clk(clk), .n_rst(n_rst), .input_data(
        parallel_fad), .output_data(parallel_buf_trns) );
  i2s_trnmtr I2STRNS ( .clk(clk), .n_rst(n_rst), .parallel_data(
        parallel_buf_trns), .ws_flag(ws_out), .serial_data(serial_data_out), 
        .sck(sck) );
  BUFX2 U132 ( .A(clk_div), .Y(n132) );
  BUFX2 U133 ( .A(clk_div), .Y(n131) );
  INVX2 U134 ( .A(swch_mode_en[2]), .Y(n136) );
  INVX2 U135 ( .A(swch_mode_en[2]), .Y(n135) );
  INVX2 U136 ( .A(swch_mode_en[1]), .Y(n134) );
  INVX2 U137 ( .A(swch_mode_en[1]), .Y(n133) );
  INVX2 U138 ( .A(n92), .Y(n137) );
  INVX2 U139 ( .A(n93), .Y(n138) );
  INVX2 U140 ( .A(n94), .Y(n139) );
  INVX2 U141 ( .A(n95), .Y(n140) );
  INVX2 U142 ( .A(n96), .Y(n141) );
  INVX2 U143 ( .A(n97), .Y(n142) );
  INVX2 U144 ( .A(n67), .Y(n143) );
  INVX2 U145 ( .A(n68), .Y(n144) );
  INVX2 U146 ( .A(n69), .Y(n145) );
  INVX2 U147 ( .A(n70), .Y(n146) );
  INVX2 U148 ( .A(n71), .Y(n147) );
  INVX2 U149 ( .A(n72), .Y(n148) );
  INVX2 U150 ( .A(n73), .Y(n149) );
  INVX2 U151 ( .A(n76), .Y(n150) );
  INVX2 U152 ( .A(n87), .Y(n151) );
  INVX2 U153 ( .A(n98), .Y(n152) );
  INVX2 U154 ( .A(n83), .Y(n153) );
  INVX2 U155 ( .A(n79), .Y(n154) );
  INVX2 U156 ( .A(n80), .Y(n155) );
  INVX2 U157 ( .A(n81), .Y(n156) );
  INVX2 U158 ( .A(n82), .Y(n157) );
  INVX2 U159 ( .A(n74), .Y(n158) );
  INVX2 U160 ( .A(n75), .Y(n159) );
  INVX2 U161 ( .A(n77), .Y(n160) );
  INVX2 U162 ( .A(n78), .Y(n161) );
  INVX2 U163 ( .A(n84), .Y(n162) );
  INVX2 U164 ( .A(n85), .Y(n163) );
  INVX2 U165 ( .A(n86), .Y(n164) );
  INVX2 U166 ( .A(n88), .Y(n165) );
  INVX2 U167 ( .A(n89), .Y(n166) );
  INVX2 U168 ( .A(n90), .Y(n167) );
  INVX2 U169 ( .A(n91), .Y(n168) );
  INVX2 U170 ( .A(n105), .Y(n169) );
  INVX2 U171 ( .A(n101), .Y(n170) );
  INVX2 U172 ( .A(n102), .Y(n171) );
  INVX2 U173 ( .A(n103), .Y(n172) );
  INVX2 U174 ( .A(n104), .Y(n173) );
  INVX2 U175 ( .A(n128), .Y(n174) );
  INVX2 U176 ( .A(n129), .Y(n175) );
  INVX2 U177 ( .A(n99), .Y(n176) );
  INVX2 U178 ( .A(n100), .Y(n177) );
  INVX2 U179 ( .A(n124), .Y(n178) );
  INVX2 U180 ( .A(n125), .Y(n179) );
  INVX2 U181 ( .A(n126), .Y(n180) );
  INVX2 U182 ( .A(n127), .Y(n181) );
  INVX2 U183 ( .A(n108), .Y(n182) );
  INVX2 U184 ( .A(n119), .Y(n183) );
  INVX2 U185 ( .A(n130), .Y(n184) );
  INVX2 U186 ( .A(n106), .Y(n185) );
  INVX2 U187 ( .A(n123), .Y(n186) );
  INVX2 U188 ( .A(n112), .Y(n187) );
  INVX2 U189 ( .A(n111), .Y(n188) );
  INVX2 U190 ( .A(n110), .Y(n189) );
  INVX2 U191 ( .A(n109), .Y(n190) );
  INVX2 U192 ( .A(n107), .Y(n191) );
  INVX2 U193 ( .A(n122), .Y(n192) );
  INVX2 U194 ( .A(n121), .Y(n193) );
  INVX2 U195 ( .A(n120), .Y(n194) );
  INVX2 U196 ( .A(n118), .Y(n195) );
  INVX2 U197 ( .A(n117), .Y(n196) );
  INVX2 U198 ( .A(n116), .Y(n197) );
  INVX2 U199 ( .A(n115), .Y(n198) );
  INVX2 U200 ( .A(n114), .Y(n199) );
  INVX2 U201 ( .A(n113), .Y(n200) );
endmodule

module  daf_design ( clk, n_rst, ws_in, pot_vol, pot_amp_com, pot_amp_clp, swch_mode_en, 
	mem_clr, serial_data_in, serial_data_out, ws_out, sck );
input   [3:0] pot_vol;
input   [3:0] pot_amp_com;
input   [3:0] pot_amp_clp;
input   [3:0] swch_mode_en;
input   clk, n_rst, ws_in, mem_clr, serial_data_in;
output  serial_data_out, ws_out, sck;

wire   [3:0] npot_vol;
wire   [3:0] npot_amp_com;
wire   [3:0] npot_amp_clp;
wire   [3:0] nswch_mode_en;
wire   nclk, nn_rst, nws_in, nmem_clr, nserial_data_in;
wire  nserial_data_out, nws_out, nsck;

PADVDD U1 (  );
PADGND U2 (  );
PADOUT U41 ( .DO(nsck), .YPAD(sck) );
PADOUT U42 ( .DO(nserial_data_out), .YPAD(serial_data_out) );
PADOUT U43 ( .DO(nws_out), .YPAD(ws_out) );
PADINC U44 ( .DI(nclk), .YPAD(clk) );
PADINC U45 ( .DI(nmem_clr), .YPAD(mem_clr) );
PADINC U46 ( .DI(nn_rst), .YPAD(n_rst) );
PADINC U47 ( .DI(npot_amp_clp[0]), .YPAD(pot_amp_clp[0]) );
PADINC U48 ( .DI(npot_amp_clp[1]), .YPAD(pot_amp_clp[1]) );
PADINC U49 ( .DI(npot_amp_clp[2]), .YPAD(pot_amp_clp[2]) );
PADINC U50 ( .DI(npot_amp_clp[3]), .YPAD(pot_amp_clp[3]) );
PADINC U51 ( .DI(npot_amp_com[0]), .YPAD(pot_amp_com[0]) );
PADINC U52 ( .DI(npot_amp_com[1]), .YPAD(pot_amp_com[1]) );
PADINC U53 ( .DI(npot_amp_com[2]), .YPAD(pot_amp_com[2]) );
PADINC U54 ( .DI(npot_amp_com[3]), .YPAD(pot_amp_com[3]) );
PADINC U55 ( .DI(npot_vol[0]), .YPAD(pot_vol[0]) );
PADINC U56 ( .DI(npot_vol[1]), .YPAD(pot_vol[1]) );
PADINC U57 ( .DI(npot_vol[2]), .YPAD(pot_vol[2]) );
PADINC U58 ( .DI(npot_vol[3]), .YPAD(pot_vol[3]) );
PADINC U59 ( .DI(nserial_data_in), .YPAD(serial_data_in) );
PADINC U60 ( .DI(nswch_mode_en[0]), .YPAD(swch_mode_en[0]) );
PADINC U61 ( .DI(nswch_mode_en[1]), .YPAD(swch_mode_en[1]) );
PADINC U62 ( .DI(nswch_mode_en[2]), .YPAD(swch_mode_en[2]) );
PADINC U63 ( .DI(nswch_mode_en[3]), .YPAD(swch_mode_en[3]) );
PADINC U64 ( .DI(nws_in), .YPAD(ws_in) );

endmodule
/*
module  daf_design ( clk, n_rst, ws_in, pot_vol, pot_amp_com, pot_amp_clp, swch_mode_en, 
	mem_clr, serial_data_in, serial_data_out, ws_out, sck );

input   [3:0] pot_vol;
input   [3:0] pot_amp_com;
input   [3:0] pot_amp_clp;
input   [3:0] swch_mode_en;
input   clk, n_rst, ws_in, mem_clr, serial_data_in;
output  serial_data_out, ws_out, sck, _data(parallel_buf_vol) ), _data(parallel_vol[31:16]) );
output  _data(parallel_vol[15:0]) );
output  _data(parallel_buf_flang) ), _data(parallel_flang), .sram_rw(sram_rw) ), _data(parallel_buf_ampclp) ), _data(parallel_buf_trns) );
wire	nclk, nn_rst, nws_in, nmem_clr, nserial_data_in, nserial_data_out, nws_out, nsck, n_data(parallel_buf_vol) ), n_data(parallel_buf_flang) ), n_data(parallel_flang), n.sram_rw(sram_rw) ), n_data(parallel_buf_ampclp) ), n_data(parallel_buf_trns) );

wire	[3:0] npot_vol;
wire	[3:0] npot_amp_com;
wire	[3:0] npot_amp_clp;
wire	[3:0] nswch_mode_en;
wire	[31:16] n) );
wire	[15:0] n) );
        daf_design_t I0 ( .clk(nclk), .n_rst(nn_rst), .ws_in(nws_in), .pot_vol(npot_vol), 
	.pot_amp_com(npot_amp_com), .pot_amp_clp(npot_amp_clp), .swch_mode_en(nswch_mode_en), 
	.mem_clr(nmem_clr), .serial_data_in(nserial_data_in), .serial_data_out(nserial_data_out), 
	.ws_out(nws_out), .sck(nsck) );

PADVDD U1 (  );
PADGND U2 (  );
PADOUT U3 ( .DO(n) )[0]), .YPAD() )[0]) );
PADOUT U4 ( .DO(n) )[10]), .YPAD() )[10]) );
PADOUT U5 ( .DO(n) )[11]), .YPAD() )[11]) );
PADOUT U6 ( .DO(n) )[12]), .YPAD() )[12]) );
PADOUT U7 ( .DO(n) )[13]), .YPAD() )[13]) );
PADOUT U8 ( .DO(n) )[14]), .YPAD() )[14]) );
PADOUT U9 ( .DO(n) )[15]), .YPAD() )[15]) );
PADOUT U10 ( .DO(n) )[16]), .YPAD() )[16]) );
PADOUT U11 ( .DO(n) )[17]), .YPAD() )[17]) );
PADOUT U12 ( .DO(n) )[18]), .YPAD() )[18]) );
PADOUT U13 ( .DO(n) )[19]), .YPAD() )[19]) );
PADOUT U14 ( .DO(n) )[1]), .YPAD() )[1]) );
PADOUT U15 ( .DO(n) )[20]), .YPAD() )[20]) );
PADOUT U16 ( .DO(n) )[21]), .YPAD() )[21]) );
PADOUT U17 ( .DO(n) )[22]), .YPAD() )[22]) );
PADOUT U18 ( .DO(n) )[23]), .YPAD() )[23]) );
PADOUT U19 ( .DO(n) )[24]), .YPAD() )[24]) );
PADOUT U20 ( .DO(n) )[25]), .YPAD() )[25]) );
PADOUT U21 ( .DO(n) )[26]), .YPAD() )[26]) );
PADOUT U22 ( .DO(n) )[27]), .YPAD() )[27]) );
PADOUT U23 ( .DO(n) )[28]), .YPAD() )[28]) );
PADOUT U24 ( .DO(n) )[29]), .YPAD() )[29]) );
PADOUT U25 ( .DO(n) )[2]), .YPAD() )[2]) );
PADOUT U26 ( .DO(n) )[30]), .YPAD() )[30]) );
PADOUT U27 ( .DO(n) )[31]), .YPAD() )[31]) );
PADOUT U28 ( .DO(n) )[3]), .YPAD() )[3]) );
PADOUT U29 ( .DO(n) )[4]), .YPAD() )[4]) );
PADOUT U30 ( .DO(n) )[5]), .YPAD() )[5]) );
PADOUT U31 ( .DO(n) )[6]), .YPAD() )[6]) );
PADOUT U32 ( .DO(n) )[7]), .YPAD() )[7]) );
PADOUT U33 ( .DO(n) )[8]), .YPAD() )[8]) );
PADOUT U34 ( .DO(n) )[9]), .YPAD() )[9]) );
PADOUT U35 ( .DO(n.sram_rw(sram_rw) )), .YPAD(.sram_rw(sram_rw) )) );
PADOUT U36 ( .DO(n_data(parallel_buf_ampclp) )), .YPAD(_data(parallel_buf_ampclp) )) );
PADOUT U37 ( .DO(n_data(parallel_buf_flang) )), .YPAD(_data(parallel_buf_flang) )) );
PADOUT U38 ( .DO(n_data(parallel_buf_trns) )), .YPAD(_data(parallel_buf_trns) )) );
PADOUT U39 ( .DO(n_data(parallel_buf_vol) )), .YPAD(_data(parallel_buf_vol) )) );
PADOUT U40 ( .DO(n_data(parallel_flang)), .YPAD(_data(parallel_flang)) );
PADOUT U41 ( .DO(nsck), .YPAD(sck) );
PADOUT U42 ( .DO(nserial_data_out), .YPAD(serial_data_out) );
PADOUT U43 ( .DO(nws_out), .YPAD(ws_out) );
PADINC U44 ( .DI(nclk), .YPAD(clk) );
PADINC U45 ( .DI(nmem_clr), .YPAD(mem_clr) );
PADINC U46 ( .DI(nn_rst), .YPAD(n_rst) );
PADINC U47 ( .DI(npot_amp_clp[0]), .YPAD(pot_amp_clp[0]) );
PADINC U48 ( .DI(npot_amp_clp[1]), .YPAD(pot_amp_clp[1]) );
PADINC U49 ( .DI(npot_amp_clp[2]), .YPAD(pot_amp_clp[2]) );
PADINC U50 ( .DI(npot_amp_clp[3]), .YPAD(pot_amp_clp[3]) );
PADINC U51 ( .DI(npot_amp_com[0]), .YPAD(pot_amp_com[0]) );
PADINC U52 ( .DI(npot_amp_com[1]), .YPAD(pot_amp_com[1]) );
PADINC U53 ( .DI(npot_amp_com[2]), .YPAD(pot_amp_com[2]) );
PADINC U54 ( .DI(npot_amp_com[3]), .YPAD(pot_amp_com[3]) );
PADINC U55 ( .DI(npot_vol[0]), .YPAD(pot_vol[0]) );
PADINC U56 ( .DI(npot_vol[1]), .YPAD(pot_vol[1]) );
PADINC U57 ( .DI(npot_vol[2]), .YPAD(pot_vol[2]) );
PADINC U58 ( .DI(npot_vol[3]), .YPAD(pot_vol[3]) );
PADINC U59 ( .DI(nserial_data_in), .YPAD(serial_data_in) );
PADINC U60 ( .DI(nswch_mode_en[0]), .YPAD(swch_mode_en[0]) );
PADINC U61 ( .DI(nswch_mode_en[1]), .YPAD(swch_mode_en[1]) );
PADINC U62 ( .DI(nswch_mode_en[2]), .YPAD(swch_mode_en[2]) );
PADINC U63 ( .DI(nswch_mode_en[3]), .YPAD(swch_mode_en[3]) );
PADINC U64 ( .DI(nws_in), .YPAD(ws_in) );

endmodule
*/
