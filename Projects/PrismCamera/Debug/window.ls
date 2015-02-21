   1                     ; C Compiler for ST7 (COSMIC Software)
   2                     ; Generator V4.5.5 - 12 Jan 2006
1311                     ; 80 void windowInit(void)
1311                     ; 81 {
1312                     	switch	.text
1313  0000               _windowInit:
1316                     ; 82 	m_byCurrentSelectorX = 0x00;
1318  0000 4f            	clr	a
1319  0001 c70002        	ld	_m_byCurrentSelectorX,a
1320                     ; 83 	m_woDisplayedWindow = 0x00;
1322  0004 4f            	clr	a
1323  0005 c70000        	ld	_m_woDisplayedWindow,a
1324  0008 c70001        	ld	_m_woDisplayedWindow+1,a
1325                     ; 84 	m_woEncoderGateStart 	= 1;
1327  000b a601          	ld	a,#1
1328  000d c70001        	ld	_m_woEncoderGateStart+1,a
1329  0010 4f            	clr	a
1330  0011 c70000        	ld	_m_woEncoderGateStart,a
1331                     ; 85 	m_woEncoderGateEnd 		= 100;
1333  0014 a664          	ld	a,#100
1334  0016 c70001        	ld	_m_woEncoderGateEnd+1,a
1335  0019 4f            	clr	a
1336  001a c70000        	ld	_m_woEncoderGateEnd,a
1337                     ; 87 }
1340  001d 81            	ret
1363                     ; 90 void windowForceRepaint(void)
1363                     ; 91 {
1364                     	switch	.text
1365  001e               _windowForceRepaint:
1368                     ; 92 	m_woDisplayedWindow = 0x0000;
1370  001e 4f            	clr	a
1371  001f c70000        	ld	_m_woDisplayedWindow,a
1372  0022 c70001        	ld	_m_woDisplayedWindow+1,a
1373                     ; 93 }
1376  0025 81            	ret
1403                     ; 96 void windowMode(void)
1403                     ; 97 {
1404                     	switch	.text
1405  0026               _windowMode:
1408                     ; 98 	if (!_btst(m_woDisplayedWindow, WIN_MODE) || parametersIsChanged(PARAM_MODE_LONG))
1410  0026 c60001        	ld	a,_m_woDisplayedWindow+1
1411  0029 a501          	bcp	a,#1
1412  002b 2708          	jreq	L367
1414  002d a606          	ld	a,#6
1415  002f cd0000        	call	_parametersIsChanged
1417  0032 4d            	tnz	a
1418  0033 2770          	jreq	L167
1419  0035               L367:
1420                     ; 100 		if (parametersGetValue(PARAM_MODE_LONG)==PARAM_MODE_AUTO)
1422  0035 a606          	ld	a,#6
1423  0037 cd0000        	call	_parametersGetValue
1425  003a a1ff          	cp	a,#255
1426  003c 2602          	jrne	L21
1427  003e a300          	cp	x,#0
1428  0040               L21:
1429  0040 2630          	jrne	L567
1430                     ; 102 			displayDrawBox(0, 0, 62, 16, "modo:", "automatico", 0xFFFF,0, _btst(m_woDisplayedWindow, WIN_MODE));
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
1459                     ; 106 			displayDrawBox(0, 0, 62, 16, "modo:", "manuale", 0xFFFF,0, _btst(m_woDisplayedWindow, WIN_MODE));			
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
1486                     ; 108 		parametersChangedFlagReset(PARAM_MODE_LONG);
1488  00a0 a606          	ld	a,#6
1489  00a2 cd0000        	call	_parametersChangedFlagReset
1491  00a5               L167:
1492                     ; 111 	_bset(m_woDisplayedWindow, WIN_MODE);
1494  00a5 c60001        	ld	a,_m_woDisplayedWindow+1
1495  00a8 aa01          	or	a,#1
1496  00aa c70001        	ld	_m_woDisplayedWindow+1,a
1497                     ; 112 	_bres(m_woDisplayedWindow, WIN_FUNCTIONS);
1499  00ad c60001        	ld	a,_m_woDisplayedWindow+1
1500  00b0 a4bf          	and	a,#191
1501  00b2 c70001        	ld	_m_woDisplayedWindow+1,a
1502                     ; 113 	_bres(m_woDisplayedWindow, WIN_PARAMETERS);
1504  00b5 c60001        	ld	a,_m_woDisplayedWindow+1
1505  00b8 a47f          	and	a,#127
1506  00ba c70001        	ld	_m_woDisplayedWindow+1,a
1507                     ; 114 	_bres(m_woDisplayedWindow, WIN_TESTS);
1509  00bd c60001        	ld	a,_m_woDisplayedWindow+1
1510  00c0 a4ff          	and	a,#255
1511  00c2 c70001        	ld	_m_woDisplayedWindow+1,a
1512  00c5 c60000        	ld	a,_m_woDisplayedWindow
1513  00c8 a4fe          	and	a,#254
1514  00ca c70000        	ld	_m_woDisplayedWindow,a
1515                     ; 115 	_bres(m_woDisplayedWindow, WIN_MENUS);
1517  00cd c60001        	ld	a,_m_woDisplayedWindow+1
1518  00d0 a4ff          	and	a,#255
1519  00d2 c70001        	ld	_m_woDisplayedWindow+1,a
1520  00d5 c60000        	ld	a,_m_woDisplayedWindow
1521  00d8 a4fd          	and	a,#253
1522  00da c70000        	ld	_m_woDisplayedWindow,a
1523                     ; 116 }
1526  00dd 81            	ret
1553                     ; 119 void windowSpeed(void)
1553                     ; 120 {
1554                     	switch	.text
1555  00de               _windowSpeed:
1558                     ; 121 	if (!_btst(m_woDisplayedWindow, WIN_SPEED) || parametersIsChanged(PARAM_SPEED))
1560  00de c60001        	ld	a,_m_woDisplayedWindow+1
1561  00e1 a502          	bcp	a,#2
1562  00e3 2708          	jreq	L1101
1564  00e5 a603          	ld	a,#3
1565  00e7 cd0000        	call	_parametersIsChanged
1567  00ea 4d            	tnz	a
1568  00eb 2737          	jreq	L7001
1569  00ed               L1101:
1570                     ; 123 		displayDrawBox(64, 0, 62, 16, "velocita:", "mt/min", parametersGetValue(PARAM_SPEED), 4, _btst(m_woDisplayedWindow, WIN_SPEED));
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
1598                     ; 124 		parametersChangedFlagReset(PARAM_SPEED);
1600  011f a603          	ld	a,#3
1601  0121 cd0000        	call	_parametersChangedFlagReset
1603  0124               L7001:
1604                     ; 127 	_bset(m_woDisplayedWindow, WIN_SPEED);
1606  0124 c60001        	ld	a,_m_woDisplayedWindow+1
1607  0127 aa02          	or	a,#2
1608  0129 c70001        	ld	_m_woDisplayedWindow+1,a
1609                     ; 128 	_bres(m_woDisplayedWindow, WIN_FUNCTIONS);
1611  012c c60001        	ld	a,_m_woDisplayedWindow+1
1612  012f a4bf          	and	a,#191
1613  0131 c70001        	ld	_m_woDisplayedWindow+1,a
1614                     ; 129 	_bres(m_woDisplayedWindow, WIN_PARAMETERS);
1616  0134 c60001        	ld	a,_m_woDisplayedWindow+1
1617  0137 a47f          	and	a,#127
1618  0139 c70001        	ld	_m_woDisplayedWindow+1,a
1619                     ; 130 	_bres(m_woDisplayedWindow, WIN_TESTS);
1621  013c c60001        	ld	a,_m_woDisplayedWindow+1
1622  013f a4ff          	and	a,#255
1623  0141 c70001        	ld	_m_woDisplayedWindow+1,a
1624  0144 c60000        	ld	a,_m_woDisplayedWindow
1625  0147 a4fe          	and	a,#254
1626  0149 c70000        	ld	_m_woDisplayedWindow,a
1627                     ; 131 	_bres(m_woDisplayedWindow, WIN_MENUS);
1629  014c c60001        	ld	a,_m_woDisplayedWindow+1
1630  014f a4ff          	and	a,#255
1631  0151 c70001        	ld	_m_woDisplayedWindow+1,a
1632  0154 c60000        	ld	a,_m_woDisplayedWindow
1633  0157 a4fd          	and	a,#253
1634  0159 c70000        	ld	_m_woDisplayedWindow,a
1635                     ; 132 }
1638  015c 81            	ret
1687                     ; 135 void windowMessage(BYTE * a_strMessage1, BYTE * a_strMessage2)
1687                     ; 136 {
1688                     	switch	.text
1690                     	xref.b	_windowMessage$L
1691  015d               _windowMessage:
1693  015d b701          	ld	_windowMessage$L+1,a
1694  015f bf00          	ld	_windowMessage$L,x
1696                     ; 137 	if (!_btst(m_woDisplayedWindow, WIN_MESSAGE)) //Not displayed
1698  0161 c60001        	ld	a,_m_woDisplayedWindow+1
1699  0164 a520          	bcp	a,#32
1700  0166 263e          	jrne	L1401
1701                     ; 139 		displayClearArea(WINDOW_3_LEFT, WINDOW_3_TOP, WINDOW_3_RIGHT, WINDOW_3_BOTTOM);
1703  0168 a640          	ld	a,#64
1704  016a b703          	ld	_displayClearArea$L+3,a
1705  016c a67e          	ld	a,#126
1706  016e b702          	ld	_displayClearArea$L+2,a
1707  0170 4f            	clr	a
1708  0171 5f            	clr	x
1709  0172 cd0000        	call	_displayClearArea
1711                     ; 140 		displaySetOutLine(WINDOW_3_LEFT, WINDOW_3_TOP, WINDOW_3_RIGHT, WINDOW_3_BOTTOM, false);
1713  0175 3f04          	clr	_displaySetOutLine$L+4
1714  0177 a640          	ld	a,#64
1715  0179 b703          	ld	_displaySetOutLine$L+3,a
1716  017b a67e          	ld	a,#126
1717  017d b702          	ld	_displaySetOutLine$L+2,a
1718  017f 4f            	clr	a
1719  0180 5f            	clr	x
1720  0181 cd0000        	call	_displaySetOutLine
1722                     ; 143 		displayWriteString("messaggio:", DISPLAY_SELECT_FONT_MINI, WINDOW_3_LEFT+2, WINDOW_3_TOP+6);
1724  0184 a606          	ld	a,#6
1725  0186 b704          	ld	_displayWriteString$L+4,a
1726  0188 a602          	ld	a,#2
1727  018a b703          	ld	_displayWriteString$L+3,a
1728  018c a61c          	ld	a,#28
1729  018e b702          	ld	_displayWriteString$L+2,a
1730  0190 a6f0          	ld	a,#low(L3401)
1731  0192 aef0          	ld	x,#high(L3401)
1732  0194 cd0000        	call	_displayWriteString
1734                     ; 144 		displayInvertArea(WINDOW_3_LEFT+1, WINDOW_3_TOP+1, WINDOW_3_RIGHT-2, WINDOW_3_TOP+6);
1736  0197 a606          	ld	a,#6
1737  0199 b703          	ld	_displayInvertArea$L+3,a
1738  019b a67c          	ld	a,#124
1739  019d b702          	ld	_displayInvertArea$L+2,a
1740  019f a601          	ld	a,#1
1741  01a1 ae01          	ld	x,#1
1742  01a3 cd0000        	call	_displayInvertArea
1744  01a6               L1401:
1745                     ; 147 	displayWriteString(a_strMessage1, DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+10);	
1747  01a6 a60a          	ld	a,#10
1748  01a8 b704          	ld	_displayWriteString$L+4,a
1749  01aa a605          	ld	a,#5
1750  01ac b703          	ld	_displayWriteString$L+3,a
1751  01ae a61d          	ld	a,#29
1752  01b0 b702          	ld	_displayWriteString$L+2,a
1753  01b2 b601          	ld	a,_windowMessage$L+1
1754  01b4 be00          	ld	x,_windowMessage$L
1755  01b6 cd0000        	call	_displayWriteString
1757                     ; 148 	displayWriteString(a_strMessage2, DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+20);	
1759  01b9 a614          	ld	a,#20
1760  01bb b704          	ld	_displayWriteString$L+4,a
1761  01bd a605          	ld	a,#5
1762  01bf b703          	ld	_displayWriteString$L+3,a
1763  01c1 a61d          	ld	a,#29
1764  01c3 b702          	ld	_displayWriteString$L+2,a
1765  01c5 b603          	ld	a,_windowMessage$L+3
1766  01c7 be02          	ld	x,_windowMessage$L+2
1767  01c9 cd0000        	call	_displayWriteString
1769                     ; 151 	_bset(m_woDisplayedWindow, WIN_MESSAGE);
1771  01cc c60001        	ld	a,_m_woDisplayedWindow+1
1772  01cf aa20          	or	a,#32
1773  01d1 c70001        	ld	_m_woDisplayedWindow+1,a
1774                     ; 152 	_bres(m_woDisplayedWindow, WIN_FUNCTIONS);
1776  01d4 c60001        	ld	a,_m_woDisplayedWindow+1
1777  01d7 a4bf          	and	a,#191
1778  01d9 c70001        	ld	_m_woDisplayedWindow+1,a
1779                     ; 153 	_bres(m_woDisplayedWindow, WIN_PARAMETERS);
1781  01dc c60001        	ld	a,_m_woDisplayedWindow+1
1782  01df a47f          	and	a,#127
1783  01e1 c70001        	ld	_m_woDisplayedWindow+1,a
1784                     ; 154 	_bres(m_woDisplayedWindow, WIN_TESTS);
1786  01e4 c60001        	ld	a,_m_woDisplayedWindow+1
1787  01e7 a4ff          	and	a,#255
1788  01e9 c70001        	ld	_m_woDisplayedWindow+1,a
1789  01ec c60000        	ld	a,_m_woDisplayedWindow
1790  01ef a4fe          	and	a,#254
1791  01f1 c70000        	ld	_m_woDisplayedWindow,a
1792                     ; 155 	_bres(m_woDisplayedWindow, WIN_MENUS);
1794  01f4 c60001        	ld	a,_m_woDisplayedWindow+1
1795  01f7 a4ff          	and	a,#255
1796  01f9 c70001        	ld	_m_woDisplayedWindow+1,a
1797  01fc c60000        	ld	a,_m_woDisplayedWindow
1798  01ff a4fd          	and	a,#253
1799  0201 c70000        	ld	_m_woDisplayedWindow,a
1800                     ; 156 }
1803  0204 81            	ret
1852                     ; 159 void windowBigMessage(BYTE * a_strMessage1, BYTE * a_strMessage2)
1852                     ; 160 {
1853                     	switch	.text
1855                     	xref.b	_windowBigMessage$L
1856  0205               _windowBigMessage:
1858  0205 b701          	ld	_windowBigMessage$L+1,a
1859  0207 bf00          	ld	_windowBigMessage$L,x
1861                     ; 161 	if (!_btst(m_woDisplayedWindow, WIN_MESSAGE)) //Not displayed
1863  0209 c60001        	ld	a,_m_woDisplayedWindow+1
1864  020c a520          	bcp	a,#32
1865  020e 263e          	jrne	L7601
1866                     ; 163 		displayClearArea(0, 0, 126, 64);
1868  0210 a640          	ld	a,#64
1869  0212 b703          	ld	_displayClearArea$L+3,a
1870  0214 a67e          	ld	a,#126
1871  0216 b702          	ld	_displayClearArea$L+2,a
1872  0218 4f            	clr	a
1873  0219 5f            	clr	x
1874  021a cd0000        	call	_displayClearArea
1876                     ; 164 		displaySetOutLine(0, 0, 126, 64, false);
1878  021d 3f04          	clr	_displaySetOutLine$L+4
1879  021f a640          	ld	a,#64
1880  0221 b703          	ld	_displaySetOutLine$L+3,a
1881  0223 a67e          	ld	a,#126
1882  0225 b702          	ld	_displaySetOutLine$L+2,a
1883  0227 4f            	clr	a
1884  0228 5f            	clr	x
1885  0229 cd0000        	call	_displaySetOutLine
1887                     ; 167 		displayWriteString("messaggio:", DISPLAY_SELECT_FONT_MINI, 2, 6);
1889  022c a606          	ld	a,#6
1890  022e b704          	ld	_displayWriteString$L+4,a
1891  0230 a602          	ld	a,#2
1892  0232 b703          	ld	_displayWriteString$L+3,a
1893  0234 a61c          	ld	a,#28
1894  0236 b702          	ld	_displayWriteString$L+2,a
1895  0238 a6f0          	ld	a,#low(L3401)
1896  023a aef0          	ld	x,#high(L3401)
1897  023c cd0000        	call	_displayWriteString
1899                     ; 168 		displayInvertArea(1, 1, 124, 6);
1901  023f a606          	ld	a,#6
1902  0241 b703          	ld	_displayInvertArea$L+3,a
1903  0243 a67c          	ld	a,#124
1904  0245 b702          	ld	_displayInvertArea$L+2,a
1905  0247 a601          	ld	a,#1
1906  0249 ae01          	ld	x,#1
1907  024b cd0000        	call	_displayInvertArea
1909  024e               L7601:
1910                     ; 171 	displayWriteString(a_strMessage1, DISPLAY_SELECT_FONT_5x7, 5, 25);	
1912  024e a619          	ld	a,#25
1913  0250 b704          	ld	_displayWriteString$L+4,a
1914  0252 a605          	ld	a,#5
1915  0254 b703          	ld	_displayWriteString$L+3,a
1916  0256 a61d          	ld	a,#29
1917  0258 b702          	ld	_displayWriteString$L+2,a
1918  025a b601          	ld	a,_windowBigMessage$L+1
1919  025c be00          	ld	x,_windowBigMessage$L
1920  025e cd0000        	call	_displayWriteString
1922                     ; 172 	displayWriteString(a_strMessage2, DISPLAY_SELECT_FONT_5x7, 5, 40);	
1924  0261 a628          	ld	a,#40
1925  0263 b704          	ld	_displayWriteString$L+4,a
1926  0265 a605          	ld	a,#5
1927  0267 b703          	ld	_displayWriteString$L+3,a
1928  0269 a61d          	ld	a,#29
1929  026b b702          	ld	_displayWriteString$L+2,a
1930  026d b603          	ld	a,_windowBigMessage$L+3
1931  026f be02          	ld	x,_windowBigMessage$L+2
1932  0271 cd0000        	call	_displayWriteString
1934                     ; 175 	_bres(m_woDisplayedWindow, WIN_MODE);
1936  0274 c60001        	ld	a,_m_woDisplayedWindow+1
1937  0277 a4fe          	and	a,#254
1938  0279 c70001        	ld	_m_woDisplayedWindow+1,a
1939                     ; 176 	_bres(m_woDisplayedWindow, WIN_SPEED);
1941  027c c60001        	ld	a,_m_woDisplayedWindow+1
1942  027f a4fd          	and	a,#253
1943  0281 c70001        	ld	_m_woDisplayedWindow+1,a
1944                     ; 177 	_bres(m_woDisplayedWindow, WIN_OSCILLOSCOPE);
1946  0284 c60001        	ld	a,_m_woDisplayedWindow+1
1947  0287 a4fb          	and	a,#251
1948  0289 c70001        	ld	_m_woDisplayedWindow+1,a
1949                     ; 178 	_bres(m_woDisplayedWindow, WIN_REGISTER);
1951  028c c60001        	ld	a,_m_woDisplayedWindow+1
1952  028f a4f7          	and	a,#247
1953  0291 c70001        	ld	_m_woDisplayedWindow+1,a
1954                     ; 179 	_bres(m_woDisplayedWindow, WIN_ALARM);
1956  0294 c60001        	ld	a,_m_woDisplayedWindow+1
1957  0297 a4ef          	and	a,#239
1958  0299 c70001        	ld	_m_woDisplayedWindow+1,a
1959                     ; 180 	_bset(m_woDisplayedWindow, WIN_MESSAGE);
1961  029c c60001        	ld	a,_m_woDisplayedWindow+1
1962  029f aa20          	or	a,#32
1963  02a1 c70001        	ld	_m_woDisplayedWindow+1,a
1964                     ; 181 	_bres(m_woDisplayedWindow, WIN_FUNCTIONS);
1966  02a4 c60001        	ld	a,_m_woDisplayedWindow+1
1967  02a7 a4bf          	and	a,#191
1968  02a9 c70001        	ld	_m_woDisplayedWindow+1,a
1969                     ; 182 	_bres(m_woDisplayedWindow, WIN_PARAMETERS);
1971  02ac c60001        	ld	a,_m_woDisplayedWindow+1
1972  02af a47f          	and	a,#127
1973  02b1 c70001        	ld	_m_woDisplayedWindow+1,a
1974                     ; 183 	_bres(m_woDisplayedWindow, WIN_TESTS);
1976  02b4 c60001        	ld	a,_m_woDisplayedWindow+1
1977  02b7 a4ff          	and	a,#255
1978  02b9 c70001        	ld	_m_woDisplayedWindow+1,a
1979  02bc c60000        	ld	a,_m_woDisplayedWindow
1980  02bf a4fe          	and	a,#254
1981  02c1 c70000        	ld	_m_woDisplayedWindow,a
1982                     ; 184 	_bres(m_woDisplayedWindow, WIN_MENUS);
1984  02c4 c60001        	ld	a,_m_woDisplayedWindow+1
1985  02c7 a4ff          	and	a,#255
1986  02c9 c70001        	ld	_m_woDisplayedWindow+1,a
1987  02cc c60000        	ld	a,_m_woDisplayedWindow
1988  02cf a4fd          	and	a,#253
1989  02d1 c70000        	ld	_m_woDisplayedWindow,a
1990                     ; 185 }
1993  02d4 81            	ret
2021                     ; 188 void windowAlarm(void)
2021                     ; 189 {
2022                     	switch	.text
2023  02d5               _windowAlarm:
2026                     ; 191 	if (!_btst(m_woDisplayedWindow, WIN_ALARM)) //Not displayed
2028  02d5 c60001        	ld	a,_m_woDisplayedWindow+1
2029  02d8 a510          	bcp	a,#16
2030  02da 263e          	jrne	L1011
2031                     ; 193 		displayClearArea(WINDOW_3_LEFT, WINDOW_3_TOP, WINDOW_3_RIGHT, WINDOW_3_BOTTOM);
2033  02dc a640          	ld	a,#64
2034  02de b703          	ld	_displayClearArea$L+3,a
2035  02e0 a67e          	ld	a,#126
2036  02e2 b702          	ld	_displayClearArea$L+2,a
2037  02e4 4f            	clr	a
2038  02e5 5f            	clr	x
2039  02e6 cd0000        	call	_displayClearArea
2041                     ; 194 		displaySetOutLine(WINDOW_3_LEFT, WINDOW_3_TOP, WINDOW_3_RIGHT, WINDOW_3_BOTTOM, false);
2043  02e9 3f04          	clr	_displaySetOutLine$L+4
2044  02eb a640          	ld	a,#64
2045  02ed b703          	ld	_displaySetOutLine$L+3,a
2046  02ef a67e          	ld	a,#126
2047  02f1 b702          	ld	_displaySetOutLine$L+2,a
2048  02f3 4f            	clr	a
2049  02f4 5f            	clr	x
2050  02f5 cd0000        	call	_displaySetOutLine
2052                     ; 197 		displayWriteString("allarme:", DISPLAY_SELECT_FONT_MINI, WINDOW_3_LEFT+2, WINDOW_3_TOP+6);
2054  02f8 a606          	ld	a,#6
2055  02fa b704          	ld	_displayWriteString$L+4,a
2056  02fc a602          	ld	a,#2
2057  02fe b703          	ld	_displayWriteString$L+3,a
2058  0300 a61c          	ld	a,#28
2059  0302 b702          	ld	_displayWriteString$L+2,a
2060  0304 a6e7          	ld	a,#low(L3011)
2061  0306 aee7          	ld	x,#high(L3011)
2062  0308 cd0000        	call	_displayWriteString
2064                     ; 198 		displayInvertArea(WINDOW_3_LEFT+1, WINDOW_3_TOP+1, WINDOW_3_RIGHT-2, WINDOW_3_TOP+6);
2066  030b a606          	ld	a,#6
2067  030d b703          	ld	_displayInvertArea$L+3,a
2068  030f a67c          	ld	a,#124
2069  0311 b702          	ld	_displayInvertArea$L+2,a
2070  0313 a601          	ld	a,#1
2071  0315 ae01          	ld	x,#1
2072  0317 cd0000        	call	_displayInvertArea
2074  031a               L1011:
2075                     ; 201 	if _btst(parametersGetValue(PARAM_ALARM), STI_ANSWER_ALARM_ERR_NO_PRINT)
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
2089                     ; 203 		displayWriteString("Mancanza stampa", DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+25);	
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
2104                     ; 205 	else if _btst(parametersGetValue(PARAM_ALARM), STI_ANSWER_ALARM_ERR_LOW_SPEED)
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
2118                     ; 207 		displayWriteString("Velocita' bassa", DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+25);	
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
2133                     ; 209 	else if _btst(parametersGetValue(PARAM_ALARM), STI_ANSWER_ALARM_ERR_TEST_SH)
2135  0366 a602          	ld	a,#2
2136  0368 cd0000        	call	_parametersGetValue
2138  036b a501          	bcp	a,#1
2139  036d 2729          	jreq	L1211
2140                     ; 211 		displayWriteString("Test testina", DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+20);	
2142  036f a614          	ld	a,#20
2143  0371 b704          	ld	_displayWriteString$L+4,a
2144  0373 a605          	ld	a,#5
2145  0375 b703          	ld	_displayWriteString$L+3,a
2146  0377 a61d          	ld	a,#29
2147  0379 b702          	ld	_displayWriteString$L+2,a
2148  037b a6ba          	ld	a,#low(L3211)
2149  037d aeba          	ld	x,#high(L3211)
2150  037f cd0000        	call	_displayWriteString
2152                     ; 212 		displayWriteString("fallito", DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+30);	
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
2167                     ; 214 	else if _btst(parametersGetValue(PARAM_ALARM), STI_ANSWER_ALARM_ERR_TEST_ENC)
2169  0398 a602          	ld	a,#2
2170  039a cd0000        	call	_parametersGetValue
2172  039d a502          	bcp	a,#2
2173  039f 2729          	jreq	L1311
2174                     ; 216 		displayWriteString("Test encoder", DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+20);	
2176  03a1 a614          	ld	a,#20
2177  03a3 b704          	ld	_displayWriteString$L+4,a
2178  03a5 a605          	ld	a,#5
2179  03a7 b703          	ld	_displayWriteString$L+3,a
2180  03a9 a61d          	ld	a,#29
2181  03ab b702          	ld	_displayWriteString$L+2,a
2182  03ad a6a5          	ld	a,#low(L3311)
2183  03af aea5          	ld	x,#high(L3311)
2184  03b1 cd0000        	call	_displayWriteString
2186                     ; 217 		displayWriteString("fallito", DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+30);	
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
2201                     ; 219 	else if _btst(parametersGetValue(PARAM_ALARM), STI_ANSWER_ALARM_ERR_PHASE_AUTO)
2203  03ca a602          	ld	a,#2
2204  03cc cd0000        	call	_parametersGetValue
2206  03cf a504          	bcp	a,#4
2207  03d1 2729          	jreq	L7311
2208                     ; 221 		displayWriteString("Fasatura automatica", DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+20);	
2210  03d3 a614          	ld	a,#20
2211  03d5 b704          	ld	_displayWriteString$L+4,a
2212  03d7 a605          	ld	a,#5
2213  03d9 b703          	ld	_displayWriteString$L+3,a
2214  03db a61d          	ld	a,#29
2215  03dd b702          	ld	_displayWriteString$L+2,a
2216  03df a691          	ld	a,#low(L1411)
2217  03e1 ae91          	ld	x,#high(L1411)
2218  03e3 cd0000        	call	_displayWriteString
2220                     ; 222 		displayWriteString("fallita", DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+30);	
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
2235                     ; 224 	else if _btst(parametersGetValue(PARAM_ALARM), STI_ANSWER_ALARM_CYLINDER_TRAVEL)
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
2249                     ; 226 		displayWriteString("Sviluppo Cilindro (P1)", DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+20);	
2251  040c a614          	ld	a,#20
2252  040e b704          	ld	_displayWriteString$L+4,a
2253  0410 a605          	ld	a,#5
2254  0412 b703          	ld	_displayWriteString$L+3,a
2255  0414 a61d          	ld	a,#29
2256  0416 b702          	ld	_displayWriteString$L+2,a
2257  0418 a672          	ld	a,#low(L1511)
2258  041a ae72          	ld	x,#high(L1511)
2259  041c cd0000        	call	_displayWriteString
2261                     ; 227 		displayWriteString("non accettabile", DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+30);	
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
2276                     ; 229 	else if _btst(parametersGetValue(PARAM_ALARM), STI_ANSWER_ALARM_GATE_WINDOW)
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
2290                     ; 231 		displayWriteString("Ampiezza Gate (P3)", DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+20);	
2292  0444 a614          	ld	a,#20
2293  0446 b704          	ld	_displayWriteString$L+4,a
2294  0448 a605          	ld	a,#5
2295  044a b703          	ld	_displayWriteString$L+3,a
2296  044c a61d          	ld	a,#29
2297  044e b702          	ld	_displayWriteString$L+2,a
2298  0450 a64f          	ld	a,#low(L1611)
2299  0452 ae4f          	ld	x,#high(L1611)
2300  0454 cd0000        	call	_displayWriteString
2302                     ; 232 		displayWriteString("non accettabile", DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+30);	
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
2317                     ; 234 	else if _btst(parametersGetValue(PARAM_ALARM), STI_ANSWER_OK)
2319  046c a602          	ld	a,#2
2320  046e cd0000        	call	_parametersGetValue
2322  0471 a501          	bcp	a,#1
2323  0473 2715          	jreq	L5611
2324                     ; 236 		displayWriteString("Nessun problema!", DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+25);	
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
2339                     ; 240 		displayWriteString("Codice allarme", DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+20);	
2341  048a a614          	ld	a,#20
2342  048c b704          	ld	_displayWriteString$L+4,a
2343  048e a605          	ld	a,#5
2344  0490 b703          	ld	_displayWriteString$L+3,a
2345  0492 a61d          	ld	a,#29
2346  0494 b702          	ld	_displayWriteString$L+2,a
2347  0496 a62f          	ld	a,#low(L3711)
2348  0498 ae2f          	ld	x,#high(L3711)
2349  049a cd0000        	call	_displayWriteString
2351                     ; 241 		displayWriteString("non riconosciuto", DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+30);	
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
2364                     ; 244 	_bres(m_woDisplayedWindow, WIN_OSCILLOSCOPE);
2366  04b0 c60001        	ld	a,_m_woDisplayedWindow+1
2367  04b3 a4fb          	and	a,#251
2368  04b5 c70001        	ld	_m_woDisplayedWindow+1,a
2369                     ; 245 	_bres(m_woDisplayedWindow, WIN_REGISTER);
2371  04b8 c60001        	ld	a,_m_woDisplayedWindow+1
2372  04bb a4f7          	and	a,#247
2373  04bd c70001        	ld	_m_woDisplayedWindow+1,a
2374                     ; 246 	_bset(m_woDisplayedWindow, WIN_ALARM);
2376  04c0 c60001        	ld	a,_m_woDisplayedWindow+1
2377  04c3 aa10          	or	a,#16
2378  04c5 c70001        	ld	_m_woDisplayedWindow+1,a
2379                     ; 247 	_bres(m_woDisplayedWindow, WIN_MESSAGE);
2381  04c8 c60001        	ld	a,_m_woDisplayedWindow+1
2382  04cb a4df          	and	a,#223
2383  04cd c70001        	ld	_m_woDisplayedWindow+1,a
2384                     ; 248 	_bres(m_woDisplayedWindow, WIN_FUNCTIONS);
2386  04d0 c60001        	ld	a,_m_woDisplayedWindow+1
2387  04d3 a4bf          	and	a,#191
2388  04d5 c70001        	ld	_m_woDisplayedWindow+1,a
2389                     ; 249 	_bres(m_woDisplayedWindow, WIN_PARAMETERS);
2391  04d8 c60001        	ld	a,_m_woDisplayedWindow+1
2392  04db a47f          	and	a,#127
2393  04dd c70001        	ld	_m_woDisplayedWindow+1,a
2394                     ; 250 	_bres(m_woDisplayedWindow, WIN_TESTS);
2396  04e0 c60001        	ld	a,_m_woDisplayedWindow+1
2397  04e3 a4ff          	and	a,#255
2398  04e5 c70001        	ld	_m_woDisplayedWindow+1,a
2399  04e8 c60000        	ld	a,_m_woDisplayedWindow
2400  04eb a4fe          	and	a,#254
2401  04ed c70000        	ld	_m_woDisplayedWindow,a
2402                     ; 251 	_bres(m_woDisplayedWindow, WIN_MENUS);
2404  04f0 c60001        	ld	a,_m_woDisplayedWindow+1
2405  04f3 a4ff          	and	a,#255
2406  04f5 c70001        	ld	_m_woDisplayedWindow+1,a
2407  04f8 c60000        	ld	a,_m_woDisplayedWindow
2408  04fb a4fd          	and	a,#253
2409  04fd c70000        	ld	_m_woDisplayedWindow,a
2410                     ; 252 }
2413  0500 81            	ret
2457                     ; 256 BYTE windowOscilloscopeGetValue(WORD a_woEncIndex)
2457                     ; 257 {
2458                     	switch	.text
2460                     	xref.b	_windowOscilloscopeGetValue$L
2461  0501               _windowOscilloscopeGetValue:
2463  0501 b701          	ld	_windowOscilloscopeGetValue$L+1,a
2464  0503 bf00          	ld	_windowOscilloscopeGetValue$L,x
2466                     ; 260 	byValue = m_arbyScanningHeadSignal[(WORD)(a_woEncIndex>>2)];  //Array Index
2468  0505 54            	srl	x
2469  0506 46            	rrc	a
2470  0507 54            	srl	x
2471  0508 46            	rrc	a
2472  0509 ab00          	add	a,#low(_m_arbyScanningHeadSignal)
2473  050b 88            	push	a
2474  050c 9f            	ld	a,x
2475  050d a900          	adc	a,#high(_m_arbyScanningHeadSignal)
2476  050f 97            	ld	x,a
2477  0510 84            	pop	a
2478  0511 bf00          	ld	c_x,x
2479  0513 97            	ld	x,a
2480  0514 bf01          	ld	c_x+1,x
2481  0516 92c600        	ld	a,[c_x.w]
2482  0519 b7ff          	ld	_windowOscilloscopeGetValue$L-1,a
2483                     ; 262 	switch ((BYTE)(a_woEncIndex & 0x0003)) //0b00000011 -->  Byte Index
2485  051b b601          	ld	a,_windowOscilloscopeGetValue$L+1
2486  051d a403          	and	a,#3
2488                     ; 275 			break;
2490  051f 4d            	tnz	a
2491  0520 270b          	jreq	L7711
2492  0522 4a            	dec	a
2493  0523 2712          	jreq	L1021
2494  0525 4a            	dec	a
2495  0526 2717          	jreq	L3021
2496  0528 4a            	dec	a
2497  0529 271b          	jreq	L5021
2498  052b 201e          	jra	L3321
2499  052d               L7711:
2500                     ; 264 		case 0:
2500                     ; 265 			return (BYTE)((byValue & 0b11000000)>>6);
2502  052d b6ff          	ld	a,_windowOscilloscopeGetValue$L-1
2503  052f a4c0          	and	a,#192
2504  0531 4e            	swap	a
2505  0532 44            	srl	a
2506  0533 44            	srl	a
2507  0534 a403          	and	a,#3
2510  0536 81            	ret
2511  0537               L1021:
2512                     ; 267 		case 1:
2512                     ; 268 			return (BYTE)((byValue & 0b00110000)>>4);
2515  0537 b6ff          	ld	a,_windowOscilloscopeGetValue$L-1
2516  0539 a430          	and	a,#48
2517  053b 4e            	swap	a
2518  053c a40f          	and	a,#15
2521  053e 81            	ret
2522  053f               L3021:
2523                     ; 270 		case 2:
2523                     ; 271 			return (BYTE)((byValue & 0b00001100)>>2);
2526  053f b6ff          	ld	a,_windowOscilloscopeGetValue$L-1
2527  0541 a40c          	and	a,#12
2528  0543 44            	srl	a
2529  0544 44            	srl	a
2532  0545 81            	ret
2533  0546               L5021:
2534                     ; 273 		case 3:
2534                     ; 274 			return (BYTE)(byValue & 0b00000011);
2537  0546 b6ff          	ld	a,_windowOscilloscopeGetValue$L-1
2538  0548 a403          	and	a,#3
2541  054a 81            	ret
2542  054b               L3321:
2543                     ; 278 }
2546  054b 81            	ret
2581                     ; 282 BYTE windowIsInGate(WORD a_woEncIndex)
2581                     ; 283 {
2582                     	switch	.text
2584                     	xref.b	_windowIsInGate$L
2585  054c               _windowIsInGate:
2587  054c b701          	ld	_windowIsInGate$L+1,a
2588  054e bf00          	ld	_windowIsInGate$L,x
2590                     ; 284 	if (m_woEncoderGateEnd > m_woEncoderGateStart)
2592  0550 c60001        	ld	a,_m_woEncoderGateStart+1
2593  0553 c00001        	sub	a,_m_woEncoderGateEnd+1
2594  0556 c60000        	ld	a,_m_woEncoderGateStart
2595  0559 c20000        	sbc	a,_m_woEncoderGateEnd
2596  055c 241e          	jruge	L3521
2597                     ; 286 		return ((a_woEncIndex >m_woEncoderGateStart) && (a_woEncIndex<m_woEncoderGateEnd));
2599  055e c60001        	ld	a,_m_woEncoderGateStart+1
2600  0561 b001          	sub	a,_windowIsInGate$L+1
2601  0563 c60000        	ld	a,_m_woEncoderGateStart
2602  0566 b200          	sbc	a,_windowIsInGate$L
2603  0568 2410          	jruge	L04
2604  056a b601          	ld	a,_windowIsInGate$L+1
2605  056c c00001        	sub	a,_m_woEncoderGateEnd+1
2606  056f b600          	ld	a,_windowIsInGate$L
2607  0571 c20000        	sbc	a,_m_woEncoderGateEnd
2608  0574 2404          	jruge	L04
2609  0576 a601          	ld	a,#1
2610  0578 2001          	jra	L24
2611  057a               L04:
2612  057a 4f            	clr	a
2613  057b               L24:
2616  057b 81            	ret
2617  057c               L3521:
2618                     ; 290 		return ((a_woEncIndex >m_woEncoderGateStart) || (a_woEncIndex<m_woEncoderGateEnd));
2620  057c c60001        	ld	a,_m_woEncoderGateStart+1
2621  057f b001          	sub	a,_windowIsInGate$L+1
2622  0581 c60000        	ld	a,_m_woEncoderGateStart
2623  0584 b200          	sbc	a,_windowIsInGate$L
2624  0586 250c          	jrult	L64
2625  0588 b601          	ld	a,_windowIsInGate$L+1
2626  058a c00001        	sub	a,_m_woEncoderGateEnd+1
2627  058d b600          	ld	a,_windowIsInGate$L
2628  058f c20000        	sbc	a,_m_woEncoderGateEnd
2629  0592 2404          	jruge	L44
2630  0594               L64:
2631  0594 a601          	ld	a,#1
2632  0596 2001          	jra	L05
2633  0598               L44:
2634  0598 4f            	clr	a
2635  0599               L05:
2638  0599 81            	ret
2760                     ; 297 void windowOscilloscope(BYTE a_byCenterPulse, BYTE a_byPage)
2760                     ; 298 {
2761                     	switch	.text
2763                     	xref.b	_windowOscilloscope$L
2764  059a               _windowOscilloscope:
2767                     ; 304 	BYTE byPrevValue = WINDOW_3_OSCILLOSCOPE_Y;
2769  059a a637          	ld	a,#55
2770  059c b7f7          	ld	_windowOscilloscope$L-9,a
2771                     ; 311 	if (!_btst(m_woDisplayedWindow, WIN_OSCILLOSCOPE)) //Not displayed
2773  059e c60001        	ld	a,_m_woDisplayedWindow+1
2774  05a1 a504          	bcp	a,#4
2775  05a3 2671          	jrne	L5331
2776                     ; 313 		displayClearArea(WINDOW_3_LEFT, WINDOW_3_TOP, WINDOW_3_RIGHT, WINDOW_3_BOTTOM);
2778  05a5 a640          	ld	a,#64
2779  05a7 b703          	ld	_displayClearArea$L+3,a
2780  05a9 a67e          	ld	a,#126
2781  05ab b702          	ld	_displayClearArea$L+2,a
2782  05ad 4f            	clr	a
2783  05ae 5f            	clr	x
2784  05af cd0000        	call	_displayClearArea
2786                     ; 314 		displaySetOutLine(WINDOW_3_LEFT, WINDOW_3_TOP, WINDOW_3_RIGHT, WINDOW_3_BOTTOM, false);
2788  05b2 3f04          	clr	_displaySetOutLine$L+4
2789  05b4 a640          	ld	a,#64
2790  05b6 b703          	ld	_displaySetOutLine$L+3,a
2791  05b8 a67e          	ld	a,#126
2792  05ba b702          	ld	_displaySetOutLine$L+2,a
2793  05bc 4f            	clr	a
2794  05bd 5f            	clr	x
2795  05be cd0000        	call	_displaySetOutLine
2797                     ; 315 		displayWriteString("Taj Scope:", DISPLAY_SELECT_FONT_MINI, WINDOW_3_LEFT+2, WINDOW_3_TOP+6);
2799  05c1 a606          	ld	a,#6
2800  05c3 b704          	ld	_displayWriteString$L+4,a
2801  05c5 a602          	ld	a,#2
2802  05c7 b703          	ld	_displayWriteString$L+3,a
2803  05c9 a61c          	ld	a,#28
2804  05cb b702          	ld	_displayWriteString$L+2,a
2805  05cd a613          	ld	a,#low(L7331)
2806  05cf ae13          	ld	x,#high(L7331)
2807  05d1 cd0000        	call	_displayWriteString
2809                     ; 316 		displayInvertArea(WINDOW_3_LEFT+1, WINDOW_3_TOP+1, WINDOW_3_RIGHT-2, WINDOW_3_TOP+7);
2811  05d4 a607          	ld	a,#7
2812  05d6 b703          	ld	_displayInvertArea$L+3,a
2813  05d8 a67c          	ld	a,#124
2814  05da b702          	ld	_displayInvertArea$L+2,a
2815  05dc a601          	ld	a,#1
2816  05de ae01          	ld	x,#1
2817  05e0 cd0000        	call	_displayInvertArea
2819                     ; 319 		parametersSet(PARAM_OSCIL_OFFSET, ENCODER_PULSES + m_woEncoderGateStart - (m_woEncoderGateWidth/2)& (ENCODER_PULSES-1));
2821  05e3 c60001        	ld	a,_m_woEncoderGateWidth+1
2822  05e6 ce0000        	ld	x,_m_woEncoderGateWidth
2823  05e9 54            	srl	x
2824  05ea 46            	rrc	a
2825  05eb b7f6          	ld	_windowOscilloscope$L-10,a
2826  05ed bff5          	ld	_windowOscilloscope$L-11,x
2827  05ef c60001        	ld	a,_m_woEncoderGateStart+1
2828  05f2 ce0000        	ld	x,_m_woEncoderGateStart
2829  05f5 ab00          	add	a,#0
2830  05f7 88            	push	a
2831  05f8 9f            	ld	a,x
2832  05f9 a904          	adc	a,#4
2833  05fb 97            	ld	x,a
2834  05fc 84            	pop	a
2835  05fd b0f6          	sub	a,_windowOscilloscope$L-10
2836  05ff 88            	push	a
2837  0600 9f            	ld	a,x
2838  0601 b2f5          	sbc	a,_windowOscilloscope$L-11
2839  0603 97            	ld	x,a
2840  0604 84            	pop	a
2841  0605 a4ff          	and	a,#255
2842  0607 88            	push	a
2843  0608 9f            	ld	a,x
2844  0609 a403          	and	a,#3
2845  060b 97            	ld	x,a
2846  060c 84            	pop	a
2847  060d b702          	ld	_parametersSet$L+2,a
2848  060f bf01          	ld	_parametersSet$L+1,x
2849  0611 a60c          	ld	a,#12
2850  0613 cd0000        	call	_parametersSet
2852  0616               L5331:
2853                     ; 323 	if ((m_woEncoderGateStart != 0xFFFF) && (m_woEncoderGateEnd != 0xFFFF))
2855  0616 c60001        	ld	a,_m_woEncoderGateStart+1
2856  0619 a1ff          	cp	a,#255
2857  061b 2605          	jrne	L45
2858  061d ce0000        	ld	x,_m_woEncoderGateStart
2859  0620 a3ff          	cp	x,#255
2860  0622               L45:
2861  0622 2603          	jrne	L001
2862  0624 cc076d        	jp	L1431
2863  0627               L001:
2865  0627 c60001        	ld	a,_m_woEncoderGateEnd+1
2866  062a a1ff          	cp	a,#255
2867  062c 2605          	jrne	L65
2868  062e ce0000        	ld	x,_m_woEncoderGateEnd
2869  0631 a3ff          	cp	x,#255
2870  0633               L65:
2871  0633 2603          	jrne	L201
2872  0635 cc076d        	jp	L1431
2873  0638               L201:
2874                     ; 325 		woEncoderIndex = parametersGetValue(PARAM_OSCIL_OFFSET);
2876  0638 a60c          	ld	a,#12
2877  063a cd0000        	call	_parametersGetValue
2879  063d b7fd          	ld	_windowOscilloscope$L-3,a
2880  063f bffc          	ld	_windowOscilloscope$L-4,x
2881                     ; 326 		byPrevGateValue = windowIsInGate((woEncoderIndex+parametersGetValue(PARAM_OSCIL_ZOOM)-1)& (ENCODER_PULSES-1))?WINDOW_3_GATE_LOW_Y:WINDOW_3_GATE_HIGH_Y;
2883  0641 a60b          	ld	a,#11
2884  0643 cd0000        	call	_parametersGetValue
2886  0646 bbfd          	add	a,_windowOscilloscope$L-3
2887  0648 88            	push	a
2888  0649 9f            	ld	a,x
2889  064a b9fc          	adc	a,_windowOscilloscope$L-4
2890  064c 97            	ld	x,a
2891  064d 84            	pop	a
2892  064e 4d            	tnz	a
2893  064f 2601          	jrne	L26
2894  0651 5a            	dec	x
2895  0652               L26:
2896  0652 4a            	dec	a
2897  0653 a4ff          	and	a,#255
2898  0655 88            	push	a
2899  0656 9f            	ld	a,x
2900  0657 a403          	and	a,#3
2901  0659 97            	ld	x,a
2902  065a 84            	pop	a
2903  065b cd054c        	call	_windowIsInGate
2905  065e 4d            	tnz	a
2906  065f 2704          	jreq	L06
2907  0661 a60f          	ld	a,#15
2908  0663 2002          	jra	L46
2909  0665               L06:
2910  0665 a619          	ld	a,#25
2911  0667               L46:
2912  0667 b7f9          	ld	_windowOscilloscope$L-7,a
2913                     ; 331 		byGateHasToBeRepainted = true;
2915  0669 a601          	ld	a,#1
2916  066b b7f8          	ld	_windowOscilloscope$L-8,a
2917                     ; 334 		m_arbyDisplayCommand[0] = DISPLAY_CLEAR_AREA;
2919  066d a612          	ld	a,#18
2920  066f c70000        	ld	_m_arbyDisplayCommand,a
2921                     ; 335 		m_arbyDisplayCommand[5] = DISPLAY_WAIT;
2923  0672 a6fe          	ld	a,#254
2924  0674 c70005        	ld	_m_arbyDisplayCommand+5,a
2925                     ; 336 		m_arbyDisplayCommand[6] = DISPLAY_SET_AREA;
2927  0677 a611          	ld	a,#17
2928  0679 c70006        	ld	_m_arbyDisplayCommand+6,a
2929                     ; 337 		m_arbyDisplayCommand[11] = DISPLAY_EOF;		
2931  067c a6ff          	ld	a,#255
2932  067e c7000b        	ld	_m_arbyDisplayCommand+11,a
2933                     ; 340 		for(i=0; (i<(WINDOW_3_WIDTH-4) && !displayIsKeyPress()) ; i++)
2935  0681 3ffb          	clr	_windowOscilloscope$L-5
2937  0683 cc074e        	jp	L7431
2938  0686               L3431:
2939                     ; 343 			j = parametersGetValue(PARAM_OSCIL_ZOOM);
2941  0686 a60b          	ld	a,#11
2942  0688 cd0000        	call	_parametersGetValue
2944  068b b7fa          	ld	_windowOscilloscope$L-6,a
2945                     ; 344 			byValue = 0x0000;
2947  068d 3fff          	clr	_windowOscilloscope$L-1
2949  068f 202c          	jra	L7531
2950  0691               L3531:
2951                     ; 347 				byValue = (WORD) MAX(byValue,windowOscilloscopeGetValue(woEncoderIndex));  //(woValue>arwoValue[j]?woValue:arwoValue[j]);
2953  0691 b6fd          	ld	a,_windowOscilloscope$L-3
2954  0693 befc          	ld	x,_windowOscilloscope$L-4
2955  0695 cd0501        	call	_windowOscilloscopeGetValue
2957  0698 b1ff          	cp	a,_windowOscilloscope$L-1
2958  069a 2404          	jruge	L66
2959  069c b6ff          	ld	a,_windowOscilloscope$L-1
2960  069e 2007          	jra	L07
2961  06a0               L66:
2962  06a0 b6fd          	ld	a,_windowOscilloscope$L-3
2963  06a2 befc          	ld	x,_windowOscilloscope$L-4
2964  06a4 cd0501        	call	_windowOscilloscopeGetValue
2966  06a7               L07:
2967  06a7 b7ff          	ld	_windowOscilloscope$L-1,a
2968                     ; 349 				woEncoderIndex = (woEncoderIndex+1) & (ENCODER_PULSES-1);
2970  06a9 b6fd          	ld	a,_windowOscilloscope$L-3
2971  06ab befc          	ld	x,_windowOscilloscope$L-4
2972  06ad 4c            	inc	a
2973  06ae 2601          	jrne	L27
2974  06b0 5c            	inc	x
2975  06b1               L27:
2976  06b1 a4ff          	and	a,#255
2977  06b3 88            	push	a
2978  06b4 9f            	ld	a,x
2979  06b5 a403          	and	a,#3
2980  06b7 97            	ld	x,a
2981  06b8 84            	pop	a
2982  06b9 b7fd          	ld	_windowOscilloscope$L-3,a
2983  06bb bffc          	ld	_windowOscilloscope$L-4,x
2984  06bd               L7531:
2985                     ; 345 			while(j-->0)
2987  06bd b6fa          	ld	a,_windowOscilloscope$L-6
2988  06bf 3afa          	dec	_windowOscilloscope$L-6
2989  06c1 4d            	tnz	a
2990  06c2 26cd          	jrne	L3531
2991                     ; 352 			byValue = WINDOW_3_OSCILLOSCOPE_Y-(byValue<<2);
2993  06c4 b6ff          	ld	a,_windowOscilloscope$L-1
2994  06c6 48            	sll	a
2995  06c7 48            	sll	a
2996  06c8 a037          	sub	a,#55
2997  06ca 40            	neg	a
2998  06cb b7ff          	ld	_windowOscilloscope$L-1,a
2999                     ; 353 			byLeft = WINDOW_3_LEFT + i + 2;
3001  06cd b6fb          	ld	a,_windowOscilloscope$L-5
3002  06cf ab02          	add	a,#2
3003  06d1 b7fe          	ld	_windowOscilloscope$L-2,a
3004                     ; 356 			if (byGateHasToBeRepainted)
3006  06d3 3df8          	tnz	_windowOscilloscope$L-8
3007  06d5 2742          	jreq	L3631
3008                     ; 361 				m_arbyDisplayCommand[1] = byLeft;
3010  06d7 b6fe          	ld	a,_windowOscilloscope$L-2
3011  06d9 c70001        	ld	_m_arbyDisplayCommand+1,a
3012                     ; 362 				m_arbyDisplayCommand[2] = WINDOW_3_GATE_LOW_Y;
3014  06dc a60f          	ld	a,#15
3015  06de c70002        	ld	_m_arbyDisplayCommand+2,a
3016                     ; 363 				m_arbyDisplayCommand[3] = byLeft;
3018  06e1 b6fe          	ld	a,_windowOscilloscope$L-2
3019  06e3 c70003        	ld	_m_arbyDisplayCommand+3,a
3020                     ; 364 				m_arbyDisplayCommand[4] = WINDOW_3_GATE_HIGH_Y; 
3022  06e6 a619          	ld	a,#25
3023  06e8 c70004        	ld	_m_arbyDisplayCommand+4,a
3024                     ; 369 				m_arbyDisplayCommand[7] = byLeft;
3026  06eb b6fe          	ld	a,_windowOscilloscope$L-2
3027  06ed c70007        	ld	_m_arbyDisplayCommand+7,a
3028                     ; 370 				m_arbyDisplayCommand[8] = byPrevGateValue;
3030  06f0 b6f9          	ld	a,_windowOscilloscope$L-7
3031  06f2 c70008        	ld	_m_arbyDisplayCommand+8,a
3032                     ; 371 				m_arbyDisplayCommand[9] = byLeft;
3034  06f5 b6fe          	ld	a,_windowOscilloscope$L-2
3035  06f7 c70009        	ld	_m_arbyDisplayCommand+9,a
3036                     ; 372 				m_arbyDisplayCommand[10] = windowIsInGate(woEncoderIndex)?WINDOW_3_GATE_LOW_Y:WINDOW_3_GATE_HIGH_Y; 
3038  06fa b6fd          	ld	a,_windowOscilloscope$L-3
3039  06fc befc          	ld	x,_windowOscilloscope$L-4
3040  06fe cd054c        	call	_windowIsInGate
3042  0701 4d            	tnz	a
3043  0702 2704          	jreq	L47
3044  0704 a60f          	ld	a,#15
3045  0706 2002          	jra	L67
3046  0708               L47:
3047  0708 a619          	ld	a,#25
3048  070a               L67:
3049  070a c7000a        	ld	_m_arbyDisplayCommand+10,a
3050                     ; 374 				byPrevGateValue =m_arbyDisplayCommand[10];
3052  070d c6000a        	ld	a,_m_arbyDisplayCommand+10
3053  0710 b7f9          	ld	_windowOscilloscope$L-7,a
3054                     ; 376 				displayCmdToDisplay(m_arbyDisplayCommand);
3056  0712 a600          	ld	a,#low(_m_arbyDisplayCommand)
3057  0714 ae00          	ld	x,#high(_m_arbyDisplayCommand)
3058  0716 cd0000        	call	_displayCmdToDisplay
3060  0719               L3631:
3061                     ; 381 			m_arbyDisplayCommand[1] = byLeft;
3063  0719 b6fe          	ld	a,_windowOscilloscope$L-2
3064  071b c70001        	ld	_m_arbyDisplayCommand+1,a
3065                     ; 382 			m_arbyDisplayCommand[2] = WINDOW_3_OSCILLOSCOPE_Y-12;
3067  071e a62b          	ld	a,#43
3068  0720 c70002        	ld	_m_arbyDisplayCommand+2,a
3069                     ; 383 			m_arbyDisplayCommand[3] = byLeft;
3071  0723 b6fe          	ld	a,_windowOscilloscope$L-2
3072  0725 c70003        	ld	_m_arbyDisplayCommand+3,a
3073                     ; 384 			m_arbyDisplayCommand[4] = WINDOW_3_OSCILLOSCOPE_Y-1;
3075  0728 a636          	ld	a,#54
3076  072a c70004        	ld	_m_arbyDisplayCommand+4,a
3077                     ; 389 			m_arbyDisplayCommand[7] = byLeft;
3079  072d b6fe          	ld	a,_windowOscilloscope$L-2
3080  072f c70007        	ld	_m_arbyDisplayCommand+7,a
3081                     ; 390 			m_arbyDisplayCommand[8] = WINDOW_3_OSCILLOSCOPE_Y;
3083  0732 a637          	ld	a,#55
3084  0734 c70008        	ld	_m_arbyDisplayCommand+8,a
3085                     ; 391 			m_arbyDisplayCommand[9] = byLeft;
3087  0737 b6fe          	ld	a,_windowOscilloscope$L-2
3088  0739 c70009        	ld	_m_arbyDisplayCommand+9,a
3089                     ; 392 			m_arbyDisplayCommand[10] = byValue;
3091  073c b6ff          	ld	a,_windowOscilloscope$L-1
3092  073e c7000a        	ld	_m_arbyDisplayCommand+10,a
3093                     ; 394 			byPrevValue = byValue;
3095  0741 b6ff          	ld	a,_windowOscilloscope$L-1
3096  0743 b7f7          	ld	_windowOscilloscope$L-9,a
3097                     ; 396 			displayCmdToDisplay(m_arbyDisplayCommand);			
3099  0745 a600          	ld	a,#low(_m_arbyDisplayCommand)
3100  0747 ae00          	ld	x,#high(_m_arbyDisplayCommand)
3101  0749 cd0000        	call	_displayCmdToDisplay
3103                     ; 340 		for(i=0; (i<(WINDOW_3_WIDTH-4) && !displayIsKeyPress()) ; i++)
3105  074c 3cfb          	inc	_windowOscilloscope$L-5
3106  074e               L7431:
3109  074e b6fb          	ld	a,_windowOscilloscope$L-5
3110  0750 a17a          	cp	a,#122
3111  0752 2409          	jruge	L5631
3113  0754 cd0000        	call	_displayIsKeyPress
3115  0757 4d            	tnz	a
3116  0758 2603          	jrne	L401
3117  075a cc0686        	jp	L3431
3118  075d               L401:
3119  075d               L5631:
3120                     ; 399 		if(!displayIsKeyPress())
3122  075d cd0000        	call	_displayIsKeyPress
3124  0760 4d            	tnz	a
3125  0761 260a          	jrne	L1431
3126                     ; 401 			parametersChangedFlagReset(PARAM_OSCIL_ZOOM);
3128  0763 a60b          	ld	a,#11
3129  0765 cd0000        	call	_parametersChangedFlagReset
3131                     ; 402 			parametersChangedFlagReset(PARAM_OSCIL_OFFSET);
3133  0768 a60c          	ld	a,#12
3134  076a cd0000        	call	_parametersChangedFlagReset
3136  076d               L1431:
3137                     ; 407 	_bset(m_woDisplayedWindow, WIN_OSCILLOSCOPE);
3139  076d c60001        	ld	a,_m_woDisplayedWindow+1
3140  0770 aa04          	or	a,#4
3141  0772 c70001        	ld	_m_woDisplayedWindow+1,a
3142                     ; 408 	_bres(m_woDisplayedWindow, WIN_REGISTER);
3144  0775 c60001        	ld	a,_m_woDisplayedWindow+1
3145  0778 a4f7          	and	a,#247
3146  077a c70001        	ld	_m_woDisplayedWindow+1,a
3147                     ; 409 	_bres(m_woDisplayedWindow, WIN_ALARM);
3149  077d c60001        	ld	a,_m_woDisplayedWindow+1
3150  0780 a4ef          	and	a,#239
3151  0782 c70001        	ld	_m_woDisplayedWindow+1,a
3152                     ; 410 	_bres(m_woDisplayedWindow, WIN_MESSAGE);
3154  0785 c60001        	ld	a,_m_woDisplayedWindow+1
3155  0788 a4df          	and	a,#223
3156  078a c70001        	ld	_m_woDisplayedWindow+1,a
3157                     ; 411 	_bres(m_woDisplayedWindow, WIN_FUNCTIONS);
3159  078d c60001        	ld	a,_m_woDisplayedWindow+1
3160  0790 a4bf          	and	a,#191
3161  0792 c70001        	ld	_m_woDisplayedWindow+1,a
3162                     ; 412 	_bres(m_woDisplayedWindow, WIN_PARAMETERS);
3164  0795 c60001        	ld	a,_m_woDisplayedWindow+1
3165  0798 a47f          	and	a,#127
3166  079a c70001        	ld	_m_woDisplayedWindow+1,a
3167                     ; 413 	_bres(m_woDisplayedWindow, WIN_TESTS);
3169  079d c60001        	ld	a,_m_woDisplayedWindow+1
3170  07a0 a4ff          	and	a,#255
3171  07a2 c70001        	ld	_m_woDisplayedWindow+1,a
3172  07a5 c60000        	ld	a,_m_woDisplayedWindow
3173  07a8 a4fe          	and	a,#254
3174  07aa c70000        	ld	_m_woDisplayedWindow,a
3175                     ; 414 	_bres(m_woDisplayedWindow, WIN_MENUS);
3177  07ad c60001        	ld	a,_m_woDisplayedWindow+1
3178  07b0 a4ff          	and	a,#255
3179  07b2 c70001        	ld	_m_woDisplayedWindow+1,a
3180  07b5 c60000        	ld	a,_m_woDisplayedWindow
3181  07b8 a4fd          	and	a,#253
3182  07ba c70000        	ld	_m_woDisplayedWindow,a
3183                     ; 415 }
3186  07bd 81            	ret
3232                     ; 418 void windowRegisterPrepareFormateValue(BYTE * a_strErrValue)
3232                     ; 419 {
3233                     	switch	.text
3235                     	xref.b	_windowRegisterPrepareFormateValue$L
3236  07be               _windowRegisterPrepareFormateValue:
3238  07be b701          	ld	_windowRegisterPrepareFormateValue$L+1,a
3239  07c0 bf00          	ld	_windowRegisterPrepareFormateValue$L,x
3241                     ; 422 	if (parametersGetValue(PARAM_ERR_LONG) > 0x8000)
3243  07c2 a609          	ld	a,#9
3244  07c4 cd0000        	call	_parametersGetValue
3246  07c7 a001          	sub	a,#1
3247  07c9 9f            	ld	a,x
3248  07ca a280          	sbc	a,#128
3249  07cc 2507          	jrult	L3141
3250                     ; 424 		a_strErrValue[0] = '+';
3252  07ce a62b          	ld	a,#43
3253  07d0 92c700        	ld	[_windowRegisterPrepareFormateValue$L.w],a
3255  07d3 2018          	jra	L5141
3256  07d5               L3141:
3257                     ; 426 	else if (parametersGetValue(PARAM_ERR_LONG) < 0x8000)
3259  07d5 a609          	ld	a,#9
3260  07d7 cd0000        	call	_parametersGetValue
3262  07da a000          	sub	a,#0
3263  07dc 9f            	ld	a,x
3264  07dd a280          	sbc	a,#128
3265  07df 2407          	jruge	L7141
3266                     ; 428 		a_strErrValue[0] = '-';
3268  07e1 a62d          	ld	a,#45
3269  07e3 92c700        	ld	[_windowRegisterPrepareFormateValue$L.w],a
3271  07e6 2005          	jra	L5141
3272  07e8               L7141:
3273                     ; 432 		a_strErrValue[0] = ' ';
3275  07e8 a620          	ld	a,#32
3276  07ea 92c700        	ld	[_windowRegisterPrepareFormateValue$L.w],a
3277  07ed               L5141:
3278                     ; 434 	a_strErrValue[6] = 0x00;
3280  07ed ae06          	ld	x,#6
3281  07ef 4f            	clr	a
3282  07f0 92d700        	ld	([_windowRegisterPrepareFormateValue$L.w],x),a
3283                     ; 435 	a_strErrValue[7] = 0x00;
3285  07f3 ae07          	ld	x,#7
3286  07f5 4f            	clr	a
3287  07f6 92d700        	ld	([_windowRegisterPrepareFormateValue$L.w],x),a
3288                     ; 437 	woValue = parametersGetValue(PARAM_ERR_LONG) - 0x8000;
3290  07f9 a609          	ld	a,#9
3291  07fb cd0000        	call	_parametersGetValue
3293  07fe a000          	sub	a,#0
3294  0800 88            	push	a
3295  0801 9f            	ld	a,x
3296  0802 a280          	sbc	a,#128
3297  0804 97            	ld	x,a
3298  0805 84            	pop	a
3299  0806 b7ff          	ld	_windowRegisterPrepareFormateValue$L-1,a
3300  0808 bffe          	ld	_windowRegisterPrepareFormateValue$L-2,x
3301                     ; 438 	if (woValue<0x8000)
3303  080a b6fe          	ld	a,_windowRegisterPrepareFormateValue$L-2
3304  080c a180          	cp	a,#128
3305  080e 241d          	jruge	L3241
3306                     ; 440 		formatNumber(woValue, 6, 2, a_strErrValue+1);
3308  0810 b601          	ld	a,_windowRegisterPrepareFormateValue$L+1
3309  0812 be00          	ld	x,_windowRegisterPrepareFormateValue$L
3310  0814 4c            	inc	a
3311  0815 2601          	jrne	L011
3312  0817 5c            	inc	x
3313  0818               L011:
3314  0818 b705          	ld	_formatNumber$L+5,a
3315  081a bf04          	ld	_formatNumber$L+4,x
3316  081c a602          	ld	a,#2
3317  081e b703          	ld	_formatNumber$L+3,a
3318  0820 a606          	ld	a,#6
3319  0822 b702          	ld	_formatNumber$L+2,a
3320  0824 b6ff          	ld	a,_windowRegisterPrepareFormateValue$L-1
3321  0826 befe          	ld	x,_windowRegisterPrepareFormateValue$L-2
3322  0828 cd0000        	call	_formatNumber
3325  082b 2029          	jra	L5241
3326  082d               L3241:
3327                     ; 445 		woValue = ((WORD)(~woValue)) + 1;
3329  082d b6ff          	ld	a,_windowRegisterPrepareFormateValue$L-1
3330  082f befe          	ld	x,_windowRegisterPrepareFormateValue$L-2
3331  0831 43            	cpl	a
3332  0832 53            	cpl	x
3333  0833 4c            	inc	a
3334  0834 2601          	jrne	L211
3335  0836 5c            	inc	x
3336  0837               L211:
3337  0837 b7ff          	ld	_windowRegisterPrepareFormateValue$L-1,a
3338  0839 bffe          	ld	_windowRegisterPrepareFormateValue$L-2,x
3339                     ; 446 		formatNumber(woValue, 6, 2, a_strErrValue+1);
3341  083b b601          	ld	a,_windowRegisterPrepareFormateValue$L+1
3342  083d be00          	ld	x,_windowRegisterPrepareFormateValue$L
3343  083f 4c            	inc	a
3344  0840 2601          	jrne	L411
3345  0842 5c            	inc	x
3346  0843               L411:
3347  0843 b705          	ld	_formatNumber$L+5,a
3348  0845 bf04          	ld	_formatNumber$L+4,x
3349  0847 a602          	ld	a,#2
3350  0849 b703          	ld	_formatNumber$L+3,a
3351  084b a606          	ld	a,#6
3352  084d b702          	ld	_formatNumber$L+2,a
3353  084f b6ff          	ld	a,_windowRegisterPrepareFormateValue$L-1
3354  0851 befe          	ld	x,_windowRegisterPrepareFormateValue$L-2
3355  0853 cd0000        	call	_formatNumber
3357  0856               L5241:
3358                     ; 448 }
3361  0856 81            	ret
3428                     ; 451 void windowRegister(void)
3428                     ; 452 {
3429                     	switch	.text
3431                     	xref.b	_windowRegister$L
3432  0857               _windowRegister:
3435                     ; 458 	byRulerTop = WINDOW_3_TOP+22;
3437  0857 a616          	ld	a,#22
3438  0859 b7ff          	ld	_windowRegister$L-1,a
3439                     ; 460 	if (!_btst(m_woDisplayedWindow, WIN_REGISTER)) //Not displayed
3441  085b c60001        	ld	a,_m_woDisplayedWindow+1
3442  085e a508          	bcp	a,#8
3443  0860 2703          	jreq	L631
3444  0862 cc08ed        	jp	L5541
3445  0865               L631:
3446                     ; 462 		displayClearArea(WINDOW_3_LEFT, WINDOW_3_TOP, WINDOW_3_RIGHT, WINDOW_3_BOTTOM);
3448  0865 a640          	ld	a,#64
3449  0867 b703          	ld	_displayClearArea$L+3,a
3450  0869 a67e          	ld	a,#126
3451  086b b702          	ld	_displayClearArea$L+2,a
3452  086d 4f            	clr	a
3453  086e 5f            	clr	x
3454  086f cd0000        	call	_displayClearArea
3456                     ; 463 		displaySetOutLine(WINDOW_3_LEFT, WINDOW_3_TOP, WINDOW_3_RIGHT, WINDOW_3_BOTTOM, false);
3458  0872 3f04          	clr	_displaySetOutLine$L+4
3459  0874 a640          	ld	a,#64
3460  0876 b703          	ld	_displaySetOutLine$L+3,a
3461  0878 a67e          	ld	a,#126
3462  087a b702          	ld	_displaySetOutLine$L+2,a
3463  087c 4f            	clr	a
3464  087d 5f            	clr	x
3465  087e cd0000        	call	_displaySetOutLine
3467                     ; 466 		displayWriteString("registro:", DISPLAY_SELECT_FONT_MINI, WINDOW_3_LEFT+2, WINDOW_3_TOP+6);
3469  0881 a606          	ld	a,#6
3470  0883 b704          	ld	_displayWriteString$L+4,a
3471  0885 a602          	ld	a,#2
3472  0887 b703          	ld	_displayWriteString$L+3,a
3473  0889 a61c          	ld	a,#28
3474  088b b702          	ld	_displayWriteString$L+2,a
3475  088d a609          	ld	a,#low(L7541)
3476  088f ae09          	ld	x,#high(L7541)
3477  0891 cd0000        	call	_displayWriteString
3479                     ; 467 		displayInvertArea(WINDOW_3_LEFT+1, WINDOW_3_TOP+1, WINDOW_3_RIGHT-2, WINDOW_3_TOP+6);
3481  0894 a606          	ld	a,#6
3482  0896 b703          	ld	_displayInvertArea$L+3,a
3483  0898 a67c          	ld	a,#124
3484  089a b702          	ld	_displayInvertArea$L+2,a
3485  089c a601          	ld	a,#1
3486  089e ae01          	ld	x,#1
3487  08a0 cd0000        	call	_displayInvertArea
3489                     ; 470 		displayDrawHorizontalLine(byRulerTop + 1, WINDOW_3_LEFT + 6, WINDOW_3_WIDTH - 13);
3491  08a3 a671          	ld	a,#113
3492  08a5 b702          	ld	_displayDrawHorizontalLine$L+2,a
3493  08a7 a606          	ld	a,#6
3494  08a9 beff          	ld	x,_windowRegister$L-1
3495  08ab 5c            	inc	x
3496  08ac cd0000        	call	_displayDrawHorizontalLine
3498                     ; 471 		/* -1   */ displayDrawVerticalLine(WINDOW_3_LEFT + 5								, byRulerTop - 1, 6);	
3500  08af a606          	ld	a,#6
3501  08b1 b702          	ld	_displayDrawVerticalLine$L+2,a
3502  08b3 b6ff          	ld	a,_windowRegister$L-1
3503  08b5 4a            	dec	a
3504  08b6 ae05          	ld	x,#5
3505  08b8 cd0000        	call	_displayDrawVerticalLine
3507                     ; 472 		/*  0   */ displayDrawVerticalLine(WINDOW_3_LEFT + 5 + (WINDOW_3_WIDTH - 11) / 2	, byRulerTop - 1, 6);
3509  08bb a606          	ld	a,#6
3510  08bd b702          	ld	_displayDrawVerticalLine$L+2,a
3511  08bf b6ff          	ld	a,_windowRegister$L-1
3512  08c1 4a            	dec	a
3513  08c2 ae3e          	ld	x,#62
3514  08c4 cd0000        	call	_displayDrawVerticalLine
3516                     ; 473 		/*  1   */ displayDrawVerticalLine(WINDOW_3_LEFT + 5 + (WINDOW_3_WIDTH - 11)		, byRulerTop - 1, 6);
3518  08c7 a606          	ld	a,#6
3519  08c9 b702          	ld	_displayDrawVerticalLine$L+2,a
3520  08cb b6ff          	ld	a,_windowRegister$L-1
3521  08cd 4a            	dec	a
3522  08ce ae78          	ld	x,#120
3523  08d0 cd0000        	call	_displayDrawVerticalLine
3525                     ; 474 		/* -0.5 */ displayDrawVerticalLine(WINDOW_3_LEFT + 5 + (WINDOW_3_WIDTH - 11) / 4	, byRulerTop + 2, 1);
3527  08d3 a601          	ld	a,#1
3528  08d5 b702          	ld	_displayDrawVerticalLine$L+2,a
3529  08d7 b6ff          	ld	a,_windowRegister$L-1
3530  08d9 ab02          	add	a,#2
3531  08db ae21          	ld	x,#33
3532  08dd cd0000        	call	_displayDrawVerticalLine
3534                     ; 475 		/* +0.5 */ displayDrawVerticalLine(WINDOW_3_LEFT + 5 + (WINDOW_3_WIDTH - 11) * 3 / 4, byRulerTop + 2, 1);
3536  08e0 a601          	ld	a,#1
3537  08e2 b702          	ld	_displayDrawVerticalLine$L+2,a
3538  08e4 b6ff          	ld	a,_windowRegister$L-1
3539  08e6 ab02          	add	a,#2
3540  08e8 ae5b          	ld	x,#91
3541  08ea cd0000        	call	_displayDrawVerticalLine
3543  08ed               L5541:
3544                     ; 481 	if (parametersIsChanged(PARAM_ERR_LONG) || (!_btst(m_woDisplayedWindow, WIN_REGISTER)) )
3546  08ed a609          	ld	a,#9
3547  08ef cd0000        	call	_parametersIsChanged
3549  08f2 4d            	tnz	a
3550  08f3 260a          	jrne	L3641
3552  08f5 c60001        	ld	a,_m_woDisplayedWindow+1
3553  08f8 a508          	bcp	a,#8
3554  08fa 2703          	jreq	L041
3555  08fc cc0a19        	jp	L1641
3556  08ff               L041:
3557  08ff               L3641:
3558                     ; 484 		dblPercentValue = ((double) parametersGetValue(PARAM_ERR_LONG)- (double) 0x8000) / 100.0;
3560  08ff a609          	ld	a,#9
3561  0901 cd0000        	call	_parametersGetValue
3563  0904 cd0000        	call	c_uitof
3565  0907 ae05          	ld	x,#high(L1741)
3566  0909 bf00          	ld	c_x,x
3567  090b ae05          	ld	x,#low(L1741)
3568  090d cd0000        	call	c_xfsub
3570  0910 ae01          	ld	x,#high(L1051)
3571  0912 bf00          	ld	c_x,x
3572  0914 ae01          	ld	x,#low(L1051)
3573  0916 cd0000        	call	c_xfdiv
3575  0919 aefb          	ld	x,#_windowRegister$L-5
3576  091b cd0000        	call	c_rtol
3578                     ; 485 		dblPercentValue = (dblPercentValue>1?1:dblPercentValue);
3580  091e 5f            	clr	x
3581  091f a601          	ld	a,#1
3582  0921 cd0000        	call	c_itof
3584  0924 aeef          	ld	x,#_windowRegister$L-17
3585  0926 cd0000        	call	c_rtol
3587  0929 aefb          	ld	x,#_windowRegister$L-5
3588  092b cd0000        	call	c_ltor
3590  092e aeef          	ld	x,#_windowRegister$L-17
3591  0930 cd0000        	call	c_fcmp
3593                     	jrle	L021
3594  0937 5f            	clr	x
3595  0938 a601          	ld	a,#1
3596  093a cd0000        	call	c_itof
3598  093d 2005          	jra	L221
3599  093f               L021:
3600  093f aefb          	ld	x,#_windowRegister$L-5
3601  0941 cd0000        	call	c_ltor
3603  0944               L221:
3604  0944 aefb          	ld	x,#_windowRegister$L-5
3605  0946 cd0000        	call	c_rtol
3607                     ; 486 		dblPercentValue = (dblPercentValue<-1?-1:dblPercentValue);
3609  0949 a6ff          	ld	a,#255
3610  094b aeff          	ld	x,#255
3611  094d cd0000        	call	c_itof
3613  0950 aeef          	ld	x,#_windowRegister$L-17
3614  0952 cd0000        	call	c_rtol
3616  0955 aefb          	ld	x,#_windowRegister$L-5
3617  0957 cd0000        	call	c_ltor
3619  095a aeef          	ld	x,#_windowRegister$L-17
3620  095c cd0000        	call	c_fcmp
3622  095f 2a09          	jrpl	L421
3623  0961 a6ff          	ld	a,#255
3624  0963 aeff          	ld	x,#255
3625  0965 cd0000        	call	c_itof
3627  0968 2005          	jra	L621
3628  096a               L421:
3629  096a aefb          	ld	x,#_windowRegister$L-5
3630  096c cd0000        	call	c_ltor
3632  096f               L621:
3633  096f aefb          	ld	x,#_windowRegister$L-5
3634  0971 cd0000        	call	c_rtol
3636                     ; 488 		displayWriteString("-", DISPLAY_SELECT_FONT_MINI, WINDOW_3_LEFT + 4								 , 	byRulerTop - 3);
3638  0974 b6ff          	ld	a,_windowRegister$L-1
3639  0976 a003          	sub	a,#3
3640  0978 b704          	ld	_displayWriteString$L+4,a
3641  097a a604          	ld	a,#4
3642  097c b703          	ld	_displayWriteString$L+3,a
3643  097e a61c          	ld	a,#28
3644  0980 b702          	ld	_displayWriteString$L+2,a
3645  0982 a6ff          	ld	a,#low(L5051)
3646  0984 aeff          	ld	x,#high(L5051)
3647  0986 cd0000        	call	_displayWriteString
3649                     ; 489 		displayWriteString("+", DISPLAY_SELECT_FONT_MINI, WINDOW_3_LEFT + 4 + (WINDOW_3_WIDTH - 11)		 , 	byRulerTop - 3);
3651  0989 b6ff          	ld	a,_windowRegister$L-1
3652  098b a003          	sub	a,#3
3653  098d b704          	ld	_displayWriteString$L+4,a
3654  098f a677          	ld	a,#119
3655  0991 b703          	ld	_displayWriteString$L+3,a
3656  0993 a61c          	ld	a,#28
3657  0995 b702          	ld	_displayWriteString$L+2,a
3658  0997 a6fd          	ld	a,#low(L7051)
3659  0999 aefd          	ld	x,#high(L7051)
3660  099b cd0000        	call	_displayWriteString
3662                     ; 493 		if (m_byCurrentSelectorX>0)
3664  099e c60002        	ld	a,_m_byCurrentSelectorX
3665  09a1 4d            	tnz	a
3666  09a2 2717          	jreq	L1151
3667                     ; 495 			displayClearArea(m_byCurrentSelectorX-1, byRulerTop - 11, m_byCurrentSelectorX+1, byRulerTop-3);
3669  09a4 b6ff          	ld	a,_windowRegister$L-1
3670  09a6 a003          	sub	a,#3
3671  09a8 b703          	ld	_displayClearArea$L+3,a
3672  09aa c60002        	ld	a,_m_byCurrentSelectorX
3673  09ad 4c            	inc	a
3674  09ae b702          	ld	_displayClearArea$L+2,a
3675  09b0 b6ff          	ld	a,_windowRegister$L-1
3676  09b2 a00b          	sub	a,#11
3677  09b4 ce0002        	ld	x,_m_byCurrentSelectorX
3678  09b7 5a            	dec	x
3679  09b8 cd0000        	call	_displayClearArea
3681  09bb               L1151:
3682                     ; 498 		m_byCurrentSelectorX = WINDOW_3_LEFT + 5 + ((WINDOW_3_WIDTH - 11) / 2 * (dblPercentValue + 1));
3684  09bb aefb          	ld	x,#_windowRegister$L-5
3685  09bd cd0000        	call	c_ltor
3687  09c0 aef9          	ld	x,#high(L7151)
3688  09c2 bf00          	ld	c_x,x
3689  09c4 aef9          	ld	x,#low(L7151)
3690  09c6 cd0000        	call	c_xfadd
3692  09c9 aef5          	ld	x,#high(L7251)
3693  09cb bf00          	ld	c_x,x
3694  09cd aef5          	ld	x,#low(L7251)
3695  09cf cd0000        	call	c_xfmul
3697  09d2 aef1          	ld	x,#high(L7351)
3698  09d4 bf00          	ld	c_x,x
3699  09d6 aef1          	ld	x,#low(L7351)
3700  09d8 cd0000        	call	c_xfadd
3702  09db cd0000        	call	c_ftoi
3704  09de c70002        	ld	_m_byCurrentSelectorX,a
3705                     ; 499 		displayDrawSelector( m_byCurrentSelectorX, byRulerTop - 11,  (dblPercentValue != 0), true);
3707  09e1 a601          	ld	a,#1
3708  09e3 b703          	ld	_displayDrawSelector$L+3,a
3709  09e5 b6fb          	ld	a,_windowRegister$L-5
3710  09e7 2704          	jreq	L031
3711  09e9 a601          	ld	a,#1
3712  09eb 2001          	jra	L231
3713  09ed               L031:
3714  09ed 4f            	clr	a
3715  09ee               L231:
3716  09ee b702          	ld	_displayDrawSelector$L+2,a
3717  09f0 b6ff          	ld	a,_windowRegister$L-1
3718  09f2 a00b          	sub	a,#11
3719  09f4 ce0002        	ld	x,_m_byCurrentSelectorX
3720  09f7 cd0000        	call	_displayDrawSelector
3722                     ; 502 		windowRegisterPrepareFormateValue(strString);
3724  09fa a6f3          	ld	a,#_windowRegister$L-13
3725  09fc 5f            	clr	x
3726  09fd cd07be        	call	_windowRegisterPrepareFormateValue
3728                     ; 503 		displayWriteString(strString, DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+42, byRulerTop + 18);	
3730  0a00 b6ff          	ld	a,_windowRegister$L-1
3731  0a02 ab12          	add	a,#18
3732  0a04 b704          	ld	_displayWriteString$L+4,a
3733  0a06 a62a          	ld	a,#42
3734  0a08 b703          	ld	_displayWriteString$L+3,a
3735  0a0a a61d          	ld	a,#29
3736  0a0c b702          	ld	_displayWriteString$L+2,a
3737  0a0e a6f3          	ld	a,#_windowRegister$L-13
3738  0a10 5f            	clr	x
3739  0a11 cd0000        	call	_displayWriteString
3741                     ; 505 		parametersChangedFlagReset(PARAM_ERR_LONG);
3743  0a14 a609          	ld	a,#9
3744  0a16 cd0000        	call	_parametersChangedFlagReset
3746  0a19               L1641:
3747                     ; 509 	if (parametersIsChanged(PARAM_CORRECTION))
3749  0a19 a608          	ld	a,#8
3750  0a1b cd0000        	call	_parametersIsChanged
3752  0a1e 4d            	tnz	a
3753  0a1f 271a          	jreq	L3451
3754                     ; 511 		displayDrawCorrection(WINDOW_3_LEFT, byRulerTop, WINDOW_3_WIDTH, LOBYTE(parametersGetValue(PARAM_CORRECTION)), /*size*/0x01);
3756  0a21 a601          	ld	a,#1
3757  0a23 b704          	ld	_displayDrawCorrection$L+4,a
3758  0a25 a608          	ld	a,#8
3759  0a27 cd0000        	call	_parametersGetValue
3761  0a2a b703          	ld	_displayDrawCorrection$L+3,a
3762  0a2c a67e          	ld	a,#126
3763  0a2e b702          	ld	_displayDrawCorrection$L+2,a
3764  0a30 b6ff          	ld	a,_windowRegister$L-1
3765  0a32 5f            	clr	x
3766  0a33 cd0000        	call	_displayDrawCorrection
3768                     ; 512 		parametersChangedFlagReset(PARAM_CORRECTION);
3770  0a36 a608          	ld	a,#8
3771  0a38 cd0000        	call	_parametersChangedFlagReset
3773  0a3b               L3451:
3774                     ; 516 	if (parametersIsChanged(PARAM_ALARM_OUT_OF_BOUND))
3776  0a3b a60e          	ld	a,#14
3777  0a3d cd0000        	call	_parametersIsChanged
3779  0a40 4d            	tnz	a
3780  0a41 2723          	jreq	L5451
3781                     ; 518 		if (parametersGetValue(PARAM_ALARM_OUT_OF_BOUND))
3783  0a43 a60e          	ld	a,#14
3784  0a45 cd0000        	call	_parametersGetValue
3786  0a48 4d            	tnz	a
3787  0a49 2601          	jrne	L431
3788  0a4b 5d            	tnz	x
3789  0a4c               L431:
3790  0a4c 2709          	jreq	L7451
3791                     ; 520 			displayDrawAlarm(87, 45);
3793  0a4e a62d          	ld	a,#45
3794  0a50 ae57          	ld	x,#87
3795  0a52 cd0000        	call	_displayDrawAlarm
3798  0a55 200f          	jra	L5451
3799  0a57               L7451:
3800                     ; 524 			displayClearArea(87+2,45+7, 87+10, 45+14);
3802  0a57 a63b          	ld	a,#59
3803  0a59 b703          	ld	_displayClearArea$L+3,a
3804  0a5b a661          	ld	a,#97
3805  0a5d b702          	ld	_displayClearArea$L+2,a
3806  0a5f a634          	ld	a,#52
3807  0a61 ae59          	ld	x,#89
3808  0a63 cd0000        	call	_displayClearArea
3810  0a66               L5451:
3811                     ; 529 	_bres(m_woDisplayedWindow, WIN_OSCILLOSCOPE);
3813  0a66 c60001        	ld	a,_m_woDisplayedWindow+1
3814  0a69 a4fb          	and	a,#251
3815  0a6b c70001        	ld	_m_woDisplayedWindow+1,a
3816                     ; 530 	_bset(m_woDisplayedWindow, WIN_REGISTER);
3818  0a6e c60001        	ld	a,_m_woDisplayedWindow+1
3819  0a71 aa08          	or	a,#8
3820  0a73 c70001        	ld	_m_woDisplayedWindow+1,a
3821                     ; 531 	_bres(m_woDisplayedWindow, WIN_ALARM);
3823  0a76 c60001        	ld	a,_m_woDisplayedWindow+1
3824  0a79 a4ef          	and	a,#239
3825  0a7b c70001        	ld	_m_woDisplayedWindow+1,a
3826                     ; 532 	_bres(m_woDisplayedWindow, WIN_MESSAGE);
3828  0a7e c60001        	ld	a,_m_woDisplayedWindow+1
3829  0a81 a4df          	and	a,#223
3830  0a83 c70001        	ld	_m_woDisplayedWindow+1,a
3831                     ; 533 	_bres(m_woDisplayedWindow, WIN_FUNCTIONS);
3833  0a86 c60001        	ld	a,_m_woDisplayedWindow+1
3834  0a89 a4bf          	and	a,#191
3835  0a8b c70001        	ld	_m_woDisplayedWindow+1,a
3836                     ; 534 	_bres(m_woDisplayedWindow, WIN_PARAMETERS);
3838  0a8e c60001        	ld	a,_m_woDisplayedWindow+1
3839  0a91 a47f          	and	a,#127
3840  0a93 c70001        	ld	_m_woDisplayedWindow+1,a
3841                     ; 535 	_bres(m_woDisplayedWindow, WIN_TESTS);
3843  0a96 c60001        	ld	a,_m_woDisplayedWindow+1
3844  0a99 a4ff          	and	a,#255
3845  0a9b c70001        	ld	_m_woDisplayedWindow+1,a
3846  0a9e c60000        	ld	a,_m_woDisplayedWindow
3847  0aa1 a4fe          	and	a,#254
3848  0aa3 c70000        	ld	_m_woDisplayedWindow,a
3849                     ; 536 	_bres(m_woDisplayedWindow, WIN_MENUS);
3851  0aa6 c60001        	ld	a,_m_woDisplayedWindow+1
3852  0aa9 a4ff          	and	a,#255
3853  0aab c70001        	ld	_m_woDisplayedWindow+1,a
3854  0aae c60000        	ld	a,_m_woDisplayedWindow
3855  0ab1 a4fd          	and	a,#253
3856  0ab3 c70000        	ld	_m_woDisplayedWindow,a
3857                     ; 537 }
3860  0ab6 81            	ret
3912                     ; 540 void window6Menu(BYTE * a_byGroup, BYTE * a_bySelected)
3912                     ; 541 {
3913                     	switch	.text
3915                     	xref.b	_window6Menu$L
3916  0ab7               _window6Menu:
3918  0ab7 b701          	ld	_window6Menu$L+1,a
3919  0ab9 bf00          	ld	_window6Menu$L,x
3921                     ; 542 	if ( !  (	((*a_byGroup == MENU_GROUP_FUNCTION) 	&& _btst(m_woDisplayedWindow, WIN_FUNCTIONS)) ||
3921                     ; 543 				((*a_byGroup == MENU_GROUP_PARAMETER) 	&& _btst(m_woDisplayedWindow, WIN_PARAMETERS)) ||
3921                     ; 544 				((*a_byGroup == MENU_GROUP_MENU) 		&& _btst(m_woDisplayedWindow, WIN_MENUS)) ||
3921                     ; 545 				((*a_byGroup == MENU_GROUP_TEST) 		&& _btst(m_woDisplayedWindow, WIN_TESTS))
3921                     ; 546 			))  // Is not only a refresh
3923  0abb 92c600        	ld	a,[_window6Menu$L.w]
3924  0abe a101          	cp	a,#1
3925  0ac0 260a          	jrne	L7061
3927  0ac2 c60001        	ld	a,_m_woDisplayedWindow+1
3928  0ac5 a540          	bcp	a,#64
3929  0ac7 2703          	jreq	L012
3930  0ac9 cc0f00        	jp	L5061
3931  0acc               L012:
3932  0acc               L7061:
3934  0acc 92c600        	ld	a,[_window6Menu$L.w]
3935  0acf a102          	cp	a,#2
3936  0ad1 260a          	jrne	L1161
3938  0ad3 c60001        	ld	a,_m_woDisplayedWindow+1
3939  0ad6 a580          	bcp	a,#128
3940  0ad8 2703          	jreq	L212
3941  0ada cc0f00        	jp	L5061
3942  0add               L212:
3943  0add               L1161:
3945  0add 92c600        	ld	a,[_window6Menu$L.w]
3946  0ae0 a104          	cp	a,#4
3947  0ae2 260a          	jrne	L3161
3949  0ae4 c60000        	ld	a,_m_woDisplayedWindow
3950  0ae7 a502          	bcp	a,#2
3951  0ae9 2703          	jreq	L412
3952  0aeb cc0f00        	jp	L5061
3953  0aee               L412:
3954  0aee               L3161:
3956  0aee 92c600        	ld	a,[_window6Menu$L.w]
3957  0af1 a103          	cp	a,#3
3958  0af3 260a          	jrne	L5161
3960  0af5 c60000        	ld	a,_m_woDisplayedWindow
3961  0af8 a501          	bcp	a,#1
3962  0afa 2703          	jreq	L612
3963  0afc cc0f00        	jp	L5061
3964  0aff               L612:
3965  0aff               L5161:
3966                     ; 548 		displayClearArea(0,0,126,64);
3968  0aff a640          	ld	a,#64
3969  0b01 b703          	ld	_displayClearArea$L+3,a
3970  0b03 a67e          	ld	a,#126
3971  0b05 b702          	ld	_displayClearArea$L+2,a
3972  0b07 4f            	clr	a
3973  0b08 5f            	clr	x
3974  0b09 cd0000        	call	_displayClearArea
3976                     ; 550 		displayWriteString("1", 			DISPLAY_SELECT_FONT_10x14, 	2, 		17);
3978  0b0c a611          	ld	a,#17
3979  0b0e b704          	ld	_displayWriteString$L+4,a
3980  0b10 a602          	ld	a,#2
3981  0b12 b703          	ld	_displayWriteString$L+3,a
3982  0b14 a61e          	ld	a,#30
3983  0b16 b702          	ld	_displayWriteString$L+2,a
3984  0b18 a6ef          	ld	a,#low(L7161)
3985  0b1a aeef          	ld	x,#high(L7161)
3986  0b1c cd0000        	call	_displayWriteString
3988                     ; 551 		displayWriteString("2", 			DISPLAY_NULL, 				2, 		39);
3990  0b1f a627          	ld	a,#39
3991  0b21 b704          	ld	_displayWriteString$L+4,a
3992  0b23 a602          	ld	a,#2
3993  0b25 b703          	ld	_displayWriteString$L+3,a
3994  0b27 a6ff          	ld	a,#255
3995  0b29 b702          	ld	_displayWriteString$L+2,a
3996  0b2b a6ed          	ld	a,#low(L1261)
3997  0b2d aeed          	ld	x,#high(L1261)
3998  0b2f cd0000        	call	_displayWriteString
4000                     ; 552 		displayWriteString("3", 			DISPLAY_NULL, 				2, 		61);
4002  0b32 a63d          	ld	a,#61
4003  0b34 b704          	ld	_displayWriteString$L+4,a
4004  0b36 a602          	ld	a,#2
4005  0b38 b703          	ld	_displayWriteString$L+3,a
4006  0b3a a6ff          	ld	a,#255
4007  0b3c b702          	ld	_displayWriteString$L+2,a
4008  0b3e a6eb          	ld	a,#low(L3261)
4009  0b40 aeeb          	ld	x,#high(L3261)
4010  0b42 cd0000        	call	_displayWriteString
4012                     ; 553 		displayWriteString("4", 			DISPLAY_NULL, 				67,		17);
4014  0b45 a611          	ld	a,#17
4015  0b47 b704          	ld	_displayWriteString$L+4,a
4016  0b49 a643          	ld	a,#67
4017  0b4b b703          	ld	_displayWriteString$L+3,a
4018  0b4d a6ff          	ld	a,#255
4019  0b4f b702          	ld	_displayWriteString$L+2,a
4020  0b51 a6e9          	ld	a,#low(L5261)
4021  0b53 aee9          	ld	x,#high(L5261)
4022  0b55 cd0000        	call	_displayWriteString
4024                     ; 554 		displayWriteString("5", 			DISPLAY_NULL, 				67, 	39);
4026  0b58 a627          	ld	a,#39
4027  0b5a b704          	ld	_displayWriteString$L+4,a
4028  0b5c a643          	ld	a,#67
4029  0b5e b703          	ld	_displayWriteString$L+3,a
4030  0b60 a6ff          	ld	a,#255
4031  0b62 b702          	ld	_displayWriteString$L+2,a
4032  0b64 a6e7          	ld	a,#low(L7261)
4033  0b66 aee7          	ld	x,#high(L7261)
4034  0b68 cd0000        	call	_displayWriteString
4036                     ; 555 		displayWriteString("6", 			DISPLAY_NULL, 				67, 	61);
4038  0b6b a63d          	ld	a,#61
4039  0b6d b704          	ld	_displayWriteString$L+4,a
4040  0b6f a643          	ld	a,#67
4041  0b71 b703          	ld	_displayWriteString$L+3,a
4042  0b73 a6ff          	ld	a,#255
4043  0b75 b702          	ld	_displayWriteString$L+2,a
4044  0b77 a6e5          	ld	a,#low(L1361)
4045  0b79 aee5          	ld	x,#high(L1361)
4046  0b7b cd0000        	call	_displayWriteString
4048                     ; 558 		switch(*a_byGroup)
4050  0b7e 92c600        	ld	a,[_window6Menu$L.w]
4052                     ; 613 				break;
4053  0b81 4a            	dec	a
4054  0b82 2715          	jreq	L3551
4055  0b84 4a            	dec	a
4056  0b85 2603          	jrne	L022
4057  0b87 cc0c3f        	jp	L5551
4058  0b8a               L022:
4059  0b8a 4a            	dec	a
4060  0b8b 2603          	jrne	L222
4061  0b8d cc0cbf        	jp	L7551
4062  0b90               L222:
4063  0b90 4a            	dec	a
4064  0b91 2603          	jrne	L422
4065  0b93 cc0d65        	jp	L1651
4066  0b96               L422:
4067  0b96 cc0e54        	jp	L5361
4068  0b99               L3551:
4069                     ; 560 			case MENU_GROUP_FUNCTION:
4069                     ; 561 				displayWriteString("Fasatura", 			DISPLAY_SELECT_FONT_MINI, 	13, 	52);
4071  0b99 a634          	ld	a,#52
4072  0b9b b704          	ld	_displayWriteString$L+4,a
4073  0b9d a60d          	ld	a,#13
4074  0b9f b703          	ld	_displayWriteString$L+3,a
4075  0ba1 a61c          	ld	a,#28
4076  0ba3 b702          	ld	_displayWriteString$L+2,a
4077  0ba5 a6dc          	ld	a,#low(L7361)
4078  0ba7 aedc          	ld	x,#high(L7361)
4079  0ba9 cd0000        	call	_displayWriteString
4081                     ; 562 				displayWriteString("manuale", 			DISPLAY_NULL, 				13, 	61);
4083  0bac a63d          	ld	a,#61
4084  0bae b704          	ld	_displayWriteString$L+4,a
4085  0bb0 a60d          	ld	a,#13
4086  0bb2 b703          	ld	_displayWriteString$L+3,a
4087  0bb4 a6ff          	ld	a,#255
4088  0bb6 b702          	ld	_displayWriteString$L+2,a
4089  0bb8 a60c          	ld	a,#low(L577)
4090  0bba ae0c          	ld	x,#high(L577)
4091  0bbc cd0000        	call	_displayWriteString
4093                     ; 563 				displayWriteString("Fasatura", 			DISPLAY_NULL, 				78, 	9);
4095  0bbf a609          	ld	a,#9
4096  0bc1 b704          	ld	_displayWriteString$L+4,a
4097  0bc3 a64e          	ld	a,#78
4098  0bc5 b703          	ld	_displayWriteString$L+3,a
4099  0bc7 a6ff          	ld	a,#255
4100  0bc9 b702          	ld	_displayWriteString$L+2,a
4101  0bcb a6dc          	ld	a,#low(L7361)
4102  0bcd aedc          	ld	x,#high(L7361)
4103  0bcf cd0000        	call	_displayWriteString
4105                     ; 564 				displayWriteString("automatica", 		DISPLAY_NULL, 				78, 	18);
4107  0bd2 a612          	ld	a,#18
4108  0bd4 b704          	ld	_displayWriteString$L+4,a
4109  0bd6 a64e          	ld	a,#78
4110  0bd8 b703          	ld	_displayWriteString$L+3,a
4111  0bda a6ff          	ld	a,#255
4112  0bdc b702          	ld	_displayWriteString$L+2,a
4113  0bde a6d1          	ld	a,#low(L1461)
4114  0be0 aed1          	ld	x,#high(L1461)
4115  0be2 cd0000        	call	_displayWriteString
4117                     ; 565 				displayWriteString("Fasatura ad", 		DISPLAY_NULL, 				78, 	31);
4119  0be5 a61f          	ld	a,#31
4120  0be7 b704          	ld	_displayWriteString$L+4,a
4121  0be9 a64e          	ld	a,#78
4122  0beb b703          	ld	_displayWriteString$L+3,a
4123  0bed a6ff          	ld	a,#255
4124  0bef b702          	ld	_displayWriteString$L+2,a
4125  0bf1 a6c5          	ld	a,#low(L3461)
4126  0bf3 aec5          	ld	x,#high(L3461)
4127  0bf5 cd0000        	call	_displayWriteString
4129                     ; 566 				displayWriteString("oscilloscop", 		DISPLAY_NULL, 				78, 	40);
4131  0bf8 a628          	ld	a,#40
4132  0bfa b704          	ld	_displayWriteString$L+4,a
4133  0bfc a64e          	ld	a,#78
4134  0bfe b703          	ld	_displayWriteString$L+3,a
4135  0c00 a6ff          	ld	a,#255
4136  0c02 b702          	ld	_displayWriteString$L+2,a
4137  0c04 a6b9          	ld	a,#low(L5461)
4138  0c06 aeb9          	ld	x,#high(L5461)
4139  0c08 cd0000        	call	_displayWriteString
4141                     ; 567 				displayWriteString("Fasatura ad", 		DISPLAY_NULL, 				78, 	52);
4143  0c0b a634          	ld	a,#52
4144  0c0d b704          	ld	_displayWriteString$L+4,a
4145  0c0f a64e          	ld	a,#78
4146  0c11 b703          	ld	_displayWriteString$L+3,a
4147  0c13 a6ff          	ld	a,#255
4148  0c15 b702          	ld	_displayWriteString$L+2,a
4149  0c17 a6c5          	ld	a,#low(L3461)
4150  0c19 aec5          	ld	x,#high(L3461)
4151  0c1b cd0000        	call	_displayWriteString
4153                     ; 568 				displayWriteString("acceleraz", 		DISPLAY_NULL, 				78, 	61);
4155  0c1e a63d          	ld	a,#61
4156  0c20 b704          	ld	_displayWriteString$L+4,a
4157  0c22 a64e          	ld	a,#78
4158  0c24 b703          	ld	_displayWriteString$L+3,a
4159  0c26 a6ff          	ld	a,#255
4160  0c28 b702          	ld	_displayWriteString$L+2,a
4161  0c2a a6af          	ld	a,#low(L7461)
4162  0c2c aeaf          	ld	x,#high(L7461)
4163  0c2e cd0000        	call	_displayWriteString
4165                     ; 569 				windowForceRepaint();
4167  0c31 cd001e        	call	_windowForceRepaint
4169                     ; 570 				_bset(m_woDisplayedWindow, WIN_FUNCTIONS);
4171  0c34 c60001        	ld	a,_m_woDisplayedWindow+1
4172  0c37 aa40          	or	a,#64
4173  0c39 c70001        	ld	_m_woDisplayedWindow+1,a
4174                     ; 571 				break;
4176  0c3c cc0e54        	jp	L5361
4177  0c3f               L5551:
4178                     ; 572 			case MENU_GROUP_PARAMETER:
4178                     ; 573 				displayWriteString("Sviluppo", 			DISPLAY_SELECT_FONT_MINI, 	13, 	9);
4180  0c3f a609          	ld	a,#9
4181  0c41 b704          	ld	_displayWriteString$L+4,a
4182  0c43 a60d          	ld	a,#13
4183  0c45 b703          	ld	_displayWriteString$L+3,a
4184  0c47 a61c          	ld	a,#28
4185  0c49 b702          	ld	_displayWriteString$L+2,a
4186  0c4b a6a6          	ld	a,#low(L1561)
4187  0c4d aea6          	ld	x,#high(L1561)
4188  0c4f cd0000        	call	_displayWriteString
4190                     ; 574 				displayWriteString("cilindro", 			DISPLAY_NULL, 				13, 	18);
4192  0c52 a612          	ld	a,#18
4193  0c54 b704          	ld	_displayWriteString$L+4,a
4194  0c56 a60d          	ld	a,#13
4195  0c58 b703          	ld	_displayWriteString$L+3,a
4196  0c5a a6ff          	ld	a,#255
4197  0c5c b702          	ld	_displayWriteString$L+2,a
4198  0c5e a69d          	ld	a,#low(L3561)
4199  0c60 ae9d          	ld	x,#high(L3561)
4200  0c62 cd0000        	call	_displayWriteString
4202                     ; 575 				displayWriteString("Soglia", 			DISPLAY_NULL, 				13, 	31);
4204  0c65 a61f          	ld	a,#31
4205  0c67 b704          	ld	_displayWriteString$L+4,a
4206  0c69 a60d          	ld	a,#13
4207  0c6b b703          	ld	_displayWriteString$L+3,a
4208  0c6d a6ff          	ld	a,#255
4209  0c6f b702          	ld	_displayWriteString$L+2,a
4210  0c71 a696          	ld	a,#low(L5561)
4211  0c73 ae96          	ld	x,#high(L5561)
4212  0c75 cd0000        	call	_displayWriteString
4214                     ; 576 				displayWriteString("allarme", 			DISPLAY_NULL, 				13, 	40);
4216  0c78 a628          	ld	a,#40
4217  0c7a b704          	ld	_displayWriteString$L+4,a
4218  0c7c a60d          	ld	a,#13
4219  0c7e b703          	ld	_displayWriteString$L+3,a
4220  0c80 a6ff          	ld	a,#255
4221  0c82 b702          	ld	_displayWriteString$L+2,a
4222  0c84 a68e          	ld	a,#low(L7561)
4223  0c86 ae8e          	ld	x,#high(L7561)
4224  0c88 cd0000        	call	_displayWriteString
4226                     ; 577 				displayWriteString("Ampiezza", 			DISPLAY_NULL, 				13, 	52);
4228  0c8b a634          	ld	a,#52
4229  0c8d b704          	ld	_displayWriteString$L+4,a
4230  0c8f a60d          	ld	a,#13
4231  0c91 b703          	ld	_displayWriteString$L+3,a
4232  0c93 a6ff          	ld	a,#255
4233  0c95 b702          	ld	_displayWriteString$L+2,a
4234  0c97 a685          	ld	a,#low(L1661)
4235  0c99 ae85          	ld	x,#high(L1661)
4236  0c9b cd0000        	call	_displayWriteString
4238                     ; 578 				displayWriteString("gate", 				DISPLAY_NULL, 				13, 	61);
4240  0c9e a63d          	ld	a,#61
4241  0ca0 b704          	ld	_displayWriteString$L+4,a
4242  0ca2 a60d          	ld	a,#13
4243  0ca4 b703          	ld	_displayWriteString$L+3,a
4244  0ca6 a6ff          	ld	a,#255
4245  0ca8 b702          	ld	_displayWriteString$L+2,a
4246  0caa a680          	ld	a,#low(L3661)
4247  0cac ae80          	ld	x,#high(L3661)
4248  0cae cd0000        	call	_displayWriteString
4250                     ; 579 				windowForceRepaint();
4252  0cb1 cd001e        	call	_windowForceRepaint
4254                     ; 580 				_bset(m_woDisplayedWindow, WIN_PARAMETERS);
4256  0cb4 c60001        	ld	a,_m_woDisplayedWindow+1
4257  0cb7 aa80          	or	a,#128
4258  0cb9 c70001        	ld	_m_woDisplayedWindow+1,a
4259                     ; 581 				break;
4261  0cbc cc0e54        	jp	L5361
4262  0cbf               L7551:
4263                     ; 582 			case MENU_GROUP_TEST:
4263                     ; 583 				displayWriteString("Test", 				DISPLAY_SELECT_FONT_MINI, 	13, 	9);
4265  0cbf a609          	ld	a,#9
4266  0cc1 b704          	ld	_displayWriteString$L+4,a
4267  0cc3 a60d          	ld	a,#13
4268  0cc5 b703          	ld	_displayWriteString$L+3,a
4269  0cc7 a61c          	ld	a,#28
4270  0cc9 b702          	ld	_displayWriteString$L+2,a
4271  0ccb a67b          	ld	a,#low(L5661)
4272  0ccd ae7b          	ld	x,#high(L5661)
4273  0ccf cd0000        	call	_displayWriteString
4275                     ; 584 				displayWriteString("testina", 			DISPLAY_NULL, 				13, 	18);
4277  0cd2 a612          	ld	a,#18
4278  0cd4 b704          	ld	_displayWriteString$L+4,a
4279  0cd6 a60d          	ld	a,#13
4280  0cd8 b703          	ld	_displayWriteString$L+3,a
4281  0cda a6ff          	ld	a,#255
4282  0cdc b702          	ld	_displayWriteString$L+2,a
4283  0cde a673          	ld	a,#low(L7661)
4284  0ce0 ae73          	ld	x,#high(L7661)
4285  0ce2 cd0000        	call	_displayWriteString
4287                     ; 585 				displayWriteString("Test", 				DISPLAY_NULL, 				13, 	31);
4289  0ce5 a61f          	ld	a,#31
4290  0ce7 b704          	ld	_displayWriteString$L+4,a
4291  0ce9 a60d          	ld	a,#13
4292  0ceb b703          	ld	_displayWriteString$L+3,a
4293  0ced a6ff          	ld	a,#255
4294  0cef b702          	ld	_displayWriteString$L+2,a
4295  0cf1 a67b          	ld	a,#low(L5661)
4296  0cf3 ae7b          	ld	x,#high(L5661)
4297  0cf5 cd0000        	call	_displayWriteString
4299                     ; 586 				displayWriteString("encoder", 			DISPLAY_NULL, 				13, 	40);
4301  0cf8 a628          	ld	a,#40
4302  0cfa b704          	ld	_displayWriteString$L+4,a
4303  0cfc a60d          	ld	a,#13
4304  0cfe b703          	ld	_displayWriteString$L+3,a
4305  0d00 a6ff          	ld	a,#255
4306  0d02 b702          	ld	_displayWriteString$L+2,a
4307  0d04 a66b          	ld	a,#low(L1761)
4308  0d06 ae6b          	ld	x,#high(L1761)
4309  0d08 cd0000        	call	_displayWriteString
4311                     ; 587 				displayWriteString("Distanza", 			DISPLAY_NULL, 				13, 	52);
4313  0d0b a634          	ld	a,#52
4314  0d0d b704          	ld	_displayWriteString$L+4,a
4315  0d0f a60d          	ld	a,#13
4316  0d11 b703          	ld	_displayWriteString$L+3,a
4317  0d13 a6ff          	ld	a,#255
4318  0d15 b702          	ld	_displayWriteString$L+2,a
4319  0d17 a662          	ld	a,#low(L3761)
4320  0d19 ae62          	ld	x,#high(L3761)
4321  0d1b cd0000        	call	_displayWriteString
4323                     ; 588 				displayWriteString("su offset", 		DISPLAY_NULL, 				13, 	61);
4325  0d1e a63d          	ld	a,#61
4326  0d20 b704          	ld	_displayWriteString$L+4,a
4327  0d22 a60d          	ld	a,#13
4328  0d24 b703          	ld	_displayWriteString$L+3,a
4329  0d26 a6ff          	ld	a,#255
4330  0d28 b702          	ld	_displayWriteString$L+2,a
4331  0d2a a658          	ld	a,#low(L5761)
4332  0d2c ae58          	ld	x,#high(L5761)
4333  0d2e cd0000        	call	_displayWriteString
4335                     ; 589 				displayWriteString("Versione", 			DISPLAY_NULL, 				78, 	9);
4337  0d31 a609          	ld	a,#9
4338  0d33 b704          	ld	_displayWriteString$L+4,a
4339  0d35 a64e          	ld	a,#78
4340  0d37 b703          	ld	_displayWriteString$L+3,a
4341  0d39 a6ff          	ld	a,#255
4342  0d3b b702          	ld	_displayWriteString$L+2,a
4343  0d3d a64f          	ld	a,#low(L7761)
4344  0d3f ae4f          	ld	x,#high(L7761)
4345  0d41 cd0000        	call	_displayWriteString
4347                     ; 590 				displayWriteString("Software", 			DISPLAY_NULL, 				78, 	18);
4349  0d44 a612          	ld	a,#18
4350  0d46 b704          	ld	_displayWriteString$L+4,a
4351  0d48 a64e          	ld	a,#78
4352  0d4a b703          	ld	_displayWriteString$L+3,a
4353  0d4c a6ff          	ld	a,#255
4354  0d4e b702          	ld	_displayWriteString$L+2,a
4355  0d50 a646          	ld	a,#low(L1071)
4356  0d52 ae46          	ld	x,#high(L1071)
4357  0d54 cd0000        	call	_displayWriteString
4359                     ; 595 				windowForceRepaint();
4361  0d57 cd001e        	call	_windowForceRepaint
4363                     ; 596 				_bset(m_woDisplayedWindow, WIN_TESTS);
4365  0d5a c60000        	ld	a,_m_woDisplayedWindow
4366  0d5d aa01          	or	a,#1
4367  0d5f c70000        	ld	_m_woDisplayedWindow,a
4368                     ; 597 				break;
4370  0d62 cc0e54        	jp	L5361
4371  0d65               L1651:
4372                     ; 598 			case MENU_GROUP_MENU:
4372                     ; 599 				displayWriteString("Visual",			DISPLAY_SELECT_FONT_MINI, 	13, 	9);
4374  0d65 a609          	ld	a,#9
4375  0d67 b704          	ld	_displayWriteString$L+4,a
4376  0d69 a60d          	ld	a,#13
4377  0d6b b703          	ld	_displayWriteString$L+3,a
4378  0d6d a61c          	ld	a,#28
4379  0d6f b702          	ld	_displayWriteString$L+2,a
4380  0d71 a63f          	ld	a,#low(L3071)
4381  0d73 ae3f          	ld	x,#high(L3071)
4382  0d75 cd0000        	call	_displayWriteString
4384                     ; 600 				displayWriteString("Registro", 			DISPLAY_NULL, 				13, 	18);
4386  0d78 a612          	ld	a,#18
4387  0d7a b704          	ld	_displayWriteString$L+4,a
4388  0d7c a60d          	ld	a,#13
4389  0d7e b703          	ld	_displayWriteString$L+3,a
4390  0d80 a6ff          	ld	a,#255
4391  0d82 b702          	ld	_displayWriteString$L+2,a
4392  0d84 a636          	ld	a,#low(L5071)
4393  0d86 ae36          	ld	x,#high(L5071)
4394  0d88 cd0000        	call	_displayWriteString
4396                     ; 601 				displayWriteString("Visual", 			DISPLAY_NULL, 				13, 	31);
4398  0d8b a61f          	ld	a,#31
4399  0d8d b704          	ld	_displayWriteString$L+4,a
4400  0d8f a60d          	ld	a,#13
4401  0d91 b703          	ld	_displayWriteString$L+3,a
4402  0d93 a6ff          	ld	a,#255
4403  0d95 b702          	ld	_displayWriteString$L+2,a
4404  0d97 a63f          	ld	a,#low(L3071)
4405  0d99 ae3f          	ld	x,#high(L3071)
4406  0d9b cd0000        	call	_displayWriteString
4408                     ; 602 				displayWriteString("Oscilloscop", 		DISPLAY_NULL, 				13, 	40);
4410  0d9e a628          	ld	a,#40
4411  0da0 b704          	ld	_displayWriteString$L+4,a
4412  0da2 a60d          	ld	a,#13
4413  0da4 b703          	ld	_displayWriteString$L+3,a
4414  0da6 a6ff          	ld	a,#255
4415  0da8 b702          	ld	_displayWriteString$L+2,a
4416  0daa a62a          	ld	a,#low(L7071)
4417  0dac ae2a          	ld	x,#high(L7071)
4418  0dae cd0000        	call	_displayWriteString
4420                     ; 603 				displayWriteString("Archivio", 			DISPLAY_NULL, 				13, 	52);
4422  0db1 a634          	ld	a,#52
4423  0db3 b704          	ld	_displayWriteString$L+4,a
4424  0db5 a60d          	ld	a,#13
4425  0db7 b703          	ld	_displayWriteString$L+3,a
4426  0db9 a6ff          	ld	a,#255
4427  0dbb b702          	ld	_displayWriteString$L+2,a
4428  0dbd a621          	ld	a,#low(L1171)
4429  0dbf ae21          	ld	x,#high(L1171)
4430  0dc1 cd0000        	call	_displayWriteString
4432                     ; 604 				displayWriteString("Lavori", 			DISPLAY_NULL, 				13, 	61);
4434  0dc4 a63d          	ld	a,#61
4435  0dc6 b704          	ld	_displayWriteString$L+4,a
4436  0dc8 a60d          	ld	a,#13
4437  0dca b703          	ld	_displayWriteString$L+3,a
4438  0dcc a6ff          	ld	a,#255
4439  0dce b702          	ld	_displayWriteString$L+2,a
4440  0dd0 a61a          	ld	a,#low(L3171)
4441  0dd2 ae1a          	ld	x,#high(L3171)
4442  0dd4 cd0000        	call	_displayWriteString
4444                     ; 605 				displayWriteString("Funzioni", 			DISPLAY_NULL, 				78, 	9);
4446  0dd7 a609          	ld	a,#9
4447  0dd9 b704          	ld	_displayWriteString$L+4,a
4448  0ddb a64e          	ld	a,#78
4449  0ddd b703          	ld	_displayWriteString$L+3,a
4450  0ddf a6ff          	ld	a,#255
4451  0de1 b702          	ld	_displayWriteString$L+2,a
4452  0de3 a611          	ld	a,#low(L5171)
4453  0de5 ae11          	ld	x,#high(L5171)
4454  0de7 cd0000        	call	_displayWriteString
4456                     ; 606 				displayWriteString("", 					DISPLAY_NULL, 				78, 	18);
4458  0dea a612          	ld	a,#18
4459  0dec b704          	ld	_displayWriteString$L+4,a
4460  0dee a64e          	ld	a,#78
4461  0df0 b703          	ld	_displayWriteString$L+3,a
4462  0df2 a6ff          	ld	a,#255
4463  0df4 b702          	ld	_displayWriteString$L+2,a
4464  0df6 a610          	ld	a,#low(L7171)
4465  0df8 ae10          	ld	x,#high(L7171)
4466  0dfa cd0000        	call	_displayWriteString
4468                     ; 607 				displayWriteString("Parametri", 		DISPLAY_NULL, 				78, 	31);
4470  0dfd a61f          	ld	a,#31
4471  0dff b704          	ld	_displayWriteString$L+4,a
4472  0e01 a64e          	ld	a,#78
4473  0e03 b703          	ld	_displayWriteString$L+3,a
4474  0e05 a6ff          	ld	a,#255
4475  0e07 b702          	ld	_displayWriteString$L+2,a
4476  0e09 a606          	ld	a,#low(L1271)
4477  0e0b ae06          	ld	x,#high(L1271)
4478  0e0d cd0000        	call	_displayWriteString
4480                     ; 608 				displayWriteString("", 					DISPLAY_NULL, 				78, 	40);
4482  0e10 a628          	ld	a,#40
4483  0e12 b704          	ld	_displayWriteString$L+4,a
4484  0e14 a64e          	ld	a,#78
4485  0e16 b703          	ld	_displayWriteString$L+3,a
4486  0e18 a6ff          	ld	a,#255
4487  0e1a b702          	ld	_displayWriteString$L+2,a
4488  0e1c a610          	ld	a,#low(L7171)
4489  0e1e ae10          	ld	x,#high(L7171)
4490  0e20 cd0000        	call	_displayWriteString
4492                     ; 609 				displayWriteString("Tests", 			DISPLAY_NULL, 				78, 	52);
4494  0e23 a634          	ld	a,#52
4495  0e25 b704          	ld	_displayWriteString$L+4,a
4496  0e27 a64e          	ld	a,#78
4497  0e29 b703          	ld	_displayWriteString$L+3,a
4498  0e2b a6ff          	ld	a,#255
4499  0e2d b702          	ld	_displayWriteString$L+2,a
4500  0e2f a600          	ld	a,#low(L3271)
4501  0e31 ae00          	ld	x,#high(L3271)
4502  0e33 cd0000        	call	_displayWriteString
4504                     ; 610 				displayWriteString("", 					DISPLAY_NULL, 				78, 	61);
4506  0e36 a63d          	ld	a,#61
4507  0e38 b704          	ld	_displayWriteString$L+4,a
4508  0e3a a64e          	ld	a,#78
4509  0e3c b703          	ld	_displayWriteString$L+3,a
4510  0e3e a6ff          	ld	a,#255
4511  0e40 b702          	ld	_displayWriteString$L+2,a
4512  0e42 a610          	ld	a,#low(L7171)
4513  0e44 ae10          	ld	x,#high(L7171)
4514  0e46 cd0000        	call	_displayWriteString
4516                     ; 611 				windowForceRepaint();
4518  0e49 cd001e        	call	_windowForceRepaint
4520                     ; 612 				_bset(m_woDisplayedWindow, WIN_MENUS);
4522  0e4c c60000        	ld	a,_m_woDisplayedWindow
4523  0e4f aa02          	or	a,#2
4524  0e51 c70000        	ld	_m_woDisplayedWindow,a
4525                     ; 613 				break;
4527  0e54               L5361:
4528                     ; 616 		displaySetOutLine(0, 	0, 	63, 	20, 	(*a_bySelected == 1));
4530  0e54 92c602        	ld	a,[_window6Menu$L+2.w]
4531  0e57 a101          	cp	a,#1
4532  0e59 2604          	jrne	L441
4533  0e5b a601          	ld	a,#1
4534  0e5d 2001          	jra	L641
4535  0e5f               L441:
4536  0e5f 4f            	clr	a
4537  0e60               L641:
4538  0e60 b704          	ld	_displaySetOutLine$L+4,a
4539  0e62 a614          	ld	a,#20
4540  0e64 b703          	ld	_displaySetOutLine$L+3,a
4541  0e66 a63f          	ld	a,#63
4542  0e68 b702          	ld	_displaySetOutLine$L+2,a
4543  0e6a 4f            	clr	a
4544  0e6b 5f            	clr	x
4545  0e6c cd0000        	call	_displaySetOutLine
4547                     ; 617 		displaySetOutLine(0, 	22, 63, 	42, 	(*a_bySelected == 2));
4549  0e6f 92c602        	ld	a,[_window6Menu$L+2.w]
4550  0e72 a102          	cp	a,#2
4551  0e74 2604          	jrne	L051
4552  0e76 a601          	ld	a,#1
4553  0e78 2001          	jra	L251
4554  0e7a               L051:
4555  0e7a 4f            	clr	a
4556  0e7b               L251:
4557  0e7b b704          	ld	_displaySetOutLine$L+4,a
4558  0e7d a62a          	ld	a,#42
4559  0e7f b703          	ld	_displaySetOutLine$L+3,a
4560  0e81 a63f          	ld	a,#63
4561  0e83 b702          	ld	_displaySetOutLine$L+2,a
4562  0e85 a616          	ld	a,#22
4563  0e87 5f            	clr	x
4564  0e88 cd0000        	call	_displaySetOutLine
4566                     ; 618 		displaySetOutLine(0, 	44, 63, 	64, 	(*a_bySelected == 3));
4568  0e8b 92c602        	ld	a,[_window6Menu$L+2.w]
4569  0e8e a103          	cp	a,#3
4570  0e90 2604          	jrne	L451
4571  0e92 a601          	ld	a,#1
4572  0e94 2001          	jra	L651
4573  0e96               L451:
4574  0e96 4f            	clr	a
4575  0e97               L651:
4576  0e97 b704          	ld	_displaySetOutLine$L+4,a
4577  0e99 a640          	ld	a,#64
4578  0e9b b703          	ld	_displaySetOutLine$L+3,a
4579  0e9d a63f          	ld	a,#63
4580  0e9f b702          	ld	_displaySetOutLine$L+2,a
4581  0ea1 a62c          	ld	a,#44
4582  0ea3 5f            	clr	x
4583  0ea4 cd0000        	call	_displaySetOutLine
4585                     ; 619 		displaySetOutLine(65, 	0, 	126, 	20, 	(*a_bySelected == 4));
4587  0ea7 92c602        	ld	a,[_window6Menu$L+2.w]
4588  0eaa a104          	cp	a,#4
4589  0eac 2604          	jrne	L061
4590  0eae a601          	ld	a,#1
4591  0eb0 2001          	jra	L261
4592  0eb2               L061:
4593  0eb2 4f            	clr	a
4594  0eb3               L261:
4595  0eb3 b704          	ld	_displaySetOutLine$L+4,a
4596  0eb5 a614          	ld	a,#20
4597  0eb7 b703          	ld	_displaySetOutLine$L+3,a
4598  0eb9 a67e          	ld	a,#126
4599  0ebb b702          	ld	_displaySetOutLine$L+2,a
4600  0ebd 4f            	clr	a
4601  0ebe ae41          	ld	x,#65
4602  0ec0 cd0000        	call	_displaySetOutLine
4604                     ; 620 		displaySetOutLine(65, 	22, 126, 	42, 	(*a_bySelected == 5));
4606  0ec3 92c602        	ld	a,[_window6Menu$L+2.w]
4607  0ec6 a105          	cp	a,#5
4608  0ec8 2604          	jrne	L461
4609  0eca a601          	ld	a,#1
4610  0ecc 2001          	jra	L661
4611  0ece               L461:
4612  0ece 4f            	clr	a
4613  0ecf               L661:
4614  0ecf b704          	ld	_displaySetOutLine$L+4,a
4615  0ed1 a62a          	ld	a,#42
4616  0ed3 b703          	ld	_displaySetOutLine$L+3,a
4617  0ed5 a67e          	ld	a,#126
4618  0ed7 b702          	ld	_displaySetOutLine$L+2,a
4619  0ed9 a616          	ld	a,#22
4620  0edb ae41          	ld	x,#65
4621  0edd cd0000        	call	_displaySetOutLine
4623                     ; 621 		displaySetOutLine(65, 	44,	126, 	64, 	(*a_bySelected == 6));
4625  0ee0 92c602        	ld	a,[_window6Menu$L+2.w]
4626  0ee3 a106          	cp	a,#6
4627  0ee5 2604          	jrne	L071
4628  0ee7 a601          	ld	a,#1
4629  0ee9 2001          	jra	L271
4630  0eeb               L071:
4631  0eeb 4f            	clr	a
4632  0eec               L271:
4633  0eec b704          	ld	_displaySetOutLine$L+4,a
4634  0eee a640          	ld	a,#64
4635  0ef0 b703          	ld	_displaySetOutLine$L+3,a
4636  0ef2 a67e          	ld	a,#126
4637  0ef4 b702          	ld	_displaySetOutLine$L+2,a
4638  0ef6 a62c          	ld	a,#44
4639  0ef8 ae41          	ld	x,#65
4640  0efa cd0000        	call	_displaySetOutLine
4643  0efd cc0fd2        	jp	L5271
4644  0f00               L5061:
4645                     ; 626 		if ((*a_bySelected == 1) || parametersGetValue(PARAM_PAGE_SEL) == 1)
4647  0f00 92c602        	ld	a,[_window6Menu$L+2.w]
4648  0f03 a101          	cp	a,#1
4649  0f05 270d          	jreq	L1371
4651  0f07 a605          	ld	a,#5
4652  0f09 cd0000        	call	_parametersGetValue
4654  0f0c a101          	cp	a,#1
4655  0f0e 2602          	jrne	L471
4656  0f10 a300          	cp	x,#0
4657  0f12               L471:
4658  0f12 260f          	jrne	L7271
4659  0f14               L1371:
4660                     ; 627 			displayInvertArea(1, 	1, 	62, 	19);
4662  0f14 a613          	ld	a,#19
4663  0f16 b703          	ld	_displayInvertArea$L+3,a
4664  0f18 a63e          	ld	a,#62
4665  0f1a b702          	ld	_displayInvertArea$L+2,a
4666  0f1c a601          	ld	a,#1
4667  0f1e ae01          	ld	x,#1
4668  0f20 cd0000        	call	_displayInvertArea
4670  0f23               L7271:
4671                     ; 629 		if ((*a_bySelected == 2) || parametersGetValue(PARAM_PAGE_SEL) == 2)
4673  0f23 92c602        	ld	a,[_window6Menu$L+2.w]
4674  0f26 a102          	cp	a,#2
4675  0f28 270d          	jreq	L5371
4677  0f2a a605          	ld	a,#5
4678  0f2c cd0000        	call	_parametersGetValue
4680  0f2f a102          	cp	a,#2
4681  0f31 2602          	jrne	L671
4682  0f33 a300          	cp	x,#0
4683  0f35               L671:
4684  0f35 260f          	jrne	L3371
4685  0f37               L5371:
4686                     ; 630 			displayInvertArea(1, 	23, 62, 	41);
4688  0f37 a629          	ld	a,#41
4689  0f39 b703          	ld	_displayInvertArea$L+3,a
4690  0f3b a63e          	ld	a,#62
4691  0f3d b702          	ld	_displayInvertArea$L+2,a
4692  0f3f a617          	ld	a,#23
4693  0f41 ae01          	ld	x,#1
4694  0f43 cd0000        	call	_displayInvertArea
4696  0f46               L3371:
4697                     ; 632 		if ((*a_bySelected == 3) || parametersGetValue(PARAM_PAGE_SEL) == 3)
4699  0f46 92c602        	ld	a,[_window6Menu$L+2.w]
4700  0f49 a103          	cp	a,#3
4701  0f4b 270d          	jreq	L1471
4703  0f4d a605          	ld	a,#5
4704  0f4f cd0000        	call	_parametersGetValue
4706  0f52 a103          	cp	a,#3
4707  0f54 2602          	jrne	L002
4708  0f56 a300          	cp	x,#0
4709  0f58               L002:
4710  0f58 260f          	jrne	L7371
4711  0f5a               L1471:
4712                     ; 633 			displayInvertArea(1, 	45, 62, 	63);
4714  0f5a a63f          	ld	a,#63
4715  0f5c b703          	ld	_displayInvertArea$L+3,a
4716  0f5e a63e          	ld	a,#62
4717  0f60 b702          	ld	_displayInvertArea$L+2,a
4718  0f62 a62d          	ld	a,#45
4719  0f64 ae01          	ld	x,#1
4720  0f66 cd0000        	call	_displayInvertArea
4722  0f69               L7371:
4723                     ; 635 		if ((*a_bySelected == 4) || parametersGetValue(PARAM_PAGE_SEL) == 4)
4725  0f69 92c602        	ld	a,[_window6Menu$L+2.w]
4726  0f6c a104          	cp	a,#4
4727  0f6e 270d          	jreq	L5471
4729  0f70 a605          	ld	a,#5
4730  0f72 cd0000        	call	_parametersGetValue
4732  0f75 a104          	cp	a,#4
4733  0f77 2602          	jrne	L202
4734  0f79 a300          	cp	x,#0
4735  0f7b               L202:
4736  0f7b 260f          	jrne	L3471
4737  0f7d               L5471:
4738                     ; 636 			displayInvertArea(66, 	1, 	125, 	19);
4740  0f7d a613          	ld	a,#19
4741  0f7f b703          	ld	_displayInvertArea$L+3,a
4742  0f81 a67d          	ld	a,#125
4743  0f83 b702          	ld	_displayInvertArea$L+2,a
4744  0f85 a601          	ld	a,#1
4745  0f87 ae42          	ld	x,#66
4746  0f89 cd0000        	call	_displayInvertArea
4748  0f8c               L3471:
4749                     ; 638 		if ((*a_bySelected == 5) || parametersGetValue(PARAM_PAGE_SEL) == 5)
4751  0f8c 92c602        	ld	a,[_window6Menu$L+2.w]
4752  0f8f a105          	cp	a,#5
4753  0f91 270d          	jreq	L1571
4755  0f93 a605          	ld	a,#5
4756  0f95 cd0000        	call	_parametersGetValue
4758  0f98 a105          	cp	a,#5
4759  0f9a 2602          	jrne	L402
4760  0f9c a300          	cp	x,#0
4761  0f9e               L402:
4762  0f9e 260f          	jrne	L7471
4763  0fa0               L1571:
4764                     ; 639 			displayInvertArea(66, 	23, 125, 	41);
4766  0fa0 a629          	ld	a,#41
4767  0fa2 b703          	ld	_displayInvertArea$L+3,a
4768  0fa4 a67d          	ld	a,#125
4769  0fa6 b702          	ld	_displayInvertArea$L+2,a
4770  0fa8 a617          	ld	a,#23
4771  0faa ae42          	ld	x,#66
4772  0fac cd0000        	call	_displayInvertArea
4774  0faf               L7471:
4775                     ; 641 		if ((*a_bySelected == 6) || parametersGetValue(PARAM_PAGE_SEL) == 6)
4777  0faf 92c602        	ld	a,[_window6Menu$L+2.w]
4778  0fb2 a106          	cp	a,#6
4779  0fb4 270d          	jreq	L5571
4781  0fb6 a605          	ld	a,#5
4782  0fb8 cd0000        	call	_parametersGetValue
4784  0fbb a106          	cp	a,#6
4785  0fbd 2602          	jrne	L602
4786  0fbf a300          	cp	x,#0
4787  0fc1               L602:
4788  0fc1 260f          	jrne	L5271
4789  0fc3               L5571:
4790                     ; 642 			displayInvertArea(66, 	45,	125, 	63);
4792  0fc3 a63f          	ld	a,#63
4793  0fc5 b703          	ld	_displayInvertArea$L+3,a
4794  0fc7 a67d          	ld	a,#125
4795  0fc9 b702          	ld	_displayInvertArea$L+2,a
4796  0fcb a62d          	ld	a,#45
4797  0fcd ae42          	ld	x,#66
4798  0fcf cd0000        	call	_displayInvertArea
4800  0fd2               L5271:
4801                     ; 645 	parametersSet(PARAM_PAGE_SEL, *a_bySelected);	
4803  0fd2 92c602        	ld	a,[_window6Menu$L+2.w]
4804  0fd5 5f            	clr	x
4805  0fd6 b702          	ld	_parametersSet$L+2,a
4806  0fd8 bf01          	ld	_parametersSet$L+1,x
4807  0fda a605          	ld	a,#5
4808  0fdc cd0000        	call	_parametersSet
4810                     ; 646 }
4813  0fdf 81            	ret
4836                     ; 649 void windowSetupParameter(void)
4836                     ; 650 {
4837                     	switch	.text
4838  0fe0               _windowSetupParameter:
4841                     ; 652 }
4844  0fe0 81            	ret
4887                     	xdef	_windowSetupParameter
4888                     	xdef	_windowIsInGate
4889                     	xdef	_windowOscilloscopeGetValue
4890                     	xdef	_windowRegisterPrepareFormateValue
4891                     	switch	.bss
4892  0000               _m_woDisplayedWindow:
4893  0000 0000          	ds.b	2
4894                     	xdef	_m_woDisplayedWindow
4895  0002               _m_byCurrentSelectorX:
4896  0002 00            	ds.b	1
4897                     	xdef	_m_byCurrentSelectorX
4898  0003               _m_woRegisterValue:
4899  0003 0000          	ds.b	2
4900                     	xdef	_m_woRegisterValue
4901                     	xref	_m_woEncoderGateWidth
4902                     	xref	_m_woEncoderGateEnd
4903                     	xref	_m_woEncoderGateStart
4904                     	xref	_m_arbyScanningHeadSignal
4905                     	xref	_m_arbyDisplayCommand
4906                     	xdef	_window6Menu
4907                     	xdef	_windowForceRepaint
4908                     	xdef	_windowRegister
4909                     	xdef	_windowOscilloscope
4910                     	xdef	_windowAlarm
4911                     	xdef	_windowBigMessage
4912                     	xdef	_windowMessage
4913                     	xdef	_windowSpeed
4914                     	xdef	_windowMode
4915                     	xdef	_windowInit
4916                     	xref	_formatNumber
4917                     	xref	_displayDrawBox
4918                     	xref	_displayDrawAlarm
4919                     	xref	_displayDrawCorrection
4920                     	xref	_displayDrawSelector
4921                     	xref	_displayDrawHorizontalLine
4922                     	xref	_displayDrawVerticalLine
4923                     	xref	_displayInvertArea
4924                     	xref	_displaySetOutLine
4925                     	xref	_displayClearArea
4926                     	xref	_displayWriteString
4927                     	xref	_displayIsKeyPress
4928                     	xref	_displayCmdToDisplay
4929                     	xref	_parametersIsChanged
4930                     	xref	_parametersChangedFlagReset
4931                     	xref	_parametersSet
4932                     	xref	_parametersGetValue
4933                     .const:	section	.text
4934  0000               L3271:
4935  0000 546573747300  	dc.b	"Tests",0
4936  0006               L1271:
4937  0006 506172616d65  	dc.b	"Parametri",0
4938  0010               L7171:
4939  0010 00            	dc.b	0
4940  0011               L5171:
4941  0011 46756e7a696f  	dc.b	"Funzioni",0
4942  001a               L3171:
4943  001a 4c61766f7269  	dc.b	"Lavori",0
4944  0021               L1171:
4945  0021 417263686976  	dc.b	"Archivio",0
4946  002a               L7071:
4947  002a 4f7363696c6c  	dc.b	"Oscilloscop",0
4948  0036               L5071:
4949  0036 526567697374  	dc.b	"Registro",0
4950  003f               L3071:
4951  003f 56697375616c  	dc.b	"Visual",0
4952  0046               L1071:
4953  0046 536f66747761  	dc.b	"Software",0
4954  004f               L7761:
4955  004f 56657273696f  	dc.b	"Versione",0
4956  0058               L5761:
4957  0058 7375206f6666  	dc.b	"su offset",0
4958  0062               L3761:
4959  0062 44697374616e  	dc.b	"Distanza",0
4960  006b               L1761:
4961  006b 656e636f6465  	dc.b	"encoder",0
4962  0073               L7661:
4963  0073 74657374696e  	dc.b	"testina",0
4964  007b               L5661:
4965  007b 5465737400    	dc.b	"Test",0
4966  0080               L3661:
4967  0080 6761746500    	dc.b	"gate",0
4968  0085               L1661:
4969  0085 416d7069657a  	dc.b	"Ampiezza",0
4970  008e               L7561:
4971  008e 616c6c61726d  	dc.b	"allarme",0
4972  0096               L5561:
4973  0096 536f676c6961  	dc.b	"Soglia",0
4974  009d               L3561:
4975  009d 63696c696e64  	dc.b	"cilindro",0
4976  00a6               L1561:
4977  00a6 5376696c7570  	dc.b	"Sviluppo",0
4978  00af               L7461:
4979  00af 616363656c65  	dc.b	"acceleraz",0
4980  00b9               L5461:
4981  00b9 6f7363696c6c  	dc.b	"oscilloscop",0
4982  00c5               L3461:
4983  00c5 466173617475  	dc.b	"Fasatura ad",0
4984  00d1               L1461:
4985  00d1 6175746f6d61  	dc.b	"automatica",0
4986  00dc               L7361:
4987  00dc 466173617475  	dc.b	"Fasatura",0
4988  00e5               L1361:
4989  00e5 3600          	dc.b	"6",0
4990  00e7               L7261:
4991  00e7 3500          	dc.b	"5",0
4992  00e9               L5261:
4993  00e9 3400          	dc.b	"4",0
4994  00eb               L3261:
4995  00eb 3300          	dc.b	"3",0
4996  00ed               L1261:
4997  00ed 3200          	dc.b	"2",0
4998  00ef               L7161:
4999  00ef 3100          	dc.b	"1",0
5000  00f1               L7351:
5001  00f1 40a00000      	dc.w	16544,0
5002  00f5               L7251:
5003  00f5 42640000      	dc.w	16996,0
5004  00f9               L7151:
5005  00f9 3f800000      	dc.w	16256,0
5006  00fd               L7051:
5007  00fd 2b00          	dc.b	"+",0
5008  00ff               L5051:
5009  00ff 2d00          	dc.b	"-",0
5010  0101               L1051:
5011  0101 42c80000      	dc.w	17096,0
5012  0105               L1741:
5013  0105 47000000      	dc.w	18176,0
5014  0109               L7541:
5015  0109 726567697374  	dc.b	"registro:",0
5016  0113               L7331:
5017  0113 54616a205363  	dc.b	"Taj Scope:",0
5018  011e               L5711:
5019  011e 6e6f6e207269  	dc.b	"non riconosciuto",0
5020  012f               L3711:
5021  012f 436f64696365  	dc.b	"Codice allarme",0
5022  013e               L7611:
5023  013e 4e657373756e  	dc.b	"Nessun problema!",0
5024  014f               L1611:
5025  014f 416d7069657a  	dc.b	"Ampiezza Gate (P3)",0
5026  0162               L3511:
5027  0162 6e6f6e206163  	dc.b	"non accettabile",0
5028  0172               L1511:
5029  0172 5376696c7570  	dc.b	"Sviluppo Cilindro "
5030  0184 2850312900    	dc.b	"(P1)",0
5031  0189               L3411:
5032  0189 66616c6c6974  	dc.b	"fallita",0
5033  0191               L1411:
5034  0191 466173617475  	dc.b	"Fasatura automatic"
5035  01a3 6100          	dc.b	"a",0
5036  01a5               L3311:
5037  01a5 546573742065  	dc.b	"Test encoder",0
5038  01b2               L5211:
5039  01b2 66616c6c6974  	dc.b	"fallito",0
5040  01ba               L3211:
5041  01ba 546573742074  	dc.b	"Test testina",0
5042  01c7               L5111:
5043  01c7 56656c6f6369  	dc.b	"Velocita' bassa",0
5044  01d7               L7011:
5045  01d7 4d616e63616e  	dc.b	"Mancanza stampa",0
5046  01e7               L3011:
5047  01e7 616c6c61726d  	dc.b	"allarme:",0
5048  01f0               L3401:
5049  01f0 6d6573736167  	dc.b	"messaggio:",0
5050  01fb               L5101:
5051  01fb 6d742f6d696e  	dc.b	"mt/min",0
5052  0202               L3101:
5053  0202 76656c6f6369  	dc.b	"velocita:",0
5054  020c               L577:
5055  020c 6d616e75616c  	dc.b	"manuale",0
5056  0214               L177:
5057  0214 6175746f6d61  	dc.b	"automatico",0
5058  021f               L767:
5059  021f 6d6f646f3a00  	dc.b	"modo:",0
5060                     	xref.b	c_x
5080                     	xref	c_ftoi
5081                     	xref	c_xfmul
5082                     	xref	c_xfadd
5083                     	xref	c_fcmp
5084                     	xref	c_itof
5085                     	xref	c_ltor
5086                     	xref	c_rtol
5087                     	xref	c_xfdiv
5088                     	xref	c_xfsub
5089                     	xref	c_uitof
5090                     	xref.b	_displayDrawCorrection$L
5091                     	xref.b	_displayDrawSelector$L
5092                     	xref.b	_displayDrawVerticalLine$L
5093                     	xref.b	_displayDrawHorizontalLine$L
5094                     	xref.b	_formatNumber$L
5095                     	xref.b	_parametersSet$L
5096                     	xref.b	_displayInvertArea$L
5097                     	xref.b	_displayWriteString$L
5098                     	xref.b	_displaySetOutLine$L
5099                     	xref.b	_displayClearArea$L
5100                     	xref.b	_displayDrawBox$L
5101                     	end
