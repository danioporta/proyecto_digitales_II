module probador_mux(input [7:0] Salida_estructural,
                    input [7:0] Salida_condutual,
						input validSalida0,
						input validSalida1,
						output reg  validEntrada0,
                        output reg  validEntrada1,
                        output reg  validEntrada2,
                        output reg validEntrada3,
                        output reg  [7:0] Entrada0,
						output reg [7:0] Entrada1,
                        output reg [7:0] Entrada2,
						output reg [7:0] Entrada3,
						output reg clk_4f,
						output reg clk_2f,
						output reg clk_f,
						output reg reset,
                        output reg selector);
	initial begin
	$dumpfile("muxL2.vcd");
	$dumpvars;

	{validEntrada0,validEntrada1,validEntrada2,validEntrada3, reset} <= 0;
	{Entrada0} <= 8'h00;
    {Entrada1} <= 8'h00;
    {Entrada2} <= 8'h00;
    {Entrada3} <= 8'h00;
    selector<=1;
	
	@(posedge clk_2f);
    selector<=selector+1;
 
	//valid <= 1;
	//data_in <= 32'hEEFF9900;

	@(posedge clk_f);
	reset <= 1;
    validEntrada0 <= 1;
	validEntrada1 <= 1;
    validEntrada2 <= 0;
    validEntrada3 <= 1;


	/*Entrada <= 8'hEE;*/
    {Entrada0} <= 8'hEE;
    {Entrada1} <={Entrada1}+1;
    {Entrada2} <=8'hFF;
    {Entrada3} <=8'hFD;
    @(posedge clk_2f);
    selector<=selector+1;


	@(posedge clk_f);
	validEntrada0 <= 1;
    validEntrada1 <= 1;
    validEntrada2 <= 1;
    validEntrada3 <= 0;
    
	 
    
    {Entrada0} <={Entrada0}+1;
    {Entrada1} <={Entrada1}+1;
    {Entrada2} <={Entrada2}+1;
    {Entrada3} <={Entrada3}+1;
      
      @(posedge clk_2f);

    selector<=selector+1;

	@(posedge clk_f);
	validEntrada0 <= 0;
    validEntrada1 <= 1;
    validEntrada2 <= 1;
    validEntrada3 <= 1;


    {Entrada0} <={Entrada0}+1;
    {Entrada1} <={Entrada1}+1;
    {Entrada2} <={Entrada2}+1;
    {Entrada3} <={Entrada3}+1;

   @(posedge clk_2f);

    selector<=selector+1;
    
	@(posedge clk_f);
	validEntrada0 <= 1;
    validEntrada1 <= 1;
    validEntrada2 <= 1;
    validEntrada3 <= 1;


	{Entrada0} <={Entrada0}+1;
    {Entrada1} <={Entrada1}+1;
    {Entrada2} <={Entrada2}+1;
    {Entrada3} <={Entrada3}+1;

    @(posedge clk_2f)
    selector<=selector+1;
	@(posedge clk_f);
	validEntrada0 <= 1;
    validEntrada1 <= 0;
    validEntrada2 <= 1;
    validEntrada3 <= 1;


	{Entrada0} <={Entrada0}+1;
    {Entrada1} <={Entrada1}+1;
    {Entrada2} <={Entrada2}+1;
    {Entrada3} <={Entrada3}+1;
        selector<=selector+1;

	@(posedge clk_f);
	validEntrada0 <= 1;
    validEntrada1 <= 0;
    validEntrada2 <= 1;
    validEntrada3 <= 1;



	{Entrada0} <={Entrada0}+1;
    {Entrada1} <={Entrada1}+1;
    {Entrada2} <={Entrada2}+1;
    {Entrada3} <={Entrada3}+1;

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
