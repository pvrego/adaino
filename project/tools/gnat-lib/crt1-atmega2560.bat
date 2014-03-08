@echo Generating object file
avr-gcc -c -mmcu=avr6 -o crt1-atmega2560.o crt1-atmega2560.S

@echo Renaming .o to ._o
rename crt1-atmega2560.o crt1-atmega2560._o