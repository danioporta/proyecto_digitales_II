`timescale 1ms/100ps

`include "serialparalelotx.v"
`include "sintetizatx.v"
`include "probadorSPtx.v"
`include "cmos_cells.v"

module banco_serial_paralelo;
		
		wire reset;
		wire IDLin;
		wire clk_4f;
		wire clk_32f;
        wire [7:0] data_serial_paraleloTX;
        wire [7:0] data_serial_paraleloTX_sintetizado;
		wire IDLEOut;
		
		wire active_serial_paraleloTX;
		wire active_serial_paraleloTXs;
		
		wire IDLEOut_sintetizado;

		serialparalelotx serialparalelo(/*AUTOINST*/
						// Outputs
						.data_serial_paraleloTX(data_serial_paraleloTX[7:0]),
						.active_serial_paraleloTX(active_serial_paraleloTX),
						.IDLEOut	(IDLEOut),
						// Inputs
						.IDLin		(IDLin),
						.reset		(reset),
						.clk_32f	(clk_32f),
						.clk_4f		(clk_4f));
				   
		
		sintetizatx s_s_p(/*AUTOINST*/
				  // Outputs
				  .IDLEOut		(IDLEOut),
				  .active_serial_paraleloTX_sintetizado(active_serial_paraleloTX_sintetizado),
				  .data_serial_paraleloTX_sintetizado(data_serial_paraleloTX_sintetizado[7:0]),
				  // Inputs
				  .IDLin		(IDLin),
				  .clk_32f		(clk_32f),
				  .clk_4f		(clk_4f),
				  .reset		(reset));



		probadorSPtx probadorserialparalelo(/*AUTOINST*/
						    // Outputs
						    .IDLin		(IDLin),
						    .reset		(reset),
						    .clk_32f		(clk_32f),
						    .clk_4f		(clk_4f),
						    // Inputs
						    .data_serial_paraleloTX(data_serial_paraleloTX[7:0]),
						    .data_serial_paraleloTX_sintetizado(data_serial_paraleloTX_sintetizado[7:0]),
						    .active_serial_paraleloTX(active_serial_paraleloTX),
						    .active_serial_paraleloTX_sintetizado(active_serial_paraleloTX_sintetizado),
						    .IDLEOut		(IDLEOut),
						    .IDLEOut_sintetizado		(IDLEOut_sintetizado));

endmodule 
