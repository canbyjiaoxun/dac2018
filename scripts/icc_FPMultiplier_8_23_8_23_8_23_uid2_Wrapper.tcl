set_host_options -max_cores 4
set dname FPMultiplier_8_23_8_23_8_23_uid2_Wrapper  
set SYNOPSYS [getenv "SYNOPSYS"]
set search_path  ". $SYNOPSYS /home/tools/DC_2/syn/J-2014.09-SP5-3/dw /home/tools/DC_2/syn/J-2014.09-SP5-3/libraries/syn"
set synthetic_library "/home/tools/DC_2/syn/J-2014.09-SP5-3/libraries/syn/dw_foundation.sldb /home/tools/DC_2/syn/J-2014.09-SP5-3/libraries/syn/standard.sldb"
set target_library_nvt "/home/TSMC/45GS_GP_FRONT_NVT/digital/Front_End/timing_power_noise/NLDM/tcbn45gsbwp_120a/tcbn45gsbwpwc.db"
set target_library_hvt "/home/TSMC/45GS_GP_FRONT_HVT/digital/Front_End/timing_power_noise/NLDM/tcbn45gsbwphvt_120a/tcbn45gsbwphvtwc.db"
set target_library_lvt "/home/TSMC/45GS_GP_FRONT_LVT/digital/Front_End/timing_power_noise/NLDM/tcbn45gsbwplvt_120a/tcbn45gsbwplvtwc.db"
set target_library "$target_library_nvt $target_library_hvt $target_library_lvt"
set link_library "$target_library $synthetic_library"
set LIB_PDB_nvt "/home/TSMC/45GS_GP_FRONT_NVT/digital/Front_End/physical_compiler/tcbn45gsbwp_110a/HVH_0d5_0/tcbn45gsbwp_9lm7X1ZRDL.pdb"
set LIB_PDB_hvt "/home/TSMC/45GS_GP_FRONT_HVT/digital/Front_End/physical_compiler/tcbn45gsbwphvt_110a/HVH_0d5_0/tcbn45gsbwphvt_9lm7X1ZRDL.pdb"
set LIB_PDB_lvt "/home/TSMC/45GS_GP_FRONT_LVT/digital/Front_End/physical_compiler/tcbn45gsbwplvt_110a/HVH_0d5_0/tcbn45gsbwplvt_9lm7X1ZRDL.pdb"
set LIB_PDB "$LIB_PDB_nvt $LIB_PDB_hvt $LIB_PDB_lvt"

set search_path [concat $search_path /home/TSMC/45GS_GP_FRONT_NVT/digital/Front_End/timing_power_noise/NLDM/tcbn45gsbwp_120a /home/TSMC/45GS_GP_FRONT_NVT/digital/Front_End/physical_compiler/tcbn45gsbwp_110a/HVH_0d5_0]
set LIB_DB "$target_library"

set TECH_FILE_nvt "/home/TSMC/45GS_GP_FRONT_NVT/digital/Back_End/milkyway/tcbn45gsbwp_120a/techfiles/HVH_0d5_0/tsmcn45_9lm7X1ZRDL.tf"
set TECH_FILE_hvt "/home/TSMC/45GS_GP_FRONT_HVT/digital/Back_End/milkyway/tcbn45gsbwphvt_120a/techfiles/HVH_0d5_0/tsmcn45_9lm7X1ZRDL.tf"
set TECH_FILE_lvt "/home/TSMC/45GS_GP_FRONT_LVT/digital/Back_End/milkyway/tcbn45gsbwplvt_120a/techfiles/HVH_0d5_0/tsmcn45_9lm7X1ZRDL.tf"
set TECH_FILE "$TECH_FILE_nvt $TECH_FILE_hvt $TECH_FILE_lvt"

set REF_LIB_nvt "/home/TSMC/45GS_GP_FRONT_NVT/digital/Back_End/milkyway/tcbn45gsbwp_120a/frame_only_HVH_0d5_0/tcbn45gsbwp/"
set REF_LIB_hvt "/home/TSMC/45GS_GP_FRONT_HVT/digital/Back_End/milkyway/tcbn45gsbwphvt_120a/frame_only_HVH_0d5_0/tcbn45gsbwphvt/"
set REF_LIB_lvt "/home/TSMC/45GS_GP_FRONT_LVT/digital/Back_End/milkyway/tcbn45gsbwplvt_120a/frame_only_HVH_0d5_0/tcbn45gsbwplvt/"
set REF_LIB "$REF_LIB_nvt $REF_LIB_hvt $REF_LIB_lvt"

set TLUPLUS_MAX "/home/TSMC/45GS_GP_FRONT_NVT/digital/Back_End/milkyway/tcbn45gsbwp_120a/techfiles/tluplus/cln45gs_1p09m+alrdl_cworst_top2.tluplus"
set TLUPLUS_MIN "/home/TSMC/45GS_GP_FRONT_NVT/digital/Back_End/milkyway/tcbn45gsbwp_120a/techfiles/tluplus/cln45gs_1p09m+alrdl_cbest_top2.tluplus"

