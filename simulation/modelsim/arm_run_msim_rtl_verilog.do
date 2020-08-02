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

