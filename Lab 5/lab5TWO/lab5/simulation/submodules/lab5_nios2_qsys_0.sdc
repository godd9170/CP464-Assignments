# Legal Notice: (C)2015 Altera Corporation. All rights reserved.  Your
# use of Altera Corporation's design tools, logic functions and other
# software and tools, and its AMPP partner logic functions, and any
# output files any of the foregoing (including device programming or
# simulation files), and any associated documentation or information are
# expressly subject to the terms and conditions of the Altera Program
# License Subscription Agreement or other applicable license agreement,
# including, without limitation, that your use is for the sole purpose
# of programming logic devices manufactured by Altera and sold by Altera
# or its authorized distributors.  Please refer to the applicable
# agreement for further details.

#**************************************************************
# Timequest JTAG clock definition
#   Uncommenting the following lines will define the JTAG
#   clock in TimeQuest Timing Analyzer
#**************************************************************

#create_clock -period 10MHz {altera_internal_jtag|tckutap}
#set_clock_groups -asynchronous -group {altera_internal_jtag|tckutap}

#**************************************************************
# Set TCL Path Variables 
#**************************************************************

set 	lab5_nios2_qsys_0 	lab5_nios2_qsys_0:*
set 	lab5_nios2_qsys_0_oci 	lab5_nios2_qsys_0_nios2_oci:the_lab5_nios2_qsys_0_nios2_oci
set 	lab5_nios2_qsys_0_oci_break 	lab5_nios2_qsys_0_nios2_oci_break:the_lab5_nios2_qsys_0_nios2_oci_break
set 	lab5_nios2_qsys_0_ocimem 	lab5_nios2_qsys_0_nios2_ocimem:the_lab5_nios2_qsys_0_nios2_ocimem
set 	lab5_nios2_qsys_0_oci_debug 	lab5_nios2_qsys_0_nios2_oci_debug:the_lab5_nios2_qsys_0_nios2_oci_debug
set 	lab5_nios2_qsys_0_wrapper 	lab5_nios2_qsys_0_jtag_debug_module_wrapper:the_lab5_nios2_qsys_0_jtag_debug_module_wrapper
set 	lab5_nios2_qsys_0_jtag_tck 	lab5_nios2_qsys_0_jtag_debug_module_tck:the_lab5_nios2_qsys_0_jtag_debug_module_tck
set 	lab5_nios2_qsys_0_jtag_sysclk 	lab5_nios2_qsys_0_jtag_debug_module_sysclk:the_lab5_nios2_qsys_0_jtag_debug_module_sysclk
set 	lab5_nios2_qsys_0_oci_path 	 [format "%s|%s" $lab5_nios2_qsys_0 $lab5_nios2_qsys_0_oci]
set 	lab5_nios2_qsys_0_oci_break_path 	 [format "%s|%s" $lab5_nios2_qsys_0_oci_path $lab5_nios2_qsys_0_oci_break]
set 	lab5_nios2_qsys_0_ocimem_path 	 [format "%s|%s" $lab5_nios2_qsys_0_oci_path $lab5_nios2_qsys_0_ocimem]
set 	lab5_nios2_qsys_0_oci_debug_path 	 [format "%s|%s" $lab5_nios2_qsys_0_oci_path $lab5_nios2_qsys_0_oci_debug]
set 	lab5_nios2_qsys_0_jtag_tck_path 	 [format "%s|%s|%s" $lab5_nios2_qsys_0_oci_path $lab5_nios2_qsys_0_wrapper $lab5_nios2_qsys_0_jtag_tck]
set 	lab5_nios2_qsys_0_jtag_sysclk_path 	 [format "%s|%s|%s" $lab5_nios2_qsys_0_oci_path $lab5_nios2_qsys_0_wrapper $lab5_nios2_qsys_0_jtag_sysclk]
set 	lab5_nios2_qsys_0_jtag_sr 	 [format "%s|*sr" $lab5_nios2_qsys_0_jtag_tck_path]

