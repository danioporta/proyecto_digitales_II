#------------------------------------------------------------------------------
# Simple makefile to simulate Verilog HDL designs under OSX.
# Modify the variables below to suit your own files.
#------------------------------------------------------------------------------
# 
#------------------------------------------------------------------------------
TESTBENCH = Probador_test
SRCS	  = top.v up_counter.v clken_gen.v

all: simulate

simulate:
	iverilog -o $(TESTBENCH) $(TESTBENCH).v && vvp $(TESTBENCH)

gtkwave: simulate
	gtkwave $(TESTBENCH).vcd

clean:
	rm -rf $(TESTBENCH).vvp $(TESTBENCH).vcd $(TESTBENCH)_log.txt