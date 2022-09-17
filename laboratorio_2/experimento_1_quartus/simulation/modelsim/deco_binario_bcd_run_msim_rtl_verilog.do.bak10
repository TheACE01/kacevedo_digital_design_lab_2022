transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/kevin\ Avevedo/Desktop/Repositorios/GitHub/kacevedo_digital_design_lab_2022/laboratorio_2/experimento_1_quartus {C:/Users/kevin Avevedo/Desktop/Repositorios/GitHub/kacevedo_digital_design_lab_2022/laboratorio_2/experimento_1_quartus/deco_binario_bcd.sv}

vlog -sv -work work +incdir+C:/Users/kevin\ Avevedo/Desktop/Repositorios/GitHub/kacevedo_digital_design_lab_2022/laboratorio_2/experimento_1_quartus {C:/Users/kevin Avevedo/Desktop/Repositorios/GitHub/kacevedo_digital_design_lab_2022/laboratorio_2/experimento_1_quartus/deco_binario_bcd_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  deco_binario_bcd_tb

add wave *
view structure
view signals
run -all
