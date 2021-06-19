// SPDX-FileCopyrightText: 2021 EE, UET Lahore
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
// SPDX-FileContributor: Created by Tayyeb Mahmood <tayyeb@uet.edu.pk>

`default_nettype none
/*
 *-------------------------------------------------------------
 *
 * wb_local
 *
 * wb_local sits between caravel master and user macros, it 
 * mainly slow downs the clock, by 1/8, and handles io.
 *
 *-------------------------------------------------------------
 */

module multiplex(
`ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
    inout vssd1,	// User area 1 digital ground
`endif

    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input [31:0] wbs_adr_i,
    output reg wbs_ack_o,
    output reg [31:0] wbs_dat_o,

    // IOs
    input  [37:0] io_in,
    output reg [37:0] io_out,
    output reg [37:0] io_oeb,
    
 //   input  [127:0] la_data_in,
    output reg [127:0] la_data_out,
 //   input  [127:0] la_oenb,

    // IRQ
    output reg [2:0] irq,
    
    // Wishbone macro ports
    output reg [10:0] m_wb_rst_i,
    output reg [10:0] m_wbs_stb_i,

    input [10:0] m_wbs_ack_o,
    input [31:0] m_wbs_dat_o_0,
    input [31:0] m_wbs_dat_o_1,
    input [31:0] m_wbs_dat_o_2,
    input [31:0] m_wbs_dat_o_3,
    input [31:0] m_wbs_dat_o_4,
    input [31:0] m_wbs_dat_o_5,
    input [31:0] m_wbs_dat_o_6,
    input [31:0] m_wbs_dat_o_7,
    input [31:0] m_wbs_dat_o_8,
    input [31:0] m_wbs_dat_o_9,
    input [31:0] m_wbs_dat_o_10
  
);
    reg [15:0] cs_dec;
    reg this_adr;
    
    always @(*) begin
    
		wbs_ack_o = |m_wbs_ack_o;
        wbs_dat_o = ({32{m_wbs_ack_o[0]}} & m_wbs_dat_o_0) | ({32{m_wbs_ack_o[1]}} & m_wbs_dat_o_1) | ({32{m_wbs_ack_o[2]}} & m_wbs_dat_o_2) | ({32{m_wbs_ack_o[3]}} & m_wbs_dat_o_3) | ({32{m_wbs_ack_o[4]}} & m_wbs_dat_o_4) | ({32{m_wbs_ack_o[5]}} & m_wbs_dat_o_5) | ({32{m_wbs_ack_o[6]}} & m_wbs_dat_o_6) | ({32{m_wbs_ack_o[7]}} & m_wbs_dat_o_7) | ({32{m_wbs_ack_o[8]}} & m_wbs_dat_o_8) | ({32{m_wbs_ack_o[9]}} & m_wbs_dat_o_9) | ({32{m_wbs_ack_o[10]}} & m_wbs_dat_o_10);

        this_adr = wbs_adr_i[31:28] == 4'h3;

        irq = 0;
        cs_dec = (16'b01 << wbs_adr_i[27:24]) & {16{this_adr & wbs_stb_i}};    
        m_wbs_stb_i = cs_dec;
        m_wb_rst_i = la_data_in | {11{wb_rst_i}};
        
        la_data_out = {128{wbs_stb_i}};
        io_oeb = ~(38'b0);
        io_out = io_in;
        irq = 0;
        
    end 

    
endmodule
`default_nettype wire
