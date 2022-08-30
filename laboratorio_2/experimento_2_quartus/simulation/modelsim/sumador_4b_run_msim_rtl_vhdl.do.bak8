transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Usuario/Documents/Taller diseño/Taller 2/kacevedo_digital_design_lab_2022/laboratorio_2/experimento_2_quartus/half_adder.vhd}
vcom -93 -work work {C:/Users/Usuario/Documents/Taller diseño/Taller 2/kacevedo_digital_design_lab_2022/laboratorio_2/experimento_2_quartus/orgate.vhd}
vcom -93 -work work {C:/Users/Usuario/Documents/Taller diseño/Taller 2/kacevedo_digital_design_lab_2022/laboratorio_2/experimento_2_quartus/full_adder.vhd}
vcom -93 -work work {C:/Users/Usuario/Documents/Taller diseño/Taller 2/kacevedo_digital_design_lab_2022/laboratorio_2/experimento_2_quartus/sumador_4.vhd}
vcom -93 -work work {C:/Users/Usuario/Documents/Taller diseño/Taller 2/kacevedo_digital_design_lab_2022/laboratorio_2/experimento_2_quartus/decodificador.vhd}
vcom -93 -work work {C:/Users/Usuario/Documents/Taller diseño/Taller 2/kacevedo_digital_design_lab_2022/laboratorio_2/experimento_2_quartus/sumador_deco_4.vhd}

vcom -93 -work work {C:/Users/Usuario/Documents/Taller diseño/Taller 2/kacevedo_digital_design_lab_2022/laboratorio_2/experimento_2_quartus/sumador_deco_4_tb.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cyclonev -L rtl_work -L work -voptargs="+acc"  sumador_deco_4_tb

add wave *
view structure
view signals
run -all
