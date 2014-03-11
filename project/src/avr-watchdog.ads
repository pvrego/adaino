-- =============================================================================
-- Package AVR.MCU.WATCHDOG
--
-- Implements watchdog mechanisms for the MCU micro-controller.
-- =============================================================================
package AVR.MCU.WATCHDOG is

   type Watchdog_Timer_Control_Register_Type is
      record
         WPD0 : Boolean; -- Watchdog Timer Prescaler Bit 0
         WPD1 : Boolean; -- Watchdog Timer Prescaler Bit 1
         WPD2 : Boolean; -- Watchdog Timer Prescaler Bit 2
         WDE  : Boolean; -- Watchdog System Reset Enable
         WDCE : Boolean; -- Watchdog Change Enable
         WDP3 : Boolean; -- Watchdog Timer Prescaler Bit 3
         WDIE : Boolean; -- Watchdog Interrupt Enable
         WDIF : Boolean; -- Watchdog Interrupt Flag
      end record;
   pragma Pack (Watchdog_Timer_Control_Register_Type);
   for Watchdog_Timer_Control_Register_Type'Size use BYTE_SIZE;

   Reg_WDTCSR : Watchdog_Timer_Control_Register_Type;
   for Reg_WDTCSR'Address use System'To_Address (16#60#);

   procedure Watchdog_Reset;

end AVR.MCU.WATCHDOG;
