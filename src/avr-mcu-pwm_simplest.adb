-- =============================================================================
-- Package body AVR.MCU.PWM_SIMPLEST
--
-- $Id: avr-mcu-pwm_simplest.adb 94 2013-12-28 22:13:09Z pvrego $
-- =============================================================================
package body AVR.MCU.PWM_SIMPLEST is

   procedure Initialize (Timer : TIMERS.Timer_Type) is
   begin
      case Timer is
         when TIMERS.TIMER0 =>
            -- Nullify Timer1 buffers
            --Memory_Map.Timer0.TCCRA := 0; -- That is already 0
            --Memory_Map.Timer0.TCCRB := 0; -- That is already 0

            -- Waveform Generation Mode
            --  Phase Correct PWM, 8-bit, TOP = 0x00FF, Update OCR3x at TOP, TOV3 Flag Set on BOTTOM
            --  => WGM33|WGM32|WGM31|WGM30 = 0|0|0|1
            Memory_Map.Timer0.TCCRA.WGM0 := TRUE;

            -- Compare Output Mode:
            --  Fast PWM, non-inverting mode
            --  => COM3A1|COM3A0|COM3B1|COM3B0|COM3C1|COM3C0 = 1|0|1|0|1|0
            Memory_Map.Timer0.TCCRA.COMA (1) := TRUE;
            Memory_Map.Timer0.TCCRA.COMB (1) := TRUE;

            -- Clock Select: clk/64 => CS32|CS31|CS30 = 0|1|1
            Memory_Map.Timer0.TCCRB.CS (0) := TRUE;
            Memory_Map.Timer0.TCCRB.CS (1) := TRUE;

#if MCU="ATMEGA2560" then
            -- Set Timer3 pins as output : A|B|C = PB7|PG5
            Memory_Map.Data_Pin_B.DDR (7) := TRUE;
            Memory_Map.Data_Pin_G.DDR (5) := TRUE;
#elsif MCU="ATMEGA328P" then
            -- Set Timer0 pins as output : A|B = PD6|PD5
            Memory_Map.Data_Pin_D.DDR (6) := TRUE;
            Memory_Map.Data_Pin_D.DDR (5) := TRUE;
#end if;

         when TIMERS.TIMER1 =>
            -- Nullify Timer1 buffers
            --Memory_Map.Timer1.TCCRA := 0; -- That is already 0
            --Memory_Map.Timer1.TCCRB := 0; -- That is already 0
            --Memory_Map.Timer1.TCCRC := 0; -- That is already 0

            -- Waveform Generation Mode
            --  Phase Correct PWM, 8-bit, TOP = 0x00FF, Update OCR3x at TOP, TOV3 Flag Set on BOTTOM
            --  => WGM33|WGM32|WGM31|WGM30 = 0|0|0|1
            Memory_Map.Timer1.TCCRA.WGM0 := TRUE;

            -- Compare Output Mode:
            --  Fast PWM, non-inverting mode
            --  => COM3A1|COM3A0|COM3B1|COM3B0|COM3C1|COM3C0 = 1|0|1|0|1|0
            Memory_Map.Timer1.TCCRA.COMA (1) := TRUE;
            Memory_Map.Timer1.TCCRA.COMB (1) := TRUE;
#if MCU="ATMEGA2560" then
            Memory_Map.Timer1.TCCRA.COMC (1) := TRUE;
#end if;

            -- Clock Select: clk/64 => CS32|CS31|CS30 = 0|1|1
            Memory_Map.Timer1.TCCRB.CS (0) := TRUE;
            Memory_Map.Timer1.TCCRB.CS (1) := TRUE;

#if MCU="ATMEGA2560" then
            -- Set Timer3 pins as output : A|B|C = PB5|PB6|PB7
            Memory_Map.Data_Pin_B.DDR (5) := TRUE;
            Memory_Map.Data_Pin_B.DDR (6) := TRUE;
            Memory_Map.Data_Pin_B.DDR (7) := TRUE;
#elsif MCU="ATMEGA328P" then
            -- Set Timer0 pins as output : A|B = PB1|PB2
            Memory_Map.Data_Pin_B.DDR (1) := TRUE;
            Memory_Map.Data_Pin_B.DDR (2) := TRUE;
#end if;

         when TIMERS.TIMER2 =>
            -- Nullify Timer2 buffers
            --Memory_Map.Timer2.TCCRA := 0; -- That is already 0
            --Memory_Map.Timer2.TCCRB := 0; -- That is already 0
            --Memory_Map.Timer2.TCCRC := 0; -- That is already 0

            -- Waveform Generation Mode
            --  Phase Correct PWM, 8-bit, TOP = 0x00FF, Update OCR3x at TOP, TOV3 Flag Set on BOTTOM
            --  => WGM33|WGM32|WGM31|WGM30 = 0|0|0|1
            Memory_Map.Timer2.TCCRA.WGM0 := TRUE;

            -- Compare Output Mode:
            --  Fast PWM, non-inverting mode
            --  => COM3A1|COM3A0|COM3B1|COM3B0|COM3C1|COM3C0 = 1|0|1|0|1|0
            Memory_Map.Timer2.TCCRA.COMA (1) := TRUE;
            Memory_Map.Timer2.TCCRA.COMB (1) := TRUE;

            -- Clock Select: clk/64 => CS22|CS21|CS20 = 1|0|0
            -- Realize that CS in Timer2 is mapped differently from Timer0
            Memory_Map.Timer2.TCCRB.CS (2) := TRUE;

