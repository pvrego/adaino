package AVR.MCU.IO_MEMORY is


   type EEPROM_Address_Word_Type is new Byte_Array_Type (0 .. 1);

   Reg_EEAR : EEPROM_Address_Word_Type;
   for Reg_EEAR'Address use System'To_Address (16#41#);

   type EEPROM_Data_Register_Type is new Byte_Type;

   Reg_EEDR : EEPROM_Data_Register_Type;
   for Reg_EEDR'Address use System'To_Address (16#40#);

   type Eeprom_Control_Register_Type is
      record
         EERE  : Boolean; -- EEPROM Read Enable
         EEPE  : Boolean; -- EEPROM Programming Enable
         EEMPE : Boolean; -- EEPROM Master Programming Enable
         EERIE : Boolean; -- EEPROM Ready Interrupt Enable
         EEPM0 : Boolean; -- EEPROM Programming Mode Bit 0
         EEPM1 : Boolean; -- EEPROM Programming Mode Bit 1
         Spare : Spare_Type (0 .. 1);
      end record;
   pragma Pack (Eeprom_Control_Register_Type);
   for Eeprom_Control_Register_Type'Size use BYTE_SIZE;

   Reg_EECR : Eeprom_Control_Register_Type;
   for Reg_EECR'Address use System'To_Address (16#3F#);

   -- =============================
   -- General Purpose I/O Registers
   -- =============================

   type GPIO_Type is new Byte_Type;

   Reg_GPIOR0 : GPIO_Type;
   for Reg_GPIOR0'Address use System'To_Address (16#3E#);

   Reg_GPIOR1 : GPIO_Type;
   for Reg_GPIOR1'Address use System'To_Address (16#4A#);

   Reg_GPIOR2 : GPIO_Type;
   for Reg_GPIOR2'Address use System'To_Address (16#4B#);

   -- =========================
   -- External Memory registers
   -- =========================

#if MCU="ATMEGA2560" then
   type External_Memory_Control_A_Type is
      record
         SRWL : Bit_Array_Type (0 .. 1); -- Wait-state Select Bits for Lower Sector
         SRWH : Bit_Array_Type (0 .. 1); -- Wait-state Select Bits for Upper Sector
         SRL0 : Bit_Array_Type (0 .. 2); -- Wait-state Sector Limit Bits
         SRE  : Boolean; -- External SRAM/XMEM Enable
      end record;
   pragma Pack (External_Memory_Control_A_Type);
   for External_Memory_Control_A_Type'Size use BYTE_SIZE;

   type External_Memory_Control_B_Type is
      record
         XMM   : Bit_Array_Type (0 .. 2); -- External Memory High Mask Bits
         Spare : Spare_Type (0 .. 3);
         XMBK  : Boolean; -- External Memory Bus-keeper Enable
      end record;
   pragma Pack (External_Memory_Control_B_Type);
   for External_Memory_Control_B_Type'Size use BYTE_SIZE;
#end if;

   Reg_XMCRA : External_Memory_Control_A_Type;
   for Reg_XMCRA'Address use System'To_Address (16#74#);

   Reg_XMCRB : External_Memory_Control_B_Type;
   for Reg_XMCRB'Address use System'To_Address (16#75#);

end AVR.MCU.IO_MEMORY;
