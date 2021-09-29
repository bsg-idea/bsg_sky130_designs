

module top
(
  clk_i,
  reset_i,
  dma_cmd_i,
  dma_way_i,
  dma_addr_i,
  done_o,
  snoop_word_o,
  dma_pkt_o,
  dma_pkt_v_o,
  dma_pkt_yumi_i,
  dma_data_i,
  dma_data_v_i,
  dma_data_ready_o,
  dma_data_o,
  dma_data_v_o,
  dma_data_yumi_i,
  data_mem_v_o,
  data_mem_w_o,
  data_mem_addr_o,
  data_mem_w_mask_o,
  data_mem_data_o,
  data_mem_data_i,
  dma_evict_o
);

  input [3:0] dma_cmd_i;
  input [2:0] dma_way_i;
  input [31:0] dma_addr_i;
  output [31:0] snoop_word_o;
  output [32:0] dma_pkt_o;
  input [31:0] dma_data_i;
  output [31:0] dma_data_o;
  output [9:0] data_mem_addr_o;
  output [31:0] data_mem_w_mask_o;
  output [255:0] data_mem_data_o;
  input [255:0] data_mem_data_i;
  input clk_i;
  input reset_i;
  input dma_pkt_yumi_i;
  input dma_data_v_i;
  input dma_data_yumi_i;
  output done_o;
  output dma_pkt_v_o;
  output dma_data_ready_o;
  output dma_data_v_o;
  output data_mem_v_o;
  output data_mem_w_o;
  output dma_evict_o;

  bsg_cache_dma
  wrapper
  (
    .dma_cmd_i(dma_cmd_i),
    .dma_way_i(dma_way_i),
    .dma_addr_i(dma_addr_i),
    .snoop_word_o(snoop_word_o),
    .dma_pkt_o(dma_pkt_o),
    .dma_data_i(dma_data_i),
    .dma_data_o(dma_data_o),
    .data_mem_addr_o(data_mem_addr_o),
    .data_mem_w_mask_o(data_mem_w_mask_o),
    .data_mem_data_o(data_mem_data_o),
    .data_mem_data_i(data_mem_data_i),
    .clk_i(clk_i),
    .reset_i(reset_i),
    .dma_pkt_yumi_i(dma_pkt_yumi_i),
    .dma_data_v_i(dma_data_v_i),
    .dma_data_yumi_i(dma_data_yumi_i),
    .done_o(done_o),
    .dma_pkt_v_o(dma_pkt_v_o),
    .dma_data_ready_o(dma_data_ready_o),
    .dma_data_v_o(dma_data_v_o),
    .data_mem_v_o(data_mem_v_o),
    .data_mem_w_o(data_mem_w_o),
    .dma_evict_o(dma_evict_o)
  );


endmodule



