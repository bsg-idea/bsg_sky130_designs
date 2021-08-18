
module bsg_mem_1rw_sync_mask_write_byte_els_p512_data_width_p64
(
`ifdef USE_POWER_PINS
    vccd1,
    vssd1,
`endif
  clk_i,
  reset_i,
  v_i,
  w_i,
  addr_i,
  data_i,
  write_mask_i,
  data_o
);

`ifdef USE_POWER_PINS
inout     vccd1;
inout     vssd1;
`endif
  input [8:0] addr_i;
  input [63:0] data_i;
  input [7:0] write_mask_i;
  output [63:0] data_o;
  input clk_i;
  input reset_i;
  input v_i;
  input w_i;
  wire [63:0] data_o;

  hard_mem_1rw_byte_mask_d512_w64_wrapper
  macro_mem
  (
`ifdef USE_POWER_PINS
        .vccd1(vccd1),
        .vssd1(vssd1),
`endif
    .clk_i(clk_i),
    .reset_i(reset_i),
    .v_i(v_i),
    .w_i(w_i),
    .addr_i(addr_i),
    .data_i(data_i),
    .write_mask_i(write_mask_i),
    .data_o(data_o)
  );


endmodule
