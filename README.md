# avrdude -p m8 -c usbasp
## -p - Версия мк
## -c - Программатор

## Прошивка
### Запись:  -U flash:w:{Название hex файла}:a
### Чтение: -U flash:r:{Название hex файла}
### avr-gcc -g -Os -mmcu=atmega8 -c main.c
### avr-gcc -g -mmcu=atmega8 -o main.elf main.o
### avr-objcopy -j .text -j .data -O ihex main.elf main.hex