module bsg_counter_clear_up_max_val_p8
(
  clk_i,
  reset_i,
  clear_i,
  up_i,
  count_o
);

  output [3:0] count_o;
  input clk_i;
  input reset_i;
  input clear_i;
  input up_i;
  wire N0,N1,N2,N3,N4,N5,N6,N7,N8,N9,N10,N11,N12,N13,N14,N15,N16,N17;
  reg [3:0] count_o;
  assign { N9, N8, N7, N6 } = { N17, N16, N15, N14 } + up_i;
  assign { N13, N12, N11, N10 } = (N0)? { 1'b0, 1'b0, 1'b0, 1'b0 } : 
                                  (N1)? { N9, N8, N7, N6 } : 1'b0;
  assign N0 = reset_i;
  assign N1 = N2;
  assign { N17, N16, N15, N14 } = count_o * N4;
  assign N2 = ~reset_i;
  assign N3 = N2;
  assign N4 = ~clear_i;
  assign N5 = N3 & N4;

  always @(posedge clk_i) begin
    if(1'b1) begin
      { count_o[3:0] } <= { N13, N12, N11, N10 };
    end 
  end


endmodule



module bsg_circular_ptr_slots_p8_max_add_p1
(
  clk,
  reset_i,
  add_i,
  o,
  n_o
);

  input [0:0] add_i;
  output [2:0] o;
  output [2:0] n_o;
  input clk;
  input reset_i;
  wire [2:0] n_o,genblk1_genblk1_ptr_r_p1;
  wire N0,N1,N2,N3,N4,N5,N6,N7,N8;
  reg [2:0] o;
  assign genblk1_genblk1_ptr_r_p1 = o + 1'b1;
  assign { N7, N6, N5 } = (N0)? { 1'b0, 1'b0, 1'b0 } : 
                          (N1)? n_o : 1'b0;
  assign N0 = reset_i;
  assign N1 = N4;
  assign n_o = (N2)? genblk1_genblk1_ptr_r_p1 : 
               (N3)? o : 1'b0;
  assign N2 = add_i[0];
  assign N3 = N8;
  assign N4 = ~reset_i;
  assign N8 = ~add_i[0];

  always @(posedge clk) begin
    if(1'b1) begin
      { o[2:0] } <= { N7, N6, N5 };
    end 
  end


endmodule



module bsg_fifo_tracker_els_p8
(
  clk_i,
  reset_i,
  enq_i,
  deq_i,
  wptr_r_o,
  rptr_r_o,
  rptr_n_o,
  full_o,
  empty_o
);

  output [2:0] wptr_r_o;
  output [2:0] rptr_r_o;
  output [2:0] rptr_n_o;
  input clk_i;
  input reset_i;
  input enq_i;
  input deq_i;
  output full_o;
  output empty_o;
  wire [2:0] wptr_r_o,rptr_r_o,rptr_n_o;
  wire full_o,empty_o,N0,N1,N2,N3,N4,N5,N6,N7,N8,N9,equal_ptrs,SYNOPSYS_UNCONNECTED_1,
  SYNOPSYS_UNCONNECTED_2,SYNOPSYS_UNCONNECTED_3;
  reg deq_r,enq_r;

  bsg_circular_ptr_slots_p8_max_add_p1
  rptr
  (
    .clk(clk_i),
    .reset_i(reset_i),
    .add_i(deq_i),
    .o(rptr_r_o),
    .n_o(rptr_n_o)
  );


  bsg_circular_ptr_slots_p8_max_add_p1
  wptr
  (
    .clk(clk_i),
    .reset_i(reset_i),
    .add_i(enq_i),
    .o(wptr_r_o),
    .n_o({ SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2, SYNOPSYS_UNCONNECTED_3 })
  );

  assign equal_ptrs = rptr_r_o == wptr_r_o;
  assign N5 = (N0)? 1'b1 : 
              (N9)? 1'b1 : 
              (N4)? 1'b0 : 1'b0;
  assign N0 = N2;
  assign N6 = (N0)? 1'b0 : 
              (N9)? enq_i : 1'b0;
  assign N7 = (N0)? 1'b1 : 
              (N9)? deq_i : 1'b0;
  assign N1 = enq_i | deq_i;
  assign N2 = reset_i;
  assign N3 = N1 | N2;
  assign N4 = ~N3;
  assign N8 = ~N2;
  assign N9 = N1 & N8;
  assign empty_o = equal_ptrs & deq_r;
  assign full_o = equal_ptrs & enq_r;

  always @(posedge clk_i) begin
    if(N5) begin
      deq_r <= N7;
      enq_r <= N6;
    end 
  end


endmodule

module bsg_mem_1r1w_synth_width_p32_els_p2_read_write_same_addr_p0_harden_p0
(
  w_clk_i,
  w_reset_i,
  w_v_i,
  w_addr_i,
  w_data_i,
  r_v_i,
  r_addr_i,
  r_data_o
);

  input [0:0] w_addr_i;
  input [31:0] w_data_i;
  input [0:0] r_addr_i;
  output [31:0] r_data_o;
  input w_clk_i;
  input w_reset_i;
  input w_v_i;
  input r_v_i;
  wire [31:0] r_data_o;
  wire N0,N1,N2,N3,N4,N5,N7,N8;
  reg [63:0] mem;
  assign r_data_o[31] = (N3)? mem[31] : 
                        (N0)? mem[63] : 1'b0;
  assign N0 = r_addr_i[0];
  assign r_data_o[30] = (N3)? mem[30] : 
                        (N0)? mem[62] : 1'b0;
  assign r_data_o[29] = (N3)? mem[29] : 
                        (N0)? mem[61] : 1'b0;
  assign r_data_o[28] = (N3)? mem[28] : 
                        (N0)? mem[60] : 1'b0;
  assign r_data_o[27] = (N3)? mem[27] : 
                        (N0)? mem[59] : 1'b0;
  assign r_data_o[26] = (N3)? mem[26] : 
                        (N0)? mem[58] : 1'b0;
  assign r_data_o[25] = (N3)? mem[25] : 
                        (N0)? mem[57] : 1'b0;
  assign r_data_o[24] = (N3)? mem[24] : 
                        (N0)? mem[56] : 1'b0;
  assign r_data_o[23] = (N3)? mem[23] : 
                        (N0)? mem[55] : 1'b0;
  assign r_data_o[22] = (N3)? mem[22] : 
                        (N0)? mem[54] : 1'b0;
  assign r_data_o[21] = (N3)? mem[21] : 
                        (N0)? mem[53] : 1'b0;
  assign r_data_o[20] = (N3)? mem[20] : 
                        (N0)? mem[52] : 1'b0;
  assign r_data_o[19] = (N3)? mem[19] : 
                        (N0)? mem[51] : 1'b0;
  assign r_data_o[18] = (N3)? mem[18] : 
                        (N0)? mem[50] : 1'b0;
  assign r_data_o[17] = (N3)? mem[17] : 
                        (N0)? mem[49] : 1'b0;
  assign r_data_o[16] = (N3)? mem[16] : 
                        (N0)? mem[48] : 1'b0;
  assign r_data_o[15] = (N3)? mem[15] : 
                        (N0)? mem[47] : 1'b0;
  assign r_data_o[14] = (N3)? mem[14] : 
                        (N0)? mem[46] : 1'b0;
  assign r_data_o[13] = (N3)? mem[13] : 
                        (N0)? mem[45] : 1'b0;
  assign r_data_o[12] = (N3)? mem[12] : 
                        (N0)? mem[44] : 1'b0;
  assign r_data_o[11] = (N3)? mem[11] : 
                        (N0)? mem[43] : 1'b0;
  assign r_data_o[10] = (N3)? mem[10] : 
                        (N0)? mem[42] : 1'b0;
  assign r_data_o[9] = (N3)? mem[9] : 
                       (N0)? mem[41] : 1'b0;
  assign r_data_o[8] = (N3)? mem[8] : 
                       (N0)? mem[40] : 1'b0;
  assign r_data_o[7] = (N3)? mem[7] : 
                       (N0)? mem[39] : 1'b0;
  assign r_data_o[6] = (N3)? mem[6] : 
                       (N0)? mem[38] : 1'b0;
  assign r_data_o[5] = (N3)? mem[5] : 
                       (N0)? mem[37] : 1'b0;
  assign r_data_o[4] = (N3)? mem[4] : 
                       (N0)? mem[36] : 1'b0;
  assign r_data_o[3] = (N3)? mem[3] : 
                       (N0)? mem[35] : 1'b0;
  assign r_data_o[2] = (N3)? mem[2] : 
                       (N0)? mem[34] : 1'b0;
  assign r_data_o[1] = (N3)? mem[1] : 
                       (N0)? mem[33] : 1'b0;
  assign r_data_o[0] = (N3)? mem[0] : 
                       (N0)? mem[32] : 1'b0;
  assign N5 = ~w_addr_i[0];
  assign { N8, N7 } = (N1)? { w_addr_i[0:0], N5 } : 
                      (N2)? { 1'b0, 1'b0 } : 1'b0;
  assign N1 = w_v_i;
  assign N2 = N4;
  assign N3 = ~r_addr_i[0];
  assign N4 = ~w_v_i;

  always @(posedge w_clk_i) begin
    if(N8) begin
      { mem[63:32] } <= { w_data_i[31:0] };
    end 
    if(N7) begin
      { mem[31:0] } <= { w_data_i[31:0] };
    end 
  end


endmodule

module bsg_mem_1r1w_width_p32_els_p2_read_write_same_addr_p0
(
  w_clk_i,
  w_reset_i,
  w_v_i,
  w_addr_i,
  w_data_i,
  r_v_i,
  r_addr_i,
  r_data_o
);

  input [0:0] w_addr_i;
  input [31:0] w_data_i;
  input [0:0] r_addr_i;
  output [31:0] r_data_o;
  input w_clk_i;
  input w_reset_i;
  input w_v_i;
  input r_v_i;
  wire [31:0] r_data_o;

  bsg_mem_1r1w_synth_width_p32_els_p2_read_write_same_addr_p0_harden_p0
  synth
  (
    .w_clk_i(w_clk_i),
    .w_reset_i(w_reset_i),
    .w_v_i(w_v_i),
    .w_addr_i(w_addr_i[0]),
    .w_data_i(w_data_i),
    .r_v_i(r_v_i),
    .r_addr_i(r_addr_i[0]),
    .r_data_o(r_data_o)
  );


endmodule


module bsg_mem_1r1w_synth_width_p32_els_p8_read_write_same_addr_p0_harden_p0
(
  w_clk_i,
  w_reset_i,
  w_v_i,
  w_addr_i,
  w_data_i,
  r_v_i,
  r_addr_i,
  r_data_o
);

  input [2:0] w_addr_i;
  input [31:0] w_data_i;
  input [2:0] r_addr_i;
  output [31:0] r_data_o;
  input w_clk_i;
  input w_reset_i;
  input w_v_i;
  input r_v_i;
  wire [31:0] r_data_o;
  wire N0,N1,N2,N3,N4,N5,N6,N7,N8,N9,N10,N11,N12,N13,N14,N15,N16,N17,N18,N19,N20,N21,
  N22,N23,N24,N25,N26,N27,N28,N29,N30,N31,N32,N33,N34,N35,N36,N37,N38,N39,N40,N41,
  N42,N43,N44,N45;
  reg [255:0] mem;
  assign r_data_o[31] = (N17)? mem[31] : 
                        (N19)? mem[63] : 
                        (N21)? mem[95] : 
                        (N23)? mem[127] : 
                        (N18)? mem[159] : 
                        (N20)? mem[191] : 
                        (N22)? mem[223] : 
                        (N24)? mem[255] : 1'b0;
  assign r_data_o[30] = (N17)? mem[30] : 
                        (N19)? mem[62] : 
                        (N21)? mem[94] : 
                        (N23)? mem[126] : 
                        (N18)? mem[158] : 
                        (N20)? mem[190] : 
                        (N22)? mem[222] : 
                        (N24)? mem[254] : 1'b0;
  assign r_data_o[29] = (N17)? mem[29] : 
                        (N19)? mem[61] : 
                        (N21)? mem[93] : 
                        (N23)? mem[125] : 
                        (N18)? mem[157] : 
                        (N20)? mem[189] : 
                        (N22)? mem[221] : 
                        (N24)? mem[253] : 1'b0;
  assign r_data_o[28] = (N17)? mem[28] : 
                        (N19)? mem[60] : 
                        (N21)? mem[92] : 
                        (N23)? mem[124] : 
                        (N18)? mem[156] : 
                        (N20)? mem[188] : 
                        (N22)? mem[220] : 
                        (N24)? mem[252] : 1'b0;
  assign r_data_o[27] = (N17)? mem[27] : 
                        (N19)? mem[59] : 
                        (N21)? mem[91] : 
                        (N23)? mem[123] : 
                        (N18)? mem[155] : 
                        (N20)? mem[187] : 
                        (N22)? mem[219] : 
                        (N24)? mem[251] : 1'b0;
  assign r_data_o[26] = (N17)? mem[26] : 
                        (N19)? mem[58] : 
                        (N21)? mem[90] : 
                        (N23)? mem[122] : 
                        (N18)? mem[154] : 
                        (N20)? mem[186] : 
                        (N22)? mem[218] : 
                        (N24)? mem[250] : 1'b0;
  assign r_data_o[25] = (N17)? mem[25] : 
                        (N19)? mem[57] : 
                        (N21)? mem[89] : 
                        (N23)? mem[121] : 
                        (N18)? mem[153] : 
                        (N20)? mem[185] : 
                        (N22)? mem[217] : 
                        (N24)? mem[249] : 1'b0;
  assign r_data_o[24] = (N17)? mem[24] : 
                        (N19)? mem[56] : 
                        (N21)? mem[88] : 
                        (N23)? mem[120] : 
                        (N18)? mem[152] : 
                        (N20)? mem[184] : 
                        (N22)? mem[216] : 
                        (N24)? mem[248] : 1'b0;
  assign r_data_o[23] = (N17)? mem[23] : 
                        (N19)? mem[55] : 
                        (N21)? mem[87] : 
                        (N23)? mem[119] : 
                        (N18)? mem[151] : 
                        (N20)? mem[183] : 
                        (N22)? mem[215] : 
                        (N24)? mem[247] : 1'b0;
  assign r_data_o[22] = (N17)? mem[22] : 
                        (N19)? mem[54] : 
                        (N21)? mem[86] : 
                        (N23)? mem[118] : 
                        (N18)? mem[150] : 
                        (N20)? mem[182] : 
                        (N22)? mem[214] : 
                        (N24)? mem[246] : 1'b0;
  assign r_data_o[21] = (N17)? mem[21] : 
                        (N19)? mem[53] : 
                        (N21)? mem[85] : 
                        (N23)? mem[117] : 
                        (N18)? mem[149] : 
                        (N20)? mem[181] : 
                        (N22)? mem[213] : 
                        (N24)? mem[245] : 1'b0;
  assign r_data_o[20] = (N17)? mem[20] : 
                        (N19)? mem[52] : 
                        (N21)? mem[84] : 
                        (N23)? mem[116] : 
                        (N18)? mem[148] : 
                        (N20)? mem[180] : 
                        (N22)? mem[212] : 
                        (N24)? mem[244] : 1'b0;
  assign r_data_o[19] = (N17)? mem[19] : 
                        (N19)? mem[51] : 
                        (N21)? mem[83] : 
                        (N23)? mem[115] : 
                        (N18)? mem[147] : 
                        (N20)? mem[179] : 
                        (N22)? mem[211] : 
                        (N24)? mem[243] : 1'b0;
  assign r_data_o[18] = (N17)? mem[18] : 
                        (N19)? mem[50] : 
                        (N21)? mem[82] : 
                        (N23)? mem[114] : 
                        (N18)? mem[146] : 
                        (N20)? mem[178] : 
                        (N22)? mem[210] : 
                        (N24)? mem[242] : 1'b0;
  assign r_data_o[17] = (N17)? mem[17] : 
                        (N19)? mem[49] : 
                        (N21)? mem[81] : 
                        (N23)? mem[113] : 
                        (N18)? mem[145] : 
                        (N20)? mem[177] : 
                        (N22)? mem[209] : 
                        (N24)? mem[241] : 1'b0;
  assign r_data_o[16] = (N17)? mem[16] : 
                        (N19)? mem[48] : 
                        (N21)? mem[80] : 
                        (N23)? mem[112] : 
                        (N18)? mem[144] : 
                        (N20)? mem[176] : 
                        (N22)? mem[208] : 
                        (N24)? mem[240] : 1'b0;
  assign r_data_o[15] = (N17)? mem[15] : 
                        (N19)? mem[47] : 
                        (N21)? mem[79] : 
                        (N23)? mem[111] : 
                        (N18)? mem[143] : 
                        (N20)? mem[175] : 
                        (N22)? mem[207] : 
                        (N24)? mem[239] : 1'b0;
  assign r_data_o[14] = (N17)? mem[14] : 
                        (N19)? mem[46] : 
                        (N21)? mem[78] : 
                        (N23)? mem[110] : 
                        (N18)? mem[142] : 
                        (N20)? mem[174] : 
                        (N22)? mem[206] : 
                        (N24)? mem[238] : 1'b0;
  assign r_data_o[13] = (N17)? mem[13] : 
                        (N19)? mem[45] : 
                        (N21)? mem[77] : 
                        (N23)? mem[109] : 
                        (N18)? mem[141] : 
                        (N20)? mem[173] : 
                        (N22)? mem[205] : 
                        (N24)? mem[237] : 1'b0;
  assign r_data_o[12] = (N17)? mem[12] : 
                        (N19)? mem[44] : 
                        (N21)? mem[76] : 
                        (N23)? mem[108] : 
                        (N18)? mem[140] : 
                        (N20)? mem[172] : 
                        (N22)? mem[204] : 
                        (N24)? mem[236] : 1'b0;
  assign r_data_o[11] = (N17)? mem[11] : 
                        (N19)? mem[43] : 
                        (N21)? mem[75] : 
                        (N23)? mem[107] : 
                        (N18)? mem[139] : 
                        (N20)? mem[171] : 
                        (N22)? mem[203] : 
                        (N24)? mem[235] : 1'b0;
  assign r_data_o[10] = (N17)? mem[10] : 
                        (N19)? mem[42] : 
                        (N21)? mem[74] : 
                        (N23)? mem[106] : 
                        (N18)? mem[138] : 
                        (N20)? mem[170] : 
                        (N22)? mem[202] : 
                        (N24)? mem[234] : 1'b0;
  assign r_data_o[9] = (N17)? mem[9] : 
                       (N19)? mem[41] : 
                       (N21)? mem[73] : 
                       (N23)? mem[105] : 
                       (N18)? mem[137] : 
                       (N20)? mem[169] : 
                       (N22)? mem[201] : 
                       (N24)? mem[233] : 1'b0;
  assign r_data_o[8] = (N17)? mem[8] : 
                       (N19)? mem[40] : 
                       (N21)? mem[72] : 
                       (N23)? mem[104] : 
                       (N18)? mem[136] : 
                       (N20)? mem[168] : 
                       (N22)? mem[200] : 
                       (N24)? mem[232] : 1'b0;
  assign r_data_o[7] = (N17)? mem[7] : 
                       (N19)? mem[39] : 
                       (N21)? mem[71] : 
                       (N23)? mem[103] : 
                       (N18)? mem[135] : 
                       (N20)? mem[167] : 
                       (N22)? mem[199] : 
                       (N24)? mem[231] : 1'b0;
  assign r_data_o[6] = (N17)? mem[6] : 
                       (N19)? mem[38] : 
                       (N21)? mem[70] : 
                       (N23)? mem[102] : 
                       (N18)? mem[134] : 
                       (N20)? mem[166] : 
                       (N22)? mem[198] : 
                       (N24)? mem[230] : 1'b0;
  assign r_data_o[5] = (N17)? mem[5] : 
                       (N19)? mem[37] : 
                       (N21)? mem[69] : 
                       (N23)? mem[101] : 
                       (N18)? mem[133] : 
                       (N20)? mem[165] : 
                       (N22)? mem[197] : 
                       (N24)? mem[229] : 1'b0;
  assign r_data_o[4] = (N17)? mem[4] : 
                       (N19)? mem[36] : 
                       (N21)? mem[68] : 
                       (N23)? mem[100] : 
                       (N18)? mem[132] : 
                       (N20)? mem[164] : 
                       (N22)? mem[196] : 
                       (N24)? mem[228] : 1'b0;
  assign r_data_o[3] = (N17)? mem[3] : 
                       (N19)? mem[35] : 
                       (N21)? mem[67] : 
                       (N23)? mem[99] : 
                       (N18)? mem[131] : 
                       (N20)? mem[163] : 
                       (N22)? mem[195] : 
                       (N24)? mem[227] : 1'b0;
  assign r_data_o[2] = (N17)? mem[2] : 
                       (N19)? mem[34] : 
                       (N21)? mem[66] : 
                       (N23)? mem[98] : 
                       (N18)? mem[130] : 
                       (N20)? mem[162] : 
                       (N22)? mem[194] : 
                       (N24)? mem[226] : 1'b0;
  assign r_data_o[1] = (N17)? mem[1] : 
                       (N19)? mem[33] : 
                       (N21)? mem[65] : 
                       (N23)? mem[97] : 
                       (N18)? mem[129] : 
                       (N20)? mem[161] : 
                       (N22)? mem[193] : 
                       (N24)? mem[225] : 1'b0;
  assign r_data_o[0] = (N17)? mem[0] : 
                       (N19)? mem[32] : 
                       (N21)? mem[64] : 
                       (N23)? mem[96] : 
                       (N18)? mem[128] : 
                       (N20)? mem[160] : 
                       (N22)? mem[192] : 
                       (N24)? mem[224] : 1'b0;
  assign N42 = w_addr_i[0] & w_addr_i[1];
  assign N33 = N42 & w_addr_i[2];
  assign N43 = N0 & w_addr_i[1];
  assign N0 = ~w_addr_i[0];
  assign N32 = N43 & w_addr_i[2];
  assign N44 = w_addr_i[0] & N1;
  assign N1 = ~w_addr_i[1];
  assign N31 = N44 & w_addr_i[2];
  assign N45 = N2 & N3;
  assign N2 = ~w_addr_i[0];
  assign N3 = ~w_addr_i[1];
  assign N30 = N45 & w_addr_i[2];
  assign N29 = N42 & N4;
  assign N4 = ~w_addr_i[2];
  assign N28 = N43 & N5;
  assign N5 = ~w_addr_i[2];
  assign N27 = N44 & N6;
  assign N6 = ~w_addr_i[2];
  assign N26 = N45 & N7;
  assign N7 = ~w_addr_i[2];
  assign { N41, N40, N39, N38, N37, N36, N35, N34 } = (N8)? { N33, N32, N31, N30, N29, N28, N27, N26 } : 
                                                      (N9)? { 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0 } : 1'b0;
  assign N8 = w_v_i;
  assign N9 = N25;
  assign N10 = ~r_addr_i[0];
  assign N11 = ~r_addr_i[1];
  assign N12 = N10 & N11;
  assign N13 = N10 & r_addr_i[1];
  assign N14 = r_addr_i[0] & N11;
  assign N15 = r_addr_i[0] & r_addr_i[1];
  assign N16 = ~r_addr_i[2];
  assign N17 = N12 & N16;
  assign N18 = N12 & r_addr_i[2];
  assign N19 = N14 & N16;
  assign N20 = N14 & r_addr_i[2];
  assign N21 = N13 & N16;
  assign N22 = N13 & r_addr_i[2];
  assign N23 = N15 & N16;
  assign N24 = N15 & r_addr_i[2];
  assign N25 = ~w_v_i;

  always @(posedge w_clk_i) begin
    if(N41) begin
      { mem[255:224] } <= { w_data_i[31:0] };
    end 
    if(N40) begin
      { mem[223:192] } <= { w_data_i[31:0] };
    end 
    if(N39) begin
      { mem[191:160] } <= { w_data_i[31:0] };
    end 
    if(N38) begin
      { mem[159:128] } <= { w_data_i[31:0] };
    end 
    if(N37) begin
      { mem[127:96] } <= { w_data_i[31:0] };
    end 
    if(N36) begin
      { mem[95:64] } <= { w_data_i[31:0] };
    end 
    if(N35) begin
      { mem[63:32] } <= { w_data_i[31:0] };
    end 
    if(N34) begin
      { mem[31:0] } <= { w_data_i[31:0] };
    end 
  end


endmodule


module bsg_fifo_1r1w_small_unhardened_width_p32_els_p8_ready_THEN_valid_p0
(
  clk_i,
  reset_i,
  v_i,
  ready_o,
  data_i,
  v_o,
  data_o,
  yumi_i
);

  input [31:0] data_i;
  output [31:0] data_o;
  input clk_i;
  input reset_i;
  input v_i;
  input yumi_i;
  output ready_o;
  output v_o;
  wire [31:0] data_o;
  wire ready_o,v_o,enque,full,empty,SYNOPSYS_UNCONNECTED_1,SYNOPSYS_UNCONNECTED_2,
  SYNOPSYS_UNCONNECTED_3;
  wire [2:0] wptr_r,rptr_r;

  bsg_fifo_tracker_els_p8
  ft
  (
    .clk_i(clk_i),
    .reset_i(reset_i),
    .enq_i(enque),
    .deq_i(yumi_i),
    .wptr_r_o(wptr_r),
    .rptr_r_o(rptr_r),
    .rptr_n_o({ SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2, SYNOPSYS_UNCONNECTED_3 }),
    .full_o(full),
    .empty_o(empty)
  );


  bsg_mem_1r1w_width_p32_els_p8_read_write_same_addr_p0 mem_1r1w
  (
`ifdef USE_POWER_PINS
	.vccd1(vccd1),
	.vssd1(vssd1),
`endif
    .w_clk_i(clk_i),
    .w_reset_i(reset_i),
    .w_v_i(enque),
    .w_addr_i(wptr_r),
    .w_data_i(data_i),
    .r_v_i(v_o),
    .r_addr_i(rptr_r),
    .r_data_o(data_o)
  );

  assign enque = v_i & ready_o;
  assign ready_o = ~full;
  assign v_o = ~empty;

endmodule



module bsg_fifo_1r1w_small_width_p32_els_p8
(
  clk_i,
  reset_i,
  v_i,
  ready_o,
  data_i,
  v_o,
  data_o,
  yumi_i
);

  input [31:0] data_i;
  output [31:0] data_o;
  input clk_i;
  input reset_i;
  input v_i;
  input yumi_i;
  output ready_o;
  output v_o;
  wire [31:0] data_o;
  wire ready_o,v_o;

  bsg_fifo_1r1w_small_unhardened_width_p32_els_p8_ready_THEN_valid_p0
  unhardened_fifo
  (
    .clk_i(clk_i),
    .reset_i(reset_i),
    .v_i(v_i),
    .ready_o(ready_o),
    .data_i(data_i),
    .v_o(v_o),
    .data_o(data_o),
    .yumi_i(yumi_i)
  );


endmodule



module bsg_two_fifo_width_p32
(
  clk_i,
  reset_i,
  ready_o,
  data_i,
  v_i,
  v_o,
  data_o,
  yumi_i
);

  input [31:0] data_i;
  output [31:0] data_o;
  input clk_i;
  input reset_i;
  input v_i;
  input yumi_i;
  output ready_o;
  output v_o;
  wire [31:0] data_o;
  wire ready_o,v_o,N0,N1,enq_i,n_0_net_,N2,N3,N4,N5,N6,N7,N8,N9,N10,N11,N12,N13,N14,
  N15,N16,N17,N18,N19,N20,N21,N22,N23,N24;
  reg full_r,tail_r,head_r,empty_r;

  bsg_mem_1r1w_width_p32_els_p2_read_write_same_addr_p0
  mem_1r1w
  (
    .w_clk_i(clk_i),
    .w_reset_i(reset_i),
    .w_v_i(enq_i),
    .w_addr_i(tail_r),
    .w_data_i(data_i),
    .r_v_i(n_0_net_),
    .r_addr_i(head_r),
    .r_data_o(data_o)
  );

  assign N9 = (N0)? 1'b1 : 
              (N1)? N5 : 1'b0;
  assign N0 = N3;
  assign N1 = N2;
  assign N10 = (N0)? 1'b0 : 
               (N1)? N4 : 1'b0;
  assign N11 = (N0)? 1'b1 : 
               (N1)? yumi_i : 1'b0;
  assign N12 = (N0)? 1'b0 : 
               (N1)? N6 : 1'b0;
  assign N13 = (N0)? 1'b1 : 
               (N1)? N7 : 1'b0;
  assign N14 = (N0)? 1'b0 : 
               (N1)? N8 : 1'b0;
  assign n_0_net_ = ~empty_r;
  assign v_o = ~empty_r;
  assign ready_o = ~full_r;
  assign enq_i = v_i & N15;
  assign N15 = ~full_r;
  assign N2 = ~reset_i;
  assign N3 = reset_i;
  assign N5 = enq_i;
  assign N4 = ~tail_r;
  assign N6 = ~head_r;
  assign N7 = N17 | N19;
  assign N17 = empty_r & N16;
  assign N16 = ~enq_i;
  assign N19 = N18 & N16;
  assign N18 = N15 & yumi_i;
  assign N8 = N23 | N24;
  assign N23 = N21 & N22;
  assign N21 = N20 & enq_i;
  assign N20 = ~empty_r;
  assign N22 = ~yumi_i;
  assign N24 = full_r & N22;

  always @(posedge clk_i) begin
    if(1'b1) begin
      full_r <= N14;
      empty_r <= N13;
    end 
    if(N9) begin
      tail_r <= N10;
    end 
    if(N11) begin
      head_r <= N12;
    end 
  end


endmodule



module bsg_decode_num_out_p8
(
  i,
  o
);

  input [2:0] i;
  output [7:0] o;
  wire [7:0] o;
  assign o = { 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1 } << i;

endmodule



module bsg_mux_width_p32_els_p8
(
  data_i,
  sel_i,
  data_o
);

  input [255:0] data_i;
  input [2:0] sel_i;
  output [31:0] data_o;
  wire [31:0] data_o;
  wire N0,N1,N2,N3,N4,N5,N6,N7,N8,N9,N10,N11,N12,N13,N14;
  assign data_o[31] = (N7)? data_i[31] : 
                      (N9)? data_i[63] : 
                      (N11)? data_i[95] : 
                      (N13)? data_i[127] : 
                      (N8)? data_i[159] : 
                      (N10)? data_i[191] : 
                      (N12)? data_i[223] : 
                      (N14)? data_i[255] : 1'b0;
  assign data_o[30] = (N7)? data_i[30] : 
                      (N9)? data_i[62] : 
                      (N11)? data_i[94] : 
                      (N13)? data_i[126] : 
                      (N8)? data_i[158] : 
                      (N10)? data_i[190] : 
                      (N12)? data_i[222] : 
                      (N14)? data_i[254] : 1'b0;
  assign data_o[29] = (N7)? data_i[29] : 
                      (N9)? data_i[61] : 
                      (N11)? data_i[93] : 
                      (N13)? data_i[125] : 
                      (N8)? data_i[157] : 
                      (N10)? data_i[189] : 
                      (N12)? data_i[221] : 
                      (N14)? data_i[253] : 1'b0;
  assign data_o[28] = (N7)? data_i[28] : 
                      (N9)? data_i[60] : 
                      (N11)? data_i[92] : 
                      (N13)? data_i[124] : 
                      (N8)? data_i[156] : 
                      (N10)? data_i[188] : 
                      (N12)? data_i[220] : 
                      (N14)? data_i[252] : 1'b0;
  assign data_o[27] = (N7)? data_i[27] : 
                      (N9)? data_i[59] : 
                      (N11)? data_i[91] : 
                      (N13)? data_i[123] : 
                      (N8)? data_i[155] : 
                      (N10)? data_i[187] : 
                      (N12)? data_i[219] : 
                      (N14)? data_i[251] : 1'b0;
  assign data_o[26] = (N7)? data_i[26] : 
                      (N9)? data_i[58] : 
                      (N11)? data_i[90] : 
                      (N13)? data_i[122] : 
                      (N8)? data_i[154] : 
                      (N10)? data_i[186] : 
                      (N12)? data_i[218] : 
                      (N14)? data_i[250] : 1'b0;
  assign data_o[25] = (N7)? data_i[25] : 
                      (N9)? data_i[57] : 
                      (N11)? data_i[89] : 
                      (N13)? data_i[121] : 
                      (N8)? data_i[153] : 
                      (N10)? data_i[185] : 
                      (N12)? data_i[217] : 
                      (N14)? data_i[249] : 1'b0;
  assign data_o[24] = (N7)? data_i[24] : 
                      (N9)? data_i[56] : 
                      (N11)? data_i[88] : 
                      (N13)? data_i[120] : 
                      (N8)? data_i[152] : 
                      (N10)? data_i[184] : 
                      (N12)? data_i[216] : 
                      (N14)? data_i[248] : 1'b0;
  assign data_o[23] = (N7)? data_i[23] : 
                      (N9)? data_i[55] : 
                      (N11)? data_i[87] : 
                      (N13)? data_i[119] : 
                      (N8)? data_i[151] : 
                      (N10)? data_i[183] : 
                      (N12)? data_i[215] : 
                      (N14)? data_i[247] : 1'b0;
  assign data_o[22] = (N7)? data_i[22] : 
                      (N9)? data_i[54] : 
                      (N11)? data_i[86] : 
                      (N13)? data_i[118] : 
                      (N8)? data_i[150] : 
                      (N10)? data_i[182] : 
                      (N12)? data_i[214] : 
                      (N14)? data_i[246] : 1'b0;
  assign data_o[21] = (N7)? data_i[21] : 
                      (N9)? data_i[53] : 
                      (N11)? data_i[85] : 
                      (N13)? data_i[117] : 
                      (N8)? data_i[149] : 
                      (N10)? data_i[181] : 
                      (N12)? data_i[213] : 
                      (N14)? data_i[245] : 1'b0;
  assign data_o[20] = (N7)? data_i[20] : 
                      (N9)? data_i[52] : 
                      (N11)? data_i[84] : 
                      (N13)? data_i[116] : 
                      (N8)? data_i[148] : 
                      (N10)? data_i[180] : 
                      (N12)? data_i[212] : 
                      (N14)? data_i[244] : 1'b0;
  assign data_o[19] = (N7)? data_i[19] : 
                      (N9)? data_i[51] : 
                      (N11)? data_i[83] : 
                      (N13)? data_i[115] : 
                      (N8)? data_i[147] : 
                      (N10)? data_i[179] : 
                      (N12)? data_i[211] : 
                      (N14)? data_i[243] : 1'b0;
  assign data_o[18] = (N7)? data_i[18] : 
                      (N9)? data_i[50] : 
                      (N11)? data_i[82] : 
                      (N13)? data_i[114] : 
                      (N8)? data_i[146] : 
                      (N10)? data_i[178] : 
                      (N12)? data_i[210] : 
                      (N14)? data_i[242] : 1'b0;
  assign data_o[17] = (N7)? data_i[17] : 
                      (N9)? data_i[49] : 
                      (N11)? data_i[81] : 
                      (N13)? data_i[113] : 
                      (N8)? data_i[145] : 
                      (N10)? data_i[177] : 
                      (N12)? data_i[209] : 
                      (N14)? data_i[241] : 1'b0;
  assign data_o[16] = (N7)? data_i[16] : 
                      (N9)? data_i[48] : 
                      (N11)? data_i[80] : 
                      (N13)? data_i[112] : 
                      (N8)? data_i[144] : 
                      (N10)? data_i[176] : 
                      (N12)? data_i[208] : 
                      (N14)? data_i[240] : 1'b0;
  assign data_o[15] = (N7)? data_i[15] : 
                      (N9)? data_i[47] : 
                      (N11)? data_i[79] : 
                      (N13)? data_i[111] : 
                      (N8)? data_i[143] : 
                      (N10)? data_i[175] : 
                      (N12)? data_i[207] : 
                      (N14)? data_i[239] : 1'b0;
  assign data_o[14] = (N7)? data_i[14] : 
                      (N9)? data_i[46] : 
                      (N11)? data_i[78] : 
                      (N13)? data_i[110] : 
                      (N8)? data_i[142] : 
                      (N10)? data_i[174] : 
                      (N12)? data_i[206] : 
                      (N14)? data_i[238] : 1'b0;
  assign data_o[13] = (N7)? data_i[13] : 
                      (N9)? data_i[45] : 
                      (N11)? data_i[77] : 
                      (N13)? data_i[109] : 
                      (N8)? data_i[141] : 
                      (N10)? data_i[173] : 
                      (N12)? data_i[205] : 
                      (N14)? data_i[237] : 1'b0;
  assign data_o[12] = (N7)? data_i[12] : 
                      (N9)? data_i[44] : 
                      (N11)? data_i[76] : 
                      (N13)? data_i[108] : 
                      (N8)? data_i[140] : 
                      (N10)? data_i[172] : 
                      (N12)? data_i[204] : 
                      (N14)? data_i[236] : 1'b0;
  assign data_o[11] = (N7)? data_i[11] : 
                      (N9)? data_i[43] : 
                      (N11)? data_i[75] : 
                      (N13)? data_i[107] : 
                      (N8)? data_i[139] : 
                      (N10)? data_i[171] : 
                      (N12)? data_i[203] : 
                      (N14)? data_i[235] : 1'b0;
  assign data_o[10] = (N7)? data_i[10] : 
                      (N9)? data_i[42] : 
                      (N11)? data_i[74] : 
                      (N13)? data_i[106] : 
                      (N8)? data_i[138] : 
                      (N10)? data_i[170] : 
                      (N12)? data_i[202] : 
                      (N14)? data_i[234] : 1'b0;
  assign data_o[9] = (N7)? data_i[9] : 
                     (N9)? data_i[41] : 
                     (N11)? data_i[73] : 
                     (N13)? data_i[105] : 
                     (N8)? data_i[137] : 
                     (N10)? data_i[169] : 
                     (N12)? data_i[201] : 
                     (N14)? data_i[233] : 1'b0;
  assign data_o[8] = (N7)? data_i[8] : 
                     (N9)? data_i[40] : 
                     (N11)? data_i[72] : 
                     (N13)? data_i[104] : 
                     (N8)? data_i[136] : 
                     (N10)? data_i[168] : 
                     (N12)? data_i[200] : 
                     (N14)? data_i[232] : 1'b0;
  assign data_o[7] = (N7)? data_i[7] : 
                     (N9)? data_i[39] : 
                     (N11)? data_i[71] : 
                     (N13)? data_i[103] : 
                     (N8)? data_i[135] : 
                     (N10)? data_i[167] : 
                     (N12)? data_i[199] : 
                     (N14)? data_i[231] : 1'b0;
  assign data_o[6] = (N7)? data_i[6] : 
                     (N9)? data_i[38] : 
                     (N11)? data_i[70] : 
                     (N13)? data_i[102] : 
                     (N8)? data_i[134] : 
                     (N10)? data_i[166] : 
                     (N12)? data_i[198] : 
                     (N14)? data_i[230] : 1'b0;
  assign data_o[5] = (N7)? data_i[5] : 
                     (N9)? data_i[37] : 
                     (N11)? data_i[69] : 
                     (N13)? data_i[101] : 
                     (N8)? data_i[133] : 
                     (N10)? data_i[165] : 
                     (N12)? data_i[197] : 
                     (N14)? data_i[229] : 1'b0;
  assign data_o[4] = (N7)? data_i[4] : 
                     (N9)? data_i[36] : 
                     (N11)? data_i[68] : 
                     (N13)? data_i[100] : 
                     (N8)? data_i[132] : 
                     (N10)? data_i[164] : 
                     (N12)? data_i[196] : 
                     (N14)? data_i[228] : 1'b0;
  assign data_o[3] = (N7)? data_i[3] : 
                     (N9)? data_i[35] : 
                     (N11)? data_i[67] : 
                     (N13)? data_i[99] : 
                     (N8)? data_i[131] : 
                     (N10)? data_i[163] : 
                     (N12)? data_i[195] : 
                     (N14)? data_i[227] : 1'b0;
  assign data_o[2] = (N7)? data_i[2] : 
                     (N9)? data_i[34] : 
                     (N11)? data_i[66] : 
                     (N13)? data_i[98] : 
                     (N8)? data_i[130] : 
                     (N10)? data_i[162] : 
                     (N12)? data_i[194] : 
                     (N14)? data_i[226] : 1'b0;
  assign data_o[1] = (N7)? data_i[1] : 
                     (N9)? data_i[33] : 
                     (N11)? data_i[65] : 
                     (N13)? data_i[97] : 
                     (N8)? data_i[129] : 
                     (N10)? data_i[161] : 
                     (N12)? data_i[193] : 
                     (N14)? data_i[225] : 1'b0;
  assign data_o[0] = (N7)? data_i[0] : 
                     (N9)? data_i[32] : 
                     (N11)? data_i[64] : 
                     (N13)? data_i[96] : 
                     (N8)? data_i[128] : 
                     (N10)? data_i[160] : 
                     (N12)? data_i[192] : 
                     (N14)? data_i[224] : 1'b0;
  assign N0 = ~sel_i[0];
  assign N1 = ~sel_i[1];
  assign N2 = N0 & N1;
  assign N3 = N0 & sel_i[1];
  assign N4 = sel_i[0] & N1;
  assign N5 = sel_i[0] & sel_i[1];
  assign N6 = ~sel_i[2];
  assign N7 = N2 & N6;
  assign N8 = N2 & sel_i[2];
  assign N9 = N4 & N6;
  assign N10 = N4 & sel_i[2];
  assign N11 = N3 & N6;
  assign N12 = N3 & sel_i[2];
  assign N13 = N5 & N6;
  assign N14 = N5 & sel_i[2];

endmodule



module bsg_cache_dma
(
  clk_i,
  reset_i,
  dma_cmd_i,
  dma_way_i,
  dma_addr_i,
  done_o,
  snoop_word_o,
  dma_pkt_o,
  dma_pkt_v_o,
  dma_pkt_yumi_i,
  dma_data_i,
  dma_data_v_i,
  dma_data_ready_o,
  dma_data_o,
  dma_data_v_o,
  dma_data_yumi_i,
  data_mem_v_o,
  data_mem_w_o,
  data_mem_addr_o,
  data_mem_w_mask_o,
  data_mem_data_o,
  data_mem_data_i,
  dma_evict_o
);

  input [3:0] dma_cmd_i;
  input [2:0] dma_way_i;
  input [31:0] dma_addr_i;
  output [31:0] snoop_word_o;
  output [32:0] dma_pkt_o;
  input [31:0] dma_data_i;
  output [31:0] dma_data_o;
  output [9:0] data_mem_addr_o;
  output [31:0] data_mem_w_mask_o;
  output [255:0] data_mem_data_o;
  input [255:0] data_mem_data_i;
  input clk_i;
  input reset_i;
  input dma_pkt_yumi_i;
  input dma_data_v_i;
  input dma_data_yumi_i;
  output done_o;
  output dma_pkt_v_o;
  output dma_data_ready_o;
  output dma_data_v_o;
  output data_mem_v_o;
  output data_mem_w_o;
  output dma_evict_o;
  wire [32:0] dma_pkt_o;
  wire [31:0] dma_data_o,data_mem_w_mask_o,out_fifo_data_li;
  wire [9:0] data_mem_addr_o;
  wire [255:0] data_mem_data_o;
  wire done_o,dma_pkt_v_o,dma_data_ready_o,dma_data_v_o,data_mem_v_o,data_mem_w_o,
  dma_evict_o,N0,N1,N2,N3,N4,N5,N6,N7,N8,N9,N10,counter_clear,counter_up,in_fifo_v_lo,
  in_fifo_yumi_li,out_fifo_v_li,out_fifo_ready_lo,N11,N12,N13,N14,N15,N16,N17,N18,
  N19,N20,N21,N22,N23,N24,N25,N26,N27,N28,N29,N30,N31,N32,N33,N34,N35,N36,N37,N38,
  N39,N40,N41,N42,N43,N44,N45,N46,N47,N48,N49,N50,N51,N52,N53,N54,N55,N56,N57,N58,
  N59,N60,snoop_word_we,N61,N62,N63,N64,N65,N66,N67,N68,N69,N70,N71,N72,N73,N74,
  N75,N76,N77,N78,N79;
  wire [3:3] counter_r;
  wire [1:0] dma_state_n;
  reg [31:0] snoop_word_o;
  reg [1:0] dma_state_r;
  assign dma_pkt_o[0] = 1'b0;
  assign dma_pkt_o[1] = 1'b0;
  assign dma_pkt_o[2] = 1'b0;
  assign dma_pkt_o[3] = 1'b0;
  assign dma_pkt_o[4] = 1'b0;
  assign dma_pkt_o[31] = dma_addr_i[31];
  assign dma_pkt_o[30] = dma_addr_i[30];
  assign dma_pkt_o[29] = dma_addr_i[29];
  assign dma_pkt_o[28] = dma_addr_i[28];
  assign dma_pkt_o[27] = dma_addr_i[27];
  assign dma_pkt_o[26] = dma_addr_i[26];
  assign dma_pkt_o[25] = dma_addr_i[25];
  assign dma_pkt_o[24] = dma_addr_i[24];
  assign dma_pkt_o[23] = dma_addr_i[23];
  assign dma_pkt_o[22] = dma_addr_i[22];
  assign dma_pkt_o[21] = dma_addr_i[21];
  assign dma_pkt_o[20] = dma_addr_i[20];
  assign dma_pkt_o[19] = dma_addr_i[19];
  assign dma_pkt_o[18] = dma_addr_i[18];
  assign dma_pkt_o[17] = dma_addr_i[17];
  assign dma_pkt_o[16] = dma_addr_i[16];
  assign dma_pkt_o[15] = dma_addr_i[15];
  assign dma_pkt_o[14] = dma_addr_i[14];
  assign dma_pkt_o[13] = dma_addr_i[13];
  assign dma_pkt_o[12] = dma_addr_i[12];
  assign data_mem_addr_o[9] = dma_addr_i[11];
  assign dma_pkt_o[11] = dma_addr_i[11];
  assign data_mem_addr_o[8] = dma_addr_i[10];
  assign dma_pkt_o[10] = dma_addr_i[10];
  assign data_mem_addr_o[7] = dma_addr_i[9];
  assign dma_pkt_o[9] = dma_addr_i[9];
  assign data_mem_addr_o[6] = dma_addr_i[8];
  assign dma_pkt_o[8] = dma_addr_i[8];
  assign data_mem_addr_o[5] = dma_addr_i[7];
  assign dma_pkt_o[7] = dma_addr_i[7];
  assign data_mem_addr_o[4] = dma_addr_i[6];
  assign dma_pkt_o[6] = dma_addr_i[6];
  assign data_mem_addr_o[3] = dma_addr_i[5];
  assign dma_pkt_o[5] = dma_addr_i[5];
  assign data_mem_w_mask_o[28] = data_mem_w_mask_o[31];
  assign data_mem_w_mask_o[29] = data_mem_w_mask_o[31];
  assign data_mem_w_mask_o[30] = data_mem_w_mask_o[31];
  assign data_mem_w_mask_o[24] = data_mem_w_mask_o[27];
  assign data_mem_w_mask_o[25] = data_mem_w_mask_o[27];
  assign data_mem_w_mask_o[26] = data_mem_w_mask_o[27];
  assign data_mem_w_mask_o[20] = data_mem_w_mask_o[23];
  assign data_mem_w_mask_o[21] = data_mem_w_mask_o[23];
  assign data_mem_w_mask_o[22] = data_mem_w_mask_o[23];
  assign data_mem_w_mask_o[16] = data_mem_w_mask_o[19];
  assign data_mem_w_mask_o[17] = data_mem_w_mask_o[19];
  assign data_mem_w_mask_o[18] = data_mem_w_mask_o[19];
  assign data_mem_w_mask_o[12] = data_mem_w_mask_o[15];
  assign data_mem_w_mask_o[13] = data_mem_w_mask_o[15];
  assign data_mem_w_mask_o[14] = data_mem_w_mask_o[15];
  assign data_mem_w_mask_o[8] = data_mem_w_mask_o[11];
  assign data_mem_w_mask_o[9] = data_mem_w_mask_o[11];
  assign data_mem_w_mask_o[10] = data_mem_w_mask_o[11];
  assign data_mem_w_mask_o[4] = data_mem_w_mask_o[7];
  assign data_mem_w_mask_o[5] = data_mem_w_mask_o[7];
  assign data_mem_w_mask_o[6] = data_mem_w_mask_o[7];
  assign data_mem_w_mask_o[0] = data_mem_w_mask_o[3];
  assign data_mem_w_mask_o[1] = data_mem_w_mask_o[3];
  assign data_mem_w_mask_o[2] = data_mem_w_mask_o[3];
  assign data_mem_data_o[31] = data_mem_data_o[255];
  assign data_mem_data_o[63] = data_mem_data_o[255];
  assign data_mem_data_o[95] = data_mem_data_o[255];
  assign data_mem_data_o[127] = data_mem_data_o[255];
  assign data_mem_data_o[159] = data_mem_data_o[255];
  assign data_mem_data_o[191] = data_mem_data_o[255];
  assign data_mem_data_o[223] = data_mem_data_o[255];
  assign data_mem_data_o[30] = data_mem_data_o[254];
  assign data_mem_data_o[62] = data_mem_data_o[254];
  assign data_mem_data_o[94] = data_mem_data_o[254];
  assign data_mem_data_o[126] = data_mem_data_o[254];
  assign data_mem_data_o[158] = data_mem_data_o[254];
  assign data_mem_data_o[190] = data_mem_data_o[254];
  assign data_mem_data_o[222] = data_mem_data_o[254];
  assign data_mem_data_o[29] = data_mem_data_o[253];
  assign data_mem_data_o[61] = data_mem_data_o[253];
  assign data_mem_data_o[93] = data_mem_data_o[253];
  assign data_mem_data_o[125] = data_mem_data_o[253];
  assign data_mem_data_o[157] = data_mem_data_o[253];
  assign data_mem_data_o[189] = data_mem_data_o[253];
  assign data_mem_data_o[221] = data_mem_data_o[253];
  assign data_mem_data_o[28] = data_mem_data_o[252];
  assign data_mem_data_o[60] = data_mem_data_o[252];
  assign data_mem_data_o[92] = data_mem_data_o[252];
  assign data_mem_data_o[124] = data_mem_data_o[252];
  assign data_mem_data_o[156] = data_mem_data_o[252];
  assign data_mem_data_o[188] = data_mem_data_o[252];
  assign data_mem_data_o[220] = data_mem_data_o[252];
  assign data_mem_data_o[27] = data_mem_data_o[251];
  assign data_mem_data_o[59] = data_mem_data_o[251];
  assign data_mem_data_o[91] = data_mem_data_o[251];
  assign data_mem_data_o[123] = data_mem_data_o[251];
  assign data_mem_data_o[155] = data_mem_data_o[251];
  assign data_mem_data_o[187] = data_mem_data_o[251];
  assign data_mem_data_o[219] = data_mem_data_o[251];
  assign data_mem_data_o[26] = data_mem_data_o[250];
  assign data_mem_data_o[58] = data_mem_data_o[250];
  assign data_mem_data_o[90] = data_mem_data_o[250];
  assign data_mem_data_o[122] = data_mem_data_o[250];
  assign data_mem_data_o[154] = data_mem_data_o[250];
  assign data_mem_data_o[186] = data_mem_data_o[250];
  assign data_mem_data_o[218] = data_mem_data_o[250];
  assign data_mem_data_o[25] = data_mem_data_o[249];
  assign data_mem_data_o[57] = data_mem_data_o[249];
  assign data_mem_data_o[89] = data_mem_data_o[249];
  assign data_mem_data_o[121] = data_mem_data_o[249];
  assign data_mem_data_o[153] = data_mem_data_o[249];
  assign data_mem_data_o[185] = data_mem_data_o[249];
  assign data_mem_data_o[217] = data_mem_data_o[249];
  assign data_mem_data_o[24] = data_mem_data_o[248];
  assign data_mem_data_o[56] = data_mem_data_o[248];
  assign data_mem_data_o[88] = data_mem_data_o[248];
  assign data_mem_data_o[120] = data_mem_data_o[248];
  assign data_mem_data_o[152] = data_mem_data_o[248];
  assign data_mem_data_o[184] = data_mem_data_o[248];
  assign data_mem_data_o[216] = data_mem_data_o[248];
  assign data_mem_data_o[23] = data_mem_data_o[247];
  assign data_mem_data_o[55] = data_mem_data_o[247];
  assign data_mem_data_o[87] = data_mem_data_o[247];
  assign data_mem_data_o[119] = data_mem_data_o[247];
  assign data_mem_data_o[151] = data_mem_data_o[247];
  assign data_mem_data_o[183] = data_mem_data_o[247];
  assign data_mem_data_o[215] = data_mem_data_o[247];
  assign data_mem_data_o[22] = data_mem_data_o[246];
  assign data_mem_data_o[54] = data_mem_data_o[246];
  assign data_mem_data_o[86] = data_mem_data_o[246];
  assign data_mem_data_o[118] = data_mem_data_o[246];
  assign data_mem_data_o[150] = data_mem_data_o[246];
  assign data_mem_data_o[182] = data_mem_data_o[246];
  assign data_mem_data_o[214] = data_mem_data_o[246];
  assign data_mem_data_o[21] = data_mem_data_o[245];
  assign data_mem_data_o[53] = data_mem_data_o[245];
  assign data_mem_data_o[85] = data_mem_data_o[245];
  assign data_mem_data_o[117] = data_mem_data_o[245];
  assign data_mem_data_o[149] = data_mem_data_o[245];
  assign data_mem_data_o[181] = data_mem_data_o[245];
  assign data_mem_data_o[213] = data_mem_data_o[245];
  assign data_mem_data_o[20] = data_mem_data_o[244];
  assign data_mem_data_o[52] = data_mem_data_o[244];
  assign data_mem_data_o[84] = data_mem_data_o[244];
  assign data_mem_data_o[116] = data_mem_data_o[244];
  assign data_mem_data_o[148] = data_mem_data_o[244];
  assign data_mem_data_o[180] = data_mem_data_o[244];
  assign data_mem_data_o[212] = data_mem_data_o[244];
  assign data_mem_data_o[19] = data_mem_data_o[243];
  assign data_mem_data_o[51] = data_mem_data_o[243];
  assign data_mem_data_o[83] = data_mem_data_o[243];
  assign data_mem_data_o[115] = data_mem_data_o[243];
  assign data_mem_data_o[147] = data_mem_data_o[243];
  assign data_mem_data_o[179] = data_mem_data_o[243];
  assign data_mem_data_o[211] = data_mem_data_o[243];
  assign data_mem_data_o[18] = data_mem_data_o[242];
  assign data_mem_data_o[50] = data_mem_data_o[242];
  assign data_mem_data_o[82] = data_mem_data_o[242];
  assign data_mem_data_o[114] = data_mem_data_o[242];
  assign data_mem_data_o[146] = data_mem_data_o[242];
  assign data_mem_data_o[178] = data_mem_data_o[242];
  assign data_mem_data_o[210] = data_mem_data_o[242];
  assign data_mem_data_o[17] = data_mem_data_o[241];
  assign data_mem_data_o[49] = data_mem_data_o[241];
  assign data_mem_data_o[81] = data_mem_data_o[241];
  assign data_mem_data_o[113] = data_mem_data_o[241];
  assign data_mem_data_o[145] = data_mem_data_o[241];
  assign data_mem_data_o[177] = data_mem_data_o[241];
  assign data_mem_data_o[209] = data_mem_data_o[241];
  assign data_mem_data_o[16] = data_mem_data_o[240];
  assign data_mem_data_o[48] = data_mem_data_o[240];
  assign data_mem_data_o[80] = data_mem_data_o[240];
  assign data_mem_data_o[112] = data_mem_data_o[240];
  assign data_mem_data_o[144] = data_mem_data_o[240];
  assign data_mem_data_o[176] = data_mem_data_o[240];
  assign data_mem_data_o[208] = data_mem_data_o[240];
  assign data_mem_data_o[15] = data_mem_data_o[239];
  assign data_mem_data_o[47] = data_mem_data_o[239];
  assign data_mem_data_o[79] = data_mem_data_o[239];
  assign data_mem_data_o[111] = data_mem_data_o[239];
  assign data_mem_data_o[143] = data_mem_data_o[239];
  assign data_mem_data_o[175] = data_mem_data_o[239];
  assign data_mem_data_o[207] = data_mem_data_o[239];
  assign data_mem_data_o[14] = data_mem_data_o[238];
  assign data_mem_data_o[46] = data_mem_data_o[238];
  assign data_mem_data_o[78] = data_mem_data_o[238];
  assign data_mem_data_o[110] = data_mem_data_o[238];
  assign data_mem_data_o[142] = data_mem_data_o[238];
  assign data_mem_data_o[174] = data_mem_data_o[238];
  assign data_mem_data_o[206] = data_mem_data_o[238];
  assign data_mem_data_o[13] = data_mem_data_o[237];
  assign data_mem_data_o[45] = data_mem_data_o[237];
  assign data_mem_data_o[77] = data_mem_data_o[237];
  assign data_mem_data_o[109] = data_mem_data_o[237];
  assign data_mem_data_o[141] = data_mem_data_o[237];
  assign data_mem_data_o[173] = data_mem_data_o[237];
  assign data_mem_data_o[205] = data_mem_data_o[237];
  assign data_mem_data_o[12] = data_mem_data_o[236];
  assign data_mem_data_o[44] = data_mem_data_o[236];
  assign data_mem_data_o[76] = data_mem_data_o[236];
  assign data_mem_data_o[108] = data_mem_data_o[236];
  assign data_mem_data_o[140] = data_mem_data_o[236];
  assign data_mem_data_o[172] = data_mem_data_o[236];
  assign data_mem_data_o[204] = data_mem_data_o[236];
  assign data_mem_data_o[11] = data_mem_data_o[235];
  assign data_mem_data_o[43] = data_mem_data_o[235];
  assign data_mem_data_o[75] = data_mem_data_o[235];
  assign data_mem_data_o[107] = data_mem_data_o[235];
  assign data_mem_data_o[139] = data_mem_data_o[235];
  assign data_mem_data_o[171] = data_mem_data_o[235];
  assign data_mem_data_o[203] = data_mem_data_o[235];
  assign data_mem_data_o[10] = data_mem_data_o[234];
  assign data_mem_data_o[42] = data_mem_data_o[234];
  assign data_mem_data_o[74] = data_mem_data_o[234];
  assign data_mem_data_o[106] = data_mem_data_o[234];
  assign data_mem_data_o[138] = data_mem_data_o[234];
  assign data_mem_data_o[170] = data_mem_data_o[234];
  assign data_mem_data_o[202] = data_mem_data_o[234];
  assign data_mem_data_o[9] = data_mem_data_o[233];
  assign data_mem_data_o[41] = data_mem_data_o[233];
  assign data_mem_data_o[73] = data_mem_data_o[233];
  assign data_mem_data_o[105] = data_mem_data_o[233];
  assign data_mem_data_o[137] = data_mem_data_o[233];
  assign data_mem_data_o[169] = data_mem_data_o[233];
  assign data_mem_data_o[201] = data_mem_data_o[233];
  assign data_mem_data_o[8] = data_mem_data_o[232];
  assign data_mem_data_o[40] = data_mem_data_o[232];
  assign data_mem_data_o[72] = data_mem_data_o[232];
  assign data_mem_data_o[104] = data_mem_data_o[232];
  assign data_mem_data_o[136] = data_mem_data_o[232];
  assign data_mem_data_o[168] = data_mem_data_o[232];
  assign data_mem_data_o[200] = data_mem_data_o[232];
  assign data_mem_data_o[7] = data_mem_data_o[231];
  assign data_mem_data_o[39] = data_mem_data_o[231];
  assign data_mem_data_o[71] = data_mem_data_o[231];
  assign data_mem_data_o[103] = data_mem_data_o[231];
  assign data_mem_data_o[135] = data_mem_data_o[231];
  assign data_mem_data_o[167] = data_mem_data_o[231];
  assign data_mem_data_o[199] = data_mem_data_o[231];
  assign data_mem_data_o[6] = data_mem_data_o[230];
  assign data_mem_data_o[38] = data_mem_data_o[230];
  assign data_mem_data_o[70] = data_mem_data_o[230];
  assign data_mem_data_o[102] = data_mem_data_o[230];
  assign data_mem_data_o[134] = data_mem_data_o[230];
  assign data_mem_data_o[166] = data_mem_data_o[230];
  assign data_mem_data_o[198] = data_mem_data_o[230];
  assign data_mem_data_o[5] = data_mem_data_o[229];
  assign data_mem_data_o[37] = data_mem_data_o[229];
  assign data_mem_data_o[69] = data_mem_data_o[229];
  assign data_mem_data_o[101] = data_mem_data_o[229];
  assign data_mem_data_o[133] = data_mem_data_o[229];
  assign data_mem_data_o[165] = data_mem_data_o[229];
  assign data_mem_data_o[197] = data_mem_data_o[229];
  assign data_mem_data_o[4] = data_mem_data_o[228];
  assign data_mem_data_o[36] = data_mem_data_o[228];
  assign data_mem_data_o[68] = data_mem_data_o[228];
  assign data_mem_data_o[100] = data_mem_data_o[228];
  assign data_mem_data_o[132] = data_mem_data_o[228];
  assign data_mem_data_o[164] = data_mem_data_o[228];
  assign data_mem_data_o[196] = data_mem_data_o[228];
  assign data_mem_data_o[3] = data_mem_data_o[227];
  assign data_mem_data_o[35] = data_mem_data_o[227];
  assign data_mem_data_o[67] = data_mem_data_o[227];
  assign data_mem_data_o[99] = data_mem_data_o[227];
  assign data_mem_data_o[131] = data_mem_data_o[227];
  assign data_mem_data_o[163] = data_mem_data_o[227];
  assign data_mem_data_o[195] = data_mem_data_o[227];
  assign data_mem_data_o[2] = data_mem_data_o[226];
  assign data_mem_data_o[34] = data_mem_data_o[226];
  assign data_mem_data_o[66] = data_mem_data_o[226];
  assign data_mem_data_o[98] = data_mem_data_o[226];
  assign data_mem_data_o[130] = data_mem_data_o[226];
  assign data_mem_data_o[162] = data_mem_data_o[226];
  assign data_mem_data_o[194] = data_mem_data_o[226];
  assign data_mem_data_o[1] = data_mem_data_o[225];
  assign data_mem_data_o[33] = data_mem_data_o[225];
  assign data_mem_data_o[65] = data_mem_data_o[225];
  assign data_mem_data_o[97] = data_mem_data_o[225];
  assign data_mem_data_o[129] = data_mem_data_o[225];
  assign data_mem_data_o[161] = data_mem_data_o[225];
  assign data_mem_data_o[193] = data_mem_data_o[225];
  assign data_mem_data_o[0] = data_mem_data_o[224];
  assign data_mem_data_o[32] = data_mem_data_o[224];
  assign data_mem_data_o[64] = data_mem_data_o[224];
  assign data_mem_data_o[96] = data_mem_data_o[224];
  assign data_mem_data_o[128] = data_mem_data_o[224];
  assign data_mem_data_o[160] = data_mem_data_o[224];
  assign data_mem_data_o[192] = data_mem_data_o[224];

  bsg_counter_clear_up_max_val_p8
  dma_counter
  (
    .clk_i(clk_i),
    .reset_i(reset_i),
    .clear_i(counter_clear),
    .up_i(counter_up),
    .count_o({ counter_r[3:3], data_mem_addr_o[2:0] })
  );


  bsg_fifo_1r1w_small_width_p32_els_p8
  in_fifo
  (
    .clk_i(clk_i),
    .reset_i(reset_i),
    .v_i(dma_data_v_i),
    .ready_o(dma_data_ready_o),
    .data_i(dma_data_i),
    .v_o(in_fifo_v_lo),
    .data_o(data_mem_data_o[255:224]),
    .yumi_i(in_fifo_yumi_li)
  );


  bsg_two_fifo_width_p32
  out_fifo
  (
    .clk_i(clk_i),
    .reset_i(reset_i),
    .ready_o(out_fifo_ready_lo),
    .data_i(out_fifo_data_li),
    .v_i(out_fifo_v_li),
    .v_o(dma_data_v_o),
    .data_o(dma_data_o),
    .yumi_i(dma_data_yumi_i)
  );


  bsg_decode_num_out_p8
  dma_way_demux
  (
    .i(dma_way_i),
    .o({ data_mem_w_mask_o[31:31], data_mem_w_mask_o[27:27], data_mem_w_mask_o[23:23], data_mem_w_mask_o[19:19], data_mem_w_mask_o[15:15], data_mem_w_mask_o[11:11], data_mem_w_mask_o[7:7], data_mem_w_mask_o[3:3] })
  );


  bsg_mux_width_p32_els_p8
  write_data_mux
  (
    .data_i(data_mem_data_i),
    .sel_i(dma_way_i),
    .data_o(out_fifo_data_li)
  );

  assign N12 = N11 & N64;
  assign N13 = dma_state_r[1] | N64;
  assign N15 = N11 | dma_state_r[0];
  assign N17 = dma_state_r[1] & dma_state_r[0];
  assign N18 = dma_cmd_i[1] | N35;
  assign N19 = N21 | N18;
  assign N21 = dma_cmd_i[3] | dma_cmd_i[2];
  assign N22 = N34 | dma_cmd_i[0];
  assign N23 = N21 | N22;
  assign N25 = dma_cmd_i[3] | N33;
  assign N26 = N25 | N29;
  assign N28 = N32 | dma_cmd_i[2];
  assign N29 = dma_cmd_i[1] | dma_cmd_i[0];
  assign N30 = N28 | N29;
  assign N36 = N32 & N33;
  assign N37 = N34 & N35;
  assign N38 = N36 & N37;
  assign N60 = dma_addr_i[4:2] == data_mem_addr_o[2:0];
  assign N64 = ~dma_state_r[0];
  assign N65 = N64 | dma_state_r[1];
  assign N66 = ~N65;
  assign N67 = ~counter_r[3];
  assign N68 = data_mem_addr_o[2] | N67;
  assign N69 = data_mem_addr_o[1] | N68;
  assign N70 = data_mem_addr_o[0] | N69;
  assign N71 = ~N70;
  assign N72 = ~data_mem_addr_o[2];
  assign N73 = ~data_mem_addr_o[1];
  assign N74 = ~data_mem_addr_o[0];
  assign N75 = N72 | counter_r[3];
  assign N76 = N73 | N75;
  assign N77 = N74 | N76;
  assign N78 = ~N77;
  assign N44 = (N0)? 1'b1 : 
               (N1)? 1'b1 : 
               (N2)? 1'b0 : 
               (N3)? 1'b0 : 
               (N4)? 1'b0 : 
               (N43)? 1'b0 : 1'b0;
  assign N0 = N20;
  assign N1 = N24;
  assign N2 = N27;
  assign N3 = N31;
  assign N4 = N38;
  assign N45 = (N0)? 1'b0 : 
               (N1)? 1'b1 : 
               (N2)? 1'b0 : 
               (N3)? 1'b0 : 
               (N4)? 1'b0 : 
               (N43)? 1'b0 : 1'b0;
  assign N46 = (N0)? dma_pkt_yumi_i : 
               (N1)? dma_pkt_yumi_i : 
               (N2)? 1'b0 : 
               (N3)? 1'b0 : 
               (N4)? 1'b0 : 
               (N43)? 1'b0 : 1'b0;
  assign N47 = (N0)? 1'b0 : 
               (N1)? 1'b0 : 
               (N2)? 1'b1 : 
               (N3)? 1'b1 : 
               (N4)? 1'b0 : 
               (N43)? 1'b0 : 1'b0;
  assign N48 = (N0)? 1'b0 : 
               (N1)? 1'b0 : 
               (N2)? 1'b0 : 
               (N3)? 1'b1 : 
               (N4)? 1'b0 : 
               (N43)? 1'b0 : 1'b0;
  assign N50 = ~N49;
  assign N55 = ~N54;
  assign counter_clear = (N5)? N47 : 
                         (N6)? N52 : 
                         (N7)? N57 : 
                         (N8)? 1'b0 : 1'b0;
  assign N5 = N12;
  assign N6 = N14;
  assign N7 = N16;
  assign N8 = N17;
  assign counter_up = (N5)? N48 : 
                      (N6)? N51 : 
                      (N7)? N56 : 
                      (N8)? 1'b0 : 1'b0;
  assign data_mem_v_o = (N5)? N48 : 
                        (N6)? in_fifo_v_lo : 
                        (N7)? N58 : 
                        (N8)? 1'b0 : 1'b0;
  assign dma_pkt_v_o = (N5)? N44 : 
                       (N6)? 1'b0 : 
                       (N7)? 1'b0 : 
                       (N8)? 1'b0 : 1'b0;
  assign dma_pkt_o[32] = (N5)? N45 : 
                         (N6)? 1'b0 : 
                         (N7)? 1'b0 : 
                         (N8)? 1'b0 : 1'b0;
  assign done_o = (N5)? N46 : 
                  (N6)? N53 : 
                  (N7)? N59 : 
                  (N8)? 1'b0 : 1'b0;
  assign dma_state_n = (N5)? { N31, N27 } : 
                       (N6)? { 1'b0, N50 } : 
                       (N7)? { N55, 1'b0 } : 
                       (N8)? { 1'b0, 1'b0 } : 1'b0;
  assign data_mem_w_o = (N5)? 1'b0 : 
                        (N6)? in_fifo_v_lo : 
                        (N7)? 1'b0 : 
                        (N8)? 1'b0 : 1'b0;
  assign in_fifo_yumi_li = (N5)? 1'b0 : 
                           (N6)? in_fifo_v_lo : 
                           (N7)? 1'b0 : 
                           (N8)? 1'b0 : 1'b0;
  assign out_fifo_v_li = (N5)? 1'b0 : 
                         (N6)? 1'b0 : 
                         (N7)? 1'b1 : 
                         (N8)? 1'b0 : 1'b0;
  assign dma_evict_o = (N5)? 1'b0 : 
                       (N6)? 1'b0 : 
                       (N7)? 1'b1 : 
                       (N8)? 1'b0 : 1'b0;
  assign N63 = (N9)? 1'b0 : 
               (N10)? snoop_word_we : 1'b0;
  assign N9 = N62;
  assign N10 = N61;
  assign N11 = ~dma_state_r[1];
  assign N14 = ~N13;
  assign N16 = ~N15;
  assign N20 = ~N19;
  assign N24 = ~N23;
  assign N27 = ~N26;
  assign N31 = ~N30;
  assign N32 = ~dma_cmd_i[3];
  assign N33 = ~dma_cmd_i[2];
  assign N34 = ~dma_cmd_i[1];
  assign N35 = ~dma_cmd_i[0];
  assign N39 = N24 | N20;
  assign N40 = N27 | N39;
  assign N41 = N31 | N40;
  assign N42 = N38 | N41;
  assign N43 = ~N42;
  assign N49 = N78 & in_fifo_v_lo;
  assign N51 = in_fifo_v_lo & N77;
  assign N52 = in_fifo_v_lo & N78;
  assign N53 = N78 & in_fifo_v_lo;
  assign N54 = N71 & out_fifo_ready_lo;
  assign N56 = out_fifo_ready_lo & N70;
  assign N57 = out_fifo_ready_lo & N71;
  assign N58 = out_fifo_ready_lo & N70;
  assign N59 = N71 & out_fifo_ready_lo;
  assign snoop_word_we = N79 & in_fifo_v_lo;
  assign N79 = N66 & N60;
  assign N61 = ~reset_i;
  assign N62 = reset_i;

  always @(posedge clk_i) begin
    if(N63) begin
      { snoop_word_o[31:0] } <= { data_mem_data_o[255:224] };
    end 
    if(reset_i) begin
      { dma_state_r[1:0] } <= { 1'b0, 1'b0 };
    end else if(1'b1) begin
      { dma_state_r[1:0] } <= { dma_state_n[1:0] };
    end 
  end


endmodule

