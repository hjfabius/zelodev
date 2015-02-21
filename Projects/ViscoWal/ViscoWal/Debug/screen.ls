   1                     ; C Compiler for ST7 (COSMIC Software)
   2                     ; Generator V4.5.5 - 12 Jan 2006
1280                     .const:	section	.text
1281  0000               L327_mc_byApplicationVersion:
1282  0000 da            	dc.b	218
1341                     ; 21 void screenInit(void)
1341                     ; 22 {	
1342                     	switch	.text
1343  0000               _screenInit:
1346                     ; 23 	windowInit();
1348  0000 cd0000        	call	_windowInit
1350                     ; 24 }
1353  0003 81            	ret
1420                     ; 27 void screenReceivedCode(BYTE a_byCode, BYTE a_byCode2, WORD a_woValue)
1420                     ; 28 {
1421                     	switch	.text
1423                     	xref.b	_screenReceivedCode$L
1424  0004               _screenReceivedCode:
1426  0004 b701          	ld	_screenReceivedCode$L+1,a
1427  0006 bf00          	ld	_screenReceivedCode$L,x
1429                     ; 33 	displayClearArea(0, 0, 126, 126);
1431  0008 a67e          	ld	a,#126
1432  000a b703          	ld	_displayClearArea$L+3,a
1433  000c a67e          	ld	a,#126
1434  000e b702          	ld	_displayClearArea$L+2,a
1435  0010 4f            	clr	a
1436  0011 5f            	clr	x
1437  0012 cd0000        	call	_displayClearArea
1439                     ; 34 	displaySetOutLine(0, 0, 126, 126, false);
1441  0015 3f04          	clr	_displaySetOutLine$L+4
1442  0017 a67e          	ld	a,#126
1443  0019 b703          	ld	_displaySetOutLine$L+3,a
1444  001b a67e          	ld	a,#126
1445  001d b702          	ld	_displaySetOutLine$L+2,a
1446  001f 4f            	clr	a
1447  0020 5f            	clr	x
1448  0021 cd0000        	call	_displaySetOutLine
1450                     ; 36 	strString[12] = 0x00;
1452  0024 3ffc          	clr	_screenReceivedCode$L-4
1453                     ; 37 	memcpy(strString, "Code 1 = ", 9); 
1455  0026 a609          	ld	a,#9
1456  0028 b704          	ld	_memcpy$L+4,a
1457  002a ae23          	ld	x,#high(L1101)
1458  002c bf02          	ld	_memcpy$L+2,x
1459  002e a623          	ld	a,#low(L1101)
1460  0030 b703          	ld	_memcpy$L+3,a
1461  0032 a6f0          	ld	a,#_screenReceivedCode$L-16
1462  0034 5f            	clr	x
1463  0035 cd0000        	call	_memcpy
1465                     ; 38 	formatNumber(a_byCode, 3, 0, strString+9);
1467  0038 aef9          	ld	x,#high(_screenReceivedCode$L-7)
1468  003a bf04          	ld	_formatNumber$L+4,x
1469  003c a6f9          	ld	a,#low(_screenReceivedCode$L-7)
1470  003e b705          	ld	_formatNumber$L+5,a
1471  0040 3f03          	clr	_formatNumber$L+3
1472  0042 a603          	ld	a,#3
1473  0044 b702          	ld	_formatNumber$L+2,a
1474  0046 b600          	ld	a,_screenReceivedCode$L
1475  0048 5f            	clr	x
1476  0049 cd0000        	call	_formatNumber
1478                     ; 39 	displayWriteString(strString, DISPLAY_SELECT_FONT_5x7, 10, 10);
1480  004c a60a          	ld	a,#10
1481  004e b704          	ld	_displayWriteString$L+4,a
1482  0050 a60a          	ld	a,#10
1483  0052 b703          	ld	_displayWriteString$L+3,a
1484  0054 a61d          	ld	a,#29
1485  0056 b702          	ld	_displayWriteString$L+2,a
1486  0058 a6f0          	ld	a,#_screenReceivedCode$L-16
1487  005a 5f            	clr	x
1488  005b cd0000        	call	_displayWriteString
1490                     ; 42 	memcpy(strString, "Code 2 = ", 9); 
1492  005e a609          	ld	a,#9
1493  0060 b704          	ld	_memcpy$L+4,a
1494  0062 ae19          	ld	x,#high(L3101)
1495  0064 bf02          	ld	_memcpy$L+2,x
1496  0066 a619          	ld	a,#low(L3101)
1497  0068 b703          	ld	_memcpy$L+3,a
1498  006a a6f0          	ld	a,#_screenReceivedCode$L-16
1499  006c 5f            	clr	x
1500  006d cd0000        	call	_memcpy
1502                     ; 43 	formatNumber(a_byCode2, 3, 0, strString+9);
1504  0070 aef9          	ld	x,#high(_screenReceivedCode$L-7)
1505  0072 bf04          	ld	_formatNumber$L+4,x
1506  0074 a6f9          	ld	a,#low(_screenReceivedCode$L-7)
1507  0076 b705          	ld	_formatNumber$L+5,a
1508  0078 3f03          	clr	_formatNumber$L+3
1509  007a a603          	ld	a,#3
1510  007c b702          	ld	_formatNumber$L+2,a
1511  007e b601          	ld	a,_screenReceivedCode$L+1
1512  0080 5f            	clr	x
1513  0081 cd0000        	call	_formatNumber
1515                     ; 44 	displayWriteString(strString, DISPLAY_SELECT_FONT_5x7, 10, 20);
1517  0084 a614          	ld	a,#20
1518  0086 b704          	ld	_displayWriteString$L+4,a
1519  0088 a60a          	ld	a,#10
1520  008a b703          	ld	_displayWriteString$L+3,a
1521  008c a61d          	ld	a,#29
1522  008e b702          	ld	_displayWriteString$L+2,a
1523  0090 a6f0          	ld	a,#_screenReceivedCode$L-16
1524  0092 5f            	clr	x
1525  0093 cd0000        	call	_displayWriteString
1527                     ; 46 	strString[15] = 0x00;
1529  0096 3fff          	clr	_screenReceivedCode$L-1
1530                     ; 47 	memcpy(strString, "Value  = ", 9); 
1532  0098 a609          	ld	a,#9
1533  009a b704          	ld	_memcpy$L+4,a
1534  009c ae0f          	ld	x,#high(L5101)
1535  009e bf02          	ld	_memcpy$L+2,x
1536  00a0 a60f          	ld	a,#low(L5101)
1537  00a2 b703          	ld	_memcpy$L+3,a
1538  00a4 a6f0          	ld	a,#_screenReceivedCode$L-16
1539  00a6 5f            	clr	x
1540  00a7 cd0000        	call	_memcpy
1542                     ; 48 	formatNumber(a_woValue, 6, 0, strString+9);
1544  00aa aef9          	ld	x,#high(_screenReceivedCode$L-7)
1545  00ac bf04          	ld	_formatNumber$L+4,x
1546  00ae a6f9          	ld	a,#low(_screenReceivedCode$L-7)
1547  00b0 b705          	ld	_formatNumber$L+5,a
1548  00b2 3f03          	clr	_formatNumber$L+3
1549  00b4 a606          	ld	a,#6
1550  00b6 b702          	ld	_formatNumber$L+2,a
1551  00b8 b603          	ld	a,_screenReceivedCode$L+3
1552  00ba be02          	ld	x,_screenReceivedCode$L+2
1553  00bc cd0000        	call	_formatNumber
1555                     ; 49 	displayWriteString(strString, DISPLAY_SELECT_FONT_5x7, 10, 30);
1557  00bf a61e          	ld	a,#30
1558  00c1 b704          	ld	_displayWriteString$L+4,a
1559  00c3 a60a          	ld	a,#10
1560  00c5 b703          	ld	_displayWriteString$L+3,a
1561  00c7 a61d          	ld	a,#29
1562  00c9 b702          	ld	_displayWriteString$L+2,a
1563  00cb a6f0          	ld	a,#_screenReceivedCode$L-16
1564  00cd 5f            	clr	x
1565  00ce cd0000        	call	_displayWriteString
1567                     ; 51 	parametersSet(PARAM_PAGE, PAGE_UNKNOWN_CODE);		
1569  00d1 a601          	ld	a,#1
1570  00d3 b702          	ld	_parametersSet$L+2,a
1571  00d5 3f01          	clr	_parametersSet$L+1
1572  00d7 a60e          	ld	a,#14
1573  00d9 cd0000        	call	_parametersSet
1575                     ; 52 }
1578  00dc 81            	ret
1602                     ; 55 void screenKeyCode(void)
1602                     ; 56 {
1603                     	switch	.text
1604  00dd               _screenKeyCode:
1607                     ; 58 	screenReceivedCode(displayGetKeyPressed(),0,0);
1609  00dd 3f02          	clr	_screenReceivedCode$L+2
1610  00df 3f03          	clr	_screenReceivedCode$L+3
1611  00e1 cd0000        	call	_displayGetKeyPressed
1613  00e4 97            	ld	x,a
1614  00e5 4f            	clr	a
1615  00e6 cd0004        	call	_screenReceivedCode
1617                     ; 59 }
1620  00e9 81            	ret
1679                     ; 62 void screenDisplayKeyCode(BYTE a_byKey)
1679                     ; 63 {
1680                     	switch	.text
1682                     	xref.b	_screenDisplayKeyCode$L
1683  00ea               _screenDisplayKeyCode:
1685  00ea b700          	ld	_screenDisplayKeyCode$L,a
1687                     ; 67 	if (a_byKey != KEY_NULL)
1689  00ec a1ff          	cp	a,#255
1690  00ee 276e          	jreq	L5501
1691                     ; 69 		displayClearArea (0, 0, 126, 126);
1693  00f0 a67e          	ld	a,#126
1694  00f2 b703          	ld	_displayClearArea$L+3,a
1695  00f4 a67e          	ld	a,#126
1696  00f6 b702          	ld	_displayClearArea$L+2,a
1697  00f8 4f            	clr	a
1698  00f9 5f            	clr	x
1699  00fa cd0000        	call	_displayClearArea
1701                     ; 70 		displaySetOutLine(0, 0, 126, 126, false);	
1703  00fd 3f04          	clr	_displaySetOutLine$L+4
1704  00ff a67e          	ld	a,#126
1705  0101 b703          	ld	_displaySetOutLine$L+3,a
1706  0103 a67e          	ld	a,#126
1707  0105 b702          	ld	_displaySetOutLine$L+2,a
1708  0107 4f            	clr	a
1709  0108 5f            	clr	x
1710  0109 cd0000        	call	_displaySetOutLine
1712                     ; 71 		strString[0] = DISPLAY_CURSOR_POSITION;
1714  010c a610          	ld	a,#16
1715  010e b7ec          	ld	_screenDisplayKeyCode$L-20,a
1716                     ; 72 		strString[1] = 0x0A;
1718  0110 a60a          	ld	a,#10
1719  0112 b7ed          	ld	_screenDisplayKeyCode$L-19,a
1720                     ; 73 		strString[2] = 0x0A;
1722  0114 a60a          	ld	a,#10
1723  0116 b7ee          	ld	_screenDisplayKeyCode$L-18,a
1724                     ; 74 		strString[3] = DISPLAY_WAIT;
1726  0118 a6fe          	ld	a,#254
1727  011a b7ef          	ld	_screenDisplayKeyCode$L-17,a
1728                     ; 75 		strString[4] = DISPLAY_EOF;
1730  011c a6ff          	ld	a,#255
1731  011e b7f0          	ld	_screenDisplayKeyCode$L-16,a
1732                     ; 76 		displayCmdToDisplay(strString);
1734  0120 a6ec          	ld	a,#_screenDisplayKeyCode$L-20
1735  0122 5f            	clr	x
1736  0123 cd0000        	call	_displayCmdToDisplay
1738                     ; 78 		for (i=0x00;i<20; i++)
1740  0126 3feb          	clr	_screenDisplayKeyCode$L-21
1741  0128               L7501:
1742                     ; 80 			strString[i] = 0x00;
1744  0128 beeb          	ld	x,_screenDisplayKeyCode$L-21
1745  012a 4f            	clr	a
1746  012b e7ec          	ld	(_screenDisplayKeyCode$L-20,x),a
1747                     ; 78 		for (i=0x00;i<20; i++)
1749  012d 3ceb          	inc	_screenDisplayKeyCode$L-21
1752  012f b6eb          	ld	a,_screenDisplayKeyCode$L-21
1753  0131 a114          	cp	a,#20
1754  0133 25f3          	jrult	L7501
1755                     ; 82 		memcpy(strString, "KeyPad = ", 9); 
1757  0135 a609          	ld	a,#9
1758  0137 b704          	ld	_memcpy$L+4,a
1759  0139 ae05          	ld	x,#high(L5601)
1760  013b bf02          	ld	_memcpy$L+2,x
1761  013d a605          	ld	a,#low(L5601)
1762  013f b703          	ld	_memcpy$L+3,a
1763  0141 a6ec          	ld	a,#_screenDisplayKeyCode$L-20
1764  0143 5f            	clr	x
1765  0144 cd0000        	call	_memcpy
1767                     ; 83 		formatNumberBinary(a_byKey,strString+9);
1769  0147 aef5          	ld	x,#high(_screenDisplayKeyCode$L-11)
1770  0149 bf02          	ld	_formatNumberBinary$L+2,x
1771  014b a6f5          	ld	a,#low(_screenDisplayKeyCode$L-11)
1772  014d b703          	ld	_formatNumberBinary$L+3,a
1773  014f b600          	ld	a,_screenDisplayKeyCode$L
1774  0151 5f            	clr	x
1775  0152 cd0000        	call	_formatNumberBinary
1777                     ; 84 		displayCmdToDisplay(strString);	
1779  0155 a6ec          	ld	a,#_screenDisplayKeyCode$L-20
1780  0157 5f            	clr	x
1781  0158 cd0000        	call	_displayCmdToDisplay
1783                     ; 85 		displayKeyPressedReset();
1785  015b cd0000        	call	_displayKeyPressedReset
1787  015e               L5501:
1788                     ; 88 }
1791  015e 81            	ret
1818                     ; 91 void screenUpdateCurrentScreen(void)
1818                     ; 92 {
1819                     	switch	.text
1820  015f               _screenUpdateCurrentScreen:
1823                     ; 93 	switch(parametersGetValue(PARAM_PAGE))
1825  015f a60e          	ld	a,#14
1826  0161 cd0000        	call	_parametersGetValue
1829                     ; 120 		default:
1829                     ; 121 			break;
1830  0164 5d            	tnz	x
1831  0165 2638          	jrne	L3111
1832  0167 a003          	sub	a,#3
1833  0169 271e          	jreq	L3701
1834  016b 4a            	dec	a
1835  016c 2706          	jreq	L7601
1836  016e a00f          	sub	a,#15
1837  0170 272a          	jreq	L5701
1838  0172 202b          	jra	L3111
1839  0174               L7601:
1840                     ; 95 		case PAGE_MAIN:
1840                     ; 96 			if (parametersGetValue(PARAM_ALARM) != PARAM_ALARM_OK)
1842  0174 a60d          	ld	a,#13
1843  0176 cd0000        	call	_parametersGetValue
1845  0179 4d            	tnz	a
1846  017a 2601          	jrne	L61
1847  017c 5d            	tnz	x
1848  017d               L61:
1849  017d 2704          	jreq	L5111
1850                     ; 98 				screenAlarm();
1852  017f ad55          	call	_screenAlarm
1855  0181 201c          	jra	L3111
1856  0183               L5111:
1857                     ; 102 				screenMain();
1859  0183 ad1b          	call	_screenMain
1861  0185 2018          	jra	L3111
1862  0187               L1701:
1863                     ; 105 		case PAGE_MESSAGE:
1863                     ; 106 			break;
1865  0187 2016          	jra	L3111
1866  0189               L3701:
1867                     ; 107 		case PAGE_ALARM:
1867                     ; 108 			if (parametersGetValue(PARAM_ALARM) != PARAM_ALARM_OK)
1869  0189 a60d          	ld	a,#13
1870  018b cd0000        	call	_parametersGetValue
1872  018e 4d            	tnz	a
1873  018f 2601          	jrne	L02
1874  0191 5d            	tnz	x
1875  0192               L02:
1876  0192 2704          	jreq	L1211
1877                     ; 110 				screenAlarm();
1879  0194 ad40          	call	_screenAlarm
1882  0196 2007          	jra	L3111
1883  0198               L1211:
1884                     ; 114 				screenMain();
1886  0198 ad06          	call	_screenMain
1888  019a 2003          	jra	L3111
1889  019c               L5701:
1890                     ; 117 		case PAGE_HISTORY_VALUE:
1890                     ; 118 			screenHistoricalValues();
1892  019c cd0fcf        	call	_screenHistoricalValues
1894                     ; 119 			break;
1896  019f               L7701:
1897                     ; 120 		default:
1897                     ; 121 			break;
1899  019f               L3111:
1900                     ; 123 }
1903  019f 81            	ret
1933                     ; 127 void screenMain(void)
1933                     ; 128 {
1934                     	switch	.text
1935  01a0               _screenMain:
1938                     ; 129 	windowMode();
1940  01a0 cd0000        	call	_windowMode
1942                     ; 130 	windowViscosityRef();
1944  01a3 cd0000        	call	_windowViscosityRef
1946                     ; 131 	windowViscosityReal();
1948  01a6 cd0000        	call	_windowViscosityReal
1950                     ; 132 	windowTemperature();	
1952  01a9 cd0000        	call	_windowTemperature
1954                     ; 133 	if (parametersGetValue(PARAM_ALARM) == PARAM_ALARM_OK)
1956  01ac a60d          	ld	a,#13
1957  01ae cd0000        	call	_parametersGetValue
1959  01b1 4d            	tnz	a
1960  01b2 2601          	jrne	L62
1961  01b4 5d            	tnz	x
1962  01b5               L62:
1963  01b5 2610          	jrne	L5311
1964                     ; 135 		windowMain();
1966  01b7 cd0000        	call	_windowMain
1968                     ; 136 		parametersSet(PARAM_PAGE, PAGE_MAIN);	
1970  01ba a604          	ld	a,#4
1971  01bc b702          	ld	_parametersSet$L+2,a
1972  01be 3f01          	clr	_parametersSet$L+1
1973  01c0 a60e          	ld	a,#14
1974  01c2 cd0000        	call	_parametersSet
1977  01c5 200e          	jra	L7311
1978  01c7               L5311:
1979                     ; 140 		windowAlarm();
1981  01c7 cd0000        	call	_windowAlarm
1983                     ; 141 		parametersSet(PARAM_PAGE, PAGE_ALARM);	
1985  01ca a603          	ld	a,#3
1986  01cc b702          	ld	_parametersSet$L+2,a
1987  01ce 3f01          	clr	_parametersSet$L+1
1988  01d0 a60e          	ld	a,#14
1989  01d2 cd0000        	call	_parametersSet
1991  01d5               L7311:
1992                     ; 143 }
1995  01d5 81            	ret
2023                     ; 146 void screenAlarm(void)
2023                     ; 147 {
2024                     	switch	.text
2025  01d6               _screenAlarm:
2028                     ; 148 	windowMode();
2030  01d6 cd0000        	call	_windowMode
2032                     ; 149 	windowViscosityRef();
2034  01d9 cd0000        	call	_windowViscosityRef
2036                     ; 150 	windowViscosityReal();
2038  01dc cd0000        	call	_windowViscosityReal
2040                     ; 151 	windowTemperature();
2042  01df cd0000        	call	_windowTemperature
2044                     ; 152 	windowAlarm();
2046  01e2 cd0000        	call	_windowAlarm
2048                     ; 153 	parametersSet(PARAM_PAGE, PAGE_ALARM);	
2050  01e5 a603          	ld	a,#3
2051  01e7 b702          	ld	_parametersSet$L+2,a
2052  01e9 3f01          	clr	_parametersSet$L+1
2053  01eb a60e          	ld	a,#14
2054  01ed cd0000        	call	_parametersSet
2056                     ; 154 }
2059  01f0 81            	ret
2105                     ; 157 void screenBigMessage(BYTE * a_strMessage1, BYTE * a_strMessage2)
2105                     ; 158 {
2106                     	switch	.text
2108                     	xref.b	_screenBigMessage$L
2109  01f1               _screenBigMessage:
2111  01f1 b701          	ld	_screenBigMessage$L+1,a
2112  01f3 bf00          	ld	_screenBigMessage$L,x
2114                     ; 159 	windowForceRepaint();	
2116  01f5 cd0000        	call	_windowForceRepaint
2118                     ; 160 	windowBigMessage(a_strMessage1, a_strMessage2);
2120  01f8 be02          	ld	x,_screenBigMessage$L+2
2121  01fa bf02          	ld	_windowBigMessage$L+2,x
2122  01fc b603          	ld	a,_screenBigMessage$L+3
2123  01fe b703          	ld	_windowBigMessage$L+3,a
2124  0200 b601          	ld	a,_screenBigMessage$L+1
2125  0202 be00          	ld	x,_screenBigMessage$L
2126  0204 cd0000        	call	_windowBigMessage
2128                     ; 161 }
2131  0207 81            	ret
2187                     ; 164 void screen6Menus(BYTE * a_byPage, BYTE * a_byGroup, BYTE * a_bySelected)
2187                     ; 165 {
2188                     	switch	.text
2190                     	xref.b	_screen6Menus$L
2191  0208               _screen6Menus:
2193  0208 b701          	ld	_screen6Menus$L+1,a
2194  020a bf00          	ld	_screen6Menus$L,x
2196                     ; 166 	window6Menu(a_byGroup, a_bySelected);
2198  020c be04          	ld	x,_screen6Menus$L+4
2199  020e bf02          	ld	_window6Menu$L+2,x
2200  0210 b605          	ld	a,_screen6Menus$L+5
2201  0212 b703          	ld	_window6Menu$L+3,a
2202  0214 b603          	ld	a,_screen6Menus$L+3
2203  0216 be02          	ld	x,_screen6Menus$L+2
2204  0218 cd0000        	call	_window6Menu
2206                     ; 167 	parametersSet(PARAM_PAGE, *a_byPage);	
2208  021b 92c600        	ld	a,[_screen6Menus$L.w]
2209  021e 5f            	clr	x
2210  021f b702          	ld	_parametersSet$L+2,a
2211  0221 bf01          	ld	_parametersSet$L+1,x
2212  0223 a60e          	ld	a,#14
2213  0225 cd0000        	call	_parametersSet
2215                     ; 168 }
2218  0228 81            	ret
2276                     ; 171 void screenValue(BYTE * a_byPage, BYTE * a_byKey)
2276                     ; 172 {
2277                     	switch	.text
2279                     	xref.b	_screenValue$L
2280  0229               _screenValue:
2282  0229 b701          	ld	_screenValue$L+1,a
2283  022b bf00          	ld	_screenValue$L,x
2285                     ; 173 	switch(* a_byPage)
2287  022d 92c600        	ld	a,[_screenValue$L.w]
2289                     ; 294 			break;
2290  0230 a0cc          	sub	a,#204
2291  0232 2603cc02b4    	jreq	L3221
2292  0237 4a            	dec	a
2293  0238 2757          	jreq	L1221
2294  023a a002          	sub	a,#2
2295  023c 2603          	jrne	L64
2296  023e cc030b        	jp	L1321
2297  0241               L64:
2298  0241 a002          	sub	a,#2
2299  0243 2603          	jrne	L05
2300  0245 cc02d7        	jp	L5221
2301  0248               L05:
2302  0248 4a            	dec	a
2303  0249 2603          	jrne	L25
2304  024b cc02f0        	jp	L7221
2305  024e               L25:
2306  024e 4a            	dec	a
2307  024f 2603          	jrne	L45
2308  0251 cc032a        	jp	L3321
2309  0254               L45:
2310  0254               L5321:
2311                     ; 225 		default:
2311                     ; 226 			if (parametersGetValue(PARAM_PAGE) != *a_byPage)
2313  0254 a60e          	ld	a,#14
2314  0256 cd0000        	call	_parametersGetValue
2316  0259 91ce00        	ld	y,[_screenValue$L.w]
2317  025c 3f00          	clr	c_y
2318  025e b300          	cp	x,c_y
2319  0260 2605          	jrne	L04
2320  0262 90bf01        	ld	c_y+1,y
2321  0265 b101          	cp	a,c_y+1
2322  0267               L04:
2323  0267 2603          	jrne	L65
2324  0269 cc03d3        	jp	L7131
2325  026c               L65:
2326                     ; 228 				m_woCurrentValue = 0x0000;
2328  026c 4f            	clr	a
2329  026d c7002b        	ld	_m_woCurrentValue,a
2330  0270 c7002c        	ld	_m_woCurrentValue+1,a
2331                     ; 229 				m_byValueChanged = false;
2333  0273 4f            	clr	a
2334  0274 c70029        	ld	_m_byValueChanged,a
2335                     ; 230 				switch(*a_byPage)
2337  0277 92c600        	ld	a,[_screenValue$L.w]
2339                     ; 255 						break;					
2340  027a a00e          	sub	a,#14
2341  027c 2603          	jrne	L06
2342  027e cc0348        	jp	L7321
2343  0281               L06:
2344  0281 4a            	dec	a
2345  0282 2603          	jrne	L26
2346  0284 cc0369        	jp	L1421
2347  0287               L26:
2348  0287 a003          	sub	a,#3
2349  0289 2603          	jrne	L46
2350  028b cc038a        	jp	L3421
2351  028e               L46:
2352  028e cc03c4        	jp	L3231
2353  0291               L1221:
2354                     ; 175 		case PAGE_EXECUTE_SAVE:
2354                     ; 176 			if (parametersSaveJob(m_woCurrentValue))
2356  0291 c6002c        	ld	a,_m_woCurrentValue+1
2357  0294 ce002b        	ld	x,_m_woCurrentValue
2358  0297 cd0000        	call	_parametersSaveJob
2360  029a 4d            	tnz	a
2361  029b 2707          	jreq	L7031
2362                     ; 178 				screenBigStdMessage(SCREEN_STD_MSG_CMD_DONE);
2364  029d a606          	ld	a,#6
2365  029f cd0871        	call	_screenBigStdMessage
2368  02a2 2005          	jra	L1131
2369  02a4               L7031:
2370                     ; 182 				screenBigStdMessage(SCREEN_STD_MSG_WRONG_MEMORY_SLOT);
2372  02a4 a60b          	ld	a,#11
2373  02a6 cd0871        	call	_screenBigStdMessage
2375  02a9               L1131:
2376                     ; 184 			sleepFix();
2378  02a9 cd0000        	call	_sleepFix
2380                     ; 185 			(* a_byPage) = PAGE_MAIN;		
2382  02ac a604          	ld	a,#4
2383  02ae 92c700        	ld	[_screenValue$L.w],a
2384                     ; 186 			break;
2386  02b1 cc04f5        	jp	L5031
2387  02b4               L3221:
2388                     ; 187 		case PAGE_EXECUTE_LOAD:
2388                     ; 188 			if (parametersLoadJob(m_woCurrentValue))
2390  02b4 c6002c        	ld	a,_m_woCurrentValue+1
2391  02b7 ce002b        	ld	x,_m_woCurrentValue
2392  02ba cd0000        	call	_parametersLoadJob
2394  02bd 4d            	tnz	a
2395  02be 2707          	jreq	L3131
2396                     ; 190 				screenBigStdMessage(SCREEN_STD_MSG_CMD_DONE);
2398  02c0 a606          	ld	a,#6
2399  02c2 cd0871        	call	_screenBigStdMessage
2402  02c5 2005          	jra	L5131
2403  02c7               L3131:
2404                     ; 194 				screenBigStdMessage(SCREEN_STD_MSG_WRONG_MEMORY_SLOT);
2406  02c7 a60b          	ld	a,#11
2407  02c9 cd0871        	call	_screenBigStdMessage
2409  02cc               L5131:
2410                     ; 196 			sleepFix();
2412  02cc cd0000        	call	_sleepFix
2414                     ; 197 			(* a_byPage) = PAGE_MAIN;		
2416  02cf a604          	ld	a,#4
2417  02d1 92c700        	ld	[_screenValue$L.w],a
2418                     ; 198 			break;
2420  02d4 cc04f5        	jp	L5031
2421  02d7               L5221:
2422                     ; 199 		case PAGE_EXECUTE_CUP_01:
2422                     ; 200 			parametersSet(PARAM_CUP, PARAM_CUP_FORD_4);
2424  02d7 3f01          	clr	_parametersSet$L+1
2425  02d9 3f02          	clr	_parametersSet$L+2
2426  02db a62b          	ld	a,#43
2427  02dd cd0000        	call	_parametersSet
2429                     ; 201 			screenBigStdMessage(SCREEN_STD_MSG_CMD_DONE);
2431  02e0 a606          	ld	a,#6
2432  02e2 cd0871        	call	_screenBigStdMessage
2434                     ; 202 			sleepFix();
2436  02e5 cd0000        	call	_sleepFix
2438                     ; 203 			(* a_byPage) = PAGE_MAIN;		
2440  02e8 a604          	ld	a,#4
2441  02ea 92c700        	ld	[_screenValue$L.w],a
2442                     ; 204 			break;
2444  02ed cc04f5        	jp	L5031
2445  02f0               L7221:
2446                     ; 205 		case PAGE_EXECUTE_CUP_02:
2446                     ; 206 			parametersSet(PARAM_CUP, PARAM_CUP_ZHAN_2);
2448  02f0 a601          	ld	a,#1
2449  02f2 b702          	ld	_parametersSet$L+2,a
2450  02f4 3f01          	clr	_parametersSet$L+1
2451  02f6 a62b          	ld	a,#43
2452  02f8 cd0000        	call	_parametersSet
2454                     ; 207 			screenBigStdMessage(SCREEN_STD_MSG_CMD_DONE);
2456  02fb a606          	ld	a,#6
2457  02fd cd0871        	call	_screenBigStdMessage
2459                     ; 208 			sleepFix();
2461  0300 cd0000        	call	_sleepFix
2463                     ; 209 			(* a_byPage) = PAGE_MAIN;		
2465  0303 a604          	ld	a,#4
2466  0305 92c700        	ld	[_screenValue$L.w],a
2467                     ; 210 			break;
2469  0308 cc04f5        	jp	L5031
2470  030b               L1321:
2471                     ; 211 		case PAGE_EXECUTE_CALIBRATION:
2471                     ; 212 			parametersSet(PARAM_CALIBRATION_VALUE, m_woCurrentValue);
2473  030b ce002b        	ld	x,_m_woCurrentValue
2474  030e bf01          	ld	_parametersSet$L+1,x
2475  0310 c6002c        	ld	a,_m_woCurrentValue+1
2476  0313 b702          	ld	_parametersSet$L+2,a
2477  0315 a604          	ld	a,#4
2478  0317 cd0000        	call	_parametersSet
2480                     ; 213 			screenBigStdMessage(SCREEN_STD_MSG_CMD_DONE);
2482  031a a606          	ld	a,#6
2483  031c cd0871        	call	_screenBigStdMessage
2485                     ; 214 			sleepFix();
2487  031f cd0000        	call	_sleepFix
2489                     ; 215 			(* a_byPage) = PAGE_EXECUTE_CALIBRATION_2;		
2491  0322 a6d0          	ld	a,#208
2492  0324 92c700        	ld	[_screenValue$L.w],a
2493                     ; 216 			break;
2495  0327 cc04f5        	jp	L5031
2496  032a               L3321:
2497                     ; 217 		case PAGE_EXECUTE_RESET_CALIBRATION:
2497                     ; 218 			parametersSet(PARAM_VISCO_OFFSET, parametersGetValue(PARAM_VISCO_OFFSET_FACTORY));
2499  032a a62d          	ld	a,#45
2500  032c cd0000        	call	_parametersGetValue
2502  032f b702          	ld	_parametersSet$L+2,a
2503  0331 bf01          	ld	_parametersSet$L+1,x
2504  0333 a626          	ld	a,#38
2505  0335 cd0000        	call	_parametersSet
2507                     ; 220 			screenBigStdMessage(SCREEN_STD_MSG_CMD_DONE);
2509  0338 a606          	ld	a,#6
2510  033a cd0871        	call	_screenBigStdMessage
2512                     ; 221 			sleepFix();
2514  033d cd0000        	call	_sleepFix
2516                     ; 222 			(* a_byPage) = PAGE_MAIN;		
2518  0340 a604          	ld	a,#4
2519  0342 92c700        	ld	[_screenValue$L.w],a
2520                     ; 223 			break;		
2522  0345 cc04f5        	jp	L5031
2523  0348               L7321:
2524                     ; 232 					case PAGE_ARCHIVE_SAVE:
2524                     ; 233 						m_byDecimal = 0;
2526  0348 4f            	clr	a
2527  0349 c70000        	ld	_m_byDecimal,a
2528                     ; 234 						screenPrepareStdMessage(SCREEN_STD_MSG_SAVE_JOB);
2530  034c a60a          	ld	a,#10
2531  034e cd0ea2        	call	_screenPrepareStdMessage
2533                     ; 235 						formatNumber(0, 5, m_byDecimal, m_strString2);
2535  0351 ae01          	ld	x,#high(_m_strString2)
2536  0353 bf04          	ld	_formatNumber$L+4,x
2537  0355 a601          	ld	a,#low(_m_strString2)
2538  0357 b705          	ld	_formatNumber$L+5,a
2539  0359 c60000        	ld	a,_m_byDecimal
2540  035c b703          	ld	_formatNumber$L+3,a
2541  035e a605          	ld	a,#5
2542  0360 b702          	ld	_formatNumber$L+2,a
2543  0362 5f            	clr	x
2544  0363 4f            	clr	a
2545  0364 cd0000        	call	_formatNumber
2547                     ; 236 						break;
2549  0367 205b          	jra	L3231
2550  0369               L1421:
2551                     ; 237 					case PAGE_ARCHIVE_LOAD:
2551                     ; 238 						m_byDecimal = 0;
2553  0369 4f            	clr	a
2554  036a c70000        	ld	_m_byDecimal,a
2555                     ; 239 						screenPrepareStdMessage(SCREEN_STD_MSG_LOAD_JOB);
2557  036d a609          	ld	a,#9
2558  036f cd0ea2        	call	_screenPrepareStdMessage
2560                     ; 240 						formatNumber(0, 5, m_byDecimal, m_strString2);
2562  0372 ae01          	ld	x,#high(_m_strString2)
2563  0374 bf04          	ld	_formatNumber$L+4,x
2564  0376 a601          	ld	a,#low(_m_strString2)
2565  0378 b705          	ld	_formatNumber$L+5,a
2566  037a c60000        	ld	a,_m_byDecimal
2567  037d b703          	ld	_formatNumber$L+3,a
2568  037f a605          	ld	a,#5
2569  0381 b702          	ld	_formatNumber$L+2,a
2570  0383 5f            	clr	x
2571  0384 4f            	clr	a
2572  0385 cd0000        	call	_formatNumber
2574                     ; 241 						break;
2576  0388 203a          	jra	L3231
2577  038a               L3421:
2578                     ; 242 					case PAGE_CALIBRATION:
2578                     ; 243 						if (parametersGetValue(PARAM_SHOW_CALIBRATION) == 0) 
2580  038a a62c          	ld	a,#44
2581  038c cd0000        	call	_parametersGetValue
2583  038f 4d            	tnz	a
2584  0390 2601          	jrne	L24
2585  0392 5d            	tnz	x
2586  0393               L24:
2587  0393 2622          	jrne	L5231
2588                     ; 245 							m_byDecimal = 1;
2590  0395 a601          	ld	a,#1
2591  0397 c70000        	ld	_m_byDecimal,a
2592                     ; 246 							screenPrepareStdMessage(SCREEN_STD_MSG_CALIBRATION);
2594  039a a603          	ld	a,#3
2595  039c cd0ea2        	call	_screenPrepareStdMessage
2597                     ; 247 							formatNumber(0, 5, m_byDecimal, m_strString2);
2599  039f ae01          	ld	x,#high(_m_strString2)
2600  03a1 bf04          	ld	_formatNumber$L+4,x
2601  03a3 a601          	ld	a,#low(_m_strString2)
2602  03a5 b705          	ld	_formatNumber$L+5,a
2603  03a7 c60000        	ld	a,_m_byDecimal
2604  03aa b703          	ld	_formatNumber$L+3,a
2605  03ac a605          	ld	a,#5
2606  03ae b702          	ld	_formatNumber$L+2,a
2607  03b0 5f            	clr	x
2608  03b1 4f            	clr	a
2609  03b2 cd0000        	call	_formatNumber
2612  03b5 200d          	jra	L3231
2613  03b7               L5231:
2614                     ; 251 							screenBigStdMessage(SCREEN_STD_MSG_CMD_NA);
2616  03b7 a60d          	ld	a,#13
2617  03b9 cd0871        	call	_screenBigStdMessage
2619                     ; 252 							sleepFix();
2621  03bc cd0000        	call	_sleepFix
2623                     ; 253 							(* a_byPage) = PAGE_MAIN;									
2625  03bf a604          	ld	a,#4
2626  03c1 92c700        	ld	[_screenValue$L.w],a
2627  03c4               L3231:
2628                     ; 257 				parametersSet(PARAM_PAGE, *a_byPage);	
2630  03c4 92c600        	ld	a,[_screenValue$L.w]
2631  03c7 5f            	clr	x
2632  03c8 b702          	ld	_parametersSet$L+2,a
2633  03ca bf01          	ld	_parametersSet$L+1,x
2634  03cc a60e          	ld	a,#14
2635  03ce cd0000        	call	_parametersSet
2638  03d1 204d          	jra	L1331
2639  03d3               L7131:
2640                     ; 261 				switch((BYTE) (*a_byKey))
2642  03d3 92c602        	ld	a,[_screenValue$L+2.w]
2644                     ; 288 					default:
2644                     ; 289 						break;
2645  03d6 a008          	sub	a,#8
2646  03d8 2717          	jreq	L5421
2647  03da 4a            	dec	a
2648  03db 2755          	jreq	L7421
2649  03dd 4a            	dec	a
2650  03de 2603          	jrne	L66
2651  03e0 cc0463        	jp	L1521
2652  03e3               L66:
2653  03e3 4a            	dec	a
2654  03e4 2603          	jrne	L07
2655  03e6 cc0494        	jp	L3521
2656  03e9               L07:
2657  03e9 4a            	dec	a
2658  03ea 2603          	jrne	L27
2659  03ec cc04c6        	jp	L5521
2660  03ef               L27:
2661  03ef 202f          	jra	L1331
2662  03f1               L5421:
2663                     ; 263 					case KEY_ARROW_UP:
2663                     ; 264 						m_byValueChanged = true;
2665  03f1 a601          	ld	a,#1
2666  03f3 c70029        	ld	_m_byValueChanged,a
2667                     ; 265 						m_woCurrentValue = m_woCurrentValue+1;
2669  03f6 c6002c        	ld	a,_m_woCurrentValue+1
2670  03f9 ab01          	add	a,#1
2671  03fb c7002c        	ld	_m_woCurrentValue+1,a
2672  03fe c6002b        	ld	a,_m_woCurrentValue
2673  0401 a900          	adc	a,#0
2674  0403 c7002b        	ld	_m_woCurrentValue,a
2675                     ; 266 						formatNumber(m_woCurrentValue, 5, m_byDecimal, m_strString2);
2677  0406 ae01          	ld	x,#high(_m_strString2)
2678  0408 bf04          	ld	_formatNumber$L+4,x
2679  040a a601          	ld	a,#low(_m_strString2)
2680  040c b705          	ld	_formatNumber$L+5,a
2681  040e c60000        	ld	a,_m_byDecimal
2682  0411 b703          	ld	_formatNumber$L+3,a
2683  0413 a605          	ld	a,#5
2684  0415 b702          	ld	_formatNumber$L+2,a
2685  0417 c6002c        	ld	a,_m_woCurrentValue+1
2686  041a ce002b        	ld	x,_m_woCurrentValue
2687  041d cd0000        	call	_formatNumber
2689                     ; 267 						break;
2690  0420               L1331:
2691                     ; 293 			screenBigMessage(m_strString1, m_strString2);
2693  0420 ae01          	ld	x,#high(_m_strString2)
2694  0422 bf02          	ld	_screenBigMessage$L+2,x
2695  0424 a601          	ld	a,#low(_m_strString2)
2696  0426 b703          	ld	_screenBigMessage$L+3,a
2697  0428 a615          	ld	a,#low(_m_strString1)
2698  042a ae15          	ld	x,#high(_m_strString1)
2699  042c cd01f1        	call	_screenBigMessage
2701                     ; 294 			break;
2703  042f cc04f5        	jp	L5031
2704  0432               L7421:
2705                     ; 268 					case KEY_ARROW_DOWN:
2705                     ; 269 						m_byValueChanged = true;
2707  0432 a601          	ld	a,#1
2708  0434 c70029        	ld	_m_byValueChanged,a
2709                     ; 270 						m_woCurrentValue = m_woCurrentValue-1;
2711  0437 c6002c        	ld	a,_m_woCurrentValue+1
2712  043a 2607          	jrne	L44
2713  043c ce002b        	ld	x,_m_woCurrentValue
2714  043f 5a            	dec	x
2715  0440 cf002b        	ld	_m_woCurrentValue,x
2716  0443               L44:
2717  0443 4a            	dec	a
2718  0444 c7002c        	ld	_m_woCurrentValue+1,a
2719                     ; 271 						formatNumber(m_woCurrentValue, 5, m_byDecimal, m_strString2);
2721  0447 ae01          	ld	x,#high(_m_strString2)
2722  0449 bf04          	ld	_formatNumber$L+4,x
2723  044b a601          	ld	a,#low(_m_strString2)
2724  044d b705          	ld	_formatNumber$L+5,a
2725  044f c60000        	ld	a,_m_byDecimal
2726  0452 b703          	ld	_formatNumber$L+3,a
2727  0454 a605          	ld	a,#5
2728  0456 b702          	ld	_formatNumber$L+2,a
2729  0458 c6002c        	ld	a,_m_woCurrentValue+1
2730  045b ce002b        	ld	x,_m_woCurrentValue
2731  045e cd0000        	call	_formatNumber
2733                     ; 272 						break;
2735  0461 20bd          	jra	L1331
2736  0463               L1521:
2737                     ; 273 					case KEY_ARROW_UP_F:
2737                     ; 274 						m_byValueChanged = true;
2739  0463 a601          	ld	a,#1
2740  0465 c70029        	ld	_m_byValueChanged,a
2741                     ; 275 						m_woCurrentValue = m_woCurrentValue+10;
2743  0468 c6002c        	ld	a,_m_woCurrentValue+1
2744  046b ab0a          	add	a,#10
2745  046d c7002c        	ld	_m_woCurrentValue+1,a
2746  0470 c6002b        	ld	a,_m_woCurrentValue
2747  0473 a900          	adc	a,#0
2748  0475 c7002b        	ld	_m_woCurrentValue,a
2749                     ; 276 						formatNumber(m_woCurrentValue, 5, m_byDecimal, m_strString2);
2751  0478 ae01          	ld	x,#high(_m_strString2)
2752  047a bf04          	ld	_formatNumber$L+4,x
2753  047c a601          	ld	a,#low(_m_strString2)
2754  047e b705          	ld	_formatNumber$L+5,a
2755  0480 c60000        	ld	a,_m_byDecimal
2756  0483 b703          	ld	_formatNumber$L+3,a
2757  0485 a605          	ld	a,#5
2758  0487 b702          	ld	_formatNumber$L+2,a
2759  0489 c6002c        	ld	a,_m_woCurrentValue+1
2760  048c ce002b        	ld	x,_m_woCurrentValue
2761  048f cd0000        	call	_formatNumber
2763                     ; 277 						break;
2765  0492 208c          	jra	L1331
2766  0494               L3521:
2767                     ; 278 					case KEY_ARROW_DOWN_F:
2767                     ; 279 						m_byValueChanged = true;
2769  0494 a601          	ld	a,#1
2770  0496 c70029        	ld	_m_byValueChanged,a
2771                     ; 280 						m_woCurrentValue = m_woCurrentValue-10;
2773  0499 c6002c        	ld	a,_m_woCurrentValue+1
2774  049c a00a          	sub	a,#10
2775  049e c7002c        	ld	_m_woCurrentValue+1,a
2776  04a1 c6002b        	ld	a,_m_woCurrentValue
2777  04a4 a200          	sbc	a,#0
2778  04a6 c7002b        	ld	_m_woCurrentValue,a
2779                     ; 281 						formatNumber(m_woCurrentValue, 5, m_byDecimal, m_strString2);
2781  04a9 ae01          	ld	x,#high(_m_strString2)
2782  04ab bf04          	ld	_formatNumber$L+4,x
2783  04ad a601          	ld	a,#low(_m_strString2)
2784  04af b705          	ld	_formatNumber$L+5,a
2785  04b1 c60000        	ld	a,_m_byDecimal
2786  04b4 b703          	ld	_formatNumber$L+3,a
2787  04b6 a605          	ld	a,#5
2788  04b8 b702          	ld	_formatNumber$L+2,a
2789  04ba c6002c        	ld	a,_m_woCurrentValue+1
2790  04bd ce002b        	ld	x,_m_woCurrentValue
2791  04c0 cd0000        	call	_formatNumber
2793                     ; 282 						break;
2795  04c3 cc0420        	jp	L1331
2796  04c6               L5521:
2797                     ; 283 					case KEY_FUNCTION:
2797                     ; 284 						m_byValueChanged = true;
2799  04c6 a601          	ld	a,#1
2800  04c8 c70029        	ld	_m_byValueChanged,a
2801                     ; 285 						m_woCurrentValue = 0x0000;
2803  04cb 4f            	clr	a
2804  04cc c7002b        	ld	_m_woCurrentValue,a
2805  04cf c7002c        	ld	_m_woCurrentValue+1,a
2806                     ; 286 						formatNumber(m_woCurrentValue, 5, m_byDecimal, m_strString2);
2808  04d2 ae01          	ld	x,#high(_m_strString2)
2809  04d4 bf04          	ld	_formatNumber$L+4,x
2810  04d6 a601          	ld	a,#low(_m_strString2)
2811  04d8 b705          	ld	_formatNumber$L+5,a
2812  04da c60000        	ld	a,_m_byDecimal
2813  04dd b703          	ld	_formatNumber$L+3,a
2814  04df a605          	ld	a,#5
2815  04e1 b702          	ld	_formatNumber$L+2,a
2816  04e3 c6002c        	ld	a,_m_woCurrentValue+1
2817  04e6 ce002b        	ld	x,_m_woCurrentValue
2818  04e9 cd0000        	call	_formatNumber
2820                     ; 287 						break;
2822  04ec cc0420        	jp	L1331
2823  04ef               L7521:
2824                     ; 288 					default:
2824                     ; 289 						break;
2826  04ef cc0420        	jp	L1331
2827  04f2               L5331:
2828  04f2 cc0420        	jp	L1331
2829  04f5               L5031:
2830                     ; 296 }
2833  04f5 81            	ret
2891                     ; 299 void screenSetUpParameter(BYTE a_byKey, BYTE a_bySetupFull)
2891                     ; 300 {
2892                     	switch	.text
2894                     	xref.b	_screenSetUpParameter$L
2895  04f6               _screenSetUpParameter:
2897  04f6 b701          	ld	_screenSetUpParameter$L+1,a
2898  04f8 bf00          	ld	_screenSetUpParameter$L,x
2900                     ; 301 	parametersSet(PARAM_VISUAL_SETUP_FULL, a_bySetupFull);
2902  04fa 5f            	clr	x
2903  04fb b702          	ld	_parametersSet$L+2,a
2904  04fd bf01          	ld	_parametersSet$L+1,x
2905  04ff a612          	ld	a,#18
2906  0501 cd0000        	call	_parametersSet
2908                     ; 303 	if (parametersGetValue(PARAM_PAGE) == PAGE_SETUP_FULL)
2910  0504 a60e          	ld	a,#14
2911  0506 cd0000        	call	_parametersGetValue
2913  0509 a116          	cp	a,#22
2914  050b 2602          	jrne	L67
2915  050d a300          	cp	x,#0
2916  050f               L67:
2917  050f 2642          	jrne	L5041
2918                     ; 305 		parametersInitVisibleFlags();
2920  0511 cd0000        	call	_parametersInitVisibleFlags
2922                     ; 306 		parametersSet(PARAM_PAGE_SEL, 0);	
2924  0514 3f01          	clr	_parametersSet$L+1
2925  0516 3f02          	clr	_parametersSet$L+2
2926  0518 a60f          	ld	a,#15
2927  051a cd0000        	call	_parametersSet
2929                     ; 307 		m_bySelectedMenu = windowSetupParameter(parametersGetValue(PARAM_PAGE_SEL), 0xFFFF);
2931  051d aeff          	ld	x,#255
2932  051f bf01          	ld	_windowSetupParameter$L+1,x
2933  0521 a6ff          	ld	a,#255
2934  0523 b702          	ld	_windowSetupParameter$L+2,a
2935  0525 a60f          	ld	a,#15
2936  0527 cd0000        	call	_parametersGetValue
2938  052a cd0000        	call	_windowSetupParameter
2940  052d c7002a        	ld	_m_bySelectedMenu,a
2941                     ; 308 		m_woCurrentValue = parametersGetValue(m_bySelectedMenu);
2943  0530 c6002a        	ld	a,_m_bySelectedMenu
2944  0533 cd0000        	call	_parametersGetValue
2946  0536 c7002c        	ld	_m_woCurrentValue+1,a
2947  0539 cf002b        	ld	_m_woCurrentValue,x
2948                     ; 309 		m_byValueChanged = false;
2950  053c 4f            	clr	a
2951  053d c70029        	ld	_m_byValueChanged,a
2952                     ; 310 		parametersSet(PARAM_PAGE, PAGE_SETUP);
2954  0540 a605          	ld	a,#5
2955  0542 b702          	ld	_parametersSet$L+2,a
2956  0544 3f01          	clr	_parametersSet$L+1
2957  0546 a60e          	ld	a,#14
2958  0548 cd0000        	call	_parametersSet
2960                     ; 311 		parametersChangedFlagReset(PARAM_PAGE_SEL);		
2962  054b a60f          	ld	a,#15
2963  054d cd0000        	call	_parametersChangedFlagReset
2966  0550 cc0730        	jp	L7041
2967  0553               L5041:
2968                     ; 313 	else if (parametersGetValue(PARAM_PAGE) != PAGE_SETUP)
2970  0553 a60e          	ld	a,#14
2971  0555 cd0000        	call	_parametersGetValue
2973  0558 a105          	cp	a,#5
2974  055a 2602          	jrne	L001
2975  055c a300          	cp	x,#0
2976  055e               L001:
2977  055e 274b          	jreq	L1141
2978                     ; 315 		if(a_bySetupFull) 
2980  0560 3d01          	tnz	_screenSetUpParameter$L+1
2981  0562 2705          	jreq	L3141
2982                     ; 317 			parametersInitVisibleFlags();
2984  0564 cd0000        	call	_parametersInitVisibleFlags
2987  0567 2003          	jra	L5141
2988  0569               L3141:
2989                     ; 321 			parametersInitVisibleFlagsSimple();
2991  0569 cd0000        	call	_parametersInitVisibleFlagsSimple
2993  056c               L5141:
2994                     ; 323 		parametersSet(PARAM_PAGE_SEL, 0);	
2996  056c 3f01          	clr	_parametersSet$L+1
2997  056e 3f02          	clr	_parametersSet$L+2
2998  0570 a60f          	ld	a,#15
2999  0572 cd0000        	call	_parametersSet
3001                     ; 324 		m_bySelectedMenu = windowSetupParameter(parametersGetValue(PARAM_PAGE_SEL), 0xFFFF);
3003  0575 aeff          	ld	x,#255
3004  0577 bf01          	ld	_windowSetupParameter$L+1,x
3005  0579 a6ff          	ld	a,#255
3006  057b b702          	ld	_windowSetupParameter$L+2,a
3007  057d a60f          	ld	a,#15
3008  057f cd0000        	call	_parametersGetValue
3010  0582 cd0000        	call	_windowSetupParameter
3012  0585 c7002a        	ld	_m_bySelectedMenu,a
3013                     ; 325 		m_woCurrentValue = parametersGetValue(m_bySelectedMenu);
3015  0588 c6002a        	ld	a,_m_bySelectedMenu
3016  058b cd0000        	call	_parametersGetValue
3018  058e c7002c        	ld	_m_woCurrentValue+1,a
3019  0591 cf002b        	ld	_m_woCurrentValue,x
3020                     ; 326 		m_byValueChanged = false;
3022  0594 4f            	clr	a
3023  0595 c70029        	ld	_m_byValueChanged,a
3024                     ; 327 		parametersSet(PARAM_PAGE, PAGE_SETUP);
3026  0598 a605          	ld	a,#5
3027  059a b702          	ld	_parametersSet$L+2,a
3028  059c 3f01          	clr	_parametersSet$L+1
3029  059e a60e          	ld	a,#14
3030  05a0 cd0000        	call	_parametersSet
3032                     ; 328 		parametersChangedFlagReset(PARAM_PAGE_SEL);		
3034  05a3 a60f          	ld	a,#15
3035  05a5 cd0000        	call	_parametersChangedFlagReset
3038  05a8 cc0730        	jp	L7041
3039  05ab               L1141:
3040                     ; 332 		switch(a_byKey)
3042  05ab b600          	ld	a,_screenSetUpParameter$L
3044                     ; 422 			default:
3044                     ; 423 				break;
3045  05ad 4d            	tnz	a
3046  05ae 2603          	jrne	L411
3047  05b0 cc06bc        	jp	L5431
3048  05b3               L411:
3049  05b3 4a            	dec	a
3050  05b4 2603          	jrne	L611
3051  05b6 cc068c        	jp	L3431
3052  05b9               L611:
3053  05b9 4a            	dec	a
3054  05ba 2603          	jrne	L021
3055  05bc cc0642        	jp	L1431
3056  05bf               L021:
3057  05bf 4a            	dec	a
3058  05c0 2722          	jreq	L7331
3059  05c2 a005          	sub	a,#5
3060  05c4 2603          	jrne	L221
3061  05c6 cc0731        	jp	L7431
3062  05c9               L221:
3063  05c9 4a            	dec	a
3064  05ca 2603          	jrne	L421
3065  05cc cc075d        	jp	L1531
3066  05cf               L421:
3067  05cf 4a            	dec	a
3068  05d0 2603          	jrne	L621
3069  05d2 cc0789        	jp	L3531
3070  05d5               L621:
3071  05d5 4a            	dec	a
3072  05d6 2603          	jrne	L031
3073  05d8 cc07b6        	jp	L5531
3074  05db               L031:
3075  05db 4a            	dec	a
3076  05dc 2603          	jrne	L231
3077  05de cc07e3        	jp	L7531
3078  05e1               L231:
3079  05e1 cc0730        	jp	L7041
3080  05e4               L7331:
3081                     ; 334 			case KEY_ARCHIVE:
3081                     ; 335 				if (parametersGetValue(PARAM_PAGE_SEL)>0)
3083  05e4 a60f          	ld	a,#15
3084  05e6 cd0000        	call	_parametersGetValue
3086  05e9 4d            	tnz	a
3087  05ea 2601          	jrne	L201
3088  05ec 5d            	tnz	x
3089  05ed               L201:
3090  05ed 2715          	jreq	L5241
3091                     ; 337 					parametersSet(PARAM_PAGE_SEL, parametersGetValue(PARAM_PAGE_SEL)-1);
3093  05ef a60f          	ld	a,#15
3094  05f1 cd0000        	call	_parametersGetValue
3096  05f4 4d            	tnz	a
3097  05f5 2601          	jrne	L401
3098  05f7 5a            	dec	x
3099  05f8               L401:
3100  05f8 4a            	dec	a
3101  05f9 b702          	ld	_parametersSet$L+2,a
3102  05fb bf01          	ld	_parametersSet$L+1,x
3103  05fd a60f          	ld	a,#15
3104  05ff cd0000        	call	_parametersSet
3107  0602 2013          	jra	L7241
3108  0604               L5241:
3109                     ; 341 					parametersSet(PARAM_PAGE_SEL, (PARAMETER_NUMBER-PARAMETER_SETUP_INITIAL_INDEX) + parametersGetValue(PARAM_PAGE_SEL)-1);
3111  0604 a60f          	ld	a,#15
3112  0606 cd0000        	call	_parametersGetValue
3114  0609 ab1a          	add	a,#26
3115  060b 2401          	jrnc	L601
3116  060d 5c            	inc	x
3117  060e               L601:
3118  060e b702          	ld	_parametersSet$L+2,a
3119  0610 bf01          	ld	_parametersSet$L+1,x
3120  0612 a60f          	ld	a,#15
3121  0614 cd0000        	call	_parametersSet
3123  0617               L7241:
3124                     ; 343 				m_bySelectedMenu = windowSetupParameter(parametersGetValue(PARAM_PAGE_SEL), 0xFFFF);
3126  0617 aeff          	ld	x,#255
3127  0619 bf01          	ld	_windowSetupParameter$L+1,x
3128  061b a6ff          	ld	a,#255
3129  061d b702          	ld	_windowSetupParameter$L+2,a
3130  061f a60f          	ld	a,#15
3131  0621 cd0000        	call	_parametersGetValue
3133  0624 cd0000        	call	_windowSetupParameter
3135  0627 c7002a        	ld	_m_bySelectedMenu,a
3136                     ; 344 				m_woCurrentValue = parametersGetValue(m_bySelectedMenu);
3138  062a c6002a        	ld	a,_m_bySelectedMenu
3139  062d cd0000        	call	_parametersGetValue
3141  0630 c7002c        	ld	_m_woCurrentValue+1,a
3142  0633 cf002b        	ld	_m_woCurrentValue,x
3143                     ; 345 				parametersChangedFlagReset(PARAM_PAGE_SEL);	
3145  0636 a60f          	ld	a,#15
3146  0638 cd0000        	call	_parametersChangedFlagReset
3148                     ; 346 				m_byValueChanged = false;				
3150  063b 4f            	clr	a
3151  063c c70029        	ld	_m_byValueChanged,a
3152                     ; 347 				break;
3154  063f cc0730        	jp	L7041
3155  0642               L1431:
3156                     ; 349 			case KEY_MENU:
3156                     ; 350 				if (m_byValueChanged)
3158  0642 c60029        	ld	a,_m_byValueChanged
3159  0645 4d            	tnz	a
3160  0646 270b          	jreq	L1341
3161                     ; 352 					m_byValueChanged = false;
3163  0648 4f            	clr	a
3164  0649 c70029        	ld	_m_byValueChanged,a
3165                     ; 353 					m_woCurrentValue = 0x0000;
3167  064c 4f            	clr	a
3168  064d c7002b        	ld	_m_woCurrentValue,a
3169  0650 c7002c        	ld	_m_woCurrentValue+1,a
3170  0653               L1341:
3171                     ; 356 				parametersSet(PARAM_PAGE_SEL, parametersGetValue(PARAM_PAGE_SEL)+1);		
3173  0653 a60f          	ld	a,#15
3174  0655 cd0000        	call	_parametersGetValue
3176  0658 4c            	inc	a
3177  0659 2601          	jrne	L011
3178  065b 5c            	inc	x
3179  065c               L011:
3180  065c b702          	ld	_parametersSet$L+2,a
3181  065e bf01          	ld	_parametersSet$L+1,x
3182  0660 a60f          	ld	a,#15
3183  0662 cd0000        	call	_parametersSet
3185                     ; 357 				m_bySelectedMenu = windowSetupParameter(parametersGetValue(PARAM_PAGE_SEL), 0xFFFF);
3187  0665 aeff          	ld	x,#255
3188  0667 bf01          	ld	_windowSetupParameter$L+1,x
3189  0669 a6ff          	ld	a,#255
3190  066b b702          	ld	_windowSetupParameter$L+2,a
3191  066d a60f          	ld	a,#15
3192  066f cd0000        	call	_parametersGetValue
3194  0672 cd0000        	call	_windowSetupParameter
3196  0675 c7002a        	ld	_m_bySelectedMenu,a
3197                     ; 358 				m_woCurrentValue = parametersGetValue(m_bySelectedMenu);
3199  0678 c6002a        	ld	a,_m_bySelectedMenu
3200  067b cd0000        	call	_parametersGetValue
3202  067e c7002c        	ld	_m_woCurrentValue+1,a
3203  0681 cf002b        	ld	_m_woCurrentValue,x
3204                     ; 359 				parametersChangedFlagReset(PARAM_PAGE_SEL);				
3206  0684 a60f          	ld	a,#15
3207  0686 cd0000        	call	_parametersChangedFlagReset
3209                     ; 360 				break;
3211  0689 cc0730        	jp	L7041
3212  068c               L3431:
3213                     ; 361 			case KEY_CANCEL:
3213                     ; 362 				if (m_byValueChanged)
3215  068c c60029        	ld	a,_m_byValueChanged
3216  068f 4d            	tnz	a
3217  0690 2725          	jreq	L3341
3218                     ; 364 					m_byValueChanged = false;
3220  0692 4f            	clr	a
3221  0693 c70029        	ld	_m_byValueChanged,a
3222                     ; 365 					m_bySelectedMenu = windowSetupParameter(parametersGetValue(PARAM_PAGE_SEL), 0xFFFF);
3224  0696 aeff          	ld	x,#255
3225  0698 bf01          	ld	_windowSetupParameter$L+1,x
3226  069a a6ff          	ld	a,#255
3227  069c b702          	ld	_windowSetupParameter$L+2,a
3228  069e a60f          	ld	a,#15
3229  06a0 cd0000        	call	_parametersGetValue
3231  06a3 cd0000        	call	_windowSetupParameter
3233  06a6 c7002a        	ld	_m_bySelectedMenu,a
3234                     ; 366 					m_woCurrentValue = parametersGetValue(m_bySelectedMenu);
3236  06a9 c6002a        	ld	a,_m_bySelectedMenu
3237  06ac cd0000        	call	_parametersGetValue
3239  06af c7002c        	ld	_m_woCurrentValue+1,a
3240  06b2 cf002b        	ld	_m_woCurrentValue,x
3242  06b5 2079          	jra	L7041
3243  06b7               L3341:
3244                     ; 370 					screenMain();
3246  06b7 cd01a0        	call	_screenMain
3248  06ba 2074          	jra	L7041
3249  06bc               L5431:
3250                     ; 373 			case KEY_OK:
3250                     ; 374 				if (m_byValueChanged)
3252  06bc c60029        	ld	a,_m_byValueChanged
3253  06bf 4d            	tnz	a
3254  06c0 276b          	jreq	L7341
3255                     ; 376 					if(parametersSet(m_bySelectedMenu, m_woCurrentValue))
3257  06c2 ce002b        	ld	x,_m_woCurrentValue
3258  06c5 bf01          	ld	_parametersSet$L+1,x
3259  06c7 c6002c        	ld	a,_m_woCurrentValue+1
3260  06ca b702          	ld	_parametersSet$L+2,a
3261  06cc c6002a        	ld	a,_m_bySelectedMenu
3262  06cf cd0000        	call	_parametersSet
3264  06d2 4d            	tnz	a
3265  06d3 2720          	jreq	L1441
3266                     ; 378 						memcpy(m_strString1, parametersGetLabel(m_bySelectedMenu), 20); 
3268  06d5 a614          	ld	a,#20
3269  06d7 b704          	ld	_memcpy$L+4,a
3270  06d9 c6002a        	ld	a,_m_bySelectedMenu
3271  06dc cd0000        	call	_parametersGetLabel
3273  06df b703          	ld	_memcpy$L+3,a
3274  06e1 bf02          	ld	_memcpy$L+2,x
3275  06e3 a615          	ld	a,#low(_m_strString1)
3276  06e5 ae15          	ld	x,#high(_m_strString1)
3277  06e7 cd0000        	call	_memcpy
3279                     ; 379 						m_strString1[19] = 0x00;
3281  06ea 4f            	clr	a
3282  06eb c70028        	ld	_m_strString1+19,a
3283                     ; 380 						screenBigStdMessage(SCREEN_STD_MSG_PARAMETER_SAVED);
3285  06ee a605          	ld	a,#5
3286  06f0 cd0871        	call	_screenBigStdMessage
3289  06f3 2010          	jra	L3441
3290  06f5               L1441:
3291                     ; 384 						screenBigStdMessage(SCREEN_STD_MSG_PARAMETER_VALUE_NA);
3293  06f5 a608          	ld	a,#8
3294  06f7 cd0871        	call	_screenBigStdMessage
3296                     ; 385 						parametersSet(PARAM_PAGE, PAGE_SETUP);	
3298  06fa a605          	ld	a,#5
3299  06fc b702          	ld	_parametersSet$L+2,a
3300  06fe 3f01          	clr	_parametersSet$L+1
3301  0700 a60e          	ld	a,#14
3302  0702 cd0000        	call	_parametersSet
3304  0705               L3441:
3305                     ; 387 					sleepFix();
3307  0705 cd0000        	call	_sleepFix
3309                     ; 388 					m_bySelectedMenu = windowSetupParameter(parametersGetValue(PARAM_PAGE_SEL),0xFFFF);				
3311  0708 aeff          	ld	x,#255
3312  070a bf01          	ld	_windowSetupParameter$L+1,x
3313  070c a6ff          	ld	a,#255
3314  070e b702          	ld	_windowSetupParameter$L+2,a
3315  0710 a60f          	ld	a,#15
3316  0712 cd0000        	call	_parametersGetValue
3318  0715 cd0000        	call	_windowSetupParameter
3320  0718 c7002a        	ld	_m_bySelectedMenu,a
3321                     ; 389 					m_byValueChanged = false;
3323  071b 4f            	clr	a
3324  071c c70029        	ld	_m_byValueChanged,a
3325                     ; 390 					m_woCurrentValue = parametersGetValue(m_bySelectedMenu);
3327  071f c6002a        	ld	a,_m_bySelectedMenu
3328  0722 cd0000        	call	_parametersGetValue
3330  0725 c7002c        	ld	_m_woCurrentValue+1,a
3331  0728 cf002b        	ld	_m_woCurrentValue,x
3333  072b 2003          	jra	L7041
3334  072d               L7341:
3335                     ; 394 					screenMain();
3337  072d cd01a0        	call	_screenMain
3339  0730               L7041:
3340                     ; 426 }
3343  0730 81            	ret
3344  0731               L7431:
3345                     ; 397 			case KEY_ARROW_UP:
3345                     ; 398 				m_byValueChanged = true;
3347  0731 a601          	ld	a,#1
3348  0733 c70029        	ld	_m_byValueChanged,a
3349                     ; 399 				m_woCurrentValue = m_woCurrentValue+1;
3351  0736 c6002c        	ld	a,_m_woCurrentValue+1
3352  0739 ab01          	add	a,#1
3353  073b c7002c        	ld	_m_woCurrentValue+1,a
3354  073e c6002b        	ld	a,_m_woCurrentValue
3355  0741 a900          	adc	a,#0
3356  0743 c7002b        	ld	_m_woCurrentValue,a
3357                     ; 400 				m_bySelectedMenu = windowSetupParameter(parametersGetValue(PARAM_PAGE_SEL), m_woCurrentValue);
3359  0746 ce002b        	ld	x,_m_woCurrentValue
3360  0749 bf01          	ld	_windowSetupParameter$L+1,x
3361  074b c6002c        	ld	a,_m_woCurrentValue+1
3362  074e b702          	ld	_windowSetupParameter$L+2,a
3363  0750 a60f          	ld	a,#15
3364  0752 cd0000        	call	_parametersGetValue
3366  0755 cd0000        	call	_windowSetupParameter
3368  0758 c7002a        	ld	_m_bySelectedMenu,a
3369                     ; 401 				break;
3371  075b 20d3          	jra	L7041
3372  075d               L1531:
3373                     ; 402 			case KEY_ARROW_DOWN:
3373                     ; 403 				m_byValueChanged = true;
3375  075d a601          	ld	a,#1
3376  075f c70029        	ld	_m_byValueChanged,a
3377                     ; 404 				m_woCurrentValue = m_woCurrentValue-1;
3379  0762 c6002c        	ld	a,_m_woCurrentValue+1
3380  0765 2607          	jrne	L211
3381  0767 ce002b        	ld	x,_m_woCurrentValue
3382  076a 5a            	dec	x
3383  076b cf002b        	ld	_m_woCurrentValue,x
3384  076e               L211:
3385  076e 4a            	dec	a
3386  076f c7002c        	ld	_m_woCurrentValue+1,a
3387                     ; 405 				m_bySelectedMenu = windowSetupParameter(parametersGetValue(PARAM_PAGE_SEL), m_woCurrentValue);
3389  0772 ce002b        	ld	x,_m_woCurrentValue
3390  0775 bf01          	ld	_windowSetupParameter$L+1,x
3391  0777 c6002c        	ld	a,_m_woCurrentValue+1
3392  077a b702          	ld	_windowSetupParameter$L+2,a
3393  077c a60f          	ld	a,#15
3394  077e cd0000        	call	_parametersGetValue
3396  0781 cd0000        	call	_windowSetupParameter
3398  0784 c7002a        	ld	_m_bySelectedMenu,a
3399                     ; 406 				break;
3401  0787 20a7          	jra	L7041
3402  0789               L3531:
3403                     ; 407 			case KEY_ARROW_UP_F:
3403                     ; 408 				m_byValueChanged = true;
3405  0789 a601          	ld	a,#1
3406  078b c70029        	ld	_m_byValueChanged,a
3407                     ; 409 				m_woCurrentValue = m_woCurrentValue+10;
3409  078e c6002c        	ld	a,_m_woCurrentValue+1
3410  0791 ab0a          	add	a,#10
3411  0793 c7002c        	ld	_m_woCurrentValue+1,a
3412  0796 c6002b        	ld	a,_m_woCurrentValue
3413  0799 a900          	adc	a,#0
3414  079b c7002b        	ld	_m_woCurrentValue,a
3415                     ; 410 				m_bySelectedMenu = windowSetupParameter(parametersGetValue(PARAM_PAGE_SEL), m_woCurrentValue);
3417  079e ce002b        	ld	x,_m_woCurrentValue
3418  07a1 bf01          	ld	_windowSetupParameter$L+1,x
3419  07a3 c6002c        	ld	a,_m_woCurrentValue+1
3420  07a6 b702          	ld	_windowSetupParameter$L+2,a
3421  07a8 a60f          	ld	a,#15
3422  07aa cd0000        	call	_parametersGetValue
3424  07ad cd0000        	call	_windowSetupParameter
3426  07b0 c7002a        	ld	_m_bySelectedMenu,a
3427                     ; 411 				break;
3429  07b3 cc0730        	jp	L7041
3430  07b6               L5531:
3431                     ; 412 			case KEY_ARROW_DOWN_F:
3431                     ; 413 				m_byValueChanged = true;
3433  07b6 a601          	ld	a,#1
3434  07b8 c70029        	ld	_m_byValueChanged,a
3435                     ; 414 				m_woCurrentValue = m_woCurrentValue-10;
3437  07bb c6002c        	ld	a,_m_woCurrentValue+1
3438  07be a00a          	sub	a,#10
3439  07c0 c7002c        	ld	_m_woCurrentValue+1,a
3440  07c3 c6002b        	ld	a,_m_woCurrentValue
3441  07c6 a200          	sbc	a,#0
3442  07c8 c7002b        	ld	_m_woCurrentValue,a
3443                     ; 415 				m_bySelectedMenu = windowSetupParameter(parametersGetValue(PARAM_PAGE_SEL), m_woCurrentValue);
3445  07cb ce002b        	ld	x,_m_woCurrentValue
3446  07ce bf01          	ld	_windowSetupParameter$L+1,x
3447  07d0 c6002c        	ld	a,_m_woCurrentValue+1
3448  07d3 b702          	ld	_windowSetupParameter$L+2,a
3449  07d5 a60f          	ld	a,#15
3450  07d7 cd0000        	call	_parametersGetValue
3452  07da cd0000        	call	_windowSetupParameter
3454  07dd c7002a        	ld	_m_bySelectedMenu,a
3455                     ; 416 				break;
3457  07e0 cc0730        	jp	L7041
3458  07e3               L7531:
3459                     ; 417 			case KEY_FUNCTION:
3459                     ; 418 				m_byValueChanged = true;
3461  07e3 a601          	ld	a,#1
3462  07e5 c70029        	ld	_m_byValueChanged,a
3463                     ; 419 				m_woCurrentValue = 0x0000;
3465  07e8 4f            	clr	a
3466  07e9 c7002b        	ld	_m_woCurrentValue,a
3467  07ec c7002c        	ld	_m_woCurrentValue+1,a
3468                     ; 420 				m_bySelectedMenu = windowSetupParameter(parametersGetValue(PARAM_PAGE_SEL), m_woCurrentValue);
3470  07ef ce002b        	ld	x,_m_woCurrentValue
3471  07f2 bf01          	ld	_windowSetupParameter$L+1,x
3472  07f4 c6002c        	ld	a,_m_woCurrentValue+1
3473  07f7 b702          	ld	_windowSetupParameter$L+2,a
3474  07f9 a60f          	ld	a,#15
3475  07fb cd0000        	call	_parametersGetValue
3477  07fe cd0000        	call	_windowSetupParameter
3479  0801 c7002a        	ld	_m_bySelectedMenu,a
3480                     ; 421 				break;
3482  0804 cc0730        	jp	L7041
3483  0807               L1631:
3484                     ; 422 			default:
3484                     ; 423 				break;
3486  0807 cc0730        	jp	L7041
3487  080a               L3241:
3488  080a cc0730        	jp	L7041
3511                     ; 429 void screenArchive(void)
3511                     ; 430 {
3512                     	switch	.text
3513  080d               _screenArchive:
3516                     ; 431 	screenBigMessage("ARCHIVE", "(operativo)");
3518  080d aef1          	ld	x,#high(L1641)
3519  080f bf02          	ld	_screenBigMessage$L+2,x
3520  0811 a6f1          	ld	a,#low(L1641)
3521  0813 b703          	ld	_screenBigMessage$L+3,a
3522  0815 a6fd          	ld	a,#low(L7541)
3523  0817 aefd          	ld	x,#high(L7541)
3524  0819 cd01f1        	call	_screenBigMessage
3526                     ; 432 }
3529  081c 81            	ret
3568                     ; 435 void screenVersion(void)
3568                     ; 436 {
3569                     	switch	.text
3571                     	xref.b	_screenVersion$L
3572  081d               _screenVersion:
3575                     ; 442 	strString[15] = 0x00;
3577  081d 3ffb          	clr	_screenVersion$L-5
3578                     ; 443 	strString[16] = 0x00;
3580  081f 3ffc          	clr	_screenVersion$L-4
3581                     ; 445 	memcpy(strString, "Cpu Board ", 10); 
3583  0821 a60a          	ld	a,#10
3584  0823 b704          	ld	_memcpy$L+4,a
3585  0825 aee6          	ld	x,#high(L1051)
3586  0827 bf02          	ld	_memcpy$L+2,x
3587  0829 a6e6          	ld	a,#low(L1051)
3588  082b b703          	ld	_memcpy$L+3,a
3589  082d a6ec          	ld	a,#_screenVersion$L-20
3590  082f 5f            	clr	x
3591  0830 cd0000        	call	_memcpy
3593                     ; 446 	memcpy(strString+10, "v     ", 6); 
3595  0833 a606          	ld	a,#6
3596  0835 b704          	ld	_memcpy$L+4,a
3597  0837 aedf          	ld	x,#high(L3051)
3598  0839 bf02          	ld	_memcpy$L+2,x
3599  083b a6df          	ld	a,#low(L3051)
3600  083d b703          	ld	_memcpy$L+3,a
3601  083f a6f6          	ld	a,#_screenVersion$L-10
3602  0841 5f            	clr	x
3603  0842 cd0000        	call	_memcpy
3605                     ; 447 	formatNumber(mc_byApplicationVersion, 4, 2, strString+12);
3607  0845 aef8          	ld	x,#high(_screenVersion$L-8)
3608  0847 bf04          	ld	_formatNumber$L+4,x
3609  0849 a6f8          	ld	a,#low(_screenVersion$L-8)
3610  084b b705          	ld	_formatNumber$L+5,a
3611  084d a602          	ld	a,#2
3612  084f b703          	ld	_formatNumber$L+3,a
3613  0851 a604          	ld	a,#4
3614  0853 b702          	ld	_formatNumber$L+2,a
3615  0855 5f            	clr	x
3616  0856 a6da          	ld	a,#218
3617  0858 cd0000        	call	_formatNumber
3619                     ; 448 	screenBigMessage("Versione SW", strString);
3621  085b aeec          	ld	x,#high(_screenVersion$L-20)
3622  085d bf02          	ld	_screenBigMessage$L+2,x
3623  085f a6ec          	ld	a,#low(_screenVersion$L-20)
3624  0861 b703          	ld	_screenBigMessage$L+3,a
3625  0863 a6d3          	ld	a,#low(L5051)
3626  0865 aed3          	ld	x,#high(L5051)
3627  0867 cd01f1        	call	_screenBigMessage
3629                     ; 449 	sleepSec(2);
3631  086a 5f            	clr	x
3632  086b a602          	ld	a,#2
3633  086d cd0000        	call	_sleepSec
3635                     ; 450 }
3638  0870 81            	ret
3676                     	switch	.const
3677  0001               L441:
3678  0001 08aa          	dc.w	L1151
3679  0003 08c7          	dc.w	L3151
3680  0005 08e4          	dc.w	L5151
3681  0007 09cb          	dc.w	L5371
3682  0009 0901          	dc.w	L7151
3683  000b 091e          	dc.w	L1251
3684  000d 0930          	dc.w	L3251
3685  000f 0954          	dc.w	L7251
3686  0011 0971          	dc.w	L1351
3687  0013 09cb          	dc.w	L5371
3688  0015 09cb          	dc.w	L5371
3689  0017 098e          	dc.w	L3351
3690  0019 09ab          	dc.w	L5351
3691  001b 0942          	dc.w	L5251
3692  001d               L051:
3693  001d 09e2          	dc.w	L3451
3694  001f 09ff          	dc.w	L5451
3695  0021 0a1c          	dc.w	L7451
3696  0023 0b03          	dc.w	L7002
3697  0025 0a39          	dc.w	L1551
3698  0027 0a56          	dc.w	L3551
3699  0029 0a68          	dc.w	L5551
3700  002b 0a8c          	dc.w	L1651
3701  002d 0aa9          	dc.w	L3651
3702  002f 0b03          	dc.w	L7002
3703  0031 0b03          	dc.w	L7002
3704  0033 0ac6          	dc.w	L5651
3705  0035 0ae3          	dc.w	L7651
3706  0037 0a7a          	dc.w	L7551
3707  0039               L451:
3708  0039 0b1a          	dc.w	L5751
3709  003b 0b37          	dc.w	L7751
3710  003d 0b54          	dc.w	L1061
3711  003f 0c3b          	dc.w	L5502
3712  0041 0b71          	dc.w	L3061
3713  0043 0b8e          	dc.w	L5061
3714  0045 0ba0          	dc.w	L7061
3715  0047 0bc4          	dc.w	L3161
3716  0049 0be1          	dc.w	L5161
3717  004b 0c3b          	dc.w	L5502
3718  004d 0c3b          	dc.w	L5502
3719  004f 0bfe          	dc.w	L7161
3720  0051 0c1b          	dc.w	L1261
3721  0053 0bb2          	dc.w	L1161
3722  0055               L061:
3723  0055 0c52          	dc.w	L7261
3724  0057 0c6f          	dc.w	L1361
3725  0059 0c8c          	dc.w	L3361
3726  005b 0d73          	dc.w	L1602
3727  005d 0ca9          	dc.w	L5361
3728  005f 0cc6          	dc.w	L7361
3729  0061 0cd8          	dc.w	L1461
3730  0063 0cfc          	dc.w	L5461
3731  0065 0d19          	dc.w	L7461
3732  0067 0d73          	dc.w	L1602
3733  0069 0d73          	dc.w	L1602
3734  006b 0d36          	dc.w	L1561
3735  006d 0d53          	dc.w	L3561
3736  006f 0cea          	dc.w	L3461
3737  0071               L461:
3738  0071 0d8a          	dc.w	L1661
3739  0073 0da7          	dc.w	L3661
3740  0075 0dc4          	dc.w	L5661
3741  0077 0ea1          	dc.w	L5602
3742  0079 0de1          	dc.w	L7661
3743  007b 0dfe          	dc.w	L1761
3744  007d 0e10          	dc.w	L3761
3745  007f 0e33          	dc.w	L7761
3746  0081 0e4f          	dc.w	L1071
3747  0083 0ea1          	dc.w	L5602
3748  0085 0ea1          	dc.w	L5602
3749  0087 0e6b          	dc.w	L3071
3750  0089 0e87          	dc.w	L5071
3751  008b 0e22          	dc.w	L5761
3752                     ; 454 void screenBigStdMessage(BYTE a_byStdMessage)
3752                     ; 455 {
3753                     	switch	.text
3755                     	xref.b	_screenBigStdMessage$L
3756  0871               _screenBigStdMessage:
3758  0871 b700          	ld	_screenBigStdMessage$L,a
3760                     ; 456 	switch(parametersGetValue(PARAM_LANGUAGE))
3762  0873 a61f          	ld	a,#31
3763  0875 cd0000        	call	_parametersGetValue
3766                     ; 698 			break;
3767  0878 5d            	tnz	x
3768  0879 2703          	jreq	L071
3769  087b cc0d76        	jp	L7561
3770  087e               L071:
3771  087e 4a            	dec	a
3772  087f 2715          	jreq	L7051
3773  0881 4a            	dec	a
3774  0882 2603          	jrne	L271
3775  0884 cc09ce        	jp	L1451
3776  0887               L271:
3777  0887 4a            	dec	a
3778  0888 2603          	jrne	L471
3779  088a cc0b06        	jp	L3751
3780  088d               L471:
3781  088d 4a            	dec	a
3782  088e 2603          	jrne	L671
3783  0890 cc0c3e        	jp	L5261
3784  0893               L671:
3785  0893 cc0d76        	jp	L7561
3786  0896               L7051:
3787                     ; 458 		case PARAM_LANGUAGE_EN: //English
3787                     ; 459 			switch(a_byStdMessage)
3789  0896 b600          	ld	a,_screenBigStdMessage$L
3791                     ; 502 				default:
3791                     ; 503 					break;
3792  0898 a10e          	cp	a,#14
3793  089a 240b          	jruge	L241
3794  089c 48            	sll	a
3795  089d 97            	ld	x,a
3796  089e d60002        	ld	a,(L441+1,x)
3797  08a1 88            	push	a
3798  08a2 d60001        	ld	a,(L441,x)
3799  08a5 88            	push	a
3800  08a6 81            	ret
3801  08a7               L241:
3802  08a7 cc0ea1        	jp	L1371
3803  08aa               L1151:
3804                     ; 461 				case SCREEN_STD_MSG_INIT_PARAM:
3804                     ; 462 					screenBigMessage("Parameter", "Initialization");
3806  08aa aeba          	ld	x,#high(L1471)
3807  08ac bf02          	ld	_screenBigMessage$L+2,x
3808  08ae a6ba          	ld	a,#low(L1471)
3809  08b0 b703          	ld	_screenBigMessage$L+3,a
3810  08b2 a6c9          	ld	a,#low(L7371)
3811  08b4 aec9          	ld	x,#high(L7371)
3812  08b6 cd01f1        	call	_screenBigMessage
3814                     ; 463 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
3816  08b9 a602          	ld	a,#2
3817  08bb b702          	ld	_parametersSet$L+2,a
3818  08bd 3f01          	clr	_parametersSet$L+1
3819  08bf a60e          	ld	a,#14
3820  08c1 cd0000        	call	_parametersSet
3822                     ; 464 					break;
3824  08c4 cc0ea1        	jp	L1371
3825  08c7               L3151:
3826                     ; 465 				case SCREEN_STD_MSG_WASHING:
3826                     ; 466 					screenBigMessage("Washing", "viscometer...");			
3828  08c7 aea4          	ld	x,#high(L5471)
3829  08c9 bf02          	ld	_screenBigMessage$L+2,x
3830  08cb a6a4          	ld	a,#low(L5471)
3831  08cd b703          	ld	_screenBigMessage$L+3,a
3832  08cf a6b2          	ld	a,#low(L3471)
3833  08d1 aeb2          	ld	x,#high(L3471)
3834  08d3 cd01f1        	call	_screenBigMessage
3836                     ; 467 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
3838  08d6 a602          	ld	a,#2
3839  08d8 b702          	ld	_parametersSet$L+2,a
3840  08da 3f01          	clr	_parametersSet$L+1
3841  08dc a60e          	ld	a,#14
3842  08de cd0000        	call	_parametersSet
3844                     ; 468 					break;
3846  08e1 cc0ea1        	jp	L1371
3847  08e4               L5151:
3848                     ; 469 				case SCREEN_STD_MSG_ADDING_SOLVENT:
3848                     ; 470 					screenBigMessage("Adding", "solvent...");
3850  08e4 ae92          	ld	x,#high(L1571)
3851  08e6 bf02          	ld	_screenBigMessage$L+2,x
3852  08e8 a692          	ld	a,#low(L1571)
3853  08ea b703          	ld	_screenBigMessage$L+3,a
3854  08ec a69d          	ld	a,#low(L7471)
3855  08ee ae9d          	ld	x,#high(L7471)
3856  08f0 cd01f1        	call	_screenBigMessage
3858                     ; 471 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
3860  08f3 a602          	ld	a,#2
3861  08f5 b702          	ld	_parametersSet$L+2,a
3862  08f7 3f01          	clr	_parametersSet$L+1
3863  08f9 a60e          	ld	a,#14
3864  08fb cd0000        	call	_parametersSet
3866                     ; 472 					break;		
3868  08fe cc0ea1        	jp	L1371
3869  0901               L7151:
3870                     ; 473 				case SCREEN_STD_MSG_RESET:
3870                     ; 474 					screenBigMessage("Restarting", "ViscoWal...");
3872  0901 ae7b          	ld	x,#high(L5571)
3873  0903 bf02          	ld	_screenBigMessage$L+2,x
3874  0905 a67b          	ld	a,#low(L5571)
3875  0907 b703          	ld	_screenBigMessage$L+3,a
3876  0909 a687          	ld	a,#low(L3571)
3877  090b ae87          	ld	x,#high(L3571)
3878  090d cd01f1        	call	_screenBigMessage
3880                     ; 475 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
3882  0910 a602          	ld	a,#2
3883  0912 b702          	ld	_parametersSet$L+2,a
3884  0914 3f01          	clr	_parametersSet$L+1
3885  0916 a60e          	ld	a,#14
3886  0918 cd0000        	call	_parametersSet
3888                     ; 476 					break;		
3890  091b cc0ea1        	jp	L1371
3891  091e               L1251:
3892                     ; 477 				case SCREEN_STD_MSG_PARAMETER_SAVED:
3892                     ; 478 					screenBigMessage("Parameter saved:", m_strString1);			
3894  091e ae15          	ld	x,#high(_m_strString1)
3895  0920 bf02          	ld	_screenBigMessage$L+2,x
3896  0922 a615          	ld	a,#low(_m_strString1)
3897  0924 b703          	ld	_screenBigMessage$L+3,a
3898  0926 a66a          	ld	a,#low(L7571)
3899  0928 ae6a          	ld	x,#high(L7571)
3900  092a cd01f1        	call	_screenBigMessage
3902                     ; 479 					break;
3904  092d cc0ea1        	jp	L1371
3905  0930               L3251:
3906                     ; 480 				case SCREEN_STD_MSG_CMD_DONE:
3906                     ; 481 					screenBigMessage("Command", "done");
3908  0930 ae5d          	ld	x,#high(L3671)
3909  0932 bf02          	ld	_screenBigMessage$L+2,x
3910  0934 a65d          	ld	a,#low(L3671)
3911  0936 b703          	ld	_screenBigMessage$L+3,a
3912  0938 a662          	ld	a,#low(L1671)
3913  093a ae62          	ld	x,#high(L1671)
3914  093c cd01f1        	call	_screenBigMessage
3916                     ; 482 					break;
3918  093f cc0ea1        	jp	L1371
3919  0942               L5251:
3920                     ; 483 				case SCREEN_STD_MSG_CMD_NA:
3920                     ; 484 					screenBigMessage("Command", "not available");
3922  0942 ae4f          	ld	x,#high(L5671)
3923  0944 bf02          	ld	_screenBigMessage$L+2,x
3924  0946 a64f          	ld	a,#low(L5671)
3925  0948 b703          	ld	_screenBigMessage$L+3,a
3926  094a a662          	ld	a,#low(L1671)
3927  094c ae62          	ld	x,#high(L1671)
3928  094e cd01f1        	call	_screenBigMessage
3930                     ; 485 					break;
3932  0951 cc0ea1        	jp	L1371
3933  0954               L7251:
3934                     ; 486 				case SCREEN_STD_MSG_SW_VERSION:
3934                     ; 487 					screenBigMessage("SW Version", "");
3936  0954 ae43          	ld	x,#high(L1771)
3937  0956 bf02          	ld	_screenBigMessage$L+2,x
3938  0958 a643          	ld	a,#low(L1771)
3939  095a b703          	ld	_screenBigMessage$L+3,a
3940  095c a644          	ld	a,#low(L7671)
3941  095e ae44          	ld	x,#high(L7671)
3942  0960 cd01f1        	call	_screenBigMessage
3944                     ; 488 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
3946  0963 a602          	ld	a,#2
3947  0965 b702          	ld	_parametersSet$L+2,a
3948  0967 3f01          	clr	_parametersSet$L+1
3949  0969 a60e          	ld	a,#14
3950  096b cd0000        	call	_parametersSet
3952                     ; 489 					break;
3954  096e cc0ea1        	jp	L1371
3955  0971               L1351:
3956                     ; 490 				case SCREEN_STD_MSG_PARAMETER_VALUE_NA:
3956                     ; 491 					screenBigMessage("Error", "Unacceptable value");
3958  0971 ae2a          	ld	x,#high(L5771)
3959  0973 bf02          	ld	_screenBigMessage$L+2,x
3960  0975 a62a          	ld	a,#low(L5771)
3961  0977 b703          	ld	_screenBigMessage$L+3,a
3962  0979 a63d          	ld	a,#low(L3771)
3963  097b ae3d          	ld	x,#high(L3771)
3964  097d cd01f1        	call	_screenBigMessage
3966                     ; 492 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
3968  0980 a602          	ld	a,#2
3969  0982 b702          	ld	_parametersSet$L+2,a
3970  0984 3f01          	clr	_parametersSet$L+1
3971  0986 a60e          	ld	a,#14
3972  0988 cd0000        	call	_parametersSet
3974                     ; 493 					break;
3976  098b cc0ea1        	jp	L1371
3977  098e               L3351:
3978                     ; 494 				case SCREEN_STD_MSG_WRONG_MEMORY_SLOT:
3978                     ; 495 					screenBigMessage("Error: Position", "not available");
3980  098e ae4f          	ld	x,#high(L5671)
3981  0990 bf02          	ld	_screenBigMessage$L+2,x
3982  0992 a64f          	ld	a,#low(L5671)
3983  0994 b703          	ld	_screenBigMessage$L+3,a
3984  0996 a61a          	ld	a,#low(L7771)
3985  0998 ae1a          	ld	x,#high(L7771)
3986  099a cd01f1        	call	_screenBigMessage
3988                     ; 496 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
3990  099d a602          	ld	a,#2
3991  099f b702          	ld	_parametersSet$L+2,a
3992  09a1 3f01          	clr	_parametersSet$L+1
3993  09a3 a60e          	ld	a,#14
3994  09a5 cd0000        	call	_parametersSet
3996                     ; 497 					break;
3998  09a8 cc0ea1        	jp	L1371
3999  09ab               L5351:
4000                     ; 498 				case SCREEN_STD_MSG_CHECK_PUMP:
4000                     ; 499 					screenBigMessage("Checking", "pump...");
4002  09ab ae09          	ld	x,#high(L3002)
4003  09ad bf02          	ld	_screenBigMessage$L+2,x
4004  09af a609          	ld	a,#low(L3002)
4005  09b1 b703          	ld	_screenBigMessage$L+3,a
4006  09b3 a611          	ld	a,#low(L1002)
4007  09b5 ae11          	ld	x,#high(L1002)
4008  09b7 cd01f1        	call	_screenBigMessage
4010                     ; 500 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4012  09ba a602          	ld	a,#2
4013  09bc b702          	ld	_parametersSet$L+2,a
4014  09be 3f01          	clr	_parametersSet$L+1
4015  09c0 a60e          	ld	a,#14
4016  09c2 cd0000        	call	_parametersSet
4018                     ; 501 					break;
4020  09c5 cc0ea1        	jp	L1371
4021  09c8               L7351:
4022                     ; 502 				default:
4022                     ; 503 					break;
4024  09c8 cc0ea1        	jp	L1371
4025  09cb               L5371:
4026                     ; 506 			break;
4028  09cb cc0ea1        	jp	L1371
4029  09ce               L1451:
4030                     ; 507 		case PARAM_LANGUAGE_DE: //***TODO: Da cambiare*** German
4030                     ; 508 			switch(a_byStdMessage)
4032  09ce b600          	ld	a,_screenBigStdMessage$L
4034                     ; 551 				default:
4034                     ; 552 					break;
4035  09d0 a10e          	cp	a,#14
4036  09d2 240b          	jruge	L641
4037  09d4 48            	sll	a
4038  09d5 97            	ld	x,a
4039  09d6 d6001e        	ld	a,(L051+1,x)
4040  09d9 88            	push	a
4041  09da d6001d        	ld	a,(L051,x)
4042  09dd 88            	push	a
4043  09de 81            	ret
4044  09df               L641:
4045  09df cc0ea1        	jp	L1371
4046  09e2               L3451:
4047                     ; 510 				case SCREEN_STD_MSG_INIT_PARAM:
4047                     ; 511 					screenBigMessage("Inizializzazione", "parametri");
4049  09e2 aeee          	ld	x,#high(L3102)
4050  09e4 bf02          	ld	_screenBigMessage$L+2,x
4051  09e6 a6ee          	ld	a,#low(L3102)
4052  09e8 b703          	ld	_screenBigMessage$L+3,a
4053  09ea a6f8          	ld	a,#low(L1102)
4054  09ec aef8          	ld	x,#high(L1102)
4055  09ee cd01f1        	call	_screenBigMessage
4057                     ; 512 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4059  09f1 a602          	ld	a,#2
4060  09f3 b702          	ld	_parametersSet$L+2,a
4061  09f5 3f01          	clr	_parametersSet$L+1
4062  09f7 a60e          	ld	a,#14
4063  09f9 cd0000        	call	_parametersSet
4065                     ; 513 					break;
4067  09fc cc0ea1        	jp	L1371
4068  09ff               L5451:
4069                     ; 514 				case SCREEN_STD_MSG_WASHING:
4069                     ; 515 					screenBigMessage("Contro-lavaggio", "pompa");			
4071  09ff aed8          	ld	x,#high(L7102)
4072  0a01 bf02          	ld	_screenBigMessage$L+2,x
4073  0a03 a6d8          	ld	a,#low(L7102)
4074  0a05 b703          	ld	_screenBigMessage$L+3,a
4075  0a07 a6de          	ld	a,#low(L5102)
4076  0a09 aede          	ld	x,#high(L5102)
4077  0a0b cd01f1        	call	_screenBigMessage
4079                     ; 516 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4081  0a0e a602          	ld	a,#2
4082  0a10 b702          	ld	_parametersSet$L+2,a
4083  0a12 3f01          	clr	_parametersSet$L+1
4084  0a14 a60e          	ld	a,#14
4085  0a16 cd0000        	call	_parametersSet
4087                     ; 517 					break;
4089  0a19 cc0ea1        	jp	L1371
4090  0a1c               L7451:
4091                     ; 518 				case SCREEN_STD_MSG_ADDING_SOLVENT:
4091                     ; 519 					screenBigMessage("Aggiunta solvente", "in corso");
4093  0a1c aebd          	ld	x,#high(L3202)
4094  0a1e bf02          	ld	_screenBigMessage$L+2,x
4095  0a20 a6bd          	ld	a,#low(L3202)
4096  0a22 b703          	ld	_screenBigMessage$L+3,a
4097  0a24 a6c6          	ld	a,#low(L1202)
4098  0a26 aec6          	ld	x,#high(L1202)
4099  0a28 cd01f1        	call	_screenBigMessage
4101                     ; 520 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4103  0a2b a602          	ld	a,#2
4104  0a2d b702          	ld	_parametersSet$L+2,a
4105  0a2f 3f01          	clr	_parametersSet$L+1
4106  0a31 a60e          	ld	a,#14
4107  0a33 cd0000        	call	_parametersSet
4109                     ; 521 					break;
4111  0a36 cc0ea1        	jp	L1371
4112  0a39               L1551:
4113                     ; 522 				case SCREEN_STD_MSG_RESET:
4113                     ; 523 					screenBigMessage("Riavvio ViscoWal", "in corso");
4115  0a39 aebd          	ld	x,#high(L3202)
4116  0a3b bf02          	ld	_screenBigMessage$L+2,x
4117  0a3d a6bd          	ld	a,#low(L3202)
4118  0a3f b703          	ld	_screenBigMessage$L+3,a
4119  0a41 a6ac          	ld	a,#low(L5202)
4120  0a43 aeac          	ld	x,#high(L5202)
4121  0a45 cd01f1        	call	_screenBigMessage
4123                     ; 524 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4125  0a48 a602          	ld	a,#2
4126  0a4a b702          	ld	_parametersSet$L+2,a
4127  0a4c 3f01          	clr	_parametersSet$L+1
4128  0a4e a60e          	ld	a,#14
4129  0a50 cd0000        	call	_parametersSet
4131                     ; 525 					break;
4133  0a53 cc0ea1        	jp	L1371
4134  0a56               L3551:
4135                     ; 526 				case SCREEN_STD_MSG_PARAMETER_SAVED:
4135                     ; 527 					screenBigMessage("Parametro salvato:", m_strString1);			
4137  0a56 ae15          	ld	x,#high(_m_strString1)
4138  0a58 bf02          	ld	_screenBigMessage$L+2,x
4139  0a5a a615          	ld	a,#low(_m_strString1)
4140  0a5c b703          	ld	_screenBigMessage$L+3,a
4141  0a5e a699          	ld	a,#low(L7202)
4142  0a60 ae99          	ld	x,#high(L7202)
4143  0a62 cd01f1        	call	_screenBigMessage
4145                     ; 528 					break;
4147  0a65 cc0ea1        	jp	L1371
4148  0a68               L5551:
4149                     ; 529 				case SCREEN_STD_MSG_CMD_DONE:
4149                     ; 530 					screenBigMessage("Comando eseguito", "correttamente");
4151  0a68 ae7a          	ld	x,#high(L3302)
4152  0a6a bf02          	ld	_screenBigMessage$L+2,x
4153  0a6c a67a          	ld	a,#low(L3302)
4154  0a6e b703          	ld	_screenBigMessage$L+3,a
4155  0a70 a688          	ld	a,#low(L1302)
4156  0a72 ae88          	ld	x,#high(L1302)
4157  0a74 cd01f1        	call	_screenBigMessage
4159                     ; 531 					break;
4161  0a77 cc0ea1        	jp	L1371
4162  0a7a               L7551:
4163                     ; 532 				case SCREEN_STD_MSG_CMD_NA:
4163                     ; 533 					screenBigMessage("Comando non", "disponibile");
4165  0a7a ae62          	ld	x,#high(L7302)
4166  0a7c bf02          	ld	_screenBigMessage$L+2,x
4167  0a7e a662          	ld	a,#low(L7302)
4168  0a80 b703          	ld	_screenBigMessage$L+3,a
4169  0a82 a66e          	ld	a,#low(L5302)
4170  0a84 ae6e          	ld	x,#high(L5302)
4171  0a86 cd01f1        	call	_screenBigMessage
4173                     ; 534 					break;
4175  0a89 cc0ea1        	jp	L1371
4176  0a8c               L1651:
4177                     ; 535 				case SCREEN_STD_MSG_SW_VERSION:
4177                     ; 536 					screenBigMessage("Versione SW", "");
4179  0a8c ae43          	ld	x,#high(L1771)
4180  0a8e bf02          	ld	_screenBigMessage$L+2,x
4181  0a90 a643          	ld	a,#low(L1771)
4182  0a92 b703          	ld	_screenBigMessage$L+3,a
4183  0a94 a6d3          	ld	a,#low(L5051)
4184  0a96 aed3          	ld	x,#high(L5051)
4185  0a98 cd01f1        	call	_screenBigMessage
4187                     ; 537 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4189  0a9b a602          	ld	a,#2
4190  0a9d b702          	ld	_parametersSet$L+2,a
4191  0a9f 3f01          	clr	_parametersSet$L+1
4192  0aa1 a60e          	ld	a,#14
4193  0aa3 cd0000        	call	_parametersSet
4195                     ; 538 					break;
4197  0aa6 cc0ea1        	jp	L1371
4198  0aa9               L3651:
4199                     ; 539 				case SCREEN_STD_MSG_PARAMETER_VALUE_NA:
4199                     ; 540 					screenBigMessage("Errore: Valore ", "non accettabile");
4201  0aa9 ae42          	ld	x,#high(L3402)
4202  0aab bf02          	ld	_screenBigMessage$L+2,x
4203  0aad a642          	ld	a,#low(L3402)
4204  0aaf b703          	ld	_screenBigMessage$L+3,a
4205  0ab1 a652          	ld	a,#low(L1402)
4206  0ab3 ae52          	ld	x,#high(L1402)
4207  0ab5 cd01f1        	call	_screenBigMessage
4209                     ; 541 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4211  0ab8 a602          	ld	a,#2
4212  0aba b702          	ld	_parametersSet$L+2,a
4213  0abc 3f01          	clr	_parametersSet$L+1
4214  0abe a60e          	ld	a,#14
4215  0ac0 cd0000        	call	_parametersSet
4217                     ; 542 					break;
4219  0ac3 cc0ea1        	jp	L1371
4220  0ac6               L5651:
4221                     ; 543 				case SCREEN_STD_MSG_WRONG_MEMORY_SLOT:
4221                     ; 544 					screenBigMessage("Errore: Posizione", "non disponibile");
4223  0ac6 ae20          	ld	x,#high(L7402)
4224  0ac8 bf02          	ld	_screenBigMessage$L+2,x
4225  0aca a620          	ld	a,#low(L7402)
4226  0acc b703          	ld	_screenBigMessage$L+3,a
4227  0ace a630          	ld	a,#low(L5402)
4228  0ad0 ae30          	ld	x,#high(L5402)
4229  0ad2 cd01f1        	call	_screenBigMessage
4231                     ; 545 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4233  0ad5 a602          	ld	a,#2
4234  0ad7 b702          	ld	_parametersSet$L+2,a
4235  0ad9 3f01          	clr	_parametersSet$L+1
4236  0adb a60e          	ld	a,#14
4237  0add cd0000        	call	_parametersSet
4239                     ; 546 					break;
4241  0ae0 cc0ea1        	jp	L1371
4242  0ae3               L7651:
4243                     ; 547 				case SCREEN_STD_MSG_CHECK_PUMP:
4243                     ; 548 					screenBigMessage("Controllo pompa", "in corso");
4245  0ae3 aebd          	ld	x,#high(L3202)
4246  0ae5 bf02          	ld	_screenBigMessage$L+2,x
4247  0ae7 a6bd          	ld	a,#low(L3202)
4248  0ae9 b703          	ld	_screenBigMessage$L+3,a
4249  0aeb a610          	ld	a,#low(L1502)
4250  0aed ae10          	ld	x,#high(L1502)
4251  0aef cd01f1        	call	_screenBigMessage
4253                     ; 549 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4255  0af2 a602          	ld	a,#2
4256  0af4 b702          	ld	_parametersSet$L+2,a
4257  0af6 3f01          	clr	_parametersSet$L+1
4258  0af8 a60e          	ld	a,#14
4259  0afa cd0000        	call	_parametersSet
4261                     ; 550 					break;					
4263  0afd cc0ea1        	jp	L1371
4264  0b00               L1751:
4265                     ; 551 				default:
4265                     ; 552 					break;
4267  0b00 cc0ea1        	jp	L1371
4268  0b03               L7002:
4269                     ; 554 			break;
4271  0b03 cc0ea1        	jp	L1371
4272  0b06               L3751:
4273                     ; 555 		case PARAM_LANGUAGE_FR: //***TODO: Da cambiare*** French
4273                     ; 556 			switch(a_byStdMessage)
4275  0b06 b600          	ld	a,_screenBigStdMessage$L
4277                     ; 599 				default:
4277                     ; 600 					break;
4278  0b08 a10e          	cp	a,#14
4279  0b0a 240b          	jruge	L251
4280  0b0c 48            	sll	a
4281  0b0d 97            	ld	x,a
4282  0b0e d6003a        	ld	a,(L451+1,x)
4283  0b11 88            	push	a
4284  0b12 d60039        	ld	a,(L451,x)
4285  0b15 88            	push	a
4286  0b16 81            	ret
4287  0b17               L251:
4288  0b17 cc0ea1        	jp	L1371
4289  0b1a               L5751:
4290                     ; 558 				case SCREEN_STD_MSG_INIT_PARAM:
4290                     ; 559 					screenBigMessage("Inizializzazione", "parametri");
4292  0b1a aeee          	ld	x,#high(L3102)
4293  0b1c bf02          	ld	_screenBigMessage$L+2,x
4294  0b1e a6ee          	ld	a,#low(L3102)
4295  0b20 b703          	ld	_screenBigMessage$L+3,a
4296  0b22 a6f8          	ld	a,#low(L1102)
4297  0b24 aef8          	ld	x,#high(L1102)
4298  0b26 cd01f1        	call	_screenBigMessage
4300                     ; 560 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4302  0b29 a602          	ld	a,#2
4303  0b2b b702          	ld	_parametersSet$L+2,a
4304  0b2d 3f01          	clr	_parametersSet$L+1
4305  0b2f a60e          	ld	a,#14
4306  0b31 cd0000        	call	_parametersSet
4308                     ; 561 					break;
4310  0b34 cc0ea1        	jp	L1371
4311  0b37               L7751:
4312                     ; 562 				case SCREEN_STD_MSG_WASHING:
4312                     ; 563 					screenBigMessage("Contro-lavaggio", "pompa");			
4314  0b37 aed8          	ld	x,#high(L7102)
4315  0b39 bf02          	ld	_screenBigMessage$L+2,x
4316  0b3b a6d8          	ld	a,#low(L7102)
4317  0b3d b703          	ld	_screenBigMessage$L+3,a
4318  0b3f a6de          	ld	a,#low(L5102)
4319  0b41 aede          	ld	x,#high(L5102)
4320  0b43 cd01f1        	call	_screenBigMessage
4322                     ; 564 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4324  0b46 a602          	ld	a,#2
4325  0b48 b702          	ld	_parametersSet$L+2,a
4326  0b4a 3f01          	clr	_parametersSet$L+1
4327  0b4c a60e          	ld	a,#14
4328  0b4e cd0000        	call	_parametersSet
4330                     ; 565 					break;
4332  0b51 cc0ea1        	jp	L1371
4333  0b54               L1061:
4334                     ; 566 				case SCREEN_STD_MSG_ADDING_SOLVENT:
4334                     ; 567 					screenBigMessage("Aggiunta solvente", "in corso");
4336  0b54 aebd          	ld	x,#high(L3202)
4337  0b56 bf02          	ld	_screenBigMessage$L+2,x
4338  0b58 a6bd          	ld	a,#low(L3202)
4339  0b5a b703          	ld	_screenBigMessage$L+3,a
4340  0b5c a6c6          	ld	a,#low(L1202)
4341  0b5e aec6          	ld	x,#high(L1202)
4342  0b60 cd01f1        	call	_screenBigMessage
4344                     ; 568 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4346  0b63 a602          	ld	a,#2
4347  0b65 b702          	ld	_parametersSet$L+2,a
4348  0b67 3f01          	clr	_parametersSet$L+1
4349  0b69 a60e          	ld	a,#14
4350  0b6b cd0000        	call	_parametersSet
4352                     ; 569 					break;
4354  0b6e cc0ea1        	jp	L1371
4355  0b71               L3061:
4356                     ; 570 				case SCREEN_STD_MSG_RESET:
4356                     ; 571 					screenBigMessage("Riavvio ViscoWal", "in corso");
4358  0b71 aebd          	ld	x,#high(L3202)
4359  0b73 bf02          	ld	_screenBigMessage$L+2,x
4360  0b75 a6bd          	ld	a,#low(L3202)
4361  0b77 b703          	ld	_screenBigMessage$L+3,a
4362  0b79 a6ac          	ld	a,#low(L5202)
4363  0b7b aeac          	ld	x,#high(L5202)
4364  0b7d cd01f1        	call	_screenBigMessage
4366                     ; 572 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4368  0b80 a602          	ld	a,#2
4369  0b82 b702          	ld	_parametersSet$L+2,a
4370  0b84 3f01          	clr	_parametersSet$L+1
4371  0b86 a60e          	ld	a,#14
4372  0b88 cd0000        	call	_parametersSet
4374                     ; 573 					break;
4376  0b8b cc0ea1        	jp	L1371
4377  0b8e               L5061:
4378                     ; 574 				case SCREEN_STD_MSG_PARAMETER_SAVED:
4378                     ; 575 					screenBigMessage("Parametro salvato:", m_strString1);			
4380  0b8e ae15          	ld	x,#high(_m_strString1)
4381  0b90 bf02          	ld	_screenBigMessage$L+2,x
4382  0b92 a615          	ld	a,#low(_m_strString1)
4383  0b94 b703          	ld	_screenBigMessage$L+3,a
4384  0b96 a699          	ld	a,#low(L7202)
4385  0b98 ae99          	ld	x,#high(L7202)
4386  0b9a cd01f1        	call	_screenBigMessage
4388                     ; 576 					break;
4390  0b9d cc0ea1        	jp	L1371
4391  0ba0               L7061:
4392                     ; 577 				case SCREEN_STD_MSG_CMD_DONE:
4392                     ; 578 					screenBigMessage("Comando eseguito", "correttamente");
4394  0ba0 ae7a          	ld	x,#high(L3302)
4395  0ba2 bf02          	ld	_screenBigMessage$L+2,x
4396  0ba4 a67a          	ld	a,#low(L3302)
4397  0ba6 b703          	ld	_screenBigMessage$L+3,a
4398  0ba8 a688          	ld	a,#low(L1302)
4399  0baa ae88          	ld	x,#high(L1302)
4400  0bac cd01f1        	call	_screenBigMessage
4402                     ; 579 					break;
4404  0baf cc0ea1        	jp	L1371
4405  0bb2               L1161:
4406                     ; 580 				case SCREEN_STD_MSG_CMD_NA:
4406                     ; 581 					screenBigMessage("Comando non", "disponibile");
4408  0bb2 ae62          	ld	x,#high(L7302)
4409  0bb4 bf02          	ld	_screenBigMessage$L+2,x
4410  0bb6 a662          	ld	a,#low(L7302)
4411  0bb8 b703          	ld	_screenBigMessage$L+3,a
4412  0bba a66e          	ld	a,#low(L5302)
4413  0bbc ae6e          	ld	x,#high(L5302)
4414  0bbe cd01f1        	call	_screenBigMessage
4416                     ; 582 					break;
4418  0bc1 cc0ea1        	jp	L1371
4419  0bc4               L3161:
4420                     ; 583 				case SCREEN_STD_MSG_SW_VERSION:
4420                     ; 584 					screenBigMessage("Versione SW", "");
4422  0bc4 ae43          	ld	x,#high(L1771)
4423  0bc6 bf02          	ld	_screenBigMessage$L+2,x
4424  0bc8 a643          	ld	a,#low(L1771)
4425  0bca b703          	ld	_screenBigMessage$L+3,a
4426  0bcc a6d3          	ld	a,#low(L5051)
4427  0bce aed3          	ld	x,#high(L5051)
4428  0bd0 cd01f1        	call	_screenBigMessage
4430                     ; 585 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4432  0bd3 a602          	ld	a,#2
4433  0bd5 b702          	ld	_parametersSet$L+2,a
4434  0bd7 3f01          	clr	_parametersSet$L+1
4435  0bd9 a60e          	ld	a,#14
4436  0bdb cd0000        	call	_parametersSet
4438                     ; 586 					break;
4440  0bde cc0ea1        	jp	L1371
4441  0be1               L5161:
4442                     ; 587 				case SCREEN_STD_MSG_PARAMETER_VALUE_NA:
4442                     ; 588 					screenBigMessage("Errore: Valore ", "non accettabile");
4444  0be1 ae42          	ld	x,#high(L3402)
4445  0be3 bf02          	ld	_screenBigMessage$L+2,x
4446  0be5 a642          	ld	a,#low(L3402)
4447  0be7 b703          	ld	_screenBigMessage$L+3,a
4448  0be9 a652          	ld	a,#low(L1402)
4449  0beb ae52          	ld	x,#high(L1402)
4450  0bed cd01f1        	call	_screenBigMessage
4452                     ; 589 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4454  0bf0 a602          	ld	a,#2
4455  0bf2 b702          	ld	_parametersSet$L+2,a
4456  0bf4 3f01          	clr	_parametersSet$L+1
4457  0bf6 a60e          	ld	a,#14
4458  0bf8 cd0000        	call	_parametersSet
4460                     ; 590 					break;
4462  0bfb cc0ea1        	jp	L1371
4463  0bfe               L7161:
4464                     ; 591 				case SCREEN_STD_MSG_WRONG_MEMORY_SLOT:
4464                     ; 592 					screenBigMessage("Errore: Posizione", "non disponibile");
4466  0bfe ae20          	ld	x,#high(L7402)
4467  0c00 bf02          	ld	_screenBigMessage$L+2,x
4468  0c02 a620          	ld	a,#low(L7402)
4469  0c04 b703          	ld	_screenBigMessage$L+3,a
4470  0c06 a630          	ld	a,#low(L5402)
4471  0c08 ae30          	ld	x,#high(L5402)
4472  0c0a cd01f1        	call	_screenBigMessage
4474                     ; 593 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4476  0c0d a602          	ld	a,#2
4477  0c0f b702          	ld	_parametersSet$L+2,a
4478  0c11 3f01          	clr	_parametersSet$L+1
4479  0c13 a60e          	ld	a,#14
4480  0c15 cd0000        	call	_parametersSet
4482                     ; 594 					break;
4484  0c18 cc0ea1        	jp	L1371
4485  0c1b               L1261:
4486                     ; 595 				case SCREEN_STD_MSG_CHECK_PUMP:
4486                     ; 596 					screenBigMessage("Controllo pompa", "in corso");
4488  0c1b aebd          	ld	x,#high(L3202)
4489  0c1d bf02          	ld	_screenBigMessage$L+2,x
4490  0c1f a6bd          	ld	a,#low(L3202)
4491  0c21 b703          	ld	_screenBigMessage$L+3,a
4492  0c23 a610          	ld	a,#low(L1502)
4493  0c25 ae10          	ld	x,#high(L1502)
4494  0c27 cd01f1        	call	_screenBigMessage
4496                     ; 597 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4498  0c2a a602          	ld	a,#2
4499  0c2c b702          	ld	_parametersSet$L+2,a
4500  0c2e 3f01          	clr	_parametersSet$L+1
4501  0c30 a60e          	ld	a,#14
4502  0c32 cd0000        	call	_parametersSet
4504                     ; 598 					break;					
4506  0c35 cc0ea1        	jp	L1371
4507  0c38               L3261:
4508                     ; 599 				default:
4508                     ; 600 					break;
4510  0c38 cc0ea1        	jp	L1371
4511  0c3b               L5502:
4512                     ; 602 			break;
4514  0c3b cc0ea1        	jp	L1371
4515  0c3e               L5261:
4516                     ; 603 		case PARAM_LANGUAGE_ES: //***TODO: Da cambiare*** Spanish
4516                     ; 604 			switch(a_byStdMessage)
4518  0c3e b600          	ld	a,_screenBigStdMessage$L
4520                     ; 647 				default:
4520                     ; 648 					break;
4521  0c40 a10e          	cp	a,#14
4522  0c42 240b          	jruge	L651
4523  0c44 48            	sll	a
4524  0c45 97            	ld	x,a
4525  0c46 d60056        	ld	a,(L061+1,x)
4526  0c49 88            	push	a
4527  0c4a d60055        	ld	a,(L061,x)
4528  0c4d 88            	push	a
4529  0c4e 81            	ret
4530  0c4f               L651:
4531  0c4f cc0ea1        	jp	L1371
4532  0c52               L7261:
4533                     ; 606 				case SCREEN_STD_MSG_INIT_PARAM:
4533                     ; 607 					screenBigMessage("Inizializzazione", "parametri");
4535  0c52 aeee          	ld	x,#high(L3102)
4536  0c54 bf02          	ld	_screenBigMessage$L+2,x
4537  0c56 a6ee          	ld	a,#low(L3102)
4538  0c58 b703          	ld	_screenBigMessage$L+3,a
4539  0c5a a6f8          	ld	a,#low(L1102)
4540  0c5c aef8          	ld	x,#high(L1102)
4541  0c5e cd01f1        	call	_screenBigMessage
4543                     ; 608 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4545  0c61 a602          	ld	a,#2
4546  0c63 b702          	ld	_parametersSet$L+2,a
4547  0c65 3f01          	clr	_parametersSet$L+1
4548  0c67 a60e          	ld	a,#14
4549  0c69 cd0000        	call	_parametersSet
4551                     ; 609 					break;
4553  0c6c cc0ea1        	jp	L1371
4554  0c6f               L1361:
4555                     ; 610 				case SCREEN_STD_MSG_WASHING:
4555                     ; 611 					screenBigMessage("Contro-lavaggio", "pompa");			
4557  0c6f aed8          	ld	x,#high(L7102)
4558  0c71 bf02          	ld	_screenBigMessage$L+2,x
4559  0c73 a6d8          	ld	a,#low(L7102)
4560  0c75 b703          	ld	_screenBigMessage$L+3,a
4561  0c77 a6de          	ld	a,#low(L5102)
4562  0c79 aede          	ld	x,#high(L5102)
4563  0c7b cd01f1        	call	_screenBigMessage
4565                     ; 612 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4567  0c7e a602          	ld	a,#2
4568  0c80 b702          	ld	_parametersSet$L+2,a
4569  0c82 3f01          	clr	_parametersSet$L+1
4570  0c84 a60e          	ld	a,#14
4571  0c86 cd0000        	call	_parametersSet
4573                     ; 613 					break;
4575  0c89 cc0ea1        	jp	L1371
4576  0c8c               L3361:
4577                     ; 614 				case SCREEN_STD_MSG_ADDING_SOLVENT:
4577                     ; 615 					screenBigMessage("Aggiunta solvente", "in corso");
4579  0c8c aebd          	ld	x,#high(L3202)
4580  0c8e bf02          	ld	_screenBigMessage$L+2,x
4581  0c90 a6bd          	ld	a,#low(L3202)
4582  0c92 b703          	ld	_screenBigMessage$L+3,a
4583  0c94 a6c6          	ld	a,#low(L1202)
4584  0c96 aec6          	ld	x,#high(L1202)
4585  0c98 cd01f1        	call	_screenBigMessage
4587                     ; 616 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4589  0c9b a602          	ld	a,#2
4590  0c9d b702          	ld	_parametersSet$L+2,a
4591  0c9f 3f01          	clr	_parametersSet$L+1
4592  0ca1 a60e          	ld	a,#14
4593  0ca3 cd0000        	call	_parametersSet
4595                     ; 617 					break;
4597  0ca6 cc0ea1        	jp	L1371
4598  0ca9               L5361:
4599                     ; 618 				case SCREEN_STD_MSG_RESET:
4599                     ; 619 					screenBigMessage("Riavvio ViscoWal", "in corso");
4601  0ca9 aebd          	ld	x,#high(L3202)
4602  0cab bf02          	ld	_screenBigMessage$L+2,x
4603  0cad a6bd          	ld	a,#low(L3202)
4604  0caf b703          	ld	_screenBigMessage$L+3,a
4605  0cb1 a6ac          	ld	a,#low(L5202)
4606  0cb3 aeac          	ld	x,#high(L5202)
4607  0cb5 cd01f1        	call	_screenBigMessage
4609                     ; 620 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4611  0cb8 a602          	ld	a,#2
4612  0cba b702          	ld	_parametersSet$L+2,a
4613  0cbc 3f01          	clr	_parametersSet$L+1
4614  0cbe a60e          	ld	a,#14
4615  0cc0 cd0000        	call	_parametersSet
4617                     ; 621 					break;
4619  0cc3 cc0ea1        	jp	L1371
4620  0cc6               L7361:
4621                     ; 622 				case SCREEN_STD_MSG_PARAMETER_SAVED:
4621                     ; 623 					screenBigMessage("Parametro salvato:", m_strString1);			
4623  0cc6 ae15          	ld	x,#high(_m_strString1)
4624  0cc8 bf02          	ld	_screenBigMessage$L+2,x
4625  0cca a615          	ld	a,#low(_m_strString1)
4626  0ccc b703          	ld	_screenBigMessage$L+3,a
4627  0cce a699          	ld	a,#low(L7202)
4628  0cd0 ae99          	ld	x,#high(L7202)
4629  0cd2 cd01f1        	call	_screenBigMessage
4631                     ; 624 					break;
4633  0cd5 cc0ea1        	jp	L1371
4634  0cd8               L1461:
4635                     ; 625 				case SCREEN_STD_MSG_CMD_DONE:
4635                     ; 626 					screenBigMessage("Comando eseguito", "correttamente");
4637  0cd8 ae7a          	ld	x,#high(L3302)
4638  0cda bf02          	ld	_screenBigMessage$L+2,x
4639  0cdc a67a          	ld	a,#low(L3302)
4640  0cde b703          	ld	_screenBigMessage$L+3,a
4641  0ce0 a688          	ld	a,#low(L1302)
4642  0ce2 ae88          	ld	x,#high(L1302)
4643  0ce4 cd01f1        	call	_screenBigMessage
4645                     ; 627 					break;
4647  0ce7 cc0ea1        	jp	L1371
4648  0cea               L3461:
4649                     ; 628 				case SCREEN_STD_MSG_CMD_NA:
4649                     ; 629 					screenBigMessage("Comando non", "disponibile");
4651  0cea ae62          	ld	x,#high(L7302)
4652  0cec bf02          	ld	_screenBigMessage$L+2,x
4653  0cee a662          	ld	a,#low(L7302)
4654  0cf0 b703          	ld	_screenBigMessage$L+3,a
4655  0cf2 a66e          	ld	a,#low(L5302)
4656  0cf4 ae6e          	ld	x,#high(L5302)
4657  0cf6 cd01f1        	call	_screenBigMessage
4659                     ; 630 					break;
4661  0cf9 cc0ea1        	jp	L1371
4662  0cfc               L5461:
4663                     ; 631 				case SCREEN_STD_MSG_SW_VERSION:
4663                     ; 632 					screenBigMessage("Versione SW", "");
4665  0cfc ae43          	ld	x,#high(L1771)
4666  0cfe bf02          	ld	_screenBigMessage$L+2,x
4667  0d00 a643          	ld	a,#low(L1771)
4668  0d02 b703          	ld	_screenBigMessage$L+3,a
4669  0d04 a6d3          	ld	a,#low(L5051)
4670  0d06 aed3          	ld	x,#high(L5051)
4671  0d08 cd01f1        	call	_screenBigMessage
4673                     ; 633 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4675  0d0b a602          	ld	a,#2
4676  0d0d b702          	ld	_parametersSet$L+2,a
4677  0d0f 3f01          	clr	_parametersSet$L+1
4678  0d11 a60e          	ld	a,#14
4679  0d13 cd0000        	call	_parametersSet
4681                     ; 634 					break;
4683  0d16 cc0ea1        	jp	L1371
4684  0d19               L7461:
4685                     ; 635 				case SCREEN_STD_MSG_PARAMETER_VALUE_NA:
4685                     ; 636 					screenBigMessage("Errore: Valore ", "non accettabile");
4687  0d19 ae42          	ld	x,#high(L3402)
4688  0d1b bf02          	ld	_screenBigMessage$L+2,x
4689  0d1d a642          	ld	a,#low(L3402)
4690  0d1f b703          	ld	_screenBigMessage$L+3,a
4691  0d21 a652          	ld	a,#low(L1402)
4692  0d23 ae52          	ld	x,#high(L1402)
4693  0d25 cd01f1        	call	_screenBigMessage
4695                     ; 637 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4697  0d28 a602          	ld	a,#2
4698  0d2a b702          	ld	_parametersSet$L+2,a
4699  0d2c 3f01          	clr	_parametersSet$L+1
4700  0d2e a60e          	ld	a,#14
4701  0d30 cd0000        	call	_parametersSet
4703                     ; 638 					break;
4705  0d33 cc0ea1        	jp	L1371
4706  0d36               L1561:
4707                     ; 639 				case SCREEN_STD_MSG_WRONG_MEMORY_SLOT:
4707                     ; 640 					screenBigMessage("Errore: Posizione", "non disponibile");
4709  0d36 ae20          	ld	x,#high(L7402)
4710  0d38 bf02          	ld	_screenBigMessage$L+2,x
4711  0d3a a620          	ld	a,#low(L7402)
4712  0d3c b703          	ld	_screenBigMessage$L+3,a
4713  0d3e a630          	ld	a,#low(L5402)
4714  0d40 ae30          	ld	x,#high(L5402)
4715  0d42 cd01f1        	call	_screenBigMessage
4717                     ; 641 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4719  0d45 a602          	ld	a,#2
4720  0d47 b702          	ld	_parametersSet$L+2,a
4721  0d49 3f01          	clr	_parametersSet$L+1
4722  0d4b a60e          	ld	a,#14
4723  0d4d cd0000        	call	_parametersSet
4725                     ; 642 					break;
4727  0d50 cc0ea1        	jp	L1371
4728  0d53               L3561:
4729                     ; 643 				case SCREEN_STD_MSG_CHECK_PUMP:
4729                     ; 644 					screenBigMessage("Controllo pompa", "in corso");
4731  0d53 aebd          	ld	x,#high(L3202)
4732  0d55 bf02          	ld	_screenBigMessage$L+2,x
4733  0d57 a6bd          	ld	a,#low(L3202)
4734  0d59 b703          	ld	_screenBigMessage$L+3,a
4735  0d5b a610          	ld	a,#low(L1502)
4736  0d5d ae10          	ld	x,#high(L1502)
4737  0d5f cd01f1        	call	_screenBigMessage
4739                     ; 645 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4741  0d62 a602          	ld	a,#2
4742  0d64 b702          	ld	_parametersSet$L+2,a
4743  0d66 3f01          	clr	_parametersSet$L+1
4744  0d68 a60e          	ld	a,#14
4745  0d6a cd0000        	call	_parametersSet
4747                     ; 646 					break;					
4749  0d6d cc0ea1        	jp	L1371
4750  0d70               L5561:
4751                     ; 647 				default:
4751                     ; 648 					break;
4753  0d70 cc0ea1        	jp	L1371
4754  0d73               L1602:
4755                     ; 650 			break;
4757  0d73 cc0ea1        	jp	L1371
4758  0d76               L7561:
4759                     ; 651 		default:  	//PARAM_LANGUAGE_IT - Italian
4759                     ; 652 			switch(a_byStdMessage)
4761  0d76 b600          	ld	a,_screenBigStdMessage$L
4763                     ; 695 				default:
4763                     ; 696 					break;
4764  0d78 a10e          	cp	a,#14
4765  0d7a 240b          	jruge	L261
4766  0d7c 48            	sll	a
4767  0d7d 97            	ld	x,a
4768  0d7e d60072        	ld	a,(L461+1,x)
4769  0d81 88            	push	a
4770  0d82 d60071        	ld	a,(L461,x)
4771  0d85 88            	push	a
4772  0d86 81            	ret
4773  0d87               L261:
4774  0d87 cc0ea1        	jp	L1371
4775  0d8a               L1661:
4776                     ; 654 				case SCREEN_STD_MSG_INIT_PARAM:
4776                     ; 655 					screenBigMessage("Inizializzazione", "parametri");
4778  0d8a aeee          	ld	x,#high(L3102)
4779  0d8c bf02          	ld	_screenBigMessage$L+2,x
4780  0d8e a6ee          	ld	a,#low(L3102)
4781  0d90 b703          	ld	_screenBigMessage$L+3,a
4782  0d92 a6f8          	ld	a,#low(L1102)
4783  0d94 aef8          	ld	x,#high(L1102)
4784  0d96 cd01f1        	call	_screenBigMessage
4786                     ; 656 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4788  0d99 a602          	ld	a,#2
4789  0d9b b702          	ld	_parametersSet$L+2,a
4790  0d9d 3f01          	clr	_parametersSet$L+1
4791  0d9f a60e          	ld	a,#14
4792  0da1 cd0000        	call	_parametersSet
4794                     ; 657 					break;
4796  0da4 cc0ea1        	jp	L1371
4797  0da7               L3661:
4798                     ; 658 				case SCREEN_STD_MSG_WASHING:
4798                     ; 659 					screenBigMessage("Contro-lavaggio", "pompa");			
4800  0da7 aed8          	ld	x,#high(L7102)
4801  0da9 bf02          	ld	_screenBigMessage$L+2,x
4802  0dab a6d8          	ld	a,#low(L7102)
4803  0dad b703          	ld	_screenBigMessage$L+3,a
4804  0daf a6de          	ld	a,#low(L5102)
4805  0db1 aede          	ld	x,#high(L5102)
4806  0db3 cd01f1        	call	_screenBigMessage
4808                     ; 660 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4810  0db6 a602          	ld	a,#2
4811  0db8 b702          	ld	_parametersSet$L+2,a
4812  0dba 3f01          	clr	_parametersSet$L+1
4813  0dbc a60e          	ld	a,#14
4814  0dbe cd0000        	call	_parametersSet
4816                     ; 661 					break;
4818  0dc1 cc0ea1        	jp	L1371
4819  0dc4               L5661:
4820                     ; 662 				case SCREEN_STD_MSG_ADDING_SOLVENT:
4820                     ; 663 					screenBigMessage("Aggiunta solvente", "in corso");
4822  0dc4 aebd          	ld	x,#high(L3202)
4823  0dc6 bf02          	ld	_screenBigMessage$L+2,x
4824  0dc8 a6bd          	ld	a,#low(L3202)
4825  0dca b703          	ld	_screenBigMessage$L+3,a
4826  0dcc a6c6          	ld	a,#low(L1202)
4827  0dce aec6          	ld	x,#high(L1202)
4828  0dd0 cd01f1        	call	_screenBigMessage
4830                     ; 664 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4832  0dd3 a602          	ld	a,#2
4833  0dd5 b702          	ld	_parametersSet$L+2,a
4834  0dd7 3f01          	clr	_parametersSet$L+1
4835  0dd9 a60e          	ld	a,#14
4836  0ddb cd0000        	call	_parametersSet
4838                     ; 665 					break;
4840  0dde cc0ea1        	jp	L1371
4841  0de1               L7661:
4842                     ; 666 				case SCREEN_STD_MSG_RESET:
4842                     ; 667 					screenBigMessage("Riavvio ViscoWal", "in corso");
4844  0de1 aebd          	ld	x,#high(L3202)
4845  0de3 bf02          	ld	_screenBigMessage$L+2,x
4846  0de5 a6bd          	ld	a,#low(L3202)
4847  0de7 b703          	ld	_screenBigMessage$L+3,a
4848  0de9 a6ac          	ld	a,#low(L5202)
4849  0deb aeac          	ld	x,#high(L5202)
4850  0ded cd01f1        	call	_screenBigMessage
4852                     ; 668 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4854  0df0 a602          	ld	a,#2
4855  0df2 b702          	ld	_parametersSet$L+2,a
4856  0df4 3f01          	clr	_parametersSet$L+1
4857  0df6 a60e          	ld	a,#14
4858  0df8 cd0000        	call	_parametersSet
4860                     ; 669 					break;
4862  0dfb cc0ea1        	jp	L1371
4863  0dfe               L1761:
4864                     ; 670 				case SCREEN_STD_MSG_PARAMETER_SAVED:
4864                     ; 671 					screenBigMessage("Parametro salvato:", m_strString1);			
4866  0dfe ae15          	ld	x,#high(_m_strString1)
4867  0e00 bf02          	ld	_screenBigMessage$L+2,x
4868  0e02 a615          	ld	a,#low(_m_strString1)
4869  0e04 b703          	ld	_screenBigMessage$L+3,a
4870  0e06 a699          	ld	a,#low(L7202)
4871  0e08 ae99          	ld	x,#high(L7202)
4872  0e0a cd01f1        	call	_screenBigMessage
4874                     ; 672 					break;
4876  0e0d cc0ea1        	jp	L1371
4877  0e10               L3761:
4878                     ; 673 				case SCREEN_STD_MSG_CMD_DONE:
4878                     ; 674 					screenBigMessage("Comando eseguito", "correttamente");
4880  0e10 ae7a          	ld	x,#high(L3302)
4881  0e12 bf02          	ld	_screenBigMessage$L+2,x
4882  0e14 a67a          	ld	a,#low(L3302)
4883  0e16 b703          	ld	_screenBigMessage$L+3,a
4884  0e18 a688          	ld	a,#low(L1302)
4885  0e1a ae88          	ld	x,#high(L1302)
4886  0e1c cd01f1        	call	_screenBigMessage
4888                     ; 675 					break;
4890  0e1f cc0ea1        	jp	L1371
4891  0e22               L5761:
4892                     ; 676 				case SCREEN_STD_MSG_CMD_NA:
4892                     ; 677 					screenBigMessage("Comando non", "disponibile");
4894  0e22 ae62          	ld	x,#high(L7302)
4895  0e24 bf02          	ld	_screenBigMessage$L+2,x
4896  0e26 a662          	ld	a,#low(L7302)
4897  0e28 b703          	ld	_screenBigMessage$L+3,a
4898  0e2a a66e          	ld	a,#low(L5302)
4899  0e2c ae6e          	ld	x,#high(L5302)
4900  0e2e cd01f1        	call	_screenBigMessage
4902                     ; 678 					break;
4904  0e31 206e          	jra	L1371
4905  0e33               L7761:
4906                     ; 679 				case SCREEN_STD_MSG_SW_VERSION:
4906                     ; 680 					screenBigMessage("Versione SW", "");
4908  0e33 ae43          	ld	x,#high(L1771)
4909  0e35 bf02          	ld	_screenBigMessage$L+2,x
4910  0e37 a643          	ld	a,#low(L1771)
4911  0e39 b703          	ld	_screenBigMessage$L+3,a
4912  0e3b a6d3          	ld	a,#low(L5051)
4913  0e3d aed3          	ld	x,#high(L5051)
4914  0e3f cd01f1        	call	_screenBigMessage
4916                     ; 681 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4918  0e42 a602          	ld	a,#2
4919  0e44 b702          	ld	_parametersSet$L+2,a
4920  0e46 3f01          	clr	_parametersSet$L+1
4921  0e48 a60e          	ld	a,#14
4922  0e4a cd0000        	call	_parametersSet
4924                     ; 682 					break;
4926  0e4d 2052          	jra	L1371
4927  0e4f               L1071:
4928                     ; 683 				case SCREEN_STD_MSG_PARAMETER_VALUE_NA:
4928                     ; 684 					screenBigMessage("Errore: Valore ", "non accettabile");
4930  0e4f ae42          	ld	x,#high(L3402)
4931  0e51 bf02          	ld	_screenBigMessage$L+2,x
4932  0e53 a642          	ld	a,#low(L3402)
4933  0e55 b703          	ld	_screenBigMessage$L+3,a
4934  0e57 a652          	ld	a,#low(L1402)
4935  0e59 ae52          	ld	x,#high(L1402)
4936  0e5b cd01f1        	call	_screenBigMessage
4938                     ; 685 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4940  0e5e a602          	ld	a,#2
4941  0e60 b702          	ld	_parametersSet$L+2,a
4942  0e62 3f01          	clr	_parametersSet$L+1
4943  0e64 a60e          	ld	a,#14
4944  0e66 cd0000        	call	_parametersSet
4946                     ; 686 					break;
4948  0e69 2036          	jra	L1371
4949  0e6b               L3071:
4950                     ; 687 				case SCREEN_STD_MSG_WRONG_MEMORY_SLOT:
4950                     ; 688 					screenBigMessage("Errore: Posizione", "non disponibile");
4952  0e6b ae20          	ld	x,#high(L7402)
4953  0e6d bf02          	ld	_screenBigMessage$L+2,x
4954  0e6f a620          	ld	a,#low(L7402)
4955  0e71 b703          	ld	_screenBigMessage$L+3,a
4956  0e73 a630          	ld	a,#low(L5402)
4957  0e75 ae30          	ld	x,#high(L5402)
4958  0e77 cd01f1        	call	_screenBigMessage
4960                     ; 689 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4962  0e7a a602          	ld	a,#2
4963  0e7c b702          	ld	_parametersSet$L+2,a
4964  0e7e 3f01          	clr	_parametersSet$L+1
4965  0e80 a60e          	ld	a,#14
4966  0e82 cd0000        	call	_parametersSet
4968                     ; 690 					break;
4970  0e85 201a          	jra	L1371
4971  0e87               L5071:
4972                     ; 691 				case SCREEN_STD_MSG_CHECK_PUMP:
4972                     ; 692 					screenBigMessage("Controllo pompa", "in corso");
4974  0e87 aebd          	ld	x,#high(L3202)
4975  0e89 bf02          	ld	_screenBigMessage$L+2,x
4976  0e8b a6bd          	ld	a,#low(L3202)
4977  0e8d b703          	ld	_screenBigMessage$L+3,a
4978  0e8f a610          	ld	a,#low(L1502)
4979  0e91 ae10          	ld	x,#high(L1502)
4980  0e93 cd01f1        	call	_screenBigMessage
4982                     ; 693 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4984  0e96 a602          	ld	a,#2
4985  0e98 b702          	ld	_parametersSet$L+2,a
4986  0e9a 3f01          	clr	_parametersSet$L+1
4987  0e9c a60e          	ld	a,#14
4988  0e9e cd0000        	call	_parametersSet
4990                     ; 694 					break;					
4992  0ea1               L7071:
4993                     ; 695 				default:
4993                     ; 696 					break;
4995  0ea1               L5602:
4996                     ; 698 			break;
4998  0ea1               L1371:
4999                     ; 700 }
5002  0ea1 81            	ret
5040                     ; 703 void screenPrepareStdMessage(BYTE a_byStdMessage)
5040                     ; 704 {
5041                     	switch	.text
5043                     	xref.b	_screenPrepareStdMessage$L
5044  0ea2               _screenPrepareStdMessage:
5046  0ea2 b700          	ld	_screenPrepareStdMessage$L,a
5048                     ; 705 	switch(parametersGetValue(PARAM_LANGUAGE))
5050  0ea4 a61f          	ld	a,#31
5051  0ea6 cd0000        	call	_parametersGetValue
5053  0ea9 a101          	cp	a,#1
5054  0eab 2602          	jrne	L202
5055  0ead a300          	cp	x,#0
5056  0eaf               L202:
5057  0eaf 2703          	jreq	L402
5058  0eb1 cc0f45        	jp	L1012
5059  0eb4               L402:
5062  0eb4               L7602:
5063                     ; 707 		case PARAM_LANGUAGE_EN: //English
5063                     ; 708 			switch(a_byStdMessage)
5065  0eb4 b600          	ld	a,_screenPrepareStdMessage$L
5067                     ; 722 				default:
5067                     ; 723 					break;
5068  0eb6 a003          	sub	a,#3
5069  0eb8 275c          	jreq	L5702
5070  0eba a006          	sub	a,#6
5071  0ebc 272f          	jreq	L3702
5072  0ebe 4a            	dec	a
5073  0ebf 2703          	jreq	L602
5074  0ec1 cc0fca        	jp	L3312
5075  0ec4               L602:
5076                     ; 710 				case SCREEN_STD_MSG_SAVE_JOB:
5076                     ; 711 					memcpy(m_strString1, "Save Job", 20);
5078  0ec4 a614          	ld	a,#20
5079  0ec6 b704          	ld	_memcpy$L+4,a
5080  0ec8 ae07          	ld	x,#high(L1412)
5081  0eca bf02          	ld	_memcpy$L+2,x
5082  0ecc a607          	ld	a,#low(L1412)
5083  0ece b703          	ld	_memcpy$L+3,a
5084  0ed0 a615          	ld	a,#low(_m_strString1)
5085  0ed2 ae15          	ld	x,#high(_m_strString1)
5086  0ed4 cd0000        	call	_memcpy
5088                     ; 712 					memcpy(m_strString2, "      mem. position", 20);		
5090  0ed7 a614          	ld	a,#20
5091  0ed9 b704          	ld	_memcpy$L+4,a
5092  0edb aef3          	ld	x,#high(L3412)
5093  0edd bf02          	ld	_memcpy$L+2,x
5094  0edf a6f3          	ld	a,#low(L3412)
5095  0ee1 b703          	ld	_memcpy$L+3,a
5096  0ee3 a601          	ld	a,#low(_m_strString2)
5097  0ee5 ae01          	ld	x,#high(_m_strString2)
5098  0ee7 cd0000        	call	_memcpy
5100                     ; 713 					break;
5102  0eea cc0fca        	jp	L3312
5103  0eed               L3702:
5104                     ; 714 				case SCREEN_STD_MSG_LOAD_JOB:
5104                     ; 715 					memcpy(m_strString1, "Load Job", 20);
5106  0eed a614          	ld	a,#20
5107  0eef b704          	ld	_memcpy$L+4,a
5108  0ef1 aeea          	ld	x,#high(L5412)
5109  0ef3 bf02          	ld	_memcpy$L+2,x
5110  0ef5 a6ea          	ld	a,#low(L5412)
5111  0ef7 b703          	ld	_memcpy$L+3,a
5112  0ef9 a615          	ld	a,#low(_m_strString1)
5113  0efb ae15          	ld	x,#high(_m_strString1)
5114  0efd cd0000        	call	_memcpy
5116                     ; 716 					memcpy(m_strString2, "      mem. position", 20);		
5118  0f00 a614          	ld	a,#20
5119  0f02 b704          	ld	_memcpy$L+4,a
5120  0f04 aef3          	ld	x,#high(L3412)
5121  0f06 bf02          	ld	_memcpy$L+2,x
5122  0f08 a6f3          	ld	a,#low(L3412)
5123  0f0a b703          	ld	_memcpy$L+3,a
5124  0f0c a601          	ld	a,#low(_m_strString2)
5125  0f0e ae01          	ld	x,#high(_m_strString2)
5126  0f10 cd0000        	call	_memcpy
5128                     ; 717 					break;
5130  0f13 cc0fca        	jp	L3312
5131  0f16               L5702:
5132                     ; 718 				case SCREEN_STD_MSG_CALIBRATION:
5132                     ; 719 					memcpy(m_strString1, "Viscosity value", 20);
5134  0f16 a614          	ld	a,#20
5135  0f18 b704          	ld	_memcpy$L+4,a
5136  0f1a aeda          	ld	x,#high(L7412)
5137  0f1c bf02          	ld	_memcpy$L+2,x
5138  0f1e a6da          	ld	a,#low(L7412)
5139  0f20 b703          	ld	_memcpy$L+3,a
5140  0f22 a615          	ld	a,#low(_m_strString1)
5141  0f24 ae15          	ld	x,#high(_m_strString1)
5142  0f26 cd0000        	call	_memcpy
5144                     ; 720 					memcpy(m_strString2, "      (sec)", 20);		
5146  0f29 a614          	ld	a,#20
5147  0f2b b704          	ld	_memcpy$L+4,a
5148  0f2d aece          	ld	x,#high(L1512)
5149  0f2f bf02          	ld	_memcpy$L+2,x
5150  0f31 a6ce          	ld	a,#low(L1512)
5151  0f33 b703          	ld	_memcpy$L+3,a
5152  0f35 a601          	ld	a,#low(_m_strString2)
5153  0f37 ae01          	ld	x,#high(_m_strString2)
5154  0f39 cd0000        	call	_memcpy
5156                     ; 721 					break;
5158  0f3c cc0fca        	jp	L3312
5159  0f3f               L7702:
5160                     ; 722 				default:
5160                     ; 723 					break;
5162  0f3f cc0fca        	jp	L3312
5163  0f42               L7312:
5164                     ; 725 			break;
5166  0f42 cc0fca        	jp	L3312
5167  0f45               L1012:
5168                     ; 726 		default:  	//PARAM_LANGUAGE_IT - Italian
5168                     ; 727 			switch(a_byStdMessage)
5170  0f45 b600          	ld	a,_screenPrepareStdMessage$L
5172                     ; 741 				default:
5172                     ; 742 					break;
5173  0f47 a003          	sub	a,#3
5174  0f49 2759          	jreq	L7012
5175  0f4b a006          	sub	a,#6
5176  0f4d 272d          	jreq	L5012
5177  0f4f 4a            	dec	a
5178  0f50 2702          	jreq	L012
5179  0f52 2076          	jp	L3312
5180  0f54               L012:
5181                     ; 729 				case SCREEN_STD_MSG_SAVE_JOB:
5181                     ; 730 					memcpy(m_strString1, "Salva lavoro", 20);
5183  0f54 a614          	ld	a,#20
5184  0f56 b704          	ld	_memcpy$L+4,a
5185  0f58 aec1          	ld	x,#high(L7512)
5186  0f5a bf02          	ld	_memcpy$L+2,x
5187  0f5c a6c1          	ld	a,#low(L7512)
5188  0f5e b703          	ld	_memcpy$L+3,a
5189  0f60 a615          	ld	a,#low(_m_strString1)
5190  0f62 ae15          	ld	x,#high(_m_strString1)
5191  0f64 cd0000        	call	_memcpy
5193                     ; 731 					memcpy(m_strString2, "      posizione mem", 20);		
5195  0f67 a614          	ld	a,#20
5196  0f69 b704          	ld	_memcpy$L+4,a
5197  0f6b aead          	ld	x,#high(L1612)
5198  0f6d bf02          	ld	_memcpy$L+2,x
5199  0f6f a6ad          	ld	a,#low(L1612)
5200  0f71 b703          	ld	_memcpy$L+3,a
5201  0f73 a601          	ld	a,#low(_m_strString2)
5202  0f75 ae01          	ld	x,#high(_m_strString2)
5203  0f77 cd0000        	call	_memcpy
5205                     ; 732 					break;
5207  0f7a 204e          	jra	L3312
5208  0f7c               L5012:
5209                     ; 733 				case SCREEN_STD_MSG_LOAD_JOB:
5209                     ; 734 					memcpy(m_strString1, "Carica lavoro", 20);
5211  0f7c a614          	ld	a,#20
5212  0f7e b704          	ld	_memcpy$L+4,a
5213  0f80 ae9f          	ld	x,#high(L3612)
5214  0f82 bf02          	ld	_memcpy$L+2,x
5215  0f84 a69f          	ld	a,#low(L3612)
5216  0f86 b703          	ld	_memcpy$L+3,a
5217  0f88 a615          	ld	a,#low(_m_strString1)
5218  0f8a ae15          	ld	x,#high(_m_strString1)
5219  0f8c cd0000        	call	_memcpy
5221                     ; 735 					memcpy(m_strString2, "      posizione mem", 20);
5223  0f8f a614          	ld	a,#20
5224  0f91 b704          	ld	_memcpy$L+4,a
5225  0f93 aead          	ld	x,#high(L1612)
5226  0f95 bf02          	ld	_memcpy$L+2,x
5227  0f97 a6ad          	ld	a,#low(L1612)
5228  0f99 b703          	ld	_memcpy$L+3,a
5229  0f9b a601          	ld	a,#low(_m_strString2)
5230  0f9d ae01          	ld	x,#high(_m_strString2)
5231  0f9f cd0000        	call	_memcpy
5233                     ; 736 					break;
5235  0fa2 2026          	jra	L3312
5236  0fa4               L7012:
5237                     ; 737 				case SCREEN_STD_MSG_CALIBRATION:
5237                     ; 738 					memcpy(m_strString1, "Valore Viscosita'", 20);
5239  0fa4 a614          	ld	a,#20
5240  0fa6 b704          	ld	_memcpy$L+4,a
5241  0fa8 ae8d          	ld	x,#high(L5612)
5242  0faa bf02          	ld	_memcpy$L+2,x
5243  0fac a68d          	ld	a,#low(L5612)
5244  0fae b703          	ld	_memcpy$L+3,a
5245  0fb0 a615          	ld	a,#low(_m_strString1)
5246  0fb2 ae15          	ld	x,#high(_m_strString1)
5247  0fb4 cd0000        	call	_memcpy
5249                     ; 739 					memcpy(m_strString2, "      (sec)", 20);		
5251  0fb7 a614          	ld	a,#20
5252  0fb9 b704          	ld	_memcpy$L+4,a
5253  0fbb aece          	ld	x,#high(L1512)
5254  0fbd bf02          	ld	_memcpy$L+2,x
5255  0fbf a6ce          	ld	a,#low(L1512)
5256  0fc1 b703          	ld	_memcpy$L+3,a
5257  0fc3 a601          	ld	a,#low(_m_strString2)
5258  0fc5 ae01          	ld	x,#high(_m_strString2)
5259  0fc7 cd0000        	call	_memcpy
5261                     ; 740 					break;
5262  0fca               L3312:
5263                     ; 746 }
5266  0fca 81            	ret
5267  0fcb               L1112:
5268                     ; 741 				default:
5268                     ; 742 					break;
5270  0fcb 20fd          	jra	L3312
5271  0fcd               L5512:
5272                     ; 744 			break;
5274  0fcd 20fb          	jra	L3312
5299                     ; 749 void screenHistoricalValues(void)
5299                     ; 750 {	
5300                     	switch	.text
5301  0fcf               _screenHistoricalValues:
5304                     ; 751 	window6Messages();					
5306  0fcf cd0000        	call	_window6Messages
5308                     ; 752 	parametersSet(PARAM_PAGE, PAGE_HISTORY_VALUE);
5310  0fd2 a613          	ld	a,#19
5311  0fd4 b702          	ld	_parametersSet$L+2,a
5312  0fd6 3f01          	clr	_parametersSet$L+1
5313  0fd8 a60e          	ld	a,#14
5314  0fda cd0000        	call	_parametersSet
5316                     ; 753 }
5319  0fdd 81            	ret
5389                     	xdef	_screenPrepareStdMessage
5390                     	xdef	_screenBigMessage
5391                     	switch	.bss
5392  0000               _m_byDecimal:
5393  0000 00            	ds.b	1
5394                     	xdef	_m_byDecimal
5395  0001               _m_strString2:
5396  0001 000000000000  	ds.b	20
5397                     	xdef	_m_strString2
5398  0015               _m_strString1:
5399  0015 000000000000  	ds.b	20
5400                     	xdef	_m_strString1
5401  0029               _m_byValueChanged:
5402  0029 00            	ds.b	1
5403                     	xdef	_m_byValueChanged
5404  002a               _m_bySelectedMenu:
5405  002a 00            	ds.b	1
5406                     	xdef	_m_bySelectedMenu
5407  002b               _m_woCurrentValue:
5408  002b 0000          	ds.b	2
5409                     	xdef	_m_woCurrentValue
5410                     	xdef	_screenHistoricalValues
5411                     	xdef	_screenKeyCode
5412                     	xdef	_screenDisplayKeyCode
5413                     	xdef	_screenReceivedCode
5414                     	xdef	_screenVersion
5415                     	xdef	_screenArchive
5416                     	xdef	_screenSetUpParameter
5417                     	xdef	_screenValue
5418                     	xdef	_screen6Menus
5419                     	xdef	_screenBigStdMessage
5420                     	xdef	_screenAlarm
5421                     	xdef	_screenMain
5422                     	xdef	_screenUpdateCurrentScreen
5423                     	xdef	_screenInit
5424                     	xref	_formatNumberBinary
5425                     	xref	_formatNumber
5426                     	xref	_memcpy
5427                     	xref	_sleepFix
5428                     	xref	_sleepSec
5429                     	xref	_window6Messages
5430                     	xref	_window6Menu
5431                     	xref	_windowSetupParameter
5432                     	xref	_windowForceRepaint
5433                     	xref	_windowMain
5434                     	xref	_windowAlarm
5435                     	xref	_windowBigMessage
5436                     	xref	_windowTemperature
5437                     	xref	_windowViscosityReal
5438                     	xref	_windowViscosityRef
5439                     	xref	_windowMode
5440                     	xref	_windowInit
5441                     	xref	_displaySetOutLine
5442                     	xref	_displayClearArea
5443                     	xref	_displayWriteString
5444                     	xref	_displayCmdToDisplay
5445                     	xref	_displayKeyPressedReset
5446                     	xref	_displayGetKeyPressed
5447                     	xref	_parametersInitVisibleFlagsSimple
5448                     	xref	_parametersInitVisibleFlags
5449                     	xref	_parametersGetLabel
5450                     	xref	_parametersChangedFlagReset
5451                     	xref	_parametersSet
5452                     	xref	_parametersGetValue
5453                     	xref	_parametersLoadJob
5454                     	xref	_parametersSaveJob
5455                     	switch	.const
5456  008d               L5612:
5457  008d 56616c6f7265  	dc.b	"Valore Viscosita'",0
5458  009f               L3612:
5459  009f 436172696361  	dc.b	"Carica lavoro",0
5460  00ad               L1612:
5461  00ad 202020202020  	dc.b	"      posizione me"
5462  00bf 6d00          	dc.b	"m",0
5463  00c1               L7512:
5464  00c1 53616c766120  	dc.b	"Salva lavoro",0
5465  00ce               L1512:
5466  00ce 202020202020  	dc.b	"      (sec)",0
5467  00da               L7412:
5468  00da 566973636f73  	dc.b	"Viscosity value",0
5469  00ea               L5412:
5470  00ea 4c6f6164204a  	dc.b	"Load Job",0
5471  00f3               L3412:
5472  00f3 202020202020  	dc.b	"      mem. positio"
5473  0105 6e00          	dc.b	"n",0
5474  0107               L1412:
5475  0107 53617665204a  	dc.b	"Save Job",0
5476  0110               L1502:
5477  0110 436f6e74726f  	dc.b	"Controllo pompa",0
5478  0120               L7402:
5479  0120 6e6f6e206469  	dc.b	"non disponibile",0
5480  0130               L5402:
5481  0130 4572726f7265  	dc.b	"Errore: Posizione",0
5482  0142               L3402:
5483  0142 6e6f6e206163  	dc.b	"non accettabile",0
5484  0152               L1402:
5485  0152 4572726f7265  	dc.b	"Errore: Valore ",0
5486  0162               L7302:
5487  0162 646973706f6e  	dc.b	"disponibile",0
5488  016e               L5302:
5489  016e 436f6d616e64  	dc.b	"Comando non",0
5490  017a               L3302:
5491  017a 636f72726574  	dc.b	"correttamente",0
5492  0188               L1302:
5493  0188 436f6d616e64  	dc.b	"Comando eseguito",0
5494  0199               L7202:
5495  0199 506172616d65  	dc.b	"Parametro salvato:",0
5496  01ac               L5202:
5497  01ac 526961767669  	dc.b	"Riavvio ViscoWal",0
5498  01bd               L3202:
5499  01bd 696e20636f72  	dc.b	"in corso",0
5500  01c6               L1202:
5501  01c6 41676769756e  	dc.b	"Aggiunta solvente",0
5502  01d8               L7102:
5503  01d8 706f6d706100  	dc.b	"pompa",0
5504  01de               L5102:
5505  01de 436f6e74726f  	dc.b	"Contro-lavaggio",0
5506  01ee               L3102:
5507  01ee 706172616d65  	dc.b	"parametri",0
5508  01f8               L1102:
5509  01f8 496e697a6961  	dc.b	"Inizializzazione",0
5510  0209               L3002:
5511  0209 70756d702e2e  	dc.b	"pump...",0
5512  0211               L1002:
5513  0211 436865636b69  	dc.b	"Checking",0
5514  021a               L7771:
5515  021a 4572726f723a  	dc.b	"Error: Position",0
5516  022a               L5771:
5517  022a 556e61636365  	dc.b	"Unacceptable value",0
5518  023d               L3771:
5519  023d 4572726f7200  	dc.b	"Error",0
5520  0243               L1771:
5521  0243 00            	dc.b	0
5522  0244               L7671:
5523  0244 535720566572  	dc.b	"SW Version",0
5524  024f               L5671:
5525  024f 6e6f74206176  	dc.b	"not available",0
5526  025d               L3671:
5527  025d 646f6e6500    	dc.b	"done",0
5528  0262               L1671:
5529  0262 436f6d6d616e  	dc.b	"Command",0
5530  026a               L7571:
5531  026a 506172616d65  	dc.b	"Parameter saved:",0
5532  027b               L5571:
5533  027b 566973636f57  	dc.b	"ViscoWal...",0
5534  0287               L3571:
5535  0287 526573746172  	dc.b	"Restarting",0
5536  0292               L1571:
5537  0292 736f6c76656e  	dc.b	"solvent...",0
5538  029d               L7471:
5539  029d 416464696e67  	dc.b	"Adding",0
5540  02a4               L5471:
5541  02a4 766973636f6d  	dc.b	"viscometer...",0
5542  02b2               L3471:
5543  02b2 57617368696e  	dc.b	"Washing",0
5544  02ba               L1471:
5545  02ba 496e69746961  	dc.b	"Initialization",0
5546  02c9               L7371:
5547  02c9 506172616d65  	dc.b	"Parameter",0
5548  02d3               L5051:
5549  02d3 56657273696f  	dc.b	"Versione SW",0
5550  02df               L3051:
5551  02df 762020202020  	dc.b	"v     ",0
5552  02e6               L1051:
5553  02e6 43707520426f  	dc.b	"Cpu Board ",0
5554  02f1               L1641:
5555  02f1 286f70657261  	dc.b	"(operativo)",0
5556  02fd               L7541:
5557  02fd 415243484956  	dc.b	"ARCHIVE",0
5558  0305               L5601:
5559  0305 4b6579506164  	dc.b	"KeyPad = ",0
5560  030f               L5101:
5561  030f 56616c756520  	dc.b	"Value  = ",0
5562  0319               L3101:
5563  0319 436f64652032  	dc.b	"Code 2 = ",0
5564  0323               L1101:
5565  0323 436f64652031  	dc.b	"Code 1 = ",0
5566                     	xref.b	c_y
5586                     	xref.b	_windowSetupParameter$L
5587                     	xref.b	_screenBigMessage$L
5588                     	xref.b	_window6Menu$L
5589                     	xref.b	_windowBigMessage$L
5590                     	xref.b	_formatNumberBinary$L
5591                     	xref.b	_screenReceivedCode$L
5592                     	xref.b	_parametersSet$L
5593                     	xref.b	_displayWriteString$L
5594                     	xref.b	_formatNumber$L
5595                     	xref.b	_memcpy$L
5596                     	xref.b	_displaySetOutLine$L
5597                     	xref.b	_displayClearArea$L
5598                     	end
