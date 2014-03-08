with System.Machine_Code;

-- =============================================================================
-- Package body AVR.MCU.INTERRUPTS
--
-- $Id: avr-mcu-watchdog.adb 91 2013-12-28 00:03:59Z pvrego $
-- =============================================================================
package body AVR.MCU.WATCHDOG is

   procedure Watchdog_Reset is
   begin
      System.Machine_Code.Asm ("wdr", Volatile => True);
   end Watchdog_Reset;

end AVR.MCU.WATCHDOG;
