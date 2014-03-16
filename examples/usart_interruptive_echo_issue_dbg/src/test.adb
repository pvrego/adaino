with AVR;
with AVR.USART;

package body Test is

   procedure Handle_Interrupt_USART1_RX is
      Curr_Buffer : AVR.Byte_Type;
   begin
      Curr_Buffer := AVR.USART.Reg_USART1.UDR;
      AVR.USART.Reg_USART1.UDR := Curr_Buffer;
   end Handle_Interrupt_USART1_RX;
end Test;
