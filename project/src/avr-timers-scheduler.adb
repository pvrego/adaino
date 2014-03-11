-- =============================================================================
-- Package body AVR.TIMERS.SCHEDULER
-- =============================================================================
package body AVR.TIMERS.SCHEDULER is

   procedure Initialize_CTC_Timer
     (Timer    : TIMERS.Timer_Type;
      Priority : TIMERS.Channel_Priority_Type)
   is
      Curr_Array_Byte : TIMERS.Unsigned_16_Array_Byte;
   begin
      case Timer is
         when TIMERS.TIMER0 =>
            --+-----------------------------------------------------------------
            --| Timer/Counter 0 Control Register A:
            --|    TCCR0A = COM0A1|COM0A0|COM0B1|COM0B0|--|--|WGM01|WGM00
            --|
            --| CTC operation : WGM=0|1|0
            --| Clear OC0A on compare match : COM5A1|COM5A0=1|0
            --| => TCCR0A = 1|0|1|0|0|0|1|0
            --+-----------------------------------------------------------------
            Reg_Timer0.TCCRA.COMA (1) := TRUE;
            Reg_Timer0.TCCRA.COMB (1) := TRUE;
            Reg_Timer0.TCCRA.WGM1 := TRUE;

            --+-----------------------------------------------------------------
            --| Timer/Counter 0 Control Register B:
            --|    TCCR0B = FOC0A|FOC0B|--|--|WGM02|CS02|CS01|CS00
            --|
            --| FOC0A/B = Force Output Compare A/B : not used (=0)
            --| CTC operation : WGM=0|1|0
            --| CS02:0 : Clock Select = No prescalling : 0|0|1
            --|    TCCR0B = 0|0|0|0|0|0|0|1
            --+-----------------------------------------------------------------
            Reg_Timer0.TCCRB.CS (0) := TRUE;

            -- Set CHANNEL_A priority
            Curr_Array_Byte :=
              TIMERS.To_Unsigned_16_Array_Byte (Priority (TIMERS.CHANNEL_A));
            Reg_Timer0.OCRA := Byte_Type (Curr_Array_Byte.L);

            -- Set CHANNEL_B priority
            Curr_Array_Byte :=
              TIMERS.To_Unsigned_16_Array_Byte (Priority (TIMERS.CHANNEL_B));
            Reg_Timer0.OCRB := Byte_Type (Curr_Array_Byte.L);

#if MCU="ATMEGA2560" then
         when TIMERS.TIMER5 => -- Enable channels A, B and C
            --+-----------------------------------------------------------------
            --| Timer/Counter 5 Control Register A:
            --|    TCCR5A = COM5A1|COM5A0|COM5B1|COM5B0|COM5C1|COM5C0|WGM51|WGM50
            --|
            --| CTC operation : WGM=0|1|0|0
            --| Clear OC5A on compare match : COM5A1|COM5A0=1|0
            --| => TCCR5A = 1|0|1|0|1|0|0|0
            --+-----------------------------------------------------------------
            Reg_Timer5.TCCRA.COMA (1) := TRUE;
            Reg_Timer5.TCCRA.COMB (1) := TRUE;
            Reg_Timer5.TCCRA.WGM1 := TRUE;

            --+-----------------------------------------------------------------
            --| Timer/Counter 5 Control Register B:
            --|    TCCR5B = ICNC5|ICES5|--|WGM53|WGM52|CS52|CS51|CS50
            --|
            --| ICNC5 = Input Capture Noise Canceller : not used (=0)
            --| ICES5 = Input Capture Edge Select : negative edge (=0)
            --| CTC operation : WGM=0|1|0|0
            --| CS52:0 : Clock Select = No prescalling : 0|0|1
            --|    TCCR5B = 0|0|0|0|1|0|0|1
            --+-----------------------------------------------------------------
            Reg_Timer5.TCCRB.CS (0) := TRUE;

            -- Set CHANNEL_A priority
            Curr_Array_Byte :=
              TIMERS.To_Unsigned_16_Array_Byte (Priority (TIMERS.CHANNEL_A));
            Reg_Timer5.OCRA (0) := Byte_Type (Curr_Array_Byte.L);
            Reg_Timer5.OCRA (1) := Byte_Type (Curr_Array_Byte.H);

            -- Set CHANNEL_B priority
            Curr_Array_Byte :=
              TIMERS.To_Unsigned_16_Array_Byte (Priority (TIMERS.CHANNEL_B));
            Reg_Timer5.OCRB (0) := Byte_Type (Curr_Array_Byte.L);
            Reg_Timer5.OCRB (1) := Byte_Type (Curr_Array_Byte.H);

            -- Set CHANNEL_C priority
            Curr_Array_Byte :=
              TIMERS.To_Unsigned_16_Array_Byte (Priority (TIMERS.CHANNEL_C));
            Reg_Timer5.OCRC (0) := Byte_Type (Curr_Array_Byte.L);
            Reg_Timer5.OCRC (1) := Byte_Type (Curr_Array_Byte.H);

#end if;
         when others =>
            null;
      end case;
   exception
         when others => null;
   end Initialize_CTC_Timer;

end AVR.TIMERS.SCHEDULER;
