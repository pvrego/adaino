-- =============================================================================
-- Package body AVR.IMAGE
-- =============================================================================
package body IMAGE is

   procedure U8_Img_Right (Data : Unsigned_8; Target : out String_U8) is
      D : Unsigned_8 := Data;
   begin
      for Index in Target'Range loop
         Target (Index) := ' ';
      end loop;

      if D >= 100 then
         Target (Target'First) := Character'Val (48 + (D / 100));
         D := D rem 100;
      else
         Target (Target'First) := ' ';
      end if;

      if D >= 10 or else Data >= 100 then
         Target (Target'First + 1) := Character'Val (48 + (D / 10));
      else
         Target (Target'First + 1) := ' ';
      end if;

      Target (Target'First + 2)  := Character'Val (48 + (D rem 10));
   exception
      when others => null;
   end U8_Img_Right;

   function Unsigned_8_To_String_Simon (Input : Unsigned_8) return String_3 is
      Result : String_3 := (others => ' ');
      Digit : Unsigned_8;
      Rest_Of_Number : Unsigned_8;
   begin
      Digit := Input mod 10;
      Rest_Of_Number := Input / 10;

      for J in reverse Result'Range loop
         if Digit /= 0
           or else Rest_Of_Number /= 0
           or else J = Result'Last then
            Result (J)
              := Character'Val (Character'Pos ('0') + Integer (Digit));
         end if;
         Digit := Rest_Of_Number mod 10;
         Rest_Of_Number := Rest_Of_Number / 10;
         -- could exit when Rest_Of_Number = 0
      end loop;
      return Result;
   exception
      when others => return "   ";
   end Unsigned_8_To_String_Simon;

   function Unsigned_8_To_String_Shark8 (Input : Unsigned_8) return String_3 is
      -- A temporary variable for manipulation, initialized to input.
      Working : Unsigned_8 := Input;
   begin
      -- Extended return, we do not have to initialize any characters
      -- because they will be in range '0'..'9' with leading zeros.
      return Result : String_3 do
         -- We assign the digit it's proper value, based on its
         -- position within the string.
         for Digit in reverse Result'Range loop
            Result (Digit) := Character'Val (
                                             -- We add the mod 10 value of working
                                             -- to the value of '0' to get the proper
                                             -- digit-character.
                                             Natural (Working mod 10) + Character'Pos('0')
                                            );
            -- We adjust our working-variable, by dividing it by 10.
            Working := Working / 10;
         end loop;
      end return;
   exception
      when others => return "   ";
   end Unsigned_8_To_String_Shark8;

   function String_To_Unsigned_8 (Input : String_U8) return Unsigned_8 is
      Result : Unsigned_8 := 0;
   begin
      for Digit in Input'Range loop
         Result := 10 * Result + (Character'Pos (Input (Digit)) - Character'Pos ('0'));
      end loop;

      return Result;
   end String_To_Unsigned_8;

   function String_To_Unsigned_32 (Input : String_U8) return Unsigned_32 is
      Result : Unsigned_32 := 0;
   begin
      for Digit in Input'Range loop
         Result := 10 * Result + (Character'Pos (Input (Digit)) - Character'Pos ('0'));
      end loop;

      return Result;
   end String_To_Unsigned_32;

   function String_To_Unsigned_8_Shark8 (Input : String_3) return Unsigned_8 is
      Working : String_3    := Input;
      Index   : Unsigned_8 := 1;
   begin
      -- Preprocessing string: spaces are treated as 0.
      for C of Working loop
         C := (if C = ' ' then '0' else C);
         -- throw error if invalid characters exist.
         if C not in Digit then
            raise Numeric_Error;
         end if;
         -- Note a case statement might habe been
         -- nore appropriate for this block.
      end loop;

      return Result : Unsigned_8 := 0 do
         for C of reverse Working loop
            -- We add the current character's value, multiplied
            -- by its position, to modify result.
            Result:= Result +
              Index * (Character'Pos(C) - Character'Pos('0'));
            -- The following works because wrap-around isn't an error.
            -- If we weren't using Unsigned_8 we would need a cast.
            Index:= Index * 10;
         end loop;
      end return;

   exception
      when others => return 0;
   end String_To_Unsigned_8_Shark8;

   function Compare_String_U8 (Left, Right : in String_U8) return Boolean is
      Return_Test : Boolean := True;
   begin
      if Left'Length /= Right'Length then
         raise Constraint_Error;
      end if;

      for Index in Left'Range loop
         if Left (Index) /= Right (Index) then
            Return_Test := False;
            exit;
         end if;
      end loop;

      return Return_Test;
   exception
      when others => return False;
   end Compare_String_U8;

end IMAGE;
