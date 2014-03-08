with Interfaces; use Interfaces;
with Ada.Unchecked_Conversion;
with AVR;

-- =============================================================================
-- Package AVR.IMAGE
--
-- String types and methods used by AVR.
--
-- $Id: image.ads 593 2014-01-10 14:22:32Z pvrego $
-- =============================================================================
package IMAGE is

   function To_Char is new Ada.Unchecked_Conversion
     (Target => Character,
      Source => Unsigned_8);

   function To_Char is new Ada.Unchecked_Conversion
     (Target => Character,
      Source => AVR.Byte_Type);

   function To_Unsigned_8 is new Ada.Unchecked_Conversion
     (Target => Unsigned_8,
      Source => Character);

   type String_U8 is array (Unsigned_8 range <>) of Character;
   COMMAND_FULL_SIZE : constant Unsigned_8 := 40;
   subtype String_U8_Command_Full is String_U8 (1 .. COMMAND_FULL_SIZE);
   subtype String_U8_Command_Less_Start_Flag is String_U8 (String_U8_Command_Full'First .. String_U8_Command_Full'Last - 1);

   procedure U8_Img_Right (Data : Unsigned_8; Target : out String_U8);

   subtype String_3 is String_U8 (1 .. 3);
   subtype Digit is Character range '0' .. '9';
   function Unsigned_8_To_String_Simon (Input : Interfaces.Unsigned_8) return String_3;
   function Unsigned_8_To_String_Shark8 (Input : Interfaces.Unsigned_8) return String_3;
   function String_To_Unsigned_8 (Input : String_U8) return Unsigned_8;
   function String_To_Unsigned_8_Shark8 (Input : String_3) return Unsigned_8;
   function String_To_Unsigned_32 (Input : String_U8) return Unsigned_32;

   function Compare_String_U8 (Left, Right : in String_U8) return Boolean;

end IMAGE;
