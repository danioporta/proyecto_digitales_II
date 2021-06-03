

module probadorSPtx (
			
			//salidas
			output reg IDLin,			//entrada de datos
			output reg reset,			//
			output reg clk_32f,			//clock frecuencia 32
			output reg clk_4f,			//clock frecuencia 4
			
			//entradas
			input	[7:0] data_serial_paraleloTX, 	//salida RX
			input	[7:0] data_serial_paraleloTX_sintetizado, 	//salida RX
			input	active_serial_paraleloTX,		//active
			input	active_serial_paraleloTX_sintetizado,		//active
			input   IDLEOut	,		//valid
			input   IDLEOut_sintetizado		//valid
);

	initial begin
	$dumpfile("serial_paraleloTX.vcd");
	$dumpvars;

	IDLin <= 0;
	reset <=0;
	
	@(posedge clk_4f);
	reset <= 0;
	IDLin<=1;
	@(posedge clk_32f)
	IDLin<=0;
	@(posedge clk_32f)
	IDLin<=1;
	@(posedge clk_32f)
	IDLin<=1;
	@(posedge clk_32f)
	IDLin<=1;
	@(posedge clk_32f)
	IDLin<=1;
	@(posedge clk_32f)
	IDLin<=0;
	@(posedge clk_32f)
	IDLin<=0;


	@(posedge clk_4f);
	IDLin<=1;
	@(posedge clk_32f)
	IDLin<=0;
	@(posedge clk_32f)
	IDLin<=1;
	@(posedge clk_32f)
	IDLin<=1;
	@(posedge clk_32f)
	IDLin<=1;
	@(posedge clk_32f)
	IDLin<=1;
	@(posedge clk_32f)
	IDLin<=0;
	@(posedge clk_32f)
	IDLin<=0;

	@(posedge clk_4f);
	reset <=1;
	IDLin<=1;
	@(posedge clk_32f)
	IDLin<=0;
	@(posedge clk_32f)
	IDLin<=1;
	@(posedge clk_32f)
	IDLin<=1;
	@(posedge clk_32f)
	IDLin<=1;
	@(posedge clk_32f)
	IDLin<=1;
	@(posedge clk_32f)
	IDLin<=0;
	@(posedge clk_32f)
	IDLin<=0;

	@(posedge clk_4f);
	IDLin<=1;
	reset <=1;
	@(posedge clk_32f)
	IDLin<=0;
	@(posedge clk_32f)
	IDLin<=1;
	@(posedge clk_32f)
	IDLin<=1;
	@(posedge clk_32f)
	IDLin<=1;
	@(posedge clk_32f)
	IDLin<=1;
	@(posedge clk_32f)
	IDLin<=0;
	@(posedge clk_32f)
	IDLin<=0;

	@(posedge clk_4f);
	IDLin<=1;
	@(posedge clk_32f)
	IDLin<=0;
	@(posedge clk_32f)
	IDLin<=1;
	@(posedge clk_32f)
	IDLin<=1;
	@(posedge clk_32f)
	IDLin<=1;
	@(posedge clk_32f)
	IDLin<=1;
	@(posedge clk_32f)
	IDLin<=0;
	@(posedge clk_32f)
	IDLin<=0;

	@(posedge clk_4f);
	IDLin<=1;
	@(posedge clk_32f)
	IDLin<=0;
	@(posedge clk_32f)
	IDLin<=1;
	@(posedge clk_32f)
	IDLin<=1;
	@(posedge clk_32f)
	IDLin<=1;
	@(posedge clk_32f)
	IDLin<=1;
	@(posedge clk_32f)
	IDLin<=0;
	@(posedge clk_32f)
	IDLin<=0;

	@(posedge clk_4f);
	IDLin<=1;
	@(posedge clk_32f)
	IDLin<=0;
	@(posedge clk_32f)
	IDLin<=1;
	@(posedge clk_32f)
	IDLin<=0;
	@(posedge clk_32f)
	IDLin<=1;
	@(posedge clk_32f)
	IDLin<=1;
	@(posedge clk_32f)
	IDLin<=0;
	@(posedge clk_32f)
	IDLin<=0;

	@(posedge clk_4f);
	IDLin<=1;
	@(posedge clk_32f)
	IDLin<=1;
	@(posedge clk_32f)
	IDLin<=1;
	@(posedge clk_32f)
	IDLin<=1;
	@(posedge clk_32f)
	IDLin<=0;
	@(posedge clk_32f)
	IDLin<=1;
	@(posedge clk_32f)
	IDLin<=0;
	@(posedge clk_32f)
	IDLin<=0;

	@(posedge clk_4f);
	IDLin<=1;
	@(posedge clk_32f)
	IDLin<=1;
	@(posedge clk_32f)
	IDLin<=1;
	@(posedge clk_32f)
	IDLin<=1;
	@(posedge clk_32f)
	IDLin<=1;
	@(posedge clk_32f)
	IDLin<=0;
	@(posedge clk_32f)
	IDLin<=0;
	@(posedge clk_32f)
	IDLin<=1;

	@(posedge clk_4f);
	IDLin<=1;
	@(posedge clk_32f)
	IDLin<=1;
	@(posedge clk_32f)
	IDLin<=1;
	@(posedge clk_32f)
	IDLin<=1;
	@(posedge clk_32f)
	IDLin<=1;
	@(posedge clk_32f)
	IDLin<=0;
	@(posedge clk_32f)
	IDLin<=0;
	@(posedge clk_32f)
	IDLin<=0;
	
	@(posedge clk_4f);
	IDLin<=1;
	@(posedge clk_32f)
	IDLin<=0;
	@(posedge clk_32f)
	IDLin<=1;
	@(posedge clk_32f)
	IDLin<=1;
	@(posedge clk_32f)
	IDLin<=1;
	@(posedge clk_32f)
	IDLin<=1;
	@(posedge clk_32f)
	IDLin<=0;
	@(posedge clk_32f)
	IDLin<=0;

	@(posedge clk_4f);
	IDLin<=0;
	@(posedge clk_32f)
	IDLin<=0;
	@(posedge clk_32f)
	IDLin<=0;
	@(posedge clk_32f)
	IDLin<=0;
	@(posedge clk_32f)
	IDLin<=1;
	@(posedge clk_32f)
	IDLin<=1;
	@(posedge clk_32f)
	IDLin<=1;
	@(posedge clk_32f)
	IDLin<=1;

	@(posedge clk_4f);
	IDLin<=1;

			
	$finish;
	end
	
	initial clk_4f <= 1;
	always #8 clk_4f <= ~clk_4f;

	initial clk_32f <= 1;
	always #1 clk_32f <= ~clk_32f;

endmodule
