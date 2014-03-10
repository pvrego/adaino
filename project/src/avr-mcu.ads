with System;

-- =============================================================================
-- Package AVR.MCU
--
-- Maps AVR micro-controllers.
-- =============================================================================
package AVR.MCU is

   --+--------------------------------------------------------------------------
   --| Constants
   --+--------------------------------------------------------------------------

   F_CPU : constant := 16_000_000;

   --+--------------------------------------------------------------------------
   --| Mapping Types
   --+--------------------------------------------------------------------------

   type Data_Pin_Type is
      record
         PIN  : Bit_Array_Type (0 .. 7); -- Port Input Pin
         DDR  : Bit_Array_Type (0 .. 7); -- Data Direction Register
         PORT : Bit_Array_Type (0 .. 7); -- Port Data Register
      end record;
   for Data_Pin_Type'Size use 3 * BYTE_SIZE;

   type Timer_Counter_Interrupt_Flag_For_8_Bit_Timer_Type is
      record
         TOV   : Boolean; -- Timer/Counter Overflow Flag
         OCFA  : Boolean; -- Output Compare Flag A
         OCFB  : Boolean; -- Output Compare Flag B
         Spare : Spare_5_Type;
      end record;
   pragma Pack (Timer_Counter_Interrupt_Flag_For_8_Bit_Timer_Type);
   for Timer_Counter_Interrupt_Flag_For_8_Bit_Timer_Type'Size use BYTE_SIZE;

   type Timer_Counter_Interrupt_Flag_For_16_Bit_Timer_Type is
      record
         TOV     : Boolean; -- Timer/Counter Overflow Flag
         OCFA    : Boolean; -- Output Compare Flag A
         OCFB    : Boolean; -- Output Compare Flag B
#if MCU="ATMEGA2560" then
         OCFC    : Boolean; -- Output Compare Flag C
         Spare_1 : Spare_1_Type;
#elsif MCU="ATMEGA328P" then
         Spare_34 : Spare_2_Type;
#end if;
         ICF     : Boolean; -- Timer/Counter Input Capture Flag
         Spare_7 : Spare_2_Type;
      end record;
   pragma Pack (Timer_Counter_Interrupt_Flag_For_16_Bit_Timer_Type);
   for Timer_Counter_Interrupt_Flag_For_16_Bit_Timer_Type'Size use BYTE_SIZE;

   type Eeprom_Control_Register_Type is
      record
         EERE  : Boolean; -- EEPROM Read Enable
         EEPE  : Boolean; -- EEPROM Programming Enable
         EEMPE : Boolean; -- EEPROM Master Programming Enable
         EERIE : Boolean; -- EEPROM Ready Interrupt Enable
         EEPM0 : Boolean; -- EEPROM Programming Mode Bit 0
         EEPM1 : Boolean; -- EEPROM Programming Mode Bit 1
         Spare : Spare_2_Type;
      end record;
   pragma Pack (Eeprom_Control_Register_Type);
   for Eeprom_Control_Register_Type'Size use BYTE_SIZE;

   type General_Timer_Counter_Control_Register_Type is
      record
         PSRSYNC : Boolean; -- Prescaler Reset for Synchronous Timer/Counters
         PSRASY  : Boolean; -- Prescaler Reset Timer/Counter2
         Spare   : Spare_5_Type;
         TSM     : Boolean; -- Timer/Counter Synchronization Mode
      end record;
   pragma Pack (General_Timer_Counter_Control_Register_Type);
   for General_Timer_Counter_Control_Register_Type'Size use BYTE_SIZE;

   type Timer_Counter_Control_Register_A_For_8_Bit_Timer_Type is
      record
         WGM0  : Boolean; -- Waveform Generation Mode Bit 0
         WGM1  : Boolean; -- Waveform Generation Mode Bit 1
         Spare : Spare_2_Type;
         COMB  : Bit_Array_Type (0 .. 1); -- Compare Output Mode Channel B Bits
         COMA  : Bit_Array_Type (0 .. 1); -- Compare Output Mode Channel A Bits
      end record;
   pragma Pack (Timer_Counter_Control_Register_A_For_8_Bit_Timer_Type);
   for Timer_Counter_Control_Register_A_For_8_Bit_Timer_Type'Size use BYTE_SIZE;

   type Timer_Counter_Control_Register_B_For_8_Bit_Timer_Type is
      record
         CS    : Bit_Array_Type (0 .. 2); -- Clock Select Bits
         WGM2  : Boolean; -- Waveform Generation Mode Bit 2
         Spare : Spare_2_Type;
         FOCB  : Boolean; -- Force Output Compare B
         FOCA  : Boolean; -- Force Output Compare A
      end record;
   pragma Pack (Timer_Counter_Control_Register_B_For_8_Bit_Timer_Type);
   for Timer_Counter_Control_Register_B_For_8_Bit_Timer_Type'Size use BYTE_SIZE;

   type Timer_8_Bits_Type is
      record
         TCCRA : Timer_Counter_Control_Register_A_For_8_Bit_Timer_Type;
         TCCRB : Timer_Counter_Control_Register_B_For_8_Bit_Timer_Type;
         TCNT  : Byte_Type; -- Timer/Counter
         OCRA  : Byte_Type; -- Output Compare Register A
         OCRB  : Byte_Type; -- Output Compare Register A
      end record;
   pragma Pack (Timer_8_Bits_Type);
   for Timer_8_Bits_Type'Size use 5 * BYTE_SIZE;

   type Timer_Counter_Control_Register_A_For_16_Bit_Timer_Type is
      record
         WGM0 : Boolean; -- Waveform Generation Mode Bit 0
         WGM1 : Boolean; -- Waveform Generation Mode Bit 0
