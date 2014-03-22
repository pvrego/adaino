with Interfaces; use Interfaces;
with AVR;
with AVR.USART;

-- =============================================================================
-- Package AVR.IMAGE
--
-- String types and methods used by AVR.
-- =============================================================================
package IMAGE is

   procedure U8_Img_Right (Data : Unsigned_8; Target : out AVR.USART.String_U8);

   subtype String_3 is AVR.USART.String_U8 (1 .. 3);
   subtype Digit is Character range '0' .. '9';
   function Unsigned_8_To_String_Simon (Input : Interfaces.Unsigned_8) return String_3;
   function Unsigned_8_To_String_Shark8 (Input : Interfaces.Unsigned_8) return String_3;
   function String_To_Unsigned_8 (Input : AVR.USART.String_U8) return Unsigned_8;
   function String_To_Unsigned_8_Shark8 (Input : String_3) return Unsigned_8;
   function String_To_Unsigned_32 (Input : AVR.USART.String_U8) return Unsigned_32;

   function Compare_String_U8 (Left, Right : in AVR.USART.String_U8) return Boolean;

end IMAGE;
