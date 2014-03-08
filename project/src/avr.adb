-- =============================================================================
-- Package body AVR
-- =============================================================================
package body AVR is

   procedure Wait (Cycles : Long_Integer) is
   begin
      for C1 in 1 .. Cycles loop
         for C2 in 1 .. Cycles loop
            null;
         end loop;
      end loop;
   end Wait;

end AVR;
