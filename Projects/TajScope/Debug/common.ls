   1                     ; C Compiler for ST7 (COSMIC Software)
   2                     ; Generator V4.5.5 - 12 Jan 2006
1318                     ; 4 void sleep(LWORD a_uintMilliSec)
1318                     ; 5 {
1319                     	switch	.text
1321                     	xref.b	_sleep$L
1322  0000               _sleep:
1325  0000 2007          	jra	L157
1326  0002               L747:
1327                     ; 11 		a_uintMilliSec--;
1329  0002 ae00          	ld	x,#_sleep$L
1330  0004 a601          	ld	a,#1
1331  0006 cd0000        	call	c_lgsbc
1333  0009               L157:
1334                     ; 9 	while(a_uintMilliSec>0)
1336  0009 ae00          	ld	x,#_sleep$L
1337  000b cd0000        	call	c_lzmp
1339  000e 26f2          	jrne	L747
1340                     ; 13 }
1343  0010 81            	ret
1366                     ; 16 void sleepFix(void)
1366                     ; 17 {
1367                     	switch	.text
1368  0011               _sleepFix:
1371                     ; 18 	sleep(18750);
1373  0011 a63e          	ld	a,#62
1374  0013 b703          	ld	_sleep$L+3,a
1375  0015 a649          	ld	a,#73
1376  0017 b702          	ld	_sleep$L+2,a
1377  0019 a600          	ld	a,#0
1378  001b b701          	ld	_sleep$L+1,a
1379  001d a600          	ld	a,#0
1380  001f b700          	ld	_sleep$L,a
1381  0021 addd          	call	_sleep
1383                     ; 19 }
1386  0023 81            	ret
1429                     ; 22 void sleepSec(WORD a_uintSec)
1429                     ; 23 {/*
1430                     	switch	.text
1432                     	xref.b	_sleepSec$L
1433  0024               _sleepSec:
1435  0024 b701          	ld	_sleepSec$L+1,a
1436  0026 bf00          	ld	_sleepSec$L,x
1438                     ; 32 	WORD j = 0;
1440  0028 3ffe          	clr	_sleepSec$L-2
1441  002a 3fff          	clr	_sleepSec$L-1
1443  002c 202e          	jra	L3101
1444  002e               L7001:
1445                     ; 40 		a_uintSec--;
1447  002e 3d01          	tnz	_sleepSec$L+1
1448  0030 2602          	jrne	L21
1449  0032 3a00          	dec	_sleepSec$L
1450  0034               L21:
1451  0034 3a01          	dec	_sleepSec$L+1
1452                     ; 41 		j=128;
1454  0036 a680          	ld	a,#128
1455  0038 b7ff          	ld	_sleepSec$L-1,a
1456  003a 3ffe          	clr	_sleepSec$L-2
1457  003c               L7101:
1458                     ; 44 			sleep(255);
1460  003c a6ff          	ld	a,#255
1461  003e b703          	ld	_sleep$L+3,a
1462  0040 a600          	ld	a,#0
1463  0042 b702          	ld	_sleep$L+2,a
1464  0044 a600          	ld	a,#0
1465  0046 b701          	ld	_sleep$L+1,a
1466  0048 a600          	ld	a,#0
1467  004a b700          	ld	_sleep$L,a
1468  004c adb2          	call	_sleep
1470                     ; 45 			j--;
1472  004e 3dff          	tnz	_sleepSec$L-1
1473  0050 2602          	jrne	L41
1474  0052 3afe          	dec	_sleepSec$L-2
1475  0054               L41:
1476  0054 3aff          	dec	_sleepSec$L-1
1477                     ; 42 		while(j>0)
1479  0056 b6ff          	ld	a,_sleepSec$L-1
1480  0058 bafe          	or	a,_sleepSec$L-2
1481  005a 26e0          	jrne	L7101
1482  005c               L3101:
1483                     ; 38 	while(a_uintSec>0)
1485  005c b601          	ld	a,_sleepSec$L+1
1486  005e ba00          	or	a,_sleepSec$L
1487  0060 26cc          	jrne	L7001
1488                     ; 48 }
1491  0062 81            	ret
1562                     ; 52 void memcpyFull(STRING a_strTo, STRING a_strFROM, BYTE a_byLength)
1562                     ; 53 {
1563                     	switch	.text
1565                     	xref.b	_memcpyFull$L
1566  0063               _memcpyFull:
1568  0063 b701          	ld	_memcpyFull$L+1,a
1569  0065 bf00          	ld	_memcpyFull$L,x
1571                     ; 54 	BYTE i = 0x00;
1573  0067 3fff          	clr	_memcpyFull$L-1
1574                     ; 55 	BYTE j = 0x00;
1576  0069 3ffe          	clr	_memcpyFull$L-2
1578  006b 200e          	jra	L7601
1579  006d               L3601:
1580                     ; 58 		a_strTo[i++] = a_strFROM[j++];
1582  006d befe          	ld	x,_memcpyFull$L-2
1583  006f 3cfe          	inc	_memcpyFull$L-2
1584  0071 92d602        	ld	a,([_memcpyFull$L+2.w],x)
1585  0074 beff          	ld	x,_memcpyFull$L-1
1586  0076 3cff          	inc	_memcpyFull$L-1
1587  0078 92d700        	ld	([_memcpyFull$L.w],x),a
1588  007b               L7601:
1589                     ; 56 	while(i<a_byLength)
1591  007b b6ff          	ld	a,_memcpyFull$L-1
1592  007d b104          	cp	a,_memcpyFull$L+4
1593  007f 25ec          	jrult	L3601
1594                     ; 60 }
1597  0081 81            	ret
1668                     ; 64 BYTE memcpy(STRING a_strTo, STRING a_strFROM, BYTE a_byLength)
1668                     ; 65 {
1669                     	switch	.text
1671                     	xref.b	_memcpy$L
1672  0082               _memcpy:
1674  0082 b701          	ld	_memcpy$L+1,a
1675  0084 bf00          	ld	_memcpy$L,x
1677                     ; 66 	BYTE i = 0x00;
1679  0086 3fff          	clr	_memcpy$L-1
1680                     ; 67 	BYTE j = 0x00;
1682  0088 3ffe          	clr	_memcpy$L-2
1684  008a 200e          	jra	L5311
1685  008c               L1311:
1686                     ; 70 		a_strTo[i++] = a_strFROM[j++];
1688  008c befe          	ld	x,_memcpy$L-2
1689  008e 3cfe          	inc	_memcpy$L-2
1690  0090 92d602        	ld	a,([_memcpy$L+2.w],x)
1691  0093 beff          	ld	x,_memcpy$L-1
1692  0095 3cff          	inc	_memcpy$L-1
1693  0097 92d700        	ld	([_memcpy$L.w],x),a
1694  009a               L5311:
1695                     ; 68 	while((i<a_byLength) && (a_strFROM[j] != 0x00))
1697  009a b6ff          	ld	a,_memcpy$L-1
1698  009c b104          	cp	a,_memcpy$L+4
1699  009e 2412          	jruge	L5411
1701  00a0 befe          	ld	x,_memcpy$L-2
1702  00a2 92d602        	ld	a,([_memcpy$L+2.w],x)
1703  00a5 4d            	tnz	a
1704  00a6 26e4          	jrne	L1311
1705  00a8 2008          	jra	L5411
1706  00aa               L3411:
1707                     ; 74 		a_strTo[i++] = 0x00;
1709  00aa beff          	ld	x,_memcpy$L-1
1710  00ac 3cff          	inc	_memcpy$L-1
1711  00ae 4f            	clr	a
1712  00af 92d700        	ld	([_memcpy$L.w],x),a
1713  00b2               L5411:
1714                     ; 72 	while(i<a_byLength)
1716  00b2 b6ff          	ld	a,_memcpy$L-1
1717  00b4 b104          	cp	a,_memcpy$L+4
1718  00b6 25f2          	jrult	L3411
1719                     ; 76 	return j;
1721  00b8 b6fe          	ld	a,_memcpy$L-2
1724  00ba 81            	ret
1762                     ; 80 void timersOnOff(BYTE a_blnEnable)
1762                     ; 81 {
1763                     	switch	.text
1765                     	xref.b	_timersOnOff$L
1766  00bb               _timersOnOff:
1769                     ; 82 	if(a_blnEnable)
1771  00bb 4d            	tnz	a
1772  00bc 2712          	jreq	L7611
1773                     ; 84 		DisableInterrupts();
1776  00be 9b            sim
1778                     ; 85 		TACR1 = MEASURE_TACR1;
1780  00bf a6a0          	ld	a,#160
1781  00c1 b732          	ld	_TACR1,a
1782                     ; 86 		TACR2 = MEASURE_TACR2;
1784  00c3 a608          	ld	a,#8
1785  00c5 b731          	ld	_TACR2,a
1786                     ; 87 		TBCR1 = 0x00;
1788  00c7 3f42          	clr	_TBCR1
1789                     ; 88 		TBCR2 = 0x00;
1791  00c9 3f41          	clr	_TBCR2
1792                     ; 90 		TASR  = MEASURE_TIMER_ON;
1794  00cb 3f33          	clr	_TASR
1795                     ; 91 		EnableInterrupts();		
1798  00cd 9a            rim
1801  00ce 2012          	jra	L1711
1802  00d0               L7611:
1803                     ; 95 		DisableInterrupts();
1806  00d0 9b            sim
1808                     ; 96 		TBCR1 = 0x40;
1810  00d1 a640          	ld	a,#64
1811  00d3 b742          	ld	_TBCR1,a
1812                     ; 97 		TBCR2 = 0x08;
1814  00d5 a608          	ld	a,#8
1815  00d7 b741          	ld	_TBCR2,a
1816                     ; 99 		TACR1 = 0x00;
1818  00d9 3f32          	clr	_TACR1
1819                     ; 100 		TACR2 = 0x00;
1821  00db 3f31          	clr	_TACR2
1822                     ; 101 		TASR  = MEASURE_TIMER_OFF;
1824  00dd a604          	ld	a,#4
1825  00df b733          	ld	_TASR,a
1826                     ; 102 		EnableInterrupts();		
1829  00e1 9a            rim
1831  00e2               L1711:
1832                     ; 104 }
1835  00e2 81            	ret
1905                     ; 107 void formatNumber(WORD a_woValue, BYTE a_byNumDigit, BYTE a_byNumDecimal, BYTE * a_byString)
1905                     ; 108 {
1906                     	switch	.text
1908                     	xref.b	_formatNumber$L
1909  00e3               _formatNumber:
1911  00e3 b701          	ld	_formatNumber$L+1,a
1912  00e5 bf00          	ld	_formatNumber$L,x
1914                     ; 109 	BYTE byValue    		= 0x00;
1916  00e7 3fff          	clr	_formatNumber$L-1
1917                     ; 111 	if (a_byNumDecimal == 0x00)
1919  00e9 3d03          	tnz	_formatNumber$L+3
1920  00eb 2604          	jrne	L1321
1921                     ; 113 		a_byNumDecimal = 0xFF;
1923  00ed a6ff          	ld	a,#255
1924  00ef b703          	ld	_formatNumber$L+3,a
1925  00f1               L1321:
1926                     ; 116 	if (a_woValue==0x0000)
1928  00f1 b601          	ld	a,_formatNumber$L+1
1929  00f3 ba00          	or	a,_formatNumber$L
1930  00f5 2702          	jreq	L62
1931  00f7 2079          	jp	L7421
1932  00f9               L62:
1934  00f9 2007          	jra	L7321
1935  00fb               L5321:
1936                     ; 120 			a_byString[a_byNumDigit] = '-';
1938  00fb be02          	ld	x,_formatNumber$L+2
1939  00fd a62d          	ld	a,#45
1940  00ff 92d704        	ld	([_formatNumber$L+4.w],x),a
1941  0102               L7321:
1942                     ; 118 		while(a_byNumDigit--!=0)
1944  0102 b602          	ld	a,_formatNumber$L+2
1945  0104 3a02          	dec	_formatNumber$L+2
1946  0106 4d            	tnz	a
1947  0107 26f2          	jrne	L5321
1949  0109 206e          	jra	L3421
1950  010b               L5421:
1951                     ; 127 			if(a_byNumDecimal == 0x00)
1953  010b 3d03          	tnz	_formatNumber$L+3
1954  010d 2609          	jrne	L3521
1955                     ; 129 				a_byString[a_byNumDigit] = '.'; //0x2E; // .
1957  010f be02          	ld	x,_formatNumber$L+2
1958  0111 a62e          	ld	a,#46
1959  0113 92d704        	ld	([_formatNumber$L+4.w],x),a
1961  0116 2058          	jra	L5521
1962  0118               L3521:
1963                     ; 133 				if (a_woValue>0x00) 
1965  0118 b601          	ld	a,_formatNumber$L+1
1966  011a ba00          	or	a,_formatNumber$L
1967  011c 273c          	jreq	L7521
1968                     ; 135 					byValue = a_woValue % 10;
1970  011e b601          	ld	a,_formatNumber$L+1
1971  0120 be00          	ld	x,_formatNumber$L
1972  0122 3f00          	clr	c_y
1973  0124 90ae0a        	ld	y,#10
1974  0127 cd0000        	call	c_udiv
1976  012a be00          	ld	x,c_y
1977  012c 909f          	ld	a,y
1978  012e b7ff          	ld	_formatNumber$L-1,a
1979                     ; 136 					a_woValue = (a_woValue-(WORD)byValue)/(BYTE)10;
1981  0130 b6ff          	ld	a,_formatNumber$L-1
1982  0132 5f            	clr	x
1983  0133 b7fe          	ld	_formatNumber$L-2,a
1984  0135 bffd          	ld	_formatNumber$L-3,x
1985  0137 b601          	ld	a,_formatNumber$L+1
1986  0139 be00          	ld	x,_formatNumber$L
1987  013b b0fe          	sub	a,_formatNumber$L-2
1988  013d 88            	push	a
1989  013e 9f            	ld	a,x
1990  013f b2fd          	sbc	a,_formatNumber$L-3
1991  0141 97            	ld	x,a
1992  0142 84            	pop	a
1993  0143 3f00          	clr	c_y
1994  0145 90ae0a        	ld	y,#10
1995  0148 cd0000        	call	c_udiv
1997  014b b701          	ld	_formatNumber$L+1,a
1998  014d bf00          	ld	_formatNumber$L,x
1999                     ; 137 					a_byString[a_byNumDigit] = (byValue+'0');
2001  014f b6ff          	ld	a,_formatNumber$L-1
2002  0151 ab30          	add	a,#48
2003  0153 be02          	ld	x,_formatNumber$L+2
2004  0155 92d704        	ld	([_formatNumber$L+4.w],x),a
2006  0158 2016          	jra	L5521
2007  015a               L7521:
2008                     ; 141 					if(a_byNumDecimal<=a_byNumDigit)
2010  015a b603          	ld	a,_formatNumber$L+3
2011  015c b102          	cp	a,_formatNumber$L+2
2012  015e 2209          	jrugt	L3621
2013                     ; 143 						a_byString[a_byNumDigit] = '0';
2015  0160 be02          	ld	x,_formatNumber$L+2
2016  0162 a630          	ld	a,#48
2017  0164 92d704        	ld	([_formatNumber$L+4.w],x),a
2019  0167 2007          	jra	L5521
2020  0169               L3621:
2021                     ; 147 						a_byString[a_byNumDigit] = ' ';
2023  0169 be02          	ld	x,_formatNumber$L+2
2024  016b a620          	ld	a,#32
2025  016d 92d704        	ld	([_formatNumber$L+4.w],x),a
2026  0170               L5521:
2027                     ; 151 			a_byNumDecimal--;	
2029  0170 3a03          	dec	_formatNumber$L+3
2030  0172               L7421:
2031                     ; 125 		while(a_byNumDigit-->0)
2033  0172 b602          	ld	a,_formatNumber$L+2
2034  0174 3a02          	dec	_formatNumber$L+2
2035  0176 4d            	tnz	a
2036  0177 2692          	jrne	L5421
2037  0179               L3421:
2038                     ; 154 }
2041  0179 81            	ret
2113                     ; 157 WORD getBoundedValue(WORD * a_woValue, SWORD a_swoChange, WORD * a_woMax, WORD *a_woMin)
2113                     ; 158 {
2114                     	switch	.text
2116                     	xref.b	_getBoundedValue$L
2117  017a               _getBoundedValue:
2119  017a b701          	ld	_getBoundedValue$L+1,a
2120  017c bf00          	ld	_getBoundedValue$L,x
2122                     ; 159 	SLWORD slwoChange = 0x00000000;
2124  017e a600          	ld	a,#0
2125  0180 b7ff          	ld	_getBoundedValue$L-1,a
2126  0182 a600          	ld	a,#0
2127  0184 b7fe          	ld	_getBoundedValue$L-2,a
2128  0186 a600          	ld	a,#0
2129  0188 b7fd          	ld	_getBoundedValue$L-3,a
2130  018a a600          	ld	a,#0
2131  018c b7fc          	ld	_getBoundedValue$L-4,a
2132                     ; 160 	slwoChange = ((SLWORD)(*a_woValue)) + ((SLWORD)a_swoChange);
2134  018e b603          	ld	a,_getBoundedValue$L+3
2135  0190 be02          	ld	x,_getBoundedValue$L+2
2136  0192 cd0000        	call	c_itol
2138  0195 aef8          	ld	x,#_getBoundedValue$L-8
2139  0197 cd0000        	call	c_rtol
2141  019a ae01          	ld	x,#1
2142  019c 92d600        	ld	a,([_getBoundedValue$L.w],x)
2143  019f 92ce00        	ld	x,[_getBoundedValue$L.w]
2144  01a2 cd0000        	call	c_uitol
2146  01a5 aef8          	ld	x,#_getBoundedValue$L-8
2147  01a7 cd0000        	call	c_ladd
2149  01aa aefc          	ld	x,#_getBoundedValue$L-4
2150  01ac cd0000        	call	c_rtol
2152                     ; 162 	if (slwoChange > (*a_woMax))
2154  01af ae01          	ld	x,#1
2155  01b1 92d604        	ld	a,([_getBoundedValue$L+4.w],x)
2156  01b4 92ce04        	ld	x,[_getBoundedValue$L+4.w]
2157  01b7 cd0000        	call	c_uitol
2159  01ba aefc          	ld	x,#_getBoundedValue$L-4
2160  01bc cd0000        	call	c_lcmp
2162  01bf 2a09          	jrpl	L5231
2163                     ; 164 		return (*a_woMax);
2165  01c1 ae01          	ld	x,#1
2166  01c3 92d604        	ld	a,([_getBoundedValue$L+4.w],x)
2167  01c6 92ce04        	ld	x,[_getBoundedValue$L+4.w]
2170  01c9 81            	ret
2171  01ca               L5231:
2172                     ; 166 	else if (slwoChange < (*a_woMin))
2174  01ca ae01          	ld	x,#1
2175  01cc 92d606        	ld	a,([_getBoundedValue$L+6.w],x)
2176  01cf 92ce06        	ld	x,[_getBoundedValue$L+6.w]
2177  01d2 cd0000        	call	c_uitol
2179  01d5 aefc          	ld	x,#_getBoundedValue$L-4
2180  01d7 cd0000        	call	c_lcmp
2182                     	jrle	L1331
2183                     ; 168 		return (*a_woMin);
2185  01de ae01          	ld	x,#1
2186  01e0 92d606        	ld	a,([_getBoundedValue$L+6.w],x)
2187  01e3 92ce06        	ld	x,[_getBoundedValue$L+6.w]
2190  01e6 81            	ret
2191  01e7               L1331:
2192                     ; 172 		return (WORD)slwoChange;			
2194  01e7 b6ff          	ld	a,_getBoundedValue$L-1
2195  01e9 befe          	ld	x,_getBoundedValue$L-2
2198  01eb 81            	ret
2210                     	xdef	_getBoundedValue
2211                     	xdef	_formatNumber
2212                     	xdef	_timersOnOff
2213                     	xdef	_memcpyFull
2214                     	xdef	_memcpy
2215                     	xdef	_sleepFix
2216                     	xdef	_sleep
2217                     	xdef	_sleepSec
2218                     	xref.b	c_x
2219                     	xref.b	c_y
2238                     	xref	c_lcmp
2239                     	xref	c_ladd
2240                     	xref	c_rtol
2241                     	xref	c_itol
2242                     	xref	c_uitol
2243                     	xref	c_udiv
2244                     	xref	c_lzmp
2245                     	xref	c_lgsbc
2246                     	xref.b	_sleep$L
2247                     	end
