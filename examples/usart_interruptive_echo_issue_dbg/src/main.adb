with System.Machine_Code;
with AVR.USART;
with TEST;
pragma Unreferenced (TEST);

procedure Main is
   F_CPU : constant := 16_000_000;
   USART_BAUDRATE : constant := 9600;
begin
   AVR.USART.Reg_USART1.UCSRB.RXEN := True;
   AVR.USART.Reg_USART1.UCSRB.TXEN := True;
   AVR.USART.Reg_USART1.UCSRB.RXCIE := True;
   AVR.USART.Reg_USART1.UCSRC.UCSZ0 := True;
   AVR.USART.Reg_USART1.UCSRC.UCSZ1 := True;

   AVR.USART.Reg_USART1.UBRR (0) := AVR.Byte_Type ((F_CPU / (USART_BAUDRATE * 16)) - 1);
   AVR.USART.Reg_USART1.UBRR (1) := 0;

   System.Machine_Code.Asm ("sei", Volatile => True);

   loop
      null;
   end loop;
end Main;
