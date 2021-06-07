
module serial_paraleloRX(
	//ENTRADAS
			
			input data_in,			//entrada de datos
			input reset,			//
			input clk_32f,			//clock frecuencia 32
			input clk_4f,			//clock frecuencia 4
	//SALIDAS
	
			output reg	[7:0] data_serial_paraleloRX, 		//salida RX
			output reg	active_serial_paraleloRX,		//active
			output reg  valid_serial_paraleloRX			//valid
						
);
			reg [7:0] buffer;					//guarda datos actuales (n)
			reg [7:0] buffer_pasado;			//guarda datos pasados (n-1)
			
			integer contador;					//
			integer contador_BC;				//contador de datos BC entrada*se buscan 4

	always @(posedge clk_32f)
	
	begin
			if( reset == 0) 
			
			begin
				
				data_serial_paraleloRX [6:0] <= 8'b00000000;
				active_serial_paraleloRX <= 0;
				valid_serial_paraleloRX	<= 0;
				buffer <= 0;
				contador <= 0;
				contador_BC <= 0;
			end
			
			else
			begin
				buffer <= {buffer[6:0], data_in};	//en buffer se concatena al ultimo bit de posicion el dato se va llenando de esta manera 
				
				if (contador_BC == 4 && contador == 1)
				begin
					
					active_serial_paraleloRX <= 1;
					
					if (buffer != 8'hBC)
					
					begin
						
						valid_serial_paraleloRX	<= 1;
						data_serial_paraleloRX <= buffer;
					end
					
					else if (buffer_pasado != 8'hBC && buffer == 8'hBC)
					
					begin
						
						valid_serial_paraleloRX	<= 0;
						contador_BC <= 0;
						
					end
			end
				
				if (contador_BC < 4 && buffer == 8'hBC)
				
				begin
					
						valid_serial_paraleloRX	<= 0;
						data_serial_paraleloRX <= 0;
						contador_BC <= contador_BC + 1;
				end
					
				if (contador == 1)
				begin
						buffer_pasado <=buffer;
				end
				
				if (contador == 7)
				begin
						contador <= 0;
				end
				
				else if (contador != 7)
				begin
						contador <= contador + 1;
				end
		end
	end
endmodule
			
			
						
					
					
				
				

