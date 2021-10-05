all: t1 t2 t3 t4 t5
t1:
	yosys -p "read_verilog striping.v" -p "hierarchy -check -top striping" -p " proc; opt; fsm; opt; memory; opt" -p "techmap; opt" -p "dfflibmap -liberty cmos_cells.lib" -p "abc -liberty cmos_cells.lib" -p "clean" -p "write_verilog striping_synth.v"
t2:
	sed -i 's/striping/striping_synth/' striping_synth.v
t3:
	iverilog -o bin BancoPruebas_striping.v 
t4:
	vvp bin
t5:
	gtkwave striping.vcd
clean:
	rm -r *.vcd bin