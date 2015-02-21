   1                     ; C Compiler for ST7 (COSMIC Software)
   2                     ; Generator V4.5.5 - 12 Jan 2006
1319                     ; 4 void sleep(LWORD a_uintMilliSec)
1319                     ; 5 {
1320                     	switch	.text
1322                     	xref.b	_sleep$L
1323  0000               _sleep:
1326  0000 200b          	jra	L157
1327  0002               L747:
1328                     ; 11 		WDGCR = 0xFF;
1330  0002 a6ff          	ld	a,#255
1331  0004 b72a          	ld	_WDGCR,a
1332                     ; 12 		a_uintMilliSec--;
1334  0006 ae00          	ld	x,#_sleep$L
1335  0008 a601          	ld	a,#1
1336  000a cd0000        	call	c_lgsbc
1338  000d               L157:
1339                     ; 9 	while(a_uintMilliSec>0)
1341  000d ae00          	ld	x,#_sleep$L
1342  000f cd0000        	call	c_lzmp
1344  0012 26ee          	jrne	L747
1345                     ; 15 }
1348  0014 81            	ret
1391                     ; 19 void sleepSec(WORD a_uintSec)
1391                     ; 20 {/*
1392                     	switch	.text
1394                     	xref.b	_sleepSec$L
1395  0015               _sleepSec:
1397  0015 b701          	ld	_sleepSec$L+1,a
1398  0017 bf00          	ld	_sleepSec$L,x
1400                     ; 29 	WORD j = 0;
1402  0019 3ffe          	clr	_sleepSec$L-2
1403  001b 3fff          	clr	_sleepSec$L-1
1405  001d 202e          	jra	L3001
1406  001f               L777:
1407                     ; 37 		a_uintSec--;
1409  001f 3d01          	tnz	_sleepSec$L+1
1410  0021 2602          	jrne	L01
1411  0023 3a00          	dec	_sleepSec$L
1412  0025               L01:
1413  0025 3a01          	dec	_sleepSec$L+1
1414                     ; 38 		j=128;
1416  0027 a680          	ld	a,#128
1417  0029 b7ff          	ld	_sleepSec$L-1,a
1418  002b 3ffe          	clr	_sleepSec$L-2
1419  002d               L7001:
1420                     ; 41 			sleep(255);
1422  002d a6ff          	ld	a,#255
1423  002f b703          	ld	_sleep$L+3,a
1424  0031 a600          	ld	a,#0
1425  0033 b702          	ld	_sleep$L+2,a
1426  0035 a600          	ld	a,#0
1427  0037 b701          	ld	_sleep$L+1,a
1428  0039 a600          	ld	a,#0
1429  003b b700          	ld	_sleep$L,a
1430  003d adc1          	call	_sleep
1432                     ; 42 			j--;
1434  003f 3dff          	tnz	_sleepSec$L-1
1435  0041 2602          	jrne	L21
1436  0043 3afe          	dec	_sleepSec$L-2
1437  0045               L21:
1438  0045 3aff          	dec	_sleepSec$L-1
1439                     ; 39 		while(j>0)
1441  0047 b6ff          	ld	a,_sleepSec$L-1
1442  0049 bafe          	or	a,_sleepSec$L-2
1443  004b 26e0          	jrne	L7001
1444  004d               L3001:
1445                     ; 35 	while(a_uintSec>0)
1447  004d b601          	ld	a,_sleepSec$L+1
1448  004f ba00          	or	a,_sleepSec$L
1449  0051 26cc          	jrne	L777
1450                     ; 45 }
1453  0053 81            	ret
1524                     ; 49 void memcpyFull(STRING a_strTo, STRING a_strFROM, BYTE a_byLength)
1524                     ; 50 {
1525                     	switch	.text
1527                     	xref.b	_memcpyFull$L
1528  0054               _memcpyFull:
1530  0054 b701          	ld	_memcpyFull$L+1,a
1531  0056 bf00          	ld	_memcpyFull$L,x
1533                     ; 51 	BYTE i = 0x00;
1535  0058 3fff          	clr	_memcpyFull$L-1
1536                     ; 52 	BYTE j = 0x00;
1538  005a 3ffe          	clr	_memcpyFull$L-2
1540  005c 200e          	jra	L7501
1541  005e               L3501:
1542                     ; 55 		a_strTo[i++] = a_strFROM[j++];
1544  005e befe          	ld	x,_memcpyFull$L-2
1545  0060 3cfe          	inc	_memcpyFull$L-2
1546  0062 92d602        	ld	a,([_memcpyFull$L+2.w],x)
1547  0065 beff          	ld	x,_memcpyFull$L-1
1548  0067 3cff          	inc	_memcpyFull$L-1
1549  0069 92d700        	ld	([_memcpyFull$L.w],x),a
1550  006c               L7501:
1551                     ; 53 	while(i<a_byLength)
1553  006c b6ff          	ld	a,_memcpyFull$L-1
1554  006e b104          	cp	a,_memcpyFull$L+4
1555  0070 25ec          	jrult	L3501
1556                     ; 57 }
1559  0072 81            	ret
1630                     ; 61 void memcpy(STRING a_strTo, STRING a_strFROM, BYTE a_byLength)
1630                     ; 62 {
1631                     	switch	.text
1633                     	xref.b	_memcpy$L
1634  0073               _memcpy:
1636  0073 b701          	ld	_memcpy$L+1,a
1637  0075 bf00          	ld	_memcpy$L,x
1639                     ; 63 	BYTE i = 0x00;
1641  0077 3fff          	clr	_memcpy$L-1
1642                     ; 64 	BYTE j = 0x00;
1644  0079 3ffe          	clr	_memcpy$L-2
1646  007b 200e          	jra	L5211
1647  007d               L1211:
1648                     ; 67 		a_strTo[i++] = a_strFROM[j++];
1650  007d befe          	ld	x,_memcpy$L-2
1651  007f 3cfe          	inc	_memcpy$L-2
1652  0081 92d602        	ld	a,([_memcpy$L+2.w],x)
1653  0084 beff          	ld	x,_memcpy$L-1
1654  0086 3cff          	inc	_memcpy$L-1
1655  0088 92d700        	ld	([_memcpy$L.w],x),a
1656  008b               L5211:
1657                     ; 65 	while((i<a_byLength) && (a_strFROM[j] != 0x00))
1659  008b b6ff          	ld	a,_memcpy$L-1
1660  008d b104          	cp	a,_memcpy$L+4
1661  008f 2412          	jruge	L5311
1663  0091 befe          	ld	x,_memcpy$L-2
1664  0093 92d602        	ld	a,([_memcpy$L+2.w],x)
1665  0096 4d            	tnz	a
1666  0097 26e4          	jrne	L1211
1667  0099 2008          	jra	L5311
1668  009b               L3311:
1669                     ; 71 		a_strTo[i++] = 0x00;
1671  009b beff          	ld	x,_memcpy$L-1
1672  009d 3cff          	inc	_memcpy$L-1
1673  009f 4f            	clr	a
1674  00a0 92d700        	ld	([_memcpy$L.w],x),a
1675  00a3               L5311:
1676                     ; 69 	while(i<a_byLength)
1678  00a3 b6ff          	ld	a,_memcpy$L-1
1679  00a5 b104          	cp	a,_memcpy$L+4
1680  00a7 25f2          	jrult	L3311
1681                     ; 73 }
1684  00a9 81            	ret
1722                     ; 76 void timersOnOff(BYTE a_blnEnable)
1722                     ; 77 {
1723                     	switch	.text
1725                     	xref.b	_timersOnOff$L
1726  00aa               _timersOnOff:
1729                     ; 78 	if(a_blnEnable)
1731  00aa 4d            	tnz	a
1732  00ab 2712          	jreq	L7511
1733                     ; 80 		DisableInterrupts();
1736  00ad 9b            sim
1738                     ; 81 		TACR1 = MEASURE_TACR1;
1740  00ae a6a0          	ld	a,#160
1741  00b0 b732          	ld	_TACR1,a
1742                     ; 82 		TACR2 = MEASURE_TACR2;
1744  00b2 a608          	ld	a,#8
1745  00b4 b731          	ld	_TACR2,a
1746                     ; 83 		TBCR1 = 0x00;
1748  00b6 3f42          	clr	_TBCR1
1749                     ; 84 		TBCR2 = 0x00;
1751  00b8 3f41          	clr	_TBCR2
1752                     ; 86 		TASR  = MEASURE_TIMER_ON;
1754  00ba 3f33          	clr	_TASR
1755                     ; 87 		EnableInterrupts();		
1758  00bc 9a            rim
1761  00bd 2012          	jra	L1611
1762  00bf               L7511:
1763                     ; 91 		DisableInterrupts();
1766  00bf 9b            sim
1768                     ; 92 		TBCR1 = 0x40;
1770  00c0 a640          	ld	a,#64
1771  00c2 b742          	ld	_TBCR1,a
1772                     ; 93 		TBCR2 = 0x08;
1774  00c4 a608          	ld	a,#8
1775  00c6 b741          	ld	_TBCR2,a
1776                     ; 95 		TACR1 = 0x00;
1778  00c8 3f32          	clr	_TACR1
1779                     ; 96 		TACR2 = 0x00;
1781  00ca 3f31          	clr	_TACR2
1782                     ; 97 		TASR  = MEASURE_TIMER_OFF;
1784  00cc a604          	ld	a,#4
1785  00ce b733          	ld	_TASR,a
1786                     ; 98 		EnableInterrupts();		
1789  00d0 9a            rim
1791  00d1               L1611:
1792                     ; 100 }
1795  00d1 81            	ret
1865                     ; 103 void formatNumber(WORD a_woValue, BYTE a_byNumDigit, BYTE a_byNumDecimal, BYTE * a_byString)
1865                     ; 104 {
1866                     	switch	.text
1868                     	xref.b	_formatNumber$L
1869  00d2               _formatNumber:
1871  00d2 b701          	ld	_formatNumber$L+1,a
1872  00d4 bf00          	ld	_formatNumber$L,x
1874                     ; 105 	BYTE byValue    		= 0x00;
1876  00d6 3fff          	clr	_formatNumber$L-1
1877                     ; 107 	if (a_byNumDecimal == 0x00)
1879  00d8 3d03          	tnz	_formatNumber$L+3
1880  00da 2604          	jrne	L1221
1881                     ; 109 		a_byNumDecimal = 0xFF;
1883  00dc a6ff          	ld	a,#255
1884  00de b703          	ld	_formatNumber$L+3,a
1885  00e0               L1221:
1886                     ; 112 	if (a_woValue==0x0000)
1888  00e0 b601          	ld	a,_formatNumber$L+1
1889  00e2 ba00          	or	a,_formatNumber$L
1890  00e4 2702          	jreq	L42
1891  00e6 2079          	jp	L7321
1892  00e8               L42:
1894  00e8 2007          	jra	L7221
1895  00ea               L5221:
1896                     ; 116 			a_byString[a_byNumDigit] = '-';
1898  00ea be02          	ld	x,_formatNumber$L+2
1899  00ec a62d          	ld	a,#45
1900  00ee 92d704        	ld	([_formatNumber$L+4.w],x),a
1901  00f1               L7221:
1902                     ; 114 		while(a_byNumDigit--!=0)
1904  00f1 b602          	ld	a,_formatNumber$L+2
1905  00f3 3a02          	dec	_formatNumber$L+2
1906  00f5 4d            	tnz	a
1907  00f6 26f2          	jrne	L5221
1909  00f8 206e          	jra	L3321
1910  00fa               L5321:
1911                     ; 123 			if(a_byNumDecimal == 0x00)
1913  00fa 3d03          	tnz	_formatNumber$L+3
1914  00fc 2609          	jrne	L3421
1915                     ; 125 				a_byString[a_byNumDigit] = '.'; //0x2E; // .
1917  00fe be02          	ld	x,_formatNumber$L+2
1918  0100 a62e          	ld	a,#46
1919  0102 92d704        	ld	([_formatNumber$L+4.w],x),a
1921  0105 2058          	jra	L5421
1922  0107               L3421:
1923                     ; 129 				if (a_woValue>0x00) 
1925  0107 b601          	ld	a,_formatNumber$L+1
1926  0109 ba00          	or	a,_formatNumber$L
1927  010b 273c          	jreq	L7421
1928                     ; 131 					byValue = a_woValue % 10;
1930  010d b601          	ld	a,_formatNumber$L+1
1931  010f be00          	ld	x,_formatNumber$L
1932  0111 3f00          	clr	c_y
1933  0113 90ae0a        	ld	y,#10
1934  0116 cd0000        	call	c_udiv
1936  0119 be00          	ld	x,c_y
1937  011b 909f          	ld	a,y
1938  011d b7ff          	ld	_formatNumber$L-1,a
1939                     ; 132 					a_woValue = (a_woValue-(WORD)byValue)/(BYTE)10;
1941  011f b6ff          	ld	a,_formatNumber$L-1
1942  0121 5f            	clr	x
1943  0122 b7fe          	ld	_formatNumber$L-2,a
1944  0124 bffd          	ld	_formatNumber$L-3,x
1945  0126 b601          	ld	a,_formatNumber$L+1
1946  0128 be00          	ld	x,_formatNumber$L
1947  012a b0fe          	sub	a,_formatNumber$L-2
1948  012c 88            	push	a
1949  012d 9f            	ld	a,x
1950  012e b2fd          	sbc	a,_formatNumber$L-3
1951  0130 97            	ld	x,a
1952  0131 84            	pop	a
1953  0132 3f00          	clr	c_y
1954  0134 90ae0a        	ld	y,#10
1955  0137 cd0000        	call	c_udiv
1957  013a b701          	ld	_formatNumber$L+1,a
1958  013c bf00          	ld	_formatNumber$L,x
1959                     ; 133 					a_byString[a_byNumDigit] = (byValue+'0');
1961  013e b6ff          	ld	a,_formatNumber$L-1
1962  0140 ab30          	add	a,#48
1963  0142 be02          	ld	x,_formatNumber$L+2
1964  0144 92d704        	ld	([_formatNumber$L+4.w],x),a
1966  0147 2016          	jra	L5421
1967  0149               L7421:
1968                     ; 137 					if(a_byNumDecimal<=a_byNumDigit)
1970  0149 b603          	ld	a,_formatNumber$L+3
1971  014b b102          	cp	a,_formatNumber$L+2
1972  014d 2209          	jrugt	L3521
1973                     ; 139 						a_byString[a_byNumDigit] = '0';
1975  014f be02          	ld	x,_formatNumber$L+2
1976  0151 a630          	ld	a,#48
1977  0153 92d704        	ld	([_formatNumber$L+4.w],x),a
1979  0156 2007          	jra	L5421
1980  0158               L3521:
1981                     ; 143 						a_byString[a_byNumDigit] = ' ';
1983  0158 be02          	ld	x,_formatNumber$L+2
1984  015a a620          	ld	a,#32
1985  015c 92d704        	ld	([_formatNumber$L+4.w],x),a
1986  015f               L5421:
1987                     ; 147 			a_byNumDecimal--;	
1989  015f 3a03          	dec	_formatNumber$L+3
1990  0161               L7321:
1991                     ; 121 		while(a_byNumDigit-->0)
1993  0161 b602          	ld	a,_formatNumber$L+2
1994  0163 3a02          	dec	_formatNumber$L+2
1995  0165 4d            	tnz	a
1996  0166 2692          	jrne	L5321
1997  0168               L3321:
1998                     ; 150 }
2001  0168 81            	ret
2073                     ; 153 WORD getBoundedValue(WORD * a_woValue, SWORD a_swoChange, WORD * a_woMax, WORD *a_woMin)
2073                     ; 154 {
2074                     	switch	.text
2076                     	xref.b	_getBoundedValue$L
2077  0169               _getBoundedValue:
2079  0169 b701          	ld	_getBoundedValue$L+1,a
2080  016b bf00          	ld	_getBoundedValue$L,x
2082                     ; 155 	SLWORD slwoChange = 0x00000000;
2084  016d a600          	ld	a,#0
2085  016f b7ff          	ld	_getBoundedValue$L-1,a
2086  0171 a600          	ld	a,#0
2087  0173 b7fe          	ld	_getBoundedValue$L-2,a
2088  0175 a600          	ld	a,#0
2089  0177 b7fd          	ld	_getBoundedValue$L-3,a
2090  0179 a600          	ld	a,#0
2091  017b b7fc          	ld	_getBoundedValue$L-4,a
2092                     ; 156 	slwoChange = ((SLWORD)(*a_woValue)) + ((SLWORD)a_swoChange);
2094  017d b603          	ld	a,_getBoundedValue$L+3
2095  017f be02          	ld	x,_getBoundedValue$L+2
2096  0181 cd0000        	call	c_itol
2098  0184 aef8          	ld	x,#_getBoundedValue$L-8
2099  0186 cd0000        	call	c_rtol
2101  0189 ae01          	ld	x,#1
2102  018b 92d600        	ld	a,([_getBoundedValue$L.w],x)
2103  018e 92ce00        	ld	x,[_getBoundedValue$L.w]
2104  0191 cd0000        	call	c_uitol
2106  0194 aef8          	ld	x,#_getBoundedValue$L-8
2107  0196 cd0000        	call	c_ladd
2109  0199 aefc          	ld	x,#_getBoundedValue$L-4
2110  019b cd0000        	call	c_rtol
2112                     ; 158 	if (slwoChange > (*a_woMax))
2114  019e ae01          	ld	x,#1
2115  01a0 92d604        	ld	a,([_getBoundedValue$L+4.w],x)
2116  01a3 92ce04        	ld	x,[_getBoundedValue$L+4.w]
2117  01a6 cd0000        	call	c_uitol
2119  01a9 aefc          	ld	x,#_getBoundedValue$L-4
2120  01ab cd0000        	call	c_lcmp
2122  01ae 2a09          	jrpl	L5131
2123                     ; 160 		return (*a_woMax);
2125  01b0 ae01          	ld	x,#1
2126  01b2 92d604        	ld	a,([_getBoundedValue$L+4.w],x)
2127  01b5 92ce04        	ld	x,[_getBoundedValue$L+4.w]
2130  01b8 81            	ret
2131  01b9               L5131:
2132                     ; 162 	else if (slwoChange < (*a_woMin))
2134  01b9 ae01          	ld	x,#1
2135  01bb 92d606        	ld	a,([_getBoundedValue$L+6.w],x)
2136  01be 92ce06        	ld	x,[_getBoundedValue$L+6.w]
2137  01c1 cd0000        	call	c_uitol
2139  01c4 aefc          	ld	x,#_getBoundedValue$L-4
2140  01c6 cd0000        	call	c_lcmp
2142                     	jrle	L1231
2143                     ; 164 		return (*a_woMin);
2145  01cd ae01          	ld	x,#1
2146  01cf 92d606        	ld	a,([_getBoundedValue$L+6.w],x)
2147  01d2 92ce06        	ld	x,[_getBoundedValue$L+6.w]
2150  01d5 81            	ret
2151  01d6               L1231:
2152                     ; 168 		return (WORD)slwoChange;			
2154  01d6 b6ff          	ld	a,_getBoundedValue$L-1
2155  01d8 befe          	ld	x,_getBoundedValue$L-2
2158  01da 81            	ret
2170                     	xdef	_getBoundedValue
2171                     	xdef	_formatNumber
2172                     	xdef	_timersOnOff
2173                     	xdef	_memcpyFull
2174                     	xdef	_memcpy
2175                     	xdef	_sleep
2176                     	xdef	_sleepSec
2177                     	xref.b	c_x
2178                     	xref.b	c_y
2197                     	xref	c_lcmp
2198                     	xref	c_ladd
2199                     	xref	c_rtol
2200                     	xref	c_itol
2201                     	xref	c_uitol
2202                     	xref	c_udiv
2203                     	xref	c_lzmp
2204                     	xref	c_lgsbc
2205                     	xref.b	_sleep$L
2206                     	end
