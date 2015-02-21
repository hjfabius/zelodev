   1                     ; C Compiler for ST7 (COSMIC Software)
   2                     ; Generator V4.4f - 27 May 2003
 419                     ; 55 void AT_Overflow_Irq(void)
 419                     ; 56 {
 420                     	switch	.text
 421  0000               _AT_Overflow_Irq:
 423       00000101      OFST:	set	257
 424  0000 88            	push	a
 427                     ; 58 	DisableInterrupts();
 430  0001 9b            sim
 432                     ; 59 	if (m_woValue == 0x00)
 434  0002 b60d          	ld	a,L312_m_woValue+1
 435  0004 ba0c          	or	a,L312_m_woValue
 436  0006 2614          	jrne	L552
 437                     ; 61 		_switch(Pa_SNI_CLK, Pin_SNI_CLK);
 439  0008 b600          	ld	a,_PADR
 440  000a a502          	bcp	a,#2
 441  000c 2704          	jreq	L752
 444  000e 1300          	bres	_PADR,#1
 446  0010 2002          	jra	L162
 447  0012               L752:
 450  0012 1200          	bset	_PADR,#1
 451  0014               L162:
 452                     ; 62 		m_woValue = 10;
 455  0014 a60a          	ld	a,#10
 456  0016 b70d          	ld	L312_m_woValue+1,a
 457  0018 3f0c          	clr	L312_m_woValue
 459  001a 2008          	jra	L362
 460  001c               L552:
 461                     ; 66 		m_woValue--;
 463  001c 3d0d          	tnz	L312_m_woValue+1
 464  001e 2602          	jrne	L6
 465  0020 3a0c          	dec	L312_m_woValue
 466  0022               L6:
 467  0022 3a0d          	dec	L312_m_woValue+1
 468  0024               L362:
 469                     ; 69 	byTemp = ATCSR;
 471  0024 96            	ld	x,s
 472  0025 b60d          	ld	a,_ATCSR
 473  0027 d70101        	ld	(OFST+0,x),a
 474                     ; 70 	EnableInterrupts();
 477  002a 9a            rim
 479                     ; 71 }
 482  002b 84            	pop	a
 483  002c 80            	iret
 514                     ; 74 void init(void)
 514                     ; 75 {
 515                     	switch	.text
 516  002d               _init:
 519                     ; 85 	PADR 	= 0x00;       
 521  002d 3f00          	clr	_PADR
 522                     ; 86 	PADDR 	= 0b00000011; // 1=output
 524  002f a603          	ld	a,#3
 525  0031 b701          	ld	_PADDR,a
 526                     ; 87 	PAOR 	= 0b00000011; // pull-up and push-pull
 528  0033 a603          	ld	a,#3
 529  0035 b702          	ld	_PAOR,a
 530                     ; 88 	PADR 	= 0x00;       
 532  0037 3f00          	clr	_PADR
 533                     ; 95 	PBDR 	= 0x00;
 535  0039 3f03          	clr	_PBDR
 536                     ; 96 	PBDDR 	= 0b00011111;  	// 1=output
 538  003b a61f          	ld	a,#31
 539  003d b704          	ld	_PBDDR,a
 540                     ; 97 	PBOR 	= 0b00011111; 	// push-pull
 542  003f a61f          	ld	a,#31
 543  0041 b705          	ld	_PBOR,a
 544                     ; 98 	PBDR 	= 0x00;  	
 546  0043 3f03          	clr	_PBDR
 547                     ; 100 	ATRH	= 0x04;	
 549  0045 a604          	ld	a,#4
 550  0047 b710          	ld	_ATRH,a
 551                     ; 101 	ATRL	= 0xC8;
 553  0049 a6c8          	ld	a,#200
 554  004b b711          	ld	_ATRL,a
 555                     ; 102 	ATCSR	= 0b00010010;	
 557  004d a612          	ld	a,#18
 558  004f b70d          	ld	_ATCSR,a
 559                     ; 103 }	
 562  0051 81            	ret
 596                     ; 106 void sleep(WORD a_woValue)
 596                     ; 107 {
 597                     	switch	.text
 599                     	xref.b	_sleep$L
 600  0052               _sleep:
 602  0052 b701          	ld	_sleep$L+1,a
 603  0054 bf00          	ld	_sleep$L,x
 605  0056 2001          	jra	L513
 606  0058               L313:
 607                     ; 110 		Nop();
 610  0058 9d            nop
 612  0059               L513:
 613                     ; 108 	while(a_woValue--> 0)
 615  0059 b601          	ld	a,_sleep$L+1
 616  005b 97            	ld	x,a
 617  005c a001          	sub	a,#1
 618  005e b701          	ld	_sleep$L+1,a
 619  0060 b600          	ld	a,_sleep$L
 620  0062 b700          	ld	c_x,a
 621  0064 a200          	sbc	a,#0
 622  0066 b700          	ld	_sleep$L,a
 623  0068 a300          	cp	x,#0
 624  006a 2604          	jrne	L41
 625  006c b600          	ld	a,c_x
 626  006e a100          	cp	a,#0
 627  0070               L41:
 628  0070 26e6          	jrne	L313
 629                     ; 112 }
 632  0072 81            	ret
 675                     ; 115 BYTE chkKeyboard(void)
 675                     ; 116 {
 676                     	switch	.text
 678                     	xref.b	_chkKeyboard$L
 679  0073               _chkKeyboard:
 682                     ; 119 	byTemp = PADR & 0b11100000;
 684  0073 b600          	ld	a,_PADR
 685  0075 a4e0          	and	a,#224
 686  0077 b7fe          	ld	_chkKeyboard$L-2,a
 687                     ; 120 	switch(byTemp)
 689  0079 b6fe          	ld	a,_chkKeyboard$L-2
 691  007b a020          	sub	a,#32
 692  007d 2720          	jreq	L523
 693  007f a020          	sub	a,#32
 694  0081 2710          	jreq	L123
 695  0083 a020          	sub	a,#32
 696  0085 2724          	jreq	L133
 697  0087 a040          	sub	a,#64
 698  0089 271a          	jreq	L723
 699  008b a020          	sub	a,#32
 700  008d 270a          	jreq	L323
 701  008f               L333:
 702                     ; 137 		default:
 702                     ; 138 			byKey = 0; 
 704  008f 3fff          	clr	_chkKeyboard$L-1
 705                     ; 139 			break;
 707  0091 201c          	jra	L163
 708  0093               L123:
 709                     ; 122 		case 0b01000000:
 709                     ; 123 			byKey = 5;
 711  0093 a605          	ld	a,#5
 712  0095 b7ff          	ld	_chkKeyboard$L-1,a
 713                     ; 124 			break;
 715  0097 2016          	jra	L163
 716  0099               L323:
 717                     ; 125 		case 0b11000000:
 717                     ; 126 			byKey = 4;
 719  0099 a604          	ld	a,#4
 720  009b b7ff          	ld	_chkKeyboard$L-1,a
 721                     ; 127 			break;
 723  009d 2010          	jra	L163
 724  009f               L523:
 725                     ; 128 		case 0b00100000:
 725                     ; 129 			byKey = 3;
 727  009f a603          	ld	a,#3
 728  00a1 b7ff          	ld	_chkKeyboard$L-1,a
 729                     ; 130 			break;
 731  00a3 200a          	jra	L163
 732  00a5               L723:
 733                     ; 131 		case 0b10100000:
 733                     ; 132 			byKey = 2;
 735  00a5 a602          	ld	a,#2
 736  00a7 b7ff          	ld	_chkKeyboard$L-1,a
 737                     ; 133 			break;
 739  00a9 2004          	jra	L163
 740  00ab               L133:
 741                     ; 134 		case 0b01100000:
 741                     ; 135 			byKey = 1;
 743  00ab a601          	ld	a,#1
 744  00ad b7ff          	ld	_chkKeyboard$L-1,a
 745                     ; 136 			break;
 747  00af               L163:
 748                     ; 141 	return byKey;
 750  00af b6ff          	ld	a,_chkKeyboard$L-1
 753  00b1 81            	ret
 796                     ; 145 BYTE chkCmdOutput(void)
 796                     ; 146 {
 797                     	switch	.text
 799                     	xref.b	_chkCmdOutput$L
 800  00b2               _chkCmdOutput:
 803                     ; 149 	byTemp = PADR & 0b00011100;
 805  00b2 b600          	ld	a,_PADR
 806  00b4 a41c          	and	a,#28
 807  00b6 b7fe          	ld	_chkCmdOutput$L-2,a
 808                     ; 150 	switch(byTemp)
 810  00b8 b6fe          	ld	a,_chkCmdOutput$L-2
 812  00ba a004          	sub	a,#4
 813  00bc 2720          	jreq	L763
 814  00be a004          	sub	a,#4
 815  00c0 2710          	jreq	L363
 816  00c2 a004          	sub	a,#4
 817  00c4 2724          	jreq	L373
 818  00c6 a008          	sub	a,#8
 819  00c8 271a          	jreq	L173
 820  00ca a004          	sub	a,#4
 821  00cc 270a          	jreq	L563
 822  00ce               L573:
 823                     ; 167 		default:
 823                     ; 168 			byCmd = 0; 
 825  00ce 3fff          	clr	_chkCmdOutput$L-1
 826                     ; 169 			break;
 828  00d0 201c          	jra	L324
 829  00d2               L363:
 830                     ; 152 		case 0b00001000:
 830                     ; 153 			byCmd = 6;
 832  00d2 a606          	ld	a,#6
 833  00d4 b7ff          	ld	_chkCmdOutput$L-1,a
 834                     ; 154 			break;
 836  00d6 2016          	jra	L324
 837  00d8               L563:
 838                     ; 155 		case 0b00011000:
 838                     ; 156 			byCmd = 5;
 840  00d8 a605          	ld	a,#5
 841  00da b7ff          	ld	_chkCmdOutput$L-1,a
 842                     ; 157 			break;
 844  00dc 2010          	jra	L324
 845  00de               L763:
 846                     ; 158 		case 0b00000100:
 846                     ; 159 			byCmd = 4;
 848  00de a604          	ld	a,#4
 849  00e0 b7ff          	ld	_chkCmdOutput$L-1,a
 850                     ; 160 			break;
 852  00e2 200a          	jra	L324
 853  00e4               L173:
 854                     ; 161 		case 0b00010100:
 854                     ; 162 			byCmd = 3;
 856  00e4 a603          	ld	a,#3
 857  00e6 b7ff          	ld	_chkCmdOutput$L-1,a
 858                     ; 163 			break;
 860  00e8 2004          	jra	L324
 861  00ea               L373:
 862                     ; 164 		case 0b00001100:
 862                     ; 165 			byCmd = 2;
 864  00ea a602          	ld	a,#2
 865  00ec b7ff          	ld	_chkCmdOutput$L-1,a
 866                     ; 166 			break;
 868  00ee               L324:
 869                     ; 171 	return byCmd;
 871  00ee b6ff          	ld	a,_chkCmdOutput$L-1
 874  00f0 81            	ret
 898                     ; 175 void ledBlink(void)
 898                     ; 176 {
 899                     	switch	.text
 900  00f1               _ledBlink:
 903                     ; 177 	_bset(Pa_LED, Pin_LED);
 905  00f1 1003          	bset	_PBDR,#0
 906                     ; 178 	sleep(10000);
 908  00f3 a610          	ld	a,#16
 909  00f5 ae27          	ld	x,#39
 910  00f7 cd0052        	call	_sleep
 912                     ; 179 	_bres(Pa_LED, Pin_LED);
 914  00fa 1103          	bres	_PBDR,#0
 915                     ; 180 	sleep(10000);
 917  00fc a610          	ld	a,#16
 918  00fe ae27          	ld	x,#39
 919  0100 cd0052        	call	_sleep
 921                     ; 181 }
 924  0103 81            	ret
 948                     ; 185 void ledDoubleBlink(void)
 948                     ; 186 {
 949                     	switch	.text
 950  0104               _ledDoubleBlink:
 953                     ; 187 	_bset(Pa_LED, Pin_LED);
 955  0104 1003          	bset	_PBDR,#0
 956                     ; 188 	sleep(6000);
 958  0106 a670          	ld	a,#112
 959  0108 ae17          	ld	x,#23
 960  010a cd0052        	call	_sleep
 962                     ; 189 	_bres(Pa_LED, Pin_LED);
 964  010d 1103          	bres	_PBDR,#0
 965                     ; 190 	sleep(12000);
 967  010f a6e0          	ld	a,#224
 968  0111 ae2e          	ld	x,#46
 969  0113 cd0052        	call	_sleep
 971                     ; 191 	_bset(Pa_LED, Pin_LED);
 973  0116 1003          	bset	_PBDR,#0
 974                     ; 192 	sleep(6000);
 976  0118 a670          	ld	a,#112
 977  011a ae17          	ld	x,#23
 978  011c cd0052        	call	_sleep
 980                     ; 193 	_bres(Pa_LED, Pin_LED);
 982  011f 1103          	bres	_PBDR,#0
 983                     ; 194 }
 986  0121 81            	ret
1015                     ; 197 void simulateSignals(void)
1015                     ; 198 {
1016                     	switch	.text
1017  0122               _simulateSignals:
1020                     ; 199 	if(m_woEncoder--==0)
1022  0122 b60b          	ld	a,L512_m_woEncoder+1
1023  0124 97            	ld	x,a
1024  0125 a001          	sub	a,#1
1025  0127 b70b          	ld	L512_m_woEncoder+1,a
1026  0129 b60a          	ld	a,L512_m_woEncoder
1027  012b b700          	ld	c_x,a
1028  012d a200          	sbc	a,#0
1029  012f b70a          	ld	L512_m_woEncoder,a
1030  0131 a300          	cp	x,#0
1031  0133 2604          	jrne	L03
1032  0135 b600          	ld	a,c_x
1033  0137 a100          	cp	a,#0
1034  0139               L03:
1035  0139 2608          	jrne	L554
1036                     ; 201 		m_woEncoder = 1024;
1038  013b a604          	ld	a,#4
1039  013d b70a          	ld	L512_m_woEncoder,a
1040  013f 3f0b          	clr	L512_m_woEncoder+1
1041                     ; 202 		_bset(Pa_ENC_Z, Pin_ENC_Z);
1043  0141 1403          	bset	_PBDR,#2
1044  0143               L554:
1045                     ; 205 	_bset(Pa_ENC_A, Pin_ENC_A);
1047  0143 1603          	bset	_PBDR,#3
1048                     ; 206 	sleep(100);
1050  0145 5f            	clr	x
1051  0146 a664          	ld	a,#100
1052  0148 cd0052        	call	_sleep
1054                     ; 207 	_bset(Pa_ENC_B, Pin_ENC_B);
1056  014b 1803          	bset	_PBDR,#4
1057                     ; 209 	if (
1057                     ; 210 	    ((m_woEncoder>m_woMarkStart1) && (m_woEncoder<m_woMarkEnd1)) ||
1057                     ; 211 		((m_woEncoder>m_woMarkStart2) && (m_woEncoder<m_woMarkEnd2))
1057                     ; 212 	   )
1059  014d b609          	ld	a,L712_m_woMarkStart1+1
1060  014f b00b          	sub	a,L512_m_woEncoder+1
1061  0151 b608          	ld	a,L712_m_woMarkStart1
1062  0153 b20a          	sbc	a,L512_m_woEncoder
1063  0155 240a          	jruge	L364
1065  0157 b60b          	ld	a,L512_m_woEncoder+1
1066  0159 b007          	sub	a,L122_m_woMarkEnd1+1
1067  015b b60a          	ld	a,L512_m_woEncoder
1068  015d b206          	sbc	a,L122_m_woMarkEnd1
1069  015f 2514          	jrult	L164
1070  0161               L364:
1072  0161 b605          	ld	a,L322_m_woMarkStart2+1
1073  0163 b00b          	sub	a,L512_m_woEncoder+1
1074  0165 b604          	ld	a,L322_m_woMarkStart2
1075  0167 b20a          	sbc	a,L512_m_woEncoder
1076  0169 241b          	jruge	L754
1078  016b b60b          	ld	a,L512_m_woEncoder+1
1079  016d b003          	sub	a,L522_m_woMarkEnd2+1
1080  016f b60a          	ld	a,L512_m_woEncoder
1081  0171 b202          	sbc	a,L522_m_woMarkEnd2
1082  0173 2411          	jruge	L754
1083  0175               L164:
1084                     ; 214 		_bset(Pa_S1, Pa_S1);
1086  0175 a601          	ld	a,#1
1087  0177 be03          	ld	x,_PBDR
1088  0179 5d            	tnz	x
1089  017a 2704          	jreq	L23
1090  017c               L43:
1091  017c 48            	sll	a
1092  017d 5a            	dec	x
1093  017e 26fc          	jrne	L43
1094  0180               L23:
1095  0180 ba03          	or	a,_PBDR
1096  0182 b703          	ld	_PBDR,a
1098  0184 2010          	jra	L564
1099  0186               L754:
1100                     ; 218 		_bres(Pa_S1, Pa_S1);
1102  0186 a601          	ld	a,#1
1103  0188 be03          	ld	x,_PBDR
1104  018a 5d            	tnz	x
1105  018b 2704          	jreq	L63
1106  018d               L04:
1107  018d 48            	sll	a
1108  018e 5a            	dec	x
1109  018f 26fc          	jrne	L04
1110  0191               L63:
1111  0191 43            	cpl	a
1112  0192 b403          	and	a,_PBDR
1113  0194 b703          	ld	_PBDR,a
1114  0196               L564:
1115                     ; 221 	if(m_woEncoder==1024)
1117  0196 b60b          	ld	a,L512_m_woEncoder+1
1118  0198 a100          	cp	a,#0
1119  019a 2604          	jrne	L24
1120  019c be0a          	ld	x,L512_m_woEncoder
1121  019e a304          	cp	x,#4
1122  01a0               L24:
1123  01a0 2602          	jrne	L764
1124                     ; 223 		_bres(Pa_ENC_Z, Pin_ENC_Z);
1126  01a2 1503          	bres	_PBDR,#2
1127  01a4               L764:
1128                     ; 226 	_bres(Pa_ENC_A, Pin_ENC_A);
1130  01a4 1703          	bres	_PBDR,#3
1131                     ; 227 	sleep(100);
1133  01a6 5f            	clr	x
1134  01a7 a664          	ld	a,#100
1135  01a9 cd0052        	call	_sleep
1137                     ; 228 	_bres(Pa_ENC_B, Pin_ENC_B);
1139  01ac 1903          	bres	_PBDR,#4
1140                     ; 232 }
1143  01ae 81            	ret
1189                     ; 235 void main(void)
1189                     ; 236 {
1190                     	switch	.text
1192                     	xref.b	_main$L
1193  01af               _main:
1196                     ; 237 	WORD woIndex = 0;
1198  01af 3ffe          	clr	_main$L-2
1199  01b1 3fff          	clr	_main$L-1
1200                     ; 238 	init();
1202  01b3 cd002d        	call	_init
1204                     ; 240 	m_woEncoder 	= 1024;
1206  01b6 a604          	ld	a,#4
1207  01b8 b70a          	ld	L512_m_woEncoder,a
1208  01ba 3f0b          	clr	L512_m_woEncoder+1
1209                     ; 241 	m_woMarkStart1	= 500;
1211  01bc ae01          	ld	x,#1
1212  01be bf08          	ld	L712_m_woMarkStart1,x
1213  01c0 a6f4          	ld	a,#244
1214  01c2 b709          	ld	L712_m_woMarkStart1+1,a
1215                     ; 242 	m_woMarkEnd1	= 505;
1217  01c4 ae01          	ld	x,#1
1218  01c6 bf06          	ld	L122_m_woMarkEnd1,x
1219  01c8 a6f9          	ld	a,#249
1220  01ca b707          	ld	L122_m_woMarkEnd1+1,a
1221                     ; 243 	m_woMarkStart2	= 800;
1223  01cc ae03          	ld	x,#3
1224  01ce bf04          	ld	L322_m_woMarkStart2,x
1225  01d0 a620          	ld	a,#32
1226  01d2 b705          	ld	L322_m_woMarkStart2+1,a
1227                     ; 244 	m_woMarkEnd2	= 808;
1229  01d4 ae03          	ld	x,#3
1230  01d6 bf02          	ld	L522_m_woMarkEnd2,x
1231  01d8 a628          	ld	a,#40
1232  01da b703          	ld	L522_m_woMarkEnd2+1,a
1233                     ; 246 	m_woCylinderSize = 4800;
1235  01dc ae12          	ld	x,#18
1236  01de bf00          	ld	L722_m_woCylinderSize,x
1237  01e0 a6c0          	ld	a,#192
1238  01e2 b701          	ld	L722_m_woCylinderSize+1,a
1239                     ; 249 	EnableInterrupts();
1242  01e4 9a            rim
1244  01e5               L325:
1245                     ; 253 		simulateSignals();
1247  01e5 cd0122        	call	_simulateSignals
1249                     ; 255 		switch(chkKeyboard())
1251  01e8 cd0073        	call	_chkKeyboard
1254  01eb 4a            	dec	a
1255  01ec 271e          	jreq	L174
1256  01ee 4a            	dec	a
1257  01ef 2737          	jreq	L374
1258  01f1 4a            	dec	a
1259  01f2 2740          	jreq	L574
1260  01f4 4a            	dec	a
1261  01f5 2749          	jreq	L774
1262  01f7 4a            	dec	a
1263  01f8 2752          	jreq	L105
1264  01fa               L305:
1265                     ; 280 			default:
1265                     ; 281 				m_woMarkStart1	= 500;
1267  01fa ae01          	ld	x,#1
1268  01fc bf08          	ld	L712_m_woMarkStart1,x
1269  01fe a6f4          	ld	a,#244
1270  0200 b709          	ld	L712_m_woMarkStart1+1,a
1271                     ; 282 				m_woMarkEnd1	= 505;
1273  0202 ae01          	ld	x,#1
1274  0204 bf06          	ld	L122_m_woMarkEnd1,x
1275  0206 a6f9          	ld	a,#249
1276  0208 b707          	ld	L122_m_woMarkEnd1+1,a
1277                     ; 283 				break;
1279  020a 20d9          	jra	L325
1280  020c               L174:
1281                     ; 257 			case 1:	/*Move Signal*/
1281                     ; 258 				ledDoubleBlink();
1283  020c cd0104        	call	_ledDoubleBlink
1285                     ; 259 				sleep(50000);
1287  020f a650          	ld	a,#80
1288  0211 aec3          	ld	x,#195
1289  0213 cd0052        	call	_sleep
1291                     ; 260 				m_woMarkStart1	= 550;
1293  0216 ae02          	ld	x,#2
1294  0218 bf08          	ld	L712_m_woMarkStart1,x
1295  021a a626          	ld	a,#38
1296  021c b709          	ld	L712_m_woMarkStart1+1,a
1297                     ; 261 				m_woMarkEnd1	= 555;
1299  021e ae02          	ld	x,#2
1300  0220 bf06          	ld	L122_m_woMarkEnd1,x
1301  0222 a62b          	ld	a,#43
1302  0224 b707          	ld	L122_m_woMarkEnd1+1,a
1303                     ; 262 				break;
1305  0226 20bd          	jra	L325
1306  0228               L374:
1307                     ; 263 			case 2:
1307                     ; 264 				ledDoubleBlink();
1309  0228 cd0104        	call	_ledDoubleBlink
1311                     ; 265 				sleep(50000);
1313  022b a650          	ld	a,#80
1314  022d aec3          	ld	x,#195
1315  022f cd0052        	call	_sleep
1317                     ; 266 				break;
1319  0232 20b1          	jra	L325
1320  0234               L574:
1321                     ; 267 			case 3:
1321                     ; 268 				ledDoubleBlink();
1323  0234 cd0104        	call	_ledDoubleBlink
1325                     ; 269 				sleep(50000);
1327  0237 a650          	ld	a,#80
1328  0239 aec3          	ld	x,#195
1329  023b cd0052        	call	_sleep
1331                     ; 270 				break;
1333  023e 20a5          	jra	L325
1334  0240               L774:
1335                     ; 271 			case 4:
1335                     ; 272 				ledDoubleBlink();
1337  0240 cd0104        	call	_ledDoubleBlink
1339                     ; 273 				sleep(50000);
1341  0243 a650          	ld	a,#80
1342  0245 aec3          	ld	x,#195
1343  0247 cd0052        	call	_sleep
1345                     ; 274 				break;
1347  024a 2099          	jra	L325
1348  024c               L105:
1349                     ; 275 			case 5:
1349                     ; 276 				ledDoubleBlink();
1351  024c cd0104        	call	_ledDoubleBlink
1353                     ; 277 				sleep(50000);
1355  024f a650          	ld	a,#80
1356  0251 aec3          	ld	x,#195
1357  0253 cd0052        	call	_sleep
1359                     ; 278 				chkCmdOutput();
1361  0256 cd00b2        	call	_chkCmdOutput
1363                     ; 279 				break;
1365  0259 208a          	jra	L325
1366  025b               L135:
1367                     ; 283 				break;
1368  025b 2088          	jra	L325
1445                     	xdef	_main
1446                     	xdef	_simulateSignals
1447                     	xdef	_ledDoubleBlink
1448                     	xdef	_ledBlink
1449                     	xdef	_chkCmdOutput
1450                     	xdef	_chkKeyboard
1451                     	xdef	_sleep
1452                     	xdef	_init
1453                     	xdef	_AT_Overflow_Irq
1454                     	switch	.ubsct
1455  0000               L722_m_woCylinderSize:
1456  0000 0000          	ds.b	2
1457  0002               L522_m_woMarkEnd2:
1458  0002 0000          	ds.b	2
1459  0004               L322_m_woMarkStart2:
1460  0004 0000          	ds.b	2
1461  0006               L122_m_woMarkEnd1:
1462  0006 0000          	ds.b	2
1463  0008               L712_m_woMarkStart1:
1464  0008 0000          	ds.b	2
1465  000a               L512_m_woEncoder:
1466  000a 0000          	ds.b	2
1467  000c               L312_m_woValue:
1468  000c 0000          	ds.b	2
1469                     	xref.b	c_x
1489                     	end
