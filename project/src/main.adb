procedure Main is
   Counter : Integer := 0;
   Map : Integer := 0;

begin

   for Index in 1 .. 1000 loop
      Counter := Counter + 1;

      for Index_Map in 1 .. 1000 loop
         Map := Map + Counter + 1;
      end loop;
   end loop;


end Main;
