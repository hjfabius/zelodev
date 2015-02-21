   1                     ; C Compiler for ST7 (COSMIC Software)
   2                     ; Generator V4.5.5 - 12 Jan 2006
1280                     .const:	section	.text
1281  0000               L327_mc_byApplicationVersion:
1282  0000 9d            	dc.b	157
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
1457  002a ae0c          	ld	x,#high(L1101)
1458  002c bf02          	ld	_memcpy$L+2,x
1459  002e a60c          	ld	a,#low(L1101)
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
1494  0062 ae02          	ld	x,#high(L3101)
1495  0064 bf02          	ld	_memcpy$L+2,x
1496  0066 a602          	ld	a,#low(L3101)
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
1534  009c aef8          	ld	x,#high(L5101)
1535  009e bf02          	ld	_memcpy$L+2,x
1536  00a0 a6f8          	ld	a,#low(L5101)
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
1572  00d7 a608          	ld	a,#8
1573  00d9 cd0000        	call	_parametersSet
1575                     ; 52 }
1578  00dc 81            	ret
1602                     ; 55 void screenKeyCode(void)
1602                     ; 56 {
1603                     	switch	.text
1604  00dd               _screenKeyCode:
1607                     ; 57 	screenDisplayKeyCode(displayGetKeyPressed());
1609  00dd cd0000        	call	_displayGetKeyPressed
1611  00e0 ad01          	call	_screenDisplayKeyCode
1613                     ; 58 }
1616  00e2 81            	ret
1675                     ; 61 void screenDisplayKeyCode(BYTE a_byKey)
1675                     ; 62 {
1676                     	switch	.text
1678                     	xref.b	_screenDisplayKeyCode$L
1679  00e3               _screenDisplayKeyCode:
1681  00e3 b700          	ld	_screenDisplayKeyCode$L,a
1683                     ; 66 	if (a_byKey != KEY_NULL)
1685  00e5 a1ff          	cp	a,#255
1686  00e7 276e          	jreq	L5501
1687                     ; 68 		displayClearArea (0, 0, 126, 126);
1689  00e9 a67e          	ld	a,#126
1690  00eb b703          	ld	_displayClearArea$L+3,a
1691  00ed a67e          	ld	a,#126
1692  00ef b702          	ld	_displayClearArea$L+2,a
1693  00f1 4f            	clr	a
1694  00f2 5f            	clr	x
1695  00f3 cd0000        	call	_displayClearArea
1697                     ; 69 		displaySetOutLine(0, 0, 126, 126, false);	
1699  00f6 3f04          	clr	_displaySetOutLine$L+4
1700  00f8 a67e          	ld	a,#126
1701  00fa b703          	ld	_displaySetOutLine$L+3,a
1702  00fc a67e          	ld	a,#126
1703  00fe b702          	ld	_displaySetOutLine$L+2,a
1704  0100 4f            	clr	a
1705  0101 5f            	clr	x
1706  0102 cd0000        	call	_displaySetOutLine
1708                     ; 70 		strString[0] = DISPLAY_CURSOR_POSITION;
1710  0105 a610          	ld	a,#16
1711  0107 b7ec          	ld	_screenDisplayKeyCode$L-20,a
1712                     ; 71 		strString[1] = 0x0A;
1714  0109 a60a          	ld	a,#10
1715  010b b7ed          	ld	_screenDisplayKeyCode$L-19,a
1716                     ; 72 		strString[2] = 0x0A;
1718  010d a60a          	ld	a,#10
1719  010f b7ee          	ld	_screenDisplayKeyCode$L-18,a
1720                     ; 73 		strString[3] = DISPLAY_WAIT;
1722  0111 a6fe          	ld	a,#254
1723  0113 b7ef          	ld	_screenDisplayKeyCode$L-17,a
1724                     ; 74 		strString[4] = DISPLAY_EOF;
1726  0115 a6ff          	ld	a,#255
1727  0117 b7f0          	ld	_screenDisplayKeyCode$L-16,a
1728                     ; 75 		displayCmdToDisplay(strString);
1730  0119 a6ec          	ld	a,#_screenDisplayKeyCode$L-20
1731  011b 5f            	clr	x
1732  011c cd0000        	call	_displayCmdToDisplay
1734                     ; 77 		for (i=0x00;i<20; i++)
1736  011f 3feb          	clr	_screenDisplayKeyCode$L-21
1737  0121               L7501:
1738                     ; 79 			strString[i] = 0x00;
1740  0121 beeb          	ld	x,_screenDisplayKeyCode$L-21
1741  0123 4f            	clr	a
1742  0124 e7ec          	ld	(_screenDisplayKeyCode$L-20,x),a
1743                     ; 77 		for (i=0x00;i<20; i++)
1745  0126 3ceb          	inc	_screenDisplayKeyCode$L-21
1748  0128 b6eb          	ld	a,_screenDisplayKeyCode$L-21
1749  012a a114          	cp	a,#20
1750  012c 25f3          	jrult	L7501
1751                     ; 81 		memcpy(strString, "KeyPad = ", 9); 
1753  012e a609          	ld	a,#9
1754  0130 b704          	ld	_memcpy$L+4,a
1755  0132 aeee          	ld	x,#high(L5601)
1756  0134 bf02          	ld	_memcpy$L+2,x
1757  0136 a6ee          	ld	a,#low(L5601)
1758  0138 b703          	ld	_memcpy$L+3,a
1759  013a a6ec          	ld	a,#_screenDisplayKeyCode$L-20
1760  013c 5f            	clr	x
1761  013d cd0000        	call	_memcpy
1763                     ; 82 		formatNumberBinary(a_byKey,strString+9);
1765  0140 aef5          	ld	x,#high(_screenDisplayKeyCode$L-11)
1766  0142 bf02          	ld	_formatNumberBinary$L+2,x
1767  0144 a6f5          	ld	a,#low(_screenDisplayKeyCode$L-11)
1768  0146 b703          	ld	_formatNumberBinary$L+3,a
1769  0148 b600          	ld	a,_screenDisplayKeyCode$L
1770  014a 5f            	clr	x
1771  014b cd0000        	call	_formatNumberBinary
1773                     ; 83 		displayCmdToDisplay(strString);	
1775  014e a6ec          	ld	a,#_screenDisplayKeyCode$L-20
1776  0150 5f            	clr	x
1777  0151 cd0000        	call	_displayCmdToDisplay
1779                     ; 84 		displayKeyPressedReset();
1781  0154 cd0000        	call	_displayKeyPressedReset
1783  0157               L5501:
1784                     ; 87 }
1787  0157 81            	ret
1825                     ; 90 void screenUpdateCurrentScreen(void)
1825                     ; 91 {
1826                     	switch	.text
1828                     	xref.b	_screenUpdateCurrentScreen$L
1829  0158               _screenUpdateCurrentScreen:
1832                     ; 94 	byPage = parametersGetValue(PARAM_PAGE); 
1834  0158 a608          	ld	a,#8
1835  015a cd0000        	call	_parametersGetValue
1837  015d b7ff          	ld	_screenUpdateCurrentScreen$L-1,a
1838                     ; 95 	switch(byPage)
1840  015f b6ff          	ld	a,_screenUpdateCurrentScreen$L-1
1842                     ; 127 		default:
1842                     ; 128 			break;
1843  0161 a003          	sub	a,#3
1844  0163 2735          	jreq	L1011
1845  0165 4a            	dec	a
1846  0166 271d          	jreq	L5701
1847  0168 4a            	dec	a
1848  0169 2708          	jreq	L7601
1849  016b 4a            	dec	a
1850  016c 270b          	jreq	L1701
1851  016e 4a            	dec	a
1852  016f 270e          	jreq	L3701
1853  0171 2038          	jra	L5211
1854  0173               L7601:
1855                     ; 97 		case PAGE_OSCILLOSCOPE:
1855                     ; 98 			screenOscilloscope(byPage);
1857  0173 b6ff          	ld	a,_screenUpdateCurrentScreen$L-1
1858  0175 ad35          	call	_screenOscilloscope
1860                     ; 99 			break;
1862  0177 2032          	jra	L5211
1863  0179               L1701:
1864                     ; 100 		case PAGE_PHASE_OSCILL:
1864                     ; 101 			screenOscilloscope(byPage);
1866  0179 b6ff          	ld	a,_screenUpdateCurrentScreen$L-1
1867  017b ad2f          	call	_screenOscilloscope
1869                     ; 102 			break;
1871  017d 202c          	jra	L5211
1872  017f               L3701:
1873                     ; 103 		case PAGE_PHASE_FAST:
1873                     ; 104 			screenOscilloscope(byPage);
1875  017f b6ff          	ld	a,_screenUpdateCurrentScreen$L-1
1876  0181 ad29          	call	_screenOscilloscope
1878                     ; 105 			break;
1880  0183 2026          	jra	L5211
1881  0185               L5701:
1882                     ; 106 		case PAGE_REGISTER:
1882                     ; 107 			if (parametersGetValue(PARAM_ALARM) != STI_ANSWER_OK)
1884  0185 a607          	ld	a,#7
1885  0187 cd0000        	call	_parametersGetValue
1887  018a 4d            	tnz	a
1888  018b 2601          	jrne	L61
1889  018d 5d            	tnz	x
1890  018e               L61:
1891  018e 2704          	jreq	L7211
1892                     ; 109 				screenAlarm();
1894  0190 ad64          	call	_screenAlarm
1897  0192 2017          	jra	L5211
1898  0194               L7211:
1899                     ; 113 				screenRegister();
1901  0194 ad36          	call	_screenRegister
1903  0196 2013          	jra	L5211
1904  0198               L7701:
1905                     ; 116 		case PAGE_MESSAGE:
1905                     ; 117 			break;
1907  0198 2011          	jra	L5211
1908  019a               L1011:
1909                     ; 118 		case PAGE_ALARM:
1909                     ; 119 			if (parametersGetValue(PARAM_ALARM) != STI_ANSWER_OK)
1911  019a a607          	ld	a,#7
1912  019c cd0000        	call	_parametersGetValue
1914  019f 4d            	tnz	a
1915  01a0 2601          	jrne	L02
1916  01a2 5d            	tnz	x
1917  01a3               L02:
1918  01a3 2704          	jreq	L3311
1919                     ; 121 				screenAlarm();
1921  01a5 ad4f          	call	_screenAlarm
1924  01a7 2002          	jra	L5211
1925  01a9               L3311:
1926                     ; 125 				screenRegister();
1928  01a9 ad21          	call	_screenRegister
1930  01ab               L3011:
1931                     ; 127 		default:
1931                     ; 128 			break;
1933  01ab               L5211:
1934                     ; 130 }
1937  01ab 81            	ret
1976                     ; 133 void screenOscilloscope(BYTE a_byPage)
1976                     ; 134 {
1977                     	switch	.text
1979                     	xref.b	_screenOscilloscope$L
1980  01ac               _screenOscilloscope:
1982  01ac b700          	ld	_screenOscilloscope$L,a
1984                     ; 135 	windowMode();
1986  01ae cd0000        	call	_windowMode
1988                     ; 136 	windowSpeed();
1990  01b1 cd0000        	call	_windowSpeed
1992                     ; 137 	windowDacValue();
1994  01b4 cd0000        	call	_windowDacValue
1996                     ; 138 	windowCylinderSizeValue();
1998  01b7 cd0000        	call	_windowCylinderSizeValue
2000                     ; 139 	windowOscilloscope(a_byPage);
2002  01ba b600          	ld	a,_screenOscilloscope$L
2003  01bc cd0000        	call	_windowOscilloscope
2005                     ; 140 	parametersSet(PARAM_PAGE, a_byPage);	
2007  01bf b600          	ld	a,_screenOscilloscope$L
2008  01c1 5f            	clr	x
2009  01c2 b702          	ld	_parametersSet$L+2,a
2010  01c4 bf01          	ld	_parametersSet$L+1,x
2011  01c6 a608          	ld	a,#8
2012  01c8 cd0000        	call	_parametersSet
2014                     ; 141 }
2017  01cb 81            	ret
2047                     ; 144 void screenRegister(void)
2047                     ; 145 {
2048                     	switch	.text
2049  01cc               _screenRegister:
2052                     ; 147 	if (parametersGetValue(PARAM_ALARM) == STI_ANSWER_OK)
2054  01cc a607          	ld	a,#7
2055  01ce cd0000        	call	_parametersGetValue
2057  01d1 4d            	tnz	a
2058  01d2 2601          	jrne	L62
2059  01d4 5d            	tnz	x
2060  01d5               L62:
2061  01d5 261c          	jrne	L5611
2062                     ; 149 		windowMode();
2064  01d7 cd0000        	call	_windowMode
2066                     ; 150 		windowSpeed();
2068  01da cd0000        	call	_windowSpeed
2070                     ; 151 		windowDacValue();
2072  01dd cd0000        	call	_windowDacValue
2074                     ; 152 		windowCylinderSizeValue();
2076  01e0 cd0000        	call	_windowCylinderSizeValue
2078                     ; 153 		windowRegister();
2080  01e3 cd0000        	call	_windowRegister
2082                     ; 154 		parametersSet(PARAM_PAGE, PAGE_REGISTER);	
2084  01e6 a604          	ld	a,#4
2085  01e8 b702          	ld	_parametersSet$L+2,a
2086  01ea 3f01          	clr	_parametersSet$L+1
2087  01ec a608          	ld	a,#8
2088  01ee cd0000        	call	_parametersSet
2091  01f1 2002          	jra	L7611
2092  01f3               L5611:
2093                     ; 158 		screenAlarm();
2095  01f3 ad01          	call	_screenAlarm
2097  01f5               L7611:
2098                     ; 160 }
2101  01f5 81            	ret
2129                     ; 163 void screenAlarm(void)
2129                     ; 164 {
2130                     	switch	.text
2131  01f6               _screenAlarm:
2134                     ; 165 	windowMode();
2136  01f6 cd0000        	call	_windowMode
2138                     ; 166 	windowSpeed();
2140  01f9 cd0000        	call	_windowSpeed
2142                     ; 167 	windowDacValue();
2144  01fc cd0000        	call	_windowDacValue
2146                     ; 168 	windowCylinderSizeValue();
2148  01ff cd0000        	call	_windowCylinderSizeValue
2150                     ; 169 	windowAlarm();
2152  0202 cd0000        	call	_windowAlarm
2154                     ; 170 	parametersSet(PARAM_PAGE, PAGE_ALARM);	
2156  0205 a603          	ld	a,#3
2157  0207 b702          	ld	_parametersSet$L+2,a
2158  0209 3f01          	clr	_parametersSet$L+1
2159  020b a608          	ld	a,#8
2160  020d cd0000        	call	_parametersSet
2162                     ; 171 }
2165  0210 81            	ret
2211                     ; 174 void screenBigMessage(BYTE * a_strMessage1, BYTE * a_strMessage2)
2211                     ; 175 {
2212                     	switch	.text
2214                     	xref.b	_screenBigMessage$L
2215  0211               _screenBigMessage:
2217  0211 b701          	ld	_screenBigMessage$L+1,a
2218  0213 bf00          	ld	_screenBigMessage$L,x
2220                     ; 176 	windowForceRepaint();	
2222  0215 cd0000        	call	_windowForceRepaint
2224                     ; 177 	windowBigMessage(a_strMessage1, a_strMessage2);
2226  0218 be02          	ld	x,_screenBigMessage$L+2
2227  021a bf02          	ld	_windowBigMessage$L+2,x
2228  021c b603          	ld	a,_screenBigMessage$L+3
2229  021e b703          	ld	_windowBigMessage$L+3,a
2230  0220 b601          	ld	a,_screenBigMessage$L+1
2231  0222 be00          	ld	x,_screenBigMessage$L
2232  0224 cd0000        	call	_windowBigMessage
2234                     ; 178 }
2237  0227 81            	ret
2294                     ; 181 void screen6Menus(BYTE * a_byPage, BYTE * a_byGroup, BYTE * a_bySelected)
2294                     ; 182 {
2295                     	switch	.text
2297                     	xref.b	_screen6Menus$L
2298  0228               _screen6Menus:
2300  0228 b701          	ld	_screen6Menus$L+1,a
2301  022a bf00          	ld	_screen6Menus$L,x
2303                     ; 183 	if(	(LOBYTE(parametersGetValue(PARAM_PAGE_SEL)) == (*a_bySelected)) &&
2303                     ; 184 		(LOBYTE(parametersGetValue(PARAM_PAGE)) == (*a_byPage)))
2305  022c a609          	ld	a,#9
2306  022e cd0000        	call	_parametersGetValue
2308  0231 92c104        	cp	a,[_screen6Menus$L+4.w]
2309  0234 260b          	jrne	L1521
2311  0236 a608          	ld	a,#8
2312  0238 cd0000        	call	_parametersGetValue
2314  023b 92c100        	cp	a,[_screen6Menus$L.w]
2315  023e 2601          	jrne	L1521
2316                     ; 186 		return;
2319  0240 81            	ret
2320  0241               L1521:
2321                     ; 189 	window6Menu(a_byGroup, a_bySelected);
2323  0241 be04          	ld	x,_screen6Menus$L+4
2324  0243 bf02          	ld	_window6Menu$L+2,x
2325  0245 b605          	ld	a,_screen6Menus$L+5
2326  0247 b703          	ld	_window6Menu$L+3,a
2327  0249 b603          	ld	a,_screen6Menus$L+3
2328  024b be02          	ld	x,_screen6Menus$L+2
2329  024d cd0000        	call	_window6Menu
2331                     ; 190 	parametersSet(PARAM_PAGE, *a_byPage);	
2333  0250 92c600        	ld	a,[_screen6Menus$L.w]
2334  0253 5f            	clr	x
2335  0254 b702          	ld	_parametersSet$L+2,a
2336  0256 bf01          	ld	_parametersSet$L+1,x
2337  0258 a608          	ld	a,#8
2338  025a cd0000        	call	_parametersSet
2340                     ; 191 }
2343  025d 81            	ret
2403                     ; 194 void screenValue(BYTE * a_byPage, BYTE * a_byKey)
2403                     ; 195 {
2404                     	switch	.text
2406                     	xref.b	_screenValue$L
2407  025e               _screenValue:
2409  025e b701          	ld	_screenValue$L+1,a
2410  0260 bf00          	ld	_screenValue$L,x
2412                     ; 196 	if ((* a_byPage)==PAGE_SAVE)
2414  0262 92c600        	ld	a,[_screenValue$L.w]
2415  0265 a1e6          	cp	a,#230
2416  0267 2703          	jreq	L64
2417  0269 cc045e        	jp	L5431
2418  026c               L64:
2419                     ; 198 		switch(parametersGetValue(PARAM_PAGE))
2421  026c a608          	ld	a,#8
2422  026e cd0000        	call	_parametersGetValue
2425                     ; 320 				break;
2426  0271 5d            	tnz	x
2427  0272 2703          	jreq	L05
2428  0274 cc0679        	jp	L3241
2429  0277               L05:
2430  0277 a020          	sub	a,#32
2431  0279 2739          	jreq	L3521
2432  027b 4a            	dec	a
2433  027c 2765          	jreq	L5521
2434  027e 4a            	dec	a
2435  027f 2603          	jrne	L25
2436  0281 cc031b        	jp	L7521
2437  0284               L25:
2438  0284 a002          	sub	a,#2
2439  0286 2603          	jrne	L45
2440  0288 cc034a        	jp	L1621
2441  028b               L45:
2442  028b a002          	sub	a,#2
2443  028d 2603          	jrne	L65
2444  028f cc0379        	jp	L3621
2445  0292               L65:
2446  0292 4a            	dec	a
2447  0293 2603          	jrne	L06
2448  0295 cc03a0        	jp	L5621
2449  0298               L06:
2450  0298 4a            	dec	a
2451  0299 2603          	jrne	L26
2452  029b cc03c7        	jp	L7621
2453  029e               L26:
2454  029e 4a            	dec	a
2455  029f 2603          	jrne	L46
2456  02a1 cc03ee        	jp	L1721
2457  02a4               L46:
2458  02a4 a003          	sub	a,#3
2459  02a6 2603          	jrne	L66
2460  02a8 cc0415        	jp	L3721
2461  02ab               L66:
2462  02ab 4a            	dec	a
2463  02ac 2603          	jrne	L07
2464  02ae cc0438        	jp	L5721
2465  02b1               L07:
2466  02b1 cc0679        	jp	L3241
2467  02b4               L3521:
2468                     ; 200 			case PAGE_P1_VALUE:
2468                     ; 201 				if (m_byValueChanged)
2470  02b4 c60028        	ld	a,_m_byValueChanged
2471  02b7 4d            	tnz	a
2472  02b8 2721          	jreq	L3531
2473                     ; 203 					if(parametersSet(PARAM_CYLINDER_TRAVEL,m_woCurrentValue))
2475  02ba ce002b        	ld	x,_m_woCurrentValue
2476  02bd bf01          	ld	_parametersSet$L+1,x
2477  02bf c6002c        	ld	a,_m_woCurrentValue+1
2478  02c2 b702          	ld	_parametersSet$L+2,a
2479  02c4 a601          	ld	a,#1
2480  02c6 cd0000        	call	_parametersSet
2482  02c9 4d            	tnz	a
2483  02ca 2707          	jreq	L5531
2484                     ; 205 						screenBigStdMessage(SCREEN_STD_MSG_PARAMETER_SAVED);
2486  02cc a618          	ld	a,#24
2487  02ce cd0920        	call	_screenBigStdMessage
2490  02d1 2005          	jra	L7531
2491  02d3               L5531:
2492                     ; 209 						screenBigStdMessage(SCREEN_STD_MSG_PARAMETER_VALUE_NA);
2494  02d3 a628          	ld	a,#40
2495  02d5 cd0920        	call	_screenBigStdMessage
2497  02d8               L7531:
2498                     ; 211 					sleepFix();
2500  02d8 cd0000        	call	_sleepFix
2502  02db               L3531:
2503                     ; 213 				(* a_byPage) = PAGE_P1;
2505  02db a60d          	ld	a,#13
2506  02dd 92c700        	ld	[_screenValue$L.w],a
2507                     ; 214 				break;
2509  02e0 cc0679        	jp	L3241
2510  02e3               L5521:
2511                     ; 215 			case PAGE_P2_VALUE:
2511                     ; 216 				if (m_byValueChanged)
2513  02e3 c60028        	ld	a,_m_byValueChanged
2514  02e6 4d            	tnz	a
2515  02e7 272a          	jreq	L1631
2516                     ; 218 					if(parametersSet(PARAM_ALARM_BOUND,m_woCurrentValue))
2518  02e9 ce002b        	ld	x,_m_woCurrentValue
2519  02ec bf01          	ld	_parametersSet$L+1,x
2520  02ee c6002c        	ld	a,_m_woCurrentValue+1
2521  02f1 b702          	ld	_parametersSet$L+2,a
2522  02f3 a604          	ld	a,#4
2523  02f5 cd0000        	call	_parametersSet
2525  02f8 4d            	tnz	a
2526  02f9 2710          	jreq	L3631
2527                     ; 220 						parametersSet(PARAM_ERR_BOUND_LONG, false);
2529  02fb 3f01          	clr	_parametersSet$L+1
2530  02fd 3f02          	clr	_parametersSet$L+2
2531  02ff a613          	ld	a,#19
2532  0301 cd0000        	call	_parametersSet
2534                     ; 221 						screenBigStdMessage(SCREEN_STD_MSG_PARAMETER_SAVED);
2536  0304 a618          	ld	a,#24
2537  0306 cd0920        	call	_screenBigStdMessage
2540  0309 2005          	jra	L5631
2541  030b               L3631:
2542                     ; 225 						screenBigStdMessage(SCREEN_STD_MSG_PARAMETER_VALUE_NA);
2544  030b a628          	ld	a,#40
2545  030d cd0920        	call	_screenBigStdMessage
2547  0310               L5631:
2548                     ; 227 					sleepFix();
2550  0310 cd0000        	call	_sleepFix
2552  0313               L1631:
2553                     ; 229 				(* a_byPage) = PAGE_P2;
2555  0313 a60e          	ld	a,#14
2556  0315 92c700        	ld	[_screenValue$L.w],a
2557                     ; 230 				break;
2559  0318 cc0679        	jp	L3241
2560  031b               L7521:
2561                     ; 231 			case PAGE_P3_VALUE:
2561                     ; 232 				if (m_byValueChanged)
2563  031b c60028        	ld	a,_m_byValueChanged
2564  031e 4d            	tnz	a
2565  031f 2721          	jreq	L7631
2566                     ; 234 					if(parametersSet(PARAM_GATE_WINDOW,m_woCurrentValue))
2568  0321 ce002b        	ld	x,_m_woCurrentValue
2569  0324 bf01          	ld	_parametersSet$L+1,x
2570  0326 c6002c        	ld	a,_m_woCurrentValue+1
2571  0329 b702          	ld	_parametersSet$L+2,a
2572  032b a602          	ld	a,#2
2573  032d cd0000        	call	_parametersSet
2575  0330 4d            	tnz	a
2576  0331 2707          	jreq	L1731
2577                     ; 236 						screenBigStdMessage(SCREEN_STD_MSG_PARAMETER_SAVED);
2579  0333 a618          	ld	a,#24
2580  0335 cd0920        	call	_screenBigStdMessage
2583  0338 2005          	jra	L3731
2584  033a               L1731:
2585                     ; 240 						screenBigStdMessage(SCREEN_STD_MSG_PARAMETER_VALUE_NA);
2587  033a a628          	ld	a,#40
2588  033c cd0920        	call	_screenBigStdMessage
2590  033f               L3731:
2591                     ; 242 					sleepFix();
2593  033f cd0000        	call	_sleepFix
2595  0342               L7631:
2596                     ; 244 				(* a_byPage) = PAGE_P3;
2598  0342 a60f          	ld	a,#15
2599  0344 92c700        	ld	[_screenValue$L.w],a
2600                     ; 245 				break;
2602  0347 cc0679        	jp	L3241
2603  034a               L1621:
2604                     ; 246 			case PAGE_P5_VALUE:
2604                     ; 247 				if (m_byValueChanged)
2606  034a c60028        	ld	a,_m_byValueChanged
2607  034d 4d            	tnz	a
2608  034e 2721          	jreq	L5731
2609                     ; 249 					if(parametersSet(PARAM_BASE_VALUE_DAC,m_woCurrentValue))
2611  0350 ce002b        	ld	x,_m_woCurrentValue
2612  0353 bf01          	ld	_parametersSet$L+1,x
2613  0355 c6002c        	ld	a,_m_woCurrentValue+1
2614  0358 b702          	ld	_parametersSet$L+2,a
2615  035a a61b          	ld	a,#27
2616  035c cd0000        	call	_parametersSet
2618  035f 4d            	tnz	a
2619  0360 2707          	jreq	L7731
2620                     ; 251 						screenBigStdMessage(SCREEN_STD_MSG_PARAMETER_SAVED);
2622  0362 a618          	ld	a,#24
2623  0364 cd0920        	call	_screenBigStdMessage
2626  0367 2005          	jra	L1041
2627  0369               L7731:
2628                     ; 255 						screenBigStdMessage(SCREEN_STD_MSG_PARAMETER_VALUE_NA);
2630  0369 a628          	ld	a,#40
2631  036b cd0920        	call	_screenBigStdMessage
2633  036e               L1041:
2634                     ; 257 					sleepFix();
2636  036e cd0000        	call	_sleepFix
2638  0371               L5731:
2639                     ; 259 				(* a_byPage) = PAGE_P5;
2641  0371 a611          	ld	a,#17
2642  0373 92c700        	ld	[_screenValue$L.w],a
2643                     ; 260 				break;
2645  0376 cc0679        	jp	L3241
2646  0379               L3621:
2647                     ; 261 			case PAGE_COR_MINUS:
2647                     ; 262 				if (m_byValueChanged)
2649  0379 c60028        	ld	a,_m_byValueChanged
2650  037c 4d            	tnz	a
2651  037d 2719          	jreq	L3041
2652                     ; 264 					screenBigStdMessage(SCREEN_STD_MSG_CMD_DONE);
2654  037f a619          	ld	a,#25
2655  0381 cd0920        	call	_screenBigStdMessage
2657                     ; 265 					STI_SendMessage(STI_FUNZ_SHIFT_REFERENCE_AUTO, STI_DIRECTION_R, m_woCurrentValue);
2659  0384 ce002b        	ld	x,_m_woCurrentValue
2660  0387 bf02          	ld	_STI_SendMessage$L+2,x
2661  0389 c6002c        	ld	a,_m_woCurrentValue+1
2662  038c b703          	ld	_STI_SendMessage$L+3,a
2663  038e a60c          	ld	a,#12
2664  0390 ae8a          	ld	x,#138
2665  0392 cd0000        	call	_STI_SendMessage
2667                     ; 266 					sleepFix();
2669  0395 cd0000        	call	_sleepFix
2671  0398               L3041:
2672                     ; 268 				(* a_byPage) = PAGE_REGISTER;
2674  0398 a604          	ld	a,#4
2675  039a 92c700        	ld	[_screenValue$L.w],a
2676                     ; 269 				break;
2678  039d cc0679        	jp	L3241
2679  03a0               L5621:
2680                     ; 270 			case PAGE_COR_PLUS:
2680                     ; 271 				if (m_byValueChanged)
2682  03a0 c60028        	ld	a,_m_byValueChanged
2683  03a3 4d            	tnz	a
2684  03a4 2719          	jreq	L5041
2685                     ; 273 					screenBigStdMessage(SCREEN_STD_MSG_CMD_DONE);
2687  03a6 a619          	ld	a,#25
2688  03a8 cd0920        	call	_screenBigStdMessage
2690                     ; 274 					STI_SendMessage(STI_FUNZ_SHIFT_REFERENCE_AUTO, STI_DIRECTION_A, m_woCurrentValue);
2692  03ab ce002b        	ld	x,_m_woCurrentValue
2693  03ae bf02          	ld	_STI_SendMessage$L+2,x
2694  03b0 c6002c        	ld	a,_m_woCurrentValue+1
2695  03b3 b703          	ld	_STI_SendMessage$L+3,a
2696  03b5 a603          	ld	a,#3
2697  03b7 ae8a          	ld	x,#138
2698  03b9 cd0000        	call	_STI_SendMessage
2700                     ; 275 					sleepFix();
2702  03bc cd0000        	call	_sleepFix
2704  03bf               L5041:
2705                     ; 277 				(* a_byPage) = PAGE_REGISTER;
2707  03bf a604          	ld	a,#4
2708  03c1 92c700        	ld	[_screenValue$L.w],a
2709                     ; 278 				break;
2711  03c4 cc0679        	jp	L3241
2712  03c7               L7621:
2713                     ; 279 			case PAGE_COR_LEFT:
2713                     ; 280 				if (m_byValueChanged)
2715  03c7 c60028        	ld	a,_m_byValueChanged
2716  03ca 4d            	tnz	a
2717  03cb 2719          	jreq	L7041
2718                     ; 282 					screenBigStdMessage(SCREEN_STD_MSG_CMD_DONE);
2720  03cd a619          	ld	a,#25
2721  03cf cd0920        	call	_screenBigStdMessage
2723                     ; 283 					STI_SendMessage(STI_FUNZ_SHIFT_REFERENCE_AUTO, STI_DIRECTION_O, m_woCurrentValue);
2725  03d2 ce002b        	ld	x,_m_woCurrentValue
2726  03d5 bf02          	ld	_STI_SendMessage$L+2,x
2727  03d7 c6002c        	ld	a,_m_woCurrentValue+1
2728  03da b703          	ld	_STI_SendMessage$L+3,a
2729  03dc a6c0          	ld	a,#192
2730  03de ae8a          	ld	x,#138
2731  03e0 cd0000        	call	_STI_SendMessage
2733                     ; 284 					sleepFix();
2735  03e3 cd0000        	call	_sleepFix
2737  03e6               L7041:
2738                     ; 286 				(* a_byPage) = PAGE_REGISTER;
2740  03e6 a604          	ld	a,#4
2741  03e8 92c700        	ld	[_screenValue$L.w],a
2742                     ; 287 				break;
2744  03eb cc0679        	jp	L3241
2745  03ee               L1721:
2746                     ; 288 			case PAGE_COR_RIGHT:
2746                     ; 289 				if (m_byValueChanged)
2748  03ee c60028        	ld	a,_m_byValueChanged
2749  03f1 4d            	tnz	a
2750  03f2 2719          	jreq	L1141
2751                     ; 291 					screenBigStdMessage(SCREEN_STD_MSG_CMD_DONE);
2753  03f4 a619          	ld	a,#25
2754  03f6 cd0920        	call	_screenBigStdMessage
2756                     ; 292 					STI_SendMessage(STI_FUNZ_SHIFT_REFERENCE_AUTO, STI_DIRECTION_T, m_woCurrentValue);
2758  03f9 ce002b        	ld	x,_m_woCurrentValue
2759  03fc bf02          	ld	_STI_SendMessage$L+2,x
2760  03fe c6002c        	ld	a,_m_woCurrentValue+1
2761  0401 b703          	ld	_STI_SendMessage$L+3,a
2762  0403 a630          	ld	a,#48
2763  0405 ae8a          	ld	x,#138
2764  0407 cd0000        	call	_STI_SendMessage
2766                     ; 293 					sleepFix();
2768  040a cd0000        	call	_sleepFix
2770  040d               L1141:
2771                     ; 295 				(* a_byPage) = PAGE_REGISTER;
2773  040d a604          	ld	a,#4
2774  040f 92c700        	ld	[_screenValue$L.w],a
2775                     ; 296 				break;
2777  0412 cc0679        	jp	L3241
2778  0415               L3721:
2779                     ; 297 			case PAGE_ARCHIVE_SAVE:
2779                     ; 298 				if (parametersSaveJob(m_woCurrentValue))
2781  0415 c6002c        	ld	a,_m_woCurrentValue+1
2782  0418 ce002b        	ld	x,_m_woCurrentValue
2783  041b cd0000        	call	_parametersSaveJob
2785  041e 4d            	tnz	a
2786  041f 2707          	jreq	L3141
2787                     ; 300 					screenBigStdMessage(SCREEN_STD_MSG_CMD_DONE);
2789  0421 a619          	ld	a,#25
2790  0423 cd0920        	call	_screenBigStdMessage
2793  0426 2005          	jra	L5141
2794  0428               L3141:
2795                     ; 304 					screenBigStdMessage(SCREEN_STD_MSG_WRONG_MEMORY_SLOT);
2797  0428 a62b          	ld	a,#43
2798  042a cd0920        	call	_screenBigStdMessage
2800  042d               L5141:
2801                     ; 306 				sleepFix();
2803  042d cd0000        	call	_sleepFix
2805                     ; 307 				(* a_byPage) = PAGE_REGISTER;
2807  0430 a604          	ld	a,#4
2808  0432 92c700        	ld	[_screenValue$L.w],a
2809                     ; 308 				break;
2811  0435 cc0679        	jp	L3241
2812  0438               L5721:
2813                     ; 309 			case PAGE_ARCHIVE_LOAD:
2813                     ; 310 				if (parametersLoadJob(m_woCurrentValue))
2815  0438 c6002c        	ld	a,_m_woCurrentValue+1
2816  043b ce002b        	ld	x,_m_woCurrentValue
2817  043e cd0000        	call	_parametersLoadJob
2819  0441 4d            	tnz	a
2820  0442 2707          	jreq	L7141
2821                     ; 312 					screenBigStdMessage(SCREEN_STD_MSG_CMD_DONE);
2823  0444 a619          	ld	a,#25
2824  0446 cd0920        	call	_screenBigStdMessage
2827  0449 2005          	jra	L1241
2828  044b               L7141:
2829                     ; 316 					screenBigStdMessage(SCREEN_STD_MSG_WRONG_MEMORY_SLOT);
2831  044b a62b          	ld	a,#43
2832  044d cd0920        	call	_screenBigStdMessage
2834  0450               L1241:
2835                     ; 318 				sleepFix();
2837  0450 cd0000        	call	_sleepFix
2839                     ; 319 				(* a_byPage) = PAGE_REGISTER;
2841  0453 a604          	ld	a,#4
2842  0455 92c700        	ld	[_screenValue$L.w],a
2843                     ; 320 				break;
2845  0458 cc0679        	jp	L3241
2846  045b               L1531:
2848  045b cc0679        	jp	L3241
2849  045e               L5431:
2850                     ; 325 		if (parametersGetValue(PARAM_PAGE) != *a_byPage)
2852  045e a608          	ld	a,#8
2853  0460 cd0000        	call	_parametersGetValue
2855  0463 91ce00        	ld	y,[_screenValue$L.w]
2856  0466 3f00          	clr	c_y
2857  0468 b300          	cp	x,c_y
2858  046a 2605          	jrne	L24
2859  046c 90bf01        	ld	c_y+1,y
2860  046f b101          	cp	a,c_y+1
2861  0471               L24:
2862  0471 2603          	jrne	L27
2863  0473 cc05eb        	jp	L5241
2864  0476               L27:
2865                     ; 327 			m_woCurrentValue = 0x0000;
2867  0476 4f            	clr	a
2868  0477 c7002b        	ld	_m_woCurrentValue,a
2869  047a c7002c        	ld	_m_woCurrentValue+1,a
2870                     ; 328 			m_byValueChanged = false;
2872  047d 4f            	clr	a
2873  047e c70028        	ld	_m_byValueChanged,a
2874                     ; 329 			m_byDecimal = 0;
2876  0481 4f            	clr	a
2877  0482 c70029        	ld	_m_byDecimal,a
2878                     ; 330 			switch(*a_byPage)
2880  0485 92c600        	ld	a,[_screenValue$L.w]
2882                     ; 372 					break;
2883  0488 a020          	sub	a,#32
2884  048a 2736          	jreq	L7721
2885  048c 4a            	dec	a
2886  048d 2757          	jreq	L1031
2887  048f 4a            	dec	a
2888  0490 2772          	jreq	L3031
2889  0492 a002          	sub	a,#2
2890  0494 2603          	jrne	L47
2891  0496 cc0522        	jp	L5031
2892  0499               L47:
2893  0499 a002          	sub	a,#2
2894  049b 2603          	jrne	L67
2895  049d cc0540        	jp	L7031
2896  04a0               L67:
2897  04a0 4a            	dec	a
2898  04a1 2603          	jrne	L001
2899  04a3 cc055b        	jp	L1131
2900  04a6               L001:
2901  04a6 4a            	dec	a
2902  04a7 2603          	jrne	L201
2903  04a9 cc0575        	jp	L3131
2904  04ac               L201:
2905  04ac 4a            	dec	a
2906  04ad 2603          	jrne	L401
2907  04af cc058f        	jp	L5131
2908  04b2               L401:
2909  04b2 a003          	sub	a,#3
2910  04b4 2603          	jrne	L601
2911  04b6 cc05a9        	jp	L7131
2912  04b9               L601:
2913  04b9 4a            	dec	a
2914  04ba 2603          	jrne	L011
2915  04bc cc05c3        	jp	L1231
2916  04bf               L011:
2917  04bf cc05db        	jp	L1341
2918  04c2               L7721:
2919                     ; 332 				case PAGE_P1_VALUE:
2919                     ; 333 					m_byDecimal = 1;
2921  04c2 a601          	ld	a,#1
2922  04c4 c70029        	ld	_m_byDecimal,a
2923                     ; 334 					screenPrepareStdMessage(SCREEN_STD_MSG_CYLINDER_TRAVEL);
2925  04c7 a61d          	ld	a,#29
2926  04c9 cd1c90        	call	_screenPrepareStdMessage
2928                     ; 335 					formatNumber(STI_GetMessage(STI_PARAM_CYLINDER_TRAVEL), 7, 1, m_strString2);
2930  04cc ae00          	ld	x,#high(_m_strString2)
2931  04ce bf04          	ld	_formatNumber$L+4,x
2932  04d0 a600          	ld	a,#low(_m_strString2)
2933  04d2 b705          	ld	_formatNumber$L+5,a
2934  04d4 a601          	ld	a,#1
2935  04d6 b703          	ld	_formatNumber$L+3,a
2936  04d8 a607          	ld	a,#7
2937  04da b702          	ld	_formatNumber$L+2,a
2938  04dc 4f            	clr	a
2939  04dd cd0000        	call	_STI_GetMessage
2941  04e0 cd0000        	call	_formatNumber
2943                     ; 336 					break;
2945  04e3 cc05db        	jp	L1341
2946  04e6               L1031:
2947                     ; 337 				case PAGE_P2_VALUE:
2947                     ; 338 					screenPrepareStdMessage(SCREEN_STD_MSG_ALLARM);
2949  04e6 a61e          	ld	a,#30
2950  04e8 cd1c90        	call	_screenPrepareStdMessage
2952                     ; 339 					formatNumber(STI_GetMessage(STI_PARAM_ALARM_BOUND), 5, 0, m_strString2);
2954  04eb ae00          	ld	x,#high(_m_strString2)
2955  04ed bf04          	ld	_formatNumber$L+4,x
2956  04ef a600          	ld	a,#low(_m_strString2)
2957  04f1 b705          	ld	_formatNumber$L+5,a
2958  04f3 3f03          	clr	_formatNumber$L+3
2959  04f5 a605          	ld	a,#5
2960  04f7 b702          	ld	_formatNumber$L+2,a
2961  04f9 a601          	ld	a,#1
2962  04fb cd0000        	call	_STI_GetMessage
2964  04fe cd0000        	call	_formatNumber
2966                     ; 340 					break;
2968  0501 cc05db        	jp	L1341
2969  0504               L3031:
2970                     ; 341 				case PAGE_P3_VALUE:
2970                     ; 342 					screenPrepareStdMessage(SCREEN_STD_MSG_GATE_WINDOW);
2972  0504 a61f          	ld	a,#31
2973  0506 cd1c90        	call	_screenPrepareStdMessage
2975                     ; 343 					formatNumber(STI_GetMessage(STI_PARAM_GATE_WINDOW), 5, 0, m_strString2);
2977  0509 ae00          	ld	x,#high(_m_strString2)
2978  050b bf04          	ld	_formatNumber$L+4,x
2979  050d a600          	ld	a,#low(_m_strString2)
2980  050f b705          	ld	_formatNumber$L+5,a
2981  0511 3f03          	clr	_formatNumber$L+3
2982  0513 a605          	ld	a,#5
2983  0515 b702          	ld	_formatNumber$L+2,a
2984  0517 a602          	ld	a,#2
2985  0519 cd0000        	call	_STI_GetMessage
2987  051c cd0000        	call	_formatNumber
2989                     ; 344 					break;
2991  051f cc05db        	jp	L1341
2992  0522               L5031:
2993                     ; 345 				case PAGE_P5_VALUE:
2993                     ; 346 					screenPrepareStdMessage(SCREEN_STD_MSG_PARAM_5);
2995  0522 a60b          	ld	a,#11
2996  0524 cd1c90        	call	_screenPrepareStdMessage
2998                     ; 347 					formatNumber(STI_GetMessage(STI_PARAM_BASE_VALUE_DAC), 5, 0, m_strString2);
3000  0527 ae00          	ld	x,#high(_m_strString2)
3001  0529 bf04          	ld	_formatNumber$L+4,x
3002  052b a600          	ld	a,#low(_m_strString2)
3003  052d b705          	ld	_formatNumber$L+5,a
3004  052f 3f03          	clr	_formatNumber$L+3
3005  0531 a605          	ld	a,#5
3006  0533 b702          	ld	_formatNumber$L+2,a
3007  0535 a621          	ld	a,#33
3008  0537 cd0000        	call	_STI_GetMessage
3010  053a cd0000        	call	_formatNumber
3012                     ; 348 					break;
3014  053d cc05db        	jp	L1341
3015  0540               L7031:
3016                     ; 349 				case PAGE_COR_MINUS:
3016                     ; 350 					screenPrepareStdMessage(SCREEN_STD_MSG_DIRECTION_R);
3018  0540 a621          	ld	a,#33
3019  0542 cd1c90        	call	_screenPrepareStdMessage
3021                     ; 351 					formatNumber(0, 5, 0, m_strString2);
3023  0545 ae00          	ld	x,#high(_m_strString2)
3024  0547 bf04          	ld	_formatNumber$L+4,x
3025  0549 a600          	ld	a,#low(_m_strString2)
3026  054b b705          	ld	_formatNumber$L+5,a
3027  054d 3f03          	clr	_formatNumber$L+3
3028  054f a605          	ld	a,#5
3029  0551 b702          	ld	_formatNumber$L+2,a
3030  0553 5f            	clr	x
3031  0554 4f            	clr	a
3032  0555 cd0000        	call	_formatNumber
3034                     ; 352 					break;
3036  0558 cc05db        	jp	L1341
3037  055b               L1131:
3038                     ; 353 				case PAGE_COR_PLUS:
3038                     ; 354 					screenPrepareStdMessage(SCREEN_STD_MSG_DIRECTION_A);	
3040  055b a620          	ld	a,#32
3041  055d cd1c90        	call	_screenPrepareStdMessage
3043                     ; 355 					formatNumber(0, 5, 0, m_strString2);
3045  0560 ae00          	ld	x,#high(_m_strString2)
3046  0562 bf04          	ld	_formatNumber$L+4,x
3047  0564 a600          	ld	a,#low(_m_strString2)
3048  0566 b705          	ld	_formatNumber$L+5,a
3049  0568 3f03          	clr	_formatNumber$L+3
3050  056a a605          	ld	a,#5
3051  056c b702          	ld	_formatNumber$L+2,a
3052  056e 5f            	clr	x
3053  056f 4f            	clr	a
3054  0570 cd0000        	call	_formatNumber
3056                     ; 356 					break;
3058  0573 2066          	jra	L1341
3059  0575               L3131:
3060                     ; 357 				case PAGE_COR_LEFT:
3060                     ; 358 					screenPrepareStdMessage(SCREEN_STD_MSG_DIRECTION_O);
3062  0575 a623          	ld	a,#35
3063  0577 cd1c90        	call	_screenPrepareStdMessage
3065                     ; 359 					formatNumber(0, 5, 0, m_strString2);
3067  057a ae00          	ld	x,#high(_m_strString2)
3068  057c bf04          	ld	_formatNumber$L+4,x
3069  057e a600          	ld	a,#low(_m_strString2)
3070  0580 b705          	ld	_formatNumber$L+5,a
3071  0582 3f03          	clr	_formatNumber$L+3
3072  0584 a605          	ld	a,#5
3073  0586 b702          	ld	_formatNumber$L+2,a
3074  0588 5f            	clr	x
3075  0589 4f            	clr	a
3076  058a cd0000        	call	_formatNumber
3078                     ; 360 					break;
3080  058d 204c          	jra	L1341
3081  058f               L5131:
3082                     ; 361 				case PAGE_COR_RIGHT:
3082                     ; 362 					screenPrepareStdMessage(SCREEN_STD_MSG_DIRECTION_T);
3084  058f a622          	ld	a,#34
3085  0591 cd1c90        	call	_screenPrepareStdMessage
3087                     ; 363 					formatNumber(0, 5, 0, m_strString2);
3089  0594 ae00          	ld	x,#high(_m_strString2)
3090  0596 bf04          	ld	_formatNumber$L+4,x
3091  0598 a600          	ld	a,#low(_m_strString2)
3092  059a b705          	ld	_formatNumber$L+5,a
3093  059c 3f03          	clr	_formatNumber$L+3
3094  059e a605          	ld	a,#5
3095  05a0 b702          	ld	_formatNumber$L+2,a
3096  05a2 5f            	clr	x
3097  05a3 4f            	clr	a
3098  05a4 cd0000        	call	_formatNumber
3100                     ; 364 					break;
3102  05a7 2032          	jra	L1341
3103  05a9               L7131:
3104                     ; 365 				case PAGE_ARCHIVE_SAVE:
3104                     ; 366 					screenPrepareStdMessage(SCREEN_STD_MSG_SAVE_JOB);
3106  05a9 a62a          	ld	a,#42
3107  05ab cd1c90        	call	_screenPrepareStdMessage
3109                     ; 367 					formatNumber(0, 5, 0, m_strString2);
3111  05ae ae00          	ld	x,#high(_m_strString2)
3112  05b0 bf04          	ld	_formatNumber$L+4,x
3113  05b2 a600          	ld	a,#low(_m_strString2)
3114  05b4 b705          	ld	_formatNumber$L+5,a
3115  05b6 3f03          	clr	_formatNumber$L+3
3116  05b8 a605          	ld	a,#5
3117  05ba b702          	ld	_formatNumber$L+2,a
3118  05bc 5f            	clr	x
3119  05bd 4f            	clr	a
3120  05be cd0000        	call	_formatNumber
3122                     ; 368 					break;
3124  05c1 2018          	jra	L1341
3125  05c3               L1231:
3126                     ; 369 				case PAGE_ARCHIVE_LOAD:
3126                     ; 370 					screenPrepareStdMessage(SCREEN_STD_MSG_LOAD_JOB);
3128  05c3 a629          	ld	a,#41
3129  05c5 cd1c90        	call	_screenPrepareStdMessage
3131                     ; 371 					formatNumber(0, 5, 0, m_strString2);
3133  05c8 ae00          	ld	x,#high(_m_strString2)
3134  05ca bf04          	ld	_formatNumber$L+4,x
3135  05cc a600          	ld	a,#low(_m_strString2)
3136  05ce b705          	ld	_formatNumber$L+5,a
3137  05d0 3f03          	clr	_formatNumber$L+3
3138  05d2 a605          	ld	a,#5
3139  05d4 b702          	ld	_formatNumber$L+2,a
3140  05d6 5f            	clr	x
3141  05d7 4f            	clr	a
3142  05d8 cd0000        	call	_formatNumber
3144                     ; 372 					break;
3146  05db               L1341:
3147                     ; 374 			parametersSet(PARAM_PAGE, *a_byPage);	
3149  05db 92c600        	ld	a,[_screenValue$L.w]
3150  05de 5f            	clr	x
3151  05df b702          	ld	_parametersSet$L+2,a
3152  05e1 bf01          	ld	_parametersSet$L+1,x
3153  05e3 a608          	ld	a,#8
3154  05e5 cd0000        	call	_parametersSet
3157  05e8 cc066a        	jp	L3341
3158  05eb               L5241:
3159                     ; 378 			m_byValueChanged = true;
3161  05eb a601          	ld	a,#1
3162  05ed c70028        	ld	_m_byValueChanged,a
3163                     ; 379 			if (
3163                     ; 380 				((m_woCurrentValue <999) && (m_byDecimal == 0)) ||
3163                     ; 381 				((m_woCurrentValue <9999) && (m_byDecimal > 0)) 
3163                     ; 382 			   )
3165  05f0 c6002c        	ld	a,_m_woCurrentValue+1
3166  05f3 a0e7          	sub	a,#231
3167  05f5 c6002b        	ld	a,_m_woCurrentValue
3168  05f8 a203          	sbc	a,#3
3169  05fa 2406          	jruge	L1441
3171  05fc c60029        	ld	a,_m_byDecimal
3172  05ff 4d            	tnz	a
3173  0600 2712          	jreq	L7341
3174  0602               L1441:
3176  0602 c6002c        	ld	a,_m_woCurrentValue+1
3177  0605 a00f          	sub	a,#15
3178  0607 c6002b        	ld	a,_m_woCurrentValue
3179  060a a227          	sbc	a,#39
3180  060c 245c          	jruge	L3341
3182  060e c60029        	ld	a,_m_byDecimal
3183  0611 4d            	tnz	a
3184  0612 2756          	jreq	L3341
3185  0614               L7341:
3186                     ; 384 				m_woCurrentValue = (m_woCurrentValue*10) + (*a_byKey);
3188  0614 c6002c        	ld	a,_m_woCurrentValue+1
3189  0617 ce002b        	ld	x,_m_woCurrentValue
3190  061a 3f00          	clr	c_y
3191  061c 90ae0a        	ld	y,#10
3192  061f cd0000        	call	c_imul
3194  0622 92cb02        	add	a,[_screenValue$L+2.w]
3195  0625 2401          	jrnc	L44
3196  0627 5c            	inc	x
3197  0628               L44:
3198  0628 c7002c        	ld	_m_woCurrentValue+1,a
3199  062b cf002b        	ld	_m_woCurrentValue,x
3200                     ; 385 				if (m_byDecimal>0)
3202  062e c60029        	ld	a,_m_byDecimal
3203  0631 4d            	tnz	a
3204  0632 271f          	jreq	L3441
3205                     ; 387 					formatNumber(m_woCurrentValue, 5 + m_byDecimal +1, m_byDecimal, m_strString2);
3207  0634 ae00          	ld	x,#high(_m_strString2)
3208  0636 bf04          	ld	_formatNumber$L+4,x
3209  0638 a600          	ld	a,#low(_m_strString2)
3210  063a b705          	ld	_formatNumber$L+5,a
3211  063c c60029        	ld	a,_m_byDecimal
3212  063f b703          	ld	_formatNumber$L+3,a
3213  0641 c60029        	ld	a,_m_byDecimal
3214  0644 ab06          	add	a,#6
3215  0646 b702          	ld	_formatNumber$L+2,a
3216  0648 c6002c        	ld	a,_m_woCurrentValue+1
3217  064b ce002b        	ld	x,_m_woCurrentValue
3218  064e cd0000        	call	_formatNumber
3221  0651 2017          	jra	L3341
3222  0653               L3441:
3223                     ; 391 					formatNumber(m_woCurrentValue, 5, 0, m_strString2);
3225  0653 ae00          	ld	x,#high(_m_strString2)
3226  0655 bf04          	ld	_formatNumber$L+4,x
3227  0657 a600          	ld	a,#low(_m_strString2)
3228  0659 b705          	ld	_formatNumber$L+5,a
3229  065b 3f03          	clr	_formatNumber$L+3
3230  065d a605          	ld	a,#5
3231  065f b702          	ld	_formatNumber$L+2,a
3232  0661 c6002c        	ld	a,_m_woCurrentValue+1
3233  0664 ce002b        	ld	x,_m_woCurrentValue
3234  0667 cd0000        	call	_formatNumber
3236  066a               L3341:
3237                     ; 396 		screenBigMessage(m_strString1, m_strString2);
3239  066a ae00          	ld	x,#high(_m_strString2)
3240  066c bf02          	ld	_screenBigMessage$L+2,x
3241  066e a600          	ld	a,#low(_m_strString2)
3242  0670 b703          	ld	_screenBigMessage$L+3,a
3243  0672 a614          	ld	a,#low(_m_strString1)
3244  0674 ae14          	ld	x,#high(_m_strString1)
3245  0676 cd0211        	call	_screenBigMessage
3247  0679               L3241:
3248                     ; 398 }
3251  0679 81            	ret
3309                     ; 401 void screenSetUpParameter(BYTE a_byKey, BYTE a_bySetupFull)
3309                     ; 402 {
3310                     	switch	.text
3312                     	xref.b	_screenSetUpParameter$L
3313  067a               _screenSetUpParameter:
3315  067a b701          	ld	_screenSetUpParameter$L+1,a
3316  067c bf00          	ld	_screenSetUpParameter$L,x
3318                     ; 403 	if (parametersGetValue(PARAM_PAGE) != PAGE_SETUP)
3320  067e a608          	ld	a,#8
3321  0680 cd0000        	call	_parametersGetValue
3323  0683 a119          	cp	a,#25
3324  0685 2602          	jrne	L411
3325  0687 a300          	cp	x,#0
3326  0689               L411:
3327  0689 2749          	jreq	L1741
3328                     ; 405 		parametersInitVisibleFlags();
3330  068b cd0000        	call	_parametersInitVisibleFlags
3332                     ; 406 		parametersSet(PARAM_VISUAL_SETUP_FULL, a_bySetupFull);
3334  068e b601          	ld	a,_screenSetUpParameter$L+1
3335  0690 5f            	clr	x
3336  0691 b702          	ld	_parametersSet$L+2,a
3337  0693 bf01          	ld	_parametersSet$L+1,x
3338  0695 a614          	ld	a,#20
3339  0697 cd0000        	call	_parametersSet
3341                     ; 407 		parametersSet(PARAM_PAGE_SEL, 0);	
3343  069a 3f01          	clr	_parametersSet$L+1
3344  069c 3f02          	clr	_parametersSet$L+2
3345  069e a609          	ld	a,#9
3346  06a0 cd0000        	call	_parametersSet
3348                     ; 408 		m_bySelectedMenu = windowSetupParameter(parametersGetValue(PARAM_PAGE_SEL), 0xFFFF);
3350  06a3 aeff          	ld	x,#255
3351  06a5 bf01          	ld	_windowSetupParameter$L+1,x
3352  06a7 a6ff          	ld	a,#255
3353  06a9 b702          	ld	_windowSetupParameter$L+2,a
3354  06ab a609          	ld	a,#9
3355  06ad cd0000        	call	_parametersGetValue
3357  06b0 cd0000        	call	_windowSetupParameter
3359  06b3 c7002a        	ld	_m_bySelectedMenu,a
3360                     ; 409 		m_woCurrentValue = 0x0000;
3362  06b6 4f            	clr	a
3363  06b7 c7002b        	ld	_m_woCurrentValue,a
3364  06ba c7002c        	ld	_m_woCurrentValue+1,a
3365                     ; 410 		m_byValueChanged = false;
3367  06bd 4f            	clr	a
3368  06be c70028        	ld	_m_byValueChanged,a
3369                     ; 411 		parametersSet(PARAM_PAGE, PAGE_SETUP);
3371  06c1 a619          	ld	a,#25
3372  06c3 b702          	ld	_parametersSet$L+2,a
3373  06c5 3f01          	clr	_parametersSet$L+1
3374  06c7 a608          	ld	a,#8
3375  06c9 cd0000        	call	_parametersSet
3377                     ; 412 		parametersChangedFlagReset(PARAM_PAGE_SEL);		
3379  06cc a609          	ld	a,#9
3380  06ce cd0000        	call	_parametersChangedFlagReset
3383  06d1 cc0760        	jp	L3741
3384  06d4               L1741:
3385                     ; 416 		if(a_byKey == KEY_ARROW_UP) 
3387  06d4 b600          	ld	a,_screenSetUpParameter$L
3388  06d6 a114          	cp	a,#20
3389  06d8 263e          	jrne	L5741
3390                     ; 418 			if (m_byValueChanged)
3392  06da c60028        	ld	a,_m_byValueChanged
3393  06dd 4d            	tnz	a
3394  06de 270b          	jreq	L7741
3395                     ; 420 				m_byValueChanged = false;
3397  06e0 4f            	clr	a
3398  06e1 c70028        	ld	_m_byValueChanged,a
3399                     ; 421 				m_woCurrentValue = 0x0000;
3401  06e4 4f            	clr	a
3402  06e5 c7002b        	ld	_m_woCurrentValue,a
3403  06e8 c7002c        	ld	_m_woCurrentValue+1,a
3404  06eb               L7741:
3405                     ; 424 			parametersSet(PARAM_PAGE_SEL, (PARAMETER_NUMBER-PARAMETER_SETUP_INITIAL_INDEX-1)+parametersGetValue(PARAM_PAGE_SEL));		
3407  06eb a609          	ld	a,#9
3408  06ed cd0000        	call	_parametersGetValue
3410  06f0 ab27          	add	a,#39
3411  06f2 2401          	jrnc	L611
3412  06f4 5c            	inc	x
3413  06f5               L611:
3414  06f5 b702          	ld	_parametersSet$L+2,a
3415  06f7 bf01          	ld	_parametersSet$L+1,x
3416  06f9 a609          	ld	a,#9
3417  06fb cd0000        	call	_parametersSet
3419                     ; 425 			m_bySelectedMenu = windowSetupParameter(parametersGetValue(PARAM_PAGE_SEL), 0xFFFF);
3421  06fe aeff          	ld	x,#255
3422  0700 bf01          	ld	_windowSetupParameter$L+1,x
3423  0702 a6ff          	ld	a,#255
3424  0704 b702          	ld	_windowSetupParameter$L+2,a
3425  0706 a609          	ld	a,#9
3426  0708 cd0000        	call	_parametersGetValue
3428  070b cd0000        	call	_windowSetupParameter
3430  070e c7002a        	ld	_m_bySelectedMenu,a
3431                     ; 426 			parametersChangedFlagReset(PARAM_PAGE_SEL);		
3433  0711 a609          	ld	a,#9
3434  0713 cd0000        	call	_parametersChangedFlagReset
3437  0716 2048          	jra	L3741
3438  0718               L5741:
3439                     ; 428 		else if((a_byKey == KEY_ARROW_DOWN) || (a_byKey == KEY_SETUP))
3441  0718 b600          	ld	a,_screenSetUpParameter$L
3442  071a a115          	cp	a,#21
3443  071c 2706          	jreq	L5051
3445  071e b600          	ld	a,_screenSetUpParameter$L
3446  0720 a10e          	cp	a,#14
3447  0722 263d          	jrne	L3051
3448  0724               L5051:
3449                     ; 430 			if (m_byValueChanged)
3451  0724 c60028        	ld	a,_m_byValueChanged
3452  0727 4d            	tnz	a
3453  0728 270b          	jreq	L7051
3454                     ; 432 				m_byValueChanged = false;
3456  072a 4f            	clr	a
3457  072b c70028        	ld	_m_byValueChanged,a
3458                     ; 433 				m_woCurrentValue = 0x0000;
3460  072e 4f            	clr	a
3461  072f c7002b        	ld	_m_woCurrentValue,a
3462  0732 c7002c        	ld	_m_woCurrentValue+1,a
3463  0735               L7051:
3464                     ; 436 			parametersSet(PARAM_PAGE_SEL, (PARAMETER_NUMBER-PARAMETER_SETUP_INITIAL_INDEX+1)+parametersGetValue(PARAM_PAGE_SEL));		
3466  0735 a609          	ld	a,#9
3467  0737 cd0000        	call	_parametersGetValue
3469  073a ab29          	add	a,#41
3470  073c 2401          	jrnc	L021
3471  073e 5c            	inc	x
3472  073f               L021:
3473  073f b702          	ld	_parametersSet$L+2,a
3474  0741 bf01          	ld	_parametersSet$L+1,x
3475  0743 a609          	ld	a,#9
3476  0745 cd0000        	call	_parametersSet
3478                     ; 437 			m_bySelectedMenu = windowSetupParameter(parametersGetValue(PARAM_PAGE_SEL), 0xFFFF);
3480  0748 aeff          	ld	x,#255
3481  074a bf01          	ld	_windowSetupParameter$L+1,x
3482  074c a6ff          	ld	a,#255
3483  074e b702          	ld	_windowSetupParameter$L+2,a
3484  0750 a609          	ld	a,#9
3485  0752 cd0000        	call	_parametersGetValue
3487  0755 cd0000        	call	_windowSetupParameter
3489  0758 c7002a        	ld	_m_bySelectedMenu,a
3490                     ; 438 			parametersChangedFlagReset(PARAM_PAGE_SEL);		
3492  075b a609          	ld	a,#9
3493  075d cd0000        	call	_parametersChangedFlagReset
3496  0760               L3741:
3497                     ; 492 }
3500  0760 81            	ret
3501  0761               L3051:
3502                     ; 440 		else if(a_byKey == KEY_CANCEL) 
3504  0761 b600          	ld	a,_screenSetUpParameter$L
3505  0763 a10b          	cp	a,#11
3506  0765 262b          	jrne	L3151
3507                     ; 442 			if (m_byValueChanged)
3509  0767 c60028        	ld	a,_m_byValueChanged
3510  076a 4d            	tnz	a
3511  076b 2720          	jreq	L5151
3512                     ; 444 				m_byValueChanged = false;
3514  076d 4f            	clr	a
3515  076e c70028        	ld	_m_byValueChanged,a
3516                     ; 445 				m_woCurrentValue = 0x0000;
3518  0771 4f            	clr	a
3519  0772 c7002b        	ld	_m_woCurrentValue,a
3520  0775 c7002c        	ld	_m_woCurrentValue+1,a
3521                     ; 446 				m_bySelectedMenu = windowSetupParameter(parametersGetValue(PARAM_PAGE_SEL), 0xFFFF);
3523  0778 aeff          	ld	x,#255
3524  077a bf01          	ld	_windowSetupParameter$L+1,x
3525  077c a6ff          	ld	a,#255
3526  077e b702          	ld	_windowSetupParameter$L+2,a
3527  0780 a609          	ld	a,#9
3528  0782 cd0000        	call	_parametersGetValue
3530  0785 cd0000        	call	_windowSetupParameter
3532  0788 c7002a        	ld	_m_bySelectedMenu,a
3534  078b 20d3          	jra	L3741
3535  078d               L5151:
3536                     ; 450 				screenRegister();
3538  078d cd01cc        	call	_screenRegister
3540  0790 20ce          	jra	L3741
3541  0792               L3151:
3542                     ; 453 		else if(a_byKey == KEY_OK) 
3544  0792 b600          	ld	a,_screenSetUpParameter$L
3545  0794 a10a          	cp	a,#10
3546  0796 2703          	jreq	L421
3547  0798 cc0838        	jp	L3251
3548  079b               L421:
3549                     ; 455 			if (m_byValueChanged)
3551  079b c60028        	ld	a,_m_byValueChanged
3552  079e 4d            	tnz	a
3553  079f 2767          	jreq	L5251
3554                     ; 457 				if(parametersSet(m_bySelectedMenu, m_woCurrentValue))
3556  07a1 ce002b        	ld	x,_m_woCurrentValue
3557  07a4 bf01          	ld	_parametersSet$L+1,x
3558  07a6 c6002c        	ld	a,_m_woCurrentValue+1
3559  07a9 b702          	ld	_parametersSet$L+2,a
3560  07ab c6002a        	ld	a,_m_bySelectedMenu
3561  07ae cd0000        	call	_parametersSet
3563  07b1 4d            	tnz	a
3564  07b2 2720          	jreq	L7251
3565                     ; 459 					memcpy(m_strString1, parametersGetLabel(m_bySelectedMenu), 20); 
3567  07b4 a614          	ld	a,#20
3568  07b6 b704          	ld	_memcpy$L+4,a
3569  07b8 c6002a        	ld	a,_m_bySelectedMenu
3570  07bb cd0000        	call	_parametersGetLabel
3572  07be b703          	ld	_memcpy$L+3,a
3573  07c0 bf02          	ld	_memcpy$L+2,x
3574  07c2 a614          	ld	a,#low(_m_strString1)
3575  07c4 ae14          	ld	x,#high(_m_strString1)
3576  07c6 cd0000        	call	_memcpy
3578                     ; 460 					m_strString1[19] = 0x00;
3580  07c9 4f            	clr	a
3581  07ca c70027        	ld	_m_strString1+19,a
3582                     ; 461 					screenBigStdMessage(SCREEN_STD_MSG_PARAMETER_SAVED);
3584  07cd a618          	ld	a,#24
3585  07cf cd0920        	call	_screenBigStdMessage
3588  07d2 2010          	jra	L1351
3589  07d4               L7251:
3590                     ; 465 					screenBigStdMessage(SCREEN_STD_MSG_PARAMETER_VALUE_NA);
3592  07d4 a628          	ld	a,#40
3593  07d6 cd0920        	call	_screenBigStdMessage
3595                     ; 466 					parametersSet(PARAM_PAGE, PAGE_SETUP);	
3597  07d9 a619          	ld	a,#25
3598  07db b702          	ld	_parametersSet$L+2,a
3599  07dd 3f01          	clr	_parametersSet$L+1
3600  07df a608          	ld	a,#8
3601  07e1 cd0000        	call	_parametersSet
3603  07e4               L1351:
3604                     ; 469 				m_byValueChanged = false;
3606  07e4 4f            	clr	a
3607  07e5 c70028        	ld	_m_byValueChanged,a
3608                     ; 470 				m_woCurrentValue = 0x0000;
3610  07e8 4f            	clr	a
3611  07e9 c7002b        	ld	_m_woCurrentValue,a
3612  07ec c7002c        	ld	_m_woCurrentValue+1,a
3613                     ; 471 				sleepFix();
3615  07ef cd0000        	call	_sleepFix
3617                     ; 472 				m_bySelectedMenu = windowSetupParameter(parametersGetValue(PARAM_PAGE_SEL),0xFFFF);				
3619  07f2 aeff          	ld	x,#255
3620  07f4 bf01          	ld	_windowSetupParameter$L+1,x
3621  07f6 a6ff          	ld	a,#255
3622  07f8 b702          	ld	_windowSetupParameter$L+2,a
3623  07fa a609          	ld	a,#9
3624  07fc cd0000        	call	_parametersGetValue
3626  07ff cd0000        	call	_windowSetupParameter
3628  0802 c7002a        	ld	_m_bySelectedMenu,a
3630  0805 cc0760        	jp	L3741
3631  0808               L5251:
3632                     ; 476 				parametersSet(PARAM_MODE_LONG, STI_GetMessage(STI_PARAM_MODE_LONG));
3634  0808 a60d          	ld	a,#13
3635  080a cd0000        	call	_STI_GetMessage
3637  080d b702          	ld	_parametersSet$L+2,a
3638  080f bf01          	ld	_parametersSet$L+1,x
3639  0811 a60a          	ld	a,#10
3640  0813 cd0000        	call	_parametersSet
3642                     ; 477 				parametersSet(PARAM_MODE_TRANS, STI_GetMessage(STI_PARAM_MODE_TRANS));
3644  0816 a60e          	ld	a,#14
3645  0818 cd0000        	call	_STI_GetMessage
3647  081b b702          	ld	_parametersSet$L+2,a
3648  081d bf01          	ld	_parametersSet$L+1,x
3649  081f a60b          	ld	a,#11
3650  0821 cd0000        	call	_parametersSet
3652                     ; 478 				parametersSet(PARAM_CORRECTION, STI_GetMessage(STI_PARAM_CORRECTIONS));				
3654  0824 a61c          	ld	a,#28
3655  0826 cd0000        	call	_STI_GetMessage
3657  0829 b702          	ld	_parametersSet$L+2,a
3658  082b bf01          	ld	_parametersSet$L+1,x
3659  082d a60d          	ld	a,#13
3660  082f cd0000        	call	_parametersSet
3662                     ; 479 				screenRegister();
3664  0832 cd01cc        	call	_screenRegister
3666  0835 cc0760        	jp	L3741
3667  0838               L3251:
3668                     ; 484 			if (m_woCurrentValue <999)
3670  0838 c6002c        	ld	a,_m_woCurrentValue+1
3671  083b a0e7          	sub	a,#231
3672  083d c6002b        	ld	a,_m_woCurrentValue
3673  0840 a203          	sbc	a,#3
3674  0842 2503          	jrult	L621
3675  0844 cc0760        	jp	L3741
3676  0847               L621:
3677                     ; 486 				m_byValueChanged = true;
3679  0847 a601          	ld	a,#1
3680  0849 c70028        	ld	_m_byValueChanged,a
3681                     ; 487 				m_woCurrentValue = (m_woCurrentValue*10) + (a_byKey);
3683  084c c6002c        	ld	a,_m_woCurrentValue+1
3684  084f ce002b        	ld	x,_m_woCurrentValue
3685  0852 3f00          	clr	c_y
3686  0854 90ae0a        	ld	y,#10
3687  0857 cd0000        	call	c_imul
3689  085a bb00          	add	a,_screenSetUpParameter$L
3690  085c 2401          	jrnc	L221
3691  085e 5c            	inc	x
3692  085f               L221:
3693  085f c7002c        	ld	_m_woCurrentValue+1,a
3694  0862 cf002b        	ld	_m_woCurrentValue,x
3695                     ; 488 				m_bySelectedMenu = windowSetupParameter(parametersGetValue(PARAM_PAGE_SEL), m_woCurrentValue);
3697  0865 ce002b        	ld	x,_m_woCurrentValue
3698  0868 bf01          	ld	_windowSetupParameter$L+1,x
3699  086a c6002c        	ld	a,_m_woCurrentValue+1
3700  086d b702          	ld	_windowSetupParameter$L+2,a
3701  086f a609          	ld	a,#9
3702  0871 cd0000        	call	_parametersGetValue
3704  0874 cd0000        	call	_windowSetupParameter
3706  0877 c7002a        	ld	_m_bySelectedMenu,a
3707  087a cc0760        	jp	L3741
3730                     ; 495 void screenArchive(void)
3730                     ; 496 {
3731                     	switch	.text
3732  087d               _screenArchive:
3735                     ; 497 	screenBigMessage("ARCHIVE", "(operativo)");
3737  087d aeda          	ld	x,#high(L3551)
3738  087f bf02          	ld	_screenBigMessage$L+2,x
3739  0881 a6da          	ld	a,#low(L3551)
3740  0883 b703          	ld	_screenBigMessage$L+3,a
3741  0885 a6e6          	ld	a,#low(L1551)
3742  0887 aee6          	ld	x,#high(L1551)
3743  0889 cd0211        	call	_screenBigMessage
3745                     ; 498 }
3748  088c 81            	ret
3788                     ; 501 void screenVersion(void)
3788                     ; 502 {
3789                     	switch	.text
3791                     	xref.b	_screenVersion$L
3792  088d               _screenVersion:
3795                     ; 505 	strString[15] = 0x00;
3797  088d 3ffb          	clr	_screenVersion$L-5
3798                     ; 506 	strString[16] = 0x00;
3800  088f 3ffc          	clr	_screenVersion$L-4
3801                     ; 507 	memcpy(strString, "Taj Board v", 11); 
3803  0891 a60b          	ld	a,#11
3804  0893 b704          	ld	_memcpy$L+4,a
3805  0895 aece          	ld	x,#high(L3751)
3806  0897 bf02          	ld	_memcpy$L+2,x
3807  0899 a6ce          	ld	a,#low(L3751)
3808  089b b703          	ld	_memcpy$L+3,a
3809  089d a6ec          	ld	a,#_screenVersion$L-20
3810  089f 5f            	clr	x
3811  08a0 cd0000        	call	_memcpy
3813                     ; 508 	formatNumber(STI_GetMessage(STI_PARAM_PROGRAM_VERSION), 5, 2, strString+11);
3815  08a3 aef7          	ld	x,#high(_screenVersion$L-9)
3816  08a5 bf04          	ld	_formatNumber$L+4,x
3817  08a7 a6f7          	ld	a,#low(_screenVersion$L-9)
3818  08a9 b705          	ld	_formatNumber$L+5,a
3819  08ab a602          	ld	a,#2
3820  08ad b703          	ld	_formatNumber$L+3,a
3821  08af a605          	ld	a,#5
3822  08b1 b702          	ld	_formatNumber$L+2,a
3823  08b3 a618          	ld	a,#24
3824  08b5 cd0000        	call	_STI_GetMessage
3826  08b8 cd0000        	call	_formatNumber
3828                     ; 509 	screenBigMessage("Versione SW", strString);
3830  08bb aeec          	ld	x,#high(_screenVersion$L-20)
3831  08bd bf02          	ld	_screenBigMessage$L+2,x
3832  08bf a6ec          	ld	a,#low(_screenVersion$L-20)
3833  08c1 b703          	ld	_screenBigMessage$L+3,a
3834  08c3 a6c2          	ld	a,#low(L5751)
3835  08c5 aec2          	ld	x,#high(L5751)
3836  08c7 cd0211        	call	_screenBigMessage
3838                     ; 510 	sleepSec(2);
3840  08ca 5f            	clr	x
3841  08cb a602          	ld	a,#2
3842  08cd cd0000        	call	_sleepSec
3844                     ; 512 	memcpy(strString, "Cpu Board ", 10); 
3846  08d0 a60a          	ld	a,#10
3847  08d2 b704          	ld	_memcpy$L+4,a
3848  08d4 aeb7          	ld	x,#high(L7751)
3849  08d6 bf02          	ld	_memcpy$L+2,x
3850  08d8 a6b7          	ld	a,#low(L7751)
3851  08da b703          	ld	_memcpy$L+3,a
3852  08dc a6ec          	ld	a,#_screenVersion$L-20
3853  08de 5f            	clr	x
3854  08df cd0000        	call	_memcpy
3856                     ; 513 	memcpy(strString+10, "v     ", 6); 
3858  08e2 a606          	ld	a,#6
3859  08e4 b704          	ld	_memcpy$L+4,a
3860  08e6 aeb0          	ld	x,#high(L1061)
3861  08e8 bf02          	ld	_memcpy$L+2,x
3862  08ea a6b0          	ld	a,#low(L1061)
3863  08ec b703          	ld	_memcpy$L+3,a
3864  08ee a6f6          	ld	a,#_screenVersion$L-10
3865  08f0 5f            	clr	x
3866  08f1 cd0000        	call	_memcpy
3868                     ; 514 	formatNumber(mc_byApplicationVersion, 4, 2, strString+12);
3870  08f4 aef8          	ld	x,#high(_screenVersion$L-8)
3871  08f6 bf04          	ld	_formatNumber$L+4,x
3872  08f8 a6f8          	ld	a,#low(_screenVersion$L-8)
3873  08fa b705          	ld	_formatNumber$L+5,a
3874  08fc a602          	ld	a,#2
3875  08fe b703          	ld	_formatNumber$L+3,a
3876  0900 a604          	ld	a,#4
3877  0902 b702          	ld	_formatNumber$L+2,a
3878  0904 5f            	clr	x
3879  0905 a69d          	ld	a,#157
3880  0907 cd0000        	call	_formatNumber
3882                     ; 515 	screenBigMessage("Versione SW", strString);
3884  090a aeec          	ld	x,#high(_screenVersion$L-20)
3885  090c bf02          	ld	_screenBigMessage$L+2,x
3886  090e a6ec          	ld	a,#low(_screenVersion$L-20)
3887  0910 b703          	ld	_screenBigMessage$L+3,a
3888  0912 a6c2          	ld	a,#low(L5751)
3889  0914 aec2          	ld	x,#high(L5751)
3890  0916 cd0211        	call	_screenBigMessage
3892                     ; 516 	sleepSec(2);
3894  0919 5f            	clr	x
3895  091a a602          	ld	a,#2
3896  091c cd0000        	call	_sleepSec
3898                     ; 517 }
3901  091f 81            	ret
3939                     	switch	.const
3940  0001               L041:
3941  0001 095a          	dc.w	L5061
3942  0003 0977          	dc.w	L7061
3943  0005 0994          	dc.w	L1161
3944  0007 09b1          	dc.w	L3161
3945  0009 09ce          	dc.w	L5161
3946  000b 09eb          	dc.w	L7161
3947  000d 0a08          	dc.w	L1261
3948  000f 0a25          	dc.w	L3261
3949  0011 0a42          	dc.w	L5261
3950  0013 0a5f          	dc.w	L7261
3951  0015 0a7c          	dc.w	L1361
3952  0017 0a99          	dc.w	L3361
3953  0019 0ab6          	dc.w	L5361
3954  001b 0ad3          	dc.w	L7361
3955  001d 0af0          	dc.w	L1461
3956  001f 0b0d          	dc.w	L3461
3957  0021 0b2a          	dc.w	L5461
3958  0023 0b64          	dc.w	L1561
3959  0025 0b9e          	dc.w	L5561
3960  0027 0bbb          	dc.w	L7561
3961  0029 0bd8          	dc.w	L1661
3962  002b 0bf5          	dc.w	L3661
3963  002d 0c12          	dc.w	L5661
3964  002f 0c2f          	dc.w	L7661
3965  0031 0c4c          	dc.w	L1761
3966  0033 0c5e          	dc.w	L3761
3967  0035 0c70          	dc.w	L5761
3968  0037 0c8d          	dc.w	L7761
3969  0039 0caa          	dc.w	L1071
3970  003b 0d21          	dc.w	L7732
3971  003d 0d21          	dc.w	L7732
3972  003f 0d21          	dc.w	L7732
3973  0041 0d21          	dc.w	L7732
3974  0043 0d21          	dc.w	L7732
3975  0045 0d21          	dc.w	L7732
3976  0047 0d21          	dc.w	L7732
3977  0049 0d21          	dc.w	L7732
3978  004b 0d21          	dc.w	L7732
3979  004d 0cc7          	dc.w	L3071
3980  004f 0b81          	dc.w	L3561
3981  0051 0ce4          	dc.w	L5071
3982  0053 0d21          	dc.w	L7732
3983  0055 0d21          	dc.w	L7732
3984  0057 0d01          	dc.w	L7071
3985  0059 0b47          	dc.w	L7461
3986  005b               L441:
3987  005b 0d38          	dc.w	L5171
3988  005d 0d55          	dc.w	L7171
3989  005f 0d72          	dc.w	L1271
3990  0061 0d8f          	dc.w	L3271
3991  0063 0dac          	dc.w	L5271
3992  0065 0dc9          	dc.w	L7271
3993  0067 0de6          	dc.w	L1371
3994  0069 0e03          	dc.w	L3371
3995  006b 0e20          	dc.w	L5371
3996  006d 0e3d          	dc.w	L7371
3997  006f 0e5a          	dc.w	L1471
3998  0071 0e77          	dc.w	L3471
3999  0073 0e94          	dc.w	L5471
4000  0075 0eb1          	dc.w	L7471
4001  0077 0ece          	dc.w	L1571
4002  0079 0eeb          	dc.w	L3571
4003  007b 0f25          	dc.w	L7571
4004  007d 0f42          	dc.w	L1671
4005  007f 0f7c          	dc.w	L5671
4006  0081 0f99          	dc.w	L7671
4007  0083 0fb6          	dc.w	L1771
4008  0085 0fd3          	dc.w	L3771
4009  0087 0ff0          	dc.w	L5771
4010  0089 100d          	dc.w	L7771
4011  008b 102a          	dc.w	L1002
4012  008d 103c          	dc.w	L3002
4013  008f 104e          	dc.w	L5002
4014  0091 106b          	dc.w	L7002
4015  0093 1088          	dc.w	L1102
4016  0095 10ff          	dc.w	L7352
4017  0097 10ff          	dc.w	L7352
4018  0099 10ff          	dc.w	L7352
4019  009b 10ff          	dc.w	L7352
4020  009d 10ff          	dc.w	L7352
4021  009f 10ff          	dc.w	L7352
4022  00a1 10ff          	dc.w	L7352
4023  00a3 10ff          	dc.w	L7352
4024  00a5 10ff          	dc.w	L7352
4025  00a7 10a5          	dc.w	L3102
4026  00a9 0f5f          	dc.w	L3671
4027  00ab 10c2          	dc.w	L5102
4028  00ad 10ff          	dc.w	L7352
4029  00af 10ff          	dc.w	L7352
4030  00b1 10df          	dc.w	L7102
4031  00b3 0f08          	dc.w	L5571
4032  00b5               L051:
4033  00b5 1116          	dc.w	L5202
4034  00b7 1133          	dc.w	L7202
4035  00b9 1150          	dc.w	L1302
4036  00bb 116d          	dc.w	L3302
4037  00bd 118a          	dc.w	L5302
4038  00bf 11a7          	dc.w	L7302
4039  00c1 11c4          	dc.w	L1402
4040  00c3 11e1          	dc.w	L3402
4041  00c5 11fe          	dc.w	L5402
4042  00c7 121b          	dc.w	L7402
4043  00c9 1238          	dc.w	L1502
4044  00cb 1255          	dc.w	L3502
4045  00cd 1272          	dc.w	L5502
4046  00cf 128f          	dc.w	L7502
4047  00d1 12ac          	dc.w	L1602
4048  00d3 12c9          	dc.w	L3602
4049  00d5 12e6          	dc.w	L5602
4050  00d7 1320          	dc.w	L1702
4051  00d9 135a          	dc.w	L5702
4052  00db 1377          	dc.w	L7702
4053  00dd 1394          	dc.w	L1012
4054  00df 13b1          	dc.w	L3012
4055  00e1 13ce          	dc.w	L5012
4056  00e3 13eb          	dc.w	L7012
4057  00e5 1408          	dc.w	L1112
4058  00e7 141a          	dc.w	L3112
4059  00e9 142c          	dc.w	L5112
4060  00eb 1449          	dc.w	L7112
4061  00ed 1466          	dc.w	L1212
4062  00ef 14dd          	dc.w	L5562
4063  00f1 14dd          	dc.w	L5562
4064  00f3 14dd          	dc.w	L5562
4065  00f5 14dd          	dc.w	L5562
4066  00f7 14dd          	dc.w	L5562
4067  00f9 14dd          	dc.w	L5562
4068  00fb 14dd          	dc.w	L5562
4069  00fd 14dd          	dc.w	L5562
4070  00ff 14dd          	dc.w	L5562
4071  0101 1483          	dc.w	L3212
4072  0103 133d          	dc.w	L3702
4073  0105 14a0          	dc.w	L5212
4074  0107 14dd          	dc.w	L5562
4075  0109 14dd          	dc.w	L5562
4076  010b 14bd          	dc.w	L7212
4077  010d 1303          	dc.w	L7602
4078  010f               L451:
4079  010f 14f4          	dc.w	L5312
4080  0111 1511          	dc.w	L7312
4081  0113 152e          	dc.w	L1412
4082  0115 154b          	dc.w	L3412
4083  0117 1568          	dc.w	L5412
4084  0119 1585          	dc.w	L7412
4085  011b 15a2          	dc.w	L1512
4086  011d 15bf          	dc.w	L3512
4087  011f 15dc          	dc.w	L5512
4088  0121 15f9          	dc.w	L7512
4089  0123 1616          	dc.w	L1612
4090  0125 1633          	dc.w	L3612
4091  0127 1650          	dc.w	L5612
4092  0129 166d          	dc.w	L7612
4093  012b 168a          	dc.w	L1712
4094  012d 16a7          	dc.w	L3712
4095  012f 16c4          	dc.w	L5712
4096  0131 16fe          	dc.w	L1022
4097  0133 1738          	dc.w	L5022
4098  0135 1755          	dc.w	L7022
4099  0137 1772          	dc.w	L1122
4100  0139 178f          	dc.w	L3122
4101  013b 17ac          	dc.w	L5122
4102  013d 17c9          	dc.w	L7122
4103  013f 17e6          	dc.w	L1222
4104  0141 17f8          	dc.w	L3222
4105  0143 180a          	dc.w	L5222
4106  0145 1827          	dc.w	L7222
4107  0147 1844          	dc.w	L1322
4108  0149 18bb          	dc.w	L5003
4109  014b 18bb          	dc.w	L5003
4110  014d 18bb          	dc.w	L5003
4111  014f 18bb          	dc.w	L5003
4112  0151 18bb          	dc.w	L5003
4113  0153 18bb          	dc.w	L5003
4114  0155 18bb          	dc.w	L5003
4115  0157 18bb          	dc.w	L5003
4116  0159 18bb          	dc.w	L5003
4117  015b 1861          	dc.w	L3322
4118  015d 171b          	dc.w	L3022
4119  015f 187e          	dc.w	L5322
4120  0161 18bb          	dc.w	L5003
4121  0163 18bb          	dc.w	L5003
4122  0165 189b          	dc.w	L7322
4123  0167 16e1          	dc.w	L7712
4124  0169               L061:
4125  0169 18d2          	dc.w	L5422
4126  016b 18ef          	dc.w	L7422
4127  016d 190c          	dc.w	L1522
4128  016f 1929          	dc.w	L3522
4129  0171 1946          	dc.w	L5522
4130  0173 1963          	dc.w	L7522
4131  0175 1980          	dc.w	L1622
4132  0177 199d          	dc.w	L3622
4133  0179 19ba          	dc.w	L5622
4134  017b 19d7          	dc.w	L7622
4135  017d 19f4          	dc.w	L1722
4136  017f 1a11          	dc.w	L3722
4137  0181 1a2e          	dc.w	L5722
4138  0183 1a4b          	dc.w	L7722
4139  0185 1a68          	dc.w	L1032
4140  0187 1a85          	dc.w	L3032
4141  0189 1aa2          	dc.w	L5032
4142  018b 1adc          	dc.w	L1132
4143  018d 1b16          	dc.w	L5132
4144  018f 1b33          	dc.w	L7132
4145  0191 1b50          	dc.w	L1232
4146  0193 1b6d          	dc.w	L3232
4147  0195 1b8a          	dc.w	L5232
4148  0197 1ba7          	dc.w	L7232
4149  0199 1bc4          	dc.w	L1332
4150  019b 1bd6          	dc.w	L3332
4151  019d 1be8          	dc.w	L5332
4152  019f 1c05          	dc.w	L7332
4153  01a1 1c21          	dc.w	L1432
4154  01a3 1c8f          	dc.w	L1313
4155  01a5 1c8f          	dc.w	L1313
4156  01a7 1c8f          	dc.w	L1313
4157  01a9 1c8f          	dc.w	L1313
4158  01ab 1c8f          	dc.w	L1313
4159  01ad 1c8f          	dc.w	L1313
4160  01af 1c8f          	dc.w	L1313
4161  01b1 1c8f          	dc.w	L1313
4162  01b3 1c8f          	dc.w	L1313
4163  01b5 1c3d          	dc.w	L3432
4164  01b7 1af9          	dc.w	L3132
4165  01b9 1c59          	dc.w	L5432
4166  01bb 1c8f          	dc.w	L1313
4167  01bd 1c8f          	dc.w	L1313
4168  01bf 1c75          	dc.w	L7432
4169  01c1 1abf          	dc.w	L7032
4170                     ; 521 void screenBigStdMessage(BYTE a_byStdMessage)
4170                     ; 522 {
4171                     	switch	.text
4173                     	xref.b	_screenBigStdMessage$L
4174  0920               _screenBigStdMessage:
4176  0920 b700          	ld	_screenBigStdMessage$L,a
4178                     ; 523 	switch(parametersGetValue(PARAM_LANGUAGE))
4180  0922 a62f          	ld	a,#47
4181  0924 cd0000        	call	_parametersGetValue
4184                     ; 1229 			break;
4185  0927 5d            	tnz	x
4186  0928 2703          	jreq	L461
4187  092a cc18be        	jp	L3422
4188  092d               L461:
4189  092d a002          	sub	a,#2
4190  092f 2715          	jreq	L3061
4191  0931 4a            	dec	a
4192  0932 2603          	jrne	L661
4193  0934 cc1102        	jp	L3202
4194  0937               L661:
4195  0937 4a            	dec	a
4196  0938 2603          	jrne	L071
4197  093a cc14e0        	jp	L3312
4198  093d               L071:
4199  093d 4a            	dec	a
4200  093e 2603          	jrne	L271
4201  0940 cc0d24        	jp	L3171
4202  0943               L271:
4203  0943 cc18be        	jp	L3422
4204  0946               L3061:
4205                     ; 525 		case PARAM_LANGUAGE_EN: //English
4205                     ; 526 			switch(a_byStdMessage)
4207  0946 b600          	ld	a,_screenBigStdMessage$L
4209                     ; 662 				default:
4209                     ; 663 					break;
4210  0948 a12d          	cp	a,#45
4211  094a 240b          	jruge	L631
4212  094c 48            	sll	a
4213  094d 97            	ld	x,a
4214  094e d60002        	ld	a,(L041+1,x)
4215  0951 88            	push	a
4216  0952 d60001        	ld	a,(L041,x)
4217  0955 88            	push	a
4218  0956 81            	ret
4219  0957               L631:
4220  0957 cc1c8f        	jp	L3732
4221  095a               L5061:
4222                     ; 528 				case SCREEN_STD_MSG_INIT_PARAM:
4222                     ; 529 					screenBigMessage("Parameter", "Initialization");
4224  095a ae97          	ld	x,#high(L3042)
4225  095c bf02          	ld	_screenBigMessage$L+2,x
4226  095e a697          	ld	a,#low(L3042)
4227  0960 b703          	ld	_screenBigMessage$L+3,a
4228  0962 a6a6          	ld	a,#low(L1042)
4229  0964 aea6          	ld	x,#high(L1042)
4230  0966 cd0211        	call	_screenBigMessage
4232                     ; 530 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4234  0969 a602          	ld	a,#2
4235  096b b702          	ld	_parametersSet$L+2,a
4236  096d 3f01          	clr	_parametersSet$L+1
4237  096f a608          	ld	a,#8
4238  0971 cd0000        	call	_parametersSet
4240                     ; 531 					break;
4242  0974 cc1c8f        	jp	L3732
4243  0977               L7061:
4244                     ; 532 				case SCREEN_STD_MSG_PHASE_MAN:
4244                     ; 533 					screenBigMessage("Manual", "phase");
4246  0977 ae8a          	ld	x,#high(L7042)
4247  0979 bf02          	ld	_screenBigMessage$L+2,x
4248  097b a68a          	ld	a,#low(L7042)
4249  097d b703          	ld	_screenBigMessage$L+3,a
4250  097f a690          	ld	a,#low(L5042)
4251  0981 ae90          	ld	x,#high(L5042)
4252  0983 cd0211        	call	_screenBigMessage
4254                     ; 534 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4256  0986 a602          	ld	a,#2
4257  0988 b702          	ld	_parametersSet$L+2,a
4258  098a 3f01          	clr	_parametersSet$L+1
4259  098c a608          	ld	a,#8
4260  098e cd0000        	call	_parametersSet
4262                     ; 535 					break;
4264  0991 cc1c8f        	jp	L3732
4265  0994               L1161:
4266                     ; 536 				case SCREEN_STD_MSG_PHASE_FAST:
4266                     ; 537 					screenBigMessage("Fast correction", "phase");
4268  0994 ae8a          	ld	x,#high(L7042)
4269  0996 bf02          	ld	_screenBigMessage$L+2,x
4270  0998 a68a          	ld	a,#low(L7042)
4271  099a b703          	ld	_screenBigMessage$L+3,a
4272  099c a67a          	ld	a,#low(L1142)
4273  099e ae7a          	ld	x,#high(L1142)
4274  09a0 cd0211        	call	_screenBigMessage
4276                     ; 538 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4278  09a3 a602          	ld	a,#2
4279  09a5 b702          	ld	_parametersSet$L+2,a
4280  09a7 3f01          	clr	_parametersSet$L+1
4281  09a9 a608          	ld	a,#8
4282  09ab cd0000        	call	_parametersSet
4284                     ; 539 					break;
4286  09ae cc1c8f        	jp	L3732
4287  09b1               L3161:
4288                     ; 540 				case SCREEN_STD_MSG_PHASE_OSCIL:
4288                     ; 541 					screenBigMessage("Phase with", "oscilloscope");
4290  09b1 ae62          	ld	x,#high(L5142)
4291  09b3 bf02          	ld	_screenBigMessage$L+2,x
4292  09b5 a662          	ld	a,#low(L5142)
4293  09b7 b703          	ld	_screenBigMessage$L+3,a
4294  09b9 a66f          	ld	a,#low(L3142)
4295  09bb ae6f          	ld	x,#high(L3142)
4296  09bd cd0211        	call	_screenBigMessage
4298                     ; 542 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4300  09c0 a602          	ld	a,#2
4301  09c2 b702          	ld	_parametersSet$L+2,a
4302  09c4 3f01          	clr	_parametersSet$L+1
4303  09c6 a608          	ld	a,#8
4304  09c8 cd0000        	call	_parametersSet
4306                     ; 543 					break;
4308  09cb cc1c8f        	jp	L3732
4309  09ce               L5161:
4310                     ; 544 				case SCREEN_STD_MSG_PHASE_AUTO:
4310                     ; 545 					screenBigMessage("Automatic", "phase");
4312  09ce ae8a          	ld	x,#high(L7042)
4313  09d0 bf02          	ld	_screenBigMessage$L+2,x
4314  09d2 a68a          	ld	a,#low(L7042)
4315  09d4 b703          	ld	_screenBigMessage$L+3,a
4316  09d6 a658          	ld	a,#low(L7142)
4317  09d8 ae58          	ld	x,#high(L7142)
4318  09da cd0211        	call	_screenBigMessage
4320                     ; 546 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4322  09dd a602          	ld	a,#2
4323  09df b702          	ld	_parametersSet$L+2,a
4324  09e1 3f01          	clr	_parametersSet$L+1
4325  09e3 a608          	ld	a,#8
4326  09e5 cd0000        	call	_parametersSet
4328                     ; 547 					break;
4330  09e8 cc1c8f        	jp	L3732
4331  09eb               L7161:
4332                     ; 548 				case SCREEN_STD_MSG_TEST_SH:
4332                     ; 549 					screenBigMessage("Scanning", "head test");
4334  09eb ae45          	ld	x,#high(L3242)
4335  09ed bf02          	ld	_screenBigMessage$L+2,x
4336  09ef a645          	ld	a,#low(L3242)
4337  09f1 b703          	ld	_screenBigMessage$L+3,a
4338  09f3 a64f          	ld	a,#low(L1242)
4339  09f5 ae4f          	ld	x,#high(L1242)
4340  09f7 cd0211        	call	_screenBigMessage
4342                     ; 550 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4344  09fa a602          	ld	a,#2
4345  09fc b702          	ld	_parametersSet$L+2,a
4346  09fe 3f01          	clr	_parametersSet$L+1
4347  0a00 a608          	ld	a,#8
4348  0a02 cd0000        	call	_parametersSet
4350                     ; 551 					break;
4352  0a05 cc1c8f        	jp	L3732
4353  0a08               L1261:
4354                     ; 552 				case SCREEN_STD_MSG_TEST_ENC:
4354                     ; 553 					screenBigMessage("Encoder", "test");
4356  0a08 ae38          	ld	x,#high(L7242)
4357  0a0a bf02          	ld	_screenBigMessage$L+2,x
4358  0a0c a638          	ld	a,#low(L7242)
4359  0a0e b703          	ld	_screenBigMessage$L+3,a
4360  0a10 a63d          	ld	a,#low(L5242)
4361  0a12 ae3d          	ld	x,#high(L5242)
4362  0a14 cd0211        	call	_screenBigMessage
4364                     ; 554 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4366  0a17 a602          	ld	a,#2
4367  0a19 b702          	ld	_parametersSet$L+2,a
4368  0a1b 3f01          	clr	_parametersSet$L+1
4369  0a1d a608          	ld	a,#8
4370  0a1f cd0000        	call	_parametersSet
4372                     ; 555 					break;
4374  0a22 cc1c8f        	jp	L3732
4375  0a25               L3261:
4376                     ; 556 				case SCREEN_STD_MSG_TEST_OUTPUT:
4376                     ; 557 					screenBigMessage("Outputs", "test");
4378  0a25 ae38          	ld	x,#high(L7242)
4379  0a27 bf02          	ld	_screenBigMessage$L+2,x
4380  0a29 a638          	ld	a,#low(L7242)
4381  0a2b b703          	ld	_screenBigMessage$L+3,a
4382  0a2d a630          	ld	a,#low(L1342)
4383  0a2f ae30          	ld	x,#high(L1342)
4384  0a31 cd0211        	call	_screenBigMessage
4386                     ; 558 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4388  0a34 a602          	ld	a,#2
4389  0a36 b702          	ld	_parametersSet$L+2,a
4390  0a38 3f01          	clr	_parametersSet$L+1
4391  0a3a a608          	ld	a,#8
4392  0a3c cd0000        	call	_parametersSet
4394                     ; 559 					break;
4396  0a3f cc1c8f        	jp	L3732
4397  0a42               L5261:
4398                     ; 560 				case SCREEN_STD_MSG_TEST_4:
4398                     ; 561 					screenBigMessage("Test", "4");
4400  0a42 ae29          	ld	x,#high(L5342)
4401  0a44 bf02          	ld	_screenBigMessage$L+2,x
4402  0a46 a629          	ld	a,#low(L5342)
4403  0a48 b703          	ld	_screenBigMessage$L+3,a
4404  0a4a a62b          	ld	a,#low(L3342)
4405  0a4c ae2b          	ld	x,#high(L3342)
4406  0a4e cd0211        	call	_screenBigMessage
4408                     ; 562 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4410  0a51 a602          	ld	a,#2
4411  0a53 b702          	ld	_parametersSet$L+2,a
4412  0a55 3f01          	clr	_parametersSet$L+1
4413  0a57 a608          	ld	a,#8
4414  0a59 cd0000        	call	_parametersSet
4416                     ; 563 					break;
4418  0a5c cc1c8f        	jp	L3732
4419  0a5f               L7261:
4420                     ; 564 				case SCREEN_STD_MSG_TEST_5:
4420                     ; 565 					screenBigMessage("Test", "5");
4422  0a5f ae27          	ld	x,#high(L7342)
4423  0a61 bf02          	ld	_screenBigMessage$L+2,x
4424  0a63 a627          	ld	a,#low(L7342)
4425  0a65 b703          	ld	_screenBigMessage$L+3,a
4426  0a67 a62b          	ld	a,#low(L3342)
4427  0a69 ae2b          	ld	x,#high(L3342)
4428  0a6b cd0211        	call	_screenBigMessage
4430                     ; 566 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4432  0a6e a602          	ld	a,#2
4433  0a70 b702          	ld	_parametersSet$L+2,a
4434  0a72 3f01          	clr	_parametersSet$L+1
4435  0a74 a608          	ld	a,#8
4436  0a76 cd0000        	call	_parametersSet
4438                     ; 567 					break;
4440  0a79 cc1c8f        	jp	L3732
4441  0a7c               L1361:
4442                     ; 568 				case SCREEN_STD_MSG_TEST_6:
4442                     ; 569 					screenBigMessage("Test", "6");
4444  0a7c ae25          	ld	x,#high(L1442)
4445  0a7e bf02          	ld	_screenBigMessage$L+2,x
4446  0a80 a625          	ld	a,#low(L1442)
4447  0a82 b703          	ld	_screenBigMessage$L+3,a
4448  0a84 a62b          	ld	a,#low(L3342)
4449  0a86 ae2b          	ld	x,#high(L3342)
4450  0a88 cd0211        	call	_screenBigMessage
4452                     ; 570 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4454  0a8b a602          	ld	a,#2
4455  0a8d b702          	ld	_parametersSet$L+2,a
4456  0a8f 3f01          	clr	_parametersSet$L+1
4457  0a91 a608          	ld	a,#8
4458  0a93 cd0000        	call	_parametersSet
4460                     ; 571 					break;
4462  0a96 cc1c8f        	jp	L3732
4463  0a99               L3361:
4464                     ; 572 				case SCREEN_STD_MSG_PARAM_5:
4464                     ; 573 					screenBigMessage("Parameter", "5");
4466  0a99 ae27          	ld	x,#high(L7342)
4467  0a9b bf02          	ld	_screenBigMessage$L+2,x
4468  0a9d a627          	ld	a,#low(L7342)
4469  0a9f b703          	ld	_screenBigMessage$L+3,a
4470  0aa1 a6a6          	ld	a,#low(L1042)
4471  0aa3 aea6          	ld	x,#high(L1042)
4472  0aa5 cd0211        	call	_screenBigMessage
4474                     ; 574 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4476  0aa8 a602          	ld	a,#2
4477  0aaa b702          	ld	_parametersSet$L+2,a
4478  0aac 3f01          	clr	_parametersSet$L+1
4479  0aae a608          	ld	a,#8
4480  0ab0 cd0000        	call	_parametersSet
4482                     ; 575 					break;
4484  0ab3 cc1c8f        	jp	L3732
4485  0ab6               L5361:
4486                     ; 576 				case SCREEN_STD_MSG_PARAM_6:
4486                     ; 577 					screenBigMessage("Parameter", "6");
4488  0ab6 ae25          	ld	x,#high(L1442)
4489  0ab8 bf02          	ld	_screenBigMessage$L+2,x
4490  0aba a625          	ld	a,#low(L1442)
4491  0abc b703          	ld	_screenBigMessage$L+3,a
4492  0abe a6a6          	ld	a,#low(L1042)
4493  0ac0 aea6          	ld	x,#high(L1042)
4494  0ac2 cd0211        	call	_screenBigMessage
4496                     ; 578 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4498  0ac5 a602          	ld	a,#2
4499  0ac7 b702          	ld	_parametersSet$L+2,a
4500  0ac9 3f01          	clr	_parametersSet$L+1
4501  0acb a608          	ld	a,#8
4502  0acd cd0000        	call	_parametersSet
4504                     ; 579 					break;
4506  0ad0 cc1c8f        	jp	L3732
4507  0ad3               L7361:
4508                     ; 580 				case SCREEN_STD_MSG_PHASE_OK:
4508                     ; 581 					screenBigMessage("Phase", "done");
4510  0ad3 ae1a          	ld	x,#high(L5442)
4511  0ad5 bf02          	ld	_screenBigMessage$L+2,x
4512  0ad7 a61a          	ld	a,#low(L5442)
4513  0ad9 b703          	ld	_screenBigMessage$L+3,a
4514  0adb a61f          	ld	a,#low(L3442)
4515  0add ae1f          	ld	x,#high(L3442)
4516  0adf cd0211        	call	_screenBigMessage
4518                     ; 582 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4520  0ae2 a602          	ld	a,#2
4521  0ae4 b702          	ld	_parametersSet$L+2,a
4522  0ae6 3f01          	clr	_parametersSet$L+1
4523  0ae8 a608          	ld	a,#8
4524  0aea cd0000        	call	_parametersSet
4526                     ; 583 					break;
4528  0aed cc1c8f        	jp	L3732
4529  0af0               L1461:
4530                     ; 584 				case SCREEN_STD_MSG_SPEED_ZERO:
4530                     ; 585 					screenBigMessage("Error", "Machine is stopped");				
4532  0af0 ae01          	ld	x,#high(L1542)
4533  0af2 bf02          	ld	_screenBigMessage$L+2,x
4534  0af4 a601          	ld	a,#low(L1542)
4535  0af6 b703          	ld	_screenBigMessage$L+3,a
4536  0af8 a614          	ld	a,#low(L7442)
4537  0afa ae14          	ld	x,#high(L7442)
4538  0afc cd0211        	call	_screenBigMessage
4540                     ; 586 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4542  0aff a602          	ld	a,#2
4543  0b01 b702          	ld	_parametersSet$L+2,a
4544  0b03 3f01          	clr	_parametersSet$L+1
4545  0b05 a608          	ld	a,#8
4546  0b07 cd0000        	call	_parametersSet
4548                     ; 587 					break;
4550  0b0a cc1c8f        	jp	L3732
4551  0b0d               L3461:
4552                     ; 588 				case SCREEN_STD_MSG_SPEED_TOO_FAST:
4552                     ; 589 					screenBigMessage("Error: Speed", "too high");				
4554  0b0d aeeb          	ld	x,#high(L5542)
4555  0b0f bf02          	ld	_screenBigMessage$L+2,x
4556  0b11 a6eb          	ld	a,#low(L5542)
4557  0b13 b703          	ld	_screenBigMessage$L+3,a
4558  0b15 a6f4          	ld	a,#low(L3542)
4559  0b17 aef4          	ld	x,#high(L3542)
4560  0b19 cd0211        	call	_screenBigMessage
4562                     ; 590 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4564  0b1c a602          	ld	a,#2
4565  0b1e b702          	ld	_parametersSet$L+2,a
4566  0b20 3f01          	clr	_parametersSet$L+1
4567  0b22 a608          	ld	a,#8
4568  0b24 cd0000        	call	_parametersSet
4570                     ; 591 					break;
4572  0b27 cc1c8f        	jp	L3732
4573  0b2a               L5461:
4574                     ; 592 				case SCREEN_STD_MSG_PHASE_MAN_ERR:
4574                     ; 593 					screenBigMessage("Error", "Machine not stopped");				
4576  0b2a aed7          	ld	x,#high(L7542)
4577  0b2c bf02          	ld	_screenBigMessage$L+2,x
4578  0b2e a6d7          	ld	a,#low(L7542)
4579  0b30 b703          	ld	_screenBigMessage$L+3,a
4580  0b32 a614          	ld	a,#low(L7442)
4581  0b34 ae14          	ld	x,#high(L7442)
4582  0b36 cd0211        	call	_screenBigMessage
4584                     ; 594 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4586  0b39 a602          	ld	a,#2
4587  0b3b b702          	ld	_parametersSet$L+2,a
4588  0b3d 3f01          	clr	_parametersSet$L+1
4589  0b3f a608          	ld	a,#8
4590  0b41 cd0000        	call	_parametersSet
4592                     ; 595 					break;
4594  0b44 cc1c8f        	jp	L3732
4595  0b47               L7461:
4596                     ; 596 				case SCREEN_STD_MSG_ERR_TEST_OUTPUT:
4596                     ; 597 					screenBigMessage("Error:", "Machine not stopped");
4598  0b47 aed7          	ld	x,#high(L7542)
4599  0b49 bf02          	ld	_screenBigMessage$L+2,x
4600  0b4b a6d7          	ld	a,#low(L7542)
4601  0b4d b703          	ld	_screenBigMessage$L+3,a
4602  0b4f a6d0          	ld	a,#low(L1642)
4603  0b51 aed0          	ld	x,#high(L1642)
4604  0b53 cd0211        	call	_screenBigMessage
4606                     ; 598 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4608  0b56 a602          	ld	a,#2
4609  0b58 b702          	ld	_parametersSet$L+2,a
4610  0b5a 3f01          	clr	_parametersSet$L+1
4611  0b5c a608          	ld	a,#8
4612  0b5e cd0000        	call	_parametersSet
4614                     ; 599 					break;
4616  0b61 cc1c8f        	jp	L3732
4617  0b64               L1561:
4618                     ; 600 				case SCREEN_STD_MSG_PHASE_AUTO_ERR:
4618                     ; 601 					screenBigMessage("Error in", "automatic phase");
4620  0b64 aeb7          	ld	x,#high(L5642)
4621  0b66 bf02          	ld	_screenBigMessage$L+2,x
4622  0b68 a6b7          	ld	a,#low(L5642)
4623  0b6a b703          	ld	_screenBigMessage$L+3,a
4624  0b6c a6c7          	ld	a,#low(L3642)
4625  0b6e aec7          	ld	x,#high(L3642)
4626  0b70 cd0211        	call	_screenBigMessage
4628                     ; 602 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4630  0b73 a602          	ld	a,#2
4631  0b75 b702          	ld	_parametersSet$L+2,a
4632  0b77 3f01          	clr	_parametersSet$L+1
4633  0b79 a608          	ld	a,#8
4634  0b7b cd0000        	call	_parametersSet
4636                     ; 603 					break;
4638  0b7e cc1c8f        	jp	L3732
4639  0b81               L3561:
4640                     ; 604 				case SCREEN_STD_MSG_PHASE_DOUBLE_MARK:
4640                     ; 605 					screenBigMessage("Error", "double mark");
4642  0b81 aeab          	ld	x,#high(L7642)
4643  0b83 bf02          	ld	_screenBigMessage$L+2,x
4644  0b85 a6ab          	ld	a,#low(L7642)
4645  0b87 b703          	ld	_screenBigMessage$L+3,a
4646  0b89 a614          	ld	a,#low(L7442)
4647  0b8b ae14          	ld	x,#high(L7442)
4648  0b8d cd0211        	call	_screenBigMessage
4650                     ; 606 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4652  0b90 a602          	ld	a,#2
4653  0b92 b702          	ld	_parametersSet$L+2,a
4654  0b94 3f01          	clr	_parametersSet$L+1
4655  0b96 a608          	ld	a,#8
4656  0b98 cd0000        	call	_parametersSet
4658                     ; 607 					break;
4660  0b9b cc1c8f        	jp	L3732
4661  0b9e               L5561:
4662                     ; 608 				case SCREEN_STD_MSG_TEST_OK:
4662                     ; 609 					screenBigMessage("Test", "done");			
4664  0b9e ae1a          	ld	x,#high(L5442)
4665  0ba0 bf02          	ld	_screenBigMessage$L+2,x
4666  0ba2 a61a          	ld	a,#low(L5442)
4667  0ba4 b703          	ld	_screenBigMessage$L+3,a
4668  0ba6 a62b          	ld	a,#low(L3342)
4669  0ba8 ae2b          	ld	x,#high(L3342)
4670  0baa cd0211        	call	_screenBigMessage
4672                     ; 610 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4674  0bad a602          	ld	a,#2
4675  0baf b702          	ld	_parametersSet$L+2,a
4676  0bb1 3f01          	clr	_parametersSet$L+1
4677  0bb3 a608          	ld	a,#8
4678  0bb5 cd0000        	call	_parametersSet
4680                     ; 611 					break;
4682  0bb8 cc1c8f        	jp	L3732
4683  0bbb               L7561:
4684                     ; 612 				case SCREEN_STD_MSG_TEST_SH_ERR:
4684                     ; 613 					screenBigMessage("Error in scan.", "head test");
4686  0bbb ae45          	ld	x,#high(L3242)
4687  0bbd bf02          	ld	_screenBigMessage$L+2,x
4688  0bbf a645          	ld	a,#low(L3242)
4689  0bc1 b703          	ld	_screenBigMessage$L+3,a
4690  0bc3 a69c          	ld	a,#low(L1742)
4691  0bc5 ae9c          	ld	x,#high(L1742)
4692  0bc7 cd0211        	call	_screenBigMessage
4694                     ; 614 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4696  0bca a602          	ld	a,#2
4697  0bcc b702          	ld	_parametersSet$L+2,a
4698  0bce 3f01          	clr	_parametersSet$L+1
4699  0bd0 a608          	ld	a,#8
4700  0bd2 cd0000        	call	_parametersSet
4702                     ; 615 					break;
4704  0bd5 cc1c8f        	jp	L3732
4705  0bd8               L1661:
4706                     ; 616 				case SCREEN_STD_MSG_TEST_ENC_ERR:
4706                     ; 617 					screenBigMessage("Error", "encoder test");
4708  0bd8 ae8f          	ld	x,#high(L3742)
4709  0bda bf02          	ld	_screenBigMessage$L+2,x
4710  0bdc a68f          	ld	a,#low(L3742)
4711  0bde b703          	ld	_screenBigMessage$L+3,a
4712  0be0 a614          	ld	a,#low(L7442)
4713  0be2 ae14          	ld	x,#high(L7442)
4714  0be4 cd0211        	call	_screenBigMessage
4716                     ; 618 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4718  0be7 a602          	ld	a,#2
4719  0be9 b702          	ld	_parametersSet$L+2,a
4720  0beb 3f01          	clr	_parametersSet$L+1
4721  0bed a608          	ld	a,#8
4722  0bef cd0000        	call	_parametersSet
4724                     ; 619 					break;
4726  0bf2 cc1c8f        	jp	L3732
4727  0bf5               L3661:
4728                     ; 620 				case SCREEN_STD_MSG_VISUAL_OSCILLOSCOPE:
4728                     ; 621 					screenBigMessage("Visual", "oscilloscope");
4730  0bf5 ae62          	ld	x,#high(L5142)
4731  0bf7 bf02          	ld	_screenBigMessage$L+2,x
4732  0bf9 a662          	ld	a,#low(L5142)
4733  0bfb b703          	ld	_screenBigMessage$L+3,a
4734  0bfd a688          	ld	a,#low(L5742)
4735  0bff ae88          	ld	x,#high(L5742)
4736  0c01 cd0211        	call	_screenBigMessage
4738                     ; 622 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4740  0c04 a602          	ld	a,#2
4741  0c06 b702          	ld	_parametersSet$L+2,a
4742  0c08 3f01          	clr	_parametersSet$L+1
4743  0c0a a608          	ld	a,#8
4744  0c0c cd0000        	call	_parametersSet
4746                     ; 623 					break;
4748  0c0f cc1c8f        	jp	L3732
4749  0c12               L5661:
4750                     ; 624 				case SCREEN_STD_MSG_CORRECTION_TRANS:
4750                     ; 625 					screenBigMessage("Lateral Correction", "(not installed)");
4752  0c12 ae65          	ld	x,#high(L1052)
4753  0c14 bf02          	ld	_screenBigMessage$L+2,x
4754  0c16 a665          	ld	a,#low(L1052)
4755  0c18 b703          	ld	_screenBigMessage$L+3,a
4756  0c1a a675          	ld	a,#low(L7742)
4757  0c1c ae75          	ld	x,#high(L7742)
4758  0c1e cd0211        	call	_screenBigMessage
4760                     ; 626 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4762  0c21 a602          	ld	a,#2
4763  0c23 b702          	ld	_parametersSet$L+2,a
4764  0c25 3f01          	clr	_parametersSet$L+1
4765  0c27 a608          	ld	a,#8
4766  0c29 cd0000        	call	_parametersSet
4768                     ; 627 					break;
4770  0c2c cc1c8f        	jp	L3732
4771  0c2f               L7661:
4772                     ; 628 				case SCREEN_STD_MSG_OFFSET_DISTANCE:
4772                     ; 629 					screenBigMessage("Offset", "distance");
4774  0c2f ae55          	ld	x,#high(L5052)
4775  0c31 bf02          	ld	_screenBigMessage$L+2,x
4776  0c33 a655          	ld	a,#low(L5052)
4777  0c35 b703          	ld	_screenBigMessage$L+3,a
4778  0c37 a65e          	ld	a,#low(L3052)
4779  0c39 ae5e          	ld	x,#high(L3052)
4780  0c3b cd0211        	call	_screenBigMessage
4782                     ; 630 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4784  0c3e a602          	ld	a,#2
4785  0c40 b702          	ld	_parametersSet$L+2,a
4786  0c42 3f01          	clr	_parametersSet$L+1
4787  0c44 a608          	ld	a,#8
4788  0c46 cd0000        	call	_parametersSet
4790                     ; 631 					break;
4792  0c49 cc1c8f        	jp	L3732
4793  0c4c               L1761:
4794                     ; 632 				case SCREEN_STD_MSG_PARAMETER_SAVED:
4794                     ; 633 					screenBigMessage("Parameter saved:", m_strString1);			
4796  0c4c ae14          	ld	x,#high(_m_strString1)
4797  0c4e bf02          	ld	_screenBigMessage$L+2,x
4798  0c50 a614          	ld	a,#low(_m_strString1)
4799  0c52 b703          	ld	_screenBigMessage$L+3,a
4800  0c54 a644          	ld	a,#low(L7052)
4801  0c56 ae44          	ld	x,#high(L7052)
4802  0c58 cd0211        	call	_screenBigMessage
4804                     ; 634 					break;
4806  0c5b cc1c8f        	jp	L3732
4807  0c5e               L3761:
4808                     ; 635 				case SCREEN_STD_MSG_CMD_DONE:
4808                     ; 636 					screenBigMessage("Command", "done");
4810  0c5e ae1a          	ld	x,#high(L5442)
4811  0c60 bf02          	ld	_screenBigMessage$L+2,x
4812  0c62 a61a          	ld	a,#low(L5442)
4813  0c64 b703          	ld	_screenBigMessage$L+3,a
4814  0c66 a63c          	ld	a,#low(L1152)
4815  0c68 ae3c          	ld	x,#high(L1152)
4816  0c6a cd0211        	call	_screenBigMessage
4818                     ; 637 					break;
4820  0c6d cc1c8f        	jp	L3732
4821  0c70               L5761:
4822                     ; 638 				case SCREEN_STD_MSG_SW_VERSION:
4822                     ; 639 					screenBigMessage("SW Version", "");
4824  0c70 ae30          	ld	x,#high(L5152)
4825  0c72 bf02          	ld	_screenBigMessage$L+2,x
4826  0c74 a630          	ld	a,#low(L5152)
4827  0c76 b703          	ld	_screenBigMessage$L+3,a
4828  0c78 a631          	ld	a,#low(L3152)
4829  0c7a ae31          	ld	x,#high(L3152)
4830  0c7c cd0211        	call	_screenBigMessage
4832                     ; 640 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4834  0c7f a602          	ld	a,#2
4835  0c81 b702          	ld	_parametersSet$L+2,a
4836  0c83 3f01          	clr	_parametersSet$L+1
4837  0c85 a608          	ld	a,#8
4838  0c87 cd0000        	call	_parametersSet
4840                     ; 641 					break;
4842  0c8a cc1c8f        	jp	L3732
4843  0c8d               L7761:
4844                     ; 642 				case SCREEN_STD_MSG_UNKNOWN_CODE:
4844                     ; 643 					screenBigMessage("Unknown", "code");
4846  0c8d ae23          	ld	x,#high(L1252)
4847  0c8f bf02          	ld	_screenBigMessage$L+2,x
4848  0c91 a623          	ld	a,#low(L1252)
4849  0c93 b703          	ld	_screenBigMessage$L+3,a
4850  0c95 a628          	ld	a,#low(L7152)
4851  0c97 ae28          	ld	x,#high(L7152)
4852  0c99 cd0211        	call	_screenBigMessage
4854                     ; 644 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4856  0c9c a602          	ld	a,#2
4857  0c9e b702          	ld	_parametersSet$L+2,a
4858  0ca0 3f01          	clr	_parametersSet$L+1
4859  0ca2 a608          	ld	a,#8
4860  0ca4 cd0000        	call	_parametersSet
4862                     ; 645 					break;
4864  0ca7 cc1c8f        	jp	L3732
4865  0caa               L1071:
4866                     ; 646 				case SCREEN_STD_MSG_UNKNOWN_ADDCODE:
4866                     ; 647 					screenBigMessage("Unknown", "AdditionalCode");
4868  0caa ae14          	ld	x,#high(L3252)
4869  0cac bf02          	ld	_screenBigMessage$L+2,x
4870  0cae a614          	ld	a,#low(L3252)
4871  0cb0 b703          	ld	_screenBigMessage$L+3,a
4872  0cb2 a628          	ld	a,#low(L7152)
4873  0cb4 ae28          	ld	x,#high(L7152)
4874  0cb6 cd0211        	call	_screenBigMessage
4876                     ; 648 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4878  0cb9 a602          	ld	a,#2
4879  0cbb b702          	ld	_parametersSet$L+2,a
4880  0cbd 3f01          	clr	_parametersSet$L+1
4881  0cbf a608          	ld	a,#8
4882  0cc1 cd0000        	call	_parametersSet
4884                     ; 649 					break;
4886  0cc4 cc1c8f        	jp	L3732
4887  0cc7               L3071:
4888                     ; 650 				case SCREEN_STD_MSG_RESET_ERROR:
4888                     ; 651 					screenBigMessage("Error", "reset");
4890  0cc7 ae0e          	ld	x,#high(L5252)
4891  0cc9 bf02          	ld	_screenBigMessage$L+2,x
4892  0ccb a60e          	ld	a,#low(L5252)
4893  0ccd b703          	ld	_screenBigMessage$L+3,a
4894  0ccf a614          	ld	a,#low(L7442)
4895  0cd1 ae14          	ld	x,#high(L7442)
4896  0cd3 cd0211        	call	_screenBigMessage
4898                     ; 652 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4900  0cd6 a602          	ld	a,#2
4901  0cd8 b702          	ld	_parametersSet$L+2,a
4902  0cda 3f01          	clr	_parametersSet$L+1
4903  0cdc a608          	ld	a,#8
4904  0cde cd0000        	call	_parametersSet
4906                     ; 653 					break;
4908  0ce1 cc1c8f        	jp	L3732
4909  0ce4               L5071:
4910                     ; 654 				case SCREEN_STD_MSG_PARAMETER_VALUE_NA:
4910                     ; 655 					screenBigMessage("Error", "Unacceptable value");
4912  0ce4 aefb          	ld	x,#high(L7252)
4913  0ce6 bf02          	ld	_screenBigMessage$L+2,x
4914  0ce8 a6fb          	ld	a,#low(L7252)
4915  0cea b703          	ld	_screenBigMessage$L+3,a
4916  0cec a614          	ld	a,#low(L7442)
4917  0cee ae14          	ld	x,#high(L7442)
4918  0cf0 cd0211        	call	_screenBigMessage
4920                     ; 656 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4922  0cf3 a602          	ld	a,#2
4923  0cf5 b702          	ld	_parametersSet$L+2,a
4924  0cf7 3f01          	clr	_parametersSet$L+1
4925  0cf9 a608          	ld	a,#8
4926  0cfb cd0000        	call	_parametersSet
4928                     ; 657 					break;
4930  0cfe cc1c8f        	jp	L3732
4931  0d01               L7071:
4932                     ; 658 				case SCREEN_STD_MSG_WRONG_MEMORY_SLOT:
4932                     ; 659 					screenBigMessage("Error: Position", "not available");
4934  0d01 aedd          	ld	x,#high(L3352)
4935  0d03 bf02          	ld	_screenBigMessage$L+2,x
4936  0d05 a6dd          	ld	a,#low(L3352)
4937  0d07 b703          	ld	_screenBigMessage$L+3,a
4938  0d09 a6eb          	ld	a,#low(L1352)
4939  0d0b aeeb          	ld	x,#high(L1352)
4940  0d0d cd0211        	call	_screenBigMessage
4942                     ; 660 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4944  0d10 a602          	ld	a,#2
4945  0d12 b702          	ld	_parametersSet$L+2,a
4946  0d14 3f01          	clr	_parametersSet$L+1
4947  0d16 a608          	ld	a,#8
4948  0d18 cd0000        	call	_parametersSet
4950                     ; 661 					break;
4952  0d1b cc1c8f        	jp	L3732
4953  0d1e               L1171:
4954                     ; 662 				default:
4954                     ; 663 					break;
4956  0d1e cc1c8f        	jp	L3732
4957  0d21               L7732:
4958                     ; 665 			break;
4960  0d21 cc1c8f        	jp	L3732
4961  0d24               L3171:
4962                     ; 666 		case PARAM_LANGUAGE_DE: //Deutch
4962                     ; 667 			switch(a_byStdMessage)
4964  0d24 b600          	ld	a,_screenBigStdMessage$L
4966                     ; 803 				default:
4966                     ; 804 					break;
4967  0d26 a12d          	cp	a,#45
4968  0d28 240b          	jruge	L241
4969  0d2a 48            	sll	a
4970  0d2b 97            	ld	x,a
4971  0d2c d6005c        	ld	a,(L441+1,x)
4972  0d2f 88            	push	a
4973  0d30 d6005b        	ld	a,(L441,x)
4974  0d33 88            	push	a
4975  0d34 81            	ret
4976  0d35               L241:
4977  0d35 cc1c8f        	jp	L3732
4978  0d38               L5171:
4979                     ; 669 				case SCREEN_STD_MSG_INIT_PARAM:
4979                     ; 670 					screenBigMessage("Einweihung", "Parameter");
4981  0d38 aea6          	ld	x,#high(L1042)
4982  0d3a bf02          	ld	_screenBigMessage$L+2,x
4983  0d3c a6a6          	ld	a,#low(L1042)
4984  0d3e b703          	ld	_screenBigMessage$L+3,a
4985  0d40 a6d2          	ld	a,#low(L1452)
4986  0d42 aed2          	ld	x,#high(L1452)
4987  0d44 cd0211        	call	_screenBigMessage
4989                     ; 671 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
4991  0d47 a602          	ld	a,#2
4992  0d49 b702          	ld	_parametersSet$L+2,a
4993  0d4b 3f01          	clr	_parametersSet$L+1
4994  0d4d a608          	ld	a,#8
4995  0d4f cd0000        	call	_parametersSet
4997                     ; 672 					break;
4999  0d52 cc1c8f        	jp	L3732
5000  0d55               L7171:
5001                     ; 673 				case SCREEN_STD_MSG_PHASE_MAN:
5001                     ; 674 					screenBigMessage("manuell", "Einstellung");
5003  0d55 aebe          	ld	x,#high(L5452)
5004  0d57 bf02          	ld	_screenBigMessage$L+2,x
5005  0d59 a6be          	ld	a,#low(L5452)
5006  0d5b b703          	ld	_screenBigMessage$L+3,a
5007  0d5d a6ca          	ld	a,#low(L3452)
5008  0d5f aeca          	ld	x,#high(L3452)
5009  0d61 cd0211        	call	_screenBigMessage
5011                     ; 675 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
5013  0d64 a602          	ld	a,#2
5014  0d66 b702          	ld	_parametersSet$L+2,a
5015  0d68 3f01          	clr	_parametersSet$L+1
5016  0d6a a608          	ld	a,#8
5017  0d6c cd0000        	call	_parametersSet
5019                     ; 676 					break;
5021  0d6f cc1c8f        	jp	L3732
5022  0d72               L1271:
5023                     ; 677 				case SCREEN_STD_MSG_PHASE_FAST:
5023                     ; 678 					screenBigMessage("Einstellung", "schnell Verbesserung");
5025  0d72 aea9          	ld	x,#high(L7452)
5026  0d74 bf02          	ld	_screenBigMessage$L+2,x
5027  0d76 a6a9          	ld	a,#low(L7452)
5028  0d78 b703          	ld	_screenBigMessage$L+3,a
5029  0d7a a6be          	ld	a,#low(L5452)
5030  0d7c aebe          	ld	x,#high(L5452)
5031  0d7e cd0211        	call	_screenBigMessage
5033                     ; 679 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
5035  0d81 a602          	ld	a,#2
5036  0d83 b702          	ld	_parametersSet$L+2,a
5037  0d85 3f01          	clr	_parametersSet$L+1
5038  0d87 a608          	ld	a,#8
5039  0d89 cd0000        	call	_parametersSet
5041                     ; 680 					break;
5043  0d8c cc1c8f        	jp	L3732
5044  0d8f               L3271:
5045                     ; 681 				case SCREEN_STD_MSG_PHASE_OSCIL:
5045                     ; 682 					screenBigMessage("Einstellung", "Oszilloskop");
5047  0d8f ae9d          	ld	x,#high(L1552)
5048  0d91 bf02          	ld	_screenBigMessage$L+2,x
5049  0d93 a69d          	ld	a,#low(L1552)
5050  0d95 b703          	ld	_screenBigMessage$L+3,a
5051  0d97 a6be          	ld	a,#low(L5452)
5052  0d99 aebe          	ld	x,#high(L5452)
5053  0d9b cd0211        	call	_screenBigMessage
5055                     ; 683 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
5057  0d9e a602          	ld	a,#2
5058  0da0 b702          	ld	_parametersSet$L+2,a
5059  0da2 3f01          	clr	_parametersSet$L+1
5060  0da4 a608          	ld	a,#8
5061  0da6 cd0000        	call	_parametersSet
5063                     ; 684 					break;
5065  0da9 cc1c8f        	jp	L3732
5066  0dac               L5271:
5067                     ; 685 				case SCREEN_STD_MSG_PHASE_AUTO:
5067                     ; 686 					screenBigMessage("automatische", "Einstellung");
5069  0dac aebe          	ld	x,#high(L5452)
5070  0dae bf02          	ld	_screenBigMessage$L+2,x
5071  0db0 a6be          	ld	a,#low(L5452)
5072  0db2 b703          	ld	_screenBigMessage$L+3,a
5073  0db4 a690          	ld	a,#low(L3552)
5074  0db6 ae90          	ld	x,#high(L3552)
5075  0db8 cd0211        	call	_screenBigMessage
5077                     ; 687 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
5079  0dbb a602          	ld	a,#2
5080  0dbd b702          	ld	_parametersSet$L+2,a
5081  0dbf 3f01          	clr	_parametersSet$L+1
5082  0dc1 a608          	ld	a,#8
5083  0dc3 cd0000        	call	_parametersSet
5085                     ; 688 					break;
5087  0dc6 cc1c8f        	jp	L3732
5088  0dc9               L7271:
5089                     ; 689 				case SCREEN_STD_MSG_TEST_SH:
5089                     ; 690 					screenBigMessage("Lesekopf", "Test");
5091  0dc9 ae2b          	ld	x,#high(L3342)
5092  0dcb bf02          	ld	_screenBigMessage$L+2,x
5093  0dcd a62b          	ld	a,#low(L3342)
5094  0dcf b703          	ld	_screenBigMessage$L+3,a
5095  0dd1 a687          	ld	a,#low(L5552)
5096  0dd3 ae87          	ld	x,#high(L5552)
5097  0dd5 cd0211        	call	_screenBigMessage
5099                     ; 691 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
5101  0dd8 a602          	ld	a,#2
5102  0dda b702          	ld	_parametersSet$L+2,a
5103  0ddc 3f01          	clr	_parametersSet$L+1
5104  0dde a608          	ld	a,#8
5105  0de0 cd0000        	call	_parametersSet
5107                     ; 692 					break;
5109  0de3 cc1c8f        	jp	L3732
5110  0de6               L1371:
5111                     ; 693 				case SCREEN_STD_MSG_TEST_ENC:
5111                     ; 694 					screenBigMessage("Encoder", "Test");
5113  0de6 ae2b          	ld	x,#high(L3342)
5114  0de8 bf02          	ld	_screenBigMessage$L+2,x
5115  0dea a62b          	ld	a,#low(L3342)
5116  0dec b703          	ld	_screenBigMessage$L+3,a
5117  0dee a63d          	ld	a,#low(L5242)
5118  0df0 ae3d          	ld	x,#high(L5242)
5119  0df2 cd0211        	call	_screenBigMessage
5121                     ; 695 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
5123  0df5 a602          	ld	a,#2
5124  0df7 b702          	ld	_parametersSet$L+2,a
5125  0df9 3f01          	clr	_parametersSet$L+1
5126  0dfb a608          	ld	a,#8
5127  0dfd cd0000        	call	_parametersSet
5129                     ; 696 					break;
5131  0e00 cc1c8f        	jp	L3732
5132  0e03               L3371:
5133                     ; 697 				case SCREEN_STD_MSG_TEST_OUTPUT:
5133                     ; 698 					screenBigMessage("Auseänge", "Test");
5135  0e03 ae2b          	ld	x,#high(L3342)
5136  0e05 bf02          	ld	_screenBigMessage$L+2,x
5137  0e07 a62b          	ld	a,#low(L3342)
5138  0e09 b703          	ld	_screenBigMessage$L+3,a
5139  0e0b a67e          	ld	a,#low(L7552)
5140  0e0d ae7e          	ld	x,#high(L7552)
5141  0e0f cd0211        	call	_screenBigMessage
5143                     ; 699 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
5145  0e12 a602          	ld	a,#2
5146  0e14 b702          	ld	_parametersSet$L+2,a
5147  0e16 3f01          	clr	_parametersSet$L+1
5148  0e18 a608          	ld	a,#8
5149  0e1a cd0000        	call	_parametersSet
5151                     ; 700 					break;
5153  0e1d cc1c8f        	jp	L3732
5154  0e20               L5371:
5155                     ; 701 				case SCREEN_STD_MSG_TEST_4:
5155                     ; 702 					screenBigMessage("Test", "4");
5157  0e20 ae29          	ld	x,#high(L5342)
5158  0e22 bf02          	ld	_screenBigMessage$L+2,x
5159  0e24 a629          	ld	a,#low(L5342)
5160  0e26 b703          	ld	_screenBigMessage$L+3,a
5161  0e28 a62b          	ld	a,#low(L3342)
5162  0e2a ae2b          	ld	x,#high(L3342)
5163  0e2c cd0211        	call	_screenBigMessage
5165                     ; 703 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
5167  0e2f a602          	ld	a,#2
5168  0e31 b702          	ld	_parametersSet$L+2,a
5169  0e33 3f01          	clr	_parametersSet$L+1
5170  0e35 a608          	ld	a,#8
5171  0e37 cd0000        	call	_parametersSet
5173                     ; 704 					break;
5175  0e3a cc1c8f        	jp	L3732
5176  0e3d               L7371:
5177                     ; 705 				case SCREEN_STD_MSG_TEST_5:
5177                     ; 706 					screenBigMessage("Test", "5");
5179  0e3d ae27          	ld	x,#high(L7342)
5180  0e3f bf02          	ld	_screenBigMessage$L+2,x
5181  0e41 a627          	ld	a,#low(L7342)
5182  0e43 b703          	ld	_screenBigMessage$L+3,a
5183  0e45 a62b          	ld	a,#low(L3342)
5184  0e47 ae2b          	ld	x,#high(L3342)
5185  0e49 cd0211        	call	_screenBigMessage
5187                     ; 707 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
5189  0e4c a602          	ld	a,#2
5190  0e4e b702          	ld	_parametersSet$L+2,a
5191  0e50 3f01          	clr	_parametersSet$L+1
5192  0e52 a608          	ld	a,#8
5193  0e54 cd0000        	call	_parametersSet
5195                     ; 708 					break;
5197  0e57 cc1c8f        	jp	L3732
5198  0e5a               L1471:
5199                     ; 709 				case SCREEN_STD_MSG_TEST_6:
5199                     ; 710 					screenBigMessage("Test", "6");
5201  0e5a ae25          	ld	x,#high(L1442)
5202  0e5c bf02          	ld	_screenBigMessage$L+2,x
5203  0e5e a625          	ld	a,#low(L1442)
5204  0e60 b703          	ld	_screenBigMessage$L+3,a
5205  0e62 a62b          	ld	a,#low(L3342)
5206  0e64 ae2b          	ld	x,#high(L3342)
5207  0e66 cd0211        	call	_screenBigMessage
5209                     ; 711 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
5211  0e69 a602          	ld	a,#2
5212  0e6b b702          	ld	_parametersSet$L+2,a
5213  0e6d 3f01          	clr	_parametersSet$L+1
5214  0e6f a608          	ld	a,#8
5215  0e71 cd0000        	call	_parametersSet
5217                     ; 712 					break;
5219  0e74 cc1c8f        	jp	L3732
5220  0e77               L3471:
5221                     ; 713 				case SCREEN_STD_MSG_PARAM_5:
5221                     ; 714 					screenBigMessage("Parameter", "5");
5223  0e77 ae27          	ld	x,#high(L7342)
5224  0e79 bf02          	ld	_screenBigMessage$L+2,x
5225  0e7b a627          	ld	a,#low(L7342)
5226  0e7d b703          	ld	_screenBigMessage$L+3,a
5227  0e7f a6a6          	ld	a,#low(L1042)
5228  0e81 aea6          	ld	x,#high(L1042)
5229  0e83 cd0211        	call	_screenBigMessage
5231                     ; 715 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
5233  0e86 a602          	ld	a,#2
5234  0e88 b702          	ld	_parametersSet$L+2,a
5235  0e8a 3f01          	clr	_parametersSet$L+1
5236  0e8c a608          	ld	a,#8
5237  0e8e cd0000        	call	_parametersSet
5239                     ; 716 					break;
5241  0e91 cc1c8f        	jp	L3732
5242  0e94               L5471:
5243                     ; 717 				case SCREEN_STD_MSG_PARAM_6:
5243                     ; 718 					screenBigMessage("Parameter", "6");
5245  0e94 ae25          	ld	x,#high(L1442)
5246  0e96 bf02          	ld	_screenBigMessage$L+2,x
5247  0e98 a625          	ld	a,#low(L1442)
5248  0e9a b703          	ld	_screenBigMessage$L+3,a
5249  0e9c a6a6          	ld	a,#low(L1042)
5250  0e9e aea6          	ld	x,#high(L1042)
5251  0ea0 cd0211        	call	_screenBigMessage
5253                     ; 719 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
5255  0ea3 a602          	ld	a,#2
5256  0ea5 b702          	ld	_parametersSet$L+2,a
5257  0ea7 3f01          	clr	_parametersSet$L+1
5258  0ea9 a608          	ld	a,#8
5259  0eab cd0000        	call	_parametersSet
5261                     ; 720 					break;
5263  0eae cc1c8f        	jp	L3732
5264  0eb1               L7471:
5265                     ; 721 				case SCREEN_STD_MSG_PHASE_OK:
5265                     ; 722 					screenBigMessage("Positiv", "Einstellung");
5267  0eb1 aebe          	ld	x,#high(L5452)
5268  0eb3 bf02          	ld	_screenBigMessage$L+2,x
5269  0eb5 a6be          	ld	a,#low(L5452)
5270  0eb7 b703          	ld	_screenBigMessage$L+3,a
5271  0eb9 a676          	ld	a,#low(L1652)
5272  0ebb ae76          	ld	x,#high(L1652)
5273  0ebd cd0211        	call	_screenBigMessage
5275                     ; 723 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
5277  0ec0 a602          	ld	a,#2
5278  0ec2 b702          	ld	_parametersSet$L+2,a
5279  0ec4 3f01          	clr	_parametersSet$L+1
5280  0ec6 a608          	ld	a,#8
5281  0ec8 cd0000        	call	_parametersSet
5283                     ; 724 					break;
5285  0ecb cc1c8f        	jp	L3732
5286  0ece               L1571:
5287                     ; 725 				case SCREEN_STD_MSG_SPEED_ZERO:
5287                     ; 726 					screenBigMessage("Fehler:", "Machine stop");
5289  0ece ae61          	ld	x,#high(L5652)
5290  0ed0 bf02          	ld	_screenBigMessage$L+2,x
5291  0ed2 a661          	ld	a,#low(L5652)
5292  0ed4 b703          	ld	_screenBigMessage$L+3,a
5293  0ed6 a66e          	ld	a,#low(L3652)
5294  0ed8 ae6e          	ld	x,#high(L3652)
5295  0eda cd0211        	call	_screenBigMessage
5297                     ; 727 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
5299  0edd a602          	ld	a,#2
5300  0edf b702          	ld	_parametersSet$L+2,a
5301  0ee1 3f01          	clr	_parametersSet$L+1
5302  0ee3 a608          	ld	a,#8
5303  0ee5 cd0000        	call	_parametersSet
5305                     ; 728 					break;
5307  0ee8 cc1c8f        	jp	L3732
5308  0eeb               L3571:
5309                     ; 729 				case SCREEN_STD_MSG_SPEED_TOO_FAST:
5309                     ; 730 					screenBigMessage("Fehler: Geschwindigkeit", "zu hoch");
5311  0eeb ae41          	ld	x,#high(L1752)
5312  0eed bf02          	ld	_screenBigMessage$L+2,x
5313  0eef a641          	ld	a,#low(L1752)
5314  0ef1 b703          	ld	_screenBigMessage$L+3,a
5315  0ef3 a649          	ld	a,#low(L7652)
5316  0ef5 ae49          	ld	x,#high(L7652)
5317  0ef7 cd0211        	call	_screenBigMessage
5319                     ; 731 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
5321  0efa a602          	ld	a,#2
5322  0efc b702          	ld	_parametersSet$L+2,a
5323  0efe 3f01          	clr	_parametersSet$L+1
5324  0f00 a608          	ld	a,#8
5325  0f02 cd0000        	call	_parametersSet
5327                     ; 732 					break;
5329  0f05 cc1c8f        	jp	L3732
5330  0f08               L5571:
5331                     ; 733 				case SCREEN_STD_MSG_ERR_TEST_OUTPUT:
5331                     ; 734 					screenBigMessage("Fehler:", "Machine steht nicht");
5333  0f08 ae2d          	ld	x,#high(L3752)
5334  0f0a bf02          	ld	_screenBigMessage$L+2,x
5335  0f0c a62d          	ld	a,#low(L3752)
5336  0f0e b703          	ld	_screenBigMessage$L+3,a
5337  0f10 a66e          	ld	a,#low(L3652)
5338  0f12 ae6e          	ld	x,#high(L3652)
5339  0f14 cd0211        	call	_screenBigMessage
5341                     ; 735 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
5343  0f17 a602          	ld	a,#2
5344  0f19 b702          	ld	_parametersSet$L+2,a
5345  0f1b 3f01          	clr	_parametersSet$L+1
5346  0f1d a608          	ld	a,#8
5347  0f1f cd0000        	call	_parametersSet
5349                     ; 736 					break;
5351  0f22 cc1c8f        	jp	L3732
5352  0f25               L7571:
5353                     ; 737 				case SCREEN_STD_MSG_PHASE_MAN_ERR:
5353                     ; 738 					screenBigMessage("Fehler: Einstellung", "Machine steht nicht");
5355  0f25 ae2d          	ld	x,#high(L3752)
5356  0f27 bf02          	ld	_screenBigMessage$L+2,x
5357  0f29 a62d          	ld	a,#low(L3752)
5358  0f2b b703          	ld	_screenBigMessage$L+3,a
5359  0f2d a619          	ld	a,#low(L5752)
5360  0f2f ae19          	ld	x,#high(L5752)
5361  0f31 cd0211        	call	_screenBigMessage
5363                     ; 739 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
5365  0f34 a602          	ld	a,#2
5366  0f36 b702          	ld	_parametersSet$L+2,a
5367  0f38 3f01          	clr	_parametersSet$L+1
5368  0f3a a608          	ld	a,#8
5369  0f3c cd0000        	call	_parametersSet
5371                     ; 740 					break;
5373  0f3f cc1c8f        	jp	L3732
5374  0f42               L1671:
5375                     ; 741 				case SCREEN_STD_MSG_PHASE_AUTO_ERR:
5375                     ; 742 					screenBigMessage("Fehler automatische", "Einstellung");
5377  0f42 aebe          	ld	x,#high(L5452)
5378  0f44 bf02          	ld	_screenBigMessage$L+2,x
5379  0f46 a6be          	ld	a,#low(L5452)
5380  0f48 b703          	ld	_screenBigMessage$L+3,a
5381  0f4a a605          	ld	a,#low(L7752)
5382  0f4c ae05          	ld	x,#high(L7752)
5383  0f4e cd0211        	call	_screenBigMessage
5385                     ; 743 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
5387  0f51 a602          	ld	a,#2
5388  0f53 b702          	ld	_parametersSet$L+2,a
5389  0f55 3f01          	clr	_parametersSet$L+1
5390  0f57 a608          	ld	a,#8
5391  0f59 cd0000        	call	_parametersSet
5393                     ; 744 					break;
5395  0f5c cc1c8f        	jp	L3732
5396  0f5f               L3671:
5397                     ; 745 				case SCREEN_STD_MSG_PHASE_DOUBLE_MARK:
5397                     ; 746 					screenBigMessage("Fehler", "doppel Marke");
5399  0f5f aef1          	ld	x,#high(L3062)
5400  0f61 bf02          	ld	_screenBigMessage$L+2,x
5401  0f63 a6f1          	ld	a,#low(L3062)
5402  0f65 b703          	ld	_screenBigMessage$L+3,a
5403  0f67 a6fe          	ld	a,#low(L1062)
5404  0f69 aefe          	ld	x,#high(L1062)
5405  0f6b cd0211        	call	_screenBigMessage
5407                     ; 747 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
5409  0f6e a602          	ld	a,#2
5410  0f70 b702          	ld	_parametersSet$L+2,a
5411  0f72 3f01          	clr	_parametersSet$L+1
5412  0f74 a608          	ld	a,#8
5413  0f76 cd0000        	call	_parametersSet
5415                     ; 748 					break;
5417  0f79 cc1c8f        	jp	L3732
5418  0f7c               L5671:
5419                     ; 749 				case SCREEN_STD_MSG_TEST_OK:
5419                     ; 750 					screenBigMessage("Test OK", "");
5421  0f7c ae30          	ld	x,#high(L5152)
5422  0f7e bf02          	ld	_screenBigMessage$L+2,x
5423  0f80 a630          	ld	a,#low(L5152)
5424  0f82 b703          	ld	_screenBigMessage$L+3,a
5425  0f84 a6e9          	ld	a,#low(L5062)
5426  0f86 aee9          	ld	x,#high(L5062)
5427  0f88 cd0211        	call	_screenBigMessage
5429                     ; 751 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
5431  0f8b a602          	ld	a,#2
5432  0f8d b702          	ld	_parametersSet$L+2,a
5433  0f8f 3f01          	clr	_parametersSet$L+1
5434  0f91 a608          	ld	a,#8
5435  0f93 cd0000        	call	_parametersSet
5437                     ; 752 					break;
5439  0f96 cc1c8f        	jp	L3732
5440  0f99               L7671:
5441                     ; 753 				case SCREEN_STD_MSG_TEST_SH_ERR:
5441                     ; 754 					screenBigMessage("Test Fehler", "Lesekopf");
5443  0f99 ae87          	ld	x,#high(L5552)
5444  0f9b bf02          	ld	_screenBigMessage$L+2,x
5445  0f9d a687          	ld	a,#low(L5552)
5446  0f9f b703          	ld	_screenBigMessage$L+3,a
5447  0fa1 a6dd          	ld	a,#low(L7062)
5448  0fa3 aedd          	ld	x,#high(L7062)
5449  0fa5 cd0211        	call	_screenBigMessage
5451                     ; 755 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
5453  0fa8 a602          	ld	a,#2
5454  0faa b702          	ld	_parametersSet$L+2,a
5455  0fac 3f01          	clr	_parametersSet$L+1
5456  0fae a608          	ld	a,#8
5457  0fb0 cd0000        	call	_parametersSet
5459                     ; 756 					break;
5461  0fb3 cc1c8f        	jp	L3732
5462  0fb6               L1771:
5463                     ; 757 				case SCREEN_STD_MSG_TEST_ENC_ERR:
5463                     ; 758 					screenBigMessage("Test Fehler", "Encoder");
5465  0fb6 ae3d          	ld	x,#high(L5242)
5466  0fb8 bf02          	ld	_screenBigMessage$L+2,x
5467  0fba a63d          	ld	a,#low(L5242)
5468  0fbc b703          	ld	_screenBigMessage$L+3,a
5469  0fbe a6dd          	ld	a,#low(L7062)
5470  0fc0 aedd          	ld	x,#high(L7062)
5471  0fc2 cd0211        	call	_screenBigMessage
5473                     ; 759 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
5475  0fc5 a602          	ld	a,#2
5476  0fc7 b702          	ld	_parametersSet$L+2,a
5477  0fc9 3f01          	clr	_parametersSet$L+1
5478  0fcb a608          	ld	a,#8
5479  0fcd cd0000        	call	_parametersSet
5481                     ; 760 					break;
5483  0fd0 cc1c8f        	jp	L3732
5484  0fd3               L3771:
5485                     ; 761 				case SCREEN_STD_MSG_VISUAL_OSCILLOSCOPE:
5485                     ; 762 					screenBigMessage("Visualisierung", "Oszilloskop");
5487  0fd3 ae9d          	ld	x,#high(L1552)
5488  0fd5 bf02          	ld	_screenBigMessage$L+2,x
5489  0fd7 a69d          	ld	a,#low(L1552)
5490  0fd9 b703          	ld	_screenBigMessage$L+3,a
5491  0fdb a6ce          	ld	a,#low(L1162)
5492  0fdd aece          	ld	x,#high(L1162)
5493  0fdf cd0211        	call	_screenBigMessage
5495                     ; 763 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
5497  0fe2 a602          	ld	a,#2
5498  0fe4 b702          	ld	_parametersSet$L+2,a
5499  0fe6 3f01          	clr	_parametersSet$L+1
5500  0fe8 a608          	ld	a,#8
5501  0fea cd0000        	call	_parametersSet
5503                     ; 764 					break;
5505  0fed cc1c8f        	jp	L3732
5506  0ff0               L5771:
5507                     ; 765 				case SCREEN_STD_MSG_CORRECTION_TRANS:
5507                     ; 766 					screenBigMessage("seiten Korrektur", "(nicht in betriebs)");
5509  0ff0 aea9          	ld	x,#high(L5162)
5510  0ff2 bf02          	ld	_screenBigMessage$L+2,x
5511  0ff4 a6a9          	ld	a,#low(L5162)
5512  0ff6 b703          	ld	_screenBigMessage$L+3,a
5513  0ff8 a6bd          	ld	a,#low(L3162)
5514  0ffa aebd          	ld	x,#high(L3162)
5515  0ffc cd0211        	call	_screenBigMessage
5517                     ; 767 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
5519  0fff a602          	ld	a,#2
5520  1001 b702          	ld	_parametersSet$L+2,a
5521  1003 3f01          	clr	_parametersSet$L+1
5522  1005 a608          	ld	a,#8
5523  1007 cd0000        	call	_parametersSet
5525                     ; 768 					break;
5527  100a cc1c8f        	jp	L3732
5528  100d               L7771:
5529                     ; 769 				case SCREEN_STD_MSG_OFFSET_DISTANCE:
5529                     ; 770 					screenBigMessage("Interval", "offset");
5531  100d ae99          	ld	x,#high(L1262)
5532  100f bf02          	ld	_screenBigMessage$L+2,x
5533  1011 a699          	ld	a,#low(L1262)
5534  1013 b703          	ld	_screenBigMessage$L+3,a
5535  1015 a6a0          	ld	a,#low(L7162)
5536  1017 aea0          	ld	x,#high(L7162)
5537  1019 cd0211        	call	_screenBigMessage
5539                     ; 771 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
5541  101c a602          	ld	a,#2
5542  101e b702          	ld	_parametersSet$L+2,a
5543  1020 3f01          	clr	_parametersSet$L+1
5544  1022 a608          	ld	a,#8
5545  1024 cd0000        	call	_parametersSet
5547                     ; 772 					break;
5549  1027 cc1c8f        	jp	L3732
5550  102a               L1002:
5551                     ; 773 				case SCREEN_STD_MSG_PARAMETER_SAVED:
5551                     ; 774 					screenBigMessage("Speichern", "Parameter");
5553  102a aea6          	ld	x,#high(L1042)
5554  102c bf02          	ld	_screenBigMessage$L+2,x
5555  102e a6a6          	ld	a,#low(L1042)
5556  1030 b703          	ld	_screenBigMessage$L+3,a
5557  1032 a68f          	ld	a,#low(L3262)
5558  1034 ae8f          	ld	x,#high(L3262)
5559  1036 cd0211        	call	_screenBigMessage
5561                     ; 775 					break;
5563  1039 cc1c8f        	jp	L3732
5564  103c               L3002:
5565                     ; 776 				case SCREEN_STD_MSG_CMD_DONE:
5565                     ; 777 					screenBigMessage("Befelhl", "");
5567  103c ae30          	ld	x,#high(L5152)
5568  103e bf02          	ld	_screenBigMessage$L+2,x
5569  1040 a630          	ld	a,#low(L5152)
5570  1042 b703          	ld	_screenBigMessage$L+3,a
5571  1044 a687          	ld	a,#low(L5262)
5572  1046 ae87          	ld	x,#high(L5262)
5573  1048 cd0211        	call	_screenBigMessage
5575                     ; 778 					break;
5577  104b cc1c8f        	jp	L3732
5578  104e               L5002:
5579                     ; 779 				case SCREEN_STD_MSG_SW_VERSION:
5579                     ; 780 					screenBigMessage("Version SW", "");
5581  104e ae30          	ld	x,#high(L5152)
5582  1050 bf02          	ld	_screenBigMessage$L+2,x
5583  1052 a630          	ld	a,#low(L5152)
5584  1054 b703          	ld	_screenBigMessage$L+3,a
5585  1056 a67c          	ld	a,#low(L7262)
5586  1058 ae7c          	ld	x,#high(L7262)
5587  105a cd0211        	call	_screenBigMessage
5589                     ; 781 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
5591  105d a602          	ld	a,#2
5592  105f b702          	ld	_parametersSet$L+2,a
5593  1061 3f01          	clr	_parametersSet$L+1
5594  1063 a608          	ld	a,#8
5595  1065 cd0000        	call	_parametersSet
5597                     ; 782 					break;
5599  1068 cc1c8f        	jp	L3732
5600  106b               L7002:
5601                     ; 783 				case SCREEN_STD_MSG_UNKNOWN_CODE:
5601                     ; 784 					screenBigMessage("Unbekannt", "Code");
5603  106b ae6d          	ld	x,#high(L3362)
5604  106d bf02          	ld	_screenBigMessage$L+2,x
5605  106f a66d          	ld	a,#low(L3362)
5606  1071 b703          	ld	_screenBigMessage$L+3,a
5607  1073 a672          	ld	a,#low(L1362)
5608  1075 ae72          	ld	x,#high(L1362)
5609  1077 cd0211        	call	_screenBigMessage
5611                     ; 785 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
5613  107a a602          	ld	a,#2
5614  107c b702          	ld	_parametersSet$L+2,a
5615  107e 3f01          	clr	_parametersSet$L+1
5616  1080 a608          	ld	a,#8
5617  1082 cd0000        	call	_parametersSet
5619                     ; 786 					break;
5621  1085 cc1c8f        	jp	L3732
5622  1088               L1102:
5623                     ; 787 				case SCREEN_STD_MSG_UNKNOWN_ADDCODE:
5623                     ; 788 					screenBigMessage("Unbekannt", "Zusatzlichcode");
5625  1088 ae5e          	ld	x,#high(L5362)
5626  108a bf02          	ld	_screenBigMessage$L+2,x
5627  108c a65e          	ld	a,#low(L5362)
5628  108e b703          	ld	_screenBigMessage$L+3,a
5629  1090 a672          	ld	a,#low(L1362)
5630  1092 ae72          	ld	x,#high(L1362)
5631  1094 cd0211        	call	_screenBigMessage
5633                     ; 789 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
5635  1097 a602          	ld	a,#2
5636  1099 b702          	ld	_parametersSet$L+2,a
5637  109b 3f01          	clr	_parametersSet$L+1
5638  109d a608          	ld	a,#8
5639  109f cd0000        	call	_parametersSet
5641                     ; 790 					break;
5643  10a2 cc1c8f        	jp	L3732
5644  10a5               L3102:
5645                     ; 791 				case SCREEN_STD_MSG_RESET_ERROR:
5645                     ; 792 					screenBigMessage("Nulleistellung", "Irrtum");
5647  10a5 ae48          	ld	x,#high(L1462)
5648  10a7 bf02          	ld	_screenBigMessage$L+2,x
5649  10a9 a648          	ld	a,#low(L1462)
5650  10ab b703          	ld	_screenBigMessage$L+3,a
5651  10ad a64f          	ld	a,#low(L7362)
5652  10af ae4f          	ld	x,#high(L7362)
5653  10b1 cd0211        	call	_screenBigMessage
5655                     ; 793 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
5657  10b4 a602          	ld	a,#2
5658  10b6 b702          	ld	_parametersSet$L+2,a
5659  10b8 3f01          	clr	_parametersSet$L+1
5660  10ba a608          	ld	a,#8
5661  10bc cd0000        	call	_parametersSet
5663                     ; 794 					break;
5665  10bf cc1c8f        	jp	L3732
5666  10c2               L5102:
5667                     ; 795 				case SCREEN_STD_MSG_PARAMETER_VALUE_NA:
5667                     ; 796 					screenBigMessage("Fehler: Wert", "nicht akzeptabel");
5669  10c2 ae2a          	ld	x,#high(L5462)
5670  10c4 bf02          	ld	_screenBigMessage$L+2,x
5671  10c6 a62a          	ld	a,#low(L5462)
5672  10c8 b703          	ld	_screenBigMessage$L+3,a
5673  10ca a63b          	ld	a,#low(L3462)
5674  10cc ae3b          	ld	x,#high(L3462)
5675  10ce cd0211        	call	_screenBigMessage
5677                     ; 797 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
5679  10d1 a602          	ld	a,#2
5680  10d3 b702          	ld	_parametersSet$L+2,a
5681  10d5 3f01          	clr	_parametersSet$L+1
5682  10d7 a608          	ld	a,#8
5683  10d9 cd0000        	call	_parametersSet
5685                     ; 798 					break;
5687  10dc cc1c8f        	jp	L3732
5688  10df               L7102:
5689                     ; 799 				case SCREEN_STD_MSG_WRONG_MEMORY_SLOT:
5689                     ; 800 					screenBigMessage("Fehler: Position", "nicht verfugbar");
5691  10df ae09          	ld	x,#high(L1562)
5692  10e1 bf02          	ld	_screenBigMessage$L+2,x
5693  10e3 a609          	ld	a,#low(L1562)
5694  10e5 b703          	ld	_screenBigMessage$L+3,a
5695  10e7 a619          	ld	a,#low(L7462)
5696  10e9 ae19          	ld	x,#high(L7462)
5697  10eb cd0211        	call	_screenBigMessage
5699                     ; 801 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
5701  10ee a602          	ld	a,#2
5702  10f0 b702          	ld	_parametersSet$L+2,a
5703  10f2 3f01          	clr	_parametersSet$L+1
5704  10f4 a608          	ld	a,#8
5705  10f6 cd0000        	call	_parametersSet
5707                     ; 802 					break;
5709  10f9 cc1c8f        	jp	L3732
5710  10fc               L1202:
5711                     ; 803 				default:
5711                     ; 804 					break;
5713  10fc cc1c8f        	jp	L3732
5714  10ff               L7352:
5715                     ; 806 			break;		
5717  10ff cc1c8f        	jp	L3732
5718  1102               L3202:
5719                     ; 807 		case PARAM_LANGUAGE_FR: //French
5719                     ; 808 			switch(a_byStdMessage)
5721  1102 b600          	ld	a,_screenBigStdMessage$L
5723                     ; 944 				default:
5723                     ; 945 					break;
5724  1104 a12d          	cp	a,#45
5725  1106 240b          	jruge	L641
5726  1108 48            	sll	a
5727  1109 97            	ld	x,a
5728  110a d600b6        	ld	a,(L051+1,x)
5729  110d 88            	push	a
5730  110e d600b5        	ld	a,(L051,x)
5731  1111 88            	push	a
5732  1112 81            	ret
5733  1113               L641:
5734  1113 cc1c8f        	jp	L3732
5735  1116               L5202:
5736                     ; 810 				case SCREEN_STD_MSG_INIT_PARAM:
5736                     ; 811 					screenBigMessage("Initiation", "parametres");
5738  1116 aef3          	ld	x,#high(L1662)
5739  1118 bf02          	ld	_screenBigMessage$L+2,x
5740  111a a6f3          	ld	a,#low(L1662)
5741  111c b703          	ld	_screenBigMessage$L+3,a
5742  111e a6fe          	ld	a,#low(L7562)
5743  1120 aefe          	ld	x,#high(L7562)
5744  1122 cd0211        	call	_screenBigMessage
5746                     ; 812 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
5748  1125 a602          	ld	a,#2
5749  1127 b702          	ld	_parametersSet$L+2,a
5750  1129 3f01          	clr	_parametersSet$L+1
5751  112b a608          	ld	a,#8
5752  112d cd0000        	call	_parametersSet
5754                     ; 813 					break;
5756  1130 cc1c8f        	jp	L3732
5757  1133               L7202:
5758                     ; 814 				case SCREEN_STD_MSG_PHASE_MAN:
5758                     ; 815 					screenBigMessage("Mise en", "phase manuel");
5760  1133 aede          	ld	x,#high(L5662)
5761  1135 bf02          	ld	_screenBigMessage$L+2,x
5762  1137 a6de          	ld	a,#low(L5662)
5763  1139 b703          	ld	_screenBigMessage$L+3,a
5764  113b a6eb          	ld	a,#low(L3662)
5765  113d aeeb          	ld	x,#high(L3662)
5766  113f cd0211        	call	_screenBigMessage
5768                     ; 816 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
5770  1142 a602          	ld	a,#2
5771  1144 b702          	ld	_parametersSet$L+2,a
5772  1146 3f01          	clr	_parametersSet$L+1
5773  1148 a608          	ld	a,#8
5774  114a cd0000        	call	_parametersSet
5776                     ; 817 					break;
5778  114d cc1c8f        	jp	L3732
5779  1150               L1302:
5780                     ; 818 				case SCREEN_STD_MSG_PHASE_FAST:
5780                     ; 819 					screenBigMessage("Mise en phase", "a corection rapid");
5782  1150 aebe          	ld	x,#high(L1762)
5783  1152 bf02          	ld	_screenBigMessage$L+2,x
5784  1154 a6be          	ld	a,#low(L1762)
5785  1156 b703          	ld	_screenBigMessage$L+3,a
5786  1158 a6d0          	ld	a,#low(L7662)
5787  115a aed0          	ld	x,#high(L7662)
5788  115c cd0211        	call	_screenBigMessage
5790                     ; 820 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
5792  115f a602          	ld	a,#2
5793  1161 b702          	ld	_parametersSet$L+2,a
5794  1163 3f01          	clr	_parametersSet$L+1
5795  1165 a608          	ld	a,#8
5796  1167 cd0000        	call	_parametersSet
5798                     ; 821 					break;
5800  116a cc1c8f        	jp	L3732
5801  116d               L3302:
5802                     ; 822 				case SCREEN_STD_MSG_PHASE_OSCIL:
5802                     ; 823 					screenBigMessage("Mise en phase", "a oscilloscope");
5804  116d aeaf          	ld	x,#high(L3762)
5805  116f bf02          	ld	_screenBigMessage$L+2,x
5806  1171 a6af          	ld	a,#low(L3762)
5807  1173 b703          	ld	_screenBigMessage$L+3,a
5808  1175 a6d0          	ld	a,#low(L7662)
5809  1177 aed0          	ld	x,#high(L7662)
5810  1179 cd0211        	call	_screenBigMessage
5812                     ; 824 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
5814  117c a602          	ld	a,#2
5815  117e b702          	ld	_parametersSet$L+2,a
5816  1180 3f01          	clr	_parametersSet$L+1
5817  1182 a608          	ld	a,#8
5818  1184 cd0000        	call	_parametersSet
5820                     ; 825 					break;
5822  1187 cc1c8f        	jp	L3732
5823  118a               L5302:
5824                     ; 826 				case SCREEN_STD_MSG_PHASE_AUTO:
5824                     ; 827 					screenBigMessage("Mise en phase", "automatique");
5826  118a aea3          	ld	x,#high(L5762)
5827  118c bf02          	ld	_screenBigMessage$L+2,x
5828  118e a6a3          	ld	a,#low(L5762)
5829  1190 b703          	ld	_screenBigMessage$L+3,a
5830  1192 a6d0          	ld	a,#low(L7662)
5831  1194 aed0          	ld	x,#high(L7662)
5832  1196 cd0211        	call	_screenBigMessage
5834                     ; 828 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
5836  1199 a602          	ld	a,#2
5837  119b b702          	ld	_parametersSet$L+2,a
5838  119d 3f01          	clr	_parametersSet$L+1
5839  119f a608          	ld	a,#8
5840  11a1 cd0000        	call	_parametersSet
5842                     ; 829 					break;
5844  11a4 cc1c8f        	jp	L3732
5845  11a7               L7302:
5846                     ; 830 				case SCREEN_STD_MSG_TEST_SH:
5846                     ; 831 					screenBigMessage("Test tete", "explorante");
5848  11a7 ae8e          	ld	x,#high(L1072)
5849  11a9 bf02          	ld	_screenBigMessage$L+2,x
5850  11ab a68e          	ld	a,#low(L1072)
5851  11ad b703          	ld	_screenBigMessage$L+3,a
5852  11af a699          	ld	a,#low(L7762)
5853  11b1 ae99          	ld	x,#high(L7762)
5854  11b3 cd0211        	call	_screenBigMessage
5856                     ; 832 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
5858  11b6 a602          	ld	a,#2
5859  11b8 b702          	ld	_parametersSet$L+2,a
5860  11ba 3f01          	clr	_parametersSet$L+1
5861  11bc a608          	ld	a,#8
5862  11be cd0000        	call	_parametersSet
5864                     ; 833 					break;
5866  11c1 cc1c8f        	jp	L3732
5867  11c4               L1402:
5868                     ; 834 				case SCREEN_STD_MSG_TEST_ENC:
5868                     ; 835 					screenBigMessage("Test", "encoder");
5870  11c4 ae86          	ld	x,#high(L3072)
5871  11c6 bf02          	ld	_screenBigMessage$L+2,x
5872  11c8 a686          	ld	a,#low(L3072)
5873  11ca b703          	ld	_screenBigMessage$L+3,a
5874  11cc a62b          	ld	a,#low(L3342)
5875  11ce ae2b          	ld	x,#high(L3342)
5876  11d0 cd0211        	call	_screenBigMessage
5878                     ; 836 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
5880  11d3 a602          	ld	a,#2
5881  11d5 b702          	ld	_parametersSet$L+2,a
5882  11d7 3f01          	clr	_parametersSet$L+1
5883  11d9 a608          	ld	a,#8
5884  11db cd0000        	call	_parametersSet
5886                     ; 837 					break;
5888  11de cc1c8f        	jp	L3732
5889  11e1               L3402:
5890                     ; 838 				case SCREEN_STD_MSG_TEST_OUTPUT:
5890                     ; 839 					screenBigMessage("Test", "sorties");
5892  11e1 ae7e          	ld	x,#high(L5072)
5893  11e3 bf02          	ld	_screenBigMessage$L+2,x
5894  11e5 a67e          	ld	a,#low(L5072)
5895  11e7 b703          	ld	_screenBigMessage$L+3,a
5896  11e9 a62b          	ld	a,#low(L3342)
5897  11eb ae2b          	ld	x,#high(L3342)
5898  11ed cd0211        	call	_screenBigMessage
5900                     ; 840 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
5902  11f0 a602          	ld	a,#2
5903  11f2 b702          	ld	_parametersSet$L+2,a
5904  11f4 3f01          	clr	_parametersSet$L+1
5905  11f6 a608          	ld	a,#8
5906  11f8 cd0000        	call	_parametersSet
5908                     ; 841 					break;
5910  11fb cc1c8f        	jp	L3732
5911  11fe               L5402:
5912                     ; 842 				case SCREEN_STD_MSG_TEST_4:
5912                     ; 843 					screenBigMessage("Test", "4");
5914  11fe ae29          	ld	x,#high(L5342)
5915  1200 bf02          	ld	_screenBigMessage$L+2,x
5916  1202 a629          	ld	a,#low(L5342)
5917  1204 b703          	ld	_screenBigMessage$L+3,a
5918  1206 a62b          	ld	a,#low(L3342)
5919  1208 ae2b          	ld	x,#high(L3342)
5920  120a cd0211        	call	_screenBigMessage
5922                     ; 844 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
5924  120d a602          	ld	a,#2
5925  120f b702          	ld	_parametersSet$L+2,a
5926  1211 3f01          	clr	_parametersSet$L+1
5927  1213 a608          	ld	a,#8
5928  1215 cd0000        	call	_parametersSet
5930                     ; 845 					break;
5932  1218 cc1c8f        	jp	L3732
5933  121b               L7402:
5934                     ; 846 				case SCREEN_STD_MSG_TEST_5:
5934                     ; 847 					screenBigMessage("Test", "5");
5936  121b ae27          	ld	x,#high(L7342)
5937  121d bf02          	ld	_screenBigMessage$L+2,x
5938  121f a627          	ld	a,#low(L7342)
5939  1221 b703          	ld	_screenBigMessage$L+3,a
5940  1223 a62b          	ld	a,#low(L3342)
5941  1225 ae2b          	ld	x,#high(L3342)
5942  1227 cd0211        	call	_screenBigMessage
5944                     ; 848 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
5946  122a a602          	ld	a,#2
5947  122c b702          	ld	_parametersSet$L+2,a
5948  122e 3f01          	clr	_parametersSet$L+1
5949  1230 a608          	ld	a,#8
5950  1232 cd0000        	call	_parametersSet
5952                     ; 849 					break;
5954  1235 cc1c8f        	jp	L3732
5955  1238               L1502:
5956                     ; 850 				case SCREEN_STD_MSG_TEST_6:
5956                     ; 851 					screenBigMessage("Test", "6");
5958  1238 ae25          	ld	x,#high(L1442)
5959  123a bf02          	ld	_screenBigMessage$L+2,x
5960  123c a625          	ld	a,#low(L1442)
5961  123e b703          	ld	_screenBigMessage$L+3,a
5962  1240 a62b          	ld	a,#low(L3342)
5963  1242 ae2b          	ld	x,#high(L3342)
5964  1244 cd0211        	call	_screenBigMessage
5966                     ; 852 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
5968  1247 a602          	ld	a,#2
5969  1249 b702          	ld	_parametersSet$L+2,a
5970  124b 3f01          	clr	_parametersSet$L+1
5971  124d a608          	ld	a,#8
5972  124f cd0000        	call	_parametersSet
5974                     ; 853 					break;
5976  1252 cc1c8f        	jp	L3732
5977  1255               L3502:
5978                     ; 854 				case SCREEN_STD_MSG_PARAM_5:
5978                     ; 855 					screenBigMessage("Parametre", "5");
5980  1255 ae27          	ld	x,#high(L7342)
5981  1257 bf02          	ld	_screenBigMessage$L+2,x
5982  1259 a627          	ld	a,#low(L7342)
5983  125b b703          	ld	_screenBigMessage$L+3,a
5984  125d a674          	ld	a,#low(L7072)
5985  125f ae74          	ld	x,#high(L7072)
5986  1261 cd0211        	call	_screenBigMessage
5988                     ; 856 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
5990  1264 a602          	ld	a,#2
5991  1266 b702          	ld	_parametersSet$L+2,a
5992  1268 3f01          	clr	_parametersSet$L+1
5993  126a a608          	ld	a,#8
5994  126c cd0000        	call	_parametersSet
5996                     ; 857 					break;
5998  126f cc1c8f        	jp	L3732
5999  1272               L5502:
6000                     ; 858 				case SCREEN_STD_MSG_PARAM_6:
6000                     ; 859 					screenBigMessage("Parametre", "6");
6002  1272 ae25          	ld	x,#high(L1442)
6003  1274 bf02          	ld	_screenBigMessage$L+2,x
6004  1276 a625          	ld	a,#low(L1442)
6005  1278 b703          	ld	_screenBigMessage$L+3,a
6006  127a a674          	ld	a,#low(L7072)
6007  127c ae74          	ld	x,#high(L7072)
6008  127e cd0211        	call	_screenBigMessage
6010                     ; 860 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
6012  1281 a602          	ld	a,#2
6013  1283 b702          	ld	_parametersSet$L+2,a
6014  1285 3f01          	clr	_parametersSet$L+1
6015  1287 a608          	ld	a,#8
6016  1289 cd0000        	call	_parametersSet
6018                     ; 861 					break;
6020  128c cc1c8f        	jp	L3732
6021  128f               L7502:
6022                     ; 862 				case SCREEN_STD_MSG_PHASE_OK:
6022                     ; 863 					screenBigMessage("Mise en phase", "correctement");
6024  128f ae67          	ld	x,#high(L1172)
6025  1291 bf02          	ld	_screenBigMessage$L+2,x
6026  1293 a667          	ld	a,#low(L1172)
6027  1295 b703          	ld	_screenBigMessage$L+3,a
6028  1297 a6d0          	ld	a,#low(L7662)
6029  1299 aed0          	ld	x,#high(L7662)
6030  129b cd0211        	call	_screenBigMessage
6032                     ; 864 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
6034  129e a602          	ld	a,#2
6035  12a0 b702          	ld	_parametersSet$L+2,a
6036  12a2 3f01          	clr	_parametersSet$L+1
6037  12a4 a608          	ld	a,#8
6038  12a6 cd0000        	call	_parametersSet
6040                     ; 865 					break;
6042  12a9 cc1c8f        	jp	L3732
6043  12ac               L1602:
6044                     ; 866 				case SCREEN_STD_MSG_SPEED_ZERO:
6044                     ; 867 					screenBigMessage("Erreur", "machine ferme");
6046  12ac ae52          	ld	x,#high(L5172)
6047  12ae bf02          	ld	_screenBigMessage$L+2,x
6048  12b0 a652          	ld	a,#low(L5172)
6049  12b2 b703          	ld	_screenBigMessage$L+3,a
6050  12b4 a660          	ld	a,#low(L3172)
6051  12b6 ae60          	ld	x,#high(L3172)
6052  12b8 cd0211        	call	_screenBigMessage
6054                     ; 868 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
6056  12bb a602          	ld	a,#2
6057  12bd b702          	ld	_parametersSet$L+2,a
6058  12bf 3f01          	clr	_parametersSet$L+1
6059  12c1 a608          	ld	a,#8
6060  12c3 cd0000        	call	_parametersSet
6062                     ; 869 					break;
6064  12c6 cc1c8f        	jp	L3732
6065  12c9               L3602:
6066                     ; 870 				case SCREEN_STD_MSG_SPEED_TOO_FAST:
6066                     ; 871 					screenBigMessage("Erreur: velocite", "trop eleve");
6068  12c9 ae36          	ld	x,#high(L1272)
6069  12cb bf02          	ld	_screenBigMessage$L+2,x
6070  12cd a636          	ld	a,#low(L1272)
6071  12cf b703          	ld	_screenBigMessage$L+3,a
6072  12d1 a641          	ld	a,#low(L7172)
6073  12d3 ae41          	ld	x,#high(L7172)
6074  12d5 cd0211        	call	_screenBigMessage
6076                     ; 872 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
6078  12d8 a602          	ld	a,#2
6079  12da b702          	ld	_parametersSet$L+2,a
6080  12dc 3f01          	clr	_parametersSet$L+1
6081  12de a608          	ld	a,#8
6082  12e0 cd0000        	call	_parametersSet
6084                     ; 873 					break;
6086  12e3 cc1c8f        	jp	L3732
6087  12e6               L5602:
6088                     ; 874 				case SCREEN_STD_MSG_PHASE_MAN_ERR:
6088                     ; 875 					screenBigMessage("Erreur:", "machine pas arrete");
6090  12e6 ae1b          	ld	x,#high(L5272)
6091  12e8 bf02          	ld	_screenBigMessage$L+2,x
6092  12ea a61b          	ld	a,#low(L5272)
6093  12ec b703          	ld	_screenBigMessage$L+3,a
6094  12ee a62e          	ld	a,#low(L3272)
6095  12f0 ae2e          	ld	x,#high(L3272)
6096  12f2 cd0211        	call	_screenBigMessage
6098                     ; 876 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
6100  12f5 a602          	ld	a,#2
6101  12f7 b702          	ld	_parametersSet$L+2,a
6102  12f9 3f01          	clr	_parametersSet$L+1
6103  12fb a608          	ld	a,#8
6104  12fd cd0000        	call	_parametersSet
6106                     ; 877 					break;
6108  1300 cc1c8f        	jp	L3732
6109  1303               L7602:
6110                     ; 878 				case SCREEN_STD_MSG_ERR_TEST_OUTPUT:
6110                     ; 879 					screenBigMessage("Test erreur:", "Machine pas arrete");
6112  1303 aefb          	ld	x,#high(L1372)
6113  1305 bf02          	ld	_screenBigMessage$L+2,x
6114  1307 a6fb          	ld	a,#low(L1372)
6115  1309 b703          	ld	_screenBigMessage$L+3,a
6116  130b a60e          	ld	a,#low(L7272)
6117  130d ae0e          	ld	x,#high(L7272)
6118  130f cd0211        	call	_screenBigMessage
6120                     ; 880 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
6122  1312 a602          	ld	a,#2
6123  1314 b702          	ld	_parametersSet$L+2,a
6124  1316 3f01          	clr	_parametersSet$L+1
6125  1318 a608          	ld	a,#8
6126  131a cd0000        	call	_parametersSet
6128                     ; 881 					break;
6130  131d cc1c8f        	jp	L3732
6131  1320               L1702:
6132                     ; 882 				case SCREEN_STD_MSG_PHASE_AUTO_ERR:
6132                     ; 883 					screenBigMessage("Erreur: mise in", "phase automatique");
6134  1320 aed9          	ld	x,#high(L5372)
6135  1322 bf02          	ld	_screenBigMessage$L+2,x
6136  1324 a6d9          	ld	a,#low(L5372)
6137  1326 b703          	ld	_screenBigMessage$L+3,a
6138  1328 a6eb          	ld	a,#low(L3372)
6139  132a aeeb          	ld	x,#high(L3372)
6140  132c cd0211        	call	_screenBigMessage
6142                     ; 884 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
6144  132f a602          	ld	a,#2
6145  1331 b702          	ld	_parametersSet$L+2,a
6146  1333 3f01          	clr	_parametersSet$L+1
6147  1335 a608          	ld	a,#8
6148  1337 cd0000        	call	_parametersSet
6150                     ; 885 					break;
6152  133a cc1c8f        	jp	L3732
6153  133d               L3702:
6154                     ; 886 				case SCREEN_STD_MSG_PHASE_DOUBLE_MARK:
6154                     ; 887 					screenBigMessage("Erreur:", "double marque");
6156  133d aecb          	ld	x,#high(L7372)
6157  133f bf02          	ld	_screenBigMessage$L+2,x
6158  1341 a6cb          	ld	a,#low(L7372)
6159  1343 b703          	ld	_screenBigMessage$L+3,a
6160  1345 a62e          	ld	a,#low(L3272)
6161  1347 ae2e          	ld	x,#high(L3272)
6162  1349 cd0211        	call	_screenBigMessage
6164                     ; 888 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
6166  134c a602          	ld	a,#2
6167  134e b702          	ld	_parametersSet$L+2,a
6168  1350 3f01          	clr	_parametersSet$L+1
6169  1352 a608          	ld	a,#8
6170  1354 cd0000        	call	_parametersSet
6172                     ; 889 					break;
6174  1357 cc1c8f        	jp	L3732
6175  135a               L5702:
6176                     ; 890 				case SCREEN_STD_MSG_TEST_OK:
6176                     ; 891 					screenBigMessage("Test", "OK");
6178  135a aec8          	ld	x,#high(L1472)
6179  135c bf02          	ld	_screenBigMessage$L+2,x
6180  135e a6c8          	ld	a,#low(L1472)
6181  1360 b703          	ld	_screenBigMessage$L+3,a
6182  1362 a62b          	ld	a,#low(L3342)
6183  1364 ae2b          	ld	x,#high(L3342)
6184  1366 cd0211        	call	_screenBigMessage
6186                     ; 892 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
6188  1369 a602          	ld	a,#2
6189  136b b702          	ld	_parametersSet$L+2,a
6190  136d 3f01          	clr	_parametersSet$L+1
6191  136f a608          	ld	a,#8
6192  1371 cd0000        	call	_parametersSet
6194                     ; 893 					break;
6196  1374 cc1c8f        	jp	L3732
6197  1377               L7702:
6198                     ; 894 				case SCREEN_STD_MSG_TEST_SH_ERR:
6198                     ; 895 					screenBigMessage("Erreur", "test tete");
6200  1377 aebe          	ld	x,#high(L3472)
6201  1379 bf02          	ld	_screenBigMessage$L+2,x
6202  137b a6be          	ld	a,#low(L3472)
6203  137d b703          	ld	_screenBigMessage$L+3,a
6204  137f a660          	ld	a,#low(L3172)
6205  1381 ae60          	ld	x,#high(L3172)
6206  1383 cd0211        	call	_screenBigMessage
6208                     ; 896 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
6210  1386 a602          	ld	a,#2
6211  1388 b702          	ld	_parametersSet$L+2,a
6212  138a 3f01          	clr	_parametersSet$L+1
6213  138c a608          	ld	a,#8
6214  138e cd0000        	call	_parametersSet
6216                     ; 897 					break;
6218  1391 cc1c8f        	jp	L3732
6219  1394               L1012:
6220                     ; 898 				case SCREEN_STD_MSG_TEST_ENC_ERR:
6220                     ; 899 					screenBigMessage("Erreur", "test encoder");
6222  1394 aeb1          	ld	x,#high(L5472)
6223  1396 bf02          	ld	_screenBigMessage$L+2,x
6224  1398 a6b1          	ld	a,#low(L5472)
6225  139a b703          	ld	_screenBigMessage$L+3,a
6226  139c a660          	ld	a,#low(L3172)
6227  139e ae60          	ld	x,#high(L3172)
6228  13a0 cd0211        	call	_screenBigMessage
6230                     ; 900 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
6232  13a3 a602          	ld	a,#2
6233  13a5 b702          	ld	_parametersSet$L+2,a
6234  13a7 3f01          	clr	_parametersSet$L+1
6235  13a9 a608          	ld	a,#8
6236  13ab cd0000        	call	_parametersSet
6238                     ; 901 					break;
6240  13ae cc1c8f        	jp	L3732
6241  13b1               L3012:
6242                     ; 902 				case SCREEN_STD_MSG_VISUAL_OSCILLOSCOPE:
6242                     ; 903 					screenBigMessage("Visualisation", "oscilloscope");
6244  13b1 ae62          	ld	x,#high(L5142)
6245  13b3 bf02          	ld	_screenBigMessage$L+2,x
6246  13b5 a662          	ld	a,#low(L5142)
6247  13b7 b703          	ld	_screenBigMessage$L+3,a
6248  13b9 a6a3          	ld	a,#low(L7472)
6249  13bb aea3          	ld	x,#high(L7472)
6250  13bd cd0211        	call	_screenBigMessage
6252                     ; 904 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
6254  13c0 a602          	ld	a,#2
6255  13c2 b702          	ld	_parametersSet$L+2,a
6256  13c4 3f01          	clr	_parametersSet$L+1
6257  13c6 a608          	ld	a,#8
6258  13c8 cd0000        	call	_parametersSet
6260                     ; 905 					break;
6262  13cb cc1c8f        	jp	L3732
6263  13ce               L5012:
6264                     ; 906 				case SCREEN_STD_MSG_CORRECTION_TRANS:
6264                     ; 907 					screenBigMessage("Correction trasversal", "(pas operationnel)");
6266  13ce ae7a          	ld	x,#high(L3572)
6267  13d0 bf02          	ld	_screenBigMessage$L+2,x
6268  13d2 a67a          	ld	a,#low(L3572)
6269  13d4 b703          	ld	_screenBigMessage$L+3,a
6270  13d6 a68d          	ld	a,#low(L1572)
6271  13d8 ae8d          	ld	x,#high(L1572)
6272  13da cd0211        	call	_screenBigMessage
6274                     ; 908 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
6276  13dd a602          	ld	a,#2
6277  13df b702          	ld	_parametersSet$L+2,a
6278  13e1 3f01          	clr	_parametersSet$L+1
6279  13e3 a608          	ld	a,#8
6280  13e5 cd0000        	call	_parametersSet
6282                     ; 909 					break;
6284  13e8 cc1c8f        	jp	L3732
6285  13eb               L7012:
6286                     ; 910 				case SCREEN_STD_MSG_OFFSET_DISTANCE:
6286                     ; 911 					screenBigMessage("Intervalle", "offset");
6288  13eb ae99          	ld	x,#high(L1262)
6289  13ed bf02          	ld	_screenBigMessage$L+2,x
6290  13ef a699          	ld	a,#low(L1262)
6291  13f1 b703          	ld	_screenBigMessage$L+3,a
6292  13f3 a66f          	ld	a,#low(L5572)
6293  13f5 ae6f          	ld	x,#high(L5572)
6294  13f7 cd0211        	call	_screenBigMessage
6296                     ; 912 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
6298  13fa a602          	ld	a,#2
6299  13fc b702          	ld	_parametersSet$L+2,a
6300  13fe 3f01          	clr	_parametersSet$L+1
6301  1400 a608          	ld	a,#8
6302  1402 cd0000        	call	_parametersSet
6304                     ; 913 					break;
6306  1405 cc1c8f        	jp	L3732
6307  1408               L1112:
6308                     ; 914 				case SCREEN_STD_MSG_PARAMETER_SAVED:
6308                     ; 915 					screenBigMessage("Parametre", "sauve");
6310  1408 ae69          	ld	x,#high(L7572)
6311  140a bf02          	ld	_screenBigMessage$L+2,x
6312  140c a669          	ld	a,#low(L7572)
6313  140e b703          	ld	_screenBigMessage$L+3,a
6314  1410 a674          	ld	a,#low(L7072)
6315  1412 ae74          	ld	x,#high(L7072)
6316  1414 cd0211        	call	_screenBigMessage
6318                     ; 916 					break;
6320  1417 cc1c8f        	jp	L3732
6321  141a               L3112:
6322                     ; 917 				case SCREEN_STD_MSG_CMD_DONE:
6322                     ; 918 					screenBigMessage("Commande execute", "correctement");
6324  141a ae67          	ld	x,#high(L1172)
6325  141c bf02          	ld	_screenBigMessage$L+2,x
6326  141e a667          	ld	a,#low(L1172)
6327  1420 b703          	ld	_screenBigMessage$L+3,a
6328  1422 a658          	ld	a,#low(L1672)
6329  1424 ae58          	ld	x,#high(L1672)
6330  1426 cd0211        	call	_screenBigMessage
6332                     ; 919 					break;
6334  1429 cc1c8f        	jp	L3732
6335  142c               L5112:
6336                     ; 920 				case SCREEN_STD_MSG_SW_VERSION:
6336                     ; 921 					screenBigMessage("Version SW", "");
6338  142c ae30          	ld	x,#high(L5152)
6339  142e bf02          	ld	_screenBigMessage$L+2,x
6340  1430 a630          	ld	a,#low(L5152)
6341  1432 b703          	ld	_screenBigMessage$L+3,a
6342  1434 a67c          	ld	a,#low(L7262)
6343  1436 ae7c          	ld	x,#high(L7262)
6344  1438 cd0211        	call	_screenBigMessage
6346                     ; 922 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
6348  143b a602          	ld	a,#2
6349  143d b702          	ld	_parametersSet$L+2,a
6350  143f 3f01          	clr	_parametersSet$L+1
6351  1441 a608          	ld	a,#8
6352  1443 cd0000        	call	_parametersSet
6354                     ; 923 					break;
6356  1446 cc1c8f        	jp	L3732
6357  1449               L7112:
6358                     ; 924 				case SCREEN_STD_MSG_UNKNOWN_CODE:
6358                     ; 925 					screenBigMessage("Code", "inconnu");
6360  1449 ae50          	ld	x,#high(L3672)
6361  144b bf02          	ld	_screenBigMessage$L+2,x
6362  144d a650          	ld	a,#low(L3672)
6363  144f b703          	ld	_screenBigMessage$L+3,a
6364  1451 a66d          	ld	a,#low(L3362)
6365  1453 ae6d          	ld	x,#high(L3362)
6366  1455 cd0211        	call	_screenBigMessage
6368                     ; 926 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
6370  1458 a602          	ld	a,#2
6371  145a b702          	ld	_parametersSet$L+2,a
6372  145c 3f01          	clr	_parametersSet$L+1
6373  145e a608          	ld	a,#8
6374  1460 cd0000        	call	_parametersSet
6376                     ; 927 					break;
6378  1463 cc1c8f        	jp	L3732
6379  1466               L1212:
6380                     ; 928 				case SCREEN_STD_MSG_UNKNOWN_ADDCODE:
6380                     ; 929 					screenBigMessage("Code additionnel", "inconnu");
6382  1466 ae50          	ld	x,#high(L3672)
6383  1468 bf02          	ld	_screenBigMessage$L+2,x
6384  146a a650          	ld	a,#low(L3672)
6385  146c b703          	ld	_screenBigMessage$L+3,a
6386  146e a63f          	ld	a,#low(L5672)
6387  1470 ae3f          	ld	x,#high(L5672)
6388  1472 cd0211        	call	_screenBigMessage
6390                     ; 930 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
6392  1475 a602          	ld	a,#2
6393  1477 b702          	ld	_parametersSet$L+2,a
6394  1479 3f01          	clr	_parametersSet$L+1
6395  147b a608          	ld	a,#8
6396  147d cd0000        	call	_parametersSet
6398                     ; 931 					break;
6400  1480 cc1c8f        	jp	L3732
6401  1483               L3212:
6402                     ; 932 				case SCREEN_STD_MSG_RESET_ERROR:
6402                     ; 933 					screenBigMessage("Effacement", "erreur");
6404  1483 ae2d          	ld	x,#high(L1772)
6405  1485 bf02          	ld	_screenBigMessage$L+2,x
6406  1487 a62d          	ld	a,#low(L1772)
6407  1489 b703          	ld	_screenBigMessage$L+3,a
6408  148b a634          	ld	a,#low(L7672)
6409  148d ae34          	ld	x,#high(L7672)
6410  148f cd0211        	call	_screenBigMessage
6412                     ; 934 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
6414  1492 a602          	ld	a,#2
6415  1494 b702          	ld	_parametersSet$L+2,a
6416  1496 3f01          	clr	_parametersSet$L+1
6417  1498 a608          	ld	a,#8
6418  149a cd0000        	call	_parametersSet
6420                     ; 935 					break;
6422  149d cc1c8f        	jp	L3732
6423  14a0               L5212:
6424                     ; 936 				case SCREEN_STD_MSG_PARAMETER_VALUE_NA:
6424                     ; 937 					screenBigMessage("Erreur: Valeur", "pas acceptable");
6426  14a0 ae0f          	ld	x,#high(L5772)
6427  14a2 bf02          	ld	_screenBigMessage$L+2,x
6428  14a4 a60f          	ld	a,#low(L5772)
6429  14a6 b703          	ld	_screenBigMessage$L+3,a
6430  14a8 a61e          	ld	a,#low(L3772)
6431  14aa ae1e          	ld	x,#high(L3772)
6432  14ac cd0211        	call	_screenBigMessage
6434                     ; 938 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
6436  14af a602          	ld	a,#2
6437  14b1 b702          	ld	_parametersSet$L+2,a
6438  14b3 3f01          	clr	_parametersSet$L+1
6439  14b5 a608          	ld	a,#8
6440  14b7 cd0000        	call	_parametersSet
6442                     ; 939 					break;
6444  14ba cc1c8f        	jp	L3732
6445  14bd               L7212:
6446                     ; 940 				case SCREEN_STD_MSG_WRONG_MEMORY_SLOT:
6446                     ; 941 					screenBigMessage("Erreur: Position", "pas disponible");
6448  14bd aeef          	ld	x,#high(L1003)
6449  14bf bf02          	ld	_screenBigMessage$L+2,x
6450  14c1 a6ef          	ld	a,#low(L1003)
6451  14c3 b703          	ld	_screenBigMessage$L+3,a
6452  14c5 a6fe          	ld	a,#low(L7772)
6453  14c7 aefe          	ld	x,#high(L7772)
6454  14c9 cd0211        	call	_screenBigMessage
6456                     ; 942 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
6458  14cc a602          	ld	a,#2
6459  14ce b702          	ld	_parametersSet$L+2,a
6460  14d0 3f01          	clr	_parametersSet$L+1
6461  14d2 a608          	ld	a,#8
6462  14d4 cd0000        	call	_parametersSet
6464                     ; 943 					break;
6466  14d7 cc1c8f        	jp	L3732
6467  14da               L1312:
6468                     ; 944 				default:
6468                     ; 945 					break;
6470  14da cc1c8f        	jp	L3732
6471  14dd               L5562:
6472                     ; 947 			break;			
6474  14dd cc1c8f        	jp	L3732
6475  14e0               L3312:
6476                     ; 948 		case PARAM_LANGUAGE_ES: //Spanish
6476                     ; 949 			switch(a_byStdMessage)
6478  14e0 b600          	ld	a,_screenBigStdMessage$L
6480                     ; 1085 				default:
6480                     ; 1086 					break;
6481  14e2 a12d          	cp	a,#45
6482  14e4 240b          	jruge	L251
6483  14e6 48            	sll	a
6484  14e7 97            	ld	x,a
6485  14e8 d60110        	ld	a,(L451+1,x)
6486  14eb 88            	push	a
6487  14ec d6010f        	ld	a,(L451,x)
6488  14ef 88            	push	a
6489  14f0 81            	ret
6490  14f1               L251:
6491  14f1 cc1c8f        	jp	L3732
6492  14f4               L5312:
6493                     ; 951 				case SCREEN_STD_MSG_INIT_PARAM:
6493                     ; 952 					screenBigMessage("Iniciacion", "parametros");
6495  14f4 aed9          	ld	x,#high(L1103)
6496  14f6 bf02          	ld	_screenBigMessage$L+2,x
6497  14f8 a6d9          	ld	a,#low(L1103)
6498  14fa b703          	ld	_screenBigMessage$L+3,a
6499  14fc a6e4          	ld	a,#low(L7003)
6500  14fe aee4          	ld	x,#high(L7003)
6501  1500 cd0211        	call	_screenBigMessage
6503                     ; 953 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
6505  1503 a602          	ld	a,#2
6506  1505 b702          	ld	_parametersSet$L+2,a
6507  1507 3f01          	clr	_parametersSet$L+1
6508  1509 a608          	ld	a,#8
6509  150b cd0000        	call	_parametersSet
6511                     ; 954 					break;
6513  150e cc1c8f        	jp	L3732
6514  1511               L7312:
6515                     ; 955 				case SCREEN_STD_MSG_PHASE_MAN:
6515                     ; 956 					screenBigMessage("Puesta en", "fase manual");
6517  1511 aec3          	ld	x,#high(L5103)
6518  1513 bf02          	ld	_screenBigMessage$L+2,x
6519  1515 a6c3          	ld	a,#low(L5103)
6520  1517 b703          	ld	_screenBigMessage$L+3,a
6521  1519 a6cf          	ld	a,#low(L3103)
6522  151b aecf          	ld	x,#high(L3103)
6523  151d cd0211        	call	_screenBigMessage
6525                     ; 957 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
6527  1520 a602          	ld	a,#2
6528  1522 b702          	ld	_parametersSet$L+2,a
6529  1524 3f01          	clr	_parametersSet$L+1
6530  1526 a608          	ld	a,#8
6531  1528 cd0000        	call	_parametersSet
6533                     ; 958 					break;
6535  152b cc1c8f        	jp	L3732
6536  152e               L1412:
6537                     ; 959 				case SCREEN_STD_MSG_PHASE_FAST:
6537                     ; 960 					screenBigMessage("Puesta en", "fase rapida");
6539  152e aeb7          	ld	x,#high(L7103)
6540  1530 bf02          	ld	_screenBigMessage$L+2,x
6541  1532 a6b7          	ld	a,#low(L7103)
6542  1534 b703          	ld	_screenBigMessage$L+3,a
6543  1536 a6cf          	ld	a,#low(L3103)
6544  1538 aecf          	ld	x,#high(L3103)
6545  153a cd0211        	call	_screenBigMessage
6547                     ; 961 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
6549  153d a602          	ld	a,#2
6550  153f b702          	ld	_parametersSet$L+2,a
6551  1541 3f01          	clr	_parametersSet$L+1
6552  1543 a608          	ld	a,#8
6553  1545 cd0000        	call	_parametersSet
6555                     ; 962 					break;
6557  1548 cc1c8f        	jp	L3732
6558  154b               L3412:
6559                     ; 963 				case SCREEN_STD_MSG_PHASE_OSCIL:
6559                     ; 964 					screenBigMessage("Puesta en", "fase osciloscopio");
6561  154b aea5          	ld	x,#high(L1203)
6562  154d bf02          	ld	_screenBigMessage$L+2,x
6563  154f a6a5          	ld	a,#low(L1203)
6564  1551 b703          	ld	_screenBigMessage$L+3,a
6565  1553 a6cf          	ld	a,#low(L3103)
6566  1555 aecf          	ld	x,#high(L3103)
6567  1557 cd0211        	call	_screenBigMessage
6569                     ; 965 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
6571  155a a602          	ld	a,#2
6572  155c b702          	ld	_parametersSet$L+2,a
6573  155e 3f01          	clr	_parametersSet$L+1
6574  1560 a608          	ld	a,#8
6575  1562 cd0000        	call	_parametersSet
6577                     ; 966 					break;
6579  1565 cc1c8f        	jp	L3732
6580  1568               L5412:
6581                     ; 967 				case SCREEN_STD_MSG_PHASE_AUTO:
6581                     ; 968 					screenBigMessage("Puesta en", "fase automatica");
6583  1568 ae95          	ld	x,#high(L3203)
6584  156a bf02          	ld	_screenBigMessage$L+2,x
6585  156c a695          	ld	a,#low(L3203)
6586  156e b703          	ld	_screenBigMessage$L+3,a
6587  1570 a6cf          	ld	a,#low(L3103)
6588  1572 aecf          	ld	x,#high(L3103)
6589  1574 cd0211        	call	_screenBigMessage
6591                     ; 969 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
6593  1577 a602          	ld	a,#2
6594  1579 b702          	ld	_parametersSet$L+2,a
6595  157b 3f01          	clr	_parametersSet$L+1
6596  157d a608          	ld	a,#8
6597  157f cd0000        	call	_parametersSet
6599                     ; 970 					break;
6601  1582 cc1c8f        	jp	L3732
6602  1585               L7412:
6603                     ; 971 				case SCREEN_STD_MSG_TEST_SH:
6603                     ; 972 					screenBigMessage("Test", "cabeza");
6605  1585 ae8e          	ld	x,#high(L5203)
6606  1587 bf02          	ld	_screenBigMessage$L+2,x
6607  1589 a68e          	ld	a,#low(L5203)
6608  158b b703          	ld	_screenBigMessage$L+3,a
6609  158d a62b          	ld	a,#low(L3342)
6610  158f ae2b          	ld	x,#high(L3342)
6611  1591 cd0211        	call	_screenBigMessage
6613                     ; 973 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
6615  1594 a602          	ld	a,#2
6616  1596 b702          	ld	_parametersSet$L+2,a
6617  1598 3f01          	clr	_parametersSet$L+1
6618  159a a608          	ld	a,#8
6619  159c cd0000        	call	_parametersSet
6621                     ; 974 					break;
6623  159f cc1c8f        	jp	L3732
6624  15a2               L1512:
6625                     ; 975 				case SCREEN_STD_MSG_TEST_ENC:
6625                     ; 976 					screenBigMessage("Test", "encoder");
6627  15a2 ae86          	ld	x,#high(L3072)
6628  15a4 bf02          	ld	_screenBigMessage$L+2,x
6629  15a6 a686          	ld	a,#low(L3072)
6630  15a8 b703          	ld	_screenBigMessage$L+3,a
6631  15aa a62b          	ld	a,#low(L3342)
6632  15ac ae2b          	ld	x,#high(L3342)
6633  15ae cd0211        	call	_screenBigMessage
6635                     ; 977 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
6637  15b1 a602          	ld	a,#2
6638  15b3 b702          	ld	_parametersSet$L+2,a
6639  15b5 3f01          	clr	_parametersSet$L+1
6640  15b7 a608          	ld	a,#8
6641  15b9 cd0000        	call	_parametersSet
6643                     ; 978 					break;
6645  15bc cc1c8f        	jp	L3732
6646  15bf               L3512:
6647                     ; 979 				case SCREEN_STD_MSG_TEST_OUTPUT:
6647                     ; 980 					screenBigMessage("Test", "salidas");
6649  15bf ae86          	ld	x,#high(L7203)
6650  15c1 bf02          	ld	_screenBigMessage$L+2,x
6651  15c3 a686          	ld	a,#low(L7203)
6652  15c5 b703          	ld	_screenBigMessage$L+3,a
6653  15c7 a62b          	ld	a,#low(L3342)
6654  15c9 ae2b          	ld	x,#high(L3342)
6655  15cb cd0211        	call	_screenBigMessage
6657                     ; 981 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
6659  15ce a602          	ld	a,#2
6660  15d0 b702          	ld	_parametersSet$L+2,a
6661  15d2 3f01          	clr	_parametersSet$L+1
6662  15d4 a608          	ld	a,#8
6663  15d6 cd0000        	call	_parametersSet
6665                     ; 982 					break;
6667  15d9 cc1c8f        	jp	L3732
6668  15dc               L5512:
6669                     ; 983 				case SCREEN_STD_MSG_TEST_4:
6669                     ; 984 					screenBigMessage("Test", "4");
6671  15dc ae29          	ld	x,#high(L5342)
6672  15de bf02          	ld	_screenBigMessage$L+2,x
6673  15e0 a629          	ld	a,#low(L5342)
6674  15e2 b703          	ld	_screenBigMessage$L+3,a
6675  15e4 a62b          	ld	a,#low(L3342)
6676  15e6 ae2b          	ld	x,#high(L3342)
6677  15e8 cd0211        	call	_screenBigMessage
6679                     ; 985 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
6681  15eb a602          	ld	a,#2
6682  15ed b702          	ld	_parametersSet$L+2,a
6683  15ef 3f01          	clr	_parametersSet$L+1
6684  15f1 a608          	ld	a,#8
6685  15f3 cd0000        	call	_parametersSet
6687                     ; 986 					break;
6689  15f6 cc1c8f        	jp	L3732
6690  15f9               L7512:
6691                     ; 987 				case SCREEN_STD_MSG_TEST_5:
6691                     ; 988 					screenBigMessage("Test", "5");
6693  15f9 ae27          	ld	x,#high(L7342)
6694  15fb bf02          	ld	_screenBigMessage$L+2,x
6695  15fd a627          	ld	a,#low(L7342)
6696  15ff b703          	ld	_screenBigMessage$L+3,a
6697  1601 a62b          	ld	a,#low(L3342)
6698  1603 ae2b          	ld	x,#high(L3342)
6699  1605 cd0211        	call	_screenBigMessage
6701                     ; 989 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
6703  1608 a602          	ld	a,#2
6704  160a b702          	ld	_parametersSet$L+2,a
6705  160c 3f01          	clr	_parametersSet$L+1
6706  160e a608          	ld	a,#8
6707  1610 cd0000        	call	_parametersSet
6709                     ; 990 					break;
6711  1613 cc1c8f        	jp	L3732
6712  1616               L1612:
6713                     ; 991 				case SCREEN_STD_MSG_TEST_6:
6713                     ; 992 					screenBigMessage("Test", "6");
6715  1616 ae25          	ld	x,#high(L1442)
6716  1618 bf02          	ld	_screenBigMessage$L+2,x
6717  161a a625          	ld	a,#low(L1442)
6718  161c b703          	ld	_screenBigMessage$L+3,a
6719  161e a62b          	ld	a,#low(L3342)
6720  1620 ae2b          	ld	x,#high(L3342)
6721  1622 cd0211        	call	_screenBigMessage
6723                     ; 993 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
6725  1625 a602          	ld	a,#2
6726  1627 b702          	ld	_parametersSet$L+2,a
6727  1629 3f01          	clr	_parametersSet$L+1
6728  162b a608          	ld	a,#8
6729  162d cd0000        	call	_parametersSet
6731                     ; 994 					break;
6733  1630 cc1c8f        	jp	L3732
6734  1633               L3612:
6735                     ; 995 				case SCREEN_STD_MSG_PARAM_5:
6735                     ; 996 					screenBigMessage("Parametro", "5");
6737  1633 ae27          	ld	x,#high(L7342)
6738  1635 bf02          	ld	_screenBigMessage$L+2,x
6739  1637 a627          	ld	a,#low(L7342)
6740  1639 b703          	ld	_screenBigMessage$L+3,a
6741  163b a67c          	ld	a,#low(L1303)
6742  163d ae7c          	ld	x,#high(L1303)
6743  163f cd0211        	call	_screenBigMessage
6745                     ; 997 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
6747  1642 a602          	ld	a,#2
6748  1644 b702          	ld	_parametersSet$L+2,a
6749  1646 3f01          	clr	_parametersSet$L+1
6750  1648 a608          	ld	a,#8
6751  164a cd0000        	call	_parametersSet
6753                     ; 998 					break;
6755  164d cc1c8f        	jp	L3732
6756  1650               L5612:
6757                     ; 999 				case SCREEN_STD_MSG_PARAM_6:
6757                     ; 1000 					screenBigMessage("Parametro", "6");
6759  1650 ae25          	ld	x,#high(L1442)
6760  1652 bf02          	ld	_screenBigMessage$L+2,x
6761  1654 a625          	ld	a,#low(L1442)
6762  1656 b703          	ld	_screenBigMessage$L+3,a
6763  1658 a67c          	ld	a,#low(L1303)
6764  165a ae7c          	ld	x,#high(L1303)
6765  165c cd0211        	call	_screenBigMessage
6767                     ; 1001 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
6769  165f a602          	ld	a,#2
6770  1661 b702          	ld	_parametersSet$L+2,a
6771  1663 3f01          	clr	_parametersSet$L+1
6772  1665 a608          	ld	a,#8
6773  1667 cd0000        	call	_parametersSet
6775                     ; 1002 					break;
6777  166a cc1c8f        	jp	L3732
6778  166d               L7612:
6779                     ; 1003 				case SCREEN_STD_MSG_PHASE_OK:
6779                     ; 1004 					screenBigMessage("Puesta en", "fase correcto");
6781  166d ae6e          	ld	x,#high(L3303)
6782  166f bf02          	ld	_screenBigMessage$L+2,x
6783  1671 a66e          	ld	a,#low(L3303)
6784  1673 b703          	ld	_screenBigMessage$L+3,a
6785  1675 a6cf          	ld	a,#low(L3103)
6786  1677 aecf          	ld	x,#high(L3103)
6787  1679 cd0211        	call	_screenBigMessage
6789                     ; 1005 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
6791  167c a602          	ld	a,#2
6792  167e b702          	ld	_parametersSet$L+2,a
6793  1680 3f01          	clr	_parametersSet$L+1
6794  1682 a608          	ld	a,#8
6795  1684 cd0000        	call	_parametersSet
6797                     ; 1006 					break;
6799  1687 cc1c8f        	jp	L3732
6800  168a               L1712:
6801                     ; 1007 				case SCREEN_STD_MSG_SPEED_ZERO:
6801                     ; 1008 					screenBigMessage("Error", "Maquina parada");
6803  168a ae5f          	ld	x,#high(L5303)
6804  168c bf02          	ld	_screenBigMessage$L+2,x
6805  168e a65f          	ld	a,#low(L5303)
6806  1690 b703          	ld	_screenBigMessage$L+3,a
6807  1692 a614          	ld	a,#low(L7442)
6808  1694 ae14          	ld	x,#high(L7442)
6809  1696 cd0211        	call	_screenBigMessage
6811                     ; 1009 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
6813  1699 a602          	ld	a,#2
6814  169b b702          	ld	_parametersSet$L+2,a
6815  169d 3f01          	clr	_parametersSet$L+1
6816  169f a608          	ld	a,#8
6817  16a1 cd0000        	call	_parametersSet
6819                     ; 1010 					break;
6821  16a4 cc1c8f        	jp	L3732
6822  16a7               L3712:
6823                     ; 1011 				case SCREEN_STD_MSG_SPEED_TOO_FAST:
6823                     ; 1012 					screenBigMessage("Error: Velocidad", "desmaciado elevada");
6825  16a7 ae3b          	ld	x,#high(L1403)
6826  16a9 bf02          	ld	_screenBigMessage$L+2,x
6827  16ab a63b          	ld	a,#low(L1403)
6828  16ad b703          	ld	_screenBigMessage$L+3,a
6829  16af a64e          	ld	a,#low(L7303)
6830  16b1 ae4e          	ld	x,#high(L7303)
6831  16b3 cd0211        	call	_screenBigMessage
6833                     ; 1013 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
6835  16b6 a602          	ld	a,#2
6836  16b8 b702          	ld	_parametersSet$L+2,a
6837  16ba 3f01          	clr	_parametersSet$L+1
6838  16bc a608          	ld	a,#8
6839  16be cd0000        	call	_parametersSet
6841                     ; 1014 					break;
6843  16c1 cc1c8f        	jp	L3732
6844  16c4               L5712:
6845                     ; 1015 				case SCREEN_STD_MSG_PHASE_MAN_ERR:
6845                     ; 1016 					screenBigMessage("Error : Puesta en fase", "maquina en marcha");
6847  16c4 ae12          	ld	x,#high(L5403)
6848  16c6 bf02          	ld	_screenBigMessage$L+2,x
6849  16c8 a612          	ld	a,#low(L5403)
6850  16ca b703          	ld	_screenBigMessage$L+3,a
6851  16cc a624          	ld	a,#low(L3403)
6852  16ce ae24          	ld	x,#high(L3403)
6853  16d0 cd0211        	call	_screenBigMessage
6855                     ; 1017 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
6857  16d3 a602          	ld	a,#2
6858  16d5 b702          	ld	_parametersSet$L+2,a
6859  16d7 3f01          	clr	_parametersSet$L+1
6860  16d9 a608          	ld	a,#8
6861  16db cd0000        	call	_parametersSet
6863                     ; 1018 					break;
6865  16de cc1c8f        	jp	L3732
6866  16e1               L7712:
6867                     ; 1019 				case SCREEN_STD_MSG_ERR_TEST_OUTPUT:
6867                     ; 1020 					screenBigMessage("Error test", "Maquina en marcha");
6869  16e1 aef5          	ld	x,#high(L1503)
6870  16e3 bf02          	ld	_screenBigMessage$L+2,x
6871  16e5 a6f5          	ld	a,#low(L1503)
6872  16e7 b703          	ld	_screenBigMessage$L+3,a
6873  16e9 a607          	ld	a,#low(L7403)
6874  16eb ae07          	ld	x,#high(L7403)
6875  16ed cd0211        	call	_screenBigMessage
6877                     ; 1021 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
6879  16f0 a602          	ld	a,#2
6880  16f2 b702          	ld	_parametersSet$L+2,a
6881  16f4 3f01          	clr	_parametersSet$L+1
6882  16f6 a608          	ld	a,#8
6883  16f8 cd0000        	call	_parametersSet
6885                     ; 1022 					break;
6887  16fb cc1c8f        	jp	L3732
6888  16fe               L1022:
6889                     ; 1023 				case SCREEN_STD_MSG_PHASE_AUTO_ERR:
6889                     ; 1024 					screenBigMessage("Error puesta en", "fase automatica");
6891  16fe ae95          	ld	x,#high(L3203)
6892  1700 bf02          	ld	_screenBigMessage$L+2,x
6893  1702 a695          	ld	a,#low(L3203)
6894  1704 b703          	ld	_screenBigMessage$L+3,a
6895  1706 a6e5          	ld	a,#low(L3503)
6896  1708 aee5          	ld	x,#high(L3503)
6897  170a cd0211        	call	_screenBigMessage
6899                     ; 1025 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
6901  170d a602          	ld	a,#2
6902  170f b702          	ld	_parametersSet$L+2,a
6903  1711 3f01          	clr	_parametersSet$L+1
6904  1713 a608          	ld	a,#8
6905  1715 cd0000        	call	_parametersSet
6907                     ; 1026 					break;
6909  1718 cc1c8f        	jp	L3732
6910  171b               L3022:
6911                     ; 1027 				case SCREEN_STD_MSG_PHASE_DOUBLE_MARK:
6911                     ; 1028 					screenBigMessage("Error", "marca doble");
6913  171b aed9          	ld	x,#high(L5503)
6914  171d bf02          	ld	_screenBigMessage$L+2,x
6915  171f a6d9          	ld	a,#low(L5503)
6916  1721 b703          	ld	_screenBigMessage$L+3,a
6917  1723 a614          	ld	a,#low(L7442)
6918  1725 ae14          	ld	x,#high(L7442)
6919  1727 cd0211        	call	_screenBigMessage
6921                     ; 1029 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
6923  172a a602          	ld	a,#2
6924  172c b702          	ld	_parametersSet$L+2,a
6925  172e 3f01          	clr	_parametersSet$L+1
6926  1730 a608          	ld	a,#8
6927  1732 cd0000        	call	_parametersSet
6929                     ; 1030 					break;
6931  1735 cc1c8f        	jp	L3732
6932  1738               L5022:
6933                     ; 1031 				case SCREEN_STD_MSG_TEST_OK:
6933                     ; 1032 					screenBigMessage("Test", "OK");
6935  1738 aec8          	ld	x,#high(L1472)
6936  173a bf02          	ld	_screenBigMessage$L+2,x
6937  173c a6c8          	ld	a,#low(L1472)
6938  173e b703          	ld	_screenBigMessage$L+3,a
6939  1740 a62b          	ld	a,#low(L3342)
6940  1742 ae2b          	ld	x,#high(L3342)
6941  1744 cd0211        	call	_screenBigMessage
6943                     ; 1033 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
6945  1747 a602          	ld	a,#2
6946  1749 b702          	ld	_parametersSet$L+2,a
6947  174b 3f01          	clr	_parametersSet$L+1
6948  174d a608          	ld	a,#8
6949  174f cd0000        	call	_parametersSet
6951                     ; 1034 					break;
6953  1752 cc1c8f        	jp	L3732
6954  1755               L7022:
6955                     ; 1035 				case SCREEN_STD_MSG_TEST_SH_ERR:
6955                     ; 1036 					screenBigMessage("Error", "test cabeza");
6957  1755 aecd          	ld	x,#high(L7503)
6958  1757 bf02          	ld	_screenBigMessage$L+2,x
6959  1759 a6cd          	ld	a,#low(L7503)
6960  175b b703          	ld	_screenBigMessage$L+3,a
6961  175d a614          	ld	a,#low(L7442)
6962  175f ae14          	ld	x,#high(L7442)
6963  1761 cd0211        	call	_screenBigMessage
6965                     ; 1037 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
6967  1764 a602          	ld	a,#2
6968  1766 b702          	ld	_parametersSet$L+2,a
6969  1768 3f01          	clr	_parametersSet$L+1
6970  176a a608          	ld	a,#8
6971  176c cd0000        	call	_parametersSet
6973                     ; 1038 					break;
6975  176f cc1c8f        	jp	L3732
6976  1772               L1122:
6977                     ; 1039 				case SCREEN_STD_MSG_TEST_ENC_ERR:
6977                     ; 1040 					screenBigMessage("Error", "test encoder");
6979  1772 aeb1          	ld	x,#high(L5472)
6980  1774 bf02          	ld	_screenBigMessage$L+2,x
6981  1776 a6b1          	ld	a,#low(L5472)
6982  1778 b703          	ld	_screenBigMessage$L+3,a
6983  177a a614          	ld	a,#low(L7442)
6984  177c ae14          	ld	x,#high(L7442)
6985  177e cd0211        	call	_screenBigMessage
6987                     ; 1041 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
6989  1781 a602          	ld	a,#2
6990  1783 b702          	ld	_parametersSet$L+2,a
6991  1785 3f01          	clr	_parametersSet$L+1
6992  1787 a608          	ld	a,#8
6993  1789 cd0000        	call	_parametersSet
6995                     ; 1042 					break;
6997  178c cc1c8f        	jp	L3732
6998  178f               L3122:
6999                     ; 1043 				case SCREEN_STD_MSG_VISUAL_OSCILLOSCOPE:
6999                     ; 1044 					screenBigMessage("Visualizacion", "osciloscopio");
7001  178f aeb2          	ld	x,#high(L3603)
7002  1791 bf02          	ld	_screenBigMessage$L+2,x
7003  1793 a6b2          	ld	a,#low(L3603)
7004  1795 b703          	ld	_screenBigMessage$L+3,a
7005  1797 a6bf          	ld	a,#low(L1603)
7006  1799 aebf          	ld	x,#high(L1603)
7007  179b cd0211        	call	_screenBigMessage
7009                     ; 1045 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
7011  179e a602          	ld	a,#2
7012  17a0 b702          	ld	_parametersSet$L+2,a
7013  17a2 3f01          	clr	_parametersSet$L+1
7014  17a4 a608          	ld	a,#8
7015  17a6 cd0000        	call	_parametersSet
7017                     ; 1046 					break;
7019  17a9 cc1c8f        	jp	L3732
7020  17ac               L5122:
7021                     ; 1047 				case SCREEN_STD_MSG_CORRECTION_TRANS:
7021                     ; 1048 					screenBigMessage("Correcion transversal", "(non operativa)");
7023  17ac ae8c          	ld	x,#high(L7603)
7024  17ae bf02          	ld	_screenBigMessage$L+2,x
7025  17b0 a68c          	ld	a,#low(L7603)
7026  17b2 b703          	ld	_screenBigMessage$L+3,a
7027  17b4 a69c          	ld	a,#low(L5603)
7028  17b6 ae9c          	ld	x,#high(L5603)
7029  17b8 cd0211        	call	_screenBigMessage
7031                     ; 1049 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
7033  17bb a602          	ld	a,#2
7034  17bd b702          	ld	_parametersSet$L+2,a
7035  17bf 3f01          	clr	_parametersSet$L+1
7036  17c1 a608          	ld	a,#8
7037  17c3 cd0000        	call	_parametersSet
7039                     ; 1050 					break;
7041  17c6 cc1c8f        	jp	L3732
7042  17c9               L7122:
7043                     ; 1051 				case SCREEN_STD_MSG_OFFSET_DISTANCE:
7043                     ; 1052 					screenBigMessage("Intervalo", "offset");
7045  17c9 ae99          	ld	x,#high(L1262)
7046  17cb bf02          	ld	_screenBigMessage$L+2,x
7047  17cd a699          	ld	a,#low(L1262)
7048  17cf b703          	ld	_screenBigMessage$L+3,a
7049  17d1 a682          	ld	a,#low(L1703)
7050  17d3 ae82          	ld	x,#high(L1703)
7051  17d5 cd0211        	call	_screenBigMessage
7053                     ; 1053 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
7055  17d8 a602          	ld	a,#2
7056  17da b702          	ld	_parametersSet$L+2,a
7057  17dc 3f01          	clr	_parametersSet$L+1
7058  17de a608          	ld	a,#8
7059  17e0 cd0000        	call	_parametersSet
7061                     ; 1054 					break;
7063  17e3 cc1c8f        	jp	L3732
7064  17e6               L1222:
7065                     ; 1055 				case SCREEN_STD_MSG_PARAMETER_SAVED:
7065                     ; 1056 					screenBigMessage("Parametro", "salvado");
7067  17e6 ae7a          	ld	x,#high(L3703)
7068  17e8 bf02          	ld	_screenBigMessage$L+2,x
7069  17ea a67a          	ld	a,#low(L3703)
7070  17ec b703          	ld	_screenBigMessage$L+3,a
7071  17ee a67c          	ld	a,#low(L1303)
7072  17f0 ae7c          	ld	x,#high(L1303)
7073  17f2 cd0211        	call	_screenBigMessage
7075                     ; 1057 					break;
7077  17f5 cc1c8f        	jp	L3732
7078  17f8               L3222:
7079                     ; 1058 				case SCREEN_STD_MSG_CMD_DONE:
7079                     ; 1059 					screenBigMessage("Comando", "ejecutado bien");
7081  17f8 ae63          	ld	x,#high(L7703)
7082  17fa bf02          	ld	_screenBigMessage$L+2,x
7083  17fc a663          	ld	a,#low(L7703)
7084  17fe b703          	ld	_screenBigMessage$L+3,a
7085  1800 a672          	ld	a,#low(L5703)
7086  1802 ae72          	ld	x,#high(L5703)
7087  1804 cd0211        	call	_screenBigMessage
7089                     ; 1060 					break;
7091  1807 cc1c8f        	jp	L3732
7092  180a               L5222:
7093                     ; 1061 				case SCREEN_STD_MSG_SW_VERSION:
7093                     ; 1062 					screenBigMessage("Version", "SW");
7095  180a ae58          	ld	x,#high(L3013)
7096  180c bf02          	ld	_screenBigMessage$L+2,x
7097  180e a658          	ld	a,#low(L3013)
7098  1810 b703          	ld	_screenBigMessage$L+3,a
7099  1812 a65b          	ld	a,#low(L1013)
7100  1814 ae5b          	ld	x,#high(L1013)
7101  1816 cd0211        	call	_screenBigMessage
7103                     ; 1063 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
7105  1819 a602          	ld	a,#2
7106  181b b702          	ld	_parametersSet$L+2,a
7107  181d 3f01          	clr	_parametersSet$L+1
7108  181f a608          	ld	a,#8
7109  1821 cd0000        	call	_parametersSet
7111                     ; 1064 					break;
7113  1824 cc1c8f        	jp	L3732
7114  1827               L7222:
7115                     ; 1065 				case SCREEN_STD_MSG_UNKNOWN_CODE:
7115                     ; 1066 					screenBigMessage("Code", "desconocido");
7117  1827 ae4c          	ld	x,#high(L5013)
7118  1829 bf02          	ld	_screenBigMessage$L+2,x
7119  182b a64c          	ld	a,#low(L5013)
7120  182d b703          	ld	_screenBigMessage$L+3,a
7121  182f a66d          	ld	a,#low(L3362)
7122  1831 ae6d          	ld	x,#high(L3362)
7123  1833 cd0211        	call	_screenBigMessage
7125                     ; 1067 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
7127  1836 a602          	ld	a,#2
7128  1838 b702          	ld	_parametersSet$L+2,a
7129  183a 3f01          	clr	_parametersSet$L+1
7130  183c a608          	ld	a,#8
7131  183e cd0000        	call	_parametersSet
7133                     ; 1068 					break;
7135  1841 cc1c8f        	jp	L3732
7136  1844               L1322:
7137                     ; 1069 				case SCREEN_STD_MSG_UNKNOWN_ADDCODE:
7137                     ; 1070 					screenBigMessage("Adicional", "code desconocido");
7139  1844 ae31          	ld	x,#high(L1113)
7140  1846 bf02          	ld	_screenBigMessage$L+2,x
7141  1848 a631          	ld	a,#low(L1113)
7142  184a b703          	ld	_screenBigMessage$L+3,a
7143  184c a642          	ld	a,#low(L7013)
7144  184e ae42          	ld	x,#high(L7013)
7145  1850 cd0211        	call	_screenBigMessage
7147                     ; 1071 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
7149  1853 a602          	ld	a,#2
7150  1855 b702          	ld	_parametersSet$L+2,a
7151  1857 3f01          	clr	_parametersSet$L+1
7152  1859 a608          	ld	a,#8
7153  185b cd0000        	call	_parametersSet
7155                     ; 1072 					break;
7157  185e cc1c8f        	jp	L3732
7158  1861               L3322:
7159                     ; 1073 				case SCREEN_STD_MSG_RESET_ERROR:
7159                     ; 1074 					screenBigMessage("Anulacion", "error");
7161  1861 ae21          	ld	x,#high(L5113)
7162  1863 bf02          	ld	_screenBigMessage$L+2,x
7163  1865 a621          	ld	a,#low(L5113)
7164  1867 b703          	ld	_screenBigMessage$L+3,a
7165  1869 a627          	ld	a,#low(L3113)
7166  186b ae27          	ld	x,#high(L3113)
7167  186d cd0211        	call	_screenBigMessage
7169                     ; 1075 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
7171  1870 a602          	ld	a,#2
7172  1872 b702          	ld	_parametersSet$L+2,a
7173  1874 3f01          	clr	_parametersSet$L+1
7174  1876 a608          	ld	a,#8
7175  1878 cd0000        	call	_parametersSet
7177                     ; 1076 					break;
7179  187b cc1c8f        	jp	L3732
7180  187e               L5322:
7181                     ; 1077 				case SCREEN_STD_MSG_PARAMETER_VALUE_NA:
7181                     ; 1078 					screenBigMessage("Error: valor", "no aceptable");
7183  187e ae07          	ld	x,#high(L1213)
7184  1880 bf02          	ld	_screenBigMessage$L+2,x
7185  1882 a607          	ld	a,#low(L1213)
7186  1884 b703          	ld	_screenBigMessage$L+3,a
7187  1886 a614          	ld	a,#low(L7113)
7188  1888 ae14          	ld	x,#high(L7113)
7189  188a cd0211        	call	_screenBigMessage
7191                     ; 1079 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
7193  188d a602          	ld	a,#2
7194  188f b702          	ld	_parametersSet$L+2,a
7195  1891 3f01          	clr	_parametersSet$L+1
7196  1893 a608          	ld	a,#8
7197  1895 cd0000        	call	_parametersSet
7199                     ; 1080 					break;
7201  1898 cc1c8f        	jp	L3732
7202  189b               L7322:
7203                     ; 1081 				case SCREEN_STD_MSG_WRONG_MEMORY_SLOT:
7203                     ; 1082 					screenBigMessage("Error: posicion", "no disponible");
7205  189b aee9          	ld	x,#high(L5213)
7206  189d bf02          	ld	_screenBigMessage$L+2,x
7207  189f a6e9          	ld	a,#low(L5213)
7208  18a1 b703          	ld	_screenBigMessage$L+3,a
7209  18a3 a6f7          	ld	a,#low(L3213)
7210  18a5 aef7          	ld	x,#high(L3213)
7211  18a7 cd0211        	call	_screenBigMessage
7213                     ; 1083 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
7215  18aa a602          	ld	a,#2
7216  18ac b702          	ld	_parametersSet$L+2,a
7217  18ae 3f01          	clr	_parametersSet$L+1
7218  18b0 a608          	ld	a,#8
7219  18b2 cd0000        	call	_parametersSet
7221                     ; 1084 					break;
7223  18b5 cc1c8f        	jp	L3732
7224  18b8               L1422:
7225                     ; 1085 				default:
7225                     ; 1086 					break;
7227  18b8 cc1c8f        	jp	L3732
7228  18bb               L5003:
7229                     ; 1088 			break;			
7231  18bb cc1c8f        	jp	L3732
7232  18be               L3422:
7233                     ; 1089 		default:  	//PARAM_LANGUAGE_IT - Italian
7233                     ; 1090 			switch(a_byStdMessage)
7235  18be b600          	ld	a,_screenBigStdMessage$L
7237                     ; 1226 				default:
7237                     ; 1227 					break;
7238  18c0 a12d          	cp	a,#45
7239  18c2 240b          	jruge	L651
7240  18c4 48            	sll	a
7241  18c5 97            	ld	x,a
7242  18c6 d6016a        	ld	a,(L061+1,x)
7243  18c9 88            	push	a
7244  18ca d60169        	ld	a,(L061,x)
7245  18cd 88            	push	a
7246  18ce 81            	ret
7247  18cf               L651:
7248  18cf cc1c8f        	jp	L3732
7249  18d2               L5422:
7250                     ; 1092 				case SCREEN_STD_MSG_INIT_PARAM:
7250                     ; 1093 					screenBigMessage("Inizializzazione", "parametri");
7252  18d2 aece          	ld	x,#high(L5313)
7253  18d4 bf02          	ld	_screenBigMessage$L+2,x
7254  18d6 a6ce          	ld	a,#low(L5313)
7255  18d8 b703          	ld	_screenBigMessage$L+3,a
7256  18da a6d8          	ld	a,#low(L3313)
7257  18dc aed8          	ld	x,#high(L3313)
7258  18de cd0211        	call	_screenBigMessage
7260                     ; 1094 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
7262  18e1 a602          	ld	a,#2
7263  18e3 b702          	ld	_parametersSet$L+2,a
7264  18e5 3f01          	clr	_parametersSet$L+1
7265  18e7 a608          	ld	a,#8
7266  18e9 cd0000        	call	_parametersSet
7268                     ; 1095 					break;
7270  18ec cc1c8f        	jp	L3732
7271  18ef               L7422:
7272                     ; 1096 				case SCREEN_STD_MSG_PHASE_MAN:
7272                     ; 1097 					screenBigMessage("Fasatura", "manuale");
7274  18ef aebd          	ld	x,#high(L1413)
7275  18f1 bf02          	ld	_screenBigMessage$L+2,x
7276  18f3 a6bd          	ld	a,#low(L1413)
7277  18f5 b703          	ld	_screenBigMessage$L+3,a
7278  18f7 a6c5          	ld	a,#low(L7313)
7279  18f9 aec5          	ld	x,#high(L7313)
7280  18fb cd0211        	call	_screenBigMessage
7282                     ; 1098 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
7284  18fe a602          	ld	a,#2
7285  1900 b702          	ld	_parametersSet$L+2,a
7286  1902 3f01          	clr	_parametersSet$L+1
7287  1904 a608          	ld	a,#8
7288  1906 cd0000        	call	_parametersSet
7290                     ; 1099 					break;
7292  1909 cc1c8f        	jp	L3732
7293  190c               L1522:
7294                     ; 1100 				case SCREEN_STD_MSG_PHASE_FAST:
7294                     ; 1101 					screenBigMessage("Fasatura a", "correzione rapida");
7296  190c aea0          	ld	x,#high(L5413)
7297  190e bf02          	ld	_screenBigMessage$L+2,x
7298  1910 a6a0          	ld	a,#low(L5413)
7299  1912 b703          	ld	_screenBigMessage$L+3,a
7300  1914 a6b2          	ld	a,#low(L3413)
7301  1916 aeb2          	ld	x,#high(L3413)
7302  1918 cd0211        	call	_screenBigMessage
7304                     ; 1102 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
7306  191b a602          	ld	a,#2
7307  191d b702          	ld	_parametersSet$L+2,a
7308  191f 3f01          	clr	_parametersSet$L+1
7309  1921 a608          	ld	a,#8
7310  1923 cd0000        	call	_parametersSet
7312                     ; 1103 					break;
7314  1926 cc1c8f        	jp	L3732
7315  1929               L3522:
7316                     ; 1104 				case SCREEN_STD_MSG_PHASE_OSCIL:
7316                     ; 1105 					screenBigMessage("Fasatura", "ad oscilloscopio");
7318  1929 ae8f          	ld	x,#high(L7413)
7319  192b bf02          	ld	_screenBigMessage$L+2,x
7320  192d a68f          	ld	a,#low(L7413)
7321  192f b703          	ld	_screenBigMessage$L+3,a
7322  1931 a6c5          	ld	a,#low(L7313)
7323  1933 aec5          	ld	x,#high(L7313)
7324  1935 cd0211        	call	_screenBigMessage
7326                     ; 1106 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
7328  1938 a602          	ld	a,#2
7329  193a b702          	ld	_parametersSet$L+2,a
7330  193c 3f01          	clr	_parametersSet$L+1
7331  193e a608          	ld	a,#8
7332  1940 cd0000        	call	_parametersSet
7334                     ; 1107 					break;
7336  1943 cc1c8f        	jp	L3732
7337  1946               L5522:
7338                     ; 1108 				case SCREEN_STD_MSG_PHASE_AUTO:
7338                     ; 1109 					screenBigMessage("Fasatura", "automatica");
7340  1946 ae84          	ld	x,#high(L1513)
7341  1948 bf02          	ld	_screenBigMessage$L+2,x
7342  194a a684          	ld	a,#low(L1513)
7343  194c b703          	ld	_screenBigMessage$L+3,a
7344  194e a6c5          	ld	a,#low(L7313)
7345  1950 aec5          	ld	x,#high(L7313)
7346  1952 cd0211        	call	_screenBigMessage
7348                     ; 1110 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
7350  1955 a602          	ld	a,#2
7351  1957 b702          	ld	_parametersSet$L+2,a
7352  1959 3f01          	clr	_parametersSet$L+1
7353  195b a608          	ld	a,#8
7354  195d cd0000        	call	_parametersSet
7356                     ; 1111 					break;
7358  1960 cc1c8f        	jp	L3732
7359  1963               L7522:
7360                     ; 1112 				case SCREEN_STD_MSG_TEST_SH:
7360                     ; 1113 					screenBigMessage("Test", "testina");
7362  1963 ae7c          	ld	x,#high(L3513)
7363  1965 bf02          	ld	_screenBigMessage$L+2,x
7364  1967 a67c          	ld	a,#low(L3513)
7365  1969 b703          	ld	_screenBigMessage$L+3,a
7366  196b a62b          	ld	a,#low(L3342)
7367  196d ae2b          	ld	x,#high(L3342)
7368  196f cd0211        	call	_screenBigMessage
7370                     ; 1114 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
7372  1972 a602          	ld	a,#2
7373  1974 b702          	ld	_parametersSet$L+2,a
7374  1976 3f01          	clr	_parametersSet$L+1
7375  1978 a608          	ld	a,#8
7376  197a cd0000        	call	_parametersSet
7378                     ; 1115 					break;
7380  197d cc1c8f        	jp	L3732
7381  1980               L1622:
7382                     ; 1116 				case SCREEN_STD_MSG_TEST_ENC:
7382                     ; 1117 					screenBigMessage("Test", "encoder");
7384  1980 ae86          	ld	x,#high(L3072)
7385  1982 bf02          	ld	_screenBigMessage$L+2,x
7386  1984 a686          	ld	a,#low(L3072)
7387  1986 b703          	ld	_screenBigMessage$L+3,a
7388  1988 a62b          	ld	a,#low(L3342)
7389  198a ae2b          	ld	x,#high(L3342)
7390  198c cd0211        	call	_screenBigMessage
7392                     ; 1118 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
7394  198f a602          	ld	a,#2
7395  1991 b702          	ld	_parametersSet$L+2,a
7396  1993 3f01          	clr	_parametersSet$L+1
7397  1995 a608          	ld	a,#8
7398  1997 cd0000        	call	_parametersSet
7400                     ; 1119 					break;
7402  199a cc1c8f        	jp	L3732
7403  199d               L3622:
7404                     ; 1120 				case SCREEN_STD_MSG_TEST_OUTPUT:
7404                     ; 1121 					screenBigMessage("Test", "uscite");
7406  199d ae75          	ld	x,#high(L5513)
7407  199f bf02          	ld	_screenBigMessage$L+2,x
7408  19a1 a675          	ld	a,#low(L5513)
7409  19a3 b703          	ld	_screenBigMessage$L+3,a
7410  19a5 a62b          	ld	a,#low(L3342)
7411  19a7 ae2b          	ld	x,#high(L3342)
7412  19a9 cd0211        	call	_screenBigMessage
7414                     ; 1122 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
7416  19ac a602          	ld	a,#2
7417  19ae b702          	ld	_parametersSet$L+2,a
7418  19b0 3f01          	clr	_parametersSet$L+1
7419  19b2 a608          	ld	a,#8
7420  19b4 cd0000        	call	_parametersSet
7422                     ; 1123 					break;
7424  19b7 cc1c8f        	jp	L3732
7425  19ba               L5622:
7426                     ; 1124 				case SCREEN_STD_MSG_TEST_4:
7426                     ; 1125 					screenBigMessage("Test", "4");
7428  19ba ae29          	ld	x,#high(L5342)
7429  19bc bf02          	ld	_screenBigMessage$L+2,x
7430  19be a629          	ld	a,#low(L5342)
7431  19c0 b703          	ld	_screenBigMessage$L+3,a
7432  19c2 a62b          	ld	a,#low(L3342)
7433  19c4 ae2b          	ld	x,#high(L3342)
7434  19c6 cd0211        	call	_screenBigMessage
7436                     ; 1126 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
7438  19c9 a602          	ld	a,#2
7439  19cb b702          	ld	_parametersSet$L+2,a
7440  19cd 3f01          	clr	_parametersSet$L+1
7441  19cf a608          	ld	a,#8
7442  19d1 cd0000        	call	_parametersSet
7444                     ; 1127 					break;
7446  19d4 cc1c8f        	jp	L3732
7447  19d7               L7622:
7448                     ; 1128 				case SCREEN_STD_MSG_TEST_5:
7448                     ; 1129 					screenBigMessage("Test", "5");
7450  19d7 ae27          	ld	x,#high(L7342)
7451  19d9 bf02          	ld	_screenBigMessage$L+2,x
7452  19db a627          	ld	a,#low(L7342)
7453  19dd b703          	ld	_screenBigMessage$L+3,a
7454  19df a62b          	ld	a,#low(L3342)
7455  19e1 ae2b          	ld	x,#high(L3342)
7456  19e3 cd0211        	call	_screenBigMessage
7458                     ; 1130 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
7460  19e6 a602          	ld	a,#2
7461  19e8 b702          	ld	_parametersSet$L+2,a
7462  19ea 3f01          	clr	_parametersSet$L+1
7463  19ec a608          	ld	a,#8
7464  19ee cd0000        	call	_parametersSet
7466                     ; 1131 					break;
7468  19f1 cc1c8f        	jp	L3732
7469  19f4               L1722:
7470                     ; 1132 				case SCREEN_STD_MSG_TEST_6:
7470                     ; 1133 					screenBigMessage("Test", "6");
7472  19f4 ae25          	ld	x,#high(L1442)
7473  19f6 bf02          	ld	_screenBigMessage$L+2,x
7474  19f8 a625          	ld	a,#low(L1442)
7475  19fa b703          	ld	_screenBigMessage$L+3,a
7476  19fc a62b          	ld	a,#low(L3342)
7477  19fe ae2b          	ld	x,#high(L3342)
7478  1a00 cd0211        	call	_screenBigMessage
7480                     ; 1134 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
7482  1a03 a602          	ld	a,#2
7483  1a05 b702          	ld	_parametersSet$L+2,a
7484  1a07 3f01          	clr	_parametersSet$L+1
7485  1a09 a608          	ld	a,#8
7486  1a0b cd0000        	call	_parametersSet
7488                     ; 1135 					break;
7490  1a0e cc1c8f        	jp	L3732
7491  1a11               L3722:
7492                     ; 1136 				case SCREEN_STD_MSG_PARAM_5:
7492                     ; 1137 					screenBigMessage("Parametro", "5");
7494  1a11 ae27          	ld	x,#high(L7342)
7495  1a13 bf02          	ld	_screenBigMessage$L+2,x
7496  1a15 a627          	ld	a,#low(L7342)
7497  1a17 b703          	ld	_screenBigMessage$L+3,a
7498  1a19 a67c          	ld	a,#low(L1303)
7499  1a1b ae7c          	ld	x,#high(L1303)
7500  1a1d cd0211        	call	_screenBigMessage
7502                     ; 1138 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
7504  1a20 a602          	ld	a,#2
7505  1a22 b702          	ld	_parametersSet$L+2,a
7506  1a24 3f01          	clr	_parametersSet$L+1
7507  1a26 a608          	ld	a,#8
7508  1a28 cd0000        	call	_parametersSet
7510                     ; 1139 					break;
7512  1a2b cc1c8f        	jp	L3732
7513  1a2e               L5722:
7514                     ; 1140 				case SCREEN_STD_MSG_PARAM_6:
7514                     ; 1141 					screenBigMessage("Parametro", "6");
7516  1a2e ae25          	ld	x,#high(L1442)
7517  1a30 bf02          	ld	_screenBigMessage$L+2,x
7518  1a32 a625          	ld	a,#low(L1442)
7519  1a34 b703          	ld	_screenBigMessage$L+3,a
7520  1a36 a67c          	ld	a,#low(L1303)
7521  1a38 ae7c          	ld	x,#high(L1303)
7522  1a3a cd0211        	call	_screenBigMessage
7524                     ; 1142 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
7526  1a3d a602          	ld	a,#2
7527  1a3f b702          	ld	_parametersSet$L+2,a
7528  1a41 3f01          	clr	_parametersSet$L+1
7529  1a43 a608          	ld	a,#8
7530  1a45 cd0000        	call	_parametersSet
7532                     ; 1143 					break;
7534  1a48 cc1c8f        	jp	L3732
7535  1a4b               L7722:
7536                     ; 1144 				case SCREEN_STD_MSG_PHASE_OK:
7536                     ; 1145 					screenBigMessage("Fasatura eseguita", "correttamente");
7538  1a4b ae55          	ld	x,#high(L1613)
7539  1a4d bf02          	ld	_screenBigMessage$L+2,x
7540  1a4f a655          	ld	a,#low(L1613)
7541  1a51 b703          	ld	_screenBigMessage$L+3,a
7542  1a53 a663          	ld	a,#low(L7513)
7543  1a55 ae63          	ld	x,#high(L7513)
7544  1a57 cd0211        	call	_screenBigMessage
7546                     ; 1146 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
7548  1a5a a602          	ld	a,#2
7549  1a5c b702          	ld	_parametersSet$L+2,a
7550  1a5e 3f01          	clr	_parametersSet$L+1
7551  1a60 a608          	ld	a,#8
7552  1a62 cd0000        	call	_parametersSet
7554                     ; 1147 					break;
7556  1a65 cc1c8f        	jp	L3732
7557  1a68               L1032:
7558                     ; 1148 				case SCREEN_STD_MSG_SPEED_ZERO:
7558                     ; 1149 					screenBigMessage("Errore", "Macchina ferma");				
7560  1a68 ae3f          	ld	x,#high(L5613)
7561  1a6a bf02          	ld	_screenBigMessage$L+2,x
7562  1a6c a63f          	ld	a,#low(L5613)
7563  1a6e b703          	ld	_screenBigMessage$L+3,a
7564  1a70 a64e          	ld	a,#low(L3613)
7565  1a72 ae4e          	ld	x,#high(L3613)
7566  1a74 cd0211        	call	_screenBigMessage
7568                     ; 1150 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
7570  1a77 a602          	ld	a,#2
7571  1a79 b702          	ld	_parametersSet$L+2,a
7572  1a7b 3f01          	clr	_parametersSet$L+1
7573  1a7d a608          	ld	a,#8
7574  1a7f cd0000        	call	_parametersSet
7576                     ; 1151 					break;
7578  1a82 cc1c8f        	jp	L3732
7579  1a85               L3032:
7580                     ; 1152 				case SCREEN_STD_MSG_SPEED_TOO_FAST:
7580                     ; 1153 					screenBigMessage("Errore: Velocita'", "troppo elevata ");				
7582  1a85 ae1d          	ld	x,#high(L1713)
7583  1a87 bf02          	ld	_screenBigMessage$L+2,x
7584  1a89 a61d          	ld	a,#low(L1713)
7585  1a8b b703          	ld	_screenBigMessage$L+3,a
7586  1a8d a62d          	ld	a,#low(L7613)
7587  1a8f ae2d          	ld	x,#high(L7613)
7588  1a91 cd0211        	call	_screenBigMessage
7590                     ; 1154 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
7592  1a94 a602          	ld	a,#2
7593  1a96 b702          	ld	_parametersSet$L+2,a
7594  1a98 3f01          	clr	_parametersSet$L+1
7595  1a9a a608          	ld	a,#8
7596  1a9c cd0000        	call	_parametersSet
7598                     ; 1155 					break;
7600  1a9f cc1c8f        	jp	L3732
7601  1aa2               L5032:
7602                     ; 1156 				case SCREEN_STD_MSG_PHASE_MAN_ERR:
7602                     ; 1157 					screenBigMessage("Errore fasatura", "Macchina non ferma");				
7604  1aa2 aefa          	ld	x,#high(L5713)
7605  1aa4 bf02          	ld	_screenBigMessage$L+2,x
7606  1aa6 a6fa          	ld	a,#low(L5713)
7607  1aa8 b703          	ld	_screenBigMessage$L+3,a
7608  1aaa a60d          	ld	a,#low(L3713)
7609  1aac ae0d          	ld	x,#high(L3713)
7610  1aae cd0211        	call	_screenBigMessage
7612                     ; 1158 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
7614  1ab1 a602          	ld	a,#2
7615  1ab3 b702          	ld	_parametersSet$L+2,a
7616  1ab5 3f01          	clr	_parametersSet$L+1
7617  1ab7 a608          	ld	a,#8
7618  1ab9 cd0000        	call	_parametersSet
7620                     ; 1159 					break;
7622  1abc cc1c8f        	jp	L3732
7623  1abf               L7032:
7624                     ; 1160 				case SCREEN_STD_MSG_ERR_TEST_OUTPUT:
7624                     ; 1161 					screenBigMessage("Errore test", "Macchina non ferma");
7626  1abf aefa          	ld	x,#high(L5713)
7627  1ac1 bf02          	ld	_screenBigMessage$L+2,x
7628  1ac3 a6fa          	ld	a,#low(L5713)
7629  1ac5 b703          	ld	_screenBigMessage$L+3,a
7630  1ac7 a6ee          	ld	a,#low(L7713)
7631  1ac9 aeee          	ld	x,#high(L7713)
7632  1acb cd0211        	call	_screenBigMessage
7634                     ; 1162 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
7636  1ace a602          	ld	a,#2
7637  1ad0 b702          	ld	_parametersSet$L+2,a
7638  1ad2 3f01          	clr	_parametersSet$L+1
7639  1ad4 a608          	ld	a,#8
7640  1ad6 cd0000        	call	_parametersSet
7642                     ; 1163 					break;
7644  1ad9 cc1c8f        	jp	L3732
7645  1adc               L1132:
7646                     ; 1164 				case SCREEN_STD_MSG_PHASE_AUTO_ERR:
7646                     ; 1165 					screenBigMessage("Errore fasatura", "automatica");
7648  1adc ae84          	ld	x,#high(L1513)
7649  1ade bf02          	ld	_screenBigMessage$L+2,x
7650  1ae0 a684          	ld	a,#low(L1513)
7651  1ae2 b703          	ld	_screenBigMessage$L+3,a
7652  1ae4 a60d          	ld	a,#low(L3713)
7653  1ae6 ae0d          	ld	x,#high(L3713)
7654  1ae8 cd0211        	call	_screenBigMessage
7656                     ; 1166 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
7658  1aeb a602          	ld	a,#2
7659  1aed b702          	ld	_parametersSet$L+2,a
7660  1aef 3f01          	clr	_parametersSet$L+1
7661  1af1 a608          	ld	a,#8
7662  1af3 cd0000        	call	_parametersSet
7664                     ; 1167 					break;
7666  1af6 cc1c8f        	jp	L3732
7667  1af9               L3132:
7668                     ; 1168 				case SCREEN_STD_MSG_PHASE_DOUBLE_MARK:
7668                     ; 1169 					screenBigMessage("Errore", "segno doppio");
7670  1af9 aee1          	ld	x,#high(L1023)
7671  1afb bf02          	ld	_screenBigMessage$L+2,x
7672  1afd a6e1          	ld	a,#low(L1023)
7673  1aff b703          	ld	_screenBigMessage$L+3,a
7674  1b01 a64e          	ld	a,#low(L3613)
7675  1b03 ae4e          	ld	x,#high(L3613)
7676  1b05 cd0211        	call	_screenBigMessage
7678                     ; 1170 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
7680  1b08 a602          	ld	a,#2
7681  1b0a b702          	ld	_parametersSet$L+2,a
7682  1b0c 3f01          	clr	_parametersSet$L+1
7683  1b0e a608          	ld	a,#8
7684  1b10 cd0000        	call	_parametersSet
7686                     ; 1171 					break;
7688  1b13 cc1c8f        	jp	L3732
7689  1b16               L5132:
7690                     ; 1172 				case SCREEN_STD_MSG_TEST_OK:
7690                     ; 1173 					screenBigMessage("Test eseguito", "correttamente");			
7692  1b16 ae55          	ld	x,#high(L1613)
7693  1b18 bf02          	ld	_screenBigMessage$L+2,x
7694  1b1a a655          	ld	a,#low(L1613)
7695  1b1c b703          	ld	_screenBigMessage$L+3,a
7696  1b1e a6d3          	ld	a,#low(L3023)
7697  1b20 aed3          	ld	x,#high(L3023)
7698  1b22 cd0211        	call	_screenBigMessage
7700                     ; 1174 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
7702  1b25 a602          	ld	a,#2
7703  1b27 b702          	ld	_parametersSet$L+2,a
7704  1b29 3f01          	clr	_parametersSet$L+1
7705  1b2b a608          	ld	a,#8
7706  1b2d cd0000        	call	_parametersSet
7708                     ; 1175 					break;
7710  1b30 cc1c8f        	jp	L3732
7711  1b33               L7132:
7712                     ; 1176 				case SCREEN_STD_MSG_TEST_SH_ERR:
7712                     ; 1177 					screenBigMessage("Errore test", "testina");
7714  1b33 ae7c          	ld	x,#high(L3513)
7715  1b35 bf02          	ld	_screenBigMessage$L+2,x
7716  1b37 a67c          	ld	a,#low(L3513)
7717  1b39 b703          	ld	_screenBigMessage$L+3,a
7718  1b3b a6ee          	ld	a,#low(L7713)
7719  1b3d aeee          	ld	x,#high(L7713)
7720  1b3f cd0211        	call	_screenBigMessage
7722                     ; 1178 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
7724  1b42 a602          	ld	a,#2
7725  1b44 b702          	ld	_parametersSet$L+2,a
7726  1b46 3f01          	clr	_parametersSet$L+1
7727  1b48 a608          	ld	a,#8
7728  1b4a cd0000        	call	_parametersSet
7730                     ; 1179 					break;
7732  1b4d cc1c8f        	jp	L3732
7733  1b50               L1232:
7734                     ; 1180 				case SCREEN_STD_MSG_TEST_ENC_ERR:
7734                     ; 1181 					screenBigMessage("Errore test", "encoder");
7736  1b50 ae86          	ld	x,#high(L3072)
7737  1b52 bf02          	ld	_screenBigMessage$L+2,x
7738  1b54 a686          	ld	a,#low(L3072)
7739  1b56 b703          	ld	_screenBigMessage$L+3,a
7740  1b58 a6ee          	ld	a,#low(L7713)
7741  1b5a aeee          	ld	x,#high(L7713)
7742  1b5c cd0211        	call	_screenBigMessage
7744                     ; 1182 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
7746  1b5f a602          	ld	a,#2
7747  1b61 b702          	ld	_parametersSet$L+2,a
7748  1b63 3f01          	clr	_parametersSet$L+1
7749  1b65 a608          	ld	a,#8
7750  1b67 cd0000        	call	_parametersSet
7752                     ; 1183 					break;
7754  1b6a cc1c8f        	jp	L3732
7755  1b6d               L3232:
7756                     ; 1184 				case SCREEN_STD_MSG_VISUAL_OSCILLOSCOPE:
7756                     ; 1185 					screenBigMessage("Visualizzazione", "oscilloscopio");
7758  1b6d aeb5          	ld	x,#high(L7023)
7759  1b6f bf02          	ld	_screenBigMessage$L+2,x
7760  1b71 a6b5          	ld	a,#low(L7023)
7761  1b73 b703          	ld	_screenBigMessage$L+3,a
7762  1b75 a6c3          	ld	a,#low(L5023)
7763  1b77 aec3          	ld	x,#high(L5023)
7764  1b79 cd0211        	call	_screenBigMessage
7766                     ; 1186 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
7768  1b7c a602          	ld	a,#2
7769  1b7e b702          	ld	_parametersSet$L+2,a
7770  1b80 3f01          	clr	_parametersSet$L+1
7771  1b82 a608          	ld	a,#8
7772  1b84 cd0000        	call	_parametersSet
7774                     ; 1187 					break;
7776  1b87 cc1c8f        	jp	L3732
7777  1b8a               L5232:
7778                     ; 1188 				case SCREEN_STD_MSG_CORRECTION_TRANS:
7778                     ; 1189 					screenBigMessage("Correzione Laterale", "(non operativo)");
7780  1b8a ae91          	ld	x,#high(L3123)
7781  1b8c bf02          	ld	_screenBigMessage$L+2,x
7782  1b8e a691          	ld	a,#low(L3123)
7783  1b90 b703          	ld	_screenBigMessage$L+3,a
7784  1b92 a6a1          	ld	a,#low(L1123)
7785  1b94 aea1          	ld	x,#high(L1123)
7786  1b96 cd0211        	call	_screenBigMessage
7788                     ; 1190 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
7790  1b99 a602          	ld	a,#2
7791  1b9b b702          	ld	_parametersSet$L+2,a
7792  1b9d 3f01          	clr	_parametersSet$L+1
7793  1b9f a608          	ld	a,#8
7794  1ba1 cd0000        	call	_parametersSet
7796                     ; 1191 					break;
7798  1ba4 cc1c8f        	jp	L3732
7799  1ba7               L7232:
7800                     ; 1192 				case SCREEN_STD_MSG_OFFSET_DISTANCE:
7800                     ; 1193 					screenBigMessage("Intervallo", "offset");
7802  1ba7 ae99          	ld	x,#high(L1262)
7803  1ba9 bf02          	ld	_screenBigMessage$L+2,x
7804  1bab a699          	ld	a,#low(L1262)
7805  1bad b703          	ld	_screenBigMessage$L+3,a
7806  1baf a686          	ld	a,#low(L5123)
7807  1bb1 ae86          	ld	x,#high(L5123)
7808  1bb3 cd0211        	call	_screenBigMessage
7810                     ; 1194 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
7812  1bb6 a602          	ld	a,#2
7813  1bb8 b702          	ld	_parametersSet$L+2,a
7814  1bba 3f01          	clr	_parametersSet$L+1
7815  1bbc a608          	ld	a,#8
7816  1bbe cd0000        	call	_parametersSet
7818                     ; 1195 					break;
7820  1bc1 cc1c8f        	jp	L3732
7821  1bc4               L1332:
7822                     ; 1196 				case SCREEN_STD_MSG_PARAMETER_SAVED:
7822                     ; 1197 					screenBigMessage("Parametro salvato:", m_strString1);			
7824  1bc4 ae14          	ld	x,#high(_m_strString1)
7825  1bc6 bf02          	ld	_screenBigMessage$L+2,x
7826  1bc8 a614          	ld	a,#low(_m_strString1)
7827  1bca b703          	ld	_screenBigMessage$L+3,a
7828  1bcc a673          	ld	a,#low(L7123)
7829  1bce ae73          	ld	x,#high(L7123)
7830  1bd0 cd0211        	call	_screenBigMessage
7832                     ; 1198 					break;
7834  1bd3 cc1c8f        	jp	L3732
7835  1bd6               L3332:
7836                     ; 1199 				case SCREEN_STD_MSG_CMD_DONE:
7836                     ; 1200 					screenBigMessage("Comando eseguito", "correttamente");
7838  1bd6 ae55          	ld	x,#high(L1613)
7839  1bd8 bf02          	ld	_screenBigMessage$L+2,x
7840  1bda a655          	ld	a,#low(L1613)
7841  1bdc b703          	ld	_screenBigMessage$L+3,a
7842  1bde a662          	ld	a,#low(L1223)
7843  1be0 ae62          	ld	x,#high(L1223)
7844  1be2 cd0211        	call	_screenBigMessage
7846                     ; 1201 					break;
7848  1be5 cc1c8f        	jp	L3732
7849  1be8               L5332:
7850                     ; 1202 				case SCREEN_STD_MSG_SW_VERSION:
7850                     ; 1203 					screenBigMessage("Versione SW", "");
7852  1be8 ae30          	ld	x,#high(L5152)
7853  1bea bf02          	ld	_screenBigMessage$L+2,x
7854  1bec a630          	ld	a,#low(L5152)
7855  1bee b703          	ld	_screenBigMessage$L+3,a
7856  1bf0 a6c2          	ld	a,#low(L5751)
7857  1bf2 aec2          	ld	x,#high(L5751)
7858  1bf4 cd0211        	call	_screenBigMessage
7860                     ; 1204 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
7862  1bf7 a602          	ld	a,#2
7863  1bf9 b702          	ld	_parametersSet$L+2,a
7864  1bfb 3f01          	clr	_parametersSet$L+1
7865  1bfd a608          	ld	a,#8
7866  1bff cd0000        	call	_parametersSet
7868                     ; 1205 					break;
7870  1c02 cc1c8f        	jp	L3732
7871  1c05               L7332:
7872                     ; 1206 				case SCREEN_STD_MSG_UNKNOWN_CODE:
7872                     ; 1207 					screenBigMessage("Code", "sconosciuto");
7874  1c05 ae56          	ld	x,#high(L3223)
7875  1c07 bf02          	ld	_screenBigMessage$L+2,x
7876  1c09 a656          	ld	a,#low(L3223)
7877  1c0b b703          	ld	_screenBigMessage$L+3,a
7878  1c0d a66d          	ld	a,#low(L3362)
7879  1c0f ae6d          	ld	x,#high(L3362)
7880  1c11 cd0211        	call	_screenBigMessage
7882                     ; 1208 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
7884  1c14 a602          	ld	a,#2
7885  1c16 b702          	ld	_parametersSet$L+2,a
7886  1c18 3f01          	clr	_parametersSet$L+1
7887  1c1a a608          	ld	a,#8
7888  1c1c cd0000        	call	_parametersSet
7890                     ; 1209 					break;
7892  1c1f 206e          	jra	L3732
7893  1c21               L1432:
7894                     ; 1210 				case SCREEN_STD_MSG_UNKNOWN_ADDCODE:
7894                     ; 1211 					screenBigMessage("AdditionalCode", "sconosciuto");
7896  1c21 ae56          	ld	x,#high(L3223)
7897  1c23 bf02          	ld	_screenBigMessage$L+2,x
7898  1c25 a656          	ld	a,#low(L3223)
7899  1c27 b703          	ld	_screenBigMessage$L+3,a
7900  1c29 a614          	ld	a,#low(L3252)
7901  1c2b ae14          	ld	x,#high(L3252)
7902  1c2d cd0211        	call	_screenBigMessage
7904                     ; 1212 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
7906  1c30 a602          	ld	a,#2
7907  1c32 b702          	ld	_parametersSet$L+2,a
7908  1c34 3f01          	clr	_parametersSet$L+1
7909  1c36 a608          	ld	a,#8
7910  1c38 cd0000        	call	_parametersSet
7912                     ; 1213 					break;
7914  1c3b 2052          	jra	L3732
7915  1c3d               L3432:
7916                     ; 1214 				case SCREEN_STD_MSG_RESET_ERROR:
7916                     ; 1215 					screenBigMessage("Azzeramento", "errore");
7918  1c3d ae43          	ld	x,#high(L7223)
7919  1c3f bf02          	ld	_screenBigMessage$L+2,x
7920  1c41 a643          	ld	a,#low(L7223)
7921  1c43 b703          	ld	_screenBigMessage$L+3,a
7922  1c45 a64a          	ld	a,#low(L5223)
7923  1c47 ae4a          	ld	x,#high(L5223)
7924  1c49 cd0211        	call	_screenBigMessage
7926                     ; 1216 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);	
7928  1c4c a602          	ld	a,#2
7929  1c4e b702          	ld	_parametersSet$L+2,a
7930  1c50 3f01          	clr	_parametersSet$L+1
7931  1c52 a608          	ld	a,#8
7932  1c54 cd0000        	call	_parametersSet
7934                     ; 1217 					break;
7936  1c57 2036          	jra	L3732
7937  1c59               L5432:
7938                     ; 1218 				case SCREEN_STD_MSG_PARAMETER_VALUE_NA:
7938                     ; 1219 					screenBigMessage("Errore: Valore ", "non accettabile");
7940  1c59 ae23          	ld	x,#high(L3323)
7941  1c5b bf02          	ld	_screenBigMessage$L+2,x
7942  1c5d a623          	ld	a,#low(L3323)
7943  1c5f b703          	ld	_screenBigMessage$L+3,a
7944  1c61 a633          	ld	a,#low(L1323)
7945  1c63 ae33          	ld	x,#high(L1323)
7946  1c65 cd0211        	call	_screenBigMessage
7948                     ; 1220 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
7950  1c68 a602          	ld	a,#2
7951  1c6a b702          	ld	_parametersSet$L+2,a
7952  1c6c 3f01          	clr	_parametersSet$L+1
7953  1c6e a608          	ld	a,#8
7954  1c70 cd0000        	call	_parametersSet
7956                     ; 1221 					break;
7958  1c73 201a          	jra	L3732
7959  1c75               L7432:
7960                     ; 1222 				case SCREEN_STD_MSG_WRONG_MEMORY_SLOT:
7960                     ; 1223 					screenBigMessage("Errore: Posizione", "non disponibile");
7962  1c75 ae01          	ld	x,#high(L7323)
7963  1c77 bf02          	ld	_screenBigMessage$L+2,x
7964  1c79 a601          	ld	a,#low(L7323)
7965  1c7b b703          	ld	_screenBigMessage$L+3,a
7966  1c7d a611          	ld	a,#low(L5323)
7967  1c7f ae11          	ld	x,#high(L5323)
7968  1c81 cd0211        	call	_screenBigMessage
7970                     ; 1224 					parametersSet(PARAM_PAGE, PAGE_MESSAGE);
7972  1c84 a602          	ld	a,#2
7973  1c86 b702          	ld	_parametersSet$L+2,a
7974  1c88 3f01          	clr	_parametersSet$L+1
7975  1c8a a608          	ld	a,#8
7976  1c8c cd0000        	call	_parametersSet
7978                     ; 1225 					break;
7980  1c8f               L1532:
7981                     ; 1226 				default:
7981                     ; 1227 					break;
7983  1c8f               L1313:
7984                     ; 1229 			break;
7986  1c8f               L3732:
7987                     ; 1231 }
7990  1c8f 81            	ret
8028                     	switch	.const
8029  01c3               L002:
8030  01c3 1cd3          	dc.w	L3423
8031  01c5 1cfc          	dc.w	L5423
8032  01c7 1d25          	dc.w	L7423
8033  01c9 1d77          	dc.w	L3523
8034  01cb 1d4e          	dc.w	L1523
8035  01cd 1dc9          	dc.w	L7523
8036  01cf 1da0          	dc.w	L5523
8037  01d1 1df2          	dc.w	L1623
8038  01d3 1e1b          	dc.w	L3623
8039  01d5 1ec2          	dc.w	L1053
8040  01d7 1ec2          	dc.w	L1053
8041  01d9 1ec2          	dc.w	L1053
8042  01db 1e6d          	dc.w	L7623
8043  01dd 1e44          	dc.w	L5623
8044  01df               L402:
8045  01df 1ee2          	dc.w	L7723
8046  01e1 1f0b          	dc.w	L1033
8047  01e3 1f34          	dc.w	L3033
8048  01e5 1f86          	dc.w	L7033
8049  01e7 1f5d          	dc.w	L5033
8050  01e9 1fd8          	dc.w	L3133
8051  01eb 1faf          	dc.w	L1133
8052  01ed 2001          	dc.w	L5133
8053  01ef 202a          	dc.w	L7133
8054  01f1 20d1          	dc.w	L1553
8055  01f3 20d1          	dc.w	L1553
8056  01f5 20d1          	dc.w	L1553
8057  01f7 207c          	dc.w	L3233
8058  01f9 2053          	dc.w	L1233
8059  01fb               L012:
8060  01fb 20f1          	dc.w	L3333
8061  01fd 211a          	dc.w	L5333
8062  01ff 2143          	dc.w	L7333
8063  0201 2195          	dc.w	L3433
8064  0203 216c          	dc.w	L1433
8065  0205 21e7          	dc.w	L7433
8066  0207 21be          	dc.w	L5433
8067  0209 2210          	dc.w	L1533
8068  020b 2239          	dc.w	L3533
8069  020d 22e0          	dc.w	L7063
8070  020f 22e0          	dc.w	L7063
8071  0211 22e0          	dc.w	L7063
8072  0213 228b          	dc.w	L7533
8073  0215 2262          	dc.w	L5533
8074  0217               L412:
8075  0217 2300          	dc.w	L7633
8076  0219 2329          	dc.w	L1733
8077  021b 2352          	dc.w	L3733
8078  021d 23a4          	dc.w	L7733
8079  021f 237b          	dc.w	L5733
8080  0221 23f6          	dc.w	L3043
8081  0223 23cd          	dc.w	L1043
8082  0225 241f          	dc.w	L5043
8083  0227 2448          	dc.w	L7043
8084  0229 24ef          	dc.w	L5463
8085  022b 24ef          	dc.w	L5463
8086  022d 24ef          	dc.w	L5463
8087  022f 249a          	dc.w	L3143
8088  0231 2471          	dc.w	L1143
8089  0233               L022:
8090  0233 250f          	dc.w	L3243
8091  0235 2538          	dc.w	L5243
8092  0237 2561          	dc.w	L7243
8093  0239 25b3          	dc.w	L3343
8094  023b 258a          	dc.w	L1343
8095  023d 2605          	dc.w	L7343
8096  023f 25dc          	dc.w	L5343
8097  0241 262e          	dc.w	L1443
8098  0243 2657          	dc.w	L3443
8099  0245 26f5          	dc.w	L3073
8100  0247 26f5          	dc.w	L3073
8101  0249 26f5          	dc.w	L3073
8102  024b 26a7          	dc.w	L7443
8103  024d 267f          	dc.w	L5443
8104                     ; 1234 void screenPrepareStdMessage(BYTE a_byStdMessage)
8104                     ; 1235 {
8105                     	switch	.text
8107                     	xref.b	_screenPrepareStdMessage$L
8108  1c90               _screenPrepareStdMessage:
8110  1c90 b700          	ld	_screenPrepareStdMessage$L,a
8112                     ; 1236 	switch(parametersGetValue(PARAM_LANGUAGE))
8114  1c92 a62f          	ld	a,#47
8115  1c94 cd0000        	call	_parametersGetValue
8118                     ; 1513 			break;
8119  1c97 5d            	tnz	x
8120  1c98 2703          	jreq	L422
8121  1c9a cc24f2        	jp	L1243
8122  1c9d               L422:
8123  1c9d a002          	sub	a,#2
8124  1c9f 2715          	jreq	L1423
8125  1ca1 4a            	dec	a
8126  1ca2 2603          	jrne	L622
8127  1ca4 cc20d4        	jp	L1333
8128  1ca7               L622:
8129  1ca7 4a            	dec	a
8130  1ca8 2603          	jrne	L032
8131  1caa cc22e3        	jp	L5633
8132  1cad               L032:
8133  1cad 4a            	dec	a
8134  1cae 2603          	jrne	L232
8135  1cb0 cc1ec5        	jp	L5723
8136  1cb3               L232:
8137  1cb3 cc24f2        	jp	L1243
8138  1cb6               L1423:
8139                     ; 1238 		case PARAM_LANGUAGE_EN: //English
8139                     ; 1239 			switch(a_byStdMessage)
8141  1cb6 b600          	ld	a,_screenPrepareStdMessage$L
8143                     ; 1289 				default:
8143                     ; 1290 					break;
8144  1cb8 a01d          	sub	a,#29
8145  1cba a10e          	cp	a,#14
8146  1cbc 240b          	jruge	L671
8147  1cbe 48            	sll	a
8148  1cbf 97            	ld	x,a
8149  1cc0 d601c4        	ld	a,(L002+1,x)
8150  1cc3 88            	push	a
8151  1cc4 d601c3        	ld	a,(L002,x)
8152  1cc7 88            	push	a
8153  1cc8 81            	ret
8154  1cc9               L671:
8155  1cc9 a0ee          	sub	a,#-18
8156  1ccb 2603          	jrne	L432
8157  1ccd cc1e96        	jp	L1723
8158  1cd0               L432:
8159  1cd0 cc26f5        	jp	L5743
8160  1cd3               L3423:
8161                     ; 1241 				case SCREEN_STD_MSG_CYLINDER_TRAVEL:
8161                     ; 1242 					memcpy(m_strString1, "Cylinder size", 20);
8163  1cd3 a614          	ld	a,#20
8164  1cd5 b704          	ld	_memcpy$L+4,a
8165  1cd7 aef3          	ld	x,#high(L3053)
8166  1cd9 bf02          	ld	_memcpy$L+2,x
8167  1cdb a6f3          	ld	a,#low(L3053)
8168  1cdd b703          	ld	_memcpy$L+3,a
8169  1cdf a614          	ld	a,#low(_m_strString1)
8170  1ce1 ae14          	ld	x,#high(_m_strString1)
8171  1ce3 cd0000        	call	_memcpy
8173                     ; 1243 					memcpy(m_strString2, "        mm", 20);
8175  1ce6 a614          	ld	a,#20
8176  1ce8 b704          	ld	_memcpy$L+4,a
8177  1cea aee8          	ld	x,#high(L5053)
8178  1cec bf02          	ld	_memcpy$L+2,x
8179  1cee a6e8          	ld	a,#low(L5053)
8180  1cf0 b703          	ld	_memcpy$L+3,a
8181  1cf2 a600          	ld	a,#low(_m_strString2)
8182  1cf4 ae00          	ld	x,#high(_m_strString2)
8183  1cf6 cd0000        	call	_memcpy
8185                     ; 1244 					break;
8187  1cf9 cc26f5        	jp	L5743
8188  1cfc               L5423:
8189                     ; 1245 				case SCREEN_STD_MSG_ALLARM:
8189                     ; 1246 					memcpy(m_strString1, "Alarm bound", 20);
8191  1cfc a614          	ld	a,#20
8192  1cfe b704          	ld	_memcpy$L+4,a
8193  1d00 aedc          	ld	x,#high(L7053)
8194  1d02 bf02          	ld	_memcpy$L+2,x
8195  1d04 a6dc          	ld	a,#low(L7053)
8196  1d06 b703          	ld	_memcpy$L+3,a
8197  1d08 a614          	ld	a,#low(_m_strString1)
8198  1d0a ae14          	ld	x,#high(_m_strString1)
8199  1d0c cd0000        	call	_memcpy
8201                     ; 1247 					memcpy(m_strString2, "      mm/100", 20);
8203  1d0f a614          	ld	a,#20
8204  1d11 b704          	ld	_memcpy$L+4,a
8205  1d13 aecf          	ld	x,#high(L1153)
8206  1d15 bf02          	ld	_memcpy$L+2,x
8207  1d17 a6cf          	ld	a,#low(L1153)
8208  1d19 b703          	ld	_memcpy$L+3,a
8209  1d1b a600          	ld	a,#low(_m_strString2)
8210  1d1d ae00          	ld	x,#high(_m_strString2)
8211  1d1f cd0000        	call	_memcpy
8213                     ; 1248 					break;
8215  1d22 cc26f5        	jp	L5743
8216  1d25               L7423:
8217                     ; 1249 				case SCREEN_STD_MSG_GATE_WINDOW:
8217                     ; 1250 					memcpy(m_strString1, "Gate width", 20);
8219  1d25 a614          	ld	a,#20
8220  1d27 b704          	ld	_memcpy$L+4,a
8221  1d29 aec4          	ld	x,#high(L3153)
8222  1d2b bf02          	ld	_memcpy$L+2,x
8223  1d2d a6c4          	ld	a,#low(L3153)
8224  1d2f b703          	ld	_memcpy$L+3,a
8225  1d31 a614          	ld	a,#low(_m_strString1)
8226  1d33 ae14          	ld	x,#high(_m_strString1)
8227  1d35 cd0000        	call	_memcpy
8229                     ; 1251 					memcpy(m_strString2, "      mm", 20);
8231  1d38 a614          	ld	a,#20
8232  1d3a b704          	ld	_memcpy$L+4,a
8233  1d3c aebb          	ld	x,#high(L5153)
8234  1d3e bf02          	ld	_memcpy$L+2,x
8235  1d40 a6bb          	ld	a,#low(L5153)
8236  1d42 b703          	ld	_memcpy$L+3,a
8237  1d44 a600          	ld	a,#low(_m_strString2)
8238  1d46 ae00          	ld	x,#high(_m_strString2)
8239  1d48 cd0000        	call	_memcpy
8241                     ; 1252 					break;
8243  1d4b cc26f5        	jp	L5743
8244  1d4e               L1523:
8245                     ; 1253 				case SCREEN_STD_MSG_DIRECTION_R:
8245                     ; 1254 					memcpy(m_strString1, "Retarde", 20);
8247  1d4e a614          	ld	a,#20
8248  1d50 b704          	ld	_memcpy$L+4,a
8249  1d52 aeb3          	ld	x,#high(L7153)
8250  1d54 bf02          	ld	_memcpy$L+2,x
8251  1d56 a6b3          	ld	a,#low(L7153)
8252  1d58 b703          	ld	_memcpy$L+3,a
8253  1d5a a614          	ld	a,#low(_m_strString1)
8254  1d5c ae14          	ld	x,#high(_m_strString1)
8255  1d5e cd0000        	call	_memcpy
8257                     ; 1255 					memcpy(m_strString2, "      mm/100", 20);
8259  1d61 a614          	ld	a,#20
8260  1d63 b704          	ld	_memcpy$L+4,a
8261  1d65 aecf          	ld	x,#high(L1153)
8262  1d67 bf02          	ld	_memcpy$L+2,x
8263  1d69 a6cf          	ld	a,#low(L1153)
8264  1d6b b703          	ld	_memcpy$L+3,a
8265  1d6d a600          	ld	a,#low(_m_strString2)
8266  1d6f ae00          	ld	x,#high(_m_strString2)
8267  1d71 cd0000        	call	_memcpy
8269                     ; 1256 					break;
8271  1d74 cc26f5        	jp	L5743
8272  1d77               L3523:
8273                     ; 1257 				case SCREEN_STD_MSG_DIRECTION_A:
8273                     ; 1258 					memcpy(m_strString1, "Advance", 20);
8275  1d77 a614          	ld	a,#20
8276  1d79 b704          	ld	_memcpy$L+4,a
8277  1d7b aeab          	ld	x,#high(L1253)
8278  1d7d bf02          	ld	_memcpy$L+2,x
8279  1d7f a6ab          	ld	a,#low(L1253)
8280  1d81 b703          	ld	_memcpy$L+3,a
8281  1d83 a614          	ld	a,#low(_m_strString1)
8282  1d85 ae14          	ld	x,#high(_m_strString1)
8283  1d87 cd0000        	call	_memcpy
8285                     ; 1259 					memcpy(m_strString2, "      mm/100", 20);
8287  1d8a a614          	ld	a,#20
8288  1d8c b704          	ld	_memcpy$L+4,a
8289  1d8e aecf          	ld	x,#high(L1153)
8290  1d90 bf02          	ld	_memcpy$L+2,x
8291  1d92 a6cf          	ld	a,#low(L1153)
8292  1d94 b703          	ld	_memcpy$L+3,a
8293  1d96 a600          	ld	a,#low(_m_strString2)
8294  1d98 ae00          	ld	x,#high(_m_strString2)
8295  1d9a cd0000        	call	_memcpy
8297                     ; 1260 					break;
8299  1d9d cc26f5        	jp	L5743
8300  1da0               L5523:
8301                     ; 1261 				case SCREEN_STD_MSG_DIRECTION_O:
8301                     ; 1262 					memcpy(m_strString1, "Operator", 20);
8303  1da0 a614          	ld	a,#20
8304  1da2 b704          	ld	_memcpy$L+4,a
8305  1da4 aea2          	ld	x,#high(L3253)
8306  1da6 bf02          	ld	_memcpy$L+2,x
8307  1da8 a6a2          	ld	a,#low(L3253)
8308  1daa b703          	ld	_memcpy$L+3,a
8309  1dac a614          	ld	a,#low(_m_strString1)
8310  1dae ae14          	ld	x,#high(_m_strString1)
8311  1db0 cd0000        	call	_memcpy
8313                     ; 1263 					memcpy(m_strString2, "      mm/100", 20);
8315  1db3 a614          	ld	a,#20
8316  1db5 b704          	ld	_memcpy$L+4,a
8317  1db7 aecf          	ld	x,#high(L1153)
8318  1db9 bf02          	ld	_memcpy$L+2,x
8319  1dbb a6cf          	ld	a,#low(L1153)
8320  1dbd b703          	ld	_memcpy$L+3,a
8321  1dbf a600          	ld	a,#low(_m_strString2)
8322  1dc1 ae00          	ld	x,#high(_m_strString2)
8323  1dc3 cd0000        	call	_memcpy
8325                     ; 1264 					break;
8327  1dc6 cc26f5        	jp	L5743
8328  1dc9               L7523:
8329                     ; 1265 				case SCREEN_STD_MSG_DIRECTION_T:
8329                     ; 1266 					memcpy(m_strString1, "Gear",     20);
8331  1dc9 a614          	ld	a,#20
8332  1dcb b704          	ld	_memcpy$L+4,a
8333  1dcd ae9d          	ld	x,#high(L5253)
8334  1dcf bf02          	ld	_memcpy$L+2,x
8335  1dd1 a69d          	ld	a,#low(L5253)
8336  1dd3 b703          	ld	_memcpy$L+3,a
8337  1dd5 a614          	ld	a,#low(_m_strString1)
8338  1dd7 ae14          	ld	x,#high(_m_strString1)
8339  1dd9 cd0000        	call	_memcpy
8341                     ; 1267 					memcpy(m_strString2, "      mm/100", 20);		
8343  1ddc a614          	ld	a,#20
8344  1dde b704          	ld	_memcpy$L+4,a
8345  1de0 aecf          	ld	x,#high(L1153)
8346  1de2 bf02          	ld	_memcpy$L+2,x
8347  1de4 a6cf          	ld	a,#low(L1153)
8348  1de6 b703          	ld	_memcpy$L+3,a
8349  1de8 a600          	ld	a,#low(_m_strString2)
8350  1dea ae00          	ld	x,#high(_m_strString2)
8351  1dec cd0000        	call	_memcpy
8353                     ; 1268 					break;
8355  1def cc26f5        	jp	L5743
8356  1df2               L1623:
8357                     ; 1269 				case SCREEN_STD_MSG_DIRECTION_I:
8357                     ; 1270 					memcpy(m_strString1, "Tension Increment", 20);
8359  1df2 a614          	ld	a,#20
8360  1df4 b704          	ld	_memcpy$L+4,a
8361  1df6 ae8b          	ld	x,#high(L7253)
8362  1df8 bf02          	ld	_memcpy$L+2,x
8363  1dfa a68b          	ld	a,#low(L7253)
8364  1dfc b703          	ld	_memcpy$L+3,a
8365  1dfe a614          	ld	a,#low(_m_strString1)
8366  1e00 ae14          	ld	x,#high(_m_strString1)
8367  1e02 cd0000        	call	_memcpy
8369                     ; 1271 					memcpy(m_strString2, "      mt/min", 20);
8371  1e05 a614          	ld	a,#20
8372  1e07 b704          	ld	_memcpy$L+4,a
8373  1e09 ae7e          	ld	x,#high(L1353)
8374  1e0b bf02          	ld	_memcpy$L+2,x
8375  1e0d a67e          	ld	a,#low(L1353)
8376  1e0f b703          	ld	_memcpy$L+3,a
8377  1e11 a600          	ld	a,#low(_m_strString2)
8378  1e13 ae00          	ld	x,#high(_m_strString2)
8379  1e15 cd0000        	call	_memcpy
8381                     ; 1272 					break;
8383  1e18 cc26f5        	jp	L5743
8384  1e1b               L3623:
8385                     ; 1273 				case SCREEN_STD_MSG_DIRECTION_D:
8385                     ; 1274 					memcpy(m_strString1, "Tension Decrement", 20);
8387  1e1b a614          	ld	a,#20
8388  1e1d b704          	ld	_memcpy$L+4,a
8389  1e1f ae6c          	ld	x,#high(L3353)
8390  1e21 bf02          	ld	_memcpy$L+2,x
8391  1e23 a66c          	ld	a,#low(L3353)
8392  1e25 b703          	ld	_memcpy$L+3,a
8393  1e27 a614          	ld	a,#low(_m_strString1)
8394  1e29 ae14          	ld	x,#high(_m_strString1)
8395  1e2b cd0000        	call	_memcpy
8397                     ; 1275 					memcpy(m_strString2, "      mt/min", 20);		
8399  1e2e a614          	ld	a,#20
8400  1e30 b704          	ld	_memcpy$L+4,a
8401  1e32 ae7e          	ld	x,#high(L1353)
8402  1e34 bf02          	ld	_memcpy$L+2,x
8403  1e36 a67e          	ld	a,#low(L1353)
8404  1e38 b703          	ld	_memcpy$L+3,a
8405  1e3a a600          	ld	a,#low(_m_strString2)
8406  1e3c ae00          	ld	x,#high(_m_strString2)
8407  1e3e cd0000        	call	_memcpy
8409                     ; 1276 					break;
8411  1e41 cc26f5        	jp	L5743
8412  1e44               L5623:
8413                     ; 1277 				case SCREEN_STD_MSG_SAVE_JOB:
8413                     ; 1278 					memcpy(m_strString1, "Save Job", 20);
8415  1e44 a614          	ld	a,#20
8416  1e46 b704          	ld	_memcpy$L+4,a
8417  1e48 ae63          	ld	x,#high(L5353)
8418  1e4a bf02          	ld	_memcpy$L+2,x
8419  1e4c a663          	ld	a,#low(L5353)
8420  1e4e b703          	ld	_memcpy$L+3,a
8421  1e50 a614          	ld	a,#low(_m_strString1)
8422  1e52 ae14          	ld	x,#high(_m_strString1)
8423  1e54 cd0000        	call	_memcpy
8425                     ; 1279 					memcpy(m_strString2, "      mem. position", 20);		
8427  1e57 a614          	ld	a,#20
8428  1e59 b704          	ld	_memcpy$L+4,a
8429  1e5b ae4f          	ld	x,#high(L7353)
8430  1e5d bf02          	ld	_memcpy$L+2,x
8431  1e5f a64f          	ld	a,#low(L7353)
8432  1e61 b703          	ld	_memcpy$L+3,a
8433  1e63 a600          	ld	a,#low(_m_strString2)
8434  1e65 ae00          	ld	x,#high(_m_strString2)
8435  1e67 cd0000        	call	_memcpy
8437                     ; 1280 					break;
8439  1e6a cc26f5        	jp	L5743
8440  1e6d               L7623:
8441                     ; 1281 				case SCREEN_STD_MSG_LOAD_JOB:
8441                     ; 1282 					memcpy(m_strString1, "Load Job", 20);
8443  1e6d a614          	ld	a,#20
8444  1e6f b704          	ld	_memcpy$L+4,a
8445  1e71 ae46          	ld	x,#high(L1453)
8446  1e73 bf02          	ld	_memcpy$L+2,x
8447  1e75 a646          	ld	a,#low(L1453)
8448  1e77 b703          	ld	_memcpy$L+3,a
8449  1e79 a614          	ld	a,#low(_m_strString1)
8450  1e7b ae14          	ld	x,#high(_m_strString1)
8451  1e7d cd0000        	call	_memcpy
8453                     ; 1283 					memcpy(m_strString2, "      mem. position", 20);		
8455  1e80 a614          	ld	a,#20
8456  1e82 b704          	ld	_memcpy$L+4,a
8457  1e84 ae4f          	ld	x,#high(L7353)
8458  1e86 bf02          	ld	_memcpy$L+2,x
8459  1e88 a64f          	ld	a,#low(L7353)
8460  1e8a b703          	ld	_memcpy$L+3,a
8461  1e8c a600          	ld	a,#low(_m_strString2)
8462  1e8e ae00          	ld	x,#high(_m_strString2)
8463  1e90 cd0000        	call	_memcpy
8465                     ; 1284 					break;
8467  1e93 cc26f5        	jp	L5743
8468  1e96               L1723:
8469                     ; 1285 				case SCREEN_STD_MSG_PARAM_5:
8469                     ; 1286 					memcpy(m_strString1, "Tension base value", 20);
8471  1e96 a614          	ld	a,#20
8472  1e98 b704          	ld	_memcpy$L+4,a
8473  1e9a ae33          	ld	x,#high(L3453)
8474  1e9c bf02          	ld	_memcpy$L+2,x
8475  1e9e a633          	ld	a,#low(L3453)
8476  1ea0 b703          	ld	_memcpy$L+3,a
8477  1ea2 a614          	ld	a,#low(_m_strString1)
8478  1ea4 ae14          	ld	x,#high(_m_strString1)
8479  1ea6 cd0000        	call	_memcpy
8481                     ; 1287 					memcpy(m_strString2, "        ", 20);
8483  1ea9 a614          	ld	a,#20
8484  1eab b704          	ld	_memcpy$L+4,a
8485  1ead ae2a          	ld	x,#high(L5453)
8486  1eaf bf02          	ld	_memcpy$L+2,x
8487  1eb1 a62a          	ld	a,#low(L5453)
8488  1eb3 b703          	ld	_memcpy$L+3,a
8489  1eb5 a600          	ld	a,#low(_m_strString2)
8490  1eb7 ae00          	ld	x,#high(_m_strString2)
8491  1eb9 cd0000        	call	_memcpy
8493                     ; 1288 					break;					
8495  1ebc cc26f5        	jp	L5743
8496  1ebf               L3723:
8497                     ; 1289 				default:
8497                     ; 1290 					break;
8499  1ebf cc26f5        	jp	L5743
8500  1ec2               L1053:
8501                     ; 1292 			break;
8503  1ec2 cc26f5        	jp	L5743
8504  1ec5               L5723:
8505                     ; 1293 		case PARAM_LANGUAGE_DE: //Deutch
8505                     ; 1294 			switch(a_byStdMessage)
8507  1ec5 b600          	ld	a,_screenPrepareStdMessage$L
8509                     ; 1344 				default:
8509                     ; 1345 					break;
8510  1ec7 a01d          	sub	a,#29
8511  1ec9 a10e          	cp	a,#14
8512  1ecb 240b          	jruge	L202
8513  1ecd 48            	sll	a
8514  1ece 97            	ld	x,a
8515  1ecf d601e0        	ld	a,(L402+1,x)
8516  1ed2 88            	push	a
8517  1ed3 d601df        	ld	a,(L402,x)
8518  1ed6 88            	push	a
8519  1ed7 81            	ret
8520  1ed8               L202:
8521  1ed8 a0ee          	sub	a,#-18
8522  1eda 2603          	jrne	L632
8523  1edc cc20a5        	jp	L5233
8524  1edf               L632:
8525  1edf cc26f5        	jp	L5743
8526  1ee2               L7723:
8527                     ; 1296 				case SCREEN_STD_MSG_CYLINDER_TRAVEL:
8527                     ; 1297 					memcpy(m_strString1, "Zylinder Format", 20);
8529  1ee2 a614          	ld	a,#20
8530  1ee4 b704          	ld	_memcpy$L+4,a
8531  1ee6 ae1a          	ld	x,#high(L3553)
8532  1ee8 bf02          	ld	_memcpy$L+2,x
8533  1eea a61a          	ld	a,#low(L3553)
8534  1eec b703          	ld	_memcpy$L+3,a
8535  1eee a614          	ld	a,#low(_m_strString1)
8536  1ef0 ae14          	ld	x,#high(_m_strString1)
8537  1ef2 cd0000        	call	_memcpy
8539                     ; 1298 					memcpy(m_strString2, "        mm", 20);
8541  1ef5 a614          	ld	a,#20
8542  1ef7 b704          	ld	_memcpy$L+4,a
8543  1ef9 aee8          	ld	x,#high(L5053)
8544  1efb bf02          	ld	_memcpy$L+2,x
8545  1efd a6e8          	ld	a,#low(L5053)
8546  1eff b703          	ld	_memcpy$L+3,a
8547  1f01 a600          	ld	a,#low(_m_strString2)
8548  1f03 ae00          	ld	x,#high(_m_strString2)
8549  1f05 cd0000        	call	_memcpy
8551                     ; 1299 					break;
8553  1f08 cc26f5        	jp	L5743
8554  1f0b               L1033:
8555                     ; 1300 				case SCREEN_STD_MSG_ALLARM:
8555                     ; 1301 					memcpy(m_strString1, "Reg. Alarm", 20);
8557  1f0b a614          	ld	a,#20
8558  1f0d b704          	ld	_memcpy$L+4,a
8559  1f0f ae0f          	ld	x,#high(L5553)
8560  1f11 bf02          	ld	_memcpy$L+2,x
8561  1f13 a60f          	ld	a,#low(L5553)
8562  1f15 b703          	ld	_memcpy$L+3,a
8563  1f17 a614          	ld	a,#low(_m_strString1)
8564  1f19 ae14          	ld	x,#high(_m_strString1)
8565  1f1b cd0000        	call	_memcpy
8567                     ; 1302 					memcpy(m_strString2, "      mm/100", 20);
8569  1f1e a614          	ld	a,#20
8570  1f20 b704          	ld	_memcpy$L+4,a
8571  1f22 aecf          	ld	x,#high(L1153)
8572  1f24 bf02          	ld	_memcpy$L+2,x
8573  1f26 a6cf          	ld	a,#low(L1153)
8574  1f28 b703          	ld	_memcpy$L+3,a
8575  1f2a a600          	ld	a,#low(_m_strString2)
8576  1f2c ae00          	ld	x,#high(_m_strString2)
8577  1f2e cd0000        	call	_memcpy
8579                     ; 1303 					break;
8581  1f31 cc26f5        	jp	L5743
8582  1f34               L3033:
8583                     ; 1304 				case SCREEN_STD_MSG_GATE_WINDOW:
8583                     ; 1305 					memcpy(m_strString1, "Tor Weite", 20);
8585  1f34 a614          	ld	a,#20
8586  1f36 b704          	ld	_memcpy$L+4,a
8587  1f38 ae05          	ld	x,#high(L7553)
8588  1f3a bf02          	ld	_memcpy$L+2,x
8589  1f3c a605          	ld	a,#low(L7553)
8590  1f3e b703          	ld	_memcpy$L+3,a
8591  1f40 a614          	ld	a,#low(_m_strString1)
8592  1f42 ae14          	ld	x,#high(_m_strString1)
8593  1f44 cd0000        	call	_memcpy
8595                     ; 1306 					memcpy(m_strString2, "      mm", 20);
8597  1f47 a614          	ld	a,#20
8598  1f49 b704          	ld	_memcpy$L+4,a
8599  1f4b aebb          	ld	x,#high(L5153)
8600  1f4d bf02          	ld	_memcpy$L+2,x
8601  1f4f a6bb          	ld	a,#low(L5153)
8602  1f51 b703          	ld	_memcpy$L+3,a
8603  1f53 a600          	ld	a,#low(_m_strString2)
8604  1f55 ae00          	ld	x,#high(_m_strString2)
8605  1f57 cd0000        	call	_memcpy
8607                     ; 1307 					break;
8609  1f5a cc26f5        	jp	L5743
8610  1f5d               L5033:
8611                     ; 1308 				case SCREEN_STD_MSG_DIRECTION_R:
8611                     ; 1309 					memcpy(m_strString1, "Verzogerung", 20);
8613  1f5d a614          	ld	a,#20
8614  1f5f b704          	ld	_memcpy$L+4,a
8615  1f61 aef9          	ld	x,#high(L1653)
8616  1f63 bf02          	ld	_memcpy$L+2,x
8617  1f65 a6f9          	ld	a,#low(L1653)
8618  1f67 b703          	ld	_memcpy$L+3,a
8619  1f69 a614          	ld	a,#low(_m_strString1)
8620  1f6b ae14          	ld	x,#high(_m_strString1)
8621  1f6d cd0000        	call	_memcpy
8623                     ; 1310 					memcpy(m_strString2, "      mm/100", 20);
8625  1f70 a614          	ld	a,#20
8626  1f72 b704          	ld	_memcpy$L+4,a
8627  1f74 aecf          	ld	x,#high(L1153)
8628  1f76 bf02          	ld	_memcpy$L+2,x
8629  1f78 a6cf          	ld	a,#low(L1153)
8630  1f7a b703          	ld	_memcpy$L+3,a
8631  1f7c a600          	ld	a,#low(_m_strString2)
8632  1f7e ae00          	ld	x,#high(_m_strString2)
8633  1f80 cd0000        	call	_memcpy
8635                     ; 1311 					break;
8637  1f83 cc26f5        	jp	L5743
8638  1f86               L7033:
8639                     ; 1312 				case SCREEN_STD_MSG_DIRECTION_A:
8639                     ; 1313 					memcpy(m_strString1, "Vorwats", 20);
8641  1f86 a614          	ld	a,#20
8642  1f88 b704          	ld	_memcpy$L+4,a
8643  1f8a aef1          	ld	x,#high(L3653)
8644  1f8c bf02          	ld	_memcpy$L+2,x
8645  1f8e a6f1          	ld	a,#low(L3653)
8646  1f90 b703          	ld	_memcpy$L+3,a
8647  1f92 a614          	ld	a,#low(_m_strString1)
8648  1f94 ae14          	ld	x,#high(_m_strString1)
8649  1f96 cd0000        	call	_memcpy
8651                     ; 1314 					memcpy(m_strString2, "      mm/100", 20);
8653  1f99 a614          	ld	a,#20
8654  1f9b b704          	ld	_memcpy$L+4,a
8655  1f9d aecf          	ld	x,#high(L1153)
8656  1f9f bf02          	ld	_memcpy$L+2,x
8657  1fa1 a6cf          	ld	a,#low(L1153)
8658  1fa3 b703          	ld	_memcpy$L+3,a
8659  1fa5 a600          	ld	a,#low(_m_strString2)
8660  1fa7 ae00          	ld	x,#high(_m_strString2)
8661  1fa9 cd0000        	call	_memcpy
8663                     ; 1315 					break;
8665  1fac cc26f5        	jp	L5743
8666  1faf               L1133:
8667                     ; 1316 				case SCREEN_STD_MSG_DIRECTION_O:
8667                     ; 1317 					memcpy(m_strString1, "Machin Fuhrer", 20);
8669  1faf a614          	ld	a,#20
8670  1fb1 b704          	ld	_memcpy$L+4,a
8671  1fb3 aee3          	ld	x,#high(L5653)
8672  1fb5 bf02          	ld	_memcpy$L+2,x
8673  1fb7 a6e3          	ld	a,#low(L5653)
8674  1fb9 b703          	ld	_memcpy$L+3,a
8675  1fbb a614          	ld	a,#low(_m_strString1)
8676  1fbd ae14          	ld	x,#high(_m_strString1)
8677  1fbf cd0000        	call	_memcpy
8679                     ; 1318 					memcpy(m_strString2, "      mm/100", 20);
8681  1fc2 a614          	ld	a,#20
8682  1fc4 b704          	ld	_memcpy$L+4,a
8683  1fc6 aecf          	ld	x,#high(L1153)
8684  1fc8 bf02          	ld	_memcpy$L+2,x
8685  1fca a6cf          	ld	a,#low(L1153)
8686  1fcc b703          	ld	_memcpy$L+3,a
8687  1fce a600          	ld	a,#low(_m_strString2)
8688  1fd0 ae00          	ld	x,#high(_m_strString2)
8689  1fd2 cd0000        	call	_memcpy
8691                     ; 1319 					break;
8693  1fd5 cc26f5        	jp	L5743
8694  1fd8               L3133:
8695                     ; 1320 				case SCREEN_STD_MSG_DIRECTION_T:
8695                     ; 1321 					memcpy(m_strString1, "Ubertragung", 20);
8697  1fd8 a614          	ld	a,#20
8698  1fda b704          	ld	_memcpy$L+4,a
8699  1fdc aed7          	ld	x,#high(L7653)
8700  1fde bf02          	ld	_memcpy$L+2,x
8701  1fe0 a6d7          	ld	a,#low(L7653)
8702  1fe2 b703          	ld	_memcpy$L+3,a
8703  1fe4 a614          	ld	a,#low(_m_strString1)
8704  1fe6 ae14          	ld	x,#high(_m_strString1)
8705  1fe8 cd0000        	call	_memcpy
8707                     ; 1322 					memcpy(m_strString2, "      mm/100", 20);
8709  1feb a614          	ld	a,#20
8710  1fed b704          	ld	_memcpy$L+4,a
8711  1fef aecf          	ld	x,#high(L1153)
8712  1ff1 bf02          	ld	_memcpy$L+2,x
8713  1ff3 a6cf          	ld	a,#low(L1153)
8714  1ff5 b703          	ld	_memcpy$L+3,a
8715  1ff7 a600          	ld	a,#low(_m_strString2)
8716  1ff9 ae00          	ld	x,#high(_m_strString2)
8717  1ffb cd0000        	call	_memcpy
8719                     ; 1323 					break;
8721  1ffe cc26f5        	jp	L5743
8722  2001               L5133:
8723                     ; 1324 				case SCREEN_STD_MSG_DIRECTION_I:
8723                     ; 1325 					memcpy(m_strString1, "Spannung Erchöhen", 20);
8725  2001 a614          	ld	a,#20
8726  2003 b704          	ld	_memcpy$L+4,a
8727  2005 aec5          	ld	x,#high(L1753)
8728  2007 bf02          	ld	_memcpy$L+2,x
8729  2009 a6c5          	ld	a,#low(L1753)
8730  200b b703          	ld	_memcpy$L+3,a
8731  200d a614          	ld	a,#low(_m_strString1)
8732  200f ae14          	ld	x,#high(_m_strString1)
8733  2011 cd0000        	call	_memcpy
8735                     ; 1326 					memcpy(m_strString2, "      mt/min", 20);
8737  2014 a614          	ld	a,#20
8738  2016 b704          	ld	_memcpy$L+4,a
8739  2018 ae7e          	ld	x,#high(L1353)
8740  201a bf02          	ld	_memcpy$L+2,x
8741  201c a67e          	ld	a,#low(L1353)
8742  201e b703          	ld	_memcpy$L+3,a
8743  2020 a600          	ld	a,#low(_m_strString2)
8744  2022 ae00          	ld	x,#high(_m_strString2)
8745  2024 cd0000        	call	_memcpy
8747                     ; 1327 					break;
8749  2027 cc26f5        	jp	L5743
8750  202a               L7133:
8751                     ; 1328 				case SCREEN_STD_MSG_DIRECTION_D:
8751                     ; 1329 					memcpy(m_strString1, "Spannung Vermindern", 20);
8753  202a a614          	ld	a,#20
8754  202c b704          	ld	_memcpy$L+4,a
8755  202e aeb1          	ld	x,#high(L3753)
8756  2030 bf02          	ld	_memcpy$L+2,x
8757  2032 a6b1          	ld	a,#low(L3753)
8758  2034 b703          	ld	_memcpy$L+3,a
8759  2036 a614          	ld	a,#low(_m_strString1)
8760  2038 ae14          	ld	x,#high(_m_strString1)
8761  203a cd0000        	call	_memcpy
8763                     ; 1330 					memcpy(m_strString2, "      mt/min", 20);
8765  203d a614          	ld	a,#20
8766  203f b704          	ld	_memcpy$L+4,a
8767  2041 ae7e          	ld	x,#high(L1353)
8768  2043 bf02          	ld	_memcpy$L+2,x
8769  2045 a67e          	ld	a,#low(L1353)
8770  2047 b703          	ld	_memcpy$L+3,a
8771  2049 a600          	ld	a,#low(_m_strString2)
8772  204b ae00          	ld	x,#high(_m_strString2)
8773  204d cd0000        	call	_memcpy
8775                     ; 1331 					break;
8777  2050 cc26f5        	jp	L5743
8778  2053               L1233:
8779                     ; 1332 				case SCREEN_STD_MSG_SAVE_JOB:
8779                     ; 1333 					memcpy(m_strString1, "Arbeit aufbewahren", 20);
8781  2053 a614          	ld	a,#20
8782  2055 b704          	ld	_memcpy$L+4,a
8783  2057 ae9e          	ld	x,#high(L5753)
8784  2059 bf02          	ld	_memcpy$L+2,x
8785  205b a69e          	ld	a,#low(L5753)
8786  205d b703          	ld	_memcpy$L+3,a
8787  205f a614          	ld	a,#low(_m_strString1)
8788  2061 ae14          	ld	x,#high(_m_strString1)
8789  2063 cd0000        	call	_memcpy
8791                     ; 1334 					memcpy(m_strString1, "      Lage mem", 20);
8793  2066 a614          	ld	a,#20
8794  2068 b704          	ld	_memcpy$L+4,a
8795  206a ae8f          	ld	x,#high(L7753)
8796  206c bf02          	ld	_memcpy$L+2,x
8797  206e a68f          	ld	a,#low(L7753)
8798  2070 b703          	ld	_memcpy$L+3,a
8799  2072 a614          	ld	a,#low(_m_strString1)
8800  2074 ae14          	ld	x,#high(_m_strString1)
8801  2076 cd0000        	call	_memcpy
8803                     ; 1335 					break;
8805  2079 cc26f5        	jp	L5743
8806  207c               L3233:
8807                     ; 1336 				case SCREEN_STD_MSG_LOAD_JOB:
8807                     ; 1337 					memcpy(m_strString1, "Arbeit laden", 20);
8809  207c a614          	ld	a,#20
8810  207e b704          	ld	_memcpy$L+4,a
8811  2080 ae82          	ld	x,#high(L1063)
8812  2082 bf02          	ld	_memcpy$L+2,x
8813  2084 a682          	ld	a,#low(L1063)
8814  2086 b703          	ld	_memcpy$L+3,a
8815  2088 a614          	ld	a,#low(_m_strString1)
8816  208a ae14          	ld	x,#high(_m_strString1)
8817  208c cd0000        	call	_memcpy
8819                     ; 1338 					memcpy(m_strString1, "      Lage mem", 20);
8821  208f a614          	ld	a,#20
8822  2091 b704          	ld	_memcpy$L+4,a
8823  2093 ae8f          	ld	x,#high(L7753)
8824  2095 bf02          	ld	_memcpy$L+2,x
8825  2097 a68f          	ld	a,#low(L7753)
8826  2099 b703          	ld	_memcpy$L+3,a
8827  209b a614          	ld	a,#low(_m_strString1)
8828  209d ae14          	ld	x,#high(_m_strString1)
8829  209f cd0000        	call	_memcpy
8831                     ; 1339 					break;
8833  20a2 cc26f5        	jp	L5743
8834  20a5               L5233:
8835                     ; 1340 				case SCREEN_STD_MSG_PARAM_5:
8835                     ; 1341 					memcpy(m_strString1, "Afgangs Spannung", 20);
8837  20a5 a614          	ld	a,#20
8838  20a7 b704          	ld	_memcpy$L+4,a
8839  20a9 ae71          	ld	x,#high(L3063)
8840  20ab bf02          	ld	_memcpy$L+2,x
8841  20ad a671          	ld	a,#low(L3063)
8842  20af b703          	ld	_memcpy$L+3,a
8843  20b1 a614          	ld	a,#low(_m_strString1)
8844  20b3 ae14          	ld	x,#high(_m_strString1)
8845  20b5 cd0000        	call	_memcpy
8847                     ; 1342 					memcpy(m_strString2, "        ", 20);
8849  20b8 a614          	ld	a,#20
8850  20ba b704          	ld	_memcpy$L+4,a
8851  20bc ae2a          	ld	x,#high(L5453)
8852  20be bf02          	ld	_memcpy$L+2,x
8853  20c0 a62a          	ld	a,#low(L5453)
8854  20c2 b703          	ld	_memcpy$L+3,a
8855  20c4 a600          	ld	a,#low(_m_strString2)
8856  20c6 ae00          	ld	x,#high(_m_strString2)
8857  20c8 cd0000        	call	_memcpy
8859                     ; 1343 					break;					
8861  20cb cc26f5        	jp	L5743
8862  20ce               L7233:
8863                     ; 1344 				default:
8863                     ; 1345 					break;
8865  20ce cc26f5        	jp	L5743
8866  20d1               L1553:
8867                     ; 1347 			break;		
8869  20d1 cc26f5        	jp	L5743
8870  20d4               L1333:
8871                     ; 1348 			case PARAM_LANGUAGE_FR: //French
8871                     ; 1349 			switch(a_byStdMessage)
8873  20d4 b600          	ld	a,_screenPrepareStdMessage$L
8875                     ; 1399 				default:
8875                     ; 1400 					break;
8876  20d6 a01d          	sub	a,#29
8877  20d8 a10e          	cp	a,#14
8878  20da 240b          	jruge	L602
8879  20dc 48            	sll	a
8880  20dd 97            	ld	x,a
8881  20de d601fc        	ld	a,(L012+1,x)
8882  20e1 88            	push	a
8883  20e2 d601fb        	ld	a,(L012,x)
8884  20e5 88            	push	a
8885  20e6 81            	ret
8886  20e7               L602:
8887  20e7 a0ee          	sub	a,#-18
8888  20e9 2603          	jrne	L042
8889  20eb cc22b4        	jp	L1633
8890  20ee               L042:
8891  20ee cc26f5        	jp	L5743
8892  20f1               L3333:
8893                     ; 1351 				case SCREEN_STD_MSG_CYLINDER_TRAVEL:
8893                     ; 1352 					memcpy(m_strString1, "Cylindre Dimension", 20);
8895  20f1 a614          	ld	a,#20
8896  20f3 b704          	ld	_memcpy$L+4,a
8897  20f5 ae5e          	ld	x,#high(L1163)
8898  20f7 bf02          	ld	_memcpy$L+2,x
8899  20f9 a65e          	ld	a,#low(L1163)
8900  20fb b703          	ld	_memcpy$L+3,a
8901  20fd a614          	ld	a,#low(_m_strString1)
8902  20ff ae14          	ld	x,#high(_m_strString1)
8903  2101 cd0000        	call	_memcpy
8905                     ; 1353 					memcpy(m_strString2, "        mm", 20);
8907  2104 a614          	ld	a,#20
8908  2106 b704          	ld	_memcpy$L+4,a
8909  2108 aee8          	ld	x,#high(L5053)
8910  210a bf02          	ld	_memcpy$L+2,x
8911  210c a6e8          	ld	a,#low(L5053)
8912  210e b703          	ld	_memcpy$L+3,a
8913  2110 a600          	ld	a,#low(_m_strString2)
8914  2112 ae00          	ld	x,#high(_m_strString2)
8915  2114 cd0000        	call	_memcpy
8917                     ; 1354 					break;
8919  2117 cc26f5        	jp	L5743
8920  211a               L5333:
8921                     ; 1355 				case SCREEN_STD_MSG_ALLARM:
8921                     ; 1356 					memcpy(m_strString1, "Seuil alarme", 20);
8923  211a a614          	ld	a,#20
8924  211c b704          	ld	_memcpy$L+4,a
8925  211e ae51          	ld	x,#high(L3163)
8926  2120 bf02          	ld	_memcpy$L+2,x
8927  2122 a651          	ld	a,#low(L3163)
8928  2124 b703          	ld	_memcpy$L+3,a
8929  2126 a614          	ld	a,#low(_m_strString1)
8930  2128 ae14          	ld	x,#high(_m_strString1)
8931  212a cd0000        	call	_memcpy
8933                     ; 1357 					memcpy(m_strString2, "      mm/100", 20);
8935  212d a614          	ld	a,#20
8936  212f b704          	ld	_memcpy$L+4,a
8937  2131 aecf          	ld	x,#high(L1153)
8938  2133 bf02          	ld	_memcpy$L+2,x
8939  2135 a6cf          	ld	a,#low(L1153)
8940  2137 b703          	ld	_memcpy$L+3,a
8941  2139 a600          	ld	a,#low(_m_strString2)
8942  213b ae00          	ld	x,#high(_m_strString2)
8943  213d cd0000        	call	_memcpy
8945                     ; 1358 					break;
8947  2140 cc26f5        	jp	L5743
8948  2143               L7333:
8949                     ; 1359 				case SCREEN_STD_MSG_GATE_WINDOW:
8949                     ; 1360 					memcpy(m_strString1, "Ampleur gate", 20);
8951  2143 a614          	ld	a,#20
8952  2145 b704          	ld	_memcpy$L+4,a
8953  2147 ae44          	ld	x,#high(L5163)
8954  2149 bf02          	ld	_memcpy$L+2,x
8955  214b a644          	ld	a,#low(L5163)
8956  214d b703          	ld	_memcpy$L+3,a
8957  214f a614          	ld	a,#low(_m_strString1)
8958  2151 ae14          	ld	x,#high(_m_strString1)
8959  2153 cd0000        	call	_memcpy
8961                     ; 1361 					memcpy(m_strString2, "      mm", 20);
8963  2156 a614          	ld	a,#20
8964  2158 b704          	ld	_memcpy$L+4,a
8965  215a aebb          	ld	x,#high(L5153)
8966  215c bf02          	ld	_memcpy$L+2,x
8967  215e a6bb          	ld	a,#low(L5153)
8968  2160 b703          	ld	_memcpy$L+3,a
8969  2162 a600          	ld	a,#low(_m_strString2)
8970  2164 ae00          	ld	x,#high(_m_strString2)
8971  2166 cd0000        	call	_memcpy
8973                     ; 1362 					break;
8975  2169 cc26f5        	jp	L5743
8976  216c               L1433:
8977                     ; 1363 				case SCREEN_STD_MSG_DIRECTION_R:
8977                     ; 1364 					memcpy(m_strString1, "Retard", 20);
8979  216c a614          	ld	a,#20
8980  216e b704          	ld	_memcpy$L+4,a
8981  2170 ae3d          	ld	x,#high(L7163)
8982  2172 bf02          	ld	_memcpy$L+2,x
8983  2174 a63d          	ld	a,#low(L7163)
8984  2176 b703          	ld	_memcpy$L+3,a
8985  2178 a614          	ld	a,#low(_m_strString1)
8986  217a ae14          	ld	x,#high(_m_strString1)
8987  217c cd0000        	call	_memcpy
8989                     ; 1365 					memcpy(m_strString2, "      mm/100", 20);
8991  217f a614          	ld	a,#20
8992  2181 b704          	ld	_memcpy$L+4,a
8993  2183 aecf          	ld	x,#high(L1153)
8994  2185 bf02          	ld	_memcpy$L+2,x
8995  2187 a6cf          	ld	a,#low(L1153)
8996  2189 b703          	ld	_memcpy$L+3,a
8997  218b a600          	ld	a,#low(_m_strString2)
8998  218d ae00          	ld	x,#high(_m_strString2)
8999  218f cd0000        	call	_memcpy
9001                     ; 1366 					break;
9003  2192 cc26f5        	jp	L5743
9004  2195               L3433:
9005                     ; 1367 				case SCREEN_STD_MSG_DIRECTION_A:
9005                     ; 1368 					memcpy(m_strString1, "Avant", 20);
9007  2195 a614          	ld	a,#20
9008  2197 b704          	ld	_memcpy$L+4,a
9009  2199 ae37          	ld	x,#high(L1263)
9010  219b bf02          	ld	_memcpy$L+2,x
9011  219d a637          	ld	a,#low(L1263)
9012  219f b703          	ld	_memcpy$L+3,a
9013  21a1 a614          	ld	a,#low(_m_strString1)
9014  21a3 ae14          	ld	x,#high(_m_strString1)
9015  21a5 cd0000        	call	_memcpy
9017                     ; 1369 					memcpy(m_strString2, "      mm/100", 20);
9019  21a8 a614          	ld	a,#20
9020  21aa b704          	ld	_memcpy$L+4,a
9021  21ac aecf          	ld	x,#high(L1153)
9022  21ae bf02          	ld	_memcpy$L+2,x
9023  21b0 a6cf          	ld	a,#low(L1153)
9024  21b2 b703          	ld	_memcpy$L+3,a
9025  21b4 a600          	ld	a,#low(_m_strString2)
9026  21b6 ae00          	ld	x,#high(_m_strString2)
9027  21b8 cd0000        	call	_memcpy
9029                     ; 1370 					break;
9031  21bb cc26f5        	jp	L5743
9032  21be               L5433:
9033                     ; 1371 				case SCREEN_STD_MSG_DIRECTION_O:
9033                     ; 1372 					memcpy(m_strString1, "Operateur", 20);
9035  21be a614          	ld	a,#20
9036  21c0 b704          	ld	_memcpy$L+4,a
9037  21c2 ae2d          	ld	x,#high(L3263)
9038  21c4 bf02          	ld	_memcpy$L+2,x
9039  21c6 a62d          	ld	a,#low(L3263)
9040  21c8 b703          	ld	_memcpy$L+3,a
9041  21ca a614          	ld	a,#low(_m_strString1)
9042  21cc ae14          	ld	x,#high(_m_strString1)
9043  21ce cd0000        	call	_memcpy
9045                     ; 1373 					memcpy(m_strString2, "      mm/100", 20);
9047  21d1 a614          	ld	a,#20
9048  21d3 b704          	ld	_memcpy$L+4,a
9049  21d5 aecf          	ld	x,#high(L1153)
9050  21d7 bf02          	ld	_memcpy$L+2,x
9051  21d9 a6cf          	ld	a,#low(L1153)
9052  21db b703          	ld	_memcpy$L+3,a
9053  21dd a600          	ld	a,#low(_m_strString2)
9054  21df ae00          	ld	x,#high(_m_strString2)
9055  21e1 cd0000        	call	_memcpy
9057                     ; 1374 					break;
9059  21e4 cc26f5        	jp	L5743
9060  21e7               L7433:
9061                     ; 1375 				case SCREEN_STD_MSG_DIRECTION_T:
9061                     ; 1376 					memcpy(m_strString1, "Trasmission", 20);
9063  21e7 a614          	ld	a,#20
9064  21e9 b704          	ld	_memcpy$L+4,a
9065  21eb ae21          	ld	x,#high(L5263)
9066  21ed bf02          	ld	_memcpy$L+2,x
9067  21ef a621          	ld	a,#low(L5263)
9068  21f1 b703          	ld	_memcpy$L+3,a
9069  21f3 a614          	ld	a,#low(_m_strString1)
9070  21f5 ae14          	ld	x,#high(_m_strString1)
9071  21f7 cd0000        	call	_memcpy
9073                     ; 1377 					memcpy(m_strString2, "      mm/100", 20);
9075  21fa a614          	ld	a,#20
9076  21fc b704          	ld	_memcpy$L+4,a
9077  21fe aecf          	ld	x,#high(L1153)
9078  2200 bf02          	ld	_memcpy$L+2,x
9079  2202 a6cf          	ld	a,#low(L1153)
9080  2204 b703          	ld	_memcpy$L+3,a
9081  2206 a600          	ld	a,#low(_m_strString2)
9082  2208 ae00          	ld	x,#high(_m_strString2)
9083  220a cd0000        	call	_memcpy
9085                     ; 1378 					break;
9087  220d cc26f5        	jp	L5743
9088  2210               L1533:
9089                     ; 1379 				case SCREEN_STD_MSG_DIRECTION_I:
9089                     ; 1380 					memcpy(m_strString1, "Augmenter tension", 20);
9091  2210 a614          	ld	a,#20
9092  2212 b704          	ld	_memcpy$L+4,a
9093  2214 ae0f          	ld	x,#high(L7263)
9094  2216 bf02          	ld	_memcpy$L+2,x
9095  2218 a60f          	ld	a,#low(L7263)
9096  221a b703          	ld	_memcpy$L+3,a
9097  221c a614          	ld	a,#low(_m_strString1)
9098  221e ae14          	ld	x,#high(_m_strString1)
9099  2220 cd0000        	call	_memcpy
9101                     ; 1381 					memcpy(m_strString2, "      mt/min", 20);
9103  2223 a614          	ld	a,#20
9104  2225 b704          	ld	_memcpy$L+4,a
9105  2227 ae7e          	ld	x,#high(L1353)
9106  2229 bf02          	ld	_memcpy$L+2,x
9107  222b a67e          	ld	a,#low(L1353)
9108  222d b703          	ld	_memcpy$L+3,a
9109  222f a600          	ld	a,#low(_m_strString2)
9110  2231 ae00          	ld	x,#high(_m_strString2)
9111  2233 cd0000        	call	_memcpy
9113                     ; 1382 					break;
9115  2236 cc26f5        	jp	L5743
9116  2239               L3533:
9117                     ; 1383 				case SCREEN_STD_MSG_DIRECTION_D:
9117                     ; 1384 					memcpy(m_strString1, "Dimunuer tension", 20);
9119  2239 a614          	ld	a,#20
9120  223b b704          	ld	_memcpy$L+4,a
9121  223d aefe          	ld	x,#high(L1363)
9122  223f bf02          	ld	_memcpy$L+2,x
9123  2241 a6fe          	ld	a,#low(L1363)
9124  2243 b703          	ld	_memcpy$L+3,a
9125  2245 a614          	ld	a,#low(_m_strString1)
9126  2247 ae14          	ld	x,#high(_m_strString1)
9127  2249 cd0000        	call	_memcpy
9129                     ; 1385 					memcpy(m_strString2, "      mt/min", 20);
9131  224c a614          	ld	a,#20
9132  224e b704          	ld	_memcpy$L+4,a
9133  2250 ae7e          	ld	x,#high(L1353)
9134  2252 bf02          	ld	_memcpy$L+2,x
9135  2254 a67e          	ld	a,#low(L1353)
9136  2256 b703          	ld	_memcpy$L+3,a
9137  2258 a600          	ld	a,#low(_m_strString2)
9138  225a ae00          	ld	x,#high(_m_strString2)
9139  225c cd0000        	call	_memcpy
9141                     ; 1386 					break;
9143  225f cc26f5        	jp	L5743
9144  2262               L5533:
9145                     ; 1387 				case SCREEN_STD_MSG_SAVE_JOB:
9145                     ; 1388 					memcpy(m_strString1, "Sauver travail", 20);
9147  2262 a614          	ld	a,#20
9148  2264 b704          	ld	_memcpy$L+4,a
9149  2266 aeef          	ld	x,#high(L3363)
9150  2268 bf02          	ld	_memcpy$L+2,x
9151  226a a6ef          	ld	a,#low(L3363)
9152  226c b703          	ld	_memcpy$L+3,a
9153  226e a614          	ld	a,#low(_m_strString1)
9154  2270 ae14          	ld	x,#high(_m_strString1)
9155  2272 cd0000        	call	_memcpy
9157                     ; 1389 					memcpy(m_strString1, "      position mem.", 20);
9159  2275 a614          	ld	a,#20
9160  2277 b704          	ld	_memcpy$L+4,a
9161  2279 aedb          	ld	x,#high(L5363)
9162  227b bf02          	ld	_memcpy$L+2,x
9163  227d a6db          	ld	a,#low(L5363)
9164  227f b703          	ld	_memcpy$L+3,a
9165  2281 a614          	ld	a,#low(_m_strString1)
9166  2283 ae14          	ld	x,#high(_m_strString1)
9167  2285 cd0000        	call	_memcpy
9169                     ; 1390 					break;
9171  2288 cc26f5        	jp	L5743
9172  228b               L7533:
9173                     ; 1391 				case SCREEN_STD_MSG_LOAD_JOB:
9173                     ; 1392 					memcpy(m_strString1, "Chargement travail", 20);
9175  228b a614          	ld	a,#20
9176  228d b704          	ld	_memcpy$L+4,a
9177  228f aec8          	ld	x,#high(L7363)
9178  2291 bf02          	ld	_memcpy$L+2,x
9179  2293 a6c8          	ld	a,#low(L7363)
9180  2295 b703          	ld	_memcpy$L+3,a
9181  2297 a614          	ld	a,#low(_m_strString1)
9182  2299 ae14          	ld	x,#high(_m_strString1)
9183  229b cd0000        	call	_memcpy
9185                     ; 1393 					memcpy(m_strString1, "      position mem.", 20);
9187  229e a614          	ld	a,#20
9188  22a0 b704          	ld	_memcpy$L+4,a
9189  22a2 aedb          	ld	x,#high(L5363)
9190  22a4 bf02          	ld	_memcpy$L+2,x
9191  22a6 a6db          	ld	a,#low(L5363)
9192  22a8 b703          	ld	_memcpy$L+3,a
9193  22aa a614          	ld	a,#low(_m_strString1)
9194  22ac ae14          	ld	x,#high(_m_strString1)
9195  22ae cd0000        	call	_memcpy
9197                     ; 1394 					break;
9199  22b1 cc26f5        	jp	L5743
9200  22b4               L1633:
9201                     ; 1395 				case SCREEN_STD_MSG_PARAM_5:
9201                     ; 1396 					memcpy(m_strString1, "Tension initial", 20);
9203  22b4 a614          	ld	a,#20
9204  22b6 b704          	ld	_memcpy$L+4,a
9205  22b8 aeb8          	ld	x,#high(L1463)
9206  22ba bf02          	ld	_memcpy$L+2,x
9207  22bc a6b8          	ld	a,#low(L1463)
9208  22be b703          	ld	_memcpy$L+3,a
9209  22c0 a614          	ld	a,#low(_m_strString1)
9210  22c2 ae14          	ld	x,#high(_m_strString1)
9211  22c4 cd0000        	call	_memcpy
9213                     ; 1397 					memcpy(m_strString2, "        ", 20);
9215  22c7 a614          	ld	a,#20
9216  22c9 b704          	ld	_memcpy$L+4,a
9217  22cb ae2a          	ld	x,#high(L5453)
9218  22cd bf02          	ld	_memcpy$L+2,x
9219  22cf a62a          	ld	a,#low(L5453)
9220  22d1 b703          	ld	_memcpy$L+3,a
9221  22d3 a600          	ld	a,#low(_m_strString2)
9222  22d5 ae00          	ld	x,#high(_m_strString2)
9223  22d7 cd0000        	call	_memcpy
9225                     ; 1398 					break;					
9227  22da cc26f5        	jp	L5743
9228  22dd               L3633:
9229                     ; 1399 				default:
9229                     ; 1400 					break;
9231  22dd cc26f5        	jp	L5743
9232  22e0               L7063:
9233                     ; 1402 			break;
9235  22e0 cc26f5        	jp	L5743
9236  22e3               L5633:
9237                     ; 1404 		case PARAM_LANGUAGE_ES: //Spanish
9237                     ; 1405 			switch(a_byStdMessage)
9239  22e3 b600          	ld	a,_screenPrepareStdMessage$L
9241                     ; 1455 				default:
9241                     ; 1456 					break;
9242  22e5 a01d          	sub	a,#29
9243  22e7 a10e          	cp	a,#14
9244  22e9 240b          	jruge	L212
9245  22eb 48            	sll	a
9246  22ec 97            	ld	x,a
9247  22ed d60218        	ld	a,(L412+1,x)
9248  22f0 88            	push	a
9249  22f1 d60217        	ld	a,(L412,x)
9250  22f4 88            	push	a
9251  22f5 81            	ret
9252  22f6               L212:
9253  22f6 a0ee          	sub	a,#-18
9254  22f8 2603          	jrne	L242
9255  22fa cc24c3        	jp	L5143
9256  22fd               L242:
9257  22fd cc26f5        	jp	L5743
9258  2300               L7633:
9259                     ; 1407 				case SCREEN_STD_MSG_CYLINDER_TRAVEL:
9259                     ; 1408 					memcpy(m_strString1, "Cilindro Desarrollo", 20);
9261  2300 a614          	ld	a,#20
9262  2302 b704          	ld	_memcpy$L+4,a
9263  2304 aea4          	ld	x,#high(L7463)
9264  2306 bf02          	ld	_memcpy$L+2,x
9265  2308 a6a4          	ld	a,#low(L7463)
9266  230a b703          	ld	_memcpy$L+3,a
9267  230c a614          	ld	a,#low(_m_strString1)
9268  230e ae14          	ld	x,#high(_m_strString1)
9269  2310 cd0000        	call	_memcpy
9271                     ; 1409 					memcpy(m_strString2, "        mm", 20);
9273  2313 a614          	ld	a,#20
9274  2315 b704          	ld	_memcpy$L+4,a
9275  2317 aee8          	ld	x,#high(L5053)
9276  2319 bf02          	ld	_memcpy$L+2,x
9277  231b a6e8          	ld	a,#low(L5053)
9278  231d b703          	ld	_memcpy$L+3,a
9279  231f a600          	ld	a,#low(_m_strString2)
9280  2321 ae00          	ld	x,#high(_m_strString2)
9281  2323 cd0000        	call	_memcpy
9283                     ; 1410 					break;
9285  2326 cc26f5        	jp	L5743
9286  2329               L1733:
9287                     ; 1411 				case SCREEN_STD_MSG_ALLARM:
9287                     ; 1412 					memcpy(m_strString1, "Umbral alarma", 20);
9289  2329 a614          	ld	a,#20
9290  232b b704          	ld	_memcpy$L+4,a
9291  232d ae96          	ld	x,#high(L1563)
9292  232f bf02          	ld	_memcpy$L+2,x
9293  2331 a696          	ld	a,#low(L1563)
9294  2333 b703          	ld	_memcpy$L+3,a
9295  2335 a614          	ld	a,#low(_m_strString1)
9296  2337 ae14          	ld	x,#high(_m_strString1)
9297  2339 cd0000        	call	_memcpy
9299                     ; 1413 					memcpy(m_strString2, "      mm/100", 20);
9301  233c a614          	ld	a,#20
9302  233e b704          	ld	_memcpy$L+4,a
9303  2340 aecf          	ld	x,#high(L1153)
9304  2342 bf02          	ld	_memcpy$L+2,x
9305  2344 a6cf          	ld	a,#low(L1153)
9306  2346 b703          	ld	_memcpy$L+3,a
9307  2348 a600          	ld	a,#low(_m_strString2)
9308  234a ae00          	ld	x,#high(_m_strString2)
9309  234c cd0000        	call	_memcpy
9311                     ; 1414 					break;
9313  234f cc26f5        	jp	L5743
9314  2352               L3733:
9315                     ; 1415 				case SCREEN_STD_MSG_GATE_WINDOW:
9315                     ; 1416 					memcpy(m_strString1, "Espacio gate", 20);
9317  2352 a614          	ld	a,#20
9318  2354 b704          	ld	_memcpy$L+4,a
9319  2356 ae89          	ld	x,#high(L3563)
9320  2358 bf02          	ld	_memcpy$L+2,x
9321  235a a689          	ld	a,#low(L3563)
9322  235c b703          	ld	_memcpy$L+3,a
9323  235e a614          	ld	a,#low(_m_strString1)
9324  2360 ae14          	ld	x,#high(_m_strString1)
9325  2362 cd0000        	call	_memcpy
9327                     ; 1417 					memcpy(m_strString2, "      mm", 20);
9329  2365 a614          	ld	a,#20
9330  2367 b704          	ld	_memcpy$L+4,a
9331  2369 aebb          	ld	x,#high(L5153)
9332  236b bf02          	ld	_memcpy$L+2,x
9333  236d a6bb          	ld	a,#low(L5153)
9334  236f b703          	ld	_memcpy$L+3,a
9335  2371 a600          	ld	a,#low(_m_strString2)
9336  2373 ae00          	ld	x,#high(_m_strString2)
9337  2375 cd0000        	call	_memcpy
9339                     ; 1418 					break;
9341  2378 cc26f5        	jp	L5743
9342  237b               L5733:
9343                     ; 1419 				case SCREEN_STD_MSG_DIRECTION_R:
9343                     ; 1420 					memcpy(m_strString1, "Retardo", 20);
9345  237b a614          	ld	a,#20
9346  237d b704          	ld	_memcpy$L+4,a
9347  237f ae81          	ld	x,#high(L5563)
9348  2381 bf02          	ld	_memcpy$L+2,x
9349  2383 a681          	ld	a,#low(L5563)
9350  2385 b703          	ld	_memcpy$L+3,a
9351  2387 a614          	ld	a,#low(_m_strString1)
9352  2389 ae14          	ld	x,#high(_m_strString1)
9353  238b cd0000        	call	_memcpy
9355                     ; 1421 					memcpy(m_strString2, "      mm/100", 20);
9357  238e a614          	ld	a,#20
9358  2390 b704          	ld	_memcpy$L+4,a
9359  2392 aecf          	ld	x,#high(L1153)
9360  2394 bf02          	ld	_memcpy$L+2,x
9361  2396 a6cf          	ld	a,#low(L1153)
9362  2398 b703          	ld	_memcpy$L+3,a
9363  239a a600          	ld	a,#low(_m_strString2)
9364  239c ae00          	ld	x,#high(_m_strString2)
9365  239e cd0000        	call	_memcpy
9367                     ; 1422 					break;
9369  23a1 cc26f5        	jp	L5743
9370  23a4               L7733:
9371                     ; 1423 				case SCREEN_STD_MSG_DIRECTION_A:
9371                     ; 1424 					memcpy(m_strString1, "Adelante", 20);
9373  23a4 a614          	ld	a,#20
9374  23a6 b704          	ld	_memcpy$L+4,a
9375  23a8 ae78          	ld	x,#high(L7563)
9376  23aa bf02          	ld	_memcpy$L+2,x
9377  23ac a678          	ld	a,#low(L7563)
9378  23ae b703          	ld	_memcpy$L+3,a
9379  23b0 a614          	ld	a,#low(_m_strString1)
9380  23b2 ae14          	ld	x,#high(_m_strString1)
9381  23b4 cd0000        	call	_memcpy
9383                     ; 1425 					memcpy(m_strString2, "      mm/100", 20);
9385  23b7 a614          	ld	a,#20
9386  23b9 b704          	ld	_memcpy$L+4,a
9387  23bb aecf          	ld	x,#high(L1153)
9388  23bd bf02          	ld	_memcpy$L+2,x
9389  23bf a6cf          	ld	a,#low(L1153)
9390  23c1 b703          	ld	_memcpy$L+3,a
9391  23c3 a600          	ld	a,#low(_m_strString2)
9392  23c5 ae00          	ld	x,#high(_m_strString2)
9393  23c7 cd0000        	call	_memcpy
9395                     ; 1426 					break;
9397  23ca cc26f5        	jp	L5743
9398  23cd               L1043:
9399                     ; 1427 				case SCREEN_STD_MSG_DIRECTION_O:
9399                     ; 1428 					memcpy(m_strString1, "Operador", 20);
9401  23cd a614          	ld	a,#20
9402  23cf b704          	ld	_memcpy$L+4,a
9403  23d1 ae6f          	ld	x,#high(L1663)
9404  23d3 bf02          	ld	_memcpy$L+2,x
9405  23d5 a66f          	ld	a,#low(L1663)
9406  23d7 b703          	ld	_memcpy$L+3,a
9407  23d9 a614          	ld	a,#low(_m_strString1)
9408  23db ae14          	ld	x,#high(_m_strString1)
9409  23dd cd0000        	call	_memcpy
9411                     ; 1429 					memcpy(m_strString2, "      mm/100", 20);
9413  23e0 a614          	ld	a,#20
9414  23e2 b704          	ld	_memcpy$L+4,a
9415  23e4 aecf          	ld	x,#high(L1153)
9416  23e6 bf02          	ld	_memcpy$L+2,x
9417  23e8 a6cf          	ld	a,#low(L1153)
9418  23ea b703          	ld	_memcpy$L+3,a
9419  23ec a600          	ld	a,#low(_m_strString2)
9420  23ee ae00          	ld	x,#high(_m_strString2)
9421  23f0 cd0000        	call	_memcpy
9423                     ; 1430 					break;
9425  23f3 cc26f5        	jp	L5743
9426  23f6               L3043:
9427                     ; 1431 				case SCREEN_STD_MSG_DIRECTION_T:
9427                     ; 1432 					memcpy(m_strString1, "Transmision", 20);
9429  23f6 a614          	ld	a,#20
9430  23f8 b704          	ld	_memcpy$L+4,a
9431  23fa ae63          	ld	x,#high(L3663)
9432  23fc bf02          	ld	_memcpy$L+2,x
9433  23fe a663          	ld	a,#low(L3663)
9434  2400 b703          	ld	_memcpy$L+3,a
9435  2402 a614          	ld	a,#low(_m_strString1)
9436  2404 ae14          	ld	x,#high(_m_strString1)
9437  2406 cd0000        	call	_memcpy
9439                     ; 1433 					memcpy(m_strString2, "      mm/100", 20);
9441  2409 a614          	ld	a,#20
9442  240b b704          	ld	_memcpy$L+4,a
9443  240d aecf          	ld	x,#high(L1153)
9444  240f bf02          	ld	_memcpy$L+2,x
9445  2411 a6cf          	ld	a,#low(L1153)
9446  2413 b703          	ld	_memcpy$L+3,a
9447  2415 a600          	ld	a,#low(_m_strString2)
9448  2417 ae00          	ld	x,#high(_m_strString2)
9449  2419 cd0000        	call	_memcpy
9451                     ; 1434 					break;
9453  241c cc26f5        	jp	L5743
9454  241f               L5043:
9455                     ; 1435 				case SCREEN_STD_MSG_DIRECTION_I:
9455                     ; 1436 					memcpy(m_strString1, "Incremento tension", 20);
9457  241f a614          	ld	a,#20
9458  2421 b704          	ld	_memcpy$L+4,a
9459  2423 ae50          	ld	x,#high(L5663)
9460  2425 bf02          	ld	_memcpy$L+2,x
9461  2427 a650          	ld	a,#low(L5663)
9462  2429 b703          	ld	_memcpy$L+3,a
9463  242b a614          	ld	a,#low(_m_strString1)
9464  242d ae14          	ld	x,#high(_m_strString1)
9465  242f cd0000        	call	_memcpy
9467                     ; 1437 					memcpy(m_strString2, "      mt/min", 20);
9469  2432 a614          	ld	a,#20
9470  2434 b704          	ld	_memcpy$L+4,a
9471  2436 ae7e          	ld	x,#high(L1353)
9472  2438 bf02          	ld	_memcpy$L+2,x
9473  243a a67e          	ld	a,#low(L1353)
9474  243c b703          	ld	_memcpy$L+3,a
9475  243e a600          	ld	a,#low(_m_strString2)
9476  2440 ae00          	ld	x,#high(_m_strString2)
9477  2442 cd0000        	call	_memcpy
9479                     ; 1438 					break;
9481  2445 cc26f5        	jp	L5743
9482  2448               L7043:
9483                     ; 1439 				case SCREEN_STD_MSG_DIRECTION_D:
9483                     ; 1440 					memcpy(m_strString1, "Decremento tension", 20);
9485  2448 a614          	ld	a,#20
9486  244a b704          	ld	_memcpy$L+4,a
9487  244c ae3d          	ld	x,#high(L7663)
9488  244e bf02          	ld	_memcpy$L+2,x
9489  2450 a63d          	ld	a,#low(L7663)
9490  2452 b703          	ld	_memcpy$L+3,a
9491  2454 a614          	ld	a,#low(_m_strString1)
9492  2456 ae14          	ld	x,#high(_m_strString1)
9493  2458 cd0000        	call	_memcpy
9495                     ; 1441 					memcpy(m_strString2, "      mt/min", 20);
9497  245b a614          	ld	a,#20
9498  245d b704          	ld	_memcpy$L+4,a
9499  245f ae7e          	ld	x,#high(L1353)
9500  2461 bf02          	ld	_memcpy$L+2,x
9501  2463 a67e          	ld	a,#low(L1353)
9502  2465 b703          	ld	_memcpy$L+3,a
9503  2467 a600          	ld	a,#low(_m_strString2)
9504  2469 ae00          	ld	x,#high(_m_strString2)
9505  246b cd0000        	call	_memcpy
9507                     ; 1442 					break;
9509  246e cc26f5        	jp	L5743
9510  2471               L1143:
9511                     ; 1443 				case SCREEN_STD_MSG_SAVE_JOB:
9511                     ; 1444 					memcpy(m_strString1, "Salvar labor", 20);
9513  2471 a614          	ld	a,#20
9514  2473 b704          	ld	_memcpy$L+4,a
9515  2475 ae30          	ld	x,#high(L1763)
9516  2477 bf02          	ld	_memcpy$L+2,x
9517  2479 a630          	ld	a,#low(L1763)
9518  247b b703          	ld	_memcpy$L+3,a
9519  247d a614          	ld	a,#low(_m_strString1)
9520  247f ae14          	ld	x,#high(_m_strString1)
9521  2481 cd0000        	call	_memcpy
9523                     ; 1445 					memcpy(m_strString1, "      posicion mem.", 20);
9525  2484 a614          	ld	a,#20
9526  2486 b704          	ld	_memcpy$L+4,a
9527  2488 ae1c          	ld	x,#high(L3763)
9528  248a bf02          	ld	_memcpy$L+2,x
9529  248c a61c          	ld	a,#low(L3763)
9530  248e b703          	ld	_memcpy$L+3,a
9531  2490 a614          	ld	a,#low(_m_strString1)
9532  2492 ae14          	ld	x,#high(_m_strString1)
9533  2494 cd0000        	call	_memcpy
9535                     ; 1446 					break;
9537  2497 cc26f5        	jp	L5743
9538  249a               L3143:
9539                     ; 1447 				case SCREEN_STD_MSG_LOAD_JOB:
9539                     ; 1448 					memcpy(m_strString1, "Cargar labor", 20);
9541  249a a614          	ld	a,#20
9542  249c b704          	ld	_memcpy$L+4,a
9543  249e ae0f          	ld	x,#high(L5763)
9544  24a0 bf02          	ld	_memcpy$L+2,x
9545  24a2 a60f          	ld	a,#low(L5763)
9546  24a4 b703          	ld	_memcpy$L+3,a
9547  24a6 a614          	ld	a,#low(_m_strString1)
9548  24a8 ae14          	ld	x,#high(_m_strString1)
9549  24aa cd0000        	call	_memcpy
9551                     ; 1449 					memcpy(m_strString1, "      posicion mem.", 20);
9553  24ad a614          	ld	a,#20
9554  24af b704          	ld	_memcpy$L+4,a
9555  24b1 ae1c          	ld	x,#high(L3763)
9556  24b3 bf02          	ld	_memcpy$L+2,x
9557  24b5 a61c          	ld	a,#low(L3763)
9558  24b7 b703          	ld	_memcpy$L+3,a
9559  24b9 a614          	ld	a,#low(_m_strString1)
9560  24bb ae14          	ld	x,#high(_m_strString1)
9561  24bd cd0000        	call	_memcpy
9563                     ; 1450 					break;
9565  24c0 cc26f5        	jp	L5743
9566  24c3               L5143:
9567                     ; 1451 				case SCREEN_STD_MSG_PARAM_5:
9567                     ; 1452 					memcpy(m_strString1, "Tension inicial", 20);
9569  24c3 a614          	ld	a,#20
9570  24c5 b704          	ld	_memcpy$L+4,a
9571  24c7 aeff          	ld	x,#high(L7763)
9572  24c9 bf02          	ld	_memcpy$L+2,x
9573  24cb a6ff          	ld	a,#low(L7763)
9574  24cd b703          	ld	_memcpy$L+3,a
9575  24cf a614          	ld	a,#low(_m_strString1)
9576  24d1 ae14          	ld	x,#high(_m_strString1)
9577  24d3 cd0000        	call	_memcpy
9579                     ; 1453 					memcpy(m_strString2, "        ", 20);
9581  24d6 a614          	ld	a,#20
9582  24d8 b704          	ld	_memcpy$L+4,a
9583  24da ae2a          	ld	x,#high(L5453)
9584  24dc bf02          	ld	_memcpy$L+2,x
9585  24de a62a          	ld	a,#low(L5453)
9586  24e0 b703          	ld	_memcpy$L+3,a
9587  24e2 a600          	ld	a,#low(_m_strString2)
9588  24e4 ae00          	ld	x,#high(_m_strString2)
9589  24e6 cd0000        	call	_memcpy
9591                     ; 1454 					break;					
9593  24e9 cc26f5        	jp	L5743
9594  24ec               L7143:
9595                     ; 1455 				default:
9595                     ; 1456 					break;
9597  24ec cc26f5        	jp	L5743
9598  24ef               L5463:
9599                     ; 1458 			break;			
9601  24ef cc26f5        	jp	L5743
9602  24f2               L1243:
9603                     ; 1459 		default:  	//PARAM_LANGUAGE_IT - Italian
9603                     ; 1460 			switch(a_byStdMessage)
9605  24f2 b600          	ld	a,_screenPrepareStdMessage$L
9607                     ; 1510 				default:
9607                     ; 1511 					break;
9608  24f4 a01d          	sub	a,#29
9609  24f6 a10e          	cp	a,#14
9610  24f8 240b          	jruge	L612
9611  24fa 48            	sll	a
9612  24fb 97            	ld	x,a
9613  24fc d60234        	ld	a,(L022+1,x)
9614  24ff 88            	push	a
9615  2500 d60233        	ld	a,(L022,x)
9616  2503 88            	push	a
9617  2504 81            	ret
9618  2505               L612:
9619  2505 a0ee          	sub	a,#-18
9620  2507 2603          	jrne	L442
9621  2509 cc26cf        	jp	L1543
9622  250c               L442:
9623  250c cc26f5        	jp	L5743
9624  250f               L3243:
9625                     ; 1462 				case SCREEN_STD_MSG_CYLINDER_TRAVEL:
9625                     ; 1463 					memcpy(m_strString1, "Sviluppo Cilindro", 20);
9627  250f a614          	ld	a,#20
9628  2511 b704          	ld	_memcpy$L+4,a
9629  2513 aeed          	ld	x,#high(L5073)
9630  2515 bf02          	ld	_memcpy$L+2,x
9631  2517 a6ed          	ld	a,#low(L5073)
9632  2519 b703          	ld	_memcpy$L+3,a
9633  251b a614          	ld	a,#low(_m_strString1)
9634  251d ae14          	ld	x,#high(_m_strString1)
9635  251f cd0000        	call	_memcpy
9637                     ; 1464 					memcpy(m_strString2, "        mm", 20);
9639  2522 a614          	ld	a,#20
9640  2524 b704          	ld	_memcpy$L+4,a
9641  2526 aee8          	ld	x,#high(L5053)
9642  2528 bf02          	ld	_memcpy$L+2,x
9643  252a a6e8          	ld	a,#low(L5053)
9644  252c b703          	ld	_memcpy$L+3,a
9645  252e a600          	ld	a,#low(_m_strString2)
9646  2530 ae00          	ld	x,#high(_m_strString2)
9647  2532 cd0000        	call	_memcpy
9649                     ; 1465 					break;
9651  2535 cc26f5        	jp	L5743
9652  2538               L5243:
9653                     ; 1466 				case SCREEN_STD_MSG_ALLARM:
9653                     ; 1467 					memcpy(m_strString1, "Soglia d'allarme", 20);
9655  2538 a614          	ld	a,#20
9656  253a b704          	ld	_memcpy$L+4,a
9657  253c aedc          	ld	x,#high(L7073)
9658  253e bf02          	ld	_memcpy$L+2,x
9659  2540 a6dc          	ld	a,#low(L7073)
9660  2542 b703          	ld	_memcpy$L+3,a
9661  2544 a614          	ld	a,#low(_m_strString1)
9662  2546 ae14          	ld	x,#high(_m_strString1)
9663  2548 cd0000        	call	_memcpy
9665                     ; 1468 					memcpy(m_strString2, "      mm/100", 20);
9667  254b a614          	ld	a,#20
9668  254d b704          	ld	_memcpy$L+4,a
9669  254f aecf          	ld	x,#high(L1153)
9670  2551 bf02          	ld	_memcpy$L+2,x
9671  2553 a6cf          	ld	a,#low(L1153)
9672  2555 b703          	ld	_memcpy$L+3,a
9673  2557 a600          	ld	a,#low(_m_strString2)
9674  2559 ae00          	ld	x,#high(_m_strString2)
9675  255b cd0000        	call	_memcpy
9677                     ; 1469 					break;
9679  255e cc26f5        	jp	L5743
9680  2561               L7243:
9681                     ; 1470 				case SCREEN_STD_MSG_GATE_WINDOW:
9681                     ; 1471 					memcpy(m_strString1, "Ampiezza Gate", 20);
9683  2561 a614          	ld	a,#20
9684  2563 b704          	ld	_memcpy$L+4,a
9685  2565 aece          	ld	x,#high(L1173)
9686  2567 bf02          	ld	_memcpy$L+2,x
9687  2569 a6ce          	ld	a,#low(L1173)
9688  256b b703          	ld	_memcpy$L+3,a
9689  256d a614          	ld	a,#low(_m_strString1)
9690  256f ae14          	ld	x,#high(_m_strString1)
9691  2571 cd0000        	call	_memcpy
9693                     ; 1472 					memcpy(m_strString2, "      mm", 20);
9695  2574 a614          	ld	a,#20
9696  2576 b704          	ld	_memcpy$L+4,a
9697  2578 aebb          	ld	x,#high(L5153)
9698  257a bf02          	ld	_memcpy$L+2,x
9699  257c a6bb          	ld	a,#low(L5153)
9700  257e b703          	ld	_memcpy$L+3,a
9701  2580 a600          	ld	a,#low(_m_strString2)
9702  2582 ae00          	ld	x,#high(_m_strString2)
9703  2584 cd0000        	call	_memcpy
9705                     ; 1473 					break;
9707  2587 cc26f5        	jp	L5743
9708  258a               L1343:
9709                     ; 1474 				case SCREEN_STD_MSG_DIRECTION_R:
9709                     ; 1475 					memcpy(m_strString1, "Ritardo", 20);
9711  258a a614          	ld	a,#20
9712  258c b704          	ld	_memcpy$L+4,a
9713  258e aec6          	ld	x,#high(L3173)
9714  2590 bf02          	ld	_memcpy$L+2,x
9715  2592 a6c6          	ld	a,#low(L3173)
9716  2594 b703          	ld	_memcpy$L+3,a
9717  2596 a614          	ld	a,#low(_m_strString1)
9718  2598 ae14          	ld	x,#high(_m_strString1)
9719  259a cd0000        	call	_memcpy
9721                     ; 1476 					memcpy(m_strString2, "      mm/100", 20);
9723  259d a614          	ld	a,#20
9724  259f b704          	ld	_memcpy$L+4,a
9725  25a1 aecf          	ld	x,#high(L1153)
9726  25a3 bf02          	ld	_memcpy$L+2,x
9727  25a5 a6cf          	ld	a,#low(L1153)
9728  25a7 b703          	ld	_memcpy$L+3,a
9729  25a9 a600          	ld	a,#low(_m_strString2)
9730  25ab ae00          	ld	x,#high(_m_strString2)
9731  25ad cd0000        	call	_memcpy
9733                     ; 1477 					break;
9735  25b0 cc26f5        	jp	L5743
9736  25b3               L3343:
9737                     ; 1478 				case SCREEN_STD_MSG_DIRECTION_A:
9737                     ; 1479 					memcpy(m_strString1, "Avanti", 20);
9739  25b3 a614          	ld	a,#20
9740  25b5 b704          	ld	_memcpy$L+4,a
9741  25b7 aebf          	ld	x,#high(L5173)
9742  25b9 bf02          	ld	_memcpy$L+2,x
9743  25bb a6bf          	ld	a,#low(L5173)
9744  25bd b703          	ld	_memcpy$L+3,a
9745  25bf a614          	ld	a,#low(_m_strString1)
9746  25c1 ae14          	ld	x,#high(_m_strString1)
9747  25c3 cd0000        	call	_memcpy
9749                     ; 1480 					memcpy(m_strString2, "      mm/100", 20);
9751  25c6 a614          	ld	a,#20
9752  25c8 b704          	ld	_memcpy$L+4,a
9753  25ca aecf          	ld	x,#high(L1153)
9754  25cc bf02          	ld	_memcpy$L+2,x
9755  25ce a6cf          	ld	a,#low(L1153)
9756  25d0 b703          	ld	_memcpy$L+3,a
9757  25d2 a600          	ld	a,#low(_m_strString2)
9758  25d4 ae00          	ld	x,#high(_m_strString2)
9759  25d6 cd0000        	call	_memcpy
9761                     ; 1481 					break;
9763  25d9 cc26f5        	jp	L5743
9764  25dc               L5343:
9765                     ; 1482 				case SCREEN_STD_MSG_DIRECTION_O:
9765                     ; 1483 					memcpy(m_strString1, "Operatore", 20);
9767  25dc a614          	ld	a,#20
9768  25de b704          	ld	_memcpy$L+4,a
9769  25e0 aeb5          	ld	x,#high(L7173)
9770  25e2 bf02          	ld	_memcpy$L+2,x
9771  25e4 a6b5          	ld	a,#low(L7173)
9772  25e6 b703          	ld	_memcpy$L+3,a
9773  25e8 a614          	ld	a,#low(_m_strString1)
9774  25ea ae14          	ld	x,#high(_m_strString1)
9775  25ec cd0000        	call	_memcpy
9777                     ; 1484 					memcpy(m_strString2, "      mm/100", 20);
9779  25ef a614          	ld	a,#20
9780  25f1 b704          	ld	_memcpy$L+4,a
9781  25f3 aecf          	ld	x,#high(L1153)
9782  25f5 bf02          	ld	_memcpy$L+2,x
9783  25f7 a6cf          	ld	a,#low(L1153)
9784  25f9 b703          	ld	_memcpy$L+3,a
9785  25fb a600          	ld	a,#low(_m_strString2)
9786  25fd ae00          	ld	x,#high(_m_strString2)
9787  25ff cd0000        	call	_memcpy
9789                     ; 1485 					break;
9791  2602 cc26f5        	jp	L5743
9792  2605               L7343:
9793                     ; 1486 				case SCREEN_STD_MSG_DIRECTION_T:
9793                     ; 1487 					memcpy(m_strString1, "Traversa", 20);
9795  2605 a614          	ld	a,#20
9796  2607 b704          	ld	_memcpy$L+4,a
9797  2609 aeac          	ld	x,#high(L1273)
9798  260b bf02          	ld	_memcpy$L+2,x
9799  260d a6ac          	ld	a,#low(L1273)
9800  260f b703          	ld	_memcpy$L+3,a
9801  2611 a614          	ld	a,#low(_m_strString1)
9802  2613 ae14          	ld	x,#high(_m_strString1)
9803  2615 cd0000        	call	_memcpy
9805                     ; 1488 					memcpy(m_strString2, "      mm/100", 20);		
9807  2618 a614          	ld	a,#20
9808  261a b704          	ld	_memcpy$L+4,a
9809  261c aecf          	ld	x,#high(L1153)
9810  261e bf02          	ld	_memcpy$L+2,x
9811  2620 a6cf          	ld	a,#low(L1153)
9812  2622 b703          	ld	_memcpy$L+3,a
9813  2624 a600          	ld	a,#low(_m_strString2)
9814  2626 ae00          	ld	x,#high(_m_strString2)
9815  2628 cd0000        	call	_memcpy
9817                     ; 1489 					break;
9819  262b cc26f5        	jp	L5743
9820  262e               L1443:
9821                     ; 1490 				case SCREEN_STD_MSG_DIRECTION_I:
9821                     ; 1491 					memcpy(m_strString1, "Incrementa tiro", 20);
9823  262e a614          	ld	a,#20
9824  2630 b704          	ld	_memcpy$L+4,a
9825  2632 ae9c          	ld	x,#high(L3273)
9826  2634 bf02          	ld	_memcpy$L+2,x
9827  2636 a69c          	ld	a,#low(L3273)
9828  2638 b703          	ld	_memcpy$L+3,a
9829  263a a614          	ld	a,#low(_m_strString1)
9830  263c ae14          	ld	x,#high(_m_strString1)
9831  263e cd0000        	call	_memcpy
9833                     ; 1492 					memcpy(m_strString2, "      mt/min", 20);
9835  2641 a614          	ld	a,#20
9836  2643 b704          	ld	_memcpy$L+4,a
9837  2645 ae7e          	ld	x,#high(L1353)
9838  2647 bf02          	ld	_memcpy$L+2,x
9839  2649 a67e          	ld	a,#low(L1353)
9840  264b b703          	ld	_memcpy$L+3,a
9841  264d a600          	ld	a,#low(_m_strString2)
9842  264f ae00          	ld	x,#high(_m_strString2)
9843  2651 cd0000        	call	_memcpy
9845                     ; 1493 					break;
9847  2654 cc26f5        	jp	L5743
9848  2657               L3443:
9849                     ; 1494 				case SCREEN_STD_MSG_DIRECTION_D:
9849                     ; 1495 					memcpy(m_strString1, "Decrementa tiro", 20);
9851  2657 a614          	ld	a,#20
9852  2659 b704          	ld	_memcpy$L+4,a
9853  265b ae8c          	ld	x,#high(L5273)
9854  265d bf02          	ld	_memcpy$L+2,x
9855  265f a68c          	ld	a,#low(L5273)
9856  2661 b703          	ld	_memcpy$L+3,a
9857  2663 a614          	ld	a,#low(_m_strString1)
9858  2665 ae14          	ld	x,#high(_m_strString1)
9859  2667 cd0000        	call	_memcpy
9861                     ; 1496 					memcpy(m_strString2, "      mt/min", 20);		
9863  266a a614          	ld	a,#20
9864  266c b704          	ld	_memcpy$L+4,a
9865  266e ae7e          	ld	x,#high(L1353)
9866  2670 bf02          	ld	_memcpy$L+2,x
9867  2672 a67e          	ld	a,#low(L1353)
9868  2674 b703          	ld	_memcpy$L+3,a
9869  2676 a600          	ld	a,#low(_m_strString2)
9870  2678 ae00          	ld	x,#high(_m_strString2)
9871  267a cd0000        	call	_memcpy
9873                     ; 1497 					break;
9875  267d 2076          	jra	L5743
9876  267f               L5443:
9877                     ; 1498 				case SCREEN_STD_MSG_SAVE_JOB:
9877                     ; 1499 					memcpy(m_strString1, "Salva lavoro", 20);
9879  267f a614          	ld	a,#20
9880  2681 b704          	ld	_memcpy$L+4,a
9881  2683 ae7f          	ld	x,#high(L7273)
9882  2685 bf02          	ld	_memcpy$L+2,x
9883  2687 a67f          	ld	a,#low(L7273)
9884  2689 b703          	ld	_memcpy$L+3,a
9885  268b a614          	ld	a,#low(_m_strString1)
9886  268d ae14          	ld	x,#high(_m_strString1)
9887  268f cd0000        	call	_memcpy
9889                     ; 1500 					memcpy(m_strString2, "      posizione mem", 20);		
9891  2692 a614          	ld	a,#20
9892  2694 b704          	ld	_memcpy$L+4,a
9893  2696 ae6b          	ld	x,#high(L1373)
9894  2698 bf02          	ld	_memcpy$L+2,x
9895  269a a66b          	ld	a,#low(L1373)
9896  269c b703          	ld	_memcpy$L+3,a
9897  269e a600          	ld	a,#low(_m_strString2)
9898  26a0 ae00          	ld	x,#high(_m_strString2)
9899  26a2 cd0000        	call	_memcpy
9901                     ; 1501 					break;
9903  26a5 204e          	jra	L5743
9904  26a7               L7443:
9905                     ; 1502 				case SCREEN_STD_MSG_LOAD_JOB:
9905                     ; 1503 					memcpy(m_strString1, "Carica lavoro", 20);
9907  26a7 a614          	ld	a,#20
9908  26a9 b704          	ld	_memcpy$L+4,a
9909  26ab ae5d          	ld	x,#high(L3373)
9910  26ad bf02          	ld	_memcpy$L+2,x
9911  26af a65d          	ld	a,#low(L3373)
9912  26b1 b703          	ld	_memcpy$L+3,a
9913  26b3 a614          	ld	a,#low(_m_strString1)
9914  26b5 ae14          	ld	x,#high(_m_strString1)
9915  26b7 cd0000        	call	_memcpy
9917                     ; 1504 					memcpy(m_strString2, "      posizione mem", 20);							
9919  26ba a614          	ld	a,#20
9920  26bc b704          	ld	_memcpy$L+4,a
9921  26be ae6b          	ld	x,#high(L1373)
9922  26c0 bf02          	ld	_memcpy$L+2,x
9923  26c2 a66b          	ld	a,#low(L1373)
9924  26c4 b703          	ld	_memcpy$L+3,a
9925  26c6 a600          	ld	a,#low(_m_strString2)
9926  26c8 ae00          	ld	x,#high(_m_strString2)
9927  26ca cd0000        	call	_memcpy
9929                     ; 1505 					break;
9931  26cd 2026          	jra	L5743
9932  26cf               L1543:
9933                     ; 1506 				case SCREEN_STD_MSG_PARAM_5:
9933                     ; 1507 					memcpy(m_strString1, "Tiro iniziale", 20);
9935  26cf a614          	ld	a,#20
9936  26d1 b704          	ld	_memcpy$L+4,a
9937  26d3 ae4f          	ld	x,#high(L5373)
9938  26d5 bf02          	ld	_memcpy$L+2,x
9939  26d7 a64f          	ld	a,#low(L5373)
9940  26d9 b703          	ld	_memcpy$L+3,a
9941  26db a614          	ld	a,#low(_m_strString1)
9942  26dd ae14          	ld	x,#high(_m_strString1)
9943  26df cd0000        	call	_memcpy
9945                     ; 1508 					memcpy(m_strString2, "        ", 20);
9947  26e2 a614          	ld	a,#20
9948  26e4 b704          	ld	_memcpy$L+4,a
9949  26e6 ae2a          	ld	x,#high(L5453)
9950  26e8 bf02          	ld	_memcpy$L+2,x
9951  26ea a62a          	ld	a,#low(L5453)
9952  26ec b703          	ld	_memcpy$L+3,a
9953  26ee a600          	ld	a,#low(_m_strString2)
9954  26f0 ae00          	ld	x,#high(_m_strString2)
9955  26f2 cd0000        	call	_memcpy
9957                     ; 1509 					break;					
9959  26f5               L3543:
9960                     ; 1510 				default:
9960                     ; 1511 					break;
9962  26f5               L3073:
9963                     ; 1513 			break;
9965  26f5               L5743:
9966                     ; 1515 }
9969  26f5 81            	ret
10039                     	xdef	_screenPrepareStdMessage
10040                     	xdef	_screenBigMessage
10041                     	switch	.bss
10042  0000               _m_strString2:
10043  0000 000000000000  	ds.b	20
10044                     	xdef	_m_strString2
10045  0014               _m_strString1:
10046  0014 000000000000  	ds.b	20
10047                     	xdef	_m_strString1
10048  0028               _m_byValueChanged:
10049  0028 00            	ds.b	1
10050                     	xdef	_m_byValueChanged
10051  0029               _m_byDecimal:
10052  0029 00            	ds.b	1
10053                     	xdef	_m_byDecimal
10054  002a               _m_bySelectedMenu:
10055  002a 00            	ds.b	1
10056                     	xdef	_m_bySelectedMenu
10057  002b               _m_woCurrentValue:
10058  002b 0000          	ds.b	2
10059                     	xdef	_m_woCurrentValue
10060                     	xdef	_screenKeyCode
10061                     	xdef	_screenDisplayKeyCode
10062                     	xdef	_screenReceivedCode
10063                     	xdef	_screenVersion
10064                     	xdef	_screenArchive
10065                     	xdef	_screenSetUpParameter
10066                     	xdef	_screenValue
10067                     	xdef	_screen6Menus
10068                     	xdef	_screenBigStdMessage
10069                     	xdef	_screenAlarm
10070                     	xdef	_screenRegister
10071                     	xdef	_screenOscilloscope
10072                     	xdef	_screenUpdateCurrentScreen
10073                     	xdef	_screenInit
10074                     	xref	_formatNumberBinary
10075                     	xref	_formatNumber
10076                     	xref	_memcpy
10077                     	xref	_sleepFix
10078                     	xref	_sleepSec
10079                     	xref	_window6Menu
10080                     	xref	_windowSetupParameter
10081                     	xref	_windowForceRepaint
10082                     	xref	_windowRegister
10083                     	xref	_windowOscilloscope
10084                     	xref	_windowAlarm
10085                     	xref	_windowBigMessage
10086                     	xref	_windowCylinderSizeValue
10087                     	xref	_windowDacValue
10088                     	xref	_windowSpeed
10089                     	xref	_windowMode
10090                     	xref	_windowInit
10091                     	xref	_displaySetOutLine
10092                     	xref	_displayClearArea
10093                     	xref	_displayWriteString
10094                     	xref	_displayCmdToDisplay
10095                     	xref	_displayKeyPressedReset
10096                     	xref	_displayGetKeyPressed
10097                     	xref	_parametersInitVisibleFlags
10098                     	xref	_parametersGetLabel
10099                     	xref	_parametersChangedFlagReset
10100                     	xref	_parametersSet
10101                     	xref	_parametersGetValue
10102                     	xref	_parametersLoadJob
10103                     	xref	_parametersSaveJob
10104                     	xref	_STI_SendMessage
10105                     	xref	_STI_GetMessage
10106                     	switch	.const
10107  024f               L5373:
10108  024f 5469726f2069  	dc.b	"Tiro iniziale",0
10109  025d               L3373:
10110  025d 436172696361  	dc.b	"Carica lavoro",0
10111  026b               L1373:
10112  026b 202020202020  	dc.b	"      posizione me"
10113  027d 6d00          	dc.b	"m",0
10114  027f               L7273:
10115  027f 53616c766120  	dc.b	"Salva lavoro",0
10116  028c               L5273:
10117  028c 44656372656d  	dc.b	"Decrementa tiro",0
10118  029c               L3273:
10119  029c 496e6372656d  	dc.b	"Incrementa tiro",0
10120  02ac               L1273:
10121  02ac 547261766572  	dc.b	"Traversa",0
10122  02b5               L7173:
10123  02b5 4f7065726174  	dc.b	"Operatore",0
10124  02bf               L5173:
10125  02bf 4176616e7469  	dc.b	"Avanti",0
10126  02c6               L3173:
10127  02c6 526974617264  	dc.b	"Ritardo",0
10128  02ce               L1173:
10129  02ce 416d7069657a  	dc.b	"Ampiezza Gate",0
10130  02dc               L7073:
10131  02dc 536f676c6961  	dc.b	"Soglia d'allarme",0
10132  02ed               L5073:
10133  02ed 5376696c7570  	dc.b	"Sviluppo Cilindro",0
10134  02ff               L7763:
10135  02ff 54656e73696f  	dc.b	"Tension inicial",0
10136  030f               L5763:
10137  030f 436172676172  	dc.b	"Cargar labor",0
10138  031c               L3763:
10139  031c 202020202020  	dc.b	"      posicion mem"
10140  032e 2e00          	dc.b	".",0
10141  0330               L1763:
10142  0330 53616c766172  	dc.b	"Salvar labor",0
10143  033d               L7663:
10144  033d 44656372656d  	dc.b	"Decremento tension",0
10145  0350               L5663:
10146  0350 496e6372656d  	dc.b	"Incremento tension",0
10147  0363               L3663:
10148  0363 5472616e736d  	dc.b	"Transmision",0
10149  036f               L1663:
10150  036f 4f7065726164  	dc.b	"Operador",0
10151  0378               L7563:
10152  0378 4164656c616e  	dc.b	"Adelante",0
10153  0381               L5563:
10154  0381 526574617264  	dc.b	"Retardo",0
10155  0389               L3563:
10156  0389 457370616369  	dc.b	"Espacio gate",0
10157  0396               L1563:
10158  0396 556d6272616c  	dc.b	"Umbral alarma",0
10159  03a4               L7463:
10160  03a4 43696c696e64  	dc.b	"Cilindro Desarroll"
10161  03b6 6f00          	dc.b	"o",0
10162  03b8               L1463:
10163  03b8 54656e73696f  	dc.b	"Tension initial",0
10164  03c8               L7363:
10165  03c8 436861726765  	dc.b	"Chargement travail",0
10166  03db               L5363:
10167  03db 202020202020  	dc.b	"      position mem"
10168  03ed 2e00          	dc.b	".",0
10169  03ef               L3363:
10170  03ef 536175766572  	dc.b	"Sauver travail",0
10171  03fe               L1363:
10172  03fe 44696d756e75  	dc.b	"Dimunuer tension",0
10173  040f               L7263:
10174  040f 4175676d656e  	dc.b	"Augmenter tension",0
10175  0421               L5263:
10176  0421 547261736d69  	dc.b	"Trasmission",0
10177  042d               L3263:
10178  042d 4f7065726174  	dc.b	"Operateur",0
10179  0437               L1263:
10180  0437 4176616e7400  	dc.b	"Avant",0
10181  043d               L7163:
10182  043d 526574617264  	dc.b	"Retard",0
10183  0444               L5163:
10184  0444 416d706c6575  	dc.b	"Ampleur gate",0
10185  0451               L3163:
10186  0451 536575696c20  	dc.b	"Seuil alarme",0
10187  045e               L1163:
10188  045e 43796c696e64  	dc.b	"Cylindre Dimension",0
10189  0471               L3063:
10190  0471 416667616e67  	dc.b	"Afgangs Spannung",0
10191  0482               L1063:
10192  0482 417262656974  	dc.b	"Arbeit laden",0
10193  048f               L7753:
10194  048f 202020202020  	dc.b	"      Lage mem",0
10195  049e               L5753:
10196  049e 417262656974  	dc.b	"Arbeit aufbewahren",0
10197  04b1               L3753:
10198  04b1 5370616e6e75  	dc.b	"Spannung Verminder"
10199  04c3 6e00          	dc.b	"n",0
10200  04c5               L1753:
10201  04c5 5370616e6e75  	dc.b	"Spannung Erch",246
10202  04d3 68656e00      	dc.b	"hen",0
10203  04d7               L7653:
10204  04d7 556265727472  	dc.b	"Ubertragung",0
10205  04e3               L5653:
10206  04e3 4d616368696e  	dc.b	"Machin Fuhrer",0
10207  04f1               L3653:
10208  04f1 566f72776174  	dc.b	"Vorwats",0
10209  04f9               L1653:
10210  04f9 5665727a6f67  	dc.b	"Verzogerung",0
10211  0505               L7553:
10212  0505 546f72205765  	dc.b	"Tor Weite",0
10213  050f               L5553:
10214  050f 5265672e2041  	dc.b	"Reg. Alarm",0
10215  051a               L3553:
10216  051a 5a796c696e64  	dc.b	"Zylinder Format",0
10217  052a               L5453:
10218  052a 202020202020  	dc.b	"        ",0
10219  0533               L3453:
10220  0533 54656e73696f  	dc.b	"Tension base value",0
10221  0546               L1453:
10222  0546 4c6f6164204a  	dc.b	"Load Job",0
10223  054f               L7353:
10224  054f 202020202020  	dc.b	"      mem. positio"
10225  0561 6e00          	dc.b	"n",0
10226  0563               L5353:
10227  0563 53617665204a  	dc.b	"Save Job",0
10228  056c               L3353:
10229  056c 54656e73696f  	dc.b	"Tension Decrement",0
10230  057e               L1353:
10231  057e 202020202020  	dc.b	"      mt/min",0
10232  058b               L7253:
10233  058b 54656e73696f  	dc.b	"Tension Increment",0
10234  059d               L5253:
10235  059d 4765617200    	dc.b	"Gear",0
10236  05a2               L3253:
10237  05a2 4f7065726174  	dc.b	"Operator",0
10238  05ab               L1253:
10239  05ab 416476616e63  	dc.b	"Advance",0
10240  05b3               L7153:
10241  05b3 526574617264  	dc.b	"Retarde",0
10242  05bb               L5153:
10243  05bb 202020202020  	dc.b	"      mm",0
10244  05c4               L3153:
10245  05c4 476174652077  	dc.b	"Gate width",0
10246  05cf               L1153:
10247  05cf 202020202020  	dc.b	"      mm/100",0
10248  05dc               L7053:
10249  05dc 416c61726d20  	dc.b	"Alarm bound",0
10250  05e8               L5053:
10251  05e8 202020202020  	dc.b	"        mm",0
10252  05f3               L3053:
10253  05f3 43796c696e64  	dc.b	"Cylinder size",0
10254  0601               L7323:
10255  0601 6e6f6e206469  	dc.b	"non disponibile",0
10256  0611               L5323:
10257  0611 4572726f7265  	dc.b	"Errore: Posizione",0
10258  0623               L3323:
10259  0623 6e6f6e206163  	dc.b	"non accettabile",0
10260  0633               L1323:
10261  0633 4572726f7265  	dc.b	"Errore: Valore ",0
10262  0643               L7223:
10263  0643 6572726f7265  	dc.b	"errore",0
10264  064a               L5223:
10265  064a 417a7a657261  	dc.b	"Azzeramento",0
10266  0656               L3223:
10267  0656 73636f6e6f73  	dc.b	"sconosciuto",0
10268  0662               L1223:
10269  0662 436f6d616e64  	dc.b	"Comando eseguito",0
10270  0673               L7123:
10271  0673 506172616d65  	dc.b	"Parametro salvato:",0
10272  0686               L5123:
10273  0686 496e74657276  	dc.b	"Intervallo",0
10274  0691               L3123:
10275  0691 286e6f6e206f  	dc.b	"(non operativo)",0
10276  06a1               L1123:
10277  06a1 436f7272657a  	dc.b	"Correzione Lateral"
10278  06b3 6500          	dc.b	"e",0
10279  06b5               L7023:
10280  06b5 6f7363696c6c  	dc.b	"oscilloscopio",0
10281  06c3               L5023:
10282  06c3 56697375616c  	dc.b	"Visualizzazione",0
10283  06d3               L3023:
10284  06d3 546573742065  	dc.b	"Test eseguito",0
10285  06e1               L1023:
10286  06e1 7365676e6f20  	dc.b	"segno doppio",0
10287  06ee               L7713:
10288  06ee 4572726f7265  	dc.b	"Errore test",0
10289  06fa               L5713:
10290  06fa 4d6163636869  	dc.b	"Macchina non ferma",0
10291  070d               L3713:
10292  070d 4572726f7265  	dc.b	"Errore fasatura",0
10293  071d               L1713:
10294  071d 74726f70706f  	dc.b	"troppo elevata ",0
10295  072d               L7613:
10296  072d 4572726f7265  	dc.b	"Errore: Velocita'",0
10297  073f               L5613:
10298  073f 4d6163636869  	dc.b	"Macchina ferma",0
10299  074e               L3613:
10300  074e 4572726f7265  	dc.b	"Errore",0
10301  0755               L1613:
10302  0755 636f72726574  	dc.b	"correttamente",0
10303  0763               L7513:
10304  0763 466173617475  	dc.b	"Fasatura eseguita",0
10305  0775               L5513:
10306  0775 757363697465  	dc.b	"uscite",0
10307  077c               L3513:
10308  077c 74657374696e  	dc.b	"testina",0
10309  0784               L1513:
10310  0784 6175746f6d61  	dc.b	"automatica",0
10311  078f               L7413:
10312  078f 6164206f7363  	dc.b	"ad oscilloscopio",0
10313  07a0               L5413:
10314  07a0 636f7272657a  	dc.b	"correzione rapida",0
10315  07b2               L3413:
10316  07b2 466173617475  	dc.b	"Fasatura a",0
10317  07bd               L1413:
10318  07bd 6d616e75616c  	dc.b	"manuale",0
10319  07c5               L7313:
10320  07c5 466173617475  	dc.b	"Fasatura",0
10321  07ce               L5313:
10322  07ce 706172616d65  	dc.b	"parametri",0
10323  07d8               L3313:
10324  07d8 496e697a6961  	dc.b	"Inizializzazione",0
10325  07e9               L5213:
10326  07e9 6e6f20646973  	dc.b	"no disponible",0
10327  07f7               L3213:
10328  07f7 4572726f723a  	dc.b	"Error: posicion",0
10329  0807               L1213:
10330  0807 6e6f20616365  	dc.b	"no aceptable",0
10331  0814               L7113:
10332  0814 4572726f723a  	dc.b	"Error: valor",0
10333  0821               L5113:
10334  0821 6572726f7200  	dc.b	"error",0
10335  0827               L3113:
10336  0827 416e756c6163  	dc.b	"Anulacion",0
10337  0831               L1113:
10338  0831 636f64652064  	dc.b	"code desconocido",0
10339  0842               L7013:
10340  0842 41646963696f  	dc.b	"Adicional",0
10341  084c               L5013:
10342  084c 646573636f6e  	dc.b	"desconocido",0
10343  0858               L3013:
10344  0858 535700        	dc.b	"SW",0
10345  085b               L1013:
10346  085b 56657273696f  	dc.b	"Version",0
10347  0863               L7703:
10348  0863 656a65637574  	dc.b	"ejecutado bien",0
10349  0872               L5703:
10350  0872 436f6d616e64  	dc.b	"Comando",0
10351  087a               L3703:
10352  087a 73616c766164  	dc.b	"salvado",0
10353  0882               L1703:
10354  0882 496e74657276  	dc.b	"Intervalo",0
10355  088c               L7603:
10356  088c 286e6f6e206f  	dc.b	"(non operativa)",0
10357  089c               L5603:
10358  089c 436f72726563  	dc.b	"Correcion transver"
10359  08ae 73616c00      	dc.b	"sal",0
10360  08b2               L3603:
10361  08b2 6f7363696c6f  	dc.b	"osciloscopio",0
10362  08bf               L1603:
10363  08bf 56697375616c  	dc.b	"Visualizacion",0
10364  08cd               L7503:
10365  08cd 746573742063  	dc.b	"test cabeza",0
10366  08d9               L5503:
10367  08d9 6d6172636120  	dc.b	"marca doble",0
10368  08e5               L3503:
10369  08e5 4572726f7220  	dc.b	"Error puesta en",0
10370  08f5               L1503:
10371  08f5 4d617175696e  	dc.b	"Maquina en marcha",0
10372  0907               L7403:
10373  0907 4572726f7220  	dc.b	"Error test",0
10374  0912               L5403:
10375  0912 6d617175696e  	dc.b	"maquina en marcha",0
10376  0924               L3403:
10377  0924 4572726f7220  	dc.b	"Error : Puesta en "
10378  0936 6661736500    	dc.b	"fase",0
10379  093b               L1403:
10380  093b 6465736d6163  	dc.b	"desmaciado elevada",0
10381  094e               L7303:
10382  094e 4572726f723a  	dc.b	"Error: Velocidad",0
10383  095f               L5303:
10384  095f 4d617175696e  	dc.b	"Maquina parada",0
10385  096e               L3303:
10386  096e 666173652063  	dc.b	"fase correcto",0
10387  097c               L1303:
10388  097c 506172616d65  	dc.b	"Parametro",0
10389  0986               L7203:
10390  0986 73616c696461  	dc.b	"salidas",0
10391  098e               L5203:
10392  098e 636162657a61  	dc.b	"cabeza",0
10393  0995               L3203:
10394  0995 666173652061  	dc.b	"fase automatica",0
10395  09a5               L1203:
10396  09a5 66617365206f  	dc.b	"fase osciloscopio",0
10397  09b7               L7103:
10398  09b7 666173652072  	dc.b	"fase rapida",0
10399  09c3               L5103:
10400  09c3 66617365206d  	dc.b	"fase manual",0
10401  09cf               L3103:
10402  09cf 507565737461  	dc.b	"Puesta en",0
10403  09d9               L1103:
10404  09d9 706172616d65  	dc.b	"parametros",0
10405  09e4               L7003:
10406  09e4 496e69636961  	dc.b	"Iniciacion",0
10407  09ef               L1003:
10408  09ef 706173206469  	dc.b	"pas disponible",0
10409  09fe               L7772:
10410  09fe 457272657572  	dc.b	"Erreur: Position",0
10411  0a0f               L5772:
10412  0a0f 706173206163  	dc.b	"pas acceptable",0
10413  0a1e               L3772:
10414  0a1e 457272657572  	dc.b	"Erreur: Valeur",0
10415  0a2d               L1772:
10416  0a2d 657272657572  	dc.b	"erreur",0
10417  0a34               L7672:
10418  0a34 456666616365  	dc.b	"Effacement",0
10419  0a3f               L5672:
10420  0a3f 436f64652061  	dc.b	"Code additionnel",0
10421  0a50               L3672:
10422  0a50 696e636f6e6e  	dc.b	"inconnu",0
10423  0a58               L1672:
10424  0a58 436f6d6d616e  	dc.b	"Commande execute",0
10425  0a69               L7572:
10426  0a69 736175766500  	dc.b	"sauve",0
10427  0a6f               L5572:
10428  0a6f 496e74657276  	dc.b	"Intervalle",0
10429  0a7a               L3572:
10430  0a7a 28706173206f  	dc.b	"(pas operationnel)",0
10431  0a8d               L1572:
10432  0a8d 436f72726563  	dc.b	"Correction trasver"
10433  0a9f 73616c00      	dc.b	"sal",0
10434  0aa3               L7472:
10435  0aa3 56697375616c  	dc.b	"Visualisation",0
10436  0ab1               L5472:
10437  0ab1 746573742065  	dc.b	"test encoder",0
10438  0abe               L3472:
10439  0abe 746573742074  	dc.b	"test tete",0
10440  0ac8               L1472:
10441  0ac8 4f4b00        	dc.b	"OK",0
10442  0acb               L7372:
10443  0acb 646f75626c65  	dc.b	"double marque",0
10444  0ad9               L5372:
10445  0ad9 706861736520  	dc.b	"phase automatique",0
10446  0aeb               L3372:
10447  0aeb 457272657572  	dc.b	"Erreur: mise in",0
10448  0afb               L1372:
10449  0afb 4d616368696e  	dc.b	"Machine pas arrete",0
10450  0b0e               L7272:
10451  0b0e 546573742065  	dc.b	"Test erreur:",0
10452  0b1b               L5272:
10453  0b1b 6d616368696e  	dc.b	"machine pas arrete",0
10454  0b2e               L3272:
10455  0b2e 457272657572  	dc.b	"Erreur:",0
10456  0b36               L1272:
10457  0b36 74726f702065  	dc.b	"trop eleve",0
10458  0b41               L7172:
10459  0b41 457272657572  	dc.b	"Erreur: velocite",0
10460  0b52               L5172:
10461  0b52 6d616368696e  	dc.b	"machine ferme",0
10462  0b60               L3172:
10463  0b60 457272657572  	dc.b	"Erreur",0
10464  0b67               L1172:
10465  0b67 636f72726563  	dc.b	"correctement",0
10466  0b74               L7072:
10467  0b74 506172616d65  	dc.b	"Parametre",0
10468  0b7e               L5072:
10469  0b7e 736f72746965  	dc.b	"sorties",0
10470  0b86               L3072:
10471  0b86 656e636f6465  	dc.b	"encoder",0
10472  0b8e               L1072:
10473  0b8e 6578706c6f72  	dc.b	"explorante",0
10474  0b99               L7762:
10475  0b99 546573742074  	dc.b	"Test tete",0
10476  0ba3               L5762:
10477  0ba3 6175746f6d61  	dc.b	"automatique",0
10478  0baf               L3762:
10479  0baf 61206f736369  	dc.b	"a oscilloscope",0
10480  0bbe               L1762:
10481  0bbe 6120636f7265  	dc.b	"a corection rapid",0
10482  0bd0               L7662:
10483  0bd0 4d6973652065  	dc.b	"Mise en phase",0
10484  0bde               L5662:
10485  0bde 706861736520  	dc.b	"phase manuel",0
10486  0beb               L3662:
10487  0beb 4d6973652065  	dc.b	"Mise en",0
10488  0bf3               L1662:
10489  0bf3 706172616d65  	dc.b	"parametres",0
10490  0bfe               L7562:
10491  0bfe 496e69746961  	dc.b	"Initiation",0
10492  0c09               L1562:
10493  0c09 6e6963687420  	dc.b	"nicht verfugbar",0
10494  0c19               L7462:
10495  0c19 4665686c6572  	dc.b	"Fehler: Position",0
10496  0c2a               L5462:
10497  0c2a 6e6963687420  	dc.b	"nicht akzeptabel",0
10498  0c3b               L3462:
10499  0c3b 4665686c6572  	dc.b	"Fehler: Wert",0
10500  0c48               L1462:
10501  0c48 49727274756d  	dc.b	"Irrtum",0
10502  0c4f               L7362:
10503  0c4f 4e756c6c6569  	dc.b	"Nulleistellung",0
10504  0c5e               L5362:
10505  0c5e 5a757361747a  	dc.b	"Zusatzlichcode",0
10506  0c6d               L3362:
10507  0c6d 436f646500    	dc.b	"Code",0
10508  0c72               L1362:
10509  0c72 556e62656b61  	dc.b	"Unbekannt",0
10510  0c7c               L7262:
10511  0c7c 56657273696f  	dc.b	"Version SW",0
10512  0c87               L5262:
10513  0c87 426566656c68  	dc.b	"Befelhl",0
10514  0c8f               L3262:
10515  0c8f 537065696368  	dc.b	"Speichern",0
10516  0c99               L1262:
10517  0c99 6f6666736574  	dc.b	"offset",0
10518  0ca0               L7162:
10519  0ca0 496e74657276  	dc.b	"Interval",0
10520  0ca9               L5162:
10521  0ca9 286e69636874  	dc.b	"(nicht in betriebs"
10522  0cbb 2900          	dc.b	")",0
10523  0cbd               L3162:
10524  0cbd 73656974656e  	dc.b	"seiten Korrektur",0
10525  0cce               L1162:
10526  0cce 56697375616c  	dc.b	"Visualisierung",0
10527  0cdd               L7062:
10528  0cdd 546573742046  	dc.b	"Test Fehler",0
10529  0ce9               L5062:
10530  0ce9 54657374204f  	dc.b	"Test OK",0
10531  0cf1               L3062:
10532  0cf1 646f7070656c  	dc.b	"doppel Marke",0
10533  0cfe               L1062:
10534  0cfe 4665686c6572  	dc.b	"Fehler",0
10535  0d05               L7752:
10536  0d05 4665686c6572  	dc.b	"Fehler automatisch"
10537  0d17 6500          	dc.b	"e",0
10538  0d19               L5752:
10539  0d19 4665686c6572  	dc.b	"Fehler: Einstellun"
10540  0d2b 6700          	dc.b	"g",0
10541  0d2d               L3752:
10542  0d2d 4d616368696e  	dc.b	"Machine steht nich"
10543  0d3f 7400          	dc.b	"t",0
10544  0d41               L1752:
10545  0d41 7a7520686f63  	dc.b	"zu hoch",0
10546  0d49               L7652:
10547  0d49 4665686c6572  	dc.b	"Fehler: Geschwindi"
10548  0d5b 676b65697400  	dc.b	"gkeit",0
10549  0d61               L5652:
10550  0d61 4d616368696e  	dc.b	"Machine stop",0
10551  0d6e               L3652:
10552  0d6e 4665686c6572  	dc.b	"Fehler:",0
10553  0d76               L1652:
10554  0d76 506f73697469  	dc.b	"Positiv",0
10555  0d7e               L7552:
10556  0d7e 41757365e4    	dc.b	"Ause",228
10557  0d83 6e676500      	dc.b	"nge",0
10558  0d87               L5552:
10559  0d87 4c6573656b6f  	dc.b	"Lesekopf",0
10560  0d90               L3552:
10561  0d90 6175746f6d61  	dc.b	"automatische",0
10562  0d9d               L1552:
10563  0d9d 4f737a696c6c  	dc.b	"Oszilloskop",0
10564  0da9               L7452:
10565  0da9 7363686e656c  	dc.b	"schnell Verbesseru"
10566  0dbb 6e6700        	dc.b	"ng",0
10567  0dbe               L5452:
10568  0dbe 45696e737465  	dc.b	"Einstellung",0
10569  0dca               L3452:
10570  0dca 6d616e75656c  	dc.b	"manuell",0
10571  0dd2               L1452:
10572  0dd2 45696e776569  	dc.b	"Einweihung",0
10573  0ddd               L3352:
10574  0ddd 6e6f74206176  	dc.b	"not available",0
10575  0deb               L1352:
10576  0deb 4572726f723a  	dc.b	"Error: Position",0
10577  0dfb               L7252:
10578  0dfb 556e61636365  	dc.b	"Unacceptable value",0
10579  0e0e               L5252:
10580  0e0e 726573657400  	dc.b	"reset",0
10581  0e14               L3252:
10582  0e14 416464697469  	dc.b	"AdditionalCode",0
10583  0e23               L1252:
10584  0e23 636f646500    	dc.b	"code",0
10585  0e28               L7152:
10586  0e28 556e6b6e6f77  	dc.b	"Unknown",0
10587  0e30               L5152:
10588  0e30 00            	dc.b	0
10589  0e31               L3152:
10590  0e31 535720566572  	dc.b	"SW Version",0
10591  0e3c               L1152:
10592  0e3c 436f6d6d616e  	dc.b	"Command",0
10593  0e44               L7052:
10594  0e44 506172616d65  	dc.b	"Parameter saved:",0
10595  0e55               L5052:
10596  0e55 64697374616e  	dc.b	"distance",0
10597  0e5e               L3052:
10598  0e5e 4f6666736574  	dc.b	"Offset",0
10599  0e65               L1052:
10600  0e65 286e6f742069  	dc.b	"(not installed)",0
10601  0e75               L7742:
10602  0e75 4c6174657261  	dc.b	"Lateral Correction",0
10603  0e88               L5742:
10604  0e88 56697375616c  	dc.b	"Visual",0
10605  0e8f               L3742:
10606  0e8f 656e636f6465  	dc.b	"encoder test",0
10607  0e9c               L1742:
10608  0e9c 4572726f7220  	dc.b	"Error in scan.",0
10609  0eab               L7642:
10610  0eab 646f75626c65  	dc.b	"double mark",0
10611  0eb7               L5642:
10612  0eb7 6175746f6d61  	dc.b	"automatic phase",0
10613  0ec7               L3642:
10614  0ec7 4572726f7220  	dc.b	"Error in",0
10615  0ed0               L1642:
10616  0ed0 4572726f723a  	dc.b	"Error:",0
10617  0ed7               L7542:
10618  0ed7 4d616368696e  	dc.b	"Machine not stoppe"
10619  0ee9 6400          	dc.b	"d",0
10620  0eeb               L5542:
10621  0eeb 746f6f206869  	dc.b	"too high",0
10622  0ef4               L3542:
10623  0ef4 4572726f723a  	dc.b	"Error: Speed",0
10624  0f01               L1542:
10625  0f01 4d616368696e  	dc.b	"Machine is stopped",0
10626  0f14               L7442:
10627  0f14 4572726f7200  	dc.b	"Error",0
10628  0f1a               L5442:
10629  0f1a 646f6e6500    	dc.b	"done",0
10630  0f1f               L3442:
10631  0f1f 506861736500  	dc.b	"Phase",0
10632  0f25               L1442:
10633  0f25 3600          	dc.b	"6",0
10634  0f27               L7342:
10635  0f27 3500          	dc.b	"5",0
10636  0f29               L5342:
10637  0f29 3400          	dc.b	"4",0
10638  0f2b               L3342:
10639  0f2b 5465737400    	dc.b	"Test",0
10640  0f30               L1342:
10641  0f30 4f7574707574  	dc.b	"Outputs",0
10642  0f38               L7242:
10643  0f38 7465737400    	dc.b	"test",0
10644  0f3d               L5242:
10645  0f3d 456e636f6465  	dc.b	"Encoder",0
10646  0f45               L3242:
10647  0f45 686561642074  	dc.b	"head test",0
10648  0f4f               L1242:
10649  0f4f 5363616e6e69  	dc.b	"Scanning",0
10650  0f58               L7142:
10651  0f58 4175746f6d61  	dc.b	"Automatic",0
10652  0f62               L5142:
10653  0f62 6f7363696c6c  	dc.b	"oscilloscope",0
10654  0f6f               L3142:
10655  0f6f 506861736520  	dc.b	"Phase with",0
10656  0f7a               L1142:
10657  0f7a 466173742063  	dc.b	"Fast correction",0
10658  0f8a               L7042:
10659  0f8a 706861736500  	dc.b	"phase",0
10660  0f90               L5042:
10661  0f90 4d616e75616c  	dc.b	"Manual",0
10662  0f97               L3042:
10663  0f97 496e69746961  	dc.b	"Initialization",0
10664  0fa6               L1042:
10665  0fa6 506172616d65  	dc.b	"Parameter",0
10666  0fb0               L1061:
10667  0fb0 762020202020  	dc.b	"v     ",0
10668  0fb7               L7751:
10669  0fb7 43707520426f  	dc.b	"Cpu Board ",0
10670  0fc2               L5751:
10671  0fc2 56657273696f  	dc.b	"Versione SW",0
10672  0fce               L3751:
10673  0fce 54616a20426f  	dc.b	"Taj Board v",0
10674  0fda               L3551:
10675  0fda 286f70657261  	dc.b	"(operativo)",0
10676  0fe6               L1551:
10677  0fe6 415243484956  	dc.b	"ARCHIVE",0
10678  0fee               L5601:
10679  0fee 4b6579506164  	dc.b	"KeyPad = ",0
10680  0ff8               L5101:
10681  0ff8 56616c756520  	dc.b	"Value  = ",0
10682  1002               L3101:
10683  1002 436f64652032  	dc.b	"Code 2 = ",0
10684  100c               L1101:
10685  100c 436f64652031  	dc.b	"Code 1 = ",0
10686                     	xref.b	c_y
10706                     	xref	c_imul
10707                     	xref.b	_windowSetupParameter$L
10708                     	xref.b	_screenBigMessage$L
10709                     	xref.b	_STI_SendMessage$L
10710                     	xref.b	_window6Menu$L
10711                     	xref.b	_windowBigMessage$L
10712                     	xref.b	_formatNumberBinary$L
10713                     	xref.b	_parametersSet$L
10714                     	xref.b	_displayWriteString$L
10715                     	xref.b	_formatNumber$L
10716                     	xref.b	_memcpy$L
10717                     	xref.b	_displaySetOutLine$L
10718                     	xref.b	_displayClearArea$L
10719                     	end
