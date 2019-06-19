MMCU=-mmcu=atmega8

CC=avr-gcc
OBJCOPY=avr-objcopy

SOURCES=main.c
HEXFIRMWARE=main.hex
ELFFIRMWARE=main.elf
OBJECTS=$(SOURCES:.c=.o)

DESTDIR=build
SOURCEDIR=src
FIRMWARES=firmwares

CFLAGS=-g
OBJFLAGS=-j .text -j .data -O ihex

.PHONY: all clean

all: post-build

.SILENT:
pre-build:
	rm -rf $(DESTDIR)
	rm -rf $(FIRMWARES)

	mkdir $(DESTDIR)
	mkdir $(FIRMWARES)
	echo Compiler: "$(CC)"
	echo MMCU: "$(MMCU)"

.SILENT:
post-build: main-target
	mv $(DESTDIR)/$(HEXFIRMWARE) $(FIRMWARES)/$(HEXFIRMWARE)
	rm -rf $(DESTDIR)
	echo "Done"

.SILENT:
main-target: pre-build $(ELFFIRMWARE)
	echo "Casting elf to hex..."
	$(OBJCOPY) $(OBJFLAGS) $(DESTDIR)/$(ELFFIRMWARE) $(DESTDIR)/$(HEXFIRMWARE)

$(OBJECTS):
	echo "Building objects..."
	$(CC) $(CFLAGS) -Os $(MMCU) -c $(SOURCEDIR)/$(SOURCES) -o $(DESTDIR)/$(OBJECTS)

$(ELFFIRMWARE): $(OBJECTS)
	echo "Building elf firmware..."
	$(CC) $(CFLAGS) $(MMCU) -o $(DESTDIR)/$(ELFFIRMWARE) $(DESTDIR)/$(OBJECTS)

.SILENT:
clean:
	rm -rf $(DESTDIR)
	rm -rf $(FIRMWARES)
