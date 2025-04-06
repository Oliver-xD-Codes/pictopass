# Makefile for PictoPass (DS homebrew)

# Set the toolchain
DEVKITPRO ?= /opt/devkitpro
DEVKITARM ?= $(DEVKITPRO)/devkitARM
NDSTOOL = $(DEVKITPRO)/tools/bin/ndstool

# Source files
SRC = main.c
OBJ = $(SRC:.c=.o)

# Output file
OUT = PictoPass.nds

# Build the project
all: $(OUT)

# Compile the source code into object files
%.o: %.c
	$(DEVKITARM)/bin/arm-none-eabi-gcc -c -o $@ $< -I$(DEVKITPRO)/libnds/include -I$(DEVKITPRO)/devkitARM/include

# Link the object files into a .nds file
$(OUT): $(OBJ)
	$(DEVKITARM)/bin/arm-none-eabi-gcc -o $(OUT) $(OBJ) -L$(DEVKITPRO)/libnds/lib -lnds -lnitro -lm

# Clean up object files and the .nds file
clean:
	rm -f $(OBJ) $(OUT)

