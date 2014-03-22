with System;
with Ada.Unchecked_Conversion;

-- =============================================================================
-- Package AVR.USART
--
-- Implements Universal Asynchronous Receiver/Transmitter (UART) communication
-- for the MCU micro-controller.
-- =============================================================================
package AVR.USART is

   type USART_Control_And_Register_Status_Register_A_Type is
      record
         MPCM : Boolean; -- Multi-processor Communication Mode
         U2X  : Boolean; -- Double the USART Transmission Speed
         UPE  : Boolean; -- USART Parity Error
         DOR  : Boolean; -- Data OverRun
         FE   : Boolean; -- Frame Error
         UDRE : Boolean; -- USART Data Register Empty
         TXC  : Boolean; -- USART Transmit Complete
         RXC  : Boolean; -- USART Receive Complete
      end record;
   pragma Pack (USART_Control_And_Register_Status_Register_A_Type);
   for USART_Control_And_Register_Status_Register_A_Type'Size use
     BYTE_SIZE;

   type USART_Control_And_Register_Status_Register_B_Type is
      record
         TXB8  : Boolean; -- Transmit Data Bit 8
         RXB8  : Boolean; -- Receive Data Bit 8
         UCSZ2 : Boolean; -- Character Size Bit 2
         TXEN  : Boolean; -- Transmitter Enable
         RXEN  : Boolean; -- Receiver Enable
         UDRIE : Boolean; -- USART Data Register Empty Interrupt Flag
         TXCIE : Boolean; -- Tx Complete Interrupt Flag
         RXCIE : Boolean; -- Rx Complete Interrupt Flag
      end record;
   pragma Pack (USART_Control_And_Register_Status_Register_B_Type);
   for USART_Control_And_Register_Status_Register_B_Type'Size use
     BYTE_SIZE;

   type USART_Control_And_Register_Status_Register_C_Type is
      record
         UCPOL : Boolean; -- Clock Polarity
         UCSZ0 : Boolean; -- Character Size Bit 0
         UCSZ1 : Boolean; -- Character Size Bit 1
         USBS  : Boolean; -- Stop Bit Select
         UPM   : Bit_Array_Type (0 .. 1); -- Parity Mode Bits
         UMSEL : Bit_Array_Type (0 .. 1); -- Mode Select
      end record;
   pragma Pack (USART_Control_And_Register_Status_Register_C_Type);
   for USART_Control_And_Register_Status_Register_C_Type'Size use
     BYTE_SIZE;

   type USART_Type is
      record
         UCSRA : USART_Control_And_Register_Status_Register_A_Type;
         UCSRB : USART_Control_And_Register_Status_Register_B_Type;
         UCSRC : USART_Control_And_Register_Status_Register_C_Type;
         Spare : Spare_Type (0 .. 7);
         UBRR  : Byte_Array_Type (0 .. 1); -- USART Baud Rate Register L/H Bytes
         UDR   : Byte_Type; -- USART I/O Data Register
      end record;
   pragma Pack (USART_Type);
   for USART_Type'Size use 7 * BYTE_SIZE;

   Reg_USART0 : USART_Type;
   for Reg_USART0'Address use System'To_Address (16#C0#);

#if MCU="ATMEGA2560" then
   Reg_USART1 : USART_Type;
   for Reg_USART1'Address use System'To_Address (16#C8#);

   Reg_USART2 : USART_Type;
   for Reg_USART2'Address use System'To_Address (16#D0#);

   Reg_USART3 : USART_Type;
   for Reg_USART3'Address use System'To_Address (16#130#);
#end if;

   -- ======================
   -- General Public Section
   -- ======================

   -- Mode of data processing
   type Model_Type is
     (POLLING,
      INTERRUPTIVE);

   -- Define the USART ports
#if MCU="ATMEGA2560" then
   type Port_Type is
     (USART0,
      USART1,
      USART2,
      USART3);
#elsif MCU="ATMEGA328P" then
   type Port_Type is
     (USART0);
#end if;

   -- Define the USART modes
   type Sync_Mode_Type is
     (ASYNCHRONOUS,
      SYNCHRONOUS,
      MASTER_SPI);

   -- Define the number of bits in data communication
   type Data_Bits_Type is
     (BITS_5,
      BITS_6,
      BITS_7,
      BITS_8,
      BITS_9);
   for Data_Bits_Type'Size use 3;
   for Data_Bits_Type use
     (BITS_5 => 2#000#,
      BITS_6 => 2#001#,
      BITS_7 => 2#010#,
      BITS_8 => 2#011#,
      BITS_9 => 2#111#);

   -- Define the parity
   type Parity_Type is
     (NONE,
      EVEN,
      ODD);

   -- Define the number of stop bits
   subtype Stop_Bits_Type is Integer range 1 .. 2;

   -- Define the USART type for initialization
   type Setup_Type is
      record
         Sync_Mode    : Sync_Mode_Type;
         Double_Speed : Boolean;
         Baud_Rate    : Unsigned_32;
         Data_Bits    : Data_Bits_Type;
         Parity       : Parity_type;
         Stop_Bits    : Stop_Bits_Type;
         Model        : Model_Type;
      end record;

   type String_U8 is array (Unsigned_8 range <>) of Character;

   -- Default for USART setup
#if MCU="ATMEGA2560" then
   USART_PORT_DEFAULT : constant Port_Type := USART0;
#else
   USART_PORT_DEFAULT : constant Port_Type := USART0;
#end if;

   USART_SETUP_DEFAULT : constant Setup_Type :=
     (Sync_Mode    => ASYNCHRONOUS,
      Double_Speed => True,
      Baud_Rate    => 9600,
      Data_Bits    => BITS_8,
      Parity       => NONE,
      Stop_Bits    => 1,
      Model         => INTERRUPTIVE);

   -- To enable/disable write or receive for USART
   type Tx_Rx_Type is
     (TX,
      RX);

   -- To bufferize the Usart input
   type Buffer_Array_Port_Type is array (Port_Type) of Byte_Type;

   -- Initialize the general parameters of the USART
   procedure Initialize
     (In_Port  : Port_Type := USART_PORT_DEFAULT;
      In_Setup : Setup_Type := USART_SETUP_DEFAULT);

   -- =================
   -- Tx Public Section
   -- =================

   -- Transmit data over USART
   procedure Write
     (In_Port : Port_Type := USART0;
      In_Data : Unsigned_8);

   procedure Write_Char
     (In_Port : Port_Type := USART0;
      In_Data : Character);

   procedure Write_String_U8
     (In_Port : Port_Type := USART0;
      In_Data : String_U8);

   procedure Write_Line
     (In_Port : Port_Type := USART0;
      In_Data : String_U8);

   procedure New_Line
     (In_Port : Port_Type := USART0);

   -- =================
   -- Rx Public Section
   -- =================

   -- Receive data from USART
   function Receive
     (In_Port : in Port_Type := USART0;
      Out_Data : out Unsigned_8)
      return Boolean;

   function Receive_Char
     (In_Port  : in Port_Type := USART0;
      Out_Data : out Character)
      return Boolean;

   function Receive_String_U8
     (In_Port  : in Port_Type;
      Out_Data : out String_U8)
      return Boolean;

   procedure Receive_Char_Polled
     (In_Port  : in Port_Type := USART0;
      Out_Data : out Character);

   procedure Receive_Char_Polled_Until_Flag_Char
     (In_Port  : in AVR.USART.Port_Type;
      In_Char  : in Character;
      Out_Data : out AVR.USART.String_U8);

   procedure Handle_ISR_RXC (In_Port : in Port_Type);

   function Get_Setup
     (In_Port : Port_Type)
      return Setup_Type;

   function To_Char is new Ada.Unchecked_Conversion
     (Target => Character,
      Source => Unsigned_8);

   function To_Char is new Ada.Unchecked_Conversion
     (Target => Character,
      Source => AVR.Byte_Type);

   function To_Unsigned_8 is new Ada.Unchecked_Conversion
     (Target => Unsigned_8,
      Source => Character);

private

   -- =======================
   -- General Private Section
   -- =======================

   -- Used to keep the information of Usart configurations
   Priv_Setup : array (Port_Type) of Setup_Type;

   -- ==================
   -- Tx Private Section
   -- ==================

   -- ==================
   -- Rx Private Section
   -- ==================

   Priv_Receive_Buffer : Buffer_Array_Port_Type := (others => 23);
   Priv_Receive_Flag : array (Port_Type) of Boolean := (others => False);


end AVR.USART;
