with System;

-- =============================================================================
-- Package body AVR.INTERRUPTS
--
-- Maps the interrupts for the MCU micro-controller.
-- To attach an interrupt, proceed like
--  procedure Receive_Handler;
--  pragma Machine_Attribute
--    (Entity         => Receive_Handler,
--     Attribute_Name => "signal");
--  pragma Export
--    (Convention    => C,
--     Entity        => Receive_Handler,
--     External_Name => <interrupt_vector_name>);
-- =============================================================================
package AVR.INTERRUPTS is

   type External_Interrupt_Control_Type is
     array (0 .. 7) of Bit_Array_Type (0 .. 1);
   pragma Pack (External_Interrupt_Control_Type);
   for External_Interrupt_Control_Type'Size use 2 * BYTE_SIZE;

   Reg_EICR : External_Interrupt_Control_Type;
   for Reg_EICR'Address use System'To_Address (16#69#);

   type External_Interrupt_Mask_Register is new Bit_Array_Type (0 .. 7);

   Reg_EIMSK : External_Interrupt_Mask_Register;
   for Reg_EIMSK'Address use System'To_Address (16#3D#);

   type External_Interrupt_Flag_Type is new Bit_Array_Type (0 .. 7);

   Reg_EIFR : External_Interrupt_Flag_Type;
   for Reg_EIFR'Address use System'To_Address (16#3C#);

   type Pin_Change_Interrupt_Control_Register_Type is
     new Bit_Array_Type (0 .. 7);

   Reg_PCICR : Pin_Change_Interrupt_Control_Register_Type;
   for Reg_PCICR'Address use System'To_Address (16#68#);

   type Pin_Change_Interrupt_Flag_Type is new Bit_Array_Type (0 .. 7);

   Reg_PCIFR : Pin_Change_Interrupt_Flag_Type;
   for Reg_PCIFR'Address use System'To_Address (16#3B#);

   type Pin_Change_Mask_Type is new Bit_Array_Type (0 .. 23);

   Reg_PCMSK : Pin_Change_Mask_Type;
   for Reg_PCMSK'Address use System'To_Address (16#6B#);

#if MCU="ATMEGA2560" then
   RESET        : constant String := "__vector_0"; -- External Pin, Power-on, Brown-out, Watchdog and JTAG AVR Reset
   INT0         : constant String := "__vector_1"; -- External Interrupt Request 0
   INT1         : constant String := "__vector_2"; -- External Interrupt Request 1
   INT2         : constant String := "__vector_3"; -- External Interrupt Request 2
   INT3         : constant String := "__vector_4"; -- External Interrupt Request 3
   INT4         : constant String := "__vector_5"; -- External Interrupt Request 4
   INT5         : constant String := "__vector_6"; -- External Interrupt Request 5
   INT6         : constant String := "__vector_7"; -- External Interrupt Request 6
   INT7         : constant String := "__vector_8"; -- External Interrupt Request 7
   PCINT0       : constant String := "__vector_9"; -- Pin Change Interrupt Request 0
   PCINT1       : constant String := "__vector_10"; -- Pin Change Interrupt Request 1
   PCINT2       : constant String := "__vector_11"; -- Pin Change Interrupt Request 2
   WDT          : constant String := "__vector_12"; -- Watchdog Time-out Interrupt
   TIMER2_COMPA : constant String := "__vector_13"; -- Timer/Counter2 Compare Match A
   TIMER2_COMPB : constant String := "__vector_14"; -- Timer/Counter2 Compare Match B
   TIMER2_OVF   : constant String := "__vector_15"; -- Timer/Counter2 Overflow
   TIMER1_CAPT  : constant String := "__vector_16"; -- Timer/Counter1 Capture Event
   TIMER1_COMPA : constant String := "__vector_17"; -- Timer/Counter1 Compare Match A
   TIMER1_COMPB : constant String := "__vector_18"; -- Timer/Counter1 Compare Match B
   TIMER1_COMPC : constant String := "__vector_19"; -- Timer/Counter1 Compare Match C
   TIMER1_OVF   : constant String := "__vector_20"; -- Timer/Counter1 Overflow
   TIMER0_COMPA : constant String := "__vector_21"; -- Timer/Counter0 Compare Match A
   TIMER0_COMPB : constant String := "__vector_22"; -- Timer/Counter0 Compare match B
   TIMER0_OVF   : constant String := "__vector_23"; -- Timer/Counter0 Overflow
   SPI_STC      : constant String := "__vector_24"; -- SPI Serial Transfer Complete
   USART0_RX    : constant String := "__vector_25"; -- USART0 Rx Complete
   USART0_UDRE  : constant String := "__vector_26"; -- USART0 Data Register Empty
   USART0_TX    : constant String := "__vector_27"; -- USART0 Tx Complete
   ANALOG_COMP  : constant String := "__vector_28"; -- Analog Comparator
   ADC          : constant String := "__vector_29"; -- ADC Conversion Complete
   EE_READY     : constant String := "__vector_30"; -- EEPROM Ready
   TIMER3_CAPT  : constant String := "__vector_31"; -- Timer/Counter3 Capture Event
   TIMER3_COMPA : constant String := "__vector_32"; -- Timer/Counter3 Compare Match A
   TIMER3_COMPB : constant String := "__vector_33"; -- Timer/Counter3 Compare Match B
   TIMER3_COMPC : constant String := "__vector_34"; -- Timer/Counter3 Compare Match C
   TIMER3_OVF   : constant String := "__vector_35"; -- Timer/Counter3 Overflow
   USART1_RX    : constant String := "__vector_36"; -- USART1 Rx Complete
   USART1_UDRE  : constant String := "__vector_37"; -- USART1 Data Register Empty
   USART1_TX    : constant String := "__vector_38"; -- USART1 Tx Complete
   TWI          : constant String := "__vector_39"; -- 2-wire Serial Interface
   SPM_READY    : constant String := "__vector_40"; -- Store Program Memory Ready
   TIMER4_CAPT  : constant String := "__vector_41"; -- Timer/Counter4 Capture Event
   TIMER4_COMPA : constant String := "__vector_42"; -- Timer/Counter4 Compare Match A
   TIMER4_COMPB : constant String := "__vector_43"; -- Timer/Counter4 Compare Match B
   TIMER4_COMPC : constant String := "__vector_44"; -- Timer/Counter4 Compare Match C
   TIMER4_OVF   : constant String := "__vector_45"; -- Timer/Counter4 Overflow
   TIMER5_CAPT  : constant String := "__vector_46"; -- Timer/Counter5 Capture Event
   TIMER5_COMPA : constant String := "__vector_47"; -- Timer/Counter5 Compare Match A
   TIMER5_COMPB : constant String := "__vector_48"; -- Timer/Counter5 Compare Match B
   TIMER5_COMPC : constant String := "__vector_49"; -- Timer/Counter5 Compare Match C
   TIMER5_OVF   : constant String := "__vector_50"; -- Timer/Counter5 Overflow
   USART2_RX    : constant String := "__vector_51"; -- USART2 Rx Complete
   USART2_UDRE  : constant String := "__vector_52"; -- USART2 Data Register Empty
   USART2_TX    : constant String := "__vector_53"; -- USART2 Tx Complete
   USART3_RX    : constant String := "__vector_54"; -- USART3 Rx Complete
   USART3_UDRE  : constant String := "__vector_55"; -- USART3 Data Register Empty
   USART3_TX    : constant String := "__vector_56"; -- USART3 Tx Complete
#end if;

#if MCU="ATMEGA328P" then
   RESET        : constant String := "__vector_0"; -- External Pin, Power-on, Brown-out, Watchdog and System Reset
   INT0         : constant String := "__vector_1"; -- External Interrupt Request 0
   INT1         : constant String := "__vector_2"; -- External Interrupt Request 1
   PCINT0       : constant String := "__vector_3"; -- Pin Change Interrupt Request 0
   PCINT1       : constant String := "__vector_4"; -- Pin Change Interrupt Request 1
   PCINT2       : constant String := "__vector_5"; -- Pin Change Interrupt Request 2
   WDT          : constant String := "__vector_6"; -- Watchdog Time-out Interrupt
   TIMER2_COMPA : constant String := "__vector_7"; -- Timer/Counter2 Compare Match A
   TIMER2_COMPB : constant String := "__vector_8"; -- Timer/Counter2 Compare Match B
   TIMER2_OVF   : constant String := "__vector_9"; -- Timer/Counter2 Overflow
   TIMER1_CAPT  : constant String := "__vector_10"; -- Timer/Counter1 Capture Event
   TIMER1_COMPA : constant String := "__vector_11"; -- Timer/Counter1 Compare Match A
   TIMER1_COMPB : constant String := "__vector_12"; -- Timer/Counter1 Compare Match B
   TIMER1_OVF   : constant String := "__vector_13"; -- Timer/Counter1 Overflow
   TIMER0_COMPA : constant String := "__vector_14"; -- Timer/Counter0 Compare Match A
   TIMER0_COMPB : constant String := "__vector_15"; -- Timer/Counter0 Compare match B
   TIMER0_OVF   : constant String := "__vector_16"; -- Timer/Counter0 Overflow
   SPI_STC      : constant String := "__vector_17"; -- SPI Serial Transfer Complete
   USART0_RX    : constant String := "__vector_18"; -- USART0 Rx Complete
   USART0_UDRE  : constant String := "__vector_19"; -- USART0 Data Register Empty
   USART0_TX    : constant String := "__vector_20"; -- USART0 Tx Complete
   ADC          : constant String := "__vector_21"; -- ADC Conversion Complete
   EE_READY     : constant String := "__vector_22"; -- EEPROM Ready
   ANALOG_COMP  : constant String := "__vector_23"; -- Analog Comparator
   TWI          : constant String := "__vector_24"; -- 2-wire Serial Interface
   SPM_READY    : constant String := "__vector_25"; -- Store Program Memory Ready
#end if;

   procedure Enable;
   procedure Disable;

   procedure Handle_Interrupt_RESET is null;
   pragma Machine_Attribute
     (Entity         => Handle_Interrupt_RESET,
      Attribute_Name => "signal");
   pragma Export
     (Convention    => C,
      Entity        => Handle_Interrupt_RESET,
      External_Name => RESET);

   procedure Handle_Interrupt_INT0 is null;
   pragma Machine_Attribute
     (Entity         => Handle_Interrupt_INT0,
      Attribute_Name => "signal");
   pragma Export
     (Convention    => C,
      Entity        => Handle_Interrupt_INT0,
      External_Name => INT0);

   procedure Handle_Interrupt_INT1 is null;
   pragma Machine_Attribute
     (Entity         => Handle_Interrupt_INT1,
      Attribute_Name => "signal");
   pragma Export
     (Convention    => C,
      Entity        => Handle_Interrupt_INT1,
      External_Name => INT1);

#if MCU="ATMEGA2560" then
   procedure Handle_Interrupt_INT2 is null;
   pragma Machine_Attribute
     (Entity         => Handle_Interrupt_INT2,
      Attribute_Name => "signal");
   pragma Export
     (Convention    => C,
      Entity        => Handle_Interrupt_INT2,
      External_Name => INT2);

   procedure Handle_Interrupt_INT3 is null;
   pragma Machine_Attribute
     (Entity         => Handle_Interrupt_INT3,
      Attribute_Name => "signal");
   pragma Export
     (Convention    => C,
      Entity        => Handle_Interrupt_INT3,
      External_Name => INT3);

   procedure Handle_Interrupt_INT4 is null;
   pragma Machine_Attribute
     (Entity         => Handle_Interrupt_INT4,
      Attribute_Name => "signal");
   pragma Export
     (Convention    => C,
      Entity        => Handle_Interrupt_INT4,
      External_Name => INT4);

   procedure Handle_Interrupt_INT5 is null;
   pragma Machine_Attribute
     (Entity         => Handle_Interrupt_INT5,
      Attribute_Name => "signal");
   pragma Export
     (Convention    => C,
      Entity        => Handle_Interrupt_INT5,
      External_Name => INT5);

   procedure Handle_Interrupt_INT6 is null;
   pragma Machine_Attribute
     (Entity         => Handle_Interrupt_INT6,
      Attribute_Name => "signal");
   pragma Export
     (Convention    => C,
      Entity        => Handle_Interrupt_INT6,
      External_Name => INT6);

   procedure Handle_Interrupt_INT7 is null;
   pragma Machine_Attribute
     (Entity         => Handle_Interrupt_INT7,
      Attribute_Name => "signal");
   pragma Export
     (Convention    => C,
      Entity        => Handle_Interrupt_INT7,
      External_Name => INT7);
#end if;

   procedure Handle_Interrupt_PCINT0 is null;
   pragma Machine_Attribute
     (Entity         => Handle_Interrupt_PCINT0,
      Attribute_Name => "signal");
   pragma Export
     (Convention    => C,
      Entity        => Handle_Interrupt_PCINT0,
      External_Name => PCINT0);

   procedure Handle_Interrupt_PCINT1 is null;
   pragma Machine_Attribute
     (Entity         => Handle_Interrupt_PCINT1,
      Attribute_Name => "signal");
   pragma Export
     (Convention    => C,
      Entity        => Handle_Interrupt_PCINT1,
      External_Name => PCINT1);

   procedure Handle_Interrupt_PCINT2 is null;
   pragma Machine_Attribute
     (Entity         => Handle_Interrupt_PCINT2,
      Attribute_Name => "signal");
   pragma Export
     (Convention    => C,
      Entity        => Handle_Interrupt_PCINT2,
      External_Name => PCINT2);

   procedure Handle_Interrupt_WDT is null;
   pragma Machine_Attribute
     (Entity         => Handle_Interrupt_WDT,
      Attribute_Name => "signal");
   pragma Export
     (Convention    => C,
      Entity        => Handle_Interrupt_WDT,
      External_Name => WDT);

   procedure Handle_Interrupt_TIMER2_COMPA is null;
   pragma Machine_Attribute
     (Entity         => Handle_Interrupt_TIMER2_COMPA,
      Attribute_Name => "signal");
   pragma Export
     (Convention    => C,
      Entity        => Handle_Interrupt_TIMER2_COMPA,
      External_Name => TIMER2_COMPA);

   procedure Handle_Interrupt_TIMER2_COMPB is null;
   pragma Machine_Attribute
     (Entity         => Handle_Interrupt_TIMER2_COMPB,
      Attribute_Name => "signal");
   pragma Export
     (Convention    => C,
      Entity        => Handle_Interrupt_TIMER2_COMPB,
      External_Name => TIMER2_COMPB);

   procedure Handle_Interrupt_TIMER2_OVF is null;
   pragma Machine_Attribute
     (Entity         => Handle_Interrupt_TIMER2_OVF,
      Attribute_Name => "signal");
   pragma Export
     (Convention    => C,
      Entity        => Handle_Interrupt_TIMER2_OVF,
      External_Name => TIMER2_OVF);

   procedure Handle_Interrupt_TIMER1_CAPT is null;
   pragma Machine_Attribute
     (Entity         => Handle_Interrupt_TIMER1_CAPT,
      Attribute_Name => "signal");
   pragma Export
     (Convention    => C,
      Entity        => Handle_Interrupt_TIMER1_CAPT,
      External_Name => TIMER1_CAPT);

   procedure Handle_Interrupt_TIMER1_COMPA is null;
   pragma Machine_Attribute
     (Entity         => Handle_Interrupt_TIMER1_COMPA,
      Attribute_Name => "signal");
   pragma Export
     (Convention    => C,
      Entity        => Handle_Interrupt_TIMER1_COMPA,
      External_Name => TIMER1_COMPA);

   procedure Handle_Interrupt_TIMER1_COMPB is null;
   pragma Machine_Attribute
     (Entity         => Handle_Interrupt_TIMER1_COMPB,
      Attribute_Name => "signal");
   pragma Export
     (Convention    => C,
      Entity        => Handle_Interrupt_TIMER1_COMPB,
      External_Name => TIMER1_COMPB);

#if MCU="ATMEGA2560" then
   procedure Handle_Interrupt_TIMER1_COMPC is null;
   pragma Machine_Attribute
     (Entity         => Handle_Interrupt_TIMER1_COMPC,
      Attribute_Name => "signal");
   pragma Export
     (Convention    => C,
      Entity        => Handle_Interrupt_TIMER1_COMPC,
      External_Name => TIMER1_COMPC);
#end if;

   procedure Handle_Interrupt_TIMER1_OVF is null;
   pragma Machine_Attribute
     (Entity         => Handle_Interrupt_TIMER1_OVF,
      Attribute_Name => "signal");
   pragma Export
     (Convention    => C,
      Entity        => Handle_Interrupt_TIMER1_OVF,
      External_Name => TIMER1_OVF);

   procedure Handle_Interrupt_TIMER0_COMPA is null;
   pragma Machine_Attribute
     (Entity         => Handle_Interrupt_TIMER0_COMPA,
      Attribute_Name => "signal");
   pragma Export
     (Convention    => C,
      Entity        => Handle_Interrupt_TIMER0_COMPA,
      External_Name => TIMER0_COMPA);

   procedure Handle_Interrupt_TIMER0_COMPB is null;
   pragma Machine_Attribute
     (Entity         => Handle_Interrupt_TIMER0_COMPB,
      Attribute_Name => "signal");
   pragma Export
     (Convention    => C,
      Entity        => Handle_Interrupt_TIMER0_COMPB,
      External_Name => TIMER0_COMPB);

   procedure Handle_Interrupt_TIMER0_OVF is null;
   pragma Machine_Attribute
     (Entity         => Handle_Interrupt_TIMER0_OVF,
      Attribute_Name => "signal");
   pragma Export
     (Convention    => C,
      Entity        => Handle_Interrupt_TIMER0_OVF,
      External_Name => TIMER0_OVF);

   procedure Handle_Interrupt_SPI_STC is null;
   pragma Machine_Attribute
     (Entity         => Handle_Interrupt_SPI_STC,
      Attribute_Name => "signal");
   pragma Export
     (Convention    => C,
      Entity        => Handle_Interrupt_SPI_STC,
      External_Name => SPI_STC);

   procedure Handle_Interrupt_USART0_RX;
   pragma Machine_Attribute
     (Entity         => Handle_Interrupt_USART0_RX,
      Attribute_Name => "signal");
   pragma Export
     (Convention    => C,
      Entity        => Handle_Interrupt_USART0_RX,
      External_Name => USART0_RX);

   procedure Handle_Interrupt_USART0_UDRE is null;
   pragma Machine_Attribute
     (Entity         => Handle_Interrupt_USART0_UDRE,
      Attribute_Name => "signal");
   pragma Export
     (Convention    => C,
      Entity        => Handle_Interrupt_USART0_UDRE,
      External_Name => USART0_UDRE);

   procedure Handle_Interrupt_USART0_TX is null;
   pragma Machine_Attribute
     (Entity         => Handle_Interrupt_USART0_TX,
      Attribute_Name => "signal");
   pragma Export
     (Convention    => C,
      Entity        => Handle_Interrupt_USART0_TX,
      External_Name => USART0_TX);

   procedure Handle_Interrupt_ANALOG_COMP is null;
   pragma Machine_Attribute
     (Entity         => Handle_Interrupt_ANALOG_COMP,
      Attribute_Name => "signal");
   pragma Export
     (Convention    => C,
      Entity        => Handle_Interrupt_ANALOG_COMP,
      External_Name => ANALOG_COMP);

   procedure Handle_Interrupt_ADC is null;
   pragma Machine_Attribute
     (Entity         => Handle_Interrupt_ADC,
      Attribute_Name => "signal");
   pragma Export
     (Convention    => C,
      Entity        => Handle_Interrupt_ADC,
      External_Name => ADC);

   procedure Handle_Interrupt_EE_READY is null;
   pragma Machine_Attribute
     (Entity         => Handle_Interrupt_EE_READY,
      Attribute_Name => "signal");
   pragma Export
     (Convention    => C,
      Entity        => Handle_Interrupt_EE_READY,
      External_Name => EE_READY);

#if MCU="ATMEGA2560" then
   procedure Handle_Interrupt_TIMER3_CAPT is null;
   pragma Machine_Attribute
     (Entity         => Handle_Interrupt_TIMER3_CAPT,
      Attribute_Name => "signal");
   pragma Export
     (Convention    => C,
      Entity        => Handle_Interrupt_TIMER3_CAPT,
      External_Name => TIMER3_CAPT);

   procedure Handle_Interrupt_TIMER3_COMPA is null;
   pragma Machine_Attribute
     (Entity         => Handle_Interrupt_TIMER3_COMPA,
      Attribute_Name => "signal");
   pragma Export
     (Convention    => C,
      Entity        => Handle_Interrupt_TIMER3_COMPA,
      External_Name => TIMER3_COMPA);

   procedure Handle_Interrupt_TIMER3_COMPB is null;
   pragma Machine_Attribute
     (Entity         => Handle_Interrupt_TIMER3_COMPB,
      Attribute_Name => "signal");
   pragma Export
     (Convention    => C,
      Entity        => Handle_Interrupt_TIMER3_COMPB,
      External_Name => TIMER3_COMPB);

   procedure Handle_Interrupt_TIMER3_COMPC is null;
   pragma Machine_Attribute
     (Entity         => Handle_Interrupt_TIMER3_COMPC,
      Attribute_Name => "signal");
   pragma Export
     (Convention    => C,
      Entity        => Handle_Interrupt_TIMER3_COMPC,
      External_Name => TIMER3_COMPC);

   procedure Handle_Interrupt_TIMER3_OVF is null;
   pragma Machine_Attribute
     (Entity         => Handle_Interrupt_TIMER3_OVF,
      Attribute_Name => "signal");
   pragma Export
     (Convention    => C,
      Entity        => Handle_Interrupt_TIMER3_OVF,
      External_Name => TIMER3_OVF);

   procedure Handle_Interrupt_USART1_RX;
   pragma Machine_Attribute
     (Entity         => Handle_Interrupt_USART1_RX,
      Attribute_Name => "signal");
   pragma Export
     (Convention    => C,
      Entity        => Handle_Interrupt_USART1_RX,
      External_Name => USART1_RX);

   procedure Handle_Interrupt_USART1_UDRE is null;
   pragma Machine_Attribute
     (Entity         => Handle_Interrupt_USART1_UDRE,
      Attribute_Name => "signal");
   pragma Export
     (Convention    => C,
      Entity        => Handle_Interrupt_USART1_UDRE,
      External_Name => USART1_UDRE);

   procedure Handle_Interrupt_USART1_TX is null;
   pragma Machine_Attribute
     (Entity         => Handle_Interrupt_USART1_TX,
      Attribute_Name => "signal");
   pragma Export
     (Convention    => C,
      Entity        => Handle_Interrupt_USART1_TX,
      External_Name => USART1_TX);
#end if;

   procedure Handle_Interrupt_TWI;
   pragma Machine_Attribute
     (Entity         => Handle_Interrupt_TWI,
      Attribute_Name => "signal");
   pragma Export
     (Convention    => C,
      Entity        => Handle_Interrupt_TWI,
      External_Name => TWI);

   procedure Handle_Interrupt_SPM_READY is null;
   pragma Machine_Attribute
     (Entity         => Handle_Interrupt_SPM_READY,
      Attribute_Name => "signal");
   pragma Export
     (Convention    => C,
      Entity        => Handle_Interrupt_SPM_READY,
      External_Name => SPM_READY);

#if MCU="ATMEGA2560" then
   procedure Handle_Interrupt_TIMER4_CAPT is null;
   pragma Machine_Attribute
     (Entity         => Handle_Interrupt_TIMER4_CAPT,
      Attribute_Name => "signal");
   pragma Export
     (Convention    => C,
      Entity        => Handle_Interrupt_TIMER4_CAPT,
      External_Name => TIMER4_CAPT);

   procedure Handle_Interrupt_TIMER4_COMPA is null;
   pragma Machine_Attribute
     (Entity         => Handle_Interrupt_TIMER4_COMPA,
      Attribute_Name => "signal");
   pragma Export
     (Convention    => C,
      Entity        => Handle_Interrupt_TIMER4_COMPA,
      External_Name => TIMER4_COMPA);

   procedure Handle_Interrupt_TIMER4_COMPB is null;
   pragma Machine_Attribute
     (Entity         => Handle_Interrupt_TIMER4_COMPB,
      Attribute_Name => "signal");
   pragma Export
     (Convention    => C,
      Entity        => Handle_Interrupt_TIMER4_COMPB,
      External_Name => TIMER4_COMPB);

   procedure Handle_Interrupt_TIMER4_COMPC is null;
   pragma Machine_Attribute
     (Entity         => Handle_Interrupt_TIMER4_COMPC,
      Attribute_Name => "signal");
   pragma Export
     (Convention    => C,
      Entity        => Handle_Interrupt_TIMER4_COMPC,
      External_Name => TIMER4_COMPC);

   procedure Handle_Interrupt_TIMER4_OVF is null;
   pragma Machine_Attribute
     (Entity         => Handle_Interrupt_TIMER4_OVF,
      Attribute_Name => "signal");
   pragma Export
     (Convention    => C,
      Entity        => Handle_Interrupt_TIMER4_OVF,
      External_Name => TIMER4_OVF);

   procedure Handle_Interrupt_TIMER5_CAPT is null;
   pragma Machine_Attribute
     (Entity         => Handle_Interrupt_TIMER5_CAPT,
      Attribute_Name => "signal");
   pragma Export
     (Convention    => C,
      Entity        => Handle_Interrupt_TIMER5_CAPT,
      External_Name => TIMER5_CAPT);

   procedure Handle_Interrupt_TIMER5_COMPA is null;
   pragma Machine_Attribute
     (Entity         => Handle_Interrupt_TIMER5_COMPA,
      Attribute_Name => "signal");
   pragma Export
     (Convention    => C,
      Entity        => Handle_Interrupt_TIMER5_COMPA,
      External_Name => TIMER5_COMPA);

   procedure Handle_Interrupt_TIMER5_COMPB is null;
   pragma Machine_Attribute
     (Entity         => Handle_Interrupt_TIMER5_COMPB,
      Attribute_Name => "signal");
   pragma Export
     (Convention    => C,
      Entity        => Handle_Interrupt_TIMER5_COMPB,
      External_Name => TIMER5_COMPB);

   procedure Handle_Interrupt_TIMER5_COMPC is null;
   pragma Machine_Attribute
     (Entity         => Handle_Interrupt_TIMER5_COMPC,
      Attribute_Name => "signal");
   pragma Export
     (Convention    => C,
      Entity        => Handle_Interrupt_TIMER5_COMPC,
      External_Name => TIMER5_COMPC);

   procedure Handle_Interrupt_TIMER5_OVF is null;
   pragma Machine_Attribute
     (Entity         => Handle_Interrupt_TIMER5_OVF,
      Attribute_Name => "signal");
   pragma Export
     (Convention    => C,
      Entity        => Handle_Interrupt_TIMER5_OVF,
      External_Name => TIMER5_OVF);

   procedure Handle_Interrupt_USART2_RX;
   pragma Machine_Attribute
     (Entity         => Handle_Interrupt_USART2_RX,
      Attribute_Name => "signal");
   pragma Export
     (Convention    => C,
      Entity        => Handle_Interrupt_USART2_RX,
      External_Name => USART2_RX);

   procedure Handle_Interrupt_USART2_UDRE is null;
   pragma Machine_Attribute
     (Entity         => Handle_Interrupt_USART2_UDRE,
      Attribute_Name => "signal");
   pragma Export
     (Convention    => C,
      Entity        => Handle_Interrupt_USART2_UDRE,
      External_Name => USART2_UDRE);

   procedure Handle_Interrupt_USART2_TX is null;
   pragma Machine_Attribute
     (Entity         => Handle_Interrupt_USART2_TX,
      Attribute_Name => "signal");
   pragma Export
     (Convention    => C,
      Entity        => Handle_Interrupt_USART2_TX,
      External_Name => USART2_TX);

   procedure Handle_Interrupt_USART3_RX;
   pragma Machine_Attribute
     (Entity         => Handle_Interrupt_USART3_RX,
      Attribute_Name => "signal");
   pragma Export
     (Convention    => C,
      Entity        => Handle_Interrupt_USART3_RX,
      External_Name => USART3_RX);

   procedure Handle_Interrupt_USART3_UDRE is null;
   pragma Machine_Attribute
     (Entity         => Handle_Interrupt_USART3_UDRE,
      Attribute_Name => "signal");
   pragma Export
     (Convention    => C,
      Entity        => Handle_Interrupt_USART3_UDRE,
      External_Name => USART3_UDRE);

   procedure Handle_Interrupt_USART3_TX is null;
   pragma Machine_Attribute
     (Entity         => Handle_Interrupt_USART3_TX,
      Attribute_Name => "signal");
   pragma Export
     (Convention    => C,
      Entity        => Handle_Interrupt_USART3_TX,
      External_Name => USART3_TX);
#end if;

end AVR.INTERRUPTS;
