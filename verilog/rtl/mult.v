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

module mult
	#(
	parameter WIDTH_A = 8,
	parameter WIDTH_B = 8
	)
	(
	input	signed		[WIDTH_A-1:0] 			a,
	input	signed		[WIDTH_B-1:0] 			b,
	output	reg	signed	[WIDTH_A+WIDTH_B-1:0]	out
    );

	always@* out = 	a*b;

endmodule
