
module probador_recirculador (
		
	//ETAPA FLOPS
	//SE TIENEN 8x4 bits de entrada (32 bits) y un bit para valid 4 entradas
	output reg [7:0] data_in0,
	output reg [7:0] data_in1,
	output reg [7:0] data_in2,
	output reg [7:0] data_in3,
	output reg valid0,
	output reg valid1,
	output reg valid2,
	output reg valid3,

	//clock
	output reg clk,
	//senal de activacion
	output reg reset,
	
	//entrada active viene del bloque serial a pararelo no se define aun su contenido
	output reg active,
	
	//SALIDAS 32 BITS
	input valid_out_recirculador0,
	input valid_out_recirculador1,
	input valid_out_recirculador2,
	input valid_out_recirculador3,
	
	//activo se dirige la logica al mux L1
	input [7:0] recirculador_activo0,
	input [7:0] recirculador_activo1,
	input [7:0] recirculador_activo2,
	input [7:0] recirculador_activo3,
	
	//inactivo se dirige la logica hacia el probador
	input [7:0] recirculador_desactivado0,
	input [7:0] recirculador_desactivado1,
	input [7:0] recirculador_desactivado2,
	input [7:0] recirculador_desactivado3
);

	initial begin
	$dumpfile("recirculador.vcd");
	$dumpvars;
	
	{valid0, valid1, valid2, valid3, active, reset} <= 0;
	{data_in0, data_in1, data_in2, data_in3} = 8'b00000000;
	
		repeat (1) begin
		
		@(posedge clk);
		reset<=1;
		end
		
	@(posedge clk)
		active <= 1;
		data_in0 <= 8'b00000000;
		data_in1 <= 8'b00001110;
		data_in2 <= 8'b00001110;
		data_in3 <= 8'b01001110;
		
		valid0 <= 1;
		valid1 <= 1;
		valid2 <= 1;
		valid3 <= 1;
		
		@(posedge clk)
		active <= 1;

		data_in0 <= 8'b11000000;
		data_in1 <= 8'b10001110;
		data_in2 <= 8'b10001110;
		data_in3 <= 8'b00001010;
		
		valid0 <= 1;
		valid1 <= 1;
		valid2 <= 1;
		valid3 <= 1;
		
		@(posedge clk)
		active <= 0;

		data_in0 <= 8'b11000000;
		data_in1 <= 8'b10001110;
		data_in2 <= 8'b10001110;
		data_in3 <= 8'b00001010;
		
		valid0 <= 1;
		valid1 <= 1;
		valid2 <= 1;
		valid3 <= 1;
		
		@(posedge clk)
		active <= 0;

		data_in0 <= 8'b11000000;
		data_in1 <= 8'b10001110;
		data_in2 <= 8'b10001110;
		data_in3 <= 8'b00001010;
		
		valid0 <= 1;
		valid1 <= 1;
		valid2 <= 1;
		valid3 <= 1;
		
		
		@(posedge clk)
		active <= 0;

		data_in0 <= 8'b11000100;
		data_in1 <= 8'b10011110;
		data_in2 <= 8'b10001110;
		data_in3 <= 8'b00001010;
		
		valid0 <= 1;
		valid1 <= 1;
		valid2 <= 1;
		valid3 <= 1;
		
		$finish;
		end
		
		initial clk <= 0;
		always #2 clk <= ~clk;

endmodule
