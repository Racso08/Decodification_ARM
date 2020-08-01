transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+D:/QuartusProyects/ALU/TallerDiseno-LAB3-master/ALU/OperacionesLogicas {D:/QuartusProyects/ALU/TallerDiseno-LAB3-master/ALU/OperacionesLogicas/corrimiento_circular.sv}
vlog -sv -work work +incdir+D:/QuartusProyects/ALU/TallerDiseno-LAB3-master/ALU/OperacionesLogicas {D:/QuartusProyects/ALU/TallerDiseno-LAB3-master/ALU/OperacionesLogicas/corrimiento_circular_test.sv}

