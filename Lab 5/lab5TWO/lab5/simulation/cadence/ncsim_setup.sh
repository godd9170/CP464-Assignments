
# (C) 2001-2015 Altera Corporation. All rights reserved.
# Your use of Altera Corporation's design tools, logic functions and 
# other software and tools, and its AMPP partner logic functions, and 
# any output files any of the foregoing (including device programming 
# or simulation files), and any associated documentation or information 
# are expressly subject to the terms and conditions of the Altera 
# Program License Subscription Agreement, Altera MegaCore Function 
# License Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by Altera 
# or its authorized distributors. Please refer to the applicable 
# agreement for further details.

# ACDS 13.0sp1 232 win32 2015.02.05.11:30:33

# ----------------------------------------
# ncsim - auto-generated simulation script

# ----------------------------------------
# initialize variables
TOP_LEVEL_NAME="lab5"
QSYS_SIMDIR="./../"
QUARTUS_INSTALL_DIR="C:/altera/13.0sp1/quartus/"
SKIP_FILE_COPY=0
SKIP_DEV_COM=0
SKIP_COM=0
SKIP_ELAB=0
SKIP_SIM=0
USER_DEFINED_ELAB_OPTIONS=""
USER_DEFINED_SIM_OPTIONS="-input \"@run 100; exit\""

# ----------------------------------------
# overwrite variables - DO NOT MODIFY!
# This block evaluates each command line argument, typically used for 
# overwriting variables. An example usage:
#   sh <simulator>_setup.sh SKIP_ELAB=1 SKIP_SIM=1
for expression in "$@"; do
  eval $expression
  if [ $? -ne 0 ]; then
    echo "Error: This command line argument, \"$expression\", is/has an invalid expression." >&2
    exit $?
  fi
done

# ----------------------------------------
# create compilation libraries
mkdir -p ./libraries/work/
mkdir -p ./libraries/irq_mapper/
mkdir -p ./libraries/rsp_xbar_mux_001/
mkdir -p ./libraries/rsp_xbar_mux/
mkdir -p ./libraries/rsp_xbar_demux_002/
mkdir -p ./libraries/rsp_xbar_demux/
mkdir -p ./libraries/cmd_xbar_mux/
mkdir -p ./libraries/cmd_xbar_demux_001/
mkdir -p ./libraries/cmd_xbar_demux/
mkdir -p ./libraries/id_router_002/
mkdir -p ./libraries/id_router/
mkdir -p ./libraries/addr_router_001/
mkdir -p ./libraries/addr_router/
mkdir -p ./libraries/nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo/
mkdir -p ./libraries/pushbutton/
mkdir -p ./libraries/HEX/
mkdir -p ./libraries/red_LEDs/
mkdir -p ./libraries/green_LEDs/
mkdir -p ./libraries/sliders/
mkdir -p ./libraries/nios2_qsys_0/
mkdir -p ./libraries/onchip_memory2_0/
mkdir -p ./libraries/altera/
mkdir -p ./libraries/lpm/
mkdir -p ./libraries/sgate/
mkdir -p ./libraries/altera_mf/
mkdir -p ./libraries/altera_lnsim/
mkdir -p ./libraries/cycloneii/

# ----------------------------------------
# copy RAM/ROM files to simulation directory
if [ $SKIP_FILE_COPY -eq 0 ]; then
  cp -f $QSYS_SIMDIR/submodules/lab5_nios2_qsys_0_ic_tag_ram.dat ./
  cp -f $QSYS_SIMDIR/submodules/lab5_nios2_qsys_0_ic_tag_ram.hex ./
  cp -f $QSYS_SIMDIR/submodules/lab5_nios2_qsys_0_ic_tag_ram.mif ./
  cp -f $QSYS_SIMDIR/submodules/lab5_nios2_qsys_0_ociram_default_contents.dat ./
  cp -f $QSYS_SIMDIR/submodules/lab5_nios2_qsys_0_ociram_default_contents.hex ./
  cp -f $QSYS_SIMDIR/submodules/lab5_nios2_qsys_0_ociram_default_contents.mif ./
  cp -f $QSYS_SIMDIR/submodules/lab5_nios2_qsys_0_rf_ram_a.dat ./
  cp -f $QSYS_SIMDIR/submodules/lab5_nios2_qsys_0_rf_ram_a.hex ./
  cp -f $QSYS_SIMDIR/submodules/lab5_nios2_qsys_0_rf_ram_a.mif ./
  cp -f $QSYS_SIMDIR/submodules/lab5_nios2_qsys_0_rf_ram_b.dat ./
  cp -f $QSYS_SIMDIR/submodules/lab5_nios2_qsys_0_rf_ram_b.hex ./
  cp -f $QSYS_SIMDIR/submodules/lab5_nios2_qsys_0_rf_ram_b.mif ./
  cp -f $QSYS_SIMDIR/submodules/lab5_onchip_memory2_0.hex ./
