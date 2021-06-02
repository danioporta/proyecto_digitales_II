module probador_PSRX(input out_serial2_conductual,
								input out_serial2_estructural,
								output reg clk_4f,
								output reg active,
						        output reg clk_32f);
	initial begin
	$dumpfile("paraleloserialrx.vcd");
	$dumpvars;

	active <= 0;
	
	@(posedge clk_4f);
	active <= 0;


	@(posedge clk_4f);
	active <= 1;
	
	@(posedge clk_4f);
	active <= 0;
	

	@(posedge clk_4f);
	active <= 1;
	

	@(posedge clk_4f);
	active <= 0;
	

	@(posedge clk_4f);
	active <= 1;
	

	@(posedge clk_4f);
	active <= 0;
	

	@(posedge clk_4f);
	active <= 1;
	@(posedge clk_4f);
	$finish;
	end
	
	initial clk_4f <= 1;
	always #8 clk_4f <= ~clk_4f;

	initial clk_32f <= 1;
	always #1 clk_32f <= ~clk_32f;


endmodule
