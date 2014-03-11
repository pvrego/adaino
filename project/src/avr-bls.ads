package AVR.BLS is

      type Store_Program_Memory_Control_And_Status_Register_Type is
      record
         SPMEN  : Boolean; -- Store Program Memory Enable
         PGERS  : Boolean; -- Page Erase
         PGWRT  : Boolean; -- Page Write
         BLBSET : Boolean; -- Boot Lock Bit Set
         RWWSRE : Boolean; -- Read-While-Write Section Read Enable
         SIGRD  : Boolean; -- Signature Row Read
         RWWSB  : Boolean; -- Read-While-Write Section Busy
         SPMIE  : Boolean; -- SPM Interrupt Enable
      end record;
   pragma Pack (Store_Program_Memory_Control_And_Status_Register_Type);
   for Store_Program_Memory_Control_And_Status_Register_Type'Size use BYTE_SIZE;

   Reg_SPMCSR : Store_Program_Memory_Control_And_Status_Register_Type;
   for Reg_SPMCSR'Address use System'To_Address (16#57#);

end AVR.BLS;
