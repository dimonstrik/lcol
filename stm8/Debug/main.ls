   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
  46                     ; 11 main()
  46                     ; 12 {
  48                     	switch	.text
  49  0000               _main:
  53                     ; 13 	GPIO_DeInit(LED_BLUE);
  55  0000 ae500a        	ldw	x,#20490
  56  0003 cd0000        	call	_GPIO_DeInit
  58                     ; 14 	GPIO_Init(LED_BLUE, LED_PORT, GPIO_Mode_Out_PP_Low_Slow);
  60  0006 4bc0          	push	#192
  61  0008 4b80          	push	#128
  62  000a ae500a        	ldw	x,#20490
  63  000d cd0000        	call	_GPIO_Init
  65  0010 85            	popw	x
  66                     ; 15 	GPIO_DeInit(LED_GREEN);
  68  0011 ae5014        	ldw	x,#20500
  69  0014 cd0000        	call	_GPIO_DeInit
  71                     ; 16 	GPIO_Init(LED_GREEN, LED_PORT, GPIO_Mode_Out_PP_Low_Slow);
  73  0017 4bc0          	push	#192
  74  0019 4b80          	push	#128
  75  001b ae5014        	ldw	x,#20500
  76  001e cd0000        	call	_GPIO_Init
  78  0021 85            	popw	x
  79  0022               L12:
  80                     ; 20 		GPIO_ToggleBits(LED_BLUE, LED_PORT);
  82  0022 4b80          	push	#128
  83  0024 ae500a        	ldw	x,#20490
  84  0027 cd0000        	call	_GPIO_ToggleBits
  86  002a 84            	pop	a
  87                     ; 22 		GPIO_ToggleBits(LED_GREEN, LED_PORT);
  89  002b 4b80          	push	#128
  90  002d ae5014        	ldw	x,#20500
  91  0030 cd0000        	call	_GPIO_ToggleBits
  93  0033 84            	pop	a
  94                     ; 23 		delay_ms(5);
  96  0034 ae0005        	ldw	x,#5
  97  0037 cd0000        	call	_delay_ms
  99                     ; 24 		GPIO_ToggleBits(LED_GREEN, LED_PORT);
 101  003a 4b80          	push	#128
 102  003c ae5014        	ldw	x,#20500
 103  003f cd0000        	call	_GPIO_ToggleBits
 105  0042 84            	pop	a
 106                     ; 25 		delay_ms(45);
 108  0043 ae002d        	ldw	x,#45
 109  0046 cd0000        	call	_delay_ms
 111                     ; 26 		GPIO_ToggleBits(LED_GREEN, LED_PORT);
 113  0049 4b80          	push	#128
 114  004b ae5014        	ldw	x,#20500
 115  004e cd0000        	call	_GPIO_ToggleBits
 117  0051 84            	pop	a
 118                     ; 27 		delay_ms(5);
 120  0052 ae0005        	ldw	x,#5
 121  0055 cd0000        	call	_delay_ms
 123                     ; 28 		GPIO_ToggleBits(LED_GREEN, LED_PORT);
 125  0058 4b80          	push	#128
 126  005a ae5014        	ldw	x,#20500
 127  005d cd0000        	call	_GPIO_ToggleBits
 129  0060 84            	pop	a
 130                     ; 29 		delay_ms(45);
 132  0061 ae002d        	ldw	x,#45
 133  0064 cd0000        	call	_delay_ms
 136  0067 20b9          	jra	L12
 149                     	xdef	_main
 150                     	xref	_GPIO_ToggleBits
 151                     	xref	_GPIO_Init
 152                     	xref	_GPIO_DeInit
 153                     	xref	_delay_ms
 172                     	end
