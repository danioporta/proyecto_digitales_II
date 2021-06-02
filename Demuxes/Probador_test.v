module probador(
    input [7:0]Salida0,
    input [7:0]Salida1,
    input [7:0]Salida2,
    input [7:0]Salida3,
    input [7:0]Salida4,
    input [7:0]Salida5,
    input [7:0]Salida6,
    input [7:0]Salida7,
    input [7:0]Salida8,
    input validSalida0,
    input validSalida1,
    input validSalida2,
    input validSalida3,
    input validSalida4,
    input validSalida5,
    input validSalida6,
    input validSalida7,
    input validSalida8,
    input Active,
    output reg [7:0]Entrada0,
    output reg [7:0]Entrada1,
    output reg [7:0]Entrada2,
    output reg [7:0]Entrada3,
    output reg validEntrada0,
    output reg validEntrada1,
    output reg validEntrada2,
    output reg validEntrada3,
    output reg selector0,
    output reg selector1,
    output reg clk_4f,
    output reg clk_2f,
    output reg clk_f,
    output reg clk_32f,
    output reg reset);

    initial begin
        $dumpfile ("Probador_test.vcd");
        $dumpvars;


        {reset, selector0,selector1} = 1'b0;
        {validEntrada0, validEntrada1, validEntrada2, validEntrada3} = 1'b0;
        {Entrada0, Entrada1, Entrada2, Entrada3} = 8'b00000000;

        repeat (1) begin
            @(posedge clk_f);
                reset <= 0;
        end
        @(posedge clk_32f);
            selector1<=1;
        @(posedge clk_2f);
            reset <= 1;
            selector1<=0;
        @(posedge clk_32f);
            selector1<=1;

        @(posedge clk_f);
            Entrada0 <= 8'b11111111;
            Entrada1 <= 8'b11101110;
            Entrada2 <= 8'b11011101;
            Entrada3 <= 8'b11001100;
            validEntrada0 <= 1'b1;
            validEntrada1 <= 1'b1;
            validEntrada2 <= 1'b1;
            validEntrada3 <= 1'b1;
            selector1<=0;

        @(posedge clk_32f);
            selector1<=1;
        @(posedge clk_2f);
            selector0<=1;
            selector1<=0;
        @(posedge clk_32f);
            selector1<=1;
		
        @(posedge clk_f);
            Entrada0 <= 8'b10111011; 
            Entrada1 <= 8'b10101010; 
            Entrada2 <= 8'b10011001; 
            Entrada3 <= 8'b10001000; 
            selector0<=0;
            selector1<=0;
        
        @(posedge clk_32f);
            selector1<=1;
        @(posedge clk_2f);
            selector0<=1;
            selector1<=0;
        @(posedge clk_32f);
            selector1<=1;
            
        @(posedge clk_f);
            Entrada0 <= 8'b00000000;
            Entrada1 <= 8'b00000000;
            Entrada2 <= 8'b1110111; //77
            Entrada3 <= 8'b00000000;
            validEntrada0 <= 1'b0;
            validEntrada1 <= 1'b0;
            validEntrada2 <= 1'b1;
            validEntrada3 <= 1'b0;
            selector0<=0;
            selector1<=0;
        @(posedge clk_f);
            Entrada0 <= 8'b00000000;
            Entrada1 <= 8'b00000000;
            Entrada2 <= 8'b1110111; //77
            Entrada3 <= 8'b00000000;
            validEntrada0 <= 1'b0;
            validEntrada1 <= 1'b0;
            validEntrada2 <= 1'b1;
            validEntrada3 <= 1'b0;
            selector0<=0;
            selector1<=0;
        @(posedge clk_f);
            Entrada0 <= 8'b01100100;
            Entrada1 <= 8'b11000000;
            Entrada2 <= 8'b1110111; 
            Entrada3 <= 8'b00111001;
            validEntrada0 <= 1'b0;
            validEntrada1 <= 1'b1;
            validEntrada2 <= 1'b1;
            validEntrada3 <= 1'b0;
            selector0<=0;
            selector1<=0;

        @(posedge clk_32f);
            selector1<=1;
        @(posedge clk_2f);
            selector0<=1;
            selector1<=0;
        @(posedge clk_32f);
            selector1<=1;

        @(posedge clk_f);
            Entrada2 <= 8'b00000000;
            validEntrada2 <= 0;
            selector0<=0;
            selector1<=0;
        
        @(posedge clk_32f);
            selector1<=1;
        @(posedge clk_2f);
            selector0<=1;
            selector1<=0;
        @(posedge clk_32f);
            selector1<=1;

        @(posedge clk_f);
            selector0<=0;
            selector1<=0;

        @(posedge clk_32f);
            selector1<=1;
        @(posedge clk_2f);
            selector0<=1;
            selector1<=0;
        @(posedge clk_32f);
            selector1<=1;
            
        @(posedge clk_f);
            selector0<=0;
            selector1<=0;

        @(posedge clk_32f);
            selector1<=1;
        @(posedge clk_2f);
            selector0<=1;
            selector1<=0;
        @(posedge clk_32f);
            selector1<=1;
        @(posedge clk_f);
            Entrada0 <= 'hBC;
            Entrada1 <= 'hBC;
            Entrada2 <= 'hBC;
            Entrada3 <= 'hBC;
            validEntrada0 <= 1'b0;
            validEntrada1 <= 1'b0;
            validEntrada2 <= 1'b0;
            validEntrada3 <= 1'b0;
            selector1<=0;

        @(posedge clk_f);
            //se reciben los 4 hex BC para comprobar el sap
            Entrada0 <= 'hBC;
            Entrada1 <= 'hBC;
            Entrada2 <= 'hBC;
            Entrada3 <= 'hBC;
            validEntrada0 <= 1'b0;
            validEntrada1 <= 1'b0;
            validEntrada2 <= 1'b0;
            validEntrada3 <= 1'b0;
            selector1<=0;

        @(posedge clk_32f);
            selector1<=1;
        @(posedge clk_2f);
            reset <= 1;
            selector1<=0;
        @(posedge clk_32f);
            selector1<=1;

        @(posedge clk_f);
            Entrada0 <= 8'b11111111;
            Entrada1 <= 8'b11101110;
            Entrada2 <= 8'b11011101;
            Entrada3 <= 8'b11001100;
            validEntrada0 <= 1'b0;
            validEntrada1 <= 1'b0;
            validEntrada2 <= 1'b0;
            validEntrada3 <= 1'b0;
            selector1<=0;

        @(posedge clk_32f);
            selector1<=1;
        @(posedge clk_2f);
            selector0<=1;
            selector1<=0;
        @(posedge clk_32f);
            selector1<=1;
		
        @(posedge clk_f);
            Entrada0 <= 8'b10111011; //BB
            Entrada1 <= 8'b10101010; //AA
            Entrada2 <= 8'b10011001; //99
            Entrada3 <= 8'b10001000; //88
            selector0<=0;
            selector1<=0;
        
        @(posedge clk_32f);
            selector1<=1;
        @(posedge clk_2f);
            selector0<=1;
            selector1<=0;
        @(posedge clk_32f);
            selector1<=1;
            
        @(posedge clk_f);
            Entrada0 <= 8'b00000000;
            Entrada1 <= 8'b00000000;
            Entrada2 <= 8'b1110111; //77
            Entrada3 <= 8'b00000000;
            validEntrada0 <= 1'b0;
            validEntrada1 <= 1'b0;
            validEntrada2 <= 1'b1;
            validEntrada3 <= 1'b0;
            selector0<=0;
            selector1<=0;

        @(posedge clk_32f);
            selector1<=1;
        @(posedge clk_2f);
            selector0<=1;
            selector1<=0;
        @(posedge clk_32f);
            selector1<=1;

        @(posedge clk_f);
            Entrada2 <= 8'b00000000;
            validEntrada2 <= 0;
            selector0<=0;
            selector1<=0;
        
        @(posedge clk_32f);
            selector1<=1;
        @(posedge clk_2f);
            selector0<=1;
            selector1<=0;
        @(posedge clk_32f);
            selector1<=1;

        @(posedge clk_f);
            selector0<=0;
            selector1<=0;

        @(posedge clk_32f);
            selector1<=1;
        @(posedge clk_2f);
            selector0<=1;
            selector1<=0;
        @(posedge clk_32f);
            selector1<=1;
            
        @(posedge clk_f);
            selector0<=0;
            selector1<=0;

        @(posedge clk_32f);
            selector1<=1;
        @(posedge clk_2f);
            selector0<=1;
            selector1<=0;
        @(posedge clk_32f);
            selector1<=1;
        
        $finish;
    end

  
    initial	clk_2f 	  <= 1; // clk_2ff
    initial	clk_f 	  <= 1; // Clk_f
    initial	clk_32f   <= 1;
    initial clk_4f <= 1;

	always	#1 clk_32f 	<= ~clk_32f;
	always #2 clk_2f <= ~clk_2f;
	always #4 clk_f <= ~clk_f;

endmodule