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


//////////////////////////////////////////////////////////////////////////////////
// Company: 		Renzym
// Engineer: 		Yasir Javed
// Design Name: 	ctrl_status_regs_4
// Module Name:		Control and status regs 4
// Description: 	This is generic block that allows 4 control and status regs each
// 					of DWIDTH width. If a wrapper connects control pins with status
//					pins its a regfile of 4 regs, but having control and status at
//					ports allows to redefine contorl and status bits as required.
//
//					
// Dependencies:	 
//
//////////////////////////////////////////////////////////////////////////////////
module ctrl_status_regs_4
	#(
		parameter DWIDTH = 32
	)
	(
	input						clk,
	input						reset,
	input		[1:0]			addr,
	input						wr_en,
	input		[DWIDTH-1:0]	data_in,
	
	output	reg	[DWIDTH-1:0]	data_out,
	
	output	reg	[DWIDTH-1:0]	ctrl0,
	output	reg	[DWIDTH-1:0]	ctrl1,
	output	reg	[DWIDTH-1:0]	ctrl2,
	output	reg	[DWIDTH-1:0]	ctrl3,
	
	input		[DWIDTH-1:0]	status0,
	input		[DWIDTH-1:0]	status1,
	input		[DWIDTH-1:0]	status2,
	input		[DWIDTH-1:0]	status3
	
	);


    always @(posedge clk) 
	begin
        if (reset) 
		begin
			ctrl0 <= 0;
			ctrl1 <= 0;
			ctrl2 <= 0;
			ctrl3 <= 0;
        end 
		else if(wr_en)
		begin
			case(addr)
			0:	ctrl0 <= data_in;
			1:	ctrl1 <= data_in;
			2:	ctrl2 <= data_in;
			3:	ctrl3 <= data_in;
			endcase
        end
    end

	always@*
		case(addr)
		0:	data_out = status0;
		1:	data_out = status1;
		2:	data_out = status2;
		3:	data_out = status3;
		endcase

endmodule
