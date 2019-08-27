   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
  14                     .const:	section	.text
  15  0000               _SYSDivFactor:
  16  0000 01            	dc.b	1
  17  0001 02            	dc.b	2
  18  0002 04            	dc.b	4
  19  0003 08            	dc.b	8
  20  0004 10            	dc.b	16
  49                     ; 60 void CLK_DeInit(void)
  49                     ; 61 {
  51                     	switch	.text
  52  0000               _CLK_DeInit:
  56                     ; 62   CLK->ICKCR = CLK_ICKCR_RESET_VALUE;
  58  0000 351150c2      	mov	20674,#17
  59                     ; 63   CLK->ECKCR = CLK_ECKCR_RESET_VALUE;
  61  0004 725f50c6      	clr	20678
  62                     ; 64   CLK->CRTCR = CLK_CRTCR_RESET_VALUE;
  64  0008 725f50c1      	clr	20673
  65                     ; 65   CLK->CBEEPR = CLK_CBEEPR_RESET_VALUE;
  67  000c 725f50cb      	clr	20683
  68                     ; 66   CLK->SWR  = CLK_SWR_RESET_VALUE;
  70  0010 350150c8      	mov	20680,#1
  71                     ; 67   CLK->SWCR = CLK_SWCR_RESET_VALUE;
  73  0014 725f50c9      	clr	20681
  74                     ; 68   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  76  0018 350350c0      	mov	20672,#3
  77                     ; 69   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  79  001c 725f50c3      	clr	20675
  80                     ; 70   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  82  0020 358050c4      	mov	20676,#128
  83                     ; 71   CLK->PCKENR3 = CLK_PCKENR3_RESET_VALUE;
  85  0024 725f50d0      	clr	20688
  86                     ; 72   CLK->CSSR = CLK_CSSR_RESET_VALUE;
  88  0028 725f50ca      	clr	20682
  89                     ; 73   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  91  002c 725f50c5      	clr	20677
  92                     ; 74   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
  94  0030 725f50cd      	clr	20685
  95                     ; 75   CLK->HSICALR = CLK_HSICALR_RESET_VALUE;
  97  0034 725f50cc      	clr	20684
  98                     ; 76   CLK->HSIUNLCKR = CLK_HSIUNLCKR_RESET_VALUE;
 100  0038 725f50ce      	clr	20686
 101                     ; 77   CLK->REGCSR = CLK_REGCSR_RESET_VALUE;
 103  003c 35b950cf      	mov	20687,#185
 104                     ; 78 }
 107  0040 81            	ret
 162                     ; 85 void CLK_HSICmd(FunctionalState NewState)
 162                     ; 86 {
 163                     	switch	.text
 164  0041               _CLK_HSICmd:
 168                     ; 89   assert_param(IS_FUNCTIONAL_STATE(NewState));
 170                     ; 91   if (NewState != DISABLE)
 172  0041 4d            	tnz	a
 173  0042 2706          	jreq	L74
 174                     ; 94     CLK->ICKCR |= CLK_ICKCR_HSION;
 176  0044 721050c2      	bset	20674,#0
 178  0048 2004          	jra	L15
 179  004a               L74:
 180                     ; 99     CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_HSION);
 182  004a 721150c2      	bres	20674,#0
 183  004e               L15:
 184                     ; 101 }
 187  004e 81            	ret
 223                     ; 108 void CLK_AdjustHSICalibrationValue(uint8_t CLK_HSICalibrationValue)
 223                     ; 109 {
 224                     	switch	.text
 225  004f               _CLK_AdjustHSICalibrationValue:
 229                     ; 111   CLK->HSIUNLCKR = 0xAC;
 231  004f 35ac50ce      	mov	20686,#172
 232                     ; 112   CLK->HSIUNLCKR = 0x35;
 234  0053 353550ce      	mov	20686,#53
 235                     ; 115   CLK->HSITRIMR = (uint8_t)CLK_HSICalibrationValue;
 237  0057 c750cd        	ld	20685,a
 238                     ; 116 }
 241  005a 81            	ret
 276                     ; 123 void CLK_LSICmd(FunctionalState NewState)
 276                     ; 124 {
 277                     	switch	.text
 278  005b               _CLK_LSICmd:
 282                     ; 127   assert_param(IS_FUNCTIONAL_STATE(NewState));
 284                     ; 129   if (NewState != DISABLE)
 286  005b 4d            	tnz	a
 287  005c 2706          	jreq	L701
 288                     ; 132     CLK->ICKCR |= CLK_ICKCR_LSION;
 290  005e 721450c2      	bset	20674,#2
 292  0062 2004          	jra	L111
 293  0064               L701:
 294                     ; 137     CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_LSION);
 296  0064 721550c2      	bres	20674,#2
 297  0068               L111:
 298                     ; 139 }
 301  0068 81            	ret
 363                     ; 149 void CLK_HSEConfig(CLK_HSE_TypeDef CLK_HSE)
 363                     ; 150 {
 364                     	switch	.text
 365  0069               _CLK_HSEConfig:
 369                     ; 152   assert_param(IS_CLK_HSE(CLK_HSE));
 371                     ; 156   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEON;
 373  0069 721150c6      	bres	20678,#0
 374                     ; 159   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEBYP;
 376  006d 721950c6      	bres	20678,#4
 377                     ; 162   CLK->ECKCR |= (uint8_t)CLK_HSE;
 379  0071 ca50c6        	or	a,20678
 380  0074 c750c6        	ld	20678,a
 381                     ; 163 }
 384  0077 81            	ret
 446                     ; 173 void CLK_LSEConfig(CLK_LSE_TypeDef CLK_LSE)
 446                     ; 174 {
 447                     	switch	.text
 448  0078               _CLK_LSEConfig:
 452                     ; 176   assert_param(IS_CLK_LSE(CLK_LSE));
 454                     ; 180   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEON;
 456  0078 721550c6      	bres	20678,#2
 457                     ; 183   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEBYP;
 459  007c 721b50c6      	bres	20678,#5
 460                     ; 186   CLK->ECKCR |= (uint8_t)CLK_LSE;
 462  0080 ca50c6        	or	a,20678
 463  0083 c750c6        	ld	20678,a
 464                     ; 188 }
 467  0086 81            	ret
 541                     ; 196 void CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_TypeDef CLK_SYSCLKSource)
 541                     ; 197 {
 542                     	switch	.text
 543  0087               _CLK_SYSCLKSourceConfig:
 547                     ; 199   assert_param(IS_CLK_SOURCE(CLK_SYSCLKSource));
 549                     ; 202   CLK->SWR = (uint8_t)CLK_SYSCLKSource;
 551  0087 c750c8        	ld	20680,a
 552                     ; 203 }
 555  008a 81            	ret
 653                     ; 211 void CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_TypeDef CLK_SYSCLKDiv)
 653                     ; 212 {
 654                     	switch	.text
 655  008b               _CLK_SYSCLKDivConfig:
 659                     ; 214   assert_param(IS_CLK_SYSTEM_DIVIDER(CLK_SYSCLKDiv));
 661                     ; 216   CLK->CKDIVR = (uint8_t)(CLK_SYSCLKDiv);
 663  008b c750c0        	ld	20672,a
 664                     ; 217 }
 667  008e 81            	ret
 703                     ; 223 void CLK_SYSCLKSourceSwitchCmd(FunctionalState NewState)
 703                     ; 224 {
 704                     	switch	.text
 705  008f               _CLK_SYSCLKSourceSwitchCmd:
 709                     ; 226   assert_param(IS_FUNCTIONAL_STATE(NewState));
 711                     ; 228   if (NewState != DISABLE)
 713  008f 4d            	tnz	a
 714  0090 2706          	jreq	L503
 715                     ; 231     CLK->SWCR |= CLK_SWCR_SWEN;
 717  0092 721250c9      	bset	20681,#1
 719  0096 2004          	jra	L703
 720  0098               L503:
 721                     ; 236     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
 723  0098 721350c9      	bres	20681,#1
 724  009c               L703:
 725                     ; 238 }
 728  009c 81            	ret
 753                     ; 250 CLK_SYSCLKSource_TypeDef CLK_GetSYSCLKSource(void)
 753                     ; 251 {
 754                     	switch	.text
 755  009d               _CLK_GetSYSCLKSource:
 759                     ; 252   return ((CLK_SYSCLKSource_TypeDef)(CLK->SCSR));
 761  009d c650c7        	ld	a,20679
 764  00a0 81            	ret
 788                     ; 261 void CLK_ClockSecuritySystemEnable(void)
 788                     ; 262 {
 789                     	switch	.text
 790  00a1               _CLK_ClockSecuritySystemEnable:
 794                     ; 264   CLK->CSSR |= CLK_CSSR_CSSEN;
 796  00a1 721050ca      	bset	20682,#0
 797                     ; 265 }
 800  00a5 81            	ret
 836                     ; 272 void CLK_ClockSecuritySytemDeglitchCmd(FunctionalState NewState)
 836                     ; 273 {
 837                     	switch	.text
 838  00a6               _CLK_ClockSecuritySytemDeglitchCmd:
 842                     ; 275   assert_param(IS_FUNCTIONAL_STATE(NewState));
 844                     ; 277   if (NewState != DISABLE)
 846  00a6 4d            	tnz	a
 847  00a7 2706          	jreq	L743
 848                     ; 280     CLK->CSSR |= CLK_CSSR_CSSDGON;
 850  00a9 721850ca      	bset	20682,#4
 852  00ad 2004          	jra	L153
 853  00af               L743:
 854                     ; 285     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDGON);
 856  00af 721950ca      	bres	20682,#4
 857  00b3               L153:
 858                     ; 287 }
 861  00b3 81            	ret
 933                     ; 293 uint32_t CLK_GetClockFreq(void)
 933                     ; 294 {
 934                     	switch	.text
 935  00b4               _CLK_GetClockFreq:
 937  00b4 5209          	subw	sp,#9
 938       00000009      OFST:	set	9
 941                     ; 295   uint32_t clockfrequency = 0;
 943                     ; 296   uint32_t sourcefrequency = 0;
 945  00b6 ae0000        	ldw	x,#0
 946  00b9 1f07          	ldw	(OFST-2,sp),x
 947  00bb ae0000        	ldw	x,#0
 948  00be 1f05          	ldw	(OFST-4,sp),x
 950                     ; 297   CLK_SYSCLKSource_TypeDef clocksource = CLK_SYSCLKSource_HSI;
 952                     ; 298   uint8_t tmp = 0, presc = 0;
 956                     ; 301   clocksource = (CLK_SYSCLKSource_TypeDef)CLK->SCSR;
 958  00c0 c650c7        	ld	a,20679
 959  00c3 6b09          	ld	(OFST+0,sp),a
 961                     ; 303   if ( clocksource == CLK_SYSCLKSource_HSI)
 963  00c5 7b09          	ld	a,(OFST+0,sp)
 964  00c7 a101          	cp	a,#1
 965  00c9 260c          	jrne	L114
 966                     ; 305     sourcefrequency = HSI_VALUE;
 968  00cb ae2400        	ldw	x,#9216
 969  00ce 1f07          	ldw	(OFST-2,sp),x
 970  00d0 ae00f4        	ldw	x,#244
 971  00d3 1f05          	ldw	(OFST-4,sp),x
 974  00d5 2022          	jra	L314
 975  00d7               L114:
 976                     ; 307   else if ( clocksource == CLK_SYSCLKSource_LSI)
 978  00d7 7b09          	ld	a,(OFST+0,sp)
 979  00d9 a102          	cp	a,#2
 980  00db 260c          	jrne	L514
 981                     ; 309     sourcefrequency = LSI_VALUE;
 983  00dd ae9470        	ldw	x,#38000
 984  00e0 1f07          	ldw	(OFST-2,sp),x
 985  00e2 ae0000        	ldw	x,#0
 986  00e5 1f05          	ldw	(OFST-4,sp),x
 989  00e7 2010          	jra	L314
 990  00e9               L514:
 991                     ; 311   else if ( clocksource == CLK_SYSCLKSource_HSE)
 993  00e9 7b09          	ld	a,(OFST+0,sp)
 994  00eb a104          	cp	a,#4
 995  00ed 260a          	jrne	L124
 996                     ; 313     sourcefrequency = HSE_VALUE;
 998  00ef ae2400        	ldw	x,#9216
 999  00f2 1f07          	ldw	(OFST-2,sp),x
1000  00f4 ae00f4        	ldw	x,#244
1001  00f7 1f05          	ldw	(OFST-4,sp),x
1004  00f9               L124:
1005                     ; 317     clockfrequency = LSE_VALUE;
1007  00f9               L314:
1008                     ; 321   tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_CKM);
1010  00f9 c650c0        	ld	a,20672
1011  00fc a407          	and	a,#7
1012  00fe 6b09          	ld	(OFST+0,sp),a
1014                     ; 322   presc = SYSDivFactor[tmp];
1016  0100 7b09          	ld	a,(OFST+0,sp)
1017  0102 5f            	clrw	x
1018  0103 97            	ld	xl,a
1019  0104 d60000        	ld	a,(_SYSDivFactor,x)
1020  0107 6b09          	ld	(OFST+0,sp),a
1022                     ; 325   clockfrequency = sourcefrequency / presc;
1024  0109 7b09          	ld	a,(OFST+0,sp)
1025  010b b703          	ld	c_lreg+3,a
1026  010d 3f02          	clr	c_lreg+2
1027  010f 3f01          	clr	c_lreg+1
1028  0111 3f00          	clr	c_lreg
1029  0113 96            	ldw	x,sp
1030  0114 1c0001        	addw	x,#OFST-8
1031  0117 cd0000        	call	c_rtol
1034  011a 96            	ldw	x,sp
1035  011b 1c0005        	addw	x,#OFST-4
1036  011e cd0000        	call	c_ltor
1038  0121 96            	ldw	x,sp
1039  0122 1c0001        	addw	x,#OFST-8
1040  0125 cd0000        	call	c_ludv
1042  0128 96            	ldw	x,sp
1043  0129 1c0005        	addw	x,#OFST-4
1044  012c cd0000        	call	c_rtol
1047                     ; 327   return((uint32_t)clockfrequency);
1049  012f 96            	ldw	x,sp
1050  0130 1c0005        	addw	x,#OFST-4
1051  0133 cd0000        	call	c_ltor
1055  0136 5b09          	addw	sp,#9
1056  0138 81            	ret
1128                     ; 338 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
1128                     ; 339 {
1129                     	switch	.text
1130  0139               _CLK_ITConfig:
1132  0139 89            	pushw	x
1133       00000000      OFST:	set	0
1136                     ; 342   assert_param(IS_CLK_IT(CLK_IT));
1138                     ; 343   assert_param(IS_FUNCTIONAL_STATE(NewState));
1140                     ; 345   if (NewState != DISABLE)
1142  013a 9f            	ld	a,xl
1143  013b 4d            	tnz	a
1144  013c 271d          	jreq	L164
1145                     ; 347     if (CLK_IT == CLK_IT_SWIF)
1147  013e 9e            	ld	a,xh
1148  013f a11c          	cp	a,#28
1149  0141 2606          	jrne	L364
1150                     ; 350       CLK->SWCR |= CLK_SWCR_SWIEN;
1152  0143 721450c9      	bset	20681,#2
1154  0147 202e          	jra	L374
1155  0149               L364:
1156                     ; 352     else if (CLK_IT == CLK_IT_LSECSSF)
1158  0149 7b01          	ld	a,(OFST+1,sp)
1159  014b a12c          	cp	a,#44
1160  014d 2606          	jrne	L764
1161                     ; 355       CSSLSE->CSR |= CSSLSE_CSR_CSSIE;
1163  014f 72145190      	bset	20880,#2
1165  0153 2022          	jra	L374
1166  0155               L764:
1167                     ; 360       CLK->CSSR |= CLK_CSSR_CSSDIE;
1169  0155 721450ca      	bset	20682,#2
1170  0159 201c          	jra	L374
1171  015b               L164:
1172                     ; 365     if (CLK_IT == CLK_IT_SWIF)
1174  015b 7b01          	ld	a,(OFST+1,sp)
1175  015d a11c          	cp	a,#28
1176  015f 2606          	jrne	L574
1177                     ; 368       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
1179  0161 721550c9      	bres	20681,#2
1181  0165 2010          	jra	L374
1182  0167               L574:
1183                     ; 370     else if (CLK_IT == CLK_IT_LSECSSF)
1185  0167 7b01          	ld	a,(OFST+1,sp)
1186  0169 a12c          	cp	a,#44
1187  016b 2606          	jrne	L105
1188                     ; 373       CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSIE);
1190  016d 72155190      	bres	20880,#2
1192  0171 2004          	jra	L374
1193  0173               L105:
1194                     ; 378       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
1196  0173 721550ca      	bres	20682,#2
1197  0177               L374:
1198                     ; 381 }
1201  0177 85            	popw	x
1202  0178 81            	ret
1343                     ; 391 void CLK_CCOConfig(CLK_CCOSource_TypeDef CLK_CCOSource, CLK_CCODiv_TypeDef CLK_CCODiv)
1343                     ; 392 {
1344                     	switch	.text
1345  0179               _CLK_CCOConfig:
1347  0179 89            	pushw	x
1348       00000000      OFST:	set	0
1351                     ; 394   assert_param(IS_CLK_OUTPUT(CLK_CCOSource));
1353                     ; 395   assert_param(IS_CLK_OUTPUT_DIVIDER(CLK_CCODiv));
1355                     ; 398   CLK->CCOR = (uint8_t)((uint8_t)CLK_CCOSource | (uint8_t)CLK_CCODiv);
1357  017a 9f            	ld	a,xl
1358  017b 1a01          	or	a,(OFST+1,sp)
1359  017d c750c5        	ld	20677,a
1360                     ; 399 }
1363  0180 85            	popw	x
1364  0181 81            	ret
1510                     ; 409 void CLK_RTCClockConfig(CLK_RTCCLKSource_TypeDef CLK_RTCCLKSource, CLK_RTCCLKDiv_TypeDef CLK_RTCCLKDiv)
1510                     ; 410 {
1511                     	switch	.text
1512  0182               _CLK_RTCClockConfig:
1514  0182 89            	pushw	x
1515       00000000      OFST:	set	0
1518                     ; 412   assert_param(IS_CLK_CLOCK_RTC(CLK_RTCCLKSource));
1520                     ; 413   assert_param(IS_CLK_CLOCK_RTC_DIV(CLK_RTCCLKDiv));
1522                     ; 416   CLK->CRTCR = (uint8_t)((uint8_t)CLK_RTCCLKSource | (uint8_t)CLK_RTCCLKDiv);
1524  0183 9f            	ld	a,xl
1525  0184 1a01          	or	a,(OFST+1,sp)
1526  0186 c750c1        	ld	20673,a
1527                     ; 417 }
1530  0189 85            	popw	x
1531  018a 81            	ret
1597                     ; 425 void CLK_BEEPClockConfig(CLK_BEEPCLKSource_TypeDef CLK_BEEPCLKSource)
1597                     ; 426 {
1598                     	switch	.text
1599  018b               _CLK_BEEPClockConfig:
1603                     ; 428   assert_param(IS_CLK_CLOCK_BEEP(CLK_BEEPCLKSource));
1605                     ; 431   CLK->CBEEPR = (uint8_t)(CLK_BEEPCLKSource);
1607  018b c750cb        	ld	20683,a
1608                     ; 433 }
1611  018e 81            	ret
1836                     ; 443 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
1836                     ; 444 {
1837                     	switch	.text
1838  018f               _CLK_PeripheralClockConfig:
1840  018f 89            	pushw	x
1841  0190 88            	push	a
1842       00000001      OFST:	set	1
1845                     ; 445   uint8_t reg = 0;
1847                     ; 448   assert_param(IS_CLK_PERIPHERAL(CLK_Peripheral));
1849                     ; 449   assert_param(IS_FUNCTIONAL_STATE(NewState));
1851                     ; 452   reg = (uint8_t)((uint8_t)CLK_Peripheral & (uint8_t)0xF0);
1853  0191 9e            	ld	a,xh
1854  0192 a4f0          	and	a,#240
1855  0194 6b01          	ld	(OFST+0,sp),a
1857                     ; 454   if ( reg == 0x00)
1859  0196 0d01          	tnz	(OFST+0,sp)
1860  0198 2635          	jrne	L5001
1861                     ; 456     if (NewState != DISABLE)
1863  019a 0d03          	tnz	(OFST+2,sp)
1864  019c 2719          	jreq	L7001
1865                     ; 459       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1867  019e 7b02          	ld	a,(OFST+1,sp)
1868  01a0 a40f          	and	a,#15
1869  01a2 5f            	clrw	x
1870  01a3 97            	ld	xl,a
1871  01a4 a601          	ld	a,#1
1872  01a6 5d            	tnzw	x
1873  01a7 2704          	jreq	L05
1874  01a9               L25:
1875  01a9 48            	sll	a
1876  01aa 5a            	decw	x
1877  01ab 26fc          	jrne	L25
1878  01ad               L05:
1879  01ad ca50c3        	or	a,20675
1880  01b0 c750c3        	ld	20675,a
1882  01b3 ac390239      	jpf	L3101
1883  01b7               L7001:
1884                     ; 464       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1886  01b7 7b02          	ld	a,(OFST+1,sp)
1887  01b9 a40f          	and	a,#15
1888  01bb 5f            	clrw	x
1889  01bc 97            	ld	xl,a
1890  01bd a601          	ld	a,#1
1891  01bf 5d            	tnzw	x
1892  01c0 2704          	jreq	L45
1893  01c2               L65:
1894  01c2 48            	sll	a
1895  01c3 5a            	decw	x
1896  01c4 26fc          	jrne	L65
1897  01c6               L45:
1898  01c6 43            	cpl	a
1899  01c7 c450c3        	and	a,20675
1900  01ca c750c3        	ld	20675,a
1901  01cd 206a          	jra	L3101
1902  01cf               L5001:
1903                     ; 467   else if (reg == 0x10)
1905  01cf 7b01          	ld	a,(OFST+0,sp)
1906  01d1 a110          	cp	a,#16
1907  01d3 2633          	jrne	L5101
1908                     ; 469     if (NewState != DISABLE)
1910  01d5 0d03          	tnz	(OFST+2,sp)
1911  01d7 2717          	jreq	L7101
1912                     ; 472       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1914  01d9 7b02          	ld	a,(OFST+1,sp)
1915  01db a40f          	and	a,#15
1916  01dd 5f            	clrw	x
1917  01de 97            	ld	xl,a
1918  01df a601          	ld	a,#1
1919  01e1 5d            	tnzw	x
1920  01e2 2704          	jreq	L06
1921  01e4               L26:
1922  01e4 48            	sll	a
1923  01e5 5a            	decw	x
1924  01e6 26fc          	jrne	L26
1925  01e8               L06:
1926  01e8 ca50c4        	or	a,20676
1927  01eb c750c4        	ld	20676,a
1929  01ee 2049          	jra	L3101
1930  01f0               L7101:
1931                     ; 477       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1933  01f0 7b02          	ld	a,(OFST+1,sp)
1934  01f2 a40f          	and	a,#15
1935  01f4 5f            	clrw	x
1936  01f5 97            	ld	xl,a
1937  01f6 a601          	ld	a,#1
1938  01f8 5d            	tnzw	x
1939  01f9 2704          	jreq	L46
1940  01fb               L66:
1941  01fb 48            	sll	a
1942  01fc 5a            	decw	x
1943  01fd 26fc          	jrne	L66
1944  01ff               L46:
1945  01ff 43            	cpl	a
1946  0200 c450c4        	and	a,20676
1947  0203 c750c4        	ld	20676,a
1948  0206 2031          	jra	L3101
1949  0208               L5101:
1950                     ; 482     if (NewState != DISABLE)
1952  0208 0d03          	tnz	(OFST+2,sp)
1953  020a 2717          	jreq	L5201
1954                     ; 485       CLK->PCKENR3 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1956  020c 7b02          	ld	a,(OFST+1,sp)
1957  020e a40f          	and	a,#15
1958  0210 5f            	clrw	x
1959  0211 97            	ld	xl,a
1960  0212 a601          	ld	a,#1
1961  0214 5d            	tnzw	x
1962  0215 2704          	jreq	L07
1963  0217               L27:
1964  0217 48            	sll	a
1965  0218 5a            	decw	x
1966  0219 26fc          	jrne	L27
1967  021b               L07:
1968  021b ca50d0        	or	a,20688
1969  021e c750d0        	ld	20688,a
1971  0221 2016          	jra	L3101
1972  0223               L5201:
1973                     ; 490       CLK->PCKENR3 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1975  0223 7b02          	ld	a,(OFST+1,sp)
1976  0225 a40f          	and	a,#15
1977  0227 5f            	clrw	x
1978  0228 97            	ld	xl,a
1979  0229 a601          	ld	a,#1
1980  022b 5d            	tnzw	x
1981  022c 2704          	jreq	L47
1982  022e               L67:
1983  022e 48            	sll	a
1984  022f 5a            	decw	x
1985  0230 26fc          	jrne	L67
1986  0232               L47:
1987  0232 43            	cpl	a
1988  0233 c450d0        	and	a,20688
1989  0236 c750d0        	ld	20688,a
1990  0239               L3101:
1991                     ; 493 }
1994  0239 5b03          	addw	sp,#3
1995  023b 81            	ret
2070                     ; 503 void CLK_HaltConfig(CLK_Halt_TypeDef CLK_Halt, FunctionalState NewState)
2070                     ; 504 {
2071                     	switch	.text
2072  023c               _CLK_HaltConfig:
2074  023c 89            	pushw	x
2075       00000000      OFST:	set	0
2078                     ; 506   assert_param(IS_CLK_HALT(CLK_Halt));
2080                     ; 507   assert_param(IS_FUNCTIONAL_STATE(NewState));
2082                     ; 509   if (NewState != DISABLE)
2084  023d 9f            	ld	a,xl
2085  023e 4d            	tnz	a
2086  023f 2709          	jreq	L5601
2087                     ; 511     CLK->ICKCR |= (uint8_t)(CLK_Halt);
2089  0241 9e            	ld	a,xh
2090  0242 ca50c2        	or	a,20674
2091  0245 c750c2        	ld	20674,a
2093  0248 2009          	jra	L7601
2094  024a               L5601:
2095                     ; 515     CLK->ICKCR &= (uint8_t)(~CLK_Halt);
2097  024a 7b01          	ld	a,(OFST+1,sp)
2098  024c 43            	cpl	a
2099  024d c450c2        	and	a,20674
2100  0250 c750c2        	ld	20674,a
2101  0253               L7601:
2102                     ; 517 }
2105  0253 85            	popw	x
2106  0254 81            	ret
2142                     ; 527 void CLK_MainRegulatorCmd(FunctionalState NewState)
2142                     ; 528 {
2143                     	switch	.text
2144  0255               _CLK_MainRegulatorCmd:
2148                     ; 530   assert_param(IS_FUNCTIONAL_STATE(NewState));
2150                     ; 532   if (NewState != DISABLE)
2152  0255 4d            	tnz	a
2153  0256 2706          	jreq	L7011
2154                     ; 535     CLK->REGCSR &= (uint8_t)(~CLK_REGCSR_REGOFF);
2156  0258 721350cf      	bres	20687,#1
2158  025c 2004          	jra	L1111
2159  025e               L7011:
2160                     ; 540     CLK->REGCSR |= CLK_REGCSR_REGOFF;
2162  025e 721250cf      	bset	20687,#1
2163  0262               L1111:
2164                     ; 542 }
2167  0262 81            	ret
2390                     ; 549 FlagStatus CLK_GetFlagStatus(CLK_FLAG_TypeDef CLK_FLAG)
2390                     ; 550 {
2391                     	switch	.text
2392  0263               _CLK_GetFlagStatus:
2394  0263 88            	push	a
2395  0264 89            	pushw	x
2396       00000002      OFST:	set	2
2399                     ; 551   uint8_t reg = 0;
2401                     ; 552   uint8_t pos = 0;
2403                     ; 553   FlagStatus bitstatus = RESET;
2405                     ; 556   assert_param(IS_CLK_FLAGS(CLK_FLAG));
2407                     ; 559   reg = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0xF0);
2409  0265 a4f0          	and	a,#240
2410  0267 6b02          	ld	(OFST+0,sp),a
2412                     ; 562   pos = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0x0F);
2414  0269 7b03          	ld	a,(OFST+1,sp)
2415  026b a40f          	and	a,#15
2416  026d 6b01          	ld	(OFST-1,sp),a
2418                     ; 564   if (reg == 0x00) /* The flag to check is in CRTC Rregister */
2420  026f 0d02          	tnz	(OFST+0,sp)
2421  0271 2607          	jrne	L7221
2422                     ; 566     reg = CLK->CRTCR;
2424  0273 c650c1        	ld	a,20673
2425  0276 6b02          	ld	(OFST+0,sp),a
2428  0278 2060          	jra	L1321
2429  027a               L7221:
2430                     ; 568   else if (reg == 0x10) /* The flag to check is in ICKCR register */
2432  027a 7b02          	ld	a,(OFST+0,sp)
2433  027c a110          	cp	a,#16
2434  027e 2607          	jrne	L3321
2435                     ; 570     reg = CLK->ICKCR;
2437  0280 c650c2        	ld	a,20674
2438  0283 6b02          	ld	(OFST+0,sp),a
2441  0285 2053          	jra	L1321
2442  0287               L3321:
2443                     ; 572   else if (reg == 0x20) /* The flag to check is in CCOR register */
2445  0287 7b02          	ld	a,(OFST+0,sp)
2446  0289 a120          	cp	a,#32
2447  028b 2607          	jrne	L7321
2448                     ; 574     reg = CLK->CCOR;
2450  028d c650c5        	ld	a,20677
2451  0290 6b02          	ld	(OFST+0,sp),a
2454  0292 2046          	jra	L1321
2455  0294               L7321:
2456                     ; 576   else if (reg == 0x30) /* The flag to check is in ECKCR register */
2458  0294 7b02          	ld	a,(OFST+0,sp)
2459  0296 a130          	cp	a,#48
2460  0298 2607          	jrne	L3421
2461                     ; 578     reg = CLK->ECKCR;
2463  029a c650c6        	ld	a,20678
2464  029d 6b02          	ld	(OFST+0,sp),a
2467  029f 2039          	jra	L1321
2468  02a1               L3421:
2469                     ; 580   else if (reg == 0x40) /* The flag to check is in SWCR register */
2471  02a1 7b02          	ld	a,(OFST+0,sp)
2472  02a3 a140          	cp	a,#64
2473  02a5 2607          	jrne	L7421
2474                     ; 582     reg = CLK->SWCR;
2476  02a7 c650c9        	ld	a,20681
2477  02aa 6b02          	ld	(OFST+0,sp),a
2480  02ac 202c          	jra	L1321
2481  02ae               L7421:
2482                     ; 584   else if (reg == 0x50) /* The flag to check is in CSSR register */
2484  02ae 7b02          	ld	a,(OFST+0,sp)
2485  02b0 a150          	cp	a,#80
2486  02b2 2607          	jrne	L3521
2487                     ; 586     reg = CLK->CSSR;
2489  02b4 c650ca        	ld	a,20682
2490  02b7 6b02          	ld	(OFST+0,sp),a
2493  02b9 201f          	jra	L1321
2494  02bb               L3521:
2495                     ; 588   else if (reg == 0x70) /* The flag to check is in REGCSR register */
2497  02bb 7b02          	ld	a,(OFST+0,sp)
2498  02bd a170          	cp	a,#112
2499  02bf 2607          	jrne	L7521
2500                     ; 590     reg = CLK->REGCSR;
2502  02c1 c650cf        	ld	a,20687
2503  02c4 6b02          	ld	(OFST+0,sp),a
2506  02c6 2012          	jra	L1321
2507  02c8               L7521:
2508                     ; 592   else if (reg == 0x80) /* The flag to check is in CSSLSE_CSRregister */
2510  02c8 7b02          	ld	a,(OFST+0,sp)
2511  02ca a180          	cp	a,#128
2512  02cc 2607          	jrne	L3621
2513                     ; 594     reg = CSSLSE->CSR;
2515  02ce c65190        	ld	a,20880
2516  02d1 6b02          	ld	(OFST+0,sp),a
2519  02d3 2005          	jra	L1321
2520  02d5               L3621:
2521                     ; 598     reg = CLK->CBEEPR;
2523  02d5 c650cb        	ld	a,20683
2524  02d8 6b02          	ld	(OFST+0,sp),a
2526  02da               L1321:
2527                     ; 602   if ((reg & (uint8_t)((uint8_t)1 << (uint8_t)pos)) != (uint8_t)RESET)
2529  02da 7b01          	ld	a,(OFST-1,sp)
2530  02dc 5f            	clrw	x
2531  02dd 97            	ld	xl,a
2532  02de a601          	ld	a,#1
2533  02e0 5d            	tnzw	x
2534  02e1 2704          	jreq	L601
2535  02e3               L011:
2536  02e3 48            	sll	a
2537  02e4 5a            	decw	x
2538  02e5 26fc          	jrne	L011
2539  02e7               L601:
2540  02e7 1402          	and	a,(OFST+0,sp)
2541  02e9 2706          	jreq	L7621
2542                     ; 604     bitstatus = SET;
2544  02eb a601          	ld	a,#1
2545  02ed 6b02          	ld	(OFST+0,sp),a
2548  02ef 2002          	jra	L1721
2549  02f1               L7621:
2550                     ; 608     bitstatus = RESET;
2552  02f1 0f02          	clr	(OFST+0,sp)
2554  02f3               L1721:
2555                     ; 612   return((FlagStatus)bitstatus);
2557  02f3 7b02          	ld	a,(OFST+0,sp)
2560  02f5 5b03          	addw	sp,#3
2561  02f7 81            	ret
2584                     ; 620 void CLK_ClearFlag(void)
2584                     ; 621 {
2585                     	switch	.text
2586  02f8               _CLK_ClearFlag:
2590                     ; 624   CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
2592  02f8 72175190      	bres	20880,#3
2593                     ; 625 }
2596  02fc 81            	ret
2642                     ; 633 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2642                     ; 634 {
2643                     	switch	.text
2644  02fd               _CLK_GetITStatus:
2646  02fd 88            	push	a
2647  02fe 88            	push	a
2648       00000001      OFST:	set	1
2651                     ; 636   ITStatus bitstatus = RESET;
2653                     ; 639   assert_param(IS_CLK_IT(CLK_IT));
2655                     ; 641   if (CLK_IT == CLK_IT_SWIF)
2657  02ff a11c          	cp	a,#28
2658  0301 2611          	jrne	L5231
2659                     ; 644     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2661  0303 c450c9        	and	a,20681
2662  0306 a10c          	cp	a,#12
2663  0308 2606          	jrne	L7231
2664                     ; 646       bitstatus = SET;
2666  030a a601          	ld	a,#1
2667  030c 6b01          	ld	(OFST+0,sp),a
2670  030e 202e          	jra	L3331
2671  0310               L7231:
2672                     ; 650       bitstatus = RESET;
2674  0310 0f01          	clr	(OFST+0,sp)
2676  0312 202a          	jra	L3331
2677  0314               L5231:
2678                     ; 653   else if (CLK_IT == CLK_IT_LSECSSF)
2680  0314 7b02          	ld	a,(OFST+1,sp)
2681  0316 a12c          	cp	a,#44
2682  0318 2613          	jrne	L5331
2683                     ; 656     if ((CSSLSE->CSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2685  031a c65190        	ld	a,20880
2686  031d 1402          	and	a,(OFST+1,sp)
2687  031f a10c          	cp	a,#12
2688  0321 2606          	jrne	L7331
2689                     ; 658       bitstatus = SET;
2691  0323 a601          	ld	a,#1
2692  0325 6b01          	ld	(OFST+0,sp),a
2695  0327 2015          	jra	L3331
2696  0329               L7331:
2697                     ; 662       bitstatus = RESET;
2699  0329 0f01          	clr	(OFST+0,sp)
2701  032b 2011          	jra	L3331
2702  032d               L5331:
2703                     ; 668     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2705  032d c650ca        	ld	a,20682
2706  0330 1402          	and	a,(OFST+1,sp)
2707  0332 a10c          	cp	a,#12
2708  0334 2606          	jrne	L5431
2709                     ; 670       bitstatus = SET;
2711  0336 a601          	ld	a,#1
2712  0338 6b01          	ld	(OFST+0,sp),a
2715  033a 2002          	jra	L3331
2716  033c               L5431:
2717                     ; 674       bitstatus = RESET;
2719  033c 0f01          	clr	(OFST+0,sp)
2721  033e               L3331:
2722                     ; 679   return bitstatus;
2724  033e 7b01          	ld	a,(OFST+0,sp)
2727  0340 85            	popw	x
2728  0341 81            	ret
2764                     ; 689 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2764                     ; 690 {
2765                     	switch	.text
2766  0342               _CLK_ClearITPendingBit:
2770                     ; 693   assert_param(IS_CLK_CLEAR_IT(CLK_IT));
2772                     ; 695   if ((uint8_t)((uint8_t)CLK_IT & (uint8_t)0xF0) == (uint8_t)0x20)
2774  0342 a4f0          	and	a,#240
2775  0344 a120          	cp	a,#32
2776  0346 2606          	jrne	L7631
2777                     ; 698     CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
2779  0348 72175190      	bres	20880,#3
2781  034c 2004          	jra	L1731
2782  034e               L7631:
2783                     ; 703     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2785  034e 721750c9      	bres	20681,#3
2786  0352               L1731:
2787                     ; 705 }
2790  0352 81            	ret
2814                     ; 713 void CLK_LSEClockSecuritySystemEnable(void)
2814                     ; 714 {
2815                     	switch	.text
2816  0353               _CLK_LSEClockSecuritySystemEnable:
2820                     ; 716   CSSLSE->CSR |= CSSLSE_CSR_CSSEN;
2822  0353 72105190      	bset	20880,#0
2823                     ; 717 }
2826  0357 81            	ret
2850                     ; 725 void CLK_RTCCLKSwitchOnLSEFailureEnable(void)
2850                     ; 726 {
2851                     	switch	.text
2852  0358               _CLK_RTCCLKSwitchOnLSEFailureEnable:
2856                     ; 728   CSSLSE->CSR |= CSSLSE_CSR_SWITCHEN;
2858  0358 72125190      	bset	20880,#1
2859                     ; 729 }
2862  035c 81            	ret
2887                     	xdef	_SYSDivFactor
2888                     	xdef	_CLK_RTCCLKSwitchOnLSEFailureEnable
2889                     	xdef	_CLK_LSEClockSecuritySystemEnable
2890                     	xdef	_CLK_ClearITPendingBit
2891                     	xdef	_CLK_GetITStatus
2892                     	xdef	_CLK_ClearFlag
2893                     	xdef	_CLK_GetFlagStatus
2894                     	xdef	_CLK_MainRegulatorCmd
2895                     	xdef	_CLK_HaltConfig
2896                     	xdef	_CLK_PeripheralClockConfig
2897                     	xdef	_CLK_BEEPClockConfig
2898                     	xdef	_CLK_RTCClockConfig
2899                     	xdef	_CLK_CCOConfig
2900                     	xdef	_CLK_ITConfig
2901                     	xdef	_CLK_GetClockFreq
2902                     	xdef	_CLK_ClockSecuritySytemDeglitchCmd
2903                     	xdef	_CLK_ClockSecuritySystemEnable
2904                     	xdef	_CLK_GetSYSCLKSource
2905                     	xdef	_CLK_SYSCLKSourceSwitchCmd
2906                     	xdef	_CLK_SYSCLKDivConfig
2907                     	xdef	_CLK_SYSCLKSourceConfig
2908                     	xdef	_CLK_LSEConfig
2909                     	xdef	_CLK_HSEConfig
2910                     	xdef	_CLK_LSICmd
2911                     	xdef	_CLK_AdjustHSICalibrationValue
2912                     	xdef	_CLK_HSICmd
2913                     	xdef	_CLK_DeInit
2914                     	xref.b	c_lreg
2915                     	xref.b	c_x
2934                     	xref	c_ludv
2935                     	xref	c_rtol
2936                     	xref	c_ltor
2937                     	end
