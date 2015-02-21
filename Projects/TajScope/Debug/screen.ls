   1                     ; C Compiler for ST7 (COSMIC Software)
   2                     ; Generator V4.5.5 - 12 Jan 2006
1308                     ; 16 void screenInit(void)
1308                     ; 17 {	
1309                     	switch	.text
1310  0000               _screenInit:
1313                     ; 18 	windowInit();
1315  0000 cd0000        	call	_windowInit
1317                     ; 19 }
1320  0003 81            	ret
1387                     ; 22 void screenReceivedCode(BYTE a_byCode, BYTE a_byCode2, WORD a_woValue)
1387                     ; 23 {
1388                     	switch	.text
1390                     	xref.b	_screenReceivedCode$L
1391  0004               _screenReceivedCode:
1393  0004 b701          	ld	_screenReceivedCode$L+1,a
1394  0006 bf00          	ld	_screenReceivedCode$L,x
1396                     ; 29 	displayClearArea(0, 0, 126, 126);
1398  0008 a67e          	ld	a,#126
1399  000a b703          	ld	_displayClearArea$L+3,a
1400  000c a67e          	ld	a,#126
1401  000e b702          	ld	_displayClearArea$L+2,a
1402  0010 4f            	clr	a
1403  0011 5f            	clr	x
1404  0012 cd0000        	call	_displayClearArea
1406                     ; 30 	displaySetOutLine(0, 0, 126, 126, false);
1408  0015 3f04          	clr	_displaySetOutLine$L+4
1409  0017 a67e          	ld	a,#126
1410  0019 b703          	ld	_displaySetOutLine$L+3,a
1411  001b a67e          	ld	a,#126
1412  001d b702          	ld	_displaySetOutLine$L+2,a
1413  001f 4f            	clr	a
1414  0020 5f            	clr	x
1415  0021 cd0000        	call	_displaySetOutLine
1417                     ; 33 	strString[12] = 0x00;
1419  0024 3ffc          	clr	_screenReceivedCode$L-4
1420                     ; 34 	memcpy(strString, "Code 1 = ", 9); 
1422  0026 a609          	ld	a,#9
1423  0028 b704          	ld	_memcpy$L+4,a
1424  002a ae1e          	ld	x,#high(L377)
1425  002c bf02          	ld	_memcpy$L+2,x
1426  002e a61e          	ld	a,#low(L377)
1427  0030 b703          	ld	_memcpy$L+3,a
1428  0032 a6f0          	ld	a,#_screenReceivedCode$L-16
1429  0034 5f            	clr	x
1430  0035 cd0000        	call	_memcpy
1432                     ; 35 	formatNumber(a_byCode, 3, 0, strString+9);
1434  0038 aef9          	ld	x,#high(_screenReceivedCode$L-7)
1435  003a bf04          	ld	_formatNumber$L+4,x
1436  003c a6f9          	ld	a,#low(_screenReceivedCode$L-7)
1437  003e b705          	ld	_formatNumber$L+5,a
1438  0040 3f03          	clr	_formatNumber$L+3
1439  0042 a603          	ld	a,#3
1440  0044 b702          	ld	_formatNumber$L+2,a
1441  0046 b600          	ld	a,_screenReceivedCode$L
1442  0048 5f            	clr	x
1443  0049 cd0000        	call	_formatNumber
1445                     ; 36 	displayWriteString(strString, DISPLAY_SELECT_FONT_5x7, 10, 10);
1447  004c a60a          	ld	a,#10
1448  004e b704          	ld	_displayWriteString$L+4,a
1449  0050 a60a          	ld	a,#10
1450  0052 b703          	ld	_displayWriteString$L+3,a
1451  0054 a61d          	ld	a,#29
1452  0056 b702          	ld	_displayWriteString$L+2,a
1453  0058 a6f0          	ld	a,#_screenReceivedCode$L-16
1454  005a 5f            	clr	x
1455  005b cd0000        	call	_displayWriteString
1457                     ; 39 	memcpy(strString, "Code 2 = ", 9); 
1459  005e a609          	ld	a,#9
1460  0060 b704          	ld	_memcpy$L+4,a
1461  0062 ae14          	ld	x,#high(L577)
1462  0064 bf02          	ld	_memcpy$L+2,x
1463  0066 a614          	ld	a,#low(L577)
1464  0068 b703          	ld	_memcpy$L+3,a
1465  006a a6f0          	ld	a,#_screenReceivedCode$L-16
1466  006c 5f            	clr	x
1467  006d cd0000        	call	_memcpy
1469                     ; 40 	formatNumber(a_byCode2, 3, 0, strString+9);
1471  0070 aef9          	ld	x,#high(_screenReceivedCode$L-7)
1472  0072 bf04          	ld	_formatNumber$L+4,x
1473  0074 a6f9          	ld	a,#low(_screenReceivedCode$L-7)
1474  0076 b705          	ld	_formatNumber$L+5,a
1475  0078 3f03          	clr	_formatNumber$L+3
1476  007a a603          	ld	a,#3
1477  007c b702          	ld	_formatNumber$L+2,a
1478  007e b601          	ld	a,_screenReceivedCode$L+1
1479  0080 5f            	clr	x
1480  0081 cd0000        	call	_formatNumber
1482                     ; 41 	displayWriteString(strString, DISPLAY_SELECT_FONT_5x7, 10, 20);
1484  0084 a614          	ld	a,#20
1485  0086 b704          	ld	_displayWriteString$L+4,a
1486  0088 a60a          	ld	a,#10
1487  008a b703          	ld	_displayWriteString$L+3,a
1488  008c a61d          	ld	a,#29
1489  008e b702          	ld	_displayWriteString$L+2,a
1490  0090 a6f0          	ld	a,#_screenReceivedCode$L-16
1491  0092 5f            	clr	x
1492  0093 cd0000        	call	_displayWriteString
1494                     ; 43 	strString[15] = 0x00;
1496  0096 3fff          	clr	_screenReceivedCode$L-1
1497                     ; 44 	memcpy(strString, "Value  = ", 9); 
1499  0098 a609          	ld	a,#9
1500  009a b704          	ld	_memcpy$L+4,a
1501  009c ae0a          	ld	x,#high(L777)
1502  009e bf02          	ld	_memcpy$L+2,x
1503  00a0 a60a          	ld	a,#low(L777)
1504  00a2 b703          	ld	_memcpy$L+3,a
1505  00a4 a6f0          	ld	a,#_screenReceivedCode$L-16
1506  00a6 5f            	clr	x
1507  00a7 cd0000        	call	_memcpy
1509                     ; 45 	formatNumber(a_woValue, 6, 0, strString+9);
1511  00aa aef9          	ld	x,#high(_screenReceivedCode$L-7)
1512  00ac bf04          	ld	_formatNumber$L+4,x
1513  00ae a6f9          	ld	a,#low(_screenReceivedCode$L-7)
1514  00b0 b705          	ld	_formatNumber$L+5,a
1515  00b2 3f03          	clr	_formatNumber$L+3
1516  00b4 a606          	ld	a,#6
1517  00b6 b702          	ld	_formatNumber$L+2,a
1518  00b8 b603          	ld	a,_screenReceivedCode$L+3
1519  00ba be02          	ld	x,_screenReceivedCode$L+2
1520  00bc cd0000        	call	_formatNumber
1522                     ; 46 	displayWriteString(strString, DISPLAY_SELECT_FONT_5x7, 10, 30);
1524  00bf a61e          	ld	a,#30
1525  00c1 b704          	ld	_displayWriteString$L+4,a
1526  00c3 a60a          	ld	a,#10
1527  00c5 b703          	ld	_displayWriteString$L+3,a
1528  00c7 a61d          	ld	a,#29
1529  00c9 b702          	ld	_displayWriteString$L+2,a
1530  00cb a6f0          	ld	a,#_screenReceivedCode$L-16
1531  00cd 5f            	clr	x
1532  00ce cd0000        	call	_displayWriteString
1534                     ; 48 	parametersSet(PARAM_PAGE, PAGE_UNKNOWN_CODE);		
1536  00d1 a601          	ld	a,#1
1537  00d3 b702          	ld	_parametersSet$L+2,a
1538  00d5 3f01          	clr	_parametersSet$L+1
1539  00d7 a604          	ld	a,#4
1540  00d9 cd0000        	call	_parametersSet
1542                     ; 49 }
1545  00dc 81            	ret
1569                     ; 52 void screenKeyCode(void)
1569                     ; 53 {
1570                     	switch	.text
1571  00dd               _screenKeyCode:
1574                     ; 54 	screenDisplayKeyCode(isDisplayKeyPressed());
1576  00dd cd0000        	call	_isDisplayKeyPressed
1578  00e0 ad01          	call	_screenDisplayKeyCode
1580                     ; 55 }
1583  00e2 81            	ret
1641                     ; 58 void screenDisplayKeyCode(BYTE a_byKey)
1641                     ; 59 {
1642                     	switch	.text
1644                     	xref.b	_screenDisplayKeyCode$L
1645  00e3               _screenDisplayKeyCode:
1647  00e3 b700          	ld	_screenDisplayKeyCode$L,a
1649                     ; 63 	if (a_byKey != KEY_NULL)
1651  00e5 a1ff          	cp	a,#255
1652  00e7 2602          	jrne	L41
1653  00e9 2071          	jp	L7301
1654  00eb               L41:
1655                     ; 65 		displayClearArea (0, 0, 126, 126);
1657  00eb a67e          	ld	a,#126
1658  00ed b703          	ld	_displayClearArea$L+3,a
1659  00ef a67e          	ld	a,#126
1660  00f1 b702          	ld	_displayClearArea$L+2,a
1661  00f3 4f            	clr	a
1662  00f4 5f            	clr	x
1663  00f5 cd0000        	call	_displayClearArea
1665                     ; 66 		displaySetOutLine(0, 0, 126, 126, false);	
1667  00f8 3f04          	clr	_displaySetOutLine$L+4
1668  00fa a67e          	ld	a,#126
1669  00fc b703          	ld	_displaySetOutLine$L+3,a
1670  00fe a67e          	ld	a,#126
1671  0100 b702          	ld	_displaySetOutLine$L+2,a
1672  0102 4f            	clr	a
1673  0103 5f            	clr	x
1674  0104 cd0000        	call	_displaySetOutLine
1676                     ; 67 		strString[0] = DISPLAY_CURSOR_POSITION;
1678  0107 a610          	ld	a,#16
1679  0109 b7f1          	ld	_screenDisplayKeyCode$L-15,a
1680                     ; 68 		strString[1] = 0x0A;
1682  010b a60a          	ld	a,#10
1683  010d b7f2          	ld	_screenDisplayKeyCode$L-14,a
1684                     ; 69 		strString[2] = 0x0A;
1686  010f a60a          	ld	a,#10
1687  0111 b7f3          	ld	_screenDisplayKeyCode$L-13,a
1688                     ; 70 		strString[3] = DISPLAY_WAIT;
1690  0113 a6fe          	ld	a,#254
1691  0115 b7f4          	ld	_screenDisplayKeyCode$L-12,a
1692                     ; 71 		strString[4] = DISPLAY_EOF;
1694  0117 a6ff          	ld	a,#255
1695  0119 b7f5          	ld	_screenDisplayKeyCode$L-11,a
1696                     ; 72 		displayCmdToDisplay(strString);
1698  011b a6f1          	ld	a,#_screenDisplayKeyCode$L-15
1699  011d 5f            	clr	x
1700  011e cd0000        	call	_displayCmdToDisplay
1702                     ; 74 		for (i=0x00;i<15; i++)
1704  0121 3ff0          	clr	_screenDisplayKeyCode$L-16
1705  0123               L1401:
1706                     ; 76 			strString[i] = 0x00;
1708  0123 bef0          	ld	x,_screenDisplayKeyCode$L-16
1709  0125 4f            	clr	a
1710  0126 e7f1          	ld	(_screenDisplayKeyCode$L-15,x),a
1711                     ; 74 		for (i=0x00;i<15; i++)
1713  0128 3cf0          	inc	_screenDisplayKeyCode$L-16
1716  012a b6f0          	ld	a,_screenDisplayKeyCode$L-16
1717  012c a10f          	cp	a,#15
1718  012e 25f3          	jrult	L1401
1719                     ; 78 		memcpy(strString, "KeyPad = ", 9); 
1721  0130 a609          	ld	a,#9
1722  0132 b704          	ld	_memcpy$L+4,a
1723  0134 ae00          	ld	x,#high(L7401)
1724  0136 bf02          	ld	_memcpy$L+2,x
1725  0138 a600          	ld	a,#low(L7401)
1726  013a b703          	ld	_memcpy$L+3,a
1727  013c a6f1          	ld	a,#_screenDisplayKeyCode$L-15
1728  013e 5f            	clr	x
1729  013f cd0000        	call	_memcpy
1731                     ; 79 		formatNumber(a_byKey, 3, 0, strString+9);
1733  0142 aefa          	ld	x,#high(_screenDisplayKeyCode$L-6)
1734  0144 bf04          	ld	_formatNumber$L+4,x
1735  0146 a6fa          	ld	a,#low(_screenDisplayKeyCode$L-6)
1736  0148 b705          	ld	_formatNumber$L+5,a
1737  014a 3f03          	clr	_formatNumber$L+3
1738  014c a603          	ld	a,#3
1739  014e b702          	ld	_formatNumber$L+2,a
1740  0150 b600          	ld	a,_screenDisplayKeyCode$L
1741  0152 5f            	clr	x
1742  0153 cd0000        	call	_formatNumber
1744                     ; 80 		displayCmdToDisplay(strString);		
1746  0156 a6f1          	ld	a,#_screenDisplayKeyCode$L-15
1747  0158 5f            	clr	x
1748  0159 cd0000        	call	_displayCmdToDisplay
1750  015c               L7301:
1751                     ; 82 }
1754  015c 81            	ret
1789                     ; 86 void screenOscilloscope(BYTE a_byPage)
1789                     ; 87 {
1790                     	switch	.text
1792                     	xref.b	_screenOscilloscope$L
1793  015d               _screenOscilloscope:
1795  015d b700          	ld	_screenOscilloscope$L,a
1797                     ; 90 	windowOscilloscope(0xFF, a_byPage);
1799  015f aeff          	ld	x,#255
1800  0161 cd0000        	call	_windowOscilloscope
1802                     ; 91 	parametersSet(PARAM_PAGE, a_byPage);	
1804  0164 b600          	ld	a,_screenOscilloscope$L
1805  0166 5f            	clr	x
1806  0167 b702          	ld	_parametersSet$L+2,a
1807  0169 bf01          	ld	_parametersSet$L+1,x
1808  016b a604          	ld	a,#4
1809  016d cd0000        	call	_parametersSet
1811                     ; 92 }
1814  0170 81            	ret
1840                     ; 95 void screenAlarm(void)
1840                     ; 96 {
1841                     	switch	.text
1842  0171               _screenAlarm:
1845                     ; 97 	windowMode();
1847  0171 cd0000        	call	_windowMode
1849                     ; 98 	windowSpeed();
1851  0174 cd0000        	call	_windowSpeed
1853                     ; 99 	windowAlarm();
1855  0177 cd0000        	call	_windowAlarm
1857                     ; 100 	parametersSet(PARAM_PAGE, PAGE_ALARM);	
1859  017a a603          	ld	a,#3
1860  017c b702          	ld	_parametersSet$L+2,a
1861  017e 3f01          	clr	_parametersSet$L+1
1862  0180 a604          	ld	a,#4
1863  0182 cd0000        	call	_parametersSet
1865                     ; 101 }
1868  0185 81            	ret
1915                     ; 104 void screenBigMessage(BYTE * a_strMessage1, BYTE * a_strMessage2)
1915                     ; 105 {
1916                     	switch	.text
1918                     	xref.b	_screenBigMessage$L
1919  0186               _screenBigMessage:
1921  0186 b701          	ld	_screenBigMessage$L+1,a
1922  0188 bf00          	ld	_screenBigMessage$L,x
1924                     ; 106 	windowBigMessage(a_strMessage1, a_strMessage2);
1926  018a be02          	ld	x,_screenBigMessage$L+2
1927  018c bf02          	ld	_windowBigMessage$L+2,x
1928  018e b603          	ld	a,_screenBigMessage$L+3
1929  0190 b703          	ld	_windowBigMessage$L+3,a
1930  0192 b601          	ld	a,_screenBigMessage$L+1
1931  0194 be00          	ld	x,_screenBigMessage$L
1932  0196 cd0000        	call	_windowBigMessage
1934                     ; 107 	windowForceRepaint();	
1936  0199 cd0000        	call	_windowForceRepaint
1938                     ; 108 	parametersSet(PARAM_PAGE, PAGE_MESSAGE);
1940  019c a602          	ld	a,#2
1941  019e b702          	ld	_parametersSet$L+2,a
1942  01a0 3f01          	clr	_parametersSet$L+1
1943  01a2 a604          	ld	a,#4
1944  01a4 cd0000        	call	_parametersSet
1946                     ; 109 }
1949  01a7 81            	ret
2005                     ; 112 void screen6Menus(BYTE * a_byPage, BYTE * a_byGroup, BYTE * a_bySelected)
2005                     ; 113 {
2006                     	switch	.text
2008                     	xref.b	_screen6Menus$L
2009  01a8               _screen6Menus:
2011  01a8 b701          	ld	_screen6Menus$L+1,a
2012  01aa bf00          	ld	_screen6Menus$L,x
2014                     ; 114 	window6Menu(a_byGroup, a_bySelected);
2016  01ac be04          	ld	x,_screen6Menus$L+4
2017  01ae bf02          	ld	_window6Menu$L+2,x
2018  01b0 b605          	ld	a,_screen6Menus$L+5
2019  01b2 b703          	ld	_window6Menu$L+3,a
2020  01b4 b603          	ld	a,_screen6Menus$L+3
2021  01b6 be02          	ld	x,_screen6Menus$L+2
2022  01b8 cd0000        	call	_window6Menu
2024                     ; 115 	parametersSet(PARAM_PAGE, *a_byPage);	
2026  01bb 92c600        	ld	a,[_screen6Menus$L.w]
2027  01be 5f            	clr	x
2028  01bf b702          	ld	_parametersSet$L+2,a
2029  01c1 bf01          	ld	_parametersSet$L+1,x
2030  01c3 a604          	ld	a,#4
2031  01c5 cd0000        	call	_parametersSet
2033                     ; 116 }
2036  01c8 81            	ret
2088                     	switch	.bss
2089  0000               _m_strString2:
2090  0000 000000000000  	ds.b	20
2091                     	xdef	_m_strString2
2092  0014               _m_strString1:
2093  0014 000000000000  	ds.b	20
2094                     	xdef	_m_strString1
2095  0028               _m_byValueChanged:
2096  0028 00            	ds.b	1
2097                     	xdef	_m_byValueChanged
2098  0029               _m_woCurrentValue:
2099  0029 0000          	ds.b	2
2100                     	xdef	_m_woCurrentValue
2101                     	xdef	_screenKeyCode
2102                     	xdef	_screenDisplayKeyCode
2103                     	xdef	_screenReceivedCode
2104                     	xdef	_screen6Menus
2105                     	xdef	_screenBigMessage
2106                     	xdef	_screenAlarm
2107                     	xdef	_screenOscilloscope
2108                     	xdef	_screenInit
2109                     	xref	_formatNumber
2110                     	xref	_memcpy
2111                     	xref	_window6Menu
2112                     	xref	_windowForceRepaint
2113                     	xref	_windowOscilloscope
2114                     	xref	_windowAlarm
2115                     	xref	_windowBigMessage
2116                     	xref	_windowSpeed
2117                     	xref	_windowMode
2118                     	xref	_windowInit
2119                     	xref	_displaySetOutLine
2120                     	xref	_displayClearArea
2121                     	xref	_displayWriteString
2122                     	xref	_displayCmdToDisplay
2123                     	xref	_isDisplayKeyPressed
2124                     	xref	_parametersSet
2125                     .const:	section	.text
2126  0000               L7401:
2127  0000 4b6579506164  	dc.b	"KeyPad = ",0
2128  000a               L777:
2129  000a 56616c756520  	dc.b	"Value  = ",0
2130  0014               L577:
2131  0014 436f64652032  	dc.b	"Code 2 = ",0
2132  001e               L377:
2133  001e 436f64652031  	dc.b	"Code 1 = ",0
2153                     	xref.b	_window6Menu$L
2154                     	xref.b	_windowBigMessage$L
2155                     	xref.b	_parametersSet$L
2156                     	xref.b	_displayWriteString$L
2157                     	xref.b	_formatNumber$L
2158                     	xref.b	_memcpy$L
2159                     	xref.b	_displaySetOutLine$L
2160                     	xref.b	_displayClearArea$L
2161                     	end