#if MCU="ATMEGA2560" then
            -- Set Timer3 pins as output : A|B = PB4|PH4
            Memory_Map.Data_Pin_B.DDR (4) := TRUE;
            Memory_Map.Data_Pin_H.DDR (4) := TRUE;
#elsif MCU="ATMEGA328P" then
            -- Set Timer0 pins as output : A|B = PB3|PD3
            Memory_Map.Data_Pin_B.DDR (3) := TRUE;
            Memory_Map.Data_Pin_D.DDR (3) := TRUE;
#end if;

#if MCU="ATMEGA2560" then
         when TIMERS.TIMER3 =>
            -- Nullify Timer3 buffers
            --Memory_Map.Timer3.TCCRA := 0; -- That is already 0
            --Memory_Map.Timer3.TCCRB := 0; -- That is already 0
            --Memory_Map.Timer3.TCCRC := 0; -- That is already 0

            -- Waveform Generation Mode
            --  Phase Correct PWM, 8-bit, TOP = 0x00FF, Update OCR3x at TOP, TOV3 Flag Set on BOTTOM
            --  => WGM33|WGM32|WGM31|WGM30 = 0|0|0|1
            Memory_Map.Timer3.TCCRA.WGM0 := TRUE;

            -- Compare Output Mode:
            --  Fast PWM, non-inverting mode
            --  => COM3A1|COM3A0|COM3B1|COM3B0|COM3C1|COM3C0 = 1|0|1|0|1|0
            Memory_Map.Timer3.TCCRA.COMA (1) := TRUE;
            Memory_Map.Timer3.TCCRA.COMB (1) := TRUE;
            Memory_Map.Timer3.TCCRA.COMC (1) := TRUE;

            -- Clock Select: clk/64 => CS32|CS31|CS30 = 0|1|1
            Memory_Map.Timer3.TCCRB.CS (0) := TRUE;
            Memory_Map.Timer3.TCCRB.CS (1) := TRUE;

            -- Set Timer3 pins as output : A|B|C = PE3|PE4|PE5
            Memory_Map.Data_Pin_E.DDR (3) := TRUE;
            Memory_Map.Data_Pin_E.DDR (4) := TRUE;
            Memory_Map.Data_Pin_E.DDR (5) := TRUE;

         when TIMERS.TIMER4 =>
            -- Nullify Timer4 buffers
            --Memory_Map.Timer4.TCCRA := 0; -- That is already 0
            --Memory_Map.Timer4.TCCRB := 0; -- That is already 0
            --Memory_Map.Timer4.TCCRC := 0; -- That is already 0

            -- Waveform Generation Mode
            --  Phase Correct PWM, 8-bit, TOP = 0x00FF, Update OCR3x at TOP, TOV3 Flag Set on BOTTOM
            --  => WGM33|WGM32|WGM31|WGM30 = 0|0|0|1
            Memory_Map.Timer4.TCCRA.WGM0 := TRUE;

            -- Compare Output Mode:
            --  Fast PWM, non-inverting mode
            --  => COM3A1|COM3A0|COM3B1|COM3B0|COM3C1|COM3C0 = 1|0|1|0|1|0
            Memory_Map.Timer4.TCCRA.COMA (1) := TRUE;
            Memory_Map.Timer4.TCCRA.COMB (1) := TRUE;
            Memory_Map.Timer4.TCCRA.COMC (1) := TRUE;

            -- Clock Select: clk/64 => CS32|CS31|CS30 = 0|1|1
            Memory_Map.Timer4.TCCRB.CS (0) := TRUE;
            Memory_Map.Timer4.TCCRB.CS (1) := TRUE;

            -- Set Timer4 pins as output : A|B|C = PH3|PH4|PH5
            Memory_Map.Data_Pin_H.DDR (3) := TRUE;
            Memory_Map.Data_Pin_H.DDR (4) := TRUE;
            Memory_Map.Data_Pin_H.DDR (5) := TRUE;

         when TIMERS.TIMER5 =>
            -- Nullify Timer5 buffers
            --Memory_Map.Timer5.TCCRA := 0; -- That is already 0
            --Memory_Map.Timer5.TCCRB := 0; -- That is already 0
            --Memory_Map.Timer5.TCCRC := 0; -- That is already 0

            -- Waveform Generation Mode
            --  Phase Correct PWM, 8-bit, TOP = 0x00FF, Update OCR3x at TOP, TOV3 Flag Set on BOTTOM
            --  => WGM33|WGM32|WGM31|WGM30 = 0|0|0|1
            Memory_Map.Timer5.TCCRA.WGM0 := TRUE;

            -- Compare Output Mode:
            --  Fast PWM, non-inverting mode
            --  => COM3A1|COM3A0|COM3B1|COM3B0|COM3C1|COM3C0 = 1|0|1|0|1|0
            Memory_Map.Timer5.TCCRA.COMA (1) := TRUE;
            Memory_Map.Timer5.TCCRA.COMB (1) := TRUE;
            Memory_Map.Timer5.TCCRA.COMC (1) := TRUE;

            -- Clock Select: clk/64 => CS32|CS31|CS30 = 0|1|1
            Memory_Map.Timer5.TCCRB.CS (0) := TRUE;
            Memory_Map.Timer5.TCCRB.CS (1) := TRUE;

            -- Set Timer4 pins as output : A|B|C = PL3|PL4|PL5
            Memory_Map.Data_Pin_L.DDR (3) := TRUE;
            Memory_Map.Data_Pin_L.DDR (4) := TRUE;
            Memory_Map.Data_Pin_L.DDR (5) := TRUE;
