with Ada.Unchecked_Conversion;
with AVR.MCU;

-- =============================================================================
-- Package body AVR.USART
-- =============================================================================
package body AVR.USART is

   procedure Initialize
     (In_Port  : Port_Type := USART_PORT_DEFAULT;
      In_Setup : Setup_Type := USART_SETUP_DEFAULT)
   is
      UBRR_Value : Unsigned_16;

      procedure Set_Sync_Mode is
      begin
         case In_Port is
            when USART0 =>
               case In_Setup.Sync_Mode is
                  when ASYNCHRONOUS => null;
                  when SYNCHRONOUS =>
                     Reg_USART0.UCSRC.UMSEL (0) := TRUE;

                  when MASTER_SPI =>
                     Reg_USART0.UCSRC.UMSEL (0) := TRUE;
                     Reg_USART0.UCSRC.UMSEL (1) := TRUE;
               end case;

#if MCU="ATMEGA2560" then
            when USART1 =>
               case In_Setup.Sync_Mode is
                  when ASYNCHRONOUS => null;
                  when SYNCHRONOUS =>
                     Reg_USART1.UCSRC.UMSEL (0) := TRUE;

                  when MASTER_SPI =>
                     Reg_USART1.UCSRC.UMSEL (0) := TRUE;
                     Reg_USART1.UCSRC.UMSEL (1) := TRUE;
               end case;

            when USART2 =>
               case In_Setup.Sync_Mode is
                  when ASYNCHRONOUS => null;
                  when SYNCHRONOUS =>
                     Reg_USART2.UCSRC.UMSEL (0) := TRUE;

                  when MASTER_SPI =>
                     Reg_USART2.UCSRC.UMSEL (0) := TRUE;
                     Reg_USART2.UCSRC.UMSEL (1) := TRUE;
               end case;

            when USART3 =>
               case In_Setup.Sync_Mode is
                  when ASYNCHRONOUS => null;
                  when SYNCHRONOUS =>
                     Reg_USART3.UCSRC.UMSEL (0) := TRUE;

                  when MASTER_SPI =>
                     Reg_USART3.UCSRC.UMSEL (0) := TRUE;
                     Reg_USART3.UCSRC.UMSEL (1) := TRUE;
               end case;
#end if;
         end case;
      exception
         when others => null;
      end Set_Sync_Mode;

      procedure Set_Double_Speed is
      begin
         case In_Port is
            when USART0 =>
               if In_Setup.Double_Speed then
                  Reg_USART0.UCSRA.U2X := TRUE;
               end if;

#if MCU="ATMEGA2560" then
            when USART1 =>
               if In_Setup.Double_Speed then
                  Reg_USART1.UCSRA.U2X := TRUE;
               end if;

            when USART2 =>
               if In_Setup.Double_Speed then
                  Reg_USART2.UCSRA.U2X := TRUE;
               end if;
            when USART3 =>
               if In_Setup.Double_Speed then
                  Reg_USART3.UCSRA.U2X := TRUE;
               end if;
#end if;
         end case;
      exception
         when others => null;
      end Set_Double_Speed;

      procedure Set_Baud_Speed is
      begin
         if In_Setup.Sync_Mode = ASYNCHRONOUS then
            if not In_Setup.Double_Speed then
               -- Asynchronous Normal mode (U2Xn = 0);
               UBRR_Value := Unsigned_16 (AVR.MCU.F_CPU / (16 * In_Setup.Baud_Rate) - 1);
            else
               UBRR_Value := Unsigned_16 (AVR.MCU.F_CPU / (08 * In_Setup.Baud_Rate) - 1);
            end if;
         else
            UBRR_Value := Unsigned_16 (AVR.MCU.F_CPU / (02 * In_Setup.Baud_Rate) - 1);
         end if;

         case In_Port is
            when USART0 =>
               Reg_USART0.UBRR (1) := Byte_Type (Shift_Right (UBRR_Value, 8));
               Reg_USART0.UBRR (0) := Byte_Type (UBRR_Value);

