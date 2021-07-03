// SPDX-FileCopyrightText: 2021 renzym.com
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0
// SPDX-FileContributor: Yasir Javed <info@renzym.com>

`default_nettype none
/*
 *-------------------------------------------------------------
 *
 * user_project_wrapper
 *
 * This wrapper enumerates all of the pins available to the
 * user for the user project.
 *
 * An example user project is provided in this wrapper.  The
 * example should be removed and replaced with the actual
 * user project.
 *
 *-------------------------------------------------------------
 */

module user_project_wrapper
	(
`ifdef USE_POWER_PINS
    inout vdda1,	// User area 1 3.3V supply
    inout vdda2,	// User area 2 3.3V supply
    inout vssa1,	// User area 1 analog ground
    inout vssa2,	// User area 2 analog ground
    inout vccd1,	// User area 1 1.8V supply
    inout vccd2,	// User area 2 1.8v supply
    inout vssd1,	// User area 1 digital ground
    inout vssd2,	// User area 2 digital ground
`endif

    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    output wbs_ack_o,
    output [31:0] wbs_dat_o,

    // Logic Analyzer Signals
    input  [127:0] la_data_in,
    output [127:0] la_data_out,
    input  [127:0] la_oenb,

    // IOs
    input  [`MPRJ_IO_PADS-1:0] io_in,
    output [`MPRJ_IO_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-1:0] io_oeb,

    // Analog (direct connection to GPIO pad---use with caution)
    // Note that analog I/O is not available on the 7 lowest-numbered
    // GPIO pads, and so the analog_io indexing is offset from the
    // GPIO indexing by 7 (also upper 2 GPIOs do not have analog_io).
    inout [`MPRJ_IO_PADS-10:0] analog_io,

    // Independent clock (on independent integer divider)
    input   user_clock2,

    // User maskable interrupt signals
    output [2:0] user_irq
);

/*--------------------------------------*/
/* User project is instantiated  here   */
/*--------------------------------------*/

wire		wbs_ack_out_0;
wire		wbs_ack_out_1;
wire		wbs_ack_out_2;
wire		wbs_ack_out_3;
wire		wbs_ack_out_4;
wire		wbs_ack_out_5;
wire		wbs_ack_out_6;
wire		wbs_ack_out_7;
wire		wbs_ack_out_8;
wire		wbs_ack_out_9;
wire		wbs_ack_out_10;


wire [31:0]	wbs_dat_out_0;
wire [31:0]	wbs_dat_out_1;
wire [31:0]	wbs_dat_out_2;
wire [31:0]	wbs_dat_out_3;
wire [31:0]	wbs_dat_out_4;
wire [31:0]	wbs_dat_out_5;
wire [31:0]	wbs_dat_out_6;
wire [31:0]	wbs_dat_out_7;
wire [31:0]	wbs_dat_out_8;
wire [31:0]	wbs_dat_out_9;
wire [31:0]	wbs_dat_out_10;