set 	lab5_nios2_qsys_0_oci_im 	lab5_nios2_qsys_0_nios2_oci_im:the_lab5_nios2_qsys_0_nios2_oci_im
set 	lab5_nios2_qsys_0_oci_traceram 	lab5_nios2_qsys_0_traceram_lpm_dram_bdp_component_module:lab5_nios2_qsys_0_traceram_lpm_dram_bdp_component
set 	lab5_nios2_qsys_0_oci_itrace 	lab5_nios2_qsys_0_nios2_oci_itrace:the_lab5_nios2_qsys_0_nios2_oci_itrace
set 	lab5_nios2_qsys_0_oci_im_path 	 [format "%s|%s" $lab5_nios2_qsys_0_oci_path $lab5_nios2_qsys_0_oci_im]
set 	lab5_nios2_qsys_0_oci_itrace_path 	 [format "%s|%s" $lab5_nios2_qsys_0_oci_path $lab5_nios2_qsys_0_oci_itrace]
set 	lab5_nios2_qsys_0_traceram_path 	 [format "%s|%s" $lab5_nios2_qsys_0_oci_im_path $lab5_nios2_qsys_0_oci_traceram]

#**************************************************************
# Set False Paths
#**************************************************************

set_false_path -from [get_keepers *$lab5_nios2_qsys_0_oci_break_path|break_readreg*] -to [get_keepers *$lab5_nios2_qsys_0_jtag_sr*]
set_false_path -from [get_keepers *$lab5_nios2_qsys_0_oci_debug_path|*resetlatch]     -to [get_keepers *$lab5_nios2_qsys_0_jtag_sr[33]]
set_false_path -from [get_keepers *$lab5_nios2_qsys_0_oci_debug_path|monitor_ready]  -to [get_keepers *$lab5_nios2_qsys_0_jtag_sr[0]]
set_false_path -from [get_keepers *$lab5_nios2_qsys_0_oci_debug_path|monitor_error]  -to [get_keepers *$lab5_nios2_qsys_0_jtag_sr[34]]
set_false_path -from [get_keepers *$lab5_nios2_qsys_0_ocimem_path|*MonDReg*] -to [get_keepers *$lab5_nios2_qsys_0_jtag_sr*]
set_false_path -from *$lab5_nios2_qsys_0_jtag_sr*    -to *$lab5_nios2_qsys_0_jtag_sysclk_path|*jdo*
set_false_path -from sld_hub:*|irf_reg* -to *$lab5_nios2_qsys_0_jtag_sysclk_path|ir*
set_false_path -from sld_hub:*|sld_shadow_jsm:shadow_jsm|state[1] -to *$lab5_nios2_qsys_0_oci_debug_path|monitor_go
set_false_path -from [get_keepers *$lab5_nios2_qsys_0_oci_break_path|dbrk_hit?_latch] -to [get_keepers *$lab5_nios2_qsys_0_jtag_sr*]
set_false_path -from [get_keepers *$lab5_nios2_qsys_0_oci_break_path|trigbrktype] -to [get_keepers *$lab5_nios2_qsys_0_jtag_sr*]
set_false_path -from [get_keepers *$lab5_nios2_qsys_0_oci_break_path|trigger_state] -to [get_keepers *$lab5_nios2_qsys_0_jtag_sr*]

set_false_path -from [get_keepers *$lab5_nios2_qsys_0_traceram_path*address*] -to [get_keepers *$lab5_nios2_qsys_0_jtag_sr*]
set_false_path -from [get_keepers *$lab5_nios2_qsys_0_traceram_path*we_reg*] -to [get_keepers *$lab5_nios2_qsys_0_jtag_sr*]
set_false_path -from [get_keepers *$lab5_nios2_qsys_0_oci_im_path|*trc_im_addr*] -to [get_keepers *$lab5_nios2_qsys_0_jtag_sr*]
set_false_path -from [get_keepers *$lab5_nios2_qsys_0_oci_im_path|*trc_wrap] -to [get_keepers *$lab5_nios2_qsys_0_jtag_sr*]
set_false_path -from [get_keepers *$lab5_nios2_qsys_0_oci_itrace_path|trc_ctrl_reg*] -to [get_keepers *$lab5_nios2_qsys_0_jtag_sr*]
set_false_path -from [get_keepers *$lab5_nios2_qsys_0_oci_itrace_path|d1_debugack] -to [get_keepers *$lab5_nios2_qsys_0_jtag_sr*]