#if MCU="ATMEGA2560" then
         COMC : Bit_Array_Type (0 .. 1); -- Compare Output Mode Channel C Bits
#elsif MCU="ATMEGA328P" then
         Spare_23 : Spare_2_Type;
#end if;
         COMB : Bit_Array_Type (0 .. 1); -- Compare Output Mode Channel B Bits
         COMA : Bit_Array_Type (0 .. 1); -- Compare Output Mode Channel A Bits
      end record;
   pragma Pack (Timer_Counter_Control_Register_A_For_16_Bit_Timer_Type);
   for Timer_Counter_Control_Register_A_For_16_Bit_Timer_Type'Size use
     BYTE_SIZE;

   type Timer_Counter_Control_Register_B_For_16_Bit_Timer_Type is
      record
         CS    : Bit_Array_Type (0 .. 2); -- Clock Select Bits
         WGM2  : Boolean; -- Waveform Generation Mode Bit 2
         WGM3  : Boolean; -- Waveform Generation Mode Bit 3
         Spare : Spare_1_Type;
         ICES  : Boolean; -- Input Capture Edge Select
         ICNC  : Boolean; -- Input Capture Noise Canceler
      end record;
   pragma Pack (Timer_Counter_Control_Register_B_For_16_Bit_Timer_Type);
   for Timer_Counter_Control_Register_B_For_16_Bit_Timer_Type'Size use
     BYTE_SIZE;

   type Timer_Counter_Control_Register_C_For_16_Bit_Timer_Type is
      record
#if MCU="ATMEGA2560" then
         Spare : Spare_5_Type;
         FOCC  : Boolean; -- Force Output Compare C
#elsif MCU="ATMEGA328P" then
         Spare : Spare_6_Type;
#end if;
         FOCB  : Boolean; -- Force Output Compare B
         FOCA  : Boolean; -- Force Output Compare A
      end record;
   pragma Pack (Timer_Counter_Control_Register_C_For_16_Bit_Timer_Type);
   for Timer_Counter_Control_Register_C_For_16_Bit_Timer_Type'Size use
     BYTE_SIZE;

   type Timer_16_Bits_Type is
      record
         TCCRA : Timer_Counter_Control_Register_A_For_16_Bit_Timer_Type;
         TCCRB : Timer_Counter_Control_Register_B_For_16_Bit_Timer_Type;
         TCCRC : Timer_Counter_Control_Register_C_For_16_Bit_Timer_Type;
         Spare : Spare_Byte_Type;
         TCNT  : Byte_Array_Type (0 .. 1); -- Timer/Counter
         ICR   : Byte_Array_Type (0 .. 1); -- Input Capture Register
         OCRA  : Byte_Array_Type (0 .. 1); -- Output Compare Register A
         OCRB  : Byte_Array_Type (0 .. 1); -- Output Compare Register B
#if MCU="ATMEGA2560" then
         OCRC  : Byte_Array_Type (0 .. 1); -- Output Compare Register C
#end if;
      end record;
   pragma Pack (Timer_16_Bits_Type);
#if MCU="ATMEGA2560" then
   for Timer_16_Bits_Type'Size use 14 * BYTE_SIZE;
#elsif MCU="ATMEGA328P" then
   for Timer_16_Bits_Type'Size use 12 * BYTE_SIZE;
