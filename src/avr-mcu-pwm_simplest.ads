with AVR.MCU.TIMERS;

-- =============================================================================
-- Package AVR.PWM_SIMPLEST
--
-- Implements Pulsed Wavelength Modulation for MCU in a simple way.
--
-- $Id: avr-mcu-pwm_simplest.ads 91 2013-12-28 00:03:59Z pvrego $
-- =============================================================================
package AVR.MCU.PWM_SIMPLEST is

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

end AVR.MCU.PWM_SIMPLEST;
