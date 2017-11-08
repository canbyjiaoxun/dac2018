set_host_options -max_cores 2
set dname FPAdder_8_23_uid2_Wrapper
#set dname IntAdder_32_f400_uid2_Wrapper
set SYNOPSYS "/home/tools/DC_2/syn/J-2014.09-SP5-3/amd64/syn/bin"
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
set LIB_DB "$target_library"
set TECH_FILE_nvt "/home/TSMC/45GS_GP_FRONT_NVT/digital/Back_End/milkyway/tcbn45gsbwp_120a/techfiles/HVH_0d5_0/tsmcn45_9lm7X1ZRDL.tf"
set TECH_FILE_hvt "/home/TSMC/45GS_GP_FRONT_HVT/digital/Back_End/milkyway/tcbn45gsbwphvt_120a/techfiles/HVH_0d5_0/tsmcn45_9lm7X1ZRDL.tf"
set TECH_FILE_lvt "/home/TSMC/45GS_GP_FRONT_LVT/digital/Back_End/milkyway/tcbn45gsbwplvt_120a/techfiles/HVH_0d5_0/tsmcn45_9lm7X1ZRDL.tf"
set TECH_FILE "$TECH_FILE_nvt $TECH_FILE_hvt $TECH_FILE_lvt"
set REF_LIB_nvt "/home/TSMC/45GS_GP_FRONT_NVT/digital/Back_End/milkyway/tcbn45gsbwp_120a/frame_only_HVH_0d5_0/tcbn45gsbwp/"
set REF_LIB_hvt "/home/TSMC/45GS_GP_FRONT_HVT/digital/Back_End/milkyway/tcbn45gsbwphvt_120a/frame_only_HVH_0d5_0/tcbn45gsbwphvt/"
set REF_LIB_lvt "/home/TSMC/45GS_GP_FRONT_LVT/digital/Back_End/milkyway/tcbn45gsbwplvt_120a/frame_only_HVH_0d5_0/tcbn45gsbwplvt/"
set REF_LIB "$REF_LIB_nvt $REF_LIB_hvt $REF_LIB_lvt"
set target_library [concat $LIB_DB $target_library]
set physical_library [concat $LIB_PDB]

if {[file exists "MWDESIGN"]} {
	exec rm -r MWDESIGN
}
create_mw_lib -technology $TECH_FILE_nvt -mw_reference_library "$REF_LIB_nvt $REF_LIB_hvt $REF_LIB_lvt" MWDESIGN
open_mw_lib MWDESIGN

analyze -format vhdl /home/jiaoxun/Dropbox/input_based_prediction/operator/$dname.vhdl
elaborate $dname
link

#07/19/2016 change the clock constraint from 1.5ns to 2.0ns
create_clock -period 2.0 clk
set_ideal_network {clk}
set_ideal_network {rst}
set_input_delay 0.01 -max -clock clk -add_delay {X Y}
set_output_delay 0.01 -max -clock clk -add_delay  {R}

set_max_leakage_power 0
set_max_dynamic_power 0
set Coordinates_PLACEMENT [list 0.0 0.0 100.0 400.0]
set_placement_area -coordinate $Coordinates_PLACEMENT -fixed
compile_ultra 

write -format verilog -hierarchy -output ../PS/$dname.ps.v
report_timing > ../REP/PS_t_$dname.rep
report_area > ../REP/PS_a_$dname.rep
report_power > ../REP/PS_p_$dname.rep
write_sdf ../SDF/$dname.ps.sdf
report_timing

#exit