#end if;
   type SPI_Control_Register_Type is
      record
         SPR0 : Boolean;
         SPR1 : Boolean;
         CPHA : Boolean;
         CPOL : Boolean;
         MSTR : Boolean;
         DORD : Boolean;
         SPE  : Boolean;
         SPIE : Boolean;
      end record;
   pragma Pack (SPI_Control_Register_Type);
   for SPI_Control_Register_Type'Size use BYTE_SIZE;

   type SPI_Status_Register_Type is
      record
         SPI2X : Boolean;
         Spare : Spare_5_Type;
         WCOL  : Boolean;
         SPIF  : Boolean;
      end record;
   pragma Pack (SPI_Status_Register_Type);
   for SPI_Status_Register_Type'Size use BYTE_SIZE;

   type Analog_Comparator_Control_And_Status_Register_Type is
      record
         ACIS0 : Boolean; -- Analog Comparator Interrupt Mode Select Bit 0
         ACIS1 : Boolean; -- Analog Comparator Interrupt Mode Select Bit 1
         ACIC  : Boolean; -- Analog Comparator Input Capture Enable
         ACIE  : Boolean; -- Analog Comparator Interrupt Enable
         ACI   : Boolean; -- Analog Comparator Interrupt Flag
         ACO   : Boolean; -- Analog Comparator Output
         ACBG  : Boolean; -- Analog Comparator Bandgap Select
         ACD   : Boolean; -- Analog Comparator Disable
      end record;
   pragma Pack (Analog_Comparator_Control_And_Status_Register_Type);
   for Analog_Comparator_Control_And_Status_Register_Type'Size use BYTE_SIZE;

#if MCU="ATMEGA2560" then
   type On_Chip_Debug_Register_Type is
      record
         LSB      : Boolean;
         Spare    : Spare_6_Type;
         MSB_IDRD : Boolean;
      end record;
   pragma Pack (On_Chip_Debug_Register_Type);
   for On_Chip_Debug_Register_Type'Size use BYTE_SIZE;
#end if;

   type Sleep_Mode_Control_Register_Type is
      record
         SE    : Boolean; -- Sleep Enable
         SM0   : Boolean; -- Sleep Mode Select Bit 0
         SM1   : Boolean; -- Sleep Mode Select Bit 1
         SM2   : Boolean; -- Sleep Mode Select Bit 2
         Spare : Spare_4_Type;
      end record;
   pragma Pack (Sleep_Mode_Control_Register_Type);
   for Sleep_Mode_Control_Register_Type'Size use BYTE_SIZE;

   type MCU_Status_Register_Type is
      record
         PORF  : Boolean; -- Power-on Reset Flag
         EXTRF : Boolean; -- External Reset Flag
         BORF  : Boolean; -- Brown-out Reset Flag
         WDRF  : Boolean; -- Watchdog Reset Flag
#if MCU="ATMEGA2560" then
         JTRF  : Boolean; -- JTAG Reset Flag
         Spare : Spare_3_Type;
#elsif MCU="ATMEGA328P" then
         Spare : Spare_4_Type;
#end if;
      end record;
   pragma Pack (MCU_Status_Register_Type);
   for MCU_Status_Register_Type'Size use BYTE_SIZE;

   type MCU_Control_Register_Type is
      record
         IVCE     : Boolean; -- Interrupt Vector Select;
         IVSEL    : Boolean; -- Interrupt Vector Change Enable
         Spare_23 : Spare_2_Type;
         PUD      : Boolean; -- Pull-up Disable
#if MCU="ATMEGA2560" then
         Spare_56 : Spare_2_Type;
         JTD      : Boolean; -- JTAG Interface Disable
#elsif MCU="ATMEGA328P" then
         BODSE    : Boolean; -- BOD Sleep Enable
         BODS     : Boolean; -- BOD Sleep
#end if;
      end record;
   pragma Pack (MCU_Control_Register_Type);
   for MCU_Control_Register_Type'Size use BYTE_SIZE;

   type Store_Program_Memory_Control_And_Status_Register_Type is
      record
         SPMEN  : Boolean; -- Store Program Memory Enable
         PGERS  : Boolean; -- Page Erase
         PGWRT  : Boolean; -- Page Write
         BLBSET : Boolean; -- Boot Lock Bit Set
         RWWSRE : Boolean; -- Read-While-Write Section Read Enable
         SIGRD  : Boolean; -- Signature Row Read
         RWWSB  : Boolean; -- Read-While-Write Section Busy
         SPMIE  : Boolean; -- SPM Interrupt Enable
      end record;
   pragma Pack (Store_Program_Memory_Control_And_Status_Register_Type);
   for Store_Program_Memory_Control_And_Status_Register_Type'Size use BYTE_SIZE;

   type AVR_Status_Register_Type is
      record
         C : Boolean; -- Carry Flag
         Z : Boolean; -- Zero Flag
         N : Boolean; -- Negative Flag
         V : Boolean; -- Two's Complement Overflow Flag
         S : Boolean; -- Sign Bit, S = N xor V
         H : Boolean; -- Half Carry Flag
         T : Boolean; -- Bit Copy Storage
         I : Boolean; -- Global Interrupt Enable
      end record;
   pragma Pack (AVR_Status_Register_Type);
   for AVR_Status_Register_Type'Size use BYTE_SIZE;

   type Watchdog_Timer_Control_Register_Type is
      record
         WPD0 : Boolean; -- Watchdog Timer Prescaler Bit 0
         WPD1 : Boolean; -- Watchdog Timer Prescaler Bit 1
         WPD2 : Boolean; -- Watchdog Timer Prescaler Bit 2
         WDE  : Boolean; -- Watchdog System Reset Enable
         WDCE : Boolean; -- Watchdog Change Enable
         WDP3 : Boolean; -- Watchdog Timer Prescaler Bit 3
         WDIE : Boolean; -- Watchdog Interrupt Enable
         WDIF : Boolean; -- Watchdog Interrupt Flag
      end record;
   pragma Pack (Watchdog_Timer_Control_Register_Type);
   for Watchdog_Timer_Control_Register_Type'Size use BYTE_SIZE;

   type Power_Reduction_Register_0_Type is
      record
         PRADC    : Boolean; -- Power Reduction ADC
         PRUSART0 : Boolean; -- Power Reduction USART0
         PRSPI    : Boolean; -- Power Reduction Serial Peripheral Interface
         PRTIM1   : Boolean; -- Power Reduction Timer/Counter 1
         Spare    : Spare_1_Type;
         PRTIM0   : Boolean; -- Power Reduction Timer/Counter 0
         PRTIM2   : Boolean; -- Power Reduction Timer/Counter 2
         PRTWI    : Boolean; -- Power Reduction TWI
      end record;
   pragma Pack (Power_Reduction_Register_0_Type);
   for Power_Reduction_Register_0_Type'Size use BYTE_SIZE;

