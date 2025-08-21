TARGET = main
C_SOURCES = main.c

ASM_SOURCES = boot.S
FREERTOS_INC := freertos-kernel/include 
FREERTOS_INC_POR += freertos-kernel/portable/GCC/ARM_CM3/
FREERTOS_SRC = \
    freertos-kernel/tasks.c \
    freertos-kernel/list.c \
    freertos-kernel/queue.c \
    freertos-kernel/timers.c \
    freertos-kernel/event_groups.c \
    freertos-kernel/portable/GCC/ARM_CM3/port.c \
    freertos-kernel/portable/MemMang/heap_4.c

OBJS = $(C_SOURCES:.c=.o) $(ASM_SOURCES:.s=.o) $(FREERTOS_SRC:.c=.o)

CC = arm-none-eabi-gcc
CFLAGS = -mcpu=cortex-m3 -mthumb -O0 -g -ffreestanding -Wall -I$(FREERTOS_INC) -I. -I$(FREERTOS_INC_POR)
LDFLAGS = -T flash.ld -nostdlib

all: $(TARGET).elf

$(TARGET).elf: $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $@ $(LDFLAGS)

clean:
	rm -f $(OBJS) $(TARGET).elf