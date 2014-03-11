with Unchecked_Conversion;
with System;

-- =============================================================================
-- Package AVR.TIMERS
--
-- Implements timers configurations for the MCU micro-controller.
-- =============================================================================
package AVR.TIMERS is

   --
   type General_Timer_Counter_Control_Register_Type is
      record
         PSRSYNC : Boolean; -- Prescaler Reset for Synchronous Timer/Counters
         PSRASY  : Boolean; -- Prescaler Reset Timer/Counter2
         Spare   : Spare_Type (0 .. 4);
         TSM     : Boolean; -- Timer/Counter Synchronization Mode
      end record;
   pragma Pack (General_Timer_Counter_Control_Register_Type);
   for General_Timer_Counter_Control_Register_Type'Size use BYTE_SIZE;

   Reg_GTCCR : General_Timer_Counter_Control_Register_Type;
   for Reg_GTCCR'Address use System'To_Address (16#43#);

   -- =============================
   -- 8-bit Timer/Counter0 with PWM
   -- =============================

   type Timer_Counter_Control_Register_A_For_8_Bit_Timer_Type is
      record
         WGM0  : Boolean; -- Waveform Generation Mode Bit 0
         WGM1  : Boolean; -- Waveform Generation Mode Bit 1
         Spare : Spare_Type (0 .. 1);
         COMB  : Bit_Array_Type (0 .. 1); -- Compare Output Mode Channel B Bits
         COMA  : Bit_Array_Type (0 .. 1); -- Compare Output Mode Channel A Bits
      end record;
   pragma Pack (Timer_Counter_Control_Register_A_For_8_Bit_Timer_Type);
   for Timer_Counter_Control_Register_A_For_8_Bit_Timer_Type'Size use BYTE_SIZE;

   type Timer_Counter_Control_Register_B_For_8_Bit_Timer_Type is
      record
         CS    : Bit_Array_Type (0 .. 2); -- Clock Select Bits
         WGM2  : Boolean; -- Waveform Generation Mode Bit 2
         Spare : Spare_Type (0 .. 1);
         FOCB  : Boolean; -- Force Output Compare B
         FOCA  : Boolean; -- Force Output Compare A
      end record;
   pragma Pack (Timer_Counter_Control_Register_B_For_8_Bit_Timer_Type);
   for Timer_Counter_Control_Register_B_For_8_Bit_Timer_Type'Size use BYTE_SIZE;

   --
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

   Reg_Timer0 : Timer_8_Bits_Type;
   for Reg_Timer0'Address use System'To_Address (16#44#);

   --
   type Timer_Counter_Interrupt_Mask_For_8_Bit_Timer_Type is
      record
         TOIE  : Boolean; -- Timer/Counter Overflow Interrupt Enable
         OCIEA : Boolean; -- Timer/Counter Output Compare Match A Interrupt Enable
         OCIEB : Boolean; -- Timer/Counter Output Compare Match B Interrupt Enable
         Spare : Spare_Type (0 .. 4);
      end record;
   pragma Pack (Timer_Counter_Interrupt_Mask_For_8_Bit_Timer_Type);
   for Timer_Counter_Interrupt_Mask_For_8_Bit_Timer_Type'Size use BYTE_SIZE;

   Reg_TIMSK0 : Timer_Counter_Interrupt_Mask_For_8_Bit_Timer_Type;
   for Reg_TIMSK0'Address use System'To_Address (16#6E#);

   --
   type Timer_Counter_Interrupt_Flag_For_8_Bit_Timer_Type is
      record
         TOV   : Boolean; -- Timer/Counter Overflow Flag
         OCFA  : Boolean; -- Output Compare Flag A
         OCFB  : Boolean; -- Output Compare Flag B
         Spare : Spare_Type (0 .. 4);
      end record;
   pragma Pack (Timer_Counter_Interrupt_Flag_For_8_Bit_Timer_Type);
   for Timer_Counter_Interrupt_Flag_For_8_Bit_Timer_Type'Size use BYTE_SIZE;

   Reg_TIFR0 : Timer_Counter_Interrupt_Flag_For_8_Bit_Timer_Type;
   for Reg_TIFR0'Address use System'To_Address (16#35#);

   -- =========================================================
   -- 16-bit Timer/Counter0 with (Timer/Counter 1, 3, 4, and 5)
   -- =========================================================

   type Timer_Counter_Control_Register_A_For_16_Bit_Timer_Type is
      record
         WGM0 : Boolean; -- Waveform Generation Mode Bit 0
         WGM1 : Boolean; -- Waveform Generation Mode Bit 0
#if MCU="ATMEGA2560" then
         COMC : Bit_Array_Type (0 .. 1); -- Compare Output Mode Channel C Bits
#elsif MCU="ATMEGA328P" then
         Spare_23 : Spare_Type (0 .. 1);
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
         Spare : Spare_Type (0 .. 0);
         ICES  : Boolean; -- Input Capture Edge Select
         ICNC  : Boolean; -- Input Capture Noise Canceler
      end record;
   pragma Pack (Timer_Counter_Control_Register_B_For_16_Bit_Timer_Type);
   for Timer_Counter_Control_Register_B_For_16_Bit_Timer_Type'Size use
     BYTE_SIZE;

   type Timer_Counter_Control_Register_C_For_16_Bit_Timer_Type is
      record
#if MCU="ATMEGA2560" then
         Spare : Spare_Type (0 .. 4);
         FOCC  : Boolean; -- Force Output Compare C
#elsif MCU="ATMEGA328P" then
         Spare : Spare_Type (0 .. 5);
#end if;
         FOCB  : Boolean; -- Force Output Compare B
         FOCA  : Boolean; -- Force Output Compare A
      end record;
   pragma Pack (Timer_Counter_Control_Register_C_For_16_Bit_Timer_Type);
   for Timer_Counter_Control_Register_C_For_16_Bit_Timer_Type'Size use
     BYTE_SIZE;


   --
   type Timer_16_Bits_Type is
      record
         TCCRA : Timer_Counter_Control_Register_A_For_16_Bit_Timer_Type;
         TCCRB : Timer_Counter_Control_Register_B_For_16_Bit_Timer_Type;
         TCCRC : Timer_Counter_Control_Register_C_For_16_Bit_Timer_Type;
         Spare : Spare_Type (0 .. 7);
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

   Reg_Timer1 : Timer_16_Bits_Type;
   for Reg_Timer1'Address use System'To_Address (16#80#);

   Reg_Timer3 : Timer_16_Bits_Type;
   for Reg_Timer3'Address use System'To_Address (16#90#);

   Reg_Timer4 : Timer_16_Bits_Type;
   for Reg_Timer4'Address use System'To_Address (16#A0#);

   Reg_Timer5 : Timer_16_Bits_Type;
   for Reg_Timer5'Address use System'To_Address (16#120#);

   --
   type Timer_Counter_Interrupt_Mask_For_16_Bit_Timer_Type is
      record
         TOIE     : Boolean; -- Timer/Counter Overflow Interrupt Enable
         OCIEA    : Boolean; -- Timer/Counter Output Compare Match A Interrupt Enable
         OCIEB    : Boolean; -- Timer/Counter Output Compare Match B Interrupt Enable
#if MCU="ATMEGA2560" then
         OCIEC    : Boolean; -- Timer/Counter Output Compare Match C Interrupt Enable
         Spare_4  : Spare_Type (0 .. 0);
#elsif MCU="ATMEGA328P" then
         Spare_34 : Spare_Type (0 .. 1);
#end if;
         ICIE     : Boolean; -- Timer/Counter Input Capture Interrupt Enable
         Spare_67 : Spare_Type (0 .. 1);
      end record;
   pragma Pack (Timer_Counter_Interrupt_Mask_For_16_Bit_Timer_Type);
   for Timer_Counter_Interrupt_Mask_For_16_Bit_Timer_Type'Size use
     BYTE_SIZE;

   Reg_TIMSK1 : Timer_Counter_Interrupt_Mask_For_16_Bit_Timer_Type;
   for Reg_TIMSK1'Address use System'To_Address (16#6F#);

   Reg_TIMSK3 : Timer_Counter_Interrupt_Mask_For_16_Bit_Timer_Type;
   for Reg_TIMSK3'Address use System'To_Address (16#71#);

   Reg_TIMSK4 : Timer_Counter_Interrupt_Mask_For_16_Bit_Timer_Type;
   for Reg_TIMSK4'Address use System'To_Address (16#72#);

   Reg_TIMSK5 : Timer_Counter_Interrupt_Mask_For_16_Bit_Timer_Type;
   for Reg_TIMSK5'Address use System'To_Address (16#73#);

   --
   type Timer_Counter_Interrupt_Flag_For_16_Bit_Timer_Type is
      record
         TOV     : Boolean; -- Timer/Counter Overflow Flag
         OCFA    : Boolean; -- Output Compare Flag A
         OCFB    : Boolean; -- Output Compare Flag B
#if MCU="ATMEGA2560" then
         OCFC    : Boolean; -- Output Compare Flag C
         Spare_1 : Spare_Type (0 .. 0);
#elsif MCU="ATMEGA328P" then
         Spare_34 : Spare_Type (0 .. 1);
#end if;
         ICF     : Boolean; -- Timer/Counter Input Capture Flag
         Spare_7 : Spare_Type (0 .. 1);
      end record;
   pragma Pack (Timer_Counter_Interrupt_Flag_For_16_Bit_Timer_Type);
   for Timer_Counter_Interrupt_Flag_For_16_Bit_Timer_Type'Size use BYTE_SIZE;

   Reg_TIFR1 : Timer_Counter_Interrupt_Flag_For_16_Bit_Timer_Type;
   for Reg_TIFR1'Address use System'To_Address (16#36#);

   Reg_TIFR3 : Timer_Counter_Interrupt_Flag_For_16_Bit_Timer_Type;
   for Reg_TIFR3'Address use System'To_Address (16#36#);

   Reg_TIFR4 : Timer_Counter_Interrupt_Flag_For_16_Bit_Timer_Type;
   for Reg_TIFR4'Address use System'To_Address (16#36#);

   Reg_TIFR5 : Timer_Counter_Interrupt_Flag_For_16_Bit_Timer_Type;
   for Reg_TIFR5'Address use System'To_Address (16#36#);

   -- ========================================================
   -- 8-bit Timer/Counter2 with PWM and Asynchronous Operation
   -- ========================================================

   Reg_Timer2 : Timer_8_Bits_Type;
   for Reg_Timer2'Address use System'To_Address (16#B0#);

   type Asynchronous_Status_Register_For_Timer2_Type is
      record
         TCR2BUB : Boolean; -- Timer/Counter 2 Control Register Update Busy B
         TCR2AUB : Boolean; -- Timer/Counter 2 Control Register Update Busy A
         OCR2BUB : Boolean; -- Output Compare Register 2 Update Busy B
         OCR2AUB : Boolean; -- Output Compare Register 2 Update Busy A
         TCN2UB  : Boolean; -- Timer/Counter 2 Update Busy
         AS2     : Boolean; -- Asynchronous Timer/Counter 2
         EXCLK   : Boolean; -- Enable External Clock Input
         Spare   : Spare_Type (0 .. 0);
      end record;
   pragma Pack (Asynchronous_Status_Register_For_Timer2_Type);
   for Asynchronous_Status_Register_For_Timer2_Type'Size use BYTE_SIZE;

   Reg_Timer2_ASSR : Asynchronous_Status_Register_For_Timer2_Type;
   for Reg_Timer2_ASSR'Address use System'To_Address (16#B6#);

   Reg_Timer2_TIMSK : Timer_Counter_Interrupt_Mask_For_8_Bit_Timer_Type;
   for Reg_Timer2_TIMSK'Address use System'To_Address (16#70#);

   Reg_Timer2_TIFR : Timer_Counter_Interrupt_Flag_For_8_Bit_Timer_Type;
   for Reg_Timer2_TIFR'Address use System'To_Address (16#37#);

#if MCU="ATMEGA2560" then
   type Timer_Type is
     (TIMER0,
      TIMER1,
      TIMER2,
      TIMER3,
      TIMER4,
      TIMER5);
#elsif MCU="ATMEGA328P" then
   type Timer_Type is
     (TIMER0,
      TIMER1,
      TIMER2);
#end if;

#if MCU="ATMEGA2560" then
   type Channel_Type is
     (CHANNEL_A,
      CHANNEL_B,
      CHANNEL_C);
#elsif MCU="ATMEGA328P" then
   type Channel_Type is
     (CHANNEL_A,
      CHANNEL_B);
#end if;

   type Channel_Priority_Type is array (Channel_Type) of Unsigned_16;

   type Unsigned_16_Array_Byte is
      record
         L : Unsigned_8;
         H : Unsigned_8;
      end record;

   function Get_Compare_Value
     (Timer   : TIMERS.Timer_Type;
      Channel : TIMERS.Channel_Type)
      return Unsigned_16;

   function Get_Compare_Value
     (Timer   : TIMERS.Timer_Type;
      Channel : TIMERS.Channel_Type)
      return Unsigned_16_Array_Byte;

   function Get_Current_Value
     (Timer : TIMERS.Timer_Type)
      return Unsigned_16;

   function Get_Current_Value
     (Timer : TIMERS.Timer_Type)
      return Unsigned_16_Array_Byte;

   function To_Unsigned_16_Array_Byte is new Unchecked_Conversion
     (Source => Unsigned_16,
      Target => Unsigned_16_Array_Byte);

private
   function To_Unsigned_16 is new Unchecked_Conversion
     (Source => Unsigned_16_Array_Byte,
      Target => Unsigned_16);

end AVR.TIMERS;
