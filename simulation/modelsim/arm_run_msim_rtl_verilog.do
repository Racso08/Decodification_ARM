<<<<<<< HEAD
transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/skryf/Documents/Taller\ de\ Diseno\ Digital/Laboratorio\ 5/Decodification_ARM/Tests {C:/Users/skryf/Documents/Taller de Diseno Digital/Laboratorio 5/Decodification_ARM/Tests/dataMem_tb.sv}
vlog -sv -work work +incdir+C:/Users/skryf/Documents/Taller\ de\ Diseno\ Digital/Laboratorio\ 5/Decodification_ARM/Modules {C:/Users/skryf/Documents/Taller de Diseno Digital/Laboratorio 5/Decodification_ARM/Modules/dataMem.sv}

=======
transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/Isaac\ Porras/Desktop/Decodification_ARM/Modules {C:/Users/Isaac Porras/Desktop/Decodification_ARM/Modules/register.sv}
vlog -sv -work work +incdir+C:/Users/Isaac\ Porras/Desktop/Decodification_ARM/Modules {C:/Users/Isaac Porras/Desktop/Decodification_ARM/Modules/PC_selection.sv}
vlog -sv -work work +incdir+C:/Users/Isaac\ Porras/Desktop/Decodification_ARM/Tests {C:/Users/Isaac Porras/Desktop/Decodification_ARM/Tests/pc_sel_test.sv}
vlog -sv -work work +incdir+C:/Users/Isaac\ Porras/Desktop/Decodification_ARM/Modules {C:/Users/Isaac Porras/Desktop/Decodification_ARM/Modules/instructionMem.sv}

>>>>>>> master