#if MCU="ATMEGA2560" then
            when USART1 =>
               Reg_USART1.UBRR (1) := Byte_Type (Shift_Right (UBRR_Value, 8));
               Reg_USART1.UBRR (0) := Byte_Type (UBRR_Value);

            when USART2 =>
               Reg_USART2.UBRR (1) := Byte_Type (Shift_Right (UBRR_Value, 8));
               Reg_USART2.UBRR (0) := Byte_Type (UBRR_Value);

            when USART3 =>
               Reg_USART3.UBRR (1) := Byte_Type (Shift_Right (UBRR_Value, 8));
               Reg_USART3.UBRR (0) := Byte_Type (UBRR_Value);
#end if;
         end case;

      exception
         when others => null;
      end Set_Baud_Speed;

      procedure Set_Data_Bits is
      begin
         case In_Port is
            when USART0 =>
               case In_Setup.Data_Bits is
                  when BITS_5 => null; -- Add null;
                  when BITS_6 =>
                     Reg_USART0.UCSRC.UCSZ0 := TRUE;
                  when BITS_7 =>
                     Reg_USART0.UCSRC.UCSZ1 := TRUE;
                  when BITS_8 =>
                     Reg_USART0.UCSRC.UCSZ0 := TRUE;
                     Reg_USART0.UCSRC.UCSZ1 := TRUE;
                  when BITS_9 =>
                     Reg_USART0.UCSRC.UCSZ0 := TRUE;
                     Reg_USART0.UCSRC.UCSZ1 := TRUE;
                     Reg_USART0.UCSRB.UCSZ2 := TRUE;
               end case;

#if MCU="ATMEGA2560" then
            when USART1 =>
               case In_Setup.Data_Bits is
                  when BITS_5 => null; -- Add null;
                  when BITS_6 =>
                     Reg_USART1.UCSRC.UCSZ0 := TRUE;
                  when BITS_7 =>
                     Reg_USART1.UCSRC.UCSZ1 := TRUE;
                  when BITS_8 =>
                     Reg_USART1.UCSRC.UCSZ0 := TRUE;
                     Reg_USART1.UCSRC.UCSZ1 := TRUE;
                  when BITS_9 =>
                     Reg_USART1.UCSRC.UCSZ0 := TRUE;
                     Reg_USART1.UCSRC.UCSZ1 := TRUE;
                     Reg_USART1.UCSRB.UCSZ2 := TRUE;
               end case;

            when USART2 =>
               case In_Setup.Data_Bits is
                  when BITS_5 => null; -- Add null;
                  when BITS_6 =>
                     Reg_USART2.UCSRC.UCSZ0 := TRUE;
                  when BITS_7 =>
                     Reg_USART2.UCSRC.UCSZ1 := TRUE;
                  when BITS_8 =>
                     Reg_USART2.UCSRC.UCSZ0 := TRUE;
                     Reg_USART2.UCSRC.UCSZ1 := TRUE;
                  when BITS_9 =>
                     Reg_USART2.UCSRC.UCSZ0 := TRUE;
                     Reg_USART2.UCSRC.UCSZ1 := TRUE;
                     Reg_USART2.UCSRB.UCSZ2 := TRUE;
               end case;

            when USART3 =>
               case In_Setup.Data_Bits is
                  when BITS_5 => null; -- Add null;
                  when BITS_6 =>
                     Reg_USART3.UCSRC.UCSZ0 := TRUE;
                  when BITS_7 =>
                     Reg_USART3.UCSRC.UCSZ1 := TRUE;
                  when BITS_8 =>
                     Reg_USART3.UCSRC.UCSZ0 := TRUE;
                     Reg_USART3.UCSRC.UCSZ1 := TRUE;
                  when BITS_9 =>
                     Reg_USART3.UCSRC.UCSZ0 := TRUE;
                     Reg_USART3.UCSRC.UCSZ1 := TRUE;
                     Reg_USART3.UCSRB.UCSZ2 := TRUE;
               end case;
#end if;
         end case;

      exception
         when others => null;
      end Set_Data_Bits;

      procedure Set_Parity is
      begin
         case In_Port is
            when USART0 =>
               case In_Setup.Parity is
                  when NONE => null;
                  when EVEN =>
                     Reg_USART0.UCSRC.UPM (1) := TRUE;
                  when ODD =>
                     Reg_USART0.UCSRC.UPM (0) := TRUE;
                     Reg_USART0.UCSRC.UPM (1) := TRUE;
               end case;

