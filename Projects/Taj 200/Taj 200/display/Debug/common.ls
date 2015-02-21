   1                     ; C Compiler for ST7 (COSMIC Software)
   2                     ; Generator V4.5.5 - 12 Jan 2006
1280                     .const:	section	.text
1281  0000               L327_mc_byApplicationVersion:
1282  0000 9d            	dc.b	157
1351                     ; 4 void sleep(LWORD a_uintMilliSec)
1351                     ; 5 {
1352                     	switch	.text
1354                     	xref.b	_sleep$L
1355  0000               _sleep:
1358  0000 2007          	jra	L767
1359  0002               L567:
1360                     ; 8 		a_uintMilliSec--;
1362  0002 ae00          	ld	x,#_sleep$L
1363  0004 a601          	ld	a,#1
1364  0006 cd0000        	call	c_lgsbc
1366  0009               L767:
1367                     ; 6 	while(a_uintMilliSec>0)
1369  0009 ae00          	ld	x,#_sleep$L
1370  000b cd0000        	call	c_lzmp
1372  000e 26f2          	jrne	L567
1373                     ; 10 }
1376  0010 81            	ret
1409                     ; 13 void sleepForIRQ(LWORD a_uintMilliSec)
1409                     ; 14 {
1410                     	switch	.text
1412                     	xref.b	_sleepForIRQ$L
1413  0011               _sleepForIRQ:
1416  0011 2007          	jra	L3101
1417  0013               L1101:
1418                     ; 17 		a_uintMilliSec--;
1420  0013 ae00          	ld	x,#_sleepForIRQ$L
1421  0015 a601          	ld	a,#1
1422  0017 cd0000        	call	c_lgsbc
1424  001a               L3101:
1425                     ; 15 	while(a_uintMilliSec>0)
1427  001a ae00          	ld	x,#_sleepForIRQ$L
1428  001c cd0000        	call	c_lzmp
1430  001f 26f2          	jrne	L1101
1431                     ; 19 }
1434  0021 81            	ret
1457                     ; 22 void sleepFix(void)
1457                     ; 23 {
1458                     	switch	.text
1459  0022               _sleepFix:
1462                     ; 26 	sleep(30000);
1464  0022 a630          	ld	a,#48
1465  0024 b703          	ld	_sleep$L+3,a
1466  0026 a675          	ld	a,#117
1467  0028 b702          	ld	_sleep$L+2,a
1468  002a a600          	ld	a,#0
1469  002c b701          	ld	_sleep$L+1,a
1470  002e a600          	ld	a,#0
1471  0030 b700          	ld	_sleep$L,a
1472  0032 adcc          	call	_sleep
1474                     ; 31 }
1477  0034 81            	ret
1520                     ; 34 void sleepSec(WORD a_uintSec)
1520                     ; 35 {
1521                     	switch	.text
1523                     	xref.b	_sleepSec$L
1524  0035               _sleepSec:
1526  0035 b701          	ld	_sleepSec$L+1,a
1527  0037 bf00          	ld	_sleepSec$L,x
1529                     ; 36 	WORD j = 0;
1531  0039 3ffe          	clr	_sleepSec$L-2
1532  003b 3fff          	clr	_sleepSec$L-1
1534  003d 202e          	jra	L5501
1535  003f               L1501:
1536                     ; 44 		a_uintSec--;
1538  003f 3d01          	tnz	_sleepSec$L+1
1539  0041 2602          	jrne	L41
1540  0043 3a00          	dec	_sleepSec$L
1541  0045               L41:
1542  0045 3a01          	dec	_sleepSec$L+1
1543                     ; 45 		j=128;
1545  0047 a680          	ld	a,#128
1546  0049 b7ff          	ld	_sleepSec$L-1,a
1547  004b 3ffe          	clr	_sleepSec$L-2
1548  004d               L1601:
1549                     ; 48 			sleep(255);
1551  004d a6ff          	ld	a,#255
1552  004f b703          	ld	_sleep$L+3,a
1553  0051 a600          	ld	a,#0
1554  0053 b702          	ld	_sleep$L+2,a
1555  0055 a600          	ld	a,#0
1556  0057 b701          	ld	_sleep$L+1,a
1557  0059 a600          	ld	a,#0
1558  005b b700          	ld	_sleep$L,a
1559  005d ada1          	call	_sleep
1561                     ; 49 			j--;
1563  005f 3dff          	tnz	_sleepSec$L-1
1564  0061 2602          	jrne	L61
1565  0063 3afe          	dec	_sleepSec$L-2
1566  0065               L61:
1567  0065 3aff          	dec	_sleepSec$L-1
1568                     ; 46 		while(j>0)
1570  0067 b6ff          	ld	a,_sleepSec$L-1
1571  0069 bafe          	or	a,_sleepSec$L-2
1572  006b 26e0          	jrne	L1601
1573  006d               L5501:
1574                     ; 42 	while(a_uintSec>0)
1576  006d b601          	ld	a,_sleepSec$L+1
1577  006f ba00          	or	a,_sleepSec$L
1578  0071 26cc          	jrne	L1501
1579                     ; 52 }
1582  0073 81            	ret
1653                     ; 56 void memcpyFull(STRING a_strTo, STRING a_strFROM, BYTE a_byLength)
1653                     ; 57 {
1654                     	switch	.text
1656                     	xref.b	_memcpyFull$L
1657  0074               _memcpyFull:
1659  0074 b701          	ld	_memcpyFull$L+1,a
1660  0076 bf00          	ld	_memcpyFull$L,x
1662                     ; 58 	BYTE i = 0x00;
1664  0078 3fff          	clr	_memcpyFull$L-1
1665                     ; 59 	BYTE j = 0x00;
1667  007a 3ffe          	clr	_memcpyFull$L-2
1669  007c 200e          	jra	L1311
1670  007e               L5211:
1671                     ; 62 		a_strTo[i++] = a_strFROM[j++];
1673  007e befe          	ld	x,_memcpyFull$L-2
1674  0080 3cfe          	inc	_memcpyFull$L-2
1675  0082 92d602        	ld	a,([_memcpyFull$L+2.w],x)
1676  0085 beff          	ld	x,_memcpyFull$L-1
1677  0087 3cff          	inc	_memcpyFull$L-1
1678  0089 92d700        	ld	([_memcpyFull$L.w],x),a
1679  008c               L1311:
1680                     ; 60 	while(i<a_byLength)
1682  008c b6ff          	ld	a,_memcpyFull$L-1
1683  008e b104          	cp	a,_memcpyFull$L+4
1684  0090 25ec          	jrult	L5211
1685                     ; 64 }
1688  0092 81            	ret
1759                     ; 68 BYTE memcpy(STRING a_strTo, STRING a_strFROM, BYTE a_byLength)
1759                     ; 69 {
1760                     	switch	.text
1762                     	xref.b	_memcpy$L
1763  0093               _memcpy:
1765  0093 b701          	ld	_memcpy$L+1,a
1766  0095 bf00          	ld	_memcpy$L,x
1768                     ; 70 	BYTE i = 0x00;
1770  0097 3fff          	clr	_memcpy$L-1
1771                     ; 71 	BYTE j = 0x00;
1773  0099 3ffe          	clr	_memcpy$L-2
1775  009b 200e          	jra	L7711
1776  009d               L3711:
1777                     ; 74 		a_strTo[i++] = a_strFROM[j++];
1779  009d befe          	ld	x,_memcpy$L-2
1780  009f 3cfe          	inc	_memcpy$L-2
1781  00a1 92d602        	ld	a,([_memcpy$L+2.w],x)
1782  00a4 beff          	ld	x,_memcpy$L-1
1783  00a6 3cff          	inc	_memcpy$L-1
1784  00a8 92d700        	ld	([_memcpy$L.w],x),a
1785  00ab               L7711:
1786                     ; 72 	while((i<a_byLength) && (a_strFROM[j] != 0x00))
1788  00ab b6ff          	ld	a,_memcpy$L-1
1789  00ad b104          	cp	a,_memcpy$L+4
1790  00af 2412          	jruge	L7021
1792  00b1 befe          	ld	x,_memcpy$L-2
1793  00b3 92d602        	ld	a,([_memcpy$L+2.w],x)
1794  00b6 4d            	tnz	a
1795  00b7 26e4          	jrne	L3711
1796  00b9 2008          	jra	L7021
1797  00bb               L5021:
1798                     ; 78 		a_strTo[i++] = 0x00;
1800  00bb beff          	ld	x,_memcpy$L-1
1801  00bd 3cff          	inc	_memcpy$L-1
1802  00bf 4f            	clr	a
1803  00c0 92d700        	ld	([_memcpy$L.w],x),a
1804  00c3               L7021:
1805                     ; 76 	while(i<a_byLength)
1807  00c3 b6ff          	ld	a,_memcpy$L-1
1808  00c5 b104          	cp	a,_memcpy$L+4
1809  00c7 25f2          	jrult	L5021
1810                     ; 80 	return j;
1812  00c9 b6fe          	ld	a,_memcpy$L-2
1815  00cb 81            	ret
1853                     ; 84 void timersOnOff(BYTE a_blnEnable)
1853                     ; 85 {
1854                     	switch	.text
1856                     	xref.b	_timersOnOff$L
1857  00cc               _timersOnOff:
1860                     ; 86 	if(a_blnEnable)
1862  00cc 4d            	tnz	a
1863  00cd 2712          	jreq	L1321
1864                     ; 88 		DisableInterrupts();
1867  00cf 9b            sim
1869                     ; 89 		TACR1 = MEASURE_TACR1;
1871  00d0 a6a0          	ld	a,#160
1872  00d2 b732          	ld	_TACR1,a
1873                     ; 90 		TACR2 = MEASURE_TACR2;
1875  00d4 a608          	ld	a,#8
1876  00d6 b731          	ld	_TACR2,a
1877                     ; 91 		TBCR1 = 0x00;
1879  00d8 3f42          	clr	_TBCR1
1880                     ; 92 		TBCR2 = 0x00;
1882  00da 3f41          	clr	_TBCR2
1883                     ; 94 		TASR  = MEASURE_TIMER_ON;
1885  00dc 3f33          	clr	_TASR
1886                     ; 95 		EnableInterrupts();		
1889  00de 9a            rim
1892  00df 2012          	jra	L3321
1893  00e1               L1321:
1894                     ; 99 		DisableInterrupts();
1897  00e1 9b            sim
1899                     ; 100 		TBCR1 = 0x40;
1901  00e2 a640          	ld	a,#64
1902  00e4 b742          	ld	_TBCR1,a
1903                     ; 101 		TBCR2 = 0x08;
1905  00e6 a608          	ld	a,#8
1906  00e8 b741          	ld	_TBCR2,a
1907                     ; 103 		TACR1 = 0x00;
1909  00ea 3f32          	clr	_TACR1
1910                     ; 104 		TACR2 = 0x00;
1912  00ec 3f31          	clr	_TACR2
1913                     ; 105 		TASR  = MEASURE_TIMER_OFF;
1915  00ee a604          	ld	a,#4
1916  00f0 b733          	ld	_TASR,a
1917                     ; 106 		EnableInterrupts();		
1920  00f2 9a            rim
1922  00f3               L3321:
1923                     ; 108 }
1926  00f3 81            	ret
1978                     ; 111 void formatNumberBinary(WORD a_woValue,BYTE * a_byString)
1978                     ; 112 {
1979                     	switch	.text
1981                     	xref.b	_formatNumberBinary$L
1982  00f4               _formatNumberBinary:
1984  00f4 b701          	ld	_formatNumberBinary$L+1,a
1985  00f6 bf00          	ld	_formatNumberBinary$L,x
1987                     ; 113 	BYTE byNumDigit = 8;
1989  00f8 a608          	ld	a,#8
1990  00fa b7ff          	ld	_formatNumberBinary$L-1,a
1992  00fc 202e          	jra	L7621
1993  00fe               L3621:
1994                     ; 117 		if _btst(a_woValue,byNumDigit)
1996  00fe 5f            	clr	x
1997  00ff a601          	ld	a,#1
1998  0101 90beff        	ld	y,_formatNumberBinary$L-1
1999  0104 905d          	tnz	y
2000  0106 2706          	jreq	L03
2001  0108               L23:
2002  0108 48            	sll	a
2003  0109 59            	rlc	x
2004  010a 905a          	dec	y
2005  010c 26fa          	jrne	L23
2006  010e               L03:
2007  010e b401          	and	a,_formatNumberBinary$L+1
2008  0110 88            	push	a
2009  0111 9f            	ld	a,x
2010  0112 b400          	and	a,_formatNumberBinary$L
2011  0114 97            	ld	x,a
2012  0115 84            	pop	a
2013  0116 4d            	tnz	a
2014  0117 2601          	jrne	L43
2015  0119 5d            	tnz	x
2016  011a               L43:
2017  011a 2709          	jreq	L3721
2018                     ; 119 			a_byString[byNumDigit] = '1';
2020  011c beff          	ld	x,_formatNumberBinary$L-1
2021  011e a631          	ld	a,#49
2022  0120 92d702        	ld	([_formatNumberBinary$L+2.w],x),a
2024  0123 2007          	jra	L7621
2025  0125               L3721:
2026                     ; 123 			a_byString[byNumDigit] = '0';
2028  0125 beff          	ld	x,_formatNumberBinary$L-1
2029  0127 a630          	ld	a,#48
2030  0129 92d702        	ld	([_formatNumberBinary$L+2.w],x),a
2031  012c               L7621:
2032                     ; 115 	while(byNumDigit-->0)
2034  012c b6ff          	ld	a,_formatNumberBinary$L-1
2035  012e 3aff          	dec	_formatNumberBinary$L-1
2036  0130 4d            	tnz	a
2037  0131 26cb          	jrne	L3621
2038                     ; 127 }
2041  0133 81            	ret
2111                     ; 130 void formatNumber(WORD a_woValue, BYTE a_byNumDigit, BYTE a_byNumDecimal, BYTE * a_byString)
2111                     ; 131 {
2112                     	switch	.text
2114                     	xref.b	_formatNumber$L
2115  0134               _formatNumber:
2117  0134 b701          	ld	_formatNumber$L+1,a
2118  0136 bf00          	ld	_formatNumber$L,x
2120                     ; 132 	BYTE byValue    		= 0x00;
2122  0138 3fff          	clr	_formatNumber$L-1
2123                     ; 134 	if (a_byNumDecimal == 0x00)
2125  013a 3d03          	tnz	_formatNumber$L+3
2126  013c 2604          	jrne	L5331
2127                     ; 136 		a_byNumDecimal = 0xFF;
2129  013e a6ff          	ld	a,#255
2130  0140 b703          	ld	_formatNumber$L+3,a
2131  0142               L5331:
2132                     ; 139 	if (a_woValue==0x0000)
2134  0142 b601          	ld	a,_formatNumber$L+1
2135  0144 ba00          	or	a,_formatNumber$L
2136  0146 2702          	jreq	L04
2137  0148 2079          	jp	L3531
2138  014a               L04:
2140  014a 2007          	jra	L3431
2141  014c               L1431:
2142                     ; 143 			a_byString[a_byNumDigit] = '-';
2144  014c be02          	ld	x,_formatNumber$L+2
2145  014e a62d          	ld	a,#45
2146  0150 92d704        	ld	([_formatNumber$L+4.w],x),a
2147  0153               L3431:
2148                     ; 141 		while(a_byNumDigit--!=0)
2150  0153 b602          	ld	a,_formatNumber$L+2
2151  0155 3a02          	dec	_formatNumber$L+2
2152  0157 4d            	tnz	a
2153  0158 26f2          	jrne	L1431
2155  015a 206e          	jra	L7431
2156  015c               L1531:
2157                     ; 150 			if(a_byNumDecimal == 0x00)
2159  015c 3d03          	tnz	_formatNumber$L+3
2160  015e 2609          	jrne	L7531
2161                     ; 152 				a_byString[a_byNumDigit] = '.'; //0x2E; // .
2163  0160 be02          	ld	x,_formatNumber$L+2
2164  0162 a62e          	ld	a,#46
2165  0164 92d704        	ld	([_formatNumber$L+4.w],x),a
2167  0167 2058          	jra	L1631
2168  0169               L7531:
2169                     ; 156 				if (a_woValue>0x00) 
2171  0169 b601          	ld	a,_formatNumber$L+1
2172  016b ba00          	or	a,_formatNumber$L
2173  016d 273c          	jreq	L3631
2174                     ; 158 					byValue = a_woValue % 10;
2176  016f b601          	ld	a,_formatNumber$L+1
2177  0171 be00          	ld	x,_formatNumber$L
2178  0173 3f00          	clr	c_y
2179  0175 90ae0a        	ld	y,#10
2180  0178 cd0000        	call	c_udiv
2182  017b be00          	ld	x,c_y
2183  017d 909f          	ld	a,y
2184  017f b7ff          	ld	_formatNumber$L-1,a
2185                     ; 159 					a_woValue = (a_woValue-(WORD)byValue)/(BYTE)10;
2187  0181 b6ff          	ld	a,_formatNumber$L-1
2188  0183 5f            	clr	x
2189  0184 b7fe          	ld	_formatNumber$L-2,a
2190  0186 bffd          	ld	_formatNumber$L-3,x
2191  0188 b601          	ld	a,_formatNumber$L+1
2192  018a be00          	ld	x,_formatNumber$L
2193  018c b0fe          	sub	a,_formatNumber$L-2
2194  018e 88            	push	a
2195  018f 9f            	ld	a,x
2196  0190 b2fd          	sbc	a,_formatNumber$L-3
2197  0192 97            	ld	x,a
2198  0193 84            	pop	a
2199  0194 3f00          	clr	c_y
2200  0196 90ae0a        	ld	y,#10
2201  0199 cd0000        	call	c_udiv
2203  019c b701          	ld	_formatNumber$L+1,a
2204  019e bf00          	ld	_formatNumber$L,x
2205                     ; 160 					a_byString[a_byNumDigit] = (byValue+'0');
2207  01a0 b6ff          	ld	a,_formatNumber$L-1
2208  01a2 ab30          	add	a,#48
2209  01a4 be02          	ld	x,_formatNumber$L+2
2210  01a6 92d704        	ld	([_formatNumber$L+4.w],x),a
2212  01a9 2016          	jra	L1631
2213  01ab               L3631:
2214                     ; 164 					if(a_byNumDecimal<=a_byNumDigit)
2216  01ab b603          	ld	a,_formatNumber$L+3
2217  01ad b102          	cp	a,_formatNumber$L+2
2218  01af 2209          	jrugt	L7631
2219                     ; 166 						a_byString[a_byNumDigit] = '0';
2221  01b1 be02          	ld	x,_formatNumber$L+2
2222  01b3 a630          	ld	a,#48
2223  01b5 92d704        	ld	([_formatNumber$L+4.w],x),a
2225  01b8 2007          	jra	L1631
2226  01ba               L7631:
2227                     ; 170 						a_byString[a_byNumDigit] = ' ';
2229  01ba be02          	ld	x,_formatNumber$L+2
2230  01bc a620          	ld	a,#32
2231  01be 92d704        	ld	([_formatNumber$L+4.w],x),a
2232  01c1               L1631:
2233                     ; 174 			a_byNumDecimal--;	
2235  01c1 3a03          	dec	_formatNumber$L+3
2236  01c3               L3531:
2237                     ; 148 		while(a_byNumDigit-->0)
2239  01c3 b602          	ld	a,_formatNumber$L+2
2240  01c5 3a02          	dec	_formatNumber$L+2
2241  01c7 4d            	tnz	a
2242  01c8 2692          	jrne	L1531
2243  01ca               L7431:
2244                     ; 177 }
2247  01ca 81            	ret
2319                     ; 180 WORD getBoundedValue(WORD * a_woValue, SWORD a_swoChange, WORD * a_woMax, WORD *a_woMin)
2319                     ; 181 {
2320                     	switch	.text
2322                     	xref.b	_getBoundedValue$L
2323  01cb               _getBoundedValue:
2325  01cb b701          	ld	_getBoundedValue$L+1,a
2326  01cd bf00          	ld	_getBoundedValue$L,x
2328                     ; 182 	SLWORD slwoChange = 0x00000000;
2330  01cf a600          	ld	a,#0
2331  01d1 b7ff          	ld	_getBoundedValue$L-1,a
2332  01d3 a600          	ld	a,#0
2333  01d5 b7fe          	ld	_getBoundedValue$L-2,a
2334  01d7 a600          	ld	a,#0
2335  01d9 b7fd          	ld	_getBoundedValue$L-3,a
2336  01db a600          	ld	a,#0
2337  01dd b7fc          	ld	_getBoundedValue$L-4,a
2338                     ; 183 	slwoChange = ((SLWORD)(*a_woValue)) + ((SLWORD)a_swoChange);
2340  01df b603          	ld	a,_getBoundedValue$L+3
2341  01e1 be02          	ld	x,_getBoundedValue$L+2
2342  01e3 cd0000        	call	c_itol
2344  01e6 aef8          	ld	x,#_getBoundedValue$L-8
2345  01e8 cd0000        	call	c_rtol
2347  01eb ae01          	ld	x,#1
2348  01ed 92d600        	ld	a,([_getBoundedValue$L.w],x)
2349  01f0 92ce00        	ld	x,[_getBoundedValue$L.w]
2350  01f3 cd0000        	call	c_uitol
2352  01f6 aef8          	ld	x,#_getBoundedValue$L-8
2353  01f8 cd0000        	call	c_ladd
2355  01fb aefc          	ld	x,#_getBoundedValue$L-4
2356  01fd cd0000        	call	c_rtol
2358                     ; 185 	if (slwoChange > (*a_woMax))
2360  0200 ae01          	ld	x,#1
2361  0202 92d604        	ld	a,([_getBoundedValue$L+4.w],x)
2362  0205 92ce04        	ld	x,[_getBoundedValue$L+4.w]
2363  0208 cd0000        	call	c_uitol
2365  020b aefc          	ld	x,#_getBoundedValue$L-4
2366  020d cd0000        	call	c_lcmp
2368  0210 2a09          	jrpl	L1341
2369                     ; 187 		return (*a_woMax);
2371  0212 ae01          	ld	x,#1
2372  0214 92d604        	ld	a,([_getBoundedValue$L+4.w],x)
2373  0217 92ce04        	ld	x,[_getBoundedValue$L+4.w]
2376  021a 81            	ret
2377  021b               L1341:
2378                     ; 189 	else if (slwoChange < (*a_woMin))
2380  021b ae01          	ld	x,#1
2381  021d 92d606        	ld	a,([_getBoundedValue$L+6.w],x)
2382  0220 92ce06        	ld	x,[_getBoundedValue$L+6.w]
2383  0223 cd0000        	call	c_uitol
2385  0226 aefc          	ld	x,#_getBoundedValue$L-4
2386  0228 cd0000        	call	c_lcmp
2388                     	jrle	L5341
2389                     ; 191 		return (*a_woMin);
2391  022f ae01          	ld	x,#1
2392  0231 92d606        	ld	a,([_getBoundedValue$L+6.w],x)
2393  0234 92ce06        	ld	x,[_getBoundedValue$L+6.w]
2396  0237 81            	ret
2397  0238               L5341:
2398                     ; 195 		return (WORD)slwoChange;			
2400  0238 b6ff          	ld	a,_getBoundedValue$L-1
2401  023a befe          	ld	x,_getBoundedValue$L-2
2404  023c 81            	ret
2455                     	switch	.const
2456  0001               L65:
2457  0001 00000f00      	dc.l	3840
2458  0005               L46:
2459  0005 0000f000      	dc.l	61440
2460  0009               L27:
2461  0009 000f0000      	dc.l	983040
2462                     ; 201 WORD BCDtoHEX(LWORD a_lwoValue)
2462                     ; 202 {
2463                     	switch	.text
2465                     	xref.b	_BCDtoHEX$L
2466  023d               _BCDtoHEX:
2469                     ; 206 	woTmpValue = (WORD) (a_lwoValue & (LWORD)0x0000000F);
2471  023d b603          	ld	a,_BCDtoHEX$L+3
2472  023f be02          	ld	x,_BCDtoHEX$L+2
2473  0241 a40f          	and	a,#15
2474  0243 5f            	clr	x
2475  0244 b7ff          	ld	_BCDtoHEX$L-1,a
2476  0246 bffe          	ld	_BCDtoHEX$L-2,x
2477                     ; 207 	woTmpValue = MIN(woTmpValue, 0x0009);
2479  0248 b6ff          	ld	a,_BCDtoHEX$L-1
2480  024a a00a          	sub	a,#10
2481  024c b6fe          	ld	a,_BCDtoHEX$L-2
2482  024e a200          	sbc	a,#0
2483  0250 2505          	jrult	L64
2484  0252 5f            	clr	x
2485  0253 a609          	ld	a,#9
2486  0255 2004          	jra	L05
2487  0257               L64:
2488  0257 b6ff          	ld	a,_BCDtoHEX$L-1
2489  0259 befe          	ld	x,_BCDtoHEX$L-2
2490  025b               L05:
2491  025b b7ff          	ld	_BCDtoHEX$L-1,a
2492  025d bffe          	ld	_BCDtoHEX$L-2,x
2493                     ; 208 	woValue = woTmpValue;
2495  025f befe          	ld	x,_BCDtoHEX$L-2
2496  0261 bffc          	ld	_BCDtoHEX$L-4,x
2497  0263 b6ff          	ld	a,_BCDtoHEX$L-1
2498  0265 b7fd          	ld	_BCDtoHEX$L-3,a
2499                     ; 210 	woTmpValue = (WORD) ((a_lwoValue & (LWORD)0x000000F0)>>4);
2501  0267 b603          	ld	a,_BCDtoHEX$L+3
2502  0269 a4f0          	and	a,#240
2503  026b 4e            	swap	a
2504  026c a40f          	and	a,#15
2505  026e 5f            	clr	x
2506  026f b7ff          	ld	_BCDtoHEX$L-1,a
2507  0271 bffe          	ld	_BCDtoHEX$L-2,x
2508                     ; 211 	woTmpValue = MIN(woTmpValue, 0x0009)*10;
2510  0273 b6ff          	ld	a,_BCDtoHEX$L-1
2511  0275 a00a          	sub	a,#10
2512  0277 b6fe          	ld	a,_BCDtoHEX$L-2
2513  0279 a200          	sbc	a,#0
2514  027b 2505          	jrult	L25
2515  027d 5f            	clr	x
2516  027e a609          	ld	a,#9
2517  0280 2004          	jra	L45
2518  0282               L25:
2519  0282 b6ff          	ld	a,_BCDtoHEX$L-1
2520  0284 befe          	ld	x,_BCDtoHEX$L-2
2521  0286               L45:
2522  0286 3f00          	clr	c_y
2523  0288 90ae0a        	ld	y,#10
2524  028b cd0000        	call	c_imul
2526  028e b7ff          	ld	_BCDtoHEX$L-1,a
2527  0290 bffe          	ld	_BCDtoHEX$L-2,x
2528                     ; 212 	woValue += woTmpValue;
2530  0292 b6fd          	ld	a,_BCDtoHEX$L-3
2531  0294 bbff          	add	a,_BCDtoHEX$L-1
2532  0296 b7fd          	ld	_BCDtoHEX$L-3,a
2533  0298 b6fc          	ld	a,_BCDtoHEX$L-4
2534  029a b9fe          	adc	a,_BCDtoHEX$L-2
2535  029c b7fc          	ld	_BCDtoHEX$L-4,a
2536                     ; 214 	woTmpValue = (WORD) ((a_lwoValue & (LWORD)0x00000F00)>>8);
2538  029e ae00          	ld	x,#_BCDtoHEX$L
2539  02a0 cd0000        	call	c_ltor
2541  02a3 ae01          	ld	x,#high(L65)
2542  02a5 bf00          	ld	c_x,x
2543  02a7 ae01          	ld	x,#low(L65)
2544  02a9 cd0000        	call	c_xland
2546  02ac a608          	ld	a,#8
2547  02ae cd0000        	call	c_lursh
2549  02b1 b603          	ld	a,c_lreg+3
2550  02b3 be02          	ld	x,c_lreg+2
2551  02b5 b7ff          	ld	_BCDtoHEX$L-1,a
2552  02b7 bffe          	ld	_BCDtoHEX$L-2,x
2553                     ; 215 	woTmpValue = MIN(woTmpValue, 0x0009)*100;
2555  02b9 b6ff          	ld	a,_BCDtoHEX$L-1
2556  02bb a00a          	sub	a,#10
2557  02bd b6fe          	ld	a,_BCDtoHEX$L-2
2558  02bf a200          	sbc	a,#0
2559  02c1 2505          	jrult	L06
2560  02c3 5f            	clr	x
2561  02c4 a609          	ld	a,#9
2562  02c6 2004          	jra	L26
2563  02c8               L06:
2564  02c8 b6ff          	ld	a,_BCDtoHEX$L-1
2565  02ca befe          	ld	x,_BCDtoHEX$L-2
2566  02cc               L26:
2567  02cc 3f00          	clr	c_y
2568  02ce 90ae64        	ld	y,#100
2569  02d1 cd0000        	call	c_imul
2571  02d4 b7ff          	ld	_BCDtoHEX$L-1,a
2572  02d6 bffe          	ld	_BCDtoHEX$L-2,x
2573                     ; 216 	woValue += woTmpValue;
2575  02d8 b6fd          	ld	a,_BCDtoHEX$L-3
2576  02da bbff          	add	a,_BCDtoHEX$L-1
2577  02dc b7fd          	ld	_BCDtoHEX$L-3,a
2578  02de b6fc          	ld	a,_BCDtoHEX$L-4
2579  02e0 b9fe          	adc	a,_BCDtoHEX$L-2
2580  02e2 b7fc          	ld	_BCDtoHEX$L-4,a
2581                     ; 218 	woTmpValue = (WORD) ((a_lwoValue & (LWORD)0x0000F000)>>12);
2583  02e4 ae00          	ld	x,#_BCDtoHEX$L
2584  02e6 cd0000        	call	c_ltor
2586  02e9 ae05          	ld	x,#high(L46)
2587  02eb bf00          	ld	c_x,x
2588  02ed ae05          	ld	x,#low(L46)
2589  02ef cd0000        	call	c_xland
2591  02f2 a60c          	ld	a,#12
2592  02f4 cd0000        	call	c_lursh
2594  02f7 b603          	ld	a,c_lreg+3
2595  02f9 be02          	ld	x,c_lreg+2
2596  02fb b7ff          	ld	_BCDtoHEX$L-1,a
2597  02fd bffe          	ld	_BCDtoHEX$L-2,x
2598                     ; 219 	woTmpValue = MIN(woTmpValue, 0x0009)*1000;
2600  02ff b6ff          	ld	a,_BCDtoHEX$L-1
2601  0301 a00a          	sub	a,#10
2602  0303 b6fe          	ld	a,_BCDtoHEX$L-2
2603  0305 a200          	sbc	a,#0
2604  0307 2505          	jrult	L66
2605  0309 5f            	clr	x
2606  030a a609          	ld	a,#9
2607  030c 2004          	jra	L07
2608  030e               L66:
2609  030e b6ff          	ld	a,_BCDtoHEX$L-1
2610  0310 befe          	ld	x,_BCDtoHEX$L-2
2611  0312               L07:
2612  0312 90ae03        	ld	y,#3
2613  0315 90bf00        	ld	c_y,y
2614  0318 90aee8        	ld	y,#232
2615  031b cd0000        	call	c_imul
2617  031e b7ff          	ld	_BCDtoHEX$L-1,a
2618  0320 bffe          	ld	_BCDtoHEX$L-2,x
2619                     ; 220 	woValue += woTmpValue;
2621  0322 b6fd          	ld	a,_BCDtoHEX$L-3
2622  0324 bbff          	add	a,_BCDtoHEX$L-1
2623  0326 b7fd          	ld	_BCDtoHEX$L-3,a
2624  0328 b6fc          	ld	a,_BCDtoHEX$L-4
2625  032a b9fe          	adc	a,_BCDtoHEX$L-2
2626  032c b7fc          	ld	_BCDtoHEX$L-4,a
2627                     ; 222 	woTmpValue = (WORD) ((a_lwoValue & (LWORD)0x000F0000)>>16);
2629  032e ae00          	ld	x,#_BCDtoHEX$L
2630  0330 cd0000        	call	c_ltor
2632  0333 ae09          	ld	x,#high(L27)
2633  0335 bf00          	ld	c_x,x
2634  0337 ae09          	ld	x,#low(L27)
2635  0339 cd0000        	call	c_xland
2637  033c a610          	ld	a,#16
2638  033e cd0000        	call	c_lursh
2640  0341 b603          	ld	a,c_lreg+3
2641  0343 be02          	ld	x,c_lreg+2
2642  0345 b7ff          	ld	_BCDtoHEX$L-1,a
2643  0347 bffe          	ld	_BCDtoHEX$L-2,x
2644                     ; 223 	woTmpValue = MIN(woTmpValue, 0x0009)*10000;
2646  0349 b6ff          	ld	a,_BCDtoHEX$L-1
2647  034b a00a          	sub	a,#10
2648  034d b6fe          	ld	a,_BCDtoHEX$L-2
2649  034f a200          	sbc	a,#0
2650  0351 2505          	jrult	L47
2651  0353 5f            	clr	x
2652  0354 a609          	ld	a,#9
2653  0356 2004          	jra	L67
2654  0358               L47:
2655  0358 b6ff          	ld	a,_BCDtoHEX$L-1
2656  035a befe          	ld	x,_BCDtoHEX$L-2
2657  035c               L67:
2658  035c 90ae27        	ld	y,#39
2659  035f 90bf00        	ld	c_y,y
2660  0362 90ae10        	ld	y,#16
2661  0365 cd0000        	call	c_imul
2663  0368 b7ff          	ld	_BCDtoHEX$L-1,a
2664  036a bffe          	ld	_BCDtoHEX$L-2,x
2665                     ; 224 	woValue += woTmpValue;
2667  036c b6fd          	ld	a,_BCDtoHEX$L-3
2668  036e bbff          	add	a,_BCDtoHEX$L-1
2669  0370 b7fd          	ld	_BCDtoHEX$L-3,a
2670  0372 b6fc          	ld	a,_BCDtoHEX$L-4
2671  0374 b9fe          	adc	a,_BCDtoHEX$L-2
2672  0376 b7fc          	ld	_BCDtoHEX$L-4,a
2673                     ; 226 	return woValue;
2675  0378 b6fd          	ld	a,_BCDtoHEX$L-3
2676  037a befc          	ld	x,_BCDtoHEX$L-4
2679  037c 81            	ret
2691                     	xdef	_BCDtoHEX
2692                     	xdef	_getBoundedValue
2693                     	xdef	_formatNumberBinary
2694                     	xdef	_formatNumber
2695                     	xdef	_timersOnOff
2696                     	xdef	_memcpyFull
2697                     	xdef	_memcpy
2698                     	xdef	_sleepFix
2699                     	xdef	_sleepForIRQ
2700                     	xdef	_sleep
2701                     	xdef	_sleepSec
2702                     	xref.b	c_lreg
2703                     	xref.b	c_x
2704                     	xref.b	c_y
2723                     	xref	c_lursh
2724                     	xref	c_xland
2725                     	xref	c_ltor
2726                     	xref	c_imul
2727                     	xref	c_lcmp
2728                     	xref	c_ladd
2729                     	xref	c_rtol
2730                     	xref	c_itol
2731                     	xref	c_uitol
2732                     	xref	c_udiv
2733                     	xref	c_lzmp
2734                     	xref	c_lgsbc
2735                     	xref.b	_sleep$L
2736                     	end
