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
// SPDX-FileContributor: Tayyeb Mahmood <tayyeb@uet.edu.pk>

module dffram
	#(
	parameter DWIDTH = 24,
	parameter AWIDTH = 6
	)
	(
	input          				clk,
	input          				we,
	output reg 	[DWIDTH-1:0]	dat_o,
	output reg 	[DWIDTH-1:0]	dat_o2,
	input  		[DWIDTH-1:0]	dat_i,
	input  		[AWIDTH-1:0]	adr_w,
	input  		[AWIDTH-1:0]	adr_r
	);

reg [DWIDTH-1:0] r [0:(2**AWIDTH)-1];

always @(posedge clk)
begin
	if(we)	r[adr_w] <= dat_i;

	dat_o 	<= r[adr_w];
	dat_o2 	<= r[adr_r];

end


endmodule



  


