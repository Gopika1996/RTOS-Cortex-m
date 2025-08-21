#ifndef FREERTOS_CONFIG_H
#define FREERTOS_CONFIG_H

/*-----------------------------------------------------------
 * Application specific definitions.
 ----------------------------------------------------------/

/* Core settings */
#define configUSE_PREEMPTION            1
#define configUSE_IDLE_HOOK             0
#define configUSE_TICK_HOOK             0
#define configCPU_CLOCK_HZ              ( 72000000UL )   /* MCU clock in Hz */
#define configTICK_RATE_HZ              ( 1000 )         /* 1 ms tick */
#define configMAX_PRIORITIES            ( 5 )
#define configMINIMAL_STACK_SIZE        ( 128 )
#define configTOTAL_HEAP_SIZE           ( 10*1024 )      /* 10 KB heap */
#define configMAX_TASK_NAME_LEN         ( 16 )
#define configUSE_16_BIT_TICKS          0
#define configIDLE_SHOULD_YIELD         1

/* Synchronization primitives */
#define configUSE_MUTEXES               1
#define configUSE_COUNTING_SEMAPHORES   1

/* Software timers */
#define configUSE_TIMERS                1
#define configTIMER_TASK_PRIORITY       ( 2 )
#define configTIMER_QUEUE_LENGTH        5
#define configTIMER_TASK_STACK_DEPTH    ( 256 )

/* Optional hooks (set 1 if you implement them in your code) */
#define configUSE_MALLOC_FAILED_HOOK    0
#define configUSE_IDLE_HOOK             0
#define configUSE_TICK_HOOK             0

/* Co-routines (usually off for Cortex-M) */
#define configUSE_CO_ROUTINES           0

/* Cortex-M interrupt priorities */
#define configPRIO_BITS                 4        /* STM32F1 = 4 bits */
#define configLIBRARY_LOWEST_INTERRUPT_PRIORITY   15
#define configLIBRARY_MAX_SYSCALL_INTERRUPT_PRIORITY 5

#define configKERNEL_INTERRUPT_PRIORITY  \
    ( configLIBRARY_LOWEST_INTERRUPT_PRIORITY << (8 - configPRIO_BITS) )

#define configMAX_SYSCALL_INTERRUPT_PRIORITY  \
    ( configLIBRARY_MAX_SYSCALL_INTERRUPT_PRIORITY << (8 - configPRIO_BITS) )

/* Debug/trace options (off for minimal demo) */
#define configUSE_TRACE_FACILITY        0
#define configUSE_STATS_FORMATTING_FUNCTIONS 0

#endif /* FREERTOS_CONFIG_H */