all: t1 t2 t3 
t1:
	iverilog -o bin BancoPruebas_striping.v 
t2:
	vvp bin
t3:
	gtkwave unstriping.vcd
clean:
	rm -r *.vcd bin


	