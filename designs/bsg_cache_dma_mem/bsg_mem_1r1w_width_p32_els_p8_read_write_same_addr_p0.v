module bsg_mem_1r1w_width_p32_els_p8_read_write_same_addr_p0
(
`ifdef USE_POWER_PINS
	vccd1,
	vssd1,
`endif
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
  wire [31:0] w_mask_in;
  assign w_mask_in = 31'd0;  
  assign r_addr_i = w_addr_i;
`ifdef USE_POWER_PINS
	inout vccd1;
	inout vssd1;
`endif

  sram_32x8 sram_32x8_1
  (
`ifdef USE_POWER_PINS
	.vccd1(vccd1),
	.vssd1(vssd1),
`endif
    .clk(w_clk_i),
    .we_in(w_v_i),
    .wd_in(w_data_i),
    .ce_in(r_v_i),
    .addr_in(r_addr_i),
    .w_mask_in(w_mask_in),
    .rd_out(r_data_o)
  );


endmodule
