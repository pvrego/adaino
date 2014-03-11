with AVR;
with AVR.MCU;
with AVR.WATCHDOG;
with AVR.USART;
with AVR.TWI;
with AVR.TIMERS;
with AVR.TIMERS.CLOCK;
with AVR.TIMERS.SCHEDULER;
with AVR.PWM_SIMPLEST;
with AVR.INTERRUPTS;

pragma Unreferenced
  (AVR.MCU,
   AVR.WATCHDOG,
   AVR.USART,
   AVR.TWI,
   AVR.TIMERS,
   AVR.TIMERS.CLOCK,
   AVR.TIMERS.SCHEDULER,
   AVR.PWM_SIMPLEST,
   AVR.INTERRUPTS);

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
