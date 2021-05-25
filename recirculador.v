//PRIMER AVANCE

module recirculador(
	//ETAPA FLOPS
	//SE TIENEN 8x4 bits de entrada (32 bits) y un bit para valid
	input [31:0] data_in;
	input valid;
	
	//senal de activacion
	input reset;
	
	//entrada active viene del bloque serial a pararelo no se define aun su contenido
	input active;
	
	//SALIDAS 32 BITS
	output reg valida_out_recirculador;
	
	//activo se dirige la logica al mux L1
	output reg [31:0] recirculador_activo;
	
	//inactivo se dirige la logica hacia el probador
	output reg [31:0] recirculador_desactivado;
	
);

	always @(posedge clk) 
	begin
		
		if (reset==0)			//si reset es 0 se asigna un 0 en salida valid
			begin				//info de entrada se asigna a recirculador para salida inactivo
			valid_out_recirculador <= 0;
			recirculador_desactivado <= data_in;
			end
		
		else if(reset ==1)		//si el reset es uno se analizan el flujo de datos *act
			begin
				
			if(valid ==1)		//si valid es 1 y si actie es 1 se asigna info a recirculador activo
			begin				//el valor de salida de valid es 1
				if(active ==1) begin
				recirculador_activo <= data_in;
				valid_out_recirculador <= 1; end
								
								//si active es 0 se asigna indo a active_desactivado y la salida de valid es 0
			else if(active ==0) begin 	
				recirculador_desactivado <= data_in;
				valid_out_recirculador <= 0; end
			end	
								//aunqeu reset sea 1 para un valid 0 se adigna un valida salida de 0 y la info en valid_desactivado
			else if(valid==0) begin 
				recirculador_desactivado <= data_in;
				valid_out_recirculador <= 0; end
				
	 end			
	
	endmodule
				
			
					
			
