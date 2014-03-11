## Welcome to Adaino project ##

**Adaino** is a device library for some Arduino-like boards. Currently it is built for boards with ATmega2560 (Arduino Mega), ATmega328P (Arduino Uno, Duemilanove, Nano) and we are evaluating to include the support for the AT90USB162 (Minimus AVR).

### General Information ###

The project is based on mapping from Atmel datasheets, following the recommended apliance for each device. The applicable datasheets are replicated in `related` folder to become easier the development.

### Project Status and Goals ###

The basic goal of **Adaino** is to provide device libraries to run Arduinos in Ada. We have already written libraries for Interrupts, a simplified PWM model, Timers, Clocks (actually we're running on a simple scheduler for using with control applications), TWI, USART polling and interruptive, some watchdog capability, and some utilities. 

Anyway we have developed each capability according to our need, and certainly there are bugs, but suggestions and contributions are always welcome.

### Project Structure ##

	│   LICENSE
	│   README.md
	│
	├───examples
	│   │   .gitignore
	│   │
	│   └───usart_polling_echo
	│       │   adaino.gpr
	│       │   build_mega.bat
	│       │   gdbserver.bat
	│       │   hexitandburn_mega.bat
	│       │
	│       ├───bin
	│       │       .gitignore
	│       │
	│       ├───obj
	│       │       .gitignore
	│       │       crt1-atmega2560._o
	│       │       crtm162._o
	│       │       crtm328._o
	│       │
	│       └───src
	│               .gitignore
	│               main.adb
	│
	├───project
	│   │   adaino.gpr
	│   │   build_mega.bat
	│   │   gdbserver.bat
	│   │   hexitandburn_mega.bat
	│   │
	│   ├───bin
	│   │       .gitignore
	│   │
	│   ├───obj
	│   │       .gitignore
	│   │       crt1-atmega2560._o
	│   │       crtm162._o
	│   │       crtm328._o
	│   │
	│   ├───src
	│   │       .gitignore
	│   │       avr-adc.ads
	│   │       avr-bls.ads
	│   │       avr-interrupts.adb
	│   │       avr-interrupts.ads
	│   │       avr-io_memory.ads
	│   │       avr-io_ports.ads
	│   │       avr-mcu.ads
	│   │       avr-power_management.ads
	│   │       avr-pwm_simplest.adb
	│   │       avr-pwm_simplest.ads
	│   │       avr-spi.ads
	│   │       avr-timers-clock.adb
	│   │       avr-timers-clock.ads
	│   │       avr-timers-scheduler.adb
	│   │       avr-timers-scheduler.ads
	│   │       avr-timers.adb
	│   │       avr-timers.ads
	│   │       avr-twi.adb
	│   │       avr-twi.ads
	│   │       avr-usart.adb
	│   │       avr-usart.ads
	│   │       avr-watchdog.adb
	│   │       avr-watchdog.ads
	│   │       avr.adb
	│   │       avr.ads
	│   │       image.adb
	│   │       image.ads
	│   │       main.adb
	│   │
	│   └───tools
	│       │   .gitignore
	│       │
	│       ├───gnat-lib
	│       │       atmega2560.ads
	│       │       crt1-atmega2560.bat
	│       │       crt1-atmega2560.readme
	│       │       crt1-atmega2560.S
	│       │
	│       └───xml
	│               embedded.xml
	│
	└───related
			AT90USB82-162_datasheet.pdf
			ATmega2560_datasheet.pdf
			ATmega328P_datasheet.pdf
		
### How to use Adaino for developing your application ###

Ok, now I'm tired. Soon I will do it.