#if MCU="ATMEGA2560" then
            when USART1 =>
               case In_Setup.Parity is
                  when NONE => null;
                  when EVEN =>
                     Reg_USART1.UCSRC.UPM (1) := TRUE;
                  when ODD =>
                     Reg_USART1.UCSRC.UPM (0) := TRUE;
                     Reg_USART1.UCSRC.UPM (1) := TRUE;
               end case;

            when USART2 =>
               case In_Setup.Parity is
                  when NONE => null;
                  when EVEN =>
                     Reg_USART2.UCSRC.UPM (1) := TRUE;
                  when ODD =>
                     Reg_USART2.UCSRC.UPM (0) := TRUE;
                     Reg_USART2.UCSRC.UPM (1) := TRUE;
               end case;

            when USART3 =>
               case In_Setup.Parity is
                  when NONE => null;
                  when EVEN =>
                     Reg_USART3.UCSRC.UPM (1) := TRUE;
                  when ODD =>
                     Reg_USART3.UCSRC.UPM (0) := TRUE;
                     Reg_USART3.UCSRC.UPM (1) := TRUE;
               end case;
#end if;
         end case;
      exception
         when others => null;
      end Set_Parity;

      procedure Set_Stop_Bits is
      begin
         case In_Port is
            when USART0 =>
               if In_Setup.Stop_Bits = 2 then
                  Reg_USART0.UCSRC.USBS := TRUE;
               end if;

#if MCU="ATMEGA2560" then
            when USART1 =>
               if In_Setup.Stop_Bits = 2 then
                  Reg_USART1.UCSRC.USBS := TRUE;
               end if;

            when USART2 =>
               if In_Setup.Stop_Bits = 2 then
                  Reg_USART2.UCSRC.USBS := TRUE;
               end if;

            when USART3 =>
               if In_Setup.Stop_Bits = 2 then
                  Reg_USART3.UCSRC.USBS := TRUE;
               end if;
#end if;
         end case;

      exception
         when others => null;
      end Set_Stop_Bits;

      procedure Clear_Registers
      is
   begin
         case In_Port is
            when USART0 =>
         AVR.USART.Reg_USART0.UCSRA := (others => <>);
         AVR.USART.Reg_USART0.UCSRB := (others => <>);
         AVR.USART.Reg_USART0.UCSRC := (others => <>);

#if MCU="ATMEGA2560" then
            when USART1 =>
               AVR.USART.Reg_USART1.UCSRA := (others => <>);
               AVR.USART.Reg_USART1.UCSRB := (others => <>);
               AVR.USART.Reg_USART1.UCSRC := (others => <>);

            when USART2 =>
               AVR.USART.Reg_USART2.UCSRA := (others => <>);
               AVR.USART.Reg_USART2.UCSRB := (others => <>);
               AVR.USART.Reg_USART2.UCSRC := (others => <>);

            when USART3 =>
               AVR.USART.Reg_USART3.UCSRA := (others => <>);
               AVR.USART.Reg_USART3.UCSRB := (others => <>);
               AVR.USART.Reg_USART3.UCSRC := (others => <>);
