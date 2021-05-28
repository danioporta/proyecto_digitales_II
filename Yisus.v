/*module DeMux2x1 (
  input clk,
  input reset_L,
  output reg [7:0] Salida0,
  output reg [7:0] Salida1,
  output reg validaSalida0, 
output reg validSalida1,
 input validEntrada,

  input [7:0] Entrada);

  reg selector;

  always @ ( posedge clk ) begin

    if (reset_L==0) begin
      data_out0 <= 0;
      data_out1 <= 0;
      selector <= 0;
    end

    else begin
      selector <= ~selector;
      if (selector==0)
        data_out0 <= data_in;

      if (selector==1)
        data_out1 <= data_in;

    end
  end

endmodule // demux_conductual


*/






module DeMux2x1(
    output reg [7:0] Salida0, 
    output reg [7:0] Salida1, 
    input validSalida0, 
    input validSalida1,
    input [7:0]Entrada, 
    input validEntrada,
    input selector,
    input clk,
    input reset);

    wire [7:0] salida0;
    wire [7:0] salida1;
    reg validDeMuxO; 
    reg validDeMux1;

    always @(posedge clk) begin
        if(reset==1) 
            if(selector==0)
                if (validSalida1==1)
                Salida1<=Entrada;
            
                else         
                Salida1<=8'b00000000;
            else 
                if(validSalida0==1)
                Salida0<=Entrada;
            
            else
                Salida0<=8'b00000000;
            
          
        else 
            Salida0<=8'b00000000;
            Salida1<=8'b00000000;
        
        
    end 
endmodule
//Mux de entrada el que escoge entre dataln1 y datalnO a partir delselector 
/*always @(*)
    begin
        salida0 = 0;
        salida1 = 0;
        validDeMuxO = validSalida0;
        validDeMux1 = validSalida1;

        if(selector==0)  begin
            salida0 = Entrada;
            validDeMuxO = validEntrada;
        end
        else  begin
            salida1 = Entrada; 
            validDeMux1 = validEntrada;
        end
    end
// Flop que guarda lo que sea que este ee elcable out que oonecta elmux con el flop
always @(posedge clk) 
    begin
        if (reset == 0)begin
            Salida0 <= 8'b00000000;
            Salida1 <= 8'b00000000;
        end
        else begin
            if (validDeMuxO == 1)begin 
                Salida0 <= salida0;
                validSalida0 <= validDeMuxO;
            end 
            else begin
                Salida0 <= Salida0; 
                validSalida0 <= validSalida0;
            end
            if (validDeMux1== 1)begin 
                Salida1<= salida1;
                validSalida1<= validDeMux1; 
            end
            else begin
                Salida1 <= Salida1; 
                validSalida1 <= validSalida1;
            end 
        end
    end
endmodule*/