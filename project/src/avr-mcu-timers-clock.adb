-- =============================================================================
-- Package body AVR.MCU.TIMERS.CLOCK
-- =============================================================================
package body AVR.MCU.TIMERS.CLOCK is

   procedure Initialize
     (Timer   : TIMERS.Timer_Type)
   is
      use type TIMERS.Timer_Type;
   begin

      if Timer = TIMERS.TIMER1 then
         --+--------------------------------------------------------------------
         --| Timer/Counter 1 Control Register A:
         --|    TCCR1A = COM1A1|COM1A0|COM1B1|COM1B0|COM1C1|COM1C0|WGM11|WGM10
         --|
         --| Normal operation (WGM=0|0|0|0), normal port operation:
         --|    TCCR1A = 0|0|0|0|0|0|0|0
         --+--------------------------------------------------------------------
         --Memory_Map.Timer1.TCCRA := 0; -- That is already 0

         --+--------------------------------------------------------------------
         --| Timer/Counter 1 Control Register B:
         --|    TCCR1B = ICNC1|ICES1|--|WGM13|WGM12|CS12|CS11|CS10
         --|
         --| ICNC1 = Input Capture Noise Canceller : not used (=0)
         --| ICES1 = Input Capture Edge Select : negative edge (=0)
         --| Normal operation (WGM=0|0|0|0)
         --| CS12:0 : Clock Select = No prescalling : 0|0|1
         --|    TCCR1B = 0|0|0|0|0|0|0|1
         --+--------------------------------------------------------------------
         Reg_Timer1.TCCRB.CS (0) := TRUE;
      end if;

   end Initialize;

   procedure Schedule_Update_Clock is
   begin
      -- Priv_Clock_Cycles here is actually 16#FFFF# cycles, due to the
      -- interrupt overflow call. So when reading the clock, this value shall be
      -- multiplied by 16#FFFF# to give the right number of cycles passed.
      Priv_Clock_Cycles := Priv_Clock_Cycles + 1;
   end Schedule_Update_Clock;

   function Get_Current_Time_In_Nanoseconds
     return Unsigned_64 is
   begin
      -- The multiplication by 16#FFFF# is because the overflow interrupt is
      -- called when the timer counts from 0 to 16#FFFF#, so it passes all these
      -- cycles before called.
      return
        (Priv_Clock_Cycles * 1_000_000_000 / F_CPU) * 16#FFFF#;
   exception
         when others => return 0;
   end Get_Current_Time_In_Nanoseconds;

   function Get_Current_Time_In_Seconds
     return Unsigned_64 is
   begin
      return Get_Current_Time_In_Nanoseconds / 1_000_000_000;
   exception
         when others => return 0;
   end Get_Current_Time_In_Seconds;

   function Get_Current_Time
     return Time_Type is
      Curr_Time : Time_Type;
      Curr_Seconds : constant Unsigned_64 := Get_Current_Time_In_Seconds;
   begin
      Curr_Time.HH := Time_Hour_Type (Curr_Seconds / Unsigned_64 (3600));

      Curr_Time.MM := Time_Minute_Type
        ((Curr_Seconds -
           Unsigned_64 (Curr_Time.HH * 3600)) / Unsigned_64 (60));

      Curr_Time.SS := Time_Second_Type
        ((Curr_Seconds -
           Unsigned_64 (Curr_Time.HH * 3600) -
           Unsigned_64 (Curr_Time.MM * 60)) / Unsigned_64 (60));

      return Curr_Time;
   exception
      when others => return (HH => 0,
                             MM => 0,
                             SS => 0);
   end Get_Current_Time;

end AVR.MCU.TIMERS.CLOCK;
