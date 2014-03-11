with System;

-- =============================================================================
-- Package AVR.MCU
--
-- Maps AVR micro-controllers.
-- =============================================================================
package AVR.MCU is

   F_CPU : constant := 16_000_000;

#if MCU="ATMEGA2560" then
   type On_Chip_Debug_Register_Type is
      record
         LSB      : Boolean;
         Spare    : Spare_Type (0 .. 5);
         MSB_IDRD : Boolean;
      end record;
   pragma Pack (On_Chip_Debug_Register_Type);
   for On_Chip_Debug_Register_Type'Size use BYTE_SIZE;
#end if;

   type MCU_Status_Register_Type is
      record
         PORF  : Boolean; -- Power-on Reset Flag
         EXTRF : Boolean; -- External Reset Flag
         BORF  : Boolean; -- Brown-out Reset Flag
         WDRF  : Boolean; -- Watchdog Reset Flag
#if MCU="ATMEGA2560" then
         JTRF  : Boolean; -- JTAG Reset Flag
         Spare : Spare_Type (0 .. 2);
#elsif MCU="ATMEGA328P" then
         Spare : Spare_Type (0 .. 3);
#end if;
      end record;
   pragma Pack (MCU_Status_Register_Type);
   for MCU_Status_Register_Type'Size use BYTE_SIZE;

   type MCU_Control_Register_Type is
      record
         IVCE     : Boolean; -- Interrupt Vector Select;
         IVSEL    : Boolean; -- Interrupt Vector Change Enable
         Spare_23 : Spare_Type (0 .. 1);
         PUD      : Boolean; -- Pull-up Disable
#if MCU="ATMEGA2560" then
         Spare_56 : Spare_Type (0 .. 1);
         JTD      : Boolean; -- JTAG Interface Disable
#elsif MCU="ATMEGA328P" then
         BODSE    : Boolean; -- BOD Sleep Enable
         BODS     : Boolean; -- BOD Sleep
#end if;
      end record;
   pragma Pack (MCU_Control_Register_Type);
   for MCU_Control_Register_Type'Size use BYTE_SIZE;

   type AVR_Status_Register_Type is
      record
         C : Boolean; -- Carry Flag
         Z : Boolean; -- Zero Flag
         N : Boolean; -- Negative Flag
         V : Boolean; -- Two's Complement Overflow Flag
         S : Boolean; -- Sign Bit, S = N xor V
         H : Boolean; -- Half Carry Flag
         T : Boolean; -- Bit Copy Storage
         I : Boolean; -- Global Interrupt Enable
      end record;
   pragma Pack (AVR_Status_Register_Type);
   for AVR_Status_Register_Type'Size use BYTE_SIZE;

#if MCU="ATMEGA2560" then
   Reg_OCDR : On_Chip_Debug_Register_Type;
   for Reg_OCDR'Address use System'To_Address (16#51#);
#end if;

   Reg_MCUSR : MCU_Status_Register_Type;
   for Reg_MCUSR'Address use System'To_Address (16#54#);

   Reg_MCUCR : MCU_Control_Register_Type;
   for Reg_MCUCR'Address use System'To_Address (16#55#);

   Reg_RAMPZ : Bit_Array_Type (0 .. 7); -- Extended Z-pointer Register for ELPM/SPM
   for Reg_RAMPZ'Address use System'To_Address (16#5B#);

   Reg_EIND : Bit_Array_Type (0 .. 7); -- Extended Indirect Register
   for Reg_EIND'Address use System'To_Address (16#5C#);

   Reg_SP : Byte_Array_Type (0 .. 1); -- Stack Pointer
   for Reg_SP'Address use System'To_Address (16#5D#);

   Reg_SREG : AVR_Status_Register_Type;
   for Reg_SREG'Address use System'To_Address (16#5F#);

   type Clock_Prescale_Register_Type is
      record
         CLKPS  : Bit_Array_Type (0 .. 3); -- Clock Prescaler Select Bits
         Spare  : Spare_Type (0 .. 2);
         CLKPCE : Boolean; -- Clock Prescaler Change Enable
      end record;
   pragma Pack (Clock_Prescale_Register_Type);
   for Clock_Prescale_Register_Type'Size use BYTE_SIZE;

   Reg_CLKPR        : Clock_Prescale_Register_Type;
   for Reg_CLKPR'Address use System'To_Address (16#61#);

   type Oscillator_Calibration_Value is new Byte_Type;

   Reg_OSCCAL : Oscillator_Calibration_Value;
   for Reg_OSCCAL'Address use System'To_Address (16#66#);

end AVR.MCU;
