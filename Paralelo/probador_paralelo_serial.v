module probador_paralelo_serial(input out_serial_conductual,
								input out_serial_estructural,
								output reg clk_4f,
								output reg reset,
								output reg valid_in,
						        output reg [7:0] in_serial,
						        output reg clk_32f);
	initial begin
	$dumpfile("paraleloserial.vcd");
	$dumpvars;

	{valid_in} <= 0;
	in_serial <= 8'h00;
	reset <=0;
	
	@(posedge clk_4f);
	valid_in <= 0;
	in_serial<= 8'h00;
	reset <= 0;

	@(posedge clk_4f);
	valid_in <= 0;
	in_serial<= 8'hCC;
	reset <=1;
	
	@(posedge clk_4f);
	valid_in <= 1;
	in_serial <= 8'hAB;

	@(posedge clk_4f);
	valid_in <= 1;
	in_serial <= 8'hCA;

	@(posedge clk_4f);
	valid_in <= 1;
	in_serial <= 8'h12;

	@(posedge clk_4f);
	valid_in <= 0;
	in_serial <= 8'hDC;

	@(posedge clk_4f);
	valid_in <= 1;
	in_serial <= 8'hFA;

	@(posedge clk_4f);
	valid_in <= 1;
	in_serial <= 8'h33;
	@(posedge clk_4f);
	$finish;
	end
	
	initial clk_4f <= 1;
	always #8 clk_4f <= ~clk_4f;

	initial clk_32f <= 1;
	always #1 clk_32f <= ~clk_32f;


endmodule