#if MCU="ATMEGA2560" then
   type Power_Reduction_Register_1_Type is
      record
         PRUSART1 : Boolean; -- Power Reduction USART 1
         PRUSART2 : Boolean; -- Power Reduction USART 2
         PRUSART3 : Boolean; -- Power Reduction USART 3
         PRTIM3   : Boolean; -- Power Reductin Timer/Counter 3
         PRTIM4   : Boolean; -- Power Reductin Timer/Counter 4
         PRTIM5   : Boolean; -- Power Reductin Timer/Counter 5
         Spare    : Spare_2_Type;
      end record;
   pragma Pack (Power_Reduction_Register_1_Type);
   for Power_Reduction_Register_1_Type'Size use BYTE_SIZE;
#end if;

   type Clock_Prescale_Register_Type is
      record
         CLKPS  : Bit_Array_Type (0 .. 3); -- Clock Prescaler Select Bits
         Spare  : Spare_3_Type;
         CLKPCE : Boolean; -- Clock Prescaler Change Enable
      end record;
   pragma Pack (Clock_Prescale_Register_Type);
   for Clock_Prescale_Register_Type'Size use BYTE_SIZE;

   type External_Interrupt_Control_Type is
     array (0 .. 7) of Bit_Array_Type (0 .. 1);
   pragma Pack (External_Interrupt_Control_Type);
   for External_Interrupt_Control_Type'Size use 2 * BYTE_SIZE;

   type Timer_Counter_Interrupt_Mask_For_8_Bit_Timer_Type is
      record
         TOIE  : Boolean; -- Timer/Counter Overflow Interrupt Enable
         OCIEA : Boolean; -- Timer/Counter Output Compare Match A Interrupt Enable
         OCIEB : Boolean; -- Timer/Counter Output Compare Match B Interrupt Enable
         Spare : Spare_5_Type;
      end record;
   pragma Pack (Timer_Counter_Interrupt_Mask_For_8_Bit_Timer_Type);
   for Timer_Counter_Interrupt_Mask_For_8_Bit_Timer_Type'Size use
     BYTE_SIZE;

   type Timer_Counter_Interrupt_Mask_For_16_Bit_Timer_Type is
      record
         TOIE     : Boolean; -- Timer/Counter Overflow Interrupt Enable
         OCIEA    : Boolean; -- Timer/Counter Output Compare Match A Interrupt Enable
         OCIEB    : Boolean; -- Timer/Counter Output Compare Match B Interrupt Enable
#if MCU="ATMEGA2560" then
         OCIEC    : Boolean; -- Timer/Counter Output Compare Match C Interrupt Enable
         Spare_4  : Spare_1_Type;
#elsif MCU="ATMEGA328P" then
         Spare_34 : Spare_2_Type;
#end if;
         ICIE     : Boolean; -- Timer/Counter Input Capture Interrupt Enable
         Spare_67 : Spare_2_Type;
      end record;
   pragma Pack (Timer_Counter_Interrupt_Mask_For_16_Bit_Timer_Type);
   for Timer_Counter_Interrupt_Mask_For_16_Bit_Timer_Type'Size use
     BYTE_SIZE;