set TLUPLUS_MAX_LVT "/home/TSMC/45GS_GP_FRONT_LVT/digital/Back_End/milkyway/tcbn45gsbwplvt_120a/techfiles/tluplus/cln45gs_1p09m+alrdl_cworst_top2.tluplus"
set TLUPLUS_MIN_LVT "/home/TSMC/45GS_GP_FRONT_LVT/digital/Back_End/milkyway/tcbn45gsbwplvt_120a/techfiles/tluplus/cln45gs_1p09m+alrdl_cbest_top2.tluplus"

set TLUPLUS_MAX_HVT "/home/TSMC/45GS_GP_FRONT_HVT/digital/Back_End/milkyway/tcbn45gsbwphvt_120a/techfiles/tluplus/cln45gs_1p09m+alrdl_cworst_top2.tluplus"
set TLUPLUS_MIN_HVT "/home/TSMC/45GS_GP_FRONT_HVT/digital/Back_End/milkyway/tcbn45gsbwphvt_120a/techfiles/tluplus/cln45gs_1p09m+alrdl_cbest_top2.tluplus"

set TECH2ITF "/home/TSMC/45GS_GP_FRONT_NVT/digital/Back_End/milkyway/tcbn45gsbwp_120a/techfiles/tluplus/star.map_9M" 
# /home/TSMC/45GS_GP_FRONT_HVT/digital/Back_End/milkyway/tcbn45gsbwphvt_120a/techfiles/tluplus/star.map_9M
# /home/TSMC/45GS_GP_FRONT_LVT/digital/Back_End/milkyway/tcbn45gsbwplvt_120a/techfiles/tluplus/star.map_9M
set target_library [concat $LIB_DB $target_library]
set physical_library [concat $LIB_PDB]
if {[file exists "MWDESIGN"]} {
	exec rm -r MWDESIGN
}
create_mw_lib -technology $TECH_FILE_nvt -mw_reference_library "$REF_LIB_nvt $REF_LIB_hvt $REF_LIB_lvt" MWDESIGN
set_tlu_plus_files -max_tluplus $TLUPLUS_MAX -min_tluplus $TLUPLUS_MIN -tech2itf_map $TECH2ITF
open_mw_lib MWDESIGN
set mw_logic0_net VSS
set mw_logic1_net VDD
###2014/08/29
#set compile_delete_unloaded_sequential_cells false
#set compile_enable_register_merging false
#set hdlin_preserve_sequential true
#set physopt_delete_unloaded_cells false

read_verilog ../PS/$dname.ps.v  
uniquify_fp_mw_cel
current_design 
derive_pg_connection -power_net VDD -ground_net VSS
derive_pg_connection -power_net VDD -ground_net VSS -tie
create_floorplan -core_utilization 0.70 -core_aspect_ratio 1 -left_io2core 5 -bottom_io2core 5 -right_io2core 5 -top_io2core 5
#2016/08/06 change the clock constraint from 3.0ns to 2.0ns 
create_clock -period 2.0 clk 
create_clock -period 2.0 rst
set_ideal_network {clk}
set_ideal_network {rst}
set_input_delay 0.01 -max -clock clk -add_delay  {X Y}
set_output_delay 0.01 -max -clock clk -add_delay {R}
#set_dont_touch [get_cells test/OUTPUT_ST2_PART_d1_reg*]


#Power Planning & placement
create_rectilinear_rings -nets  {VDD VSS} -width {2 2} -layers {M9 M8}
create_power_straps  -direction vertical -start_at 15 -num_placement_strap 100 -increment_x_or_y 30 -nets  {VSS VDD}  -layer M8 -width 2
place_opt -effort high -num_cpus 8 
preroute_standard_cells -nets {VDD VSS} -connect both -extend_to_boundaries_and_generate_pins 
#CTS
set_clock_tree_exceptions -preserve_hierarchy [get_clock *]
clock_opt -only_hold_time 
#routing
route_opt -effort high 
set_fix_hold [all_clocks]
route_opt -incremental -only_hold_time 
set_propagated_clock [all_clocks]

derive_pg_connection -power_net VDD -ground_net VSS
derive_pg_connection -power_net VDD -ground_net VSS -tie
verify_pg_nets  -macro_pin_connection ignore
change_names -rules verilog -hierarchy
write_verilog  ../PL/$dname.pl.v
extract_rc -coupling_cap -routed_nets_only -incremental
write_parasitics -output ../PL/$dname.spef -format SPEF
report_timing > ../REP/PL_t_$dname.rep
report_area > ../REP/PL_a_$dname.rep
report_power > ../REP/PL_p_$dname.rep
write_sdf ../SDF/$dname.pl.sdf
report_timing
quit
