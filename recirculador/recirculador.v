//PRIMER AVANCE

module recirculador(
	//ETAPA FLOPS
	//SE TIENEN 8x4 bits de entrada (32 bits) y un bit para valid 4 entradas
	input [7:0] data_in0,
	input [7:0] data_in1,
	input [7:0] data_in2,
	input [7:0] data_in3,
	input valid0,
	input valid1,
	input valid2,
	input valid3,

	//clock
	input clk,
	//senal de activacion
	input reset,
	
	//entrada active viene del bloque serial a pararelo no se define aun su contenido
	input active,
	
	//SALIDAS 32 BITS
	output reg valid_out_recirculador0,
	output reg valid_out_recirculador1,
	output reg valid_out_recirculador2,
	output reg valid_out_recirculador3,
	
	//activo se dirige la logica al mux L1
	output reg [7:0] recirculador_activo0,
	output reg [7:0] recirculador_activo1,
	output reg [7:0] recirculador_activo2,
	output reg [7:0] recirculador_activo3,
	
	//inactivo se dirige la logica hacia el probador
	output reg [7:0] recirculador_desactivado0,
	output reg [7:0] recirculador_desactivado1,
	output reg [7:0] recirculador_desactivado2,
	output reg [7:0] recirculador_desactivado3
	
);

	always @(posedge clk) 
	
	begin
		
		if (reset==0)			//si reset es 0 se asigna un 0 en salida valid
			begin				//info de entrada se asigna a recirculador para salida inactivo
					
					valid_out_recirculador0 <= 0;
					valid_out_recirculador1 <= 0;
					valid_out_recirculador2 <= 0;
					valid_out_recirculador3 <= 0;
					
					recirculador_desactivado0 <= 0;
					recirculador_desactivado1 <= 0;
					recirculador_desactivado2 <= 0;
					recirculador_desactivado3 <= 0;
					
					recirculador_activo0 <= 0;
					recirculador_activo1 <= 0;
					recirculador_activo2 <= 0;
					recirculador_activo3 <= 0;
			
			end
		
		else if(reset ==1)		//si el reset es uno se analizan el flujo de datos *act
			begin
			
			if(valid0==1 && active==1)
			
				recirculador_activo0 <= data_in0;
				valid_out_recirculador0 <= 1;
			
			if(valid1==1 && active==1)
				
				recirculador_activo1 <= data_in1;
				valid_out_recirculador1 <= 1;
				
			if(valid2==1 && active==1)
			
				recirculador_activo2 <= data_in2;
				valid_out_recirculador2 <= 1;
				
			if(valid3==1 && active==1)
				
				recirculador_activo3 <= data_in3;
				//valid_out_recirculador3 <= 1;
				
			else if	(active==0)

					recirculador_desactivado0 <= 0;
					recirculador_desactivado1 <= 0;
					recirculador_desactivado2 <= 0;
					recirculador_desactivado3 <= 0;			
				
				
			end	 	
	
	end
	
endmodule
