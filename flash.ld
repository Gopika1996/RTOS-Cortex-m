ENTRY(Reset_Handler)

/* Memory regions */
MEMORY
{
  FLASH (rx)  : ORIGIN = 0x08000000, LENGTH = 64K
  RAM   (rwx) : ORIGIN = 0x20000000, LENGTH = 20K
}

/* Top of stack */
_estack = ORIGIN(RAM) + LENGTH(RAM);

SECTIONS
{
  /* Vector table */
  .isr_vector :
  {
    KEEP(*(.isr_vector))
  } > FLASH

  /* Code and read-only data */
  .text :
  {
    *(.text)           /* .text sections (code) */
    *(.rodata)         /* read-only data */
    *(.glue_7) *(.glue_7t)  /* arm/Thumb interwork */
    *(.eh_frame)

    _etext = .;         /* end of code marker */
  } > FLASH

  /* Initialized data section */
  .data : AT (ADDR(.text) + SIZEOF(.text))
  {
    _sdata = .;         /* start of .data in RAM */
    *(.data)           /* initialized data */
    _edata = .;         /* end of .data in RAM */
  } > RAM

  /* Uninitialized data (zeroed at startup) */
  .bss :
  {
    _sbss = .;          /* start of .bss */
    *(.bss)
    *(COMMON)
    _ebss = .;          /* end of .bss */
  } > RAM

  /* Used by startup code to copy init values */
  _sidata = LOADADDR(.data);
}