#end if;
      end case;

   exception
      when others => null;
   end Initialize;

   procedure Set_Counter
     (Timer   : in TIMERS.Timer_Type;
      Channel : in TIMERS.Channel_Type;
      Counter : in Unsigned_8) is
   begin
      case Timer is

         when TIMERS.TIMER0 =>
            case Channel is
               when TIMERS.CHANNEL_A =>
                  Memory_Map.Timer0.OCRA := Byte_Type (Counter);

               when TIMERS.CHANNEL_B =>
                  Memory_Map.Timer0.OCRB := Byte_Type (Counter);

#if MCU="ATMEGA2560" then
               when others => null;
#end if;
            end case;

         when TIMERS.TIMER1 =>
            case Channel is
               when TIMERS.CHANNEL_A =>
                  Memory_Map.Timer1.OCRA (1) := 0;
                  Memory_Map.Timer1.OCRA (0) := Byte_Type (Counter);

               when TIMERS.CHANNEL_B =>
                  Memory_Map.Timer1.OCRB (1) := 0;
                  Memory_Map.Timer1.OCRB (0) := Byte_Type (Counter);

#if MCU="ATMEGA2560" then
               when TIMERS.CHANNEL_C =>
                  Memory_Map.Timer1.OCRC (1) := 0;
                  Memory_Map.Timer1.OCRC (0) := Byte_Type (Counter);
#end if;
            end case;

         when TIMERS.TIMER2 =>
            case Channel is
               when TIMERS.CHANNEL_A =>
                  Memory_Map.Timer2.OCRA := Byte_Type (Counter);

               when TIMERS.CHANNEL_B =>
                  Memory_Map.Timer2.OCRB := Byte_Type (Counter);

#if MCU="ATMEGA2560" then
               when others => null;
#end if;
            end case;

#if MCU="ATMEGA2560" then
         when TIMERS.TIMER3 =>
            case Channel is
               when TIMERS.CHANNEL_A =>
                  Memory_Map.Timer3.OCRA (1) := 0;
                  Memory_Map.Timer3.OCRA (0) := Byte_Type (Counter);

               when TIMERS.CHANNEL_B =>
                  Memory_Map.Timer3.OCRB (1) := 0;
                  Memory_Map.Timer3.OCRB (0) := Byte_Type (Counter);

               when TIMERS.CHANNEL_C =>
                  Memory_Map.Timer3.OCRC (1) := 0;
                  Memory_Map.Timer3.OCRC (0) := Byte_Type (Counter);
            end case;

         when TIMERS.TIMER4 =>
            case Channel is
               when TIMERS.CHANNEL_A =>
                  Memory_Map.Timer4.OCRA (1) := 0;
                  Memory_Map.Timer4.OCRA (0) := Byte_Type (Counter);

               when TIMERS.CHANNEL_B =>
                  Memory_Map.Timer4.OCRB (1) := 0;
                  Memory_Map.Timer4.OCRB (0) := Byte_Type (Counter);

               when TIMERS.CHANNEL_C =>
                  Memory_Map.Timer4.OCRC (1) := 0;
                  Memory_Map.Timer4.OCRC (0) := Byte_Type (Counter);
            end case;

         when TIMERS.TIMER5 =>
            case Channel is
               when TIMERS.CHANNEL_A =>
                  Memory_Map.Timer5.OCRA (1) := 0;
                  Memory_Map.Timer5.OCRA (0) := Byte_Type (Counter);

               when TIMERS.CHANNEL_B =>
                  Memory_Map.Timer5.OCRB (1) := 0;
                  Memory_Map.Timer5.OCRB (0) := Byte_Type (Counter);

               when TIMERS.CHANNEL_C =>
                  Memory_Map.Timer5.OCRC (1) := 0;
                  Memory_Map.Timer5.OCRC (0) := Byte_Type (Counter);
            end case;
#end if;
      end case;

   exception
      when others => null;
   end Set_Counter;

end AVR.MCU.PWM_SIMPLEST;
