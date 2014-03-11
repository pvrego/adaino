with System.Machine_Code;

-- =============================================================================
-- Package body AVR.INTERRUPTS
-- =============================================================================
package body AVR.WATCHDOG is

   procedure Watchdog_Reset is
   begin
      System.Machine_Code.Asm ("wdr", Volatile => True);
   end Watchdog_Reset;

end AVR.WATCHDOG;
