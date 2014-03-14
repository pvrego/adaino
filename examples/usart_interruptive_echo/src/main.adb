with AVR.USART;
with AVR.INTERRUPTS;

procedure Main is
   Out_Flag_Char : Character;

begin

   AVR.INTERRUPTS.Disable;

   AVR.USART.Initialize
     (In_Port  => AVR.USART.USART0,
      In_Setup =>
        (Sync_Mode    => AVR.USART.ASYNCHRONOUS,
         Double_Speed => True,
         Baud_Rate    => 9600,
         Data_Bits    => AVR.USART.BITS_8,
         Parity       => AVR.USART.NONE,
         Stop_Bits    => 1,
         Model        => AVR.USART.INTERRUPTIVE));

   AVR.USART.Put_Line (Data => "#### Initialization ok. ####");

   AVR.INTERRUPTS.Enable;

   loop
      --Out_Flag_Char := AVR.USART.Get;
      --AVR.USART.Put (Data => Out_Flag_Char);
      null;

   end loop;

end Main;
