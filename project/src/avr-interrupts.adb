with System.Machine_Code;
with AVR.MCU.USART;
with AVR.MCU.TWI;

-- =============================================================================
-- Package body AVR.MCU.INTERRUPTS
-- =============================================================================
package body AVR.MCU.INTERRUPTS is

   procedure Enable is
   begin
      System.Machine_Code.Asm ("sei", Volatile => True);
   end Enable;

   procedure Disable is
   begin
      System.Machine_Code.Asm ("cli", Volatile => True);
   end Disable;
   
   procedure Handle_Interrupt_USART0_RX is
   begin
      AVR.MCU.USART.Receive_Data_From_USART0;
   end Handle_Interrupt_USART0_RX;

   procedure Handle_Interrupt_TWI is
   begin
      AVR.MCU.TWI.Handle_Interrupts;
   end Handle_Interrupt_TWI;
   
end AVR.MCU.INTERRUPTS;