fi

# ----------------------------------------
# compile device library files
if [ $SKIP_DEV_COM -eq 0 ]; then
  ncvhdl -v93 "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_syn_attributes.vhd"        -work altera      
  ncvhdl -v93 "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_standard_functions.vhd"    -work altera      
  ncvhdl -v93 "$QUARTUS_INSTALL_DIR/eda/sim_lib/alt_dspbuilder_package.vhd"       -work altera      
  ncvhdl -v93 "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_europa_support_lib.vhd"    -work altera      
  ncvhdl -v93 "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives_components.vhd" -work altera      
  ncvhdl -v93 "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.vhd"            -work altera      
  ncvhdl -v93 "$QUARTUS_INSTALL_DIR/eda/sim_lib/220pack.vhd"                      -work lpm         
  ncvhdl -v93 "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.vhd"                     -work lpm         
  ncvhdl -v93 "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate_pack.vhd"                   -work sgate       
  ncvhdl -v93 "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.vhd"                        -work sgate       
  ncvhdl -v93 "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf_components.vhd"         -work altera_mf   
  ncvhdl -v93 "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.vhd"                    -work altera_mf   
  ncvlog -sv  "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv"                  -work altera_lnsim
  ncvhdl -v93 "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim_components.vhd"      -work altera_lnsim
  ncvhdl -v93 "$QUARTUS_INSTALL_DIR/eda/sim_lib/cycloneii_atoms.vhd"              -work cycloneii   
  ncvhdl -v93 "$QUARTUS_INSTALL_DIR/eda/sim_lib/cycloneii_components.vhd"         -work cycloneii   
fi

