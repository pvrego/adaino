package TEST is

   USART1RX : constant String := "__vector_36";

   procedure Handle_Interrupt_USART1_RX;
   pragma Machine_Attribute
     (Entity         => Handle_Interrupt_USART1_RX,
      Attribute_Name => "signal");
   pragma Export
     (Convention    => C,
      Entity        => Handle_Interrupt_USART1_RX,
      External_Name => USART1RX);

end TEST;
