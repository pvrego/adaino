with Unchecked_Conversion;

-- =============================================================================
-- Package AVR.MCU.TIMERS
--
-- Implements timers configurations for the MCU micro-controller.
-- =============================================================================
package AVR.MCU.TIMERS is

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

end AVR.MCU.TIMERS;