wire [10:0] m_wb_rst_i;
wire [10:0] m_wbs_stb_i;
wire [10:0] m_wbs_ack_out;
 


	ren_conv_top ren_conv_top_inst_0
	(
	`ifdef USE_POWER_PINS
    .vccd1(vccd1),
    .vssd1(vssd1),
`endif
	// Wishbone Slave ports (WB MI A)
	.wb_clk_i		(wb_clk_i	),
	.wb_rst_i		(m_wb_rst_i[0]	),
	.wbs_stb_i		(m_wbs_stb_i[0]	),
	.wbs_cyc_i		(wbs_cyc_i	),
	.wbs_we_i		(wbs_we_i	),
	.wbs_sel_i		(wbs_sel_i	),
	.wbs_dat_i		(wbs_dat_i	),
	.wbs_adr_i		(wbs_adr_i	),
	.wbs_ack_o		(m_wbs_ack_out[0]),
	.wbs_dat_o		(wbs_dat_out_0)
	);

	ren_conv_top ren_conv_top_inst_1
	(
	`ifdef USE_POWER_PINS
    .vccd1(vccd1),
    .vssd1(vssd1),
`endif
	// Wishbone Slave ports (WB MI A)
	.wb_clk_i		(wb_clk_i	),
	.wb_rst_i		(m_wb_rst_i[1]	),
	.wbs_stb_i		(m_wbs_stb_i[1]	),
	.wbs_cyc_i		(wbs_cyc_i	),
	.wbs_we_i		(wbs_we_i	),
	.wbs_sel_i		(wbs_sel_i	),
	.wbs_dat_i		(wbs_dat_i	),
	.wbs_adr_i		(wbs_adr_i	),
	.wbs_ack_o		(m_wbs_ack_out[1]),
	.wbs_dat_o		(wbs_dat_out_1)
	);

	ren_conv_top	ren_conv_top_inst_2
	(
	`ifdef USE_POWER_PINS
    .vccd1(vccd1),
    .vssd1(vssd1),
`endif
	// Wishbone Slave ports (WB MI A)
	.wb_clk_i		(wb_clk_i	),
	.wb_rst_i		(m_wb_rst_i[2]	),
	.wbs_stb_i		(m_wbs_stb_i[2]	),
	.wbs_cyc_i		(wbs_cyc_i	),
	.wbs_we_i		(wbs_we_i	),
	.wbs_sel_i		(wbs_sel_i	),
	.wbs_dat_i		(wbs_dat_i	),
	.wbs_adr_i		(wbs_adr_i	),
	.wbs_ack_o		(m_wbs_ack_out[2]),
	.wbs_dat_o		(wbs_dat_out_2)
	);

	ren_conv_top	ren_conv_top_inst_3
	(
	`ifdef USE_POWER_PINS
    .vccd1(vccd1),
    .vssd1(vssd1),
`endif
	// Wishbone Slave ports (WB MI A)
	.wb_clk_i		(wb_clk_i	),
	.wb_rst_i		(m_wb_rst_i[3]	),
	.wbs_stb_i		(m_wbs_stb_i[3]	),
	.wbs_cyc_i		(wbs_cyc_i	),
	.wbs_we_i		(wbs_we_i	),
	.wbs_sel_i		(wbs_sel_i	),
	.wbs_dat_i		(wbs_dat_i	),
	.wbs_adr_i		(wbs_adr_i	),
	.wbs_ack_o		(m_wbs_ack_out[3]),
	.wbs_dat_o		(wbs_dat_out_3)
	);
	
	
	ren_conv_top	ren_conv_top_inst_4
	(
	`ifdef USE_POWER_PINS
    .vccd1(vccd1),
    .vssd1(vssd1),
`endif
	// Wishbone Slave ports (WB MI A)
	.wb_clk_i		(wb_clk_i	),
	.wb_rst_i		(m_wb_rst_i[4]	),
	.wbs_stb_i		(m_wbs_stb_i[4]	),
	.wbs_cyc_i		(wbs_cyc_i	),
	.wbs_we_i		(wbs_we_i	),
	.wbs_sel_i		(wbs_sel_i	),
	.wbs_dat_i		(wbs_dat_i	),
	.wbs_adr_i		(wbs_adr_i	),
	.wbs_ack_o		(m_wbs_ack_out[4]),
	.wbs_dat_o		(wbs_dat_out_4)
	);

	ren_conv_top	ren_conv_top_inst_5
	(
	`ifdef USE_POWER_PINS
    .vccd1(vccd1),
    .vssd1(vssd1),
`endif
	// Wishbone Slave ports (WB MI A)
	.wb_clk_i		(wb_clk_i	),
	.wb_rst_i		(m_wb_rst_i[5]	),
	.wbs_stb_i		(m_wbs_stb_i[5]	),
	.wbs_cyc_i		(wbs_cyc_i	),
	.wbs_we_i		(wbs_we_i	),
	.wbs_sel_i		(wbs_sel_i	),
	.wbs_dat_i		(wbs_dat_i	),
	.wbs_adr_i		(wbs_adr_i	),
	.wbs_ack_o		(m_wbs_ack_out[5]),
	.wbs_dat_o		(wbs_dat_out_5)
	);

	ren_conv_top	ren_conv_top_inst_6
	(
	`ifdef USE_POWER_PINS
    .vccd1(vccd1),
    .vssd1(vssd1),
`endif
	// Wishbone Slave ports (WB MI A)
	.wb_clk_i		(wb_clk_i	),
	.wb_rst_i		(m_wb_rst_i[6]	),
	.wbs_stb_i		(m_wbs_stb_i[6]	),
	.wbs_cyc_i		(wbs_cyc_i	),
	.wbs_we_i		(wbs_we_i	),
	.wbs_sel_i		(wbs_sel_i	),
	.wbs_dat_i		(wbs_dat_i	),
	.wbs_adr_i		(wbs_adr_i	),
	.wbs_ack_o		(m_wbs_ack_out[6]),
	.wbs_dat_o		(wbs_dat_out_6)
	);

	ren_conv_top	ren_conv_top_inst_7
	(
	`ifdef USE_POWER_PINS
    .vccd1(vccd1),
    .vssd1(vssd1),
`endif
	// Wishbone Slave ports (WB MI A)
	.wb_clk_i		(wb_clk_i	),
	.wb_rst_i		(m_wb_rst_i[7]	),
	.wbs_stb_i		(m_wbs_stb_i[7]	),
	.wbs_cyc_i		(wbs_cyc_i	),
	.wbs_we_i		(wbs_we_i	),
	.wbs_sel_i		(wbs_sel_i	),
	.wbs_dat_i		(wbs_dat_i	),
	.wbs_adr_i		(wbs_adr_i	),
	.wbs_ack_o		(m_wbs_ack_out[7]),
	.wbs_dat_o		(wbs_dat_out_7)
	);
	
	
	ren_conv_top	ren_conv_top_inst_8
	(
	`ifdef USE_POWER_PINS
    .vccd1(vccd1),
    .vssd1(vssd1),
`endif
	// Wishbone Slave ports (WB MI A)
	.wb_clk_i		(wb_clk_i	),
	.wb_rst_i		(m_wb_rst_i[8]	),
	.wbs_stb_i		(m_wbs_stb_i[8]	),
	.wbs_cyc_i		(wbs_cyc_i	),
	.wbs_we_i		(wbs_we_i	),
	.wbs_sel_i		(wbs_sel_i	),
	.wbs_dat_i		(wbs_dat_i	),
	.wbs_adr_i		(wbs_adr_i	),
	.wbs_ack_o		(m_wbs_ack_out[8]),
	.wbs_dat_o		(wbs_dat_out_8)
	);

	ren_conv_top	ren_conv_top_inst_9
	(
	`ifdef USE_POWER_PINS
    .vccd1(vccd1),
    .vssd1(vssd1),
`endif
	// Wishbone Slave ports (WB MI A)
	.wb_clk_i		(wb_clk_i	),
	.wb_rst_i		(m_wb_rst_i[9]	),
	.wbs_stb_i		(m_wbs_stb_i[9]	),
	.wbs_cyc_i		(wbs_cyc_i	),
	.wbs_we_i		(wbs_we_i	),
	.wbs_sel_i		(wbs_sel_i	),
	.wbs_dat_i		(wbs_dat_i	),
	.wbs_adr_i		(wbs_adr_i	),
	.wbs_ack_o		(m_wbs_ack_out[9]),
	.wbs_dat_o		(wbs_dat_out_9)
	);

	ren_conv_top ren_conv_top_inst_10
	(
	`ifdef USE_POWER_PINS
    .vccd1(vccd1),
    .vssd1(vssd1),
`endif
	// Wishbone Slave ports (WB MI A)
	.wb_clk_i		(wb_clk_i	),
	.wb_rst_i		(m_wb_rst_i[10]	),
	.wbs_stb_i		(m_wbs_stb_i[10]	),
	.wbs_cyc_i		(wbs_cyc_i	),
	.wbs_we_i		(wbs_we_i	),
	.wbs_sel_i		(wbs_sel_i	),
	.wbs_dat_i		(wbs_dat_i	),
	.wbs_adr_i		(wbs_adr_i	),
	.wbs_ack_o		(m_wbs_ack_out[10]),
	.wbs_dat_o		(wbs_dat_out_10)
	);


	
	 multiplex icon (
`ifdef USE_POWER_PINS
    .vccd1(vccd1),
    .vssd1(vssd1),
`endif
    .wb_clk_i(wb_clk_i),
    .wb_rst_i(wb_rst_i),
    .wbs_stb_i(wbs_stb_i),
    .wbs_adr_i(wbs_adr_i),
    .wbs_ack_o(wbs_ack_o),
    .wbs_dat_o(wbs_dat_o),
    
        // Logic Analyzer

    .la_data_in(la_data_in[10:0]),
    .la_data_out(la_data_out),
    //.la_oenb (la_oenb),

    // IO Pads

    .io_in (io_in),
    .io_out(io_out),
    .io_oeb(io_oeb),

    // IRQ
    .irq(user_irq),
    
    //slaves
    .m_wb_rst_i(m_wb_rst_i),
    .m_wbs_stb_i(m_wbs_stb_i),
    .m_wbs_ack_o(m_wbs_ack_out),
    .m_wbs_dat_o_0(wbs_dat_out_0),
    .m_wbs_dat_o_1(wbs_dat_out_1),
    .m_wbs_dat_o_2(wbs_dat_out_2),
    .m_wbs_dat_o_3(wbs_dat_out_3),
    .m_wbs_dat_o_4(wbs_dat_out_4),
    .m_wbs_dat_o_5(wbs_dat_out_5),
    .m_wbs_dat_o_6(wbs_dat_out_6),
    .m_wbs_dat_o_7(wbs_dat_out_7),
    .m_wbs_dat_o_8(wbs_dat_out_8),
    .m_wbs_dat_o_9(wbs_dat_out_9),
    .m_wbs_dat_o_10(wbs_dat_out_10)
  );


endmodule	// user_project_wrapper

`default_nettype wire
