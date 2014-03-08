## Welcome to Adaino project ##

**Adaino** is a device library for some Arduino-like boards. Currently it is built for boards with ATmega2560 (Arduino Mega), ATmega328P (Arduino Uno, Duemilanove, Nano) and we are evaluating to include the support for the AT90USB162 (Minimus AVR).

### General Information ###

The project is based on mapping from Atmel datasheets, following the recommended apliance for each device. The applicable datasheets are replicated in `related` folder to become easier the development.

### Project Status and Goals ###

The basic goal of **Adaino** is to provide device libraries to run Arduinos in Ada. We have already written libraries for Interrupts, a simplified PWM model, Timers, Clocks (actually we're running on a simple scheduler for using with control applications), TWI, USART polling and interruptive, some watchdog capability, and some utilities. 

Anyway we have developed each capability according to our need, and certainly there are bugs, but suggestions and contributions are always welcome.

### Project Structure ##

	trunk
	|-- project
	|   |-- bin
	|   |   `-- .gitignore
	|   |-- obj
	|   |   |-- .gitignore
	|   |   |-- crt1-atmega2560._o
	|   |   |-- crtm162._o
	|   |   `-- crt328._o
	|   |-- src
	|   |   |-- .gitignore
	|   |   |-- avr-mcu-interrupts.adb
	|   |   |-- avr-mcu-interrupts.ads
	|   |   |-- avr-mcu-pwm_simplest.adb
	|   |   |-- avr-mcu-pwm_simplest.ads
	|   |   |-- avr-mcu-timers-clock.adb
	|   |   |-- avr-mcu-timers-clock.ads
	|   |   |-- avr-mcu-timers-scheduler.adb
	|   |   |-- avr-mcu-timers-scheduler.ads
	|   |   |-- avr-mcu-timers.adb
	|   |   |-- avr-mcu-timers.ads
	|   |   |-- avr-mcu-twi.adb
	|   |   |-- avr-mcu-twi.ads
	|   |   |-- avr-mcu-usart.adb
	|   |   |-- avr-mcu-usart.ads
	|   |   |-- avr-mcu-watchdog.adb
	|   |   |-- avr-mcu-watchdog.ads
	|   |   |-- avr-mcu.ads
	|   |   |-- avr.adb
	|   |   |-- avr.ads
	|   |   |-- image.adb
	|   |   |-- image.ads
	|   |   `-- main.adbcrt1-atmega2560._o
	|   |-- tools
	|   |   |-- gnat-lib
	|   |   |   |-- atmega2560.ads
	|   |   |   |-- crt1-atmega2560.S
	|   |   |   |-- crt1-atmega2560.bat
	|   |   |   `-- crt1-atmega2560.readme 
	|   |   |-- xml
	|   |   |   `-- embedded.xml
	|   |   `-- .gitignore
	|   |-- adaino.gpr
	|   |-- build_mega.bat
	|   |-- gdbserver.bat
	|   `-- hexitandburn_mega.bat
	|-- related
	|   |-- AT90USB82-162_datasheet.pdf
	|   |-- ATmega2560_datasheet.pdf
	|   `-- ATmega328P_datasheet.pdf
	|-- LICENSE
	`-- README.md

### How to use Adaino for developing your application ###

Ok, now I'm tired. Soon I will do it.

