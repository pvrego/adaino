with Interfaces; use Interfaces;
with Unchecked_Conversion;

-- =============================================================================
-- Package AVR
--
-- Maps general spec from AVR micro-controllers.
-- =============================================================================
package AVR is

   procedure Wait (Cycles : Long_Integer);

   --+--------------------------------------------------------------------------
   --| Constants
   --+--------------------------------------------------------------------------

   TIME_WARNING_FLAG : constant Boolean := False;
   BYTE_SIZE : constant := 8;

   --+--------------------------------------------------------------------------
   --| General Purpose Types
   --+--------------------------------------------------------------------------

   type Byte_Type is new Unsigned_8;
   for Byte_Type'Size use BYTE_SIZE;

   type Word_Type is new Unsigned_16;
   for Word_Type'Size use 2 * BYTE_SIZE;

   type Bit_Array_Type is array (Natural range <>) of Boolean;
   for Bit_Array_Type'Component_Size use 1;

   type Byte_Array_Type is array (Natural range <>) of Byte_Type;
   for Byte_Array_Type'Component_Size use BYTE_SIZE;

   --+--------------------------------------------------------------------------
   --| Spare Types
   --+--------------------------------------------------------------------------

   type Spare_Bit_Types is range 0 .. 1;

   type Spare_Type is array (Natural range <>) of Spare_Bit_Types;
   for Spare_Type'Component_Size use 1;

   --+--------------------------------------------------------------------------
   --| Conversion Types and Services
   --+--------------------------------------------------------------------------

   type Bit_Array_8_Bit_Spare_7_Bit_Type is
      record
         Spare : Spare_Type (0 .. 0);
         Bit_Array_7 : Bit_Array_Type (1 .. 7);
      end record;
   pragma Pack (Bit_Array_8_Bit_Spare_7_Bit_Type);
   for Bit_Array_8_Bit_Spare_7_Bit_Type'Size use BYTE_SIZE;

  function To_Bit_Array_7_Bit is new
     Unchecked_Conversion
       (Source => Byte_Type,
        Target => Bit_Array_8_Bit_Spare_7_Bit_Type);
end AVR;
