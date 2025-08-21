#include "FreeRTOS.h"
#include "task.h"

/* Dummy UART print (replace with real UART/semihosting) */
extern void send_char(char c);
static void uart_print(const char *s)
{
    while (*s) send_char(*s++);
}

void vTaskOdd(void *pvParameters)
{
    int num = 1;
    char buf[32];
    for (;;)
    {
        sprintf(buf, "Odd: %d\r\n", num);
        uart_print(buf);
        num += 2;
        vTaskDelay(pdMS_TO_TICKS(1000));
    }
}

void vTaskEven(void *pvParameters)
{
    int num = 2;
    char buf[32];
    for (;;)
    {
        sprintf(buf, "Even: %d\r\n", num);
        uart_print(buf);
        num += 2;
        vTaskDelay(pdMS_TO_TICKS(1000));
    }
}

int main(void)
{
    /* Create tasks */
    xTaskCreate(vTaskOdd, "OddTask", 128, NULL, 1, NULL);
    xTaskCreate(vTaskEven, "EvenTask", 128, NULL, 1, NULL);

    /* Start scheduler */
    vTaskStartScheduler();

    while (1) {}
}