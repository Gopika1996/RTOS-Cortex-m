.syntax unified
.cpu cortex-m3
.thumb

.global _start
.global Reset_Handler

/* Linker provides stack top */
.word _estack

/* Vector table */
.section .isr_vector,"a",%progbits
.word   _estack                /* Initial stack pointer */
.word   Reset_Handler          /* Reset handler */
.word   Default_Handler        /* NMI */
.word   Default_Handler        /* HardFault */
.word   Default_Handler        /* MemManage */
.word   Default_Handler        /* BusFault */
.word   Default_Handler        /* UsageFault */
.word   0                      /* Reserved */
.word   0                      /* Reserved */
.word   0                      /* Reserved */
.word   0                      /* Reserved */
.word   Default_Handler        /* SVCall */
.word   Default_Handler        /* Debug Monitor */
.word   0                      /* Reserved */
.word   Default_Handler        /* PendSV */
.word   Default_Handler        /* SysTick */

.text
.thumb_func
Reset_Handler:
    /* Copy .data from flash to RAM */
    ldr r0, =_sidata
    ldr r1, =_sdata
    ldr r2, =_edata
1:
    cmp r1, r2
    ittt lt
    ldrlt r3, [r0], #4
    strlt r3, [r1], #4
    blt 1b

    /* Zero initialize .bss */
    ldr r1, =_sbss
    ldr r2, =_ebss
    movs r3, #0
2:
    cmp r1, r2
    itt lt
    strlt r3, [r1], #4
    blt 2b

    bl main
    b .
 
.thumb_func
Default_Handler:
    b .