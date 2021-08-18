
`define HARDENED_MACROS 1

module hard_mem_1rw_byte_mask_d512_w64_wrapper #( parameter width_p = 64
                                                , parameter els_p = 512
                                                , parameter addr_width_lp = $clog2(els_p)
                                                , parameter write_mask_width_lp = width_p>>3
                                                )
  (
`ifdef USE_POWER_PINS
    inout vccd1,
    inout vssd1,
`endif
    input                            clk_i
  , input                            reset_i
  , input [width_p-1:0]              data_i
  , input [addr_width_lp-1:0]        addr_i
  , input                            v_i
  , input [write_mask_width_lp-1:0]  write_mask_i
  , input                            w_i
  , output wire [width_p-1:0]        data_o
  );

  // TODO: Replace the sythesizable RTL model below with the hardened
  // equivilant. Use the RTL model to check the sematics of the harden block
  // match.
  //
  // NOTE: The instance name of the hardened block is expected to be "mem".

  //hard_mem_1rw_byte_mask_d512_w64
  //  mem
  //    ( ...
  //    );

  // BEGIN SYNTHESIZABLE RTL MODEL

`ifdef ENABLE_NON_SYNTH
  initial
    begin
      $display("## %m: to get the expect quality of results, this module should be replaced with the hardened equivalent.");
    end
`endif


`ifdef HARDENED_MACROS
wire unused = reset_i;
wire [width_p-1:0] data_o1_unused;

wire csb1 = 1'b1;
genvar i;

generate 
    for (i = 0; i < write_mask_width_lp; i=i+1) begin
        sky130_sram_1kbyte_1rw1r_8x1024_8 mem (
`ifdef USE_POWER_PINS
        .vccd1(vccd1),
        .vssd1(vssd1),
`endif
        // Port 0: RW
        .clk0(clk_i),
        .csb0(v_i),
        .web0(w_i),
        .wmask0(write_mask_i[i]),
        .addr0 ({1'b0, addr_i} ),
        .din0 (data_i[(i*8)+:8]),
        .dout0 (data_o[(i*8)+:8]),
        // Port 1: R
        .clk1(clk_i),
        .csb1(csb1),
        .addr1 ({1'b0, addr_i}),
        .dout1 (data_o1_unused[(i*8)+:8])
             );
    end
endgenerate

`else

  wire unused = reset_i;
  reg [addr_width_lp-1:0] addr_r;
  reg [width_p-1:0] mem;
  genvar i;

  always @(posedge clk_i)
    if (v_i & ~w_i)
      addr_r <= addr_i;
    else
      addr_r <= 'X;

  assign data_o = mem;

generate 
    for (i = 0; i < write_mask_width_lp; i=i+1) begin
        always @(posedge clk_i) begin
            if (v_i & w_i) begin
                if (write_mask_i[i]) begin
                    mem[(i*8)+:8] <= data_i[(i*8)+:8];
                end
            end
        end
    end
endgenerate
`endif


  // END SYNTHESIZABLE RTL MODEL
  
endmodule

