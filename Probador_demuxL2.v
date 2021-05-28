module probador_demuxL2(input [7:0] Salida0,
						input [7:0] Salida1,
						input [7:0] Salida2,
						input [7:0] Salida3,
						output reg validSalida0,
						output reg validSalida1,
						output reg validSalida2,
						output reg validSalida3,
						output reg validEntrada,
						output reg valid1,
						output reg valid2,
						output reg [7:0] Entrada,
						output reg clk_4f,
						output reg clk_2f,
						output reg clk_f,
						output reg reset,
						output reg selector);
	initial begin
	$dumpfile("demuxL2.vcd");
	$dumpvars;

	{validSalida0,validSalida1,validSalida2,validSalida3,valid1, valid2, validEntrada} <= 0;
	{Entrada} <= 8'h00;
    selector<=1;
	reset<=1;
	
	@(posedge clk_2f);
    selector<=selector+1;
 
	//valid <= 1;
	//data_in <= 32'hEEFF9900;

	@(posedge clk_f);
	reset <= 1;
	/*validEntrada <= 1;*/
    validSalida0 <= 1;
	validSalida1 <= 1;
    validSalida2 <= 1;
    validSalida3 <= 1;


	{Entrada} <= {Entrada}+1;
    @(posedge clk_2f);
    selector<=selector+1;


	@(posedge clk_f);
	
	validSalida0 <= 1;
	validSalida1 <= 1;
    validSalida2 <= 1;
    validSalida3 <= 0;
    
	 
   {Entrada} <= {Entrada}+1;
      
      @(posedge clk_2f);

    selector<=selector+1;

	@(posedge clk_f);
	
	validSalida0 <= 1;
	validSalida1 <= 1;
    validSalida2 <= 1;
    validSalida3 <= 1;

 
   {Entrada} <= {Entrada}+1;
   @(posedge clk_2f);

    selector<=selector+1;
    
	@(posedge clk_f);
	
	validSalida0 <= 1;
	validSalida1 <= 1;
    validSalida2 <= 1;
    validSalida3 <= 1;

 
   {Entrada} <= {Entrada}+1;
    @(posedge clk_2f)
    selector<=selector+1;
	@(posedge clk_f);
	
	validSalida0 <= 1;
	validSalida1 <= 1;
    validSalida2 <= 1;
    validSalida3 <= 1;
 
   {Entrada} <= {Entrada}+1;
        selector<=selector+1;

	@(posedge clk_f);
	
	validSalida0 <= 1;
	validSalida1 <= 1;
    validSalida2 <= 1;
    validSalida3 <= 1;

 
   {Entrada} <= {Entrada}+1;
	@(posedge clk_f);

	@(posedge clk_f);
	$finish;
	end
	
	initial clk_4f <= 0;
	always #1 clk_4f <= ~clk_4f;

	initial clk_2f <= 0;
	always #2 clk_2f <= ~clk_2f;

	initial clk_f <= 0;
	always #4 clk_f <= ~clk_f;


endmodule
