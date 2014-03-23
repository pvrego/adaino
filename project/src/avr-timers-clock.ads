with AVR.TIMERS;
--  with AVR.INTERRUPTS;

-- =============================================================================
-- Package AVR.TIMERS.CLOCK
--
-- Implements the clock functions. This timer is used for handling the clock:
-- - TIMER1_COMPA (16 bits timer)
-- =============================================================================
package AVR.TIMERS.CLOCK is

   subtype Time_Hour_Type is Integer;
   subtype Time_Minute_Type is Integer range 0 .. 59;
   subtype Time_Second_Type is Integer range 0 .. 59;

   type Time_Type is
      record
         HH : Time_Hour_Type;
         MM : Time_Minute_Type;
         SS : Time_Second_Type;
      end record;

   -- Initialize Clock Timer
   procedure Initialize
     (Timer : TIMERS.Timer_Type);

   function Get_Current_Time_In_Nanoseconds
     return Unsigned_64;

   function Get_Current_Time_In_Seconds
     return Unsigned_64;

   function Get_Current_Time
     return Time_Type;

   -- Schedule tick update when Timer1_ChannelA overflows
   procedure Schedule_Update_Clock;
   --     pragma Machine_Attribute
   --       (Entity         => Schedule_Update_Clock,
   --        Attribute_Name => "signal");
   --     pragma Export
   --       (Convention    => C,
   --        Entity        => Schedule_Update_Clock,
   --        External_Name => AVR.INTERRUPTS.TIMER1_OVF);

private

   Priv_Clock_Cycles : Unsigned_64 := 0;

end AVR.TIMERS.CLOCK;
