#if MCU="ATMEGA2560" then
with AVR.USART;
with AVR.INTERRUPTS;
#end if;

procedure Main is
   --     Out_Flag_Char : Character;

begin
#if MCU="ATMEGA2560" then

   AVR.INTERRUPTS.Disable;

   AVR.USART.Initialize
     (In_Port  => AVR.USART.USART1,
      In_Setup =>
        (Sync_Mode    => AVR.USART.ASYNCHRONOUS,
         Double_Speed => True,
         Baud_Rate    => 9600,
         Data_Bits    => AVR.USART.BITS_8,
         Parity       => AVR.USART.NONE,
         Stop_Bits    => 1,
         Model        => AVR.USART.INTERRUPTIVE));

   AVR.USART.Put_Line
     (Port => AVR.USART.USART1,
      Data => "#### Initialization ok. ####");

   AVR.INTERRUPTS.Enable;

   loop
      --        Out_Flag_Char := AVR.USART.Get;
      --        AVR.USART.Put
      --          (Port => AVR.USART.USART1,
      --           Data => Out_Flag_Char);
      null;
   end loop;

#else
   null;
#end if;
end Main;
