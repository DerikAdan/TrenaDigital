/*
Módulo controlador de disparo do sensor de distância 

Frequencia de entrada: 1 MHz.
*/
module echoTrigger (
							input	clk,					// Sinal de clock de entrada de 1 MHz.
							input	clr,					// Sinal de reinicilização.
							input	ena,					// Sinal de habilitação do disparador.
							output	q						// Sinal de controle do sensor.
						);
					
reg [3:0] contador;											// Registrador para contagem da razão de conversão.

parameter Estouro = 4'd10; 									// Inicializa com 27 (razão de conversão de 27 MHz para 1 MHz).

always @(posedge clk or negedge clr or negedge ena)			// Reage à borda de subida do sinal de clock ou à borda de descida do sinal de reinicialização.
	if (!clr)	contador <= 4'd0; 							// Reinicializa o contador.
	else if (!ena) begin
		
	end
	
//	else if (!ena)
//		if(contador > Estouro - 4'd1) contador <= 4'd0; 	// Verifica o overflow do contador para reinicialização da contagem.
//		else contador <= contador + 4'd1;					// Incrementa o contador.
		
assign q = (contador > 4'd0)?1'b1:1'b0;						// Implementa o sinal de saída.
endmodule 