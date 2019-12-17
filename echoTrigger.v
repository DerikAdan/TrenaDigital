/*
M�dulo controlador de disparo do sensor de dist�ncia 

Frequencia de entrada: 1 MHz.
*/
module echoTrigger (
							input	clk,					// Sinal de clock de entrada de 1 MHz.
							input	clr,					// Sinal de reiniciliza��o.
							input	ena,					// Sinal de habilita��o do disparador.
							output	q						// Sinal de controle do sensor.
						);
					
reg [3:0] contador;											// Registrador para contagem da raz�o de convers�o.

parameter Estouro = 4'd10; 									// Inicializa com 27 (raz�o de convers�o de 27 MHz para 1 MHz).

always @(posedge clk or negedge clr or negedge ena)			// Reage � borda de subida do sinal de clock ou � borda de descida do sinal de reinicializa��o.
	if (!clr)	contador <= 4'd0; 							// Reinicializa o contador.
	else if (!ena) begin
		
	end
	
//	else if (!ena)
//		if(contador > Estouro - 4'd1) contador <= 4'd0; 	// Verifica o overflow do contador para reinicializa��o da contagem.
//		else contador <= contador + 4'd1;					// Incrementa o contador.
		
assign q = (contador > 4'd0)?1'b1:1'b0;						// Implementa o sinal de sa�da.
endmodule 