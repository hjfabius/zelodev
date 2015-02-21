   1                     ; C Compiler for ST7 (COSMIC Software)
   2                     ; Generator V4.5.5 - 12 Jan 2006
1311                     ; 81 void windowInit(void)
1311                     ; 82 {
1312                     	switch	.text
1313  0000               _windowInit:
1316                     ; 83 	m_byCurrentSelectorX = 0x00;
1318  0000 4f            	clr	a
1319  0001 c70002        	ld	_m_byCurrentSelectorX,a
1320                     ; 84 	m_woDisplayedWindow = 0x00;
1322  0004 4f            	clr	a
1323  0005 c70000        	ld	_m_woDisplayedWindow,a
1324  0008 c70001        	ld	_m_woDisplayedWindow+1,a
1325                     ; 85 	m_woEncoderGateStart 	= 1;
1327  000b a601          	ld	a,#1
1328  000d c70001        	ld	_m_woEncoderGateStart+1,a
1329  0010 4f            	clr	a
1330  0011 c70000        	ld	_m_woEncoderGateStart,a
1331                     ; 86 	m_woEncoderGateEnd 		= 100;
1333  0014 a664          	ld	a,#100
1334  0016 c70001        	ld	_m_woEncoderGateEnd+1,a
1335  0019 4f            	clr	a
1336  001a c70000        	ld	_m_woEncoderGateEnd,a
1337                     ; 88 }
1340  001d 81            	ret
1363                     ; 91 void windowForceRepaint(void)
1363                     ; 92 {
1364                     	switch	.text
1365  001e               _windowForceRepaint:
1368                     ; 93 	m_woDisplayedWindow = 0x0000;
1370  001e 4f            	clr	a
1371  001f c70000        	ld	_m_woDisplayedWindow,a
1372  0022 c70001        	ld	_m_woDisplayedWindow+1,a
1373                     ; 94 }
1376  0025 81            	ret
1403                     ; 97 void windowMode(void)
1403                     ; 98 {
1404                     	switch	.text
1405  0026               _windowMode:
1408                     ; 99 	if (!_btst(m_woDisplayedWindow, WIN_MODE) || parametersIsChanged(PARAM_MODE_LONG))
1410  0026 c60001        	ld	a,_m_woDisplayedWindow+1
1411  0029 a501          	bcp	a,#1
1412  002b 2708          	jreq	L367
1414  002d a606          	ld	a,#6
1415  002f cd0000        	call	_parametersIsChanged
1417  0032 4d            	tnz	a
1418  0033 2770          	jreq	L167
1419  0035               L367:
1420                     ; 101 		if (parametersGetValue(PARAM_MODE_LONG)==PARAM_MODE_AUTO)
1422  0035 a606          	ld	a,#6
1423  0037 cd0000        	call	_parametersGetValue
1425  003a a1ff          	cp	a,#255
1426  003c 2602          	jrne	L21
1427  003e a300          	cp	x,#0
1428  0040               L21:
1429  0040 2630          	jrne	L567
1430                     ; 103 			displayDrawBox(0, 0, 62, 16, "modo:", "automatico", 0xFFFF,0, _btst(m_woDisplayedWindow, WIN_MODE));
1432  0042 c60001        	ld	a,_m_woDisplayedWindow+1
1433  0045 a401          	and	a,#1
1434  0047 b70b          	ld	_displayDrawBox$L+11,a
1435  0049 3f0a          	clr	_displayDrawBox$L+10
1436  004b aeff          	ld	x,#255
1437  004d bf08          	ld	_displayDrawBox$L+8,x
1438  004f a6ff          	ld	a,#255
1439  0051 b709          	ld	_displayDrawBox$L+9,a
1440  0053 ae14          	ld	x,#high(L177)
1441  0055 bf06          	ld	_displayDrawBox$L+6,x
1442  0057 a614          	ld	a,#low(L177)
1443  0059 b707          	ld	_displayDrawBox$L+7,a
1444  005b ae1f          	ld	x,#high(L767)
1445  005d bf04          	ld	_displayDrawBox$L+4,x
1446  005f a61f          	ld	a,#low(L767)
1447  0061 b705          	ld	_displayDrawBox$L+5,a
1448  0063 a610          	ld	a,#16
1449  0065 b703          	ld	_displayDrawBox$L+3,a
1450  0067 a63e          	ld	a,#62
1451  0069 b702          	ld	_displayDrawBox$L+2,a
1452  006b 4f            	clr	a
1453  006c 5f            	clr	x
1454  006d cd0000        	call	_displayDrawBox
1457  0070 202e          	jra	L377
1458  0072               L567:
1459                     ; 107 			displayDrawBox(0, 0, 62, 16, "modo:", "manuale", 0xFFFF,0, _btst(m_woDisplayedWindow, WIN_MODE));			
1461  0072 c60001        	ld	a,_m_woDisplayedWindow+1
1462  0075 a401          	and	a,#1
1463  0077 b70b          	ld	_displayDrawBox$L+11,a
1464  0079 3f0a          	clr	_displayDrawBox$L+10
1465  007b aeff          	ld	x,#255
1466  007d bf08          	ld	_displayDrawBox$L+8,x
1467  007f a6ff          	ld	a,#255
1468  0081 b709          	ld	_displayDrawBox$L+9,a
1469  0083 ae0c          	ld	x,#high(L577)
1470  0085 bf06          	ld	_displayDrawBox$L+6,x
1471  0087 a60c          	ld	a,#low(L577)
1472  0089 b707          	ld	_displayDrawBox$L+7,a
1473  008b ae1f          	ld	x,#high(L767)
1474  008d bf04          	ld	_displayDrawBox$L+4,x
1475  008f a61f          	ld	a,#low(L767)
1476  0091 b705          	ld	_displayDrawBox$L+5,a
1477  0093 a610          	ld	a,#16
1478  0095 b703          	ld	_displayDrawBox$L+3,a
1479  0097 a63e          	ld	a,#62
1480  0099 b702          	ld	_displayDrawBox$L+2,a
1481  009b 4f            	clr	a
1482  009c 5f            	clr	x
1483  009d cd0000        	call	_displayDrawBox
1485  00a0               L377:
1486                     ; 109 		parametersChangedFlagReset(PARAM_MODE_LONG);
1488  00a0 a606          	ld	a,#6
1489  00a2 cd0000        	call	_parametersChangedFlagReset
1491  00a5               L167:
1492                     ; 112 	_bset(m_woDisplayedWindow, WIN_MODE);
1494  00a5 c60001        	ld	a,_m_woDisplayedWindow+1
1495  00a8 aa01          	or	a,#1
1496  00aa c70001        	ld	_m_woDisplayedWindow+1,a
1497                     ; 113 	_bres(m_woDisplayedWindow, WIN_FUNCTIONS);
1499  00ad c60001        	ld	a,_m_woDisplayedWindow+1
1500  00b0 a4bf          	and	a,#191
1501  00b2 c70001        	ld	_m_woDisplayedWindow+1,a
1502                     ; 114 	_bres(m_woDisplayedWindow, WIN_PARAMETERS);
1504  00b5 c60001        	ld	a,_m_woDisplayedWindow+1
1505  00b8 a47f          	and	a,#127
1506  00ba c70001        	ld	_m_woDisplayedWindow+1,a
1507                     ; 115 	_bres(m_woDisplayedWindow, WIN_TESTS);
1509  00bd c60001        	ld	a,_m_woDisplayedWindow+1
1510  00c0 a4ff          	and	a,#255
1511  00c2 c70001        	ld	_m_woDisplayedWindow+1,a
1512  00c5 c60000        	ld	a,_m_woDisplayedWindow
1513  00c8 a4fe          	and	a,#254
1514  00ca c70000        	ld	_m_woDisplayedWindow,a
1515                     ; 116 	_bres(m_woDisplayedWindow, WIN_MENUS);
1517  00cd c60001        	ld	a,_m_woDisplayedWindow+1
1518  00d0 a4ff          	and	a,#255
1519  00d2 c70001        	ld	_m_woDisplayedWindow+1,a
1520  00d5 c60000        	ld	a,_m_woDisplayedWindow
1521  00d8 a4fd          	and	a,#253
1522  00da c70000        	ld	_m_woDisplayedWindow,a
1523                     ; 117 }
1526  00dd 81            	ret
1553                     ; 120 void windowSpeed(void)
1553                     ; 121 {
1554                     	switch	.text
1555  00de               _windowSpeed:
1558                     ; 122 	if (!_btst(m_woDisplayedWindow, WIN_SPEED) || parametersIsChanged(PARAM_SPEED))
1560  00de c60001        	ld	a,_m_woDisplayedWindow+1
1561  00e1 a502          	bcp	a,#2
1562  00e3 2708          	jreq	L1101
1564  00e5 a603          	ld	a,#3
1565  00e7 cd0000        	call	_parametersIsChanged
1567  00ea 4d            	tnz	a
1568  00eb 2737          	jreq	L7001
1569  00ed               L1101:
1570                     ; 124 		displayDrawBox(64, 0, 62, 16, "velocita:", "mt/min", parametersGetValue(PARAM_SPEED), 4, _btst(m_woDisplayedWindow, WIN_SPEED));
1572  00ed c60001        	ld	a,_m_woDisplayedWindow+1
1573  00f0 a402          	and	a,#2
1574  00f2 b70b          	ld	_displayDrawBox$L+11,a
1575  00f4 a604          	ld	a,#4
1576  00f6 b70a          	ld	_displayDrawBox$L+10,a
1577  00f8 a603          	ld	a,#3
1578  00fa cd0000        	call	_parametersGetValue
1580  00fd b709          	ld	_displayDrawBox$L+9,a
1581  00ff bf08          	ld	_displayDrawBox$L+8,x
1582  0101 aefb          	ld	x,#high(L5101)
1583  0103 bf06          	ld	_displayDrawBox$L+6,x
1584  0105 a6fb          	ld	a,#low(L5101)
1585  0107 b707          	ld	_displayDrawBox$L+7,a
1586  0109 ae02          	ld	x,#high(L3101)
1587  010b bf04          	ld	_displayDrawBox$L+4,x
1588  010d a602          	ld	a,#low(L3101)
1589  010f b705          	ld	_displayDrawBox$L+5,a
1590  0111 a610          	ld	a,#16
1591  0113 b703          	ld	_displayDrawBox$L+3,a
1592  0115 a63e          	ld	a,#62
1593  0117 b702          	ld	_displayDrawBox$L+2,a
1594  0119 4f            	clr	a
1595  011a ae40          	ld	x,#64
1596  011c cd0000        	call	_displayDrawBox
1598                     ; 125 		parametersChangedFlagReset(PARAM_SPEED);
1600  011f a603          	ld	a,#3
1601  0121 cd0000        	call	_parametersChangedFlagReset
1603  0124               L7001:
1604                     ; 128 	_bset(m_woDisplayedWindow, WIN_SPEED);
1606  0124 c60001        	ld	a,_m_woDisplayedWindow+1
1607  0127 aa02          	or	a,#2
1608  0129 c70001        	ld	_m_woDisplayedWindow+1,a
1609                     ; 129 	_bres(m_woDisplayedWindow, WIN_FUNCTIONS);
1611  012c c60001        	ld	a,_m_woDisplayedWindow+1
1612  012f a4bf          	and	a,#191
1613  0131 c70001        	ld	_m_woDisplayedWindow+1,a
1614                     ; 130 	_bres(m_woDisplayedWindow, WIN_PARAMETERS);
1616  0134 c60001        	ld	a,_m_woDisplayedWindow+1
1617  0137 a47f          	and	a,#127
1618  0139 c70001        	ld	_m_woDisplayedWindow+1,a
1619                     ; 131 	_bres(m_woDisplayedWindow, WIN_TESTS);
1621  013c c60001        	ld	a,_m_woDisplayedWindow+1
1622  013f a4ff          	and	a,#255
1623  0141 c70001        	ld	_m_woDisplayedWindow+1,a
1624  0144 c60000        	ld	a,_m_woDisplayedWindow
1625  0147 a4fe          	and	a,#254
1626  0149 c70000        	ld	_m_woDisplayedWindow,a
1627                     ; 132 	_bres(m_woDisplayedWindow, WIN_MENUS);
1629  014c c60001        	ld	a,_m_woDisplayedWindow+1
1630  014f a4ff          	and	a,#255
1631  0151 c70001        	ld	_m_woDisplayedWindow+1,a
1632  0154 c60000        	ld	a,_m_woDisplayedWindow
1633  0157 a4fd          	and	a,#253
1634  0159 c70000        	ld	_m_woDisplayedWindow,a
1635                     ; 133 }
1638  015c 81            	ret
1687                     ; 136 void windowMessage(BYTE * a_strMessage1, BYTE * a_strMessage2)
1687                     ; 137 {
1688                     	switch	.text
1690                     	xref.b	_windowMessage$L
1691  015d               _windowMessage:
1693  015d b701          	ld	_windowMessage$L+1,a
1694  015f bf00          	ld	_windowMessage$L,x
1696                     ; 138 	if (!_btst(m_woDisplayedWindow, WIN_MESSAGE)) //Not displayed
1698  0161 c60001        	ld	a,_m_woDisplayedWindow+1
1699  0164 a520          	bcp	a,#32
1700  0166 263e          	jrne	L1401
1701                     ; 140 		displayClearArea(WINDOW_3_LEFT, WINDOW_3_TOP, WINDOW_3_RIGHT, WINDOW_3_BOTTOM);
1703  0168 a640          	ld	a,#64
1704  016a b703          	ld	_displayClearArea$L+3,a
1705  016c a67e          	ld	a,#126
1706  016e b702          	ld	_displayClearArea$L+2,a
1707  0170 4f            	clr	a
1708  0171 5f            	clr	x
1709  0172 cd0000        	call	_displayClearArea
1711                     ; 141 		displaySetOutLine(WINDOW_3_LEFT, WINDOW_3_TOP, WINDOW_3_RIGHT, WINDOW_3_BOTTOM, false);
1713  0175 3f04          	clr	_displaySetOutLine$L+4
1714  0177 a640          	ld	a,#64
1715  0179 b703          	ld	_displaySetOutLine$L+3,a
1716  017b a67e          	ld	a,#126
1717  017d b702          	ld	_displaySetOutLine$L+2,a
1718  017f 4f            	clr	a
1719  0180 5f            	clr	x
1720  0181 cd0000        	call	_displaySetOutLine
1722                     ; 144 		displayWriteString("messaggio:", DISPLAY_SELECT_FONT_MINI, WINDOW_3_LEFT+2, WINDOW_3_TOP+6);
1724  0184 a606          	ld	a,#6
1725  0186 b704          	ld	_displayWriteString$L+4,a
1726  0188 a602          	ld	a,#2
1727  018a b703          	ld	_displayWriteString$L+3,a
1728  018c a61c          	ld	a,#28
1729  018e b702          	ld	_displayWriteString$L+2,a
1730  0190 a6f0          	ld	a,#low(L3401)
1731  0192 aef0          	ld	x,#high(L3401)
1732  0194 cd0000        	call	_displayWriteString
1734                     ; 145 		displayInvertArea(WINDOW_3_LEFT+1, WINDOW_3_TOP+1, WINDOW_3_RIGHT-2, WINDOW_3_TOP+6);
1736  0197 a606          	ld	a,#6
1737  0199 b703          	ld	_displayInvertArea$L+3,a
1738  019b a67c          	ld	a,#124
1739  019d b702          	ld	_displayInvertArea$L+2,a
1740  019f a601          	ld	a,#1
1741  01a1 ae01          	ld	x,#1
1742  01a3 cd0000        	call	_displayInvertArea
1744  01a6               L1401:
1745                     ; 148 	displayWriteString(a_strMessage1, DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+10);	
1747  01a6 a60a          	ld	a,#10
1748  01a8 b704          	ld	_displayWriteString$L+4,a
1749  01aa a605          	ld	a,#5
1750  01ac b703          	ld	_displayWriteString$L+3,a
1751  01ae a61d          	ld	a,#29
1752  01b0 b702          	ld	_displayWriteString$L+2,a
1753  01b2 b601          	ld	a,_windowMessage$L+1
1754  01b4 be00          	ld	x,_windowMessage$L
1755  01b6 cd0000        	call	_displayWriteString
1757                     ; 149 	displayWriteString(a_strMessage2, DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+20);	
1759  01b9 a614          	ld	a,#20
1760  01bb b704          	ld	_displayWriteString$L+4,a
1761  01bd a605          	ld	a,#5
1762  01bf b703          	ld	_displayWriteString$L+3,a
1763  01c1 a61d          	ld	a,#29
1764  01c3 b702          	ld	_displayWriteString$L+2,a
1765  01c5 b603          	ld	a,_windowMessage$L+3
1766  01c7 be02          	ld	x,_windowMessage$L+2
1767  01c9 cd0000        	call	_displayWriteString
1769                     ; 152 	_bset(m_woDisplayedWindow, WIN_MESSAGE);
1771  01cc c60001        	ld	a,_m_woDisplayedWindow+1
1772  01cf aa20          	or	a,#32
1773  01d1 c70001        	ld	_m_woDisplayedWindow+1,a
1774                     ; 153 	_bres(m_woDisplayedWindow, WIN_FUNCTIONS);
1776  01d4 c60001        	ld	a,_m_woDisplayedWindow+1
1777  01d7 a4bf          	and	a,#191
1778  01d9 c70001        	ld	_m_woDisplayedWindow+1,a
1779                     ; 154 	_bres(m_woDisplayedWindow, WIN_PARAMETERS);
1781  01dc c60001        	ld	a,_m_woDisplayedWindow+1
1782  01df a47f          	and	a,#127
1783  01e1 c70001        	ld	_m_woDisplayedWindow+1,a
1784                     ; 155 	_bres(m_woDisplayedWindow, WIN_TESTS);
1786  01e4 c60001        	ld	a,_m_woDisplayedWindow+1
1787  01e7 a4ff          	and	a,#255
1788  01e9 c70001        	ld	_m_woDisplayedWindow+1,a
1789  01ec c60000        	ld	a,_m_woDisplayedWindow
1790  01ef a4fe          	and	a,#254
1791  01f1 c70000        	ld	_m_woDisplayedWindow,a
1792                     ; 156 	_bres(m_woDisplayedWindow, WIN_MENUS);
1794  01f4 c60001        	ld	a,_m_woDisplayedWindow+1
1795  01f7 a4ff          	and	a,#255
1796  01f9 c70001        	ld	_m_woDisplayedWindow+1,a
1797  01fc c60000        	ld	a,_m_woDisplayedWindow
1798  01ff a4fd          	and	a,#253
1799  0201 c70000        	ld	_m_woDisplayedWindow,a
1800                     ; 157 }
1803  0204 81            	ret
1852                     ; 160 void windowBigMessage(BYTE * a_strMessage1, BYTE * a_strMessage2)
1852                     ; 161 {
1853                     	switch	.text
1855                     	xref.b	_windowBigMessage$L
1856  0205               _windowBigMessage:
1858  0205 b701          	ld	_windowBigMessage$L+1,a
1859  0207 bf00          	ld	_windowBigMessage$L,x
1861                     ; 162 	if (!_btst(m_woDisplayedWindow, WIN_MESSAGE)) //Not displayed
1863  0209 c60001        	ld	a,_m_woDisplayedWindow+1
1864  020c a520          	bcp	a,#32
1865  020e 263e          	jrne	L7601
1866                     ; 164 		displayClearArea(0, 0, 126, 64);
1868  0210 a640          	ld	a,#64
1869  0212 b703          	ld	_displayClearArea$L+3,a
1870  0214 a67e          	ld	a,#126
1871  0216 b702          	ld	_displayClearArea$L+2,a
1872  0218 4f            	clr	a
1873  0219 5f            	clr	x
1874  021a cd0000        	call	_displayClearArea
1876                     ; 165 		displaySetOutLine(0, 0, 126, 64, false);
1878  021d 3f04          	clr	_displaySetOutLine$L+4
1879  021f a640          	ld	a,#64
1880  0221 b703          	ld	_displaySetOutLine$L+3,a
1881  0223 a67e          	ld	a,#126
1882  0225 b702          	ld	_displaySetOutLine$L+2,a
1883  0227 4f            	clr	a
1884  0228 5f            	clr	x
1885  0229 cd0000        	call	_displaySetOutLine
1887                     ; 168 		displayWriteString("messaggio:", DISPLAY_SELECT_FONT_MINI, 2, 6);
1889  022c a606          	ld	a,#6
1890  022e b704          	ld	_displayWriteString$L+4,a
1891  0230 a602          	ld	a,#2
1892  0232 b703          	ld	_displayWriteString$L+3,a
1893  0234 a61c          	ld	a,#28
1894  0236 b702          	ld	_displayWriteString$L+2,a
1895  0238 a6f0          	ld	a,#low(L3401)
1896  023a aef0          	ld	x,#high(L3401)
1897  023c cd0000        	call	_displayWriteString
1899                     ; 169 		displayInvertArea(1, 1, 124, 6);
1901  023f a606          	ld	a,#6
1902  0241 b703          	ld	_displayInvertArea$L+3,a
1903  0243 a67c          	ld	a,#124
1904  0245 b702          	ld	_displayInvertArea$L+2,a
1905  0247 a601          	ld	a,#1
1906  0249 ae01          	ld	x,#1
1907  024b cd0000        	call	_displayInvertArea
1909  024e               L7601:
1910                     ; 172 	displayWriteString(a_strMessage1, DISPLAY_SELECT_FONT_5x7, 5, 25);	
1912  024e a619          	ld	a,#25
1913  0250 b704          	ld	_displayWriteString$L+4,a
1914  0252 a605          	ld	a,#5
1915  0254 b703          	ld	_displayWriteString$L+3,a
1916  0256 a61d          	ld	a,#29
1917  0258 b702          	ld	_displayWriteString$L+2,a
1918  025a b601          	ld	a,_windowBigMessage$L+1
1919  025c be00          	ld	x,_windowBigMessage$L
1920  025e cd0000        	call	_displayWriteString
1922                     ; 173 	displayWriteString(a_strMessage2, DISPLAY_SELECT_FONT_5x7, 5, 40);	
1924  0261 a628          	ld	a,#40
1925  0263 b704          	ld	_displayWriteString$L+4,a
1926  0265 a605          	ld	a,#5
1927  0267 b703          	ld	_displayWriteString$L+3,a
1928  0269 a61d          	ld	a,#29
1929  026b b702          	ld	_displayWriteString$L+2,a
1930  026d b603          	ld	a,_windowBigMessage$L+3
1931  026f be02          	ld	x,_windowBigMessage$L+2
1932  0271 cd0000        	call	_displayWriteString
1934                     ; 176 	_bres(m_woDisplayedWindow, WIN_MODE);
1936  0274 c60001        	ld	a,_m_woDisplayedWindow+1
1937  0277 a4fe          	and	a,#254
1938  0279 c70001        	ld	_m_woDisplayedWindow+1,a
1939                     ; 177 	_bres(m_woDisplayedWindow, WIN_SPEED);
1941  027c c60001        	ld	a,_m_woDisplayedWindow+1
1942  027f a4fd          	and	a,#253
1943  0281 c70001        	ld	_m_woDisplayedWindow+1,a
1944                     ; 178 	_bres(m_woDisplayedWindow, WIN_OSCILLOSCOPE);
1946  0284 c60001        	ld	a,_m_woDisplayedWindow+1
1947  0287 a4fb          	and	a,#251
1948  0289 c70001        	ld	_m_woDisplayedWindow+1,a
1949                     ; 179 	_bres(m_woDisplayedWindow, WIN_REGISTER);
1951  028c c60001        	ld	a,_m_woDisplayedWindow+1
1952  028f a4f7          	and	a,#247
1953  0291 c70001        	ld	_m_woDisplayedWindow+1,a
1954                     ; 180 	_bres(m_woDisplayedWindow, WIN_ALARM);
1956  0294 c60001        	ld	a,_m_woDisplayedWindow+1
1957  0297 a4ef          	and	a,#239
1958  0299 c70001        	ld	_m_woDisplayedWindow+1,a
1959                     ; 181 	_bset(m_woDisplayedWindow, WIN_MESSAGE);
1961  029c c60001        	ld	a,_m_woDisplayedWindow+1
1962  029f aa20          	or	a,#32
1963  02a1 c70001        	ld	_m_woDisplayedWindow+1,a
1964                     ; 182 	_bres(m_woDisplayedWindow, WIN_FUNCTIONS);
1966  02a4 c60001        	ld	a,_m_woDisplayedWindow+1
1967  02a7 a4bf          	and	a,#191
1968  02a9 c70001        	ld	_m_woDisplayedWindow+1,a
1969                     ; 183 	_bres(m_woDisplayedWindow, WIN_PARAMETERS);
1971  02ac c60001        	ld	a,_m_woDisplayedWindow+1
1972  02af a47f          	and	a,#127
1973  02b1 c70001        	ld	_m_woDisplayedWindow+1,a
1974                     ; 184 	_bres(m_woDisplayedWindow, WIN_TESTS);
1976  02b4 c60001        	ld	a,_m_woDisplayedWindow+1
1977  02b7 a4ff          	and	a,#255
1978  02b9 c70001        	ld	_m_woDisplayedWindow+1,a
1979  02bc c60000        	ld	a,_m_woDisplayedWindow
1980  02bf a4fe          	and	a,#254
1981  02c1 c70000        	ld	_m_woDisplayedWindow,a
1982                     ; 185 	_bres(m_woDisplayedWindow, WIN_MENUS);
1984  02c4 c60001        	ld	a,_m_woDisplayedWindow+1
1985  02c7 a4ff          	and	a,#255
1986  02c9 c70001        	ld	_m_woDisplayedWindow+1,a
1987  02cc c60000        	ld	a,_m_woDisplayedWindow
1988  02cf a4fd          	and	a,#253
1989  02d1 c70000        	ld	_m_woDisplayedWindow,a
1990                     ; 186 }
1993  02d4 81            	ret
2021                     ; 189 void windowAlarm(void)
2021                     ; 190 {
2022                     	switch	.text
2023  02d5               _windowAlarm:
2026                     ; 192 	if (!_btst(m_woDisplayedWindow, WIN_ALARM)) //Not displayed
2028  02d5 c60001        	ld	a,_m_woDisplayedWindow+1
2029  02d8 a510          	bcp	a,#16
2030  02da 263e          	jrne	L1011
2031                     ; 194 		displayClearArea(WINDOW_3_LEFT, WINDOW_3_TOP, WINDOW_3_RIGHT, WINDOW_3_BOTTOM);
2033  02dc a640          	ld	a,#64
2034  02de b703          	ld	_displayClearArea$L+3,a
2035  02e0 a67e          	ld	a,#126
2036  02e2 b702          	ld	_displayClearArea$L+2,a
2037  02e4 4f            	clr	a
2038  02e5 5f            	clr	x
2039  02e6 cd0000        	call	_displayClearArea
2041                     ; 195 		displaySetOutLine(WINDOW_3_LEFT, WINDOW_3_TOP, WINDOW_3_RIGHT, WINDOW_3_BOTTOM, false);
2043  02e9 3f04          	clr	_displaySetOutLine$L+4
2044  02eb a640          	ld	a,#64
2045  02ed b703          	ld	_displaySetOutLine$L+3,a
2046  02ef a67e          	ld	a,#126
2047  02f1 b702          	ld	_displaySetOutLine$L+2,a
2048  02f3 4f            	clr	a
2049  02f4 5f            	clr	x
2050  02f5 cd0000        	call	_displaySetOutLine
2052                     ; 198 		displayWriteString("allarme:", DISPLAY_SELECT_FONT_MINI, WINDOW_3_LEFT+2, WINDOW_3_TOP+6);
2054  02f8 a606          	ld	a,#6
2055  02fa b704          	ld	_displayWriteString$L+4,a
2056  02fc a602          	ld	a,#2
2057  02fe b703          	ld	_displayWriteString$L+3,a
2058  0300 a61c          	ld	a,#28
2059  0302 b702          	ld	_displayWriteString$L+2,a
2060  0304 a6e7          	ld	a,#low(L3011)
2061  0306 aee7          	ld	x,#high(L3011)
2062  0308 cd0000        	call	_displayWriteString
2064                     ; 199 		displayInvertArea(WINDOW_3_LEFT+1, WINDOW_3_TOP+1, WINDOW_3_RIGHT-2, WINDOW_3_TOP+6);
2066  030b a606          	ld	a,#6
2067  030d b703          	ld	_displayInvertArea$L+3,a
2068  030f a67c          	ld	a,#124
2069  0311 b702          	ld	_displayInvertArea$L+2,a
2070  0313 a601          	ld	a,#1
2071  0315 ae01          	ld	x,#1
2072  0317 cd0000        	call	_displayInvertArea
2074  031a               L1011:
2075                     ; 202 	if _btst(parametersGetValue(PARAM_ALARM), STI_ANSWER_ALARM_ERR_NO_PRINT)
2077  031a a602          	ld	a,#2
2078  031c cd0000        	call	_parametersGetValue
2080  031f 9f            	ld	a,x
2081  0320 a410          	and	a,#16
2082  0322 97            	ld	x,a
2083  0323 4f            	clr	a
2084  0324 4d            	tnz	a
2085  0325 2601          	jrne	L42
2086  0327 5d            	tnz	x
2087  0328               L42:
2088  0328 2716          	jreq	L5011
2089                     ; 204 		displayWriteString("Mancanza stampa", DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+25);	
2091  032a a619          	ld	a,#25
2092  032c b704          	ld	_displayWriteString$L+4,a
2093  032e a605          	ld	a,#5
2094  0330 b703          	ld	_displayWriteString$L+3,a
2095  0332 a61d          	ld	a,#29
2096  0334 b702          	ld	_displayWriteString$L+2,a
2097  0336 a6d7          	ld	a,#low(L7011)
2098  0338 aed7          	ld	x,#high(L7011)
2099  033a cd0000        	call	_displayWriteString
2102  033d cc04b0        	jp	L1111
2103  0340               L5011:
2104                     ; 206 	else if _btst(parametersGetValue(PARAM_ALARM), STI_ANSWER_ALARM_ERR_LOW_SPEED)
2106  0340 a602          	ld	a,#2
2107  0342 cd0000        	call	_parametersGetValue
2109  0345 9f            	ld	a,x
2110  0346 a420          	and	a,#32
2111  0348 97            	ld	x,a
2112  0349 4f            	clr	a
2113  034a 4d            	tnz	a
2114  034b 2601          	jrne	L62
2115  034d 5d            	tnz	x
2116  034e               L62:
2117  034e 2716          	jreq	L3111
2118                     ; 208 		displayWriteString("Velocita' bassa", DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+25);	
2120  0350 a619          	ld	a,#25
2121  0352 b704          	ld	_displayWriteString$L+4,a
2122  0354 a605          	ld	a,#5
2123  0356 b703          	ld	_displayWriteString$L+3,a
2124  0358 a61d          	ld	a,#29
2125  035a b702          	ld	_displayWriteString$L+2,a
2126  035c a6c7          	ld	a,#low(L5111)
2127  035e aec7          	ld	x,#high(L5111)
2128  0360 cd0000        	call	_displayWriteString
2131  0363 cc04b0        	jp	L1111
2132  0366               L3111:
2133                     ; 210 	else if _btst(parametersGetValue(PARAM_ALARM), STI_ANSWER_ALARM_ERR_TEST_SH)
2135  0366 a602          	ld	a,#2
2136  0368 cd0000        	call	_parametersGetValue
2138  036b a501          	bcp	a,#1
2139  036d 2729          	jreq	L1211
2140                     ; 212 		displayWriteString("Test testina", DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+20);	
2142  036f a614          	ld	a,#20
2143  0371 b704          	ld	_displayWriteString$L+4,a
2144  0373 a605          	ld	a,#5
2145  0375 b703          	ld	_displayWriteString$L+3,a
2146  0377 a61d          	ld	a,#29
2147  0379 b702          	ld	_displayWriteString$L+2,a
2148  037b a6ba          	ld	a,#low(L3211)
2149  037d aeba          	ld	x,#high(L3211)
2150  037f cd0000        	call	_displayWriteString
2152                     ; 213 		displayWriteString("fallito", DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+30);	
2154  0382 a61e          	ld	a,#30
2155  0384 b704          	ld	_displayWriteString$L+4,a
2156  0386 a605          	ld	a,#5
2157  0388 b703          	ld	_displayWriteString$L+3,a
2158  038a a61d          	ld	a,#29
2159  038c b702          	ld	_displayWriteString$L+2,a
2160  038e a6b2          	ld	a,#low(L5211)
2161  0390 aeb2          	ld	x,#high(L5211)
2162  0392 cd0000        	call	_displayWriteString
2165  0395 cc04b0        	jp	L1111
2166  0398               L1211:
2167                     ; 215 	else if _btst(parametersGetValue(PARAM_ALARM), STI_ANSWER_ALARM_ERR_TEST_ENC)
2169  0398 a602          	ld	a,#2
2170  039a cd0000        	call	_parametersGetValue
2172  039d a502          	bcp	a,#2
2173  039f 2729          	jreq	L1311
2174                     ; 217 		displayWriteString("Test encoder", DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+20);	
2176  03a1 a614          	ld	a,#20
2177  03a3 b704          	ld	_displayWriteString$L+4,a
2178  03a5 a605          	ld	a,#5
2179  03a7 b703          	ld	_displayWriteString$L+3,a
2180  03a9 a61d          	ld	a,#29
2181  03ab b702          	ld	_displayWriteString$L+2,a
2182  03ad a6a5          	ld	a,#low(L3311)
2183  03af aea5          	ld	x,#high(L3311)
2184  03b1 cd0000        	call	_displayWriteString
2186                     ; 218 		displayWriteString("fallito", DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+30);	
2188  03b4 a61e          	ld	a,#30
2189  03b6 b704          	ld	_displayWriteString$L+4,a
2190  03b8 a605          	ld	a,#5
2191  03ba b703          	ld	_displayWriteString$L+3,a
2192  03bc a61d          	ld	a,#29
2193  03be b702          	ld	_displayWriteString$L+2,a
2194  03c0 a6b2          	ld	a,#low(L5211)
2195  03c2 aeb2          	ld	x,#high(L5211)
2196  03c4 cd0000        	call	_displayWriteString
2199  03c7 cc04b0        	jp	L1111
2200  03ca               L1311:
2201                     ; 220 	else if _btst(parametersGetValue(PARAM_ALARM), STI_ANSWER_ALARM_ERR_PHASE_AUTO)
2203  03ca a602          	ld	a,#2
2204  03cc cd0000        	call	_parametersGetValue
2206  03cf a504          	bcp	a,#4
2207  03d1 2729          	jreq	L7311
2208                     ; 222 		displayWriteString("Fasatura automatica", DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+20);	
2210  03d3 a614          	ld	a,#20
2211  03d5 b704          	ld	_displayWriteString$L+4,a
2212  03d7 a605          	ld	a,#5
2213  03d9 b703          	ld	_displayWriteString$L+3,a
2214  03db a61d          	ld	a,#29
2215  03dd b702          	ld	_displayWriteString$L+2,a
2216  03df a691          	ld	a,#low(L1411)
2217  03e1 ae91          	ld	x,#high(L1411)
2218  03e3 cd0000        	call	_displayWriteString
2220                     ; 223 		displayWriteString("fallita", DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+30);	
2222  03e6 a61e          	ld	a,#30
2223  03e8 b704          	ld	_displayWriteString$L+4,a
2224  03ea a605          	ld	a,#5
2225  03ec b703          	ld	_displayWriteString$L+3,a
2226  03ee a61d          	ld	a,#29
2227  03f0 b702          	ld	_displayWriteString$L+2,a
2228  03f2 a689          	ld	a,#low(L3411)
2229  03f4 ae89          	ld	x,#high(L3411)
2230  03f6 cd0000        	call	_displayWriteString
2233  03f9 cc04b0        	jp	L1111
2234  03fc               L7311:
2235                     ; 225 	else if _btst(parametersGetValue(PARAM_ALARM), STI_ANSWER_ALARM_CYLINDER_TRAVEL)
2237  03fc a602          	ld	a,#2
2238  03fe cd0000        	call	_parametersGetValue
2240  0401 9f            	ld	a,x
2241  0402 a401          	and	a,#1
2242  0404 97            	ld	x,a
2243  0405 4f            	clr	a
2244  0406 4d            	tnz	a
2245  0407 2601          	jrne	L03
2246  0409 5d            	tnz	x
2247  040a               L03:
2248  040a 2728          	jreq	L7411
2249                     ; 227 		displayWriteString("Sviluppo Cilindro (P1)", DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+20);	
2251  040c a614          	ld	a,#20
2252  040e b704          	ld	_displayWriteString$L+4,a
2253  0410 a605          	ld	a,#5
2254  0412 b703          	ld	_displayWriteString$L+3,a
2255  0414 a61d          	ld	a,#29
2256  0416 b702          	ld	_displayWriteString$L+2,a
2257  0418 a672          	ld	a,#low(L1511)
2258  041a ae72          	ld	x,#high(L1511)
2259  041c cd0000        	call	_displayWriteString
2261                     ; 228 		displayWriteString("non accettabile", DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+30);	
2263  041f a61e          	ld	a,#30
2264  0421 b704          	ld	_displayWriteString$L+4,a
2265  0423 a605          	ld	a,#5
2266  0425 b703          	ld	_displayWriteString$L+3,a
2267  0427 a61d          	ld	a,#29
2268  0429 b702          	ld	_displayWriteString$L+2,a
2269  042b a662          	ld	a,#low(L3511)
2270  042d ae62          	ld	x,#high(L3511)
2271  042f cd0000        	call	_displayWriteString
2274  0432 207c          	jra	L1111
2275  0434               L7411:
2276                     ; 230 	else if _btst(parametersGetValue(PARAM_ALARM), STI_ANSWER_ALARM_GATE_WINDOW)
2278  0434 a602          	ld	a,#2
2279  0436 cd0000        	call	_parametersGetValue
2281  0439 9f            	ld	a,x
2282  043a a402          	and	a,#2
2283  043c 97            	ld	x,a
2284  043d 4f            	clr	a
2285  043e 4d            	tnz	a
2286  043f 2601          	jrne	L23
2287  0441 5d            	tnz	x
2288  0442               L23:
2289  0442 2728          	jreq	L7511
2290                     ; 232 		displayWriteString("Ampiezza Gate (P3)", DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+20);	
2292  0444 a614          	ld	a,#20
2293  0446 b704          	ld	_displayWriteString$L+4,a
2294  0448 a605          	ld	a,#5
2295  044a b703          	ld	_displayWriteString$L+3,a
2296  044c a61d          	ld	a,#29
2297  044e b702          	ld	_displayWriteString$L+2,a
2298  0450 a64f          	ld	a,#low(L1611)
2299  0452 ae4f          	ld	x,#high(L1611)
2300  0454 cd0000        	call	_displayWriteString
2302                     ; 233 		displayWriteString("non accettabile", DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+30);	
2304  0457 a61e          	ld	a,#30
2305  0459 b704          	ld	_displayWriteString$L+4,a
2306  045b a605          	ld	a,#5
2307  045d b703          	ld	_displayWriteString$L+3,a
2308  045f a61d          	ld	a,#29
2309  0461 b702          	ld	_displayWriteString$L+2,a
2310  0463 a662          	ld	a,#low(L3511)
2311  0465 ae62          	ld	x,#high(L3511)
2312  0467 cd0000        	call	_displayWriteString
2315  046a 2044          	jra	L1111
2316  046c               L7511:
2317                     ; 235 	else if _btst(parametersGetValue(PARAM_ALARM), STI_ANSWER_OK)
2319  046c a602          	ld	a,#2
2320  046e cd0000        	call	_parametersGetValue
2322  0471 a501          	bcp	a,#1
2323  0473 2715          	jreq	L5611
2324                     ; 237 		displayWriteString("Nessun problema!", DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+25);	
2326  0475 a619          	ld	a,#25
2327  0477 b704          	ld	_displayWriteString$L+4,a
2328  0479 a605          	ld	a,#5
2329  047b b703          	ld	_displayWriteString$L+3,a
2330  047d a61d          	ld	a,#29
2331  047f b702          	ld	_displayWriteString$L+2,a
2332  0481 a63e          	ld	a,#low(L7611)
2333  0483 ae3e          	ld	x,#high(L7611)
2334  0485 cd0000        	call	_displayWriteString
2337  0488 2026          	jra	L1111
2338  048a               L5611:
2339                     ; 241 		displayWriteString("Codice allarme", DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+20);	
2341  048a a614          	ld	a,#20
2342  048c b704          	ld	_displayWriteString$L+4,a
2343  048e a605          	ld	a,#5
2344  0490 b703          	ld	_displayWriteString$L+3,a
2345  0492 a61d          	ld	a,#29
2346  0494 b702          	ld	_displayWriteString$L+2,a
2347  0496 a62f          	ld	a,#low(L3711)
2348  0498 ae2f          	ld	x,#high(L3711)
2349  049a cd0000        	call	_displayWriteString
2351                     ; 242 		displayWriteString("non riconosciuto", DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+30);	
2353  049d a61e          	ld	a,#30
2354  049f b704          	ld	_displayWriteString$L+4,a
2355  04a1 a605          	ld	a,#5
2356  04a3 b703          	ld	_displayWriteString$L+3,a
2357  04a5 a61d          	ld	a,#29
2358  04a7 b702          	ld	_displayWriteString$L+2,a
2359  04a9 a61e          	ld	a,#low(L5711)
2360  04ab ae1e          	ld	x,#high(L5711)
2361  04ad cd0000        	call	_displayWriteString
2363  04b0               L1111:
2364                     ; 245 	_bres(m_woDisplayedWindow, WIN_OSCILLOSCOPE);
2366  04b0 c60001        	ld	a,_m_woDisplayedWindow+1
2367  04b3 a4fb          	and	a,#251
2368  04b5 c70001        	ld	_m_woDisplayedWindow+1,a
2369                     ; 246 	_bres(m_woDisplayedWindow, WIN_REGISTER);
2371  04b8 c60001        	ld	a,_m_woDisplayedWindow+1
2372  04bb a4f7          	and	a,#247
2373  04bd c70001        	ld	_m_woDisplayedWindow+1,a
2374                     ; 247 	_bset(m_woDisplayedWindow, WIN_ALARM);
2376  04c0 c60001        	ld	a,_m_woDisplayedWindow+1
2377  04c3 aa10          	or	a,#16
2378  04c5 c70001        	ld	_m_woDisplayedWindow+1,a
2379                     ; 248 	_bres(m_woDisplayedWindow, WIN_MESSAGE);
2381  04c8 c60001        	ld	a,_m_woDisplayedWindow+1
2382  04cb a4df          	and	a,#223
2383  04cd c70001        	ld	_m_woDisplayedWindow+1,a
2384                     ; 249 	_bres(m_woDisplayedWindow, WIN_FUNCTIONS);
2386  04d0 c60001        	ld	a,_m_woDisplayedWindow+1
2387  04d3 a4bf          	and	a,#191
2388  04d5 c70001        	ld	_m_woDisplayedWindow+1,a
2389                     ; 250 	_bres(m_woDisplayedWindow, WIN_PARAMETERS);
2391  04d8 c60001        	ld	a,_m_woDisplayedWindow+1
2392  04db a47f          	and	a,#127
2393  04dd c70001        	ld	_m_woDisplayedWindow+1,a
2394                     ; 251 	_bres(m_woDisplayedWindow, WIN_TESTS);
2396  04e0 c60001        	ld	a,_m_woDisplayedWindow+1
2397  04e3 a4ff          	and	a,#255
2398  04e5 c70001        	ld	_m_woDisplayedWindow+1,a
2399  04e8 c60000        	ld	a,_m_woDisplayedWindow
2400  04eb a4fe          	and	a,#254
2401  04ed c70000        	ld	_m_woDisplayedWindow,a
2402                     ; 252 	_bres(m_woDisplayedWindow, WIN_MENUS);
2404  04f0 c60001        	ld	a,_m_woDisplayedWindow+1
2405  04f3 a4ff          	and	a,#255
2406  04f5 c70001        	ld	_m_woDisplayedWindow+1,a
2407  04f8 c60000        	ld	a,_m_woDisplayedWindow
2408  04fb a4fd          	and	a,#253
2409  04fd c70000        	ld	_m_woDisplayedWindow,a
2410                     ; 253 }
2413  0500 81            	ret
2457                     ; 257 BYTE windowOscilloscopeGetValue(WORD a_woEncIndex)
2457                     ; 258 {
2458                     	switch	.text
2460                     	xref.b	_windowOscilloscopeGetValue$L
2461  0501               _windowOscilloscopeGetValue:
2463  0501 b701          	ld	_windowOscilloscopeGetValue$L+1,a
2464  0503 bf00          	ld	_windowOscilloscopeGetValue$L,x
2466                     ; 261 	a_woEncIndex = (a_woEncIndex+8)& (ENCODER_PULSES-1);
2468  0505 b601          	ld	a,_windowOscilloscopeGetValue$L+1
2469  0507 be00          	ld	x,_windowOscilloscopeGetValue$L
2470  0509 ab08          	add	a,#8
2471  050b 2401          	jrnc	L63
2472  050d 5c            	inc	x
2473  050e               L63:
2474  050e a4ff          	and	a,#255
2475  0510 88            	push	a
2476  0511 9f            	ld	a,x
2477  0512 a403          	and	a,#3
2478  0514 97            	ld	x,a
2479  0515 84            	pop	a
2480  0516 b701          	ld	_windowOscilloscopeGetValue$L+1,a
2481  0518 bf00          	ld	_windowOscilloscopeGetValue$L,x
2482                     ; 262 	byValue = m_arbyScanningHeadSignal[(WORD)(a_woEncIndex>>2)];  //Array Index
2484  051a b601          	ld	a,_windowOscilloscopeGetValue$L+1
2485  051c be00          	ld	x,_windowOscilloscopeGetValue$L
2486  051e 54            	srl	x
2487  051f 46            	rrc	a
2488  0520 54            	srl	x
2489  0521 46            	rrc	a
2490  0522 ab00          	add	a,#low(_m_arbyScanningHeadSignal)
2491  0524 88            	push	a
2492  0525 9f            	ld	a,x
2493  0526 a900          	adc	a,#high(_m_arbyScanningHeadSignal)
2494  0528 97            	ld	x,a
2495  0529 84            	pop	a
2496  052a bf00          	ld	c_x,x
2497  052c 97            	ld	x,a
2498  052d bf01          	ld	c_x+1,x
2499  052f 92c600        	ld	a,[c_x.w]
2500  0532 b7ff          	ld	_windowOscilloscopeGetValue$L-1,a
2501                     ; 264 	switch ((BYTE)(a_woEncIndex & 0x0003)) //0b00000011 -->  Byte Index
2503  0534 b601          	ld	a,_windowOscilloscopeGetValue$L+1
2504  0536 a403          	and	a,#3
2506                     ; 277 			break;
2508  0538 4d            	tnz	a
2509  0539 270b          	jreq	L7711
2510  053b 4a            	dec	a
2511  053c 2712          	jreq	L1021
2512  053e 4a            	dec	a
2513  053f 2717          	jreq	L3021
2514  0541 4a            	dec	a
2515  0542 271b          	jreq	L5021
2516  0544 201e          	jra	L3321
2517  0546               L7711:
2518                     ; 266 		case 0:
2518                     ; 267 			return (BYTE)((byValue & 0b11000000)>>6);
2520  0546 b6ff          	ld	a,_windowOscilloscopeGetValue$L-1
2521  0548 a4c0          	and	a,#192
2522  054a 4e            	swap	a
2523  054b 44            	srl	a
2524  054c 44            	srl	a
2525  054d a403          	and	a,#3
2528  054f 81            	ret
2529  0550               L1021:
2530                     ; 269 		case 1:
2530                     ; 270 			return (BYTE)((byValue & 0b00110000)>>4);
2533  0550 b6ff          	ld	a,_windowOscilloscopeGetValue$L-1
2534  0552 a430          	and	a,#48
2535  0554 4e            	swap	a
2536  0555 a40f          	and	a,#15
2539  0557 81            	ret
2540  0558               L3021:
2541                     ; 272 		case 2:
2541                     ; 273 			return (BYTE)((byValue & 0b00001100)>>2);
2544  0558 b6ff          	ld	a,_windowOscilloscopeGetValue$L-1
2545  055a a40c          	and	a,#12
2546  055c 44            	srl	a
2547  055d 44            	srl	a
2550  055e 81            	ret
2551  055f               L5021:
2552                     ; 275 		case 3:
2552                     ; 276 			return (BYTE)(byValue & 0b00000011);
2555  055f b6ff          	ld	a,_windowOscilloscopeGetValue$L-1
2556  0561 a403          	and	a,#3
2559  0563 81            	ret
2560  0564               L3321:
2561                     ; 280 }
2564  0564 81            	ret
2599                     ; 284 BYTE windowIsInGate(WORD a_woEncIndex)
2599                     ; 285 {
2600                     	switch	.text
2602                     	xref.b	_windowIsInGate$L
2603  0565               _windowIsInGate:
2605  0565 b701          	ld	_windowIsInGate$L+1,a
2606  0567 bf00          	ld	_windowIsInGate$L,x
2608                     ; 286 	if (m_woEncoderGateEnd > m_woEncoderGateStart)
2610  0569 c60001        	ld	a,_m_woEncoderGateStart+1
2611  056c c00001        	sub	a,_m_woEncoderGateEnd+1
2612  056f c60000        	ld	a,_m_woEncoderGateStart
2613  0572 c20000        	sbc	a,_m_woEncoderGateEnd
2614  0575 241e          	jruge	L3521
2615                     ; 288 		return ((a_woEncIndex >m_woEncoderGateStart) && (a_woEncIndex<m_woEncoderGateEnd));
2617  0577 c60001        	ld	a,_m_woEncoderGateStart+1
2618  057a b001          	sub	a,_windowIsInGate$L+1
2619  057c c60000        	ld	a,_m_woEncoderGateStart
2620  057f b200          	sbc	a,_windowIsInGate$L
2621  0581 2410          	jruge	L24
2622  0583 b601          	ld	a,_windowIsInGate$L+1
2623  0585 c00001        	sub	a,_m_woEncoderGateEnd+1
2624  0588 b600          	ld	a,_windowIsInGate$L
2625  058a c20000        	sbc	a,_m_woEncoderGateEnd
2626  058d 2404          	jruge	L24
2627  058f a601          	ld	a,#1
2628  0591 2001          	jra	L44
2629  0593               L24:
2630  0593 4f            	clr	a
2631  0594               L44:
2634  0594 81            	ret
2635  0595               L3521:
2636                     ; 292 		return ((a_woEncIndex >m_woEncoderGateStart) || (a_woEncIndex<m_woEncoderGateEnd));
2638  0595 c60001        	ld	a,_m_woEncoderGateStart+1
2639  0598 b001          	sub	a,_windowIsInGate$L+1
2640  059a c60000        	ld	a,_m_woEncoderGateStart
2641  059d b200          	sbc	a,_windowIsInGate$L
2642  059f 250c          	jrult	L05
2643  05a1 b601          	ld	a,_windowIsInGate$L+1
2644  05a3 c00001        	sub	a,_m_woEncoderGateEnd+1
2645  05a6 b600          	ld	a,_windowIsInGate$L
2646  05a8 c20000        	sbc	a,_m_woEncoderGateEnd
2647  05ab 2404          	jruge	L64
2648  05ad               L05:
2649  05ad a601          	ld	a,#1
2650  05af 2001          	jra	L25
2651  05b1               L64:
2652  05b1 4f            	clr	a
2653  05b2               L25:
2656  05b2 81            	ret
2694                     ; 297 WORD windowOffsetToHaveCenteredGate(void)
2694                     ; 298 {
2695                     	switch	.text
2697                     	xref.b	_windowOffsetToHaveCenteredGate$L
2698  05b3               _windowOffsetToHaveCenteredGate:
2701                     ; 301 	if ((m_woEncoderGateStart != 0xFFFF) && (m_woEncoderGateEnd != 0xFFFF))
2703  05b3 c60001        	ld	a,_m_woEncoderGateStart+1
2704  05b6 a1ff          	cp	a,#255
2705  05b8 2605          	jrne	L65
2706  05ba ce0000        	ld	x,_m_woEncoderGateStart
2707  05bd a3ff          	cp	x,#255
2708  05bf               L65:
2709  05bf 2603          	jrne	L26
2710  05c1 cc064e        	jp	L5721
2711  05c4               L26:
2713  05c4 c60001        	ld	a,_m_woEncoderGateEnd+1
2714  05c7 a1ff          	cp	a,#255
2715  05c9 2605          	jrne	L06
2716  05cb ce0000        	ld	x,_m_woEncoderGateEnd
2717  05ce a3ff          	cp	x,#255
2718  05d0               L06:
2719  05d0 2602          	jrne	L46
2720  05d2 207a          	jp	L5721
2721  05d4               L46:
2722                     ; 303 		if (m_woEncoderGateEnd > m_woEncoderGateStart)
2724  05d4 c60001        	ld	a,_m_woEncoderGateStart+1
2725  05d7 c00001        	sub	a,_m_woEncoderGateEnd+1
2726  05da c60000        	ld	a,_m_woEncoderGateStart
2727  05dd c20000        	sbc	a,_m_woEncoderGateEnd
2728  05e0 2418          	jruge	L7721
2729                     ; 305 			woEncoderGateCenter = (m_woEncoderGateEnd + m_woEncoderGateStart)/2;
2731  05e2 c60001        	ld	a,_m_woEncoderGateEnd+1
2732  05e5 ce0000        	ld	x,_m_woEncoderGateEnd
2733  05e8 cb0001        	add	a,_m_woEncoderGateStart+1
2734  05eb 88            	push	a
2735  05ec 9f            	ld	a,x
2736  05ed c90000        	adc	a,_m_woEncoderGateStart
2737  05f0 97            	ld	x,a
2738  05f1 84            	pop	a
2739  05f2 54            	srl	x
2740  05f3 46            	rrc	a
2741  05f4 b7ff          	ld	_windowOffsetToHaveCenteredGate$L-1,a
2742  05f6 bffe          	ld	_windowOffsetToHaveCenteredGate$L-2,x
2744  05f8 2026          	jra	L1031
2745  05fa               L7721:
2746                     ; 309 			woEncoderGateCenter = ((ENCODER_PULSES+m_woEncoderGateEnd+m_woEncoderGateStart)/2)& (ENCODER_PULSES-1);
2748  05fa c60001        	ld	a,_m_woEncoderGateEnd+1
2749  05fd ce0000        	ld	x,_m_woEncoderGateEnd
2750  0600 cb0001        	add	a,_m_woEncoderGateStart+1
2751  0603 88            	push	a
2752  0604 9f            	ld	a,x
2753  0605 c90000        	adc	a,_m_woEncoderGateStart
2754  0608 97            	ld	x,a
2755  0609 84            	pop	a
2756  060a ab00          	add	a,#0
2757  060c 88            	push	a
2758  060d 9f            	ld	a,x
2759  060e a904          	adc	a,#4
2760  0610 97            	ld	x,a
2761  0611 84            	pop	a
2762  0612 54            	srl	x
2763  0613 46            	rrc	a
2764  0614 a4ff          	and	a,#255
2765  0616 88            	push	a
2766  0617 9f            	ld	a,x
2767  0618 a403          	and	a,#3
2768  061a 97            	ld	x,a
2769  061b 84            	pop	a
2770  061c b7ff          	ld	_windowOffsetToHaveCenteredGate$L-1,a
2771  061e bffe          	ld	_windowOffsetToHaveCenteredGate$L-2,x
2772  0620               L1031:
2773                     ; 312 		return (WORD) (ENCODER_PULSES + woEncoderGateCenter - (((WINDOW_3_WIDTH-4)/2)*parametersGetValue(PARAM_OSCIL_ZOOM)))& (ENCODER_PULSES-1);
2775  0620 a60b          	ld	a,#11
2776  0622 cd0000        	call	_parametersGetValue
2778  0625 3f00          	clr	c_y
2779  0627 90ae3d        	ld	y,#61
2780  062a cd0000        	call	c_imul
2782  062d b7fd          	ld	_windowOffsetToHaveCenteredGate$L-3,a
2783  062f bffc          	ld	_windowOffsetToHaveCenteredGate$L-4,x
2784  0631 b6ff          	ld	a,_windowOffsetToHaveCenteredGate$L-1
2785  0633 befe          	ld	x,_windowOffsetToHaveCenteredGate$L-2
2786  0635 ab00          	add	a,#0
2787  0637 88            	push	a
2788  0638 9f            	ld	a,x
2789  0639 a904          	adc	a,#4
2790  063b 97            	ld	x,a
2791  063c 84            	pop	a
2792  063d b0fd          	sub	a,_windowOffsetToHaveCenteredGate$L-3
2793  063f 88            	push	a
2794  0640 9f            	ld	a,x
2795  0641 b2fc          	sbc	a,_windowOffsetToHaveCenteredGate$L-4
2796  0643 97            	ld	x,a
2797  0644 84            	pop	a
2798  0645 a4ff          	and	a,#255
2799  0647 88            	push	a
2800  0648 9f            	ld	a,x
2801  0649 a403          	and	a,#3
2802  064b 97            	ld	x,a
2803  064c 84            	pop	a
2806  064d 81            	ret
2807  064e               L5721:
2808                     ; 314 	return 0x0000;
2810  064e 5f            	clr	x
2811  064f 4f            	clr	a
2814  0650 81            	ret
2936                     ; 321 void windowOscilloscope(BYTE a_byCenterPulse, BYTE a_byPage)
2936                     ; 322 {
2937                     	switch	.text
2939                     	xref.b	_windowOscilloscope$L
2940  0651               _windowOscilloscope:
2943                     ; 328 	BYTE byPrevValue = WINDOW_3_OSCILLOSCOPE_Y;
2945  0651 a637          	ld	a,#55
2946  0653 b7f7          	ld	_windowOscilloscope$L-9,a
2947                     ; 335 	if (!_btst(m_woDisplayedWindow, WIN_OSCILLOSCOPE)) //Not displayed
2949  0655 c60001        	ld	a,_m_woDisplayedWindow+1
2950  0658 a504          	bcp	a,#4
2951  065a 264a          	jrne	L1631
2952                     ; 337 		displayClearArea(WINDOW_3_LEFT, WINDOW_3_TOP, WINDOW_3_RIGHT, WINDOW_3_BOTTOM);
2954  065c a640          	ld	a,#64
2955  065e b703          	ld	_displayClearArea$L+3,a
2956  0660 a67e          	ld	a,#126
2957  0662 b702          	ld	_displayClearArea$L+2,a
2958  0664 4f            	clr	a
2959  0665 5f            	clr	x
2960  0666 cd0000        	call	_displayClearArea
2962                     ; 338 		displaySetOutLine(WINDOW_3_LEFT, WINDOW_3_TOP, WINDOW_3_RIGHT, WINDOW_3_BOTTOM, false);
2964  0669 3f04          	clr	_displaySetOutLine$L+4
2965  066b a640          	ld	a,#64
2966  066d b703          	ld	_displaySetOutLine$L+3,a
2967  066f a67e          	ld	a,#126
2968  0671 b702          	ld	_displaySetOutLine$L+2,a
2969  0673 4f            	clr	a
2970  0674 5f            	clr	x
2971  0675 cd0000        	call	_displaySetOutLine
2973                     ; 339 		displayWriteString("Taj Scope:", DISPLAY_SELECT_FONT_MINI, WINDOW_3_LEFT+2, WINDOW_3_TOP+6);
2975  0678 a606          	ld	a,#6
2976  067a b704          	ld	_displayWriteString$L+4,a
2977  067c a602          	ld	a,#2
2978  067e b703          	ld	_displayWriteString$L+3,a
2979  0680 a61c          	ld	a,#28
2980  0682 b702          	ld	_displayWriteString$L+2,a
2981  0684 a613          	ld	a,#low(L3631)
2982  0686 ae13          	ld	x,#high(L3631)
2983  0688 cd0000        	call	_displayWriteString
2985                     ; 340 		displayInvertArea(WINDOW_3_LEFT+1, WINDOW_3_TOP+1, WINDOW_3_RIGHT-2, WINDOW_3_TOP+7);
2987  068b a607          	ld	a,#7
2988  068d b703          	ld	_displayInvertArea$L+3,a
2989  068f a67c          	ld	a,#124
2990  0691 b702          	ld	_displayInvertArea$L+2,a
2991  0693 a601          	ld	a,#1
2992  0695 ae01          	ld	x,#1
2993  0697 cd0000        	call	_displayInvertArea
2995                     ; 343 		parametersSet(PARAM_OSCIL_OFFSET, windowOffsetToHaveCenteredGate());
2997  069a cd05b3        	call	_windowOffsetToHaveCenteredGate
2999  069d b702          	ld	_parametersSet$L+2,a
3000  069f bf01          	ld	_parametersSet$L+1,x
3001  06a1 a60c          	ld	a,#12
3002  06a3 cd0000        	call	_parametersSet
3004  06a6               L1631:
3005                     ; 347 	if ((m_woEncoderGateStart != 0xFFFF) && (m_woEncoderGateEnd != 0xFFFF))
3007  06a6 c60001        	ld	a,_m_woEncoderGateStart+1
3008  06a9 a1ff          	cp	a,#255
3009  06ab 2605          	jrne	L07
3010  06ad ce0000        	ld	x,_m_woEncoderGateStart
3011  06b0 a3ff          	cp	x,#255
3012  06b2               L07:
3013  06b2 2603          	jrne	L611
3014  06b4 cc081e        	jp	L5631
3015  06b7               L611:
3017  06b7 c60001        	ld	a,_m_woEncoderGateEnd+1
3018  06ba a1ff          	cp	a,#255
3019  06bc 2605          	jrne	L27
3020  06be ce0000        	ld	x,_m_woEncoderGateEnd
3021  06c1 a3ff          	cp	x,#255
3022  06c3               L27:
3023  06c3 2603          	jrne	L021
3024  06c5 cc081e        	jp	L5631
3025  06c8               L021:
3026                     ; 349 		woEncoderIndex = parametersGetValue(PARAM_OSCIL_OFFSET);
3028  06c8 a60c          	ld	a,#12
3029  06ca cd0000        	call	_parametersGetValue
3031  06cd b7fe          	ld	_windowOscilloscope$L-2,a
3032  06cf bffd          	ld	_windowOscilloscope$L-3,x
3033                     ; 350 		if (woEncoderIndex == 0xFFFF)
3035  06d1 b6fe          	ld	a,_windowOscilloscope$L-2
3036  06d3 a1ff          	cp	a,#255
3037  06d5 2604          	jrne	L47
3038  06d7 befd          	ld	x,_windowOscilloscope$L-3
3039  06d9 a3ff          	cp	x,#255
3040  06db               L47:
3041  06db 2615          	jrne	L7631
3042                     ; 352 			parametersSet(PARAM_OSCIL_OFFSET, windowOffsetToHaveCenteredGate());
3044  06dd cd05b3        	call	_windowOffsetToHaveCenteredGate
3046  06e0 b702          	ld	_parametersSet$L+2,a
3047  06e2 bf01          	ld	_parametersSet$L+1,x
3048  06e4 a60c          	ld	a,#12
3049  06e6 cd0000        	call	_parametersSet
3051                     ; 353 			woEncoderIndex = parametersGetValue(PARAM_OSCIL_OFFSET);
3053  06e9 a60c          	ld	a,#12
3054  06eb cd0000        	call	_parametersGetValue
3056  06ee b7fe          	ld	_windowOscilloscope$L-2,a
3057  06f0 bffd          	ld	_windowOscilloscope$L-3,x
3058  06f2               L7631:
3059                     ; 357 		byPrevGateValue = windowIsInGate((woEncoderIndex+parametersGetValue(PARAM_OSCIL_ZOOM)-1)& (ENCODER_PULSES-1))?WINDOW_3_GATE_LOW_Y:WINDOW_3_GATE_HIGH_Y;
3061  06f2 a60b          	ld	a,#11
3062  06f4 cd0000        	call	_parametersGetValue
3064  06f7 bbfe          	add	a,_windowOscilloscope$L-2
3065  06f9 88            	push	a
3066  06fa 9f            	ld	a,x
3067  06fb b9fd          	adc	a,_windowOscilloscope$L-3
3068  06fd 97            	ld	x,a
3069  06fe 84            	pop	a
3070  06ff 4d            	tnz	a
3071  0700 2601          	jrne	L001
3072  0702 5a            	dec	x
3073  0703               L001:
3074  0703 4a            	dec	a
3075  0704 a4ff          	and	a,#255
3076  0706 88            	push	a
3077  0707 9f            	ld	a,x
3078  0708 a403          	and	a,#3
3079  070a 97            	ld	x,a
3080  070b 84            	pop	a
3081  070c cd0565        	call	_windowIsInGate
3083  070f 4d            	tnz	a
3084  0710 2704          	jreq	L67
3085  0712 a619          	ld	a,#25
3086  0714 2002          	jra	L201
3087  0716               L67:
3088  0716 a60f          	ld	a,#15
3089  0718               L201:
3090  0718 b7f9          	ld	_windowOscilloscope$L-7,a
3091                     ; 362 		byGateHasToBeRepainted = true;
3093  071a a601          	ld	a,#1
3094  071c b7f8          	ld	_windowOscilloscope$L-8,a
3095                     ; 365 		m_arbyDisplayCommand[0] = DISPLAY_CLEAR_AREA;
3097  071e a612          	ld	a,#18
3098  0720 c70000        	ld	_m_arbyDisplayCommand,a
3099                     ; 366 		m_arbyDisplayCommand[5] = DISPLAY_WAIT;
3101  0723 a6fe          	ld	a,#254
3102  0725 c70005        	ld	_m_arbyDisplayCommand+5,a
3103                     ; 367 		m_arbyDisplayCommand[6] = DISPLAY_SET_AREA;
3105  0728 a611          	ld	a,#17
3106  072a c70006        	ld	_m_arbyDisplayCommand+6,a
3107                     ; 368 		m_arbyDisplayCommand[11] = DISPLAY_EOF;		
3109  072d a6ff          	ld	a,#255
3110  072f c7000b        	ld	_m_arbyDisplayCommand+11,a
3111                     ; 371 		for(i=0; (i<(WINDOW_3_WIDTH-4) && !displayIsKeyPress()) ; i++)
3113  0732 3ffb          	clr	_windowOscilloscope$L-5
3115  0734 cc07ff        	jp	L5731
3116  0737               L1731:
3117                     ; 374 			j = parametersGetValue(PARAM_OSCIL_ZOOM);
3119  0737 a60b          	ld	a,#11
3120  0739 cd0000        	call	_parametersGetValue
3122  073c b7fa          	ld	_windowOscilloscope$L-6,a
3123                     ; 375 			byValue = 0x0000;
3125  073e 3fff          	clr	_windowOscilloscope$L-1
3127  0740 202c          	jra	L5041
3128  0742               L1041:
3129                     ; 378 				byValue = (WORD) MAX(byValue,windowOscilloscopeGetValue(woEncoderIndex));  //(woValue>arwoValue[j]?woValue:arwoValue[j]);
3131  0742 b6fe          	ld	a,_windowOscilloscope$L-2
3132  0744 befd          	ld	x,_windowOscilloscope$L-3
3133  0746 cd0501        	call	_windowOscilloscopeGetValue
3135  0749 b1ff          	cp	a,_windowOscilloscope$L-1
3136  074b 2404          	jruge	L401
3137  074d b6ff          	ld	a,_windowOscilloscope$L-1
3138  074f 2007          	jra	L601
3139  0751               L401:
3140  0751 b6fe          	ld	a,_windowOscilloscope$L-2
3141  0753 befd          	ld	x,_windowOscilloscope$L-3
3142  0755 cd0501        	call	_windowOscilloscopeGetValue
3144  0758               L601:
3145  0758 b7ff          	ld	_windowOscilloscope$L-1,a
3146                     ; 380 				woEncoderIndex = (woEncoderIndex+1) & (ENCODER_PULSES-1);
3148  075a b6fe          	ld	a,_windowOscilloscope$L-2
3149  075c befd          	ld	x,_windowOscilloscope$L-3
3150  075e 4c            	inc	a
3151  075f 2601          	jrne	L011
3152  0761 5c            	inc	x
3153  0762               L011:
3154  0762 a4ff          	and	a,#255
3155  0764 88            	push	a
3156  0765 9f            	ld	a,x
3157  0766 a403          	and	a,#3
3158  0768 97            	ld	x,a
3159  0769 84            	pop	a
3160  076a b7fe          	ld	_windowOscilloscope$L-2,a
3161  076c bffd          	ld	_windowOscilloscope$L-3,x
3162  076e               L5041:
3163                     ; 376 			while(j-->0)
3165  076e b6fa          	ld	a,_windowOscilloscope$L-6
3166  0770 3afa          	dec	_windowOscilloscope$L-6
3167  0772 4d            	tnz	a
3168  0773 26cd          	jrne	L1041
3169                     ; 383 			byValue = WINDOW_3_OSCILLOSCOPE_Y-(byValue<<2);
3171  0775 b6ff          	ld	a,_windowOscilloscope$L-1
3172  0777 48            	sll	a
3173  0778 48            	sll	a
3174  0779 a037          	sub	a,#55
3175  077b 40            	neg	a
3176  077c b7ff          	ld	_windowOscilloscope$L-1,a
3177                     ; 384 			byLeft = WINDOW_3_LEFT + i + 2;
3179  077e b6fb          	ld	a,_windowOscilloscope$L-5
3180  0780 ab02          	add	a,#2
3181  0782 b7fc          	ld	_windowOscilloscope$L-4,a
3182                     ; 387 			if (byGateHasToBeRepainted)
3184  0784 3df8          	tnz	_windowOscilloscope$L-8
3185  0786 2742          	jreq	L1141
3186                     ; 392 				m_arbyDisplayCommand[1] = byLeft;
3188  0788 b6fc          	ld	a,_windowOscilloscope$L-4
3189  078a c70001        	ld	_m_arbyDisplayCommand+1,a
3190                     ; 393 				m_arbyDisplayCommand[2] = WINDOW_3_GATE_LOW_Y;
3192  078d a619          	ld	a,#25
3193  078f c70002        	ld	_m_arbyDisplayCommand+2,a
3194                     ; 394 				m_arbyDisplayCommand[3] = byLeft;
3196  0792 b6fc          	ld	a,_windowOscilloscope$L-4
3197  0794 c70003        	ld	_m_arbyDisplayCommand+3,a
3198                     ; 395 				m_arbyDisplayCommand[4] = WINDOW_3_GATE_HIGH_Y; 
3200  0797 a60f          	ld	a,#15
3201  0799 c70004        	ld	_m_arbyDisplayCommand+4,a
3202                     ; 400 				m_arbyDisplayCommand[7] = byLeft;
3204  079c b6fc          	ld	a,_windowOscilloscope$L-4
3205  079e c70007        	ld	_m_arbyDisplayCommand+7,a
3206                     ; 401 				m_arbyDisplayCommand[8] = byPrevGateValue;
3208  07a1 b6f9          	ld	a,_windowOscilloscope$L-7
3209  07a3 c70008        	ld	_m_arbyDisplayCommand+8,a
3210                     ; 402 				m_arbyDisplayCommand[9] = byLeft;
3212  07a6 b6fc          	ld	a,_windowOscilloscope$L-4
3213  07a8 c70009        	ld	_m_arbyDisplayCommand+9,a
3214                     ; 403 				m_arbyDisplayCommand[10] = windowIsInGate(woEncoderIndex)?WINDOW_3_GATE_LOW_Y:WINDOW_3_GATE_HIGH_Y; 
3216  07ab b6fe          	ld	a,_windowOscilloscope$L-2
3217  07ad befd          	ld	x,_windowOscilloscope$L-3
3218  07af cd0565        	call	_windowIsInGate
3220  07b2 4d            	tnz	a
3221  07b3 2704          	jreq	L211
3222  07b5 a619          	ld	a,#25
3223  07b7 2002          	jra	L411
3224  07b9               L211:
3225  07b9 a60f          	ld	a,#15
3226  07bb               L411:
3227  07bb c7000a        	ld	_m_arbyDisplayCommand+10,a
3228                     ; 405 				byPrevGateValue =m_arbyDisplayCommand[10];
3230  07be c6000a        	ld	a,_m_arbyDisplayCommand+10
3231  07c1 b7f9          	ld	_windowOscilloscope$L-7,a
3232                     ; 407 				displayCmdToDisplay(m_arbyDisplayCommand);
3234  07c3 a600          	ld	a,#low(_m_arbyDisplayCommand)
3235  07c5 ae00          	ld	x,#high(_m_arbyDisplayCommand)
3236  07c7 cd0000        	call	_displayCmdToDisplay
3238  07ca               L1141:
3239                     ; 412 			m_arbyDisplayCommand[1] = byLeft;
3241  07ca b6fc          	ld	a,_windowOscilloscope$L-4
3242  07cc c70001        	ld	_m_arbyDisplayCommand+1,a
3243                     ; 413 			m_arbyDisplayCommand[2] = WINDOW_3_OSCILLOSCOPE_Y-12;
3245  07cf a62b          	ld	a,#43
3246  07d1 c70002        	ld	_m_arbyDisplayCommand+2,a
3247                     ; 414 			m_arbyDisplayCommand[3] = byLeft;
3249  07d4 b6fc          	ld	a,_windowOscilloscope$L-4
3250  07d6 c70003        	ld	_m_arbyDisplayCommand+3,a
3251                     ; 415 			m_arbyDisplayCommand[4] = WINDOW_3_OSCILLOSCOPE_Y-1;
3253  07d9 a636          	ld	a,#54
3254  07db c70004        	ld	_m_arbyDisplayCommand+4,a
3255                     ; 420 			m_arbyDisplayCommand[7] = byLeft;
3257  07de b6fc          	ld	a,_windowOscilloscope$L-4
3258  07e0 c70007        	ld	_m_arbyDisplayCommand+7,a
3259                     ; 421 			m_arbyDisplayCommand[8] = WINDOW_3_OSCILLOSCOPE_Y;
3261  07e3 a637          	ld	a,#55
3262  07e5 c70008        	ld	_m_arbyDisplayCommand+8,a
3263                     ; 422 			m_arbyDisplayCommand[9] = byLeft;
3265  07e8 b6fc          	ld	a,_windowOscilloscope$L-4
3266  07ea c70009        	ld	_m_arbyDisplayCommand+9,a
3267                     ; 423 			m_arbyDisplayCommand[10] = byValue;
3269  07ed b6ff          	ld	a,_windowOscilloscope$L-1
3270  07ef c7000a        	ld	_m_arbyDisplayCommand+10,a
3271                     ; 425 			byPrevValue = byValue;
3273  07f2 b6ff          	ld	a,_windowOscilloscope$L-1
3274  07f4 b7f7          	ld	_windowOscilloscope$L-9,a
3275                     ; 427 			displayCmdToDisplay(m_arbyDisplayCommand);			
3277  07f6 a600          	ld	a,#low(_m_arbyDisplayCommand)
3278  07f8 ae00          	ld	x,#high(_m_arbyDisplayCommand)
3279  07fa cd0000        	call	_displayCmdToDisplay
3281                     ; 371 		for(i=0; (i<(WINDOW_3_WIDTH-4) && !displayIsKeyPress()) ; i++)
3283  07fd 3cfb          	inc	_windowOscilloscope$L-5
3284  07ff               L5731:
3287  07ff b6fb          	ld	a,_windowOscilloscope$L-5
3288  0801 a17a          	cp	a,#122
3289  0803 2409          	jruge	L3141
3291  0805 cd0000        	call	_displayIsKeyPress
3293  0808 4d            	tnz	a
3294  0809 2603          	jrne	L221
3295  080b cc0737        	jp	L1731
3296  080e               L221:
3297  080e               L3141:
3298                     ; 430 		if(!displayIsKeyPress())
3300  080e cd0000        	call	_displayIsKeyPress
3302  0811 4d            	tnz	a
3303  0812 260a          	jrne	L5631
3304                     ; 432 			parametersChangedFlagReset(PARAM_OSCIL_ZOOM);
3306  0814 a60b          	ld	a,#11
3307  0816 cd0000        	call	_parametersChangedFlagReset
3309                     ; 433 			parametersChangedFlagReset(PARAM_OSCIL_OFFSET);
3311  0819 a60c          	ld	a,#12
3312  081b cd0000        	call	_parametersChangedFlagReset
3314  081e               L5631:
3315                     ; 438 	_bset(m_woDisplayedWindow, WIN_OSCILLOSCOPE);
3317  081e c60001        	ld	a,_m_woDisplayedWindow+1
3318  0821 aa04          	or	a,#4
3319  0823 c70001        	ld	_m_woDisplayedWindow+1,a
3320                     ; 439 	_bres(m_woDisplayedWindow, WIN_REGISTER);
3322  0826 c60001        	ld	a,_m_woDisplayedWindow+1
3323  0829 a4f7          	and	a,#247
3324  082b c70001        	ld	_m_woDisplayedWindow+1,a
3325                     ; 440 	_bres(m_woDisplayedWindow, WIN_ALARM);
3327  082e c60001        	ld	a,_m_woDisplayedWindow+1
3328  0831 a4ef          	and	a,#239
3329  0833 c70001        	ld	_m_woDisplayedWindow+1,a
3330                     ; 441 	_bres(m_woDisplayedWindow, WIN_MESSAGE);
3332  0836 c60001        	ld	a,_m_woDisplayedWindow+1
3333  0839 a4df          	and	a,#223
3334  083b c70001        	ld	_m_woDisplayedWindow+1,a
3335                     ; 442 	_bres(m_woDisplayedWindow, WIN_FUNCTIONS);
3337  083e c60001        	ld	a,_m_woDisplayedWindow+1
3338  0841 a4bf          	and	a,#191
3339  0843 c70001        	ld	_m_woDisplayedWindow+1,a
3340                     ; 443 	_bres(m_woDisplayedWindow, WIN_PARAMETERS);
3342  0846 c60001        	ld	a,_m_woDisplayedWindow+1
3343  0849 a47f          	and	a,#127
3344  084b c70001        	ld	_m_woDisplayedWindow+1,a
3345                     ; 444 	_bres(m_woDisplayedWindow, WIN_TESTS);
3347  084e c60001        	ld	a,_m_woDisplayedWindow+1
3348  0851 a4ff          	and	a,#255
3349  0853 c70001        	ld	_m_woDisplayedWindow+1,a
3350  0856 c60000        	ld	a,_m_woDisplayedWindow
3351  0859 a4fe          	and	a,#254
3352  085b c70000        	ld	_m_woDisplayedWindow,a
3353                     ; 445 	_bres(m_woDisplayedWindow, WIN_MENUS);
3355  085e c60001        	ld	a,_m_woDisplayedWindow+1
3356  0861 a4ff          	and	a,#255
3357  0863 c70001        	ld	_m_woDisplayedWindow+1,a
3358  0866 c60000        	ld	a,_m_woDisplayedWindow
3359  0869 a4fd          	and	a,#253
3360  086b c70000        	ld	_m_woDisplayedWindow,a
3361                     ; 446 }
3364  086e 81            	ret
3410                     ; 449 void windowRegisterPrepareFormateValue(BYTE * a_strErrValue)
3410                     ; 450 {
3411                     	switch	.text
3413                     	xref.b	_windowRegisterPrepareFormateValue$L
3414  086f               _windowRegisterPrepareFormateValue:
3416  086f b701          	ld	_windowRegisterPrepareFormateValue$L+1,a
3417  0871 bf00          	ld	_windowRegisterPrepareFormateValue$L,x
3419                     ; 453 	if (parametersGetValue(PARAM_ERR_LONG) > 0x8000)
3421  0873 a609          	ld	a,#9
3422  0875 cd0000        	call	_parametersGetValue
3424  0878 a001          	sub	a,#1
3425  087a 9f            	ld	a,x
3426  087b a280          	sbc	a,#128
3427  087d 2507          	jrult	L1441
3428                     ; 455 		a_strErrValue[0] = '+';
3430  087f a62b          	ld	a,#43
3431  0881 92c700        	ld	[_windowRegisterPrepareFormateValue$L.w],a
3433  0884 2018          	jra	L3441
3434  0886               L1441:
3435                     ; 457 	else if (parametersGetValue(PARAM_ERR_LONG) < 0x8000)
3437  0886 a609          	ld	a,#9
3438  0888 cd0000        	call	_parametersGetValue
3440  088b a000          	sub	a,#0
3441  088d 9f            	ld	a,x
3442  088e a280          	sbc	a,#128
3443  0890 2407          	jruge	L5441
3444                     ; 459 		a_strErrValue[0] = '-';
3446  0892 a62d          	ld	a,#45
3447  0894 92c700        	ld	[_windowRegisterPrepareFormateValue$L.w],a
3449  0897 2005          	jra	L3441
3450  0899               L5441:
3451                     ; 463 		a_strErrValue[0] = ' ';
3453  0899 a620          	ld	a,#32
3454  089b 92c700        	ld	[_windowRegisterPrepareFormateValue$L.w],a
3455  089e               L3441:
3456                     ; 465 	a_strErrValue[6] = 0x00;
3458  089e ae06          	ld	x,#6
3459  08a0 4f            	clr	a
3460  08a1 92d700        	ld	([_windowRegisterPrepareFormateValue$L.w],x),a
3461                     ; 466 	a_strErrValue[7] = 0x00;
3463  08a4 ae07          	ld	x,#7
3464  08a6 4f            	clr	a
3465  08a7 92d700        	ld	([_windowRegisterPrepareFormateValue$L.w],x),a
3466                     ; 468 	woValue = parametersGetValue(PARAM_ERR_LONG) - 0x8000;
3468  08aa a609          	ld	a,#9
3469  08ac cd0000        	call	_parametersGetValue
3471  08af a000          	sub	a,#0
3472  08b1 88            	push	a
3473  08b2 9f            	ld	a,x
3474  08b3 a280          	sbc	a,#128
3475  08b5 97            	ld	x,a
3476  08b6 84            	pop	a
3477  08b7 b7ff          	ld	_windowRegisterPrepareFormateValue$L-1,a
3478  08b9 bffe          	ld	_windowRegisterPrepareFormateValue$L-2,x
3479                     ; 469 	if (woValue<0x8000)
3481  08bb b6fe          	ld	a,_windowRegisterPrepareFormateValue$L-2
3482  08bd a180          	cp	a,#128
3483  08bf 241d          	jruge	L1541
3484                     ; 471 		formatNumber(woValue, 6, 2, a_strErrValue+1);
3486  08c1 b601          	ld	a,_windowRegisterPrepareFormateValue$L+1
3487  08c3 be00          	ld	x,_windowRegisterPrepareFormateValue$L
3488  08c5 4c            	inc	a
3489  08c6 2601          	jrne	L621
3490  08c8 5c            	inc	x
3491  08c9               L621:
3492  08c9 b705          	ld	_formatNumber$L+5,a
3493  08cb bf04          	ld	_formatNumber$L+4,x
3494  08cd a602          	ld	a,#2
3495  08cf b703          	ld	_formatNumber$L+3,a
3496  08d1 a606          	ld	a,#6
3497  08d3 b702          	ld	_formatNumber$L+2,a
3498  08d5 b6ff          	ld	a,_windowRegisterPrepareFormateValue$L-1
3499  08d7 befe          	ld	x,_windowRegisterPrepareFormateValue$L-2
3500  08d9 cd0000        	call	_formatNumber
3503  08dc 2029          	jra	L3541
3504  08de               L1541:
3505                     ; 476 		woValue = ((WORD)(~woValue)) + 1;
3507  08de b6ff          	ld	a,_windowRegisterPrepareFormateValue$L-1
3508  08e0 befe          	ld	x,_windowRegisterPrepareFormateValue$L-2
3509  08e2 43            	cpl	a
3510  08e3 53            	cpl	x
3511  08e4 4c            	inc	a
3512  08e5 2601          	jrne	L031
3513  08e7 5c            	inc	x
3514  08e8               L031:
3515  08e8 b7ff          	ld	_windowRegisterPrepareFormateValue$L-1,a
3516  08ea bffe          	ld	_windowRegisterPrepareFormateValue$L-2,x
3517                     ; 477 		formatNumber(woValue, 6, 2, a_strErrValue+1);
3519  08ec b601          	ld	a,_windowRegisterPrepareFormateValue$L+1
3520  08ee be00          	ld	x,_windowRegisterPrepareFormateValue$L
3521  08f0 4c            	inc	a
3522  08f1 2601          	jrne	L231
3523  08f3 5c            	inc	x
3524  08f4               L231:
3525  08f4 b705          	ld	_formatNumber$L+5,a
3526  08f6 bf04          	ld	_formatNumber$L+4,x
3527  08f8 a602          	ld	a,#2
3528  08fa b703          	ld	_formatNumber$L+3,a
3529  08fc a606          	ld	a,#6
3530  08fe b702          	ld	_formatNumber$L+2,a
3531  0900 b6ff          	ld	a,_windowRegisterPrepareFormateValue$L-1
3532  0902 befe          	ld	x,_windowRegisterPrepareFormateValue$L-2
3533  0904 cd0000        	call	_formatNumber
3535  0907               L3541:
3536                     ; 479 }
3539  0907 81            	ret
3606                     ; 482 void windowRegister(void)
3606                     ; 483 {
3607                     	switch	.text
3609                     	xref.b	_windowRegister$L
3610  0908               _windowRegister:
3613                     ; 489 	byRulerTop = WINDOW_3_TOP+22;
3615  0908 a616          	ld	a,#22
3616  090a b7ff          	ld	_windowRegister$L-1,a
3617                     ; 491 	if (!_btst(m_woDisplayedWindow, WIN_REGISTER)) //Not displayed
3619  090c c60001        	ld	a,_m_woDisplayedWindow+1
3620  090f a508          	bcp	a,#8
3621  0911 2703          	jreq	L451
3622  0913 cc099e        	jp	L3051
3623  0916               L451:
3624                     ; 493 		displayClearArea(WINDOW_3_LEFT, WINDOW_3_TOP, WINDOW_3_RIGHT, WINDOW_3_BOTTOM);
3626  0916 a640          	ld	a,#64
3627  0918 b703          	ld	_displayClearArea$L+3,a
3628  091a a67e          	ld	a,#126
3629  091c b702          	ld	_displayClearArea$L+2,a
3630  091e 4f            	clr	a
3631  091f 5f            	clr	x
3632  0920 cd0000        	call	_displayClearArea
3634                     ; 494 		displaySetOutLine(WINDOW_3_LEFT, WINDOW_3_TOP, WINDOW_3_RIGHT, WINDOW_3_BOTTOM, false);
3636  0923 3f04          	clr	_displaySetOutLine$L+4
3637  0925 a640          	ld	a,#64
3638  0927 b703          	ld	_displaySetOutLine$L+3,a
3639  0929 a67e          	ld	a,#126
3640  092b b702          	ld	_displaySetOutLine$L+2,a
3641  092d 4f            	clr	a
3642  092e 5f            	clr	x
3643  092f cd0000        	call	_displaySetOutLine
3645                     ; 497 		displayWriteString("registro:", DISPLAY_SELECT_FONT_MINI, WINDOW_3_LEFT+2, WINDOW_3_TOP+6);
3647  0932 a606          	ld	a,#6
3648  0934 b704          	ld	_displayWriteString$L+4,a
3649  0936 a602          	ld	a,#2
3650  0938 b703          	ld	_displayWriteString$L+3,a
3651  093a a61c          	ld	a,#28
3652  093c b702          	ld	_displayWriteString$L+2,a
3653  093e a609          	ld	a,#low(L5051)
3654  0940 ae09          	ld	x,#high(L5051)
3655  0942 cd0000        	call	_displayWriteString
3657                     ; 498 		displayInvertArea(WINDOW_3_LEFT+1, WINDOW_3_TOP+1, WINDOW_3_RIGHT-2, WINDOW_3_TOP+6);
3659  0945 a606          	ld	a,#6
3660  0947 b703          	ld	_displayInvertArea$L+3,a
3661  0949 a67c          	ld	a,#124
3662  094b b702          	ld	_displayInvertArea$L+2,a
3663  094d a601          	ld	a,#1
3664  094f ae01          	ld	x,#1
3665  0951 cd0000        	call	_displayInvertArea
3667                     ; 501 		displayDrawHorizontalLine(byRulerTop + 1, WINDOW_3_LEFT + 6, WINDOW_3_WIDTH - 13);
3669  0954 a671          	ld	a,#113
3670  0956 b702          	ld	_displayDrawHorizontalLine$L+2,a
3671  0958 a606          	ld	a,#6
3672  095a beff          	ld	x,_windowRegister$L-1
3673  095c 5c            	inc	x
3674  095d cd0000        	call	_displayDrawHorizontalLine
3676                     ; 502 		/* -1   */ displayDrawVerticalLine(WINDOW_3_LEFT + 5								, byRulerTop - 1, 6);	
3678  0960 a606          	ld	a,#6
3679  0962 b702          	ld	_displayDrawVerticalLine$L+2,a
3680  0964 b6ff          	ld	a,_windowRegister$L-1
3681  0966 4a            	dec	a
3682  0967 ae05          	ld	x,#5
3683  0969 cd0000        	call	_displayDrawVerticalLine
3685                     ; 503 		/*  0   */ displayDrawVerticalLine(WINDOW_3_LEFT + 5 + (WINDOW_3_WIDTH - 11) / 2	, byRulerTop - 1, 6);
3687  096c a606          	ld	a,#6
3688  096e b702          	ld	_displayDrawVerticalLine$L+2,a
3689  0970 b6ff          	ld	a,_windowRegister$L-1
3690  0972 4a            	dec	a
3691  0973 ae3e          	ld	x,#62
3692  0975 cd0000        	call	_displayDrawVerticalLine
3694                     ; 504 		/*  1   */ displayDrawVerticalLine(WINDOW_3_LEFT + 5 + (WINDOW_3_WIDTH - 11)		, byRulerTop - 1, 6);
3696  0978 a606          	ld	a,#6
3697  097a b702          	ld	_displayDrawVerticalLine$L+2,a
3698  097c b6ff          	ld	a,_windowRegister$L-1
3699  097e 4a            	dec	a
3700  097f ae78          	ld	x,#120
3701  0981 cd0000        	call	_displayDrawVerticalLine
3703                     ; 505 		/* -0.5 */ displayDrawVerticalLine(WINDOW_3_LEFT + 5 + (WINDOW_3_WIDTH - 11) / 4	, byRulerTop + 2, 1);
3705  0984 a601          	ld	a,#1
3706  0986 b702          	ld	_displayDrawVerticalLine$L+2,a
3707  0988 b6ff          	ld	a,_windowRegister$L-1
3708  098a ab02          	add	a,#2
3709  098c ae21          	ld	x,#33
3710  098e cd0000        	call	_displayDrawVerticalLine
3712                     ; 506 		/* +0.5 */ displayDrawVerticalLine(WINDOW_3_LEFT + 5 + (WINDOW_3_WIDTH - 11) * 3 / 4, byRulerTop + 2, 1);
3714  0991 a601          	ld	a,#1
3715  0993 b702          	ld	_displayDrawVerticalLine$L+2,a
3716  0995 b6ff          	ld	a,_windowRegister$L-1
3717  0997 ab02          	add	a,#2
3718  0999 ae5b          	ld	x,#91
3719  099b cd0000        	call	_displayDrawVerticalLine
3721  099e               L3051:
3722                     ; 512 	if (parametersIsChanged(PARAM_ERR_LONG) || (!_btst(m_woDisplayedWindow, WIN_REGISTER)) )
3724  099e a609          	ld	a,#9
3725  09a0 cd0000        	call	_parametersIsChanged
3727  09a3 4d            	tnz	a
3728  09a4 260a          	jrne	L1151
3730  09a6 c60001        	ld	a,_m_woDisplayedWindow+1
3731  09a9 a508          	bcp	a,#8
3732  09ab 2703          	jreq	L651
3733  09ad cc0aca        	jp	L7051
3734  09b0               L651:
3735  09b0               L1151:
3736                     ; 515 		dblPercentValue = ((double) parametersGetValue(PARAM_ERR_LONG)- (double) 0x8000) / 100.0;
3738  09b0 a609          	ld	a,#9
3739  09b2 cd0000        	call	_parametersGetValue
3741  09b5 cd0000        	call	c_uitof
3743  09b8 ae05          	ld	x,#high(L7151)
3744  09ba bf00          	ld	c_x,x
3745  09bc ae05          	ld	x,#low(L7151)
3746  09be cd0000        	call	c_xfsub
3748  09c1 ae01          	ld	x,#high(L7251)
3749  09c3 bf00          	ld	c_x,x
3750  09c5 ae01          	ld	x,#low(L7251)
3751  09c7 cd0000        	call	c_xfdiv
3753  09ca aefb          	ld	x,#_windowRegister$L-5
3754  09cc cd0000        	call	c_rtol
3756                     ; 516 		dblPercentValue = (dblPercentValue>1?1:dblPercentValue);
3758  09cf 5f            	clr	x
3759  09d0 a601          	ld	a,#1
3760  09d2 cd0000        	call	c_itof
3762  09d5 aeef          	ld	x,#_windowRegister$L-17
3763  09d7 cd0000        	call	c_rtol
3765  09da aefb          	ld	x,#_windowRegister$L-5
3766  09dc cd0000        	call	c_ltor
3768  09df aeef          	ld	x,#_windowRegister$L-17
3769  09e1 cd0000        	call	c_fcmp
3771                     	jrle	L631
3772  09e8 5f            	clr	x
3773  09e9 a601          	ld	a,#1
3774  09eb cd0000        	call	c_itof
3776  09ee 2005          	jra	L041
3777  09f0               L631:
3778  09f0 aefb          	ld	x,#_windowRegister$L-5
3779  09f2 cd0000        	call	c_ltor
3781  09f5               L041:
3782  09f5 aefb          	ld	x,#_windowRegister$L-5
3783  09f7 cd0000        	call	c_rtol
3785                     ; 517 		dblPercentValue = (dblPercentValue<-1?-1:dblPercentValue);
3787  09fa a6ff          	ld	a,#255
3788  09fc aeff          	ld	x,#255
3789  09fe cd0000        	call	c_itof
3791  0a01 aeef          	ld	x,#_windowRegister$L-17
3792  0a03 cd0000        	call	c_rtol
3794  0a06 aefb          	ld	x,#_windowRegister$L-5
3795  0a08 cd0000        	call	c_ltor
3797  0a0b aeef          	ld	x,#_windowRegister$L-17
3798  0a0d cd0000        	call	c_fcmp
3800  0a10 2a09          	jrpl	L241
3801  0a12 a6ff          	ld	a,#255
3802  0a14 aeff          	ld	x,#255
3803  0a16 cd0000        	call	c_itof
3805  0a19 2005          	jra	L441
3806  0a1b               L241:
3807  0a1b aefb          	ld	x,#_windowRegister$L-5
3808  0a1d cd0000        	call	c_ltor
3810  0a20               L441:
3811  0a20 aefb          	ld	x,#_windowRegister$L-5
3812  0a22 cd0000        	call	c_rtol
3814                     ; 519 		displayWriteString("-", DISPLAY_SELECT_FONT_MINI, WINDOW_3_LEFT + 4								 , 	byRulerTop - 3);
3816  0a25 b6ff          	ld	a,_windowRegister$L-1
3817  0a27 a003          	sub	a,#3
3818  0a29 b704          	ld	_displayWriteString$L+4,a
3819  0a2b a604          	ld	a,#4
3820  0a2d b703          	ld	_displayWriteString$L+3,a
3821  0a2f a61c          	ld	a,#28
3822  0a31 b702          	ld	_displayWriteString$L+2,a
3823  0a33 a6ff          	ld	a,#low(L3351)
3824  0a35 aeff          	ld	x,#high(L3351)
3825  0a37 cd0000        	call	_displayWriteString
3827                     ; 520 		displayWriteString("+", DISPLAY_SELECT_FONT_MINI, WINDOW_3_LEFT + 4 + (WINDOW_3_WIDTH - 11)		 , 	byRulerTop - 3);
3829  0a3a b6ff          	ld	a,_windowRegister$L-1
3830  0a3c a003          	sub	a,#3
3831  0a3e b704          	ld	_displayWriteString$L+4,a
3832  0a40 a677          	ld	a,#119
3833  0a42 b703          	ld	_displayWriteString$L+3,a
3834  0a44 a61c          	ld	a,#28
3835  0a46 b702          	ld	_displayWriteString$L+2,a
3836  0a48 a6fd          	ld	a,#low(L5351)
3837  0a4a aefd          	ld	x,#high(L5351)
3838  0a4c cd0000        	call	_displayWriteString
3840                     ; 524 		if (m_byCurrentSelectorX>0)
3842  0a4f c60002        	ld	a,_m_byCurrentSelectorX
3843  0a52 4d            	tnz	a
3844  0a53 2717          	jreq	L7351
3845                     ; 526 			displayClearArea(m_byCurrentSelectorX-1, byRulerTop - 11, m_byCurrentSelectorX+1, byRulerTop-3);
3847  0a55 b6ff          	ld	a,_windowRegister$L-1
3848  0a57 a003          	sub	a,#3
3849  0a59 b703          	ld	_displayClearArea$L+3,a
3850  0a5b c60002        	ld	a,_m_byCurrentSelectorX
3851  0a5e 4c            	inc	a
3852  0a5f b702          	ld	_displayClearArea$L+2,a
3853  0a61 b6ff          	ld	a,_windowRegister$L-1
3854  0a63 a00b          	sub	a,#11
3855  0a65 ce0002        	ld	x,_m_byCurrentSelectorX
3856  0a68 5a            	dec	x
3857  0a69 cd0000        	call	_displayClearArea
3859  0a6c               L7351:
3860                     ; 529 		m_byCurrentSelectorX = WINDOW_3_LEFT + 5 + ((WINDOW_3_WIDTH - 11) / 2 * (dblPercentValue + 1));
3862  0a6c aefb          	ld	x,#_windowRegister$L-5
3863  0a6e cd0000        	call	c_ltor
3865  0a71 aef9          	ld	x,#high(L5451)
3866  0a73 bf00          	ld	c_x,x
3867  0a75 aef9          	ld	x,#low(L5451)
3868  0a77 cd0000        	call	c_xfadd
3870  0a7a aef5          	ld	x,#high(L5551)
3871  0a7c bf00          	ld	c_x,x
3872  0a7e aef5          	ld	x,#low(L5551)
3873  0a80 cd0000        	call	c_xfmul
3875  0a83 aef1          	ld	x,#high(L5651)
3876  0a85 bf00          	ld	c_x,x
3877  0a87 aef1          	ld	x,#low(L5651)
3878  0a89 cd0000        	call	c_xfadd
3880  0a8c cd0000        	call	c_ftoi
3882  0a8f c70002        	ld	_m_byCurrentSelectorX,a
3883                     ; 530 		displayDrawSelector( m_byCurrentSelectorX, byRulerTop - 11,  (dblPercentValue != 0), true);
3885  0a92 a601          	ld	a,#1
3886  0a94 b703          	ld	_displayDrawSelector$L+3,a
3887  0a96 b6fb          	ld	a,_windowRegister$L-5
3888  0a98 2704          	jreq	L641
3889  0a9a a601          	ld	a,#1
3890  0a9c 2001          	jra	L051
3891  0a9e               L641:
3892  0a9e 4f            	clr	a
3893  0a9f               L051:
3894  0a9f b702          	ld	_displayDrawSelector$L+2,a
3895  0aa1 b6ff          	ld	a,_windowRegister$L-1
3896  0aa3 a00b          	sub	a,#11
3897  0aa5 ce0002        	ld	x,_m_byCurrentSelectorX
3898  0aa8 cd0000        	call	_displayDrawSelector
3900                     ; 533 		windowRegisterPrepareFormateValue(strString);
3902  0aab a6f3          	ld	a,#_windowRegister$L-13
3903  0aad 5f            	clr	x
3904  0aae cd086f        	call	_windowRegisterPrepareFormateValue
3906                     ; 534 		displayWriteString(strString, DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+42, byRulerTop + 18);	
3908  0ab1 b6ff          	ld	a,_windowRegister$L-1
3909  0ab3 ab12          	add	a,#18
3910  0ab5 b704          	ld	_displayWriteString$L+4,a
3911  0ab7 a62a          	ld	a,#42
3912  0ab9 b703          	ld	_displayWriteString$L+3,a
3913  0abb a61d          	ld	a,#29
3914  0abd b702          	ld	_displayWriteString$L+2,a
3915  0abf a6f3          	ld	a,#_windowRegister$L-13
3916  0ac1 5f            	clr	x
3917  0ac2 cd0000        	call	_displayWriteString
3919                     ; 536 		parametersChangedFlagReset(PARAM_ERR_LONG);
3921  0ac5 a609          	ld	a,#9
3922  0ac7 cd0000        	call	_parametersChangedFlagReset
3924  0aca               L7051:
3925                     ; 540 	if (parametersIsChanged(PARAM_CORRECTION))
3927  0aca a608          	ld	a,#8
3928  0acc cd0000        	call	_parametersIsChanged
3930  0acf 4d            	tnz	a
3931  0ad0 271a          	jreq	L1751
3932                     ; 542 		displayDrawCorrection(WINDOW_3_LEFT, byRulerTop, WINDOW_3_WIDTH, LOBYTE(parametersGetValue(PARAM_CORRECTION)), /*size*/0x01);
3934  0ad2 a601          	ld	a,#1
3935  0ad4 b704          	ld	_displayDrawCorrection$L+4,a
3936  0ad6 a608          	ld	a,#8
3937  0ad8 cd0000        	call	_parametersGetValue
3939  0adb b703          	ld	_displayDrawCorrection$L+3,a
3940  0add a67e          	ld	a,#126
3941  0adf b702          	ld	_displayDrawCorrection$L+2,a
3942  0ae1 b6ff          	ld	a,_windowRegister$L-1
3943  0ae3 5f            	clr	x
3944  0ae4 cd0000        	call	_displayDrawCorrection
3946                     ; 543 		parametersChangedFlagReset(PARAM_CORRECTION);
3948  0ae7 a608          	ld	a,#8
3949  0ae9 cd0000        	call	_parametersChangedFlagReset
3951  0aec               L1751:
3952                     ; 547 	if (parametersIsChanged(PARAM_ALARM_OUT_OF_BOUND))
3954  0aec a60e          	ld	a,#14
3955  0aee cd0000        	call	_parametersIsChanged
3957  0af1 4d            	tnz	a
3958  0af2 2723          	jreq	L3751
3959                     ; 549 		if (parametersGetValue(PARAM_ALARM_OUT_OF_BOUND))
3961  0af4 a60e          	ld	a,#14
3962  0af6 cd0000        	call	_parametersGetValue
3964  0af9 4d            	tnz	a
3965  0afa 2601          	jrne	L251
3966  0afc 5d            	tnz	x
3967  0afd               L251:
3968  0afd 2709          	jreq	L5751
3969                     ; 551 			displayDrawAlarm(87, 45);
3971  0aff a62d          	ld	a,#45
3972  0b01 ae57          	ld	x,#87
3973  0b03 cd0000        	call	_displayDrawAlarm
3976  0b06 200f          	jra	L3751
3977  0b08               L5751:
3978                     ; 555 			displayClearArea(87+2,45+7, 87+10, 45+14);
3980  0b08 a63b          	ld	a,#59
3981  0b0a b703          	ld	_displayClearArea$L+3,a
3982  0b0c a661          	ld	a,#97
3983  0b0e b702          	ld	_displayClearArea$L+2,a
3984  0b10 a634          	ld	a,#52
3985  0b12 ae59          	ld	x,#89
3986  0b14 cd0000        	call	_displayClearArea
3988  0b17               L3751:
3989                     ; 560 	_bres(m_woDisplayedWindow, WIN_OSCILLOSCOPE);
3991  0b17 c60001        	ld	a,_m_woDisplayedWindow+1
3992  0b1a a4fb          	and	a,#251
3993  0b1c c70001        	ld	_m_woDisplayedWindow+1,a
3994                     ; 561 	_bset(m_woDisplayedWindow, WIN_REGISTER);
3996  0b1f c60001        	ld	a,_m_woDisplayedWindow+1
3997  0b22 aa08          	or	a,#8
3998  0b24 c70001        	ld	_m_woDisplayedWindow+1,a
3999                     ; 562 	_bres(m_woDisplayedWindow, WIN_ALARM);
4001  0b27 c60001        	ld	a,_m_woDisplayedWindow+1
4002  0b2a a4ef          	and	a,#239
4003  0b2c c70001        	ld	_m_woDisplayedWindow+1,a
4004                     ; 563 	_bres(m_woDisplayedWindow, WIN_MESSAGE);
4006  0b2f c60001        	ld	a,_m_woDisplayedWindow+1
4007  0b32 a4df          	and	a,#223
4008  0b34 c70001        	ld	_m_woDisplayedWindow+1,a
4009                     ; 564 	_bres(m_woDisplayedWindow, WIN_FUNCTIONS);
4011  0b37 c60001        	ld	a,_m_woDisplayedWindow+1
4012  0b3a a4bf          	and	a,#191
4013  0b3c c70001        	ld	_m_woDisplayedWindow+1,a
4014                     ; 565 	_bres(m_woDisplayedWindow, WIN_PARAMETERS);
4016  0b3f c60001        	ld	a,_m_woDisplayedWindow+1
4017  0b42 a47f          	and	a,#127
4018  0b44 c70001        	ld	_m_woDisplayedWindow+1,a
4019                     ; 566 	_bres(m_woDisplayedWindow, WIN_TESTS);
4021  0b47 c60001        	ld	a,_m_woDisplayedWindow+1
4022  0b4a a4ff          	and	a,#255
4023  0b4c c70001        	ld	_m_woDisplayedWindow+1,a
4024  0b4f c60000        	ld	a,_m_woDisplayedWindow
4025  0b52 a4fe          	and	a,#254
4026  0b54 c70000        	ld	_m_woDisplayedWindow,a
4027                     ; 567 	_bres(m_woDisplayedWindow, WIN_MENUS);
4029  0b57 c60001        	ld	a,_m_woDisplayedWindow+1
4030  0b5a a4ff          	and	a,#255
4031  0b5c c70001        	ld	_m_woDisplayedWindow+1,a
4032  0b5f c60000        	ld	a,_m_woDisplayedWindow
4033  0b62 a4fd          	and	a,#253
4034  0b64 c70000        	ld	_m_woDisplayedWindow,a
4035                     ; 568 }
4038  0b67 81            	ret
4090                     ; 571 void window6Menu(BYTE * a_byGroup, BYTE * a_bySelected)
4090                     ; 572 {
4091                     	switch	.text
4093                     	xref.b	_window6Menu$L
4094  0b68               _window6Menu:
4096  0b68 b701          	ld	_window6Menu$L+1,a
4097  0b6a bf00          	ld	_window6Menu$L,x
4099                     ; 573 	if ( !  (	((*a_byGroup == MENU_GROUP_FUNCTION) 	&& _btst(m_woDisplayedWindow, WIN_FUNCTIONS)) ||
4099                     ; 574 				((*a_byGroup == MENU_GROUP_PARAMETER) 	&& _btst(m_woDisplayedWindow, WIN_PARAMETERS)) ||
4099                     ; 575 				((*a_byGroup == MENU_GROUP_MENU) 		&& _btst(m_woDisplayedWindow, WIN_MENUS)) ||
4099                     ; 576 				((*a_byGroup == MENU_GROUP_TEST) 		&& _btst(m_woDisplayedWindow, WIN_TESTS))
4099                     ; 577 			))  // Is not only a refresh
4101  0b6c 92c600        	ld	a,[_window6Menu$L.w]
4102  0b6f a101          	cp	a,#1
4103  0b71 260a          	jrne	L5361
4105  0b73 c60001        	ld	a,_m_woDisplayedWindow+1
4106  0b76 a540          	bcp	a,#64
4107  0b78 2703          	jreq	L622
4108  0b7a cc0fb1        	jp	L3361
4109  0b7d               L622:
4110  0b7d               L5361:
4112  0b7d 92c600        	ld	a,[_window6Menu$L.w]
4113  0b80 a102          	cp	a,#2
4114  0b82 260a          	jrne	L7361
4116  0b84 c60001        	ld	a,_m_woDisplayedWindow+1
4117  0b87 a580          	bcp	a,#128
4118  0b89 2703          	jreq	L032
4119  0b8b cc0fb1        	jp	L3361
4120  0b8e               L032:
4121  0b8e               L7361:
4123  0b8e 92c600        	ld	a,[_window6Menu$L.w]
4124  0b91 a104          	cp	a,#4
4125  0b93 260a          	jrne	L1461
4127  0b95 c60000        	ld	a,_m_woDisplayedWindow
4128  0b98 a502          	bcp	a,#2
4129  0b9a 2703          	jreq	L232
4130  0b9c cc0fb1        	jp	L3361
4131  0b9f               L232:
4132  0b9f               L1461:
4134  0b9f 92c600        	ld	a,[_window6Menu$L.w]
4135  0ba2 a103          	cp	a,#3
4136  0ba4 260a          	jrne	L3461
4138  0ba6 c60000        	ld	a,_m_woDisplayedWindow
4139  0ba9 a501          	bcp	a,#1
4140  0bab 2703          	jreq	L432
4141  0bad cc0fb1        	jp	L3361
4142  0bb0               L432:
4143  0bb0               L3461:
4144                     ; 579 		displayClearArea(0,0,126,64);
4146  0bb0 a640          	ld	a,#64
4147  0bb2 b703          	ld	_displayClearArea$L+3,a
4148  0bb4 a67e          	ld	a,#126
4149  0bb6 b702          	ld	_displayClearArea$L+2,a
4150  0bb8 4f            	clr	a
4151  0bb9 5f            	clr	x
4152  0bba cd0000        	call	_displayClearArea
4154                     ; 581 		displayWriteString("1", 			DISPLAY_SELECT_FONT_10x14, 	2, 		17);
4156  0bbd a611          	ld	a,#17
4157  0bbf b704          	ld	_displayWriteString$L+4,a
4158  0bc1 a602          	ld	a,#2
4159  0bc3 b703          	ld	_displayWriteString$L+3,a
4160  0bc5 a61e          	ld	a,#30
4161  0bc7 b702          	ld	_displayWriteString$L+2,a
4162  0bc9 a6ef          	ld	a,#low(L5461)
4163  0bcb aeef          	ld	x,#high(L5461)
4164  0bcd cd0000        	call	_displayWriteString
4166                     ; 582 		displayWriteString("2", 			DISPLAY_NULL, 				2, 		39);
4168  0bd0 a627          	ld	a,#39
4169  0bd2 b704          	ld	_displayWriteString$L+4,a
4170  0bd4 a602          	ld	a,#2
4171  0bd6 b703          	ld	_displayWriteString$L+3,a
4172  0bd8 a6ff          	ld	a,#255
4173  0bda b702          	ld	_displayWriteString$L+2,a
4174  0bdc a6ed          	ld	a,#low(L7461)
4175  0bde aeed          	ld	x,#high(L7461)
4176  0be0 cd0000        	call	_displayWriteString
4178                     ; 583 		displayWriteString("3", 			DISPLAY_NULL, 				2, 		61);
4180  0be3 a63d          	ld	a,#61
4181  0be5 b704          	ld	_displayWriteString$L+4,a
4182  0be7 a602          	ld	a,#2
4183  0be9 b703          	ld	_displayWriteString$L+3,a
4184  0beb a6ff          	ld	a,#255
4185  0bed b702          	ld	_displayWriteString$L+2,a
4186  0bef a6eb          	ld	a,#low(L1561)
4187  0bf1 aeeb          	ld	x,#high(L1561)
4188  0bf3 cd0000        	call	_displayWriteString
4190                     ; 584 		displayWriteString("4", 			DISPLAY_NULL, 				67,		17);
4192  0bf6 a611          	ld	a,#17
4193  0bf8 b704          	ld	_displayWriteString$L+4,a
4194  0bfa a643          	ld	a,#67
4195  0bfc b703          	ld	_displayWriteString$L+3,a
4196  0bfe a6ff          	ld	a,#255
4197  0c00 b702          	ld	_displayWriteString$L+2,a
4198  0c02 a6e9          	ld	a,#low(L3561)
4199  0c04 aee9          	ld	x,#high(L3561)
4200  0c06 cd0000        	call	_displayWriteString
4202                     ; 585 		displayWriteString("5", 			DISPLAY_NULL, 				67, 	39);
4204  0c09 a627          	ld	a,#39
4205  0c0b b704          	ld	_displayWriteString$L+4,a
4206  0c0d a643          	ld	a,#67
4207  0c0f b703          	ld	_displayWriteString$L+3,a
4208  0c11 a6ff          	ld	a,#255
4209  0c13 b702          	ld	_displayWriteString$L+2,a
4210  0c15 a6e7          	ld	a,#low(L5561)
4211  0c17 aee7          	ld	x,#high(L5561)
4212  0c19 cd0000        	call	_displayWriteString
4214                     ; 586 		displayWriteString("6", 			DISPLAY_NULL, 				67, 	61);
4216  0c1c a63d          	ld	a,#61
4217  0c1e b704          	ld	_displayWriteString$L+4,a
4218  0c20 a643          	ld	a,#67
4219  0c22 b703          	ld	_displayWriteString$L+3,a
4220  0c24 a6ff          	ld	a,#255
4221  0c26 b702          	ld	_displayWriteString$L+2,a
4222  0c28 a6e5          	ld	a,#low(L7561)
4223  0c2a aee5          	ld	x,#high(L7561)
4224  0c2c cd0000        	call	_displayWriteString
4226                     ; 589 		switch(*a_byGroup)
4228  0c2f 92c600        	ld	a,[_window6Menu$L.w]
4230                     ; 644 				break;
4231  0c32 4a            	dec	a
4232  0c33 2715          	jreq	L1061
4233  0c35 4a            	dec	a
4234  0c36 2603          	jrne	L632
4235  0c38 cc0cf0        	jp	L3061
4236  0c3b               L632:
4237  0c3b 4a            	dec	a
4238  0c3c 2603          	jrne	L042
4239  0c3e cc0d70        	jp	L5061
4240  0c41               L042:
4241  0c41 4a            	dec	a
4242  0c42 2603          	jrne	L242
4243  0c44 cc0e16        	jp	L7061
4244  0c47               L242:
4245  0c47 cc0f05        	jp	L3661
4246  0c4a               L1061:
4247                     ; 591 			case MENU_GROUP_FUNCTION:
4247                     ; 592 				displayWriteString("Fasatura", 			DISPLAY_SELECT_FONT_MINI, 	13, 	52);
4249  0c4a a634          	ld	a,#52
4250  0c4c b704          	ld	_displayWriteString$L+4,a
4251  0c4e a60d          	ld	a,#13
4252  0c50 b703          	ld	_displayWriteString$L+3,a
4253  0c52 a61c          	ld	a,#28
4254  0c54 b702          	ld	_displayWriteString$L+2,a
4255  0c56 a6dc          	ld	a,#low(L5661)
4256  0c58 aedc          	ld	x,#high(L5661)
4257  0c5a cd0000        	call	_displayWriteString
4259                     ; 593 				displayWriteString("manuale", 			DISPLAY_NULL, 				13, 	61);
4261  0c5d a63d          	ld	a,#61
4262  0c5f b704          	ld	_displayWriteString$L+4,a
4263  0c61 a60d          	ld	a,#13
4264  0c63 b703          	ld	_displayWriteString$L+3,a
4265  0c65 a6ff          	ld	a,#255
4266  0c67 b702          	ld	_displayWriteString$L+2,a
4267  0c69 a60c          	ld	a,#low(L577)
4268  0c6b ae0c          	ld	x,#high(L577)
4269  0c6d cd0000        	call	_displayWriteString
4271                     ; 594 				displayWriteString("Fasatura", 			DISPLAY_NULL, 				78, 	9);
4273  0c70 a609          	ld	a,#9
4274  0c72 b704          	ld	_displayWriteString$L+4,a
4275  0c74 a64e          	ld	a,#78
4276  0c76 b703          	ld	_displayWriteString$L+3,a
4277  0c78 a6ff          	ld	a,#255
4278  0c7a b702          	ld	_displayWriteString$L+2,a
4279  0c7c a6dc          	ld	a,#low(L5661)
4280  0c7e aedc          	ld	x,#high(L5661)
4281  0c80 cd0000        	call	_displayWriteString
4283                     ; 595 				displayWriteString("automatica", 		DISPLAY_NULL, 				78, 	18);
4285  0c83 a612          	ld	a,#18
4286  0c85 b704          	ld	_displayWriteString$L+4,a
4287  0c87 a64e          	ld	a,#78
4288  0c89 b703          	ld	_displayWriteString$L+3,a
4289  0c8b a6ff          	ld	a,#255
4290  0c8d b702          	ld	_displayWriteString$L+2,a
4291  0c8f a6d1          	ld	a,#low(L7661)
4292  0c91 aed1          	ld	x,#high(L7661)
4293  0c93 cd0000        	call	_displayWriteString
4295                     ; 596 				displayWriteString("Fasatura ad", 		DISPLAY_NULL, 				78, 	31);
4297  0c96 a61f          	ld	a,#31
4298  0c98 b704          	ld	_displayWriteString$L+4,a
4299  0c9a a64e          	ld	a,#78
4300  0c9c b703          	ld	_displayWriteString$L+3,a
4301  0c9e a6ff          	ld	a,#255
4302  0ca0 b702          	ld	_displayWriteString$L+2,a
4303  0ca2 a6c5          	ld	a,#low(L1761)
4304  0ca4 aec5          	ld	x,#high(L1761)
4305  0ca6 cd0000        	call	_displayWriteString
4307                     ; 597 				displayWriteString("oscilloscop", 		DISPLAY_NULL, 				78, 	40);
4309  0ca9 a628          	ld	a,#40
4310  0cab b704          	ld	_displayWriteString$L+4,a
4311  0cad a64e          	ld	a,#78
4312  0caf b703          	ld	_displayWriteString$L+3,a
4313  0cb1 a6ff          	ld	a,#255
4314  0cb3 b702          	ld	_displayWriteString$L+2,a
4315  0cb5 a6b9          	ld	a,#low(L3761)
4316  0cb7 aeb9          	ld	x,#high(L3761)
4317  0cb9 cd0000        	call	_displayWriteString
4319                     ; 598 				displayWriteString("Fasatura ad", 		DISPLAY_NULL, 				78, 	52);
4321  0cbc a634          	ld	a,#52
4322  0cbe b704          	ld	_displayWriteString$L+4,a
4323  0cc0 a64e          	ld	a,#78
4324  0cc2 b703          	ld	_displayWriteString$L+3,a
4325  0cc4 a6ff          	ld	a,#255
4326  0cc6 b702          	ld	_displayWriteString$L+2,a
4327  0cc8 a6c5          	ld	a,#low(L1761)
4328  0cca aec5          	ld	x,#high(L1761)
4329  0ccc cd0000        	call	_displayWriteString
4331                     ; 599 				displayWriteString("acceleraz", 		DISPLAY_NULL, 				78, 	61);
4333  0ccf a63d          	ld	a,#61
4334  0cd1 b704          	ld	_displayWriteString$L+4,a
4335  0cd3 a64e          	ld	a,#78
4336  0cd5 b703          	ld	_displayWriteString$L+3,a
4337  0cd7 a6ff          	ld	a,#255
4338  0cd9 b702          	ld	_displayWriteString$L+2,a
4339  0cdb a6af          	ld	a,#low(L5761)
4340  0cdd aeaf          	ld	x,#high(L5761)
4341  0cdf cd0000        	call	_displayWriteString
4343                     ; 600 				windowForceRepaint();
4345  0ce2 cd001e        	call	_windowForceRepaint
4347                     ; 601 				_bset(m_woDisplayedWindow, WIN_FUNCTIONS);
4349  0ce5 c60001        	ld	a,_m_woDisplayedWindow+1
4350  0ce8 aa40          	or	a,#64
4351  0cea c70001        	ld	_m_woDisplayedWindow+1,a
4352                     ; 602 				break;
4354  0ced cc0f05        	jp	L3661
4355  0cf0               L3061:
4356                     ; 603 			case MENU_GROUP_PARAMETER:
4356                     ; 604 				displayWriteString("Sviluppo", 			DISPLAY_SELECT_FONT_MINI, 	13, 	9);
4358  0cf0 a609          	ld	a,#9
4359  0cf2 b704          	ld	_displayWriteString$L+4,a
4360  0cf4 a60d          	ld	a,#13
4361  0cf6 b703          	ld	_displayWriteString$L+3,a
4362  0cf8 a61c          	ld	a,#28
4363  0cfa b702          	ld	_displayWriteString$L+2,a
4364  0cfc a6a6          	ld	a,#low(L7761)
4365  0cfe aea6          	ld	x,#high(L7761)
4366  0d00 cd0000        	call	_displayWriteString
4368                     ; 605 				displayWriteString("cilindro", 			DISPLAY_NULL, 				13, 	18);
4370  0d03 a612          	ld	a,#18
4371  0d05 b704          	ld	_displayWriteString$L+4,a
4372  0d07 a60d          	ld	a,#13
4373  0d09 b703          	ld	_displayWriteString$L+3,a
4374  0d0b a6ff          	ld	a,#255
4375  0d0d b702          	ld	_displayWriteString$L+2,a
4376  0d0f a69d          	ld	a,#low(L1071)
4377  0d11 ae9d          	ld	x,#high(L1071)
4378  0d13 cd0000        	call	_displayWriteString
4380                     ; 606 				displayWriteString("Soglia", 			DISPLAY_NULL, 				13, 	31);
4382  0d16 a61f          	ld	a,#31
4383  0d18 b704          	ld	_displayWriteString$L+4,a
4384  0d1a a60d          	ld	a,#13
4385  0d1c b703          	ld	_displayWriteString$L+3,a
4386  0d1e a6ff          	ld	a,#255
4387  0d20 b702          	ld	_displayWriteString$L+2,a
4388  0d22 a696          	ld	a,#low(L3071)
4389  0d24 ae96          	ld	x,#high(L3071)
4390  0d26 cd0000        	call	_displayWriteString
4392                     ; 607 				displayWriteString("allarme", 			DISPLAY_NULL, 				13, 	40);
4394  0d29 a628          	ld	a,#40
4395  0d2b b704          	ld	_displayWriteString$L+4,a
4396  0d2d a60d          	ld	a,#13
4397  0d2f b703          	ld	_displayWriteString$L+3,a
4398  0d31 a6ff          	ld	a,#255
4399  0d33 b702          	ld	_displayWriteString$L+2,a
4400  0d35 a68e          	ld	a,#low(L5071)
4401  0d37 ae8e          	ld	x,#high(L5071)
4402  0d39 cd0000        	call	_displayWriteString
4404                     ; 608 				displayWriteString("Ampiezza", 			DISPLAY_NULL, 				13, 	52);
4406  0d3c a634          	ld	a,#52
4407  0d3e b704          	ld	_displayWriteString$L+4,a
4408  0d40 a60d          	ld	a,#13
4409  0d42 b703          	ld	_displayWriteString$L+3,a
4410  0d44 a6ff          	ld	a,#255
4411  0d46 b702          	ld	_displayWriteString$L+2,a
4412  0d48 a685          	ld	a,#low(L7071)
4413  0d4a ae85          	ld	x,#high(L7071)
4414  0d4c cd0000        	call	_displayWriteString
4416                     ; 609 				displayWriteString("gate", 				DISPLAY_NULL, 				13, 	61);
4418  0d4f a63d          	ld	a,#61
4419  0d51 b704          	ld	_displayWriteString$L+4,a
4420  0d53 a60d          	ld	a,#13
4421  0d55 b703          	ld	_displayWriteString$L+3,a
4422  0d57 a6ff          	ld	a,#255
4423  0d59 b702          	ld	_displayWriteString$L+2,a
4424  0d5b a680          	ld	a,#low(L1171)
4425  0d5d ae80          	ld	x,#high(L1171)
4426  0d5f cd0000        	call	_displayWriteString
4428                     ; 610 				windowForceRepaint();
4430  0d62 cd001e        	call	_windowForceRepaint
4432                     ; 611 				_bset(m_woDisplayedWindow, WIN_PARAMETERS);
4434  0d65 c60001        	ld	a,_m_woDisplayedWindow+1
4435  0d68 aa80          	or	a,#128
4436  0d6a c70001        	ld	_m_woDisplayedWindow+1,a
4437                     ; 612 				break;
4439  0d6d cc0f05        	jp	L3661
4440  0d70               L5061:
4441                     ; 613 			case MENU_GROUP_TEST:
4441                     ; 614 				displayWriteString("Test", 				DISPLAY_SELECT_FONT_MINI, 	13, 	9);
4443  0d70 a609          	ld	a,#9
4444  0d72 b704          	ld	_displayWriteString$L+4,a
4445  0d74 a60d          	ld	a,#13
4446  0d76 b703          	ld	_displayWriteString$L+3,a
4447  0d78 a61c          	ld	a,#28
4448  0d7a b702          	ld	_displayWriteString$L+2,a
4449  0d7c a67b          	ld	a,#low(L3171)
4450  0d7e ae7b          	ld	x,#high(L3171)
4451  0d80 cd0000        	call	_displayWriteString
4453                     ; 615 				displayWriteString("testina", 			DISPLAY_NULL, 				13, 	18);
4455  0d83 a612          	ld	a,#18
4456  0d85 b704          	ld	_displayWriteString$L+4,a
4457  0d87 a60d          	ld	a,#13
4458  0d89 b703          	ld	_displayWriteString$L+3,a
4459  0d8b a6ff          	ld	a,#255
4460  0d8d b702          	ld	_displayWriteString$L+2,a
4461  0d8f a673          	ld	a,#low(L5171)
4462  0d91 ae73          	ld	x,#high(L5171)
4463  0d93 cd0000        	call	_displayWriteString
4465                     ; 616 				displayWriteString("Test", 				DISPLAY_NULL, 				13, 	31);
4467  0d96 a61f          	ld	a,#31
4468  0d98 b704          	ld	_displayWriteString$L+4,a
4469  0d9a a60d          	ld	a,#13
4470  0d9c b703          	ld	_displayWriteString$L+3,a
4471  0d9e a6ff          	ld	a,#255
4472  0da0 b702          	ld	_displayWriteString$L+2,a
4473  0da2 a67b          	ld	a,#low(L3171)
4474  0da4 ae7b          	ld	x,#high(L3171)
4475  0da6 cd0000        	call	_displayWriteString
4477                     ; 617 				displayWriteString("encoder", 			DISPLAY_NULL, 				13, 	40);
4479  0da9 a628          	ld	a,#40
4480  0dab b704          	ld	_displayWriteString$L+4,a
4481  0dad a60d          	ld	a,#13
4482  0daf b703          	ld	_displayWriteString$L+3,a
4483  0db1 a6ff          	ld	a,#255
4484  0db3 b702          	ld	_displayWriteString$L+2,a
4485  0db5 a66b          	ld	a,#low(L7171)
4486  0db7 ae6b          	ld	x,#high(L7171)
4487  0db9 cd0000        	call	_displayWriteString
4489                     ; 618 				displayWriteString("Distanza", 			DISPLAY_NULL, 				13, 	52);
4491  0dbc a634          	ld	a,#52
4492  0dbe b704          	ld	_displayWriteString$L+4,a
4493  0dc0 a60d          	ld	a,#13
4494  0dc2 b703          	ld	_displayWriteString$L+3,a
4495  0dc4 a6ff          	ld	a,#255
4496  0dc6 b702          	ld	_displayWriteString$L+2,a
4497  0dc8 a662          	ld	a,#low(L1271)
4498  0dca ae62          	ld	x,#high(L1271)
4499  0dcc cd0000        	call	_displayWriteString
4501                     ; 619 				displayWriteString("su offset", 		DISPLAY_NULL, 				13, 	61);
4503  0dcf a63d          	ld	a,#61
4504  0dd1 b704          	ld	_displayWriteString$L+4,a
4505  0dd3 a60d          	ld	a,#13
4506  0dd5 b703          	ld	_displayWriteString$L+3,a
4507  0dd7 a6ff          	ld	a,#255
4508  0dd9 b702          	ld	_displayWriteString$L+2,a
4509  0ddb a658          	ld	a,#low(L3271)
4510  0ddd ae58          	ld	x,#high(L3271)
4511  0ddf cd0000        	call	_displayWriteString
4513                     ; 620 				displayWriteString("Versione", 			DISPLAY_NULL, 				78, 	9);
4515  0de2 a609          	ld	a,#9
4516  0de4 b704          	ld	_displayWriteString$L+4,a
4517  0de6 a64e          	ld	a,#78
4518  0de8 b703          	ld	_displayWriteString$L+3,a
4519  0dea a6ff          	ld	a,#255
4520  0dec b702          	ld	_displayWriteString$L+2,a
4521  0dee a64f          	ld	a,#low(L5271)
4522  0df0 ae4f          	ld	x,#high(L5271)
4523  0df2 cd0000        	call	_displayWriteString
4525                     ; 621 				displayWriteString("Software", 			DISPLAY_NULL, 				78, 	18);
4527  0df5 a612          	ld	a,#18
4528  0df7 b704          	ld	_displayWriteString$L+4,a
4529  0df9 a64e          	ld	a,#78
4530  0dfb b703          	ld	_displayWriteString$L+3,a
4531  0dfd a6ff          	ld	a,#255
4532  0dff b702          	ld	_displayWriteString$L+2,a
4533  0e01 a646          	ld	a,#low(L7271)
4534  0e03 ae46          	ld	x,#high(L7271)
4535  0e05 cd0000        	call	_displayWriteString
4537                     ; 626 				windowForceRepaint();
4539  0e08 cd001e        	call	_windowForceRepaint
4541                     ; 627 				_bset(m_woDisplayedWindow, WIN_TESTS);
4543  0e0b c60000        	ld	a,_m_woDisplayedWindow
4544  0e0e aa01          	or	a,#1
4545  0e10 c70000        	ld	_m_woDisplayedWindow,a
4546                     ; 628 				break;
4548  0e13 cc0f05        	jp	L3661
4549  0e16               L7061:
4550                     ; 629 			case MENU_GROUP_MENU:
4550                     ; 630 				displayWriteString("Visual",			DISPLAY_SELECT_FONT_MINI, 	13, 	9);
4552  0e16 a609          	ld	a,#9
4553  0e18 b704          	ld	_displayWriteString$L+4,a
4554  0e1a a60d          	ld	a,#13
4555  0e1c b703          	ld	_displayWriteString$L+3,a
4556  0e1e a61c          	ld	a,#28
4557  0e20 b702          	ld	_displayWriteString$L+2,a
4558  0e22 a63f          	ld	a,#low(L1371)
4559  0e24 ae3f          	ld	x,#high(L1371)
4560  0e26 cd0000        	call	_displayWriteString
4562                     ; 631 				displayWriteString("Registro", 			DISPLAY_NULL, 				13, 	18);
4564  0e29 a612          	ld	a,#18
4565  0e2b b704          	ld	_displayWriteString$L+4,a
4566  0e2d a60d          	ld	a,#13
4567  0e2f b703          	ld	_displayWriteString$L+3,a
4568  0e31 a6ff          	ld	a,#255
4569  0e33 b702          	ld	_displayWriteString$L+2,a
4570  0e35 a636          	ld	a,#low(L3371)
4571  0e37 ae36          	ld	x,#high(L3371)
4572  0e39 cd0000        	call	_displayWriteString
4574                     ; 632 				displayWriteString("Visual", 			DISPLAY_NULL, 				13, 	31);
4576  0e3c a61f          	ld	a,#31
4577  0e3e b704          	ld	_displayWriteString$L+4,a
4578  0e40 a60d          	ld	a,#13
4579  0e42 b703          	ld	_displayWriteString$L+3,a
4580  0e44 a6ff          	ld	a,#255
4581  0e46 b702          	ld	_displayWriteString$L+2,a
4582  0e48 a63f          	ld	a,#low(L1371)
4583  0e4a ae3f          	ld	x,#high(L1371)
4584  0e4c cd0000        	call	_displayWriteString
4586                     ; 633 				displayWriteString("Oscilloscop", 		DISPLAY_NULL, 				13, 	40);
4588  0e4f a628          	ld	a,#40
4589  0e51 b704          	ld	_displayWriteString$L+4,a
4590  0e53 a60d          	ld	a,#13
4591  0e55 b703          	ld	_displayWriteString$L+3,a
4592  0e57 a6ff          	ld	a,#255
4593  0e59 b702          	ld	_displayWriteString$L+2,a
4594  0e5b a62a          	ld	a,#low(L5371)
4595  0e5d ae2a          	ld	x,#high(L5371)
4596  0e5f cd0000        	call	_displayWriteString
4598                     ; 634 				displayWriteString("Archivio", 			DISPLAY_NULL, 				13, 	52);
4600  0e62 a634          	ld	a,#52
4601  0e64 b704          	ld	_displayWriteString$L+4,a
4602  0e66 a60d          	ld	a,#13
4603  0e68 b703          	ld	_displayWriteString$L+3,a
4604  0e6a a6ff          	ld	a,#255
4605  0e6c b702          	ld	_displayWriteString$L+2,a
4606  0e6e a621          	ld	a,#low(L7371)
4607  0e70 ae21          	ld	x,#high(L7371)
4608  0e72 cd0000        	call	_displayWriteString
4610                     ; 635 				displayWriteString("Lavori", 			DISPLAY_NULL, 				13, 	61);
4612  0e75 a63d          	ld	a,#61
4613  0e77 b704          	ld	_displayWriteString$L+4,a
4614  0e79 a60d          	ld	a,#13
4615  0e7b b703          	ld	_displayWriteString$L+3,a
4616  0e7d a6ff          	ld	a,#255
4617  0e7f b702          	ld	_displayWriteString$L+2,a
4618  0e81 a61a          	ld	a,#low(L1471)
4619  0e83 ae1a          	ld	x,#high(L1471)
4620  0e85 cd0000        	call	_displayWriteString
4622                     ; 636 				displayWriteString("Funzioni", 			DISPLAY_NULL, 				78, 	9);
4624  0e88 a609          	ld	a,#9
4625  0e8a b704          	ld	_displayWriteString$L+4,a
4626  0e8c a64e          	ld	a,#78
4627  0e8e b703          	ld	_displayWriteString$L+3,a
4628  0e90 a6ff          	ld	a,#255
4629  0e92 b702          	ld	_displayWriteString$L+2,a
4630  0e94 a611          	ld	a,#low(L3471)
4631  0e96 ae11          	ld	x,#high(L3471)
4632  0e98 cd0000        	call	_displayWriteString
4634                     ; 637 				displayWriteString("", 					DISPLAY_NULL, 				78, 	18);
4636  0e9b a612          	ld	a,#18
4637  0e9d b704          	ld	_displayWriteString$L+4,a
4638  0e9f a64e          	ld	a,#78
4639  0ea1 b703          	ld	_displayWriteString$L+3,a
4640  0ea3 a6ff          	ld	a,#255
4641  0ea5 b702          	ld	_displayWriteString$L+2,a
4642  0ea7 a610          	ld	a,#low(L5471)
4643  0ea9 ae10          	ld	x,#high(L5471)
4644  0eab cd0000        	call	_displayWriteString
4646                     ; 638 				displayWriteString("Parametri", 		DISPLAY_NULL, 				78, 	31);
4648  0eae a61f          	ld	a,#31
4649  0eb0 b704          	ld	_displayWriteString$L+4,a
4650  0eb2 a64e          	ld	a,#78
4651  0eb4 b703          	ld	_displayWriteString$L+3,a
4652  0eb6 a6ff          	ld	a,#255
4653  0eb8 b702          	ld	_displayWriteString$L+2,a
4654  0eba a606          	ld	a,#low(L7471)
4655  0ebc ae06          	ld	x,#high(L7471)
4656  0ebe cd0000        	call	_displayWriteString
4658                     ; 639 				displayWriteString("", 					DISPLAY_NULL, 				78, 	40);
4660  0ec1 a628          	ld	a,#40
4661  0ec3 b704          	ld	_displayWriteString$L+4,a
4662  0ec5 a64e          	ld	a,#78
4663  0ec7 b703          	ld	_displayWriteString$L+3,a
4664  0ec9 a6ff          	ld	a,#255
4665  0ecb b702          	ld	_displayWriteString$L+2,a
4666  0ecd a610          	ld	a,#low(L5471)
4667  0ecf ae10          	ld	x,#high(L5471)
4668  0ed1 cd0000        	call	_displayWriteString
4670                     ; 640 				displayWriteString("Tests", 			DISPLAY_NULL, 				78, 	52);
4672  0ed4 a634          	ld	a,#52
4673  0ed6 b704          	ld	_displayWriteString$L+4,a
4674  0ed8 a64e          	ld	a,#78
4675  0eda b703          	ld	_displayWriteString$L+3,a
4676  0edc a6ff          	ld	a,#255
4677  0ede b702          	ld	_displayWriteString$L+2,a
4678  0ee0 a600          	ld	a,#low(L1571)
4679  0ee2 ae00          	ld	x,#high(L1571)
4680  0ee4 cd0000        	call	_displayWriteString
4682                     ; 641 				displayWriteString("", 					DISPLAY_NULL, 				78, 	61);
4684  0ee7 a63d          	ld	a,#61
4685  0ee9 b704          	ld	_displayWriteString$L+4,a
4686  0eeb a64e          	ld	a,#78
4687  0eed b703          	ld	_displayWriteString$L+3,a
4688  0eef a6ff          	ld	a,#255
4689  0ef1 b702          	ld	_displayWriteString$L+2,a
4690  0ef3 a610          	ld	a,#low(L5471)
4691  0ef5 ae10          	ld	x,#high(L5471)
4692  0ef7 cd0000        	call	_displayWriteString
4694                     ; 642 				windowForceRepaint();
4696  0efa cd001e        	call	_windowForceRepaint
4698                     ; 643 				_bset(m_woDisplayedWindow, WIN_MENUS);
4700  0efd c60000        	ld	a,_m_woDisplayedWindow
4701  0f00 aa02          	or	a,#2
4702  0f02 c70000        	ld	_m_woDisplayedWindow,a
4703                     ; 644 				break;
4705  0f05               L3661:
4706                     ; 647 		displaySetOutLine(0, 	0, 	63, 	20, 	(*a_bySelected == 1));
4708  0f05 92c602        	ld	a,[_window6Menu$L+2.w]
4709  0f08 a101          	cp	a,#1
4710  0f0a 2604          	jrne	L261
4711  0f0c a601          	ld	a,#1
4712  0f0e 2001          	jra	L461
4713  0f10               L261:
4714  0f10 4f            	clr	a
4715  0f11               L461:
4716  0f11 b704          	ld	_displaySetOutLine$L+4,a
4717  0f13 a614          	ld	a,#20
4718  0f15 b703          	ld	_displaySetOutLine$L+3,a
4719  0f17 a63f          	ld	a,#63
4720  0f19 b702          	ld	_displaySetOutLine$L+2,a
4721  0f1b 4f            	clr	a
4722  0f1c 5f            	clr	x
4723  0f1d cd0000        	call	_displaySetOutLine
4725                     ; 648 		displaySetOutLine(0, 	22, 63, 	42, 	(*a_bySelected == 2));
4727  0f20 92c602        	ld	a,[_window6Menu$L+2.w]
4728  0f23 a102          	cp	a,#2
4729  0f25 2604          	jrne	L661
4730  0f27 a601          	ld	a,#1
4731  0f29 2001          	jra	L071
4732  0f2b               L661:
4733  0f2b 4f            	clr	a
4734  0f2c               L071:
4735  0f2c b704          	ld	_displaySetOutLine$L+4,a
4736  0f2e a62a          	ld	a,#42
4737  0f30 b703          	ld	_displaySetOutLine$L+3,a
4738  0f32 a63f          	ld	a,#63
4739  0f34 b702          	ld	_displaySetOutLine$L+2,a
4740  0f36 a616          	ld	a,#22
4741  0f38 5f            	clr	x
4742  0f39 cd0000        	call	_displaySetOutLine
4744                     ; 649 		displaySetOutLine(0, 	44, 63, 	64, 	(*a_bySelected == 3));
4746  0f3c 92c602        	ld	a,[_window6Menu$L+2.w]
4747  0f3f a103          	cp	a,#3
4748  0f41 2604          	jrne	L271
4749  0f43 a601          	ld	a,#1
4750  0f45 2001          	jra	L471
4751  0f47               L271:
4752  0f47 4f            	clr	a
4753  0f48               L471:
4754  0f48 b704          	ld	_displaySetOutLine$L+4,a
4755  0f4a a640          	ld	a,#64
4756  0f4c b703          	ld	_displaySetOutLine$L+3,a
4757  0f4e a63f          	ld	a,#63
4758  0f50 b702          	ld	_displaySetOutLine$L+2,a
4759  0f52 a62c          	ld	a,#44
4760  0f54 5f            	clr	x
4761  0f55 cd0000        	call	_displaySetOutLine
4763                     ; 650 		displaySetOutLine(65, 	0, 	126, 	20, 	(*a_bySelected == 4));
4765  0f58 92c602        	ld	a,[_window6Menu$L+2.w]
4766  0f5b a104          	cp	a,#4
4767  0f5d 2604          	jrne	L671
4768  0f5f a601          	ld	a,#1
4769  0f61 2001          	jra	L002
4770  0f63               L671:
4771  0f63 4f            	clr	a
4772  0f64               L002:
4773  0f64 b704          	ld	_displaySetOutLine$L+4,a
4774  0f66 a614          	ld	a,#20
4775  0f68 b703          	ld	_displaySetOutLine$L+3,a
4776  0f6a a67e          	ld	a,#126
4777  0f6c b702          	ld	_displaySetOutLine$L+2,a
4778  0f6e 4f            	clr	a
4779  0f6f ae41          	ld	x,#65
4780  0f71 cd0000        	call	_displaySetOutLine
4782                     ; 651 		displaySetOutLine(65, 	22, 126, 	42, 	(*a_bySelected == 5));
4784  0f74 92c602        	ld	a,[_window6Menu$L+2.w]
4785  0f77 a105          	cp	a,#5
4786  0f79 2604          	jrne	L202
4787  0f7b a601          	ld	a,#1
4788  0f7d 2001          	jra	L402
4789  0f7f               L202:
4790  0f7f 4f            	clr	a
4791  0f80               L402:
4792  0f80 b704          	ld	_displaySetOutLine$L+4,a
4793  0f82 a62a          	ld	a,#42
4794  0f84 b703          	ld	_displaySetOutLine$L+3,a
4795  0f86 a67e          	ld	a,#126
4796  0f88 b702          	ld	_displaySetOutLine$L+2,a
4797  0f8a a616          	ld	a,#22
4798  0f8c ae41          	ld	x,#65
4799  0f8e cd0000        	call	_displaySetOutLine
4801                     ; 652 		displaySetOutLine(65, 	44,	126, 	64, 	(*a_bySelected == 6));
4803  0f91 92c602        	ld	a,[_window6Menu$L+2.w]
4804  0f94 a106          	cp	a,#6
4805  0f96 2604          	jrne	L602
4806  0f98 a601          	ld	a,#1
4807  0f9a 2001          	jra	L012
4808  0f9c               L602:
4809  0f9c 4f            	clr	a
4810  0f9d               L012:
4811  0f9d b704          	ld	_displaySetOutLine$L+4,a
4812  0f9f a640          	ld	a,#64
4813  0fa1 b703          	ld	_displaySetOutLine$L+3,a
4814  0fa3 a67e          	ld	a,#126
4815  0fa5 b702          	ld	_displaySetOutLine$L+2,a
4816  0fa7 a62c          	ld	a,#44
4817  0fa9 ae41          	ld	x,#65
4818  0fab cd0000        	call	_displaySetOutLine
4821  0fae cc1083        	jp	L3571
4822  0fb1               L3361:
4823                     ; 657 		if ((*a_bySelected == 1) || parametersGetValue(PARAM_PAGE_SEL) == 1)
4825  0fb1 92c602        	ld	a,[_window6Menu$L+2.w]
4826  0fb4 a101          	cp	a,#1
4827  0fb6 270d          	jreq	L7571
4829  0fb8 a605          	ld	a,#5
4830  0fba cd0000        	call	_parametersGetValue
4832  0fbd a101          	cp	a,#1
4833  0fbf 2602          	jrne	L212
4834  0fc1 a300          	cp	x,#0
4835  0fc3               L212:
4836  0fc3 260f          	jrne	L5571
4837  0fc5               L7571:
4838                     ; 658 			displayInvertArea(1, 	1, 	62, 	19);
4840  0fc5 a613          	ld	a,#19
4841  0fc7 b703          	ld	_displayInvertArea$L+3,a
4842  0fc9 a63e          	ld	a,#62
4843  0fcb b702          	ld	_displayInvertArea$L+2,a
4844  0fcd a601          	ld	a,#1
4845  0fcf ae01          	ld	x,#1
4846  0fd1 cd0000        	call	_displayInvertArea
4848  0fd4               L5571:
4849                     ; 660 		if ((*a_bySelected == 2) || parametersGetValue(PARAM_PAGE_SEL) == 2)
4851  0fd4 92c602        	ld	a,[_window6Menu$L+2.w]
4852  0fd7 a102          	cp	a,#2
4853  0fd9 270d          	jreq	L3671
4855  0fdb a605          	ld	a,#5
4856  0fdd cd0000        	call	_parametersGetValue
4858  0fe0 a102          	cp	a,#2
4859  0fe2 2602          	jrne	L412
4860  0fe4 a300          	cp	x,#0
4861  0fe6               L412:
4862  0fe6 260f          	jrne	L1671
4863  0fe8               L3671:
4864                     ; 661 			displayInvertArea(1, 	23, 62, 	41);
4866  0fe8 a629          	ld	a,#41
4867  0fea b703          	ld	_displayInvertArea$L+3,a
4868  0fec a63e          	ld	a,#62
4869  0fee b702          	ld	_displayInvertArea$L+2,a
4870  0ff0 a617          	ld	a,#23
4871  0ff2 ae01          	ld	x,#1
4872  0ff4 cd0000        	call	_displayInvertArea
4874  0ff7               L1671:
4875                     ; 663 		if ((*a_bySelected == 3) || parametersGetValue(PARAM_PAGE_SEL) == 3)
4877  0ff7 92c602        	ld	a,[_window6Menu$L+2.w]
4878  0ffa a103          	cp	a,#3
4879  0ffc 270d          	jreq	L7671
4881  0ffe a605          	ld	a,#5
4882  1000 cd0000        	call	_parametersGetValue
4884  1003 a103          	cp	a,#3
4885  1005 2602          	jrne	L612
4886  1007 a300          	cp	x,#0
4887  1009               L612:
4888  1009 260f          	jrne	L5671
4889  100b               L7671:
4890                     ; 664 			displayInvertArea(1, 	45, 62, 	63);
4892  100b a63f          	ld	a,#63
4893  100d b703          	ld	_displayInvertArea$L+3,a
4894  100f a63e          	ld	a,#62
4895  1011 b702          	ld	_displayInvertArea$L+2,a
4896  1013 a62d          	ld	a,#45
4897  1015 ae01          	ld	x,#1
4898  1017 cd0000        	call	_displayInvertArea
4900  101a               L5671:
4901                     ; 666 		if ((*a_bySelected == 4) || parametersGetValue(PARAM_PAGE_SEL) == 4)
4903  101a 92c602        	ld	a,[_window6Menu$L+2.w]
4904  101d a104          	cp	a,#4
4905  101f 270d          	jreq	L3771
4907  1021 a605          	ld	a,#5
4908  1023 cd0000        	call	_parametersGetValue
4910  1026 a104          	cp	a,#4
4911  1028 2602          	jrne	L022
4912  102a a300          	cp	x,#0
4913  102c               L022:
4914  102c 260f          	jrne	L1771
4915  102e               L3771:
4916                     ; 667 			displayInvertArea(66, 	1, 	125, 	19);
4918  102e a613          	ld	a,#19
4919  1030 b703          	ld	_displayInvertArea$L+3,a
4920  1032 a67d          	ld	a,#125
4921  1034 b702          	ld	_displayInvertArea$L+2,a
4922  1036 a601          	ld	a,#1
4923  1038 ae42          	ld	x,#66
4924  103a cd0000        	call	_displayInvertArea
4926  103d               L1771:
4927                     ; 669 		if ((*a_bySelected == 5) || parametersGetValue(PARAM_PAGE_SEL) == 5)
4929  103d 92c602        	ld	a,[_window6Menu$L+2.w]
4930  1040 a105          	cp	a,#5
4931  1042 270d          	jreq	L7771
4933  1044 a605          	ld	a,#5
4934  1046 cd0000        	call	_parametersGetValue
4936  1049 a105          	cp	a,#5
4937  104b 2602          	jrne	L222
4938  104d a300          	cp	x,#0
4939  104f               L222:
4940  104f 260f          	jrne	L5771
4941  1051               L7771:
4942                     ; 670 			displayInvertArea(66, 	23, 125, 	41);
4944  1051 a629          	ld	a,#41
4945  1053 b703          	ld	_displayInvertArea$L+3,a
4946  1055 a67d          	ld	a,#125
4947  1057 b702          	ld	_displayInvertArea$L+2,a
4948  1059 a617          	ld	a,#23
4949  105b ae42          	ld	x,#66
4950  105d cd0000        	call	_displayInvertArea
4952  1060               L5771:
4953                     ; 672 		if ((*a_bySelected == 6) || parametersGetValue(PARAM_PAGE_SEL) == 6)
4955  1060 92c602        	ld	a,[_window6Menu$L+2.w]
4956  1063 a106          	cp	a,#6
4957  1065 270d          	jreq	L3002
4959  1067 a605          	ld	a,#5
4960  1069 cd0000        	call	_parametersGetValue
4962  106c a106          	cp	a,#6
4963  106e 2602          	jrne	L422
4964  1070 a300          	cp	x,#0
4965  1072               L422:
4966  1072 260f          	jrne	L3571
4967  1074               L3002:
4968                     ; 673 			displayInvertArea(66, 	45,	125, 	63);
4970  1074 a63f          	ld	a,#63
4971  1076 b703          	ld	_displayInvertArea$L+3,a
4972  1078 a67d          	ld	a,#125
4973  107a b702          	ld	_displayInvertArea$L+2,a
4974  107c a62d          	ld	a,#45
4975  107e ae42          	ld	x,#66
4976  1080 cd0000        	call	_displayInvertArea
4978  1083               L3571:
4979                     ; 676 	parametersSet(PARAM_PAGE_SEL, *a_bySelected);	
4981  1083 92c602        	ld	a,[_window6Menu$L+2.w]
4982  1086 5f            	clr	x
4983  1087 b702          	ld	_parametersSet$L+2,a
4984  1089 bf01          	ld	_parametersSet$L+1,x
4985  108b a605          	ld	a,#5
4986  108d cd0000        	call	_parametersSet
4988                     ; 677 }
4991  1090 81            	ret
5014                     ; 680 void windowSetupParameter(void)
5014                     ; 681 {
5015                     	switch	.text
5016  1091               _windowSetupParameter:
5019                     ; 683 }
5022  1091 81            	ret
5065                     	xdef	_windowSetupParameter
5066                     	xdef	_windowIsInGate
5067                     	xdef	_windowOscilloscopeGetValue
5068                     	xdef	_windowOffsetToHaveCenteredGate
5069                     	xdef	_windowRegisterPrepareFormateValue
5070                     	switch	.bss
5071  0000               _m_woDisplayedWindow:
5072  0000 0000          	ds.b	2
5073                     	xdef	_m_woDisplayedWindow
5074  0002               _m_byCurrentSelectorX:
5075  0002 00            	ds.b	1
5076                     	xdef	_m_byCurrentSelectorX
5077  0003               _m_woRegisterValue:
5078  0003 0000          	ds.b	2
5079                     	xdef	_m_woRegisterValue
5080                     	xref	_m_woEncoderGateEnd
5081                     	xref	_m_woEncoderGateStart
5082                     	xref	_m_arbyScanningHeadSignal
5083                     	xref	_m_arbyDisplayCommand
5084                     	xdef	_window6Menu
5085                     	xdef	_windowForceRepaint
5086                     	xdef	_windowRegister
5087                     	xdef	_windowOscilloscope
5088                     	xdef	_windowAlarm
5089                     	xdef	_windowBigMessage
5090                     	xdef	_windowMessage
5091                     	xdef	_windowSpeed
5092                     	xdef	_windowMode
5093                     	xdef	_windowInit
5094                     	xref	_formatNumber
5095                     	xref	_displayDrawBox
5096                     	xref	_displayDrawAlarm
5097                     	xref	_displayDrawCorrection
5098                     	xref	_displayDrawSelector
5099                     	xref	_displayDrawHorizontalLine
5100                     	xref	_displayDrawVerticalLine
5101                     	xref	_displayInvertArea
5102                     	xref	_displaySetOutLine
5103                     	xref	_displayClearArea
5104                     	xref	_displayWriteString
5105                     	xref	_displayIsKeyPress
5106                     	xref	_displayCmdToDisplay
5107                     	xref	_parametersIsChanged
5108                     	xref	_parametersChangedFlagReset
5109                     	xref	_parametersSet
5110                     	xref	_parametersGetValue
5111                     .const:	section	.text
5112  0000               L1571:
5113  0000 546573747300  	dc.b	"Tests",0
5114  0006               L7471:
5115  0006 506172616d65  	dc.b	"Parametri",0
5116  0010               L5471:
5117  0010 00            	dc.b	0
5118  0011               L3471:
5119  0011 46756e7a696f  	dc.b	"Funzioni",0
5120  001a               L1471:
5121  001a 4c61766f7269  	dc.b	"Lavori",0
5122  0021               L7371:
5123  0021 417263686976  	dc.b	"Archivio",0
5124  002a               L5371:
5125  002a 4f7363696c6c  	dc.b	"Oscilloscop",0
5126  0036               L3371:
5127  0036 526567697374  	dc.b	"Registro",0
5128  003f               L1371:
5129  003f 56697375616c  	dc.b	"Visual",0
5130  0046               L7271:
5131  0046 536f66747761  	dc.b	"Software",0
5132  004f               L5271:
5133  004f 56657273696f  	dc.b	"Versione",0
5134  0058               L3271:
5135  0058 7375206f6666  	dc.b	"su offset",0
5136  0062               L1271:
5137  0062 44697374616e  	dc.b	"Distanza",0
5138  006b               L7171:
5139  006b 656e636f6465  	dc.b	"encoder",0
5140  0073               L5171:
5141  0073 74657374696e  	dc.b	"testina",0
5142  007b               L3171:
5143  007b 5465737400    	dc.b	"Test",0
5144  0080               L1171:
5145  0080 6761746500    	dc.b	"gate",0
5146  0085               L7071:
5147  0085 416d7069657a  	dc.b	"Ampiezza",0
5148  008e               L5071:
5149  008e 616c6c61726d  	dc.b	"allarme",0
5150  0096               L3071:
5151  0096 536f676c6961  	dc.b	"Soglia",0
5152  009d               L1071:
5153  009d 63696c696e64  	dc.b	"cilindro",0
5154  00a6               L7761:
5155  00a6 5376696c7570  	dc.b	"Sviluppo",0
5156  00af               L5761:
5157  00af 616363656c65  	dc.b	"acceleraz",0
5158  00b9               L3761:
5159  00b9 6f7363696c6c  	dc.b	"oscilloscop",0
5160  00c5               L1761:
5161  00c5 466173617475  	dc.b	"Fasatura ad",0
5162  00d1               L7661:
5163  00d1 6175746f6d61  	dc.b	"automatica",0
5164  00dc               L5661:
5165  00dc 466173617475  	dc.b	"Fasatura",0
5166  00e5               L7561:
5167  00e5 3600          	dc.b	"6",0
5168  00e7               L5561:
5169  00e7 3500          	dc.b	"5",0
5170  00e9               L3561:
5171  00e9 3400          	dc.b	"4",0
5172  00eb               L1561:
5173  00eb 3300          	dc.b	"3",0
5174  00ed               L7461:
5175  00ed 3200          	dc.b	"2",0
5176  00ef               L5461:
5177  00ef 3100          	dc.b	"1",0
5178  00f1               L5651:
5179  00f1 40a00000      	dc.w	16544,0
5180  00f5               L5551:
5181  00f5 42640000      	dc.w	16996,0
5182  00f9               L5451:
5183  00f9 3f800000      	dc.w	16256,0
5184  00fd               L5351:
5185  00fd 2b00          	dc.b	"+",0
5186  00ff               L3351:
5187  00ff 2d00          	dc.b	"-",0
5188  0101               L7251:
5189  0101 42c80000      	dc.w	17096,0
5190  0105               L7151:
5191  0105 47000000      	dc.w	18176,0
5192  0109               L5051:
5193  0109 726567697374  	dc.b	"registro:",0
5194  0113               L3631:
5195  0113 54616a205363  	dc.b	"Taj Scope:",0
5196  011e               L5711:
5197  011e 6e6f6e207269  	dc.b	"non riconosciuto",0
5198  012f               L3711:
5199  012f 436f64696365  	dc.b	"Codice allarme",0
5200  013e               L7611:
5201  013e 4e657373756e  	dc.b	"Nessun problema!",0
5202  014f               L1611:
5203  014f 416d7069657a  	dc.b	"Ampiezza Gate (P3)",0
5204  0162               L3511:
5205  0162 6e6f6e206163  	dc.b	"non accettabile",0
5206  0172               L1511:
5207  0172 5376696c7570  	dc.b	"Sviluppo Cilindro "
5208  0184 2850312900    	dc.b	"(P1)",0
5209  0189               L3411:
5210  0189 66616c6c6974  	dc.b	"fallita",0
5211  0191               L1411:
5212  0191 466173617475  	dc.b	"Fasatura automatic"
5213  01a3 6100          	dc.b	"a",0
5214  01a5               L3311:
5215  01a5 546573742065  	dc.b	"Test encoder",0
5216  01b2               L5211:
5217  01b2 66616c6c6974  	dc.b	"fallito",0
5218  01ba               L3211:
5219  01ba 546573742074  	dc.b	"Test testina",0
5220  01c7               L5111:
5221  01c7 56656c6f6369  	dc.b	"Velocita' bassa",0
5222  01d7               L7011:
5223  01d7 4d616e63616e  	dc.b	"Mancanza stampa",0
5224  01e7               L3011:
5225  01e7 616c6c61726d  	dc.b	"allarme:",0
5226  01f0               L3401:
5227  01f0 6d6573736167  	dc.b	"messaggio:",0
5228  01fb               L5101:
5229  01fb 6d742f6d696e  	dc.b	"mt/min",0
5230  0202               L3101:
5231  0202 76656c6f6369  	dc.b	"velocita:",0
5232  020c               L577:
5233  020c 6d616e75616c  	dc.b	"manuale",0
5234  0214               L177:
5235  0214 6175746f6d61  	dc.b	"automatico",0
5236  021f               L767:
5237  021f 6d6f646f3a00  	dc.b	"modo:",0
5238                     	xref.b	c_x
5239                     	xref.b	c_y
5259                     	xref	c_ftoi
5260                     	xref	c_xfmul
5261                     	xref	c_xfadd
5262                     	xref	c_fcmp
5263                     	xref	c_itof
5264                     	xref	c_ltor
5265                     	xref	c_rtol
5266                     	xref	c_xfdiv
5267                     	xref	c_xfsub
5268                     	xref	c_uitof
5269                     	xref	c_imul
5270                     	xref.b	_displayDrawCorrection$L
5271                     	xref.b	_displayDrawSelector$L
5272                     	xref.b	_displayDrawVerticalLine$L
5273                     	xref.b	_displayDrawHorizontalLine$L
5274                     	xref.b	_formatNumber$L
5275                     	xref.b	_parametersSet$L
5276                     	xref.b	_displayInvertArea$L
5277                     	xref.b	_displayWriteString$L
5278                     	xref.b	_displaySetOutLine$L
5279                     	xref.b	_displayClearArea$L
5280                     	xref.b	_displayDrawBox$L
5281                     	end