#if MCU="ATMEGA2560" then
   type External_Memory_Control_A_Type is
      record
         SRWL : Bit_Array_Type (0 .. 1); -- Wait-state Select Bits for Lower Sector
         SRWH : Bit_Array_Type (0 .. 1); -- Wait-state Select Bits for Upper Sector
         SRL0 : Bit_Array_Type (0 .. 2); -- Wait-state Sector Limit Bits
         SRE  : Boolean; -- External SRAM/XMEM Enable
      end record;
   pragma Pack (External_Memory_Control_A_Type);
   for External_Memory_Control_A_Type'Size use BYTE_SIZE;

   type External_Memory_Control_B_Type is
      record
         XMM   : Bit_Array_Type (0 .. 2); -- External Memory High Mask Bits
         Spare : Spare_4_Type;
         XMBK  : Boolean; -- External Memory Bus-keeper Enable
      end record;
   pragma Pack (External_Memory_Control_B_Type);
   for External_Memory_Control_B_Type'Size use BYTE_SIZE;
#end if;

   type ADC_Control_And_Status_Register_A_Type is
      record
         ADPS  : Bit_Array_Type (0 .. 2); -- ADC Prescaler Select Bits
         ADIE  : Boolean; -- ADC Interrupt Enable
         ADIF  : Boolean; -- ADC Interrupt Flag
         ADATE : Boolean; -- ADC Auto Trigger Enable
         ADSC  : Boolean; -- ADC Start Conversion
         ADEN  : Boolean; -- ADC Enable
      end record;
   pragma Pack (ADC_Control_And_Status_Register_A_Type);
   for ADC_Control_And_Status_Register_A_Type'Size use BYTE_SIZE;

   type ADC_Control_And_Status_Register_B_Type is
      record
         ADTS     : Bit_Array_Type (0 .. 2); -- ADC Auto Trigger Source
#if MCU="ATMEGA2560" then
         MUX5     : Boolean; -- Analog Channel and Gain Selection Bit
         Spare_45 : Spare_2_Type;
#elsif MCU="ATMEGA328P" then
         Spare_345 : Spare_3_Type;
#end if;
         ACME     : Boolean; -- Analog Comparator Multiplexer Enable
         Spare_7  : Spare_1_Type;
      end record;
   pragma Pack (ADC_Control_And_Status_Register_B_Type);
   for ADC_Control_And_Status_Register_B_Type'Size use BYTE_SIZE;

   type ADC_Multiplexer_Selection_Register_Type is
      record
#if MCU="ATMEGA2560" then
         MUX   : Bit_Array_Type (0 .. 4); -- Analog Channel and Gain Selection Bits
#elsif MCU="ATMEGA328P" then
         MUX   : Bit_Array_Type (0 .. 3); -- Analog Channel and Gain Selection Bits
         Spare : Spare_1_Type;
#end if;
         ADLAR : Boolean; -- ADC Left Adjust Result
         REFS  : Bit_Array_Type (0 .. 1); -- Reference Selection Bits
      end record;
   pragma Pack (ADC_Multiplexer_Selection_Register_Type);
   for ADC_Multiplexer_Selection_Register_Type'Size use BYTE_SIZE;

   type ADC_Digital_Input_Disable_Register_0_7_Type is new
     Bit_Array_Type (0 .. 7);
   for ADC_Digital_Input_Disable_Register_0_7_Type'Size use BYTE_SIZE;

#if MCU="ATMEGA2560" then
   type ADC_Digital_Input_Disable_Register_8_15_Type is new
     Bit_Array_Type (8 .. 15);
   for ADC_Digital_Input_Disable_Register_8_15_Type'Size use BYTE_SIZE;
