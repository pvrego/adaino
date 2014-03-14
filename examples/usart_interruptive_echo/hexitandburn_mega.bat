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
@echo # Burning main.hex in ATMega328p with COM5
@echo # (remember to put avrdude.exe and avrdude.conf in path)
@echo #----------------------------------------------------------------------------#
avrdude.exe  -v -pm2560 -cstk500v2 -PCOM5 -b115200 -e -U flash:w:"bin\main.hex"
@echo # Done