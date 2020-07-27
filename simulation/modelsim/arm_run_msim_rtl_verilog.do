transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/arm {C:/arm/controller.sv}
vlog -sv -work work +incdir+C:/arm {C:/arm/arm.sv}
vlog -sv -work work +incdir+C:/arm {C:/arm/decoder.sv}
vlog -sv -work work +incdir+C:/arm {C:/arm/condlogic.sv}
vlog -sv -work work +incdir+C:/arm {C:/arm/condcheck.sv}
vlog -sv -work work +incdir+C:/arm {C:/arm/datapath.sv}
vlog -sv -work work +incdir+C:/arm {C:/arm/regfile.sv}
vlog -sv -work work +incdir+C:/arm {C:/arm/adder.sv}
vlog -sv -work work +incdir+C:/arm {C:/arm/extend.sv}
vlog -sv -work work +incdir+C:/arm {C:/arm/flopr.sv}
vlog -sv -work work +incdir+C:/arm {C:/arm/flopenr.sv}
vlog -sv -work work +incdir+C:/arm {C:/arm/mux2.sv}
vlog -sv -work work +incdir+C:/arm {C:/arm/testbench.sv}
vlog -sv -work work +incdir+C:/arm {C:/arm/top.sv}
vlog -sv -work work +incdir+C:/arm {C:/arm/dmem.sv}
vlog -sv -work work +incdir+c:/arm/alu/unidad {c:/arm/alu/unidad/unidad_logico_aritmetica.sv}
vlog -sv -work work +incdir+c:/arm/alu/operacioneslogicas {c:/arm/alu/operacioneslogicas/compuerta_and.sv}
vlog -sv -work work +incdir+c:/arm/alu/operacioneslogicas {c:/arm/alu/operacioneslogicas/compuerta_or.sv}
vlog -sv -work work +incdir+c:/arm/alu/operacioneslogicas {c:/arm/alu/operacioneslogicas/compuerta_xor.sv}
vlog -sv -work work +incdir+c:/arm/alu/operacioneslogicas {c:/arm/alu/operacioneslogicas/compuerta_not.sv}
vlog -sv -work work +incdir+c:/arm/alu/operacioneslogicas {c:/arm/alu/operacioneslogicas/correr_derecha_logico.sv}
vlog -sv -work work +incdir+c:/arm/alu/operacioneslogicas {c:/arm/alu/operacioneslogicas/correr_izquierda_logico.sv}
vlog -sv -work work +incdir+c:/arm/alu/unidad {c:/arm/alu/unidad/mux3a8.sv}
vlog -sv -work work +incdir+c:/arm/alu/operacionesaritmeticas {c:/arm/alu/operacionesaritmeticas/sumador.sv}
vlog -sv -work work +incdir+c:/arm/alu/operacionesaritmeticas {c:/arm/alu/operacionesaritmeticas/restador.sv}
vlog -sv -work work +incdir+c:/arm/alu/operacionesaritmeticas {c:/arm/alu/operacionesaritmeticas/correr_derecha_aritmetico.sv}
vlog -sv -work work +incdir+c:/arm/alu/operacionesaritmeticas {c:/arm/alu/operacionesaritmeticas/correr_izquierda_aritmetico.sv}
vlog -sv -work work +incdir+c:/arm/alu/unidad {c:/arm/alu/unidad/mux1a2.sv}
vlog -sv -work work +incdir+c:/arm/alu/unidadflags {c:/arm/alu/unidadflags/flag_negativo.sv}
vlog -sv -work work +incdir+c:/arm/alu/unidadflags {c:/arm/alu/unidadflags/flag_cero.sv}
vlog -sv -work work +incdir+c:/arm/alu/unidadflags {c:/arm/alu/unidadflags/flag_overflow.sv}
vlog -sv -work work +incdir+c:/arm/alu/unidadflags {c:/arm/alu/unidadflags/flag_carry.sv}
vlog -sv -work work +incdir+C:/arm {C:/arm/imem.sv}

