## Welcome to Adaino project ##

**Adaino** is a toolset written in Ada, to develop Ada applications on Arduinos on a host Windows machine. Currently it is built for boards with ATmega2560 (Arduino Mega), ATmega328P (Arduino Uno, Duemilanove, Nano) and we are evaluating to include the support for the AT90USB162 (Minimus AVR).

### General Information ###

The project is based on mapping from Atmel datasheets. The applicable datasheets are replicated in `related` folder to become easier the development.

#### Why Arduinos? ####

Ok, if you are here, you can answer it by yourself.

#### And Why Ada? ####

Ada is fantastic for developing embedded applications, specially when safe-critical means something. Anyway, there are several advantages over other general-purpose languages, easy to learn, easy to code, easy to fix the bugs. Thus, it seems very reasonable to ask... why not use Ada with Arduinos? 

When you did not have a device library, you could say... well...I do not have a device library, but now that you have it (I am talking about Adaino, ok?), use it and be happy! 

If you want to learn Ada, check it out [An Introduction to Ada](http://www.adaic.org/learn/materials/intro/).

### Project Status and Goals ###

The basic goal of **Adaino** is to provide device libraries to run Arduinos in Ada. We have already written libraries for Interrupts, a simplified PWM model, Timers, Clocks (actually we're running on a simple scheduler for using with control applications), TWI, USART polling and interruptive, some watchdog capability, and some utilities. 

Anyway we have developed each capability according to our need, and certainly there are bugs, but suggestions and contributions are always welcome.

### Limitations ###
We use in this development the GNAT AVR-ELF-WINDOWS, which is Zero-Footprint-Profile. So, unless you make a new RTS, you will not be able to make tasking and synchronization and use exception propagation.

### Project Structure ##

	│   LICENSE
	│   README.md
	│
	├───examples
	│   │   .gitignore
	│   │
	│   ├───0_template
	│   │   │   adaino.gpr
	│   │   │   hexitandburn_mega.bat
	│   │   │
	│   │   ├───bin
	│   │   │       .gitignore
	│   │   │
	│   │   ├───obj
	│   │   │       .gitignore
	│   │   │       crt1-atmega2560._o
	│   │   │       crtm162._o
	│   │   │       crtm328._o
	│   │   │
	│   │   └───src
	│   │           .gitignore
	│   │           main.adb
	│   │
	│   ├───usart_interruptive_echo
	│   │   │   adaino.gpr
	│   │   │   build_mega.bat
	│   │   │   gdbserver.bat
	│   │   │   hexitandburn_mega.bat
	│   │   │
	│   │   ├───bin
	│   │   │       .gitignore
	│   │   │
	│   │   ├───obj
	│   │   │       .gitignore
	│   │   │       crt1-atmega2560._o
	│   │   │       crtm162._o
	│   │   │       crtm328._o
	│   │   │
	│   │   └───src
	│   │           .gitignore
	│   │           main.adb
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
	
	Unfortunately Arduino Mega does not come with JTAG pins exposed.

2. Include the Debug information in the project. From GPS menu, `Project > Edit Project Properties > Switches > Builder > (tick) Debug information`. Also, if you save the project, `arduino.gpr` project file will add a **-g** into the compiler, builder and linker options.

3. For connecting the debugger, from GPS menu, `Debug > Initialize > main.elf` opens the debug console. 
	1. Enter `target atmel-mkii`. So that it should respond something like
	> atmel-mkii: found device 0x0980103f - ATmega2560
	
	2. Enter `load`. You should get something like
	> [Loading section .data at 0x4350 (1186 bytes)]  
	> [Loading section .text at 0x0 (17232 bytes)]  
	
	3. Enter `run`. You should get something like
	> Starting program: C:\Adaino\examples\0_template\bin\main.elf 
	
	You can set up to 3 simultaneous breakpoints in Arduino Mega ATmega2560.
	
	