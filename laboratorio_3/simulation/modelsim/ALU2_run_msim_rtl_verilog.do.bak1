transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/kevin\ Avevedo/Desktop/ALU {C:/Users/kevin Avevedo/Desktop/ALU/display_hex.sv}
vlog -sv -work work +incdir+C:/Users/kevin\ Avevedo/Desktop/ALU {C:/Users/kevin Avevedo/Desktop/ALU/ALU_FPGA.sv}
vlog -sv -work work +incdir+C:/Users/kevin\ Avevedo/Desktop/ALU {C:/Users/kevin Avevedo/Desktop/ALU/shift_right.sv}
vlog -sv -work work +incdir+C:/Users/kevin\ Avevedo/Desktop/ALU {C:/Users/kevin Avevedo/Desktop/ALU/shift_left.sv}
vlog -sv -work work +incdir+C:/Users/kevin\ Avevedo/Desktop/ALU {C:/Users/kevin Avevedo/Desktop/ALU/op_sum.sv}
vlog -sv -work work +incdir+C:/Users/kevin\ Avevedo/Desktop/ALU {C:/Users/kevin Avevedo/Desktop/ALU/op_sub.sv}
vlog -sv -work work +incdir+C:/Users/kevin\ Avevedo/Desktop/ALU {C:/Users/kevin Avevedo/Desktop/ALU/op_mod.sv}
vlog -sv -work work +incdir+C:/Users/kevin\ Avevedo/Desktop/ALU {C:/Users/kevin Avevedo/Desktop/ALU/op_div.sv}
vlog -sv -work work +incdir+C:/Users/kevin\ Avevedo/Desktop/ALU {C:/Users/kevin Avevedo/Desktop/ALU/multiplier.sv}
vlog -sv -work work +incdir+C:/Users/kevin\ Avevedo/Desktop/ALU {C:/Users/kevin Avevedo/Desktop/ALU/op_and.sv}
vlog -sv -work work +incdir+C:/Users/kevin\ Avevedo/Desktop/ALU {C:/Users/kevin Avevedo/Desktop/ALU/op_or.sv}
vlog -sv -work work +incdir+C:/Users/kevin\ Avevedo/Desktop/ALU {C:/Users/kevin Avevedo/Desktop/ALU/op_xor.sv}
vlog -sv -work work +incdir+C:/Users/kevin\ Avevedo/Desktop/ALU {C:/Users/kevin Avevedo/Desktop/ALU/ALU.sv}

vlog -sv -work work +incdir+C:/Users/kevin\ Avevedo/Desktop/ALU {C:/Users/kevin Avevedo/Desktop/ALU/ALU_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  ALU_tb

add wave *
view structure
view signals
run -all
