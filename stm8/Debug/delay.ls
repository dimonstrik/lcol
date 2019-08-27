   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
  54                     ; 30 void delay_ms(u16 n_ms)
  54                     ; 31 {
  56                     	switch	.text
  57  0000               _delay_ms:
  59  0000 89            	pushw	x
  60       00000000      OFST:	set	0
  63                     ; 33   CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);
  65  0001 ae0201        	ldw	x,#513
  66  0004 cd0000        	call	_CLK_PeripheralClockConfig
  68                     ; 36   TIM4->PSCR = 6;
  70  0007 350652e8      	mov	21224,#6
  71                     ; 39   TIM4->ARR = 250;
  73  000b 35fa52e9      	mov	21225,#250
  74                     ; 42   TIM4->CNTR = 2;
  76  000f 350252e7      	mov	21223,#2
  77                     ; 45   TIM4->SR1 &= ~TIM4_SR1_UIF;
  79  0013 721152e5      	bres	21221,#0
  80                     ; 48   TIM4->CR1 |= TIM4_CR1_CEN;
  82  0017 721052e0      	bset	21216,#0
  84  001b 200b          	jra	L13
  85  001d               L73:
  86                     ; 52     while((TIM4->SR1 & TIM4_SR1_UIF) == 0) ;
  88  001d c652e5        	ld	a,21221
  89  0020 a501          	bcp	a,#1
  90  0022 27f9          	jreq	L73
  91                     ; 53     TIM4->SR1 &= ~TIM4_SR1_UIF;
  93  0024 721152e5      	bres	21221,#0
  94  0028               L13:
  95                     ; 50   while(n_ms--)
  97  0028 1e01          	ldw	x,(OFST+1,sp)
  98  002a 1d0001        	subw	x,#1
  99  002d 1f01          	ldw	(OFST+1,sp),x
 100  002f 1c0001        	addw	x,#1
 101  0032 a30000        	cpw	x,#0
 102  0035 26e6          	jrne	L73
 103                     ; 57   TIM4->CR1 &= ~TIM4_CR1_CEN;
 105  0037 721152e0      	bres	21216,#0
 106                     ; 58 }
 109  003b 85            	popw	x
 110  003c 81            	ret
 145                     ; 66 void delay_10us(u16 n_10us)
 145                     ; 67 {
 146                     	switch	.text
 147  003d               _delay_10us:
 149  003d 89            	pushw	x
 150       00000000      OFST:	set	0
 153                     ; 69   CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);
 155  003e ae0201        	ldw	x,#513
 156  0041 cd0000        	call	_CLK_PeripheralClockConfig
 158                     ; 72   TIM4->PSCR = 0;
 160  0044 725f52e8      	clr	21224
 161                     ; 75   TIM4->ARR = 160;
 163  0048 35a052e9      	mov	21225,#160
 164                     ; 78   TIM4->CNTR = 10;
 166  004c 350a52e7      	mov	21223,#10
 167                     ; 81   TIM4->SR1 &= ~TIM4_SR1_UIF;
 169  0050 721152e5      	bres	21221,#0
 170                     ; 84   TIM4->CR1 |= TIM4_CR1_CEN;
 172  0054 721052e0      	bset	21216,#0
 174  0058 200b          	jra	L36
 175  005a               L17:
 176                     ; 88     while((TIM4->SR1 & TIM4_SR1_UIF) == 0) ;
 178  005a c652e5        	ld	a,21221
 179  005d a501          	bcp	a,#1
 180  005f 27f9          	jreq	L17
 181                     ; 89     TIM4->SR1 &= ~TIM4_SR1_UIF;
 183  0061 721152e5      	bres	21221,#0
 184  0065               L36:
 185                     ; 86   while(n_10us--)
 187  0065 1e01          	ldw	x,(OFST+1,sp)
 188  0067 1d0001        	subw	x,#1
 189  006a 1f01          	ldw	(OFST+1,sp),x
 190  006c 1c0001        	addw	x,#1
 191  006f a30000        	cpw	x,#0
 192  0072 26e6          	jrne	L17
 193                     ; 93   TIM4->CR1 &= ~TIM4_CR1_CEN;
 195  0074 721152e0      	bres	21216,#0
 196                     ; 94  CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, DISABLE);
 198  0078 ae0200        	ldw	x,#512
 199  007b cd0000        	call	_CLK_PeripheralClockConfig
 201                     ; 96 }
 204  007e 85            	popw	x
 205  007f 81            	ret
 218                     	xref	_CLK_PeripheralClockConfig
 219                     	xdef	_delay_10us
 220                     	xdef	_delay_ms
 239                     	end
