with System;

-- =============================================================================
-- Package AVR.TWI
--
-- Implements TWI communication for the MCU micro-controller.
-- =============================================================================
package AVR.TWI is

   type TWI_Status_Register_Type is
      record
         TWPS  : Bit_Array_Type (0 .. 1); -- TWI Prescaler Bits
         Spare : Spare_Type (0 .. 0);
         TWS3  : Boolean; -- TWI Status Bit 3
         TWS4  : Boolean; -- TWI Status Bit 4
         TWS5  : Boolean; -- TWI Status Bit 5
         TWS6  : Boolean; -- TWI Status Bit 6
         TWS7  : Boolean; -- TWI Status Bit 7
      end record;
   pragma Pack (TWI_Status_Register_Type);
   for TWI_Status_Register_Type'Size use BYTE_SIZE;

   type TWI_Slave_Address_Register_Type is
      record
         TWGCE : Boolean; -- TWI General Call Recognition Enable Bit
         TWA   : Bit_Array_Type (0 .. 6); -- TWI Slave Address Register
      end record;
   pragma Pack (TWI_Slave_Address_Register_Type);
   for TWI_Slave_Address_Register_Type'Size use BYTE_SIZE;

   type TWI_Control_Register_Type is
      record
         TWIE  : Boolean; -- TWI Interrupt Enable
         Spare : Spare_Type (0 .. 0);
         TWEN  : Boolean; -- TWI Enable Bit
         TWWC  : Boolean; -- TWI Write Collision Flag
         TWSTO : Boolean; -- TWI Stop Condition Bit
         TWSTA : Boolean; -- TWI Start Condition Bit
         TWEA  : Boolean; -- TWI Enable Acknowledge Bit
         TWINT : Boolean; -- TWI Interrupt Flag
      end record;
   pragma Pack (TWI_Control_Register_Type);
   for TWI_Control_Register_Type'Size use BYTE_SIZE;

   type TWI_Slave_Address_Mask_Register_Type is
      record
         Spare : Spare_Type (0 .. 0);
         TWAM  : Bit_Array_Type (0 .. 6);
      end record;
   pragma Pack (TWI_Slave_Address_Mask_Register_Type);
   for TWI_Slave_Address_Mask_Register_Type'Size use BYTE_SIZE;

   type TWI_Type is
      record
         TWBR  : Byte_Type; -- TWI Bit Rate Register
         TWSR  : TWI_Status_Register_Type;
         TWAR  : TWI_Slave_Address_Register_Type;
         TWDR  : Byte_Type; -- TWI Data Register
         TWCR  : TWI_Control_Register_Type;
         TWAMR : TWI_Slave_Address_Mask_Register_Type;
      end record;
   pragma Pack (TWI_Type);
   for TWI_Type'Size use 6 * BYTE_SIZE;

   Reg_TWI : TWI_Type;
   for Reg_TWI'Address use System'To_Address (16#B8#);

   -- ============
   -- Status Codes
   -- ============

   -- Start condition
   START          : constant :=  16#08#;
   REPEATED_START : constant :=  16#10#;

   -- Master Transmitter Mode
   MT_SLAW_ACK    : constant :=  16#18#; -- SLA_W transmitted, ACK received
   MT_SLAW_NACK   : constant :=  16#20#; -- SLA_W transmitted, NACK receive
   MT_DATA_ACK    : constant :=  16#28#; -- Data transmitted, ACK received
   MT_DATA_NACK   : constant :=  16#30#; -- Data transmitted, NACK received

   -- Master Receiver Mode
   MR_SLAR_ACK    : constant :=  16#40#; -- SLA_R transmitted, ACK received
   MR_SLAR_NACK   : constant :=  16#48#; -- SLA_R transmitted, NACK received
   MR_DATA_ACK    : constant :=  16#50#; -- Data byte received, ACK returned
   MR_DATA_NACK   : constant :=  16#58#; -- Data byte received, NACK returned

   -- Slave Receiver Mode
   SR_SLAW_ACK    : constant :=  16#60#; -- SLA_W received, ACK returned
   SR_SLAWR_ACK   : constant :=  16#68#; -- SLA_W received, ACK returned. Adressed as slave while in master mode (Better reset the communication)
   SR_GCAW_ACK    : constant :=  16#70#; -- General Call Address returned, ACK returned
   SR_GCAWR_ACK   : constant :=  16#78#; -- General Call Address rreturned, ACK returned. Adressed as slave while in master mode (Better reset the communication)
   SR_DATA_ACK    : constant :=  16#80#; -- Data received, ACK returned
   SR_DATA_NACK   : constant :=  16#88#; -- Data received, NACK returned. Lost Arbitration as Master
   SR_DATA_GCA_ACK    : constant :=  16#90#; -- Data on General Call returned, ACK returned
   SR_DATA_GCA_NACK   : constant :=  16#98#; -- Data on General Call returned, NACK returned. Adressed as slave while in master mode (Better reset the communication)

   -- Slave Transmitter Mode
   ST_SLAW_ACK    : constant :=  16#A8#; -- SLA_R received, ACK returned
   ST_SLAWR_ACK   : constant :=  16#B0#; -- SLA_R received, ACK returned. Adressed as slave while in master mode (Better reset the communication)
   ST_DATA_ACK   : constant :=  16#B8#; -- Data transmitted, ACK received
   ST_DATA_NACK  : constant :=  16#C0#; -- Data transmitted, NACK received
   ST_LAST_DATA_ACK   : constant :=  16#C8#; -- last byte data transmitted, ACK received. (TWEA  = 0);

   -- Stop condition
   STOP_REP_START : constant :=  16#A0#; -- Stop or repeated start. Should reset state machine

   -- Generic Errors
   ERR_BUS_ILLEGAL : constant :=  16#00#; -- Illegal START or STOP condition
   ERR_NO_INFO     : constant :=  16#F8#; -- Arbitration lost in SLA_W/R, data bytes
   ERR_ARBIT_LOST  : constant :=  16#38#; -- No relevant state information available

   -- ============
   -- Constants
   -- ============

   MAX_BUFFER_RANGE : constant := 32;

   -- ============
   -- Types
   -- ============

   type TWI_Operation_Type is
     (TWI_MASTER,
      TWI_SLAVE);
   for TWI_Operation_Type use
     (TWI_MASTER => 0,
      TWI_SLAVE  => 1);
   for TWI_Operation_Type'Size use 1;

   type Request_Type is
     (TW_WRITE,
      TW_READ);
   for Request_Type use
     (TW_WRITE => 0,
      TW_READ  => 1);
   for Request_Type'Size use 1;

   subtype Buffer_Range_Type is Interfaces.Unsigned_8 range 1 .. MAX_BUFFER_RANGE;

   type Buffer_Type is array
     (Interfaces.Unsigned_8 range 1 .. 15) of Interfaces.Unsigned_8;

   type Data_Buffer_Type is
      record
         Is_New_Data  : Boolean := False;
         Buffer_Index : Buffer_Range_Type := 1;		-- Points to the next free index
         Buffer_Size  : Buffer_Range_Type := 1;		-- Buffer useful size
         Data_Buffer  : Buffer_Type := (others => 0);
      end record;

   type Error_State_Type is
     (TWI_NO_ERROR,
      TWI_BUS_ERROR,
      TWI_LOST_ARBITRATION,
      TWI_NACK);
   for Error_State_Type'Size use 2;

   procedure Initialize
     (Address  : Interfaces.Unsigned_8;
      Is_Slave : Boolean
     );

   --+-------------------------------------------
   -- Usage: The function returns False while the whole Data
   -- wasn't sent.
   --+-------------------------------------------
   function Write_Data
     (Address : Interfaces.Unsigned_8;
      Data    : Data_Buffer_Type)
   return Boolean;

   --+-------------------------------------------
   -- Usage: The function returns False while the whole Data
   -- wasn't sent.
   --+-------------------------------------------
   function Request_Data
     (Address : Interfaces.Unsigned_8;
      Size    : Buffer_Range_Type)
   return Boolean;

   function Is_Data_Available return Boolean;

   function Get_Last_Data return Interfaces.Unsigned_8;

   function Get_Data (Prm_Index : Buffer_Range_Type)
                         return Interfaces.Unsigned_8;

   function Get_Error return Error_State_Type;

   -- Manual communication control. If True, a trial is on demmand
   Twi_TX_Trial_Flag : Boolean := False;

   -- Manual communication control. If True, a trial is on demmand
   Twi_RX_Trial_Flag : Boolean := False;

   procedure Handle_Interrupts;

   --+--------------------------------------------------------------------------
   --| Conversion Services
   --+--------------------------------------------------------------------------

   function To_Byte is new Unchecked_Conversion
     (Source => TWI_Status_Register_Type,
      Target => Byte_Type);

private
   type State_Type is
     (TWI_READY,
      TWI_BUSY_MT,
      TWI_BUSY_MR);

   Twi_Operation : TWI_Operation_Type := TWI_SLAVE;
   Twi_State : State_Type := TWI_READY;
   Twi_Error_State : Error_State_Type := TWI_NO_ERROR;
   Twi_Data_Sent_Flag : Boolean := False;
   Twi_Buffer : Data_Buffer_Type;
--     Twi_Data_Max : Buffer_Range_Type := 2;
--     Twi_Data_Size_Received : Interfaces.Unsigned_8 := 0;

   Twi_SLA_RW : Interfaces.Unsigned_8;
   pragma Volatile (Twi_SLA_RW);

end AVR.TWI;
