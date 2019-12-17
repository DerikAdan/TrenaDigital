module medidorDistancia (
	input clk,			// Clock de 27 MHz
	input ena,			// Botão de habilitação de medida
	input rst,			// Botão de reset
	
//output clk1Mhz
	output echo
	
//	output [6:0]Disp1;
//	output [6:0]Disp2;
//	output [6:0]Disp3;
//	output [6:0]Disp4;
);

wire clk1Mhz;
				 
parameter ST0 = 0;
parameter ST1 = 1;
parameter ST2 = 2;
parameter ST3 = 3;
parameter ST4 = 4;
parameter ST5 = 5;
parameter ST6 = 6;
parameter ST7 = 7;

reg [2:0] estadoCorrente;
reg [2:0] proximoEstado;

divisorFrequencia u1(
	.clk(clk),
	.clr(rst),
	.q(clk1MHz)
);

echoTrigger u2(
	.clk(clk1Mhz),
	.clr(rst),
	.ena(ena),
	.q(echo)
);


//----------------- Estado Atual --------------

always @(posedge clk or negedge rst)

	if(!rst)
	
		estadoCorrente <= ST0;
		
	else
	
		estadoCorrente <= proximoEstado;
		
//--------------------------------------------
//---- Próximo Estado ------------------------

//always @(currentstate)
//begin
//
//	case (currentstate)
//
//	ST0: begin
//
//		q = 3'd0;
//		nextstate = ST1;
//		
//	end
//	
//		
//	ST1: begin
//
//		q = 3'd3;
//		nextstate = ST2;
//		
//	end
//	
//	ST2: begin
//
//		q = 3'd4;
//		nextstate = ST3;
//		
//	end
//	
//	ST3: begin
//
//		q = 3'd2;
//		nextstate = ST4;
//		
//	end
//	
//	ST4: begin
//
//		q = 3'd5;
//		nextstate = ST5;
//		
//	end
//	ST5: begin
//
//		q = 3'd7;
//		nextstate = ST6;
//		
//	end
//	
//	ST6: begin
//
//		q = 3'd6;
//		nextstate = ST7;
//		
//	end
//	
//	ST7: begin
//
//		q = 3'd1;
//		nextstate = ST0;
//		
//	end
//	
//	default: begin
//
//		q = 3'd0;
//		nextstate = ST0;
//		
//	end
//	
//	endcase
//	
//end
//
//endmodule


//wire [6:0]Crono_C;
//wire [5:0]Crono_S;
//wire [5:0]Crono_M;
//wire [6:0]C;
//wire [5:0]S;
//wire [5:0]M;
//wire [6:0]Reg_C;
//wire [5:0]Reg_S;
//wire [5:0]Reg_M;
//wire [6:0]C_S;
//wire [5:0]S_M;
//wire [3:0]UnidDisplay1;
//wire [3:0]UnidDisplay2;
//wire [3:0]DezDisplay1;
//wire [3:0]DezDisplay2;
//
//Divisor_de_Clock div_freq(Clock_27MHz, Key0, Start_Stop, Clock_100Hz);
//Contador_00_99 contadorCentSeg (Clock_100Hz, Key0, Start_Stop, Crono_C, EnableSeg);
//Contador_00_59 contadorSeg (EnableSeg, Key0, Start_Stop, Crono_S, EnableMin);
//Contador_00_59 contadorMin (EnableMin, Key0, Start_Stop, Crono_M);
//
//Registrador7bit registradorCent(Key0, Load, Crono_C, Reg_C);
//Registrador6bit registradorSeg(Key0, Load, Crono_S, Reg_S);
//Registrador6bit registradorMin(Key0, Load, Crono_M, Reg_M);
//
//Mux7bit muxCent (Crono_C, Reg_C, Crono_Mem, C);
//Mux6bit muxSeg (Crono_S, Reg_S, Crono_Mem, S);
//Mux6bit muxMin (Crono_M, Reg_M, Crono_Mem, M);
//
//Mux7bit muxCentSeg (C, S, Crono_Select, C_S); 
//Mux6bit muxSegMin (S, M, Crono_Select, S_M);
//
//Separador_Unidade_Dezena separador1 (C_S, UnidDisplay1, DezDisplay1);
//Separador_Unidade_Dezena separador2 (S_M, UnidDisplay2, DezDisplay2);
//
//Decodificador_Dec_Hexa dec1 (UnidDisplay1, Display1);
//Decodificador_Dec_Hexa dec2 (DezDisplay1, Display2);
//Decodificador_Dec_Hexa dec3 (UnidDisplay2, Display3);
//Decodificador_Dec_Hexa dec4 (DezDisplay2, Display4);
//				
endmodule 