with AVR;
with AVR.MCU;
with AVR.MCU.WATCHDOG;
with AVR.MCU.USART;
with AVR.MCU.TWI;
with AVR.MCU.TIMERS;
with AVR.MCU.TIMERS.CLOCK;
with AVR.MCU.TIMERS.SCHEDULER;
with AVR.MCU.PWM_SIMPLEST;
with AVR.MCU.INTERRUPTS;

pragma Unreferenced
  (AVR.MCU.WATCHDOG,
   AVR.MCU.USART,
   AVR.MCU.TWI,
   AVR.MCU.TIMERS,
   AVR.MCU.TIMERS.CLOCK,
   AVR.MCU.TIMERS.SCHEDULER,
   AVR.MCU.PWM_SIMPLEST,
   AVR.MCU.INTERRUPTS);

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
