with System.Machine_Code;
with AVR.USART;
with AVR.TWI;

-- =============================================================================
-- Package body AVR.INTERRUPTS
-- =============================================================================
package body AVR.INTERRUPTS is

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
      AVR.USART.Handle_ISR_RXC (AVR.USART.USART0);
   end Handle_Interrupt_USART0_RX;

#if MCU="ATMEGA2560" then
   procedure Handle_Interrupt_USART1_RX is
   begin
      AVR.USART.Handle_ISR_RXC (AVR.USART.USART1);
   end Handle_Interrupt_USART1_RX;

   procedure Handle_Interrupt_USART2_RX is
   begin
      AVR.USART.Handle_ISR_RXC (AVR.USART.USART2);
   end Handle_Interrupt_USART2_RX;

   procedure Handle_Interrupt_USART3_RX is
   begin
      AVR.USART.Handle_ISR_RXC (AVR.USART.USART3);
   end Handle_Interrupt_USART3_RX;
#end if;
   
   procedure Handle_Interrupt_TWI is
   begin
      AVR.TWI.Handle_Interrupts;
   end Handle_Interrupt_TWI;
   
end AVR.INTERRUPTS;