# ----------------------------------------
# compile design files in correct order
if [ $SKIP_COM -eq 0 ]; then
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/lab5_irq_mapper.vho"                                                                        -work irq_mapper                                                                        -cdslib ./cds_libs/irq_mapper.cds.lib                                                                       
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/lab5_rsp_xbar_mux_001.vho"                                                                  -work rsp_xbar_mux_001                                                                  -cdslib ./cds_libs/rsp_xbar_mux_001.cds.lib                                                                 
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/lab5_rsp_xbar_mux.vho"                                                                      -work rsp_xbar_mux                                                                      -cdslib ./cds_libs/rsp_xbar_mux.cds.lib                                                                     
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/lab5_rsp_xbar_demux_002.vho"                                                                -work rsp_xbar_demux_002                                                                -cdslib ./cds_libs/rsp_xbar_demux_002.cds.lib                                                               
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/lab5_rsp_xbar_demux.vho"                                                                    -work rsp_xbar_demux                                                                    -cdslib ./cds_libs/rsp_xbar_demux.cds.lib                                                                   
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/lab5_cmd_xbar_mux.vho"                                                                      -work cmd_xbar_mux                                                                      -cdslib ./cds_libs/cmd_xbar_mux.cds.lib                                                                     
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/lab5_cmd_xbar_demux_001.vho"                                                                -work cmd_xbar_demux_001                                                                -cdslib ./cds_libs/cmd_xbar_demux_001.cds.lib                                                               
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/lab5_cmd_xbar_demux.vho"                                                                    -work cmd_xbar_demux                                                                    -cdslib ./cds_libs/cmd_xbar_demux.cds.lib                                                                   
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/lab5_id_router_002.vho"                                                                     -work id_router_002                                                                     -cdslib ./cds_libs/id_router_002.cds.lib                                                                    
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/lab5_id_router.vho"                                                                         -work id_router                                                                         -cdslib ./cds_libs/id_router.cds.lib                                                                        
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/lab5_addr_router_001.vho"                                                                   -work addr_router_001                                                                   -cdslib ./cds_libs/addr_router_001.cds.lib                                                                  
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/lab5_addr_router.vho"                                                                       -work addr_router                                                                       -cdslib ./cds_libs/addr_router.cds.lib                                                                      
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/lab5_nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo.vho" -work nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo -cdslib ./cds_libs/nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo.cds.lib
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/lab5_pushbutton.vhd"                                                                        -work pushbutton                                                                        -cdslib ./cds_libs/pushbutton.cds.lib                                                                       
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/lab5_HEX.vhd"                                                                               -work HEX                                                                               -cdslib ./cds_libs/HEX.cds.lib                                                                              
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/lab5_red_LEDs.vhd"                                                                          -work red_LEDs                                                                          -cdslib ./cds_libs/red_LEDs.cds.lib                                                                         
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/lab5_green_LEDs.vhd"                                                                        -work green_LEDs                                                                        -cdslib ./cds_libs/green_LEDs.cds.lib                                                                       
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/lab5_sliders.vhd"                                                                           -work sliders                                                                           -cdslib ./cds_libs/sliders.cds.lib                                                                          
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/lab5_nios2_qsys_0.vho"                                                                      -work nios2_qsys_0                                                                      -cdslib ./cds_libs/nios2_qsys_0.cds.lib                                                                     
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/lab5_nios2_qsys_0_jtag_debug_module_sysclk.vhd"                                             -work nios2_qsys_0                                                                      -cdslib ./cds_libs/nios2_qsys_0.cds.lib                                                                     
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/lab5_nios2_qsys_0_jtag_debug_module_tck.vhd"                                                -work nios2_qsys_0                                                                      -cdslib ./cds_libs/nios2_qsys_0.cds.lib                                                                     
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/lab5_nios2_qsys_0_jtag_debug_module_wrapper.vhd"                                            -work nios2_qsys_0                                                                      -cdslib ./cds_libs/nios2_qsys_0.cds.lib                                                                     
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/lab5_nios2_qsys_0_oci_test_bench.vhd"                                                       -work nios2_qsys_0                                                                      -cdslib ./cds_libs/nios2_qsys_0.cds.lib                                                                     
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/lab5_nios2_qsys_0_test_bench.vhd"                                                           -work nios2_qsys_0                                                                      -cdslib ./cds_libs/nios2_qsys_0.cds.lib                                                                     
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/lab5_onchip_memory2_0.vhd"                                                                  -work onchip_memory2_0                                                                  -cdslib ./cds_libs/onchip_memory2_0.cds.lib                                                                 
  ncvhdl -v93 "$QSYS_SIMDIR/lab5.vhd"                                                                                                                                                                                                                                                                                                  
  ncvhdl -v93 "$QSYS_SIMDIR/lab5_nios2_qsys_0_instruction_master_translator.vhd"                                                                                                                                                                                                                                                       
  ncvhdl -v93 "$QSYS_SIMDIR/lab5_nios2_qsys_0_data_master_translator.vhd"                                                                                                                                                                                                                                                              
  ncvhdl -v93 "$QSYS_SIMDIR/lab5_nios2_qsys_0_jtag_debug_module_translator.vhd"                                                                                                                                                                                                                                                        
  ncvhdl -v93 "$QSYS_SIMDIR/lab5_onchip_memory2_0_s1_translator.vhd"                                                                                                                                                                                                                                                                   
  ncvhdl -v93 "$QSYS_SIMDIR/lab5_sliders_s1_translator.vhd"                                                                                                                                                                                                                                                                            
  ncvhdl -v93 "$QSYS_SIMDIR/lab5_green_leds_s1_translator.vhd"                                                                                                                                                                                                                                                                         
  ncvhdl -v93 "$QSYS_SIMDIR/lab5_rst_controller.vhd"                                                                                                                                                                                                                                                                                   
  ncvhdl -v93 "$QSYS_SIMDIR/lab5_rst_controller_001.vhd"                                                                                                                                                                                                                                                                               
fi

# ----------------------------------------
# elaborate top level design
if [ $SKIP_ELAB -eq 0 ]; then
  ncelab -access +w+r+c -namemap_mixgen -relax $USER_DEFINED_ELAB_OPTIONS $TOP_LEVEL_NAME
fi

# ----------------------------------------
# simulate
if [ $SKIP_SIM -eq 0 ]; then
  eval ncsim -licqueue $USER_DEFINED_SIM_OPTIONS $TOP_LEVEL_NAME
fi
