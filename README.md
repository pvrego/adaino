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

#### Development Environment ####

You will have to install:

1. GNAT AVR-ELF-WINDOWS cross compiler. You can download the cross-compiler for windows at [Adacore Libre](http://libre.adacore.com/download/configurations#) by choosing the platform **avr-elf-windows** and **2012** year (2013 did have release for avr-elf-windows). Or you can download it directly from [gnat-gpl-2012-avr-windows-bin.exe](http://mirrors.cdn.adacore.com/art/d04f415e41ced8e02f6137e60557bf30329ca46b). Once you have installed it, certify that the `bin` folder is included in the path (in the case of the release from 2012, it will be at `C:\GNAT\2012\bin`).

2. When you plug the Arduino on USB port, Windows will configure it to a COMPORT. Our script `hexitandburn_mega.bat` is set to use `COM5`. If your Arduino is configured in a different COMPORT, or you change the script, or you change the port on Windows Control Panel.

3. If you intend to use Atmel JTAGICE mkII or other tool for On-Chip Debug, you will have to install [AVR Jungo from AtmelUSB](https://gallery.atmel.com/Products/Details/004ccabd-e18e-431a-8557-83deaea23341). But you can also install full [Atmel Studio](http://www.atmel.com/tools/atmelstudio.aspx).

#### Using Adaino to Develop your Application ####

Now we got on the main part of this tutorial. We have included the project `examples\\0_template` in order to turn it easier. It contains the basic files to build an empty application linked to the Adaino library. The `arduino.gpr` file is GNAT Programing Studio (GPS) project file. So, open on it and build. You can change it and include the Adaino libraries. 

#### Using the Atmel mkII debugger to Arduino Mega ####

1. First of all you have to configure JTAG for the Arduino Mega. The basic pin configuration is the following; from JTAG to Arduino pins, set:

| JTAG Pin | Signal | Arduino Mega Pin |
|----------|--------|------------------|
| 1        | TCK    | PF4/A4           |
| 2        | GND    | GND              |
| 3        | TDO    | PF6/A6           |
| 4        | VTref  | 5V               |
| 5        | TMS    | PF5/A5           |
| 6        | nSRST  | RESET            |
| 7        | -      | -                |
| 8        | -      | -                |
| 9        | TDI    | PF7/A7           |
| 10       | -      | -                |

2. Include the Debug information in the project. From GPS menu, `Project > Edit Project Properties > Switches > Builder > (tick) Debug information`. Also, if you save the project, `arduino.gpr` project file will add a **-g** into the compiler, builder and linker options.