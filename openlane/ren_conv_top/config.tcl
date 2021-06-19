# SPDX-FileCopyrightText:  2021 EE, UET Lahore
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# SPDX-License-Identifier: Apache-2.0
# SPDX-FileContributor: Modified by Tayyeb Mahmood <tayyeb@uet.edu.pk>

set script_dir [file dirname [file normalize [info script]]]

set ::env(DESIGN_NAME) ren_conv_top

set ::env(VERILOG_FILES) "\
	$script_dir/../../caravel/verilog/rtl/defines.v \
	$script_dir/../../verilog/rtl/ren_conv_top.v \
	$script_dir/../../verilog/rtl/dffram.v \
	$script_dir/../../verilog/rtl/shifter.v \
	$script_dir/../../verilog/rtl/regs.v \
	$script_dir/../../verilog/rtl/datapath.v \
	$script_dir/../../verilog/rtl/serial_shift.v \
	$script_dir/../../verilog/rtl/mult.v \
	$script_dir/../../verilog/rtl/ctrl_status_regs_4.v \
	$script_dir/../../verilog/rtl/ren_conv.v \
	$script_dir/../../verilog/rtl/max_pool.v \
	$script_dir/../../verilog/rtl/agu.v"

set ::env(CLOCK_PORT) "wb_clk_i"
set ::env(CLOCK_NET) ""
set ::env(CLOCK_PERIOD) "10"

set ::env(FP_SIZING) absolute
set ::env(DIE_AREA) "0 0 750 750"
set ::env(DESIGN_IS_CORE) 0

set ::env(VDD_NETS) [list {vccd1}]
set ::env(GND_NETS) [list {vssd1}]

set ::env(FP_PIN_ORDER_CFG) $script_dir/pin_order.cfg

#set ::env(FP_CORE_UTIL) 20
set ::env(PL_TARGET_DENSITY) 0.35

# If you're going to use multiple power domains, then keep this disabled.
set ::env(RUN_CVC) 0

set ::env(PL_ROUTABILITY_DRIVEN) 1

set ::env(FP_IO_VEXTEND) 4
set ::env(FP_IO_HEXTEND) 4


set ::env(GLB_RT_MAXLAYER) 4
set ::env(GLB_RT_MAX_DIODE_INS_ITERS) 10

