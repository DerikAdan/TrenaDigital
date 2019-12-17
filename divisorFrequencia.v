/*
Módulo divisor de frequência 

Frequencia de entrada: 27 MHz.
Frequencia de saida: 1 MHz.
*/
module divisorFrequencia (
							input	clk,				// Sinal de clock de entrada de 27 MHz.
							input	clr,				// Sinal de reinicilização do divisor.
							output	q					// Sinal de clock de saída de 100 KHz.
						);
					
reg [4:0] contador;										// Registrador para contagem da razão de conversão.

parameter DIVISOR = 5'd27; 								// Inicializa com 27 (razão de conversão de 27 MHz para 1 MHz).

always @(posedge clk or negedge clr)							// Reage à borda de subida do sinal ClockIn_27MHz ou à borda de descida do sinal de reinicialização.
	if (!clr)	contador <= 5'd0; 								// Reinicializa o contador.
	else if(contador >= DIVISOR - 5'd1) contador <= 5'd0; 		// Verifica o overflow do contador para reinicialização da contagem.
	else contador <= contador + 5'd1;							// Incrementa o contador.

assign q = (contador < DIVISOR/2)?1'b0:1'b1;					// Implementa o sinal de saída.
endmodule 