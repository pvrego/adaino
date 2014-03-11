package AVR.MCU.POWER_MANAGEMENT is

   type Sleep_Mode_Control_Register_Type is
      record
         SE    : Boolean; -- Sleep Enable
         SM0   : Boolean; -- Sleep Mode Select Bit 0
         SM1   : Boolean; -- Sleep Mode Select Bit 1
         SM2   : Boolean; -- Sleep Mode Select Bit 2
         Spare : Spare_Type (0 .. 3);
      end record;
   pragma Pack (Sleep_Mode_Control_Register_Type);
   for Sleep_Mode_Control_Register_Type'Size use BYTE_SIZE;

   Reg_SMCR : Sleep_Mode_Control_Register_Type;
   for Reg_SMCR'Address use System'To_Address (16#53#);

   type Power_Reduction_Register_0_Type is
      record
         PRADC    : Boolean; -- Power Reduction ADC
         PRUSART0 : Boolean; -- Power Reduction USART0
         PRSPI    : Boolean; -- Power Reduction Serial Peripheral Interface
         PRTIM1   : Boolean; -- Power Reduction Timer/Counter 1
         Spare    : Spare_Type (0 .. 0);
         PRTIM0   : Boolean; -- Power Reduction Timer/Counter 0
         PRTIM2   : Boolean; -- Power Reduction Timer/Counter 2
         PRTWI    : Boolean; -- Power Reduction TWI
      end record;
   pragma Pack (Power_Reduction_Register_0_Type);
   for Power_Reduction_Register_0_Type'Size use BYTE_SIZE;

#if MCU="ATMEGA2560" then
   type Power_Reduction_Register_1_Type is
      record
         PRUSART1 : Boolean; -- Power Reduction USART 1
         PRUSART2 : Boolean; -- Power Reduction USART 2
         PRUSART3 : Boolean; -- Power Reduction USART 3
         PRTIM3   : Boolean; -- Power Reductin Timer/Counter 3
         PRTIM4   : Boolean; -- Power Reductin Timer/Counter 4
         PRTIM5   : Boolean; -- Power Reductin Timer/Counter 5
         Spare    : Spare_Type (0 .. 1);
      end record;
   pragma Pack (Power_Reduction_Register_1_Type);
   for Power_Reduction_Register_1_Type'Size use BYTE_SIZE;
#end if;

   Reg_PRR0 : Power_Reduction_Register_0_Type;
   for Reg_PRR0'Address use System'To_Address (16#64#);

#if MCU="ATMEGA2560" then
   Reg_PRR1 : Power_Reduction_Register_0_Type;
   for Reg_PRR1'Address use System'To_Address (16#65#);
#end if;

end AVR.MCU.POWER_MANAGEMENT;
