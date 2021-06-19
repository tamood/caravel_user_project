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

module serial_shift
	#(
	parameter DLY_WIDTH = 8
	)
	(
	input 	clk,
	input	reset,
	input	ser_in,
	output reg [DLY_WIDTH-1:0] par_out
	);

	always@(posedge clk)
		if(reset)	par_out <= 0;
		else		par_out <= {par_out[DLY_WIDTH-2:0],ser_in};
endmodule
