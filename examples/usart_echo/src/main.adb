with AVR.MCU.USART;

procedure Main is
   Out_Flag_Char : Character;

begin

   AVR.MCU.USART.Initialize
     (In_Port  => AVR.MCU.USART.USART0,
      In_Setup =>
        (Sync_Mode    => AVR.MCU.USART.ASYNCHRONOUS,
         Double_Speed => True,
         Baud_Rate    => 9600,
         Data_Bits    => AVR.MCU.USART.BITS_8,
         Parity       => AVR.MCU.USART.NONE,
         Stop_Bits    => 1,
         Model        => AVR.MCU.USART.POLLING));

   AVR.MCU.USART.Put_Line (Data => "#### Initialization ok. ####");

   loop
      Out_Flag_Char := AVR.MCU.USART.Get;
      AVR.MCU.USART.Put (Data => Out_Flag_Char);
   end loop;

end Main;
