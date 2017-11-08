#jiaoxun 07/19/2016
#This script is used for V, T scaling in 0.81V to 0.9V. 
set dname FPMultiplier_8_23_8_23_8_23_uid2_Wrapper  

suppress_message {RC-011}
suppress_message {ENV-003}
suppress_message {PTE-003}
set_host_options -max_cores 6
set power_enable_analysis true

# 0.81V,0C,SS ---> WCZCOM, 
#set WCZ081_NVT "/home/TSMC/45GS_GP_CCS_NVT/TSMCHOME/digital/Front_End/timing_power_noise/CCS/tcbn45gsbwp_120a/tcbn45gsbwpwcz_ccs.db"
#set WCZ081_LVT "/home/TSMC/45GS_GP_CCS_LVT/TSMCHOME/digital/Front_End/timing_power_noise/CCS/tcbn45gsbwplvt_120a/tcbn45gsbwplvtwcz_ccs.db"
#set WCZ081_HVT "/home/TSMC/45GS_GP_CCS_HVT/TSMCHOME/digital/Front_End/timing_power_noise/CCS/tcbn45gsbwphvt_120a/tcbn45gsbwphvtwcz_ccs.db"
# 0.81V,125C,SS ---> WCCOM, 
#set WC081_NVT "/home/TSMC/45GS_GP_CCS_NVT/TSMCHOME/digital/Front_End/timing_power_noise/CCS/tcbn45gsbwp_120a/tcbn45gsbwpwc_ccs.db"
#set WC081_LVT "/home/TSMC/45GS_GP_CCS_LVT/TSMCHOME/digital/Front_End/timing_power_noise/CCS/tcbn45gsbwplvt_120a/tcbn45gsbwplvtwc_ccs.db"
#set WC081_HVT "/home/TSMC/45GS_GP_CCS_HVT/TSMCHOME/digital/Front_End/timing_power_noise/CCS/tcbn45gsbwphvt_120a/tcbn45gsbwphvtwc_ccs.db"

# 0.9V, 125C
#set WC090_NVT "/home/TSMC/45GS_GP_CCS_NVT/TSMCHOME/digital/Front_End/timing_power_noise/CCS/tcbn45gsbwp_120a/tcbn45gsbwpwc0d9_ccs.db"
#set WC090_LVT "/home/TSMC/45GS_GP_CCS_LVT/TSMCHOME/digital/Front_End/timing_power_noise/CCS/tcbn45gsbwplvt_120a/tcbn45gsbwplvtwc0d9_ccs.db"
#set WC090_HVT "/home/TSMC/45GS_GP_CCS_HVT/TSMCHOME/digital/Front_End/timing_power_noise/CCS/tcbn45gsbwphvt_120a/tcbn45gsbwphvtwc0d9_ccs.db"

# 0.9V, 0C
set WC090_NVT "/home/TSMC/45GS_GP_CCS_NVT/TSMCHOME/digital/Front_End/timing_power_noise/CCS/tcbn45gsbwp_120a/tcbn45gsbwpwcz0d9_ccs.db"
set WC090_LVT "/home/TSMC/45GS_GP_CCS_LVT/TSMCHOME/digital/Front_End/timing_power_noise/CCS/tcbn45gsbwplvt_120a/tcbn45gsbwplvtwcz0d9_ccs.db"
set WC090_HVT "/home/TSMC/45GS_GP_CCS_HVT/TSMCHOME/digital/Front_End/timing_power_noise/CCS/tcbn45gsbwphvt_120a/tcbn45gsbwphvtwcz0d9_ccs.db"

# 0.99V, 0C 
set WC099_NVT "/home/TSMC/45GS_GP_CCS_NVT/TSMCHOME/digital/Front_End/timing_power_noise/CCS/tcbn45gsbwp_120a/tcbn45gsbwpbc_ccs.db"
set WC099_LVT "/home/TSMC/45GS_GP_CCS_LVT/TSMCHOME/digital/Front_End/timing_power_noise/CCS/tcbn45gsbwplvt_120a/tcbn45gsbwplvtbc_ccs.db"
set WC099_HVT "/home/TSMC/45GS_GP_CCS_HVT/TSMCHOME/digital/Front_End/timing_power_noise/CCS/tcbn45gsbwphvt_120a/tcbn45gsbwphvtbc_ccs.db"


#set link_path "* $WCZ081_NVT $WCZ081_LVT $WCZ081_HVT"
set link_path "* $WC090_NVT $WC090_LVT $WC090_HVT"

read_verilog ../PL/$dname.pl.v
#just set the current name as what operator is 
current_design $dname
read_parasitics ../PL/$dname.spef.max
current_design

report_design
define_scaling_lib_group -name g1 "$WC090_NVT $WC099_NVT"
define_scaling_lib_group -name g2 "$WC090_LVT $WC099_LVT"
define_scaling_lib_group -name g3 "$WC090_HVT $WC099_HVT"
#define_scaling_lib_group -name g2 "$WCZ081_LVT $WC081_LVT $WC090_LVT $WCZ090_LVT"
#define_scaling_lib_group -name g3 "$WCZ081_HVT $WC081_HVT $WC090_HVT $WCZ090_HVT"
report_lib_groups -scaling -show {voltage temperature}

set vdds [list 0.90 0.91 0.92 0.93 0.94 0.95 0.96 0.97 0.98 0.99]
set temps [list 0]
foreach vdd $vdds {
   foreach temp $temps {
	#create_operating_conditions -name WC_TV=$temp.$vdd -library tcbn45gsbwpwcz_ccs -process 1.00 -temperature $temp -voltage $vdd
	create_operating_conditions -name WC_TV=$temp.$vdd -library tcbn45gsbwpwcz0d9_ccs -process 1.00 -temperature $temp -voltage $vdd
	#set_operating_conditions WC_TV=$temp.$vdd -library tcbn45gsbwpwcz_ccs
	set_operating_conditions WC_TV=$temp.$vdd -library tcbn45gsbwpwcz0d9_ccs
	create_clock -period 2.0 clk
	set_propagated_clock [all_clocks]
	update_timing -full
	report_timing -voltage -group clk > ../REP/PT_t_$dname.$vdd.$temp.rep
	report_timing -delay_type min -voltage -group clk > ../REP/PT_t_$dname.$vdd.$temp._hold_rep
	report_power > ../REP/PT_p_$dname.$vdd.$temp.rep
	write_sdf ../SDF/$dname.$vdd.$temp.sdf
    }
}

exit

