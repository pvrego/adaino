with Interfaces; use Interfaces;
with Unchecked_Conversion;

-- =============================================================================
-- Package AVR
--
-- Maps general spec from AVR micro-controllers.
--
-- $Id: avr.ads 82 2013-11-30 19:49:10Z pvrego $
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

   type Bit_Array_2_Bit_Type is array (0 .. 1) of Boolean;
   pragma Pack (Bit_Array_2_Bit_Type);
   for Bit_Array_2_Bit_Type'Size use 2;

   type Bit_Array_3_Bit_Type is array (0 .. 2) of Boolean;
   pragma Pack (Bit_Array_3_Bit_Type);
   for Bit_Array_3_Bit_Type'Size use 3;

   type Bit_Array_4_Bit_Type is array (0 .. 3) of Boolean;
   pragma Pack (Bit_Array_4_Bit_Type);
   for Bit_Array_4_Bit_Type'Size use 4;

   type Bit_Array_5_Bit_Type is array (0 .. 4) of Boolean;
   pragma Pack (Bit_Array_5_Bit_Type);
   for Bit_Array_5_Bit_Type'Size use 5;

   type Bit_Array_7_Bit_Type is array (0 .. 4) of Boolean;
   pragma Pack (Bit_Array_7_Bit_Type);
   for Bit_Array_7_Bit_Type'Size use 5;

   type Bit_Array_Byte_Type is array (0 .. 7) of Boolean;
   pragma Pack (Bit_Array_Byte_Type);
   for Bit_Array_Byte_Type'Size use BYTE_SIZE;

   type Bit_Array_Word_Type is array (0 .. 15) of Boolean;
   pragma Pack (Bit_Array_Word_Type);
   for Bit_Array_Word_Type'Size use 2 * BYTE_SIZE;

   type Bit_Array_3_Byte_Type is array (0 .. 23) of Boolean;
   pragma Pack (Bit_Array_3_Byte_Type);
   for Bit_Array_3_Byte_Type'Size use 3 * BYTE_SIZE;

   type Byte_Array_Word_Type is array (0 .. 1) of Byte_Type;
   for Byte_Array_Word_Type'Size use 2 * BYTE_SIZE;

   --+--------------------------------------------------------------------------
   --| Spare Types
   --+--------------------------------------------------------------------------

   type Spare_1_Type is new Boolean;
   for Spare_1_Type'Size use 1;

   type Spare_2_Type is array (1 .. 2) of Boolean;
   pragma Pack (Spare_2_Type);
   for Spare_2_Type'Size use 2;

   type Spare_3_Type is array (1 .. 3) of Boolean;
   pragma Pack (Spare_3_Type);
   for Spare_3_Type'Size use 3;

   type Spare_4_Type is array (1 .. 4) of Boolean;
   pragma Pack (Spare_4_Type);
   for Spare_4_Type'Size use 4;

   type Spare_5_Type is array (1 .. 5) of Boolean;
   pragma Pack (Spare_5_Type);
   for Spare_5_Type'Size use 5;

   type Spare_6_Type is array (1 .. 5) of Boolean;
   pragma Pack (Spare_6_Type);
   for Spare_6_Type'Size use 6;

   type Spare_Byte_Type is new Byte_Type;
   for Spare_Byte_Type'Size use BYTE_SIZE;

   type Spare_Word_Type is new Word_Type;
   for Spare_Word_Type'Size use 2 * BYTE_SIZE;

   type Spare_3_Byte_Type is array (1 .. 3) of Byte_Type;
   pragma Pack (Spare_3_Byte_Type);
   for Spare_3_Byte_Type'Size use 3 * BYTE_SIZE;

   type Spare_5_Byte_Type is array (1 .. 5) of Byte_Type;
   pragma Pack (Spare_5_Byte_Type);
   for Spare_5_Byte_Type'Size use 5 * BYTE_SIZE;

   type Spare_7_Byte_Type is array (1 .. 7) of Byte_Type;
   pragma Pack (Spare_7_Byte_Type);
   for Spare_7_Byte_Type'Size use 7 * BYTE_SIZE;

   type Spare_9_Byte_Type is array (1 .. 9) of Byte_Type;
   pragma Pack (Spare_9_Byte_Type);
   for Spare_9_Byte_Type'Size use 9 * BYTE_SIZE;

   type Spare_20_Byte_Type is array (1 .. 20) of Byte_Type;
   pragma Pack (Spare_20_Byte_Type);
   for Spare_20_Byte_Type'Size use 20 * BYTE_SIZE;

   type Spare_36_Byte_Type is array (1 .. 36) of Byte_Type;
   pragma Pack (Spare_36_Byte_Type);
   for Spare_36_Byte_Type'Size use 36 * BYTE_SIZE;

   type Spare_41_Byte_Type is array (1 .. 41) of Byte_Type;
   pragma Pack (Spare_41_Byte_Type);
   for Spare_41_Byte_Type'Size use 41 * BYTE_SIZE;

   --+--------------------------------------------------------------------------
   --| Conversion Types and Services
   --+--------------------------------------------------------------------------

   type Bit_Array_8_Bit_Spare_7_Bit_Type is
      record
         Spare : Spare_1_Type;
         Bit_Array_7 : Bit_Array_7_Bit_Type;
      end record;
   pragma Pack (Bit_Array_8_Bit_Spare_7_Bit_Type);
   for Bit_Array_8_Bit_Spare_7_Bit_Type'Size use BYTE_SIZE;

  function To_Bit_Array_7_Bit is new
     Unchecked_Conversion
       (Source => Byte_Type,
        Target => Bit_Array_8_Bit_Spare_7_Bit_Type);
end AVR;
