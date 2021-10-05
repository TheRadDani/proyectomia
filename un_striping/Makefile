all: t1 t2 t3 t4 t5
t1:
	yosys -p "read_verilog un_stripring.v" -p "hierarchy -check -top un_stripring" -p " proc; opt; fsm; opt; memory; opt" -p "techmap; opt" -p "dfflibmap -liberty cmos_cells.lib" -p "abc -liberty cmos_cells.lib" -p "clean" -p "write_verilog unstriping_synth.v"
t2:
	sed -i 's/un_striping/unstriping_synth/' unstriping_synth.v
t3:
	iverilog -o bin BancoPruebas_unstriping.v cmos_cells.v
t4:
	vvp bin
t5:
	gtkwave unstriping.vcd
clean:
	rm -r *.vcd bin


	