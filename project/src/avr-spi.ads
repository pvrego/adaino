package AVR.MCU.SPI is

   type SPI_Control_Register_Type is
      record
         SPR0 : Boolean;
         SPR1 : Boolean;
         CPHA : Boolean;
         CPOL : Boolean;
         MSTR : Boolean;
         DORD : Boolean;
         SPE  : Boolean;
         SPIE : Boolean;
      end record;
   pragma Pack (SPI_Control_Register_Type);
   for SPI_Control_Register_Type'Size use BYTE_SIZE;

   type SPI_Status_Register_Type is
      record
         SPI2X : Boolean;
         Spare : Spare_Type (0 .. 4);
         WCOL  : Boolean;
         SPIF  : Boolean;
      end record;
   pragma Pack (SPI_Status_Register_Type);
   for SPI_Status_Register_Type'Size use BYTE_SIZE;

   type SPI_Data_Register_Type is new Byte_Type;

   Reg_SPCR : SPI_Control_Register_Type;
   for Reg_SPCR'Address use System'To_Address (16#4C#);

   Reg_SPSR : SPI_Status_Register_Type;
   for Reg_SPSR'Address use System'To_Address (16#4D#);

   Reg_SPDR : SPI_Data_Register_Type;
   for Reg_SPDR'Address use System'To_Address (16#4E#);

end AVR.MCU.SPI;
