   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
 108                     ; 45 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 108                     ; 46 {
 110                     	switch	.text
 111  0000               _GPIO_DeInit:
 115                     ; 47   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 117  0000 6f04          	clr	(4,x)
 118                     ; 48   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 120  0002 7f            	clr	(x)
 121                     ; 49   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 123  0003 6f02          	clr	(2,x)
 124                     ; 50   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 126  0005 6f03          	clr	(3,x)
 127                     ; 51 }
 130  0007 81            	ret
 286                     ; 63 void GPIO_Init(GPIO_TypeDef* GPIOx,
 286                     ; 64                uint8_t GPIO_Pin,
 286                     ; 65                GPIO_Mode_TypeDef GPIO_Mode)
 286                     ; 66 {
 287                     	switch	.text
 288  0008               _GPIO_Init:
 290  0008 89            	pushw	x
 291       00000000      OFST:	set	0
 294                     ; 71   assert_param(IS_GPIO_MODE(GPIO_Mode));
 296                     ; 72   assert_param(IS_GPIO_PIN(GPIO_Pin));
 298                     ; 75   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 300  0009 7b05          	ld	a,(OFST+5,sp)
 301  000b 43            	cpl	a
 302  000c e404          	and	a,(4,x)
 303  000e e704          	ld	(4,x),a
 304                     ; 81   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 306  0010 7b06          	ld	a,(OFST+6,sp)
 307  0012 a580          	bcp	a,#128
 308  0014 271d          	jreq	L541
 309                     ; 83     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 311  0016 7b06          	ld	a,(OFST+6,sp)
 312  0018 a510          	bcp	a,#16
 313  001a 2706          	jreq	L741
 314                     ; 85       GPIOx->ODR |= GPIO_Pin;
 316  001c f6            	ld	a,(x)
 317  001d 1a05          	or	a,(OFST+5,sp)
 318  001f f7            	ld	(x),a
 320  0020 2007          	jra	L151
 321  0022               L741:
 322                     ; 88       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 324  0022 1e01          	ldw	x,(OFST+1,sp)
 325  0024 7b05          	ld	a,(OFST+5,sp)
 326  0026 43            	cpl	a
 327  0027 f4            	and	a,(x)
 328  0028 f7            	ld	(x),a
 329  0029               L151:
 330                     ; 91     GPIOx->DDR |= GPIO_Pin;
 332  0029 1e01          	ldw	x,(OFST+1,sp)
 333  002b e602          	ld	a,(2,x)
 334  002d 1a05          	or	a,(OFST+5,sp)
 335  002f e702          	ld	(2,x),a
 337  0031 2009          	jra	L351
 338  0033               L541:
 339                     ; 95     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 341  0033 1e01          	ldw	x,(OFST+1,sp)
 342  0035 7b05          	ld	a,(OFST+5,sp)
 343  0037 43            	cpl	a
 344  0038 e402          	and	a,(2,x)
 345  003a e702          	ld	(2,x),a
 346  003c               L351:
 347                     ; 102   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 349  003c 7b06          	ld	a,(OFST+6,sp)
 350  003e a540          	bcp	a,#64
 351  0040 270a          	jreq	L551
 352                     ; 104     GPIOx->CR1 |= GPIO_Pin;
 354  0042 1e01          	ldw	x,(OFST+1,sp)
 355  0044 e603          	ld	a,(3,x)
 356  0046 1a05          	or	a,(OFST+5,sp)
 357  0048 e703          	ld	(3,x),a
 359  004a 2009          	jra	L751
 360  004c               L551:
 361                     ; 107     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 363  004c 1e01          	ldw	x,(OFST+1,sp)
 364  004e 7b05          	ld	a,(OFST+5,sp)
 365  0050 43            	cpl	a
 366  0051 e403          	and	a,(3,x)
 367  0053 e703          	ld	(3,x),a
 368  0055               L751:
 369                     ; 114   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 371  0055 7b06          	ld	a,(OFST+6,sp)
 372  0057 a520          	bcp	a,#32
 373  0059 270a          	jreq	L161
 374                     ; 116     GPIOx->CR2 |= GPIO_Pin;
 376  005b 1e01          	ldw	x,(OFST+1,sp)
 377  005d e604          	ld	a,(4,x)
 378  005f 1a05          	or	a,(OFST+5,sp)
 379  0061 e704          	ld	(4,x),a
 381  0063 2009          	jra	L361
 382  0065               L161:
 383                     ; 119     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 385  0065 1e01          	ldw	x,(OFST+1,sp)
 386  0067 7b05          	ld	a,(OFST+5,sp)
 387  0069 43            	cpl	a
 388  006a e404          	and	a,(4,x)
 389  006c e704          	ld	(4,x),a
 390  006e               L361:
 391                     ; 122 }
 394  006e 85            	popw	x
 395  006f 81            	ret
 441                     ; 132 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t GPIO_PortVal)
 441                     ; 133 {
 442                     	switch	.text
 443  0070               _GPIO_Write:
 445  0070 89            	pushw	x
 446       00000000      OFST:	set	0
 449                     ; 134   GPIOx->ODR = GPIO_PortVal;
 451  0071 7b05          	ld	a,(OFST+5,sp)
 452  0073 1e01          	ldw	x,(OFST+1,sp)
 453  0075 f7            	ld	(x),a
 454                     ; 135 }
 457  0076 85            	popw	x
 458  0077 81            	ret
 618                     ; 146 void GPIO_WriteBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, BitAction GPIO_BitVal)
 618                     ; 147 {
 619                     	switch	.text
 620  0078               _GPIO_WriteBit:
 622  0078 89            	pushw	x
 623       00000000      OFST:	set	0
 626                     ; 149   assert_param(IS_GPIO_PIN(GPIO_Pin));
 628                     ; 150   assert_param(IS_STATE_VALUE(GPIO_BitVal));
 630                     ; 152   if (GPIO_BitVal != RESET)
 632  0079 0d06          	tnz	(OFST+6,sp)
 633  007b 2706          	jreq	L303
 634                     ; 154     GPIOx->ODR |= GPIO_Pin;
 636  007d f6            	ld	a,(x)
 637  007e 1a05          	or	a,(OFST+5,sp)
 638  0080 f7            	ld	(x),a
 640  0081 2007          	jra	L503
 641  0083               L303:
 642                     ; 159     GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
 644  0083 1e01          	ldw	x,(OFST+1,sp)
 645  0085 7b05          	ld	a,(OFST+5,sp)
 646  0087 43            	cpl	a
 647  0088 f4            	and	a,(x)
 648  0089 f7            	ld	(x),a
 649  008a               L503:
 650                     ; 161 }
 653  008a 85            	popw	x
 654  008b 81            	ret
 700                     ; 170 void GPIO_SetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 700                     ; 171 {
 701                     	switch	.text
 702  008c               _GPIO_SetBits:
 704  008c 89            	pushw	x
 705       00000000      OFST:	set	0
 708                     ; 172   GPIOx->ODR |= GPIO_Pin;
 710  008d f6            	ld	a,(x)
 711  008e 1a05          	or	a,(OFST+5,sp)
 712  0090 f7            	ld	(x),a
 713                     ; 173 }
 716  0091 85            	popw	x
 717  0092 81            	ret
 763                     ; 183 void GPIO_ResetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 763                     ; 184 {
 764                     	switch	.text
 765  0093               _GPIO_ResetBits:
 767  0093 89            	pushw	x
 768       00000000      OFST:	set	0
 771                     ; 185   GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
 773  0094 7b05          	ld	a,(OFST+5,sp)
 774  0096 43            	cpl	a
 775  0097 f4            	and	a,(x)
 776  0098 f7            	ld	(x),a
 777                     ; 186 }
 780  0099 85            	popw	x
 781  009a 81            	ret
 827                     ; 195 void GPIO_ToggleBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 827                     ; 196 {
 828                     	switch	.text
 829  009b               _GPIO_ToggleBits:
 831  009b 89            	pushw	x
 832       00000000      OFST:	set	0
 835                     ; 197   GPIOx->ODR ^= GPIO_Pin;
 837  009c f6            	ld	a,(x)
 838  009d 1805          	xor	a,(OFST+5,sp)
 839  009f f7            	ld	(x),a
 840                     ; 198 }
 843  00a0 85            	popw	x
 844  00a1 81            	ret
 881                     ; 206 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 881                     ; 207 {
 882                     	switch	.text
 883  00a2               _GPIO_ReadInputData:
 887                     ; 208   return ((uint8_t)GPIOx->IDR);
 889  00a2 e601          	ld	a,(1,x)
 892  00a4 81            	ret
 930                     ; 217 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 930                     ; 218 {
 931                     	switch	.text
 932  00a5               _GPIO_ReadOutputData:
 936                     ; 219   return ((uint8_t)GPIOx->ODR);
 938  00a5 f6            	ld	a,(x)
 941  00a6 81            	ret
 990                     ; 228 BitStatus GPIO_ReadInputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
 990                     ; 229 {
 991                     	switch	.text
 992  00a7               _GPIO_ReadInputDataBit:
 994  00a7 89            	pushw	x
 995       00000000      OFST:	set	0
 998                     ; 230   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
1000  00a8 e601          	ld	a,(1,x)
1001  00aa 1405          	and	a,(OFST+5,sp)
1004  00ac 85            	popw	x
1005  00ad 81            	ret
1054                     ; 239 BitStatus GPIO_ReadOutputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
1054                     ; 240 {
1055                     	switch	.text
1056  00ae               _GPIO_ReadOutputDataBit:
1058  00ae 89            	pushw	x
1059       00000000      OFST:	set	0
1062                     ; 241   return ((BitStatus)(GPIOx->ODR & (uint8_t)GPIO_Pin));
1064  00af f6            	ld	a,(x)
1065  00b0 1405          	and	a,(OFST+5,sp)
1068  00b2 85            	popw	x
1069  00b3 81            	ret
1146                     ; 251 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, FunctionalState NewState)
1146                     ; 252 {
1147                     	switch	.text
1148  00b4               _GPIO_ExternalPullUpConfig:
1150  00b4 89            	pushw	x
1151       00000000      OFST:	set	0
1154                     ; 254   assert_param(IS_GPIO_PIN(GPIO_Pin));
1156                     ; 255   assert_param(IS_FUNCTIONAL_STATE(NewState));
1158                     ; 257   if (NewState != DISABLE) /* External Pull-Up Set*/
1160  00b5 0d06          	tnz	(OFST+6,sp)
1161  00b7 2708          	jreq	L355
1162                     ; 259     GPIOx->CR1 |= GPIO_Pin;
1164  00b9 e603          	ld	a,(3,x)
1165  00bb 1a05          	or	a,(OFST+5,sp)
1166  00bd e703          	ld	(3,x),a
1168  00bf 2009          	jra	L555
1169  00c1               L355:
1170                     ; 262     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
1172  00c1 1e01          	ldw	x,(OFST+1,sp)
1173  00c3 7b05          	ld	a,(OFST+5,sp)
1174  00c5 43            	cpl	a
1175  00c6 e403          	and	a,(3,x)
1176  00c8 e703          	ld	(3,x),a
1177  00ca               L555:
1178                     ; 264 }
1181  00ca 85            	popw	x
1182  00cb 81            	ret
1195                     	xdef	_GPIO_ExternalPullUpConfig
1196                     	xdef	_GPIO_ReadOutputDataBit
1197                     	xdef	_GPIO_ReadInputDataBit
1198                     	xdef	_GPIO_ReadOutputData
1199                     	xdef	_GPIO_ReadInputData
1200                     	xdef	_GPIO_ToggleBits
1201                     	xdef	_GPIO_ResetBits
1202                     	xdef	_GPIO_SetBits
1203                     	xdef	_GPIO_WriteBit
1204                     	xdef	_GPIO_Write
1205                     	xdef	_GPIO_Init
1206                     	xdef	_GPIO_DeInit
1225                     	end
