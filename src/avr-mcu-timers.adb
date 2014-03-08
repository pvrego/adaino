-- =============================================================================
-- Package body AVR.MCU.TIMERS
--
-- $Id: avr-mcu-timers.adb 93 2013-12-28 13:31:55Z pvrego $
-- =============================================================================
package body AVR.MCU.TIMERS is

   function Get_Current_Value
     (Timer : TIMERS.Timer_Type)
      return Unsigned_16_Array_Byte
   is
      Curr_Value : Unsigned_16_Array_Byte;
   begin
      case Timer is
         when TIMER0 =>
            Curr_Value := (L => Unsigned_8 (Memory_Map.Timer0.TCNT),
                           H => 0);
         when TIMER1 =>
            Curr_Value := (L => Unsigned_8 (Memory_Map.Timer1.TCNT (0)),
                           H => Unsigned_8 (Memory_Map.Timer1.TCNT (1)));
         when TIMER2 =>
            Curr_Value := (L => Unsigned_8 (Memory_Map.Timer2.TCNT),
                           H => 0);
#if MCU="ATMEGA2560" then
         when TIMER3 =>
            Curr_Value := (L => Unsigned_8 (Memory_Map.Timer3.TCNT (0)),
                           H => Unsigned_8 (Memory_Map.Timer3.TCNT (1)));

         when TIMER4 =>
            Curr_Value := (L => Unsigned_8 (Memory_Map.Timer4.TCNT (0)),
                           H => Unsigned_8 (Memory_Map.Timer4.TCNT (1)));

         when TIMER5 =>
            Curr_Value := (L => Unsigned_8 (Memory_Map.Timer5.TCNT (0)),
                           H => Unsigned_8 (Memory_Map.Timer5.TCNT (1)));
#end if;
      end case;

      return Curr_Value;

   exception
         when others => return (L => 0,
                                H => 0);
   end Get_Current_Value;

   function Get_Current_Value
     (Timer : TIMERS.Timer_Type)
      return Unsigned_16
   is
   begin
      return To_Unsigned_16 (Get_Current_Value (Timer));
   end Get_Current_Value;

   function Get_Compare_Value
     (Timer   : TIMERS.Timer_Type;
      Channel : TIMERS.Channel_Type)
      return Unsigned_16_Array_Byte
   is
      Curr_Value : Unsigned_16_Array_Byte;
   begin
      case Timer is
         when TIMER0 => -- Timer0 is 8-bit, only A and B channels
            case Channel is
               when CHANNEL_A =>
                  Curr_Value := (L => Unsigned_8 (Memory_Map.Timer0.OCRA),
                                 H => 0);
               when CHANNEL_B =>
                  Curr_Value := (L => Unsigned_8 (Memory_Map.Timer0.OCRB),
                                 H => 0);
#if MCU="ATMEGA2560" then
               when others => null;
#end if;
            end case;

         when TIMER1 =>
            case Channel is
               when CHANNEL_A =>
                  Curr_Value := (L => Unsigned_8 (Memory_Map.Timer1.OCRA (0)),
                                 H => Unsigned_8 (Memory_Map.Timer1.OCRA (1)));
               when CHANNEL_B =>
                  Curr_Value := (L => Unsigned_8 (Memory_Map.Timer1.OCRB (0)),
                                 H => Unsigned_8 (Memory_Map.Timer1.OCRB (1)));
#if MCU="ATMEGA2560" then
               when CHANNEL_C =>
                  Curr_Value := (L => Unsigned_8 (Memory_Map.Timer1.OCRC (0)),
                                 H => Unsigned_8 (Memory_Map.Timer1.OCRC (1)));
#end if;
            end case;

         when TIMER2 => -- Timer2 is 8-bit, only A and B channels
            case Channel is
               when CHANNEL_A =>
                  Curr_Value := (L => Unsigned_8 (Memory_Map.Timer2.OCRA),
                                 H => 0);
               when CHANNEL_B =>
                  Curr_Value := (L => Unsigned_8 (Memory_Map.Timer2.OCRB),
                                 H => 0);
#if MCU="ATMEGA2560" then
               when others => null;
#end if;
            end case;

#if MCU="ATMEGA2560" then
         when TIMER3 =>
            case Channel is
               when CHANNEL_A =>
                  Curr_Value := (L => Unsigned_8 (Memory_Map.Timer3.OCRA (0)),
                                 H => Unsigned_8 (Memory_Map.Timer3.OCRA (1)));
               when CHANNEL_B =>
                  Curr_Value := (L => Unsigned_8 (Memory_Map.Timer3.OCRB (0)),
                                 H => Unsigned_8 (Memory_Map.Timer3.OCRB (1)));
               when CHANNEL_C =>
                  Curr_Value := (L => Unsigned_8 (Memory_Map.Timer3.OCRC (0)),
                                 H => Unsigned_8 (Memory_Map.Timer3.OCRC (1)));
            end case;

         when TIMER4 =>
            case Channel is
               when CHANNEL_A =>
                  Curr_Value := (L => Unsigned_8 (Memory_Map.Timer4.OCRA (0)),
                                 H => Unsigned_8 (Memory_Map.Timer4.OCRA (1)));
               when CHANNEL_B =>
                  Curr_Value := (L => Unsigned_8 (Memory_Map.Timer4.OCRB (0)),
                                 H => Unsigned_8 (Memory_Map.Timer4.OCRB (1)));
               when CHANNEL_C =>
                  Curr_Value := (L => Unsigned_8 (Memory_Map.Timer4.OCRC (0)),
                                 H => Unsigned_8 (Memory_Map.Timer4.OCRC (1)));
            end case;

         when TIMER5 =>
            case Channel is
               when CHANNEL_A =>
                  Curr_Value := (L => Unsigned_8 (Memory_Map.Timer5.OCRA (0)),
                                 H => Unsigned_8 (Memory_Map.Timer5.OCRA (1)));
               when CHANNEL_B =>
                  Curr_Value := (L => Unsigned_8 (Memory_Map.Timer5.OCRB (0)),
                                 H => Unsigned_8 (Memory_Map.Timer5.OCRB (1)));
               when CHANNEL_C =>
                  Curr_Value := (L => Unsigned_8 (Memory_Map.Timer5.OCRC (0)),
                                 H => Unsigned_8 (Memory_Map.Timer5.OCRC (1)));
            end case;
#end if;
      end case;

      return Curr_Value;

   exception
         when others => return (L => 0,
                                H => 0);
   end Get_Compare_Value;

   function Get_Compare_Value
     (Timer   : TIMERS.Timer_Type;
      Channel : TIMERS.Channel_Type)
      return Unsigned_16
   is
   begin
      return To_Unsigned_16
        (Get_Compare_Value
           (Timer   => Timer,
            Channel => Channel));
   end Get_Compare_Value;

end AVR.MCU.TIMERS;
