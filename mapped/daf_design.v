
module clk_div ( clk, n_rst, clk_div, shift_en );
  input clk, n_rst;
  output clk_div, shift_en;
  wire   N5, N6, N7, n10, \add_35/carry[4] , \add_35/carry[3] ,
         \add_35/carry[2] , n1, n2, n3, n4, n12;
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
  HAX1 \add_35/U1_1_1  ( .A(curr_c[1]), .B(curr_c[0]), .YC(\add_35/carry[2] ), 
        .YS(N5) );
  HAX1 \add_35/U1_1_2  ( .A(curr_c[2]), .B(\add_35/carry[2] ), .YC(
        \add_35/carry[3] ), .YS(N6) );
  HAX1 \add_35/U1_1_3  ( .A(curr_c[3]), .B(\add_35/carry[3] ), .YC(
        \add_35/carry[4] ), .YS(N7) );
  AND2X1 U3 ( .A(n1), .B(clk_div), .Y(shift_en) );
  NOR2X1 U4 ( .A(n1), .B(n2), .Y(next_c[4]) );
  XNOR2X1 U5 ( .A(curr_c[4]), .B(\add_35/carry[4] ), .Y(n2) );
  AND2X1 U6 ( .A(N7), .B(n3), .Y(next_c[3]) );
  AND2X1 U7 ( .A(N6), .B(n3), .Y(next_c[2]) );
  AND2X1 U8 ( .A(N5), .B(n3), .Y(next_c[1]) );
  INVX1 U9 ( .A(curr_c[0]), .Y(next_c[0]) );
  XOR2X1 U10 ( .A(clk_div), .B(n1), .Y(n10) );
  INVX1 U11 ( .A(n3), .Y(n1) );
  NAND3X1 U12 ( .A(curr_c[4]), .B(curr_c[0]), .C(n4), .Y(n3) );
  NOR2X1 U13 ( .A(curr_c[1]), .B(n12), .Y(n4) );
  OR2X1 U20 ( .A(curr_c[3]), .B(curr_c[2]), .Y(n12) );
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
  wire   r_flag_next, N8, N9, N10, n27, n28, n29, n30, n31, \add_53/carry[4] ,
         \add_53/carry[3] , \add_53/carry[2] , n1, n2, n3, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n32,
         n33, n34, n35;

  DFFSR \counter_reg[0]  ( .D(n31), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \counter_reg[4]  ( .D(n27), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[4]) );
  DFFSR \counter_reg[1]  ( .D(n30), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \counter_reg[2]  ( .D(n29), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \counter_reg[3]  ( .D(n28), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR r_flag_reg ( .D(r_flag_next), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  HAX1 \add_53/U1_1_1  ( .A(count_out[1]), .B(count_out[0]), .YC(
        \add_53/carry[2] ), .YS(N8) );
  HAX1 \add_53/U1_1_2  ( .A(count_out[2]), .B(\add_53/carry[2] ), .YC(
        \add_53/carry[3] ), .YS(N9) );
  HAX1 \add_53/U1_1_3  ( .A(count_out[3]), .B(\add_53/carry[3] ), .YC(
        \add_53/carry[4] ), .YS(N10) );
  MUX2X1 U5 ( .B(n1), .A(n2), .S(count_out[0]), .Y(n31) );
  OAI21X1 U10 ( .A(n3), .B(n2), .C(n10), .Y(n30) );
  NAND2X1 U11 ( .A(N8), .B(n11), .Y(n10) );
  INVX1 U12 ( .A(count_out[1]), .Y(n3) );
  OAI21X1 U13 ( .A(n12), .B(n2), .C(n13), .Y(n29) );
  NAND2X1 U14 ( .A(N9), .B(n11), .Y(n13) );
  OAI21X1 U15 ( .A(n14), .B(n2), .C(n15), .Y(n28) );
  NAND2X1 U16 ( .A(N10), .B(n11), .Y(n15) );
  MUX2X1 U17 ( .B(n16), .A(n17), .S(count_out[4]), .Y(n27) );
  INVX1 U18 ( .A(n18), .Y(n17) );
  OAI21X1 U19 ( .A(n1), .B(\add_53/carry[4] ), .C(n2), .Y(n18) );
  INVX1 U20 ( .A(n11), .Y(n1) );
  NAND2X1 U21 ( .A(\add_53/carry[4] ), .B(n11), .Y(n16) );
  NOR2X1 U22 ( .A(n19), .B(n20), .Y(n11) );
  OAI21X1 U23 ( .A(n21), .B(n22), .C(n2), .Y(n20) );
  OR2X1 U24 ( .A(clear), .B(count_enable), .Y(n2) );
  NAND2X1 U25 ( .A(count_out[4]), .B(count_out[3]), .Y(n22) );
  NAND3X1 U26 ( .A(count_out[0]), .B(count_out[2]), .C(count_out[1]), .Y(n21)
         );
  OR2X1 U27 ( .A(r_flag_next), .B(clear), .Y(n19) );
  INVX1 U28 ( .A(n23), .Y(r_flag_next) );
  NAND3X1 U29 ( .A(n24), .B(n25), .C(n26), .Y(n23) );
  NOR2X1 U30 ( .A(n32), .B(n33), .Y(n26) );
  XOR2X1 U31 ( .A(rollover_val[4]), .B(count_out[4]), .Y(n33) );
  XNOR2X1 U32 ( .A(rollover_val[3]), .B(n14), .Y(n32) );
  INVX1 U33 ( .A(count_out[3]), .Y(n14) );
  XNOR2X1 U34 ( .A(count_out[1]), .B(rollover_val[1]), .Y(n25) );
  NOR2X1 U35 ( .A(n34), .B(n35), .Y(n24) );
  XOR2X1 U36 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n35) );
  XNOR2X1 U37 ( .A(rollover_val[2]), .B(n12), .Y(n34) );
  INVX1 U38 ( .A(count_out[2]), .Y(n12) );
endmodule


module i2s_rcvr_input_cntlr ( clk, n_rst, shift );
  input clk, n_rst;
  output shift;
  wire   n5, data_ready, n3, n4;

  DFFSR shift_current_reg ( .D(n3), .CLK(clk), .R(n_rst), .S(1'b1), .Q(n5) );
  flex_counter_NUM_CNT_BITS5_1 EDGE_COUNTER_1 ( .clk(n4), .n_rst(n_rst), 
        .clear(1'b0), .count_enable(1'b1), .rollover_val({1'b1, 1'b0, 1'b0, 
        1'b0, 1'b0}), .rollover_flag(data_ready) );
  BUFX4 U4 ( .A(n5), .Y(shift) );
  INVX1 U5 ( .A(data_ready), .Y(n3) );
  INVX1 U6 ( .A(clk), .Y(n4) );
endmodule


module flex_stp_sr_NUM_BITS32 ( clk, n_rst, shift_enable, serial_in, 
        parallel_out );
  output [31:0] parallel_out;
  input clk, n_rst, shift_enable, serial_in;
  wire   n36, n38, n40, n42, n44, n46, n48, n50, n52, n54, n56, n58, n60, n62,
         n64, n66, n68, n70, n72, n74, n76, n78, n80, n82, n84, n86, n88, n90,
         n92, n94, n96, n98, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32;

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
  INVX1 U2 ( .A(n1), .Y(n98) );
  MUX2X1 U3 ( .B(parallel_out[0]), .A(serial_in), .S(shift_enable), .Y(n1) );
  INVX1 U4 ( .A(n2), .Y(n96) );
  MUX2X1 U5 ( .B(parallel_out[1]), .A(parallel_out[0]), .S(shift_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n94) );
  MUX2X1 U7 ( .B(parallel_out[2]), .A(parallel_out[1]), .S(shift_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n92) );
  MUX2X1 U9 ( .B(parallel_out[3]), .A(parallel_out[2]), .S(shift_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n90) );
  MUX2X1 U11 ( .B(parallel_out[4]), .A(parallel_out[3]), .S(shift_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n88) );
  MUX2X1 U13 ( .B(parallel_out[5]), .A(parallel_out[4]), .S(shift_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n86) );
  MUX2X1 U15 ( .B(parallel_out[6]), .A(parallel_out[5]), .S(shift_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n84) );
  MUX2X1 U17 ( .B(parallel_out[7]), .A(parallel_out[6]), .S(shift_enable), .Y(
        n8) );
  INVX1 U18 ( .A(n9), .Y(n82) );
  MUX2X1 U19 ( .B(parallel_out[8]), .A(parallel_out[7]), .S(shift_enable), .Y(
        n9) );
  INVX1 U20 ( .A(n10), .Y(n80) );
  MUX2X1 U21 ( .B(parallel_out[9]), .A(parallel_out[8]), .S(shift_enable), .Y(
        n10) );
  INVX1 U22 ( .A(n11), .Y(n78) );
  MUX2X1 U23 ( .B(parallel_out[10]), .A(parallel_out[9]), .S(shift_enable), 
        .Y(n11) );
  INVX1 U24 ( .A(n12), .Y(n76) );
  MUX2X1 U25 ( .B(parallel_out[11]), .A(parallel_out[10]), .S(shift_enable), 
        .Y(n12) );
  INVX1 U26 ( .A(n13), .Y(n74) );
  MUX2X1 U27 ( .B(parallel_out[12]), .A(parallel_out[11]), .S(shift_enable), 
        .Y(n13) );
  INVX1 U28 ( .A(n14), .Y(n72) );
  MUX2X1 U29 ( .B(parallel_out[13]), .A(parallel_out[12]), .S(shift_enable), 
        .Y(n14) );
  INVX1 U30 ( .A(n15), .Y(n70) );
  MUX2X1 U31 ( .B(parallel_out[14]), .A(parallel_out[13]), .S(shift_enable), 
        .Y(n15) );
  INVX1 U32 ( .A(n16), .Y(n68) );
  MUX2X1 U33 ( .B(parallel_out[15]), .A(parallel_out[14]), .S(shift_enable), 
        .Y(n16) );
  INVX1 U34 ( .A(n17), .Y(n66) );
  MUX2X1 U35 ( .B(parallel_out[16]), .A(parallel_out[15]), .S(shift_enable), 
        .Y(n17) );
  INVX1 U36 ( .A(n18), .Y(n64) );
  MUX2X1 U37 ( .B(parallel_out[17]), .A(parallel_out[16]), .S(shift_enable), 
        .Y(n18) );
  INVX1 U38 ( .A(n19), .Y(n62) );
  MUX2X1 U39 ( .B(parallel_out[18]), .A(parallel_out[17]), .S(shift_enable), 
        .Y(n19) );
  INVX1 U40 ( .A(n20), .Y(n60) );
  MUX2X1 U41 ( .B(parallel_out[19]), .A(parallel_out[18]), .S(shift_enable), 
        .Y(n20) );
  INVX1 U42 ( .A(n21), .Y(n58) );
  MUX2X1 U43 ( .B(parallel_out[20]), .A(parallel_out[19]), .S(shift_enable), 
        .Y(n21) );
  INVX1 U44 ( .A(n22), .Y(n56) );
  MUX2X1 U45 ( .B(parallel_out[21]), .A(parallel_out[20]), .S(shift_enable), 
        .Y(n22) );
  INVX1 U46 ( .A(n23), .Y(n54) );
  MUX2X1 U47 ( .B(parallel_out[22]), .A(parallel_out[21]), .S(shift_enable), 
        .Y(n23) );
  INVX1 U48 ( .A(n24), .Y(n52) );
  MUX2X1 U49 ( .B(parallel_out[23]), .A(parallel_out[22]), .S(shift_enable), 
        .Y(n24) );
  INVX1 U50 ( .A(n25), .Y(n50) );
  MUX2X1 U51 ( .B(parallel_out[24]), .A(parallel_out[23]), .S(shift_enable), 
        .Y(n25) );
  INVX1 U52 ( .A(n26), .Y(n48) );
  MUX2X1 U53 ( .B(parallel_out[25]), .A(parallel_out[24]), .S(shift_enable), 
        .Y(n26) );
  INVX1 U54 ( .A(n27), .Y(n46) );
  MUX2X1 U55 ( .B(parallel_out[26]), .A(parallel_out[25]), .S(shift_enable), 
        .Y(n27) );
  INVX1 U56 ( .A(n28), .Y(n44) );
  MUX2X1 U57 ( .B(parallel_out[27]), .A(parallel_out[26]), .S(shift_enable), 
        .Y(n28) );
  INVX1 U58 ( .A(n29), .Y(n42) );
  MUX2X1 U59 ( .B(parallel_out[28]), .A(parallel_out[27]), .S(shift_enable), 
        .Y(n29) );
  INVX1 U60 ( .A(n30), .Y(n40) );
  MUX2X1 U61 ( .B(parallel_out[29]), .A(parallel_out[28]), .S(shift_enable), 
        .Y(n30) );
  INVX1 U62 ( .A(n31), .Y(n38) );
  MUX2X1 U63 ( .B(parallel_out[30]), .A(parallel_out[29]), .S(shift_enable), 
        .Y(n31) );
  INVX1 U64 ( .A(n32), .Y(n36) );
  MUX2X1 U65 ( .B(parallel_out[31]), .A(parallel_out[30]), .S(shift_enable), 
        .Y(n32) );
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


module cla_4bit_111 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_110 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_109 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_108 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_16bit_27 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, cout, n8, n9, n10;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  cla_4bit_111 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_110 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n10), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_109 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n9), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_108 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n8), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  NOR2X1 U1 ( .A(n1), .B(n2), .Y(pg) );
  NAND2X1 U2 ( .A(p[3]), .B(p[2]), .Y(n2) );
  NAND2X1 U3 ( .A(p[1]), .B(p[0]), .Y(n1) );
  INVX1 U4 ( .A(n3), .Y(cout) );
  AOI21X1 U5 ( .A(n8), .B(p[3]), .C(g[3]), .Y(n3) );
  INVX1 U6 ( .A(n4), .Y(n8) );
  AOI21X1 U7 ( .A(n9), .B(p[2]), .C(g[2]), .Y(n4) );
  INVX1 U8 ( .A(n5), .Y(n9) );
  AOI21X1 U9 ( .A(n10), .B(p[1]), .C(g[1]), .Y(n5) );
  INVX1 U10 ( .A(n6), .Y(n10) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n6) );
endmodule


module cla_4bit_107 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_106 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_105 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_104 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_16bit_26 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, cout, n8, n9, n10;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  cla_4bit_107 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_106 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n10), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_105 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n9), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_104 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n8), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  NOR2X1 U1 ( .A(n1), .B(n2), .Y(pg) );
  NAND2X1 U2 ( .A(p[3]), .B(p[2]), .Y(n2) );
  NAND2X1 U3 ( .A(p[1]), .B(p[0]), .Y(n1) );
  INVX1 U4 ( .A(n3), .Y(cout) );
  AOI21X1 U5 ( .A(n8), .B(p[3]), .C(g[3]), .Y(n3) );
  INVX1 U6 ( .A(n4), .Y(n8) );
  AOI21X1 U7 ( .A(n9), .B(p[2]), .C(g[2]), .Y(n4) );
  INVX1 U8 ( .A(n5), .Y(n9) );
  AOI21X1 U9 ( .A(n10), .B(p[1]), .C(g[1]), .Y(n5) );
  INVX1 U10 ( .A(n6), .Y(n10) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n6) );
endmodule


module adder_1bit_35 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2;

  XOR2X1 U1 ( .A(carry_in), .B(n1), .Y(sum) );
  INVX1 U2 ( .A(n2), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n1), .D(carry_in), .Y(n2) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n1) );
endmodule


module cla_4bit_103 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_102 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_101 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_100 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_16bit_25 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, cout, n8, n9, n10;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  cla_4bit_103 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_102 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n10), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_101 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n9), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_100 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n8), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  NOR2X1 U1 ( .A(n1), .B(n2), .Y(pg) );
  NAND2X1 U2 ( .A(p[3]), .B(p[2]), .Y(n2) );
  NAND2X1 U3 ( .A(p[1]), .B(p[0]), .Y(n1) );
  INVX1 U4 ( .A(n3), .Y(cout) );
  AOI21X1 U5 ( .A(n8), .B(p[3]), .C(g[3]), .Y(n3) );
  INVX1 U6 ( .A(n4), .Y(n8) );
  AOI21X1 U7 ( .A(n9), .B(p[2]), .C(g[2]), .Y(n4) );
  INVX1 U8 ( .A(n5), .Y(n9) );
  AOI21X1 U9 ( .A(n10), .B(p[1]), .C(g[1]), .Y(n5) );
  INVX1 U10 ( .A(n6), .Y(n10) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n6) );
endmodule


module adder_1bit_34 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2;

  XOR2X1 U1 ( .A(carry_in), .B(n1), .Y(sum) );
  INVX1 U2 ( .A(n2), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n1), .D(carry_in), .Y(n2) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n1) );
endmodule


module adder_1bit_33 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2;

  XOR2X1 U1 ( .A(carry_in), .B(n1), .Y(sum) );
  INVX1 U2 ( .A(n2), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n1), .D(carry_in), .Y(n2) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n1) );
endmodule


module cla_4bit_99 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_98 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_97 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_96 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_16bit_24 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, cout, n8, n9, n10;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  cla_4bit_99 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_98 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n10), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_97 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n9), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_96 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n8), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  NOR2X1 U1 ( .A(n1), .B(n2), .Y(pg) );
  NAND2X1 U2 ( .A(p[3]), .B(p[2]), .Y(n2) );
  NAND2X1 U3 ( .A(p[1]), .B(p[0]), .Y(n1) );
  INVX1 U4 ( .A(n3), .Y(cout) );
  AOI21X1 U5 ( .A(n8), .B(p[3]), .C(g[3]), .Y(n3) );
  INVX1 U6 ( .A(n4), .Y(n8) );
  AOI21X1 U7 ( .A(n9), .B(p[2]), .C(g[2]), .Y(n4) );
  INVX1 U8 ( .A(n5), .Y(n9) );
  AOI21X1 U9 ( .A(n10), .B(p[1]), .C(g[1]), .Y(n5) );
  INVX1 U10 ( .A(n6), .Y(n10) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n6) );
endmodule


module adder_1bit_32 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2;

  XOR2X1 U1 ( .A(carry_in), .B(n1), .Y(sum) );
  INVX1 U2 ( .A(n2), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n1), .D(carry_in), .Y(n2) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n1) );
endmodule


module adder_1bit_31 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2;

  XOR2X1 U1 ( .A(carry_in), .B(n1), .Y(sum) );
  INVX1 U2 ( .A(n2), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n1), .D(carry_in), .Y(n2) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n1) );
endmodule


module adder_1bit_30 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2;

  XOR2X1 U1 ( .A(carry_in), .B(n1), .Y(sum) );
  INVX1 U2 ( .A(n2), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n1), .D(carry_in), .Y(n2) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n1) );
endmodule


module cla_4bit_95 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_94 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_93 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_92 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_16bit_23 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, cout, n8, n9, n10;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  cla_4bit_95 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_94 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n10), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_93 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n9), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_92 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n8), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  NOR2X1 U1 ( .A(n1), .B(n2), .Y(pg) );
  NAND2X1 U2 ( .A(p[3]), .B(p[2]), .Y(n2) );
  NAND2X1 U3 ( .A(p[1]), .B(p[0]), .Y(n1) );
  INVX1 U4 ( .A(n3), .Y(cout) );
  AOI21X1 U5 ( .A(n8), .B(p[3]), .C(g[3]), .Y(n3) );
  INVX1 U6 ( .A(n4), .Y(n8) );
  AOI21X1 U7 ( .A(n9), .B(p[2]), .C(g[2]), .Y(n4) );
  INVX1 U8 ( .A(n5), .Y(n9) );
  AOI21X1 U9 ( .A(n10), .B(p[1]), .C(g[1]), .Y(n5) );
  INVX1 U10 ( .A(n6), .Y(n10) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n6) );
endmodule


module cla_4bit_227 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
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
         \sums[0][3] , \sums[0][2] , \sums[0][1] , \sums[0][0] , n1, n2, n3,
         n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75,
         n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92;
  wire   [15:0] in_opp_sign;
  wire   [15:0] ab0;
  wire   [15:1] ab1;
  wire   [17:2] ab2;
  wire   [18:3] ab3;
  wire   [7:0] couts;
  wire   [19:0] out_neg;

  cla_16bit_27 AOPS1 ( .a({n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, 
        n87, n88, n89, n90, n91, n92}), .b({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
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
  cla_16bit_23 A4 ( .a({n57, n58, n59, n60, n65, n66, n67, n68, n69, n70, n71, 
        n72, n73, n74, n75, n76}), .b({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .cin(
        1'b1), .cout(couts[7]), .sum(out_neg[15:0]) );
  cla_4bit_227 A5 ( .a({n64, n63, n62, n61}), .b({1'b0, 1'b0, 1'b0, 1'b0}), 
        .cin(couts[7]), .sum(out_neg[19:16]) );
  INVX2 U3 ( .A(b[3]), .Y(n22) );
  INVX2 U4 ( .A(b[2]), .Y(n37) );
  INVX2 U5 ( .A(b[1]), .Y(n38) );
  INVX2 U6 ( .A(b[0]), .Y(n39) );
  INVX4 U7 ( .A(a[15]), .Y(n77) );
  INVX1 U8 ( .A(n1), .Y(product[9]) );
  MUX2X1 U9 ( .B(out_neg[9]), .A(\sums[2][9] ), .S(n77), .Y(n1) );
  INVX1 U10 ( .A(n2), .Y(product[8]) );
  MUX2X1 U11 ( .B(out_neg[8]), .A(\sums[2][8] ), .S(n77), .Y(n2) );
  INVX1 U12 ( .A(n3), .Y(product[7]) );
  MUX2X1 U13 ( .B(out_neg[7]), .A(\sums[2][7] ), .S(n77), .Y(n3) );
  INVX1 U14 ( .A(n4), .Y(product[6]) );
  MUX2X1 U15 ( .B(out_neg[6]), .A(\sums[2][6] ), .S(n77), .Y(n4) );
  INVX1 U16 ( .A(n5), .Y(product[5]) );
  MUX2X1 U17 ( .B(out_neg[5]), .A(\sums[2][5] ), .S(n77), .Y(n5) );
  INVX1 U18 ( .A(n6), .Y(product[4]) );
  MUX2X1 U19 ( .B(out_neg[4]), .A(\sums[2][4] ), .S(n77), .Y(n6) );
  INVX1 U20 ( .A(n7), .Y(product[3]) );
  MUX2X1 U21 ( .B(out_neg[3]), .A(\sums[2][3] ), .S(n77), .Y(n7) );
  INVX1 U22 ( .A(n8), .Y(product[2]) );
  MUX2X1 U23 ( .B(out_neg[2]), .A(\sums[2][2] ), .S(n77), .Y(n8) );
  INVX1 U24 ( .A(n9), .Y(product[1]) );
  MUX2X1 U25 ( .B(out_neg[1]), .A(\sums[2][1] ), .S(n77), .Y(n9) );
  INVX1 U26 ( .A(n10), .Y(product[19]) );
  MUX2X1 U27 ( .B(out_neg[19]), .A(couts[6]), .S(n77), .Y(n10) );
  INVX1 U28 ( .A(n11), .Y(product[18]) );
  MUX2X1 U29 ( .B(out_neg[18]), .A(\sums[2][18] ), .S(n77), .Y(n11) );
  INVX1 U30 ( .A(n12), .Y(product[17]) );
  MUX2X1 U31 ( .B(out_neg[17]), .A(\sums[2][17] ), .S(n77), .Y(n12) );
  INVX1 U32 ( .A(n13), .Y(product[16]) );
  MUX2X1 U33 ( .B(out_neg[16]), .A(\sums[2][16] ), .S(n77), .Y(n13) );
  INVX1 U34 ( .A(n14), .Y(product[15]) );
  MUX2X1 U35 ( .B(out_neg[15]), .A(\sums[2][15] ), .S(n77), .Y(n14) );
  INVX1 U36 ( .A(n15), .Y(product[14]) );
  MUX2X1 U37 ( .B(out_neg[14]), .A(\sums[2][14] ), .S(n77), .Y(n15) );
  INVX1 U38 ( .A(n16), .Y(product[13]) );
  MUX2X1 U39 ( .B(out_neg[13]), .A(\sums[2][13] ), .S(n77), .Y(n16) );
  INVX1 U40 ( .A(n17), .Y(product[12]) );
  MUX2X1 U41 ( .B(out_neg[12]), .A(\sums[2][12] ), .S(n77), .Y(n17) );
  INVX1 U42 ( .A(n18), .Y(product[11]) );
  MUX2X1 U43 ( .B(out_neg[11]), .A(\sums[2][11] ), .S(n77), .Y(n18) );
  INVX1 U44 ( .A(n19), .Y(product[10]) );
  MUX2X1 U45 ( .B(out_neg[10]), .A(\sums[2][10] ), .S(n77), .Y(n19) );
  INVX1 U46 ( .A(n20), .Y(product[0]) );
  MUX2X1 U47 ( .B(out_neg[0]), .A(\sums[2][0] ), .S(n77), .Y(n20) );
  INVX1 U48 ( .A(\sums[2][15] ), .Y(n57) );
  INVX1 U49 ( .A(\sums[2][14] ), .Y(n58) );
  INVX1 U50 ( .A(\sums[2][13] ), .Y(n59) );
  INVX1 U51 ( .A(\sums[2][12] ), .Y(n60) );
  INVX1 U52 ( .A(\sums[2][16] ), .Y(n61) );
  INVX1 U53 ( .A(\sums[2][17] ), .Y(n62) );
  INVX1 U54 ( .A(\sums[2][18] ), .Y(n63) );
  INVX1 U55 ( .A(couts[6]), .Y(n64) );
  INVX1 U56 ( .A(\sums[2][11] ), .Y(n65) );
  INVX1 U57 ( .A(\sums[2][10] ), .Y(n66) );
  INVX1 U58 ( .A(\sums[2][9] ), .Y(n67) );
  INVX1 U59 ( .A(\sums[2][8] ), .Y(n68) );
  INVX1 U60 ( .A(\sums[2][7] ), .Y(n69) );
  INVX1 U61 ( .A(\sums[2][6] ), .Y(n70) );
  INVX1 U62 ( .A(\sums[2][5] ), .Y(n71) );
  INVX1 U63 ( .A(\sums[2][4] ), .Y(n72) );
  INVX1 U64 ( .A(\sums[2][3] ), .Y(n73) );
  INVX1 U65 ( .A(\sums[2][2] ), .Y(n74) );
  INVX1 U66 ( .A(\sums[2][1] ), .Y(n75) );
  INVX1 U67 ( .A(\sums[2][0] ), .Y(n76) );
  INVX1 U68 ( .A(a[14]), .Y(n78) );
  INVX1 U69 ( .A(a[13]), .Y(n79) );
  INVX1 U70 ( .A(a[12]), .Y(n80) );
  INVX1 U71 ( .A(a[11]), .Y(n81) );
  INVX1 U72 ( .A(a[10]), .Y(n82) );
  INVX1 U73 ( .A(a[9]), .Y(n83) );
  INVX1 U74 ( .A(a[8]), .Y(n84) );
  INVX1 U75 ( .A(a[7]), .Y(n85) );
  INVX1 U76 ( .A(a[6]), .Y(n86) );
  INVX1 U77 ( .A(a[5]), .Y(n87) );
  INVX1 U78 ( .A(a[4]), .Y(n88) );
  INVX1 U79 ( .A(a[3]), .Y(n89) );
  INVX1 U80 ( .A(a[2]), .Y(n90) );
  INVX1 U81 ( .A(a[1]), .Y(n91) );
  INVX1 U82 ( .A(a[0]), .Y(n92) );
  NOR2X1 U83 ( .A(n21), .B(n22), .Y(ab3[9]) );
  NOR2X1 U84 ( .A(n23), .B(n22), .Y(ab3[8]) );
  NOR2X1 U85 ( .A(n24), .B(n22), .Y(ab3[7]) );
  NOR2X1 U86 ( .A(n25), .B(n22), .Y(ab3[6]) );
  NOR2X1 U87 ( .A(n26), .B(n22), .Y(ab3[5]) );
  NOR2X1 U88 ( .A(n27), .B(n22), .Y(ab3[4]) );
  NOR2X1 U89 ( .A(n28), .B(n22), .Y(ab3[3]) );
  NOR2X1 U90 ( .A(n29), .B(n22), .Y(ab3[17]) );
  NOR2X1 U91 ( .A(n30), .B(n22), .Y(ab3[16]) );
  NOR2X1 U92 ( .A(n31), .B(n22), .Y(ab3[15]) );
  NOR2X1 U93 ( .A(n32), .B(n22), .Y(ab3[14]) );
  NOR2X1 U94 ( .A(n33), .B(n22), .Y(ab3[13]) );
  NOR2X1 U95 ( .A(n34), .B(n22), .Y(ab3[12]) );
  NOR2X1 U96 ( .A(n35), .B(n22), .Y(ab3[11]) );
  NOR2X1 U97 ( .A(n36), .B(n22), .Y(ab3[10]) );
  NOR2X1 U98 ( .A(n36), .B(n37), .Y(ab2[9]) );
  NOR2X1 U99 ( .A(n21), .B(n37), .Y(ab2[8]) );
  NOR2X1 U100 ( .A(n23), .B(n37), .Y(ab2[7]) );
  NOR2X1 U101 ( .A(n24), .B(n37), .Y(ab2[6]) );
  NOR2X1 U102 ( .A(n25), .B(n37), .Y(ab2[5]) );
  NOR2X1 U103 ( .A(n26), .B(n37), .Y(ab2[4]) );
  NOR2X1 U104 ( .A(n27), .B(n37), .Y(ab2[3]) );
  NOR2X1 U105 ( .A(n28), .B(n37), .Y(ab2[2]) );
  NOR2X1 U106 ( .A(n29), .B(n37), .Y(ab2[16]) );
  NOR2X1 U107 ( .A(n30), .B(n37), .Y(ab2[15]) );
  NOR2X1 U108 ( .A(n31), .B(n37), .Y(ab2[14]) );
  NOR2X1 U109 ( .A(n32), .B(n37), .Y(ab2[13]) );
  NOR2X1 U110 ( .A(n33), .B(n37), .Y(ab2[12]) );
  NOR2X1 U111 ( .A(n34), .B(n37), .Y(ab2[11]) );
  NOR2X1 U112 ( .A(n35), .B(n37), .Y(ab2[10]) );
  NOR2X1 U113 ( .A(n35), .B(n38), .Y(ab1[9]) );
  NOR2X1 U114 ( .A(n36), .B(n38), .Y(ab1[8]) );
  NOR2X1 U115 ( .A(n21), .B(n38), .Y(ab1[7]) );
  NOR2X1 U116 ( .A(n23), .B(n38), .Y(ab1[6]) );
  NOR2X1 U117 ( .A(n24), .B(n38), .Y(ab1[5]) );
  NOR2X1 U118 ( .A(n25), .B(n38), .Y(ab1[4]) );
  NOR2X1 U119 ( .A(n26), .B(n38), .Y(ab1[3]) );
  NOR2X1 U120 ( .A(n27), .B(n38), .Y(ab1[2]) );
  NOR2X1 U121 ( .A(n28), .B(n38), .Y(ab1[1]) );
  NOR2X1 U122 ( .A(n29), .B(n38), .Y(ab1[15]) );
  NOR2X1 U123 ( .A(n30), .B(n38), .Y(ab1[14]) );
  NOR2X1 U124 ( .A(n31), .B(n38), .Y(ab1[13]) );
  NOR2X1 U125 ( .A(n32), .B(n38), .Y(ab1[12]) );
  NOR2X1 U126 ( .A(n33), .B(n38), .Y(ab1[11]) );
  NOR2X1 U127 ( .A(n34), .B(n38), .Y(ab1[10]) );
  NOR2X1 U128 ( .A(n34), .B(n39), .Y(ab0[9]) );
  AND2X1 U129 ( .A(n40), .B(n42), .Y(n34) );
  MUX2X1 U130 ( .B(in_opp_sign[9]), .A(a[9]), .S(n77), .Y(n40) );
  NOR2X1 U131 ( .A(n35), .B(n39), .Y(ab0[8]) );
  AND2X1 U132 ( .A(n43), .B(n42), .Y(n35) );
  MUX2X1 U133 ( .B(in_opp_sign[8]), .A(a[8]), .S(n77), .Y(n43) );
  NOR2X1 U134 ( .A(n36), .B(n39), .Y(ab0[7]) );
  AND2X1 U135 ( .A(n44), .B(n42), .Y(n36) );
  MUX2X1 U136 ( .B(in_opp_sign[7]), .A(a[7]), .S(n77), .Y(n44) );
  NOR2X1 U137 ( .A(n21), .B(n39), .Y(ab0[6]) );
  AND2X1 U138 ( .A(n45), .B(n42), .Y(n21) );
  MUX2X1 U139 ( .B(in_opp_sign[6]), .A(a[6]), .S(n77), .Y(n45) );
  NOR2X1 U140 ( .A(n23), .B(n39), .Y(ab0[5]) );
  AND2X1 U141 ( .A(n46), .B(n42), .Y(n23) );
  MUX2X1 U142 ( .B(in_opp_sign[5]), .A(a[5]), .S(n77), .Y(n46) );
  NOR2X1 U143 ( .A(n24), .B(n39), .Y(ab0[4]) );
  AND2X1 U144 ( .A(n47), .B(n42), .Y(n24) );
  MUX2X1 U145 ( .B(in_opp_sign[4]), .A(a[4]), .S(n77), .Y(n47) );
  NOR2X1 U146 ( .A(n25), .B(n39), .Y(ab0[3]) );
  AND2X1 U147 ( .A(n48), .B(n42), .Y(n25) );
  MUX2X1 U148 ( .B(in_opp_sign[3]), .A(a[3]), .S(n77), .Y(n48) );
  NOR2X1 U149 ( .A(n26), .B(n39), .Y(ab0[2]) );
  AND2X1 U150 ( .A(n49), .B(n42), .Y(n26) );
  MUX2X1 U151 ( .B(in_opp_sign[2]), .A(a[2]), .S(n77), .Y(n49) );
  NOR2X1 U152 ( .A(n27), .B(n39), .Y(ab0[1]) );
  AND2X1 U153 ( .A(n50), .B(n42), .Y(n27) );
  MUX2X1 U154 ( .B(in_opp_sign[1]), .A(a[1]), .S(n77), .Y(n50) );
  NOR2X1 U156 ( .A(n29), .B(n39), .Y(ab0[14]) );
  AND2X1 U157 ( .A(n51), .B(n42), .Y(n29) );
  MUX2X1 U158 ( .B(in_opp_sign[14]), .A(a[14]), .S(n77), .Y(n51) );
  NOR2X1 U159 ( .A(n30), .B(n39), .Y(ab0[13]) );
  AND2X1 U160 ( .A(n52), .B(n42), .Y(n30) );
  MUX2X1 U161 ( .B(in_opp_sign[13]), .A(a[13]), .S(n77), .Y(n52) );
  NOR2X1 U162 ( .A(n31), .B(n39), .Y(ab0[12]) );
  AND2X1 U163 ( .A(n53), .B(n42), .Y(n31) );
  MUX2X1 U164 ( .B(in_opp_sign[12]), .A(a[12]), .S(n77), .Y(n53) );
  NOR2X1 U165 ( .A(n32), .B(n39), .Y(ab0[11]) );
  AND2X1 U166 ( .A(n54), .B(n42), .Y(n32) );
  MUX2X1 U167 ( .B(in_opp_sign[11]), .A(a[11]), .S(n77), .Y(n54) );
  NOR2X1 U168 ( .A(n33), .B(n39), .Y(ab0[10]) );
  AND2X1 U169 ( .A(n55), .B(n42), .Y(n33) );
  MUX2X1 U170 ( .B(in_opp_sign[10]), .A(a[10]), .S(n77), .Y(n55) );
  NOR2X1 U171 ( .A(n28), .B(n39), .Y(ab0[0]) );
  AND2X1 U172 ( .A(n56), .B(n42), .Y(n28) );
  NAND2X1 U173 ( .A(in_opp_sign[15]), .B(a[15]), .Y(n42) );
  MUX2X1 U174 ( .B(in_opp_sign[0]), .A(a[0]), .S(n77), .Y(n56) );
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
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_90 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_89 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_88 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_16bit_22 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, cout, n8, n9, n10;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  cla_4bit_91 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_90 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n10), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_89 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n9), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_88 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n8), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  NOR2X1 U1 ( .A(n1), .B(n2), .Y(pg) );
  NAND2X1 U2 ( .A(p[3]), .B(p[2]), .Y(n2) );
  NAND2X1 U3 ( .A(p[1]), .B(p[0]), .Y(n1) );
  INVX1 U4 ( .A(n3), .Y(cout) );
  AOI21X1 U5 ( .A(n8), .B(p[3]), .C(g[3]), .Y(n3) );
  INVX1 U6 ( .A(n4), .Y(n8) );
  AOI21X1 U7 ( .A(n9), .B(p[2]), .C(g[2]), .Y(n4) );
  INVX1 U8 ( .A(n5), .Y(n9) );
  AOI21X1 U9 ( .A(n10), .B(p[1]), .C(g[1]), .Y(n5) );
  INVX1 U10 ( .A(n6), .Y(n10) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n6) );
endmodule


module cla_4bit_87 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_86 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_85 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_84 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_16bit_21 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, cout, n8, n9, n10;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  cla_4bit_87 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_86 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n10), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_85 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n9), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_84 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n8), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  NOR2X1 U1 ( .A(n1), .B(n2), .Y(pg) );
  NAND2X1 U2 ( .A(p[3]), .B(p[2]), .Y(n2) );
  NAND2X1 U3 ( .A(p[1]), .B(p[0]), .Y(n1) );
  INVX1 U4 ( .A(n3), .Y(cout) );
  AOI21X1 U5 ( .A(n8), .B(p[3]), .C(g[3]), .Y(n3) );
  INVX1 U6 ( .A(n4), .Y(n8) );
  AOI21X1 U7 ( .A(n9), .B(p[2]), .C(g[2]), .Y(n4) );
  INVX1 U8 ( .A(n5), .Y(n9) );
  AOI21X1 U9 ( .A(n10), .B(p[1]), .C(g[1]), .Y(n5) );
  INVX1 U10 ( .A(n6), .Y(n10) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n6) );
endmodule


module adder_1bit_29 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2;

  XOR2X1 U1 ( .A(carry_in), .B(n1), .Y(sum) );
  INVX1 U2 ( .A(n2), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n1), .D(carry_in), .Y(n2) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n1) );
endmodule


module cla_4bit_83 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_82 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_81 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_80 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_16bit_20 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, cout, n8, n9, n10;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  cla_4bit_83 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_82 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n10), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_81 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n9), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_80 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n8), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  NOR2X1 U1 ( .A(n1), .B(n2), .Y(pg) );
  NAND2X1 U2 ( .A(p[3]), .B(p[2]), .Y(n2) );
  NAND2X1 U3 ( .A(p[1]), .B(p[0]), .Y(n1) );
  INVX1 U4 ( .A(n3), .Y(cout) );
  AOI21X1 U5 ( .A(n8), .B(p[3]), .C(g[3]), .Y(n3) );
  INVX1 U6 ( .A(n4), .Y(n8) );
  AOI21X1 U7 ( .A(n9), .B(p[2]), .C(g[2]), .Y(n4) );
  INVX1 U8 ( .A(n5), .Y(n9) );
  AOI21X1 U9 ( .A(n10), .B(p[1]), .C(g[1]), .Y(n5) );
  INVX1 U10 ( .A(n6), .Y(n10) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n6) );
endmodule


module adder_1bit_28 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2;

  XOR2X1 U1 ( .A(carry_in), .B(n1), .Y(sum) );
  INVX1 U2 ( .A(n2), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n1), .D(carry_in), .Y(n2) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n1) );
endmodule


module adder_1bit_27 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2;

  XOR2X1 U1 ( .A(carry_in), .B(n1), .Y(sum) );
  INVX1 U2 ( .A(n2), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n1), .D(carry_in), .Y(n2) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n1) );
endmodule


module cla_4bit_79 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_78 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_77 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_76 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_16bit_19 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, cout, n8, n9, n10;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  cla_4bit_79 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_78 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n10), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_77 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n9), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_76 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n8), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  NOR2X1 U1 ( .A(n1), .B(n2), .Y(pg) );
  NAND2X1 U2 ( .A(p[3]), .B(p[2]), .Y(n2) );
  NAND2X1 U3 ( .A(p[1]), .B(p[0]), .Y(n1) );
  INVX1 U4 ( .A(n3), .Y(cout) );
  AOI21X1 U5 ( .A(n8), .B(p[3]), .C(g[3]), .Y(n3) );
  INVX1 U6 ( .A(n4), .Y(n8) );
  AOI21X1 U7 ( .A(n9), .B(p[2]), .C(g[2]), .Y(n4) );
  INVX1 U8 ( .A(n5), .Y(n9) );
  AOI21X1 U9 ( .A(n10), .B(p[1]), .C(g[1]), .Y(n5) );
  INVX1 U10 ( .A(n6), .Y(n10) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n6) );
endmodule


module adder_1bit_26 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2;

  XOR2X1 U1 ( .A(carry_in), .B(n1), .Y(sum) );
  INVX1 U2 ( .A(n2), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n1), .D(carry_in), .Y(n2) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n1) );
endmodule


module adder_1bit_25 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2;

  XOR2X1 U1 ( .A(carry_in), .B(n1), .Y(sum) );
  INVX1 U2 ( .A(n2), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n1), .D(carry_in), .Y(n2) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n1) );
endmodule


module adder_1bit_24 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2;

  XOR2X1 U1 ( .A(carry_in), .B(n1), .Y(sum) );
  INVX1 U2 ( .A(n2), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n1), .D(carry_in), .Y(n2) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n1) );
endmodule


module cla_4bit_75 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_74 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_73 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_72 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_16bit_18 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, cout, n8, n9, n10;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  cla_4bit_75 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_74 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n10), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_73 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n9), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_72 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n8), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  NOR2X1 U1 ( .A(n1), .B(n2), .Y(pg) );
  NAND2X1 U2 ( .A(p[3]), .B(p[2]), .Y(n2) );
  NAND2X1 U3 ( .A(p[1]), .B(p[0]), .Y(n1) );
  INVX1 U4 ( .A(n3), .Y(cout) );
  AOI21X1 U5 ( .A(n8), .B(p[3]), .C(g[3]), .Y(n3) );
  INVX1 U6 ( .A(n4), .Y(n8) );
  AOI21X1 U7 ( .A(n9), .B(p[2]), .C(g[2]), .Y(n4) );
  INVX1 U8 ( .A(n5), .Y(n9) );
  AOI21X1 U9 ( .A(n10), .B(p[1]), .C(g[1]), .Y(n5) );
  INVX1 U10 ( .A(n6), .Y(n10) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n6) );
endmodule


module cla_4bit_226 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
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
         \sums[0][3] , \sums[0][2] , \sums[0][1] , \sums[0][0] , n1, n2, n3,
         n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75,
         n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92;
  wire   [15:0] in_opp_sign;
  wire   [15:0] ab0;
  wire   [15:1] ab1;
  wire   [17:2] ab2;
  wire   [18:3] ab3;
  wire   [7:0] couts;
  wire   [19:0] out_neg;

  cla_16bit_22 AOPS1 ( .a({n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, 
        n87, n88, n89, n90, n91, n92}), .b({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
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
  cla_16bit_18 A4 ( .a({n57, n58, n59, n60, n65, n66, n67, n68, n69, n70, n71, 
        n72, n73, n74, n75, n76}), .b({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .cin(
        1'b1), .cout(couts[7]), .sum(out_neg[15:0]) );
  cla_4bit_226 A5 ( .a({n64, n63, n62, n61}), .b({1'b0, 1'b0, 1'b0, 1'b0}), 
        .cin(couts[7]), .sum(out_neg[19:16]) );
  INVX2 U3 ( .A(b[3]), .Y(n22) );
  INVX2 U4 ( .A(b[2]), .Y(n37) );
  INVX2 U5 ( .A(b[1]), .Y(n38) );
  INVX2 U6 ( .A(b[0]), .Y(n39) );
  INVX4 U7 ( .A(a[15]), .Y(n77) );
  INVX1 U8 ( .A(n1), .Y(product[9]) );
  MUX2X1 U9 ( .B(out_neg[9]), .A(\sums[2][9] ), .S(n77), .Y(n1) );
  INVX1 U10 ( .A(n2), .Y(product[8]) );
  MUX2X1 U11 ( .B(out_neg[8]), .A(\sums[2][8] ), .S(n77), .Y(n2) );
  INVX1 U12 ( .A(n3), .Y(product[7]) );
  MUX2X1 U13 ( .B(out_neg[7]), .A(\sums[2][7] ), .S(n77), .Y(n3) );
  INVX1 U14 ( .A(n4), .Y(product[6]) );
  MUX2X1 U15 ( .B(out_neg[6]), .A(\sums[2][6] ), .S(n77), .Y(n4) );
  INVX1 U16 ( .A(n5), .Y(product[5]) );
  MUX2X1 U17 ( .B(out_neg[5]), .A(\sums[2][5] ), .S(n77), .Y(n5) );
  INVX1 U18 ( .A(n6), .Y(product[4]) );
  MUX2X1 U19 ( .B(out_neg[4]), .A(\sums[2][4] ), .S(n77), .Y(n6) );
  INVX1 U20 ( .A(n7), .Y(product[3]) );
  MUX2X1 U21 ( .B(out_neg[3]), .A(\sums[2][3] ), .S(n77), .Y(n7) );
  INVX1 U22 ( .A(n8), .Y(product[2]) );
  MUX2X1 U23 ( .B(out_neg[2]), .A(\sums[2][2] ), .S(n77), .Y(n8) );
  INVX1 U24 ( .A(n9), .Y(product[1]) );
  MUX2X1 U25 ( .B(out_neg[1]), .A(\sums[2][1] ), .S(n77), .Y(n9) );
  INVX1 U26 ( .A(n10), .Y(product[19]) );
  MUX2X1 U27 ( .B(out_neg[19]), .A(couts[6]), .S(n77), .Y(n10) );
  INVX1 U28 ( .A(n11), .Y(product[18]) );
  MUX2X1 U29 ( .B(out_neg[18]), .A(\sums[2][18] ), .S(n77), .Y(n11) );
  INVX1 U30 ( .A(n12), .Y(product[17]) );
  MUX2X1 U31 ( .B(out_neg[17]), .A(\sums[2][17] ), .S(n77), .Y(n12) );
  INVX1 U32 ( .A(n13), .Y(product[16]) );
  MUX2X1 U33 ( .B(out_neg[16]), .A(\sums[2][16] ), .S(n77), .Y(n13) );
  INVX1 U34 ( .A(n14), .Y(product[15]) );
  MUX2X1 U35 ( .B(out_neg[15]), .A(\sums[2][15] ), .S(n77), .Y(n14) );
  INVX1 U36 ( .A(n15), .Y(product[14]) );
  MUX2X1 U37 ( .B(out_neg[14]), .A(\sums[2][14] ), .S(n77), .Y(n15) );
  INVX1 U38 ( .A(n16), .Y(product[13]) );
  MUX2X1 U39 ( .B(out_neg[13]), .A(\sums[2][13] ), .S(n77), .Y(n16) );
  INVX1 U40 ( .A(n17), .Y(product[12]) );
  MUX2X1 U41 ( .B(out_neg[12]), .A(\sums[2][12] ), .S(n77), .Y(n17) );
  INVX1 U42 ( .A(n18), .Y(product[11]) );
  MUX2X1 U43 ( .B(out_neg[11]), .A(\sums[2][11] ), .S(n77), .Y(n18) );
  INVX1 U44 ( .A(n19), .Y(product[10]) );
  MUX2X1 U45 ( .B(out_neg[10]), .A(\sums[2][10] ), .S(n77), .Y(n19) );
  INVX1 U46 ( .A(n20), .Y(product[0]) );
  MUX2X1 U47 ( .B(out_neg[0]), .A(\sums[2][0] ), .S(n77), .Y(n20) );
  INVX1 U48 ( .A(\sums[2][15] ), .Y(n57) );
  INVX1 U49 ( .A(\sums[2][14] ), .Y(n58) );
  INVX1 U50 ( .A(\sums[2][13] ), .Y(n59) );
  INVX1 U51 ( .A(\sums[2][12] ), .Y(n60) );
  INVX1 U52 ( .A(\sums[2][16] ), .Y(n61) );
  INVX1 U53 ( .A(\sums[2][17] ), .Y(n62) );
  INVX1 U54 ( .A(\sums[2][18] ), .Y(n63) );
  INVX1 U55 ( .A(couts[6]), .Y(n64) );
  INVX1 U56 ( .A(\sums[2][11] ), .Y(n65) );
  INVX1 U57 ( .A(\sums[2][10] ), .Y(n66) );
  INVX1 U58 ( .A(\sums[2][9] ), .Y(n67) );
  INVX1 U59 ( .A(\sums[2][8] ), .Y(n68) );
  INVX1 U60 ( .A(\sums[2][7] ), .Y(n69) );
  INVX1 U61 ( .A(\sums[2][6] ), .Y(n70) );
  INVX1 U62 ( .A(\sums[2][5] ), .Y(n71) );
  INVX1 U63 ( .A(\sums[2][4] ), .Y(n72) );
  INVX1 U64 ( .A(\sums[2][3] ), .Y(n73) );
  INVX1 U65 ( .A(\sums[2][2] ), .Y(n74) );
  INVX1 U66 ( .A(\sums[2][1] ), .Y(n75) );
  INVX1 U67 ( .A(\sums[2][0] ), .Y(n76) );
  INVX1 U68 ( .A(a[14]), .Y(n78) );
  INVX1 U69 ( .A(a[13]), .Y(n79) );
  INVX1 U70 ( .A(a[12]), .Y(n80) );
  INVX1 U71 ( .A(a[11]), .Y(n81) );
  INVX1 U72 ( .A(a[10]), .Y(n82) );
  INVX1 U73 ( .A(a[9]), .Y(n83) );
  INVX1 U74 ( .A(a[8]), .Y(n84) );
  INVX1 U75 ( .A(a[7]), .Y(n85) );
  INVX1 U76 ( .A(a[6]), .Y(n86) );
  INVX1 U77 ( .A(a[5]), .Y(n87) );
  INVX1 U78 ( .A(a[4]), .Y(n88) );
  INVX1 U79 ( .A(a[3]), .Y(n89) );
  INVX1 U80 ( .A(a[2]), .Y(n90) );
  INVX1 U81 ( .A(a[1]), .Y(n91) );
  INVX1 U82 ( .A(a[0]), .Y(n92) );
  NOR2X1 U83 ( .A(n21), .B(n22), .Y(ab3[9]) );
  NOR2X1 U84 ( .A(n23), .B(n22), .Y(ab3[8]) );
  NOR2X1 U85 ( .A(n24), .B(n22), .Y(ab3[7]) );
  NOR2X1 U86 ( .A(n25), .B(n22), .Y(ab3[6]) );
  NOR2X1 U87 ( .A(n26), .B(n22), .Y(ab3[5]) );
  NOR2X1 U88 ( .A(n27), .B(n22), .Y(ab3[4]) );
  NOR2X1 U89 ( .A(n28), .B(n22), .Y(ab3[3]) );
  NOR2X1 U90 ( .A(n29), .B(n22), .Y(ab3[17]) );
  NOR2X1 U91 ( .A(n30), .B(n22), .Y(ab3[16]) );
  NOR2X1 U92 ( .A(n31), .B(n22), .Y(ab3[15]) );
  NOR2X1 U93 ( .A(n32), .B(n22), .Y(ab3[14]) );
  NOR2X1 U94 ( .A(n33), .B(n22), .Y(ab3[13]) );
  NOR2X1 U95 ( .A(n34), .B(n22), .Y(ab3[12]) );
  NOR2X1 U96 ( .A(n35), .B(n22), .Y(ab3[11]) );
  NOR2X1 U97 ( .A(n36), .B(n22), .Y(ab3[10]) );
  NOR2X1 U98 ( .A(n36), .B(n37), .Y(ab2[9]) );
  NOR2X1 U99 ( .A(n21), .B(n37), .Y(ab2[8]) );
  NOR2X1 U100 ( .A(n23), .B(n37), .Y(ab2[7]) );
  NOR2X1 U101 ( .A(n24), .B(n37), .Y(ab2[6]) );
  NOR2X1 U102 ( .A(n25), .B(n37), .Y(ab2[5]) );
  NOR2X1 U103 ( .A(n26), .B(n37), .Y(ab2[4]) );
  NOR2X1 U104 ( .A(n27), .B(n37), .Y(ab2[3]) );
  NOR2X1 U105 ( .A(n28), .B(n37), .Y(ab2[2]) );
  NOR2X1 U106 ( .A(n29), .B(n37), .Y(ab2[16]) );
  NOR2X1 U107 ( .A(n30), .B(n37), .Y(ab2[15]) );
  NOR2X1 U108 ( .A(n31), .B(n37), .Y(ab2[14]) );
  NOR2X1 U109 ( .A(n32), .B(n37), .Y(ab2[13]) );
  NOR2X1 U110 ( .A(n33), .B(n37), .Y(ab2[12]) );
  NOR2X1 U111 ( .A(n34), .B(n37), .Y(ab2[11]) );
  NOR2X1 U112 ( .A(n35), .B(n37), .Y(ab2[10]) );
  NOR2X1 U113 ( .A(n35), .B(n38), .Y(ab1[9]) );
  NOR2X1 U114 ( .A(n36), .B(n38), .Y(ab1[8]) );
  NOR2X1 U115 ( .A(n21), .B(n38), .Y(ab1[7]) );
  NOR2X1 U116 ( .A(n23), .B(n38), .Y(ab1[6]) );
  NOR2X1 U117 ( .A(n24), .B(n38), .Y(ab1[5]) );
  NOR2X1 U118 ( .A(n25), .B(n38), .Y(ab1[4]) );
  NOR2X1 U119 ( .A(n26), .B(n38), .Y(ab1[3]) );
  NOR2X1 U120 ( .A(n27), .B(n38), .Y(ab1[2]) );
  NOR2X1 U121 ( .A(n28), .B(n38), .Y(ab1[1]) );
  NOR2X1 U122 ( .A(n29), .B(n38), .Y(ab1[15]) );
  NOR2X1 U123 ( .A(n30), .B(n38), .Y(ab1[14]) );
  NOR2X1 U124 ( .A(n31), .B(n38), .Y(ab1[13]) );
  NOR2X1 U125 ( .A(n32), .B(n38), .Y(ab1[12]) );
  NOR2X1 U126 ( .A(n33), .B(n38), .Y(ab1[11]) );
  NOR2X1 U127 ( .A(n34), .B(n38), .Y(ab1[10]) );
  NOR2X1 U128 ( .A(n34), .B(n39), .Y(ab0[9]) );
  AND2X1 U129 ( .A(n40), .B(n42), .Y(n34) );
  MUX2X1 U130 ( .B(in_opp_sign[9]), .A(a[9]), .S(n77), .Y(n40) );
  NOR2X1 U131 ( .A(n35), .B(n39), .Y(ab0[8]) );
  AND2X1 U132 ( .A(n43), .B(n42), .Y(n35) );
  MUX2X1 U133 ( .B(in_opp_sign[8]), .A(a[8]), .S(n77), .Y(n43) );
  NOR2X1 U134 ( .A(n36), .B(n39), .Y(ab0[7]) );
  AND2X1 U135 ( .A(n44), .B(n42), .Y(n36) );
  MUX2X1 U136 ( .B(in_opp_sign[7]), .A(a[7]), .S(n77), .Y(n44) );
  NOR2X1 U137 ( .A(n21), .B(n39), .Y(ab0[6]) );
  AND2X1 U138 ( .A(n45), .B(n42), .Y(n21) );
  MUX2X1 U139 ( .B(in_opp_sign[6]), .A(a[6]), .S(n77), .Y(n45) );
  NOR2X1 U140 ( .A(n23), .B(n39), .Y(ab0[5]) );
  AND2X1 U141 ( .A(n46), .B(n42), .Y(n23) );
  MUX2X1 U142 ( .B(in_opp_sign[5]), .A(a[5]), .S(n77), .Y(n46) );
  NOR2X1 U143 ( .A(n24), .B(n39), .Y(ab0[4]) );
  AND2X1 U144 ( .A(n47), .B(n42), .Y(n24) );
  MUX2X1 U145 ( .B(in_opp_sign[4]), .A(a[4]), .S(n77), .Y(n47) );
  NOR2X1 U146 ( .A(n25), .B(n39), .Y(ab0[3]) );
  AND2X1 U147 ( .A(n48), .B(n42), .Y(n25) );
  MUX2X1 U148 ( .B(in_opp_sign[3]), .A(a[3]), .S(n77), .Y(n48) );
  NOR2X1 U149 ( .A(n26), .B(n39), .Y(ab0[2]) );
  AND2X1 U150 ( .A(n49), .B(n42), .Y(n26) );
  MUX2X1 U151 ( .B(in_opp_sign[2]), .A(a[2]), .S(n77), .Y(n49) );
  NOR2X1 U152 ( .A(n27), .B(n39), .Y(ab0[1]) );
  AND2X1 U153 ( .A(n50), .B(n42), .Y(n27) );
  MUX2X1 U154 ( .B(in_opp_sign[1]), .A(a[1]), .S(n77), .Y(n50) );
  NOR2X1 U156 ( .A(n29), .B(n39), .Y(ab0[14]) );
  AND2X1 U157 ( .A(n51), .B(n42), .Y(n29) );
  MUX2X1 U158 ( .B(in_opp_sign[14]), .A(a[14]), .S(n77), .Y(n51) );
  NOR2X1 U159 ( .A(n30), .B(n39), .Y(ab0[13]) );
  AND2X1 U160 ( .A(n52), .B(n42), .Y(n30) );
  MUX2X1 U161 ( .B(in_opp_sign[13]), .A(a[13]), .S(n77), .Y(n52) );
  NOR2X1 U162 ( .A(n31), .B(n39), .Y(ab0[12]) );
  AND2X1 U163 ( .A(n53), .B(n42), .Y(n31) );
  MUX2X1 U164 ( .B(in_opp_sign[12]), .A(a[12]), .S(n77), .Y(n53) );
  NOR2X1 U165 ( .A(n32), .B(n39), .Y(ab0[11]) );
  AND2X1 U166 ( .A(n54), .B(n42), .Y(n32) );
  MUX2X1 U167 ( .B(in_opp_sign[11]), .A(a[11]), .S(n77), .Y(n54) );
  NOR2X1 U168 ( .A(n33), .B(n39), .Y(ab0[10]) );
  AND2X1 U169 ( .A(n55), .B(n42), .Y(n33) );
  MUX2X1 U170 ( .B(in_opp_sign[10]), .A(a[10]), .S(n77), .Y(n55) );
  NOR2X1 U171 ( .A(n28), .B(n39), .Y(ab0[0]) );
  AND2X1 U172 ( .A(n56), .B(n42), .Y(n28) );
  NAND2X1 U173 ( .A(in_opp_sign[15]), .B(a[15]), .Y(n42) );
  MUX2X1 U174 ( .B(in_opp_sign[0]), .A(a[0]), .S(n77), .Y(n56) );
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


module cla_4bit_71 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_70 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_69 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_68 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_16bit_17 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, cout, n8, n9, n10;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  cla_4bit_71 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_70 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n10), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_69 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n9), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_68 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n8), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  NOR2X1 U1 ( .A(n1), .B(n2), .Y(pg) );
  NAND2X1 U2 ( .A(p[3]), .B(p[2]), .Y(n2) );
  NAND2X1 U3 ( .A(p[1]), .B(p[0]), .Y(n1) );
  INVX1 U4 ( .A(n3), .Y(cout) );
  AOI21X1 U5 ( .A(n8), .B(p[3]), .C(g[3]), .Y(n3) );
  INVX1 U6 ( .A(n4), .Y(n8) );
  AOI21X1 U7 ( .A(n9), .B(p[2]), .C(g[2]), .Y(n4) );
  INVX1 U8 ( .A(n5), .Y(n9) );
  AOI21X1 U9 ( .A(n10), .B(p[1]), .C(g[1]), .Y(n5) );
  INVX1 U10 ( .A(n6), .Y(n10) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n6) );
endmodule


module cla_4bit_67 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_66 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_65 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_64 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_16bit_16 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, cout, n8, n9, n10;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  cla_4bit_67 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_66 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n10), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_65 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n9), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_64 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n8), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  NOR2X1 U1 ( .A(n1), .B(n2), .Y(pg) );
  NAND2X1 U2 ( .A(p[3]), .B(p[2]), .Y(n2) );
  NAND2X1 U3 ( .A(p[1]), .B(p[0]), .Y(n1) );
  INVX1 U4 ( .A(n3), .Y(cout) );
  AOI21X1 U5 ( .A(n8), .B(p[3]), .C(g[3]), .Y(n3) );
  INVX1 U6 ( .A(n4), .Y(n8) );
  AOI21X1 U7 ( .A(n9), .B(p[2]), .C(g[2]), .Y(n4) );
  INVX1 U8 ( .A(n5), .Y(n9) );
  AOI21X1 U9 ( .A(n10), .B(p[1]), .C(g[1]), .Y(n5) );
  INVX1 U10 ( .A(n6), .Y(n10) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n6) );
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
  wire   curr_st, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n68;
  wire   [31:0] adder_data;

  DFFSR curr_st_reg ( .D(n68), .CLK(clk), .R(n_rst), .S(1'b1), .Q(curr_st) );
  flanger_adder ADD ( .flanger_data(input_data), .sram_data(read_data), 
        .output_data(adder_data) );
  AND2X1 U4 ( .A(curr_st), .B(flanger_en), .Y(sram_rw) );
  INVX1 U5 ( .A(n2), .Y(output_data[31]) );
  MUX2X1 U6 ( .B(input_data[31]), .A(adder_data[31]), .S(flanger_en), .Y(n2)
         );
  INVX1 U7 ( .A(n3), .Y(output_data[30]) );
  MUX2X1 U8 ( .B(input_data[30]), .A(adder_data[30]), .S(flanger_en), .Y(n3)
         );
  INVX1 U9 ( .A(n4), .Y(output_data[29]) );
  MUX2X1 U10 ( .B(input_data[29]), .A(adder_data[29]), .S(flanger_en), .Y(n4)
         );
  INVX1 U11 ( .A(n5), .Y(output_data[28]) );
  MUX2X1 U12 ( .B(input_data[28]), .A(adder_data[28]), .S(flanger_en), .Y(n5)
         );
  INVX1 U13 ( .A(n6), .Y(output_data[27]) );
  MUX2X1 U14 ( .B(input_data[27]), .A(adder_data[27]), .S(flanger_en), .Y(n6)
         );
  INVX1 U15 ( .A(n7), .Y(output_data[26]) );
  MUX2X1 U16 ( .B(input_data[26]), .A(adder_data[26]), .S(flanger_en), .Y(n7)
         );
  INVX1 U17 ( .A(n8), .Y(output_data[25]) );
  MUX2X1 U18 ( .B(input_data[25]), .A(adder_data[25]), .S(flanger_en), .Y(n8)
         );
  INVX1 U19 ( .A(n9), .Y(output_data[24]) );
  MUX2X1 U20 ( .B(input_data[24]), .A(adder_data[24]), .S(flanger_en), .Y(n9)
         );
  INVX1 U21 ( .A(n10), .Y(output_data[23]) );
  MUX2X1 U22 ( .B(input_data[23]), .A(adder_data[23]), .S(flanger_en), .Y(n10)
         );
  INVX1 U23 ( .A(n11), .Y(output_data[22]) );
  MUX2X1 U24 ( .B(input_data[22]), .A(adder_data[22]), .S(flanger_en), .Y(n11)
         );
  INVX1 U25 ( .A(n12), .Y(output_data[21]) );
  MUX2X1 U26 ( .B(input_data[21]), .A(adder_data[21]), .S(flanger_en), .Y(n12)
         );
  INVX1 U27 ( .A(n13), .Y(output_data[20]) );
  MUX2X1 U28 ( .B(input_data[20]), .A(adder_data[20]), .S(flanger_en), .Y(n13)
         );
  INVX1 U29 ( .A(n14), .Y(output_data[19]) );
  MUX2X1 U30 ( .B(input_data[19]), .A(adder_data[19]), .S(flanger_en), .Y(n14)
         );
  INVX1 U31 ( .A(n15), .Y(output_data[18]) );
  MUX2X1 U32 ( .B(input_data[18]), .A(adder_data[18]), .S(flanger_en), .Y(n15)
         );
  INVX1 U33 ( .A(n16), .Y(output_data[17]) );
  MUX2X1 U34 ( .B(input_data[17]), .A(adder_data[17]), .S(flanger_en), .Y(n16)
         );
  INVX1 U35 ( .A(n17), .Y(output_data[16]) );
  MUX2X1 U36 ( .B(input_data[16]), .A(adder_data[16]), .S(flanger_en), .Y(n17)
         );
  INVX1 U37 ( .A(n18), .Y(output_data[15]) );
  MUX2X1 U38 ( .B(input_data[15]), .A(adder_data[15]), .S(flanger_en), .Y(n18)
         );
  INVX1 U39 ( .A(n19), .Y(output_data[14]) );
  MUX2X1 U40 ( .B(input_data[14]), .A(adder_data[14]), .S(flanger_en), .Y(n19)
         );
  INVX1 U41 ( .A(n20), .Y(output_data[13]) );
  MUX2X1 U42 ( .B(input_data[13]), .A(adder_data[13]), .S(flanger_en), .Y(n20)
         );
  INVX1 U43 ( .A(n21), .Y(output_data[12]) );
  MUX2X1 U44 ( .B(input_data[12]), .A(adder_data[12]), .S(flanger_en), .Y(n21)
         );
  INVX1 U45 ( .A(n22), .Y(output_data[11]) );
  MUX2X1 U46 ( .B(input_data[11]), .A(adder_data[11]), .S(flanger_en), .Y(n22)
         );
  INVX1 U47 ( .A(n23), .Y(output_data[10]) );
  MUX2X1 U48 ( .B(input_data[10]), .A(adder_data[10]), .S(flanger_en), .Y(n23)
         );
  INVX1 U49 ( .A(n24), .Y(output_data[9]) );
  MUX2X1 U50 ( .B(input_data[9]), .A(adder_data[9]), .S(flanger_en), .Y(n24)
         );
  INVX1 U51 ( .A(n25), .Y(output_data[8]) );
  MUX2X1 U52 ( .B(input_data[8]), .A(adder_data[8]), .S(flanger_en), .Y(n25)
         );
  INVX1 U53 ( .A(n26), .Y(output_data[7]) );
  MUX2X1 U54 ( .B(input_data[7]), .A(adder_data[7]), .S(flanger_en), .Y(n26)
         );
  INVX1 U55 ( .A(n27), .Y(output_data[6]) );
  MUX2X1 U56 ( .B(input_data[6]), .A(adder_data[6]), .S(flanger_en), .Y(n27)
         );
  INVX1 U57 ( .A(n28), .Y(output_data[5]) );
  MUX2X1 U58 ( .B(input_data[5]), .A(adder_data[5]), .S(flanger_en), .Y(n28)
         );
  INVX1 U59 ( .A(n29), .Y(output_data[4]) );
  MUX2X1 U60 ( .B(input_data[4]), .A(adder_data[4]), .S(flanger_en), .Y(n29)
         );
  INVX1 U61 ( .A(n30), .Y(output_data[3]) );
  MUX2X1 U62 ( .B(input_data[3]), .A(adder_data[3]), .S(flanger_en), .Y(n30)
         );
  INVX1 U63 ( .A(n31), .Y(output_data[2]) );
  MUX2X1 U64 ( .B(input_data[2]), .A(adder_data[2]), .S(flanger_en), .Y(n31)
         );
  INVX1 U65 ( .A(n32), .Y(output_data[1]) );
  MUX2X1 U66 ( .B(input_data[1]), .A(adder_data[1]), .S(flanger_en), .Y(n32)
         );
  INVX1 U67 ( .A(n33), .Y(output_data[0]) );
  MUX2X1 U68 ( .B(input_data[0]), .A(adder_data[0]), .S(flanger_en), .Y(n33)
         );
  INVX1 U69 ( .A(n34), .Y(n68) );
  NAND3X1 U70 ( .A(flanger_en), .B(n35), .C(shift_en), .Y(n34) );
  INVX1 U71 ( .A(curr_st), .Y(n35) );
endmodule


module sram_controller ( clk, n_rst, rw_trigger, mem_clr, mem_init, mem_dump, 
        write_data, sram_data );
  input [31:0] write_data;
  output [31:0] sram_data;
  input clk, n_rst, rw_trigger, mem_clr, mem_init, mem_dump;
  wire   N96, n213, n247, n249, n251, n253, n255, n257, n259, n261, n263, n265,
         n267, n269, n271, n273, n305, n307, n309, n312, n330, n331, n335,
         n336, n337, n338, n339, n340, n341, n342, n343, n344, n345, n346,
         n347, n348, n349, n350, n352, n353, n354, n355, n356, n357, n358,
         n359, n360, n361, n362, n363, n364, n365, n366, n367, n368, n369,
         n370, n371, n372, n373, n374, n375, n376, n377, n378, n382, n383,
         n384, n385, n386, n387, n388, n389, n390, n391, n392, n393, n394, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199,
         n200, n203, n204, n205, n206, n207, n208, n209, n210, n211, n275,
         n276, n277, n299, n300, n301, n303, n313, n314;
  wire   [2:0] curr_st;
  wire   [15:0] r_addr;
  wire   [15:0] w_addr;
  wire   [15:0] next_r_addr;
  wire   [15:0] next_w_addr;
  tri   mem_clr;
  tri   mem_init;
  tri   mem_dump;
  tri   r_en;
  tri   w_en;
  tri   [15:0] address;
  tri   [15:0] read_data_half;
  tri   [15:0] write_data_half;
  tri   n201;
  tri   n202;

  OR2X2 C1564 ( .A(n25), .B(N96), .Y(w_en) );
  OR2X2 C1560 ( .A(n313), .B(n331), .Y(r_en) );
  DFFSR \address_reg[0]  ( .D(n312), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        address[0]) );
  DFFSR \w_addr_reg[15]  ( .D(n368), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        w_addr[15]) );
  DFFSR \curr_st_reg[2]  ( .D(n309), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        curr_st[2]) );
  DFFSR \curr_st_reg[0]  ( .D(n307), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        curr_st[0]) );
  DFFSR \curr_st_reg[1]  ( .D(n305), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        curr_st[1]) );
  DFFSR \r_addr_reg[15]  ( .D(n383), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        r_addr[15]) );
  DFFSR \r_addr_reg[4]  ( .D(n394), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        r_addr[4]) );
  DFFSR \r_addr_reg[5]  ( .D(n393), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        r_addr[5]) );
  DFFSR \r_addr_reg[6]  ( .D(n392), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        r_addr[6]) );
  DFFSR \r_addr_reg[7]  ( .D(n391), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        r_addr[7]) );
  DFFSR \r_addr_reg[8]  ( .D(n390), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        r_addr[8]) );
  DFFSR \r_addr_reg[9]  ( .D(n389), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        r_addr[9]) );
  DFFSR \r_addr_reg[10]  ( .D(n388), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        r_addr[10]) );
  DFFSR \r_addr_reg[11]  ( .D(n387), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        r_addr[11]) );
  DFFSR \r_addr_reg[12]  ( .D(n386), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        r_addr[12]) );
  DFFSR \r_addr_reg[13]  ( .D(n385), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        r_addr[13]) );
  DFFSR \r_addr_reg[14]  ( .D(n384), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        r_addr[14]) );
  DFFSR \w_addr_reg[13]  ( .D(n369), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        w_addr[13]) );
  DFFSR \w_addr_reg[12]  ( .D(n370), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        w_addr[12]) );
  DFFSR \w_addr_reg[11]  ( .D(n371), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        w_addr[11]) );
  DFFSR \w_addr_reg[10]  ( .D(n372), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        w_addr[10]) );
  DFFSR \w_addr_reg[9]  ( .D(n373), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        w_addr[9]) );
  DFFSR \w_addr_reg[8]  ( .D(n374), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        w_addr[8]) );
  DFFSR \w_addr_reg[7]  ( .D(n375), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        w_addr[7]) );
  DFFSR \w_addr_reg[6]  ( .D(n376), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        w_addr[6]) );
  DFFSR \w_addr_reg[5]  ( .D(n377), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        w_addr[5]) );
  DFFSR \w_addr_reg[4]  ( .D(n378), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        w_addr[4]) );
  DFFSR \w_addr_reg[14]  ( .D(n382), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        w_addr[14]) );
  DFFSR \address_reg[1]  ( .D(n273), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        address[1]) );
  DFFSR \address_reg[2]  ( .D(n271), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        address[2]) );
  DFFSR \address_reg[3]  ( .D(n269), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        address[3]) );
  DFFSR \address_reg[4]  ( .D(n267), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        address[4]) );
  DFFSR \address_reg[5]  ( .D(n265), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        address[5]) );
  DFFSR \address_reg[6]  ( .D(n263), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        address[6]) );
  DFFSR \address_reg[7]  ( .D(n261), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        address[7]) );
  DFFSR \address_reg[8]  ( .D(n259), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        address[8]) );
  DFFSR \address_reg[9]  ( .D(n257), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        address[9]) );
  DFFSR \address_reg[10]  ( .D(n255), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        address[10]) );
  DFFSR \address_reg[11]  ( .D(n253), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        address[11]) );
  DFFSR \address_reg[12]  ( .D(n251), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        address[12]) );
  DFFSR \address_reg[13]  ( .D(n249), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        address[13]) );
  DFFSR \address_reg[14]  ( .D(n247), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        address[14]) );
  DFFSR \read_data_reg[15]  ( .D(n303), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sram_data[15]) );
  DFFSR \read_data_reg[14]  ( .D(n301), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sram_data[14]) );
  DFFSR \read_data_reg[13]  ( .D(n300), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sram_data[13]) );
  DFFSR \read_data_reg[12]  ( .D(n299), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sram_data[12]) );
  DFFSR \read_data_reg[11]  ( .D(n277), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sram_data[11]) );
  DFFSR \read_data_reg[10]  ( .D(n276), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sram_data[10]) );
  DFFSR \read_data_reg[9]  ( .D(n275), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sram_data[9]) );
  DFFSR \read_data_reg[8]  ( .D(n211), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sram_data[8]) );
  DFFSR \read_data_reg[7]  ( .D(n210), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sram_data[7]) );
  DFFSR \read_data_reg[6]  ( .D(n209), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sram_data[6]) );
  DFFSR \read_data_reg[5]  ( .D(n208), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sram_data[5]) );
  DFFSR \read_data_reg[4]  ( .D(n207), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sram_data[4]) );
  DFFSR \read_data_reg[3]  ( .D(n206), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sram_data[3]) );
  DFFSR \read_data_reg[2]  ( .D(n205), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sram_data[2]) );
  DFFSR \read_data_reg[1]  ( .D(n204), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sram_data[1]) );
  DFFSR \read_data_reg[0]  ( .D(n203), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sram_data[0]) );
  DFFSR \read_data_reg[16]  ( .D(n367), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sram_data[16]) );
  DFFSR \read_data_reg[17]  ( .D(n366), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sram_data[17]) );
  DFFSR \read_data_reg[18]  ( .D(n365), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sram_data[18]) );
  DFFSR \read_data_reg[19]  ( .D(n364), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sram_data[19]) );
  DFFSR \read_data_reg[20]  ( .D(n363), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sram_data[20]) );
  DFFSR \read_data_reg[21]  ( .D(n362), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sram_data[21]) );
  DFFSR \read_data_reg[22]  ( .D(n361), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sram_data[22]) );
  DFFSR \read_data_reg[23]  ( .D(n360), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sram_data[23]) );
  DFFSR \read_data_reg[24]  ( .D(n359), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sram_data[24]) );
  DFFSR \read_data_reg[25]  ( .D(n358), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sram_data[25]) );
  DFFSR \read_data_reg[26]  ( .D(n357), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sram_data[26]) );
  DFFSR \read_data_reg[27]  ( .D(n356), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sram_data[27]) );
  DFFSR \read_data_reg[28]  ( .D(n355), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sram_data[28]) );
  DFFSR \read_data_reg[29]  ( .D(n354), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sram_data[29]) );
  DFFSR \read_data_reg[30]  ( .D(n353), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sram_data[30]) );
  DFFSR \read_data_reg[31]  ( .D(n352), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sram_data[31]) );
  DFFSR \address_reg[15]  ( .D(n213), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        address[15]) );
  OAI21X1 U398 ( .A(n314), .B(1'b1), .C(n335), .Y(write_data_half[15]) );
  OAI21X1 U399 ( .A(n314), .B(1'b1), .C(n336), .Y(write_data_half[14]) );
  OAI21X1 U400 ( .A(n314), .B(1'b1), .C(n337), .Y(write_data_half[13]) );
  OAI21X1 U401 ( .A(n314), .B(1'b1), .C(n338), .Y(write_data_half[12]) );
  OAI21X1 U402 ( .A(n314), .B(1'b1), .C(n339), .Y(write_data_half[11]) );
  OAI21X1 U403 ( .A(n314), .B(1'b1), .C(n340), .Y(write_data_half[10]) );
  OAI21X1 U404 ( .A(n314), .B(1'b1), .C(n341), .Y(write_data_half[9]) );
  OAI21X1 U405 ( .A(n314), .B(1'b1), .C(n342), .Y(write_data_half[8]) );
  OAI21X1 U406 ( .A(n314), .B(1'b1), .C(n343), .Y(write_data_half[7]) );
  OAI21X1 U407 ( .A(n314), .B(1'b1), .C(n344), .Y(write_data_half[6]) );
  OAI21X1 U408 ( .A(n314), .B(1'b1), .C(n345), .Y(write_data_half[5]) );
  OAI21X1 U409 ( .A(n314), .B(1'b1), .C(n346), .Y(write_data_half[4]) );
  OAI21X1 U410 ( .A(n314), .B(1'b1), .C(n347), .Y(write_data_half[3]) );
  OAI21X1 U411 ( .A(n314), .B(1'b1), .C(n348), .Y(write_data_half[2]) );
  OAI21X1 U412 ( .A(n314), .B(1'b1), .C(n349), .Y(write_data_half[1]) );
  OAI21X1 U413 ( .A(n314), .B(1'b1), .C(n350), .Y(write_data_half[0]) );
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
  NAND2X1 U3 ( .A(w_addr[12]), .B(w_addr[11]), .Y(n189) );
  NAND2X1 U4 ( .A(r_addr[12]), .B(r_addr[11]), .Y(n198) );
  INVX2 U5 ( .A(n187), .Y(n186) );
  INVX2 U6 ( .A(n196), .Y(n195) );
  AND2X2 U8 ( .A(n12), .B(w_addr[10]), .Y(n2) );
  AND2X2 U9 ( .A(n16), .B(r_addr[10]), .Y(n3) );
  AND2X2 U10 ( .A(n13), .B(w_addr[12]), .Y(n4) );
  AND2X2 U11 ( .A(n18), .B(w_addr[8]), .Y(n5) );
  AND2X2 U12 ( .A(n17), .B(r_addr[12]), .Y(n6) );
  AND2X2 U13 ( .A(n19), .B(r_addr[8]), .Y(n7) );
  AND2X2 U14 ( .A(w_addr[4]), .B(w_addr[5]), .Y(n8) );
  AND2X2 U15 ( .A(r_addr[4]), .B(r_addr[5]), .Y(n9) );
  AND2X2 U16 ( .A(n8), .B(w_addr[6]), .Y(n10) );
  AND2X2 U17 ( .A(n4), .B(w_addr[13]), .Y(n11) );
  AND2X2 U18 ( .A(n5), .B(w_addr[9]), .Y(n12) );
  AND2X2 U19 ( .A(n2), .B(w_addr[11]), .Y(n13) );
  AND2X2 U20 ( .A(n9), .B(r_addr[6]), .Y(n14) );
  AND2X2 U21 ( .A(n6), .B(r_addr[13]), .Y(n15) );
  AND2X2 U22 ( .A(n7), .B(r_addr[9]), .Y(n16) );
  AND2X2 U23 ( .A(n3), .B(r_addr[11]), .Y(n17) );
  AND2X2 U24 ( .A(n10), .B(w_addr[7]), .Y(n18) );
  AND2X2 U25 ( .A(n14), .B(r_addr[7]), .Y(n19) );
  AND2X2 U26 ( .A(n11), .B(w_addr[14]), .Y(n20) );
  AND2X2 U27 ( .A(n15), .B(r_addr[14]), .Y(n21) );
  BUFX2 U28 ( .A(n149), .Y(n22) );
  INVX2 U29 ( .A(n105), .Y(n314) );
  INVX2 U30 ( .A(n144), .Y(n23) );
  BUFX2 U31 ( .A(n150), .Y(n24) );
  INVX2 U32 ( .A(n182), .Y(N96) );
  BUFX2 U33 ( .A(n330), .Y(n25) );
  BUFX2 U34 ( .A(n44), .Y(n26) );
  AND2X2 U35 ( .A(n313), .B(n26), .Y(n111) );
  AND2X2 U36 ( .A(n331), .B(n26), .Y(n110) );
  AND2X2 U37 ( .A(n26), .B(n45), .Y(n28) );
  XOR2X1 U38 ( .A(w_addr[4]), .B(w_addr[5]), .Y(next_w_addr[5]) );
  XOR2X1 U39 ( .A(n8), .B(w_addr[6]), .Y(next_w_addr[6]) );
  XOR2X1 U40 ( .A(n10), .B(w_addr[7]), .Y(next_w_addr[7]) );
  XOR2X1 U41 ( .A(n18), .B(w_addr[8]), .Y(next_w_addr[8]) );
  XOR2X1 U42 ( .A(n5), .B(w_addr[9]), .Y(next_w_addr[9]) );
  XOR2X1 U43 ( .A(n12), .B(w_addr[10]), .Y(next_w_addr[10]) );
  XOR2X1 U44 ( .A(n2), .B(w_addr[11]), .Y(next_w_addr[11]) );
  XOR2X1 U45 ( .A(n13), .B(w_addr[12]), .Y(next_w_addr[12]) );
  XOR2X1 U46 ( .A(n4), .B(w_addr[13]), .Y(next_w_addr[13]) );
  XOR2X1 U47 ( .A(n11), .B(w_addr[14]), .Y(next_w_addr[14]) );
  XOR2X1 U48 ( .A(w_addr[15]), .B(n20), .Y(next_w_addr[15]) );
  XOR2X1 U49 ( .A(r_addr[4]), .B(r_addr[5]), .Y(next_r_addr[5]) );
  XOR2X1 U50 ( .A(n9), .B(r_addr[6]), .Y(next_r_addr[6]) );
  XOR2X1 U51 ( .A(n14), .B(r_addr[7]), .Y(next_r_addr[7]) );
  XOR2X1 U52 ( .A(n19), .B(r_addr[8]), .Y(next_r_addr[8]) );
  XOR2X1 U53 ( .A(n7), .B(r_addr[9]), .Y(next_r_addr[9]) );
  XOR2X1 U54 ( .A(n16), .B(r_addr[10]), .Y(next_r_addr[10]) );
  XOR2X1 U55 ( .A(n3), .B(r_addr[11]), .Y(next_r_addr[11]) );
  XOR2X1 U56 ( .A(n17), .B(r_addr[12]), .Y(next_r_addr[12]) );
  XOR2X1 U57 ( .A(n6), .B(r_addr[13]), .Y(next_r_addr[13]) );
  XOR2X1 U58 ( .A(n15), .B(r_addr[14]), .Y(next_r_addr[14]) );
  XOR2X1 U59 ( .A(r_addr[15]), .B(n21), .Y(next_r_addr[15]) );
  INVX1 U60 ( .A(n27), .Y(n203) );
  MUX2X1 U61 ( .B(sram_data[0]), .A(read_data_half[0]), .S(n28), .Y(n27) );
  INVX1 U62 ( .A(n29), .Y(n204) );
  MUX2X1 U63 ( .B(sram_data[1]), .A(read_data_half[1]), .S(n28), .Y(n29) );
  INVX1 U64 ( .A(n30), .Y(n205) );
  MUX2X1 U65 ( .B(sram_data[2]), .A(read_data_half[2]), .S(n28), .Y(n30) );
  INVX1 U66 ( .A(n31), .Y(n206) );
  MUX2X1 U67 ( .B(sram_data[3]), .A(read_data_half[3]), .S(n28), .Y(n31) );
  INVX1 U68 ( .A(n32), .Y(n207) );
  MUX2X1 U69 ( .B(sram_data[4]), .A(read_data_half[4]), .S(n28), .Y(n32) );
  INVX1 U70 ( .A(n33), .Y(n208) );
  MUX2X1 U71 ( .B(sram_data[5]), .A(read_data_half[5]), .S(n28), .Y(n33) );
  INVX1 U72 ( .A(n34), .Y(n209) );
  MUX2X1 U73 ( .B(sram_data[6]), .A(read_data_half[6]), .S(n28), .Y(n34) );
  INVX1 U74 ( .A(n35), .Y(n210) );
  MUX2X1 U75 ( .B(sram_data[7]), .A(read_data_half[7]), .S(n28), .Y(n35) );
  INVX1 U76 ( .A(n36), .Y(n211) );
  MUX2X1 U77 ( .B(sram_data[8]), .A(read_data_half[8]), .S(n28), .Y(n36) );
  INVX1 U78 ( .A(n37), .Y(n275) );
  MUX2X1 U79 ( .B(sram_data[9]), .A(read_data_half[9]), .S(n28), .Y(n37) );
  INVX1 U80 ( .A(n38), .Y(n276) );
  MUX2X1 U81 ( .B(sram_data[10]), .A(read_data_half[10]), .S(n28), .Y(n38) );
  INVX1 U82 ( .A(n39), .Y(n277) );
  MUX2X1 U83 ( .B(sram_data[11]), .A(read_data_half[11]), .S(n28), .Y(n39) );
  INVX1 U84 ( .A(n40), .Y(n299) );
  MUX2X1 U85 ( .B(sram_data[12]), .A(read_data_half[12]), .S(n28), .Y(n40) );
  INVX1 U86 ( .A(n41), .Y(n300) );
  MUX2X1 U87 ( .B(sram_data[13]), .A(read_data_half[13]), .S(n28), .Y(n41) );
  INVX1 U88 ( .A(n42), .Y(n301) );
  MUX2X1 U89 ( .B(sram_data[14]), .A(read_data_half[14]), .S(n28), .Y(n42) );
  INVX1 U90 ( .A(n43), .Y(n303) );
  MUX2X1 U91 ( .B(sram_data[15]), .A(read_data_half[15]), .S(n28), .Y(n43) );
  INVX1 U92 ( .A(n46), .Y(n394) );
  MUX2X1 U93 ( .B(n47), .A(n48), .S(r_addr[4]), .Y(n46) );
  OAI21X1 U94 ( .A(n49), .B(n50), .C(n51), .Y(n393) );
  NAND2X1 U95 ( .A(next_r_addr[5]), .B(n47), .Y(n51) );
  INVX1 U96 ( .A(r_addr[5]), .Y(n50) );
  OAI21X1 U97 ( .A(n49), .B(n52), .C(n53), .Y(n392) );
  NAND2X1 U98 ( .A(next_r_addr[6]), .B(n47), .Y(n53) );
  INVX1 U99 ( .A(r_addr[6]), .Y(n52) );
  OAI21X1 U100 ( .A(n49), .B(n54), .C(n55), .Y(n391) );
  NAND2X1 U101 ( .A(next_r_addr[7]), .B(n47), .Y(n55) );
  INVX1 U102 ( .A(r_addr[7]), .Y(n54) );
  OAI21X1 U103 ( .A(n49), .B(n56), .C(n57), .Y(n390) );
  NAND2X1 U104 ( .A(next_r_addr[8]), .B(n47), .Y(n57) );
  INVX1 U105 ( .A(r_addr[8]), .Y(n56) );
  OAI21X1 U106 ( .A(n49), .B(n58), .C(n59), .Y(n389) );
  NAND2X1 U107 ( .A(next_r_addr[9]), .B(n47), .Y(n59) );
  INVX1 U108 ( .A(r_addr[9]), .Y(n58) );
  OAI21X1 U109 ( .A(n49), .B(n60), .C(n61), .Y(n388) );
  NAND2X1 U110 ( .A(next_r_addr[10]), .B(n47), .Y(n61) );
  INVX1 U111 ( .A(r_addr[10]), .Y(n60) );
  OAI21X1 U112 ( .A(n49), .B(n62), .C(n63), .Y(n387) );
  NAND2X1 U113 ( .A(next_r_addr[11]), .B(n47), .Y(n63) );
  INVX1 U114 ( .A(r_addr[11]), .Y(n62) );
  OAI21X1 U115 ( .A(n49), .B(n64), .C(n65), .Y(n386) );
  NAND2X1 U116 ( .A(next_r_addr[12]), .B(n47), .Y(n65) );
  INVX1 U117 ( .A(r_addr[12]), .Y(n64) );
  OAI21X1 U118 ( .A(n49), .B(n66), .C(n67), .Y(n385) );
  NAND2X1 U119 ( .A(next_r_addr[13]), .B(n47), .Y(n67) );
  INVX1 U120 ( .A(r_addr[13]), .Y(n66) );
  OAI21X1 U121 ( .A(n49), .B(n68), .C(n69), .Y(n384) );
  NAND2X1 U122 ( .A(next_r_addr[14]), .B(n47), .Y(n69) );
  OAI21X1 U123 ( .A(n49), .B(n70), .C(n71), .Y(n383) );
  NAND2X1 U124 ( .A(next_r_addr[15]), .B(n47), .Y(n71) );
  NOR2X1 U125 ( .A(n48), .B(n72), .Y(n47) );
  INVX1 U126 ( .A(n48), .Y(n49) );
  OAI21X1 U127 ( .A(n73), .B(n72), .C(n74), .Y(n48) );
  NOR2X1 U128 ( .A(n75), .B(n76), .Y(n73) );
  INVX1 U129 ( .A(n77), .Y(n75) );
  OAI21X1 U130 ( .A(n78), .B(n79), .C(n80), .Y(n382) );
  NAND2X1 U131 ( .A(next_w_addr[14]), .B(n81), .Y(n80) );
  MUX2X1 U132 ( .B(n82), .A(n78), .S(w_addr[4]), .Y(n378) );
  OAI21X1 U133 ( .A(n78), .B(n83), .C(n84), .Y(n377) );
  NAND2X1 U134 ( .A(next_w_addr[5]), .B(n81), .Y(n84) );
  INVX1 U135 ( .A(w_addr[5]), .Y(n83) );
  OAI21X1 U136 ( .A(n78), .B(n85), .C(n86), .Y(n376) );
  NAND2X1 U137 ( .A(next_w_addr[6]), .B(n81), .Y(n86) );
  INVX1 U138 ( .A(w_addr[6]), .Y(n85) );
  OAI21X1 U139 ( .A(n87), .B(n78), .C(n88), .Y(n375) );
  NAND2X1 U140 ( .A(next_w_addr[7]), .B(n81), .Y(n88) );
  INVX1 U141 ( .A(w_addr[7]), .Y(n87) );
  OAI21X1 U142 ( .A(n89), .B(n78), .C(n90), .Y(n374) );
  NAND2X1 U143 ( .A(next_w_addr[8]), .B(n81), .Y(n90) );
  INVX1 U144 ( .A(w_addr[8]), .Y(n89) );
  OAI21X1 U145 ( .A(n91), .B(n78), .C(n92), .Y(n373) );
  NAND2X1 U146 ( .A(next_w_addr[9]), .B(n81), .Y(n92) );
  INVX1 U147 ( .A(w_addr[9]), .Y(n91) );
  OAI21X1 U148 ( .A(n78), .B(n93), .C(n94), .Y(n372) );
  NAND2X1 U149 ( .A(next_w_addr[10]), .B(n81), .Y(n94) );
  INVX1 U150 ( .A(w_addr[10]), .Y(n93) );
  OAI21X1 U151 ( .A(n95), .B(n78), .C(n96), .Y(n371) );
  NAND2X1 U152 ( .A(next_w_addr[11]), .B(n81), .Y(n96) );
  INVX1 U153 ( .A(w_addr[11]), .Y(n95) );
  OAI21X1 U154 ( .A(n97), .B(n78), .C(n98), .Y(n370) );
  NAND2X1 U155 ( .A(next_w_addr[12]), .B(n81), .Y(n98) );
  INVX1 U156 ( .A(w_addr[12]), .Y(n97) );
  OAI21X1 U157 ( .A(n78), .B(n99), .C(n100), .Y(n369) );
  NAND2X1 U158 ( .A(next_w_addr[13]), .B(n81), .Y(n100) );
  INVX1 U159 ( .A(w_addr[13]), .Y(n99) );
  OAI21X1 U160 ( .A(n78), .B(n101), .C(n102), .Y(n368) );
  NAND2X1 U161 ( .A(next_w_addr[15]), .B(n81), .Y(n102) );
  INVX1 U162 ( .A(n82), .Y(n81) );
  NAND2X1 U163 ( .A(n103), .B(n78), .Y(n82) );
  OAI21X1 U164 ( .A(n104), .B(n105), .C(n74), .Y(n78) );
  NAND2X1 U165 ( .A(n106), .B(n107), .Y(n74) );
  OAI21X1 U166 ( .A(n26), .B(n108), .C(n109), .Y(n367) );
  AOI22X1 U167 ( .A(n110), .B(sram_data[0]), .C(n111), .D(read_data_half[0]), 
        .Y(n109) );
  INVX1 U168 ( .A(sram_data[16]), .Y(n108) );
  OAI21X1 U169 ( .A(n26), .B(n112), .C(n113), .Y(n366) );
  AOI22X1 U170 ( .A(n110), .B(sram_data[1]), .C(n111), .D(read_data_half[1]), 
        .Y(n113) );
  INVX1 U171 ( .A(sram_data[17]), .Y(n112) );
  OAI21X1 U172 ( .A(n26), .B(n114), .C(n115), .Y(n365) );
  AOI22X1 U173 ( .A(n110), .B(sram_data[2]), .C(n111), .D(read_data_half[2]), 
        .Y(n115) );
  INVX1 U174 ( .A(sram_data[18]), .Y(n114) );
  OAI21X1 U175 ( .A(n26), .B(n116), .C(n117), .Y(n364) );
  AOI22X1 U176 ( .A(n110), .B(sram_data[3]), .C(n111), .D(read_data_half[3]), 
        .Y(n117) );
  INVX1 U177 ( .A(sram_data[19]), .Y(n116) );
  OAI21X1 U178 ( .A(n26), .B(n118), .C(n119), .Y(n363) );
  AOI22X1 U179 ( .A(n110), .B(sram_data[4]), .C(n111), .D(read_data_half[4]), 
        .Y(n119) );
  INVX1 U180 ( .A(sram_data[20]), .Y(n118) );
  OAI21X1 U181 ( .A(n26), .B(n120), .C(n121), .Y(n362) );
  AOI22X1 U182 ( .A(n110), .B(sram_data[5]), .C(n111), .D(read_data_half[5]), 
        .Y(n121) );
  INVX1 U183 ( .A(sram_data[21]), .Y(n120) );
  OAI21X1 U184 ( .A(n26), .B(n122), .C(n123), .Y(n361) );
  AOI22X1 U185 ( .A(n110), .B(sram_data[6]), .C(n111), .D(read_data_half[6]), 
        .Y(n123) );
  INVX1 U186 ( .A(sram_data[22]), .Y(n122) );
  OAI21X1 U187 ( .A(n26), .B(n124), .C(n125), .Y(n360) );
  AOI22X1 U188 ( .A(n110), .B(sram_data[7]), .C(n111), .D(read_data_half[7]), 
        .Y(n125) );
  INVX1 U189 ( .A(sram_data[23]), .Y(n124) );
  OAI21X1 U190 ( .A(n26), .B(n126), .C(n127), .Y(n359) );
  AOI22X1 U191 ( .A(n110), .B(sram_data[8]), .C(n111), .D(read_data_half[8]), 
        .Y(n127) );
  INVX1 U192 ( .A(sram_data[24]), .Y(n126) );
  OAI21X1 U193 ( .A(n26), .B(n128), .C(n129), .Y(n358) );
  AOI22X1 U194 ( .A(n110), .B(sram_data[9]), .C(n111), .D(read_data_half[9]), 
        .Y(n129) );
  INVX1 U195 ( .A(sram_data[25]), .Y(n128) );
  OAI21X1 U196 ( .A(n26), .B(n130), .C(n131), .Y(n357) );
  AOI22X1 U197 ( .A(n110), .B(sram_data[10]), .C(n111), .D(read_data_half[10]), 
        .Y(n131) );
  INVX1 U198 ( .A(sram_data[26]), .Y(n130) );
  OAI21X1 U199 ( .A(n26), .B(n132), .C(n133), .Y(n356) );
  AOI22X1 U200 ( .A(n110), .B(sram_data[11]), .C(n111), .D(read_data_half[11]), 
        .Y(n133) );
  INVX1 U201 ( .A(sram_data[27]), .Y(n132) );
  OAI21X1 U202 ( .A(n26), .B(n134), .C(n135), .Y(n355) );
  AOI22X1 U203 ( .A(n110), .B(sram_data[12]), .C(n111), .D(read_data_half[12]), 
        .Y(n135) );
  INVX1 U204 ( .A(sram_data[28]), .Y(n134) );
  OAI21X1 U205 ( .A(n26), .B(n136), .C(n137), .Y(n354) );
  AOI22X1 U206 ( .A(n110), .B(sram_data[13]), .C(n111), .D(read_data_half[13]), 
        .Y(n137) );
  INVX1 U207 ( .A(sram_data[29]), .Y(n136) );
  OAI21X1 U208 ( .A(n26), .B(n138), .C(n139), .Y(n353) );
  AOI22X1 U209 ( .A(n110), .B(sram_data[14]), .C(n111), .D(read_data_half[14]), 
        .Y(n139) );
  INVX1 U210 ( .A(sram_data[30]), .Y(n138) );
  OAI21X1 U211 ( .A(n26), .B(n140), .C(n141), .Y(n352) );
  AOI22X1 U212 ( .A(n110), .B(sram_data[15]), .C(n111), .D(read_data_half[15]), 
        .Y(n141) );
  INVX1 U213 ( .A(n45), .Y(n313) );
  NAND3X1 U214 ( .A(n142), .B(n143), .C(curr_st[1]), .Y(n45) );
  INVX1 U215 ( .A(sram_data[31]), .Y(n140) );
  NOR2X1 U216 ( .A(n144), .B(n76), .Y(n44) );
  OAI21X1 U217 ( .A(n145), .B(n143), .C(n142), .Y(n76) );
  AOI22X1 U218 ( .A(write_data[0]), .B(N96), .C(write_data[16]), .D(n25), .Y(
        n350) );
  AOI22X1 U219 ( .A(write_data[17]), .B(n25), .C(write_data[1]), .D(N96), .Y(
        n349) );
  AOI22X1 U220 ( .A(write_data[18]), .B(n25), .C(write_data[2]), .D(N96), .Y(
        n348) );
  AOI22X1 U221 ( .A(write_data[19]), .B(n25), .C(write_data[3]), .D(N96), .Y(
        n347) );
  AOI22X1 U222 ( .A(write_data[20]), .B(n25), .C(write_data[4]), .D(N96), .Y(
        n346) );
  AOI22X1 U223 ( .A(write_data[21]), .B(n25), .C(write_data[5]), .D(N96), .Y(
        n345) );
  AOI22X1 U224 ( .A(write_data[22]), .B(n25), .C(write_data[6]), .D(N96), .Y(
        n344) );
  AOI22X1 U225 ( .A(write_data[23]), .B(n25), .C(write_data[7]), .D(N96), .Y(
        n343) );
  AOI22X1 U226 ( .A(write_data[24]), .B(n25), .C(write_data[8]), .D(N96), .Y(
        n342) );
  AOI22X1 U227 ( .A(write_data[25]), .B(n25), .C(write_data[9]), .D(N96), .Y(
        n341) );
  AOI22X1 U228 ( .A(write_data[10]), .B(N96), .C(write_data[26]), .D(n25), .Y(
        n340) );
  AOI22X1 U229 ( .A(write_data[11]), .B(N96), .C(write_data[27]), .D(n25), .Y(
        n339) );
  AOI22X1 U230 ( .A(write_data[12]), .B(N96), .C(write_data[28]), .D(n25), .Y(
        n338) );
  AOI22X1 U231 ( .A(write_data[13]), .B(N96), .C(write_data[29]), .D(n25), .Y(
        n337) );
  AOI22X1 U232 ( .A(write_data[14]), .B(N96), .C(write_data[30]), .D(n25), .Y(
        n336) );
  AOI22X1 U233 ( .A(write_data[15]), .B(N96), .C(write_data[31]), .D(n25), .Y(
        n335) );
  INVX1 U234 ( .A(n146), .Y(n331) );
  NAND3X1 U235 ( .A(n142), .B(n145), .C(curr_st[2]), .Y(n146) );
  NOR2X1 U236 ( .A(n105), .B(curr_st[1]), .Y(n330) );
  OAI21X1 U237 ( .A(n23), .B(n148), .C(1'b1), .Y(n312) );
  INVX1 U238 ( .A(address[0]), .Y(n148) );
  XOR2X1 U239 ( .A(n143), .B(n151), .Y(n309) );
  NAND2X1 U240 ( .A(n152), .B(curr_st[1]), .Y(n151) );
  MUX2X1 U241 ( .B(n142), .A(n153), .S(n103), .Y(n307) );
  OAI21X1 U242 ( .A(rw_trigger), .B(n77), .C(n142), .Y(n153) );
  XOR2X1 U243 ( .A(curr_st[1]), .B(n152), .Y(n305) );
  NOR2X1 U244 ( .A(n72), .B(n142), .Y(n152) );
  INVX1 U245 ( .A(curr_st[0]), .Y(n142) );
  OAI21X1 U246 ( .A(n23), .B(n154), .C(1'b1), .Y(n273) );
  INVX1 U247 ( .A(address[1]), .Y(n154) );
  OAI21X1 U248 ( .A(n23), .B(n155), .C(1'b1), .Y(n271) );
  INVX1 U249 ( .A(address[2]), .Y(n155) );
  OAI21X1 U250 ( .A(n23), .B(n156), .C(1'b1), .Y(n269) );
  INVX1 U251 ( .A(address[3]), .Y(n156) );
  OAI21X1 U252 ( .A(n23), .B(n157), .C(n158), .Y(n267) );
  AOI22X1 U253 ( .A(n22), .B(r_addr[4]), .C(n24), .D(w_addr[4]), .Y(n158) );
  INVX1 U254 ( .A(address[4]), .Y(n157) );
  OAI21X1 U255 ( .A(n147), .B(n159), .C(n160), .Y(n265) );
  AOI22X1 U256 ( .A(n22), .B(r_addr[5]), .C(n24), .D(w_addr[5]), .Y(n160) );
  INVX1 U257 ( .A(address[5]), .Y(n159) );
  OAI21X1 U258 ( .A(n147), .B(n161), .C(n162), .Y(n263) );
  AOI22X1 U259 ( .A(n22), .B(r_addr[6]), .C(n24), .D(w_addr[6]), .Y(n162) );
  INVX1 U260 ( .A(address[6]), .Y(n161) );
  OAI21X1 U261 ( .A(n147), .B(n163), .C(n164), .Y(n261) );
  AOI22X1 U262 ( .A(n22), .B(r_addr[7]), .C(n24), .D(w_addr[7]), .Y(n164) );
  INVX1 U263 ( .A(address[7]), .Y(n163) );
  OAI21X1 U264 ( .A(n147), .B(n165), .C(n166), .Y(n259) );
  AOI22X1 U265 ( .A(n22), .B(r_addr[8]), .C(n24), .D(w_addr[8]), .Y(n166) );
  INVX1 U266 ( .A(address[8]), .Y(n165) );
  OAI21X1 U267 ( .A(n147), .B(n167), .C(n168), .Y(n257) );
  AOI22X1 U268 ( .A(n22), .B(r_addr[9]), .C(n24), .D(w_addr[9]), .Y(n168) );
  INVX1 U269 ( .A(address[9]), .Y(n167) );
  OAI21X1 U270 ( .A(n147), .B(n169), .C(n170), .Y(n255) );
  AOI22X1 U271 ( .A(n22), .B(r_addr[10]), .C(n24), .D(w_addr[10]), .Y(n170) );
  INVX1 U272 ( .A(address[10]), .Y(n169) );
  OAI21X1 U273 ( .A(n147), .B(n171), .C(n172), .Y(n253) );
  AOI22X1 U274 ( .A(n22), .B(r_addr[11]), .C(n24), .D(w_addr[11]), .Y(n172) );
  INVX1 U275 ( .A(address[11]), .Y(n171) );
  OAI21X1 U276 ( .A(n147), .B(n173), .C(n174), .Y(n251) );
  AOI22X1 U277 ( .A(n22), .B(r_addr[12]), .C(n24), .D(w_addr[12]), .Y(n174) );
  INVX1 U278 ( .A(address[12]), .Y(n173) );
  OAI21X1 U279 ( .A(n147), .B(n175), .C(n176), .Y(n249) );
  AOI22X1 U280 ( .A(n22), .B(r_addr[13]), .C(n24), .D(w_addr[13]), .Y(n176) );
  INVX1 U281 ( .A(address[13]), .Y(n175) );
  OAI21X1 U282 ( .A(n147), .B(n177), .C(n178), .Y(n247) );
  AOI22X1 U283 ( .A(n22), .B(r_addr[14]), .C(n24), .D(w_addr[14]), .Y(n178) );
  INVX1 U284 ( .A(address[14]), .Y(n177) );
  OAI21X1 U285 ( .A(n147), .B(n179), .C(n180), .Y(n213) );
  AOI22X1 U286 ( .A(n22), .B(r_addr[15]), .C(n24), .D(w_addr[15]), .Y(n180) );
  NOR2X1 U287 ( .A(n144), .B(n143), .Y(n150) );
  NOR2X1 U288 ( .A(n144), .B(curr_st[2]), .Y(n149) );
  INVX1 U289 ( .A(n147), .Y(n144) );
  INVX1 U290 ( .A(address[15]), .Y(n179) );
  NOR2X1 U291 ( .A(n72), .B(n181), .Y(n147) );
  OAI21X1 U292 ( .A(curr_st[0]), .B(n77), .C(n182), .Y(n181) );
  NAND2X1 U293 ( .A(n143), .B(n145), .Y(n77) );
  INVX1 U294 ( .A(curr_st[1]), .Y(n145) );
  INVX1 U295 ( .A(curr_st[2]), .Y(n143) );
  INVX1 U296 ( .A(n103), .Y(n72) );
  NOR2X1 U297 ( .A(n104), .B(n106), .Y(n103) );
  AND2X1 U298 ( .A(n183), .B(n184), .Y(n106) );
  NOR2X1 U299 ( .A(n185), .B(n186), .Y(n184) );
  NOR2X1 U300 ( .A(w_addr[13]), .B(w_addr[10]), .Y(n187) );
  NAND3X1 U301 ( .A(n79), .B(n101), .C(n188), .Y(n185) );
  NOR2X1 U302 ( .A(w_addr[6]), .B(w_addr[5]), .Y(n188) );
  INVX1 U303 ( .A(w_addr[15]), .Y(n101) );
  INVX1 U304 ( .A(w_addr[14]), .Y(n79) );
  NOR2X1 U305 ( .A(n189), .B(n190), .Y(n183) );
  NAND3X1 U306 ( .A(w_addr[9]), .B(w_addr[8]), .C(n191), .Y(n190) );
  AND2X1 U307 ( .A(w_addr[4]), .B(w_addr[7]), .Y(n191) );
  INVX1 U308 ( .A(n107), .Y(n104) );
  NAND2X1 U309 ( .A(n192), .B(n193), .Y(n107) );
  NOR2X1 U310 ( .A(n194), .B(n195), .Y(n193) );
  NOR2X1 U311 ( .A(r_addr[13]), .B(r_addr[10]), .Y(n196) );
  NAND3X1 U312 ( .A(n68), .B(n70), .C(n197), .Y(n194) );
  NOR2X1 U313 ( .A(r_addr[6]), .B(r_addr[5]), .Y(n197) );
  INVX1 U362 ( .A(r_addr[15]), .Y(n70) );
  INVX1 U363 ( .A(r_addr[14]), .Y(n68) );
  NOR2X1 U364 ( .A(n198), .B(n199), .Y(n192) );
  NAND3X1 U386 ( .A(r_addr[9]), .B(r_addr[8]), .C(n200), .Y(n199) );
  AND2X1 U387 ( .A(r_addr[4]), .B(r_addr[7]), .Y(n200) );
  NAND2X1 U388 ( .A(n314), .B(curr_st[1]), .Y(n182) );
  NAND2X1 U390 ( .A(curr_st[2]), .B(curr_st[0]), .Y(n105) );
endmodule


module flex_buffer_NUM_BITS32_3 ( clk, n_rst, input_data, output_data );
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


module cla_4bit_225 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_224 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_223 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_222 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_16bit_55 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, cout, n8, n9, n10;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  cla_4bit_225 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_224 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n10), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_223 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n9), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_222 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n8), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  NOR2X1 U1 ( .A(n1), .B(n2), .Y(pg) );
  NAND2X1 U2 ( .A(p[3]), .B(p[2]), .Y(n2) );
  NAND2X1 U3 ( .A(p[1]), .B(p[0]), .Y(n1) );
  INVX1 U4 ( .A(n3), .Y(cout) );
  AOI21X1 U5 ( .A(n8), .B(p[3]), .C(g[3]), .Y(n3) );
  INVX1 U6 ( .A(n4), .Y(n8) );
  AOI21X1 U7 ( .A(n9), .B(p[2]), .C(g[2]), .Y(n4) );
  INVX1 U8 ( .A(n5), .Y(n9) );
  AOI21X1 U9 ( .A(n10), .B(p[1]), .C(g[1]), .Y(n5) );
  INVX1 U10 ( .A(n6), .Y(n10) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n6) );
endmodule


module cla_4bit_221 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_220 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_219 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_218 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_16bit_54 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, cout, n8, n9, n10;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  cla_4bit_221 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_220 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n10), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_219 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n9), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_218 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n8), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  NOR2X1 U1 ( .A(n1), .B(n2), .Y(pg) );
  NAND2X1 U2 ( .A(p[3]), .B(p[2]), .Y(n2) );
  NAND2X1 U3 ( .A(p[1]), .B(p[0]), .Y(n1) );
  INVX1 U4 ( .A(n3), .Y(cout) );
  AOI21X1 U5 ( .A(n8), .B(p[3]), .C(g[3]), .Y(n3) );
  INVX1 U6 ( .A(n4), .Y(n8) );
  AOI21X1 U7 ( .A(n9), .B(p[2]), .C(g[2]), .Y(n4) );
  INVX1 U8 ( .A(n5), .Y(n9) );
  AOI21X1 U9 ( .A(n10), .B(p[1]), .C(g[1]), .Y(n5) );
  INVX1 U10 ( .A(n6), .Y(n10) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n6) );
endmodule


module cla_4bit_217 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_216 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_215 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_214 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_16bit_53 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, cout, n8, n9, n10;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  cla_4bit_217 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_216 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n10), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_215 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n9), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_214 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n8), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  NOR2X1 U1 ( .A(n1), .B(n2), .Y(pg) );
  NAND2X1 U2 ( .A(p[3]), .B(p[2]), .Y(n2) );
  NAND2X1 U3 ( .A(p[1]), .B(p[0]), .Y(n1) );
  INVX1 U4 ( .A(n3), .Y(cout) );
  AOI21X1 U5 ( .A(n8), .B(p[3]), .C(g[3]), .Y(n3) );
  INVX1 U6 ( .A(n4), .Y(n8) );
  AOI21X1 U7 ( .A(n9), .B(p[2]), .C(g[2]), .Y(n4) );
  INVX1 U8 ( .A(n5), .Y(n9) );
  AOI21X1 U9 ( .A(n10), .B(p[1]), .C(g[1]), .Y(n5) );
  INVX1 U10 ( .A(n6), .Y(n10) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n6) );
endmodule


module cla_4bit_213 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_212 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_211 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_210 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_16bit_52 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, cout, n8, n9, n10;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  cla_4bit_213 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_212 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n10), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_211 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n9), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_210 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n8), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  NOR2X1 U1 ( .A(n1), .B(n2), .Y(pg) );
  NAND2X1 U2 ( .A(p[3]), .B(p[2]), .Y(n2) );
  NAND2X1 U3 ( .A(p[1]), .B(p[0]), .Y(n1) );
  INVX1 U4 ( .A(n3), .Y(cout) );
  AOI21X1 U5 ( .A(n8), .B(p[3]), .C(g[3]), .Y(n3) );
  INVX1 U6 ( .A(n4), .Y(n8) );
  AOI21X1 U7 ( .A(n9), .B(p[2]), .C(g[2]), .Y(n4) );
  INVX1 U8 ( .A(n5), .Y(n9) );
  AOI21X1 U9 ( .A(n10), .B(p[1]), .C(g[1]), .Y(n5) );
  INVX1 U10 ( .A(n6), .Y(n10) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n6) );
endmodule


module amp_clip_1 ( inchan, comp_in, outchan );
  input [15:0] inchan;
  input [3:0] comp_in;
  output [15:0] outchan;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n44, n45,
         n46;
  wire   [15:0] neg_comp_out;
  wire   [15:0] pos_comp_out;
  wire   [15:0] neg_clipped;
  wire   [15:0] pos_clipped;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1;

  cla_16bit_55 A1 ( .a(inchan), .b({1'b1, n42, n44, n45, n46, 1'b1, 1'b1, 1'b1, 
        1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1}), .cin(1'b1), .sum({
        pos_comp_out[15:1], SYNOPSYS_UNCONNECTED__0}) );
  cla_16bit_54 A2 ( .a(inchan), .b({1'b0, comp_in, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .cin(1'b0), .sum({
        neg_comp_out[15:1], SYNOPSYS_UNCONNECTED__1}) );
  cla_16bit_53 A3 ( .a({1'b0, 1'b0, pos_comp_out[14:1]}), .b({1'b0, comp_in, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), 
        .cin(1'b0), .sum(pos_clipped) );
  cla_16bit_52 A4 ( .a({1'b1, 1'b1, neg_comp_out[14:1]}), .b({1'b1, n42, n44, 
        n45, n46, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 
        1'b1}), .cin(1'b1), .sum(neg_clipped) );
  INVX2 U3 ( .A(n27), .Y(n3) );
  BUFX2 U4 ( .A(n7), .Y(n1) );
  INVX2 U5 ( .A(n24), .Y(n2) );
  OAI21X1 U6 ( .A(n3), .B(n4), .C(n5), .Y(outchan[9]) );
  AOI22X1 U7 ( .A(pos_clipped[9]), .B(n2), .C(neg_clipped[9]), .D(n1), .Y(n5)
         );
  INVX1 U8 ( .A(inchan[9]), .Y(n4) );
  OAI21X1 U9 ( .A(n3), .B(n8), .C(n9), .Y(outchan[8]) );
  AOI22X1 U10 ( .A(pos_clipped[8]), .B(n2), .C(neg_clipped[8]), .D(n1), .Y(n9)
         );
  INVX1 U11 ( .A(inchan[8]), .Y(n8) );
  OAI21X1 U12 ( .A(n3), .B(n10), .C(n11), .Y(outchan[7]) );
  AOI22X1 U13 ( .A(pos_clipped[7]), .B(n2), .C(neg_clipped[7]), .D(n1), .Y(n11) );
  INVX1 U14 ( .A(inchan[7]), .Y(n10) );
  OAI21X1 U15 ( .A(n3), .B(n12), .C(n13), .Y(outchan[6]) );
  AOI22X1 U16 ( .A(pos_clipped[6]), .B(n2), .C(neg_clipped[6]), .D(n1), .Y(n13) );
  INVX1 U17 ( .A(inchan[6]), .Y(n12) );
  OAI21X1 U18 ( .A(n3), .B(n14), .C(n15), .Y(outchan[5]) );
  AOI22X1 U19 ( .A(pos_clipped[5]), .B(n6), .C(neg_clipped[5]), .D(n1), .Y(n15) );
  INVX1 U20 ( .A(inchan[5]), .Y(n14) );
  OAI21X1 U21 ( .A(n3), .B(n16), .C(n17), .Y(outchan[4]) );
  AOI22X1 U22 ( .A(pos_clipped[4]), .B(n6), .C(neg_clipped[4]), .D(n1), .Y(n17) );
  INVX1 U23 ( .A(inchan[4]), .Y(n16) );
  OAI21X1 U24 ( .A(n3), .B(n18), .C(n19), .Y(outchan[3]) );
  AOI22X1 U25 ( .A(pos_clipped[3]), .B(n6), .C(neg_clipped[3]), .D(n1), .Y(n19) );
  INVX1 U26 ( .A(inchan[3]), .Y(n18) );
  OAI21X1 U27 ( .A(n3), .B(n20), .C(n21), .Y(outchan[2]) );
  AOI22X1 U28 ( .A(pos_clipped[2]), .B(n6), .C(neg_clipped[2]), .D(n1), .Y(n21) );
  INVX1 U29 ( .A(inchan[2]), .Y(n20) );
  OAI21X1 U30 ( .A(n3), .B(n22), .C(n23), .Y(outchan[1]) );
  AOI22X1 U31 ( .A(pos_clipped[1]), .B(n6), .C(neg_clipped[1]), .D(n1), .Y(n23) );
  INVX1 U32 ( .A(inchan[1]), .Y(n22) );
  OAI21X1 U33 ( .A(n24), .B(n25), .C(n26), .Y(outchan[15]) );
  OAI21X1 U34 ( .A(neg_clipped[15]), .B(n27), .C(inchan[15]), .Y(n26) );
  INVX1 U35 ( .A(pos_clipped[15]), .Y(n25) );
  INVX1 U36 ( .A(n6), .Y(n24) );
  OAI21X1 U37 ( .A(n3), .B(n28), .C(n29), .Y(outchan[14]) );
  AOI22X1 U38 ( .A(pos_clipped[14]), .B(n6), .C(neg_clipped[14]), .D(n1), .Y(
        n29) );
  INVX1 U39 ( .A(inchan[14]), .Y(n28) );
  OAI21X1 U40 ( .A(n3), .B(n30), .C(n31), .Y(outchan[13]) );
  AOI22X1 U41 ( .A(pos_clipped[13]), .B(n6), .C(neg_clipped[13]), .D(n1), .Y(
        n31) );
  INVX1 U42 ( .A(inchan[13]), .Y(n30) );
  OAI21X1 U43 ( .A(n3), .B(n32), .C(n33), .Y(outchan[12]) );
  AOI22X1 U44 ( .A(pos_clipped[12]), .B(n6), .C(neg_clipped[12]), .D(n1), .Y(
        n33) );
  INVX1 U45 ( .A(inchan[12]), .Y(n32) );
  OAI21X1 U46 ( .A(n3), .B(n34), .C(n35), .Y(outchan[11]) );
  AOI22X1 U47 ( .A(pos_clipped[11]), .B(n6), .C(neg_clipped[11]), .D(n1), .Y(
        n35) );
  INVX1 U48 ( .A(inchan[11]), .Y(n34) );
  OAI21X1 U49 ( .A(n3), .B(n36), .C(n37), .Y(outchan[10]) );
  AOI22X1 U50 ( .A(pos_clipped[10]), .B(n6), .C(neg_clipped[10]), .D(n1), .Y(
        n37) );
  INVX1 U51 ( .A(inchan[10]), .Y(n36) );
  OAI21X1 U52 ( .A(n3), .B(n38), .C(n39), .Y(outchan[0]) );
  AOI22X1 U53 ( .A(pos_clipped[0]), .B(n6), .C(neg_clipped[0]), .D(n1), .Y(n39) );
  NOR2X1 U54 ( .A(n40), .B(n27), .Y(n7) );
  NOR2X1 U55 ( .A(n27), .B(inchan[15]), .Y(n6) );
  INVX1 U56 ( .A(inchan[0]), .Y(n38) );
  MUX2X1 U57 ( .B(neg_comp_out[15]), .A(n41), .S(n40), .Y(n27) );
  INVX1 U58 ( .A(inchan[15]), .Y(n40) );
  INVX1 U59 ( .A(pos_comp_out[15]), .Y(n41) );
  INVX1 U60 ( .A(comp_in[3]), .Y(n42) );
  INVX1 U62 ( .A(comp_in[2]), .Y(n44) );
  INVX1 U63 ( .A(comp_in[1]), .Y(n45) );
  INVX1 U64 ( .A(comp_in[0]), .Y(n46) );
endmodule


module cla_4bit_209 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_208 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_207 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_206 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_16bit_51 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, cout, n8, n9, n10;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  cla_4bit_209 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_208 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n10), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_207 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n9), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_206 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n8), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  NOR2X1 U1 ( .A(n1), .B(n2), .Y(pg) );
  NAND2X1 U2 ( .A(p[3]), .B(p[2]), .Y(n2) );
  NAND2X1 U3 ( .A(p[1]), .B(p[0]), .Y(n1) );
  INVX1 U4 ( .A(n3), .Y(cout) );
  AOI21X1 U5 ( .A(n8), .B(p[3]), .C(g[3]), .Y(n3) );
  INVX1 U6 ( .A(n4), .Y(n8) );
  AOI21X1 U7 ( .A(n9), .B(p[2]), .C(g[2]), .Y(n4) );
  INVX1 U8 ( .A(n5), .Y(n9) );
  AOI21X1 U9 ( .A(n10), .B(p[1]), .C(g[1]), .Y(n5) );
  INVX1 U10 ( .A(n6), .Y(n10) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n6) );
endmodule


module cla_4bit_205 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_204 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_203 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_202 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_16bit_50 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, cout, n8, n9, n10;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  cla_4bit_205 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_204 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n10), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_203 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n9), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_202 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n8), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  NOR2X1 U1 ( .A(n1), .B(n2), .Y(pg) );
  NAND2X1 U2 ( .A(p[3]), .B(p[2]), .Y(n2) );
  NAND2X1 U3 ( .A(p[1]), .B(p[0]), .Y(n1) );
  INVX1 U4 ( .A(n3), .Y(cout) );
  AOI21X1 U5 ( .A(n8), .B(p[3]), .C(g[3]), .Y(n3) );
  INVX1 U6 ( .A(n4), .Y(n8) );
  AOI21X1 U7 ( .A(n9), .B(p[2]), .C(g[2]), .Y(n4) );
  INVX1 U8 ( .A(n5), .Y(n9) );
  AOI21X1 U9 ( .A(n10), .B(p[1]), .C(g[1]), .Y(n5) );
  INVX1 U10 ( .A(n6), .Y(n10) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n6) );
endmodule


module cla_4bit_201 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_200 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_199 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_198 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_16bit_49 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, cout, n8, n9, n10;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  cla_4bit_201 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_200 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n10), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_199 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n9), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_198 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n8), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  NOR2X1 U1 ( .A(n1), .B(n2), .Y(pg) );
  NAND2X1 U2 ( .A(p[3]), .B(p[2]), .Y(n2) );
  NAND2X1 U3 ( .A(p[1]), .B(p[0]), .Y(n1) );
  INVX1 U4 ( .A(n3), .Y(cout) );
  AOI21X1 U5 ( .A(n8), .B(p[3]), .C(g[3]), .Y(n3) );
  INVX1 U6 ( .A(n4), .Y(n8) );
  AOI21X1 U7 ( .A(n9), .B(p[2]), .C(g[2]), .Y(n4) );
  INVX1 U8 ( .A(n5), .Y(n9) );
  AOI21X1 U9 ( .A(n10), .B(p[1]), .C(g[1]), .Y(n5) );
  INVX1 U10 ( .A(n6), .Y(n10) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n6) );
endmodule


module cla_4bit_197 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_196 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_195 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_194 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_16bit_48 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, cout, n8, n9, n10;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  cla_4bit_197 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_196 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n10), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_195 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n9), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_194 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n8), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  NOR2X1 U1 ( .A(n1), .B(n2), .Y(pg) );
  NAND2X1 U2 ( .A(p[3]), .B(p[2]), .Y(n2) );
  NAND2X1 U3 ( .A(p[1]), .B(p[0]), .Y(n1) );
  INVX1 U4 ( .A(n3), .Y(cout) );
  AOI21X1 U5 ( .A(n8), .B(p[3]), .C(g[3]), .Y(n3) );
  INVX1 U6 ( .A(n4), .Y(n8) );
  AOI21X1 U7 ( .A(n9), .B(p[2]), .C(g[2]), .Y(n4) );
  INVX1 U8 ( .A(n5), .Y(n9) );
  AOI21X1 U9 ( .A(n10), .B(p[1]), .C(g[1]), .Y(n5) );
  INVX1 U10 ( .A(n6), .Y(n10) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n6) );
endmodule


module amp_clip_0 ( inchan, comp_in, outchan );
  input [15:0] inchan;
  input [3:0] comp_in;
  output [15:0] outchan;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n44, n45,
         n46;
  wire   [15:0] neg_comp_out;
  wire   [15:0] pos_comp_out;
  wire   [15:0] neg_clipped;
  wire   [15:0] pos_clipped;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1;

  cla_16bit_51 A1 ( .a(inchan), .b({1'b1, n42, n44, n45, n46, 1'b1, 1'b1, 1'b1, 
        1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1}), .cin(1'b1), .sum({
        pos_comp_out[15:1], SYNOPSYS_UNCONNECTED__0}) );
  cla_16bit_50 A2 ( .a(inchan), .b({1'b0, comp_in, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .cin(1'b0), .sum({
        neg_comp_out[15:1], SYNOPSYS_UNCONNECTED__1}) );
  cla_16bit_49 A3 ( .a({1'b0, 1'b0, pos_comp_out[14:1]}), .b({1'b0, comp_in, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), 
        .cin(1'b0), .sum(pos_clipped) );
  cla_16bit_48 A4 ( .a({1'b1, 1'b1, neg_comp_out[14:1]}), .b({1'b1, n42, n44, 
        n45, n46, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 
        1'b1}), .cin(1'b1), .sum(neg_clipped) );
  INVX2 U3 ( .A(n27), .Y(n3) );
  BUFX2 U4 ( .A(n7), .Y(n1) );
  INVX2 U5 ( .A(n24), .Y(n2) );
  OAI21X1 U6 ( .A(n3), .B(n4), .C(n5), .Y(outchan[9]) );
  AOI22X1 U7 ( .A(pos_clipped[9]), .B(n2), .C(neg_clipped[9]), .D(n1), .Y(n5)
         );
  INVX1 U8 ( .A(inchan[9]), .Y(n4) );
  OAI21X1 U9 ( .A(n3), .B(n8), .C(n9), .Y(outchan[8]) );
  AOI22X1 U10 ( .A(pos_clipped[8]), .B(n2), .C(neg_clipped[8]), .D(n1), .Y(n9)
         );
  INVX1 U11 ( .A(inchan[8]), .Y(n8) );
  OAI21X1 U12 ( .A(n3), .B(n10), .C(n11), .Y(outchan[7]) );
  AOI22X1 U13 ( .A(pos_clipped[7]), .B(n2), .C(neg_clipped[7]), .D(n1), .Y(n11) );
  INVX1 U14 ( .A(inchan[7]), .Y(n10) );
  OAI21X1 U15 ( .A(n3), .B(n12), .C(n13), .Y(outchan[6]) );
  AOI22X1 U16 ( .A(pos_clipped[6]), .B(n2), .C(neg_clipped[6]), .D(n1), .Y(n13) );
  INVX1 U17 ( .A(inchan[6]), .Y(n12) );
  OAI21X1 U18 ( .A(n3), .B(n14), .C(n15), .Y(outchan[5]) );
  AOI22X1 U19 ( .A(pos_clipped[5]), .B(n6), .C(neg_clipped[5]), .D(n1), .Y(n15) );
  INVX1 U20 ( .A(inchan[5]), .Y(n14) );
  OAI21X1 U21 ( .A(n3), .B(n16), .C(n17), .Y(outchan[4]) );
  AOI22X1 U22 ( .A(pos_clipped[4]), .B(n6), .C(neg_clipped[4]), .D(n1), .Y(n17) );
  INVX1 U23 ( .A(inchan[4]), .Y(n16) );
  OAI21X1 U24 ( .A(n3), .B(n18), .C(n19), .Y(outchan[3]) );
  AOI22X1 U25 ( .A(pos_clipped[3]), .B(n6), .C(neg_clipped[3]), .D(n1), .Y(n19) );
  INVX1 U26 ( .A(inchan[3]), .Y(n18) );
  OAI21X1 U27 ( .A(n3), .B(n20), .C(n21), .Y(outchan[2]) );
  AOI22X1 U28 ( .A(pos_clipped[2]), .B(n6), .C(neg_clipped[2]), .D(n1), .Y(n21) );
  INVX1 U29 ( .A(inchan[2]), .Y(n20) );
  OAI21X1 U30 ( .A(n3), .B(n22), .C(n23), .Y(outchan[1]) );
  AOI22X1 U31 ( .A(pos_clipped[1]), .B(n6), .C(neg_clipped[1]), .D(n1), .Y(n23) );
  INVX1 U32 ( .A(inchan[1]), .Y(n22) );
  OAI21X1 U33 ( .A(n24), .B(n25), .C(n26), .Y(outchan[15]) );
  OAI21X1 U34 ( .A(neg_clipped[15]), .B(n27), .C(inchan[15]), .Y(n26) );
  INVX1 U35 ( .A(pos_clipped[15]), .Y(n25) );
  INVX1 U36 ( .A(n6), .Y(n24) );
  OAI21X1 U37 ( .A(n3), .B(n28), .C(n29), .Y(outchan[14]) );
  AOI22X1 U38 ( .A(pos_clipped[14]), .B(n6), .C(neg_clipped[14]), .D(n1), .Y(
        n29) );
  INVX1 U39 ( .A(inchan[14]), .Y(n28) );
  OAI21X1 U40 ( .A(n3), .B(n30), .C(n31), .Y(outchan[13]) );
  AOI22X1 U41 ( .A(pos_clipped[13]), .B(n6), .C(neg_clipped[13]), .D(n1), .Y(
        n31) );
  INVX1 U42 ( .A(inchan[13]), .Y(n30) );
  OAI21X1 U43 ( .A(n3), .B(n32), .C(n33), .Y(outchan[12]) );
  AOI22X1 U44 ( .A(pos_clipped[12]), .B(n6), .C(neg_clipped[12]), .D(n1), .Y(
        n33) );
  INVX1 U45 ( .A(inchan[12]), .Y(n32) );
  OAI21X1 U46 ( .A(n3), .B(n34), .C(n35), .Y(outchan[11]) );
  AOI22X1 U47 ( .A(pos_clipped[11]), .B(n6), .C(neg_clipped[11]), .D(n1), .Y(
        n35) );
  INVX1 U48 ( .A(inchan[11]), .Y(n34) );
  OAI21X1 U49 ( .A(n3), .B(n36), .C(n37), .Y(outchan[10]) );
  AOI22X1 U50 ( .A(pos_clipped[10]), .B(n6), .C(neg_clipped[10]), .D(n1), .Y(
        n37) );
  INVX1 U51 ( .A(inchan[10]), .Y(n36) );
  OAI21X1 U52 ( .A(n3), .B(n38), .C(n39), .Y(outchan[0]) );
  AOI22X1 U53 ( .A(pos_clipped[0]), .B(n6), .C(neg_clipped[0]), .D(n1), .Y(n39) );
  NOR2X1 U54 ( .A(n40), .B(n27), .Y(n7) );
  NOR2X1 U55 ( .A(n27), .B(inchan[15]), .Y(n6) );
  INVX1 U56 ( .A(inchan[0]), .Y(n38) );
  MUX2X1 U57 ( .B(neg_comp_out[15]), .A(n41), .S(n40), .Y(n27) );
  INVX1 U58 ( .A(inchan[15]), .Y(n40) );
  INVX1 U59 ( .A(pos_comp_out[15]), .Y(n41) );
  INVX1 U60 ( .A(comp_in[3]), .Y(n42) );
  INVX1 U62 ( .A(comp_in[2]), .Y(n44) );
  INVX1 U63 ( .A(comp_in[1]), .Y(n45) );
  INVX1 U64 ( .A(comp_in[0]), .Y(n46) );
endmodule


module flex_buffer_NUM_BITS32_2 ( clk, n_rst, input_data, output_data );
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


module flex_buffer_NUM_BITS16_4 ( clk, n_rst, input_data, output_data );
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


module cla_4bit_193 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_192 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_191 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_190 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_16bit_47 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, cout, n8, n9, n10;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  cla_4bit_193 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_192 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n10), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_191 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n9), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_190 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n8), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  NOR2X1 U1 ( .A(n1), .B(n2), .Y(pg) );
  NAND2X1 U2 ( .A(p[3]), .B(p[2]), .Y(n2) );
  NAND2X1 U3 ( .A(p[1]), .B(p[0]), .Y(n1) );
  INVX1 U4 ( .A(n3), .Y(cout) );
  AOI21X1 U5 ( .A(n8), .B(p[3]), .C(g[3]), .Y(n3) );
  INVX1 U6 ( .A(n4), .Y(n8) );
  AOI21X1 U7 ( .A(n9), .B(p[2]), .C(g[2]), .Y(n4) );
  INVX1 U8 ( .A(n5), .Y(n9) );
  AOI21X1 U9 ( .A(n10), .B(p[1]), .C(g[1]), .Y(n5) );
  INVX1 U10 ( .A(n6), .Y(n10) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n6) );
endmodule


module cla_4bit_189 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_188 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_187 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_186 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_16bit_46 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, cout, n8, n9, n10;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  cla_4bit_189 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_188 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n10), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_187 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n9), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_186 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n8), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  NOR2X1 U1 ( .A(n1), .B(n2), .Y(pg) );
  NAND2X1 U2 ( .A(p[3]), .B(p[2]), .Y(n2) );
  NAND2X1 U3 ( .A(p[1]), .B(p[0]), .Y(n1) );
  INVX1 U4 ( .A(n3), .Y(cout) );
  AOI21X1 U5 ( .A(n8), .B(p[3]), .C(g[3]), .Y(n3) );
  INVX1 U6 ( .A(n4), .Y(n8) );
  AOI21X1 U7 ( .A(n9), .B(p[2]), .C(g[2]), .Y(n4) );
  INVX1 U8 ( .A(n5), .Y(n9) );
  AOI21X1 U9 ( .A(n10), .B(p[1]), .C(g[1]), .Y(n5) );
  INVX1 U10 ( .A(n6), .Y(n10) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n6) );
endmodule


module cla_4bit_185 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_184 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_183 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_182 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_16bit_45 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, cout, n8, n9, n10;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  cla_4bit_185 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_184 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n10), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_183 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n9), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_182 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n8), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  NOR2X1 U1 ( .A(n1), .B(n2), .Y(pg) );
  NAND2X1 U2 ( .A(p[3]), .B(p[2]), .Y(n2) );
  NAND2X1 U3 ( .A(p[1]), .B(p[0]), .Y(n1) );
  INVX1 U4 ( .A(n3), .Y(cout) );
  AOI21X1 U5 ( .A(n8), .B(p[3]), .C(g[3]), .Y(n3) );
  INVX1 U6 ( .A(n4), .Y(n8) );
  AOI21X1 U7 ( .A(n9), .B(p[2]), .C(g[2]), .Y(n4) );
  INVX1 U8 ( .A(n5), .Y(n9) );
  AOI21X1 U9 ( .A(n10), .B(p[1]), .C(g[1]), .Y(n5) );
  INVX1 U10 ( .A(n6), .Y(n10) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n6) );
endmodule


module cla_4bit_181 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_180 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_179 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_178 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_16bit_44 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, cout, n8, n9, n10;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  cla_4bit_181 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_180 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n10), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_179 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n9), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_178 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n8), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  NOR2X1 U1 ( .A(n1), .B(n2), .Y(pg) );
  NAND2X1 U2 ( .A(p[3]), .B(p[2]), .Y(n2) );
  NAND2X1 U3 ( .A(p[1]), .B(p[0]), .Y(n1) );
  INVX1 U4 ( .A(n3), .Y(cout) );
  AOI21X1 U5 ( .A(n8), .B(p[3]), .C(g[3]), .Y(n3) );
  INVX1 U6 ( .A(n4), .Y(n8) );
  AOI21X1 U7 ( .A(n9), .B(p[2]), .C(g[2]), .Y(n4) );
  INVX1 U8 ( .A(n5), .Y(n9) );
  AOI21X1 U9 ( .A(n10), .B(p[1]), .C(g[1]), .Y(n5) );
  INVX1 U10 ( .A(n6), .Y(n10) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n6) );
endmodule


module cla_4bit_177 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_176 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_175 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_174 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n35, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34;

  BUFX2 U1 ( .A(n35), .Y(sum[3]) );
  MUX2X1 U2 ( .B(n2), .A(n3), .S(n4), .Y(n35) );
  XNOR2X1 U3 ( .A(a[3]), .B(b[3]), .Y(n3) );
  NOR2X1 U4 ( .A(n5), .B(n6), .Y(n2) );
  INVX1 U5 ( .A(n7), .Y(n5) );
  MUX2X1 U6 ( .B(n8), .A(n9), .S(n10), .Y(sum[2]) );
  NOR2X1 U7 ( .A(n11), .B(n12), .Y(n9) );
  XNOR2X1 U8 ( .A(a[2]), .B(b[2]), .Y(n8) );
  OAI21X1 U9 ( .A(n13), .B(n14), .C(n15), .Y(sum[1]) );
  MUX2X1 U10 ( .B(n16), .A(n17), .S(b[1]), .Y(n15) );
  XOR2X1 U11 ( .A(a[1]), .B(n13), .Y(n17) );
  NOR2X1 U12 ( .A(n18), .B(n19), .Y(n16) );
  INVX1 U13 ( .A(n19), .Y(n13) );
  NAND2X1 U14 ( .A(n20), .B(n21), .Y(n19) );
  MUX2X1 U15 ( .B(n22), .A(n23), .S(cin), .Y(sum[0]) );
  AND2X1 U16 ( .A(n24), .B(n21), .Y(n23) );
  XNOR2X1 U17 ( .A(a[0]), .B(b[0]), .Y(n22) );
  NOR2X1 U18 ( .A(n25), .B(n26), .Y(pg) );
  OR2X1 U19 ( .A(n6), .B(n12), .Y(n26) );
  NAND2X1 U20 ( .A(n24), .B(n14), .Y(n25) );
  OAI21X1 U21 ( .A(n6), .B(n27), .C(n7), .Y(gg) );
  INVX1 U22 ( .A(n28), .Y(n27) );
  OAI21X1 U23 ( .A(n29), .B(n12), .C(n30), .Y(n28) );
  OAI21X1 U24 ( .A(n4), .B(n6), .C(n7), .Y(cout) );
  NAND2X1 U25 ( .A(a[3]), .B(b[3]), .Y(n7) );
  NOR2X1 U26 ( .A(b[3]), .B(a[3]), .Y(n6) );
  AOI21X1 U27 ( .A(n10), .B(n31), .C(n11), .Y(n4) );
  INVX1 U28 ( .A(n30), .Y(n11) );
  NAND2X1 U29 ( .A(b[2]), .B(a[2]), .Y(n30) );
  INVX1 U30 ( .A(n12), .Y(n31) );
  NOR2X1 U31 ( .A(b[2]), .B(a[2]), .Y(n12) );
  OAI21X1 U32 ( .A(n32), .B(n20), .C(n29), .Y(n10) );
  NAND2X1 U33 ( .A(n14), .B(n33), .Y(n29) );
  OAI21X1 U34 ( .A(n18), .B(n34), .C(n21), .Y(n33) );
  NAND2X1 U35 ( .A(b[0]), .B(a[0]), .Y(n21) );
  NAND2X1 U36 ( .A(cin), .B(n24), .Y(n20) );
  OR2X1 U37 ( .A(a[0]), .B(b[0]), .Y(n24) );
  INVX1 U38 ( .A(n14), .Y(n32) );
  NAND2X1 U39 ( .A(n18), .B(n34), .Y(n14) );
  INVX1 U40 ( .A(b[1]), .Y(n34) );
  INVX1 U41 ( .A(a[1]), .Y(n18) );
endmodule


module cla_16bit_43 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, cout, n8, n9, n10;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  cla_4bit_177 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_176 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n10), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_175 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n9), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_174 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n8), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  NOR2X1 U1 ( .A(n1), .B(n2), .Y(pg) );
  NAND2X1 U2 ( .A(p[3]), .B(p[2]), .Y(n2) );
  NAND2X1 U3 ( .A(p[1]), .B(p[0]), .Y(n1) );
  INVX1 U4 ( .A(n3), .Y(cout) );
  AOI21X1 U5 ( .A(n8), .B(p[3]), .C(g[3]), .Y(n3) );
  INVX1 U6 ( .A(n4), .Y(n8) );
  AOI21X1 U7 ( .A(n9), .B(p[2]), .C(g[2]), .Y(n4) );
  INVX1 U8 ( .A(n5), .Y(n9) );
  AOI21X1 U9 ( .A(n10), .B(p[1]), .C(g[1]), .Y(n5) );
  INVX1 U10 ( .A(n6), .Y(n10) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n6) );
endmodule


module cla_4bit_173 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_172 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_171 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_170 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n35, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34;

  BUFX2 U1 ( .A(n35), .Y(sum[3]) );
  MUX2X1 U2 ( .B(n2), .A(n3), .S(n4), .Y(n35) );
  XNOR2X1 U3 ( .A(a[3]), .B(b[3]), .Y(n3) );
  NOR2X1 U4 ( .A(n5), .B(n6), .Y(n2) );
  INVX1 U5 ( .A(n7), .Y(n5) );
  MUX2X1 U6 ( .B(n8), .A(n9), .S(n10), .Y(sum[2]) );
  NOR2X1 U7 ( .A(n11), .B(n12), .Y(n9) );
  XNOR2X1 U8 ( .A(a[2]), .B(b[2]), .Y(n8) );
  OAI21X1 U9 ( .A(n13), .B(n14), .C(n15), .Y(sum[1]) );
  MUX2X1 U10 ( .B(n16), .A(n17), .S(b[1]), .Y(n15) );
  XOR2X1 U11 ( .A(a[1]), .B(n13), .Y(n17) );
  NOR2X1 U12 ( .A(n18), .B(n19), .Y(n16) );
  INVX1 U13 ( .A(n19), .Y(n13) );
  NAND2X1 U14 ( .A(n20), .B(n21), .Y(n19) );
  MUX2X1 U15 ( .B(n22), .A(n23), .S(cin), .Y(sum[0]) );
  AND2X1 U16 ( .A(n24), .B(n21), .Y(n23) );
  XNOR2X1 U17 ( .A(a[0]), .B(b[0]), .Y(n22) );
  NOR2X1 U18 ( .A(n25), .B(n26), .Y(pg) );
  OR2X1 U19 ( .A(n6), .B(n12), .Y(n26) );
  NAND2X1 U20 ( .A(n24), .B(n14), .Y(n25) );
  OAI21X1 U21 ( .A(n6), .B(n27), .C(n7), .Y(gg) );
  INVX1 U22 ( .A(n28), .Y(n27) );
  OAI21X1 U23 ( .A(n29), .B(n12), .C(n30), .Y(n28) );
  OAI21X1 U24 ( .A(n4), .B(n6), .C(n7), .Y(cout) );
  NAND2X1 U25 ( .A(a[3]), .B(b[3]), .Y(n7) );
  NOR2X1 U26 ( .A(b[3]), .B(a[3]), .Y(n6) );
  AOI21X1 U27 ( .A(n10), .B(n31), .C(n11), .Y(n4) );
  INVX1 U28 ( .A(n30), .Y(n11) );
  NAND2X1 U29 ( .A(b[2]), .B(a[2]), .Y(n30) );
  INVX1 U30 ( .A(n12), .Y(n31) );
  NOR2X1 U31 ( .A(b[2]), .B(a[2]), .Y(n12) );
  OAI21X1 U32 ( .A(n32), .B(n20), .C(n29), .Y(n10) );
  NAND2X1 U33 ( .A(n14), .B(n33), .Y(n29) );
  OAI21X1 U34 ( .A(n18), .B(n34), .C(n21), .Y(n33) );
  NAND2X1 U35 ( .A(b[0]), .B(a[0]), .Y(n21) );
  NAND2X1 U36 ( .A(cin), .B(n24), .Y(n20) );
  OR2X1 U37 ( .A(a[0]), .B(b[0]), .Y(n24) );
  INVX1 U38 ( .A(n14), .Y(n32) );
  NAND2X1 U39 ( .A(n18), .B(n34), .Y(n14) );
  INVX1 U40 ( .A(b[1]), .Y(n34) );
  INVX1 U41 ( .A(a[1]), .Y(n18) );
endmodule


module cla_16bit_42 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, cout, n8, n9, n10;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  cla_4bit_173 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_172 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n10), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_171 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n9), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_170 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n8), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  NOR2X1 U1 ( .A(n1), .B(n2), .Y(pg) );
  NAND2X1 U2 ( .A(p[3]), .B(p[2]), .Y(n2) );
  NAND2X1 U3 ( .A(p[1]), .B(p[0]), .Y(n1) );
  INVX1 U4 ( .A(n3), .Y(cout) );
  AOI21X1 U5 ( .A(n8), .B(p[3]), .C(g[3]), .Y(n3) );
  INVX1 U6 ( .A(n4), .Y(n8) );
  AOI21X1 U7 ( .A(n9), .B(p[2]), .C(g[2]), .Y(n4) );
  INVX1 U8 ( .A(n5), .Y(n9) );
  AOI21X1 U9 ( .A(n10), .B(p[1]), .C(g[1]), .Y(n5) );
  INVX1 U10 ( .A(n6), .Y(n10) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n6) );
endmodule


module cla_4bit_169 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_168 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_167 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_166 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n35, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34;

  BUFX2 U1 ( .A(n35), .Y(sum[3]) );
  MUX2X1 U2 ( .B(n2), .A(n3), .S(n4), .Y(n35) );
  XNOR2X1 U3 ( .A(a[3]), .B(b[3]), .Y(n3) );
  NOR2X1 U4 ( .A(n5), .B(n6), .Y(n2) );
  INVX1 U5 ( .A(n7), .Y(n5) );
  MUX2X1 U6 ( .B(n8), .A(n9), .S(n10), .Y(sum[2]) );
  NOR2X1 U7 ( .A(n11), .B(n12), .Y(n9) );
  XNOR2X1 U8 ( .A(a[2]), .B(b[2]), .Y(n8) );
  OAI21X1 U9 ( .A(n13), .B(n14), .C(n15), .Y(sum[1]) );
  MUX2X1 U10 ( .B(n16), .A(n17), .S(b[1]), .Y(n15) );
  XOR2X1 U11 ( .A(a[1]), .B(n13), .Y(n17) );
  NOR2X1 U12 ( .A(n18), .B(n19), .Y(n16) );
  INVX1 U13 ( .A(n19), .Y(n13) );
  NAND2X1 U14 ( .A(n20), .B(n21), .Y(n19) );
  MUX2X1 U15 ( .B(n22), .A(n23), .S(cin), .Y(sum[0]) );
  AND2X1 U16 ( .A(n24), .B(n21), .Y(n23) );
  XNOR2X1 U17 ( .A(a[0]), .B(b[0]), .Y(n22) );
  NOR2X1 U18 ( .A(n25), .B(n26), .Y(pg) );
  OR2X1 U19 ( .A(n6), .B(n12), .Y(n26) );
  NAND2X1 U20 ( .A(n24), .B(n14), .Y(n25) );
  OAI21X1 U21 ( .A(n6), .B(n27), .C(n7), .Y(gg) );
  INVX1 U22 ( .A(n28), .Y(n27) );
  OAI21X1 U23 ( .A(n29), .B(n12), .C(n30), .Y(n28) );
  OAI21X1 U24 ( .A(n4), .B(n6), .C(n7), .Y(cout) );
  NAND2X1 U25 ( .A(a[3]), .B(b[3]), .Y(n7) );
  NOR2X1 U26 ( .A(b[3]), .B(a[3]), .Y(n6) );
  AOI21X1 U27 ( .A(n10), .B(n31), .C(n11), .Y(n4) );
  INVX1 U28 ( .A(n30), .Y(n11) );
  NAND2X1 U29 ( .A(b[2]), .B(a[2]), .Y(n30) );
  INVX1 U30 ( .A(n12), .Y(n31) );
  NOR2X1 U31 ( .A(b[2]), .B(a[2]), .Y(n12) );
  OAI21X1 U32 ( .A(n32), .B(n20), .C(n29), .Y(n10) );
  NAND2X1 U33 ( .A(n14), .B(n33), .Y(n29) );
  OAI21X1 U34 ( .A(n18), .B(n34), .C(n21), .Y(n33) );
  NAND2X1 U35 ( .A(b[0]), .B(a[0]), .Y(n21) );
  NAND2X1 U36 ( .A(cin), .B(n24), .Y(n20) );
  OR2X1 U37 ( .A(a[0]), .B(b[0]), .Y(n24) );
  INVX1 U38 ( .A(n14), .Y(n32) );
  NAND2X1 U39 ( .A(n18), .B(n34), .Y(n14) );
  INVX1 U40 ( .A(b[1]), .Y(n34) );
  INVX1 U41 ( .A(a[1]), .Y(n18) );
endmodule


module cla_16bit_41 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, cout, n8, n9, n10;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  cla_4bit_169 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_168 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n10), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_167 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n9), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_166 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n8), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  NOR2X1 U1 ( .A(n1), .B(n2), .Y(pg) );
  NAND2X1 U2 ( .A(p[3]), .B(p[2]), .Y(n2) );
  NAND2X1 U3 ( .A(p[1]), .B(p[0]), .Y(n1) );
  INVX1 U4 ( .A(n3), .Y(cout) );
  AOI21X1 U5 ( .A(n8), .B(p[3]), .C(g[3]), .Y(n3) );
  INVX1 U6 ( .A(n4), .Y(n8) );
  AOI21X1 U7 ( .A(n9), .B(p[2]), .C(g[2]), .Y(n4) );
  INVX1 U8 ( .A(n5), .Y(n9) );
  AOI21X1 U9 ( .A(n10), .B(p[1]), .C(g[1]), .Y(n5) );
  INVX1 U10 ( .A(n6), .Y(n10) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n6) );
endmodule


module cla_4bit_165 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_164 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_163 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_162 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_16bit_40 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, cout, n8, n9, n10;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  cla_4bit_165 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_164 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n10), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_163 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n9), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_162 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n8), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  NOR2X1 U1 ( .A(n1), .B(n2), .Y(pg) );
  NAND2X1 U2 ( .A(p[3]), .B(p[2]), .Y(n2) );
  NAND2X1 U3 ( .A(p[1]), .B(p[0]), .Y(n1) );
  INVX1 U4 ( .A(n3), .Y(cout) );
  AOI21X1 U5 ( .A(n8), .B(p[3]), .C(g[3]), .Y(n3) );
  INVX1 U6 ( .A(n4), .Y(n8) );
  AOI21X1 U7 ( .A(n9), .B(p[2]), .C(g[2]), .Y(n4) );
  INVX1 U8 ( .A(n5), .Y(n9) );
  AOI21X1 U9 ( .A(n10), .B(p[1]), .C(g[1]), .Y(n5) );
  INVX1 U10 ( .A(n6), .Y(n10) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n6) );
endmodule


module cla_4bit_63 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_62 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_61 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_60 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_16bit_15 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, cout, n8, n9, n10;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  cla_4bit_63 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_62 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n10), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_61 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n9), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_60 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n8), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  NOR2X1 U1 ( .A(n1), .B(n2), .Y(pg) );
  NAND2X1 U2 ( .A(p[3]), .B(p[2]), .Y(n2) );
  NAND2X1 U3 ( .A(p[1]), .B(p[0]), .Y(n1) );
  INVX1 U4 ( .A(n3), .Y(cout) );
  AOI21X1 U5 ( .A(n8), .B(p[3]), .C(g[3]), .Y(n3) );
  INVX1 U6 ( .A(n4), .Y(n8) );
  AOI21X1 U7 ( .A(n9), .B(p[2]), .C(g[2]), .Y(n4) );
  INVX1 U8 ( .A(n5), .Y(n9) );
  AOI21X1 U9 ( .A(n10), .B(p[1]), .C(g[1]), .Y(n5) );
  INVX1 U10 ( .A(n6), .Y(n10) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n6) );
endmodule


module adder_1bit_23 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2;

  XOR2X1 U1 ( .A(carry_in), .B(n1), .Y(sum) );
  INVX1 U2 ( .A(n2), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n1), .D(carry_in), .Y(n2) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n1) );
endmodule


module cla_4bit_59 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_58 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_57 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_56 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_16bit_14 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, cout, n8, n9, n10;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  cla_4bit_59 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_58 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n10), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_57 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n9), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_56 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n8), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  NOR2X1 U1 ( .A(n1), .B(n2), .Y(pg) );
  NAND2X1 U2 ( .A(p[3]), .B(p[2]), .Y(n2) );
  NAND2X1 U3 ( .A(p[1]), .B(p[0]), .Y(n1) );
  INVX1 U4 ( .A(n3), .Y(cout) );
  AOI21X1 U5 ( .A(n8), .B(p[3]), .C(g[3]), .Y(n3) );
  INVX1 U6 ( .A(n4), .Y(n8) );
  AOI21X1 U7 ( .A(n9), .B(p[2]), .C(g[2]), .Y(n4) );
  INVX1 U8 ( .A(n5), .Y(n9) );
  AOI21X1 U9 ( .A(n10), .B(p[1]), .C(g[1]), .Y(n5) );
  INVX1 U10 ( .A(n6), .Y(n10) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n6) );
endmodule


module adder_1bit_22 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2;

  XOR2X1 U1 ( .A(carry_in), .B(n1), .Y(sum) );
  INVX1 U2 ( .A(n2), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n1), .D(carry_in), .Y(n2) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n1) );
endmodule


module adder_1bit_21 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2;

  XOR2X1 U1 ( .A(carry_in), .B(n1), .Y(sum) );
  INVX1 U2 ( .A(n2), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n1), .D(carry_in), .Y(n2) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n1) );
endmodule


module cla_4bit_55 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_54 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_53 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_52 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_16bit_13 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, cout, n8, n9, n10;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  cla_4bit_55 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_54 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n10), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_53 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n9), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_52 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n8), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  NOR2X1 U1 ( .A(n1), .B(n2), .Y(pg) );
  NAND2X1 U2 ( .A(p[3]), .B(p[2]), .Y(n2) );
  NAND2X1 U3 ( .A(p[1]), .B(p[0]), .Y(n1) );
  INVX1 U4 ( .A(n3), .Y(cout) );
  AOI21X1 U5 ( .A(n8), .B(p[3]), .C(g[3]), .Y(n3) );
  INVX1 U6 ( .A(n4), .Y(n8) );
  AOI21X1 U7 ( .A(n9), .B(p[2]), .C(g[2]), .Y(n4) );
  INVX1 U8 ( .A(n5), .Y(n9) );
  AOI21X1 U9 ( .A(n10), .B(p[1]), .C(g[1]), .Y(n5) );
  INVX1 U10 ( .A(n6), .Y(n10) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n6) );
endmodule


module adder_1bit_20 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2;

  XOR2X1 U1 ( .A(carry_in), .B(n1), .Y(sum) );
  INVX1 U2 ( .A(n2), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n1), .D(carry_in), .Y(n2) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n1) );
endmodule


module adder_1bit_19 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2;

  XOR2X1 U1 ( .A(carry_in), .B(n1), .Y(sum) );
  INVX1 U2 ( .A(n2), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n1), .D(carry_in), .Y(n2) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n1) );
endmodule


module adder_1bit_18 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2;

  XOR2X1 U1 ( .A(carry_in), .B(n1), .Y(sum) );
  INVX1 U2 ( .A(n2), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n1), .D(carry_in), .Y(n2) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n1) );
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
  INVX2 U2 ( .A(b[1]), .Y(n19) );
  INVX2 U3 ( .A(b[2]), .Y(n18) );
  INVX2 U4 ( .A(b[3]), .Y(n2) );
  INVX2 U5 ( .A(b[0]), .Y(n20) );
  NOR2X1 U6 ( .A(n1), .B(n2), .Y(ab3[9]) );
  NOR2X1 U7 ( .A(n2), .B(n3), .Y(ab3[8]) );
  NOR2X1 U8 ( .A(n2), .B(n4), .Y(ab3[7]) );
  NOR2X1 U9 ( .A(n2), .B(n5), .Y(ab3[6]) );
  NOR2X1 U10 ( .A(n2), .B(n6), .Y(ab3[5]) );
  NOR2X1 U11 ( .A(n2), .B(n7), .Y(ab3[4]) );
  NOR2X1 U12 ( .A(n2), .B(n8), .Y(ab3[3]) );
  NOR2X1 U13 ( .A(n2), .B(n9), .Y(ab3[18]) );
  NOR2X1 U14 ( .A(n2), .B(n10), .Y(ab3[17]) );
  NOR2X1 U15 ( .A(n2), .B(n11), .Y(ab3[16]) );
  NOR2X1 U16 ( .A(n2), .B(n12), .Y(ab3[15]) );
  NOR2X1 U17 ( .A(n2), .B(n13), .Y(ab3[14]) );
  NOR2X1 U18 ( .A(n2), .B(n14), .Y(ab3[13]) );
  NOR2X1 U19 ( .A(n2), .B(n15), .Y(ab3[12]) );
  NOR2X1 U20 ( .A(n2), .B(n16), .Y(ab3[11]) );
  NOR2X1 U21 ( .A(n2), .B(n17), .Y(ab3[10]) );
  NOR2X1 U22 ( .A(n17), .B(n18), .Y(ab2[9]) );
  NOR2X1 U23 ( .A(n1), .B(n18), .Y(ab2[8]) );
  NOR2X1 U24 ( .A(n3), .B(n18), .Y(ab2[7]) );
  NOR2X1 U25 ( .A(n4), .B(n18), .Y(ab2[6]) );
  NOR2X1 U26 ( .A(n5), .B(n18), .Y(ab2[5]) );
  NOR2X1 U27 ( .A(n6), .B(n18), .Y(ab2[4]) );
  NOR2X1 U28 ( .A(n7), .B(n18), .Y(ab2[3]) );
  NOR2X1 U29 ( .A(n8), .B(n18), .Y(ab2[2]) );
  NOR2X1 U30 ( .A(n9), .B(n18), .Y(ab2[17]) );
  NOR2X1 U31 ( .A(n10), .B(n18), .Y(ab2[16]) );
  NOR2X1 U32 ( .A(n11), .B(n18), .Y(ab2[15]) );
  NOR2X1 U33 ( .A(n12), .B(n18), .Y(ab2[14]) );
  NOR2X1 U34 ( .A(n13), .B(n18), .Y(ab2[13]) );
  NOR2X1 U35 ( .A(n14), .B(n18), .Y(ab2[12]) );
  NOR2X1 U36 ( .A(n15), .B(n18), .Y(ab2[11]) );
  NOR2X1 U37 ( .A(n16), .B(n18), .Y(ab2[10]) );
  NOR2X1 U38 ( .A(n16), .B(n19), .Y(ab1[9]) );
  NOR2X1 U39 ( .A(n17), .B(n19), .Y(ab1[8]) );
  NOR2X1 U40 ( .A(n1), .B(n19), .Y(ab1[7]) );
  NOR2X1 U41 ( .A(n3), .B(n19), .Y(ab1[6]) );
  NOR2X1 U42 ( .A(n4), .B(n19), .Y(ab1[5]) );
  NOR2X1 U43 ( .A(n5), .B(n19), .Y(ab1[4]) );
  NOR2X1 U44 ( .A(n6), .B(n19), .Y(ab1[3]) );
  NOR2X1 U45 ( .A(n7), .B(n19), .Y(ab1[2]) );
  NOR2X1 U46 ( .A(n8), .B(n19), .Y(ab1[1]) );
  NOR2X1 U47 ( .A(n10), .B(n19), .Y(ab1[15]) );
  NOR2X1 U48 ( .A(n11), .B(n19), .Y(ab1[14]) );
  NOR2X1 U49 ( .A(n12), .B(n19), .Y(ab1[13]) );
  NOR2X1 U50 ( .A(n13), .B(n19), .Y(ab1[12]) );
  NOR2X1 U51 ( .A(n14), .B(n19), .Y(ab1[11]) );
  NOR2X1 U52 ( .A(n15), .B(n19), .Y(ab1[10]) );
  NOR2X1 U53 ( .A(n15), .B(n20), .Y(ab0[9]) );
  INVX1 U54 ( .A(a[9]), .Y(n15) );
  NOR2X1 U55 ( .A(n16), .B(n20), .Y(ab0[8]) );
  INVX1 U56 ( .A(a[8]), .Y(n16) );
  NOR2X1 U57 ( .A(n17), .B(n20), .Y(ab0[7]) );
  INVX1 U58 ( .A(a[7]), .Y(n17) );
  NOR2X1 U59 ( .A(n1), .B(n20), .Y(ab0[6]) );
  INVX1 U60 ( .A(a[6]), .Y(n1) );
  NOR2X1 U61 ( .A(n3), .B(n20), .Y(ab0[5]) );
  INVX1 U62 ( .A(a[5]), .Y(n3) );
  NOR2X1 U63 ( .A(n4), .B(n20), .Y(ab0[4]) );
  INVX1 U64 ( .A(a[4]), .Y(n4) );
  NOR2X1 U65 ( .A(n5), .B(n20), .Y(ab0[3]) );
  INVX1 U66 ( .A(a[3]), .Y(n5) );
  NOR2X1 U67 ( .A(n6), .B(n20), .Y(ab0[2]) );
  INVX1 U68 ( .A(a[2]), .Y(n6) );
  NOR2X1 U69 ( .A(n7), .B(n20), .Y(ab0[1]) );
  INVX1 U70 ( .A(a[1]), .Y(n7) );
  NOR2X1 U71 ( .A(n9), .B(n20), .Y(ab0[15]) );
  INVX1 U72 ( .A(a[15]), .Y(n9) );
  NOR2X1 U73 ( .A(n10), .B(n20), .Y(ab0[14]) );
  INVX1 U74 ( .A(a[14]), .Y(n10) );
  NOR2X1 U75 ( .A(n11), .B(n20), .Y(ab0[13]) );
  INVX1 U76 ( .A(a[13]), .Y(n11) );
  NOR2X1 U77 ( .A(n12), .B(n20), .Y(ab0[12]) );
  INVX1 U78 ( .A(a[12]), .Y(n12) );
  NOR2X1 U79 ( .A(n13), .B(n20), .Y(ab0[11]) );
  INVX1 U80 ( .A(a[11]), .Y(n13) );
  NOR2X1 U81 ( .A(n14), .B(n20), .Y(ab0[10]) );
  INVX1 U82 ( .A(a[10]), .Y(n14) );
  NOR2X1 U83 ( .A(n8), .B(n20), .Y(ab0[0]) );
  INVX1 U84 ( .A(a[0]), .Y(n8) );
endmodule


module cla_4bit_161 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_160 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_159 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_158 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_16bit_39 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, cout, n8, n9, n10;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  cla_4bit_161 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_160 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n10), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_159 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n9), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_158 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n8), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  NOR2X1 U1 ( .A(n1), .B(n2), .Y(pg) );
  NAND2X1 U2 ( .A(p[3]), .B(p[2]), .Y(n2) );
  NAND2X1 U3 ( .A(p[1]), .B(p[0]), .Y(n1) );
  INVX1 U4 ( .A(n3), .Y(cout) );
  AOI21X1 U5 ( .A(n8), .B(p[3]), .C(g[3]), .Y(n3) );
  INVX1 U6 ( .A(n4), .Y(n8) );
  AOI21X1 U7 ( .A(n9), .B(p[2]), .C(g[2]), .Y(n4) );
  INVX1 U8 ( .A(n5), .Y(n9) );
  AOI21X1 U9 ( .A(n10), .B(p[1]), .C(g[1]), .Y(n5) );
  INVX1 U10 ( .A(n6), .Y(n10) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n6) );
endmodule


module cla_4bit_157 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_156 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_155 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_154 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_16bit_38 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, cout, n8, n9, n10;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  cla_4bit_157 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_156 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n10), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_155 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n9), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_154 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n8), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  NOR2X1 U1 ( .A(n1), .B(n2), .Y(pg) );
  NAND2X1 U2 ( .A(p[3]), .B(p[2]), .Y(n2) );
  NAND2X1 U3 ( .A(p[1]), .B(p[0]), .Y(n1) );
  INVX1 U4 ( .A(n3), .Y(cout) );
  AOI21X1 U5 ( .A(n8), .B(p[3]), .C(g[3]), .Y(n3) );
  INVX1 U6 ( .A(n4), .Y(n8) );
  AOI21X1 U7 ( .A(n9), .B(p[2]), .C(g[2]), .Y(n4) );
  INVX1 U8 ( .A(n5), .Y(n9) );
  AOI21X1 U9 ( .A(n10), .B(p[1]), .C(g[1]), .Y(n5) );
  INVX1 U10 ( .A(n6), .Y(n10) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n6) );
endmodule


module amp_comp_1 ( clk, n_rst, inchan, in_thresh, outchan );
  input [15:0] inchan;
  input [3:0] in_thresh;
  output [15:0] outchan;
  input clk, n_rst;
  wire   \AcmpB[15] , \CcmpD[15] , \diff1[15] , n297, n298, n299, n300, n301,
         n302, n303, n304, n305, n306, n307, n308, n309, n310, n311, n312, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n162, n164, n166, n168, n170, n172,
         n174, n175, n176, n177, n178, n179, n180, n181, n182, n183, n184,
         n185, n186, n187, n188, n189, n190, n191, n192, n193, n194, n195,
         n196, n197, n198, n199, n200, n201, n202, n203, n204, n205, n206,
         n207, n208, n209, n210, n211, n212, n213, n214, n215, n216, n217,
         n218, n219, n220, n221, n222, n223, n224, n225, n226, n227, n228,
         n229, n230, n231, n232, n233, n234, n235, n236, n237, n238, n239,
         n240, n241, n242, n243, n244, n245, n246, n247, n248, n249, n250,
         n251, n252, n253, n254, n255, n256, n257, n258, n259, n260, n261,
         n262, n263, n264, n265, n266, n267, n268, n269, n270, n271, n272,
         n273, n274, n275, n276, n277, n278, n279, n280, n281, n282, n283,
         n284, n285, n286, n287, n288, n289, n290, n291, n292, n293, n294,
         n295;
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

  flex_buffer_NUM_BITS16_7 BUFFER1 ( .clk(n1), .n_rst(n_rst), .input_data(
        inchan), .output_data(reg_1_out) );
  flex_buffer_NUM_BITS16_6 BUFFER2 ( .clk(n1), .n_rst(n_rst), .input_data(
        reg_1_out), .output_data(reg_2_out) );
  flex_buffer_NUM_BITS16_5 BUFFER3 ( .clk(n1), .n_rst(n_rst), .input_data(
        reg_2_out), .output_data(reg_3_out) );
  flex_buffer_NUM_BITS16_4 BUFFER4 ( .clk(n1), .n_rst(n_rst), .input_data(
        reg_3_out), .output_data(reg_4_out) );
  cla_16bit_47 ABSA ( .a({n276, n277, n278, n279, n280, n281, n282, n283, n284, 
        n285, n286, n287, n288, n289, n290, n291}), .b({1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .cin(1'b1), .sum(A_opp_sign) );
  cla_16bit_46 ABSB ( .a({n213, n214, n215, n216, n217, n218, n219, n220, n221, 
        n222, n223, n224, n225, n226, n227, n228}), .b({1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .cin(1'b1), .sum(B_opp_sign) );
  cla_16bit_45 ABSC ( .a({n229, n230, n231, n232, n233, n234, n235, n236, n237, 
        n238, n239, n240, n241, n242, n243, n244}), .b({1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .cin(1'b1), .sum(C_opp_sign) );
  cla_16bit_44 ABSD ( .a({n260, n261, n262, n263, n264, n265, n266, n267, n268, 
        n269, n270, n271, n272, n273, n274, n275}), .b({1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .cin(1'b1), .sum(D_opp_sign) );
  cla_16bit_43 A2 ( .a({1'b0, A[14:0]}), .b({1'b1, n203, n202, n201, n200, 
        n199, n212, n211, n210, n209, n208, n207, n206, n205, n204, n198}), 
        .cin(1'b1), .sum({\AcmpB[15] , SYNOPSYS_UNCONNECTED__0, 
        SYNOPSYS_UNCONNECTED__1, SYNOPSYS_UNCONNECTED__2, 
        SYNOPSYS_UNCONNECTED__3, SYNOPSYS_UNCONNECTED__4, 
        SYNOPSYS_UNCONNECTED__5, SYNOPSYS_UNCONNECTED__6, 
        SYNOPSYS_UNCONNECTED__7, SYNOPSYS_UNCONNECTED__8, 
        SYNOPSYS_UNCONNECTED__9, SYNOPSYS_UNCONNECTED__10, 
        SYNOPSYS_UNCONNECTED__11, SYNOPSYS_UNCONNECTED__12, 
        SYNOPSYS_UNCONNECTED__13, SYNOPSYS_UNCONNECTED__14}) );
  cla_16bit_42 A3 ( .a({1'b0, C[14:0]}), .b({1'b1, n250, n249, n248, n247, 
        n246, n259, n258, n257, n256, n255, n254, n253, n252, n251, n245}), 
        .cin(1'b1), .sum({\CcmpD[15] , SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29}) );
  cla_16bit_41 A4 ( .a({1'b0, n188, n187, n186, n185, n184, n197, n196, n195, 
        n194, n193, n192, n191, n190, n189, n183}), .b({1'b1, n298, n299, n300, 
        n301, n302, n303, n304, n305, n306, n307, n308, n309, n310, n311, n312}), .cin(1'b1), .sum({\diff1[15] , SYNOPSYS_UNCONNECTED__30, 
        SYNOPSYS_UNCONNECTED__31, SYNOPSYS_UNCONNECTED__32, 
        SYNOPSYS_UNCONNECTED__33, SYNOPSYS_UNCONNECTED__34, 
        SYNOPSYS_UNCONNECTED__35, SYNOPSYS_UNCONNECTED__36, 
        SYNOPSYS_UNCONNECTED__37, SYNOPSYS_UNCONNECTED__38, 
        SYNOPSYS_UNCONNECTED__39, SYNOPSYS_UNCONNECTED__40, 
        SYNOPSYS_UNCONNECTED__41, SYNOPSYS_UNCONNECTED__42, 
        SYNOPSYS_UNCONNECTED__43, SYNOPSYS_UNCONNECTED__44}) );
  cla_16bit_40 A5 ( .a({1'b0, max[14:0]}), .b({1'b1, n292, n293, n294, n295, 
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
  cla_16bit_39 A6 ( .a(reg_4_out), .b({1'b1, n182, n297, n180, n179, n178, 
        n175, n176, n177, n162, n164, n166, n168, n170, n172, n174}), .cin(
        1'b1), .sum(out_pos_val) );
  cla_16bit_38 A7 ( .a(reg_4_out), .b({1'b0, modifier[14], n181, 
        modifier[12:0]}), .cin(1'b0), .sum(out_neg_val) );
  INVX2 U3 ( .A(n83), .Y(n50) );
  INVX2 U4 ( .A(n72), .Y(n49) );
  INVX2 U5 ( .A(reg_3_out[15]), .Y(n229) );
  INVX2 U6 ( .A(reg_1_out[15]), .Y(n276) );
  INVX2 U7 ( .A(reg_2_out[15]), .Y(n213) );
  INVX4 U8 ( .A(reg_4_out[15]), .Y(n260) );
  INVX4 U9 ( .A(n2), .Y(n1) );
  INVX2 U10 ( .A(clk), .Y(n2) );
  INVX1 U11 ( .A(n3), .Y(outchan[7]) );
  MUX2X1 U12 ( .B(out_neg_val[7]), .A(out_pos_val[7]), .S(n260), .Y(n3) );
  INVX1 U13 ( .A(n4), .Y(outchan[11]) );
  MUX2X1 U14 ( .B(out_neg_val[11]), .A(out_pos_val[11]), .S(n260), .Y(n4) );
  INVX1 U15 ( .A(n5), .Y(outchan[10]) );
  MUX2X1 U16 ( .B(out_neg_val[10]), .A(out_pos_val[10]), .S(n260), .Y(n5) );
  INVX1 U17 ( .A(n6), .Y(outchan[9]) );
  MUX2X1 U18 ( .B(out_neg_val[9]), .A(out_pos_val[9]), .S(n260), .Y(n6) );
  INVX1 U19 ( .A(n7), .Y(outchan[8]) );
  MUX2X1 U20 ( .B(out_neg_val[8]), .A(out_pos_val[8]), .S(n260), .Y(n7) );
  INVX1 U21 ( .A(n8), .Y(outchan[15]) );
  MUX2X1 U22 ( .B(out_neg_val[15]), .A(out_pos_val[15]), .S(n260), .Y(n8) );
  INVX1 U23 ( .A(n9), .Y(outchan[14]) );
  MUX2X1 U24 ( .B(out_neg_val[14]), .A(out_pos_val[14]), .S(n260), .Y(n9) );
  INVX1 U25 ( .A(n10), .Y(outchan[13]) );
  MUX2X1 U26 ( .B(out_neg_val[13]), .A(out_pos_val[13]), .S(n260), .Y(n10) );
  INVX1 U27 ( .A(n11), .Y(outchan[12]) );
  MUX2X1 U28 ( .B(out_neg_val[12]), .A(out_pos_val[12]), .S(n260), .Y(n11) );
  INVX1 U29 ( .A(n12), .Y(outchan[6]) );
  MUX2X1 U30 ( .B(out_neg_val[6]), .A(out_pos_val[6]), .S(n260), .Y(n12) );
  INVX1 U31 ( .A(modifier[6]), .Y(n162) );
  INVX1 U32 ( .A(n13), .Y(outchan[5]) );
  MUX2X1 U33 ( .B(out_neg_val[5]), .A(out_pos_val[5]), .S(n260), .Y(n13) );
  INVX1 U34 ( .A(modifier[5]), .Y(n164) );
  INVX1 U35 ( .A(n14), .Y(outchan[4]) );
  MUX2X1 U36 ( .B(out_neg_val[4]), .A(out_pos_val[4]), .S(n260), .Y(n14) );
  INVX1 U37 ( .A(modifier[4]), .Y(n166) );
  INVX1 U38 ( .A(n15), .Y(outchan[3]) );
  MUX2X1 U39 ( .B(out_neg_val[3]), .A(out_pos_val[3]), .S(n260), .Y(n15) );
  INVX1 U40 ( .A(modifier[3]), .Y(n168) );
  INVX1 U41 ( .A(n16), .Y(outchan[2]) );
  MUX2X1 U42 ( .B(out_neg_val[2]), .A(out_pos_val[2]), .S(n260), .Y(n16) );
  INVX1 U43 ( .A(modifier[2]), .Y(n170) );
  INVX1 U44 ( .A(n17), .Y(outchan[1]) );
  MUX2X1 U45 ( .B(out_neg_val[1]), .A(out_pos_val[1]), .S(n260), .Y(n17) );
  INVX1 U46 ( .A(modifier[1]), .Y(n172) );
  INVX1 U47 ( .A(n18), .Y(outchan[0]) );
  MUX2X1 U48 ( .B(out_neg_val[0]), .A(out_pos_val[0]), .S(n260), .Y(n18) );
  INVX1 U49 ( .A(modifier[0]), .Y(n174) );
  INVX1 U50 ( .A(modifier[9]), .Y(n175) );
  INVX1 U51 ( .A(modifier[8]), .Y(n176) );
  INVX1 U52 ( .A(modifier[7]), .Y(n177) );
  INVX1 U53 ( .A(modifier[10]), .Y(n178) );
  INVX1 U54 ( .A(modifier[11]), .Y(n179) );
  INVX1 U55 ( .A(modifier[12]), .Y(n180) );
  INVX1 U56 ( .A(n297), .Y(n181) );
  INVX1 U57 ( .A(modifier[14]), .Y(n182) );
  INVX1 U58 ( .A(n19), .Y(n183) );
  INVX1 U59 ( .A(n20), .Y(n184) );
  INVX1 U60 ( .A(n21), .Y(n185) );
  INVX1 U61 ( .A(n22), .Y(n186) );
  INVX1 U62 ( .A(n23), .Y(n187) );
  INVX1 U63 ( .A(n24), .Y(n188) );
  INVX1 U64 ( .A(n25), .Y(n189) );
  INVX1 U65 ( .A(n26), .Y(n190) );
  INVX1 U66 ( .A(n27), .Y(n191) );
  INVX1 U67 ( .A(n28), .Y(n192) );
  INVX1 U68 ( .A(n29), .Y(n193) );
  INVX1 U69 ( .A(n30), .Y(n194) );
  INVX1 U70 ( .A(n31), .Y(n195) );
  INVX1 U71 ( .A(n32), .Y(n196) );
  INVX1 U72 ( .A(n33), .Y(n197) );
  INVX1 U73 ( .A(n34), .Y(n198) );
  INVX1 U74 ( .A(n35), .Y(n199) );
  INVX1 U75 ( .A(n36), .Y(n200) );
  INVX1 U76 ( .A(n37), .Y(n201) );
  INVX1 U77 ( .A(n38), .Y(n202) );
  INVX1 U78 ( .A(n39), .Y(n203) );
  INVX1 U79 ( .A(n40), .Y(n204) );
  INVX1 U80 ( .A(n41), .Y(n205) );
  INVX1 U81 ( .A(n42), .Y(n206) );
  INVX1 U82 ( .A(n43), .Y(n207) );
  INVX1 U83 ( .A(n44), .Y(n208) );
  INVX1 U84 ( .A(n45), .Y(n209) );
  INVX1 U85 ( .A(n46), .Y(n210) );
  INVX1 U86 ( .A(n47), .Y(n211) );
  INVX1 U87 ( .A(n48), .Y(n212) );
  INVX1 U88 ( .A(reg_2_out[14]), .Y(n214) );
  INVX1 U89 ( .A(reg_2_out[13]), .Y(n215) );
  INVX1 U90 ( .A(reg_2_out[12]), .Y(n216) );
  INVX1 U91 ( .A(reg_2_out[11]), .Y(n217) );
  INVX1 U92 ( .A(reg_2_out[10]), .Y(n218) );
  INVX1 U93 ( .A(reg_2_out[9]), .Y(n219) );
  INVX1 U94 ( .A(reg_2_out[8]), .Y(n220) );
  INVX1 U95 ( .A(reg_2_out[7]), .Y(n221) );
  INVX1 U96 ( .A(reg_2_out[6]), .Y(n222) );
  INVX1 U97 ( .A(reg_2_out[5]), .Y(n223) );
  INVX1 U98 ( .A(reg_2_out[4]), .Y(n224) );
  INVX1 U99 ( .A(reg_2_out[3]), .Y(n225) );
  INVX1 U100 ( .A(reg_2_out[2]), .Y(n226) );
  INVX1 U101 ( .A(reg_2_out[1]), .Y(n227) );
  INVX1 U102 ( .A(reg_2_out[0]), .Y(n228) );
  INVX1 U103 ( .A(reg_3_out[14]), .Y(n230) );
  INVX1 U104 ( .A(reg_3_out[13]), .Y(n231) );
  INVX1 U105 ( .A(reg_3_out[12]), .Y(n232) );
  INVX1 U106 ( .A(reg_3_out[11]), .Y(n233) );
  INVX1 U107 ( .A(reg_3_out[10]), .Y(n234) );
  INVX1 U108 ( .A(reg_3_out[9]), .Y(n235) );
  INVX1 U109 ( .A(reg_3_out[8]), .Y(n236) );
  INVX1 U110 ( .A(reg_3_out[7]), .Y(n237) );
  INVX1 U111 ( .A(reg_3_out[6]), .Y(n238) );
  INVX1 U112 ( .A(reg_3_out[5]), .Y(n239) );
  INVX1 U113 ( .A(reg_3_out[4]), .Y(n240) );
  INVX1 U114 ( .A(reg_3_out[3]), .Y(n241) );
  INVX1 U115 ( .A(reg_3_out[2]), .Y(n242) );
  INVX1 U116 ( .A(reg_3_out[1]), .Y(n243) );
  INVX1 U117 ( .A(reg_3_out[0]), .Y(n244) );
  INVX1 U118 ( .A(D[0]), .Y(n245) );
  INVX1 U119 ( .A(D[10]), .Y(n246) );
  INVX1 U120 ( .A(D[11]), .Y(n247) );
  INVX1 U121 ( .A(D[12]), .Y(n248) );
  INVX1 U122 ( .A(D[13]), .Y(n249) );
  INVX1 U123 ( .A(D[14]), .Y(n250) );
  INVX1 U124 ( .A(D[1]), .Y(n251) );
  INVX1 U125 ( .A(D[2]), .Y(n252) );
  INVX1 U126 ( .A(D[3]), .Y(n253) );
  INVX1 U127 ( .A(D[4]), .Y(n254) );
  INVX1 U128 ( .A(D[5]), .Y(n255) );
  INVX1 U129 ( .A(D[6]), .Y(n256) );
  INVX1 U130 ( .A(D[7]), .Y(n257) );
  INVX1 U131 ( .A(D[8]), .Y(n258) );
  INVX1 U132 ( .A(D[9]), .Y(n259) );
  INVX1 U133 ( .A(reg_4_out[14]), .Y(n261) );
  INVX1 U134 ( .A(reg_4_out[13]), .Y(n262) );
  INVX1 U135 ( .A(reg_4_out[12]), .Y(n263) );
  INVX1 U136 ( .A(reg_4_out[11]), .Y(n264) );
  INVX1 U137 ( .A(reg_4_out[10]), .Y(n265) );
  INVX1 U138 ( .A(reg_4_out[9]), .Y(n266) );
  INVX1 U139 ( .A(reg_4_out[8]), .Y(n267) );
  INVX1 U140 ( .A(reg_4_out[7]), .Y(n268) );
  INVX1 U141 ( .A(reg_4_out[6]), .Y(n269) );
  INVX1 U142 ( .A(reg_4_out[5]), .Y(n270) );
  INVX1 U143 ( .A(reg_4_out[4]), .Y(n271) );
  INVX1 U144 ( .A(reg_4_out[3]), .Y(n272) );
  INVX1 U145 ( .A(reg_4_out[2]), .Y(n273) );
  INVX1 U146 ( .A(reg_4_out[1]), .Y(n274) );
  INVX1 U147 ( .A(reg_4_out[0]), .Y(n275) );
  INVX1 U148 ( .A(reg_1_out[14]), .Y(n277) );
  INVX1 U149 ( .A(reg_1_out[13]), .Y(n278) );
  INVX1 U150 ( .A(reg_1_out[12]), .Y(n279) );
  INVX1 U151 ( .A(reg_1_out[11]), .Y(n280) );
  INVX1 U152 ( .A(reg_1_out[10]), .Y(n281) );
  INVX1 U153 ( .A(reg_1_out[9]), .Y(n282) );
  INVX1 U154 ( .A(reg_1_out[8]), .Y(n283) );
  INVX1 U155 ( .A(reg_1_out[7]), .Y(n284) );
  INVX1 U156 ( .A(reg_1_out[6]), .Y(n285) );
  INVX1 U157 ( .A(reg_1_out[5]), .Y(n286) );
  INVX1 U158 ( .A(reg_1_out[4]), .Y(n287) );
  INVX1 U159 ( .A(reg_1_out[3]), .Y(n288) );
  INVX1 U160 ( .A(reg_1_out[2]), .Y(n289) );
  INVX1 U161 ( .A(reg_1_out[1]), .Y(n290) );
  INVX1 U162 ( .A(reg_1_out[0]), .Y(n291) );
  INVX1 U163 ( .A(in_thresh[3]), .Y(n292) );
  INVX1 U164 ( .A(in_thresh[2]), .Y(n293) );
  INVX1 U165 ( .A(in_thresh[1]), .Y(n294) );
  INVX1 U166 ( .A(in_thresh[0]), .Y(n295) );
  AOI22X1 U167 ( .A(n49), .B(product[18]), .C(n50), .D(product[19]), .Y(n297)
         );
  NAND2X1 U168 ( .A(n51), .B(n52), .Y(modifier[9]) );
  AOI22X1 U169 ( .A(product[15]), .B(n50), .C(product[14]), .D(n49), .Y(n52)
         );
  AOI22X1 U170 ( .A(product[17]), .B(n53), .C(product[16]), .D(n54), .Y(n51)
         );
  NAND2X1 U171 ( .A(n55), .B(n56), .Y(modifier[8]) );
  AOI22X1 U172 ( .A(product[14]), .B(n50), .C(product[13]), .D(n49), .Y(n56)
         );
  AOI22X1 U173 ( .A(product[16]), .B(n53), .C(product[15]), .D(n54), .Y(n55)
         );
  NAND2X1 U174 ( .A(n57), .B(n58), .Y(modifier[7]) );
  AOI22X1 U175 ( .A(product[13]), .B(n50), .C(n49), .D(product[12]), .Y(n58)
         );
  AOI22X1 U177 ( .A(product[15]), .B(n53), .C(n54), .D(product[14]), .Y(n57)
         );
  NAND2X1 U178 ( .A(n59), .B(n60), .Y(modifier[6]) );
  AOI22X1 U179 ( .A(product[12]), .B(n50), .C(product[11]), .D(n49), .Y(n60)
         );
  AOI22X1 U180 ( .A(product[14]), .B(n53), .C(product[13]), .D(n54), .Y(n59)
         );
  NAND2X1 U181 ( .A(n61), .B(n62), .Y(modifier[5]) );
  AOI22X1 U182 ( .A(product[11]), .B(n50), .C(product[10]), .D(n49), .Y(n62)
         );
  AOI22X1 U183 ( .A(product[13]), .B(n53), .C(n54), .D(product[12]), .Y(n61)
         );
  NAND2X1 U184 ( .A(n63), .B(n64), .Y(modifier[4]) );
  AOI22X1 U185 ( .A(product[10]), .B(n50), .C(product[9]), .D(n49), .Y(n64) );
  AOI22X1 U186 ( .A(n53), .B(product[12]), .C(n54), .D(product[11]), .Y(n63)
         );
  NAND2X1 U187 ( .A(n65), .B(n66), .Y(modifier[3]) );
  AOI22X1 U188 ( .A(product[9]), .B(n50), .C(product[8]), .D(n49), .Y(n66) );
  AOI22X1 U189 ( .A(n53), .B(product[11]), .C(product[10]), .D(n54), .Y(n65)
         );
  NAND2X1 U190 ( .A(n67), .B(n68), .Y(modifier[2]) );
  AOI22X1 U191 ( .A(product[8]), .B(n50), .C(product[7]), .D(n49), .Y(n68) );
  AOI22X1 U192 ( .A(product[10]), .B(n53), .C(product[9]), .D(n54), .Y(n67) );
  NAND2X1 U193 ( .A(n69), .B(n70), .Y(modifier[1]) );
  AOI22X1 U194 ( .A(product[7]), .B(n50), .C(product[6]), .D(n49), .Y(n70) );
  AOI22X1 U195 ( .A(product[9]), .B(n53), .C(product[8]), .D(n54), .Y(n69) );
  NOR2X1 U196 ( .A(n71), .B(n72), .Y(modifier[14]) );
  OAI21X1 U197 ( .A(n73), .B(n71), .C(n74), .Y(modifier[12]) );
  AOI22X1 U198 ( .A(product[18]), .B(n50), .C(product[17]), .D(n49), .Y(n74)
         );
  INVX1 U199 ( .A(product[19]), .Y(n71) );
  NAND2X1 U200 ( .A(n75), .B(n76), .Y(modifier[11]) );
  AOI22X1 U201 ( .A(product[17]), .B(n50), .C(product[16]), .D(n49), .Y(n76)
         );
  AOI22X1 U202 ( .A(product[19]), .B(n53), .C(product[18]), .D(n54), .Y(n75)
         );
  NAND2X1 U203 ( .A(n77), .B(n78), .Y(modifier[10]) );
  AOI22X1 U204 ( .A(product[16]), .B(n50), .C(product[15]), .D(n49), .Y(n78)
         );
  AOI22X1 U205 ( .A(product[18]), .B(n53), .C(product[17]), .D(n54), .Y(n77)
         );
  NAND2X1 U206 ( .A(n79), .B(n80), .Y(modifier[0]) );
  AOI22X1 U207 ( .A(product[6]), .B(n50), .C(product[5]), .D(n49), .Y(n80) );
  NAND3X1 U208 ( .A(n81), .B(max[11]), .C(n82), .Y(n72) );
  NOR2X1 U209 ( .A(max[13]), .B(max[12]), .Y(n82) );
  NAND3X1 U210 ( .A(n84), .B(max[12]), .C(n81), .Y(n83) );
  INVX1 U211 ( .A(max[13]), .Y(n84) );
  AOI22X1 U212 ( .A(product[8]), .B(n53), .C(product[7]), .D(n54), .Y(n79) );
  INVX1 U213 ( .A(n73), .Y(n54) );
  NAND2X1 U214 ( .A(n81), .B(max[13]), .Y(n73) );
  NOR2X1 U215 ( .A(max[14]), .B(diff2[15]), .Y(n81) );
  NOR2X1 U216 ( .A(n85), .B(diff2[15]), .Y(n53) );
  INVX1 U217 ( .A(max[14]), .Y(n85) );
  MUX2X1 U218 ( .B(n33), .A(n303), .S(\diff1[15] ), .Y(max[9]) );
  MUX2X1 U219 ( .B(C[9]), .A(D[9]), .S(\CcmpD[15] ), .Y(n303) );
  MUX2X1 U220 ( .B(A[9]), .A(n48), .S(\AcmpB[15] ), .Y(n33) );
  NAND2X1 U221 ( .A(n86), .B(n87), .Y(n48) );
  MUX2X1 U222 ( .B(B_opp_sign[9]), .A(reg_2_out[9]), .S(n213), .Y(n86) );
  MUX2X1 U223 ( .B(n32), .A(n304), .S(\diff1[15] ), .Y(max[8]) );
  MUX2X1 U224 ( .B(C[8]), .A(D[8]), .S(\CcmpD[15] ), .Y(n304) );
  MUX2X1 U225 ( .B(A[8]), .A(n47), .S(\AcmpB[15] ), .Y(n32) );
  NAND2X1 U226 ( .A(n88), .B(n87), .Y(n47) );
  MUX2X1 U227 ( .B(B_opp_sign[8]), .A(reg_2_out[8]), .S(n213), .Y(n88) );
  MUX2X1 U228 ( .B(n31), .A(n305), .S(\diff1[15] ), .Y(max[7]) );
  MUX2X1 U229 ( .B(C[7]), .A(D[7]), .S(\CcmpD[15] ), .Y(n305) );
  MUX2X1 U230 ( .B(A[7]), .A(n46), .S(\AcmpB[15] ), .Y(n31) );
  NAND2X1 U231 ( .A(n89), .B(n87), .Y(n46) );
  MUX2X1 U232 ( .B(B_opp_sign[7]), .A(reg_2_out[7]), .S(n213), .Y(n89) );
  MUX2X1 U233 ( .B(n30), .A(n306), .S(\diff1[15] ), .Y(max[6]) );
  MUX2X1 U234 ( .B(C[6]), .A(D[6]), .S(\CcmpD[15] ), .Y(n306) );
  MUX2X1 U235 ( .B(A[6]), .A(n45), .S(\AcmpB[15] ), .Y(n30) );
  NAND2X1 U236 ( .A(n90), .B(n87), .Y(n45) );
  MUX2X1 U237 ( .B(B_opp_sign[6]), .A(reg_2_out[6]), .S(n213), .Y(n90) );
  MUX2X1 U238 ( .B(n29), .A(n307), .S(\diff1[15] ), .Y(max[5]) );
  MUX2X1 U239 ( .B(C[5]), .A(D[5]), .S(\CcmpD[15] ), .Y(n307) );
  MUX2X1 U240 ( .B(A[5]), .A(n44), .S(\AcmpB[15] ), .Y(n29) );
  NAND2X1 U241 ( .A(n91), .B(n87), .Y(n44) );
  MUX2X1 U242 ( .B(B_opp_sign[5]), .A(reg_2_out[5]), .S(n213), .Y(n91) );
  MUX2X1 U243 ( .B(n28), .A(n308), .S(\diff1[15] ), .Y(max[4]) );
  MUX2X1 U244 ( .B(C[4]), .A(D[4]), .S(\CcmpD[15] ), .Y(n308) );
  MUX2X1 U245 ( .B(A[4]), .A(n43), .S(\AcmpB[15] ), .Y(n28) );
  NAND2X1 U246 ( .A(n92), .B(n87), .Y(n43) );
  MUX2X1 U247 ( .B(B_opp_sign[4]), .A(reg_2_out[4]), .S(n213), .Y(n92) );
  MUX2X1 U248 ( .B(n27), .A(n309), .S(\diff1[15] ), .Y(max[3]) );
  MUX2X1 U249 ( .B(C[3]), .A(D[3]), .S(\CcmpD[15] ), .Y(n309) );
  MUX2X1 U250 ( .B(A[3]), .A(n42), .S(\AcmpB[15] ), .Y(n27) );
  NAND2X1 U251 ( .A(n93), .B(n87), .Y(n42) );
  MUX2X1 U252 ( .B(B_opp_sign[3]), .A(reg_2_out[3]), .S(n213), .Y(n93) );
  MUX2X1 U253 ( .B(n26), .A(n310), .S(\diff1[15] ), .Y(max[2]) );
  MUX2X1 U254 ( .B(C[2]), .A(D[2]), .S(\CcmpD[15] ), .Y(n310) );
  MUX2X1 U255 ( .B(A[2]), .A(n41), .S(\AcmpB[15] ), .Y(n26) );
  NAND2X1 U256 ( .A(n94), .B(n87), .Y(n41) );
  MUX2X1 U257 ( .B(B_opp_sign[2]), .A(reg_2_out[2]), .S(n213), .Y(n94) );
  MUX2X1 U258 ( .B(n25), .A(n311), .S(\diff1[15] ), .Y(max[1]) );
  MUX2X1 U259 ( .B(C[1]), .A(D[1]), .S(\CcmpD[15] ), .Y(n311) );
  MUX2X1 U260 ( .B(A[1]), .A(n40), .S(\AcmpB[15] ), .Y(n25) );
  NAND2X1 U261 ( .A(n95), .B(n87), .Y(n40) );
  MUX2X1 U262 ( .B(B_opp_sign[1]), .A(reg_2_out[1]), .S(n213), .Y(n95) );
  MUX2X1 U263 ( .B(n24), .A(n298), .S(\diff1[15] ), .Y(max[14]) );
  MUX2X1 U264 ( .B(C[14]), .A(D[14]), .S(\CcmpD[15] ), .Y(n298) );
  MUX2X1 U265 ( .B(A[14]), .A(n39), .S(\AcmpB[15] ), .Y(n24) );
  NAND2X1 U266 ( .A(n96), .B(n87), .Y(n39) );
  MUX2X1 U267 ( .B(B_opp_sign[14]), .A(reg_2_out[14]), .S(n213), .Y(n96) );
  MUX2X1 U268 ( .B(n23), .A(n299), .S(\diff1[15] ), .Y(max[13]) );
  MUX2X1 U269 ( .B(C[13]), .A(D[13]), .S(\CcmpD[15] ), .Y(n299) );
  MUX2X1 U270 ( .B(A[13]), .A(n38), .S(\AcmpB[15] ), .Y(n23) );
  NAND2X1 U271 ( .A(n97), .B(n87), .Y(n38) );
  MUX2X1 U272 ( .B(B_opp_sign[13]), .A(reg_2_out[13]), .S(n213), .Y(n97) );
  MUX2X1 U273 ( .B(n22), .A(n300), .S(\diff1[15] ), .Y(max[12]) );
  MUX2X1 U274 ( .B(C[12]), .A(D[12]), .S(\CcmpD[15] ), .Y(n300) );
  MUX2X1 U275 ( .B(A[12]), .A(n37), .S(\AcmpB[15] ), .Y(n22) );
  NAND2X1 U276 ( .A(n98), .B(n87), .Y(n37) );
  MUX2X1 U277 ( .B(B_opp_sign[12]), .A(reg_2_out[12]), .S(n213), .Y(n98) );
  MUX2X1 U278 ( .B(n21), .A(n301), .S(\diff1[15] ), .Y(max[11]) );
  MUX2X1 U279 ( .B(C[11]), .A(D[11]), .S(\CcmpD[15] ), .Y(n301) );
  MUX2X1 U280 ( .B(A[11]), .A(n36), .S(\AcmpB[15] ), .Y(n21) );
  NAND2X1 U281 ( .A(n99), .B(n87), .Y(n36) );
  MUX2X1 U282 ( .B(B_opp_sign[11]), .A(reg_2_out[11]), .S(n213), .Y(n99) );
  MUX2X1 U283 ( .B(n20), .A(n302), .S(\diff1[15] ), .Y(max[10]) );
  MUX2X1 U284 ( .B(C[10]), .A(D[10]), .S(\CcmpD[15] ), .Y(n302) );
  MUX2X1 U285 ( .B(A[10]), .A(n35), .S(\AcmpB[15] ), .Y(n20) );
  NAND2X1 U286 ( .A(n100), .B(n87), .Y(n35) );
  MUX2X1 U287 ( .B(B_opp_sign[10]), .A(reg_2_out[10]), .S(n213), .Y(n100) );
  MUX2X1 U288 ( .B(n19), .A(n312), .S(\diff1[15] ), .Y(max[0]) );
  MUX2X1 U289 ( .B(C[0]), .A(D[0]), .S(\CcmpD[15] ), .Y(n312) );
  MUX2X1 U290 ( .B(A[0]), .A(n34), .S(\AcmpB[15] ), .Y(n19) );
  NAND2X1 U291 ( .A(n101), .B(n87), .Y(n34) );
  NAND2X1 U292 ( .A(B_opp_sign[15]), .B(reg_2_out[15]), .Y(n87) );
  MUX2X1 U293 ( .B(B_opp_sign[0]), .A(reg_2_out[0]), .S(n213), .Y(n101) );
  NAND2X1 U294 ( .A(n102), .B(n103), .Y(D[9]) );
  MUX2X1 U295 ( .B(D_opp_sign[9]), .A(reg_4_out[9]), .S(n260), .Y(n102) );
  NAND2X1 U296 ( .A(n104), .B(n103), .Y(D[8]) );
  MUX2X1 U297 ( .B(D_opp_sign[8]), .A(reg_4_out[8]), .S(n260), .Y(n104) );
  NAND2X1 U298 ( .A(n105), .B(n103), .Y(D[7]) );
  MUX2X1 U299 ( .B(D_opp_sign[7]), .A(reg_4_out[7]), .S(n260), .Y(n105) );
  NAND2X1 U300 ( .A(n106), .B(n103), .Y(D[6]) );
  MUX2X1 U301 ( .B(D_opp_sign[6]), .A(reg_4_out[6]), .S(n260), .Y(n106) );
  NAND2X1 U302 ( .A(n107), .B(n103), .Y(D[5]) );
  MUX2X1 U303 ( .B(D_opp_sign[5]), .A(reg_4_out[5]), .S(n260), .Y(n107) );
  NAND2X1 U304 ( .A(n108), .B(n103), .Y(D[4]) );
  MUX2X1 U305 ( .B(D_opp_sign[4]), .A(reg_4_out[4]), .S(n260), .Y(n108) );
  NAND2X1 U306 ( .A(n109), .B(n103), .Y(D[3]) );
  MUX2X1 U307 ( .B(D_opp_sign[3]), .A(reg_4_out[3]), .S(n260), .Y(n109) );
  NAND2X1 U308 ( .A(n110), .B(n103), .Y(D[2]) );
  MUX2X1 U309 ( .B(D_opp_sign[2]), .A(reg_4_out[2]), .S(n260), .Y(n110) );
  NAND2X1 U310 ( .A(n111), .B(n103), .Y(D[1]) );
  MUX2X1 U311 ( .B(D_opp_sign[1]), .A(reg_4_out[1]), .S(n260), .Y(n111) );
  NAND2X1 U312 ( .A(n112), .B(n103), .Y(D[14]) );
  MUX2X1 U313 ( .B(D_opp_sign[14]), .A(reg_4_out[14]), .S(n260), .Y(n112) );
  NAND2X1 U314 ( .A(n113), .B(n103), .Y(D[13]) );
  MUX2X1 U315 ( .B(D_opp_sign[13]), .A(reg_4_out[13]), .S(n260), .Y(n113) );
  NAND2X1 U316 ( .A(n114), .B(n103), .Y(D[12]) );
  MUX2X1 U317 ( .B(D_opp_sign[12]), .A(reg_4_out[12]), .S(n260), .Y(n114) );
  NAND2X1 U318 ( .A(n115), .B(n103), .Y(D[11]) );
  MUX2X1 U319 ( .B(D_opp_sign[11]), .A(reg_4_out[11]), .S(n260), .Y(n115) );
  NAND2X1 U320 ( .A(n116), .B(n103), .Y(D[10]) );
  MUX2X1 U321 ( .B(D_opp_sign[10]), .A(reg_4_out[10]), .S(n260), .Y(n116) );
  NAND2X1 U322 ( .A(n117), .B(n103), .Y(D[0]) );
  NAND2X1 U323 ( .A(D_opp_sign[15]), .B(reg_4_out[15]), .Y(n103) );
  MUX2X1 U324 ( .B(D_opp_sign[0]), .A(reg_4_out[0]), .S(n260), .Y(n117) );
  NAND2X1 U325 ( .A(n118), .B(n119), .Y(C[9]) );
  MUX2X1 U326 ( .B(C_opp_sign[9]), .A(reg_3_out[9]), .S(n229), .Y(n118) );
  NAND2X1 U327 ( .A(n120), .B(n119), .Y(C[8]) );
  MUX2X1 U328 ( .B(C_opp_sign[8]), .A(reg_3_out[8]), .S(n229), .Y(n120) );
  NAND2X1 U329 ( .A(n121), .B(n119), .Y(C[7]) );
  MUX2X1 U330 ( .B(C_opp_sign[7]), .A(reg_3_out[7]), .S(n229), .Y(n121) );
  NAND2X1 U331 ( .A(n122), .B(n119), .Y(C[6]) );
  MUX2X1 U332 ( .B(C_opp_sign[6]), .A(reg_3_out[6]), .S(n229), .Y(n122) );
  NAND2X1 U333 ( .A(n123), .B(n119), .Y(C[5]) );
  MUX2X1 U334 ( .B(C_opp_sign[5]), .A(reg_3_out[5]), .S(n229), .Y(n123) );
  NAND2X1 U335 ( .A(n124), .B(n119), .Y(C[4]) );
  MUX2X1 U336 ( .B(C_opp_sign[4]), .A(reg_3_out[4]), .S(n229), .Y(n124) );
  NAND2X1 U337 ( .A(n125), .B(n119), .Y(C[3]) );
  MUX2X1 U338 ( .B(C_opp_sign[3]), .A(reg_3_out[3]), .S(n229), .Y(n125) );
  NAND2X1 U339 ( .A(n126), .B(n119), .Y(C[2]) );
  MUX2X1 U340 ( .B(C_opp_sign[2]), .A(reg_3_out[2]), .S(n229), .Y(n126) );
  NAND2X1 U341 ( .A(n127), .B(n119), .Y(C[1]) );
  MUX2X1 U342 ( .B(C_opp_sign[1]), .A(reg_3_out[1]), .S(n229), .Y(n127) );
  NAND2X1 U343 ( .A(n128), .B(n119), .Y(C[14]) );
  MUX2X1 U344 ( .B(C_opp_sign[14]), .A(reg_3_out[14]), .S(n229), .Y(n128) );
  NAND2X1 U345 ( .A(n129), .B(n119), .Y(C[13]) );
  MUX2X1 U346 ( .B(C_opp_sign[13]), .A(reg_3_out[13]), .S(n229), .Y(n129) );
  NAND2X1 U347 ( .A(n130), .B(n119), .Y(C[12]) );
  MUX2X1 U348 ( .B(C_opp_sign[12]), .A(reg_3_out[12]), .S(n229), .Y(n130) );
  NAND2X1 U349 ( .A(n131), .B(n119), .Y(C[11]) );
  MUX2X1 U350 ( .B(C_opp_sign[11]), .A(reg_3_out[11]), .S(n229), .Y(n131) );
  NAND2X1 U351 ( .A(n132), .B(n119), .Y(C[10]) );
  MUX2X1 U352 ( .B(C_opp_sign[10]), .A(reg_3_out[10]), .S(n229), .Y(n132) );
  NAND2X1 U353 ( .A(n133), .B(n119), .Y(C[0]) );
  NAND2X1 U354 ( .A(C_opp_sign[15]), .B(reg_3_out[15]), .Y(n119) );
  MUX2X1 U355 ( .B(C_opp_sign[0]), .A(reg_3_out[0]), .S(n229), .Y(n133) );
  NAND2X1 U356 ( .A(n134), .B(n135), .Y(A[9]) );
  MUX2X1 U357 ( .B(A_opp_sign[9]), .A(reg_1_out[9]), .S(n276), .Y(n134) );
  NAND2X1 U359 ( .A(n136), .B(n135), .Y(A[8]) );
  MUX2X1 U360 ( .B(A_opp_sign[8]), .A(reg_1_out[8]), .S(n276), .Y(n136) );
  NAND2X1 U361 ( .A(n137), .B(n135), .Y(A[7]) );
  MUX2X1 U362 ( .B(A_opp_sign[7]), .A(reg_1_out[7]), .S(n276), .Y(n137) );
  NAND2X1 U363 ( .A(n138), .B(n135), .Y(A[6]) );
  MUX2X1 U364 ( .B(A_opp_sign[6]), .A(reg_1_out[6]), .S(n276), .Y(n138) );
  NAND2X1 U365 ( .A(n139), .B(n135), .Y(A[5]) );
  MUX2X1 U366 ( .B(A_opp_sign[5]), .A(reg_1_out[5]), .S(n276), .Y(n139) );
  NAND2X1 U367 ( .A(n140), .B(n135), .Y(A[4]) );
  MUX2X1 U368 ( .B(A_opp_sign[4]), .A(reg_1_out[4]), .S(n276), .Y(n140) );
  NAND2X1 U369 ( .A(n141), .B(n135), .Y(A[3]) );
  MUX2X1 U370 ( .B(A_opp_sign[3]), .A(reg_1_out[3]), .S(n276), .Y(n141) );
  NAND2X1 U371 ( .A(n142), .B(n135), .Y(A[2]) );
  MUX2X1 U372 ( .B(A_opp_sign[2]), .A(reg_1_out[2]), .S(n276), .Y(n142) );
  NAND2X1 U373 ( .A(n143), .B(n135), .Y(A[1]) );
  MUX2X1 U374 ( .B(A_opp_sign[1]), .A(reg_1_out[1]), .S(n276), .Y(n143) );
  NAND2X1 U375 ( .A(n144), .B(n135), .Y(A[14]) );
  MUX2X1 U376 ( .B(A_opp_sign[14]), .A(reg_1_out[14]), .S(n276), .Y(n144) );
  NAND2X1 U377 ( .A(n145), .B(n135), .Y(A[13]) );
  MUX2X1 U378 ( .B(A_opp_sign[13]), .A(reg_1_out[13]), .S(n276), .Y(n145) );
  NAND2X1 U379 ( .A(n146), .B(n135), .Y(A[12]) );
  MUX2X1 U380 ( .B(A_opp_sign[12]), .A(reg_1_out[12]), .S(n276), .Y(n146) );
  NAND2X1 U381 ( .A(n147), .B(n135), .Y(A[11]) );
  MUX2X1 U382 ( .B(A_opp_sign[11]), .A(reg_1_out[11]), .S(n276), .Y(n147) );
  NAND2X1 U383 ( .A(n148), .B(n135), .Y(A[10]) );
  MUX2X1 U384 ( .B(A_opp_sign[10]), .A(reg_1_out[10]), .S(n276), .Y(n148) );
  NAND2X1 U385 ( .A(n149), .B(n135), .Y(A[0]) );
  NAND2X1 U386 ( .A(A_opp_sign[15]), .B(reg_1_out[15]), .Y(n135) );
  MUX2X1 U387 ( .B(A_opp_sign[0]), .A(reg_1_out[0]), .S(n276), .Y(n149) );
endmodule


module flex_buffer_NUM_BITS16_3 ( clk, n_rst, input_data, output_data );
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


module flex_buffer_NUM_BITS16_0 ( clk, n_rst, input_data, output_data );
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


module cla_4bit_153 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_152 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_151 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_150 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_16bit_37 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, cout, n8, n9, n10;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  cla_4bit_153 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_152 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n10), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_151 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n9), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_150 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n8), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  NOR2X1 U1 ( .A(n1), .B(n2), .Y(pg) );
  NAND2X1 U2 ( .A(p[3]), .B(p[2]), .Y(n2) );
  NAND2X1 U3 ( .A(p[1]), .B(p[0]), .Y(n1) );
  INVX1 U4 ( .A(n3), .Y(cout) );
  AOI21X1 U5 ( .A(n8), .B(p[3]), .C(g[3]), .Y(n3) );
  INVX1 U6 ( .A(n4), .Y(n8) );
  AOI21X1 U7 ( .A(n9), .B(p[2]), .C(g[2]), .Y(n4) );
  INVX1 U8 ( .A(n5), .Y(n9) );
  AOI21X1 U9 ( .A(n10), .B(p[1]), .C(g[1]), .Y(n5) );
  INVX1 U10 ( .A(n6), .Y(n10) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n6) );
endmodule


module cla_4bit_149 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_148 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_147 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_146 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_16bit_36 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, cout, n8, n9, n10;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  cla_4bit_149 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_148 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n10), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_147 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n9), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_146 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n8), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  NOR2X1 U1 ( .A(n1), .B(n2), .Y(pg) );
  NAND2X1 U2 ( .A(p[3]), .B(p[2]), .Y(n2) );
  NAND2X1 U3 ( .A(p[1]), .B(p[0]), .Y(n1) );
  INVX1 U4 ( .A(n3), .Y(cout) );
  AOI21X1 U5 ( .A(n8), .B(p[3]), .C(g[3]), .Y(n3) );
  INVX1 U6 ( .A(n4), .Y(n8) );
  AOI21X1 U7 ( .A(n9), .B(p[2]), .C(g[2]), .Y(n4) );
  INVX1 U8 ( .A(n5), .Y(n9) );
  AOI21X1 U9 ( .A(n10), .B(p[1]), .C(g[1]), .Y(n5) );
  INVX1 U10 ( .A(n6), .Y(n10) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n6) );
endmodule


module cla_4bit_145 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_144 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_143 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_142 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_16bit_35 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, cout, n8, n9, n10;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  cla_4bit_145 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_144 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n10), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_143 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n9), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_142 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n8), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  NOR2X1 U1 ( .A(n1), .B(n2), .Y(pg) );
  NAND2X1 U2 ( .A(p[3]), .B(p[2]), .Y(n2) );
  NAND2X1 U3 ( .A(p[1]), .B(p[0]), .Y(n1) );
  INVX1 U4 ( .A(n3), .Y(cout) );
  AOI21X1 U5 ( .A(n8), .B(p[3]), .C(g[3]), .Y(n3) );
  INVX1 U6 ( .A(n4), .Y(n8) );
  AOI21X1 U7 ( .A(n9), .B(p[2]), .C(g[2]), .Y(n4) );
  INVX1 U8 ( .A(n5), .Y(n9) );
  AOI21X1 U9 ( .A(n10), .B(p[1]), .C(g[1]), .Y(n5) );
  INVX1 U10 ( .A(n6), .Y(n10) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n6) );
endmodule


module cla_4bit_141 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_140 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_139 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_138 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_16bit_34 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, cout, n8, n9, n10;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  cla_4bit_141 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_140 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n10), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_139 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n9), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_138 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n8), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  NOR2X1 U1 ( .A(n1), .B(n2), .Y(pg) );
  NAND2X1 U2 ( .A(p[3]), .B(p[2]), .Y(n2) );
  NAND2X1 U3 ( .A(p[1]), .B(p[0]), .Y(n1) );
  INVX1 U4 ( .A(n3), .Y(cout) );
  AOI21X1 U5 ( .A(n8), .B(p[3]), .C(g[3]), .Y(n3) );
  INVX1 U6 ( .A(n4), .Y(n8) );
  AOI21X1 U7 ( .A(n9), .B(p[2]), .C(g[2]), .Y(n4) );
  INVX1 U8 ( .A(n5), .Y(n9) );
  AOI21X1 U9 ( .A(n10), .B(p[1]), .C(g[1]), .Y(n5) );
  INVX1 U10 ( .A(n6), .Y(n10) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n6) );
endmodule


module cla_4bit_137 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_136 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_135 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_134 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n35, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34;

  BUFX2 U1 ( .A(n35), .Y(sum[3]) );
  MUX2X1 U2 ( .B(n2), .A(n3), .S(n4), .Y(n35) );
  XNOR2X1 U3 ( .A(a[3]), .B(b[3]), .Y(n3) );
  NOR2X1 U4 ( .A(n5), .B(n6), .Y(n2) );
  INVX1 U5 ( .A(n7), .Y(n5) );
  MUX2X1 U6 ( .B(n8), .A(n9), .S(n10), .Y(sum[2]) );
  NOR2X1 U7 ( .A(n11), .B(n12), .Y(n9) );
  XNOR2X1 U8 ( .A(a[2]), .B(b[2]), .Y(n8) );
  OAI21X1 U9 ( .A(n13), .B(n14), .C(n15), .Y(sum[1]) );
  MUX2X1 U10 ( .B(n16), .A(n17), .S(b[1]), .Y(n15) );
  XOR2X1 U11 ( .A(a[1]), .B(n13), .Y(n17) );
  NOR2X1 U12 ( .A(n18), .B(n19), .Y(n16) );
  INVX1 U13 ( .A(n19), .Y(n13) );
  NAND2X1 U14 ( .A(n20), .B(n21), .Y(n19) );
  MUX2X1 U15 ( .B(n22), .A(n23), .S(cin), .Y(sum[0]) );
  AND2X1 U16 ( .A(n24), .B(n21), .Y(n23) );
  XNOR2X1 U17 ( .A(a[0]), .B(b[0]), .Y(n22) );
  NOR2X1 U18 ( .A(n25), .B(n26), .Y(pg) );
  OR2X1 U19 ( .A(n6), .B(n12), .Y(n26) );
  NAND2X1 U20 ( .A(n24), .B(n14), .Y(n25) );
  OAI21X1 U21 ( .A(n6), .B(n27), .C(n7), .Y(gg) );
  INVX1 U22 ( .A(n28), .Y(n27) );
  OAI21X1 U23 ( .A(n29), .B(n12), .C(n30), .Y(n28) );
  OAI21X1 U24 ( .A(n4), .B(n6), .C(n7), .Y(cout) );
  NAND2X1 U25 ( .A(a[3]), .B(b[3]), .Y(n7) );
  NOR2X1 U26 ( .A(b[3]), .B(a[3]), .Y(n6) );
  AOI21X1 U27 ( .A(n10), .B(n31), .C(n11), .Y(n4) );
  INVX1 U28 ( .A(n30), .Y(n11) );
  NAND2X1 U29 ( .A(b[2]), .B(a[2]), .Y(n30) );
  INVX1 U30 ( .A(n12), .Y(n31) );
  NOR2X1 U31 ( .A(b[2]), .B(a[2]), .Y(n12) );
  OAI21X1 U32 ( .A(n32), .B(n20), .C(n29), .Y(n10) );
  NAND2X1 U33 ( .A(n14), .B(n33), .Y(n29) );
  OAI21X1 U34 ( .A(n18), .B(n34), .C(n21), .Y(n33) );
  NAND2X1 U35 ( .A(b[0]), .B(a[0]), .Y(n21) );
  NAND2X1 U36 ( .A(cin), .B(n24), .Y(n20) );
  OR2X1 U37 ( .A(a[0]), .B(b[0]), .Y(n24) );
  INVX1 U38 ( .A(n14), .Y(n32) );
  NAND2X1 U39 ( .A(n18), .B(n34), .Y(n14) );
  INVX1 U40 ( .A(b[1]), .Y(n34) );
  INVX1 U41 ( .A(a[1]), .Y(n18) );
endmodule


module cla_16bit_33 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, cout, n8, n9, n10;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  cla_4bit_137 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_136 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n10), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_135 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n9), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_134 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n8), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  NOR2X1 U1 ( .A(n1), .B(n2), .Y(pg) );
  NAND2X1 U2 ( .A(p[3]), .B(p[2]), .Y(n2) );
  NAND2X1 U3 ( .A(p[1]), .B(p[0]), .Y(n1) );
  INVX1 U4 ( .A(n3), .Y(cout) );
  AOI21X1 U5 ( .A(n8), .B(p[3]), .C(g[3]), .Y(n3) );
  INVX1 U6 ( .A(n4), .Y(n8) );
  AOI21X1 U7 ( .A(n9), .B(p[2]), .C(g[2]), .Y(n4) );
  INVX1 U8 ( .A(n5), .Y(n9) );
  AOI21X1 U9 ( .A(n10), .B(p[1]), .C(g[1]), .Y(n5) );
  INVX1 U10 ( .A(n6), .Y(n10) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n6) );
endmodule


module cla_4bit_133 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_132 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_131 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_130 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n35, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34;

  BUFX2 U1 ( .A(n35), .Y(sum[3]) );
  MUX2X1 U2 ( .B(n2), .A(n3), .S(n4), .Y(n35) );
  XNOR2X1 U3 ( .A(a[3]), .B(b[3]), .Y(n3) );
  NOR2X1 U4 ( .A(n5), .B(n6), .Y(n2) );
  INVX1 U5 ( .A(n7), .Y(n5) );
  MUX2X1 U6 ( .B(n8), .A(n9), .S(n10), .Y(sum[2]) );
  NOR2X1 U7 ( .A(n11), .B(n12), .Y(n9) );
  XNOR2X1 U8 ( .A(a[2]), .B(b[2]), .Y(n8) );
  OAI21X1 U9 ( .A(n13), .B(n14), .C(n15), .Y(sum[1]) );
  MUX2X1 U10 ( .B(n16), .A(n17), .S(b[1]), .Y(n15) );
  XOR2X1 U11 ( .A(a[1]), .B(n13), .Y(n17) );
  NOR2X1 U12 ( .A(n18), .B(n19), .Y(n16) );
  INVX1 U13 ( .A(n19), .Y(n13) );
  NAND2X1 U14 ( .A(n20), .B(n21), .Y(n19) );
  MUX2X1 U15 ( .B(n22), .A(n23), .S(cin), .Y(sum[0]) );
  AND2X1 U16 ( .A(n24), .B(n21), .Y(n23) );
  XNOR2X1 U17 ( .A(a[0]), .B(b[0]), .Y(n22) );
  NOR2X1 U18 ( .A(n25), .B(n26), .Y(pg) );
  OR2X1 U19 ( .A(n6), .B(n12), .Y(n26) );
  NAND2X1 U20 ( .A(n24), .B(n14), .Y(n25) );
  OAI21X1 U21 ( .A(n6), .B(n27), .C(n7), .Y(gg) );
  INVX1 U22 ( .A(n28), .Y(n27) );
  OAI21X1 U23 ( .A(n29), .B(n12), .C(n30), .Y(n28) );
  OAI21X1 U24 ( .A(n4), .B(n6), .C(n7), .Y(cout) );
  NAND2X1 U25 ( .A(a[3]), .B(b[3]), .Y(n7) );
  NOR2X1 U26 ( .A(b[3]), .B(a[3]), .Y(n6) );
  AOI21X1 U27 ( .A(n10), .B(n31), .C(n11), .Y(n4) );
  INVX1 U28 ( .A(n30), .Y(n11) );
  NAND2X1 U29 ( .A(b[2]), .B(a[2]), .Y(n30) );
  INVX1 U30 ( .A(n12), .Y(n31) );
  NOR2X1 U31 ( .A(b[2]), .B(a[2]), .Y(n12) );
  OAI21X1 U32 ( .A(n32), .B(n20), .C(n29), .Y(n10) );
  NAND2X1 U33 ( .A(n14), .B(n33), .Y(n29) );
  OAI21X1 U34 ( .A(n18), .B(n34), .C(n21), .Y(n33) );
  NAND2X1 U35 ( .A(b[0]), .B(a[0]), .Y(n21) );
  NAND2X1 U36 ( .A(cin), .B(n24), .Y(n20) );
  OR2X1 U37 ( .A(a[0]), .B(b[0]), .Y(n24) );
  INVX1 U38 ( .A(n14), .Y(n32) );
  NAND2X1 U39 ( .A(n18), .B(n34), .Y(n14) );
  INVX1 U40 ( .A(b[1]), .Y(n34) );
  INVX1 U41 ( .A(a[1]), .Y(n18) );
endmodule


module cla_16bit_32 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, cout, n8, n9, n10;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  cla_4bit_133 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_132 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n10), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_131 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n9), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_130 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n8), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  NOR2X1 U1 ( .A(n1), .B(n2), .Y(pg) );
  NAND2X1 U2 ( .A(p[3]), .B(p[2]), .Y(n2) );
  NAND2X1 U3 ( .A(p[1]), .B(p[0]), .Y(n1) );
  INVX1 U4 ( .A(n3), .Y(cout) );
  AOI21X1 U5 ( .A(n8), .B(p[3]), .C(g[3]), .Y(n3) );
  INVX1 U6 ( .A(n4), .Y(n8) );
  AOI21X1 U7 ( .A(n9), .B(p[2]), .C(g[2]), .Y(n4) );
  INVX1 U8 ( .A(n5), .Y(n9) );
  AOI21X1 U9 ( .A(n10), .B(p[1]), .C(g[1]), .Y(n5) );
  INVX1 U10 ( .A(n6), .Y(n10) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n6) );
endmodule


module cla_4bit_129 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_128 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_127 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_126 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n35, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34;

  BUFX2 U1 ( .A(n35), .Y(sum[3]) );
  MUX2X1 U2 ( .B(n2), .A(n3), .S(n4), .Y(n35) );
  XNOR2X1 U3 ( .A(a[3]), .B(b[3]), .Y(n3) );
  NOR2X1 U4 ( .A(n5), .B(n6), .Y(n2) );
  INVX1 U5 ( .A(n7), .Y(n5) );
  MUX2X1 U6 ( .B(n8), .A(n9), .S(n10), .Y(sum[2]) );
  NOR2X1 U7 ( .A(n11), .B(n12), .Y(n9) );
  XNOR2X1 U8 ( .A(a[2]), .B(b[2]), .Y(n8) );
  OAI21X1 U9 ( .A(n13), .B(n14), .C(n15), .Y(sum[1]) );
  MUX2X1 U10 ( .B(n16), .A(n17), .S(b[1]), .Y(n15) );
  XOR2X1 U11 ( .A(a[1]), .B(n13), .Y(n17) );
  NOR2X1 U12 ( .A(n18), .B(n19), .Y(n16) );
  INVX1 U13 ( .A(n19), .Y(n13) );
  NAND2X1 U14 ( .A(n20), .B(n21), .Y(n19) );
  MUX2X1 U15 ( .B(n22), .A(n23), .S(cin), .Y(sum[0]) );
  AND2X1 U16 ( .A(n24), .B(n21), .Y(n23) );
  XNOR2X1 U17 ( .A(a[0]), .B(b[0]), .Y(n22) );
  NOR2X1 U18 ( .A(n25), .B(n26), .Y(pg) );
  OR2X1 U19 ( .A(n6), .B(n12), .Y(n26) );
  NAND2X1 U20 ( .A(n24), .B(n14), .Y(n25) );
  OAI21X1 U21 ( .A(n6), .B(n27), .C(n7), .Y(gg) );
  INVX1 U22 ( .A(n28), .Y(n27) );
  OAI21X1 U23 ( .A(n29), .B(n12), .C(n30), .Y(n28) );
  OAI21X1 U24 ( .A(n4), .B(n6), .C(n7), .Y(cout) );
  NAND2X1 U25 ( .A(a[3]), .B(b[3]), .Y(n7) );
  NOR2X1 U26 ( .A(b[3]), .B(a[3]), .Y(n6) );
  AOI21X1 U27 ( .A(n10), .B(n31), .C(n11), .Y(n4) );
  INVX1 U28 ( .A(n30), .Y(n11) );
  NAND2X1 U29 ( .A(b[2]), .B(a[2]), .Y(n30) );
  INVX1 U30 ( .A(n12), .Y(n31) );
  NOR2X1 U31 ( .A(b[2]), .B(a[2]), .Y(n12) );
  OAI21X1 U32 ( .A(n32), .B(n20), .C(n29), .Y(n10) );
  NAND2X1 U33 ( .A(n14), .B(n33), .Y(n29) );
  OAI21X1 U34 ( .A(n18), .B(n34), .C(n21), .Y(n33) );
  NAND2X1 U35 ( .A(b[0]), .B(a[0]), .Y(n21) );
  NAND2X1 U36 ( .A(cin), .B(n24), .Y(n20) );
  OR2X1 U37 ( .A(a[0]), .B(b[0]), .Y(n24) );
  INVX1 U38 ( .A(n14), .Y(n32) );
  NAND2X1 U39 ( .A(n18), .B(n34), .Y(n14) );
  INVX1 U40 ( .A(b[1]), .Y(n34) );
  INVX1 U41 ( .A(a[1]), .Y(n18) );
endmodule


module cla_16bit_31 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, cout, n8, n9, n10;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  cla_4bit_129 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_128 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n10), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_127 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n9), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_126 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n8), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  NOR2X1 U1 ( .A(n1), .B(n2), .Y(pg) );
  NAND2X1 U2 ( .A(p[3]), .B(p[2]), .Y(n2) );
  NAND2X1 U3 ( .A(p[1]), .B(p[0]), .Y(n1) );
  INVX1 U4 ( .A(n3), .Y(cout) );
  AOI21X1 U5 ( .A(n8), .B(p[3]), .C(g[3]), .Y(n3) );
  INVX1 U6 ( .A(n4), .Y(n8) );
  AOI21X1 U7 ( .A(n9), .B(p[2]), .C(g[2]), .Y(n4) );
  INVX1 U8 ( .A(n5), .Y(n9) );
  AOI21X1 U9 ( .A(n10), .B(p[1]), .C(g[1]), .Y(n5) );
  INVX1 U10 ( .A(n6), .Y(n10) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n6) );
endmodule


module cla_4bit_125 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_124 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_123 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_122 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_16bit_30 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, cout, n8, n9, n10;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  cla_4bit_125 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_124 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n10), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_123 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n9), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_122 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n8), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  NOR2X1 U1 ( .A(n1), .B(n2), .Y(pg) );
  NAND2X1 U2 ( .A(p[3]), .B(p[2]), .Y(n2) );
  NAND2X1 U3 ( .A(p[1]), .B(p[0]), .Y(n1) );
  INVX1 U4 ( .A(n3), .Y(cout) );
  AOI21X1 U5 ( .A(n8), .B(p[3]), .C(g[3]), .Y(n3) );
  INVX1 U6 ( .A(n4), .Y(n8) );
  AOI21X1 U7 ( .A(n9), .B(p[2]), .C(g[2]), .Y(n4) );
  INVX1 U8 ( .A(n5), .Y(n9) );
  AOI21X1 U9 ( .A(n10), .B(p[1]), .C(g[1]), .Y(n5) );
  INVX1 U10 ( .A(n6), .Y(n10) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n6) );
endmodule


module cla_4bit_51 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_50 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_49 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_48 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_16bit_12 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, cout, n8, n9, n10;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  cla_4bit_51 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_50 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n10), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_49 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n9), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_48 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n8), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  NOR2X1 U1 ( .A(n1), .B(n2), .Y(pg) );
  NAND2X1 U2 ( .A(p[3]), .B(p[2]), .Y(n2) );
  NAND2X1 U3 ( .A(p[1]), .B(p[0]), .Y(n1) );
  INVX1 U4 ( .A(n3), .Y(cout) );
  AOI21X1 U5 ( .A(n8), .B(p[3]), .C(g[3]), .Y(n3) );
  INVX1 U6 ( .A(n4), .Y(n8) );
  AOI21X1 U7 ( .A(n9), .B(p[2]), .C(g[2]), .Y(n4) );
  INVX1 U8 ( .A(n5), .Y(n9) );
  AOI21X1 U9 ( .A(n10), .B(p[1]), .C(g[1]), .Y(n5) );
  INVX1 U10 ( .A(n6), .Y(n10) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n6) );
endmodule


module adder_1bit_17 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2;

  XOR2X1 U1 ( .A(carry_in), .B(n1), .Y(sum) );
  INVX1 U2 ( .A(n2), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n1), .D(carry_in), .Y(n2) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n1) );
endmodule


module cla_4bit_47 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_46 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_45 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_44 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_16bit_11 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, cout, n8, n9, n10;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  cla_4bit_47 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_46 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n10), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_45 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n9), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_44 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n8), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  NOR2X1 U1 ( .A(n1), .B(n2), .Y(pg) );
  NAND2X1 U2 ( .A(p[3]), .B(p[2]), .Y(n2) );
  NAND2X1 U3 ( .A(p[1]), .B(p[0]), .Y(n1) );
  INVX1 U4 ( .A(n3), .Y(cout) );
  AOI21X1 U5 ( .A(n8), .B(p[3]), .C(g[3]), .Y(n3) );
  INVX1 U6 ( .A(n4), .Y(n8) );
  AOI21X1 U7 ( .A(n9), .B(p[2]), .C(g[2]), .Y(n4) );
  INVX1 U8 ( .A(n5), .Y(n9) );
  AOI21X1 U9 ( .A(n10), .B(p[1]), .C(g[1]), .Y(n5) );
  INVX1 U10 ( .A(n6), .Y(n10) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n6) );
endmodule


module adder_1bit_16 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2;

  XOR2X1 U1 ( .A(carry_in), .B(n1), .Y(sum) );
  INVX1 U2 ( .A(n2), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n1), .D(carry_in), .Y(n2) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n1) );
endmodule


module adder_1bit_15 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2;

  XOR2X1 U1 ( .A(carry_in), .B(n1), .Y(sum) );
  INVX1 U2 ( .A(n2), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n1), .D(carry_in), .Y(n2) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n1) );
endmodule


module cla_4bit_43 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_42 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_41 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_40 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_16bit_10 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, cout, n8, n9, n10;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  cla_4bit_43 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_42 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n10), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_41 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n9), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_40 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n8), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  NOR2X1 U1 ( .A(n1), .B(n2), .Y(pg) );
  NAND2X1 U2 ( .A(p[3]), .B(p[2]), .Y(n2) );
  NAND2X1 U3 ( .A(p[1]), .B(p[0]), .Y(n1) );
  INVX1 U4 ( .A(n3), .Y(cout) );
  AOI21X1 U5 ( .A(n8), .B(p[3]), .C(g[3]), .Y(n3) );
  INVX1 U6 ( .A(n4), .Y(n8) );
  AOI21X1 U7 ( .A(n9), .B(p[2]), .C(g[2]), .Y(n4) );
  INVX1 U8 ( .A(n5), .Y(n9) );
  AOI21X1 U9 ( .A(n10), .B(p[1]), .C(g[1]), .Y(n5) );
  INVX1 U10 ( .A(n6), .Y(n10) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n6) );
endmodule


module adder_1bit_14 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2;

  XOR2X1 U1 ( .A(carry_in), .B(n1), .Y(sum) );
  INVX1 U2 ( .A(n2), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n1), .D(carry_in), .Y(n2) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n1) );
endmodule


module adder_1bit_13 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2;

  XOR2X1 U1 ( .A(carry_in), .B(n1), .Y(sum) );
  INVX1 U2 ( .A(n2), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n1), .D(carry_in), .Y(n2) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n1) );
endmodule


module adder_1bit_12 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2;

  XOR2X1 U1 ( .A(carry_in), .B(n1), .Y(sum) );
  INVX1 U2 ( .A(n2), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n1), .D(carry_in), .Y(n2) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n1) );
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
  INVX2 U2 ( .A(b[1]), .Y(n19) );
  INVX2 U3 ( .A(b[2]), .Y(n18) );
  INVX2 U4 ( .A(b[3]), .Y(n2) );
  INVX2 U5 ( .A(b[0]), .Y(n20) );
  NOR2X1 U6 ( .A(n1), .B(n2), .Y(ab3[9]) );
  NOR2X1 U7 ( .A(n2), .B(n3), .Y(ab3[8]) );
  NOR2X1 U8 ( .A(n2), .B(n4), .Y(ab3[7]) );
  NOR2X1 U9 ( .A(n2), .B(n5), .Y(ab3[6]) );
  NOR2X1 U10 ( .A(n2), .B(n6), .Y(ab3[5]) );
  NOR2X1 U11 ( .A(n2), .B(n7), .Y(ab3[4]) );
  NOR2X1 U12 ( .A(n2), .B(n8), .Y(ab3[3]) );
  NOR2X1 U13 ( .A(n2), .B(n9), .Y(ab3[18]) );
  NOR2X1 U14 ( .A(n2), .B(n10), .Y(ab3[17]) );
  NOR2X1 U15 ( .A(n2), .B(n11), .Y(ab3[16]) );
  NOR2X1 U16 ( .A(n2), .B(n12), .Y(ab3[15]) );
  NOR2X1 U17 ( .A(n2), .B(n13), .Y(ab3[14]) );
  NOR2X1 U18 ( .A(n2), .B(n14), .Y(ab3[13]) );
  NOR2X1 U19 ( .A(n2), .B(n15), .Y(ab3[12]) );
  NOR2X1 U20 ( .A(n2), .B(n16), .Y(ab3[11]) );
  NOR2X1 U21 ( .A(n2), .B(n17), .Y(ab3[10]) );
  NOR2X1 U22 ( .A(n17), .B(n18), .Y(ab2[9]) );
  NOR2X1 U23 ( .A(n1), .B(n18), .Y(ab2[8]) );
  NOR2X1 U24 ( .A(n3), .B(n18), .Y(ab2[7]) );
  NOR2X1 U25 ( .A(n4), .B(n18), .Y(ab2[6]) );
  NOR2X1 U26 ( .A(n5), .B(n18), .Y(ab2[5]) );
  NOR2X1 U27 ( .A(n6), .B(n18), .Y(ab2[4]) );
  NOR2X1 U28 ( .A(n7), .B(n18), .Y(ab2[3]) );
  NOR2X1 U29 ( .A(n8), .B(n18), .Y(ab2[2]) );
  NOR2X1 U30 ( .A(n9), .B(n18), .Y(ab2[17]) );
  NOR2X1 U31 ( .A(n10), .B(n18), .Y(ab2[16]) );
  NOR2X1 U32 ( .A(n11), .B(n18), .Y(ab2[15]) );
  NOR2X1 U33 ( .A(n12), .B(n18), .Y(ab2[14]) );
  NOR2X1 U34 ( .A(n13), .B(n18), .Y(ab2[13]) );
  NOR2X1 U35 ( .A(n14), .B(n18), .Y(ab2[12]) );
  NOR2X1 U36 ( .A(n15), .B(n18), .Y(ab2[11]) );
  NOR2X1 U37 ( .A(n16), .B(n18), .Y(ab2[10]) );
  NOR2X1 U38 ( .A(n16), .B(n19), .Y(ab1[9]) );
  NOR2X1 U39 ( .A(n17), .B(n19), .Y(ab1[8]) );
  NOR2X1 U40 ( .A(n1), .B(n19), .Y(ab1[7]) );
  NOR2X1 U41 ( .A(n3), .B(n19), .Y(ab1[6]) );
  NOR2X1 U42 ( .A(n4), .B(n19), .Y(ab1[5]) );
  NOR2X1 U43 ( .A(n5), .B(n19), .Y(ab1[4]) );
  NOR2X1 U44 ( .A(n6), .B(n19), .Y(ab1[3]) );
  NOR2X1 U45 ( .A(n7), .B(n19), .Y(ab1[2]) );
  NOR2X1 U46 ( .A(n8), .B(n19), .Y(ab1[1]) );
  NOR2X1 U47 ( .A(n10), .B(n19), .Y(ab1[15]) );
  NOR2X1 U48 ( .A(n11), .B(n19), .Y(ab1[14]) );
  NOR2X1 U49 ( .A(n12), .B(n19), .Y(ab1[13]) );
  NOR2X1 U50 ( .A(n13), .B(n19), .Y(ab1[12]) );
  NOR2X1 U51 ( .A(n14), .B(n19), .Y(ab1[11]) );
  NOR2X1 U52 ( .A(n15), .B(n19), .Y(ab1[10]) );
  NOR2X1 U53 ( .A(n15), .B(n20), .Y(ab0[9]) );
  INVX1 U54 ( .A(a[9]), .Y(n15) );
  NOR2X1 U55 ( .A(n16), .B(n20), .Y(ab0[8]) );
  INVX1 U56 ( .A(a[8]), .Y(n16) );
  NOR2X1 U57 ( .A(n17), .B(n20), .Y(ab0[7]) );
  INVX1 U58 ( .A(a[7]), .Y(n17) );
  NOR2X1 U59 ( .A(n1), .B(n20), .Y(ab0[6]) );
  INVX1 U60 ( .A(a[6]), .Y(n1) );
  NOR2X1 U61 ( .A(n3), .B(n20), .Y(ab0[5]) );
  INVX1 U62 ( .A(a[5]), .Y(n3) );
  NOR2X1 U63 ( .A(n4), .B(n20), .Y(ab0[4]) );
  INVX1 U64 ( .A(a[4]), .Y(n4) );
  NOR2X1 U65 ( .A(n5), .B(n20), .Y(ab0[3]) );
  INVX1 U66 ( .A(a[3]), .Y(n5) );
  NOR2X1 U67 ( .A(n6), .B(n20), .Y(ab0[2]) );
  INVX1 U68 ( .A(a[2]), .Y(n6) );
  NOR2X1 U69 ( .A(n7), .B(n20), .Y(ab0[1]) );
  INVX1 U70 ( .A(a[1]), .Y(n7) );
  NOR2X1 U71 ( .A(n9), .B(n20), .Y(ab0[15]) );
  INVX1 U72 ( .A(a[15]), .Y(n9) );
  NOR2X1 U73 ( .A(n10), .B(n20), .Y(ab0[14]) );
  INVX1 U74 ( .A(a[14]), .Y(n10) );
  NOR2X1 U75 ( .A(n11), .B(n20), .Y(ab0[13]) );
  INVX1 U76 ( .A(a[13]), .Y(n11) );
  NOR2X1 U77 ( .A(n12), .B(n20), .Y(ab0[12]) );
  INVX1 U78 ( .A(a[12]), .Y(n12) );
  NOR2X1 U79 ( .A(n13), .B(n20), .Y(ab0[11]) );
  INVX1 U80 ( .A(a[11]), .Y(n13) );
  NOR2X1 U81 ( .A(n14), .B(n20), .Y(ab0[10]) );
  INVX1 U82 ( .A(a[10]), .Y(n14) );
  NOR2X1 U83 ( .A(n8), .B(n20), .Y(ab0[0]) );
  INVX1 U84 ( .A(a[0]), .Y(n8) );
endmodule


module cla_4bit_121 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_120 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_119 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_118 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_16bit_29 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, cout, n8, n9, n10;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  cla_4bit_121 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_120 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n10), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_119 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n9), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_118 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n8), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  NOR2X1 U1 ( .A(n1), .B(n2), .Y(pg) );
  NAND2X1 U2 ( .A(p[3]), .B(p[2]), .Y(n2) );
  NAND2X1 U3 ( .A(p[1]), .B(p[0]), .Y(n1) );
  INVX1 U4 ( .A(n3), .Y(cout) );
  AOI21X1 U5 ( .A(n8), .B(p[3]), .C(g[3]), .Y(n3) );
  INVX1 U6 ( .A(n4), .Y(n8) );
  AOI21X1 U7 ( .A(n9), .B(p[2]), .C(g[2]), .Y(n4) );
  INVX1 U8 ( .A(n5), .Y(n9) );
  AOI21X1 U9 ( .A(n10), .B(p[1]), .C(g[1]), .Y(n5) );
  INVX1 U10 ( .A(n6), .Y(n10) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n6) );
endmodule


module cla_4bit_117 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_116 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_115 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_114 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_16bit_28 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, cout, n8, n9, n10;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  cla_4bit_117 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_116 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n10), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_115 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n9), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_114 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n8), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  NOR2X1 U1 ( .A(n1), .B(n2), .Y(pg) );
  NAND2X1 U2 ( .A(p[3]), .B(p[2]), .Y(n2) );
  NAND2X1 U3 ( .A(p[1]), .B(p[0]), .Y(n1) );
  INVX1 U4 ( .A(n3), .Y(cout) );
  AOI21X1 U5 ( .A(n8), .B(p[3]), .C(g[3]), .Y(n3) );
  INVX1 U6 ( .A(n4), .Y(n8) );
  AOI21X1 U7 ( .A(n9), .B(p[2]), .C(g[2]), .Y(n4) );
  INVX1 U8 ( .A(n5), .Y(n9) );
  AOI21X1 U9 ( .A(n10), .B(p[1]), .C(g[1]), .Y(n5) );
  INVX1 U10 ( .A(n6), .Y(n10) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n6) );
endmodule


module amp_comp_0 ( clk, n_rst, inchan, in_thresh, outchan );
  input [15:0] inchan;
  input [3:0] in_thresh;
  output [15:0] outchan;
  input clk, n_rst;
  wire   \AcmpB[15] , \CcmpD[15] , \diff1[15] , n297, n298, n299, n300, n301,
         n302, n303, n304, n305, n306, n307, n308, n309, n310, n311, n312, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n156, n157, n158, n160, n162, n164,
         n166, n169, n171, n173, n175, n177, n179, n181, n182, n183, n184,
         n185, n186, n187, n188, n189, n190, n191, n192, n193, n194, n195,
         n196, n197, n198, n199, n200, n201, n202, n203, n204, n205, n206,
         n207, n208, n209, n210, n211, n212, n213, n214, n215, n216, n217,
         n218, n219, n220, n221, n222, n223, n224, n225, n226, n227, n228,
         n229, n230, n231, n232, n233, n234, n235, n236, n237, n238, n239,
         n240, n241, n242, n243, n244, n245, n246, n247, n248, n249, n250,
         n251, n252, n253, n254, n255, n256, n257, n258, n259, n260, n261,
         n262, n263, n264, n265, n266, n267, n268, n269, n270, n271, n272,
         n273, n274, n275, n276, n277, n278, n279, n280, n281, n282, n283,
         n284, n285, n286, n287, n288, n289, n290, n291, n292, n293, n294,
         n295;
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

  flex_buffer_NUM_BITS16_3 BUFFER1 ( .clk(n1), .n_rst(n_rst), .input_data(
        inchan), .output_data(reg_1_out) );
  flex_buffer_NUM_BITS16_2 BUFFER2 ( .clk(n1), .n_rst(n_rst), .input_data(
        reg_1_out), .output_data(reg_2_out) );
  flex_buffer_NUM_BITS16_1 BUFFER3 ( .clk(n1), .n_rst(n_rst), .input_data(
        reg_2_out), .output_data(reg_3_out) );
  flex_buffer_NUM_BITS16_0 BUFFER4 ( .clk(n1), .n_rst(n_rst), .input_data(
        reg_3_out), .output_data(reg_4_out) );
  cla_16bit_37 ABSA ( .a({n198, n199, n200, n201, n202, n203, n204, n205, n206, 
        n207, n208, n209, n210, n211, n212, n213}), .b({1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .cin(1'b1), .sum(A_opp_sign) );
  cla_16bit_36 ABSB ( .a({n229, n230, n231, n232, n233, n234, n235, n236, n237, 
        n238, n239, n240, n241, n242, n243, n244}), .b({1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .cin(1'b1), .sum(B_opp_sign) );
  cla_16bit_35 ABSC ( .a({n245, n246, n247, n248, n249, n250, n251, n252, n253, 
        n254, n255, n256, n257, n258, n259, n260}), .b({1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .cin(1'b1), .sum(C_opp_sign) );
  cla_16bit_34 ABSD ( .a({n276, n277, n278, n279, n280, n281, n282, n283, n284, 
        n285, n286, n287, n288, n289, n290, n291}), .b({1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .cin(1'b1), .sum(D_opp_sign) );
  cla_16bit_33 A2 ( .a({1'b0, A[14:0]}), .b({1'b1, n219, n218, n217, n216, 
        n215, n228, n227, n226, n225, n224, n223, n222, n221, n220, n214}), 
        .cin(1'b1), .sum({\AcmpB[15] , SYNOPSYS_UNCONNECTED__0, 
        SYNOPSYS_UNCONNECTED__1, SYNOPSYS_UNCONNECTED__2, 
        SYNOPSYS_UNCONNECTED__3, SYNOPSYS_UNCONNECTED__4, 
        SYNOPSYS_UNCONNECTED__5, SYNOPSYS_UNCONNECTED__6, 
        SYNOPSYS_UNCONNECTED__7, SYNOPSYS_UNCONNECTED__8, 
        SYNOPSYS_UNCONNECTED__9, SYNOPSYS_UNCONNECTED__10, 
        SYNOPSYS_UNCONNECTED__11, SYNOPSYS_UNCONNECTED__12, 
        SYNOPSYS_UNCONNECTED__13, SYNOPSYS_UNCONNECTED__14}) );
  cla_16bit_32 A3 ( .a({1'b0, C[14:0]}), .b({1'b1, n266, n265, n264, n263, 
        n262, n275, n274, n273, n272, n271, n270, n269, n268, n267, n261}), 
        .cin(1'b1), .sum({\CcmpD[15] , SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29}) );
  cla_16bit_31 A4 ( .a({1'b0, n188, n187, n186, n185, n184, n197, n196, n195, 
        n194, n193, n192, n191, n190, n189, n183}), .b({1'b1, n298, n299, n300, 
        n301, n302, n303, n304, n305, n306, n307, n308, n309, n310, n311, n312}), .cin(1'b1), .sum({\diff1[15] , SYNOPSYS_UNCONNECTED__30, 
        SYNOPSYS_UNCONNECTED__31, SYNOPSYS_UNCONNECTED__32, 
        SYNOPSYS_UNCONNECTED__33, SYNOPSYS_UNCONNECTED__34, 
        SYNOPSYS_UNCONNECTED__35, SYNOPSYS_UNCONNECTED__36, 
        SYNOPSYS_UNCONNECTED__37, SYNOPSYS_UNCONNECTED__38, 
        SYNOPSYS_UNCONNECTED__39, SYNOPSYS_UNCONNECTED__40, 
        SYNOPSYS_UNCONNECTED__41, SYNOPSYS_UNCONNECTED__42, 
        SYNOPSYS_UNCONNECTED__43, SYNOPSYS_UNCONNECTED__44}) );
  cla_16bit_30 A5 ( .a({1'b0, max[14:0]}), .b({1'b1, n292, n293, n294, n295, 
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
  cla_16bit_29 A6 ( .a(reg_4_out), .b({1'b1, n157, n297, n156, n160, n162, 
        n164, n166, n182, n169, n171, n173, n175, n177, n179, n181}), .cin(
        1'b1), .sum(out_pos_val) );
  cla_16bit_28 A7 ( .a(reg_4_out), .b({1'b0, modifier[14], n158, 
        modifier[12:0]}), .cin(1'b0), .sum(out_neg_val) );
  INVX2 U3 ( .A(n83), .Y(n50) );
  INVX2 U4 ( .A(n72), .Y(n49) );
  INVX2 U5 ( .A(reg_3_out[15]), .Y(n245) );
  INVX2 U6 ( .A(reg_1_out[15]), .Y(n198) );
  INVX2 U7 ( .A(reg_2_out[15]), .Y(n229) );
  INVX4 U8 ( .A(reg_4_out[15]), .Y(n276) );
  INVX4 U9 ( .A(n2), .Y(n1) );
  INVX2 U10 ( .A(clk), .Y(n2) );
  INVX1 U11 ( .A(n3), .Y(outchan[15]) );
  MUX2X1 U12 ( .B(out_neg_val[15]), .A(out_pos_val[15]), .S(n276), .Y(n3) );
  INVX1 U13 ( .A(n4), .Y(outchan[14]) );
  MUX2X1 U14 ( .B(out_neg_val[14]), .A(out_pos_val[14]), .S(n276), .Y(n4) );
  INVX1 U15 ( .A(n5), .Y(outchan[13]) );
  MUX2X1 U16 ( .B(out_neg_val[13]), .A(out_pos_val[13]), .S(n276), .Y(n5) );
  INVX1 U17 ( .A(n6), .Y(outchan[12]) );
  MUX2X1 U18 ( .B(out_neg_val[12]), .A(out_pos_val[12]), .S(n276), .Y(n6) );
  INVX1 U19 ( .A(modifier[12]), .Y(n156) );
  INVX1 U20 ( .A(modifier[14]), .Y(n157) );
  INVX1 U21 ( .A(n297), .Y(n158) );
  INVX1 U22 ( .A(n7), .Y(outchan[11]) );
  MUX2X1 U23 ( .B(out_neg_val[11]), .A(out_pos_val[11]), .S(n276), .Y(n7) );
  INVX1 U24 ( .A(modifier[11]), .Y(n160) );
  INVX1 U25 ( .A(n8), .Y(outchan[10]) );
  MUX2X1 U26 ( .B(out_neg_val[10]), .A(out_pos_val[10]), .S(n276), .Y(n8) );
  INVX1 U27 ( .A(modifier[10]), .Y(n162) );
  INVX1 U28 ( .A(n9), .Y(outchan[9]) );
  MUX2X1 U29 ( .B(out_neg_val[9]), .A(out_pos_val[9]), .S(n276), .Y(n9) );
  INVX1 U30 ( .A(modifier[9]), .Y(n164) );
  INVX1 U31 ( .A(n10), .Y(outchan[8]) );
  MUX2X1 U32 ( .B(out_neg_val[8]), .A(out_pos_val[8]), .S(n276), .Y(n10) );
  INVX1 U33 ( .A(modifier[8]), .Y(n166) );
  INVX1 U34 ( .A(n11), .Y(outchan[7]) );
  MUX2X1 U35 ( .B(out_neg_val[7]), .A(out_pos_val[7]), .S(n276), .Y(n11) );
  INVX1 U36 ( .A(n12), .Y(outchan[6]) );
  MUX2X1 U37 ( .B(out_neg_val[6]), .A(out_pos_val[6]), .S(n276), .Y(n12) );
  INVX1 U38 ( .A(modifier[6]), .Y(n169) );
  INVX1 U39 ( .A(n13), .Y(outchan[5]) );
  MUX2X1 U40 ( .B(out_neg_val[5]), .A(out_pos_val[5]), .S(n276), .Y(n13) );
  INVX1 U41 ( .A(modifier[5]), .Y(n171) );
  INVX1 U42 ( .A(n14), .Y(outchan[4]) );
  MUX2X1 U43 ( .B(out_neg_val[4]), .A(out_pos_val[4]), .S(n276), .Y(n14) );
  INVX1 U44 ( .A(modifier[4]), .Y(n173) );
  INVX1 U45 ( .A(n15), .Y(outchan[3]) );
  MUX2X1 U46 ( .B(out_neg_val[3]), .A(out_pos_val[3]), .S(n276), .Y(n15) );
  INVX1 U47 ( .A(modifier[3]), .Y(n175) );
  INVX1 U48 ( .A(n16), .Y(outchan[2]) );
  MUX2X1 U49 ( .B(out_neg_val[2]), .A(out_pos_val[2]), .S(n276), .Y(n16) );
  INVX1 U50 ( .A(modifier[2]), .Y(n177) );
  INVX1 U51 ( .A(n17), .Y(outchan[1]) );
  MUX2X1 U52 ( .B(out_neg_val[1]), .A(out_pos_val[1]), .S(n276), .Y(n17) );
  INVX1 U53 ( .A(modifier[1]), .Y(n179) );
  INVX1 U54 ( .A(n18), .Y(outchan[0]) );
  MUX2X1 U55 ( .B(out_neg_val[0]), .A(out_pos_val[0]), .S(n276), .Y(n18) );
  INVX1 U56 ( .A(modifier[0]), .Y(n181) );
  INVX1 U57 ( .A(modifier[7]), .Y(n182) );
  INVX1 U58 ( .A(n19), .Y(n183) );
  INVX1 U59 ( .A(n20), .Y(n184) );
  INVX1 U60 ( .A(n21), .Y(n185) );
  INVX1 U61 ( .A(n22), .Y(n186) );
  INVX1 U62 ( .A(n23), .Y(n187) );
  INVX1 U63 ( .A(n24), .Y(n188) );
  INVX1 U64 ( .A(n25), .Y(n189) );
  INVX1 U65 ( .A(n26), .Y(n190) );
  INVX1 U66 ( .A(n27), .Y(n191) );
  INVX1 U67 ( .A(n28), .Y(n192) );
  INVX1 U68 ( .A(n29), .Y(n193) );
  INVX1 U69 ( .A(n30), .Y(n194) );
  INVX1 U70 ( .A(n31), .Y(n195) );
  INVX1 U71 ( .A(n32), .Y(n196) );
  INVX1 U72 ( .A(n33), .Y(n197) );
  INVX1 U73 ( .A(reg_1_out[14]), .Y(n199) );
  INVX1 U74 ( .A(reg_1_out[13]), .Y(n200) );
  INVX1 U75 ( .A(reg_1_out[12]), .Y(n201) );
  INVX1 U76 ( .A(reg_1_out[11]), .Y(n202) );
  INVX1 U77 ( .A(reg_1_out[10]), .Y(n203) );
  INVX1 U78 ( .A(reg_1_out[9]), .Y(n204) );
  INVX1 U79 ( .A(reg_1_out[8]), .Y(n205) );
  INVX1 U80 ( .A(reg_1_out[7]), .Y(n206) );
  INVX1 U81 ( .A(reg_1_out[6]), .Y(n207) );
  INVX1 U82 ( .A(reg_1_out[5]), .Y(n208) );
  INVX1 U83 ( .A(reg_1_out[4]), .Y(n209) );
  INVX1 U84 ( .A(reg_1_out[3]), .Y(n210) );
  INVX1 U85 ( .A(reg_1_out[2]), .Y(n211) );
  INVX1 U86 ( .A(reg_1_out[1]), .Y(n212) );
  INVX1 U87 ( .A(reg_1_out[0]), .Y(n213) );
  INVX1 U88 ( .A(n34), .Y(n214) );
  INVX1 U89 ( .A(n35), .Y(n215) );
  INVX1 U90 ( .A(n36), .Y(n216) );
  INVX1 U91 ( .A(n37), .Y(n217) );
  INVX1 U92 ( .A(n38), .Y(n218) );
  INVX1 U93 ( .A(n39), .Y(n219) );
  INVX1 U94 ( .A(n40), .Y(n220) );
  INVX1 U95 ( .A(n41), .Y(n221) );
  INVX1 U96 ( .A(n42), .Y(n222) );
  INVX1 U97 ( .A(n43), .Y(n223) );
  INVX1 U98 ( .A(n44), .Y(n224) );
  INVX1 U99 ( .A(n45), .Y(n225) );
  INVX1 U100 ( .A(n46), .Y(n226) );
  INVX1 U101 ( .A(n47), .Y(n227) );
  INVX1 U102 ( .A(n48), .Y(n228) );
  INVX1 U103 ( .A(reg_2_out[14]), .Y(n230) );
  INVX1 U104 ( .A(reg_2_out[13]), .Y(n231) );
  INVX1 U105 ( .A(reg_2_out[12]), .Y(n232) );
  INVX1 U106 ( .A(reg_2_out[11]), .Y(n233) );
  INVX1 U107 ( .A(reg_2_out[10]), .Y(n234) );
  INVX1 U108 ( .A(reg_2_out[9]), .Y(n235) );
  INVX1 U109 ( .A(reg_2_out[8]), .Y(n236) );
  INVX1 U110 ( .A(reg_2_out[7]), .Y(n237) );
  INVX1 U111 ( .A(reg_2_out[6]), .Y(n238) );
  INVX1 U112 ( .A(reg_2_out[5]), .Y(n239) );
  INVX1 U113 ( .A(reg_2_out[4]), .Y(n240) );
  INVX1 U114 ( .A(reg_2_out[3]), .Y(n241) );
  INVX1 U115 ( .A(reg_2_out[2]), .Y(n242) );
  INVX1 U116 ( .A(reg_2_out[1]), .Y(n243) );
  INVX1 U117 ( .A(reg_2_out[0]), .Y(n244) );
  INVX1 U118 ( .A(reg_3_out[14]), .Y(n246) );
  INVX1 U119 ( .A(reg_3_out[13]), .Y(n247) );
  INVX1 U120 ( .A(reg_3_out[12]), .Y(n248) );
  INVX1 U121 ( .A(reg_3_out[11]), .Y(n249) );
  INVX1 U122 ( .A(reg_3_out[10]), .Y(n250) );
  INVX1 U123 ( .A(reg_3_out[9]), .Y(n251) );
  INVX1 U124 ( .A(reg_3_out[8]), .Y(n252) );
  INVX1 U125 ( .A(reg_3_out[7]), .Y(n253) );
  INVX1 U126 ( .A(reg_3_out[6]), .Y(n254) );
  INVX1 U127 ( .A(reg_3_out[5]), .Y(n255) );
  INVX1 U128 ( .A(reg_3_out[4]), .Y(n256) );
  INVX1 U129 ( .A(reg_3_out[3]), .Y(n257) );
  INVX1 U130 ( .A(reg_3_out[2]), .Y(n258) );
  INVX1 U131 ( .A(reg_3_out[1]), .Y(n259) );
  INVX1 U132 ( .A(reg_3_out[0]), .Y(n260) );
  INVX1 U133 ( .A(D[0]), .Y(n261) );
  INVX1 U134 ( .A(D[10]), .Y(n262) );
  INVX1 U135 ( .A(D[11]), .Y(n263) );
  INVX1 U136 ( .A(D[12]), .Y(n264) );
  INVX1 U137 ( .A(D[13]), .Y(n265) );
  INVX1 U138 ( .A(D[14]), .Y(n266) );
  INVX1 U139 ( .A(D[1]), .Y(n267) );
  INVX1 U140 ( .A(D[2]), .Y(n268) );
  INVX1 U141 ( .A(D[3]), .Y(n269) );
  INVX1 U142 ( .A(D[4]), .Y(n270) );
  INVX1 U143 ( .A(D[5]), .Y(n271) );
  INVX1 U144 ( .A(D[6]), .Y(n272) );
  INVX1 U145 ( .A(D[7]), .Y(n273) );
  INVX1 U146 ( .A(D[8]), .Y(n274) );
  INVX1 U147 ( .A(D[9]), .Y(n275) );
  INVX1 U148 ( .A(reg_4_out[14]), .Y(n277) );
  INVX1 U149 ( .A(reg_4_out[13]), .Y(n278) );
  INVX1 U150 ( .A(reg_4_out[12]), .Y(n279) );
  INVX1 U151 ( .A(reg_4_out[11]), .Y(n280) );
  INVX1 U152 ( .A(reg_4_out[10]), .Y(n281) );
  INVX1 U153 ( .A(reg_4_out[9]), .Y(n282) );
  INVX1 U154 ( .A(reg_4_out[8]), .Y(n283) );
  INVX1 U155 ( .A(reg_4_out[7]), .Y(n284) );
  INVX1 U156 ( .A(reg_4_out[6]), .Y(n285) );
  INVX1 U157 ( .A(reg_4_out[5]), .Y(n286) );
  INVX1 U158 ( .A(reg_4_out[4]), .Y(n287) );
  INVX1 U159 ( .A(reg_4_out[3]), .Y(n288) );
  INVX1 U160 ( .A(reg_4_out[2]), .Y(n289) );
  INVX1 U161 ( .A(reg_4_out[1]), .Y(n290) );
  INVX1 U162 ( .A(reg_4_out[0]), .Y(n291) );
  INVX1 U163 ( .A(in_thresh[3]), .Y(n292) );
  INVX1 U164 ( .A(in_thresh[2]), .Y(n293) );
  INVX1 U165 ( .A(in_thresh[1]), .Y(n294) );
  INVX1 U166 ( .A(in_thresh[0]), .Y(n295) );
  AOI22X1 U167 ( .A(product[18]), .B(n49), .C(n50), .D(product[19]), .Y(n297)
         );
  NAND2X1 U168 ( .A(n51), .B(n52), .Y(modifier[9]) );
  AOI22X1 U169 ( .A(product[15]), .B(n50), .C(product[14]), .D(n49), .Y(n52)
         );
  AOI22X1 U170 ( .A(n53), .B(product[17]), .C(product[16]), .D(n54), .Y(n51)
         );
  NAND2X1 U171 ( .A(n55), .B(n56), .Y(modifier[8]) );
  AOI22X1 U172 ( .A(product[14]), .B(n50), .C(product[13]), .D(n49), .Y(n56)
         );
  AOI22X1 U173 ( .A(n53), .B(product[16]), .C(product[15]), .D(n54), .Y(n55)
         );
  NAND2X1 U174 ( .A(n57), .B(n58), .Y(modifier[7]) );
  AOI22X1 U175 ( .A(product[13]), .B(n50), .C(product[12]), .D(n49), .Y(n58)
         );
  AOI22X1 U177 ( .A(product[15]), .B(n53), .C(product[14]), .D(n54), .Y(n57)
         );
  NAND2X1 U178 ( .A(n59), .B(n60), .Y(modifier[6]) );
  AOI22X1 U179 ( .A(product[12]), .B(n50), .C(product[11]), .D(n49), .Y(n60)
         );
  AOI22X1 U180 ( .A(product[14]), .B(n53), .C(product[13]), .D(n54), .Y(n59)
         );
  NAND2X1 U181 ( .A(n61), .B(n62), .Y(modifier[5]) );
  AOI22X1 U182 ( .A(product[11]), .B(n50), .C(product[10]), .D(n49), .Y(n62)
         );
  AOI22X1 U183 ( .A(product[13]), .B(n53), .C(product[12]), .D(n54), .Y(n61)
         );
  NAND2X1 U184 ( .A(n63), .B(n64), .Y(modifier[4]) );
  AOI22X1 U185 ( .A(product[10]), .B(n50), .C(product[9]), .D(n49), .Y(n64) );
  AOI22X1 U186 ( .A(product[12]), .B(n53), .C(product[11]), .D(n54), .Y(n63)
         );
  NAND2X1 U187 ( .A(n65), .B(n66), .Y(modifier[3]) );
  AOI22X1 U188 ( .A(product[9]), .B(n50), .C(product[8]), .D(n49), .Y(n66) );
  AOI22X1 U189 ( .A(product[11]), .B(n53), .C(product[10]), .D(n54), .Y(n65)
         );
  NAND2X1 U190 ( .A(n67), .B(n68), .Y(modifier[2]) );
  AOI22X1 U191 ( .A(product[8]), .B(n50), .C(product[7]), .D(n49), .Y(n68) );
  AOI22X1 U192 ( .A(product[10]), .B(n53), .C(product[9]), .D(n54), .Y(n67) );
  NAND2X1 U193 ( .A(n69), .B(n70), .Y(modifier[1]) );
  AOI22X1 U194 ( .A(product[7]), .B(n50), .C(product[6]), .D(n49), .Y(n70) );
  AOI22X1 U195 ( .A(product[9]), .B(n53), .C(product[8]), .D(n54), .Y(n69) );
  NOR2X1 U196 ( .A(n71), .B(n72), .Y(modifier[14]) );
  OAI21X1 U197 ( .A(n73), .B(n71), .C(n74), .Y(modifier[12]) );
  AOI22X1 U198 ( .A(product[18]), .B(n50), .C(product[17]), .D(n49), .Y(n74)
         );
  INVX1 U199 ( .A(product[19]), .Y(n71) );
  NAND2X1 U200 ( .A(n75), .B(n76), .Y(modifier[11]) );
  AOI22X1 U201 ( .A(product[17]), .B(n50), .C(product[16]), .D(n49), .Y(n76)
         );
  AOI22X1 U202 ( .A(n53), .B(product[19]), .C(n54), .D(product[18]), .Y(n75)
         );
  NAND2X1 U203 ( .A(n77), .B(n78), .Y(modifier[10]) );
  AOI22X1 U204 ( .A(product[16]), .B(n50), .C(product[15]), .D(n49), .Y(n78)
         );
  AOI22X1 U205 ( .A(n53), .B(product[18]), .C(n54), .D(product[17]), .Y(n77)
         );
  NAND2X1 U206 ( .A(n79), .B(n80), .Y(modifier[0]) );
  AOI22X1 U207 ( .A(product[6]), .B(n50), .C(product[5]), .D(n49), .Y(n80) );
  NAND3X1 U208 ( .A(n81), .B(max[11]), .C(n82), .Y(n72) );
  NOR2X1 U209 ( .A(max[13]), .B(max[12]), .Y(n82) );
  NAND3X1 U210 ( .A(n84), .B(max[12]), .C(n81), .Y(n83) );
  INVX1 U211 ( .A(max[13]), .Y(n84) );
  AOI22X1 U212 ( .A(product[8]), .B(n53), .C(product[7]), .D(n54), .Y(n79) );
  INVX1 U213 ( .A(n73), .Y(n54) );
  NAND2X1 U214 ( .A(n81), .B(max[13]), .Y(n73) );
  NOR2X1 U215 ( .A(max[14]), .B(diff2[15]), .Y(n81) );
  NOR2X1 U216 ( .A(n85), .B(diff2[15]), .Y(n53) );
  INVX1 U217 ( .A(max[14]), .Y(n85) );
  MUX2X1 U218 ( .B(n33), .A(n303), .S(\diff1[15] ), .Y(max[9]) );
  MUX2X1 U219 ( .B(C[9]), .A(D[9]), .S(\CcmpD[15] ), .Y(n303) );
  MUX2X1 U220 ( .B(A[9]), .A(n48), .S(\AcmpB[15] ), .Y(n33) );
  NAND2X1 U221 ( .A(n86), .B(n87), .Y(n48) );
  MUX2X1 U222 ( .B(B_opp_sign[9]), .A(reg_2_out[9]), .S(n229), .Y(n86) );
  MUX2X1 U223 ( .B(n32), .A(n304), .S(\diff1[15] ), .Y(max[8]) );
  MUX2X1 U224 ( .B(C[8]), .A(D[8]), .S(\CcmpD[15] ), .Y(n304) );
  MUX2X1 U225 ( .B(A[8]), .A(n47), .S(\AcmpB[15] ), .Y(n32) );
  NAND2X1 U226 ( .A(n88), .B(n87), .Y(n47) );
  MUX2X1 U227 ( .B(B_opp_sign[8]), .A(reg_2_out[8]), .S(n229), .Y(n88) );
  MUX2X1 U228 ( .B(n31), .A(n305), .S(\diff1[15] ), .Y(max[7]) );
  MUX2X1 U229 ( .B(C[7]), .A(D[7]), .S(\CcmpD[15] ), .Y(n305) );
  MUX2X1 U230 ( .B(A[7]), .A(n46), .S(\AcmpB[15] ), .Y(n31) );
  NAND2X1 U231 ( .A(n89), .B(n87), .Y(n46) );
  MUX2X1 U232 ( .B(B_opp_sign[7]), .A(reg_2_out[7]), .S(n229), .Y(n89) );
  MUX2X1 U233 ( .B(n30), .A(n306), .S(\diff1[15] ), .Y(max[6]) );
  MUX2X1 U234 ( .B(C[6]), .A(D[6]), .S(\CcmpD[15] ), .Y(n306) );
  MUX2X1 U235 ( .B(A[6]), .A(n45), .S(\AcmpB[15] ), .Y(n30) );
  NAND2X1 U236 ( .A(n90), .B(n87), .Y(n45) );
  MUX2X1 U237 ( .B(B_opp_sign[6]), .A(reg_2_out[6]), .S(n229), .Y(n90) );
  MUX2X1 U238 ( .B(n29), .A(n307), .S(\diff1[15] ), .Y(max[5]) );
  MUX2X1 U239 ( .B(C[5]), .A(D[5]), .S(\CcmpD[15] ), .Y(n307) );
  MUX2X1 U240 ( .B(A[5]), .A(n44), .S(\AcmpB[15] ), .Y(n29) );
  NAND2X1 U241 ( .A(n91), .B(n87), .Y(n44) );
  MUX2X1 U242 ( .B(B_opp_sign[5]), .A(reg_2_out[5]), .S(n229), .Y(n91) );
  MUX2X1 U243 ( .B(n28), .A(n308), .S(\diff1[15] ), .Y(max[4]) );
  MUX2X1 U244 ( .B(C[4]), .A(D[4]), .S(\CcmpD[15] ), .Y(n308) );
  MUX2X1 U245 ( .B(A[4]), .A(n43), .S(\AcmpB[15] ), .Y(n28) );
  NAND2X1 U246 ( .A(n92), .B(n87), .Y(n43) );
  MUX2X1 U247 ( .B(B_opp_sign[4]), .A(reg_2_out[4]), .S(n229), .Y(n92) );
  MUX2X1 U248 ( .B(n27), .A(n309), .S(\diff1[15] ), .Y(max[3]) );
  MUX2X1 U249 ( .B(C[3]), .A(D[3]), .S(\CcmpD[15] ), .Y(n309) );
  MUX2X1 U250 ( .B(A[3]), .A(n42), .S(\AcmpB[15] ), .Y(n27) );
  NAND2X1 U251 ( .A(n93), .B(n87), .Y(n42) );
  MUX2X1 U252 ( .B(B_opp_sign[3]), .A(reg_2_out[3]), .S(n229), .Y(n93) );
  MUX2X1 U253 ( .B(n26), .A(n310), .S(\diff1[15] ), .Y(max[2]) );
  MUX2X1 U254 ( .B(C[2]), .A(D[2]), .S(\CcmpD[15] ), .Y(n310) );
  MUX2X1 U255 ( .B(A[2]), .A(n41), .S(\AcmpB[15] ), .Y(n26) );
  NAND2X1 U256 ( .A(n94), .B(n87), .Y(n41) );
  MUX2X1 U257 ( .B(B_opp_sign[2]), .A(reg_2_out[2]), .S(n229), .Y(n94) );
  MUX2X1 U258 ( .B(n25), .A(n311), .S(\diff1[15] ), .Y(max[1]) );
  MUX2X1 U259 ( .B(C[1]), .A(D[1]), .S(\CcmpD[15] ), .Y(n311) );
  MUX2X1 U260 ( .B(A[1]), .A(n40), .S(\AcmpB[15] ), .Y(n25) );
  NAND2X1 U261 ( .A(n95), .B(n87), .Y(n40) );
  MUX2X1 U262 ( .B(B_opp_sign[1]), .A(reg_2_out[1]), .S(n229), .Y(n95) );
  MUX2X1 U263 ( .B(n24), .A(n298), .S(\diff1[15] ), .Y(max[14]) );
  MUX2X1 U264 ( .B(C[14]), .A(D[14]), .S(\CcmpD[15] ), .Y(n298) );
  MUX2X1 U265 ( .B(A[14]), .A(n39), .S(\AcmpB[15] ), .Y(n24) );
  NAND2X1 U266 ( .A(n96), .B(n87), .Y(n39) );
  MUX2X1 U267 ( .B(B_opp_sign[14]), .A(reg_2_out[14]), .S(n229), .Y(n96) );
  MUX2X1 U268 ( .B(n23), .A(n299), .S(\diff1[15] ), .Y(max[13]) );
  MUX2X1 U269 ( .B(C[13]), .A(D[13]), .S(\CcmpD[15] ), .Y(n299) );
  MUX2X1 U270 ( .B(A[13]), .A(n38), .S(\AcmpB[15] ), .Y(n23) );
  NAND2X1 U271 ( .A(n97), .B(n87), .Y(n38) );
  MUX2X1 U272 ( .B(B_opp_sign[13]), .A(reg_2_out[13]), .S(n229), .Y(n97) );
  MUX2X1 U273 ( .B(n22), .A(n300), .S(\diff1[15] ), .Y(max[12]) );
  MUX2X1 U274 ( .B(C[12]), .A(D[12]), .S(\CcmpD[15] ), .Y(n300) );
  MUX2X1 U275 ( .B(A[12]), .A(n37), .S(\AcmpB[15] ), .Y(n22) );
  NAND2X1 U276 ( .A(n98), .B(n87), .Y(n37) );
  MUX2X1 U277 ( .B(B_opp_sign[12]), .A(reg_2_out[12]), .S(n229), .Y(n98) );
  MUX2X1 U278 ( .B(n21), .A(n301), .S(\diff1[15] ), .Y(max[11]) );
  MUX2X1 U279 ( .B(C[11]), .A(D[11]), .S(\CcmpD[15] ), .Y(n301) );
  MUX2X1 U280 ( .B(A[11]), .A(n36), .S(\AcmpB[15] ), .Y(n21) );
  NAND2X1 U281 ( .A(n99), .B(n87), .Y(n36) );
  MUX2X1 U282 ( .B(B_opp_sign[11]), .A(reg_2_out[11]), .S(n229), .Y(n99) );
  MUX2X1 U283 ( .B(n20), .A(n302), .S(\diff1[15] ), .Y(max[10]) );
  MUX2X1 U284 ( .B(C[10]), .A(D[10]), .S(\CcmpD[15] ), .Y(n302) );
  MUX2X1 U285 ( .B(A[10]), .A(n35), .S(\AcmpB[15] ), .Y(n20) );
  NAND2X1 U286 ( .A(n100), .B(n87), .Y(n35) );
  MUX2X1 U287 ( .B(B_opp_sign[10]), .A(reg_2_out[10]), .S(n229), .Y(n100) );
  MUX2X1 U288 ( .B(n19), .A(n312), .S(\diff1[15] ), .Y(max[0]) );
  MUX2X1 U289 ( .B(C[0]), .A(D[0]), .S(\CcmpD[15] ), .Y(n312) );
  MUX2X1 U290 ( .B(A[0]), .A(n34), .S(\AcmpB[15] ), .Y(n19) );
  NAND2X1 U291 ( .A(n101), .B(n87), .Y(n34) );
  NAND2X1 U292 ( .A(B_opp_sign[15]), .B(reg_2_out[15]), .Y(n87) );
  MUX2X1 U293 ( .B(B_opp_sign[0]), .A(reg_2_out[0]), .S(n229), .Y(n101) );
  NAND2X1 U294 ( .A(n102), .B(n103), .Y(D[9]) );
  MUX2X1 U295 ( .B(D_opp_sign[9]), .A(reg_4_out[9]), .S(n276), .Y(n102) );
  NAND2X1 U296 ( .A(n104), .B(n103), .Y(D[8]) );
  MUX2X1 U297 ( .B(D_opp_sign[8]), .A(reg_4_out[8]), .S(n276), .Y(n104) );
  NAND2X1 U298 ( .A(n105), .B(n103), .Y(D[7]) );
  MUX2X1 U299 ( .B(D_opp_sign[7]), .A(reg_4_out[7]), .S(n276), .Y(n105) );
  NAND2X1 U300 ( .A(n106), .B(n103), .Y(D[6]) );
  MUX2X1 U301 ( .B(D_opp_sign[6]), .A(reg_4_out[6]), .S(n276), .Y(n106) );
  NAND2X1 U302 ( .A(n107), .B(n103), .Y(D[5]) );
  MUX2X1 U303 ( .B(D_opp_sign[5]), .A(reg_4_out[5]), .S(n276), .Y(n107) );
  NAND2X1 U304 ( .A(n108), .B(n103), .Y(D[4]) );
  MUX2X1 U305 ( .B(D_opp_sign[4]), .A(reg_4_out[4]), .S(n276), .Y(n108) );
  NAND2X1 U306 ( .A(n109), .B(n103), .Y(D[3]) );
  MUX2X1 U307 ( .B(D_opp_sign[3]), .A(reg_4_out[3]), .S(n276), .Y(n109) );
  NAND2X1 U308 ( .A(n110), .B(n103), .Y(D[2]) );
  MUX2X1 U309 ( .B(D_opp_sign[2]), .A(reg_4_out[2]), .S(n276), .Y(n110) );
  NAND2X1 U310 ( .A(n111), .B(n103), .Y(D[1]) );
  MUX2X1 U311 ( .B(D_opp_sign[1]), .A(reg_4_out[1]), .S(n276), .Y(n111) );
  NAND2X1 U312 ( .A(n112), .B(n103), .Y(D[14]) );
  MUX2X1 U313 ( .B(D_opp_sign[14]), .A(reg_4_out[14]), .S(n276), .Y(n112) );
  NAND2X1 U314 ( .A(n113), .B(n103), .Y(D[13]) );
  MUX2X1 U315 ( .B(D_opp_sign[13]), .A(reg_4_out[13]), .S(n276), .Y(n113) );
  NAND2X1 U316 ( .A(n114), .B(n103), .Y(D[12]) );
  MUX2X1 U317 ( .B(D_opp_sign[12]), .A(reg_4_out[12]), .S(n276), .Y(n114) );
  NAND2X1 U318 ( .A(n115), .B(n103), .Y(D[11]) );
  MUX2X1 U319 ( .B(D_opp_sign[11]), .A(reg_4_out[11]), .S(n276), .Y(n115) );
  NAND2X1 U320 ( .A(n116), .B(n103), .Y(D[10]) );
  MUX2X1 U321 ( .B(D_opp_sign[10]), .A(reg_4_out[10]), .S(n276), .Y(n116) );
  NAND2X1 U322 ( .A(n117), .B(n103), .Y(D[0]) );
  NAND2X1 U323 ( .A(D_opp_sign[15]), .B(reg_4_out[15]), .Y(n103) );
  MUX2X1 U324 ( .B(D_opp_sign[0]), .A(reg_4_out[0]), .S(n276), .Y(n117) );
  NAND2X1 U325 ( .A(n118), .B(n119), .Y(C[9]) );
  MUX2X1 U326 ( .B(C_opp_sign[9]), .A(reg_3_out[9]), .S(n245), .Y(n118) );
  NAND2X1 U327 ( .A(n120), .B(n119), .Y(C[8]) );
  MUX2X1 U328 ( .B(C_opp_sign[8]), .A(reg_3_out[8]), .S(n245), .Y(n120) );
  NAND2X1 U329 ( .A(n121), .B(n119), .Y(C[7]) );
  MUX2X1 U330 ( .B(C_opp_sign[7]), .A(reg_3_out[7]), .S(n245), .Y(n121) );
  NAND2X1 U331 ( .A(n122), .B(n119), .Y(C[6]) );
  MUX2X1 U332 ( .B(C_opp_sign[6]), .A(reg_3_out[6]), .S(n245), .Y(n122) );
  NAND2X1 U333 ( .A(n123), .B(n119), .Y(C[5]) );
  MUX2X1 U334 ( .B(C_opp_sign[5]), .A(reg_3_out[5]), .S(n245), .Y(n123) );
  NAND2X1 U335 ( .A(n124), .B(n119), .Y(C[4]) );
  MUX2X1 U336 ( .B(C_opp_sign[4]), .A(reg_3_out[4]), .S(n245), .Y(n124) );
  NAND2X1 U337 ( .A(n125), .B(n119), .Y(C[3]) );
  MUX2X1 U338 ( .B(C_opp_sign[3]), .A(reg_3_out[3]), .S(n245), .Y(n125) );
  NAND2X1 U339 ( .A(n126), .B(n119), .Y(C[2]) );
  MUX2X1 U340 ( .B(C_opp_sign[2]), .A(reg_3_out[2]), .S(n245), .Y(n126) );
  NAND2X1 U341 ( .A(n127), .B(n119), .Y(C[1]) );
  MUX2X1 U342 ( .B(C_opp_sign[1]), .A(reg_3_out[1]), .S(n245), .Y(n127) );
  NAND2X1 U343 ( .A(n128), .B(n119), .Y(C[14]) );
  MUX2X1 U344 ( .B(C_opp_sign[14]), .A(reg_3_out[14]), .S(n245), .Y(n128) );
  NAND2X1 U345 ( .A(n129), .B(n119), .Y(C[13]) );
  MUX2X1 U346 ( .B(C_opp_sign[13]), .A(reg_3_out[13]), .S(n245), .Y(n129) );
  NAND2X1 U347 ( .A(n130), .B(n119), .Y(C[12]) );
  MUX2X1 U348 ( .B(C_opp_sign[12]), .A(reg_3_out[12]), .S(n245), .Y(n130) );
  NAND2X1 U349 ( .A(n131), .B(n119), .Y(C[11]) );
  MUX2X1 U350 ( .B(C_opp_sign[11]), .A(reg_3_out[11]), .S(n245), .Y(n131) );
  NAND2X1 U351 ( .A(n132), .B(n119), .Y(C[10]) );
  MUX2X1 U352 ( .B(C_opp_sign[10]), .A(reg_3_out[10]), .S(n245), .Y(n132) );
  NAND2X1 U353 ( .A(n133), .B(n119), .Y(C[0]) );
  NAND2X1 U354 ( .A(C_opp_sign[15]), .B(reg_3_out[15]), .Y(n119) );
  MUX2X1 U355 ( .B(C_opp_sign[0]), .A(reg_3_out[0]), .S(n245), .Y(n133) );
  NAND2X1 U356 ( .A(n134), .B(n135), .Y(A[9]) );
  MUX2X1 U357 ( .B(A_opp_sign[9]), .A(reg_1_out[9]), .S(n198), .Y(n134) );
  NAND2X1 U359 ( .A(n136), .B(n135), .Y(A[8]) );
  MUX2X1 U360 ( .B(A_opp_sign[8]), .A(reg_1_out[8]), .S(n198), .Y(n136) );
  NAND2X1 U361 ( .A(n137), .B(n135), .Y(A[7]) );
  MUX2X1 U362 ( .B(A_opp_sign[7]), .A(reg_1_out[7]), .S(n198), .Y(n137) );
  NAND2X1 U363 ( .A(n138), .B(n135), .Y(A[6]) );
  MUX2X1 U364 ( .B(A_opp_sign[6]), .A(reg_1_out[6]), .S(n198), .Y(n138) );
  NAND2X1 U365 ( .A(n139), .B(n135), .Y(A[5]) );
  MUX2X1 U366 ( .B(A_opp_sign[5]), .A(reg_1_out[5]), .S(n198), .Y(n139) );
  NAND2X1 U367 ( .A(n140), .B(n135), .Y(A[4]) );
  MUX2X1 U368 ( .B(A_opp_sign[4]), .A(reg_1_out[4]), .S(n198), .Y(n140) );
  NAND2X1 U369 ( .A(n141), .B(n135), .Y(A[3]) );
  MUX2X1 U370 ( .B(A_opp_sign[3]), .A(reg_1_out[3]), .S(n198), .Y(n141) );
  NAND2X1 U371 ( .A(n142), .B(n135), .Y(A[2]) );
  MUX2X1 U372 ( .B(A_opp_sign[2]), .A(reg_1_out[2]), .S(n198), .Y(n142) );
  NAND2X1 U373 ( .A(n143), .B(n135), .Y(A[1]) );
  MUX2X1 U374 ( .B(A_opp_sign[1]), .A(reg_1_out[1]), .S(n198), .Y(n143) );
  NAND2X1 U375 ( .A(n144), .B(n135), .Y(A[14]) );
  MUX2X1 U376 ( .B(A_opp_sign[14]), .A(reg_1_out[14]), .S(n198), .Y(n144) );
  NAND2X1 U377 ( .A(n145), .B(n135), .Y(A[13]) );
  MUX2X1 U378 ( .B(A_opp_sign[13]), .A(reg_1_out[13]), .S(n198), .Y(n145) );
  NAND2X1 U379 ( .A(n146), .B(n135), .Y(A[12]) );
  MUX2X1 U380 ( .B(A_opp_sign[12]), .A(reg_1_out[12]), .S(n198), .Y(n146) );
  NAND2X1 U381 ( .A(n147), .B(n135), .Y(A[11]) );
  MUX2X1 U382 ( .B(A_opp_sign[11]), .A(reg_1_out[11]), .S(n198), .Y(n147) );
  NAND2X1 U383 ( .A(n148), .B(n135), .Y(A[10]) );
  MUX2X1 U384 ( .B(A_opp_sign[10]), .A(reg_1_out[10]), .S(n198), .Y(n148) );
  NAND2X1 U385 ( .A(n149), .B(n135), .Y(A[0]) );
  NAND2X1 U386 ( .A(A_opp_sign[15]), .B(reg_1_out[15]), .Y(n135) );
  MUX2X1 U387 ( .B(A_opp_sign[0]), .A(reg_1_out[0]), .S(n198), .Y(n149) );
endmodule


module flex_buffer_NUM_BITS32_1 ( clk, n_rst, input_data, output_data );
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


module ud_flex_counter_NUM_CNT_BITS22_DW01_dec_0 ( A, SUM );
  input [22:0] A;
  output [22:0] SUM;
  wire   n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52;

  INVX2 U1 ( .A(n38), .Y(SUM[1]) );
  INVX2 U2 ( .A(n51), .Y(SUM[11]) );
  INVX2 U3 ( .A(n48), .Y(SUM[13]) );
  INVX2 U4 ( .A(n45), .Y(SUM[15]) );
  INVX2 U5 ( .A(n42), .Y(SUM[17]) );
  INVX2 U6 ( .A(n39), .Y(SUM[19]) );
  INVX2 U7 ( .A(n22), .Y(SUM[9]) );
  INVX2 U8 ( .A(n26), .Y(SUM[7]) );
  INVX2 U9 ( .A(n29), .Y(SUM[5]) );
  INVX2 U10 ( .A(n32), .Y(SUM[3]) );
  INVX2 U11 ( .A(A[0]), .Y(SUM[0]) );
  INVX2 U12 ( .A(A[2]), .Y(n12) );
  INVX2 U13 ( .A(A[4]), .Y(n13) );
  INVX2 U14 ( .A(A[6]), .Y(n14) );
  INVX2 U15 ( .A(A[8]), .Y(n15) );
  INVX2 U16 ( .A(A[10]), .Y(n16) );
  INVX2 U17 ( .A(A[12]), .Y(n17) );
  INVX2 U18 ( .A(A[14]), .Y(n18) );
  INVX2 U19 ( .A(A[16]), .Y(n19) );
  INVX2 U20 ( .A(A[18]), .Y(n20) );
  INVX2 U21 ( .A(A[20]), .Y(n21) );
  AOI21X1 U22 ( .A(n23), .B(A[9]), .C(n24), .Y(n22) );
  OAI21X1 U23 ( .A(n25), .B(n15), .C(n23), .Y(SUM[8]) );
  AOI21X1 U24 ( .A(n27), .B(A[7]), .C(n25), .Y(n26) );
  OAI21X1 U25 ( .A(n28), .B(n14), .C(n27), .Y(SUM[6]) );
  AOI21X1 U26 ( .A(n30), .B(A[5]), .C(n28), .Y(n29) );
  OAI21X1 U27 ( .A(n31), .B(n13), .C(n30), .Y(SUM[4]) );
  AOI21X1 U28 ( .A(n33), .B(A[3]), .C(n31), .Y(n32) );
  OAI21X1 U29 ( .A(n34), .B(n12), .C(n33), .Y(SUM[2]) );
  XOR2X1 U30 ( .A(A[22]), .B(n35), .Y(SUM[22]) );
  NOR2X1 U31 ( .A(A[21]), .B(n36), .Y(n35) );
  XNOR2X1 U32 ( .A(A[21]), .B(n36), .Y(SUM[21]) );
  OAI21X1 U33 ( .A(n37), .B(n21), .C(n36), .Y(SUM[20]) );
  NAND2X1 U34 ( .A(n37), .B(n21), .Y(n36) );
  AOI21X1 U35 ( .A(A[0]), .B(A[1]), .C(n34), .Y(n38) );
  AOI21X1 U36 ( .A(n40), .B(A[19]), .C(n37), .Y(n39) );
  NOR2X1 U37 ( .A(n40), .B(A[19]), .Y(n37) );
  OAI21X1 U38 ( .A(n41), .B(n20), .C(n40), .Y(SUM[18]) );
  NAND2X1 U39 ( .A(n41), .B(n20), .Y(n40) );
  AOI21X1 U40 ( .A(n43), .B(A[17]), .C(n41), .Y(n42) );
  NOR2X1 U41 ( .A(n43), .B(A[17]), .Y(n41) );
  OAI21X1 U42 ( .A(n44), .B(n19), .C(n43), .Y(SUM[16]) );
  NAND2X1 U43 ( .A(n44), .B(n19), .Y(n43) );
  AOI21X1 U44 ( .A(n46), .B(A[15]), .C(n44), .Y(n45) );
  NOR2X1 U45 ( .A(n46), .B(A[15]), .Y(n44) );
  OAI21X1 U46 ( .A(n47), .B(n18), .C(n46), .Y(SUM[14]) );
  NAND2X1 U47 ( .A(n47), .B(n18), .Y(n46) );
  AOI21X1 U48 ( .A(n49), .B(A[13]), .C(n47), .Y(n48) );
  NOR2X1 U49 ( .A(n49), .B(A[13]), .Y(n47) );
  OAI21X1 U50 ( .A(n50), .B(n17), .C(n49), .Y(SUM[12]) );
  NAND2X1 U51 ( .A(n50), .B(n17), .Y(n49) );
  AOI21X1 U52 ( .A(n52), .B(A[11]), .C(n50), .Y(n51) );
  NOR2X1 U53 ( .A(n52), .B(A[11]), .Y(n50) );
  OAI21X1 U54 ( .A(n24), .B(n16), .C(n52), .Y(SUM[10]) );
  NAND2X1 U55 ( .A(n24), .B(n16), .Y(n52) );
  NOR2X1 U56 ( .A(n23), .B(A[9]), .Y(n24) );
  NAND2X1 U57 ( .A(n25), .B(n15), .Y(n23) );
  NOR2X1 U58 ( .A(n27), .B(A[7]), .Y(n25) );
  NAND2X1 U59 ( .A(n28), .B(n14), .Y(n27) );
  NOR2X1 U60 ( .A(n30), .B(A[5]), .Y(n28) );
  NAND2X1 U61 ( .A(n31), .B(n13), .Y(n30) );
  NOR2X1 U62 ( .A(n33), .B(A[3]), .Y(n31) );
  NAND2X1 U63 ( .A(n34), .B(n12), .Y(n33) );
  NOR2X1 U64 ( .A(A[1]), .B(A[0]), .Y(n34) );
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


module ud_flex_counter_NUM_CNT_BITS22_DW01_inc_0 ( A, SUM );
  input [22:0] A;
  output [22:0] SUM;

  wire   [22:2] carry;

  HAX1 U1_1_21 ( .A(A[21]), .B(carry[21]), .YC(SUM[22]), .YS(SUM[21]) );
  HAX1 U1_1_20 ( .A(A[20]), .B(carry[20]), .YC(carry[21]), .YS(SUM[20]) );
  HAX1 U1_1_19 ( .A(A[19]), .B(carry[19]), .YC(carry[20]), .YS(SUM[19]) );
  HAX1 U1_1_18 ( .A(A[18]), .B(carry[18]), .YC(carry[19]), .YS(SUM[18]) );
  HAX1 U1_1_17 ( .A(A[17]), .B(carry[17]), .YC(carry[18]), .YS(SUM[17]) );
  HAX1 U1_1_16 ( .A(A[16]), .B(carry[16]), .YC(carry[17]), .YS(SUM[16]) );
  HAX1 U1_1_15 ( .A(A[15]), .B(carry[15]), .YC(carry[16]), .YS(SUM[15]) );
  HAX1 U1_1_14 ( .A(A[14]), .B(carry[14]), .YC(carry[15]), .YS(SUM[14]) );
  HAX1 U1_1_13 ( .A(A[13]), .B(carry[13]), .YC(carry[14]), .YS(SUM[13]) );
  HAX1 U1_1_12 ( .A(A[12]), .B(carry[12]), .YC(carry[13]), .YS(SUM[12]) );
  HAX1 U1_1_11 ( .A(A[11]), .B(carry[11]), .YC(carry[12]), .YS(SUM[11]) );
  HAX1 U1_1_10 ( .A(A[10]), .B(carry[10]), .YC(carry[11]), .YS(SUM[10]) );
  HAX1 U1_1_9 ( .A(A[9]), .B(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  HAX1 U1_1_8 ( .A(A[8]), .B(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  HAX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  HAX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
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
  BUFX2 U50 ( .A(a[22]), .Y(n2) );
  BUFX2 U51 ( .A(a[22]), .Y(n1) );
  INVX2 U52 ( .A(a[0]), .Y(n24) );
  INVX2 U53 ( .A(a[19]), .Y(n5) );
  INVX2 U54 ( .A(a[17]), .Y(n7) );
  INVX2 U55 ( .A(a[18]), .Y(n6) );
  INVX2 U56 ( .A(a[15]), .Y(n9) );
  INVX2 U57 ( .A(a[13]), .Y(n11) );
  INVX2 U58 ( .A(a[11]), .Y(n13) );
  INVX2 U59 ( .A(a[7]), .Y(n17) );
  INVX2 U60 ( .A(a[5]), .Y(n19) );
  INVX2 U61 ( .A(a[20]), .Y(n4) );
  INVX2 U62 ( .A(a[9]), .Y(n15) );
  INVX2 U63 ( .A(a[3]), .Y(n21) );
  INVX2 U64 ( .A(a[1]), .Y(n23) );
  INVX2 U65 ( .A(a[16]), .Y(n8) );
  INVX2 U66 ( .A(a[14]), .Y(n10) );
  INVX2 U67 ( .A(a[12]), .Y(n12) );
  INVX2 U68 ( .A(a[10]), .Y(n14) );
  INVX2 U69 ( .A(a[8]), .Y(n16) );
  INVX2 U70 ( .A(a[6]), .Y(n18) );
  INVX2 U71 ( .A(a[4]), .Y(n20) );
  INVX2 U72 ( .A(a[2]), .Y(n22) );
  INVX2 U73 ( .A(a[21]), .Y(n3) );
endmodule


module ud_flex_counter_NUM_CNT_BITS22 ( clk, n_rst, clear, up_count_enable, 
        down_count_enable, rollover_val, count_out, rollover_flag );
  input [21:0] rollover_val;
  output [21:0] count_out;
  input clk, n_rst, clear, up_count_enable, down_count_enable;
  output rollover_flag;
  wire   N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20, N21, N22,
         N23, N24, N25, N26, N27, N28, N29, N30, N31, N33, N34, N35, N36, N37,
         N38, N39, N40, N41, N42, N43, N44, N45, N46, N47, N48, N49, N50, N51,
         N52, N53, N54, N55, N59, N60, N61, N62, N63, N64, N65, N66, N67, N68,
         N69, N70, N71, N72, N73, N74, N75, N76, N77, N78, N79, N80, N81, N136,
         N137, N138, N139, N140, N141, N142, N143, N144, N145, N146, N147,
         N148, N149, N150, N151, N152, N153, N154, N155, N156, N157, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149, n1,
         n2, n4, n5, n6, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82,
         n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96,
         n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108,
         n109, n110, n111, n112, n113, n114, n115, n116, n117, n118, n119,
         n120, n121, n122, n123;
  tri   clear;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1;

  DFFSR \current_reg[0]  ( .D(n149), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        count_out[0]) );
  DFFSR \current_reg[22]  ( .D(n127), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  DFFSR \current_reg[21]  ( .D(n128), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[21]) );
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
  DFFSR \current_reg[17]  ( .D(n132), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        count_out[17]) );
  DFFSR \current_reg[18]  ( .D(n131), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        count_out[18]) );
  DFFSR \current_reg[19]  ( .D(n130), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        count_out[19]) );
  DFFSR \current_reg[20]  ( .D(n129), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        count_out[20]) );
  ud_flex_counter_NUM_CNT_BITS22_DW01_dec_0 sub_72 ( .A({rollover_flag, 
        count_out}), .SUM({N81, N80, N79, N78, N77, N76, N75, N74, N73, N72, 
        N71, N70, N69, N68, N67, N66, N65, N64, N63, N62, N61, N60, N59}) );
  ud_flex_counter_NUM_CNT_BITS22_DW01_dec_1 sub_60 ( .A({1'b0, rollover_val}), 
        .SUM({N55, N54, N53, N52, N51, N50, N49, N48, N47, N46, N45, N44, N43, 
        N42, N41, N40, N39, N38, N37, N36, N35, N34, N33}) );
  ud_flex_counter_NUM_CNT_BITS22_DW01_inc_0 add_54_aco ( .A({1'b0, N157, N156, 
        N155, N154, N153, N152, N151, N150, N149, N148, N147, N146, N145, N144, 
        N143, N142, N141, N140, N139, N138, N137, N136}), .SUM({N31, N30, N29, 
        N28, N27, N26, N25, N24, N23, N22, N21, N20, N19, N18, N17, N16, N15, 
        N14, N13, N12, N11, N10, N9}) );
  ud_flex_counter_NUM_CNT_BITS22_DW_mult_uns_1 mult_add_54_aco ( .a({
        rollover_flag, count_out}), .b(n123), .product({
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, N157, N156, N155, 
        N154, N153, N152, N151, N150, N149, N148, N147, N146, N145, N144, N143, 
        N142, N141, N140, N139, N138, N137, N136}) );
  INVX2 U27 ( .A(n84), .Y(n31) );
  BUFX2 U28 ( .A(n32), .Y(n1) );
  BUFX2 U29 ( .A(n30), .Y(n2) );
  BUFX2 U30 ( .A(n36), .Y(n4) );
  INVX1 U31 ( .A(rollover_flag), .Y(n123) );
  NAND2X1 U32 ( .A(n5), .B(n6), .Y(n149) );
  AOI22X1 U33 ( .A(rollover_val[0]), .B(n2), .C(N59), .D(n31), .Y(n6) );
  AOI21X1 U34 ( .A(N9), .B(n1), .C(n33), .Y(n5) );
  MUX2X1 U35 ( .B(n34), .A(n35), .S(n4), .Y(n33) );
  NAND3X1 U36 ( .A(n37), .B(rollover_flag), .C(n38), .Y(n34) );
  NAND2X1 U37 ( .A(n39), .B(n40), .Y(n148) );
  AOI22X1 U38 ( .A(rollover_val[1]), .B(n2), .C(N60), .D(n31), .Y(n40) );
  AOI22X1 U39 ( .A(n4), .B(count_out[1]), .C(N10), .D(n1), .Y(n39) );
  NAND2X1 U40 ( .A(n41), .B(n42), .Y(n147) );
  AOI22X1 U41 ( .A(rollover_val[2]), .B(n2), .C(N61), .D(n31), .Y(n42) );
  AOI22X1 U42 ( .A(n4), .B(count_out[2]), .C(N11), .D(n1), .Y(n41) );
  NAND2X1 U43 ( .A(n43), .B(n44), .Y(n146) );
  AOI22X1 U44 ( .A(rollover_val[3]), .B(n2), .C(N62), .D(n31), .Y(n44) );
  AOI22X1 U45 ( .A(n4), .B(count_out[3]), .C(N12), .D(n1), .Y(n43) );
  NAND2X1 U46 ( .A(n45), .B(n46), .Y(n145) );
  AOI22X1 U47 ( .A(rollover_val[4]), .B(n2), .C(N63), .D(n31), .Y(n46) );
  AOI22X1 U48 ( .A(n4), .B(count_out[4]), .C(N13), .D(n1), .Y(n45) );
  NAND2X1 U49 ( .A(n47), .B(n48), .Y(n144) );
  AOI22X1 U50 ( .A(rollover_val[5]), .B(n2), .C(N64), .D(n31), .Y(n48) );
  AOI22X1 U51 ( .A(n4), .B(count_out[5]), .C(N14), .D(n1), .Y(n47) );
  NAND2X1 U52 ( .A(n49), .B(n50), .Y(n143) );
  AOI22X1 U53 ( .A(rollover_val[6]), .B(n2), .C(N65), .D(n31), .Y(n50) );
  AOI22X1 U54 ( .A(n4), .B(count_out[6]), .C(N15), .D(n1), .Y(n49) );
  NAND2X1 U55 ( .A(n51), .B(n52), .Y(n142) );
  AOI22X1 U56 ( .A(rollover_val[7]), .B(n2), .C(N66), .D(n31), .Y(n52) );
  AOI22X1 U57 ( .A(n4), .B(count_out[7]), .C(N16), .D(n1), .Y(n51) );
  NAND2X1 U58 ( .A(n53), .B(n54), .Y(n141) );
  AOI22X1 U59 ( .A(rollover_val[8]), .B(n2), .C(N67), .D(n31), .Y(n54) );
  AOI22X1 U60 ( .A(n4), .B(count_out[8]), .C(N17), .D(n1), .Y(n53) );
  NAND2X1 U61 ( .A(n55), .B(n56), .Y(n140) );
  AOI22X1 U62 ( .A(rollover_val[9]), .B(n2), .C(N68), .D(n31), .Y(n56) );
  AOI22X1 U63 ( .A(n4), .B(count_out[9]), .C(N18), .D(n1), .Y(n55) );
  NAND2X1 U64 ( .A(n57), .B(n58), .Y(n139) );
  AOI22X1 U65 ( .A(rollover_val[10]), .B(n2), .C(N69), .D(n31), .Y(n58) );
  AOI22X1 U66 ( .A(n4), .B(count_out[10]), .C(N19), .D(n1), .Y(n57) );
  NAND2X1 U67 ( .A(n59), .B(n60), .Y(n138) );
  AOI22X1 U68 ( .A(rollover_val[11]), .B(n2), .C(N70), .D(n31), .Y(n60) );
  AOI22X1 U69 ( .A(n4), .B(count_out[11]), .C(N20), .D(n1), .Y(n59) );
  NAND2X1 U70 ( .A(n61), .B(n62), .Y(n137) );
  AOI22X1 U71 ( .A(rollover_val[12]), .B(n2), .C(N71), .D(n31), .Y(n62) );
  AOI22X1 U72 ( .A(n4), .B(count_out[12]), .C(N21), .D(n1), .Y(n61) );
  NAND2X1 U73 ( .A(n63), .B(n64), .Y(n136) );
  AOI22X1 U74 ( .A(rollover_val[13]), .B(n2), .C(N72), .D(n31), .Y(n64) );
  AOI22X1 U75 ( .A(n4), .B(count_out[13]), .C(N22), .D(n1), .Y(n63) );
  NAND2X1 U76 ( .A(n65), .B(n66), .Y(n135) );
  AOI22X1 U77 ( .A(rollover_val[14]), .B(n2), .C(N73), .D(n31), .Y(n66) );
  AOI22X1 U78 ( .A(n4), .B(count_out[14]), .C(N23), .D(n1), .Y(n65) );
  NAND2X1 U79 ( .A(n67), .B(n68), .Y(n134) );
  AOI22X1 U80 ( .A(rollover_val[15]), .B(n2), .C(N74), .D(n31), .Y(n68) );
  AOI22X1 U81 ( .A(n4), .B(count_out[15]), .C(N24), .D(n1), .Y(n67) );
  NAND2X1 U82 ( .A(n69), .B(n70), .Y(n133) );
  AOI22X1 U83 ( .A(rollover_val[16]), .B(n2), .C(N75), .D(n31), .Y(n70) );
  AOI22X1 U84 ( .A(n4), .B(count_out[16]), .C(N25), .D(n1), .Y(n69) );
  NAND2X1 U85 ( .A(n71), .B(n72), .Y(n132) );
  AOI22X1 U86 ( .A(rollover_val[17]), .B(n2), .C(N76), .D(n31), .Y(n72) );
  AOI22X1 U87 ( .A(n4), .B(count_out[17]), .C(N26), .D(n1), .Y(n71) );
  NAND2X1 U88 ( .A(n73), .B(n74), .Y(n131) );
  AOI22X1 U89 ( .A(rollover_val[18]), .B(n2), .C(N77), .D(n31), .Y(n74) );
  AOI22X1 U90 ( .A(n4), .B(count_out[18]), .C(N27), .D(n1), .Y(n73) );
  NAND2X1 U91 ( .A(n75), .B(n76), .Y(n130) );
  AOI22X1 U92 ( .A(rollover_val[19]), .B(n2), .C(N78), .D(n31), .Y(n76) );
  AOI22X1 U93 ( .A(n4), .B(count_out[19]), .C(N28), .D(n1), .Y(n75) );
  NAND2X1 U94 ( .A(n77), .B(n78), .Y(n129) );
  AOI22X1 U95 ( .A(rollover_val[20]), .B(n2), .C(N79), .D(n31), .Y(n78) );
  AOI22X1 U96 ( .A(n4), .B(count_out[20]), .C(N29), .D(n1), .Y(n77) );
  NAND2X1 U97 ( .A(n79), .B(n80), .Y(n128) );
  AOI22X1 U98 ( .A(rollover_val[21]), .B(n2), .C(N80), .D(n31), .Y(n80) );
  AOI22X1 U99 ( .A(n4), .B(count_out[21]), .C(N30), .D(n1), .Y(n79) );
  NAND2X1 U100 ( .A(n81), .B(n82), .Y(n127) );
  AOI21X1 U101 ( .A(N81), .B(n31), .C(n2), .Y(n82) );
  NOR3X1 U102 ( .A(n83), .B(n4), .C(n37), .Y(n30) );
  NAND3X1 U103 ( .A(n38), .B(n37), .C(n85), .Y(n84) );
  NOR2X1 U104 ( .A(rollover_flag), .B(n4), .Y(n85) );
  NAND3X1 U105 ( .A(n86), .B(n87), .C(n88), .Y(n37) );
  AND2X1 U106 ( .A(n89), .B(n90), .Y(n88) );
  NOR2X1 U107 ( .A(n91), .B(n92), .Y(n90) );
  NAND3X1 U108 ( .A(n93), .B(n94), .C(n95), .Y(n92) );
  XNOR2X1 U109 ( .A(count_out[3]), .B(N36), .Y(n95) );
  XNOR2X1 U110 ( .A(count_out[4]), .B(N37), .Y(n94) );
  XNOR2X1 U111 ( .A(count_out[2]), .B(N35), .Y(n93) );
  NAND2X1 U112 ( .A(n96), .B(n97), .Y(n91) );
  XOR2X1 U113 ( .A(n35), .B(N33), .Y(n97) );
  INVX1 U114 ( .A(count_out[0]), .Y(n35) );
  NOR2X1 U115 ( .A(N55), .B(n98), .Y(n96) );
  XOR2X1 U116 ( .A(count_out[1]), .B(N34), .Y(n98) );
  NOR2X1 U117 ( .A(n99), .B(n100), .Y(n89) );
  NAND3X1 U118 ( .A(n101), .B(n102), .C(n103), .Y(n100) );
  XNOR2X1 U119 ( .A(count_out[9]), .B(N42), .Y(n103) );
  XNOR2X1 U120 ( .A(count_out[10]), .B(N43), .Y(n102) );
  XNOR2X1 U121 ( .A(count_out[8]), .B(N41), .Y(n101) );
  NAND3X1 U122 ( .A(n104), .B(n105), .C(n106), .Y(n99) );
  XNOR2X1 U123 ( .A(count_out[6]), .B(N39), .Y(n106) );
  XNOR2X1 U124 ( .A(count_out[7]), .B(N40), .Y(n105) );
  XNOR2X1 U125 ( .A(count_out[5]), .B(N38), .Y(n104) );
  NOR2X1 U126 ( .A(n107), .B(n108), .Y(n87) );
  NAND3X1 U127 ( .A(n109), .B(n110), .C(n111), .Y(n108) );
  XNOR2X1 U128 ( .A(count_out[15]), .B(N48), .Y(n111) );
  XNOR2X1 U129 ( .A(count_out[16]), .B(N49), .Y(n110) );
  XNOR2X1 U130 ( .A(count_out[14]), .B(N47), .Y(n109) );
  NAND3X1 U131 ( .A(n112), .B(n113), .C(n114), .Y(n107) );
  XNOR2X1 U132 ( .A(count_out[12]), .B(N45), .Y(n114) );
  XNOR2X1 U133 ( .A(count_out[13]), .B(N46), .Y(n113) );
  XNOR2X1 U134 ( .A(count_out[11]), .B(N44), .Y(n112) );
  NOR2X1 U135 ( .A(n115), .B(n116), .Y(n86) );
  NAND2X1 U136 ( .A(n117), .B(n118), .Y(n116) );
  XNOR2X1 U137 ( .A(count_out[20]), .B(N53), .Y(n118) );
  XNOR2X1 U138 ( .A(count_out[21]), .B(N54), .Y(n117) );
  NAND3X1 U139 ( .A(n119), .B(n120), .C(n121), .Y(n115) );
  XNOR2X1 U140 ( .A(count_out[18]), .B(N51), .Y(n121) );
  XNOR2X1 U141 ( .A(count_out[19]), .B(N52), .Y(n120) );
  XNOR2X1 U142 ( .A(count_out[17]), .B(N50), .Y(n119) );
  AOI22X1 U143 ( .A(n4), .B(rollover_flag), .C(N31), .D(n1), .Y(n81) );
  NOR2X1 U144 ( .A(n122), .B(clear), .Y(n32) );
  INVX1 U145 ( .A(up_count_enable), .Y(n122) );
  NOR2X1 U146 ( .A(down_count_enable), .B(n83), .Y(n36) );
  INVX1 U147 ( .A(n38), .Y(n83) );
  NOR2X1 U148 ( .A(clear), .B(up_count_enable), .Y(n38) );
endmodule


module fader_state ( clk, n_reset, clear, fad_enable, countVal );
  output [21:0] countVal;
  input clk, n_reset, clear, fad_enable;
  wire   n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40;
  wire   [3:0] state;
  wire   [1:0] nxt_state;
  tri   clear;

  DFFSR \state_reg[0]  ( .D(nxt_state[0]), .CLK(clk), .R(n_reset), .S(1'b1), 
        .Q(state[0]) );
  DFFSR \state_reg[1]  ( .D(nxt_state[1]), .CLK(clk), .R(n_reset), .S(1'b1), 
        .Q(state[1]) );
  ud_flex_counter_NUM_CNT_BITS22 DUT ( .clk(clk), .n_rst(n_reset), .clear(
        clear), .up_count_enable(n39), .down_count_enable(n40), .rollover_val(
        {1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 
        1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1}), 
        .count_out(countVal) );
  OAI21X1 U5 ( .A(n3), .B(n4), .C(n5), .Y(nxt_state[1]) );
  NAND3X1 U6 ( .A(n6), .B(n7), .C(fad_enable), .Y(n5) );
  INVX1 U7 ( .A(n8), .Y(n3) );
  OAI21X1 U8 ( .A(n4), .B(n8), .C(n9), .Y(nxt_state[0]) );
  OAI21X1 U9 ( .A(n10), .B(n11), .C(n39), .Y(n9) );
  NAND2X1 U10 ( .A(n12), .B(n13), .Y(n11) );
  NOR2X1 U11 ( .A(n14), .B(n15), .Y(n13) );
  NAND3X1 U12 ( .A(countVal[3]), .B(countVal[2]), .C(countVal[4]), .Y(n15) );
  NAND3X1 U13 ( .A(countVal[1]), .B(countVal[19]), .C(countVal[20]), .Y(n14)
         );
  NOR2X1 U14 ( .A(n16), .B(n17), .Y(n12) );
  NAND2X1 U15 ( .A(countVal[9]), .B(countVal[8]), .Y(n17) );
  NAND3X1 U16 ( .A(countVal[6]), .B(countVal[5]), .C(countVal[7]), .Y(n16) );
  NAND2X1 U17 ( .A(n18), .B(n19), .Y(n10) );
  NOR2X1 U18 ( .A(n20), .B(n21), .Y(n19) );
  NAND3X1 U19 ( .A(countVal[12]), .B(countVal[11]), .C(countVal[13]), .Y(n21)
         );
  NAND3X1 U20 ( .A(countVal[0]), .B(n22), .C(countVal[10]), .Y(n20) );
  NOR2X1 U21 ( .A(n23), .B(n24), .Y(n18) );
  NAND2X1 U22 ( .A(countVal[18]), .B(countVal[17]), .Y(n24) );
  NAND3X1 U23 ( .A(countVal[15]), .B(countVal[14]), .C(countVal[16]), .Y(n23)
         );
  NAND3X1 U24 ( .A(n25), .B(n26), .C(n27), .Y(n8) );
  NOR2X1 U25 ( .A(n28), .B(n29), .Y(n27) );
  NAND3X1 U26 ( .A(n30), .B(n22), .C(n31), .Y(n29) );
  NOR2X1 U27 ( .A(countVal[20]), .B(countVal[1]), .Y(n31) );
  INVX1 U28 ( .A(countVal[21]), .Y(n22) );
  NOR2X1 U29 ( .A(countVal[3]), .B(countVal[2]), .Y(n30) );
  NAND2X1 U30 ( .A(n32), .B(n33), .Y(n28) );
  NOR3X1 U31 ( .A(countVal[5]), .B(countVal[6]), .C(countVal[4]), .Y(n33) );
  NOR3X1 U32 ( .A(countVal[8]), .B(countVal[9]), .C(countVal[7]), .Y(n32) );
  AND2X1 U33 ( .A(n34), .B(n35), .Y(n26) );
  NOR3X1 U34 ( .A(countVal[15]), .B(countVal[16]), .C(countVal[14]), .Y(n35)
         );
  NOR3X1 U35 ( .A(countVal[18]), .B(countVal[19]), .C(countVal[17]), .Y(n34)
         );
  NOR2X1 U36 ( .A(n36), .B(n37), .Y(n25) );
  OR2X1 U37 ( .A(countVal[0]), .B(countVal[10]), .Y(n37) );
  INVX1 U38 ( .A(n38), .Y(n36) );
  NOR3X1 U39 ( .A(countVal[12]), .B(countVal[13]), .C(countVal[11]), .Y(n38)
         );
  INVX1 U40 ( .A(n40), .Y(n4) );
  NOR2X1 U41 ( .A(n6), .B(state[1]), .Y(n39) );
  INVX1 U42 ( .A(state[0]), .Y(n6) );
  NOR2X1 U43 ( .A(n7), .B(state[0]), .Y(n40) );
  INVX1 U44 ( .A(state[1]), .Y(n7) );
endmodule


module cla_4bit_39 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_38 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_37 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_36 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_16bit_9 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, cout, n8, n9, n10;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  cla_4bit_39 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_38 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n10), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_37 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n9), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_36 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n8), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  NOR2X1 U1 ( .A(n1), .B(n2), .Y(pg) );
  NAND2X1 U2 ( .A(p[3]), .B(p[2]), .Y(n2) );
  NAND2X1 U3 ( .A(p[1]), .B(p[0]), .Y(n1) );
  INVX1 U4 ( .A(n3), .Y(cout) );
  AOI21X1 U5 ( .A(n8), .B(p[3]), .C(g[3]), .Y(n3) );
  INVX1 U6 ( .A(n4), .Y(n8) );
  AOI21X1 U7 ( .A(n9), .B(p[2]), .C(g[2]), .Y(n4) );
  INVX1 U8 ( .A(n5), .Y(n9) );
  AOI21X1 U9 ( .A(n10), .B(p[1]), .C(g[1]), .Y(n5) );
  INVX1 U10 ( .A(n6), .Y(n10) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n6) );
endmodule


module cla_4bit_35 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_34 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_33 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_32 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_16bit_8 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, cout, n8, n9, n10;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  cla_4bit_35 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_34 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n10), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_33 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n9), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_32 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n8), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  NOR2X1 U1 ( .A(n1), .B(n2), .Y(pg) );
  NAND2X1 U2 ( .A(p[3]), .B(p[2]), .Y(n2) );
  NAND2X1 U3 ( .A(p[1]), .B(p[0]), .Y(n1) );
  INVX1 U4 ( .A(n3), .Y(cout) );
  AOI21X1 U5 ( .A(n8), .B(p[3]), .C(g[3]), .Y(n3) );
  INVX1 U6 ( .A(n4), .Y(n8) );
  AOI21X1 U7 ( .A(n9), .B(p[2]), .C(g[2]), .Y(n4) );
  INVX1 U8 ( .A(n5), .Y(n9) );
  AOI21X1 U9 ( .A(n10), .B(p[1]), .C(g[1]), .Y(n5) );
  INVX1 U10 ( .A(n6), .Y(n10) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n6) );
endmodule


module adder_1bit_11 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2;

  XOR2X1 U1 ( .A(carry_in), .B(n1), .Y(sum) );
  INVX1 U2 ( .A(n2), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n1), .D(carry_in), .Y(n2) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n1) );
endmodule


module cla_4bit_31 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_30 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_29 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_28 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_16bit_7 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, cout, n8, n9, n10;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  cla_4bit_31 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_30 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n10), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_29 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n9), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_28 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n8), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  NOR2X1 U1 ( .A(n1), .B(n2), .Y(pg) );
  NAND2X1 U2 ( .A(p[3]), .B(p[2]), .Y(n2) );
  NAND2X1 U3 ( .A(p[1]), .B(p[0]), .Y(n1) );
  INVX1 U4 ( .A(n3), .Y(cout) );
  AOI21X1 U5 ( .A(n8), .B(p[3]), .C(g[3]), .Y(n3) );
  INVX1 U6 ( .A(n4), .Y(n8) );
  AOI21X1 U7 ( .A(n9), .B(p[2]), .C(g[2]), .Y(n4) );
  INVX1 U8 ( .A(n5), .Y(n9) );
  AOI21X1 U9 ( .A(n10), .B(p[1]), .C(g[1]), .Y(n5) );
  INVX1 U10 ( .A(n6), .Y(n10) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n6) );
endmodule


module adder_1bit_10 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2;

  XOR2X1 U1 ( .A(carry_in), .B(n1), .Y(sum) );
  INVX1 U2 ( .A(n2), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n1), .D(carry_in), .Y(n2) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n1) );
endmodule


module adder_1bit_9 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2;

  XOR2X1 U1 ( .A(carry_in), .B(n1), .Y(sum) );
  INVX1 U2 ( .A(n2), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n1), .D(carry_in), .Y(n2) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n1) );
endmodule


module cla_4bit_27 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_26 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_25 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_24 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_16bit_6 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, cout, n8, n9, n10;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  cla_4bit_27 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_26 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n10), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_25 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n9), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_24 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n8), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  NOR2X1 U1 ( .A(n1), .B(n2), .Y(pg) );
  NAND2X1 U2 ( .A(p[3]), .B(p[2]), .Y(n2) );
  NAND2X1 U3 ( .A(p[1]), .B(p[0]), .Y(n1) );
  INVX1 U4 ( .A(n3), .Y(cout) );
  AOI21X1 U5 ( .A(n8), .B(p[3]), .C(g[3]), .Y(n3) );
  INVX1 U6 ( .A(n4), .Y(n8) );
  AOI21X1 U7 ( .A(n9), .B(p[2]), .C(g[2]), .Y(n4) );
  INVX1 U8 ( .A(n5), .Y(n9) );
  AOI21X1 U9 ( .A(n10), .B(p[1]), .C(g[1]), .Y(n5) );
  INVX1 U10 ( .A(n6), .Y(n10) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n6) );
endmodule


module adder_1bit_8 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2;

  XOR2X1 U1 ( .A(carry_in), .B(n1), .Y(sum) );
  INVX1 U2 ( .A(n2), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n1), .D(carry_in), .Y(n2) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n1) );
endmodule


module adder_1bit_7 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2;

  XOR2X1 U1 ( .A(carry_in), .B(n1), .Y(sum) );
  INVX1 U2 ( .A(n2), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n1), .D(carry_in), .Y(n2) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n1) );
endmodule


module adder_1bit_6 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2;

  XOR2X1 U1 ( .A(carry_in), .B(n1), .Y(sum) );
  INVX1 U2 ( .A(n2), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n1), .D(carry_in), .Y(n2) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n1) );
endmodule


module cla_4bit_23 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_22 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_21 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_20 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_16bit_5 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, cout, n8, n9, n10;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  cla_4bit_23 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_22 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n10), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_21 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n9), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_20 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n8), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  NOR2X1 U1 ( .A(n1), .B(n2), .Y(pg) );
  NAND2X1 U2 ( .A(p[3]), .B(p[2]), .Y(n2) );
  NAND2X1 U3 ( .A(p[1]), .B(p[0]), .Y(n1) );
  INVX1 U4 ( .A(n3), .Y(cout) );
  AOI21X1 U5 ( .A(n8), .B(p[3]), .C(g[3]), .Y(n3) );
  INVX1 U6 ( .A(n4), .Y(n8) );
  AOI21X1 U7 ( .A(n9), .B(p[2]), .C(g[2]), .Y(n4) );
  INVX1 U8 ( .A(n5), .Y(n9) );
  AOI21X1 U9 ( .A(n10), .B(p[1]), .C(g[1]), .Y(n5) );
  INVX1 U10 ( .A(n6), .Y(n10) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n6) );
endmodule


module cla_4bit_113 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
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
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75,
         n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92;
  wire   [15:0] in_opp_sign;
  wire   [15:0] ab0;
  wire   [15:1] ab1;
  wire   [17:2] ab2;
  wire   [18:3] ab3;
  wire   [7:0] couts;
  wire   [19:0] out_neg;

  cla_16bit_9 AOPS1 ( .a({n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, 
        n87, n88, n89, n90, n91, n92}), .b({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .cin(
        1'b1), .sum(in_opp_sign) );
  cla_16bit_8 A1 ( .a({1'b0, ab0[14:0]}), .b({ab1, 1'b0}), .cin(1'b0), .cout(
        couts[0]), .sum({\sums[0][15] , \sums[0][14] , \sums[0][13] , 
        \sums[0][12] , \sums[0][11] , \sums[0][10] , \sums[0][9] , 
        \sums[0][8] , \sums[0][7] , \sums[0][6] , \sums[0][5] , \sums[0][4] , 
        \sums[0][3] , \sums[0][2] , \sums[0][1] , \sums[0][0] }) );
  adder_1bit_11 A1_1 ( .a(1'b0), .b(ab2[16]), .carry_in(couts[0]), .sum(
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
  adder_1bit_10 A2_1 ( .a(\sums[0][16] ), .b(ab2[16]), .carry_in(couts[1]), 
        .sum(\sums[1][16] ), .carry_out(couts[2]) );
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
  cla_16bit_5 A4 ( .a({n57, n58, n59, n60, n65, n66, n67, n68, n69, n70, n71, 
        n72, n73, n74, n75, n76}), .b({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .cin(
        1'b1), .cout(couts[7]), .sum(out_neg[15:0]) );
  cla_4bit_113 A5 ( .a({n64, n63, n62, n61}), .b({1'b0, 1'b0, 1'b0, 1'b0}), 
        .cin(couts[7]), .sum(out_neg[19:16]) );
  INVX2 U3 ( .A(b[3]), .Y(n22) );
  INVX2 U4 ( .A(b[2]), .Y(n37) );
  INVX2 U5 ( .A(b[1]), .Y(n38) );
  INVX2 U6 ( .A(b[0]), .Y(n39) );
  INVX4 U7 ( .A(a[15]), .Y(n77) );
  INVX1 U8 ( .A(n1), .Y(product[9]) );
  MUX2X1 U9 ( .B(out_neg[9]), .A(\sums[2][9] ), .S(n77), .Y(n1) );
  INVX1 U10 ( .A(n2), .Y(product[8]) );
  MUX2X1 U11 ( .B(out_neg[8]), .A(\sums[2][8] ), .S(n77), .Y(n2) );
  INVX1 U12 ( .A(n3), .Y(product[7]) );
  MUX2X1 U13 ( .B(out_neg[7]), .A(\sums[2][7] ), .S(n77), .Y(n3) );
  INVX1 U14 ( .A(n4), .Y(product[6]) );
  MUX2X1 U15 ( .B(out_neg[6]), .A(\sums[2][6] ), .S(n77), .Y(n4) );
  INVX1 U16 ( .A(n5), .Y(product[5]) );
  MUX2X1 U17 ( .B(out_neg[5]), .A(\sums[2][5] ), .S(n77), .Y(n5) );
  INVX1 U18 ( .A(n6), .Y(product[4]) );
  MUX2X1 U19 ( .B(out_neg[4]), .A(\sums[2][4] ), .S(n77), .Y(n6) );
  INVX1 U20 ( .A(n7), .Y(product[3]) );
  MUX2X1 U21 ( .B(out_neg[3]), .A(\sums[2][3] ), .S(n77), .Y(n7) );
  INVX1 U22 ( .A(n8), .Y(product[2]) );
  MUX2X1 U23 ( .B(out_neg[2]), .A(\sums[2][2] ), .S(n77), .Y(n8) );
  INVX1 U24 ( .A(n9), .Y(product[1]) );
  MUX2X1 U25 ( .B(out_neg[1]), .A(\sums[2][1] ), .S(n77), .Y(n9) );
  INVX1 U26 ( .A(n10), .Y(product[19]) );
  MUX2X1 U27 ( .B(out_neg[19]), .A(couts[6]), .S(n77), .Y(n10) );
  INVX1 U28 ( .A(n11), .Y(product[18]) );
  MUX2X1 U29 ( .B(out_neg[18]), .A(\sums[2][18] ), .S(n77), .Y(n11) );
  INVX1 U30 ( .A(n12), .Y(product[17]) );
  MUX2X1 U31 ( .B(out_neg[17]), .A(\sums[2][17] ), .S(n77), .Y(n12) );
  INVX1 U32 ( .A(n13), .Y(product[16]) );
  MUX2X1 U33 ( .B(out_neg[16]), .A(\sums[2][16] ), .S(n77), .Y(n13) );
  INVX1 U34 ( .A(n14), .Y(product[15]) );
  MUX2X1 U35 ( .B(out_neg[15]), .A(\sums[2][15] ), .S(n77), .Y(n14) );
  INVX1 U36 ( .A(n15), .Y(product[14]) );
  MUX2X1 U37 ( .B(out_neg[14]), .A(\sums[2][14] ), .S(n77), .Y(n15) );
  INVX1 U38 ( .A(n16), .Y(product[13]) );
  MUX2X1 U39 ( .B(out_neg[13]), .A(\sums[2][13] ), .S(n77), .Y(n16) );
  INVX1 U40 ( .A(n17), .Y(product[12]) );
  MUX2X1 U41 ( .B(out_neg[12]), .A(\sums[2][12] ), .S(n77), .Y(n17) );
  INVX1 U42 ( .A(n18), .Y(product[11]) );
  MUX2X1 U43 ( .B(out_neg[11]), .A(\sums[2][11] ), .S(n77), .Y(n18) );
  INVX1 U44 ( .A(n19), .Y(product[10]) );
  MUX2X1 U45 ( .B(out_neg[10]), .A(\sums[2][10] ), .S(n77), .Y(n19) );
  INVX1 U46 ( .A(n20), .Y(product[0]) );
  MUX2X1 U47 ( .B(out_neg[0]), .A(\sums[2][0] ), .S(n77), .Y(n20) );
  INVX1 U48 ( .A(\sums[2][15] ), .Y(n57) );
  INVX1 U49 ( .A(\sums[2][14] ), .Y(n58) );
  INVX1 U50 ( .A(\sums[2][13] ), .Y(n59) );
  INVX1 U51 ( .A(\sums[2][12] ), .Y(n60) );
  INVX1 U52 ( .A(\sums[2][16] ), .Y(n61) );
  INVX1 U53 ( .A(\sums[2][17] ), .Y(n62) );
  INVX1 U54 ( .A(\sums[2][18] ), .Y(n63) );
  INVX1 U55 ( .A(couts[6]), .Y(n64) );
  INVX1 U56 ( .A(\sums[2][11] ), .Y(n65) );
  INVX1 U57 ( .A(\sums[2][10] ), .Y(n66) );
  INVX1 U58 ( .A(\sums[2][9] ), .Y(n67) );
  INVX1 U59 ( .A(\sums[2][8] ), .Y(n68) );
  INVX1 U60 ( .A(\sums[2][7] ), .Y(n69) );
  INVX1 U61 ( .A(\sums[2][6] ), .Y(n70) );
  INVX1 U62 ( .A(\sums[2][5] ), .Y(n71) );
  INVX1 U63 ( .A(\sums[2][4] ), .Y(n72) );
  INVX1 U64 ( .A(\sums[2][3] ), .Y(n73) );
  INVX1 U65 ( .A(\sums[2][2] ), .Y(n74) );
  INVX1 U66 ( .A(\sums[2][1] ), .Y(n75) );
  INVX1 U67 ( .A(\sums[2][0] ), .Y(n76) );
  INVX1 U68 ( .A(a[14]), .Y(n78) );
  INVX1 U69 ( .A(a[13]), .Y(n79) );
  INVX1 U70 ( .A(a[12]), .Y(n80) );
  INVX1 U71 ( .A(a[11]), .Y(n81) );
  INVX1 U72 ( .A(a[10]), .Y(n82) );
  INVX1 U73 ( .A(a[9]), .Y(n83) );
  INVX1 U74 ( .A(a[8]), .Y(n84) );
  INVX1 U75 ( .A(a[7]), .Y(n85) );
  INVX1 U76 ( .A(a[6]), .Y(n86) );
  INVX1 U77 ( .A(a[5]), .Y(n87) );
  INVX1 U78 ( .A(a[4]), .Y(n88) );
  INVX1 U79 ( .A(a[3]), .Y(n89) );
  INVX1 U80 ( .A(a[2]), .Y(n90) );
  INVX1 U81 ( .A(a[1]), .Y(n91) );
  INVX1 U82 ( .A(a[0]), .Y(n92) );
  NOR2X1 U83 ( .A(n21), .B(n22), .Y(ab3[9]) );
  NOR2X1 U84 ( .A(n23), .B(n22), .Y(ab3[8]) );
  NOR2X1 U85 ( .A(n24), .B(n22), .Y(ab3[7]) );
  NOR2X1 U86 ( .A(n25), .B(n22), .Y(ab3[6]) );
  NOR2X1 U87 ( .A(n26), .B(n22), .Y(ab3[5]) );
  NOR2X1 U88 ( .A(n27), .B(n22), .Y(ab3[4]) );
  NOR2X1 U89 ( .A(n28), .B(n22), .Y(ab3[3]) );
  NOR2X1 U90 ( .A(n29), .B(n22), .Y(ab3[17]) );
  NOR2X1 U91 ( .A(n30), .B(n22), .Y(ab3[16]) );
  NOR2X1 U92 ( .A(n31), .B(n22), .Y(ab3[15]) );
  NOR2X1 U93 ( .A(n32), .B(n22), .Y(ab3[14]) );
  NOR2X1 U94 ( .A(n33), .B(n22), .Y(ab3[13]) );
  NOR2X1 U95 ( .A(n34), .B(n22), .Y(ab3[12]) );
  NOR2X1 U96 ( .A(n35), .B(n22), .Y(ab3[11]) );
  NOR2X1 U97 ( .A(n36), .B(n22), .Y(ab3[10]) );
  NOR2X1 U98 ( .A(n36), .B(n37), .Y(ab2[9]) );
  NOR2X1 U99 ( .A(n21), .B(n37), .Y(ab2[8]) );
  NOR2X1 U100 ( .A(n23), .B(n37), .Y(ab2[7]) );
  NOR2X1 U101 ( .A(n24), .B(n37), .Y(ab2[6]) );
  NOR2X1 U102 ( .A(n25), .B(n37), .Y(ab2[5]) );
  NOR2X1 U103 ( .A(n26), .B(n37), .Y(ab2[4]) );
  NOR2X1 U104 ( .A(n27), .B(n37), .Y(ab2[3]) );
  NOR2X1 U105 ( .A(n28), .B(n37), .Y(ab2[2]) );
  NOR2X1 U106 ( .A(n29), .B(n37), .Y(ab2[16]) );
  NOR2X1 U107 ( .A(n30), .B(n37), .Y(ab2[15]) );
  NOR2X1 U108 ( .A(n31), .B(n37), .Y(ab2[14]) );
  NOR2X1 U109 ( .A(n32), .B(n37), .Y(ab2[13]) );
  NOR2X1 U110 ( .A(n33), .B(n37), .Y(ab2[12]) );
  NOR2X1 U111 ( .A(n34), .B(n37), .Y(ab2[11]) );
  NOR2X1 U112 ( .A(n35), .B(n37), .Y(ab2[10]) );
  NOR2X1 U113 ( .A(n35), .B(n38), .Y(ab1[9]) );
  NOR2X1 U114 ( .A(n36), .B(n38), .Y(ab1[8]) );
  NOR2X1 U115 ( .A(n21), .B(n38), .Y(ab1[7]) );
  NOR2X1 U116 ( .A(n23), .B(n38), .Y(ab1[6]) );
  NOR2X1 U117 ( .A(n24), .B(n38), .Y(ab1[5]) );
  NOR2X1 U118 ( .A(n25), .B(n38), .Y(ab1[4]) );
  NOR2X1 U119 ( .A(n26), .B(n38), .Y(ab1[3]) );
  NOR2X1 U120 ( .A(n27), .B(n38), .Y(ab1[2]) );
  NOR2X1 U121 ( .A(n28), .B(n38), .Y(ab1[1]) );
  NOR2X1 U122 ( .A(n29), .B(n38), .Y(ab1[15]) );
  NOR2X1 U123 ( .A(n30), .B(n38), .Y(ab1[14]) );
  NOR2X1 U124 ( .A(n31), .B(n38), .Y(ab1[13]) );
  NOR2X1 U125 ( .A(n32), .B(n38), .Y(ab1[12]) );
  NOR2X1 U126 ( .A(n33), .B(n38), .Y(ab1[11]) );
  NOR2X1 U127 ( .A(n34), .B(n38), .Y(ab1[10]) );
  NOR2X1 U128 ( .A(n34), .B(n39), .Y(ab0[9]) );
  AND2X1 U129 ( .A(n40), .B(n42), .Y(n34) );
  MUX2X1 U130 ( .B(in_opp_sign[9]), .A(a[9]), .S(n77), .Y(n40) );
  NOR2X1 U131 ( .A(n35), .B(n39), .Y(ab0[8]) );
  AND2X1 U132 ( .A(n43), .B(n42), .Y(n35) );
  MUX2X1 U133 ( .B(in_opp_sign[8]), .A(a[8]), .S(n77), .Y(n43) );
  NOR2X1 U134 ( .A(n36), .B(n39), .Y(ab0[7]) );
  AND2X1 U135 ( .A(n44), .B(n42), .Y(n36) );
  MUX2X1 U136 ( .B(in_opp_sign[7]), .A(a[7]), .S(n77), .Y(n44) );
  NOR2X1 U137 ( .A(n21), .B(n39), .Y(ab0[6]) );
  AND2X1 U138 ( .A(n45), .B(n42), .Y(n21) );
  MUX2X1 U139 ( .B(in_opp_sign[6]), .A(a[6]), .S(n77), .Y(n45) );
  NOR2X1 U140 ( .A(n23), .B(n39), .Y(ab0[5]) );
  AND2X1 U141 ( .A(n46), .B(n42), .Y(n23) );
  MUX2X1 U142 ( .B(in_opp_sign[5]), .A(a[5]), .S(n77), .Y(n46) );
  NOR2X1 U143 ( .A(n24), .B(n39), .Y(ab0[4]) );
  AND2X1 U144 ( .A(n47), .B(n42), .Y(n24) );
  MUX2X1 U145 ( .B(in_opp_sign[4]), .A(a[4]), .S(n77), .Y(n47) );
  NOR2X1 U146 ( .A(n25), .B(n39), .Y(ab0[3]) );
  AND2X1 U147 ( .A(n48), .B(n42), .Y(n25) );
  MUX2X1 U148 ( .B(in_opp_sign[3]), .A(a[3]), .S(n77), .Y(n48) );
  NOR2X1 U149 ( .A(n26), .B(n39), .Y(ab0[2]) );
  AND2X1 U150 ( .A(n49), .B(n42), .Y(n26) );
  MUX2X1 U151 ( .B(in_opp_sign[2]), .A(a[2]), .S(n77), .Y(n49) );
  NOR2X1 U152 ( .A(n27), .B(n39), .Y(ab0[1]) );
  AND2X1 U153 ( .A(n50), .B(n42), .Y(n27) );
  MUX2X1 U154 ( .B(in_opp_sign[1]), .A(a[1]), .S(n77), .Y(n50) );
  NOR2X1 U156 ( .A(n29), .B(n39), .Y(ab0[14]) );
  AND2X1 U157 ( .A(n51), .B(n42), .Y(n29) );
  MUX2X1 U158 ( .B(in_opp_sign[14]), .A(a[14]), .S(n77), .Y(n51) );
  NOR2X1 U159 ( .A(n30), .B(n39), .Y(ab0[13]) );
  AND2X1 U160 ( .A(n52), .B(n42), .Y(n30) );
  MUX2X1 U161 ( .B(in_opp_sign[13]), .A(a[13]), .S(n77), .Y(n52) );
  NOR2X1 U162 ( .A(n31), .B(n39), .Y(ab0[12]) );
  AND2X1 U163 ( .A(n53), .B(n42), .Y(n31) );
  MUX2X1 U164 ( .B(in_opp_sign[12]), .A(a[12]), .S(n77), .Y(n53) );
  NOR2X1 U165 ( .A(n32), .B(n39), .Y(ab0[11]) );
  AND2X1 U166 ( .A(n54), .B(n42), .Y(n32) );
  MUX2X1 U167 ( .B(in_opp_sign[11]), .A(a[11]), .S(n77), .Y(n54) );
  NOR2X1 U168 ( .A(n33), .B(n39), .Y(ab0[10]) );
  AND2X1 U169 ( .A(n55), .B(n42), .Y(n33) );
  MUX2X1 U170 ( .B(in_opp_sign[10]), .A(a[10]), .S(n77), .Y(n55) );
  NOR2X1 U171 ( .A(n28), .B(n39), .Y(ab0[0]) );
  AND2X1 U172 ( .A(n56), .B(n42), .Y(n28) );
  NAND2X1 U173 ( .A(in_opp_sign[15]), .B(a[15]), .Y(n42) );
  MUX2X1 U174 ( .B(in_opp_sign[0]), .A(a[0]), .S(n77), .Y(n56) );
endmodule


module cla_4bit_19 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_18 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_17 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_16 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_16bit_4 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, cout, n8, n9, n10;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  cla_4bit_19 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_18 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n10), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_17 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n9), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_16 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n8), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  NOR2X1 U1 ( .A(n1), .B(n2), .Y(pg) );
  NAND2X1 U2 ( .A(p[3]), .B(p[2]), .Y(n2) );
  NAND2X1 U3 ( .A(p[1]), .B(p[0]), .Y(n1) );
  INVX1 U4 ( .A(n3), .Y(cout) );
  AOI21X1 U5 ( .A(n8), .B(p[3]), .C(g[3]), .Y(n3) );
  INVX1 U6 ( .A(n4), .Y(n8) );
  AOI21X1 U7 ( .A(n9), .B(p[2]), .C(g[2]), .Y(n4) );
  INVX1 U8 ( .A(n5), .Y(n9) );
  AOI21X1 U9 ( .A(n10), .B(p[1]), .C(g[1]), .Y(n5) );
  INVX1 U10 ( .A(n6), .Y(n10) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n6) );
endmodule


module cla_4bit_15 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_14 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_13 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_12 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_16bit_3 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, cout, n8, n9, n10;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  cla_4bit_15 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_14 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n10), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_13 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n9), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_12 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n8), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  NOR2X1 U1 ( .A(n1), .B(n2), .Y(pg) );
  NAND2X1 U2 ( .A(p[3]), .B(p[2]), .Y(n2) );
  NAND2X1 U3 ( .A(p[1]), .B(p[0]), .Y(n1) );
  INVX1 U4 ( .A(n3), .Y(cout) );
  AOI21X1 U5 ( .A(n8), .B(p[3]), .C(g[3]), .Y(n3) );
  INVX1 U6 ( .A(n4), .Y(n8) );
  AOI21X1 U7 ( .A(n9), .B(p[2]), .C(g[2]), .Y(n4) );
  INVX1 U8 ( .A(n5), .Y(n9) );
  AOI21X1 U9 ( .A(n10), .B(p[1]), .C(g[1]), .Y(n5) );
  INVX1 U10 ( .A(n6), .Y(n10) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n6) );
endmodule


module adder_1bit_5 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2;

  XOR2X1 U1 ( .A(carry_in), .B(n1), .Y(sum) );
  INVX1 U2 ( .A(n2), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n1), .D(carry_in), .Y(n2) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n1) );
endmodule


module cla_4bit_11 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_10 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_9 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_8 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_16bit_2 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, cout, n8, n9, n10;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  cla_4bit_11 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_10 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n10), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_9 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n9), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_8 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n8), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  NOR2X1 U1 ( .A(n1), .B(n2), .Y(pg) );
  NAND2X1 U2 ( .A(p[3]), .B(p[2]), .Y(n2) );
  NAND2X1 U3 ( .A(p[1]), .B(p[0]), .Y(n1) );
  INVX1 U4 ( .A(n3), .Y(cout) );
  AOI21X1 U5 ( .A(n8), .B(p[3]), .C(g[3]), .Y(n3) );
  INVX1 U6 ( .A(n4), .Y(n8) );
  AOI21X1 U7 ( .A(n9), .B(p[2]), .C(g[2]), .Y(n4) );
  INVX1 U8 ( .A(n5), .Y(n9) );
  AOI21X1 U9 ( .A(n10), .B(p[1]), .C(g[1]), .Y(n5) );
  INVX1 U10 ( .A(n6), .Y(n10) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n6) );
endmodule


module adder_1bit_4 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2;

  XOR2X1 U1 ( .A(carry_in), .B(n1), .Y(sum) );
  INVX1 U2 ( .A(n2), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n1), .D(carry_in), .Y(n2) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n1) );
endmodule


module adder_1bit_3 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2;

  XOR2X1 U1 ( .A(carry_in), .B(n1), .Y(sum) );
  INVX1 U2 ( .A(n2), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n1), .D(carry_in), .Y(n2) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n1) );
endmodule


module cla_4bit_7 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_6 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_5 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_4 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_16bit_1 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, cout, n8, n9, n10;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  cla_4bit_7 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_6 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n10), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_5 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n9), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_4 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n8), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  NOR2X1 U1 ( .A(n1), .B(n2), .Y(pg) );
  NAND2X1 U2 ( .A(p[3]), .B(p[2]), .Y(n2) );
  NAND2X1 U3 ( .A(p[1]), .B(p[0]), .Y(n1) );
  INVX1 U4 ( .A(n3), .Y(cout) );
  AOI21X1 U5 ( .A(n8), .B(p[3]), .C(g[3]), .Y(n3) );
  INVX1 U6 ( .A(n4), .Y(n8) );
  AOI21X1 U7 ( .A(n9), .B(p[2]), .C(g[2]), .Y(n4) );
  INVX1 U8 ( .A(n5), .Y(n9) );
  AOI21X1 U9 ( .A(n10), .B(p[1]), .C(g[1]), .Y(n5) );
  INVX1 U10 ( .A(n6), .Y(n10) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n6) );
endmodule


module adder_1bit_2 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2;

  XOR2X1 U1 ( .A(carry_in), .B(n1), .Y(sum) );
  INVX1 U2 ( .A(n2), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n1), .D(carry_in), .Y(n2) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n1) );
endmodule


module adder_1bit_1 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2;

  XOR2X1 U1 ( .A(carry_in), .B(n1), .Y(sum) );
  INVX1 U2 ( .A(n2), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n1), .D(carry_in), .Y(n2) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n1) );
endmodule


module adder_1bit_0 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2;

  XOR2X1 U1 ( .A(carry_in), .B(n1), .Y(sum) );
  INVX1 U2 ( .A(n2), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n1), .D(carry_in), .Y(n2) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n1) );
endmodule


module cla_4bit_3 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_2 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_1 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_4bit_0 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
endmodule


module cla_16bit_0 ( a, b, cin, cout, pg, gg, sum );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, cout, n8, n9, n10;
  wire   [3:0] g;
  wire   [3:0] p;
  assign gg = cout;

  cla_4bit_3 A1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .pg(p[0]), .gg(g[0]), 
        .sum(sum[3:0]) );
  cla_4bit_2 A2 ( .a(a[7:4]), .b(b[7:4]), .cin(n10), .pg(p[1]), .gg(g[1]), 
        .sum(sum[7:4]) );
  cla_4bit_1 A3 ( .a(a[11:8]), .b(b[11:8]), .cin(n9), .pg(p[2]), .gg(g[2]), 
        .sum(sum[11:8]) );
  cla_4bit_0 A4 ( .a(a[15:12]), .b(b[15:12]), .cin(n8), .pg(p[3]), .gg(g[3]), 
        .sum(sum[15:12]) );
  NOR2X1 U1 ( .A(n1), .B(n2), .Y(pg) );
  NAND2X1 U2 ( .A(p[3]), .B(p[2]), .Y(n2) );
  NAND2X1 U3 ( .A(p[1]), .B(p[0]), .Y(n1) );
  INVX1 U4 ( .A(n3), .Y(cout) );
  AOI21X1 U5 ( .A(n8), .B(p[3]), .C(g[3]), .Y(n3) );
  INVX1 U6 ( .A(n4), .Y(n8) );
  AOI21X1 U7 ( .A(n9), .B(p[2]), .C(g[2]), .Y(n4) );
  INVX1 U8 ( .A(n5), .Y(n9) );
  AOI21X1 U9 ( .A(n10), .B(p[1]), .C(g[1]), .Y(n5) );
  INVX1 U10 ( .A(n6), .Y(n10) );
  AOI21X1 U11 ( .A(cin), .B(p[0]), .C(g[0]), .Y(n6) );
endmodule


module cla_4bit_112 ( a, b, cin, cout, pg, gg, sum );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout, pg, gg;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;

  MUX2X1 U1 ( .B(n1), .A(n2), .S(n3), .Y(sum[3]) );
  XNOR2X1 U2 ( .A(a[3]), .B(b[3]), .Y(n2) );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(n1) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  MUX2X1 U5 ( .B(n7), .A(n8), .S(n9), .Y(sum[2]) );
  NOR2X1 U6 ( .A(n10), .B(n11), .Y(n8) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n7) );
  OAI21X1 U8 ( .A(n12), .B(n13), .C(n14), .Y(sum[1]) );
  MUX2X1 U9 ( .B(n15), .A(n16), .S(b[1]), .Y(n14) );
  XOR2X1 U10 ( .A(a[1]), .B(n12), .Y(n16) );
  NOR2X1 U11 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U12 ( .A(n18), .Y(n12) );
  NAND2X1 U13 ( .A(n19), .B(n20), .Y(n18) );
  MUX2X1 U14 ( .B(n21), .A(n22), .S(cin), .Y(sum[0]) );
  AND2X1 U15 ( .A(n23), .B(n20), .Y(n22) );
  XNOR2X1 U16 ( .A(a[0]), .B(b[0]), .Y(n21) );
  NOR2X1 U17 ( .A(n24), .B(n25), .Y(pg) );
  OR2X1 U18 ( .A(n5), .B(n11), .Y(n25) );
  NAND2X1 U19 ( .A(n23), .B(n13), .Y(n24) );
  OAI21X1 U20 ( .A(n5), .B(n26), .C(n6), .Y(gg) );
  INVX1 U21 ( .A(n27), .Y(n26) );
  OAI21X1 U22 ( .A(n28), .B(n11), .C(n29), .Y(n27) );
  OAI21X1 U23 ( .A(n3), .B(n5), .C(n6), .Y(cout) );
  NAND2X1 U24 ( .A(a[3]), .B(b[3]), .Y(n6) );
  NOR2X1 U25 ( .A(b[3]), .B(a[3]), .Y(n5) );
  AOI21X1 U26 ( .A(n9), .B(n30), .C(n10), .Y(n3) );
  INVX1 U27 ( .A(n29), .Y(n10) );
  NAND2X1 U28 ( .A(b[2]), .B(a[2]), .Y(n29) );
  INVX1 U29 ( .A(n11), .Y(n30) );
  NOR2X1 U30 ( .A(b[2]), .B(a[2]), .Y(n11) );
  OAI21X1 U31 ( .A(n31), .B(n19), .C(n28), .Y(n9) );
  NAND2X1 U32 ( .A(n13), .B(n32), .Y(n28) );
  OAI21X1 U33 ( .A(n17), .B(n33), .C(n20), .Y(n32) );
  NAND2X1 U34 ( .A(b[0]), .B(a[0]), .Y(n20) );
  NAND2X1 U35 ( .A(cin), .B(n23), .Y(n19) );
  OR2X1 U36 ( .A(a[0]), .B(b[0]), .Y(n23) );
  INVX1 U37 ( .A(n13), .Y(n31) );
  NAND2X1 U38 ( .A(n17), .B(n33), .Y(n13) );
  INVX1 U39 ( .A(b[1]), .Y(n33) );
  INVX1 U40 ( .A(a[1]), .Y(n17) );
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
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75,
         n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92;
  wire   [15:0] in_opp_sign;
  wire   [15:0] ab0;
  wire   [15:1] ab1;
  wire   [17:2] ab2;
  wire   [18:3] ab3;
  wire   [7:0] couts;
  wire   [19:0] out_neg;

  cla_16bit_4 AOPS1 ( .a({n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, 
        n87, n88, n89, n90, n91, n92}), .b({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .cin(
        1'b1), .sum(in_opp_sign) );
  cla_16bit_3 A1 ( .a({1'b0, ab0[14:0]}), .b({ab1, 1'b0}), .cin(1'b0), .cout(
        couts[0]), .sum({\sums[0][15] , \sums[0][14] , \sums[0][13] , 
        \sums[0][12] , \sums[0][11] , \sums[0][10] , \sums[0][9] , 
        \sums[0][8] , \sums[0][7] , \sums[0][6] , \sums[0][5] , \sums[0][4] , 
        \sums[0][3] , \sums[0][2] , \sums[0][1] , \sums[0][0] }) );
  adder_1bit_5 A1_1 ( .a(1'b0), .b(ab2[16]), .carry_in(couts[0]), .sum(
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
  adder_1bit_4 A2_1 ( .a(\sums[0][16] ), .b(ab2[16]), .carry_in(couts[1]), 
        .sum(\sums[1][16] ), .carry_out(couts[2]) );
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
  cla_16bit_0 A4 ( .a({n57, n58, n59, n60, n65, n66, n67, n68, n69, n70, n71, 
        n72, n73, n74, n75, n76}), .b({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .cin(
        1'b1), .cout(couts[7]), .sum(out_neg[15:0]) );
  cla_4bit_112 A5 ( .a({n64, n63, n62, n61}), .b({1'b0, 1'b0, 1'b0, 1'b0}), 
        .cin(couts[7]), .sum(out_neg[19:16]) );
  INVX2 U3 ( .A(b[3]), .Y(n22) );
  INVX2 U4 ( .A(b[2]), .Y(n37) );
  INVX2 U5 ( .A(b[1]), .Y(n38) );
  INVX2 U6 ( .A(b[0]), .Y(n39) );
  INVX4 U7 ( .A(a[15]), .Y(n77) );
  INVX1 U8 ( .A(n1), .Y(product[9]) );
  MUX2X1 U9 ( .B(out_neg[9]), .A(\sums[2][9] ), .S(n77), .Y(n1) );
  INVX1 U10 ( .A(n2), .Y(product[8]) );
  MUX2X1 U11 ( .B(out_neg[8]), .A(\sums[2][8] ), .S(n77), .Y(n2) );
  INVX1 U12 ( .A(n3), .Y(product[7]) );
  MUX2X1 U13 ( .B(out_neg[7]), .A(\sums[2][7] ), .S(n77), .Y(n3) );
  INVX1 U14 ( .A(n4), .Y(product[6]) );
  MUX2X1 U15 ( .B(out_neg[6]), .A(\sums[2][6] ), .S(n77), .Y(n4) );
  INVX1 U16 ( .A(n5), .Y(product[5]) );
  MUX2X1 U17 ( .B(out_neg[5]), .A(\sums[2][5] ), .S(n77), .Y(n5) );
  INVX1 U18 ( .A(n6), .Y(product[4]) );
  MUX2X1 U19 ( .B(out_neg[4]), .A(\sums[2][4] ), .S(n77), .Y(n6) );
  INVX1 U20 ( .A(n7), .Y(product[3]) );
  MUX2X1 U21 ( .B(out_neg[3]), .A(\sums[2][3] ), .S(n77), .Y(n7) );
  INVX1 U22 ( .A(n8), .Y(product[2]) );
  MUX2X1 U23 ( .B(out_neg[2]), .A(\sums[2][2] ), .S(n77), .Y(n8) );
  INVX1 U24 ( .A(n9), .Y(product[1]) );
  MUX2X1 U25 ( .B(out_neg[1]), .A(\sums[2][1] ), .S(n77), .Y(n9) );
  INVX1 U26 ( .A(n10), .Y(product[19]) );
  MUX2X1 U27 ( .B(out_neg[19]), .A(couts[6]), .S(n77), .Y(n10) );
  INVX1 U28 ( .A(n11), .Y(product[18]) );
  MUX2X1 U29 ( .B(out_neg[18]), .A(\sums[2][18] ), .S(n77), .Y(n11) );
  INVX1 U30 ( .A(n12), .Y(product[17]) );
  MUX2X1 U31 ( .B(out_neg[17]), .A(\sums[2][17] ), .S(n77), .Y(n12) );
  INVX1 U32 ( .A(n13), .Y(product[16]) );
  MUX2X1 U33 ( .B(out_neg[16]), .A(\sums[2][16] ), .S(n77), .Y(n13) );
  INVX1 U34 ( .A(n14), .Y(product[15]) );
  MUX2X1 U35 ( .B(out_neg[15]), .A(\sums[2][15] ), .S(n77), .Y(n14) );
  INVX1 U36 ( .A(n15), .Y(product[14]) );
  MUX2X1 U37 ( .B(out_neg[14]), .A(\sums[2][14] ), .S(n77), .Y(n15) );
  INVX1 U38 ( .A(n16), .Y(product[13]) );
  MUX2X1 U39 ( .B(out_neg[13]), .A(\sums[2][13] ), .S(n77), .Y(n16) );
  INVX1 U40 ( .A(n17), .Y(product[12]) );
  MUX2X1 U41 ( .B(out_neg[12]), .A(\sums[2][12] ), .S(n77), .Y(n17) );
  INVX1 U42 ( .A(n18), .Y(product[11]) );
  MUX2X1 U43 ( .B(out_neg[11]), .A(\sums[2][11] ), .S(n77), .Y(n18) );
  INVX1 U44 ( .A(n19), .Y(product[10]) );
  MUX2X1 U45 ( .B(out_neg[10]), .A(\sums[2][10] ), .S(n77), .Y(n19) );
  INVX1 U46 ( .A(n20), .Y(product[0]) );
  MUX2X1 U47 ( .B(out_neg[0]), .A(\sums[2][0] ), .S(n77), .Y(n20) );
  INVX1 U48 ( .A(\sums[2][15] ), .Y(n57) );
  INVX1 U49 ( .A(\sums[2][14] ), .Y(n58) );
  INVX1 U50 ( .A(\sums[2][13] ), .Y(n59) );
  INVX1 U51 ( .A(\sums[2][12] ), .Y(n60) );
  INVX1 U52 ( .A(\sums[2][16] ), .Y(n61) );
  INVX1 U53 ( .A(\sums[2][17] ), .Y(n62) );
  INVX1 U54 ( .A(\sums[2][18] ), .Y(n63) );
  INVX1 U55 ( .A(couts[6]), .Y(n64) );
  INVX1 U56 ( .A(\sums[2][11] ), .Y(n65) );
  INVX1 U57 ( .A(\sums[2][10] ), .Y(n66) );
  INVX1 U58 ( .A(\sums[2][9] ), .Y(n67) );
  INVX1 U59 ( .A(\sums[2][8] ), .Y(n68) );
  INVX1 U60 ( .A(\sums[2][7] ), .Y(n69) );
  INVX1 U61 ( .A(\sums[2][6] ), .Y(n70) );
  INVX1 U62 ( .A(\sums[2][5] ), .Y(n71) );
  INVX1 U63 ( .A(\sums[2][4] ), .Y(n72) );
  INVX1 U64 ( .A(\sums[2][3] ), .Y(n73) );
  INVX1 U65 ( .A(\sums[2][2] ), .Y(n74) );
  INVX1 U66 ( .A(\sums[2][1] ), .Y(n75) );
  INVX1 U67 ( .A(\sums[2][0] ), .Y(n76) );
  INVX1 U68 ( .A(a[14]), .Y(n78) );
  INVX1 U69 ( .A(a[13]), .Y(n79) );
  INVX1 U70 ( .A(a[12]), .Y(n80) );
  INVX1 U71 ( .A(a[11]), .Y(n81) );
  INVX1 U72 ( .A(a[10]), .Y(n82) );
  INVX1 U73 ( .A(a[9]), .Y(n83) );
  INVX1 U74 ( .A(a[8]), .Y(n84) );
  INVX1 U75 ( .A(a[7]), .Y(n85) );
  INVX1 U76 ( .A(a[6]), .Y(n86) );
  INVX1 U77 ( .A(a[5]), .Y(n87) );
  INVX1 U78 ( .A(a[4]), .Y(n88) );
  INVX1 U79 ( .A(a[3]), .Y(n89) );
  INVX1 U80 ( .A(a[2]), .Y(n90) );
  INVX1 U81 ( .A(a[1]), .Y(n91) );
  INVX1 U82 ( .A(a[0]), .Y(n92) );
  NOR2X1 U83 ( .A(n21), .B(n22), .Y(ab3[9]) );
  NOR2X1 U84 ( .A(n23), .B(n22), .Y(ab3[8]) );
  NOR2X1 U85 ( .A(n24), .B(n22), .Y(ab3[7]) );
  NOR2X1 U86 ( .A(n25), .B(n22), .Y(ab3[6]) );
  NOR2X1 U87 ( .A(n26), .B(n22), .Y(ab3[5]) );
  NOR2X1 U88 ( .A(n27), .B(n22), .Y(ab3[4]) );
  NOR2X1 U89 ( .A(n28), .B(n22), .Y(ab3[3]) );
  NOR2X1 U90 ( .A(n29), .B(n22), .Y(ab3[17]) );
  NOR2X1 U91 ( .A(n30), .B(n22), .Y(ab3[16]) );
  NOR2X1 U92 ( .A(n31), .B(n22), .Y(ab3[15]) );
  NOR2X1 U93 ( .A(n32), .B(n22), .Y(ab3[14]) );
  NOR2X1 U94 ( .A(n33), .B(n22), .Y(ab3[13]) );
  NOR2X1 U95 ( .A(n34), .B(n22), .Y(ab3[12]) );
  NOR2X1 U96 ( .A(n35), .B(n22), .Y(ab3[11]) );
  NOR2X1 U97 ( .A(n36), .B(n22), .Y(ab3[10]) );
  NOR2X1 U98 ( .A(n36), .B(n37), .Y(ab2[9]) );
  NOR2X1 U99 ( .A(n21), .B(n37), .Y(ab2[8]) );
  NOR2X1 U100 ( .A(n23), .B(n37), .Y(ab2[7]) );
  NOR2X1 U101 ( .A(n24), .B(n37), .Y(ab2[6]) );
  NOR2X1 U102 ( .A(n25), .B(n37), .Y(ab2[5]) );
  NOR2X1 U103 ( .A(n26), .B(n37), .Y(ab2[4]) );
  NOR2X1 U104 ( .A(n27), .B(n37), .Y(ab2[3]) );
  NOR2X1 U105 ( .A(n28), .B(n37), .Y(ab2[2]) );
  NOR2X1 U106 ( .A(n29), .B(n37), .Y(ab2[16]) );
  NOR2X1 U107 ( .A(n30), .B(n37), .Y(ab2[15]) );
  NOR2X1 U108 ( .A(n31), .B(n37), .Y(ab2[14]) );
  NOR2X1 U109 ( .A(n32), .B(n37), .Y(ab2[13]) );
  NOR2X1 U110 ( .A(n33), .B(n37), .Y(ab2[12]) );
  NOR2X1 U111 ( .A(n34), .B(n37), .Y(ab2[11]) );
  NOR2X1 U112 ( .A(n35), .B(n37), .Y(ab2[10]) );
  NOR2X1 U113 ( .A(n35), .B(n38), .Y(ab1[9]) );
  NOR2X1 U114 ( .A(n36), .B(n38), .Y(ab1[8]) );
  NOR2X1 U115 ( .A(n21), .B(n38), .Y(ab1[7]) );
  NOR2X1 U116 ( .A(n23), .B(n38), .Y(ab1[6]) );
  NOR2X1 U117 ( .A(n24), .B(n38), .Y(ab1[5]) );
  NOR2X1 U118 ( .A(n25), .B(n38), .Y(ab1[4]) );
  NOR2X1 U119 ( .A(n26), .B(n38), .Y(ab1[3]) );
  NOR2X1 U120 ( .A(n27), .B(n38), .Y(ab1[2]) );
  NOR2X1 U121 ( .A(n28), .B(n38), .Y(ab1[1]) );
  NOR2X1 U122 ( .A(n29), .B(n38), .Y(ab1[15]) );
  NOR2X1 U123 ( .A(n30), .B(n38), .Y(ab1[14]) );
  NOR2X1 U124 ( .A(n31), .B(n38), .Y(ab1[13]) );
  NOR2X1 U125 ( .A(n32), .B(n38), .Y(ab1[12]) );
  NOR2X1 U126 ( .A(n33), .B(n38), .Y(ab1[11]) );
  NOR2X1 U127 ( .A(n34), .B(n38), .Y(ab1[10]) );
  NOR2X1 U128 ( .A(n34), .B(n39), .Y(ab0[9]) );
  AND2X1 U129 ( .A(n40), .B(n42), .Y(n34) );
  MUX2X1 U130 ( .B(in_opp_sign[9]), .A(a[9]), .S(n77), .Y(n40) );
  NOR2X1 U131 ( .A(n35), .B(n39), .Y(ab0[8]) );
  AND2X1 U132 ( .A(n43), .B(n42), .Y(n35) );
  MUX2X1 U133 ( .B(in_opp_sign[8]), .A(a[8]), .S(n77), .Y(n43) );
  NOR2X1 U134 ( .A(n36), .B(n39), .Y(ab0[7]) );
  AND2X1 U135 ( .A(n44), .B(n42), .Y(n36) );
  MUX2X1 U136 ( .B(in_opp_sign[7]), .A(a[7]), .S(n77), .Y(n44) );
  NOR2X1 U137 ( .A(n21), .B(n39), .Y(ab0[6]) );
  AND2X1 U138 ( .A(n45), .B(n42), .Y(n21) );
  MUX2X1 U139 ( .B(in_opp_sign[6]), .A(a[6]), .S(n77), .Y(n45) );
  NOR2X1 U140 ( .A(n23), .B(n39), .Y(ab0[5]) );
  AND2X1 U141 ( .A(n46), .B(n42), .Y(n23) );
  MUX2X1 U142 ( .B(in_opp_sign[5]), .A(a[5]), .S(n77), .Y(n46) );
  NOR2X1 U143 ( .A(n24), .B(n39), .Y(ab0[4]) );
  AND2X1 U144 ( .A(n47), .B(n42), .Y(n24) );
  MUX2X1 U145 ( .B(in_opp_sign[4]), .A(a[4]), .S(n77), .Y(n47) );
  NOR2X1 U146 ( .A(n25), .B(n39), .Y(ab0[3]) );
  AND2X1 U147 ( .A(n48), .B(n42), .Y(n25) );
  MUX2X1 U148 ( .B(in_opp_sign[3]), .A(a[3]), .S(n77), .Y(n48) );
  NOR2X1 U149 ( .A(n26), .B(n39), .Y(ab0[2]) );
  AND2X1 U150 ( .A(n49), .B(n42), .Y(n26) );
  MUX2X1 U151 ( .B(in_opp_sign[2]), .A(a[2]), .S(n77), .Y(n49) );
  NOR2X1 U152 ( .A(n27), .B(n39), .Y(ab0[1]) );
  AND2X1 U153 ( .A(n50), .B(n42), .Y(n27) );
  MUX2X1 U154 ( .B(in_opp_sign[1]), .A(a[1]), .S(n77), .Y(n50) );
  NOR2X1 U156 ( .A(n29), .B(n39), .Y(ab0[14]) );
  AND2X1 U157 ( .A(n51), .B(n42), .Y(n29) );
  MUX2X1 U158 ( .B(in_opp_sign[14]), .A(a[14]), .S(n77), .Y(n51) );
  NOR2X1 U159 ( .A(n30), .B(n39), .Y(ab0[13]) );
  AND2X1 U160 ( .A(n52), .B(n42), .Y(n30) );
  MUX2X1 U161 ( .B(in_opp_sign[13]), .A(a[13]), .S(n77), .Y(n52) );
  NOR2X1 U162 ( .A(n31), .B(n39), .Y(ab0[12]) );
  AND2X1 U163 ( .A(n53), .B(n42), .Y(n31) );
  MUX2X1 U164 ( .B(in_opp_sign[12]), .A(a[12]), .S(n77), .Y(n53) );
  NOR2X1 U165 ( .A(n32), .B(n39), .Y(ab0[11]) );
  AND2X1 U166 ( .A(n54), .B(n42), .Y(n32) );
  MUX2X1 U167 ( .B(in_opp_sign[11]), .A(a[11]), .S(n77), .Y(n54) );
  NOR2X1 U168 ( .A(n33), .B(n39), .Y(ab0[10]) );
  AND2X1 U169 ( .A(n55), .B(n42), .Y(n33) );
  MUX2X1 U170 ( .B(in_opp_sign[10]), .A(a[10]), .S(n77), .Y(n55) );
  NOR2X1 U171 ( .A(n28), .B(n39), .Y(ab0[0]) );
  AND2X1 U172 ( .A(n56), .B(n42), .Y(n28) );
  NAND2X1 U173 ( .A(in_opp_sign[15]), .B(a[15]), .Y(n42) );
  MUX2X1 U174 ( .B(in_opp_sign[0]), .A(a[0]), .S(n77), .Y(n56) );
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
  wire   r_flag_next, N8, N9, N10, \add_53/carry[4] , \add_53/carry[3] ,
         \add_53/carry[2] , n1, n2, n3, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n32, n33, n34, n35, n36,
         n37, n38, n39, n40;

  DFFSR \counter_reg[0]  ( .D(n36), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \counter_reg[4]  ( .D(n40), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[4]) );
  DFFSR \counter_reg[1]  ( .D(n37), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \counter_reg[2]  ( .D(n38), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \counter_reg[3]  ( .D(n39), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR r_flag_reg ( .D(r_flag_next), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  HAX1 \add_53/U1_1_1  ( .A(count_out[1]), .B(count_out[0]), .YC(
        \add_53/carry[2] ), .YS(N8) );
  HAX1 \add_53/U1_1_2  ( .A(count_out[2]), .B(\add_53/carry[2] ), .YC(
        \add_53/carry[3] ), .YS(N9) );
  HAX1 \add_53/U1_1_3  ( .A(count_out[3]), .B(\add_53/carry[3] ), .YC(
        \add_53/carry[4] ), .YS(N10) );
  MUX2X1 U5 ( .B(n1), .A(n2), .S(count_out[0]), .Y(n36) );
  OAI21X1 U10 ( .A(n3), .B(n2), .C(n10), .Y(n37) );
  NAND2X1 U11 ( .A(N8), .B(n11), .Y(n10) );
  INVX1 U12 ( .A(count_out[1]), .Y(n3) );
  OAI21X1 U13 ( .A(n12), .B(n2), .C(n13), .Y(n38) );
  NAND2X1 U14 ( .A(N9), .B(n11), .Y(n13) );
  OAI21X1 U15 ( .A(n14), .B(n2), .C(n15), .Y(n39) );
  NAND2X1 U16 ( .A(N10), .B(n11), .Y(n15) );
  MUX2X1 U17 ( .B(n16), .A(n17), .S(count_out[4]), .Y(n40) );
  INVX1 U18 ( .A(n18), .Y(n17) );
  OAI21X1 U19 ( .A(n1), .B(\add_53/carry[4] ), .C(n2), .Y(n18) );
  INVX1 U20 ( .A(n11), .Y(n1) );
  NAND2X1 U21 ( .A(\add_53/carry[4] ), .B(n11), .Y(n16) );
  NOR2X1 U22 ( .A(n19), .B(n20), .Y(n11) );
  OAI21X1 U23 ( .A(n21), .B(n22), .C(n2), .Y(n20) );
  OR2X1 U24 ( .A(clear), .B(count_enable), .Y(n2) );
  NAND2X1 U25 ( .A(count_out[4]), .B(count_out[3]), .Y(n22) );
  NAND3X1 U26 ( .A(count_out[0]), .B(count_out[2]), .C(count_out[1]), .Y(n21)
         );
  OR2X1 U27 ( .A(r_flag_next), .B(clear), .Y(n19) );
  INVX1 U28 ( .A(n23), .Y(r_flag_next) );
  NAND3X1 U29 ( .A(n24), .B(n25), .C(n26), .Y(n23) );
  NOR2X1 U30 ( .A(n32), .B(n33), .Y(n26) );
  XOR2X1 U31 ( .A(rollover_val[4]), .B(count_out[4]), .Y(n33) );
  XNOR2X1 U32 ( .A(rollover_val[3]), .B(n14), .Y(n32) );
  INVX1 U33 ( .A(count_out[3]), .Y(n14) );
  XNOR2X1 U34 ( .A(count_out[1]), .B(rollover_val[1]), .Y(n25) );
  NOR2X1 U35 ( .A(n34), .B(n35), .Y(n24) );
  XOR2X1 U36 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n35) );
  XNOR2X1 U37 ( .A(rollover_val[2]), .B(n12), .Y(n34) );
  INVX1 U38 ( .A(count_out[2]), .Y(n12) );
endmodule


module i2s_trnmtr_cntlr ( clk, n_rst, ws, load );
  input clk, n_rst;
  output ws, load;
  wire   n15, ws_switch, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14;
  wire   [2:0] state;
  wire   [2:0] next_state;

  DFFSR \state_reg[0]  ( .D(next_state[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[0]) );
  DFFSR \state_reg[1]  ( .D(next_state[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[1]) );
  DFFSR \state_reg[2]  ( .D(next_state[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[2]) );
  flex_counter_NUM_CNT_BITS5_0 EDGE_COUNTER_2 ( .clk(clk), .n_rst(n_rst), 
        .clear(1'b0), .count_enable(1'b1), .rollover_val({1'b1, 1'b0, 1'b0, 
        1'b0, 1'b0}), .rollover_flag(ws_switch) );
  BUFX2 U6 ( .A(n15), .Y(ws) );
  AOI21X1 U7 ( .A(n5), .B(n6), .C(next_state[1]), .Y(n15) );
  OAI21X1 U8 ( .A(n7), .B(n8), .C(n9), .Y(next_state[2]) );
  NAND2X1 U9 ( .A(state[2]), .B(n10), .Y(n8) );
  NAND2X1 U10 ( .A(n5), .B(n11), .Y(n7) );
  INVX1 U11 ( .A(n12), .Y(next_state[1]) );
  OAI21X1 U12 ( .A(ws_switch), .B(n12), .C(n13), .Y(next_state[0]) );
  NAND2X1 U13 ( .A(n14), .B(n5), .Y(n13) );
  INVX1 U14 ( .A(state[1]), .Y(n5) );
  OAI21X1 U15 ( .A(state[0]), .B(n11), .C(state[2]), .Y(n14) );
  INVX1 U16 ( .A(ws_switch), .Y(n11) );
  OAI21X1 U17 ( .A(state[1]), .B(n12), .C(n9), .Y(load) );
  NAND3X1 U18 ( .A(n10), .B(n6), .C(state[1]), .Y(n9) );
  INVX1 U19 ( .A(state[0]), .Y(n10) );
  NAND2X1 U20 ( .A(state[0]), .B(n6), .Y(n12) );
  INVX1 U21 ( .A(state[2]), .Y(n6) );
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
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52;
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
  BUFX2 U19 ( .A(n21), .Y(n17) );
  AND2X2 U20 ( .A(shift_enable), .B(n19), .Y(n22) );
  INVX2 U21 ( .A(load_enable), .Y(n19) );
  OAI21X1 U22 ( .A(n18), .B(n19), .C(n20), .Y(n68) );
  AOI21X1 U23 ( .A(n17), .B(ff_in[0]), .C(n22), .Y(n20) );
  INVX1 U24 ( .A(parallel_in[0]), .Y(n18) );
  OAI21X1 U25 ( .A(n19), .B(n23), .C(n24), .Y(n67) );
  AOI22X1 U26 ( .A(ff_in[1]), .B(n17), .C(n22), .D(ff_in[0]), .Y(n24) );
  INVX1 U27 ( .A(parallel_in[1]), .Y(n23) );
  OAI21X1 U28 ( .A(n19), .B(n25), .C(n26), .Y(n66) );
  AOI22X1 U29 ( .A(ff_in[2]), .B(n17), .C(n22), .D(ff_in[1]), .Y(n26) );
  INVX1 U30 ( .A(parallel_in[2]), .Y(n25) );
  OAI21X1 U31 ( .A(n19), .B(n27), .C(n28), .Y(n65) );
  AOI22X1 U32 ( .A(ff_in[3]), .B(n17), .C(ff_in[2]), .D(n22), .Y(n28) );
  INVX1 U33 ( .A(parallel_in[3]), .Y(n27) );
  OAI21X1 U34 ( .A(n19), .B(n29), .C(n30), .Y(n64) );
  AOI22X1 U35 ( .A(ff_in[4]), .B(n17), .C(ff_in[3]), .D(n22), .Y(n30) );
  INVX1 U36 ( .A(parallel_in[4]), .Y(n29) );
  OAI21X1 U37 ( .A(n19), .B(n31), .C(n32), .Y(n63) );
  AOI22X1 U38 ( .A(ff_in[5]), .B(n17), .C(ff_in[4]), .D(n22), .Y(n32) );
  INVX1 U39 ( .A(parallel_in[5]), .Y(n31) );
  OAI21X1 U40 ( .A(n19), .B(n33), .C(n34), .Y(n62) );
  AOI22X1 U41 ( .A(ff_in[6]), .B(n17), .C(ff_in[5]), .D(n22), .Y(n34) );
  INVX1 U42 ( .A(parallel_in[6]), .Y(n33) );
  OAI21X1 U43 ( .A(n19), .B(n35), .C(n36), .Y(n61) );
  AOI22X1 U44 ( .A(ff_in[7]), .B(n17), .C(ff_in[6]), .D(n22), .Y(n36) );
  INVX1 U45 ( .A(parallel_in[7]), .Y(n35) );
  OAI21X1 U46 ( .A(n19), .B(n37), .C(n38), .Y(n60) );
  AOI22X1 U47 ( .A(ff_in[8]), .B(n17), .C(ff_in[7]), .D(n22), .Y(n38) );
  INVX1 U48 ( .A(parallel_in[8]), .Y(n37) );
  OAI21X1 U49 ( .A(n19), .B(n39), .C(n40), .Y(n59) );
  AOI22X1 U50 ( .A(ff_in[9]), .B(n17), .C(ff_in[8]), .D(n22), .Y(n40) );
  INVX1 U51 ( .A(parallel_in[9]), .Y(n39) );
  OAI21X1 U52 ( .A(n19), .B(n41), .C(n42), .Y(n58) );
  AOI22X1 U53 ( .A(ff_in[10]), .B(n17), .C(ff_in[9]), .D(n22), .Y(n42) );
  INVX1 U54 ( .A(parallel_in[10]), .Y(n41) );
  OAI21X1 U55 ( .A(n19), .B(n43), .C(n44), .Y(n57) );
  AOI22X1 U56 ( .A(ff_in[11]), .B(n17), .C(ff_in[10]), .D(n22), .Y(n44) );
  INVX1 U57 ( .A(parallel_in[11]), .Y(n43) );
  OAI21X1 U58 ( .A(n19), .B(n45), .C(n46), .Y(n56) );
  AOI22X1 U59 ( .A(ff_in[12]), .B(n17), .C(ff_in[11]), .D(n22), .Y(n46) );
  INVX1 U60 ( .A(parallel_in[12]), .Y(n45) );
  OAI21X1 U61 ( .A(n19), .B(n47), .C(n48), .Y(n55) );
  AOI22X1 U62 ( .A(ff_in[13]), .B(n17), .C(ff_in[12]), .D(n22), .Y(n48) );
  INVX1 U63 ( .A(parallel_in[13]), .Y(n47) );
  OAI21X1 U64 ( .A(n19), .B(n49), .C(n50), .Y(n54) );
  AOI22X1 U65 ( .A(ff_in[14]), .B(n17), .C(ff_in[13]), .D(n22), .Y(n50) );
  INVX1 U66 ( .A(parallel_in[14]), .Y(n49) );
  OAI21X1 U67 ( .A(n19), .B(n51), .C(n52), .Y(n53) );
  AOI22X1 U68 ( .A(serial_out), .B(n17), .C(ff_in[14]), .D(n22), .Y(n52) );
  NOR2X1 U69 ( .A(load_enable), .B(n22), .Y(n21) );
  INVX1 U70 ( .A(parallel_in[15]), .Y(n51) );
endmodule


module i2s_trnmtr_shift_reg ( clk, n_rst, shift, load, wsd, data_left, 
        data_right, data_out );
  input [15:0] data_left;
  input [15:0] data_right;
  input clk, n_rst, shift, load, wsd;
  output data_out;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32;

  flex_pts_sr_NUM_BITS16 SHIFT_REGISTER ( .clk(clk), .n_rst(n_rst), 
        .shift_enable(shift), .load_enable(load), .parallel_in({n17, n18, n19, 
        n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32}), 
        .serial_out(data_out) );
  INVX1 U1 ( .A(n1), .Y(n17) );
  MUX2X1 U2 ( .B(data_left[15]), .A(data_right[15]), .S(wsd), .Y(n1) );
  INVX1 U3 ( .A(n2), .Y(n18) );
  MUX2X1 U4 ( .B(data_left[14]), .A(data_right[14]), .S(wsd), .Y(n2) );
  INVX1 U5 ( .A(n3), .Y(n19) );
  MUX2X1 U6 ( .B(data_left[13]), .A(data_right[13]), .S(wsd), .Y(n3) );
  INVX1 U7 ( .A(n4), .Y(n20) );
  MUX2X1 U8 ( .B(data_left[12]), .A(data_right[12]), .S(wsd), .Y(n4) );
  INVX1 U9 ( .A(n5), .Y(n21) );
  MUX2X1 U10 ( .B(data_left[11]), .A(data_right[11]), .S(wsd), .Y(n5) );
  INVX1 U11 ( .A(n6), .Y(n22) );
  MUX2X1 U12 ( .B(data_left[10]), .A(data_right[10]), .S(wsd), .Y(n6) );
  INVX1 U13 ( .A(n7), .Y(n23) );
  MUX2X1 U14 ( .B(data_left[9]), .A(data_right[9]), .S(wsd), .Y(n7) );
  INVX1 U15 ( .A(n8), .Y(n24) );
  MUX2X1 U16 ( .B(data_left[8]), .A(data_right[8]), .S(wsd), .Y(n8) );
  INVX1 U17 ( .A(n9), .Y(n25) );
  MUX2X1 U18 ( .B(data_left[7]), .A(data_right[7]), .S(wsd), .Y(n9) );
  INVX1 U19 ( .A(n10), .Y(n26) );
  MUX2X1 U20 ( .B(data_left[6]), .A(data_right[6]), .S(wsd), .Y(n10) );
  INVX1 U21 ( .A(n11), .Y(n27) );
  MUX2X1 U22 ( .B(data_left[5]), .A(data_right[5]), .S(wsd), .Y(n11) );
  INVX1 U23 ( .A(n12), .Y(n28) );
  MUX2X1 U24 ( .B(data_left[4]), .A(data_right[4]), .S(wsd), .Y(n12) );
  INVX1 U25 ( .A(n13), .Y(n29) );
  MUX2X1 U26 ( .B(data_left[3]), .A(data_right[3]), .S(wsd), .Y(n13) );
  INVX1 U27 ( .A(n14), .Y(n30) );
  MUX2X1 U28 ( .B(data_left[2]), .A(data_right[2]), .S(wsd), .Y(n14) );
  INVX1 U29 ( .A(n15), .Y(n31) );
  MUX2X1 U30 ( .B(data_left[1]), .A(data_right[1]), .S(wsd), .Y(n15) );
  INVX1 U31 ( .A(n16), .Y(n32) );
  MUX2X1 U32 ( .B(data_left[0]), .A(data_right[0]), .S(wsd), .Y(n16) );
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
  INVX1 U1 ( .A(load), .Y(n1) );
  INVX1 U2 ( .A(clk), .Y(n2) );
endmodule


module daf_design ( tb_clk, tb_n_rst, pot_vol, pot_amp_com, pot_amp_clp, 
        swch_mode_en, mem_clr, serial_data_in, serial_data_out );
  input [3:0] pot_vol;
  input [3:0] pot_amp_com;
  input [3:0] pot_amp_clp;
  input [3:0] swch_mode_en;
  input tb_clk, tb_n_rst, mem_clr, serial_data_in;
  output serial_data_out;
  wire   tb_clk_div, tb_shift_en, tb_ws, sram_rw, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140, n141, n142, n143, n144, n145, n146,
         n147, n148, n149, n150, n151, n152, n153, n154, n155, n156, n157,
         n158, n159, n160, n161, n162, n163, n164, n165, n166, n167, n168,
         n169, n170, n171, n172, n173, n174, n175, n176, n177, n178, n179,
         n180, n181, n182, n183, n184, n185, n186, n187, n188, n189, n190,
         n191, n192, n193, n194, n195, n196, n197, n198, n199, n200, n201,
         n202, n203, n204, n205, n206, n207, n208, n209, n210, n211, n212,
         n213, n214, n215, n216, n217, n218, n219, n220, n221, n222, n223,
         n224, n225, n226, n227, n228, n229, n230, n231, n232, n233, n234,
         n235, n236, n237, n238, n239, n240, n241, n242, n243, n244, n245,
         n246, n247, n248, n249, n250, n251, n252, n253, n254, n255, n256,
         n257, n258, n259, n260;
  wire   [31:0] tb_parallel_ampclp_out;
  wire   [31:0] tb_parallel_buf_ampclp;
  wire   [31:0] tb_parallel_ampcom_out;
  wire   [31:0] tb_parallel_buf_ampcom;
  wire   [31:0] tb_parallel_i2s;
  wire   [31:0] tb_parallel_buf_vol;
  wire   [31:0] tb_parallel_vol;
  wire   [31:0] tb_parallel_buf_flang;
  wire   [31:0] sram_read_data;
  wire   [31:0] tb_parallel_flang;
  wire   [31:0] tb_parallel_buf_fad;
  wire   [31:0] tb_parallel_fad;
  tri   \*Logic0* ;
  tri   mem_clr;

  clk_div DIVIDER ( .clk(tb_clk), .n_rst(tb_n_rst), .clk_div(tb_clk_div), 
        .shift_en(tb_shift_en) );
  i2s_rcvr I2SRCVR ( .clk(tb_clk), .n_rst(tb_n_rst), .ws(tb_ws), .serial_data(
        serial_data_in), .parallel_data(tb_parallel_i2s) );
  flex_buffer_NUM_BITS32_5 BVOL ( .clk(n131), .n_rst(tb_n_rst), .input_data(
        tb_parallel_i2s), .output_data(tb_parallel_buf_vol) );
  volume_mult_1 VOL1 ( .channel_data(tb_parallel_buf_vol[31:16]), .pot_data(
        pot_vol), .output_data(tb_parallel_vol[31:16]) );
  volume_mult_0 VOL2 ( .channel_data(tb_parallel_buf_vol[15:0]), .pot_data(
        pot_vol), .output_data(tb_parallel_vol[15:0]) );
  flex_buffer_NUM_BITS32_4 BFLANG ( .clk(n131), .n_rst(tb_n_rst), .input_data(
        tb_parallel_vol), .output_data(tb_parallel_buf_flang) );
  flanger FLANG ( .clk(tb_clk), .n_rst(tb_n_rst), .flanger_en(swch_mode_en[3]), 
        .shift_en(tb_shift_en), .input_data(tb_parallel_buf_flang), 
        .read_data(sram_read_data), .output_data(tb_parallel_flang), .sram_rw(
        sram_rw) );
  sram_controller SRAMC ( .clk(tb_clk), .n_rst(tb_n_rst), .rw_trigger(sram_rw), 
        .mem_clr(mem_clr), .mem_init(1'b0), .mem_dump(1'b0), .write_data(
        tb_parallel_buf_flang), .sram_data(sram_read_data) );
  flex_buffer_NUM_BITS32_3 BAMPCLP ( .clk(n132), .n_rst(tb_n_rst), 
        .input_data(tb_parallel_flang), .output_data(tb_parallel_buf_ampclp)
         );
  amp_clip_1 AMPCLP1 ( .inchan(tb_parallel_buf_ampclp[31:16]), .comp_in(
        pot_amp_clp), .outchan(tb_parallel_ampclp_out[31:16]) );
  amp_clip_0 AMPCLP2 ( .inchan(tb_parallel_buf_ampclp[15:0]), .comp_in(
        pot_amp_clp), .outchan(tb_parallel_ampclp_out[15:0]) );
  flex_buffer_NUM_BITS32_2 BAMPCOMP ( .clk(n132), .n_rst(tb_n_rst), 
        .input_data({n245, n251, n250, n249, n248, n247, n260, n259, n258, 
        n257, n256, n255, n254, n253, n252, n246, n238, n239, n240, n241, n234, 
        n235, n236, n237, n230, n231, n232, n233, n229, n242, n243, n244}), 
        .output_data(tb_parallel_buf_ampcom) );
  amp_comp_1 AMPCMP1 ( .clk(n132), .n_rst(tb_n_rst), .inchan(
        tb_parallel_buf_ampcom[31:16]), .in_thresh(pot_amp_com), .outchan(
        tb_parallel_ampcom_out[31:16]) );
  amp_comp_0 AMPCMP2 ( .clk(n132), .n_rst(tb_n_rst), .inchan(
        tb_parallel_buf_ampcom[15:0]), .in_thresh(pot_amp_com), .outchan(
        tb_parallel_ampcom_out[15:0]) );
  flex_buffer_NUM_BITS32_1 BFAD ( .clk(n131), .n_rst(tb_n_rst), .input_data({
        n218, n219, n220, n221, n214, n215, n216, n217, n213, n222, n223, n224, 
        n225, n226, n227, n228, n197, n198, n199, n200, n201, n202, n203, n204, 
        n205, n206, n207, n208, n209, n210, n211, n212}), .output_data(
        tb_parallel_buf_fad) );
  fader FAD ( .clk(tb_clk), .n_reset(tb_n_rst), .clear(1'b0), .fad_enable(
        swch_mode_en[0]), .signal_in(tb_parallel_buf_fad), .signal_out(
        tb_parallel_fad) );
  flex_buffer_NUM_BITS32_0 BUFTRNS ( .clk(tb_clk), .n_rst(tb_n_rst), 
        .input_data(tb_parallel_fad) );
  i2s_trnmtr I2STRNS ( .clk(tb_clk), .n_rst(tb_n_rst), .parallel_data(
        tb_parallel_fad), .ws_flag(tb_ws), .serial_data(serial_data_out) );
  BUFX4 U132 ( .A(tb_clk_div), .Y(n131) );
  BUFX4 U133 ( .A(tb_clk_div), .Y(n132) );
  INVX1 U134 ( .A(n133), .Y(n197) );
  MUX2X1 U135 ( .B(tb_parallel_buf_ampcom[15]), .A(tb_parallel_ampcom_out[15]), 
        .S(swch_mode_en[1]), .Y(n133) );
  INVX1 U136 ( .A(n134), .Y(n198) );
  MUX2X1 U137 ( .B(tb_parallel_buf_ampcom[14]), .A(tb_parallel_ampcom_out[14]), 
        .S(swch_mode_en[1]), .Y(n134) );
  INVX1 U138 ( .A(n135), .Y(n199) );
  MUX2X1 U139 ( .B(tb_parallel_buf_ampcom[13]), .A(tb_parallel_ampcom_out[13]), 
        .S(swch_mode_en[1]), .Y(n135) );
  INVX1 U140 ( .A(n136), .Y(n200) );
  MUX2X1 U141 ( .B(tb_parallel_buf_ampcom[12]), .A(tb_parallel_ampcom_out[12]), 
        .S(swch_mode_en[1]), .Y(n136) );
  INVX1 U142 ( .A(n137), .Y(n201) );
  MUX2X1 U143 ( .B(tb_parallel_buf_ampcom[11]), .A(tb_parallel_ampcom_out[11]), 
        .S(swch_mode_en[1]), .Y(n137) );
  INVX1 U144 ( .A(n138), .Y(n202) );
  MUX2X1 U145 ( .B(tb_parallel_buf_ampcom[10]), .A(tb_parallel_ampcom_out[10]), 
        .S(swch_mode_en[1]), .Y(n138) );
  INVX1 U146 ( .A(n139), .Y(n203) );
  MUX2X1 U147 ( .B(tb_parallel_buf_ampcom[9]), .A(tb_parallel_ampcom_out[9]), 
        .S(swch_mode_en[1]), .Y(n139) );
  INVX1 U148 ( .A(n140), .Y(n204) );
  MUX2X1 U149 ( .B(tb_parallel_buf_ampcom[8]), .A(tb_parallel_ampcom_out[8]), 
        .S(swch_mode_en[1]), .Y(n140) );
  INVX1 U150 ( .A(n141), .Y(n205) );
  MUX2X1 U151 ( .B(tb_parallel_buf_ampcom[7]), .A(tb_parallel_ampcom_out[7]), 
        .S(swch_mode_en[1]), .Y(n141) );
  INVX1 U152 ( .A(n142), .Y(n206) );
  MUX2X1 U153 ( .B(tb_parallel_buf_ampcom[6]), .A(tb_parallel_ampcom_out[6]), 
        .S(swch_mode_en[1]), .Y(n142) );
  INVX1 U154 ( .A(n143), .Y(n207) );
  MUX2X1 U155 ( .B(tb_parallel_buf_ampcom[5]), .A(tb_parallel_ampcom_out[5]), 
        .S(swch_mode_en[1]), .Y(n143) );
  INVX1 U156 ( .A(n144), .Y(n208) );
  MUX2X1 U157 ( .B(tb_parallel_buf_ampcom[4]), .A(tb_parallel_ampcom_out[4]), 
        .S(swch_mode_en[1]), .Y(n144) );
  INVX1 U158 ( .A(n145), .Y(n209) );
  MUX2X1 U159 ( .B(tb_parallel_buf_ampcom[3]), .A(tb_parallel_ampcom_out[3]), 
        .S(swch_mode_en[1]), .Y(n145) );
  INVX1 U160 ( .A(n146), .Y(n210) );
  MUX2X1 U161 ( .B(tb_parallel_buf_ampcom[2]), .A(tb_parallel_ampcom_out[2]), 
        .S(swch_mode_en[1]), .Y(n146) );
  INVX1 U162 ( .A(n147), .Y(n211) );
  MUX2X1 U163 ( .B(tb_parallel_buf_ampcom[1]), .A(tb_parallel_ampcom_out[1]), 
        .S(swch_mode_en[1]), .Y(n147) );
  INVX1 U164 ( .A(n148), .Y(n212) );
  MUX2X1 U165 ( .B(tb_parallel_buf_ampcom[0]), .A(tb_parallel_ampcom_out[0]), 
        .S(swch_mode_en[1]), .Y(n148) );
  INVX1 U166 ( .A(n149), .Y(n213) );
  MUX2X1 U167 ( .B(tb_parallel_buf_ampcom[23]), .A(tb_parallel_ampcom_out[23]), 
        .S(swch_mode_en[1]), .Y(n149) );
  INVX1 U168 ( .A(n150), .Y(n214) );
  MUX2X1 U169 ( .B(tb_parallel_buf_ampcom[27]), .A(tb_parallel_ampcom_out[27]), 
        .S(swch_mode_en[1]), .Y(n150) );
  INVX1 U170 ( .A(n151), .Y(n215) );
  MUX2X1 U171 ( .B(tb_parallel_buf_ampcom[26]), .A(tb_parallel_ampcom_out[26]), 
        .S(swch_mode_en[1]), .Y(n151) );
  INVX1 U172 ( .A(n152), .Y(n216) );
  MUX2X1 U173 ( .B(tb_parallel_buf_ampcom[25]), .A(tb_parallel_ampcom_out[25]), 
        .S(swch_mode_en[1]), .Y(n152) );
  INVX1 U174 ( .A(n153), .Y(n217) );
  MUX2X1 U175 ( .B(tb_parallel_buf_ampcom[24]), .A(tb_parallel_ampcom_out[24]), 
        .S(swch_mode_en[1]), .Y(n153) );
  INVX1 U176 ( .A(n154), .Y(n218) );
  MUX2X1 U177 ( .B(tb_parallel_buf_ampcom[31]), .A(tb_parallel_ampcom_out[31]), 
        .S(swch_mode_en[1]), .Y(n154) );
  INVX1 U178 ( .A(n155), .Y(n219) );
  MUX2X1 U179 ( .B(tb_parallel_buf_ampcom[30]), .A(tb_parallel_ampcom_out[30]), 
        .S(swch_mode_en[1]), .Y(n155) );
  INVX1 U180 ( .A(n156), .Y(n220) );
  MUX2X1 U181 ( .B(tb_parallel_buf_ampcom[29]), .A(tb_parallel_ampcom_out[29]), 
        .S(swch_mode_en[1]), .Y(n156) );
  INVX1 U182 ( .A(n157), .Y(n221) );
  MUX2X1 U183 ( .B(tb_parallel_buf_ampcom[28]), .A(tb_parallel_ampcom_out[28]), 
        .S(swch_mode_en[1]), .Y(n157) );
  INVX1 U184 ( .A(n158), .Y(n222) );
  MUX2X1 U185 ( .B(tb_parallel_buf_ampcom[22]), .A(tb_parallel_ampcom_out[22]), 
        .S(swch_mode_en[1]), .Y(n158) );
  INVX1 U186 ( .A(n159), .Y(n223) );
  MUX2X1 U187 ( .B(tb_parallel_buf_ampcom[21]), .A(tb_parallel_ampcom_out[21]), 
        .S(swch_mode_en[1]), .Y(n159) );
  INVX1 U188 ( .A(n160), .Y(n224) );
  MUX2X1 U189 ( .B(tb_parallel_buf_ampcom[20]), .A(tb_parallel_ampcom_out[20]), 
        .S(swch_mode_en[1]), .Y(n160) );
  INVX1 U190 ( .A(n161), .Y(n225) );
  MUX2X1 U191 ( .B(tb_parallel_buf_ampcom[19]), .A(tb_parallel_ampcom_out[19]), 
        .S(swch_mode_en[1]), .Y(n161) );
  INVX1 U192 ( .A(n162), .Y(n226) );
  MUX2X1 U193 ( .B(tb_parallel_buf_ampcom[18]), .A(tb_parallel_ampcom_out[18]), 
        .S(swch_mode_en[1]), .Y(n162) );
  INVX1 U194 ( .A(n163), .Y(n227) );
  MUX2X1 U195 ( .B(tb_parallel_buf_ampcom[17]), .A(tb_parallel_ampcom_out[17]), 
        .S(swch_mode_en[1]), .Y(n163) );
  INVX1 U196 ( .A(n164), .Y(n228) );
  MUX2X1 U197 ( .B(tb_parallel_buf_ampcom[16]), .A(tb_parallel_ampcom_out[16]), 
        .S(swch_mode_en[1]), .Y(n164) );
  INVX1 U198 ( .A(n165), .Y(n229) );
  MUX2X1 U199 ( .B(tb_parallel_buf_ampclp[3]), .A(tb_parallel_ampclp_out[3]), 
        .S(swch_mode_en[2]), .Y(n165) );
  INVX1 U200 ( .A(n166), .Y(n230) );
  MUX2X1 U201 ( .B(tb_parallel_buf_ampclp[7]), .A(tb_parallel_ampclp_out[7]), 
        .S(swch_mode_en[2]), .Y(n166) );
  INVX1 U202 ( .A(n167), .Y(n231) );
  MUX2X1 U203 ( .B(tb_parallel_buf_ampclp[6]), .A(tb_parallel_ampclp_out[6]), 
        .S(swch_mode_en[2]), .Y(n167) );
  INVX1 U204 ( .A(n168), .Y(n232) );
  MUX2X1 U205 ( .B(tb_parallel_buf_ampclp[5]), .A(tb_parallel_ampclp_out[5]), 
        .S(swch_mode_en[2]), .Y(n168) );
  INVX1 U206 ( .A(n169), .Y(n233) );
  MUX2X1 U207 ( .B(tb_parallel_buf_ampclp[4]), .A(tb_parallel_ampclp_out[4]), 
        .S(swch_mode_en[2]), .Y(n169) );
  INVX1 U208 ( .A(n170), .Y(n234) );
  MUX2X1 U209 ( .B(tb_parallel_buf_ampclp[11]), .A(tb_parallel_ampclp_out[11]), 
        .S(swch_mode_en[2]), .Y(n170) );
  INVX1 U210 ( .A(n171), .Y(n235) );
  MUX2X1 U211 ( .B(tb_parallel_buf_ampclp[10]), .A(tb_parallel_ampclp_out[10]), 
        .S(swch_mode_en[2]), .Y(n171) );
  INVX1 U212 ( .A(n172), .Y(n236) );
  MUX2X1 U213 ( .B(tb_parallel_buf_ampclp[9]), .A(tb_parallel_ampclp_out[9]), 
        .S(swch_mode_en[2]), .Y(n172) );
  INVX1 U214 ( .A(n173), .Y(n237) );
  MUX2X1 U215 ( .B(tb_parallel_buf_ampclp[8]), .A(tb_parallel_ampclp_out[8]), 
        .S(swch_mode_en[2]), .Y(n173) );
  INVX1 U216 ( .A(n174), .Y(n238) );
  MUX2X1 U217 ( .B(tb_parallel_buf_ampclp[15]), .A(tb_parallel_ampclp_out[15]), 
        .S(swch_mode_en[2]), .Y(n174) );
  INVX1 U218 ( .A(n175), .Y(n239) );
  MUX2X1 U219 ( .B(tb_parallel_buf_ampclp[14]), .A(tb_parallel_ampclp_out[14]), 
        .S(swch_mode_en[2]), .Y(n175) );
  INVX1 U220 ( .A(n176), .Y(n240) );
  MUX2X1 U221 ( .B(tb_parallel_buf_ampclp[13]), .A(tb_parallel_ampclp_out[13]), 
        .S(swch_mode_en[2]), .Y(n176) );
  INVX1 U222 ( .A(n177), .Y(n241) );
  MUX2X1 U223 ( .B(tb_parallel_buf_ampclp[12]), .A(tb_parallel_ampclp_out[12]), 
        .S(swch_mode_en[2]), .Y(n177) );
  INVX1 U224 ( .A(n178), .Y(n242) );
  MUX2X1 U225 ( .B(tb_parallel_buf_ampclp[2]), .A(tb_parallel_ampclp_out[2]), 
        .S(swch_mode_en[2]), .Y(n178) );
  INVX1 U226 ( .A(n179), .Y(n243) );
  MUX2X1 U227 ( .B(tb_parallel_buf_ampclp[1]), .A(tb_parallel_ampclp_out[1]), 
        .S(swch_mode_en[2]), .Y(n179) );
  INVX1 U228 ( .A(n180), .Y(n244) );
  MUX2X1 U229 ( .B(tb_parallel_buf_ampclp[0]), .A(tb_parallel_ampclp_out[0]), 
        .S(swch_mode_en[2]), .Y(n180) );
  INVX1 U230 ( .A(n181), .Y(n245) );
  MUX2X1 U231 ( .B(tb_parallel_buf_ampclp[31]), .A(tb_parallel_ampclp_out[31]), 
        .S(swch_mode_en[2]), .Y(n181) );
  INVX1 U232 ( .A(n182), .Y(n246) );
  MUX2X1 U233 ( .B(tb_parallel_buf_ampclp[16]), .A(tb_parallel_ampclp_out[16]), 
        .S(swch_mode_en[2]), .Y(n182) );
  INVX1 U234 ( .A(n183), .Y(n247) );
  MUX2X1 U235 ( .B(tb_parallel_buf_ampclp[26]), .A(tb_parallel_ampclp_out[26]), 
        .S(swch_mode_en[2]), .Y(n183) );
  INVX1 U236 ( .A(n184), .Y(n248) );
  MUX2X1 U237 ( .B(tb_parallel_buf_ampclp[27]), .A(tb_parallel_ampclp_out[27]), 
        .S(swch_mode_en[2]), .Y(n184) );
  INVX1 U238 ( .A(n185), .Y(n249) );
  MUX2X1 U239 ( .B(tb_parallel_buf_ampclp[28]), .A(tb_parallel_ampclp_out[28]), 
        .S(swch_mode_en[2]), .Y(n185) );
  INVX1 U240 ( .A(n186), .Y(n250) );
  MUX2X1 U241 ( .B(tb_parallel_buf_ampclp[29]), .A(tb_parallel_ampclp_out[29]), 
        .S(swch_mode_en[2]), .Y(n186) );
  INVX1 U242 ( .A(n187), .Y(n251) );
  MUX2X1 U243 ( .B(tb_parallel_buf_ampclp[30]), .A(tb_parallel_ampclp_out[30]), 
        .S(swch_mode_en[2]), .Y(n187) );
  INVX1 U244 ( .A(n188), .Y(n252) );
  MUX2X1 U245 ( .B(tb_parallel_buf_ampclp[17]), .A(tb_parallel_ampclp_out[17]), 
        .S(swch_mode_en[2]), .Y(n188) );
  INVX1 U246 ( .A(n189), .Y(n253) );
  MUX2X1 U247 ( .B(tb_parallel_buf_ampclp[18]), .A(tb_parallel_ampclp_out[18]), 
        .S(swch_mode_en[2]), .Y(n189) );
  INVX1 U248 ( .A(n190), .Y(n254) );
  MUX2X1 U249 ( .B(tb_parallel_buf_ampclp[19]), .A(tb_parallel_ampclp_out[19]), 
        .S(swch_mode_en[2]), .Y(n190) );
  INVX1 U250 ( .A(n191), .Y(n255) );
  MUX2X1 U251 ( .B(tb_parallel_buf_ampclp[20]), .A(tb_parallel_ampclp_out[20]), 
        .S(swch_mode_en[2]), .Y(n191) );
  INVX1 U252 ( .A(n192), .Y(n256) );
  MUX2X1 U253 ( .B(tb_parallel_buf_ampclp[21]), .A(tb_parallel_ampclp_out[21]), 
        .S(swch_mode_en[2]), .Y(n192) );
  INVX1 U254 ( .A(n193), .Y(n257) );
  MUX2X1 U255 ( .B(tb_parallel_buf_ampclp[22]), .A(tb_parallel_ampclp_out[22]), 
        .S(swch_mode_en[2]), .Y(n193) );
  INVX1 U256 ( .A(n194), .Y(n258) );
  MUX2X1 U257 ( .B(tb_parallel_buf_ampclp[23]), .A(tb_parallel_ampclp_out[23]), 
        .S(swch_mode_en[2]), .Y(n194) );
  INVX1 U258 ( .A(n195), .Y(n259) );
  MUX2X1 U259 ( .B(tb_parallel_buf_ampclp[24]), .A(tb_parallel_ampclp_out[24]), 
        .S(swch_mode_en[2]), .Y(n195) );
  INVX1 U260 ( .A(n196), .Y(n260) );
  MUX2X1 U261 ( .B(tb_parallel_buf_ampclp[25]), .A(tb_parallel_ampclp_out[25]), 
        .S(swch_mode_en[2]), .Y(n196) );
endmodule

