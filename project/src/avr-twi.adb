with AVR.IO_PORTS;

-- =============================================================================
-- Package body AVR.TWI
-- =============================================================================
package body AVR.TWI is

   procedure Initialize
     (Address : Interfaces.Unsigned_8;
      Is_Slave: Boolean)
   is
   begin
      --PORTC := PORTC_PORTC4 or PORTC_PORTC5; -- for ATmega328P
      IO_PORTS.Reg_Pin_D.PORT (0) := TRUE;
      IO_PORTS.Reg_Pin_D.PORT (1) := TRUE;

      -- Init TWI prescaler and bitrate
      -- SCL_frequency := (CPU_Clock_frequency)/(16 + 2*(TWBR)*4^(TWPS) )
      Reg_TWI.TWBR := 72; -- Interfaces.Unsigned_8 (((CPU_Speed / TWI_FREQ) - 16) / 2);

      -- Enable interrupts
      --pragma Compile_Time_Warning (True, "verificar se é necessário habilitar as interrupts aqui. Melhor postergar para o initialize_scheduler");
      --AVR.INTERRUPTS.Enable;

      -- Enable TWI, ack and interrupt
      Reg_TWI.TWCR.TWEN := TRUE;
      Reg_TWI.TWCR.TWIE := TRUE;
      Reg_TWI.TWCR.TWEA := TRUE;

      if Is_Slave then
         Reg_TWI.TWAR.TWA :=
           To_Bit_Array_7_Bit
             (Byte_Type (Address)).Bit_Array_7; -- (2 * Address) + 1; -- Respond to General Call Address
         Twi_Operation := TWI_SLAVE;
      else
         Twi_Operation := TWI_MASTER;
      end if;

   end Initialize;

   function Write_Data
     (Address : Interfaces.Unsigned_8;
      Data    : Data_Buffer_Type)
      return Boolean
   is
      Request : constant Request_Type := TW_WRITE;
   begin

      if Twi_State = TWI_READY and Twi_TX_Trial_Flag = False then
         Twi_Data_Sent_Flag := False;
         Twi_TX_Trial_Flag := True;

         for Index in Data.Data_Buffer'Range loop
            Twi_Buffer.Data_Buffer (Index) := Data.Data_Buffer (Index);
         end loop;

         Twi_Buffer.Buffer_Size := Data.Buffer_Size;

         Twi_Buffer.Buffer_Index := Buffer_Range_Type'First;

         Twi_State := TWI_BUSY_MT;
         Twi_Error_State := TWI_NO_ERROR;

         -- Address is shifted to the left
         Twi_SLA_RW := (2 * Address) or Request_Type'Pos (Request);

         -- Send START condition
         Reg_TWI.TWCR.TWEN  := TRUE;
         Reg_TWI.TWCR.TWIE  := TRUE;
         Reg_TWI.TWCR.TWEA  := TRUE;
         Reg_TWI.TWCR.TWINT := TRUE;
         Reg_TWI.TWCR.TWSTA := TRUE;

         pragma Compile_Time_Warning
           (TIME_WARNING_FLAG, "creio que o primeiro if fecha aqui, certo?");
      end if;

      if Twi_State = TWI_READY then
         Twi_TX_Trial_Flag := False;
         return True;
      else
         return False;
      end if;

   exception
      when others => return False;
   end Write_Data;

   function Request_Data
     (Address : Interfaces.Unsigned_8;
      Size    : Buffer_Range_Type)
      return Boolean
   is
      Request : constant Request_Type := TW_READ;
   begin

      if Twi_State = TWI_READY and Twi_RX_Trial_Flag = False then
         Twi_Buffer.Buffer_Index := Buffer_Range_Type'First;
         Twi_Buffer.Buffer_Size := Size;
         Twi_RX_Trial_Flag := True;

         Twi_Error_State := TWI_NO_ERROR;
         Twi_State := TWI_BUSY_MR;

         -- Address is shifted to the left
         Twi_SLA_RW := (2 * Address) or Request_Type'Pos (Request);

         -- Send START condition
         Reg_TWI.TWCR.TWEN  := TRUE;
         Reg_TWI.TWCR.TWIE  := TRUE;
         Reg_TWI.TWCR.TWEA  := TRUE;
         Reg_TWI.TWCR.TWINT := TRUE;
         Reg_TWI.TWCR.TWSTA := TRUE;
      end if;

      if Twi_State = TWI_READY then
         Twi_RX_Trial_Flag := False;
         return True;
      else
         return False;
      end if;

   end Request_Data;

   procedure Handle_Interrupts is
      -- Curr_Status masks out bits 0 to 2 (they are not status code bits)
      Curr_Status_Only : constant TWI_Status_Register_Type :=
        (TWS3   => Reg_TWI.TWSR.TWS3,
         TWS4   => Reg_TWI.TWSR.TWS4,
         TWS5   => Reg_TWI.TWSR.TWS5,
         TWS6   => Reg_TWI.TWSR.TWS6,
         TWS7   => Reg_TWI.TWSR.TWS7,
         TWPS   => (others => FALSE),
         others => (others => 0));

      Curr_Status : constant Interfaces.Unsigned_8 := Unsigned_8
        (To_Byte (Curr_Status_Only));

      procedure Reply (Ack : Boolean) is
      begin
         if Ack then
            Reg_TWI.TWCR.TWEN  := TRUE;
            Reg_TWI.TWCR.TWIE  := TRUE;
            Reg_TWI.TWCR.TWEA  := TRUE;
            Reg_TWI.TWCR.TWINT := TRUE;
         else
            Reg_TWI.TWCR.TWEN  := TRUE;
            Reg_TWI.TWCR.TWIE  := TRUE;
            Reg_TWI.TWCR.TWINT := TRUE;
         end if;
      end Reply;

      procedure Stop is
      begin
         Reg_TWI.TWCR.TWEN  := TRUE;
         Reg_TWI.TWCR.TWIE  := TRUE;
         Reg_TWI.TWCR.TWEA  := TRUE;
         Reg_TWI.TWCR.TWINT := TRUE;
         Reg_TWI.TWCR.TWSTO := TRUE;

         loop
            exit when not Reg_TWI.TWCR.TWSTO;
         end loop;

         Twi_State := TWI_READY;
      end Stop;

      procedure Release is
      begin
         Reg_TWI.TWCR.TWEN  := TRUE;
         Reg_TWI.TWCR.TWIE  := TRUE;
         Reg_TWI.TWCR.TWEA  := TRUE;
         Reg_TWI.TWCR.TWINT := TRUE;
         Twi_State := TWI_READY;
      end Release;
      pragma Unreferenced (Release);

      Status : Boolean := False;
      pragma Unreferenced (Status);

   begin
      --        Status := USART.Put_Line_USART("I");

      case Curr_Status is

         -- =================== Master Mode
         when START | REPEATED_START =>
            -- Send SLA_RW
            Reg_TWI.TWDR := Byte_Type (Twi_SLA_RW);
            Reply (True);

            --              Status := USART.Put_Line_USART("S");


         when MT_SLAW_ACK | MT_DATA_ACK => -- address/data acked by receiver
            if (not Twi_Data_Sent_Flag) then
               Reg_TWI.TWDR :=
                 Byte_Type (Twi_Buffer.Data_Buffer (Twi_Buffer.Buffer_Index));
               Twi_Buffer.Buffer_Index := Twi_Buffer.Buffer_Index + 1;

               if Twi_Buffer.Buffer_Index > Twi_Buffer.Buffer_Size then -- if next free index is outside the size
                  Twi_Data_Sent_Flag := True;
                  --                    Status := USART.Put_Line_USART(".");
               end if;

               Reply (True);

               --                 Status := USART.Put_Line_USART("T_A");
            else
               Stop;
               --                 Status := USART.Put_Line_USART("T_St");
            end if;

         when MT_SLAW_NACK | MT_DATA_NACK => -- address/data nacked
            Twi_Error_State := TWI_NACK;
            Stop;
            --              Status := USART.Put_Line_USART("T_N");

         when MR_SLAR_ACK => -- SLA_R acked, nothing to do for master, just wait for data
            Reply (True);
            --              Status := USART.Put_Line_USART("R_Ad");

         when MR_SLAR_NACK => -- SLA_R not acked, something went wrong
            Stop;
            --              Status := USART.Put_Line_USART("R_A_N");

         when MR_DATA_ACK => -- non-last data acked (the last data byte has to be nacked)
            Twi_Buffer.Data_Buffer (Twi_Buffer.Buffer_Index) :=
              Unsigned_8 (Reg_TWI.TWDR);
            Twi_Buffer.Buffer_Index := Twi_Buffer.Buffer_Index + 1;
            Twi_Buffer.Is_New_Data := True;

            --              Status := USART.Put_Line_USART("R_Dt");
            if Twi_Buffer.Buffer_Index <= Twi_Buffer.Buffer_Size then
               Reply (True);
            else
               Reply (False);
            end if;

         when MR_DATA_NACK => -- last data nacked, as it should be
            Twi_Buffer.Data_Buffer (Twi_Buffer.Buffer_Index) :=
              Unsigned_8 (Reg_TWI.TWDR);
            Twi_Buffer.Buffer_Index := Twi_Buffer.Buffer_Index + 1;
            Stop;
            --              Status := USART.Put_Line_USART("R_D_N");

         when ERR_ARBIT_LOST =>
            Twi_Error_State := TWI_LOST_ARBITRATION;
            --              Status := USART.Put_Line_USART("LOST");

            -- =================== Slave Mode

         when SR_SLAW_ACK | SR_GCAW_ACK => --SLA_W received and acked, prepare for data receiving
            Twi_Buffer.Buffer_Index := 1;
            Twi_Buffer.Data_Buffer := (others => 0);
            Twi_Buffer.Is_New_Data := False;

            Reply (True);

            --              Status := USART.Put_Line_USART("S_R_A");

         when SR_DATA_ACK | SR_DATA_GCA_ACK=>  --a byte was received, store it and
            Twi_Buffer.Data_Buffer (Twi_Buffer.Buffer_Index) :=
              Unsigned_8 (Reg_TWI.TWDR);
            Twi_Buffer.Buffer_Index := Twi_Buffer.Buffer_Index + 1;
            Twi_Buffer.Is_New_Data := True;

            --              Status := USART.Put_Line_USART("S_R_D");
            if Twi_Buffer.Buffer_Index < MAX_BUFFER_RANGE then
               Reply (True);
            else
               Reply (False);
            end if;

            ---------------- error recovery ----------------------------------
         when SR_DATA_NACK | SR_DATA_GCA_NACK => --data received  but not acked
            --should not happen if the master is behaving as expected
            --switch to not adressed mode
            Reply (True);
            --              Status := USART.Put_Line_USART("S_N");

            -----------------Slave Transmitter--------------------------------
         when ST_DATA_ACK | ST_SLAW_ACK =>  --data transmitted and acked by master, load next
            if (not Twi_Data_Sent_Flag) then
               Reg_TWI.TWDR := Byte_Type
                 (Twi_Buffer.Data_Buffer (Twi_Buffer.Buffer_Index));
               Twi_Buffer.Buffer_Index := Twi_Buffer.Buffer_Index + 1;

               if Twi_Buffer.Buffer_Index > Twi_Buffer.Buffer_Size then     -- if next free index is outside the size
                  Twi_Data_Sent_Flag := True;
               end if;

               Reply (True);

            else
               Stop;
            end if;
            --              Status := USART.Put_Line_USART("S_T_A");

         when ST_LAST_DATA_ACK => --last byte send and acked by master
            --last bytes should not be acked, ignore till start/stop
            --reset=1;
            Stop;
            --              Status := USART.Put_Line_USART("S_T_L");

         when ST_DATA_NACK => --last byte send and nacked by master (as should be)
            Reply(True);
            --              Status := USART.Put_Line_USART("S_T_L_N");
            ----------------- Others --------------------------------

         when SR_SLAWR_ACK | SR_GCAWR_ACK | ST_SLAWR_ACK=>--adressed as slave while in master mode.
            --should never happen, better reset;
            --              reset=1;
            Stop;
            --              Status := USART.Put_Line_USART("S_E");

         when STOP_REP_START => --Stop or rep start, reset state machine
            Reply(True);
            --              Status := USART.Put_Line_USART("S");

         when others =>
            null;
            --              Status := USART.Put_Line_USART("E!");
      end case;

   exception
      when others => null;
   end Handle_Interrupts;

   function Get_Error return Error_State_Type is
   begin
      return Twi_Error_State;

   end Get_Error;

   function Is_Data_Available return Boolean is
   begin
      return Twi_Buffer.Is_New_Data;

   end Is_Data_Available;

   function Get_Last_Data return Interfaces.Unsigned_8 is
   begin
      if Twi_Buffer.Buffer_Index > 1 then
         Twi_Buffer.Is_New_Data := False;
         return Twi_Buffer.Data_Buffer (Twi_Buffer.Buffer_Index - 1);
      else
         return 0;
      end if;

   exception
      when others => return 0;
   end Get_Last_Data;

   function Get_Data (Prm_Index : Buffer_Range_Type)
                      return Interfaces.Unsigned_8 is
   begin
      Twi_Buffer.Is_New_Data := False;
      return Twi_Buffer.Data_Buffer (Prm_Index);

   exception
      when others => return 0;
   end Get_Data;

end AVR.TWI;
