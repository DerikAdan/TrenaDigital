/*
M�dulo divisor de frequ�ncia 

Frequencia de entrada: 27 MHz.
Frequencia de saida: 1 MHz.
*/
module divisorFrequencia (
							input	clk,				// Sinal de clock de entrada de 27 MHz.
							input	clr,				// Sinal de reiniciliza��o do divisor.
							output	q					// Sinal de clock de sa�da de 100 KHz.
						);
					
reg [4:0] contador;										// Registrador para contagem da raz�o de convers�o.

parameter DIVISOR = 5'd27; 								// Inicializa com 27 (raz�o de convers�o de 27 MHz para 1 MHz).

always @(posedge clk or negedge clr)							// Reage � borda de subida do sinal ClockIn_27MHz ou � borda de descida do sinal de reinicializa��o.
	if (!clr)	contador <= 5'd0; 								// Reinicializa o contador.
	else if(contador >= DIVISOR - 5'd1) contador <= 5'd0; 		// Verifica o overflow do contador para reinicializa��o da contagem.
	else contador <= contador + 5'd1;							// Incrementa o contador.

assign q = (contador < DIVISOR/2)?1'b0:1'b1;					// Implementa o sinal de sa�da.
endmodule 