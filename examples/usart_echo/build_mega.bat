@REM $Id: build_mega.bat 2 2013-09-02 22:16:20Z pvrego $

@echo #----------------------------------------------------------------------------#
@echo # Generating main.elf
@echo #----------------------------------------------------------------------------#
avr-gnatmake -f src\main.adb -o bin\main.elf -Os -mmcu=avr6 --RTS=zfp -largs obj\crt1-atmega2560._o -nostdlib -lgcc -mavr6 -Tdata=0x00800200

@echo #----------------------------------------------------------------------------#
@echo # Generating main.lss
@echo #----------------------------------------------------------------------------#
avr-objdump -h -S bin\main.elf > bin\main.lss

@echo #----------------------------------------------------------------------------#
@echo # Generating main.hex 
@echo #----------------------------------------------------------------------------#
avr-objcopy -O ihex bin\main.elf bin\main.hex

@echo #----------------------------------------------------------------------------#
@echo # File size main.hex 
@echo #----------------------------------------------------------------------------#
avr-size --target=ihex bin\main.hex

@echo #----------------------------------------------------------------------------#
@echo # Moving object files to object folder
@echo #----------------------------------------------------------------------------#
@mv *.ali obj
@mv *.o obj
@echo # Done

@pause