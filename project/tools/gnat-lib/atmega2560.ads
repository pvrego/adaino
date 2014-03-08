with Interfaces; use Interfaces;
with System;

package ATmega2560 is

   -- ADC Control and Status Register B
   ADCSRB : Unsigned_8;
   for ADCSRB'Address use System'To_Address (16#7B#);
   ADCSRB_ACME: constant := 64; -- Analog Comparator Multiplexer Enable

   -- Analog Comparator Control And Status Register
   ACSR : Unsigned_8;
   for ACSR'Address use System'To_Address (16#50#);
   ACSR_ACIS0: constant := 1; -- Analog Comparator Interrupt Mode Select bit 0
   ACSR_ACIS1: constant := 2; -- Analog Comparator Interrupt Mode Select bit 1
   ACSR_ACIC: constant := 4; -- Analog Comparator Input Capture Enable
   ACSR_ACIE: constant := 8; -- Analog Comparator Interrupt Enable
   ACSR_ACI: constant := 16; -- Analog Comparator Interrupt Flag
   ACSR_ACO: constant := 32; -- Analog Compare Output
   ACSR_ACBG: constant := 64; -- Analog Comparator Bandgap Select
   ACSR_ACD: constant := 128; -- Analog Comparator Disable

   -- Digital Input Disable Register 1
   DIDR1 : Unsigned_8;
   for DIDR1'Address use System'To_Address (16#7F#);
   DIDR1_AIN0D: constant := 1; -- AIN0 Digital Input Disable
   DIDR1_AIN1D: constant := 2; -- AIN1 Digital Input Disable

   -- USART I/O Data Register
   UDR0 : Unsigned_8;
   for UDR0'Address use System'To_Address (16#C6#);

   -- USART Control and Status Register A
   UCSR0A : Unsigned_8;
   for UCSR0A'Address use System'To_Address (16#C0#);
   UCSR0A_MPCM0: constant := 1; -- Multi-processor Communication Mode
   UCSR0A_U2X0: constant := 2; -- Double the USART transmission speed
   UCSR0A_UPE0: constant := 4; -- Parity Error
   UCSR0A_DOR0: constant := 8; -- Data overRun
   UCSR0A_FE0: constant := 16; -- Framing Error
   UCSR0A_UDRE0: constant := 32; -- USART Data Register Empty
   UCSR0A_TXC0: constant := 64; -- USART Transmitt Complete
   UCSR0A_RXC0: constant := 128; -- USART Receive Complete

   -- USART Control and Status Register B
   UCSR0B : Unsigned_8;
   for UCSR0B'Address use System'To_Address (16#C1#);
   UCSR0B_TXB80: constant := 1; -- Transmit Data Bit 8
   UCSR0B_RXB80: constant := 2; -- Receive Data Bit 8
   UCSR0B_UCSZ02: constant := 4; -- Character Size
   UCSR0B_TXEN0: constant := 8; -- Transmitter Enable
   UCSR0B_RXEN0: constant := 16; -- Receiver Enable
   UCSR0B_UDRIE0: constant := 32; -- USART Data register Empty Interrupt Enable
   UCSR0B_TXCIE0: constant := 64; -- TX Complete Interrupt Enable
   UCSR0B_RXCIE0: constant := 128; -- RX Complete Interrupt Enable

   -- USART Control and Status Register C
   UCSR0C : Unsigned_8;
   for UCSR0C'Address use System'To_Address (16#C2#);
   UCSR0C_UCPOL0: constant := 1; -- Clock Polarity
   UCSR0C_UCSZ00: constant := 2; -- Character Size
   UCSR0C_UCSZ01: constant := 4; -- Character Size
   UCSR0C_USBS0: constant := 8; -- Stop Bit Select
   UCSR0C_UPM00: constant := 16; -- Parity Mode Bit 0
   UCSR0C_UPM01: constant := 32; -- Parity Mode Bit 1
   UCSR0C_UMSEL00: constant := 64; -- USART Mode Select
   UCSR0C_UMSEL01: constant := 128; -- USART Mode Select

   -- USART Baud Rate Register High Byte
   UBRR0H : Unsigned_8;
   for UBRR0H'Address use System'To_Address (16#C5#);
   UBRR0H_UBRR8: constant := 1; -- USART Baud Rate Register bit 8
   UBRR0H_UBRR9: constant := 2; -- USART Baud Rate Register bit 9
   UBRR0H_UBRR10: constant := 4; -- USART Baud Rate Register bit 10
   UBRR0H_UBRR11: constant := 8; -- USART Baud Rate Register bit 11

   -- USART Baud Rate Register Low Byte
   UBRR0L : Unsigned_8;
   for UBRR0L'Address use System'To_Address (16#C4#);
   UBRR0L_UBRR0: constant := 1; -- USART Baud Rate Register bit 0
   UBRR0L_UBRR1: constant := 2; -- USART Baud Rate Register bit 1
   UBRR0L_UBRR2: constant := 4; -- USART Baud Rate Register bit 2
   UBRR0L_UBRR3: constant := 8; -- USART Baud Rate Register bit 3
   UBRR0L_UBRR4: constant := 16; -- USART Baud Rate Register bit 4
   UBRR0L_UBRR5: constant := 32; -- USART Baud Rate Register bit 5
   UBRR0L_UBRR6: constant := 64; -- USART Baud Rate Register bit 6
   UBRR0L_UBRR7: constant := 128; -- USART Baud Rate Register bit 7

   -- TWI (Slave) Address Mask Register
   TWAMR : Unsigned_8;
   for TWAMR'Address use System'To_Address (16#BD#);
   TWAMR_TWAM0: constant := 2;
   TWAMR_TWAM1: constant := 4;
   TWAMR_TWAM2: constant := 8;
   TWAMR_TWAM3: constant := 16;
   TWAMR_TWAM4: constant := 32;
   TWAMR_TWAM5: constant := 64;
   TWAMR_TWAM6: constant := 128;

   -- TWI Bit Rate register
   TWBR : Unsigned_8;
   for TWBR'Address use System'To_Address (16#B8#);
   TWBR_TWBR0: constant := 1;
   TWBR_TWBR1: constant := 2;
   TWBR_TWBR2: constant := 4;
   TWBR_TWBR3: constant := 8;
   TWBR_TWBR4: constant := 16;
   TWBR_TWBR5: constant := 32;
   TWBR_TWBR6: constant := 64;
   TWBR_TWBR7: constant := 128;

   -- TWI Control Register
   TWCR : Unsigned_8;
   for TWCR'Address use System'To_Address (16#BC#);
   TWCR_TWIE: constant := 1; -- TWI Interrupt Enable
   TWCR_TWEN: constant := 4; -- TWI Enable Bit
   TWCR_TWWC: constant := 8; -- TWI Write Collition Flag
   TWCR_TWSTO: constant := 16; -- TWI Stop Condition Bit
   TWCR_TWSTA: constant := 32; -- TWI Start Condition Bit
   TWCR_TWEA: constant := 64; -- TWI Enable Acknowledge Bit
   TWCR_TWINT: constant := 128; -- TWI Interrupt Flag

   -- TWI Status Register
   TWSR : Unsigned_8;
   for TWSR'Address use System'To_Address (16#B9#);
   TWSR_TWPS0: constant := 1; -- TWI Prescaler
   TWSR_TWPS1: constant := 2; -- TWI Prescaler
   TWSR_TWS3: constant := 8; -- TWI Status
   TWSR_TWS4: constant := 16; -- TWI Status
   TWSR_TWS5: constant := 32; -- TWI Status
   TWSR_TWS6: constant := 64; -- TWI Status
   TWSR_TWS7: constant := 128; -- TWI Status

   -- TWI Data register
   TWDR : Unsigned_8;
   for TWDR'Address use System'To_Address (16#BB#);
   TWDR_TWD0: constant := 1; -- TWI Data Register Bit 0
   TWDR_TWD1: constant := 2; -- TWI Data Register Bit 1
   TWDR_TWD2: constant := 4; -- TWI Data Register Bit 2
   TWDR_TWD3: constant := 8; -- TWI Data Register Bit 3
   TWDR_TWD4: constant := 16; -- TWI Data Register Bit 4
   TWDR_TWD5: constant := 32; -- TWI Data Register Bit 5
   TWDR_TWD6: constant := 64; -- TWI Data Register Bit 6
   TWDR_TWD7: constant := 128; -- TWI Data Register Bit 7

   -- TWI (Slave) Address register
   TWAR : Unsigned_8;
   for TWAR'Address use System'To_Address (16#BA#);
   TWAR_TWGCE: constant := 1; -- TWI General Call Recognition Enable Bit
   TWAR_TWA0: constant := 2; -- TWI (Slave) Address register Bit 0
   TWAR_TWA1: constant := 4; -- TWI (Slave) Address register Bit 1
   TWAR_TWA2: constant := 8; -- TWI (Slave) Address register Bit 2
   TWAR_TWA3: constant := 16; -- TWI (Slave) Address register Bit 3
   TWAR_TWA4: constant := 32; -- TWI (Slave) Address register Bit 4
   TWAR_TWA5: constant := 64; -- TWI (Slave) Address register Bit 5
   TWAR_TWA6: constant := 128; -- TWI (Slave) Address register Bit 6

   -- SPI Control Register
   SPCR : Unsigned_8;
   for SPCR'Address use System'To_Address (16#4C#);
   SPCR_SPR0: constant := 1; -- SPI Clock Rate Select 0
   SPCR_SPR1: constant := 2; -- SPI Clock Rate Select 1
   SPCR_CPHA: constant := 4; -- Clock Phase
   SPCR_CPOL: constant := 8; -- Clock polarity
   SPCR_MSTR: constant := 16; -- Master/Slave Select
   SPCR_DORD: constant := 32; -- Data Order
   SPCR_SPE: constant := 64; -- SPI Enable
   SPCR_SPIE: constant := 128; -- SPI Interrupt Enable

   -- SPI Status Register
   SPSR : Unsigned_8;
   for SPSR'Address use System'To_Address (16#4D#);
   SPSR_SPI2X: constant := 1; -- Double SPI Speed Bit
   SPSR_WCOL: constant := 64; -- Write Collision Flag
   SPSR_SPIF: constant := 128; -- SPI Interrupt Flag

   -- SPI Data Register
   SPDR : Unsigned_8;
   for SPDR'Address use System'To_Address (16#4E#);
   SPDR_SPDR0: constant := 1; -- SPI Data Register bit 0
   SPDR_SPDR1: constant := 2; -- SPI Data Register bit 1
   SPDR_SPDR2: constant := 4; -- SPI Data Register bit 2
   SPDR_SPDR3: constant := 8; -- SPI Data Register bit 3
   SPDR_SPDR4: constant := 16; -- SPI Data Register bit 4
   SPDR_SPDR5: constant := 32; -- SPI Data Register bit 5
   SPDR_SPDR6: constant := 64; -- SPI Data Register bit 6
   SPDR_SPDR7: constant := 128; -- SPI Data Register bit 7

   -- Port A Data Register
   PORTA : Unsigned_8;
   for PORTA'Address use System'To_Address (16#22#);
   PORTA_PORTA0: constant := 1; -- Port A Data Register bit 0
   PORTA_PORTA1: constant := 2; -- Port A Data Register bit 1
   PORTA_PORTA2: constant := 4; -- Port A Data Register bit 2
   PORTA_PORTA3: constant := 8; -- Port A Data Register bit 3
   PORTA_PORTA4: constant := 16; -- Port A Data Register bit 4
   PORTA_PORTA5: constant := 32; -- Port A Data Register bit 5
   PORTA_PORTA6: constant := 64; -- Port A Data Register bit 6
   PORTA_PORTA7: constant := 128; -- Port A Data Register bit 7

   -- Port A Data Direction Register
   DDRA : Unsigned_8;
   for DDRA'Address use System'To_Address (16#21#);
   DDRA_DDA0: constant := 1; -- Data Direction Register, Port A, bit 0
   DDRA_DDA1: constant := 2; -- Data Direction Register, Port A, bit 1
   DDRA_DDA2: constant := 4; -- Data Direction Register, Port A, bit 2
   DDRA_DDA3: constant := 8; -- Data Direction Register, Port A, bit 3
   DDRA_DDA4: constant := 16; -- Data Direction Register, Port A, bit 4
   DDRA_DDA5: constant := 32; -- Data Direction Register, Port A, bit 5
   DDRA_DDA6: constant := 64; -- Data Direction Register, Port A, bit 6
   DDRA_DDA7: constant := 128; -- Data Direction Register, Port A, bit 7

   -- Port A Input Pins
   PINA : Unsigned_8;
   for PINA'Address use System'To_Address (16#20#);
   PINA_PINA0: constant := 1; -- Input Pins, Port A bit 0
   PINA_PINA1: constant := 2; -- Input Pins, Port A bit 1
   PINA_PINA2: constant := 4; -- Input Pins, Port A bit 2
   PINA_PINA3: constant := 8; -- Input Pins, Port A bit 3
   PINA_PINA4: constant := 16; -- Input Pins, Port A bit 4
   PINA_PINA5: constant := 32; -- Input Pins, Port A bit 5
   PINA_PINA6: constant := 64; -- Input Pins, Port A bit 6
   PINA_PINA7: constant := 128; -- Input Pins, Port A bit 7

   -- Port B Data Register
   PORTB : Unsigned_8;
   for PORTB'Address use System'To_Address (16#25#);
   PORTB_PORTB0: constant := 1; -- Port B Data Register bit 0
   PORTB_PORTB1: constant := 2; -- Port B Data Register bit 1
   PORTB_PORTB2: constant := 4; -- Port B Data Register bit 2
   PORTB_PORTB3: constant := 8; -- Port B Data Register bit 3
   PORTB_PORTB4: constant := 16; -- Port B Data Register bit 4
   PORTB_PORTB5: constant := 32; -- Port B Data Register bit 5
   PORTB_PORTB6: constant := 64; -- Port B Data Register bit 6
   PORTB_PORTB7: constant := 128; -- Port B Data Register bit 7

   -- Port B Data Direction Register
   DDRB : Unsigned_8;
   for DDRB'Address use System'To_Address (16#24#);
   DDRB_DDB0: constant := 1; -- Port B Data Direction Register bit 0
   DDRB_DDB1: constant := 2; -- Port B Data Direction Register bit 1
   DDRB_DDB2: constant := 4; -- Port B Data Direction Register bit 2
   DDRB_DDB3: constant := 8; -- Port B Data Direction Register bit 3
   DDRB_DDB4: constant := 16; -- Port B Data Direction Register bit 4
   DDRB_DDB5: constant := 32; -- Port B Data Direction Register bit 5
   DDRB_DDB6: constant := 64; -- Port B Data Direction Register bit 6
   DDRB_DDB7: constant := 128; -- Port B Data Direction Register bit 7

   -- Port B Input Pins
   PINB : Unsigned_8;
   for PINB'Address use System'To_Address (16#23#);
   PINB_PINB0: constant := 1; -- Port B Input Pins bit 0
   PINB_PINB1: constant := 2; -- Port B Input Pins bit 1
   PINB_PINB2: constant := 4; -- Port B Input Pins bit 2
   PINB_PINB3: constant := 8; -- Port B Input Pins bit 3
   PINB_PINB4: constant := 16; -- Port B Input Pins bit 4
   PINB_PINB5: constant := 32; -- Port B Input Pins bit 5
   PINB_PINB6: constant := 64; -- Port B Input Pins bit 6
   PINB_PINB7: constant := 128; -- Port B Input Pins bit 7

   -- Port C Data Register
   PORTC : Unsigned_8;
   for PORTC'Address use System'To_Address (16#28#);
   PORTC_PORTC0: constant := 1; -- Port C Data Register bit 0
   PORTC_PORTC1: constant := 2; -- Port C Data Register bit 1
   PORTC_PORTC2: constant := 4; -- Port C Data Register bit 2
   PORTC_PORTC3: constant := 8; -- Port C Data Register bit 3
   PORTC_PORTC4: constant := 16; -- Port C Data Register bit 4
   PORTC_PORTC5: constant := 32; -- Port C Data Register bit 5
   PORTC_PORTC6: constant := 64; -- Port C Data Register bit 6
   PORTC_PORTC7: constant := 128; -- Port C Data Register bit 7

   -- Port C Data Direction Register
   DDRC : Unsigned_8;
   for DDRC'Address use System'To_Address (16#27#);
   DDRC_DDC0: constant := 1; -- Port C Data Direction Register bit 0
   DDRC_DDC1: constant := 2; -- Port C Data Direction Register bit 1
   DDRC_DDC2: constant := 4; -- Port C Data Direction Register bit 2
   DDRC_DDC3: constant := 8; -- Port C Data Direction Register bit 3
   DDRC_DDC4: constant := 16; -- Port C Data Direction Register bit 4
   DDRC_DDC5: constant := 32; -- Port C Data Direction Register bit 5
   DDRC_DDC6: constant := 64; -- Port C Data Direction Register bit 6
   DDRC_DDC7: constant := 128; -- Port C Data Direction Register bit 7

   -- Port C Input Pins
   PINC : Unsigned_8;
   for PINC'Address use System'To_Address (16#26#);
   PINC_PINC0: constant := 1; -- Port C Input Pins bit 0
   PINC_PINC1: constant := 2; -- Port C Input Pins bit 1
   PINC_PINC2: constant := 4; -- Port C Input Pins bit 2
   PINC_PINC3: constant := 8; -- Port C Input Pins bit 3
   PINC_PINC4: constant := 16; -- Port C Input Pins bit 4
   PINC_PINC5: constant := 32; -- Port C Input Pins bit 5
   PINC_PINC6: constant := 64; -- Port C Input Pins bit 6
   PINC_PINC7: constant := 128; -- Port C Input Pins bit 7

   -- Port D Data Register
   PORTD : Unsigned_8;
   for PORTD'Address use System'To_Address (16#2B#);
   PORTD_PORTD0: constant := 1; -- Port D Data Register bit 0
   PORTD_PORTD1: constant := 2; -- Port D Data Register bit 1
   PORTD_PORTD2: constant := 4; -- Port D Data Register bit 2
   PORTD_PORTD3: constant := 8; -- Port D Data Register bit 3
   PORTD_PORTD4: constant := 16; -- Port D Data Register bit 4
   PORTD_PORTD5: constant := 32; -- Port D Data Register bit 5
   PORTD_PORTD6: constant := 64; -- Port D Data Register bit 6
   PORTD_PORTD7: constant := 128; -- Port D Data Register bit 7

   -- Port D Data Direction Register
   DDRD : Unsigned_8;
   for DDRD'Address use System'To_Address (16#2A#);
   DDRD_DDD0: constant := 1; -- Port D Data Direction Register bit 0
   DDRD_DDD1: constant := 2; -- Port D Data Direction Register bit 1
   DDRD_DDD2: constant := 4; -- Port D Data Direction Register bit 2
   DDRD_DDD3: constant := 8; -- Port D Data Direction Register bit 3
   DDRD_DDD4: constant := 16; -- Port D Data Direction Register bit 4
   DDRD_DDD5: constant := 32; -- Port D Data Direction Register bit 5
   DDRD_DDD6: constant := 64; -- Port D Data Direction Register bit 6
   DDRD_DDD7: constant := 128; -- Port D Data Direction Register bit 7

   -- Port D Input Pins
   PIND : Unsigned_8;
   for PIND'Address use System'To_Address (16#29#);
   PIND_PIND0: constant := 1; -- Port D Input Pins bit 0
   PIND_PIND1: constant := 2; -- Port D Input Pins bit 1
   PIND_PIND2: constant := 4; -- Port D Input Pins bit 2
   PIND_PIND3: constant := 8; -- Port D Input Pins bit 3
   PIND_PIND4: constant := 16; -- Port D Input Pins bit 4
   PIND_PIND5: constant := 32; -- Port D Input Pins bit 5
   PIND_PIND6: constant := 64; -- Port D Input Pins bit 6
   PIND_PIND7: constant := 128; -- Port D Input Pins bit 7

   -- Data Register, Port E
   PORTE : Unsigned_8;
   for PORTE'Address use System'To_Address (16#2E#);
   PORTE_PORTE0: constant := 1;
   PORTE_PORTE1: constant := 2;
   PORTE_PORTE2: constant := 4;
   PORTE_PORTE3: constant := 8;
   PORTE_PORTE4: constant := 16;
   PORTE_PORTE5: constant := 32;
   PORTE_PORTE6: constant := 64;
   PORTE_PORTE7: constant := 128;

   -- Data Direction Register, Port E
   DDRE : Unsigned_8;
   for DDRE'Address use System'To_Address (16#2D#);
   DDRE_DDE0: constant := 1;
   DDRE_DDE1: constant := 2;
   DDRE_DDE2: constant := 4;
   DDRE_DDE3: constant := 8;
   DDRE_DDE4: constant := 16;
   DDRE_DDE5: constant := 32;
   DDRE_DDE6: constant := 64;
   DDRE_DDE7: constant := 128;

   -- Input Pins, Port E
   PINE : Unsigned_8;
   for PINE'Address use System'To_Address (16#2C#);
   PINE_PINE0: constant := 1;
   PINE_PINE1: constant := 2;
   PINE_PINE2: constant := 4;
   PINE_PINE3: constant := 8;
   PINE_PINE4: constant := 16;
   PINE_PINE5: constant := 32;
   PINE_PINE6: constant := 64;
   PINE_PINE7: constant := 128;

   -- Data Register, Port F
   PORTF : Unsigned_8;
   for PORTF'Address use System'To_Address (16#31#);
   PORTF_PORTF0: constant := 1;
   PORTF_PORTF1: constant := 2;
   PORTF_PORTF2: constant := 4;
   PORTF_PORTF3: constant := 8;
   PORTF_PORTF4: constant := 16;
   PORTF_PORTF5: constant := 32;
   PORTF_PORTF6: constant := 64;
   PORTF_PORTF7: constant := 128;

   -- Data Direction Register, Port F
   DDRF : Unsigned_8;
   for DDRF'Address use System'To_Address (16#30#);
   DDRF_DDF0: constant := 1;
   DDRF_DDF1: constant := 2;
   DDRF_DDF2: constant := 4;
   DDRF_DDF3: constant := 8;
   DDRF_DDF4: constant := 16;
   DDRF_DDF5: constant := 32;
   DDRF_DDF6: constant := 64;
   DDRF_DDF7: constant := 128;

   -- Input Pins, Port F
   PINF : Unsigned_8;
   for PINF'Address use System'To_Address (16#2F#);
   PINF_PINF0: constant := 1;
   PINF_PINF1: constant := 2;
   PINF_PINF2: constant := 4;
   PINF_PINF3: constant := 8;
   PINF_PINF4: constant := 16;
   PINF_PINF5: constant := 32;
   PINF_PINF6: constant := 64;
   PINF_PINF7: constant := 128;

   -- Data Register, Port G
   PORTG : Unsigned_8;
   for PORTG'Address use System'To_Address (16#34#);
   PORTG_PORTG0: constant := 1;
   PORTG_PORTG1: constant := 2;
   PORTG_PORTG2: constant := 4;
   PORTG_PORTG3: constant := 8;
   PORTG_PORTG4: constant := 16;
   PORTG_PORTG5: constant := 32;

   -- Data Direction Register, Port G
   DDRG : Unsigned_8;
   for DDRG'Address use System'To_Address (16#33#);
   DDRG_DDG0: constant := 1;
   DDRG_DDG1: constant := 2;
   DDRG_DDG2: constant := 4;
   DDRG_DDG3: constant := 8;
   DDRG_DDG4: constant := 16;
   DDRG_DDG5: constant := 32;

   -- Input Pins, Port G
   PING : Unsigned_8;
   for PING'Address use System'To_Address (16#32#);
   PING_PING0: constant := 1;
   PING_PING1: constant := 2;
   PING_PING2: constant := 4;
   PING_PING3: constant := 8;
   PING_PING4: constant := 16;
   PING_PING5: constant := 32;

   -- PORT H Data Register
   PORTH : Unsigned_8;
   for PORTH'Address use System'To_Address (16#102#);
   PORTH_PORTH0: constant := 1; -- PORT H Data Register bit 0
   PORTH_PORTH1: constant := 2; -- PORT H Data Register bit 1
   PORTH_PORTH2: constant := 4; -- PORT H Data Register bit 2
   PORTH_PORTH3: constant := 8; -- PORT H Data Register bit 3
   PORTH_PORTH4: constant := 16; -- PORT H Data Register bit 4
   PORTH_PORTH5: constant := 32; -- PORT H Data Register bit 5
   PORTH_PORTH6: constant := 64; -- PORT H Data Register bit 6
   PORTH_PORTH7: constant := 128; -- PORT H Data Register bit 7

   -- PORT H Data Direction Register
   DDRH : Unsigned_8;
   for DDRH'Address use System'To_Address (16#101#);
   DDRH_DDH0: constant := 1; -- PORT H Data Direction Register bit 0
   DDRH_DDH1: constant := 2; -- PORT H Data Direction Register bit 1
   DDRH_DDH2: constant := 4; -- PORT H Data Direction Register bit 2
   DDRH_DDH3: constant := 8; -- PORT H Data Direction Register bit 3
   DDRH_DDH4: constant := 16; -- PORT H Data Direction Register bit 4
   DDRH_DDH5: constant := 32; -- PORT H Data Direction Register bit 5
   DDRH_DDH6: constant := 64; -- PORT H Data Direction Register bit 6
   DDRH_DDH7: constant := 128; -- PORT H Data Direction Register bit 7

   -- PORT H Input Pins
   PINH : Unsigned_8;
   for PINH'Address use System'To_Address (16#100#);
   PINH_PINH0: constant := 1; -- PORT H Input Pins bit 0
   PINH_PINH1: constant := 2; -- PORT H Input Pins bit 1
   PINH_PINH2: constant := 4; -- PORT H Input Pins bit 2
   PINH_PINH3: constant := 8; -- PORT H Input Pins bit 3
   PINH_PINH4: constant := 16; -- PORT H Input Pins bit 4
   PINH_PINH5: constant := 32; -- PORT H Input Pins bit 5
   PINH_PINH6: constant := 64; -- PORT H Input Pins bit 6
   PINH_PINH7: constant := 128; -- PORT H Input Pins bit 7

   -- PORT J Data Register
   PORTJ : Unsigned_8;
   for PORTJ'Address use System'To_Address (16#105#);
   PORTJ_PORTJ0: constant := 1; -- PORT J Data Register bit 0
   PORTJ_PORTJ1: constant := 2; -- PORT J Data Register bit 1
   PORTJ_PORTJ2: constant := 4; -- PORT J Data Register bit 2
   PORTJ_PORTJ3: constant := 8; -- PORT J Data Register bit 3
   PORTJ_PORTJ4: constant := 16; -- PORT J Data Register bit 4
   PORTJ_PORTJ5: constant := 32; -- PORT J Data Register bit 5
   PORTJ_PORTJ6: constant := 64; -- PORT J Data Register bit 6
   PORTJ_PORTJ7: constant := 128; -- PORT J Data Register bit 7

   -- PORT J Data Direction Register
   DDRJ : Unsigned_8;
   for DDRJ'Address use System'To_Address (16#104#);
   DDRJ_DDJ0: constant := 1; -- PORT J Data Direction Register bit 0
   DDRJ_DDJ1: constant := 2; -- PORT J Data Direction Register bit 1
   DDRJ_DDJ2: constant := 4; -- PORT J Data Direction Register bit 2
   DDRJ_DDJ3: constant := 8; -- PORT J Data Direction Register bit 3
   DDRJ_DDJ4: constant := 16; -- PORT J Data Direction Register bit 4
   DDRJ_DDJ5: constant := 32; -- PORT J Data Direction Register bit 5
   DDRJ_DDJ6: constant := 64; -- PORT J Data Direction Register bit 6
   DDRJ_DDJ7: constant := 128; -- PORT J Data Direction Register bit 7

   -- PORT J Input Pins
   PINJ : Unsigned_8;
   for PINJ'Address use System'To_Address (16#103#);
   PINJ_PINJ0: constant := 1; -- PORT J Input Pins bit 0
   PINJ_PINJ1: constant := 2; -- PORT J Input Pins bit 1
   PINJ_PINJ2: constant := 4; -- PORT J Input Pins bit 2
   PINJ_PINJ3: constant := 8; -- PORT J Input Pins bit 3
   PINJ_PINJ4: constant := 16; -- PORT J Input Pins bit 4
   PINJ_PINJ5: constant := 32; -- PORT J Input Pins bit 5
   PINJ_PINJ6: constant := 64; -- PORT J Input Pins bit 6
   PINJ_PINJ7: constant := 128; -- PORT J Input Pins bit 7

   -- PORT K Data Register
   PORTK : Unsigned_8;
   for PORTK'Address use System'To_Address (16#108#);
   PORTK_PORTK0: constant := 1; -- PORT K Data Register bit 0
   PORTK_PORTK1: constant := 2; -- PORT K Data Register bit 1
   PORTK_PORTK2: constant := 4; -- PORT K Data Register bit 2
   PORTK_PORTK3: constant := 8; -- PORT K Data Register bit 3
   PORTK_PORTK4: constant := 16; -- PORT K Data Register bit 4
   PORTK_PORTK5: constant := 32; -- PORT K Data Register bit 5
   PORTK_PORTK6: constant := 64; -- PORT K Data Register bit 6
   PORTK_PORTK7: constant := 128; -- PORT K Data Register bit 7

   -- PORT K Data Direction Register
   DDRK : Unsigned_8;
   for DDRK'Address use System'To_Address (16#107#);
   DDRK_DDK0: constant := 1; -- PORT K Data Direction Register bit 0
   DDRK_DDK1: constant := 2; -- PORT K Data Direction Register bit 1
   DDRK_DDK2: constant := 4; -- PORT K Data Direction Register bit 2
   DDRK_DDK3: constant := 8; -- PORT K Data Direction Register bit 3
   DDRK_DDK4: constant := 16; -- PORT K Data Direction Register bit 4
   DDRK_DDK5: constant := 32; -- PORT K Data Direction Register bit 5
   DDRK_DDK6: constant := 64; -- PORT K Data Direction Register bit 6
   DDRK_DDK7: constant := 128; -- PORT K Data Direction Register bit 7

   -- PORT K Input Pins
   PINK : Unsigned_8;
   for PINK'Address use System'To_Address (16#106#);
   PINK_PINK0: constant := 1; -- PORT K Input Pins bit 0
   PINK_PINK1: constant := 2; -- PORT K Input Pins bit 1
   PINK_PINK2: constant := 4; -- PORT K Input Pins bit 2
   PINK_PINK3: constant := 8; -- PORT K Input Pins bit 3
   PINK_PINK4: constant := 16; -- PORT K Input Pins bit 4
   PINK_PINK5: constant := 32; -- PORT K Input Pins bit 5
   PINK_PINK6: constant := 64; -- PORT K Input Pins bit 6
   PINK_PINK7: constant := 128; -- PORT K Input Pins bit 7

   -- PORT L Data Register
   PORTL : Unsigned_8;
   for PORTL'Address use System'To_Address (16#10B#);
   PORTL_PORTL0: constant := 1; -- PORT L Data Register bit 0
   PORTL_PORTL1: constant := 2; -- PORT L Data Register bit 1
   PORTL_PORTL2: constant := 4; -- PORT L Data Register bit 2
   PORTL_PORTL3: constant := 8; -- PORT L Data Register bit 3
   PORTL_PORTL4: constant := 16; -- PORT L Data Register bit 4
   PORTL_PORTL5: constant := 32; -- PORT L Data Register bit 5
   PORTL_PORTL6: constant := 64; -- PORT L Data Register bit 6
   PORTL_PORTL7: constant := 128; -- PORT L Data Register bit 7

   -- PORT L Data Direction Register
   DDRL : Unsigned_8;
   for DDRL'Address use System'To_Address (16#10A#);
   DDRL_DDL0: constant := 1; -- PORT L Data Direction Register bit 0
   DDRL_DDL1: constant := 2; -- PORT L Data Direction Register bit 1
   DDRL_DDL2: constant := 4; -- PORT L Data Direction Register bit 2
   DDRL_DDL3: constant := 8; -- PORT L Data Direction Register bit 3
   DDRL_DDL4: constant := 16; -- PORT L Data Direction Register bit 4
   DDRL_DDL5: constant := 32; -- PORT L Data Direction Register bit 5
   DDRL_DDL6: constant := 64; -- PORT L Data Direction Register bit 6
   DDRL_DDL7: constant := 128; -- PORT L Data Direction Register bit 7

   -- PORT L Input Pins
   PINL : Unsigned_8;
   for PINL'Address use System'To_Address (16#109#);
   PINL_PINL0: constant := 1; -- PORT L Input Pins bit 0
   PINL_PINL1: constant := 2; -- PORT L Input Pins bit 1
   PINL_PINL2: constant := 4; -- PORT L Input Pins bit 2
   PINL_PINL3: constant := 8; -- PORT L Input Pins bit 3
   PINL_PINL4: constant := 16; -- PORT L Input Pins bit 4
   PINL_PINL5: constant := 32; -- PORT L Input Pins bit 5
   PINL_PINL6: constant := 64; -- PORT L Input Pins bit 6
   PINL_PINL7: constant := 128; -- PORT L Input Pins bit 7

   -- Timer/Counter0 Output Compare Register
   OCR0B : Unsigned_8;
   for OCR0B'Address use System'To_Address (16#48#);
   OCR0B_OCR0B_0: constant := 1;
   OCR0B_OCR0B_1: constant := 2;
   OCR0B_OCR0B_2: constant := 4;
   OCR0B_OCR0B_3: constant := 8;
   OCR0B_OCR0B_4: constant := 16;
   OCR0B_OCR0B_5: constant := 32;
   OCR0B_OCR0B_6: constant := 64;
   OCR0B_OCR0B_7: constant := 128;

   -- Timer/Counter0 Output Compare Register
   OCR0A : Unsigned_8;
   for OCR0A'Address use System'To_Address (16#47#);
   OCR0A_OCROA_0: constant := 1;
   OCR0A_OCROA_1: constant := 2;
   OCR0A_OCROA_2: constant := 4;
   OCR0A_OCROA_3: constant := 8;
   OCR0A_OCROA_4: constant := 16;
   OCR0A_OCROA_5: constant := 32;
   OCR0A_OCROA_6: constant := 64;
   OCR0A_OCROA_7: constant := 128;

   -- Timer/Counter0
   TCNT0 : Unsigned_8;
   for TCNT0'Address use System'To_Address (16#46#);
   TCNT0_TCNT0_0: constant := 1;
   TCNT0_TCNT0_1: constant := 2;
   TCNT0_TCNT0_2: constant := 4;
   TCNT0_TCNT0_3: constant := 8;
   TCNT0_TCNT0_4: constant := 16;
   TCNT0_TCNT0_5: constant := 32;
   TCNT0_TCNT0_6: constant := 64;
   TCNT0_TCNT0_7: constant := 128;

   -- Timer/Counter Control Register B
   TCCR0B : Unsigned_8;
   for TCCR0B'Address use System'To_Address (16#45#);
   TCCR0B_CS00: constant := 1; -- Clock Select
   TCCR0B_CS01: constant := 2; -- Clock Select
   TCCR0B_CS02: constant := 4; -- Clock Select
   TCCR0B_WGM02: constant := 8;
   TCCR0B_FOC0B: constant := 64; -- Force Output Compare B
   TCCR0B_FOC0A: constant := 128; -- Force Output Compare A

   -- Timer/Counter  Control Register A
   TCCR0A : Unsigned_8;
   for TCCR0A'Address use System'To_Address (16#44#);
   TCCR0A_WGM00: constant := 1; -- Waveform Generation Mode
   TCCR0A_WGM01: constant := 2; -- Waveform Generation Mode
   TCCR0A_COM0B0: constant := 16; -- Compare Output Mode, Fast PWm
   TCCR0A_COM0B1: constant := 32; -- Compare Output Mode, Fast PWm
   TCCR0A_COM0A0: constant := 64; -- Compare Output Mode, Phase Correct PWM Mode
   TCCR0A_COM0A1: constant := 128; -- Compare Output Mode, Phase Correct PWM Mode

   -- Timer/Counter0 Interrupt Mask Register
   TIMSK0 : Unsigned_8;
   for TIMSK0'Address use System'To_Address (16#6E#);
   TIMSK0_TOIE0: constant := 1; -- Timer/Counter0 Overflow Interrupt Enable
   TIMSK0_OCIE0A: constant := 2; -- Timer/Counter0 Output Compare Match A Interrupt Enable
   TIMSK0_OCIE0B: constant := 4; -- Timer/Counter0 Output Compare Match B Interrupt Enable

   -- Timer/Counter0 Interrupt Flag register
   TIFR0 : Unsigned_8;
   for TIFR0'Address use System'To_Address (16#35#);
   TIFR0_TOV0: constant := 1; -- Timer/Counter0 Overflow Flag
   TIFR0_OCF0A: constant := 2; -- Timer/Counter0 Output Compare Flag 0A
   TIFR0_OCF0B: constant := 4; -- Timer/Counter0 Output Compare Flag 0B

   -- General Timer/Counter Control Register
   GTCCR : Unsigned_8;
   for GTCCR'Address use System'To_Address (16#43#);
   GTCCR_PSRSYNC: constant := 1; -- Prescaler Reset Timer/Counter1 and Timer/Counter0
   GTCCR_TSM: constant := 128; -- Timer/Counter Synchronization Mode

   -- Timer/Counter Interrupt Mask register
   TIMSK2 : Unsigned_8;
   for TIMSK2'Address use System'To_Address (16#70#);
   TIMSK2_TOIE2: constant := 1; -- Timer/Counter2 Overflow Interrupt Enable
   TIMSK2_OCIE2A: constant := 2; -- Timer/Counter2 Output Compare Match A Interrupt Enable
   TIMSK2_OCIE2B: constant := 4; -- Timer/Counter2 Output Compare Match B Interrupt Enable

   -- Timer/Counter Interrupt Flag Register
   TIFR2 : Unsigned_8;
   for TIFR2'Address use System'To_Address (16#37#);
   TIFR2_TOV2: constant := 1; -- Timer/Counter2 Overflow Flag
   TIFR2_OCF2A: constant := 2; -- Output Compare Flag 2A
   TIFR2_OCF2B: constant := 4; -- Output Compare Flag 2B

   -- Timer/Counter2 Control Register A
   TCCR2A : Unsigned_8;
   for TCCR2A'Address use System'To_Address (16#B0#);
   TCCR2A_WGM20: constant := 1; -- Waveform Genration Mode
   TCCR2A_WGM21: constant := 2; -- Waveform Genration Mode
   TCCR2A_COM2B0: constant := 16; -- Compare Output Mode bit 0
   TCCR2A_COM2B1: constant := 32; -- Compare Output Mode bit 1
   TCCR2A_COM2A0: constant := 64; -- Compare Output Mode bit 1
   TCCR2A_COM2A1: constant := 128; -- Compare Output Mode bit 1

   -- Timer/Counter2 Control Register B
   TCCR2B : Unsigned_8;
   for TCCR2B'Address use System'To_Address (16#B1#);
   TCCR2B_CS20: constant := 1; -- Clock Select bit 0
   TCCR2B_CS21: constant := 2; -- Clock Select bit 1
   TCCR2B_CS22: constant := 4; -- Clock Select bit 2
   TCCR2B_WGM22: constant := 8; -- Waveform Generation Mode
   TCCR2B_FOC2B: constant := 64; -- Force Output Compare B
   TCCR2B_FOC2A: constant := 128; -- Force Output Compare A

   -- Timer/Counter2
   TCNT2 : Unsigned_8;
   for TCNT2'Address use System'To_Address (16#B2#);

   -- Timer/Counter2 Output Compare Register B
   OCR2B : Unsigned_8;
   for OCR2B'Address use System'To_Address (16#B4#);

   -- Timer/Counter2 Output Compare Register A
   OCR2A : Unsigned_8;
   for OCR2A'Address use System'To_Address (16#B3#);

   -- Asynchronous Status Register
   ASSR : Unsigned_8;
   for ASSR'Address use System'To_Address (16#B6#);
   ASSR_TCR2BUB: constant := 1; -- Timer/Counter Control Register2 Update Busy
   ASSR_TCR2AUB: constant := 2; -- Timer/Counter Control Register2 Update Busy
   ASSR_OCR2BUB: constant := 4; -- Output Compare Register 2 Update Busy
   ASSR_OCR2AUB: constant := 8; -- Output Compare Register2 Update Busy
   ASSR_TCN2UB: constant := 16; -- Timer/Counter2 Update Busy
   ASSR_AS2: constant := 32; -- Asynchronous Timer/Counter2
   ASSR_EXCLK: constant := 64; -- Enable External Clock Input

   -- General Timer Counter Control register

   -- Watchdog Timer Control Register
   WDTCSR : Unsigned_8;
   for WDTCSR'Address use System'To_Address (16#60#);
   WDTCSR_WDP0: constant := 1; -- Watch Dog Timer Prescaler bit 0
   WDTCSR_WDP1: constant := 2; -- Watch Dog Timer Prescaler bit 1
   WDTCSR_WDP2: constant := 4; -- Watch Dog Timer Prescaler bit 2
   WDTCSR_WDE: constant := 8; -- Watch Dog Enable
   WDTCSR_WDCE: constant := 16; -- Watchdog Change Enable
   WDTCSR_WDP3: constant := 32; -- Watchdog Timer Prescaler Bit 3
   WDTCSR_WDIE: constant := 64; -- Watchdog Timeout Interrupt Enable
   WDTCSR_WDIF: constant := 128; -- Watchdog Timeout Interrupt Flag

   -- USART I/O Data Register
   UDR1 : Unsigned_8;
   for UDR1'Address use System'To_Address (16#CE#);

   -- USART Control and Status Register A
   UCSR1A : Unsigned_8;
   for UCSR1A'Address use System'To_Address (16#C8#);
   UCSR1A_MPCM1: constant := 1; -- Multi-processor Communication Mode
   UCSR1A_U2X1: constant := 2; -- Double the USART transmission speed
   UCSR1A_UPE1: constant := 4; -- Parity Error
   UCSR1A_DOR1: constant := 8; -- Data overRun
   UCSR1A_FE1: constant := 16; -- Framing Error
   UCSR1A_UDRE1: constant := 32; -- USART Data Register Empty
   UCSR1A_TXC1: constant := 64; -- USART Transmitt Complete
   UCSR1A_RXC1: constant := 128; -- USART Receive Complete

   -- USART Control and Status Register B
   UCSR1B : Unsigned_8;
   for UCSR1B'Address use System'To_Address (16#C9#);
   UCSR1B_TXB81: constant := 1; -- Transmit Data Bit 8
   UCSR1B_RXB81: constant := 2; -- Receive Data Bit 8
   UCSR1B_UCSZ12: constant := 4; -- Character Size
   UCSR1B_TXEN1: constant := 8; -- Transmitter Enable
   UCSR1B_RXEN1: constant := 16; -- Receiver Enable
   UCSR1B_UDRIE1: constant := 32; -- USART Data register Empty Interrupt Enable
   UCSR1B_TXCIE1: constant := 64; -- TX Complete Interrupt Enable
   UCSR1B_RXCIE1: constant := 128; -- RX Complete Interrupt Enable

   -- USART Control and Status Register C
   UCSR1C : Unsigned_8;
   for UCSR1C'Address use System'To_Address (16#CA#);
   UCSR1C_UCPOL1: constant := 1; -- Clock Polarity
   UCSR1C_UCSZ10: constant := 2; -- Character Size
   UCSR1C_UCSZ11: constant := 4; -- Character Size
   UCSR1C_USBS1: constant := 8; -- Stop Bit Select
   UCSR1C_UPM10: constant := 16; -- Parity Mode Bit 0
   UCSR1C_UPM11: constant := 32; -- Parity Mode Bit 1
   UCSR1C_UMSEL10: constant := 64; -- USART Mode Select
   UCSR1C_UMSEL11: constant := 128; -- USART Mode Select

   -- USART Baud Rate Register High Byte
   UBRR1H : Unsigned_8;
   for UBRR1H'Address use System'To_Address (16#CD#);
   UBRR1H_UBRR8: constant := 1; -- USART Baud Rate Register bit 8
   UBRR1H_UBRR9: constant := 2; -- USART Baud Rate Register bit 9
   UBRR1H_UBRR10: constant := 4; -- USART Baud Rate Register bit 10
   UBRR1H_UBRR11: constant := 8; -- USART Baud Rate Register bit 11

   -- USART Baud Rate Register Low Byte
   UBRR1L : Unsigned_8;
   for UBRR1L'Address use System'To_Address (16#CC#);
   UBRR1L_UBRR0: constant := 1; -- USART Baud Rate Register bit 0
   UBRR1L_UBRR1: constant := 2; -- USART Baud Rate Register bit 1
   UBRR1L_UBRR2: constant := 4; -- USART Baud Rate Register bit 2
   UBRR1L_UBRR3: constant := 8; -- USART Baud Rate Register bit 3
   UBRR1L_UBRR4: constant := 16; -- USART Baud Rate Register bit 4
   UBRR1L_UBRR5: constant := 32; -- USART Baud Rate Register bit 5
   UBRR1L_UBRR6: constant := 64; -- USART Baud Rate Register bit 6
   UBRR1L_UBRR7: constant := 128; -- USART Baud Rate Register bit 7

   -- EEPROM Address Register Low Byte
   EEARH : Unsigned_8;
   for EEARH'Address use System'To_Address (16#42#);
   EEARH_EEAR8: constant := 1; -- EEPROM Read/Write Access Bit 8
   EEARH_EEAR9: constant := 2; -- EEPROM Read/Write Access Bit 9
   EEARH_EEAR10: constant := 4; -- EEPROM Read/Write Access Bit 10
   EEARH_EEAR11: constant := 8; -- EEPROM Read/Write Access Bit 11

   -- EEPROM Address Register Low Byte
   EEARL : Unsigned_8;
   for EEARL'Address use System'To_Address (16#41#);
   EEARL_EEAR0: constant := 1; -- EEPROM Read/Write Access Bit 0
   EEARL_EEAR1: constant := 2; -- EEPROM Read/Write Access Bit 1
   EEARL_EEAR2: constant := 4; -- EEPROM Read/Write Access Bit 2
   EEARL_EEAR3: constant := 8; -- EEPROM Read/Write Access Bit 3
   EEARL_EEAR4: constant := 16; -- EEPROM Read/Write Access Bit 4
   EEARL_EEAR5: constant := 32; -- EEPROM Read/Write Access Bit 5
   EEARL_EEAR6: constant := 64; -- EEPROM Read/Write Access Bit 6
   EEARL_EEAR7: constant := 128; -- EEPROM Read/Write Access Bit 7

   -- EEPROM Data Register
   EEDR : Unsigned_8;
   for EEDR'Address use System'To_Address (16#40#);
   EEDR_EEDR0: constant := 1; -- EEPROM Data Register bit 0
   EEDR_EEDR1: constant := 2; -- EEPROM Data Register bit 1
   EEDR_EEDR2: constant := 4; -- EEPROM Data Register bit 2
   EEDR_EEDR3: constant := 8; -- EEPROM Data Register bit 3
   EEDR_EEDR4: constant := 16; -- EEPROM Data Register bit 4
   EEDR_EEDR5: constant := 32; -- EEPROM Data Register bit 5
   EEDR_EEDR6: constant := 64; -- EEPROM Data Register bit 6
   EEDR_EEDR7: constant := 128; -- EEPROM Data Register bit 7

   -- EEPROM Control Register
   EECR : Unsigned_8;
   for EECR'Address use System'To_Address (16#3F#);
   EECR_EERE: constant := 1; -- EEPROM Read Enable
   EECR_EEPE: constant := 2; -- EEPROM Write Enable
   EECR_EEMPE: constant := 4; -- EEPROM Master Write Enable
   EECR_EERIE: constant := 8; -- EEPROM Ready Interrupt Enable
   EECR_EEPM0: constant := 16; -- EEPROM Programming Mode Bit 0
   EECR_EEPM1: constant := 32; -- EEPROM Programming Mode Bit 1

   -- Timer/Counter5 Control Register A
   TCCR5A : Unsigned_8;
   for TCCR5A'Address use System'To_Address (16#120#);
   TCCR5A_WGM50: constant := 1; -- Waveform Generation Mode
   TCCR5A_WGM51: constant := 2; -- Waveform Generation Mode
   TCCR5A_COM5C0: constant := 4; -- Compare Output Mode 5C, bit 0
   TCCR5A_COM5C1: constant := 8; -- Compare Output Mode 5C, bit 1
   TCCR5A_COM5B0: constant := 16; -- Compare Output Mode 5B, bit 0
   TCCR5A_COM5B1: constant := 32; -- Compare Output Mode 5B, bit 1
   TCCR5A_COM5A0: constant := 64; -- Compare Output Mode 5A, bit 0
   TCCR5A_COM5A1: constant := 128; -- Compare Output Mode 1A, bit 1

   -- Timer/Counter5 Control Register B
   TCCR5B : Unsigned_8;
   for TCCR5B'Address use System'To_Address (16#121#);
   TCCR5B_CS50: constant := 1; -- Prescaler source of Timer/Counter 5
   TCCR5B_CS51: constant := 2; -- Prescaler source of Timer/Counter 5
   TCCR5B_CS52: constant := 4; -- Prescaler source of Timer/Counter 5
   TCCR5B_WGM52: constant := 8; -- Waveform Generation Mode
   TCCR5B_WGM53: constant := 16; -- Waveform Generation Mode
   TCCR5B_ICES5: constant := 64; -- Input Capture 5 Edge Select
   TCCR5B_ICNC5: constant := 128; -- Input Capture 5 Noise Canceler

   -- Timer/Counter 5 Control Register C
   TCCR5C : Unsigned_8;
   for TCCR5C'Address use System'To_Address (16#122#);
   TCCR5C_FOC5C: constant := 32; -- Force Output Compare 5C
   TCCR5C_FOC5B: constant := 64; -- Force Output Compare 5B
   TCCR5C_FOC5A: constant := 128; -- Force Output Compare 5A

   -- Timer/Counter5 High Byte
   TCNT5H : Unsigned_8;
   for TCNT5H'Address use System'To_Address (16#125#);
   TCNT5H_TCNT5H0: constant := 1; -- Timer/Counter5 High Byte bit 0
   TCNT5H_TCNT5H1: constant := 2; -- Timer/Counter5 High Byte bit 1
   TCNT5H_TCNT5H2: constant := 4; -- Timer/Counter5 High Byte bit 2
   TCNT5H_TCNT5H3: constant := 8; -- Timer/Counter5 High Byte bit 3
   TCNT5H_TCNT5H4: constant := 16; -- Timer/Counter5 High Byte bit 4
   TCNT5H_TCNT5H5: constant := 32; -- Timer/Counter5 High Byte bit 5
   TCNT5H_TCNT5H6: constant := 64; -- Timer/Counter5 High Byte bit 6
   TCNT5H_TCNT5H7: constant := 128; -- Timer/Counter5 High Byte bit 7

   -- Timer/Counter5 Low Byte
   TCNT5L : Unsigned_8;
   for TCNT5L'Address use System'To_Address (16#124#);
   TCNT5L_TCNT5L0: constant := 1; -- Timer/Counter5 Low Byte bit 0
   TCNT5L_TCNT5L1: constant := 2; -- Timer/Counter5 Low Byte bit 1
   TCNT5L_TCNT5L2: constant := 4; -- Timer/Counter5 Low Byte bit 2
   TCNT5L_TCNT5L3: constant := 8; -- Timer/Counter5 Low Byte bit 3
   TCNT5L_TCNT5L4: constant := 16; -- Timer/Counter5 Low Byte bit 4
   TCNT5L_TCNT5L5: constant := 32; -- Timer/Counter5 Low Byte bit 5
   TCNT5L_TCNT5L6: constant := 64; -- Timer/Counter5 Low Byte bit 6
   TCNT5L_TCNT5L7: constant := 128; -- Timer/Counter5 Low Byte bit 7

   -- Timer/Counter5 Outbut Compare Register A High Byte
   OCR5AH : Unsigned_8;
   for OCR5AH'Address use System'To_Address (16#129#);
   OCR5AH_OCR5AH0: constant := 1; -- Timer/Counter5 Outbut Compare Register High Byte bit 0
   OCR5AH_OCR5AH1: constant := 2; -- Timer/Counter5 Outbut Compare Register High Byte bit 1
   OCR5AH_OCR5AH2: constant := 4; -- Timer/Counter5 Outbut Compare Register High Byte bit 2
   OCR5AH_OCR5AH3: constant := 8; -- Timer/Counter5 Outbut Compare Register High Byte bit 3
   OCR5AH_OCR5AH4: constant := 16; -- Timer/Counter5 Outbut Compare Register High Byte bit 4
   OCR5AH_OCR5AH5: constant := 32; -- Timer/Counter5 Outbut Compare Register High Byte bit 5
   OCR5AH_OCR5AH6: constant := 64; -- Timer/Counter5 Outbut Compare Register High Byte bit 6
   OCR5AH_OCR5AH7: constant := 128; -- Timer/Counter5 Outbut Compare Register High Byte bit 7

   -- Timer/Counter5 Outbut Compare Register A Low Byte
   OCR5AL : Unsigned_8;
   for OCR5AL'Address use System'To_Address (16#128#);
   OCR5AL_OCR5AL0: constant := 1; -- Timer/Counter5 Outbut Compare Register Low Byte Bit 0
   OCR5AL_OCR5AL1: constant := 2; -- Timer/Counter5 Outbut Compare Register Low Byte Bit 1
   OCR5AL_OCR5AL2: constant := 4; -- Timer/Counter5 Outbut Compare Register Low Byte Bit 2
   OCR5AL_OCR5AL3: constant := 8; -- Timer/Counter5 Outbut Compare Register Low Byte Bit 3
   OCR5AL_OCR5AL4: constant := 16; -- Timer/Counter5 Outbut Compare Register Low Byte Bit 4
   OCR5AL_OCR5AL5: constant := 32; -- Timer/Counter5 Outbut Compare Register Low Byte Bit 5
   OCR5AL_OCR5AL6: constant := 64; -- Timer/Counter5 Outbut Compare Register Low Byte Bit 6
   OCR5AL_OCR5AL7: constant := 128; -- Timer/Counter5 Outbut Compare Register Low Byte Bit 7

   -- Timer/Counter5 Output Compare Register B High Byte
   OCR5BH : Unsigned_8;
   for OCR5BH'Address use System'To_Address (16#12B#);
   OCR5BH_OCR5BH0: constant := 1; -- Timer/Counter5 Output Compare Register High Byte bit 0
   OCR5BH_OCR5BH1: constant := 2; -- Timer/Counter5 Output Compare Register High Byte bit 1
   OCR5BH_OCR5BH2: constant := 4; -- Timer/Counter5 Output Compare Register High Byte bit 2
   OCR5BH_OCR5BH3: constant := 8; -- Timer/Counter5 Output Compare Register High Byte bit 3
   OCR5BH_OCR5BH4: constant := 16; -- Timer/Counter5 Output Compare Register High Byte bit 4
   OCR5BH_OCR5BH5: constant := 32; -- Timer/Counter5 Output Compare Register High Byte bit 5
   OCR5BH_OCR5BH6: constant := 64; -- Timer/Counter5 Output Compare Register High Byte bit 6
   OCR5BH_OCR5BH7: constant := 128; -- Timer/Counter5 Output Compare Register High Byte bit 7

   -- Timer/Counter5 Output Compare Register B Low Byte
   OCR5BL : Unsigned_8;
   for OCR5BL'Address use System'To_Address (16#12A#);
   OCR5BL_OCR5BL0: constant := 1; -- Timer/Counter5 Output Compare Register Low Byte bit 0
   OCR5BL_OCR5BL1: constant := 2; -- Timer/Counter5 Output Compare Register Low Byte bit 1
   OCR5BL_OCR5BL2: constant := 4; -- Timer/Counter5 Output Compare Register Low Byte bit 2
   OCR5BL_OCR5BL3: constant := 8; -- Timer/Counter5 Output Compare Register Low Byte bit 3
   OCR5BL_OCR5BL4: constant := 16; -- Timer/Counter5 Output Compare Register Low Byte bit 4
   OCR5BL_OCR5BL5: constant := 32; -- Timer/Counter5 Output Compare Register Low Byte bit 5
   OCR5BL_OCR5BL6: constant := 64; -- Timer/Counter5 Output Compare Register Low Byte bit 6
   OCR5BL_OCR5BL7: constant := 128; -- Timer/Counter5 Output Compare Register Low Byte bit 7

   -- Timer/Counter5 Output Compare Register B High Byte
   OCR5CH : Unsigned_8;
   for OCR5CH'Address use System'To_Address (16#12D#);
   OCR5CH_OCR5CH0: constant := 1; -- Timer/Counter5 Output Compare Register High Byte bit 0
   OCR5CH_OCR5CH1: constant := 2; -- Timer/Counter5 Output Compare Register High Byte bit 1
   OCR5CH_OCR5CH2: constant := 4; -- Timer/Counter5 Output Compare Register High Byte bit 2
   OCR5CH_OCR5CH3: constant := 8; -- Timer/Counter5 Output Compare Register High Byte bit 3
   OCR5CH_OCR5CH4: constant := 16; -- Timer/Counter5 Output Compare Register High Byte bit 4
   OCR5CH_OCR5CH5: constant := 32; -- Timer/Counter5 Output Compare Register High Byte bit 5
   OCR5CH_OCR5CH6: constant := 64; -- Timer/Counter5 Output Compare Register High Byte bit 6
   OCR5CH_OCR5CH7: constant := 128; -- Timer/Counter5 Output Compare Register High Byte bit 7

   -- Timer/Counter5 Output Compare Register B Low Byte
   OCR5CL : Unsigned_8;
   for OCR5CL'Address use System'To_Address (16#12C#);
   OCR5CL_OCR5CL0: constant := 1; -- Timer/Counter5 Output Compare Register Low Byte bit 0
   OCR5CL_OCR5CL1: constant := 2; -- Timer/Counter5 Output Compare Register Low Byte bit 1
   OCR5CL_OCR5CL2: constant := 4; -- Timer/Counter5 Output Compare Register Low Byte bit 2
   OCR5CL_OCR5CL3: constant := 8; -- Timer/Counter5 Output Compare Register Low Byte bit 3
   OCR5CL_OCR5CL4: constant := 16; -- Timer/Counter5 Output Compare Register Low Byte bit 4
   OCR5CL_OCR5CL5: constant := 32; -- Timer/Counter5 Output Compare Register Low Byte bit 5
   OCR5CL_OCR5CL6: constant := 64; -- Timer/Counter5 Output Compare Register Low Byte bit 6
   OCR5CL_OCR5CL7: constant := 128; -- Timer/Counter5 Output Compare Register Low Byte bit 7

   -- Timer/Counter5 Input Capture Register High Byte
   ICR5H : Unsigned_8;
   for ICR5H'Address use System'To_Address (16#127#);
   ICR5H_ICR5H0: constant := 1; -- Timer/Counter5 Input Capture Register High Byte bit 0
   ICR5H_ICR5H1: constant := 2; -- Timer/Counter5 Input Capture Register High Byte bit 1
   ICR5H_ICR5H2: constant := 4; -- Timer/Counter5 Input Capture Register High Byte bit 2
   ICR5H_ICR5H3: constant := 8; -- Timer/Counter5 Input Capture Register High Byte bit 3
   ICR5H_ICR5H4: constant := 16; -- Timer/Counter5 Input Capture Register High Byte bit 4
   ICR5H_ICR5H5: constant := 32; -- Timer/Counter5 Input Capture Register High Byte bit 5
   ICR5H_ICR5H6: constant := 64; -- Timer/Counter5 Input Capture Register High Byte bit 6
   ICR5H_ICR5H7: constant := 128; -- Timer/Counter5 Input Capture Register High Byte bit 7

   -- Timer/Counter5 Input Capture Register Low Byte
   ICR5L : Unsigned_8;
   for ICR5L'Address use System'To_Address (16#126#);
   ICR5L_ICR5L0: constant := 1; -- Timer/Counter5 Input Capture Register Low Byte bit 0
   ICR5L_ICR5L1: constant := 2; -- Timer/Counter5 Input Capture Register Low Byte bit 1
   ICR5L_ICR5L2: constant := 4; -- Timer/Counter5 Input Capture Register Low Byte bit 2
   ICR5L_ICR5L3: constant := 8; -- Timer/Counter5 Input Capture Register Low Byte bit 3
   ICR5L_ICR5L4: constant := 16; -- Timer/Counter5 Input Capture Register Low Byte bit 4
   ICR5L_ICR5L5: constant := 32; -- Timer/Counter5 Input Capture Register Low Byte bit 5
   ICR5L_ICR5L6: constant := 64; -- Timer/Counter5 Input Capture Register Low Byte bit 6
   ICR5L_ICR5L7: constant := 128; -- Timer/Counter5 Input Capture Register Low Byte bit 7

   -- Timer/Counter5 Interrupt Mask Register
   TIMSK5 : Unsigned_8;
   for TIMSK5'Address use System'To_Address (16#73#);
   TIMSK5_TOIE5: constant := 1; -- Timer/Counter5 Overflow Interrupt Enable
   TIMSK5_OCIE5A: constant := 2; -- Timer/Counter5 Output Compare A Match Interrupt Enable
   TIMSK5_OCIE5B: constant := 4; -- Timer/Counter5 Output Compare B Match Interrupt Enable
   TIMSK5_OCIE5C: constant := 8; -- Timer/Counter5 Output Compare C Match Interrupt Enable
   TIMSK5_ICIE5: constant := 32; -- Timer/Counter5 Input Capture Interrupt Enable

   -- Timer/Counter5 Interrupt Flag register
   TIFR5 : Unsigned_8;
   for TIFR5'Address use System'To_Address (16#3A#);
   TIFR5_TOV5: constant := 1; -- Timer/Counter5 Overflow Flag
   TIFR5_OCF5A: constant := 2; -- Output Compare Flag 5A
   TIFR5_OCF5B: constant := 4; -- Output Compare Flag 5B
   TIFR5_OCF5C: constant := 8; -- Output Compare Flag 5C
   TIFR5_ICF5: constant := 32; -- Input Capture Flag 5

   -- Timer/Counter4 Control Register A
   TCCR4A : Unsigned_8;
   for TCCR4A'Address use System'To_Address (16#A0#);
   TCCR4A_WGM40: constant := 1; -- Waveform Generation Mode
   TCCR4A_WGM41: constant := 2; -- Waveform Generation Mode
   TCCR4A_COM4C0: constant := 4; -- Compare Output Mode 4C, bit 0
   TCCR4A_COM4C1: constant := 8; -- Compare Output Mode 4C, bit 1
   TCCR4A_COM4B0: constant := 16; -- Compare Output Mode 4B, bit 0
   TCCR4A_COM4B1: constant := 32; -- Compare Output Mode 4B, bit 1
   TCCR4A_COM4A0: constant := 64; -- Compare Output Mode 4A, bit 0
   TCCR4A_COM4A1: constant := 128; -- Compare Output Mode 1A, bit 1

   -- Timer/Counter4 Control Register B
   TCCR4B : Unsigned_8;
   for TCCR4B'Address use System'To_Address (16#A1#);
   TCCR4B_CS40: constant := 1; -- Prescaler source of Timer/Counter 4
   TCCR4B_CS41: constant := 2; -- Prescaler source of Timer/Counter 4
   TCCR4B_CS42: constant := 4; -- Prescaler source of Timer/Counter 4
   TCCR4B_WGM42: constant := 8; -- Waveform Generation Mode
   TCCR4B_WGM43: constant := 16; -- Waveform Generation Mode
   TCCR4B_ICES4: constant := 64; -- Input Capture 4 Edge Select
   TCCR4B_ICNC4: constant := 128; -- Input Capture 4 Noise Canceler

   -- Timer/Counter 4 Control Register C
   TCCR4C : Unsigned_8;
   for TCCR4C'Address use System'To_Address (16#A2#);
   TCCR4C_FOC4C: constant := 32; -- Force Output Compare 4C
   TCCR4C_FOC4B: constant := 64; -- Force Output Compare 4B
   TCCR4C_FOC4A: constant := 128; -- Force Output Compare 4A

   -- Timer/Counter4 High Byte
   TCNT4H : Unsigned_8;
   for TCNT4H'Address use System'To_Address (16#A5#);
   TCNT4H_TCNT4H0: constant := 1; -- Timer/Counter4 High Byte bit 0
   TCNT4H_TCNT4H1: constant := 2; -- Timer/Counter4 High Byte bit 1
   TCNT4H_TCNT4H2: constant := 4; -- Timer/Counter4 High Byte bit 2
   TCNT4H_TCNT4H3: constant := 8; -- Timer/Counter4 High Byte bit 3
   TCNT4H_TCNT4H4: constant := 16; -- Timer/Counter4 High Byte bit 4
   TCNT4H_TCNT4H5: constant := 32; -- Timer/Counter4 High Byte bit 5
   TCNT4H_TCNT4H6: constant := 64; -- Timer/Counter4 High Byte bit 6
   TCNT4H_TCNT4H7: constant := 128; -- Timer/Counter4 High Byte bit 7

   -- Timer/Counter4 Low Byte
   TCNT4L : Unsigned_8;
   for TCNT4L'Address use System'To_Address (16#A4#);
   TCNT4L_TCNT4L0: constant := 1; -- Timer/Counter4 Low Byte bit 0
   TCNT4L_TCNT4L1: constant := 2; -- Timer/Counter4 Low Byte bit 1
   TCNT4L_TCNT4L2: constant := 4; -- Timer/Counter4 Low Byte bit 2
   TCNT4L_TCNT4L3: constant := 8; -- Timer/Counter4 Low Byte bit 3
   TCNT4L_TCNT4L4: constant := 16; -- Timer/Counter4 Low Byte bit 4
   TCNT4L_TCNT4L5: constant := 32; -- Timer/Counter4 Low Byte bit 5
   TCNT4L_TCNT4L6: constant := 64; -- Timer/Counter4 Low Byte bit 6
   TCNT4L_TCNT4L7: constant := 128; -- Timer/Counter4 Low Byte bit 7

   -- Timer/Counter4 Outbut Compare Register A High Byte
   OCR4AH : Unsigned_8;
   for OCR4AH'Address use System'To_Address (16#A9#);
   OCR4AH_OCR4AH0: constant := 1; -- Timer/Counter4 Outbut Compare Register High Byte bit 0
   OCR4AH_OCR4AH1: constant := 2; -- Timer/Counter4 Outbut Compare Register High Byte bit 1
   OCR4AH_OCR4AH2: constant := 4; -- Timer/Counter4 Outbut Compare Register High Byte bit 2
   OCR4AH_OCR4AH3: constant := 8; -- Timer/Counter4 Outbut Compare Register High Byte bit 3
   OCR4AH_OCR4AH4: constant := 16; -- Timer/Counter4 Outbut Compare Register High Byte bit 4
   OCR4AH_OCR4AH5: constant := 32; -- Timer/Counter4 Outbut Compare Register High Byte bit 5
   OCR4AH_OCR4AH6: constant := 64; -- Timer/Counter4 Outbut Compare Register High Byte bit 6
   OCR4AH_OCR4AH7: constant := 128; -- Timer/Counter4 Outbut Compare Register High Byte bit 7

   -- Timer/Counter4 Outbut Compare Register A Low Byte
   OCR4AL : Unsigned_8;
   for OCR4AL'Address use System'To_Address (16#A8#);
   OCR4AL_OCR4AL0: constant := 1; -- Timer/Counter4 Outbut Compare Register Low Byte Bit 0
   OCR4AL_OCR4AL1: constant := 2; -- Timer/Counter4 Outbut Compare Register Low Byte Bit 1
   OCR4AL_OCR4AL2: constant := 4; -- Timer/Counter4 Outbut Compare Register Low Byte Bit 2
   OCR4AL_OCR4AL3: constant := 8; -- Timer/Counter4 Outbut Compare Register Low Byte Bit 3
   OCR4AL_OCR4AL4: constant := 16; -- Timer/Counter4 Outbut Compare Register Low Byte Bit 4
   OCR4AL_OCR4AL5: constant := 32; -- Timer/Counter4 Outbut Compare Register Low Byte Bit 5
   OCR4AL_OCR4AL6: constant := 64; -- Timer/Counter4 Outbut Compare Register Low Byte Bit 6
   OCR4AL_OCR4AL7: constant := 128; -- Timer/Counter4 Outbut Compare Register Low Byte Bit 7

   -- Timer/Counter4 Output Compare Register B High Byte
   OCR4BH : Unsigned_8;
   for OCR4BH'Address use System'To_Address (16#AB#);
   OCR4BH_OCR4BH0: constant := 1; -- Timer/Counter4 Output Compare Register High Byte bit 0
   OCR4BH_OCR4BH1: constant := 2; -- Timer/Counter4 Output Compare Register High Byte bit 1
   OCR4BH_OCR4BH2: constant := 4; -- Timer/Counter4 Output Compare Register High Byte bit 2
   OCR4BH_OCR4BH3: constant := 8; -- Timer/Counter4 Output Compare Register High Byte bit 3
   OCR4BH_OCR4BH4: constant := 16; -- Timer/Counter4 Output Compare Register High Byte bit 4
   OCR4BH_OCR4BH5: constant := 32; -- Timer/Counter4 Output Compare Register High Byte bit 5
   OCR4BH_OCR4BH6: constant := 64; -- Timer/Counter4 Output Compare Register High Byte bit 6
   OCR4BH_OCR4BH7: constant := 128; -- Timer/Counter4 Output Compare Register High Byte bit 7

   -- Timer/Counter4 Output Compare Register B Low Byte
   OCR4BL : Unsigned_8;
   for OCR4BL'Address use System'To_Address (16#AA#);
   OCR4BL_OCR4BL0: constant := 1; -- Timer/Counter4 Output Compare Register Low Byte bit 0
   OCR4BL_OCR4BL1: constant := 2; -- Timer/Counter4 Output Compare Register Low Byte bit 1
   OCR4BL_OCR4BL2: constant := 4; -- Timer/Counter4 Output Compare Register Low Byte bit 2
   OCR4BL_OCR4BL3: constant := 8; -- Timer/Counter4 Output Compare Register Low Byte bit 3
   OCR4BL_OCR4BL4: constant := 16; -- Timer/Counter4 Output Compare Register Low Byte bit 4
   OCR4BL_OCR4BL5: constant := 32; -- Timer/Counter4 Output Compare Register Low Byte bit 5
   OCR4BL_OCR4BL6: constant := 64; -- Timer/Counter4 Output Compare Register Low Byte bit 6
   OCR4BL_OCR4BL7: constant := 128; -- Timer/Counter4 Output Compare Register Low Byte bit 7

   -- Timer/Counter4 Output Compare Register B High Byte
   OCR4CH : Unsigned_8;
   for OCR4CH'Address use System'To_Address (16#AD#);
   OCR4CH_OCR4CH0: constant := 1; -- Timer/Counter4 Output Compare Register High Byte bit 0
   OCR4CH_OCR4CH1: constant := 2; -- Timer/Counter4 Output Compare Register High Byte bit 1
   OCR4CH_OCR4CH2: constant := 4; -- Timer/Counter4 Output Compare Register High Byte bit 2
   OCR4CH_OCR4CH3: constant := 8; -- Timer/Counter4 Output Compare Register High Byte bit 3
   OCR4CH_OCR4CH4: constant := 16; -- Timer/Counter4 Output Compare Register High Byte bit 4
   OCR4CH_OCR4CH5: constant := 32; -- Timer/Counter4 Output Compare Register High Byte bit 5
   OCR4CH_OCR4CH6: constant := 64; -- Timer/Counter4 Output Compare Register High Byte bit 6
   OCR4CH_OCR4CH7: constant := 128; -- Timer/Counter4 Output Compare Register High Byte bit 7

   -- Timer/Counter4 Output Compare Register B Low Byte
   OCR4CL : Unsigned_8;
   for OCR4CL'Address use System'To_Address (16#AC#);
   OCR4CL_OCR4CL0: constant := 1; -- Timer/Counter4 Output Compare Register Low Byte bit 0
   OCR4CL_OCR4CL1: constant := 2; -- Timer/Counter4 Output Compare Register Low Byte bit 1
   OCR4CL_OCR4CL2: constant := 4; -- Timer/Counter4 Output Compare Register Low Byte bit 2
   OCR4CL_OCR4CL3: constant := 8; -- Timer/Counter4 Output Compare Register Low Byte bit 3
   OCR4CL_OCR4CL4: constant := 16; -- Timer/Counter4 Output Compare Register Low Byte bit 4
   OCR4CL_OCR4CL5: constant := 32; -- Timer/Counter4 Output Compare Register Low Byte bit 5
   OCR4CL_OCR4CL6: constant := 64; -- Timer/Counter4 Output Compare Register Low Byte bit 6
   OCR4CL_OCR4CL7: constant := 128; -- Timer/Counter4 Output Compare Register Low Byte bit 7

   -- Timer/Counter4 Input Capture Register High Byte
   ICR4H : Unsigned_8;
   for ICR4H'Address use System'To_Address (16#A7#);
   ICR4H_ICR4H0: constant := 1; -- Timer/Counter4 Input Capture Register High Byte bit 0
   ICR4H_ICR4H1: constant := 2; -- Timer/Counter4 Input Capture Register High Byte bit 1
   ICR4H_ICR4H2: constant := 4; -- Timer/Counter4 Input Capture Register High Byte bit 2
   ICR4H_ICR4H3: constant := 8; -- Timer/Counter4 Input Capture Register High Byte bit 3
   ICR4H_ICR4H4: constant := 16; -- Timer/Counter4 Input Capture Register High Byte bit 4
   ICR4H_ICR4H5: constant := 32; -- Timer/Counter4 Input Capture Register High Byte bit 5
   ICR4H_ICR4H6: constant := 64; -- Timer/Counter4 Input Capture Register High Byte bit 6
   ICR4H_ICR4H7: constant := 128; -- Timer/Counter4 Input Capture Register High Byte bit 7

   -- Timer/Counter4 Input Capture Register Low Byte
   ICR4L : Unsigned_8;
   for ICR4L'Address use System'To_Address (16#A6#);
   ICR4L_ICR4L0: constant := 1; -- Timer/Counter4 Input Capture Register Low Byte bit 0
   ICR4L_ICR4L1: constant := 2; -- Timer/Counter4 Input Capture Register Low Byte bit 1
   ICR4L_ICR4L2: constant := 4; -- Timer/Counter4 Input Capture Register Low Byte bit 2
   ICR4L_ICR4L3: constant := 8; -- Timer/Counter4 Input Capture Register Low Byte bit 3
   ICR4L_ICR4L4: constant := 16; -- Timer/Counter4 Input Capture Register Low Byte bit 4
   ICR4L_ICR4L5: constant := 32; -- Timer/Counter4 Input Capture Register Low Byte bit 5
   ICR4L_ICR4L6: constant := 64; -- Timer/Counter4 Input Capture Register Low Byte bit 6
   ICR4L_ICR4L7: constant := 128; -- Timer/Counter4 Input Capture Register Low Byte bit 7

   -- Timer/Counter4 Interrupt Mask Register
   TIMSK4 : Unsigned_8;
   for TIMSK4'Address use System'To_Address (16#72#);
   TIMSK4_TOIE4: constant := 1; -- Timer/Counter4 Overflow Interrupt Enable
   TIMSK4_OCIE4A: constant := 2; -- Timer/Counter4 Output Compare A Match Interrupt Enable
   TIMSK4_OCIE4B: constant := 4; -- Timer/Counter4 Output Compare B Match Interrupt Enable
   TIMSK4_OCIE4C: constant := 8; -- Timer/Counter4 Output Compare C Match Interrupt Enable
   TIMSK4_ICIE4: constant := 32; -- Timer/Counter4 Input Capture Interrupt Enable

   -- Timer/Counter4 Interrupt Flag register
   TIFR4 : Unsigned_8;
   for TIFR4'Address use System'To_Address (16#39#);
   TIFR4_TOV4: constant := 1; -- Timer/Counter4 Overflow Flag
   TIFR4_OCF4A: constant := 2; -- Output Compare Flag 4A
   TIFR4_OCF4B: constant := 4; -- Output Compare Flag 4B
   TIFR4_OCF4C: constant := 8; -- Output Compare Flag 4C
   TIFR4_ICF4: constant := 32; -- Input Capture Flag 4

   -- Timer/Counter3 Control Register A
   TCCR3A : Unsigned_8;
   for TCCR3A'Address use System'To_Address (16#90#);
   TCCR3A_WGM30: constant := 1; -- Waveform Generation Mode
   TCCR3A_WGM31: constant := 2; -- Waveform Generation Mode
   TCCR3A_COM3C0: constant := 4; -- Compare Output Mode 3C, bit 0
   TCCR3A_COM3C1: constant := 8; -- Compare Output Mode 3C, bit 1
   TCCR3A_COM3B0: constant := 16; -- Compare Output Mode 3B, bit 0
   TCCR3A_COM3B1: constant := 32; -- Compare Output Mode 3B, bit 1
   TCCR3A_COM3A0: constant := 64; -- Compare Output Mode 3A, bit 0
   TCCR3A_COM3A1: constant := 128; -- Compare Output Mode 1A, bit 1

   -- Timer/Counter3 Control Register B
   TCCR3B : Unsigned_8;
   for TCCR3B'Address use System'To_Address (16#91#);
   TCCR3B_CS30: constant := 1; -- Prescaler source of Timer/Counter 3
   TCCR3B_CS31: constant := 2; -- Prescaler source of Timer/Counter 3
   TCCR3B_CS32: constant := 4; -- Prescaler source of Timer/Counter 3
   TCCR3B_WGM32: constant := 8; -- Waveform Generation Mode
   TCCR3B_WGM33: constant := 16; -- Waveform Generation Mode
   TCCR3B_ICES3: constant := 64; -- Input Capture 3 Edge Select
   TCCR3B_ICNC3: constant := 128; -- Input Capture 3 Noise Canceler

   -- Timer/Counter 3 Control Register C
   TCCR3C : Unsigned_8;
   for TCCR3C'Address use System'To_Address (16#92#);
   TCCR3C_FOC3C: constant := 32; -- Force Output Compare 3C
   TCCR3C_FOC3B: constant := 64; -- Force Output Compare 3B
   TCCR3C_FOC3A: constant := 128; -- Force Output Compare 3A

   -- Timer/Counter3 High Byte
   TCNT3H : Unsigned_8;
   for TCNT3H'Address use System'To_Address (16#95#);
   TCNT3H_TCNT3H0: constant := 1; -- Timer/Counter3 High Byte bit 0
   TCNT3H_TCNT3H1: constant := 2; -- Timer/Counter3 High Byte bit 1
   TCNT3H_TCNT3H2: constant := 4; -- Timer/Counter3 High Byte bit 2
   TCNT3H_TCNT3H3: constant := 8; -- Timer/Counter3 High Byte bit 3
   TCNT3H_TCNT3H4: constant := 16; -- Timer/Counter3 High Byte bit 4
   TCNT3H_TCNT3H5: constant := 32; -- Timer/Counter3 High Byte bit 5
   TCNT3H_TCNT3H6: constant := 64; -- Timer/Counter3 High Byte bit 6
   TCNT3H_TCNT3H7: constant := 128; -- Timer/Counter3 High Byte bit 7

   -- Timer/Counter3 Low Byte
   TCNT3L : Unsigned_8;
   for TCNT3L'Address use System'To_Address (16#94#);
   TCNT3L_TCNT3L0: constant := 1; -- Timer/Counter3 Low Byte bit 0
   TCNT3L_TCNT3L1: constant := 2; -- Timer/Counter3 Low Byte bit 1
   TCNT3L_TCNT3L2: constant := 4; -- Timer/Counter3 Low Byte bit 2
   TCNT3L_TCNT3L3: constant := 8; -- Timer/Counter3 Low Byte bit 3
   TCNT3L_TCNT3L4: constant := 16; -- Timer/Counter3 Low Byte bit 4
   TCNT3L_TCNT3L5: constant := 32; -- Timer/Counter3 Low Byte bit 5
   TCNT3L_TCNT3L6: constant := 64; -- Timer/Counter3 Low Byte bit 6
   TCNT3L_TCNT3L7: constant := 128; -- Timer/Counter3 Low Byte bit 7

   -- Timer/Counter3 Outbut Compare Register A High Byte
   OCR3AH : Unsigned_8;
   for OCR3AH'Address use System'To_Address (16#99#);
   OCR3AH_OCR3AH0: constant := 1; -- Timer/Counter3 Outbut Compare Register High Byte bit 0
   OCR3AH_OCR3AH1: constant := 2; -- Timer/Counter3 Outbut Compare Register High Byte bit 1
   OCR3AH_OCR3AH2: constant := 4; -- Timer/Counter3 Outbut Compare Register High Byte bit 2
   OCR3AH_OCR3AH3: constant := 8; -- Timer/Counter3 Outbut Compare Register High Byte bit 3
   OCR3AH_OCR3AH4: constant := 16; -- Timer/Counter3 Outbut Compare Register High Byte bit 4
   OCR3AH_OCR3AH5: constant := 32; -- Timer/Counter3 Outbut Compare Register High Byte bit 5
   OCR3AH_OCR3AH6: constant := 64; -- Timer/Counter3 Outbut Compare Register High Byte bit 6
   OCR3AH_OCR3AH7: constant := 128; -- Timer/Counter3 Outbut Compare Register High Byte bit 7

   -- Timer/Counter3 Outbut Compare Register A Low Byte
   OCR3AL : Unsigned_8;
   for OCR3AL'Address use System'To_Address (16#98#);
   OCR3AL_OCR3AL0: constant := 1; -- Timer/Counter3 Outbut Compare Register Low Byte Bit 0
   OCR3AL_OCR3AL1: constant := 2; -- Timer/Counter3 Outbut Compare Register Low Byte Bit 1
   OCR3AL_OCR3AL2: constant := 4; -- Timer/Counter3 Outbut Compare Register Low Byte Bit 2
   OCR3AL_OCR3AL3: constant := 8; -- Timer/Counter3 Outbut Compare Register Low Byte Bit 3
   OCR3AL_OCR3AL4: constant := 16; -- Timer/Counter3 Outbut Compare Register Low Byte Bit 4
   OCR3AL_OCR3AL5: constant := 32; -- Timer/Counter3 Outbut Compare Register Low Byte Bit 5
   OCR3AL_OCR3AL6: constant := 64; -- Timer/Counter3 Outbut Compare Register Low Byte Bit 6
   OCR3AL_OCR3AL7: constant := 128; -- Timer/Counter3 Outbut Compare Register Low Byte Bit 7

   -- Timer/Counter3 Output Compare Register B High Byte
   OCR3BH : Unsigned_8;
   for OCR3BH'Address use System'To_Address (16#9B#);
   OCR3BH_OCR3BH0: constant := 1; -- Timer/Counter3 Output Compare Register High Byte bit 0
   OCR3BH_OCR3BH1: constant := 2; -- Timer/Counter3 Output Compare Register High Byte bit 1
   OCR3BH_OCR3BH2: constant := 4; -- Timer/Counter3 Output Compare Register High Byte bit 2
   OCR3BH_OCR3BH3: constant := 8; -- Timer/Counter3 Output Compare Register High Byte bit 3
   OCR3BH_OCR3BH4: constant := 16; -- Timer/Counter3 Output Compare Register High Byte bit 4
   OCR3BH_OCR3BH5: constant := 32; -- Timer/Counter3 Output Compare Register High Byte bit 5
   OCR3BH_OCR3BH6: constant := 64; -- Timer/Counter3 Output Compare Register High Byte bit 6
   OCR3BH_OCR3BH7: constant := 128; -- Timer/Counter3 Output Compare Register High Byte bit 7

   -- Timer/Counter3 Output Compare Register B Low Byte
   OCR3BL : Unsigned_8;
   for OCR3BL'Address use System'To_Address (16#9A#);
   OCR3BL_OCR3BL0: constant := 1; -- Timer/Counter3 Output Compare Register Low Byte bit 0
   OCR3BL_OCR3BL1: constant := 2; -- Timer/Counter3 Output Compare Register Low Byte bit 1
   OCR3BL_OCR3BL2: constant := 4; -- Timer/Counter3 Output Compare Register Low Byte bit 2
   OCR3BL_OCR3BL3: constant := 8; -- Timer/Counter3 Output Compare Register Low Byte bit 3
   OCR3BL_OCR3BL4: constant := 16; -- Timer/Counter3 Output Compare Register Low Byte bit 4
   OCR3BL_OCR3BL5: constant := 32; -- Timer/Counter3 Output Compare Register Low Byte bit 5
   OCR3BL_OCR3BL6: constant := 64; -- Timer/Counter3 Output Compare Register Low Byte bit 6
   OCR3BL_OCR3BL7: constant := 128; -- Timer/Counter3 Output Compare Register Low Byte bit 7

   -- Timer/Counter3 Output Compare Register B High Byte
   OCR3CH : Unsigned_8;
   for OCR3CH'Address use System'To_Address (16#9D#);
   OCR3CH_OCR3CH0: constant := 1; -- Timer/Counter3 Output Compare Register High Byte bit 0
   OCR3CH_OCR3CH1: constant := 2; -- Timer/Counter3 Output Compare Register High Byte bit 1
   OCR3CH_OCR3CH2: constant := 4; -- Timer/Counter3 Output Compare Register High Byte bit 2
   OCR3CH_OCR3CH3: constant := 8; -- Timer/Counter3 Output Compare Register High Byte bit 3
   OCR3CH_OCR3CH4: constant := 16; -- Timer/Counter3 Output Compare Register High Byte bit 4
   OCR3CH_OCR3CH5: constant := 32; -- Timer/Counter3 Output Compare Register High Byte bit 5
   OCR3CH_OCR3CH6: constant := 64; -- Timer/Counter3 Output Compare Register High Byte bit 6
   OCR3CH_OCR3CH7: constant := 128; -- Timer/Counter3 Output Compare Register High Byte bit 7

   -- Timer/Counter3 Output Compare Register B Low Byte
   OCR3CL : Unsigned_8;
   for OCR3CL'Address use System'To_Address (16#9C#);
   OCR3CL_OCR3CL0: constant := 1; -- Timer/Counter3 Output Compare Register Low Byte bit 0
   OCR3CL_OCR3CL1: constant := 2; -- Timer/Counter3 Output Compare Register Low Byte bit 1
   OCR3CL_OCR3CL2: constant := 4; -- Timer/Counter3 Output Compare Register Low Byte bit 2
   OCR3CL_OCR3CL3: constant := 8; -- Timer/Counter3 Output Compare Register Low Byte bit 3
   OCR3CL_OCR3CL4: constant := 16; -- Timer/Counter3 Output Compare Register Low Byte bit 4
   OCR3CL_OCR3CL5: constant := 32; -- Timer/Counter3 Output Compare Register Low Byte bit 5
   OCR3CL_OCR3CL6: constant := 64; -- Timer/Counter3 Output Compare Register Low Byte bit 6
   OCR3CL_OCR3CL7: constant := 128; -- Timer/Counter3 Output Compare Register Low Byte bit 7

   -- Timer/Counter3 Input Capture Register High Byte
   ICR3H : Unsigned_8;
   for ICR3H'Address use System'To_Address (16#97#);
   ICR3H_ICR3H0: constant := 1; -- Timer/Counter3 Input Capture Register High Byte bit 0
   ICR3H_ICR3H1: constant := 2; -- Timer/Counter3 Input Capture Register High Byte bit 1
   ICR3H_ICR3H2: constant := 4; -- Timer/Counter3 Input Capture Register High Byte bit 2
   ICR3H_ICR3H3: constant := 8; -- Timer/Counter3 Input Capture Register High Byte bit 3
   ICR3H_ICR3H4: constant := 16; -- Timer/Counter3 Input Capture Register High Byte bit 4
   ICR3H_ICR3H5: constant := 32; -- Timer/Counter3 Input Capture Register High Byte bit 5
   ICR3H_ICR3H6: constant := 64; -- Timer/Counter3 Input Capture Register High Byte bit 6
   ICR3H_ICR3H7: constant := 128; -- Timer/Counter3 Input Capture Register High Byte bit 7

   -- Timer/Counter3 Input Capture Register Low Byte
   ICR3L : Unsigned_8;
   for ICR3L'Address use System'To_Address (16#96#);
   ICR3L_ICR3L0: constant := 1; -- Timer/Counter3 Input Capture Register Low Byte bit 0
   ICR3L_ICR3L1: constant := 2; -- Timer/Counter3 Input Capture Register Low Byte bit 1
   ICR3L_ICR3L2: constant := 4; -- Timer/Counter3 Input Capture Register Low Byte bit 2
   ICR3L_ICR3L3: constant := 8; -- Timer/Counter3 Input Capture Register Low Byte bit 3
   ICR3L_ICR3L4: constant := 16; -- Timer/Counter3 Input Capture Register Low Byte bit 4
   ICR3L_ICR3L5: constant := 32; -- Timer/Counter3 Input Capture Register Low Byte bit 5
   ICR3L_ICR3L6: constant := 64; -- Timer/Counter3 Input Capture Register Low Byte bit 6
   ICR3L_ICR3L7: constant := 128; -- Timer/Counter3 Input Capture Register Low Byte bit 7

   -- Timer/Counter3 Interrupt Mask Register
   TIMSK3 : Unsigned_8;
   for TIMSK3'Address use System'To_Address (16#71#);
   TIMSK3_TOIE3: constant := 1; -- Timer/Counter3 Overflow Interrupt Enable
   TIMSK3_OCIE3A: constant := 2; -- Timer/Counter3 Output Compare A Match Interrupt Enable
   TIMSK3_OCIE3B: constant := 4; -- Timer/Counter3 Output Compare B Match Interrupt Enable
   TIMSK3_OCIE3C: constant := 8; -- Timer/Counter3 Output Compare C Match Interrupt Enable
   TIMSK3_ICIE3: constant := 32; -- Timer/Counter3 Input Capture Interrupt Enable

   -- Timer/Counter3 Interrupt Flag register
   TIFR3 : Unsigned_8;
   for TIFR3'Address use System'To_Address (16#38#);
   TIFR3_TOV3: constant := 1; -- Timer/Counter3 Overflow Flag
   TIFR3_OCF3A: constant := 2; -- Output Compare Flag 3A
   TIFR3_OCF3B: constant := 4; -- Output Compare Flag 3B
   TIFR3_OCF3C: constant := 8; -- Output Compare Flag 3C
   TIFR3_ICF3: constant := 32; -- Input Capture Flag 3

   -- Timer/Counter1 Control Register A
   TCCR1A : Unsigned_8;
   for TCCR1A'Address use System'To_Address (16#80#);
   TCCR1A_WGM10: constant := 1; -- Waveform Generation Mode
   TCCR1A_WGM11: constant := 2; -- Waveform Generation Mode
   TCCR1A_COM1C0: constant := 4; -- Compare Output Mode 1C, bit 0
   TCCR1A_COM1C1: constant := 8; -- Compare Output Mode 1C, bit 1
   TCCR1A_COM1B0: constant := 16; -- Compare Output Mode 1B, bit 0
   TCCR1A_COM1B1: constant := 32; -- Compare Output Mode 1B, bit 1
   TCCR1A_COM1A0: constant := 64; -- Compare Output Mode 1A, bit 0
   TCCR1A_COM1A1: constant := 128; -- Compare Output Mode 1A, bit 1

   -- Timer/Counter1 Control Register B
   TCCR1B : Unsigned_8;
   for TCCR1B'Address use System'To_Address (16#81#);
   TCCR1B_CS10: constant := 1; -- Prescaler source of Timer/Counter 1
   TCCR1B_CS11: constant := 2; -- Prescaler source of Timer/Counter 1
   TCCR1B_CS12: constant := 4; -- Prescaler source of Timer/Counter 1
   TCCR1B_WGM12: constant := 8; -- Waveform Generation Mode
   TCCR1B_WGM13: constant := 16; -- Waveform Generation Mode
   TCCR1B_ICES1: constant := 64; -- Input Capture 1 Edge Select
   TCCR1B_ICNC1: constant := 128; -- Input Capture 1 Noise Canceler

   -- Timer/Counter 1 Control Register C
   TCCR1C : Unsigned_8;
   for TCCR1C'Address use System'To_Address (16#82#);
   TCCR1C_FOC1C: constant := 32; -- Force Output Compare 1C
   TCCR1C_FOC1B: constant := 64; -- Force Output Compare 1B
   TCCR1C_FOC1A: constant := 128; -- Force Output Compare 1A

   -- Timer/Counter1 High Byte
   TCNT1H : Unsigned_8;
   for TCNT1H'Address use System'To_Address (16#85#);
   TCNT1H_TCNT1H0: constant := 1; -- Timer/Counter1 High Byte bit 0
   TCNT1H_TCNT1H1: constant := 2; -- Timer/Counter1 High Byte bit 1
   TCNT1H_TCNT1H2: constant := 4; -- Timer/Counter1 High Byte bit 2
   TCNT1H_TCNT1H3: constant := 8; -- Timer/Counter1 High Byte bit 3
   TCNT1H_TCNT1H4: constant := 16; -- Timer/Counter1 High Byte bit 4
   TCNT1H_TCNT1H5: constant := 32; -- Timer/Counter1 High Byte bit 5
   TCNT1H_TCNT1H6: constant := 64; -- Timer/Counter1 High Byte bit 6
   TCNT1H_TCNT1H7: constant := 128; -- Timer/Counter1 High Byte bit 7

   -- Timer/Counter1 Low Byte
   TCNT1L : Unsigned_8;
   for TCNT1L'Address use System'To_Address (16#84#);
   TCNT1L_TCNT1L0: constant := 1; -- Timer/Counter1 Low Byte bit 0
   TCNT1L_TCNT1L1: constant := 2; -- Timer/Counter1 Low Byte bit 1
   TCNT1L_TCNT1L2: constant := 4; -- Timer/Counter1 Low Byte bit 2
   TCNT1L_TCNT1L3: constant := 8; -- Timer/Counter1 Low Byte bit 3
   TCNT1L_TCNT1L4: constant := 16; -- Timer/Counter1 Low Byte bit 4
   TCNT1L_TCNT1L5: constant := 32; -- Timer/Counter1 Low Byte bit 5
   TCNT1L_TCNT1L6: constant := 64; -- Timer/Counter1 Low Byte bit 6
   TCNT1L_TCNT1L7: constant := 128; -- Timer/Counter1 Low Byte bit 7

   -- Timer/Counter1 Outbut Compare Register A High Byte
   OCR1AH : Unsigned_8;
   for OCR1AH'Address use System'To_Address (16#89#);
   OCR1AH_OCR1AH0: constant := 1; -- Timer/Counter1 Outbut Compare Register High Byte bit 0
   OCR1AH_OCR1AH1: constant := 2; -- Timer/Counter1 Outbut Compare Register High Byte bit 1
   OCR1AH_OCR1AH2: constant := 4; -- Timer/Counter1 Outbut Compare Register High Byte bit 2
   OCR1AH_OCR1AH3: constant := 8; -- Timer/Counter1 Outbut Compare Register High Byte bit 3
   OCR1AH_OCR1AH4: constant := 16; -- Timer/Counter1 Outbut Compare Register High Byte bit 4
   OCR1AH_OCR1AH5: constant := 32; -- Timer/Counter1 Outbut Compare Register High Byte bit 5
   OCR1AH_OCR1AH6: constant := 64; -- Timer/Counter1 Outbut Compare Register High Byte bit 6
   OCR1AH_OCR1AH7: constant := 128; -- Timer/Counter1 Outbut Compare Register High Byte bit 7

   -- Timer/Counter1 Outbut Compare Register A Low Byte
   OCR1AL : Unsigned_8;
   for OCR1AL'Address use System'To_Address (16#88#);
   OCR1AL_OCR1AL0: constant := 1; -- Timer/Counter1 Outbut Compare Register Low Byte Bit 0
   OCR1AL_OCR1AL1: constant := 2; -- Timer/Counter1 Outbut Compare Register Low Byte Bit 1
   OCR1AL_OCR1AL2: constant := 4; -- Timer/Counter1 Outbut Compare Register Low Byte Bit 2
   OCR1AL_OCR1AL3: constant := 8; -- Timer/Counter1 Outbut Compare Register Low Byte Bit 3
   OCR1AL_OCR1AL4: constant := 16; -- Timer/Counter1 Outbut Compare Register Low Byte Bit 4
   OCR1AL_OCR1AL5: constant := 32; -- Timer/Counter1 Outbut Compare Register Low Byte Bit 5
   OCR1AL_OCR1AL6: constant := 64; -- Timer/Counter1 Outbut Compare Register Low Byte Bit 6
   OCR1AL_OCR1AL7: constant := 128; -- Timer/Counter1 Outbut Compare Register Low Byte Bit 7

   -- Timer/Counter1 Output Compare Register B High Byte
   OCR1BH : Unsigned_8;
   for OCR1BH'Address use System'To_Address (16#8B#);
   OCR1BH_OCR1BH0: constant := 1; -- Timer/Counter1 Output Compare Register High Byte bit 0
   OCR1BH_OCR1BH1: constant := 2; -- Timer/Counter1 Output Compare Register High Byte bit 1
   OCR1BH_OCR1BH2: constant := 4; -- Timer/Counter1 Output Compare Register High Byte bit 2
   OCR1BH_OCR1BH3: constant := 8; -- Timer/Counter1 Output Compare Register High Byte bit 3
   OCR1BH_OCR1BH4: constant := 16; -- Timer/Counter1 Output Compare Register High Byte bit 4
   OCR1BH_OCR1BH5: constant := 32; -- Timer/Counter1 Output Compare Register High Byte bit 5
   OCR1BH_OCR1BH6: constant := 64; -- Timer/Counter1 Output Compare Register High Byte bit 6
   OCR1BH_OCR1BH7: constant := 128; -- Timer/Counter1 Output Compare Register High Byte bit 7

   -- Timer/Counter1 Output Compare Register B Low Byte
   OCR1BL : Unsigned_8;
   for OCR1BL'Address use System'To_Address (16#8A#);
   OCR1BL_OCR1BL0: constant := 1; -- Timer/Counter1 Output Compare Register Low Byte bit 0
   OCR1BL_OCR1BL1: constant := 2; -- Timer/Counter1 Output Compare Register Low Byte bit 1
   OCR1BL_OCR1BL2: constant := 4; -- Timer/Counter1 Output Compare Register Low Byte bit 2
   OCR1BL_OCR1BL3: constant := 8; -- Timer/Counter1 Output Compare Register Low Byte bit 3
   OCR1BL_OCR1BL4: constant := 16; -- Timer/Counter1 Output Compare Register Low Byte bit 4
   OCR1BL_OCR1BL5: constant := 32; -- Timer/Counter1 Output Compare Register Low Byte bit 5
   OCR1BL_OCR1BL6: constant := 64; -- Timer/Counter1 Output Compare Register Low Byte bit 6
   OCR1BL_OCR1BL7: constant := 128; -- Timer/Counter1 Output Compare Register Low Byte bit 7

   -- Timer/Counter1 Output Compare Register C High Byte
   OCR1CH : Unsigned_8;
   for OCR1CH'Address use System'To_Address (16#8D#);
   OCR1CH_OCR1CH0: constant := 1; -- Timer/Counter1 Output Compare Register High Byte bit 0
   OCR1CH_OCR1CH1: constant := 2; -- Timer/Counter1 Output Compare Register High Byte bit 1
   OCR1CH_OCR1CH2: constant := 4; -- Timer/Counter1 Output Compare Register High Byte bit 2
   OCR1CH_OCR1CH3: constant := 8; -- Timer/Counter1 Output Compare Register High Byte bit 3
   OCR1CH_OCR1CH4: constant := 16; -- Timer/Counter1 Output Compare Register High Byte bit 4
   OCR1CH_OCR1CH5: constant := 32; -- Timer/Counter1 Output Compare Register High Byte bit 5
   OCR1CH_OCR1CH6: constant := 64; -- Timer/Counter1 Output Compare Register High Byte bit 6
   OCR1CH_OCR1CH7: constant := 128; -- Timer/Counter1 Output Compare Register High Byte bit 7

   -- Timer/Counter1 Output Compare Register C Low Byte
   OCR1CL : Unsigned_8;
   for OCR1CL'Address use System'To_Address (16#8C#);
   OCR1CL_OCR1CL0: constant := 1; -- Timer/Counter1 Output Compare Register Low Byte bit 0
   OCR1CL_OCR1CL1: constant := 2; -- Timer/Counter1 Output Compare Register Low Byte bit 1
   OCR1CL_OCR1CL2: constant := 4; -- Timer/Counter1 Output Compare Register Low Byte bit 2
   OCR1CL_OCR1CL3: constant := 8; -- Timer/Counter1 Output Compare Register Low Byte bit 3
   OCR1CL_OCR1CL4: constant := 16; -- Timer/Counter1 Output Compare Register Low Byte bit 4
   OCR1CL_OCR1CL5: constant := 32; -- Timer/Counter1 Output Compare Register Low Byte bit 5
   OCR1CL_OCR1CL6: constant := 64; -- Timer/Counter1 Output Compare Register Low Byte bit 6
   OCR1CL_OCR1CL7: constant := 128; -- Timer/Counter1 Output Compare Register Low Byte bit 7

   -- Timer/Counter1 Input Capture Register High Byte
   ICR1H : Unsigned_8;
   for ICR1H'Address use System'To_Address (16#87#);
   ICR1H_ICR1H0: constant := 1; -- Timer/Counter1 Input Capture Register High Byte bit 0
   ICR1H_ICR1H1: constant := 2; -- Timer/Counter1 Input Capture Register High Byte bit 1
   ICR1H_ICR1H2: constant := 4; -- Timer/Counter1 Input Capture Register High Byte bit 2
   ICR1H_ICR1H3: constant := 8; -- Timer/Counter1 Input Capture Register High Byte bit 3
   ICR1H_ICR1H4: constant := 16; -- Timer/Counter1 Input Capture Register High Byte bit 4
   ICR1H_ICR1H5: constant := 32; -- Timer/Counter1 Input Capture Register High Byte bit 5
   ICR1H_ICR1H6: constant := 64; -- Timer/Counter1 Input Capture Register High Byte bit 6
   ICR1H_ICR1H7: constant := 128; -- Timer/Counter1 Input Capture Register High Byte bit 7

   -- Timer/Counter1 Input Capture Register Low Byte
   ICR1L : Unsigned_8;
   for ICR1L'Address use System'To_Address (16#86#);
   ICR1L_ICR1L0: constant := 1; -- Timer/Counter1 Input Capture Register Low Byte bit 0
   ICR1L_ICR1L1: constant := 2; -- Timer/Counter1 Input Capture Register Low Byte bit 1
   ICR1L_ICR1L2: constant := 4; -- Timer/Counter1 Input Capture Register Low Byte bit 2
   ICR1L_ICR1L3: constant := 8; -- Timer/Counter1 Input Capture Register Low Byte bit 3
   ICR1L_ICR1L4: constant := 16; -- Timer/Counter1 Input Capture Register Low Byte bit 4
   ICR1L_ICR1L5: constant := 32; -- Timer/Counter1 Input Capture Register Low Byte bit 5
   ICR1L_ICR1L6: constant := 64; -- Timer/Counter1 Input Capture Register Low Byte bit 6
   ICR1L_ICR1L7: constant := 128; -- Timer/Counter1 Input Capture Register Low Byte bit 7

   -- Timer/Counter1 Interrupt Mask Register
   TIMSK1 : Unsigned_8;
   for TIMSK1'Address use System'To_Address (16#6F#);
   TIMSK1_TOIE1: constant := 1; -- Timer/Counter1 Overflow Interrupt Enable
   TIMSK1_OCIE1A: constant := 2; -- Timer/Counter1 Output Compare A Match Interrupt Enable
   TIMSK1_OCIE1B: constant := 4; -- Timer/Counter1 Output Compare B Match Interrupt Enable
   TIMSK1_OCIE1C: constant := 8; -- Timer/Counter1 Output Compare C Match Interrupt Enable
   TIMSK1_ICIE1: constant := 32; -- Timer/Counter1 Input Capture Interrupt Enable

   -- Timer/Counter1 Interrupt Flag register
   TIFR1 : Unsigned_8;
   for TIFR1'Address use System'To_Address (16#36#);
   TIFR1_TOV1: constant := 1; -- Timer/Counter1 Overflow Flag
   TIFR1_OCF1A: constant := 2; -- Output Compare Flag 1A
   TIFR1_OCF1B: constant := 4; -- Output Compare Flag 1B
   TIFR1_OCF1C: constant := 8; -- Output Compare Flag 1C
   TIFR1_ICF1: constant := 32; -- Input Capture Flag 1

   -- On-Chip Debug Related Register in I/O Memory
   OCDR : Unsigned_8;
   for OCDR'Address use System'To_Address (16#51#);
   OCDR_OCDR0: constant := 1; -- On-Chip Debug Register Bit 0
   OCDR_OCDR1: constant := 2; -- On-Chip Debug Register Bit 1
   OCDR_OCDR2: constant := 4; -- On-Chip Debug Register Bit 2
   OCDR_OCDR3: constant := 8; -- On-Chip Debug Register Bit 3
   OCDR_OCDR4: constant := 16; -- On-Chip Debug Register Bit 4
   OCDR_OCDR5: constant := 32; -- On-Chip Debug Register Bit 5
   OCDR_OCDR6: constant := 64; -- On-Chip Debug Register Bit 6
   OCDR_OCDR7: constant := 128; -- On-Chip Debug Register Bit 7

   -- MCU Control Register
   MCUCR : Unsigned_8;
   for MCUCR'Address use System'To_Address (16#55#);
   MCUCR_JTD: constant := 128; -- JTAG Interface Disable

   -- MCU Status Register
   MCUSR : Unsigned_8;
   for MCUSR'Address use System'To_Address (16#54#);
   MCUSR_JTRF: constant := 16; -- JTAG Reset Flag

   -- External Interrupt Control Register A
   EICRA : Unsigned_8;
   for EICRA'Address use System'To_Address (16#69#);
   EICRA_ISC00: constant := 1; -- External Interrupt Sense Control Bit
   EICRA_ISC01: constant := 2; -- External Interrupt Sense Control Bit
   EICRA_ISC10: constant := 4; -- External Interrupt Sense Control Bit
   EICRA_ISC11: constant := 8; -- External Interrupt Sense Control Bit
   EICRA_ISC20: constant := 16; -- External Interrupt Sense Control Bit
   EICRA_ISC21: constant := 32; -- External Interrupt Sense Control Bit
   EICRA_ISC30: constant := 64; -- External Interrupt Sense Control Bit
   EICRA_ISC31: constant := 128; -- External Interrupt Sense Control Bit

   -- External Interrupt Control Register B
   EICRB : Unsigned_8;
   for EICRB'Address use System'To_Address (16#6A#);
   EICRB_ISC40: constant := 1; -- External Interrupt 7-4 Sense Control Bit
   EICRB_ISC41: constant := 2; -- External Interrupt 7-4 Sense Control Bit
   EICRB_ISC50: constant := 4; -- External Interrupt 7-4 Sense Control Bit
   EICRB_ISC51: constant := 8; -- External Interrupt 7-4 Sense Control Bit
   EICRB_ISC60: constant := 16; -- External Interrupt 7-4 Sense Control Bit
   EICRB_ISC61: constant := 32; -- External Interrupt 7-4 Sense Control Bit
   EICRB_ISC70: constant := 64; -- External Interrupt 7-4 Sense Control Bit
   EICRB_ISC71: constant := 128; -- External Interrupt 7-4 Sense Control Bit

   -- External Interrupt Mask Register
   EIMSK : Unsigned_8;
   for EIMSK'Address use System'To_Address (16#3D#);
   EIMSK_INT0: constant := 1; -- External Interrupt Request 0 Enable
   EIMSK_INT1: constant := 2; -- External Interrupt Request 1 Enable
   EIMSK_INT2: constant := 4; -- External Interrupt Request 2 Enable
   EIMSK_INT3: constant := 8; -- External Interrupt Request 3 Enable
   EIMSK_INT4: constant := 16; -- External Interrupt Request 4 Enable
   EIMSK_INT5: constant := 32; -- External Interrupt Request 5 Enable
   EIMSK_INT6: constant := 64; -- External Interrupt Request 6 Enable
   EIMSK_INT7: constant := 128; -- External Interrupt Request 7 Enable

   -- External Interrupt Flag Register
   EIFR : Unsigned_8;
   for EIFR'Address use System'To_Address (16#3C#);
   EIFR_INTF0: constant := 1; -- External Interrupt Flag 0
   EIFR_INTF1: constant := 2; -- External Interrupt Flag 1
   EIFR_INTF2: constant := 4; -- External Interrupt Flag 2
   EIFR_INTF3: constant := 8; -- External Interrupt Flag 3
   EIFR_INTF4: constant := 16; -- External Interrupt Flag 4
   EIFR_INTF5: constant := 32; -- External Interrupt Flag 5
   EIFR_INTF6: constant := 64; -- External Interrupt Flag 6
   EIFR_INTF7: constant := 128; -- External Interrupt Flag 7

   -- Pin Change Mask Register 2
   PCMSK2 : Unsigned_8;
   for PCMSK2'Address use System'To_Address (16#6D#);
   PCMSK2_PCINT16: constant := 1; -- Pin Change Enable Mask 16
   PCMSK2_PCINT17: constant := 2; -- Pin Change Enable Mask 17
   PCMSK2_PCINT18: constant := 4; -- Pin Change Enable Mask 18
   PCMSK2_PCINT19: constant := 8; -- Pin Change Enable Mask 19
   PCMSK2_PCINT20: constant := 16; -- Pin Change Enable Mask 20
   PCMSK2_PCINT21: constant := 32; -- Pin Change Enable Mask 21
   PCMSK2_PCINT22: constant := 64; -- Pin Change Enable Mask 22
   PCMSK2_PCINT23: constant := 128; -- Pin Change Enable Mask 23

   -- Pin Change Mask Register 1
   PCMSK1 : Unsigned_8;
   for PCMSK1'Address use System'To_Address (16#6C#);
   PCMSK1_PCINT8: constant := 1; -- Pin Change Enable Mask 8
   PCMSK1_PCINT9: constant := 2; -- Pin Change Enable Mask 9
   PCMSK1_PCINT10: constant := 4; -- Pin Change Enable Mask 10
   PCMSK1_PCINT11: constant := 8; -- Pin Change Enable Mask 11
   PCMSK1_PCINT12: constant := 16; -- Pin Change Enable Mask 12
   PCMSK1_PCINT13: constant := 32; -- Pin Change Enable Mask 13
   PCMSK1_PCINT14: constant := 64; -- Pin Change Enable Mask 14
   PCMSK1_PCINT15: constant := 128; -- Pin Change Enable Mask 15

   -- Pin Change Mask Register 0
   PCMSK0 : Unsigned_8;
   for PCMSK0'Address use System'To_Address (16#6B#);
   PCMSK0_PCINT0: constant := 1; -- Pin Change Enable Mask 0
   PCMSK0_PCINT1: constant := 2; -- Pin Change Enable Mask 1
   PCMSK0_PCINT2: constant := 4; -- Pin Change Enable Mask 2
   PCMSK0_PCINT3: constant := 8; -- Pin Change Enable Mask 3
   PCMSK0_PCINT4: constant := 16; -- Pin Change Enable Mask 4
   PCMSK0_PCINT5: constant := 32; -- Pin Change Enable Mask 5
   PCMSK0_PCINT6: constant := 64; -- Pin Change Enable Mask 6
   PCMSK0_PCINT7: constant := 128; -- Pin Change Enable Mask 7

   -- Pin Change Interrupt Flag Register
   PCIFR : Unsigned_8;
   for PCIFR'Address use System'To_Address (16#3B#);
   PCIFR_PCIF0: constant := 1; -- Pin Change Interrupt Flag 0
   PCIFR_PCIF1: constant := 2; -- Pin Change Interrupt Flag 1
   PCIFR_PCIF2: constant := 4; -- Pin Change Interrupt Flag 2

   -- Pin Change Interrupt Control Register
   PCICR : Unsigned_8;
   for PCICR'Address use System'To_Address (16#68#);
   PCICR_PCIE0: constant := 1; -- Pin Change Interrupt Enable 0
   PCICR_PCIE1: constant := 2; -- Pin Change Interrupt Enable 1
   PCICR_PCIE2: constant := 4; -- Pin Change Interrupt Enable 2

   -- Status Register
   SREG : Unsigned_8;
   for SREG'Address use System'To_Address (16#5F#);
   SREG_C: constant := 1; -- Carry Flag
   SREG_Z: constant := 2; -- Zero Flag
   SREG_N: constant := 4; -- Negative Flag
   SREG_V: constant := 8; -- Two's Complement Overflow Flag
   SREG_S: constant := 16; -- Sign Bit
   SREG_H: constant := 32; -- Half Carry Flag
   SREG_T: constant := 64; -- Bit Copy Storage
   SREG_I: constant := 128; -- Global Interrupt Enable

   -- Stack Pointer High
   SPH : Unsigned_8;
   for SPH'Address use System'To_Address (16#5E#);
   SPH_SP8: constant := 1; -- Stack pointer bit 8
   SPH_SP9: constant := 2; -- Stack pointer bit 9
   SPH_SP10: constant := 4; -- Stack pointer bit 10
   SPH_SP11: constant := 8; -- Stack pointer bit 11
   SPH_SP12: constant := 16; -- Stack pointer bit 12
   SPH_SP13: constant := 32; -- Stack pointer bit 13
   SPH_SP14: constant := 64; -- Stack pointer bit 14
   SPH_SP15: constant := 128; -- Stack pointer bit 15

   -- Stack Pointer Low
   SPL : Unsigned_8;
   for SPL'Address use System'To_Address (16#5D#);
   SPL_SP0: constant := 1; -- Stack pointer bit 0
   SPL_SP1: constant := 2; -- Stack pointer bit 1
   SPL_SP2: constant := 4; -- Stack pointer bit 2
   SPL_SP3: constant := 8; -- Stack pointer bit 3
   SPL_SP4: constant := 16; -- Stack pointer bit 4
   SPL_SP5: constant := 32; -- Stack pointer bit 5
   SPL_SP6: constant := 64; -- Stack pointer bit 6
   SPL_SP7: constant := 128; -- Stack pointer bit 7

   -- MCU Control Register

   -- MCU Status Register

   -- External Memory Control Register A
   XMCRA : Unsigned_8;
   for XMCRA'Address use System'To_Address (16#74#);
   XMCRA_SRW00: constant := 1; -- Wait state select bit lower page
   XMCRA_SRW01: constant := 2; -- Wait state select bit lower page
   XMCRA_SRW10: constant := 4; -- Wait state select bit upper page
   XMCRA_SRW11: constant := 8; -- Wait state select bit upper page
   XMCRA_SRL0: constant := 16; -- Wait state page limit
   XMCRA_SRL1: constant := 32; -- Wait state page limit
   XMCRA_SRL2: constant := 64; -- Wait state page limit
   XMCRA_SRE: constant := 128; -- External SRAM Enable

   -- External Memory Control Register B
   XMCRB : Unsigned_8;
   for XMCRB'Address use System'To_Address (16#75#);
   XMCRB_XMM0: constant := 1; -- External Memory High Mask
   XMCRB_XMM1: constant := 2; -- External Memory High Mask
   XMCRB_XMM2: constant := 4; -- External Memory High Mask
   XMCRB_XMBK: constant := 128; -- External Memory Bus Keeper Enable

   -- Oscillator Calibration Value
   OSCCAL : Unsigned_8;
   for OSCCAL'Address use System'To_Address (16#66#);
   OSCCAL_CAL0: constant := 1; -- Oscillator Calibration Value Bit0
   OSCCAL_CAL1: constant := 2; -- Oscillator Calibration Value Bit1
   OSCCAL_CAL2: constant := 4; -- Oscillator Calibration Value Bit2
   OSCCAL_CAL3: constant := 8; -- Oscillator Calibration Value Bit3
   OSCCAL_CAL4: constant := 16; -- Oscillator Calibration Value Bit4
   OSCCAL_CAL5: constant := 32; -- Oscillator Calibration Value Bit5
   OSCCAL_CAL6: constant := 64; -- Oscillator Calibration Value Bit6
   OSCCAL_CAL7: constant := 128; -- Oscillator Calibration Value Bit7

   CLKPR : Unsigned_8;
   for CLKPR'Address use System'To_Address (16#61#);
   CLKPR_CLKPS0: constant := 1;
   CLKPR_CLKPS1: constant := 2;
   CLKPR_CLKPS2: constant := 4;
   CLKPR_CLKPS3: constant := 8;
   CLKPR_CLKPCE: constant := 128;

   -- Sleep Mode Control Register
   SMCR : Unsigned_8;
   for SMCR'Address use System'To_Address (16#53#);
   SMCR_SE: constant := 1; -- Sleep Enable
   SMCR_SM0: constant := 2; -- Sleep Mode Select bit 0
   SMCR_SM1: constant := 4; -- Sleep Mode Select bit 1
   SMCR_SM2: constant := 8; -- Sleep Mode Select bit 2

   -- Extended Indirect Register
   EIND : Unsigned_8;
   for EIND'Address use System'To_Address (16#5C#);
   EIND_EIND0: constant := 1; -- Bit 0

   -- RAM Page Z Select Register
   RAMPZ : Unsigned_8;
   for RAMPZ'Address use System'To_Address (16#5B#);
   RAMPZ_RAMPZ0: constant := 1; -- RAM Page Z Select Register Bit 0
   RAMPZ_RAMPZ1: constant := 2; -- RAM Page Z Select Register Bit 1

   -- General Purpose IO Register 2
   GPIOR2 : Unsigned_8;
   for GPIOR2'Address use System'To_Address (16#4B#);
   GPIOR2_GPIOR20: constant := 1; -- General Purpose IO Register 2 bit 0
   GPIOR2_GPIOR21: constant := 2; -- General Purpose IO Register 2 bit 1
   GPIOR2_GPIOR22: constant := 4; -- General Purpose IO Register 2 bit 2
   GPIOR2_GPIOR23: constant := 8; -- General Purpose IO Register 2 bit 3
   GPIOR2_GPIOR24: constant := 16; -- General Purpose IO Register 2 bit 4
   GPIOR2_GPIOR25: constant := 32; -- General Purpose IO Register 2 bit 5
   GPIOR2_GPIOR26: constant := 64; -- General Purpose IO Register 2 bit 6
   GPIOR2_GPIOR27: constant := 128; -- General Purpose IO Register 2 bit 7

   -- General Purpose IO Register 1
   GPIOR1 : Unsigned_8;
   for GPIOR1'Address use System'To_Address (16#4A#);
   GPIOR1_GPIOR10: constant := 1; -- General Purpose IO Register 1 bit 0
   GPIOR1_GPIOR11: constant := 2; -- General Purpose IO Register 1 bit 1
   GPIOR1_GPIOR12: constant := 4; -- General Purpose IO Register 1 bit 2
   GPIOR1_GPIOR13: constant := 8; -- General Purpose IO Register 1 bit 3
   GPIOR1_GPIOR14: constant := 16; -- General Purpose IO Register 1 bit 4
   GPIOR1_GPIOR15: constant := 32; -- General Purpose IO Register 1 bit 5
   GPIOR1_GPIOR16: constant := 64; -- General Purpose IO Register 1 bit 6
   GPIOR1_GPIOR17: constant := 128; -- General Purpose IO Register 1 bit 7

   -- General Purpose IO Register 0
   GPIOR0 : Unsigned_8;
   for GPIOR0'Address use System'To_Address (16#3E#);
   GPIOR0_GPIOR00: constant := 1; -- General Purpose IO Register 0 bit 0
   GPIOR0_GPIOR01: constant := 2; -- General Purpose IO Register 0 bit 1
   GPIOR0_GPIOR02: constant := 4; -- General Purpose IO Register 0 bit 2
   GPIOR0_GPIOR03: constant := 8; -- General Purpose IO Register 0 bit 3
   GPIOR0_GPIOR04: constant := 16; -- General Purpose IO Register 0 bit 4
   GPIOR0_GPIOR05: constant := 32; -- General Purpose IO Register 0 bit 5
   GPIOR0_GPIOR06: constant := 64; -- General Purpose IO Register 0 bit 6
   GPIOR0_GPIOR07: constant := 128; -- General Purpose IO Register 0 bit 7

   -- Power Reduction Register1
   PRR1 : Unsigned_8;
   for PRR1'Address use System'To_Address (16#65#);
   PRR1_PRUSART1: constant := 1; -- Power Reduction USART1
   PRR1_PRUSART2: constant := 2; -- Power Reduction USART2
   PRR1_PRUSART3: constant := 4; -- Power Reduction USART3
   PRR1_PRTIM3: constant := 8; -- Power Reduction Timer/Counter3
   PRR1_PRTIM4: constant := 16; -- Power Reduction Timer/Counter4
   PRR1_PRTIM5: constant := 32; -- Power Reduction Timer/Counter5

   -- Power Reduction Register0
   PRR0 : Unsigned_8;
   for PRR0'Address use System'To_Address (16#64#);
   PRR0_PRADC: constant := 1; -- Power Reduction ADC
   PRR0_PRUSART0: constant := 2; -- Power Reduction USART
   PRR0_PRSPI: constant := 4; -- Power Reduction Serial Peripheral Interface
   PRR0_PRTIM1: constant := 8; -- Power Reduction Timer/Counter1
   PRR0_PRTIM0: constant := 32; -- Power Reduction Timer/Counter0
   PRR0_PRTIM2: constant := 64; -- Power Reduction Timer/Counter2
   PRR0_PRTWI: constant := 128; -- Power Reduction TWI

   -- The ADC multiplexer Selection Register
   ADMUX : Unsigned_8;
   for ADMUX'Address use System'To_Address (16#7C#);
   ADMUX_MUX0: constant := 1; -- Analog Channel and Gain Selection Bits
   ADMUX_MUX1: constant := 2; -- Analog Channel and Gain Selection Bits
   ADMUX_MUX2: constant := 4; -- Analog Channel and Gain Selection Bits
   ADMUX_MUX3: constant := 8; -- Analog Channel and Gain Selection Bits
   ADMUX_MUX4: constant := 16; -- Analog Channel and Gain Selection Bits
   ADMUX_ADLAR: constant := 32; -- Left Adjust Result
   ADMUX_REFS0: constant := 64; -- Reference Selection Bit 0
   ADMUX_REFS1: constant := 128; -- Reference Selection Bit 1

   -- ADC Data Register High Byte
   ADCH : Unsigned_8;
   for ADCH'Address use System'To_Address (16#79#);
   ADCH_ADCH0: constant := 1; -- ADC Data Register High Byte Bit 0
   ADCH_ADCH1: constant := 2; -- ADC Data Register High Byte Bit 1
   ADCH_ADCH2: constant := 4; -- ADC Data Register High Byte Bit 2
   ADCH_ADCH3: constant := 8; -- ADC Data Register High Byte Bit 3
   ADCH_ADCH4: constant := 16; -- ADC Data Register High Byte Bit 4
   ADCH_ADCH5: constant := 32; -- ADC Data Register High Byte Bit 5
   ADCH_ADCH6: constant := 64; -- ADC Data Register High Byte Bit 6
   ADCH_ADCH7: constant := 128; -- ADC Data Register High Byte Bit 7

   -- ADC Data Register Low Byte
   ADCL : Unsigned_8;
   for ADCL'Address use System'To_Address (16#78#);
   ADCL_ADCL0: constant := 1; -- ADC Data Register Low Byte Bit 0
   ADCL_ADCL1: constant := 2; -- ADC Data Register Low Byte Bit 1
   ADCL_ADCL2: constant := 4; -- ADC Data Register Low Byte Bit 2
   ADCL_ADCL3: constant := 8; -- ADC Data Register Low Byte Bit 3
   ADCL_ADCL4: constant := 16; -- ADC Data Register Low Byte Bit 4
   ADCL_ADCL5: constant := 32; -- ADC Data Register Low Byte Bit 5
   ADCL_ADCL6: constant := 64; -- ADC Data Register Low Byte Bit 6
   ADCL_ADCL7: constant := 128; -- ADC Data Register Low Byte Bit 7

   -- The ADC Control and Status register A
   ADCSRA : Unsigned_8;
   for ADCSRA'Address use System'To_Address (16#7A#);
   ADCSRA_ADPS0: constant := 1; -- ADC  Prescaler Select Bits
   ADCSRA_ADPS1: constant := 2; -- ADC  Prescaler Select Bits
   ADCSRA_ADPS2: constant := 4; -- ADC  Prescaler Select Bits
   ADCSRA_ADIE: constant := 8; -- ADC Interrupt Enable
   ADCSRA_ADIF: constant := 16; -- ADC Interrupt Flag
   ADCSRA_ADATE: constant := 32; -- ADC  Auto Trigger Enable
   ADCSRA_ADSC: constant := 64; -- ADC Start Conversion
   ADCSRA_ADEN: constant := 128; -- ADC Enable

   -- The ADC Control and Status register B

   -- Digital Input Disable Register
   DIDR2 : Unsigned_8;
   for DIDR2'Address use System'To_Address (16#7D#);
   DIDR2_ADC8D: constant := 1;
   DIDR2_ADC9D: constant := 2;
   DIDR2_ADC10D: constant := 4;
   DIDR2_ADC11D: constant := 8;
   DIDR2_ADC12D: constant := 16;
   DIDR2_ADC13D: constant := 32;
   DIDR2_ADC14D: constant := 64;
   DIDR2_ADC15D: constant := 128;

   -- Digital Input Disable Register
   DIDR0 : Unsigned_8;
   for DIDR0'Address use System'To_Address (16#7E#);
   DIDR0_ADC0D: constant := 1;
   DIDR0_ADC1D: constant := 2;
   DIDR0_ADC2D: constant := 4;
   DIDR0_ADC3D: constant := 8;
   DIDR0_ADC4D: constant := 16;
   DIDR0_ADC5D: constant := 32;
   DIDR0_ADC6D: constant := 64;
   DIDR0_ADC7D: constant := 128;

   -- Store Program Memory Control Register
   SPMCSR : Unsigned_8;
   for SPMCSR'Address use System'To_Address (16#57#);
   SPMCSR_SPMEN: constant := 1; -- Store Program Memory Enable
   SPMCSR_PGERS: constant := 2; -- Page Erase
   SPMCSR_PGWRT: constant := 4; -- Page Write
   SPMCSR_BLBSET: constant := 8; -- Boot Lock Bit Set
   SPMCSR_RWWSRE: constant := 16; -- Read While Write section read enable
   SPMCSR_SIGRD: constant := 32; -- Signature Row Read
   SPMCSR_RWWSB: constant := 64; -- Read While Write Section Busy
   SPMCSR_SPMIE: constant := 128; -- SPM Interrupt Enable

   -- USART I/O Data Register
   UDR2 : Unsigned_8;
   for UDR2'Address use System'To_Address (16#D6#);

   -- USART Control and Status Register A
   UCSR2A : Unsigned_8;
   for UCSR2A'Address use System'To_Address (16#D0#);
   UCSR2A_MPCM2: constant := 1; -- Multi-processor Communication Mode
   UCSR2A_U2X2: constant := 2; -- Double the USART transmission speed
   UCSR2A_UPE2: constant := 4; -- Parity Error
   UCSR2A_DOR2: constant := 8; -- Data overRun
   UCSR2A_FE2: constant := 16; -- Framing Error
   UCSR2A_UDRE2: constant := 32; -- USART Data Register Empty
   UCSR2A_TXC2: constant := 64; -- USART Transmitt Complete
   UCSR2A_RXC2: constant := 128; -- USART Receive Complete

   -- USART Control and Status Register B
   UCSR2B : Unsigned_8;
   for UCSR2B'Address use System'To_Address (16#D1#);
   UCSR2B_TXB82: constant := 1; -- Transmit Data Bit 8
   UCSR2B_RXB82: constant := 2; -- Receive Data Bit 8
   UCSR2B_UCSZ22: constant := 4; -- Character Size
   UCSR2B_TXEN2: constant := 8; -- Transmitter Enable
   UCSR2B_RXEN2: constant := 16; -- Receiver Enable
   UCSR2B_UDRIE2: constant := 32; -- USART Data register Empty Interrupt Enable
   UCSR2B_TXCIE2: constant := 64; -- TX Complete Interrupt Enable
   UCSR2B_RXCIE2: constant := 128; -- RX Complete Interrupt Enable

   -- USART Control and Status Register C
   UCSR2C : Unsigned_8;
   for UCSR2C'Address use System'To_Address (16#D2#);
   UCSR2C_UCPOL2: constant := 1; -- Clock Polarity
   UCSR2C_UCSZ20: constant := 2; -- Character Size
   UCSR2C_UCSZ21: constant := 4; -- Character Size
   UCSR2C_USBS2: constant := 8; -- Stop Bit Select
   UCSR2C_UPM20: constant := 16; -- Parity Mode Bit 0
   UCSR2C_UPM21: constant := 32; -- Parity Mode Bit 1
   UCSR2C_UMSEL20: constant := 64; -- USART Mode Select
   UCSR2C_UMSEL21: constant := 128; -- USART Mode Select

   -- USART Baud Rate Register High Byte
   UBRR2H : Unsigned_8;
   for UBRR2H'Address use System'To_Address (16#D5#);
   UBRR2H_UBRR8: constant := 1; -- USART Baud Rate Register bit 8
   UBRR2H_UBRR9: constant := 2; -- USART Baud Rate Register bit 9
   UBRR2H_UBRR10: constant := 4; -- USART Baud Rate Register bit 10
   UBRR2H_UBRR11: constant := 8; -- USART Baud Rate Register bit 11

   -- USART Baud Rate Register Low Byte
   UBRR2L : Unsigned_8;
   for UBRR2L'Address use System'To_Address (16#D4#);
   UBRR2L_UBRR0: constant := 1; -- USART Baud Rate Register bit 0
   UBRR2L_UBRR1: constant := 2; -- USART Baud Rate Register bit 1
   UBRR2L_UBRR2: constant := 4; -- USART Baud Rate Register bit 2
   UBRR2L_UBRR3: constant := 8; -- USART Baud Rate Register bit 3
   UBRR2L_UBRR4: constant := 16; -- USART Baud Rate Register bit 4
   UBRR2L_UBRR5: constant := 32; -- USART Baud Rate Register bit 5
   UBRR2L_UBRR6: constant := 64; -- USART Baud Rate Register bit 6
   UBRR2L_UBRR7: constant := 128; -- USART Baud Rate Register bit 7

   -- USART I/O Data Register
   UDR3 : Unsigned_8;
   for UDR3'Address use System'To_Address (16#136#);

   -- USART Control and Status Register A
   UCSR3A : Unsigned_8;
   for UCSR3A'Address use System'To_Address (16#130#);
   UCSR3A_MPCM3: constant := 1; -- Multi-processor Communication Mode
   UCSR3A_U2X3: constant := 2; -- Double the USART transmission speed
   UCSR3A_UPE3: constant := 4; -- Parity Error
   UCSR3A_DOR3: constant := 8; -- Data overRun
   UCSR3A_FE3: constant := 16; -- Framing Error
   UCSR3A_UDRE3: constant := 32; -- USART Data Register Empty
   UCSR3A_TXC3: constant := 64; -- USART Transmitt Complete
   UCSR3A_RXC3: constant := 128; -- USART Receive Complete

   -- USART Control and Status Register B
   UCSR3B : Unsigned_8;
   for UCSR3B'Address use System'To_Address (16#131#);
   UCSR3B_TXB83: constant := 1; -- Transmit Data Bit 8
   UCSR3B_RXB83: constant := 2; -- Receive Data Bit 8
   UCSR3B_UCSZ32: constant := 4; -- Character Size
   UCSR3B_TXEN3: constant := 8; -- Transmitter Enable
   UCSR3B_RXEN3: constant := 16; -- Receiver Enable
   UCSR3B_UDRIE3: constant := 32; -- USART Data register Empty Interrupt Enable
   UCSR3B_TXCIE3: constant := 64; -- TX Complete Interrupt Enable
   UCSR3B_RXCIE3: constant := 128; -- RX Complete Interrupt Enable

   -- USART Control and Status Register C
   UCSR3C : Unsigned_8;
   for UCSR3C'Address use System'To_Address (16#132#);
   UCSR3C_UCPOL3: constant := 1; -- Clock Polarity
   UCSR3C_UCSZ30: constant := 2; -- Character Size
   UCSR3C_UCSZ31: constant := 4; -- Character Size
   UCSR3C_USBS3: constant := 8; -- Stop Bit Select
   UCSR3C_UPM30: constant := 16; -- Parity Mode Bit 0
   UCSR3C_UPM31: constant := 32; -- Parity Mode Bit 1
   UCSR3C_UMSEL30: constant := 64; -- USART Mode Select
   UCSR3C_UMSEL31: constant := 128; -- USART Mode Select

   -- USART Baud Rate Register High Byte
   UBRR3H : Unsigned_8;
   for UBRR3H'Address use System'To_Address (16#135#);
   UBRR3H_UBRR8: constant := 1; -- USART Baud Rate Register bit 8
   UBRR3H_UBRR9: constant := 2; -- USART Baud Rate Register bit 9
   UBRR3H_UBRR10: constant := 4; -- USART Baud Rate Register bit 10
   UBRR3H_UBRR11: constant := 8; -- USART Baud Rate Register bit 11

   -- USART Baud Rate Register Low Byte
   UBRR3L : Unsigned_8;
   for UBRR3L'Address use System'To_Address (16#134#);
   UBRR3L_UBRR0: constant := 1; -- USART Baud Rate Register bit 0
   UBRR3L_UBRR1: constant := 2; -- USART Baud Rate Register bit 1
   UBRR3L_UBRR2: constant := 4; -- USART Baud Rate Register bit 2
   UBRR3L_UBRR3: constant := 8; -- USART Baud Rate Register bit 3
   UBRR3L_UBRR4: constant := 16; -- USART Baud Rate Register bit 4
   UBRR3L_UBRR5: constant := 32; -- USART Baud Rate Register bit 5
   UBRR3L_UBRR6: constant := 64; -- USART Baud Rate Register bit 6
   UBRR3L_UBRR7: constant := 128; -- USART Baud Rate Register bit 7
end ATmega2560;
