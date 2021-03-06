-- =============================================================================
-- Package AVR.TIMERS.SCHEDULER
--
-- Implements timers configurations specific for a fixed scheduler which uses
-- for handling scheduler-type threads.
--
-- This timer is used for handling the device clock:
-- - TIMER1_COMPA (16 bits timer)
--
-- These timers are configured for Clear Timer on Compare (CTC) to handle each
-- task:
-- - TIMER5_COMPA (16 bits timer)
-- - TIMER5_COMPB (16 bits timer)
-- - TIMER5_COMPC (16 bits timer)
-- - TIMER0_COMPA (8 bits timer)
-- =============================================================================
package AVR.TIMERS.SCHEDULER is

   -- Initialize Timer1 or Timer5 channels as CTC
   procedure Initialize_CTC_Timer
     (Timer    : TIMERS.Timer_Type;
      Priority : TIMERS.Channel_Priority_Type);

end AVR.TIMERS.SCHEDULER;