#end if;

   type AIN_Digital_Input_Disable_Type is
      record
         AIND : Bit_Array_Type (0 .. 1);
         Spare : Spare_6_Type;
      end record;
   pragma Pack (AIN_Digital_Input_Disable_Type);
   for AIN_Digital_Input_Disable_Type'Size use BYTE_SIZE;

   type Asynchronous_Status_Register_For_Timer2_Type is
      record
         TCR2BUB : Boolean; -- Timer/Counter 2 Control Register Update Busy B
         TCR2AUB : Boolean; -- Timer/Counter 2 Control Register Update Busy A
         OCR2BUB : Boolean; -- Output Compare Register 2 Update Busy B
         OCR2AUB : Boolean; -- Output Compare Register 2 Update Busy A
         TCN2UB  : Boolean; -- Timer/Counter 2 Update Busy
         AS2     : Boolean; -- Asynchronous Timer/Counter 2
         EXCLK   : Boolean; -- Enable External Clock Input
         Spare   : Spare_1_Type;
      end record;
   pragma Pack (Asynchronous_Status_Register_For_Timer2_Type);
   for Asynchronous_Status_Register_For_Timer2_Type'Size use BYTE_SIZE;

   type TWI_Status_Register_Type is
      record
         TWPS  : Bit_Array_Type (0 .. 1); -- TWI Prescaler Bits
         Spare : Spare_1_Type;
         TWS3  : Boolean; -- TWI Status Bit 3
         TWS4  : Boolean; -- TWI Status Bit 4
         TWS5  : Boolean; -- TWI Status Bit 5
         TWS6  : Boolean; -- TWI Status Bit 6
         TWS7  : Boolean; -- TWI Status Bit 7
      end record;
   pragma Pack (TWI_Status_Register_Type);
   for TWI_Status_Register_Type'Size use BYTE_SIZE;

   type TWI_Slave_Address_Register_Type is
      record
         TWGCE : Boolean; -- TWI General Call Recognition Enable Bit
         TWA   : Bit_Array_Type (0 .. 6); -- TWI Slave Address Register
      end record;
   pragma Pack (TWI_Slave_Address_Register_Type);
   for TWI_Slave_Address_Register_Type'Size use BYTE_SIZE;

   type TWI_Control_Register_Type is
      record
         TWIE  : Boolean; -- TWI Interrupt Enable
         Spare : Spare_1_Type;
         TWEN  : Boolean; -- TWI Enable Bit
         TWWC  : Boolean; -- TWI Write Collision Flag
         TWSTO : Boolean; -- TWI Stop Condition Bit
         TWSTA : Boolean; -- TWI Start Condition Bit
         TWEA  : Boolean; -- TWI Enable Acknowledge Bit
         TWINT : Boolean; -- TWI Interrupt Flag
      end record;
   pragma Pack (TWI_Control_Register_Type);
   for TWI_Control_Register_Type'Size use BYTE_SIZE;

   type TWI_Slave_Address_Mask_Register_Type is
      record
         Spare : Spare_1_Type;
         TWAM  : Bit_Array_Type (0 .. 6);
      end record;
   pragma Pack (TWI_Slave_Address_Mask_Register_Type);
   for TWI_Slave_Address_Mask_Register_Type'Size use BYTE_SIZE;

   type TWI_Type is
      record
         TWBR  : Byte_Type; -- TWI Bit Rate Register
         TWSR  : TWI_Status_Register_Type;
         TWAR  : TWI_Slave_Address_Register_Type;
         TWDR  : Byte_Type; -- TWI Data Register
         TWCR  : TWI_Control_Register_Type;
         TWAMR : TWI_Slave_Address_Mask_Register_Type;
      end record;
   pragma Pack (TWI_Type);
   for TWI_Type'Size use 6 * BYTE_SIZE;

   type USART_Control_And_Register_Status_Register_A_Type is
      record
         MPCM : Boolean; -- Multi-processor Communication Mode
         U2X  : Boolean; -- Double the USART Transmission Speed
         UPE  : Boolean; -- USART Parity Error
         DOR  : Boolean; -- Data OverRun
         FE   : Boolean; -- Frame Error
         UDRE : Boolean; -- USART Data Register Empty
         TXC  : Boolean; -- USART Transmit Complete
         RXC  : Boolean; -- USART Receive Complete
      end record;
   pragma Pack (USART_Control_And_Register_Status_Register_A_Type);
   for USART_Control_And_Register_Status_Register_A_Type'Size use
     BYTE_SIZE;

   type USART_Control_And_Register_Status_Register_B_Type is
      record
         TXB8  : Boolean; -- Transmit Data Bit 8
         RXB8  : Boolean; -- Receive Data Bit 8
         UCSZ2 : Boolean; -- Character Size Bit 2
         TXEN  : Boolean; -- Transmitter Enable
         RXEN  : Boolean; -- Receiver Enable
         UDRIE : Boolean; -- USART Data Register Empty Interrupt Flag
         TXCIE : Boolean; -- Tx Complete Interrupt Flag
         RXCIE : Boolean; -- Rx Complete Interrupt Flag
      end record;
   pragma Pack (USART_Control_And_Register_Status_Register_B_Type);
   for USART_Control_And_Register_Status_Register_B_Type'Size use
     BYTE_SIZE;

   type USART_Control_And_Register_Status_Register_C_Type is
      record
         UCPOL : Boolean; -- Clock Polarity
         UCSZ0 : Boolean; -- Character Size Bit 0
         UCSZ1 : Boolean; -- Character Size Bit 1
         USBS  : Boolean; -- Stop Bit Select
         UPM   : Bit_Array_Type (0 .. 1); -- Parity Mode Bits
         UMSEL : Bit_Array_Type (0 .. 1); -- Mode Select
      end record;
   pragma Pack (USART_Control_And_Register_Status_Register_C_Type);
   for USART_Control_And_Register_Status_Register_C_Type'Size use
     BYTE_SIZE;

   type USART_Type is
      record
         UCSRA : USART_Control_And_Register_Status_Register_A_Type;
         UCSRB : USART_Control_And_Register_Status_Register_B_Type;
         UCSRC : USART_Control_And_Register_Status_Register_C_Type;
         Spare : Spare_Byte_Type;
         UBRR  : Byte_Array_Type (0 .. 1); -- USART Baud Rate Register L/H Bytes
         UDR   : Byte_Type; -- USART I/O Data Register
      end record;
   pragma Pack (USART_Type);
   for USART_Type'Size use 7 * BYTE_SIZE;

   --+--------------------------------------------------------------------------
   --| Memory Map
   --| * For ATMEGA2560:
   --|   - Memory data continues until 0x1FF, but from 0x137 until the end it is
   --|     spare so it will not be mapped to save stack.
   --| * For ATMEGA328P:
   --|   - Memory data continues until 0xFF, but from 0xC7 until the end it is
   --|     spare so it will not be mapped to save stack.
   --+--------------------------------------------------------------------------
   type Memory_Map_Type is
      record