#end if;
         end case;

      exception
         when others => null;
      end Clear_Registers;

      procedure Enable_Tx_Rx_And_Maybe_RXCIE
      is
      begin
         case In_Port is
            when USART0 =>
               Reg_USART0.UCSRB.TXEN := True;
               Reg_USART0.UCSRB.RXEN := True;
               Reg_USART0.UCSRB.RXCIE := (In_Setup.Model = INTERRUPTIVE);

            when USART1 =>
               Reg_USART1.UCSRB.TXEN := True;
               Reg_USART1.UCSRB.RXEN := True;
               Reg_USART1.UCSRB.RXCIE := (In_Setup.Model = INTERRUPTIVE);

            when USART2 =>
               Reg_USART2.UCSRB.TXEN := True;
               Reg_USART2.UCSRB.RXEN := True;
               Reg_USART2.UCSRB.RXCIE := (In_Setup.Model = INTERRUPTIVE);

            when USART3 =>
               Reg_USART3.UCSRB.TXEN := True;
               Reg_USART3.UCSRB.RXEN := True;
               Reg_USART3.UCSRB.RXCIE := (In_Setup.Model = INTERRUPTIVE);
         end case;

      exception
         when others => null;
      end Enable_Tx_Rx_And_Maybe_RXCIE;

   begin
      Priv_Setup (In_Port) := In_Setup;

      Clear_Registers;
      Set_Sync_Mode;
      Set_Double_Speed;
      Set_Baud_Speed;
      Set_Data_Bits;
      Set_Parity;
      Set_Stop_Bits;
      Enable_Tx_Rx_And_Maybe_RXCIE;

   exception
      when others => null;
   end Initialize;

   procedure Put_Char
     (Port : Port_Type := USART0;
      Data : Character)
   is
   begin
      Put (Port => Port,
           Data => To_Unsigned_8 (Data));
   end Put_Char;

   procedure Put_Char_Acc
     (Port : Port_Type := USART0;
      Data : Character_Acc)
   is
      Data_Str : Character_Acc := Data;
   begin
      if Data_Str = null then return; end if;
      while Data_Str.all /= ASCII.NUL loop
         Put_Char (Port => Port,
              Data => Data_Str.all);
         Data_Str := Data_Str + 1;
      end loop;
   exception
      when others => null;
   end Put_Char_Acc;

   procedure Put_String_U8
     (Port : Port_Type := USART0;
      Data : String_U8)
   is
   begin
      for Index in Data'Range loop
         Put_Char (Port => Port,
              Data => Data (Index));
      end loop;
   end Put_String_U8;

   procedure Put
     (Port : Port_Type := USART0;
      Data : Unsigned_8)
   is
   begin
      -- Loop while the transmit buffer UDRn us bit ready to receive
      -- new data.

      case Port is
      when USART0 =>
         while not Reg_USART0.UCSRA.UDRE loop null; end loop;
         Reg_USART0.UDR := Byte_Type (Data);

#if MCU="ATMEGA2560" then
      when USART1 =>
         while not Reg_USART1.UCSRA.UDRE loop null; end loop;
         Reg_USART1.UDR := Byte_Type (Data);

      when USART2 =>
         while not Reg_USART2.UCSRA.UDRE loop null; end loop;
         Reg_USART2.UDR := Byte_Type (Data);

      when USART3 =>
         while not Reg_USART3.UCSRA.UDRE loop null; end loop;
         Reg_USART3.UDR := Byte_Type (Data);
#end if;
      end case;

   exception
      when others => null;
   end Put;

   procedure Put_Line
     (Port : Port_Type := USART0;
      Data : String_U8)
   is
   begin
      Put_String_U8 (Port => Port,
                     Data => Data);
      New_Line (Port => Port);
   end Put_Line;

   procedure New_Line
     (Port : Port_Type := USART0)
   is
   begin
      Put_Char (Port => Port,
           Data => ASCII.CR);
      Put_Char (Port => Port,
           Data => ASCII.LF);
   end New_Line;

   function Get_Raw (Port : Port_Type := USART0) return Unsigned_8 is
   begin

      case Port is
      when USART0 =>
         while not Reg_USART0.UCSRA.RXC loop null; end loop;
         return Unsigned_8 (Reg_USART0.UDR);

#if MCU="ATMEGA2560" then
      when USART1 =>
         while not Reg_USART1.UCSRA.RXC loop null; end loop;
         return Unsigned_8 (Reg_USART1.UDR);

      when USART2 =>
         while not Reg_USART2.UCSRA.RXC loop null; end loop;
         return Unsigned_8 (Reg_USART2.UDR);

      when USART3 =>
         while not Reg_USART3.UCSRA.RXC loop null; end loop;
         return Unsigned_8 (Reg_USART3.UDR);
