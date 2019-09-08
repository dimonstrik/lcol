#include "stm8l15x.h"

u16 display_array[6];
u8 ij = 0;

main()
{
	LCD_GLASS_Init();
	 
	for (ij=0; ij < 6; ij++)
	{
		display_array[ij] = (ij + 0x30);
	}
		
	while (1)
	{
		LCD_GLASS_ScrollSentence("      ** HELLO WORLD **", 1, SCROLL_SPEED);
		LCD_GLASS_Clear();
		delay_ms(50);
		LCD_GLASS_DisplayStrDeci(display_array);
		delay_ms(100);
		LCD_GLASS_Clear();
		delay_ms(100);
	}
}