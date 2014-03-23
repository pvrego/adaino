with AVR.MCU;

-- =============================================================================
-- Package body AVR.USART
-- =============================================================================
package body AVR.USART is

   procedure Initialize
     (In_Port  : Port_Type;
      In_Setup : Setup_Type)
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

   procedure Write_Char
     (In_Port : Port_Type;
      In_Data : Character)
   is
   begin
      Write (In_Port => In_Port,
           In_Data => To_Unsigned_8 (In_Data));
   end Write_Char;

   procedure Write_String_U8
     (In_Port : Port_Type;
      In_Data : String_U8)
   is
   begin
      for Index in In_Data'Range loop
         Write_Char (In_Port => In_Port,
              In_Data => In_Data (Index));
      end loop;
   end Write_String_U8;

   procedure Write
     (In_Port : Port_Type;
      In_Data : Unsigned_8)
   is
   begin
      -- Loop while the transmit buffer UDRn us bit ready to receive
      -- new data.

      case In_Port is
      when USART0 =>
         while not Reg_USART0.UCSRA.UDRE loop null; end loop;
         Reg_USART0.UDR := Byte_Type (In_Data);

#if MCU="ATMEGA2560" then
      when USART1 =>
         while not Reg_USART1.UCSRA.UDRE loop null; end loop;
         Reg_USART1.UDR := Byte_Type (In_Data);

      when USART2 =>
         while not Reg_USART2.UCSRA.UDRE loop null; end loop;
         Reg_USART2.UDR := Byte_Type (In_Data);

      when USART3 =>
         while not Reg_USART3.UCSRA.UDRE loop null; end loop;
         Reg_USART3.UDR := Byte_Type (In_Data);
#end if;
      end case;

   exception
      when others => null;
   end Write;

   procedure Write_Line
     (In_Port : Port_Type;
      In_Data : String_U8)
   is
   begin
      Write_String_U8 (In_Port => In_Port,
                     In_Data => In_Data);
      New_Line (In_Port => In_Port);
   end Write_Line;

   procedure New_Line
     (In_Port : Port_Type)
   is
   begin
      Write_Char (In_Port => In_Port,
           In_Data => ASCII.CR);
      Write_Char (In_Port => In_Port,
           In_Data => ASCII.LF);
   end New_Line;

   function Receive
     (In_Port  : Port_Type;
      Out_Data : out Unsigned_8)
      return Boolean
   is
   begin

      case Priv_Setup (In_Port).Model is
         when POLLING =>
            case In_Port is
            when USART0 =>
               if Reg_USART0.UCSRA.RXC then
                  Out_Data := Unsigned_8 (Reg_USART0.UDR);
                  return True;
               else
                  return False;
               end if;

#if MCU="ATMEGA2560" then
            when USART1 =>
               if Reg_USART1.UCSRA.RXC then
                  Out_Data := Unsigned_8 (Reg_USART1.UDR);
                  return True;
               else
                  return False;
               end if;

            when USART2 =>
               if Reg_USART2.UCSRA.RXC then
                  Out_Data := Unsigned_8 (Reg_USART2.UDR);
                  return True;
               else
                  return False;
               end if;

            when USART3 =>
               if Reg_USART3.UCSRA.RXC then
                  Out_Data := Unsigned_8 (Reg_USART3.UDR);
                  return True;
               else
                  return False;
               end if;
#end if;
            end case;

         when INTERRUPTIVE =>
            if Priv_Receive_Flag (In_Port) then
               Out_Data := Unsigned_8 (Priv_Receive_Buffer (In_Port));
               Priv_Receive_Flag (In_Port) := False;
               return True;
            else
               return False;
            end if;
      end case;

   exception
      when others => return False;

   end Receive;

   function Receive_Char
     (In_Port  : in Port_Type;
      Out_Data : out Character)
      return Boolean
   is
      Curr_Status : Boolean;
      Curr_Data   : Unsigned_8;
   begin
        Curr_Status := Receive
          (In_Port  => In_Port,
           Out_Data => Curr_Data);

      if Curr_Status then
         Out_Data := To_Char (Curr_Data);
         return True;
      else
         return False;
      end if;
   end Receive_Char;

   procedure Receive_Char_Polled
     (In_Port  : in Port_Type := USART0;
      Out_Data : out Character)
   is
   begin
      while not Receive_Char
        (In_Port  => In_Port,
         Out_Data => Out_Data)
      loop null; end loop;
   end Receive_Char_Polled;

   procedure Receive_Char_Polled_Until_Flag_Char
     (In_Port  : in AVR.USART.Port_Type;
      In_Char  : in Character;
      Out_Data : out AVR.USART.String_U8)
   is
      Curr_Char : Character := ' ';
   begin

      Receive_Char_Polled
        (In_Port  => In_Port,
         Out_Data => Curr_Char);

      for Index in 1 .. Out_Data'Length loop
         if Curr_Char /= In_Char then
            Out_Data (Unsigned_8 (Index)) := Curr_Char;

            Receive_Char_Polled
              (In_Port  => In_Port,
               Out_Data => Curr_Char);
         else
            Out_Data (Unsigned_8 (Index)) := In_Char;
         end if;
      end loop;

   exception
      when others => null;
   end Receive_Char_Polled_Until_Flag_Char;

   function Receive_Char_Tries
     (In_Port  : in Port_Type := USART0;
      In_Tries : in Unsigned_8;
      Out_Data : out Character)
      return Boolean
   is
      Curr_Data : Character;
      Curr_Success : Boolean := False;
   begin
      for Curr_Try in 1 .. In_Tries loop
         Curr_Success := Receive_Char
           (In_Port  => In_Port,
            Out_Data => Curr_Data);

         if Curr_Success then
            Out_Data := Curr_Data;
            exit;
         end if;
      end loop;

      return Curr_Success;
   end Receive_Char_Tries;

   function Receive_String_U8
     (In_Port  : in Port_Type;
      Out_Data : out String_U8)
      return Boolean
   is
      Curr_Data   : Character;
   begin
      for Index in 1 .. Out_Data'Length loop
         -- It will wait eternally for the data. No good.
         while not Receive_Char
           (In_Port  => In_Port,
            Out_Data => Curr_Data)
         loop null; end loop;

         Out_Data (Unsigned_8 (Index)) := Curr_Data;
      end loop;

      return True;
   exception
      when others => return False;
   end Receive_String_U8;

   procedure Handle_ISR_RXC
     (In_Port : in Port_Type)
   is
   begin
      case In_Port is
         when USART0 =>
            Priv_Receive_Buffer (In_Port) := Reg_USART0.UDR;
#if MCU="ATMEGA2560" then
         when USART1 =>
            Priv_Receive_Buffer (In_Port) := Reg_USART1.UDR;

         when USART2 =>
            Priv_Receive_Buffer (In_Port) := Reg_USART2.UDR;

         when USART3 =>
            Priv_Receive_Buffer (In_Port) := Reg_USART3.UDR;
#end if;
      end case;

      Priv_Receive_Flag (In_Port) := True;
   exception
         when others => null;
   end Handle_ISR_RXC;

   function Get_Setup
     (In_Port : Port_Type)
      return Setup_Type
   is
   begin
      return Priv_Setup (In_Port);
   end Get_Setup;

end AVR.USART;
