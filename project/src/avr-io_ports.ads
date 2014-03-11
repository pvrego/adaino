with System;

-- =============================================================================
-- Package AVR.IO_PORTS
--
-- Handles the Pin/DDR/Port I/Os.
-- =============================================================================
package AVR.IO_PORTS is

   type Data_Pin_Type is
      record
         PIN  : Bit_Array_Type (0 .. 7); -- Port Input Pin
         DDR  : Bit_Array_Type (0 .. 7); -- Data Direction Register
         PORT : Bit_Array_Type (0 .. 7); -- Port Data Register
      end record;
   for Data_Pin_Type'Size use 3 * BYTE_SIZE;

   Reg_Pin_A : Data_Pin_Type;
   for Reg_Pin_A'Address use System'To_Address (16#20#);

   Reg_Pin_B : Data_Pin_Type;
   for Reg_Pin_B'Address use System'To_Address (16#23#);

   Reg_Pin_C : Data_Pin_Type;
   for Reg_Pin_C'Address use System'To_Address (16#26#);

   Reg_Pin_D : Data_Pin_Type;
   for Reg_Pin_D'Address use System'To_Address (16#29#);

   Reg_Pin_E : Data_Pin_Type;
   for Reg_Pin_E'Address use System'To_Address (16#2C#);

   Reg_Pin_F : Data_Pin_Type;
   for Reg_Pin_F'Address use System'To_Address (16#2F#);

   Reg_Pin_G : Data_Pin_Type;
   for Reg_Pin_G'Address use System'To_Address (16#32#);

   Reg_Pin_H : Data_Pin_Type;
   for Reg_Pin_H'Address use System'To_Address (16#100#);

   Reg_Pin_J : Data_Pin_Type;
   for Reg_Pin_J'Address use System'To_Address (16#103#);

   Reg_Pin_K : Data_Pin_Type;
   for Reg_Pin_K'Address use System'To_Address (16#106#);

   Reg_Pin_L : Data_Pin_Type;
   for Reg_Pin_L'Address use System'To_Address (16#109#);

end AVR.IO_PORTS;