#if MCU="ATMEGA2560" then
         Data_Pin_A   : Data_Pin_Type;
#elsif MCU="ATMEGA328P" then
         Spare_0x20X  : Spare_3_Byte_Type;
#end if;
         Data_Pin_B   : Data_Pin_Type;
         Data_Pin_C   : Data_Pin_Type;
         Data_Pin_D   : Data_Pin_Type;
#if MCU="ATMEGA2560" then
         Data_Pin_E   : Data_Pin_Type;
         Data_Pin_F   : Data_Pin_Type;
         Data_Pin_G   : Data_Pin_Type;
#elsif MCU="ATMEGA328P" then
         Spare_0x2CX : Spare_9_Byte_Type;
#end if;
         TIFR0        : Timer_Counter_Interrupt_Flag_For_8_Bit_Timer_Type;
         TIFR1        : Timer_Counter_Interrupt_Flag_For_16_Bit_Timer_Type;
         TIFR2        : Timer_Counter_Interrupt_Flag_For_8_Bit_Timer_Type;
#if MCU="ATMEGA2560" then
         TIFR3        : Timer_Counter_Interrupt_Flag_For_16_Bit_Timer_Type;
         TIFR4        : Timer_Counter_Interrupt_Flag_For_16_Bit_Timer_Type;
         TIFR5        : Timer_Counter_Interrupt_Flag_For_16_Bit_Timer_Type;
#elsif MCU="ATMEGA328P" then
         Spare_0x3AX  : Spare_3_Byte_Type;
#end if;
         PCIFR        : Bit_Array_Type (0 .. 7); -- Pin Change Interrupt Flag
         EIFR         : Bit_Array_Type (0 .. 7); -- External Interrupt Flag
         EIMSK        : Bit_Array_Type (0 .. 7); -- External Interrupt Mask Register
         GPIOR0       : Byte_Type; -- General Purpose I/O Register
         EECR         : Eeprom_Control_Register_Type;
         EEDR         : Byte_Type; -- EEPROM Data Register
         EEAR         : Byte_Array_Type (0 .. 1); -- EEPROM Address Register Word
         GTCCR        : General_Timer_Counter_Control_Register_Type;
         Timer0       : Timer_8_Bits_Type;
         Spare_0x49   : Spare_Byte_Type;
         GPIOR1       : Byte_Type; -- General Purpose I/O Register
         GPIOR2       : Byte_Type; -- General Purpose I/O Register
         SPCR         : SPI_Control_Register_Type;
         SPSR         : SPI_Status_Register_Type;
         SPDR         : Byte_Type; -- SPI Data Register
         Spare_0x4F   : Spare_Byte_Type;
         ACSR         : Analog_Comparator_Control_And_Status_Register_Type;
#if MCU="ATMEGA2560" then
         OCDR         : On_Chip_Debug_Register_Type;
         Spare_0x52   : Spare_Byte_Type;
#elsif MCU="ATMEGA328P" then
         Spare_0x52W : Spare_Word_Type;
#end if;
         SMCR         : Sleep_Mode_Control_Register_Type;
         MCUSR        : MCU_Status_Register_Type;
         MCUCR        : MCU_Control_Register_Type;
         Spare_0x56   : Spare_Byte_Type;
         SPMCSR       : Store_Program_Memory_Control_And_Status_Register_Type;
#if MCU="ATMEGA2560" then
         Spare_0x58X  : Spare_3_Byte_Type;
         RAMPZ        : Bit_Array_Type (0 .. 7); -- Extended Z-pointer Register for ELPM/SPM
         EIND         : Bit_Array_Type (0 .. 7); -- Extended Indirect Register
#elsif MCU="ATMEGA328P" then
         Spare_0x58X  : Spare_5_Byte_Type;
#end if;
         SP           : Byte_Array_Type (0 .. 1); -- Stack Pointer
         SREG         : AVR_Status_Register_Type;
         WDTCSR       : Watchdog_Timer_Control_Register_Type;
         CLKPR        : Clock_Prescale_Register_Type;
         Spare_0x62W  : Spare_Word_Type;
         PRR0         : Power_Reduction_Register_0_Type;
