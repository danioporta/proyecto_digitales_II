
#------------------------------------------------------------------------------
# Simple makefile to simulate Verilog HDL designs under OSX.
# Modify the variables below to suit your own files.
#------------------------------------------------------------------------------

TESTBENCH = Probador_test

all: simulate

simulate:
	iverilog -o $(TESTBENCH) $(TESTBENCH).v && vvp $(TESTBENCH)

gtk: simulate
	gtkwave $(TESTBENCH).vcd

clean:
	rm -rf $(TESTBENCH).vvp $(TESTBENCH).vcd $(TESTBENCH)