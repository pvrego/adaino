with AVR.USART;

procedure Main is
   Out_Flag_Char : Character;

begin

   AVR.USART.Initialize
     (In_Port  => AVR.USART.USART1,
      In_Setup =>
        (Sync_Mode    => AVR.USART.ASYNCHRONOUS,
         Double_Speed => True,
         Baud_Rate    => 9600,
         Data_Bits    => AVR.USART.BITS_8,
         Parity       => AVR.USART.NONE,
         Stop_Bits    => 1,
         Model        => AVR.USART.POLLING));

   AVR.USART.Write_Line
     (In_Port => AVR.USART.USART1,
      In_Data => "#### Initialization ok. ####");

   loop
      AVR.USART.Receive_Char_Polled
        (In_Port  => AVR.USART.USART1,
         Out_Data => Out_Flag_Char);


      AVR.USART.Write_Char
        (In_Port => AVR.USART.USART1,
         In_Data => Out_Flag_Char);
   end loop;

end Main;
