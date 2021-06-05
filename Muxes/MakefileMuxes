all:    yosys sed autoinst verilog

yosys:
	yosys -s scriptmux 
 
sed:
	sed -i 's/Salida_conductual/Salida_estructural/' synth.v  
	sed -i 's/Muxes/synth/' synth.v
	sed -i 's/Salida_conductual/Salida_estructural/' synth.v 
	sed -i 's/mux2x1/synth1/' synth.v
	sed -i 's/Salida_conductual/Salida_estructural/' synth.v 
	sed -i 's/muxL1/synth2/' synth.v
	sed -i 's/Salida_conductual/Salida_estructural/' synth.v 
	sed -i 's/muxL2/synth3/' synth.v
	sed -i 's/Salida_conductual/Salida_estructural/' synth.v 
autoinst:    
	emacs -batch BancoPruebas_Mux.v -f verilog-auto -f save-buffer
	
verilog:
	iverilog -o test.vvp BancoPruebas_Mux.v
	vvp test.vvp
	gtkwave muxL2.vcd
    