#if MCU="ATMEGA2560" then
         PRR1         : Power_Reduction_Register_1_Type;
#elsif MCU="ATMEGA328P" then
         Spare_0x65   : Spare_Byte_Type;
#end if;
         OSCCAL       : Byte_Type; -- Oscillator Calibration Value
         Spare_0x67   : Spare_Byte_Type;
         PCICR        : Bit_Array_Type (0 .. 7); -- Pin Change Interrupt Control Register
         EICR         : External_Interrupt_Control_Type;
         PCMSK        : Bit_Array_Type (0 .. 23); -- Pin Change Mask
         TIMSK0       : Timer_Counter_Interrupt_Mask_For_8_Bit_Timer_Type;
         TIMSK1       : Timer_Counter_Interrupt_Mask_For_16_Bit_Timer_Type;
         TIMSK2       : Timer_Counter_Interrupt_Mask_For_8_Bit_Timer_Type;
#if MCU="ATMEGA2560" then
         TIMSK3       : Timer_Counter_Interrupt_Mask_For_16_Bit_Timer_Type;
         TIMSK4       : Timer_Counter_Interrupt_Mask_For_16_Bit_Timer_Type;
         TIMSK5       : Timer_Counter_Interrupt_Mask_For_16_Bit_Timer_Type;
         XMCRA        : External_Memory_Control_A_Type;
         XMCRB        : External_Memory_Control_B_Type;
         Spare_0x76W  : Spare_Word_Type;
#elsif MCU="ATMEGA328P" then
         Spare_0x71X : Spare_7_Byte_Type;
#end if;
         ADC          : Byte_Array_Type (0 .. 1); -- ADC Low and High Bytes
         ADCSRA       : ADC_Control_And_Status_Register_A_Type;
         ADCSRB       : ADC_Control_And_Status_Register_B_Type;
         ADMUX        : ADC_Multiplexer_Selection_Register_Type;
#if MCU="ATMEGA2560" then
         DIDR2        : ADC_Digital_Input_Disable_Register_8_15_Type;
#elsif MCU="ATMEGA328P" then
         Spare_0x7D   : Spare_Byte_Type;
#end if;
         DIDR0        : ADC_Digital_Input_Disable_Register_0_7_Type;
         DIDR1        : AIN_Digital_Input_Disable_Type;
         Timer1       : Timer_16_Bits_Type;
#if MCU="ATMEGA2560" then
         Spare_0x8EW  : Spare_Word_Type;
         Timer3       : Timer_16_Bits_Type;
         Spare_0x9EW  : Spare_Word_Type;
         Timer4       : Timer_16_Bits_Type;
         Spare_0xAEW  : Spare_Word_Type;
#elsif MCU="ATMEGA328P" then
         Spare_0x8C   : Spare_36_Byte_Type;
#end if;
         Timer2       : Timer_8_Bits_Type;
         Spare_0xB5   : Spare_Byte_Type;
         ASSR         : Asynchronous_Status_Register_For_Timer2_Type;
         Spare_0xB7   : Spare_Byte_Type;
         TWI          : TWI_Type;
         Spare_0xBEW  : Spare_Word_Type;
         USART0       : USART_Type;
#if MCU="ATMEGA2560" then
         Spare_0xC7   : Spare_Byte_Type;
         USART1       : USART_Type;
         Spare_0xCF   : Spare_Byte_Type;
         USART2       : USART_Type;
         Spare_0xD7X  : Spare_41_Byte_Type;
         Data_Pin_H   : Data_Pin_Type;
         Data_Pin_J   : Data_Pin_Type;
         Data_Pin_K   : Data_Pin_Type;
         Data_Pin_L   : Data_Pin_Type;
         Spare_0x10CX : Spare_20_Byte_Type;
         Timer5       : Timer_16_Bits_Type;
         Spare_0x12EW : Spare_Word_Type;
         USART3       : USART_Type;
#end if;
      end record;
   pragma Pack (Memory_Map_Type);
#if MCU="ATMEGA2560" then
   for Memory_Map_Type'Size use (16#136# - 16#20# + 16#1#) * BYTE_SIZE;
#elsif MCU="ATMEGA328P" then
   for Memory_Map_Type'Size use (16#C6# - 16#20# + 16#1#) * BYTE_SIZE;
#end if;

   -- Instance of chip memory map
   Memory_Map : Memory_Map_Type;
   for Memory_Map'Address use System'To_Address (16#20#);

   --+--------------------------------------------------------------------------
   --| Conversion Services
   --+--------------------------------------------------------------------------

   function To_Byte is new Unchecked_Conversion
     (Source => TWI_Status_Register_Type,
      Target => Byte_Type);

end AVR.MCU;
