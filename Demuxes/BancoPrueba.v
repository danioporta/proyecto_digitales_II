/* ***********************************************************
                    Universidad de Costa Rica
                 Escuela de Ingenieria Electrica
                            IE-0523
                      Circuitos Digitales 2

                           BancoPrueba.v

Autores: Daniela Oporta Abarca B55160 
         Marlon Jesus Jiménez Acosta B73881
         Roger Castro Rivas B61725
         German Ureña Araya B77809 

Fecha: 01 de junio del 2021

Descripcion:
  

*********************************************************** */


`timescale 	1ns	/ 1ns

`include "demuxL1.v"
`include "demuxL2.v"
`include "SaP.v"
`include "Probador.v"


module BancoPrueba;

	wire validEntrada0, validEntrada1, validEntrada2, validEntrada3;
	wire validSalida0, validSalida1, validSalida2, validSalida3,validSalida4, validSalida5, validSalida6, validSalida7, validSalida8;
	wire [7:0] Entrada0, Entrada1, Entrada2, Entrada3;
	wire [7:0] Salida0, Salida1, Salida2, Salida3, Salida4, Salida5, Salida6, Salida7, Salida8;
	wire clk_4f, clk_2f, clk_f,clk_32f,reset;
	wire selector0, selector1;


	MuxL1	L1( /*AUTOINST*/
				   // Outputs
				   .Salida0				(Salida0[7:0]),
				   .Salida1				(Salida1[7:0]),
				   .validSalida0		(validSalida0),
				   .validSalida1		(validSalida1),
				   // Inputs
				   .Entrada0			(Entrada0[7:0]),
				   .Entrada1			(Entrada1[7:0]),
				   .Entrada2			(Entrada2[7:0]),
				   .Entrada3			(Entrada3[7:0]),
				   .validEntrada0		(validEntrada0),
				   .validEntrada1		(validEntrada1),
				   .validEntrada2		(validEntrada2),
				   .validEntrada3		(validEntrada3),
				   .selector			(selector0),
				   .clk					(clk_2f),
				   .reset				(reset));

	MuxL2 	L2( /*AUTOINST*/
				   // Outputs
				   .Salida				(Salida2[7:0]),
				   .validSalida			(validSalida2),
				   // Inputs
				   .Entrada0			(Salida0[7:0]),
				   .Entrada1			(Salida1[7:0]),
				   .validEntrada0		(validSalida0),
				   .validEntrada1		(validSalida1),
				   .selector			(selector1),
				   .clk					(clk_4f),
				   .reset				(reset));



	demuxL1	DeL1( /*AUTOINST*/
				   // Outputs
				   .Salida0				(Salida5[7:0]),
				   .Salida1				(Salida6[7:0]),
				   .Salida2				(Salida7[7:0]),
				   .Salida3				(Salida8[7:0]),
				   .validSalida0		(validSalida5),
				   .validSalida1		(validSalida6),
				   .validSalida2		(validSalida7),
				   .validSalida3		(validSalida8),
				   // Inputs
				   .Entrada0			(Salida3[7:0]),
				   .Entrada1			(Salida4[7:0]),
				   .validEntrada0		(validSalida3),
				   .validEntrada1		(validSalida4),
				   .selector			(selector0),
				   .clk					(clk_2f),
				   .reset				(reset));

	demuxL2 DeL2( /*AUTOINST*/
				   // Outputs
				   .Salida0				(Salida3[7:0]),
				   .Salida1				(Salida4[7:0]),
				   .validSalida0		(validSalida3),
				   .validSalida1		(validSalida4),
				   // Inputs
				   .Entrada			    (Salida2[7:0]),
				   .validEntrada	    (validSalida2),
				   .selector			(selector1),
				   .clk			    	(clk_4f),
				   .reset		    	(reset));

	SaP serialaparalelo( /*AUTOINST*/
					//Outputs


	 )



	probador 			probador1( /*AUTOINST*/
						 // Outputs
						 .Entrada0			(Entrada0[7:0]),
						 .Entrada1			(Entrada1[7:0]),
						 .Entrada2			(Entrada2[7:0]),
						 .Entrada3			(Entrada3[7:0]),
						 .validEntrada0		(validEntrada0),
						 .validEntrada1		(validEntrada1),
						 .validEntrada2		(validEntrada2),
						 .validEntrada3		(validEntrada3),
						 .selector0			(selector0),
						 .selector1			(selector1),
						 .clk_4f			(clk_4f),
						 .clk_2f			(clk_2f),
						 .clk_f 			(clk_f),
						 .clk_32f       	(clk_32f),
						 .reset				(reset),
						 // Inputs
						 .Salida0			(Salida0[7:0]),
						 .Salida1			(Salida1[7:0]),
						 .Salida2			(Salida2[7:0]),
						 .Salida3			(Salida3[7:0]),
						 .Salida4			(Salida4[7:0]),
						 .Salida5			(Salida5[7:0]),
						 .Salida6			(Salida6[7:0]),
						 .Salida7			(Salida7[7:0]),
						 .Salida8			(Salida8[7:0]),
						 .validSalida0		(validSalida0),
						 .validSalida1		(validSalida1),
						 .validSalida2		(validSalida2),
						 .validSalida3		(validSalida3),
						 .validSalida4		(validSalida4),
						 .validSalida5		(validSalida5),
						 .validSalida6		(validSalida6),
						 .validSalida7		(validSalida7),
						 .validSalida8		(validSalida8),
						 .Active 			(Active)
						 );




endmodule
