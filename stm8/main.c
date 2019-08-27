#include "stm8l15x.h"

#define LED_BLUE 	GPIOC
#define LED_GREEN 	GPIOE
#define LED_PORT 	GPIO_Pin_7

main()
{
	//https://github.com/hbendalibraham/stm8_started to help with mscode and sdcc
	//just blinker code for discovery
	GPIO_DeInit(LED_BLUE);
	GPIO_Init(LED_BLUE, LED_PORT, GPIO_Mode_Out_PP_Low_Slow);
	GPIO_DeInit(LED_GREEN);
	GPIO_Init(LED_GREEN, LED_PORT, GPIO_Mode_Out_PP_Low_Slow);
	
	while (1)
	{
		GPIO_ToggleBits(LED_BLUE, LED_PORT);
		
		GPIO_ToggleBits(LED_GREEN, LED_PORT);
		delay_ms(5);
		GPIO_ToggleBits(LED_GREEN, LED_PORT);
		delay_ms(45);
		GPIO_ToggleBits(LED_GREEN, LED_PORT);
		delay_ms(5);
		GPIO_ToggleBits(LED_GREEN, LED_PORT);
		delay_ms(45);
	}
}