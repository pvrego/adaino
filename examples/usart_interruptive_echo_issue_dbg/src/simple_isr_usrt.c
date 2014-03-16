#include <avr/io.h>
#include <avr/interrupt.h>

#define F_CPU 16000000
#define USART_BAUDRATE 9600
#define BAUD_PRESCALE (((F_CPU / (USART_BAUDRATE * 16UL))) - 1)

int main (void){
	UCSR1B = (1 << RXEN1) | (1 << TXEN1) | (1 << RXCIE1);
	UCSR1C = (1 << UCSZ10) | (1 << UCSZ11);
	UBRR1H = (BAUD_PRESCALE >> 8);
	UBRR1L = BAUD_PRESCALE;
	sei();
	while (1) {}
}

ISR(USART1_RX_vect){
	char ReceivedByte;
	ReceivedByte = UDR1;
	UDR1 = ReceivedByte;
}