package AVR.ADC is

   type Analog_Comparator_Control_And_Status_Register_Type is
      record
         ACIS0 : Boolean; -- Analog Comparator Interrupt Mode Select Bit 0
         ACIS1 : Boolean; -- Analog Comparator Interrupt Mode Select Bit 1
         ACIC  : Boolean; -- Analog Comparator Input Capture Enable
         ACIE  : Boolean; -- Analog Comparator Interrupt Enable
         ACI   : Boolean; -- Analog Comparator Interrupt Flag
         ACO   : Boolean; -- Analog Comparator Output
         ACBG  : Boolean; -- Analog Comparator Bandgap Select
         ACD   : Boolean; -- Analog Comparator Disable
      end record;
   pragma Pack (Analog_Comparator_Control_And_Status_Register_Type);
   for Analog_Comparator_Control_And_Status_Register_Type'Size use BYTE_SIZE;

   Reg_ACSR : Analog_Comparator_Control_And_Status_Register_Type;
   for Reg_ACSR'Address use System'To_Address (16#50#);


   type ADC_Multiplexer_Selection_Register_Type is
      record
#if MCU="ATMEGA2560" then
         MUX   : Bit_Array_Type (0 .. 4); -- Analog Channel and Gain Selection Bits
#elsif MCU="ATMEGA328P" then
         MUX   : Bit_Array_Type (0 .. 3); -- Analog Channel and Gain Selection Bits
         Spare : Spare_Type (0 .. 0);
#end if;
         ADLAR : Boolean; -- ADC Left Adjust Result
         REFS  : Bit_Array_Type (0 .. 1); -- Reference Selection Bits
      end record;
   pragma Pack (ADC_Multiplexer_Selection_Register_Type);
   for ADC_Multiplexer_Selection_Register_Type'Size use BYTE_SIZE;

   Reg_ADMUX : ADC_Multiplexer_Selection_Register_Type;
   for Reg_ADMUX'Address use System'To_Address (16#7C#);

   type ADC_Control_And_Status_Register_B_Type is
      record
         ADTS     : Bit_Array_Type (0 .. 2); -- ADC Auto Trigger Source
#if MCU="ATMEGA2560" then
         MUX5     : Boolean; -- Analog Channel and Gain Selection Bit
         Spare_45 : Spare_Type (0 .. 1);
#elsif MCU="ATMEGA328P" then
         Spare_345 : Spare_Type (0 .. 2);
#end if;
         ACME     : Boolean; -- Analog Comparator Multiplexer Enable
         Spare_7  : Spare_Type (0 .. 0);
      end record;
   pragma Pack (ADC_Control_And_Status_Register_B_Type);
   for ADC_Control_And_Status_Register_B_Type'Size use BYTE_SIZE;

   Reg_ADCSRB : ADC_Control_And_Status_Register_B_Type;
   for Reg_ADCSRB'Address use System'To_Address (16#7B#);

   type ADC_Control_And_Status_Register_A_Type is
      record
         ADPS  : Bit_Array_Type (0 .. 2); -- ADC Prescaler Select Bits
         ADIE  : Boolean; -- ADC Interrupt Enable
         ADIF  : Boolean; -- ADC Interrupt Flag
         ADATE : Boolean; -- ADC Auto Trigger Enable
         ADSC  : Boolean; -- ADC Start Conversion
         ADEN  : Boolean; -- ADC Enable
      end record;
   pragma Pack (ADC_Control_And_Status_Register_A_Type);
   for ADC_Control_And_Status_Register_A_Type'Size use BYTE_SIZE;

   Reg_ADCSRA : ADC_Control_And_Status_Register_A_Type;
   for Reg_ADCSRA'Address use System'To_Address (16#7A#);

   type ADC_Data_Type is new Byte_Array_Type (0 .. 1);

   Reg_ADC_Data : ADC_Data_Type;
   for Reg_ADC_Data'Address use System'To_Address (16#7A#);

   type ADC_Digital_Input_Disable_Register_0_7_Type is new
     Bit_Array_Type (0 .. 7);
   for ADC_Digital_Input_Disable_Register_0_7_Type'Size use BYTE_SIZE;

   Reg_DIDR0 : ADC_Digital_Input_Disable_Register_0_7_Type;
   for Reg_DIDR0'Address use System'To_Address (16#7E#);

#if MCU="ATMEGA2560" then
   type ADC_Digital_Input_Disable_Register_8_15_Type is new
     Bit_Array_Type (8 .. 15);
   for ADC_Digital_Input_Disable_Register_8_15_Type'Size use BYTE_SIZE;
#end if;

   Reg_DIDR2 : ADC_Digital_Input_Disable_Register_8_15_Type;
   for Reg_DIDR2'Address use System'To_Address (16#7D#);

   type AIN_Digital_Input_Disable_Type is
      record
         AIND : Bit_Array_Type (0 .. 1);
         Spare : Spare_Type (0 .. 5);
      end record;
   pragma Pack (AIN_Digital_Input_Disable_Type);
   for AIN_Digital_Input_Disable_Type'Size use BYTE_SIZE;

   Reg_DIDR1 : AIN_Digital_Input_Disable_Type;
   for Reg_DIDR1'Address use System'To_Address (16#7F#);

end AVR.ADC;