#end if;
      end case;

   exception
      when others => return 0;

   end Get_Raw;

   function Get (Port : Port_Type := USART0) return Character is
   begin
      return To_Char (Get_Raw (Port));
   end Get;

   function Get_64 (Port : Port_Type := USART0) return String_U8_Command_Full is
      Curr_String : String_U8_Command_Full;
   begin
      for Index in 1 .. String_U8_Command_Full'Length loop
         Curr_String (Unsigned_8 (Index)) := Get (Port);
      end loop;
      return Curr_String;
   end Get_64;

   function Get_63 (Port : Port_Type := USART0) return String_U8_Command_Less_Start_Flag is
      Curr_String : String_U8_Command_Less_Start_Flag;
   begin
      for Index in 1 .. String_U8_Command_Less_Start_Flag'Length loop
         Curr_String (Unsigned_8 (Index)) := Get (Port);
      end loop;
      return Curr_String;
   end Get_63;

   procedure Get
     (Port : in Port_Type;
      Data : out String_U8) is
   begin
      for Index in 1 .. Data'Length loop
         Data (Unsigned_8 (Index)) := Get (Port);
      end loop;
   exception
      when others => null;
   end Get;

   procedure Get_Until_Final
     (Port       : in Port_Type;
      Final_Char : Character;
      Data       : out String_U8) is
      Curr_Char : Character := Get (Port);
   begin
      for Index in 1 .. Data'Length loop
         if Curr_Char /= Final_Char then
            Data (Unsigned_8 (Index)) := Curr_Char;
            Curr_Char := Get (Port);
         else
            Data (Unsigned_8 (Index)) := Final_Char;
         end if;
      end loop;
   exception
      when others => null;
   end Get_Until_Final;

   procedure Shift_Buffer_By_Unit
     (In_Buffer : in out Buffer_64_Type)
   is
   begin
      for Index in Buffer_64_Type'First + 1 .. Buffer_64_Type'Last loop
         In_Buffer (Index - 1) := In_Buffer (Index);
      end loop;
   end Shift_Buffer_By_Unit;

   procedure Handle_ISR_RXC
     (In_Port : in Port_Type)
   is
   begin
      Shift_Buffer_By_Unit (Priv_Receive_Buffer_64 (In_Port));

      case In_Port is
         when USART0 =>
            Priv_Receive_Buffer_64 (In_Port)(Buffer_64_Type'Last) :=
              Reg_USART0.UDR;
#if MCU="ATMEGA2560" then
         when USART1 =>
            Priv_Receive_Buffer_64 (In_Port)(Buffer_64_Type'Last) :=
              Reg_USART1.UDR;

         when USART2 =>
            Priv_Receive_Buffer_64 (In_Port)(Buffer_64_Type'Last) :=
              Reg_USART2.UDR;

         when USART3 =>
            Priv_Receive_Buffer_64 (In_Port)(Buffer_64_Type'Last) :=
              Reg_USART3.UDR;
#end if;
      end case;

      Priv_Receive_Flag (In_Port) := True;
      Priv_Receive_Flag_For_Print (In_Port) := True;
   exception
         when others => null;
   end Handle_ISR_RXC;

   function Get_Raw_Buffer
     (In_Port  : in Port_Type;
      Out_Data : out Buffer_64_Type)
      return Boolean
   is
      Curr_Success : Boolean := False;
   begin
      if Priv_Receive_Flag (In_Port) then
         Out_Data := Priv_Receive_Buffer_64 (In_Port);
         Priv_Receive_Flag (In_Port) := False;
         Curr_Success := True;
      else
         Out_Data := (others => 0);
      end if;

      return Curr_Success;
   exception
         when others => return False;
   end Get_Raw_Buffer;

   procedure Put_Buffer
     (In_Port  : in Port_Type)
   is
   begin
      if Priv_Receive_Flag (In_Port) then
         for Index in 1 .. 64 loop
            Put (Data => Unsigned_8 (Priv_Receive_Buffer_64 (In_Port)(Index)));
         end loop;
         Priv_Receive_Flag_For_Print (In_Port) := False;
         New_Line;
      end if;

   exception
         when others => null;
   end Put_Buffer;

   function Get_Setup
     (In_Port : Port_Type)
      return Setup_Type
   is
   begin
      return Priv_Setup (In_Port);
   end Get_Setup;

   -- ================
   -- = Private body =
   -- ================

   function "+" (L : Character_Acc; R : Unsigned_16) return Character_Acc is
      function Addr is new Ada.Unchecked_Conversion
        (Source => Character_Acc,
         Target => Unsigned_16);
      function Ptr is new Ada.Unchecked_Conversion
        (Source => Unsigned_16,
         Target => Character_Acc);
   begin
      return Ptr (Addr (L) + R);
   end "+";

end AVR.USART;
