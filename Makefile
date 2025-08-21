TARGET = main
C_SOURCES = main.c

ASM_SOURCES = boot.s

FREERTOS_SRC = \
    FreeRTOS/Source/tasks.c \
    FreeRTOS/Source/list.c \
    FreeRTOS/Source/queue.c \
    FreeRTOS/Source/timers.c \
    FreeRTOS/Source/event_groups.c \
    FreeRTOS/Source/portable/GCC/ARM_CM3/port.c \
    FreeRTOS/Source/portable/MemMang/heap_4.c

OBJS = $(C_SOURCES:.c=.o) $(ASM_SOURCES:.s=.o) $(FREERTOS_SRC:.c=.o)

CC = arm-none-eabi-gcc
CFLAGS = -mcpu=cortex-m3 -mthumb -O0 -g -ffreestanding -Wall
LDFLAGS = -T flash.ld -nostdlib

all: $(TARGET).elf

$(TARGET).elf: $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $@ $(LDFLAGS)

clean:
	rm -f $(OBJS) $(TARGET).elf