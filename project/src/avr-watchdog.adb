with System.Machine_Code;

-- =============================================================================
-- Package body AVR.MCU.INTERRUPTS
-- =============================================================================
package body AVR.MCU.WATCHDOG is

   procedure Watchdog_Reset is
   begin
      System.Machine_Code.Asm ("wdr", Volatile => True);
   end Watchdog_Reset;

end AVR.MCU.WATCHDOG;
