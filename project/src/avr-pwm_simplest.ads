with AVR.TIMERS;

-- =============================================================================
-- Package AVR.PWM_SIMPLEST
--
-- Implements Pulsed Wavelength Modulation for MCU in a simple way.
-- =============================================================================
package AVR.PWM_SIMPLEST is

   -- ======================
   -- General Public Section
   -- ======================

   -- Initialize the general parameters of the PWM on the Timer
   procedure Initialize
     (Timer : TIMERS.Timer_Type);

   -- Set the value of the counter which defines the Duty_Cycle
   procedure Set_Counter
     (Timer   : in TIMERS.Timer_Type;
      Channel : in TIMERS.Channel_Type;
      Counter : in Unsigned_8);

end AVR.PWM_SIMPLEST;
