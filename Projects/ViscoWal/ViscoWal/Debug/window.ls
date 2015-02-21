   1                     ; C Compiler for ST7 (COSMIC Software)
   2                     ; Generator V4.5.5 - 12 Jan 2006
1280                     .const:	section	.text
1281  0000               L327_mc_byApplicationVersion:
1282  0000 da            	dc.b	218
1342                     ; 41 void windowInit(void)
1342                     ; 42 {
1343                     	switch	.text
1344  0000               _windowInit:
1347                     ; 43 	m_byCurrentSelectorX = 0x00;
1349  0000 4f            	clr	a
1350  0001 c70007        	ld	_m_byCurrentSelectorX,a
1351                     ; 44 	m_woDisplayedWindow = 0x0000;
1353  0004 4f            	clr	a
1354  0005 c70005        	ld	_m_woDisplayedWindow,a
1355  0008 c70006        	ld	_m_woDisplayedWindow+1,a
1356                     ; 45 }
1359  000b 81            	ret
1382                     ; 48 void windowForceRepaint(void)
1382                     ; 49 {
1383                     	switch	.text
1384  000c               _windowForceRepaint:
1387                     ; 50 	m_woDisplayedWindow = 0x0000;
1389  000c 4f            	clr	a
1390  000d c70005        	ld	_m_woDisplayedWindow,a
1391  0010 c70006        	ld	_m_woDisplayedWindow+1,a
1392                     ; 51 }
1395  0013 81            	ret
1419                     ; 54 void windowForceRepaintAlarm(void)
1419                     ; 55 {
1420                     	switch	.text
1421  0014               _windowForceRepaintAlarm:
1424                     ; 56 	m_woDisplayedWindow = 0x0000;
1426  0014 4f            	clr	a
1427  0015 c70005        	ld	_m_woDisplayedWindow,a
1428  0018 c70006        	ld	_m_woDisplayedWindow+1,a
1429                     ; 57 	_bres(m_woDisplayedWindow, WIN_ALARM);
1431  001b c60006        	ld	a,_m_woDisplayedWindow+1
1432  001e a4ef          	and	a,#239
1433  0020 c70006        	ld	_m_woDisplayedWindow+1,a
1434                     ; 58 }
1437  0023 81            	ret
1466                     ; 62 void windowMode(void)
1466                     ; 63 {
1467                     	switch	.text
1468  0024               _windowMode:
1471                     ; 64 	if (!_btst(m_woDisplayedWindow, WIN_MODE) || parametersIsChanged(PARAM_MODE))
1473  0024 c60006        	ld	a,_m_woDisplayedWindow+1
1474  0027 a501          	bcp	a,#1
1475  0029 270b          	jreq	L3201
1477  002b a610          	ld	a,#16
1478  002d cd0000        	call	_parametersIsChanged
1480  0030 4d            	tnz	a
1481  0031 2603          	jrne	L61
1482  0033 cc0161        	jp	L1201
1483  0036               L61:
1484  0036               L3201:
1485                     ; 66 		switch(parametersGetValue(PARAM_MODE))
1487  0036 a610          	ld	a,#16
1488  0038 cd0000        	call	_parametersGetValue
1491                     ; 83 				break;
1492  003b 5d            	tnz	x
1493  003c 2703          	jreq	L02
1494  003e cc0122        	jp	L7001
1495  0041               L02:
1496  0041 4d            	tnz	a
1497  0042 2603          	jrne	L22
1498  0044 cc00ef        	jp	L5001
1499  0047               L22:
1500  0047 4a            	dec	a
1501  0048 2772          	jreq	L3001
1502  004a 4a            	dec	a
1503  004b 273b          	jreq	L1001
1504  004d a0fd          	sub	a,#253
1505  004f 2703          	jreq	L42
1506  0051 cc0122        	jp	L7001
1507  0054               L42:
1508                     ; 68 			case PARAM_MODE_AUTO:
1508                     ; 69 				displayDrawBox(0, 0, 30, 16, labelGet(LABEL_MODE), labelGet(LABEL_MODE_AUTO), 0xFFFF,0,0,_btst(m_woDisplayedWindow, WIN_MODE));
1510  0054 c60006        	ld	a,_m_woDisplayedWindow+1
1511  0057 a401          	and	a,#1
1512  0059 b70c          	ld	_displayDrawBox$L+12,a
1513  005b 3f0b          	clr	_displayDrawBox$L+11
1514  005d 3f0a          	clr	_displayDrawBox$L+10
1515  005f aeff          	ld	x,#255
1516  0061 bf08          	ld	_displayDrawBox$L+8,x
1517  0063 a6ff          	ld	a,#255
1518  0065 b709          	ld	_displayDrawBox$L+9,a
1519  0067 a601          	ld	a,#1
1520  0069 cd0000        	call	_labelGet
1522  006c b707          	ld	_displayDrawBox$L+7,a
1523  006e bf06          	ld	_displayDrawBox$L+6,x
1524  0070 4f            	clr	a
1525  0071 cd0000        	call	_labelGet
1527  0074 b705          	ld	_displayDrawBox$L+5,a
1528  0076 bf04          	ld	_displayDrawBox$L+4,x
1529  0078 a610          	ld	a,#16
1530  007a b703          	ld	_displayDrawBox$L+3,a
1531  007c a61e          	ld	a,#30
1532  007e b702          	ld	_displayDrawBox$L+2,a
1533  0080 4f            	clr	a
1534  0081 5f            	clr	x
1535  0082 cd0000        	call	_displayDrawBox
1537                     ; 70 				break;
1539  0085 cc015c        	jp	L7201
1540  0088               L1001:
1541                     ; 71 			case PARAM_MODE_OFF:
1541                     ; 72 				displayDrawBox(0, 0, 30, 16, labelGet(LABEL_MODE), labelGet(LABEL_MODE_OFF), 0xFFFF,0,0, _btst(m_woDisplayedWindow, WIN_MODE));			
1543  0088 c60006        	ld	a,_m_woDisplayedWindow+1
1544  008b a401          	and	a,#1
1545  008d b70c          	ld	_displayDrawBox$L+12,a
1546  008f 3f0b          	clr	_displayDrawBox$L+11
1547  0091 3f0a          	clr	_displayDrawBox$L+10
1548  0093 aeff          	ld	x,#255
1549  0095 bf08          	ld	_displayDrawBox$L+8,x
1550  0097 a6ff          	ld	a,#255
1551  0099 b709          	ld	_displayDrawBox$L+9,a
1552  009b a604          	ld	a,#4
1553  009d cd0000        	call	_labelGet
1555  00a0 b707          	ld	_displayDrawBox$L+7,a
1556  00a2 bf06          	ld	_displayDrawBox$L+6,x
1557  00a4 4f            	clr	a
1558  00a5 cd0000        	call	_labelGet
1560  00a8 b705          	ld	_displayDrawBox$L+5,a
1561  00aa bf04          	ld	_displayDrawBox$L+4,x
1562  00ac a610          	ld	a,#16
1563  00ae b703          	ld	_displayDrawBox$L+3,a
1564  00b0 a61e          	ld	a,#30
1565  00b2 b702          	ld	_displayDrawBox$L+2,a
1566  00b4 4f            	clr	a
1567  00b5 5f            	clr	x
1568  00b6 cd0000        	call	_displayDrawBox
1570                     ; 73 				break;
1572  00b9 cc015c        	jp	L7201
1573  00bc               L3001:
1574                     ; 74 			case PARAM_MODE_PAUSE:
1574                     ; 75 				displayDrawBox(0, 0, 30, 16, labelGet(LABEL_MODE), labelGet(LABEL_MODE_PAUSE), 0xFFFF,0,0,_btst(m_woDisplayedWindow, WIN_MODE));			
1576  00bc c60006        	ld	a,_m_woDisplayedWindow+1
1577  00bf a401          	and	a,#1
1578  00c1 b70c          	ld	_displayDrawBox$L+12,a
1579  00c3 3f0b          	clr	_displayDrawBox$L+11
1580  00c5 3f0a          	clr	_displayDrawBox$L+10
1581  00c7 aeff          	ld	x,#255
1582  00c9 bf08          	ld	_displayDrawBox$L+8,x
1583  00cb a6ff          	ld	a,#255
1584  00cd b709          	ld	_displayDrawBox$L+9,a
1585  00cf a603          	ld	a,#3
1586  00d1 cd0000        	call	_labelGet
1588  00d4 b707          	ld	_displayDrawBox$L+7,a
1589  00d6 bf06          	ld	_displayDrawBox$L+6,x
1590  00d8 4f            	clr	a
1591  00d9 cd0000        	call	_labelGet
1593  00dc b705          	ld	_displayDrawBox$L+5,a
1594  00de bf04          	ld	_displayDrawBox$L+4,x
1595  00e0 a610          	ld	a,#16
1596  00e2 b703          	ld	_displayDrawBox$L+3,a
1597  00e4 a61e          	ld	a,#30
1598  00e6 b702          	ld	_displayDrawBox$L+2,a
1599  00e8 4f            	clr	a
1600  00e9 5f            	clr	x
1601  00ea cd0000        	call	_displayDrawBox
1603                     ; 76 				break;
1605  00ed 206d          	jra	L7201
1606  00ef               L5001:
1607                     ; 77 			case PARAM_MODE_MANUAL:
1607                     ; 78 				displayDrawBox(0, 0, 30, 16, labelGet(LABEL_MODE), labelGet(LABEL_MODE_MANUAL), 0xFFFF,0,0,_btst(m_woDisplayedWindow, WIN_MODE));			
1609  00ef c60006        	ld	a,_m_woDisplayedWindow+1
1610  00f2 a401          	and	a,#1
1611  00f4 b70c          	ld	_displayDrawBox$L+12,a
1612  00f6 3f0b          	clr	_displayDrawBox$L+11
1613  00f8 3f0a          	clr	_displayDrawBox$L+10
1614  00fa aeff          	ld	x,#255
1615  00fc bf08          	ld	_displayDrawBox$L+8,x
1616  00fe a6ff          	ld	a,#255
1617  0100 b709          	ld	_displayDrawBox$L+9,a
1618  0102 a602          	ld	a,#2
1619  0104 cd0000        	call	_labelGet
1621  0107 b707          	ld	_displayDrawBox$L+7,a
1622  0109 bf06          	ld	_displayDrawBox$L+6,x
1623  010b 4f            	clr	a
1624  010c cd0000        	call	_labelGet
1626  010f b705          	ld	_displayDrawBox$L+5,a
1627  0111 bf04          	ld	_displayDrawBox$L+4,x
1628  0113 a610          	ld	a,#16
1629  0115 b703          	ld	_displayDrawBox$L+3,a
1630  0117 a61e          	ld	a,#30
1631  0119 b702          	ld	_displayDrawBox$L+2,a
1632  011b 4f            	clr	a
1633  011c 5f            	clr	x
1634  011d cd0000        	call	_displayDrawBox
1636                     ; 79 				break;
1638  0120 203a          	jra	L7201
1639  0122               L7001:
1640                     ; 80 			default:
1640                     ; 81 				parametersSet(PARAM_MODE, PARAM_MODE_MANUAL);
1642  0122 3f01          	clr	_parametersSet$L+1
1643  0124 3f02          	clr	_parametersSet$L+2
1644  0126 a610          	ld	a,#16
1645  0128 cd0000        	call	_parametersSet
1647                     ; 82 				displayDrawBox(0, 0, 30, 16, labelGet(LABEL_MODE), labelGet(LABEL_MODE_MANUAL), 0xFFFF,0,0,_btst(m_woDisplayedWindow, WIN_MODE));			
1649  012b c60006        	ld	a,_m_woDisplayedWindow+1
1650  012e a401          	and	a,#1
1651  0130 b70c          	ld	_displayDrawBox$L+12,a
1652  0132 3f0b          	clr	_displayDrawBox$L+11
1653  0134 3f0a          	clr	_displayDrawBox$L+10
1654  0136 aeff          	ld	x,#255
1655  0138 bf08          	ld	_displayDrawBox$L+8,x
1656  013a a6ff          	ld	a,#255
1657  013c b709          	ld	_displayDrawBox$L+9,a
1658  013e a602          	ld	a,#2
1659  0140 cd0000        	call	_labelGet
1661  0143 b707          	ld	_displayDrawBox$L+7,a
1662  0145 bf06          	ld	_displayDrawBox$L+6,x
1663  0147 4f            	clr	a
1664  0148 cd0000        	call	_labelGet
1666  014b b705          	ld	_displayDrawBox$L+5,a
1667  014d bf04          	ld	_displayDrawBox$L+4,x
1668  014f a610          	ld	a,#16
1669  0151 b703          	ld	_displayDrawBox$L+3,a
1670  0153 a61e          	ld	a,#30
1671  0155 b702          	ld	_displayDrawBox$L+2,a
1672  0157 4f            	clr	a
1673  0158 5f            	clr	x
1674  0159 cd0000        	call	_displayDrawBox
1676                     ; 83 				break;
1678  015c               L7201:
1679                     ; 86 		parametersChangedFlagReset(PARAM_MODE);
1681  015c a610          	ld	a,#16
1682  015e cd0000        	call	_parametersChangedFlagReset
1684  0161               L1201:
1685                     ; 89 	_bset(m_woDisplayedWindow, WIN_MODE);
1687  0161 c60006        	ld	a,_m_woDisplayedWindow+1
1688  0164 aa01          	or	a,#1
1689  0166 c70006        	ld	_m_woDisplayedWindow+1,a
1690                     ; 90 	_bres(m_woDisplayedWindow, WIN_MESSAGE);
1692  0169 c60006        	ld	a,_m_woDisplayedWindow+1
1693  016c a4df          	and	a,#223
1694  016e c70006        	ld	_m_woDisplayedWindow+1,a
1695                     ; 91 	_bres(m_woDisplayedWindow, WIN_SETUP);
1697  0171 c60006        	ld	a,_m_woDisplayedWindow+1
1698  0174 a4ff          	and	a,#255
1699  0176 c70006        	ld	_m_woDisplayedWindow+1,a
1700  0179 c60005        	ld	a,_m_woDisplayedWindow
1701  017c a4fb          	and	a,#251
1702  017e c70005        	ld	_m_woDisplayedWindow,a
1703                     ; 92 	_bres(m_woDisplayedWindow, WIN_MENUS);
1705  0181 c60006        	ld	a,_m_woDisplayedWindow+1
1706  0184 a4ff          	and	a,#255
1707  0186 c70006        	ld	_m_woDisplayedWindow+1,a
1708  0189 c60005        	ld	a,_m_woDisplayedWindow
1709  018c a4fd          	and	a,#253
1710  018e c70005        	ld	_m_woDisplayedWindow,a
1711                     ; 93 	_bres(m_woDisplayedWindow, WIN_ARCHIVES);
1713  0191 c60006        	ld	a,_m_woDisplayedWindow+1
1714  0194 a4ff          	and	a,#255
1715  0196 c70006        	ld	_m_woDisplayedWindow+1,a
1716  0199 c60005        	ld	a,_m_woDisplayedWindow
1717  019c a4f7          	and	a,#247
1718  019e c70005        	ld	_m_woDisplayedWindow,a
1719                     ; 94 	_bres(m_woDisplayedWindow, WIN_6MESSAGES);
1721  01a1 c60006        	ld	a,_m_woDisplayedWindow+1
1722  01a4 a4ff          	and	a,#255
1723  01a6 c70006        	ld	_m_woDisplayedWindow+1,a
1724  01a9 c60005        	ld	a,_m_woDisplayedWindow
1725  01ac a4bf          	and	a,#191
1726  01ae c70005        	ld	_m_woDisplayedWindow,a
1727                     ; 95 }
1730  01b1 81            	ret
1768                     ; 98 void windowViscosityRef(void)
1768                     ; 99 {
1769                     	switch	.text
1771                     	xref.b	_windowViscosityRef$L
1772  01b2               _windowViscosityRef:
1775                     ; 100 	WORD woValue = 0x0000;
1777  01b2 3ffe          	clr	_windowViscosityRef$L-2
1778  01b4 3fff          	clr	_windowViscosityRef$L-1
1779                     ; 102 	if (!_btst(m_woDisplayedWindow, WIN_VISCO_REF) || parametersIsChanged(PARAM_REF_VISCOSITY) || parametersIsChanged(PARAM_MODE))
1781  01b6 c60006        	ld	a,_m_woDisplayedWindow+1
1782  01b9 a580          	bcp	a,#128
1783  01bb 2710          	jreq	L1501
1785  01bd a60b          	ld	a,#11
1786  01bf cd0000        	call	_parametersIsChanged
1788  01c2 4d            	tnz	a
1789  01c3 2608          	jrne	L1501
1791  01c5 a610          	ld	a,#16
1792  01c7 cd0000        	call	_parametersIsChanged
1794  01ca 4d            	tnz	a
1795  01cb 274c          	jreq	L7401
1796  01cd               L1501:
1797                     ; 104 		if (parametersGetValue(PARAM_MODE) != PARAM_MODE_OFF)
1799  01cd a610          	ld	a,#16
1800  01cf cd0000        	call	_parametersGetValue
1802  01d2 a102          	cp	a,#2
1803  01d4 2602          	jrne	L03
1804  01d6 a300          	cp	x,#0
1805  01d8               L03:
1806  01d8 2709          	jreq	L5501
1807                     ; 106 			 woValue = parametersGetValue(PARAM_REF_VISCOSITY);
1809  01da a60b          	ld	a,#11
1810  01dc cd0000        	call	_parametersGetValue
1812  01df b7ff          	ld	_windowViscosityRef$L-1,a
1813  01e1 bffe          	ld	_windowViscosityRef$L-2,x
1814  01e3               L5501:
1815                     ; 108 		displayDrawBox(32, 0, 30, 16, labelGet(LABEL_REFERENCE), "", woValue, 4,1, _btst(m_woDisplayedWindow, WIN_VISCO_REF));
1817  01e3 c60006        	ld	a,_m_woDisplayedWindow+1
1818  01e6 a480          	and	a,#128
1819  01e8 b70c          	ld	_displayDrawBox$L+12,a
1820  01ea a601          	ld	a,#1
1821  01ec b70b          	ld	_displayDrawBox$L+11,a
1822  01ee a604          	ld	a,#4
1823  01f0 b70a          	ld	_displayDrawBox$L+10,a
1824  01f2 befe          	ld	x,_windowViscosityRef$L-2
1825  01f4 bf08          	ld	_displayDrawBox$L+8,x
1826  01f6 b6ff          	ld	a,_windowViscosityRef$L-1
1827  01f8 b709          	ld	_displayDrawBox$L+9,a
1828  01fa ae2f          	ld	x,#high(L7501)
1829  01fc bf06          	ld	_displayDrawBox$L+6,x
1830  01fe a62f          	ld	a,#low(L7501)
1831  0200 b707          	ld	_displayDrawBox$L+7,a
1832  0202 a61c          	ld	a,#28
1833  0204 cd0000        	call	_labelGet
1835  0207 b705          	ld	_displayDrawBox$L+5,a
1836  0209 bf04          	ld	_displayDrawBox$L+4,x
1837  020b a610          	ld	a,#16
1838  020d b703          	ld	_displayDrawBox$L+3,a
1839  020f a61e          	ld	a,#30
1840  0211 b702          	ld	_displayDrawBox$L+2,a
1841  0213 4f            	clr	a
1842  0214 ae20          	ld	x,#32
1843  0216 cd0000        	call	_displayDrawBox
1845  0219               L7401:
1846                     ; 112 	_bset(m_woDisplayedWindow, WIN_VISCO_REF);
1848  0219 c60006        	ld	a,_m_woDisplayedWindow+1
1849  021c aa80          	or	a,#128
1850  021e c70006        	ld	_m_woDisplayedWindow+1,a
1851                     ; 113 	_bres(m_woDisplayedWindow, WIN_MESSAGE);
1853  0221 c60006        	ld	a,_m_woDisplayedWindow+1
1854  0224 a4df          	and	a,#223
1855  0226 c70006        	ld	_m_woDisplayedWindow+1,a
1856                     ; 114 	_bres(m_woDisplayedWindow, WIN_SETUP);
1858  0229 c60006        	ld	a,_m_woDisplayedWindow+1
1859  022c a4ff          	and	a,#255
1860  022e c70006        	ld	_m_woDisplayedWindow+1,a
1861  0231 c60005        	ld	a,_m_woDisplayedWindow
1862  0234 a4fb          	and	a,#251
1863  0236 c70005        	ld	_m_woDisplayedWindow,a
1864                     ; 115 	_bres(m_woDisplayedWindow, WIN_MENUS);
1866  0239 c60006        	ld	a,_m_woDisplayedWindow+1
1867  023c a4ff          	and	a,#255
1868  023e c70006        	ld	_m_woDisplayedWindow+1,a
1869  0241 c60005        	ld	a,_m_woDisplayedWindow
1870  0244 a4fd          	and	a,#253
1871  0246 c70005        	ld	_m_woDisplayedWindow,a
1872                     ; 116 	_bres(m_woDisplayedWindow, WIN_ARCHIVES);
1874  0249 c60006        	ld	a,_m_woDisplayedWindow+1
1875  024c a4ff          	and	a,#255
1876  024e c70006        	ld	_m_woDisplayedWindow+1,a
1877  0251 c60005        	ld	a,_m_woDisplayedWindow
1878  0254 a4f7          	and	a,#247
1879  0256 c70005        	ld	_m_woDisplayedWindow,a
1880                     ; 117 	_bres(m_woDisplayedWindow, WIN_6MESSAGES);
1882  0259 c60006        	ld	a,_m_woDisplayedWindow+1
1883  025c a4ff          	and	a,#255
1884  025e c70006        	ld	_m_woDisplayedWindow+1,a
1885  0261 c60005        	ld	a,_m_woDisplayedWindow
1886  0264 a4bf          	and	a,#191
1887  0266 c70005        	ld	_m_woDisplayedWindow,a
1888                     ; 118 }
1891  0269 81            	ret
1930                     ; 121 void windowViscosityReal(void)
1930                     ; 122 {
1931                     	switch	.text
1933                     	xref.b	_windowViscosityReal$L
1934  026a               _windowViscosityReal:
1937                     ; 123 	WORD woValue = 0x0000;
1939  026a 3ffe          	clr	_windowViscosityReal$L-2
1940  026c 3fff          	clr	_windowViscosityReal$L-1
1941                     ; 125 	if (!_btst(m_woDisplayedWindow, WIN_VISCO_REAL) || parametersIsChanged(PARAM_OUT_VISCOSITY) || parametersIsChanged(PARAM_MODE))
1943  026e c60005        	ld	a,_m_woDisplayedWindow
1944  0271 a501          	bcp	a,#1
1945  0273 2710          	jreq	L1011
1947  0275 a609          	ld	a,#9
1948  0277 cd0000        	call	_parametersIsChanged
1950  027a 4d            	tnz	a
1951  027b 2608          	jrne	L1011
1953  027d a610          	ld	a,#16
1954  027f cd0000        	call	_parametersIsChanged
1956  0282 4d            	tnz	a
1957  0283 274c          	jreq	L7701
1958  0285               L1011:
1959                     ; 127 		if (parametersGetValue(PARAM_MODE) != PARAM_MODE_OFF)
1961  0285 a610          	ld	a,#16
1962  0287 cd0000        	call	_parametersGetValue
1964  028a a102          	cp	a,#2
1965  028c 2602          	jrne	L43
1966  028e a300          	cp	x,#0
1967  0290               L43:
1968  0290 2709          	jreq	L5011
1969                     ; 129 			 woValue = parametersGetValue(PARAM_OUT_VISCOSITY);
1971  0292 a609          	ld	a,#9
1972  0294 cd0000        	call	_parametersGetValue
1974  0297 b7ff          	ld	_windowViscosityReal$L-1,a
1975  0299 bffe          	ld	_windowViscosityReal$L-2,x
1976  029b               L5011:
1977                     ; 131 		displayDrawBox(64, 0, 30, 16, labelGet(LABEL_REAL), "", woValue, 4,1, _btst(m_woDisplayedWindow, WIN_VISCO_REAL));
1979  029b c60006        	ld	a,_m_woDisplayedWindow+1
1980  029e a400          	and	a,#0
1981  02a0 b70c          	ld	_displayDrawBox$L+12,a
1982  02a2 a601          	ld	a,#1
1983  02a4 b70b          	ld	_displayDrawBox$L+11,a
1984  02a6 a604          	ld	a,#4
1985  02a8 b70a          	ld	_displayDrawBox$L+10,a
1986  02aa befe          	ld	x,_windowViscosityReal$L-2
1987  02ac bf08          	ld	_displayDrawBox$L+8,x
1988  02ae b6ff          	ld	a,_windowViscosityReal$L-1
1989  02b0 b709          	ld	_displayDrawBox$L+9,a
1990  02b2 ae2f          	ld	x,#high(L7501)
1991  02b4 bf06          	ld	_displayDrawBox$L+6,x
1992  02b6 a62f          	ld	a,#low(L7501)
1993  02b8 b707          	ld	_displayDrawBox$L+7,a
1994  02ba a61d          	ld	a,#29
1995  02bc cd0000        	call	_labelGet
1997  02bf b705          	ld	_displayDrawBox$L+5,a
1998  02c1 bf04          	ld	_displayDrawBox$L+4,x
1999  02c3 a610          	ld	a,#16
2000  02c5 b703          	ld	_displayDrawBox$L+3,a
2001  02c7 a61e          	ld	a,#30
2002  02c9 b702          	ld	_displayDrawBox$L+2,a
2003  02cb 4f            	clr	a
2004  02cc ae40          	ld	x,#64
2005  02ce cd0000        	call	_displayDrawBox
2007  02d1               L7701:
2008                     ; 135 	_bset(m_woDisplayedWindow, WIN_VISCO_REAL);
2010  02d1 c60005        	ld	a,_m_woDisplayedWindow
2011  02d4 aa01          	or	a,#1
2012  02d6 c70005        	ld	_m_woDisplayedWindow,a
2013                     ; 136 	_bres(m_woDisplayedWindow, WIN_MESSAGE);
2015  02d9 c60006        	ld	a,_m_woDisplayedWindow+1
2016  02dc a4df          	and	a,#223
2017  02de c70006        	ld	_m_woDisplayedWindow+1,a
2018                     ; 137 	_bres(m_woDisplayedWindow, WIN_SETUP);
2020  02e1 c60006        	ld	a,_m_woDisplayedWindow+1
2021  02e4 a4ff          	and	a,#255
2022  02e6 c70006        	ld	_m_woDisplayedWindow+1,a
2023  02e9 c60005        	ld	a,_m_woDisplayedWindow
2024  02ec a4fb          	and	a,#251
2025  02ee c70005        	ld	_m_woDisplayedWindow,a
2026                     ; 138 	_bres(m_woDisplayedWindow, WIN_MENUS);
2028  02f1 c60006        	ld	a,_m_woDisplayedWindow+1
2029  02f4 a4ff          	and	a,#255
2030  02f6 c70006        	ld	_m_woDisplayedWindow+1,a
2031  02f9 c60005        	ld	a,_m_woDisplayedWindow
2032  02fc a4fd          	and	a,#253
2033  02fe c70005        	ld	_m_woDisplayedWindow,a
2034                     ; 139 	_bres(m_woDisplayedWindow, WIN_ARCHIVES);
2036  0301 c60006        	ld	a,_m_woDisplayedWindow+1
2037  0304 a4ff          	and	a,#255
2038  0306 c70006        	ld	_m_woDisplayedWindow+1,a
2039  0309 c60005        	ld	a,_m_woDisplayedWindow
2040  030c a4f7          	and	a,#247
2041  030e c70005        	ld	_m_woDisplayedWindow,a
2042                     ; 140 	_bres(m_woDisplayedWindow, WIN_6MESSAGES);
2044  0311 c60006        	ld	a,_m_woDisplayedWindow+1
2045  0314 a4ff          	and	a,#255
2046  0316 c70006        	ld	_m_woDisplayedWindow+1,a
2047  0319 c60005        	ld	a,_m_woDisplayedWindow
2048  031c a4bf          	and	a,#191
2049  031e c70005        	ld	_m_woDisplayedWindow,a
2050                     ; 141 }
2053  0321 81            	ret
2092                     ; 144 void windowTemperature(void)
2092                     ; 145 {	
2093                     	switch	.text
2095                     	xref.b	_windowTemperature$L
2096  0322               _windowTemperature:
2099                     ; 146 	WORD woValue = 0x0000;
2101  0322 3ffe          	clr	_windowTemperature$L-2
2102  0324 3fff          	clr	_windowTemperature$L-1
2103                     ; 148 	if (!_btst(m_woDisplayedWindow, WIN_TEMPERATURE) || parametersIsChanged(PARAM_OUT_TEMPERATURE) || parametersIsChanged(PARAM_MODE))
2105  0326 c60006        	ld	a,_m_woDisplayedWindow+1
2106  0329 a502          	bcp	a,#2
2107  032b 2710          	jreq	L7211
2109  032d a608          	ld	a,#8
2110  032f cd0000        	call	_parametersIsChanged
2112  0332 4d            	tnz	a
2113  0333 2608          	jrne	L7211
2115  0335 a610          	ld	a,#16
2116  0337 cd0000        	call	_parametersIsChanged
2118  033a 4d            	tnz	a
2119  033b 2751          	jreq	L5211
2120  033d               L7211:
2121                     ; 150 		if (parametersGetValue(PARAM_MODE) != PARAM_MODE_OFF)
2123  033d a610          	ld	a,#16
2124  033f cd0000        	call	_parametersGetValue
2126  0342 a102          	cp	a,#2
2127  0344 2602          	jrne	L04
2128  0346 a300          	cp	x,#0
2129  0348               L04:
2130  0348 2709          	jreq	L3311
2131                     ; 152 			 woValue = parametersGetValue(PARAM_OUT_TEMPERATURE);
2133  034a a608          	ld	a,#8
2134  034c cd0000        	call	_parametersGetValue
2136  034f b7ff          	ld	_windowTemperature$L-1,a
2137  0351 bffe          	ld	_windowTemperature$L-2,x
2138  0353               L3311:
2139                     ; 154 		displayDrawBox(96, 0, 30, 16, labelGet(LABEL_TEMPERATURE), "", woValue, 4,1,_btst(m_woDisplayedWindow, WIN_TEMPERATURE));
2141  0353 c60006        	ld	a,_m_woDisplayedWindow+1
2142  0356 a402          	and	a,#2
2143  0358 b70c          	ld	_displayDrawBox$L+12,a
2144  035a a601          	ld	a,#1
2145  035c b70b          	ld	_displayDrawBox$L+11,a
2146  035e a604          	ld	a,#4
2147  0360 b70a          	ld	_displayDrawBox$L+10,a
2148  0362 befe          	ld	x,_windowTemperature$L-2
2149  0364 bf08          	ld	_displayDrawBox$L+8,x
2150  0366 b6ff          	ld	a,_windowTemperature$L-1
2151  0368 b709          	ld	_displayDrawBox$L+9,a
2152  036a ae2f          	ld	x,#high(L7501)
2153  036c bf06          	ld	_displayDrawBox$L+6,x
2154  036e a62f          	ld	a,#low(L7501)
2155  0370 b707          	ld	_displayDrawBox$L+7,a
2156  0372 a605          	ld	a,#5
2157  0374 cd0000        	call	_labelGet
2159  0377 b705          	ld	_displayDrawBox$L+5,a
2160  0379 bf04          	ld	_displayDrawBox$L+4,x
2161  037b a610          	ld	a,#16
2162  037d b703          	ld	_displayDrawBox$L+3,a
2163  037f a61e          	ld	a,#30
2164  0381 b702          	ld	_displayDrawBox$L+2,a
2165  0383 4f            	clr	a
2166  0384 ae60          	ld	x,#96
2167  0386 cd0000        	call	_displayDrawBox
2169                     ; 155 		parametersChangedFlagReset(PARAM_OUT_TEMPERATURE);
2171  0389 a608          	ld	a,#8
2172  038b cd0000        	call	_parametersChangedFlagReset
2174  038e               L5211:
2175                     ; 158 	_bset(m_woDisplayedWindow, WIN_TEMPERATURE);
2177  038e c60006        	ld	a,_m_woDisplayedWindow+1
2178  0391 aa02          	or	a,#2
2179  0393 c70006        	ld	_m_woDisplayedWindow+1,a
2180                     ; 159 	_bres(m_woDisplayedWindow, WIN_MESSAGE);
2182  0396 c60006        	ld	a,_m_woDisplayedWindow+1
2183  0399 a4df          	and	a,#223
2184  039b c70006        	ld	_m_woDisplayedWindow+1,a
2185                     ; 160 	_bres(m_woDisplayedWindow, WIN_SETUP);
2187  039e c60006        	ld	a,_m_woDisplayedWindow+1
2188  03a1 a4ff          	and	a,#255
2189  03a3 c70006        	ld	_m_woDisplayedWindow+1,a
2190  03a6 c60005        	ld	a,_m_woDisplayedWindow
2191  03a9 a4fb          	and	a,#251
2192  03ab c70005        	ld	_m_woDisplayedWindow,a
2193                     ; 161 	_bres(m_woDisplayedWindow, WIN_MENUS);
2195  03ae c60006        	ld	a,_m_woDisplayedWindow+1
2196  03b1 a4ff          	and	a,#255
2197  03b3 c70006        	ld	_m_woDisplayedWindow+1,a
2198  03b6 c60005        	ld	a,_m_woDisplayedWindow
2199  03b9 a4fd          	and	a,#253
2200  03bb c70005        	ld	_m_woDisplayedWindow,a
2201                     ; 162 	_bres(m_woDisplayedWindow, WIN_ARCHIVES);
2203  03be c60006        	ld	a,_m_woDisplayedWindow+1
2204  03c1 a4ff          	and	a,#255
2205  03c3 c70006        	ld	_m_woDisplayedWindow+1,a
2206  03c6 c60005        	ld	a,_m_woDisplayedWindow
2207  03c9 a4f7          	and	a,#247
2208  03cb c70005        	ld	_m_woDisplayedWindow,a
2209                     ; 163 	_bres(m_woDisplayedWindow, WIN_6MESSAGES);
2211  03ce c60006        	ld	a,_m_woDisplayedWindow+1
2212  03d1 a4ff          	and	a,#255
2213  03d3 c70006        	ld	_m_woDisplayedWindow+1,a
2214  03d6 c60005        	ld	a,_m_woDisplayedWindow
2215  03d9 a4bf          	and	a,#191
2216  03db c70005        	ld	_m_woDisplayedWindow,a
2217                     ; 164 }
2220  03de 81            	ret
2270                     ; 195 void windowBigMessage(BYTE * a_strMessage1, BYTE * a_strMessage2)
2270                     ; 196 {
2271                     	switch	.text
2273                     	xref.b	_windowBigMessage$L
2274  03df               _windowBigMessage:
2276  03df b701          	ld	_windowBigMessage$L+1,a
2277  03e1 bf00          	ld	_windowBigMessage$L,x
2279                     ; 197 	if (!_btst(m_woDisplayedWindow, WIN_MESSAGE)) //Not displayed
2281  03e3 c60006        	ld	a,_m_woDisplayedWindow+1
2282  03e6 a520          	bcp	a,#32
2283  03e8 263f          	jrne	L7511
2284                     ; 199 		displayClearArea(0, 0, 126, 64);
2286  03ea a640          	ld	a,#64
2287  03ec b703          	ld	_displayClearArea$L+3,a
2288  03ee a67e          	ld	a,#126
2289  03f0 b702          	ld	_displayClearArea$L+2,a
2290  03f2 4f            	clr	a
2291  03f3 5f            	clr	x
2292  03f4 cd0000        	call	_displayClearArea
2294                     ; 200 		displaySetOutLine(0, 0, 126, 64, false);
2296  03f7 3f04          	clr	_displaySetOutLine$L+4
2297  03f9 a640          	ld	a,#64
2298  03fb b703          	ld	_displaySetOutLine$L+3,a
2299  03fd a67e          	ld	a,#126
2300  03ff b702          	ld	_displaySetOutLine$L+2,a
2301  0401 4f            	clr	a
2302  0402 5f            	clr	x
2303  0403 cd0000        	call	_displaySetOutLine
2305                     ; 203 		displayWriteString(labelGet(LABEL_MESSAGE), DISPLAY_SELECT_FONT_MINI, 2, 6);
2307  0406 a606          	ld	a,#6
2308  0408 b704          	ld	_displayWriteString$L+4,a
2309  040a a602          	ld	a,#2
2310  040c b703          	ld	_displayWriteString$L+3,a
2311  040e a61c          	ld	a,#28
2312  0410 b702          	ld	_displayWriteString$L+2,a
2313  0412 a606          	ld	a,#6
2314  0414 cd0000        	call	_labelGet
2316  0417 cd0000        	call	_displayWriteString
2318                     ; 204 		displayInvertArea(1, 1, 124, 6);
2320  041a a606          	ld	a,#6
2321  041c b703          	ld	_displayInvertArea$L+3,a
2322  041e a67c          	ld	a,#124
2323  0420 b702          	ld	_displayInvertArea$L+2,a
2324  0422 a601          	ld	a,#1
2325  0424 ae01          	ld	x,#1
2326  0426 cd0000        	call	_displayInvertArea
2328  0429               L7511:
2329                     ; 207 	displayWriteString(a_strMessage1, DISPLAY_SELECT_FONT_5x7, 5, 25);	
2331  0429 a619          	ld	a,#25
2332  042b b704          	ld	_displayWriteString$L+4,a
2333  042d a605          	ld	a,#5
2334  042f b703          	ld	_displayWriteString$L+3,a
2335  0431 a61d          	ld	a,#29
2336  0433 b702          	ld	_displayWriteString$L+2,a
2337  0435 b601          	ld	a,_windowBigMessage$L+1
2338  0437 be00          	ld	x,_windowBigMessage$L
2339  0439 cd0000        	call	_displayWriteString
2341                     ; 208 	displayWriteString(a_strMessage2, DISPLAY_SELECT_FONT_5x7, 5, 40);	
2343  043c a628          	ld	a,#40
2344  043e b704          	ld	_displayWriteString$L+4,a
2345  0440 a605          	ld	a,#5
2346  0442 b703          	ld	_displayWriteString$L+3,a
2347  0444 a61d          	ld	a,#29
2348  0446 b702          	ld	_displayWriteString$L+2,a
2349  0448 b603          	ld	a,_windowBigMessage$L+3
2350  044a be02          	ld	x,_windowBigMessage$L+2
2351  044c cd0000        	call	_displayWriteString
2353                     ; 211 	_bres(m_woDisplayedWindow, WIN_MODE);
2355  044f c60006        	ld	a,_m_woDisplayedWindow+1
2356  0452 a4fe          	and	a,#254
2357  0454 c70006        	ld	_m_woDisplayedWindow+1,a
2358                     ; 212 	_bres(m_woDisplayedWindow, WIN_TEMPERATURE);
2360  0457 c60006        	ld	a,_m_woDisplayedWindow+1
2361  045a a4fd          	and	a,#253
2362  045c c70006        	ld	_m_woDisplayedWindow+1,a
2363                     ; 213 	_bres(m_woDisplayedWindow, WIN_MAIN);
2365  045f c60006        	ld	a,_m_woDisplayedWindow+1
2366  0462 a4f7          	and	a,#247
2367  0464 c70006        	ld	_m_woDisplayedWindow+1,a
2368                     ; 214 	_bres(m_woDisplayedWindow, WIN_ALARM);
2370  0467 c60006        	ld	a,_m_woDisplayedWindow+1
2371  046a a4ef          	and	a,#239
2372  046c c70006        	ld	_m_woDisplayedWindow+1,a
2373                     ; 215 	_bset(m_woDisplayedWindow, WIN_MESSAGE);
2375  046f c60006        	ld	a,_m_woDisplayedWindow+1
2376  0472 aa20          	or	a,#32
2377  0474 c70006        	ld	_m_woDisplayedWindow+1,a
2378                     ; 216 	_bres(m_woDisplayedWindow, WIN_VISCO_REF);
2380  0477 c60006        	ld	a,_m_woDisplayedWindow+1
2381  047a a47f          	and	a,#127
2382  047c c70006        	ld	_m_woDisplayedWindow+1,a
2383                     ; 217 	_bres(m_woDisplayedWindow, WIN_VISCO_REAL);
2385  047f c60006        	ld	a,_m_woDisplayedWindow+1
2386  0482 a4ff          	and	a,#255
2387  0484 c70006        	ld	_m_woDisplayedWindow+1,a
2388  0487 c60005        	ld	a,_m_woDisplayedWindow
2389  048a a4fe          	and	a,#254
2390  048c c70005        	ld	_m_woDisplayedWindow,a
2391                     ; 218 	_bres(m_woDisplayedWindow, WIN_SETUP);
2393  048f c60006        	ld	a,_m_woDisplayedWindow+1
2394  0492 a4ff          	and	a,#255
2395  0494 c70006        	ld	_m_woDisplayedWindow+1,a
2396  0497 c60005        	ld	a,_m_woDisplayedWindow
2397  049a a4fb          	and	a,#251
2398  049c c70005        	ld	_m_woDisplayedWindow,a
2399                     ; 219 	_bres(m_woDisplayedWindow, WIN_MENUS);
2401  049f c60006        	ld	a,_m_woDisplayedWindow+1
2402  04a2 a4ff          	and	a,#255
2403  04a4 c70006        	ld	_m_woDisplayedWindow+1,a
2404  04a7 c60005        	ld	a,_m_woDisplayedWindow
2405  04aa a4fd          	and	a,#253
2406  04ac c70005        	ld	_m_woDisplayedWindow,a
2407                     ; 220 	_bres(m_woDisplayedWindow, WIN_ARCHIVES);
2409  04af c60006        	ld	a,_m_woDisplayedWindow+1
2410  04b2 a4ff          	and	a,#255
2411  04b4 c70006        	ld	_m_woDisplayedWindow+1,a
2412  04b7 c60005        	ld	a,_m_woDisplayedWindow
2413  04ba a4f7          	and	a,#247
2414  04bc c70005        	ld	_m_woDisplayedWindow,a
2415                     ; 221 	_bres(m_woDisplayedWindow, WIN_6MESSAGES);
2417  04bf c60006        	ld	a,_m_woDisplayedWindow+1
2418  04c2 a4ff          	and	a,#255
2419  04c4 c70006        	ld	_m_woDisplayedWindow+1,a
2420  04c7 c60005        	ld	a,_m_woDisplayedWindow
2421  04ca a4bf          	and	a,#191
2422  04cc c70005        	ld	_m_woDisplayedWindow,a
2423                     ; 222 }
2426  04cf 81            	ret
2480                     ; 225 void windowAlarm(void)
2480                     ; 226 {
2481                     	switch	.text
2483                     	xref.b	_windowAlarm$L
2484  04d0               _windowAlarm:
2487                     ; 230 	woAlarm = parametersGetValue(PARAM_ALARM);
2489  04d0 a60d          	ld	a,#13
2490  04d2 cd0000        	call	_parametersGetValue
2492  04d5 b7ef          	ld	_windowAlarm$L-17,a
2493  04d7 bfee          	ld	_windowAlarm$L-18,x
2494                     ; 232 	if (!_btst(m_woDisplayedWindow, WIN_ALARM) || parametersIsChanged(PARAM_ALARM)) //Not displayed
2496  04d9 c60006        	ld	a,_m_woDisplayedWindow+1
2497  04dc a510          	bcp	a,#16
2498  04de 270b          	jreq	L5121
2500  04e0 a60d          	ld	a,#13
2501  04e2 cd0000        	call	_parametersIsChanged
2503  04e5 4d            	tnz	a
2504  04e6 2603          	jrne	L05
2505  04e8 cc0608        	jp	L3121
2506  04eb               L05:
2507  04eb               L5121:
2508                     ; 234 		displayClearArea(WINDOW_3_LEFT, WINDOW_3_TOP, WINDOW_3_RIGHT, WINDOW_3_BOTTOM);
2510  04eb a640          	ld	a,#64
2511  04ed b703          	ld	_displayClearArea$L+3,a
2512  04ef a67e          	ld	a,#126
2513  04f1 b702          	ld	_displayClearArea$L+2,a
2514  04f3 a612          	ld	a,#18
2515  04f5 5f            	clr	x
2516  04f6 cd0000        	call	_displayClearArea
2518                     ; 235 		displaySetOutLine(WINDOW_3_LEFT, WINDOW_3_TOP, WINDOW_3_RIGHT, WINDOW_3_BOTTOM, false);
2520  04f9 3f04          	clr	_displaySetOutLine$L+4
2521  04fb a640          	ld	a,#64
2522  04fd b703          	ld	_displaySetOutLine$L+3,a
2523  04ff a67e          	ld	a,#126
2524  0501 b702          	ld	_displaySetOutLine$L+2,a
2525  0503 a612          	ld	a,#18
2526  0505 5f            	clr	x
2527  0506 cd0000        	call	_displaySetOutLine
2529                     ; 238 		displayWriteString(labelGet(LABEL_ALARM), DISPLAY_SELECT_FONT_MINI, WINDOW_3_LEFT+2, WINDOW_3_TOP+6);
2531  0509 a618          	ld	a,#24
2532  050b b704          	ld	_displayWriteString$L+4,a
2533  050d a602          	ld	a,#2
2534  050f b703          	ld	_displayWriteString$L+3,a
2535  0511 a61c          	ld	a,#28
2536  0513 b702          	ld	_displayWriteString$L+2,a
2537  0515 a607          	ld	a,#7
2538  0517 cd0000        	call	_labelGet
2540  051a cd0000        	call	_displayWriteString
2542                     ; 239 		displayInvertArea(WINDOW_3_LEFT+1, WINDOW_3_TOP+1, WINDOW_3_RIGHT-2, WINDOW_3_TOP+6);
2544  051d a618          	ld	a,#24
2545  051f b703          	ld	_displayInvertArea$L+3,a
2546  0521 a67c          	ld	a,#124
2547  0523 b702          	ld	_displayInvertArea$L+2,a
2548  0525 a613          	ld	a,#19
2549  0527 ae01          	ld	x,#1
2550  0529 cd0000        	call	_displayInvertArea
2552                     ; 241 		memcpy(strValue, labelGet(LABEL_GENERIC_ALARM_01), 16);
2554  052c a610          	ld	a,#16
2555  052e b704          	ld	_memcpy$L+4,a
2556  0530 a609          	ld	a,#9
2557  0532 cd0000        	call	_labelGet
2559  0535 b703          	ld	_memcpy$L+3,a
2560  0537 bf02          	ld	_memcpy$L+2,x
2561  0539 a6f0          	ld	a,#_windowAlarm$L-16
2562  053b 5f            	clr	x
2563  053c cd0000        	call	_memcpy
2565                     ; 242 		formatNumber(woAlarm, 5, 0, strValue + 8);
2567  053f aef8          	ld	x,#high(_windowAlarm$L-8)
2568  0541 bf04          	ld	_formatNumber$L+4,x
2569  0543 a6f8          	ld	a,#low(_windowAlarm$L-8)
2570  0545 b705          	ld	_formatNumber$L+5,a
2571  0547 3f03          	clr	_formatNumber$L+3
2572  0549 a605          	ld	a,#5
2573  054b b702          	ld	_formatNumber$L+2,a
2574  054d b6ef          	ld	a,_windowAlarm$L-17
2575  054f beee          	ld	x,_windowAlarm$L-18
2576  0551 cd0000        	call	_formatNumber
2578                     ; 243 		displayWriteString(strValue, DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+20);	
2580  0554 a626          	ld	a,#38
2581  0556 b704          	ld	_displayWriteString$L+4,a
2582  0558 a605          	ld	a,#5
2583  055a b703          	ld	_displayWriteString$L+3,a
2584  055c a61d          	ld	a,#29
2585  055e b702          	ld	_displayWriteString$L+2,a
2586  0560 a6f0          	ld	a,#_windowAlarm$L-16
2587  0562 5f            	clr	x
2588  0563 cd0000        	call	_displayWriteString
2590                     ; 245 		switch(woAlarm)
2592  0566 b6ef          	ld	a,_windowAlarm$L-17
2593  0568 beee          	ld	x,_windowAlarm$L-18
2595                     ; 261 				break;
2596  056a 5d            	tnz	x
2597  056b 264d          	jrne	L7611
2598  056d 4a            	dec	a
2599  056e 2708          	jreq	L1611
2600  0570 4a            	dec	a
2601  0571 271b          	jreq	L3611
2602  0573 4a            	dec	a
2603  0574 272e          	jreq	L5611
2604  0576 2042          	jra	L7611
2605  0578               L1611:
2606                     ; 247 			case PARAM_ALARM_MEASURING_VISCOSITY:
2606                     ; 248 				displayWriteString(labelGet(LABEL_ALARM_MEASURING_VISCOSITY), DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+30);	
2608  0578 a630          	ld	a,#48
2609  057a b704          	ld	_displayWriteString$L+4,a
2610  057c a605          	ld	a,#5
2611  057e b703          	ld	_displayWriteString$L+3,a
2612  0580 a61d          	ld	a,#29
2613  0582 b702          	ld	_displayWriteString$L+2,a
2614  0584 a619          	ld	a,#25
2615  0586 cd0000        	call	_labelGet
2617  0589 cd0000        	call	_displayWriteString
2619                     ; 249 				break;
2621  058c 207a          	jra	L3121
2622  058e               L3611:
2623                     ; 250 			case PARAM_ALARM_MEASURING_TEMPERATURE:
2623                     ; 251 				displayWriteString(labelGet(LABEL_ALARM_MEASURING_TEMPERATURE), DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+30);	
2625  058e a630          	ld	a,#48
2626  0590 b704          	ld	_displayWriteString$L+4,a
2627  0592 a605          	ld	a,#5
2628  0594 b703          	ld	_displayWriteString$L+3,a
2629  0596 a61d          	ld	a,#29
2630  0598 b702          	ld	_displayWriteString$L+2,a
2631  059a a61a          	ld	a,#26
2632  059c cd0000        	call	_labelGet
2634  059f cd0000        	call	_displayWriteString
2636                     ; 252 				break;
2638  05a2 2064          	jra	L3121
2639  05a4               L5611:
2640                     ; 253 			case PARAM_ALARM_PUMP_ON:
2640                     ; 254 				displayWriteString(labelGet(LABEL_ALARM_PUMP_ON), DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+30);	
2642  05a4 a630          	ld	a,#48
2643  05a6 b704          	ld	_displayWriteString$L+4,a
2644  05a8 a605          	ld	a,#5
2645  05aa b703          	ld	_displayWriteString$L+3,a
2646  05ac a61d          	ld	a,#29
2647  05ae b702          	ld	_displayWriteString$L+2,a
2648  05b0 a622          	ld	a,#34
2649  05b2 cd0000        	call	_labelGet
2651  05b5 cd0000        	call	_displayWriteString
2653                     ; 255 				break;
2655  05b8 204e          	jra	L3121
2656  05ba               L7611:
2657                     ; 256 			default:
2657                     ; 257 				memcpy(strValue, labelGet(LABEL_GENERIC_ALARM_01), 16);
2659  05ba a610          	ld	a,#16
2660  05bc b704          	ld	_memcpy$L+4,a
2661  05be a609          	ld	a,#9
2662  05c0 cd0000        	call	_labelGet
2664  05c3 b703          	ld	_memcpy$L+3,a
2665  05c5 bf02          	ld	_memcpy$L+2,x
2666  05c7 a6f0          	ld	a,#_windowAlarm$L-16
2667  05c9 5f            	clr	x
2668  05ca cd0000        	call	_memcpy
2670                     ; 258 				formatNumber(woAlarm, 5, 0, strValue + 8);
2672  05cd aef8          	ld	x,#high(_windowAlarm$L-8)
2673  05cf bf04          	ld	_formatNumber$L+4,x
2674  05d1 a6f8          	ld	a,#low(_windowAlarm$L-8)
2675  05d3 b705          	ld	_formatNumber$L+5,a
2676  05d5 3f03          	clr	_formatNumber$L+3
2677  05d7 a605          	ld	a,#5
2678  05d9 b702          	ld	_formatNumber$L+2,a
2679  05db b6ef          	ld	a,_windowAlarm$L-17
2680  05dd beee          	ld	x,_windowAlarm$L-18
2681  05df cd0000        	call	_formatNumber
2683                     ; 259 				displayWriteString(strValue, DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+20);	
2685  05e2 a626          	ld	a,#38
2686  05e4 b704          	ld	_displayWriteString$L+4,a
2687  05e6 a605          	ld	a,#5
2688  05e8 b703          	ld	_displayWriteString$L+3,a
2689  05ea a61d          	ld	a,#29
2690  05ec b702          	ld	_displayWriteString$L+2,a
2691  05ee a6f0          	ld	a,#_windowAlarm$L-16
2692  05f0 5f            	clr	x
2693  05f1 cd0000        	call	_displayWriteString
2695                     ; 260 				displayWriteString(labelGet(LABEL_GENERIC_ALARM_02), DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+30);	
2697  05f4 a630          	ld	a,#48
2698  05f6 b704          	ld	_displayWriteString$L+4,a
2699  05f8 a605          	ld	a,#5
2700  05fa b703          	ld	_displayWriteString$L+3,a
2701  05fc a61d          	ld	a,#29
2702  05fe b702          	ld	_displayWriteString$L+2,a
2703  0600 a60a          	ld	a,#10
2704  0602 cd0000        	call	_labelGet
2706  0605 cd0000        	call	_displayWriteString
2708                     ; 261 				break;
2709  0608               L3121:
2710                     ; 265 	parametersChangedFlagReset(PARAM_ALARM);
2712  0608 a60d          	ld	a,#13
2713  060a cd0000        	call	_parametersChangedFlagReset
2715                     ; 266 	parametersChangedFlagReset(PARAM_REF_VISCOSITY);
2717  060d a60b          	ld	a,#11
2718  060f cd0000        	call	_parametersChangedFlagReset
2720                     ; 267 	parametersChangedFlagReset(PARAM_OUT_VISCOSITY);
2722  0612 a609          	ld	a,#9
2723  0614 cd0000        	call	_parametersChangedFlagReset
2725                     ; 270 	_bres(m_woDisplayedWindow, WIN_MAIN);
2727  0617 c60006        	ld	a,_m_woDisplayedWindow+1
2728  061a a4f7          	and	a,#247
2729  061c c70006        	ld	_m_woDisplayedWindow+1,a
2730                     ; 271 	_bset(m_woDisplayedWindow, WIN_ALARM);
2732  061f c60006        	ld	a,_m_woDisplayedWindow+1
2733  0622 aa10          	or	a,#16
2734  0624 c70006        	ld	_m_woDisplayedWindow+1,a
2735                     ; 272 	_bres(m_woDisplayedWindow, WIN_MESSAGE);
2737  0627 c60006        	ld	a,_m_woDisplayedWindow+1
2738  062a a4df          	and	a,#223
2739  062c c70006        	ld	_m_woDisplayedWindow+1,a
2740                     ; 273 	_bres(m_woDisplayedWindow, WIN_SETUP);
2742  062f c60006        	ld	a,_m_woDisplayedWindow+1
2743  0632 a4ff          	and	a,#255
2744  0634 c70006        	ld	_m_woDisplayedWindow+1,a
2745  0637 c60005        	ld	a,_m_woDisplayedWindow
2746  063a a4fb          	and	a,#251
2747  063c c70005        	ld	_m_woDisplayedWindow,a
2748                     ; 274 	_bres(m_woDisplayedWindow, WIN_MENUS);
2750  063f c60006        	ld	a,_m_woDisplayedWindow+1
2751  0642 a4ff          	and	a,#255
2752  0644 c70006        	ld	_m_woDisplayedWindow+1,a
2753  0647 c60005        	ld	a,_m_woDisplayedWindow
2754  064a a4fd          	and	a,#253
2755  064c c70005        	ld	_m_woDisplayedWindow,a
2756                     ; 275 	_bres(m_woDisplayedWindow, WIN_ARCHIVES);
2758  064f c60006        	ld	a,_m_woDisplayedWindow+1
2759  0652 a4ff          	and	a,#255
2760  0654 c70006        	ld	_m_woDisplayedWindow+1,a
2761  0657 c60005        	ld	a,_m_woDisplayedWindow
2762  065a a4f7          	and	a,#247
2763  065c c70005        	ld	_m_woDisplayedWindow,a
2764                     ; 276 	_bres(m_woDisplayedWindow, WIN_6MESSAGES);
2766  065f c60006        	ld	a,_m_woDisplayedWindow+1
2767  0662 a4ff          	and	a,#255
2768  0664 c70006        	ld	_m_woDisplayedWindow+1,a
2769  0667 c60005        	ld	a,_m_woDisplayedWindow
2770  066a a4bf          	and	a,#191
2771  066c c70005        	ld	_m_woDisplayedWindow,a
2772                     ; 277 }
2775  066f 81            	ret
2776  0670               L1221:
2777  0670 2096          	jra	L3121
2823                     ; 281 void windowMainPrepareFormateValue(BYTE * a_strErrValue)
2823                     ; 282 {
2824                     	switch	.text
2826                     	xref.b	_windowMainPrepareFormateValue$L
2827  0672               _windowMainPrepareFormateValue:
2829  0672 b701          	ld	_windowMainPrepareFormateValue$L+1,a
2830  0674 bf00          	ld	_windowMainPrepareFormateValue$L,x
2832                     ; 285 	if (parametersGetValue(PARAM_MODE) == PARAM_MODE_OFF)
2834  0676 a610          	ld	a,#16
2835  0678 cd0000        	call	_parametersGetValue
2837  067b a102          	cp	a,#2
2838  067d 2602          	jrne	L45
2839  067f a300          	cp	x,#0
2840  0681               L45:
2841  0681 260b          	jrne	L5421
2842                     ; 287 		a_strErrValue[0] = ' ';
2844  0683 a620          	ld	a,#32
2845  0685 92c700        	ld	[_windowMainPrepareFormateValue$L.w],a
2846                     ; 288 		woValue = 0x0000;
2848  0688 3ffe          	clr	_windowMainPrepareFormateValue$L-2
2849  068a 3fff          	clr	_windowMainPrepareFormateValue$L-1
2851  068c 2075          	jp	L7421
2852  068e               L5421:
2853                     ; 290 	else if (parametersGetValue(PARAM_OUT_VISCOSITY) > parametersGetValue(PARAM_REF_VISCOSITY))
2855  068e a609          	ld	a,#9
2856  0690 cd0000        	call	_parametersGetValue
2858  0693 b7fd          	ld	_windowMainPrepareFormateValue$L-3,a
2859  0695 bffc          	ld	_windowMainPrepareFormateValue$L-4,x
2860  0697 a60b          	ld	a,#11
2861  0699 cd0000        	call	_parametersGetValue
2863  069c b0fd          	sub	a,_windowMainPrepareFormateValue$L-3
2864  069e 9f            	ld	a,x
2865  069f b2fc          	sbc	a,_windowMainPrepareFormateValue$L-4
2866  06a1 2421          	jruge	L1521
2867                     ; 292 		a_strErrValue[0] = '+';
2869  06a3 a62b          	ld	a,#43
2870  06a5 92c700        	ld	[_windowMainPrepareFormateValue$L.w],a
2871                     ; 293 		woValue = parametersGetValue(PARAM_OUT_VISCOSITY)-parametersGetValue(PARAM_REF_VISCOSITY);
2873  06a8 a60b          	ld	a,#11
2874  06aa cd0000        	call	_parametersGetValue
2876  06ad b7fd          	ld	_windowMainPrepareFormateValue$L-3,a
2877  06af bffc          	ld	_windowMainPrepareFormateValue$L-4,x
2878  06b1 a609          	ld	a,#9
2879  06b3 cd0000        	call	_parametersGetValue
2881  06b6 b0fd          	sub	a,_windowMainPrepareFormateValue$L-3
2882  06b8 88            	push	a
2883  06b9 9f            	ld	a,x
2884  06ba b2fc          	sbc	a,_windowMainPrepareFormateValue$L-4
2885  06bc 97            	ld	x,a
2886  06bd 84            	pop	a
2887  06be b7ff          	ld	_windowMainPrepareFormateValue$L-1,a
2888  06c0 bffe          	ld	_windowMainPrepareFormateValue$L-2,x
2890  06c2 203f          	jra	L7421
2891  06c4               L1521:
2892                     ; 295 	else if (parametersGetValue(PARAM_OUT_VISCOSITY) < parametersGetValue(PARAM_REF_VISCOSITY))
2894  06c4 a60b          	ld	a,#11
2895  06c6 cd0000        	call	_parametersGetValue
2897  06c9 b7fd          	ld	_windowMainPrepareFormateValue$L-3,a
2898  06cb bffc          	ld	_windowMainPrepareFormateValue$L-4,x
2899  06cd a609          	ld	a,#9
2900  06cf cd0000        	call	_parametersGetValue
2902  06d2 b0fd          	sub	a,_windowMainPrepareFormateValue$L-3
2903  06d4 9f            	ld	a,x
2904  06d5 b2fc          	sbc	a,_windowMainPrepareFormateValue$L-4
2905  06d7 2421          	jruge	L5521
2906                     ; 297 		a_strErrValue[0] = '-';
2908  06d9 a62d          	ld	a,#45
2909  06db 92c700        	ld	[_windowMainPrepareFormateValue$L.w],a
2910                     ; 298 		woValue = parametersGetValue(PARAM_REF_VISCOSITY)-parametersGetValue(PARAM_OUT_VISCOSITY);
2912  06de a609          	ld	a,#9
2913  06e0 cd0000        	call	_parametersGetValue
2915  06e3 b7fd          	ld	_windowMainPrepareFormateValue$L-3,a
2916  06e5 bffc          	ld	_windowMainPrepareFormateValue$L-4,x
2917  06e7 a60b          	ld	a,#11
2918  06e9 cd0000        	call	_parametersGetValue
2920  06ec b0fd          	sub	a,_windowMainPrepareFormateValue$L-3
2921  06ee 88            	push	a
2922  06ef 9f            	ld	a,x
2923  06f0 b2fc          	sbc	a,_windowMainPrepareFormateValue$L-4
2924  06f2 97            	ld	x,a
2925  06f3 84            	pop	a
2926  06f4 b7ff          	ld	_windowMainPrepareFormateValue$L-1,a
2927  06f6 bffe          	ld	_windowMainPrepareFormateValue$L-2,x
2929  06f8 2009          	jra	L7421
2930  06fa               L5521:
2931                     ; 302 		a_strErrValue[0] = ' ';
2933  06fa a620          	ld	a,#32
2934  06fc 92c700        	ld	[_windowMainPrepareFormateValue$L.w],a
2935                     ; 303 		woValue = 0x0000;
2937  06ff 3ffe          	clr	_windowMainPrepareFormateValue$L-2
2938  0701 3fff          	clr	_windowMainPrepareFormateValue$L-1
2939  0703               L7421:
2940                     ; 306 	a_strErrValue[6] = 0x00;
2942  0703 ae06          	ld	x,#6
2943  0705 4f            	clr	a
2944  0706 92d700        	ld	([_windowMainPrepareFormateValue$L.w],x),a
2945                     ; 307 	a_strErrValue[7] = 0x00;
2947  0709 ae07          	ld	x,#7
2948  070b 4f            	clr	a
2949  070c 92d700        	ld	([_windowMainPrepareFormateValue$L.w],x),a
2950                     ; 310 	formatNumber(woValue, 6, 1, a_strErrValue+1);
2952  070f b601          	ld	a,_windowMainPrepareFormateValue$L+1
2953  0711 be00          	ld	x,_windowMainPrepareFormateValue$L
2954  0713 4c            	inc	a
2955  0714 2601          	jrne	L65
2956  0716 5c            	inc	x
2957  0717               L65:
2958  0717 b705          	ld	_formatNumber$L+5,a
2959  0719 bf04          	ld	_formatNumber$L+4,x
2960  071b a601          	ld	a,#1
2961  071d b703          	ld	_formatNumber$L+3,a
2962  071f a606          	ld	a,#6
2963  0721 b702          	ld	_formatNumber$L+2,a
2964  0723 b6ff          	ld	a,_windowMainPrepareFormateValue$L-1
2965  0725 befe          	ld	x,_windowMainPrepareFormateValue$L-2
2966  0727 cd0000        	call	_formatNumber
2968                     ; 332 }
2971  072a 81            	ret
3039                     ; 335 void windowMain(void)
3039                     ; 336 {
3040                     	switch	.text
3042                     	xref.b	_windowMain$L
3043  072b               _windowMain:
3046                     ; 342 	byRulerTop = WINDOW_3_TOP+22;
3048  072b a628          	ld	a,#40
3049  072d b7ff          	ld	_windowMain$L-1,a
3050                     ; 344 	if (!_btst(m_woDisplayedWindow, WIN_MAIN)) //Not displayed
3052  072f c60006        	ld	a,_m_woDisplayedWindow+1
3053  0732 a508          	bcp	a,#8
3054  0734 2703          	jreq	L67
3055  0736 cc07df        	jp	L7031
3056  0739               L67:
3057                     ; 346 		displayClearArea(WINDOW_3_LEFT, WINDOW_3_TOP, WINDOW_3_RIGHT, WINDOW_3_BOTTOM);
3059  0739 a640          	ld	a,#64
3060  073b b703          	ld	_displayClearArea$L+3,a
3061  073d a67e          	ld	a,#126
3062  073f b702          	ld	_displayClearArea$L+2,a
3063  0741 a612          	ld	a,#18
3064  0743 5f            	clr	x
3065  0744 cd0000        	call	_displayClearArea
3067                     ; 347 		displaySetOutLine(WINDOW_3_LEFT, WINDOW_3_TOP, WINDOW_3_RIGHT, WINDOW_3_BOTTOM, false);
3069  0747 3f04          	clr	_displaySetOutLine$L+4
3070  0749 a640          	ld	a,#64
3071  074b b703          	ld	_displaySetOutLine$L+3,a
3072  074d a67e          	ld	a,#126
3073  074f b702          	ld	_displaySetOutLine$L+2,a
3074  0751 a612          	ld	a,#18
3075  0753 5f            	clr	x
3076  0754 cd0000        	call	_displaySetOutLine
3078                     ; 350 		displayWriteString(labelGet(LABEL_VISCOSITY), DISPLAY_SELECT_FONT_MINI, WINDOW_3_LEFT+2, WINDOW_3_TOP+6);
3080  0757 a618          	ld	a,#24
3081  0759 b704          	ld	_displayWriteString$L+4,a
3082  075b a602          	ld	a,#2
3083  075d b703          	ld	_displayWriteString$L+3,a
3084  075f a61c          	ld	a,#28
3085  0761 b702          	ld	_displayWriteString$L+2,a
3086  0763 a60b          	ld	a,#11
3087  0765 cd0000        	call	_labelGet
3089  0768 cd0000        	call	_displayWriteString
3091                     ; 351 		displayInvertArea(WINDOW_3_LEFT+1, WINDOW_3_TOP+1, WINDOW_3_RIGHT-2, WINDOW_3_TOP+6);
3093  076b a618          	ld	a,#24
3094  076d b703          	ld	_displayInvertArea$L+3,a
3095  076f a67c          	ld	a,#124
3096  0771 b702          	ld	_displayInvertArea$L+2,a
3097  0773 a613          	ld	a,#19
3098  0775 ae01          	ld	x,#1
3099  0777 cd0000        	call	_displayInvertArea
3101                     ; 354 		displayDrawHorizontalLine(byRulerTop + 1, WINDOW_3_LEFT + 6, WINDOW_3_WIDTH - 13);
3103  077a a671          	ld	a,#113
3104  077c b702          	ld	_displayDrawHorizontalLine$L+2,a
3105  077e a606          	ld	a,#6
3106  0780 beff          	ld	x,_windowMain$L-1
3107  0782 5c            	inc	x
3108  0783 cd0000        	call	_displayDrawHorizontalLine
3110                     ; 355 		/* -1   */ displayDrawVerticalLine(WINDOW_3_LEFT + 5								, byRulerTop - 1, 6);	
3112  0786 a606          	ld	a,#6
3113  0788 b702          	ld	_displayDrawVerticalLine$L+2,a
3114  078a b6ff          	ld	a,_windowMain$L-1
3115  078c 4a            	dec	a
3116  078d ae05          	ld	x,#5
3117  078f cd0000        	call	_displayDrawVerticalLine
3119                     ; 356 		/*  0   */ displayDrawVerticalLine(WINDOW_3_LEFT + 5 + (WINDOW_3_WIDTH - 11) / 2	, byRulerTop - 1, 6);
3121  0792 a606          	ld	a,#6
3122  0794 b702          	ld	_displayDrawVerticalLine$L+2,a
3123  0796 b6ff          	ld	a,_windowMain$L-1
3124  0798 4a            	dec	a
3125  0799 ae3e          	ld	x,#62
3126  079b cd0000        	call	_displayDrawVerticalLine
3128                     ; 357 		/*  1   */ displayDrawVerticalLine(WINDOW_3_LEFT + 5 + (WINDOW_3_WIDTH - 11)		, byRulerTop - 1, 6);
3130  079e a606          	ld	a,#6
3131  07a0 b702          	ld	_displayDrawVerticalLine$L+2,a
3132  07a2 b6ff          	ld	a,_windowMain$L-1
3133  07a4 4a            	dec	a
3134  07a5 ae78          	ld	x,#120
3135  07a7 cd0000        	call	_displayDrawVerticalLine
3137                     ; 358 		/* -0.5 */ displayDrawVerticalLine(WINDOW_3_LEFT + 5 + (WINDOW_3_WIDTH - 11) / 4	, byRulerTop + 2, 1);
3139  07aa a601          	ld	a,#1
3140  07ac b702          	ld	_displayDrawVerticalLine$L+2,a
3141  07ae b6ff          	ld	a,_windowMain$L-1
3142  07b0 ab02          	add	a,#2
3143  07b2 ae21          	ld	x,#33
3144  07b4 cd0000        	call	_displayDrawVerticalLine
3146                     ; 359 		/* +0.5 */ displayDrawVerticalLine(WINDOW_3_LEFT + 5 + (WINDOW_3_WIDTH - 11) * 3 / 4, byRulerTop + 2, 1);
3148  07b7 a601          	ld	a,#1
3149  07b9 b702          	ld	_displayDrawVerticalLine$L+2,a
3150  07bb b6ff          	ld	a,_windowMain$L-1
3151  07bd ab02          	add	a,#2
3152  07bf ae5b          	ld	x,#91
3153  07c1 cd0000        	call	_displayDrawVerticalLine
3155                     ; 361 		dblParamErrorZoom = (double) LOBYTE(parametersGetValue(PARAM_ERROR_ZOOM))/10;
3157  07c4 a624          	ld	a,#36
3158  07c6 cd0000        	call	_parametersGetValue
3160  07c9 5f            	clr	x
3161  07ca cd0000        	call	c_itof
3163  07cd ae2b          	ld	x,#high(L5131)
3164  07cf bf00          	ld	c_x,x
3165  07d1 ae2b          	ld	x,#low(L5131)
3166  07d3 cd0000        	call	c_xfdiv
3168  07d6 ae00          	ld	x,#high(_dblParamErrorZoom)
3169  07d8 bf00          	ld	c_x,x
3170  07da ae00          	ld	x,#low(_dblParamErrorZoom)
3171  07dc cd0000        	call	c_rtoxl
3173  07df               L7031:
3174                     ; 367 	if (parametersIsChanged(PARAM_OUT_VISCOSITY) || parametersIsChanged(PARAM_REF_VISCOSITY) || (!_btst(m_woDisplayedWindow, WIN_MAIN)) )
3176  07df a609          	ld	a,#9
3177  07e1 cd0000        	call	_parametersIsChanged
3179  07e4 4d            	tnz	a
3180  07e5 2612          	jrne	L3231
3182  07e7 a60b          	ld	a,#11
3183  07e9 cd0000        	call	_parametersIsChanged
3185  07ec 4d            	tnz	a
3186  07ed 260a          	jrne	L3231
3188  07ef c60006        	ld	a,_m_woDisplayedWindow+1
3189  07f2 a508          	bcp	a,#8
3190  07f4 2703          	jreq	L001
3191  07f6 cc0932        	jp	L1231
3192  07f9               L001:
3193  07f9               L3231:
3194                     ; 371 		dblPercentValue = ((double) parametersGetValue(PARAM_OUT_VISCOSITY) - (double) parametersGetValue(PARAM_REF_VISCOSITY)) / 100.0;
3196  07f9 a60b          	ld	a,#11
3197  07fb cd0000        	call	_parametersGetValue
3199  07fe cd0000        	call	c_uitof
3201  0801 aeef          	ld	x,#_windowMain$L-17
3202  0803 cd0000        	call	c_rtol
3204  0806 a609          	ld	a,#9
3205  0808 cd0000        	call	_parametersGetValue
3207  080b cd0000        	call	c_uitof
3209  080e aeef          	ld	x,#_windowMain$L-17
3210  0810 cd0000        	call	c_fsub
3212  0813 ae27          	ld	x,#high(L3331)
3213  0815 bf00          	ld	c_x,x
3214  0817 ae27          	ld	x,#low(L3331)
3215  0819 cd0000        	call	c_xfdiv
3217  081c aefb          	ld	x,#_windowMain$L-5
3218  081e cd0000        	call	c_rtol
3220                     ; 373 		dblPercentValue = (dblPercentValue>dblParamErrorZoom?dblParamErrorZoom:dblPercentValue);
3222  0821 aefb          	ld	x,#_windowMain$L-5
3223  0823 cd0000        	call	c_ltor
3225  0826 ae00          	ld	x,#high(_dblParamErrorZoom)
3226  0828 bf00          	ld	c_x,x
3227  082a ae00          	ld	x,#low(_dblParamErrorZoom)
3228  082c cd0000        	call	c_xfcmp
3230                     	jrle	L26
3231  0833 ae00          	ld	x,#high(_dblParamErrorZoom)
3232  0835 bf00          	ld	c_x,x
3233  0837 ae00          	ld	x,#low(_dblParamErrorZoom)
3234  0839 cd0000        	call	c_xltor
3236  083c 2005          	jra	L46
3237  083e               L26:
3238  083e aefb          	ld	x,#_windowMain$L-5
3239  0840 cd0000        	call	c_ltor
3241  0843               L46:
3242  0843 aefb          	ld	x,#_windowMain$L-5
3243  0845 cd0000        	call	c_rtol
3245                     ; 374 		dblPercentValue = (dblPercentValue<-dblParamErrorZoom?-dblParamErrorZoom:dblPercentValue);
3247  0848 ae00          	ld	x,#high(_dblParamErrorZoom)
3248  084a bf00          	ld	c_x,x
3249  084c ae00          	ld	x,#low(_dblParamErrorZoom)
3250  084e cd0000        	call	c_xltor
3252  0851 cd0000        	call	c_fneg
3254  0854 aefb          	ld	x,#_windowMain$L-5
3255  0856 cd0000        	call	c_fcmp
3257                     	jrle	L66
3258  085d ae00          	ld	x,#high(_dblParamErrorZoom)
3259  085f bf00          	ld	c_x,x
3260  0861 ae00          	ld	x,#low(_dblParamErrorZoom)
3261  0863 cd0000        	call	c_xltor
3263  0866 cd0000        	call	c_fneg
3265  0869 2005          	jra	L07
3266  086b               L66:
3267  086b aefb          	ld	x,#_windowMain$L-5
3268  086d cd0000        	call	c_ltor
3270  0870               L07:
3271  0870 aefb          	ld	x,#_windowMain$L-5
3272  0872 cd0000        	call	c_rtol
3274                     ; 375 		dblPercentValue = dblPercentValue  / dblParamErrorZoom;
3276  0875 aefb          	ld	x,#_windowMain$L-5
3277  0877 cd0000        	call	c_ltor
3279  087a ae00          	ld	x,#high(_dblParamErrorZoom)
3280  087c bf00          	ld	c_x,x
3281  087e ae00          	ld	x,#low(_dblParamErrorZoom)
3282  0880 cd0000        	call	c_xfdiv
3284  0883 aefb          	ld	x,#_windowMain$L-5
3285  0885 cd0000        	call	c_rtol
3287                     ; 377 		displayWriteString("-", DISPLAY_SELECT_FONT_MINI, WINDOW_3_LEFT + 4								 , 	byRulerTop - 3);
3289  0888 b6ff          	ld	a,_windowMain$L-1
3290  088a a003          	sub	a,#3
3291  088c b704          	ld	_displayWriteString$L+4,a
3292  088e a604          	ld	a,#4
3293  0890 b703          	ld	_displayWriteString$L+3,a
3294  0892 a61c          	ld	a,#28
3295  0894 b702          	ld	_displayWriteString$L+2,a
3296  0896 a625          	ld	a,#low(L7331)
3297  0898 ae25          	ld	x,#high(L7331)
3298  089a cd0000        	call	_displayWriteString
3300                     ; 378 		displayWriteString("+", DISPLAY_SELECT_FONT_MINI, WINDOW_3_LEFT + 4 + (WINDOW_3_WIDTH - 11)		 , 	byRulerTop - 3);
3302  089d b6ff          	ld	a,_windowMain$L-1
3303  089f a003          	sub	a,#3
3304  08a1 b704          	ld	_displayWriteString$L+4,a
3305  08a3 a677          	ld	a,#119
3306  08a5 b703          	ld	_displayWriteString$L+3,a
3307  08a7 a61c          	ld	a,#28
3308  08a9 b702          	ld	_displayWriteString$L+2,a
3309  08ab a623          	ld	a,#low(L1431)
3310  08ad ae23          	ld	x,#high(L1431)
3311  08af cd0000        	call	_displayWriteString
3313                     ; 382 		if (m_byCurrentSelectorX>0)
3315  08b2 c60007        	ld	a,_m_byCurrentSelectorX
3316  08b5 4d            	tnz	a
3317  08b6 2717          	jreq	L3431
3318                     ; 384 			displayClearArea(m_byCurrentSelectorX-1, byRulerTop - 11, m_byCurrentSelectorX+1, byRulerTop-3);
3320  08b8 b6ff          	ld	a,_windowMain$L-1
3321  08ba a003          	sub	a,#3
3322  08bc b703          	ld	_displayClearArea$L+3,a
3323  08be c60007        	ld	a,_m_byCurrentSelectorX
3324  08c1 4c            	inc	a
3325  08c2 b702          	ld	_displayClearArea$L+2,a
3326  08c4 b6ff          	ld	a,_windowMain$L-1
3327  08c6 a00b          	sub	a,#11
3328  08c8 ce0007        	ld	x,_m_byCurrentSelectorX
3329  08cb 5a            	dec	x
3330  08cc cd0000        	call	_displayClearArea
3332  08cf               L3431:
3333                     ; 387 		m_byCurrentSelectorX = WINDOW_3_LEFT + 5 + ((WINDOW_3_WIDTH - 11) / 2 * (dblPercentValue + 1));
3335  08cf aefb          	ld	x,#_windowMain$L-5
3336  08d1 cd0000        	call	c_ltor
3338  08d4 ae1f          	ld	x,#high(L1531)
3339  08d6 bf00          	ld	c_x,x
3340  08d8 ae1f          	ld	x,#low(L1531)
3341  08da cd0000        	call	c_xfadd
3343  08dd ae1b          	ld	x,#high(L1631)
3344  08df bf00          	ld	c_x,x
3345  08e1 ae1b          	ld	x,#low(L1631)
3346  08e3 cd0000        	call	c_xfmul
3348  08e6 ae17          	ld	x,#high(L1731)
3349  08e8 bf00          	ld	c_x,x
3350  08ea ae17          	ld	x,#low(L1731)
3351  08ec cd0000        	call	c_xfadd
3353  08ef cd0000        	call	c_ftoi
3355  08f2 c70007        	ld	_m_byCurrentSelectorX,a
3356                     ; 388 		displayDrawSelector( m_byCurrentSelectorX, byRulerTop - 11,  (dblPercentValue != 0), true);
3358  08f5 a601          	ld	a,#1
3359  08f7 b703          	ld	_displayDrawSelector$L+3,a
3360  08f9 b6fb          	ld	a,_windowMain$L-5
3361  08fb 2704          	jreq	L27
3362  08fd a601          	ld	a,#1
3363  08ff 2001          	jra	L47
3364  0901               L27:
3365  0901 4f            	clr	a
3366  0902               L47:
3367  0902 b702          	ld	_displayDrawSelector$L+2,a
3368  0904 b6ff          	ld	a,_windowMain$L-1
3369  0906 a00b          	sub	a,#11
3370  0908 ce0007        	ld	x,_m_byCurrentSelectorX
3371  090b cd0000        	call	_displayDrawSelector
3373                     ; 391 		windowMainPrepareFormateValue(strString);
3375  090e a6f3          	ld	a,#_windowMain$L-13
3376  0910 5f            	clr	x
3377  0911 cd0672        	call	_windowMainPrepareFormateValue
3379                     ; 392 		displayWriteString(strString, DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+42, byRulerTop + 18);	
3381  0914 b6ff          	ld	a,_windowMain$L-1
3382  0916 ab12          	add	a,#18
3383  0918 b704          	ld	_displayWriteString$L+4,a
3384  091a a62a          	ld	a,#42
3385  091c b703          	ld	_displayWriteString$L+3,a
3386  091e a61d          	ld	a,#29
3387  0920 b702          	ld	_displayWriteString$L+2,a
3388  0922 a6f3          	ld	a,#_windowMain$L-13
3389  0924 5f            	clr	x
3390  0925 cd0000        	call	_displayWriteString
3392                     ; 394 		parametersChangedFlagReset(PARAM_OUT_VISCOSITY);
3394  0928 a609          	ld	a,#9
3395  092a cd0000        	call	_parametersChangedFlagReset
3397                     ; 395 		parametersChangedFlagReset(PARAM_REF_VISCOSITY);
3399  092d a60b          	ld	a,#11
3400  092f cd0000        	call	_parametersChangedFlagReset
3402  0932               L1231:
3403                     ; 398 	if (parametersIsChanged(PARAM_VALVES) || (!_btst(m_woDisplayedWindow, WIN_MAIN)))
3405  0932 a611          	ld	a,#17
3406  0934 cd0000        	call	_parametersIsChanged
3408  0937 4d            	tnz	a
3409  0938 2607          	jrne	L7731
3411  093a c60006        	ld	a,_m_woDisplayedWindow+1
3412  093d a508          	bcp	a,#8
3413  093f 260d          	jrne	L5731
3414  0941               L7731:
3415                     ; 401 		displayDrawValveStatus(WINDOW_3_LEFT, byRulerTop+3);
3417  0941 b6ff          	ld	a,_windowMain$L-1
3418  0943 ab03          	add	a,#3
3419  0945 5f            	clr	x
3420  0946 cd0000        	call	_displayDrawValveStatus
3422                     ; 402 		parametersChangedFlagReset(PARAM_VALVES);
3424  0949 a611          	ld	a,#17
3425  094b cd0000        	call	_parametersChangedFlagReset
3427  094e               L5731:
3428                     ; 428 	_bset(m_woDisplayedWindow, WIN_MAIN);
3430  094e c60006        	ld	a,_m_woDisplayedWindow+1
3431  0951 aa08          	or	a,#8
3432  0953 c70006        	ld	_m_woDisplayedWindow+1,a
3433                     ; 429 	_bres(m_woDisplayedWindow, WIN_ALARM);
3435  0956 c60006        	ld	a,_m_woDisplayedWindow+1
3436  0959 a4ef          	and	a,#239
3437  095b c70006        	ld	_m_woDisplayedWindow+1,a
3438                     ; 430 	_bres(m_woDisplayedWindow, WIN_MESSAGE);
3440  095e c60006        	ld	a,_m_woDisplayedWindow+1
3441  0961 a4df          	and	a,#223
3442  0963 c70006        	ld	_m_woDisplayedWindow+1,a
3443                     ; 431 	_bres(m_woDisplayedWindow, WIN_SETUP);
3445  0966 c60006        	ld	a,_m_woDisplayedWindow+1
3446  0969 a4ff          	and	a,#255
3447  096b c70006        	ld	_m_woDisplayedWindow+1,a
3448  096e c60005        	ld	a,_m_woDisplayedWindow
3449  0971 a4fb          	and	a,#251
3450  0973 c70005        	ld	_m_woDisplayedWindow,a
3451                     ; 432 	_bres(m_woDisplayedWindow, WIN_MENUS);
3453  0976 c60006        	ld	a,_m_woDisplayedWindow+1
3454  0979 a4ff          	and	a,#255
3455  097b c70006        	ld	_m_woDisplayedWindow+1,a
3456  097e c60005        	ld	a,_m_woDisplayedWindow
3457  0981 a4fd          	and	a,#253
3458  0983 c70005        	ld	_m_woDisplayedWindow,a
3459                     ; 433 	_bres(m_woDisplayedWindow, WIN_ARCHIVES);
3461  0986 c60006        	ld	a,_m_woDisplayedWindow+1
3462  0989 a4ff          	and	a,#255
3463  098b c70006        	ld	_m_woDisplayedWindow+1,a
3464  098e c60005        	ld	a,_m_woDisplayedWindow
3465  0991 a4f7          	and	a,#247
3466  0993 c70005        	ld	_m_woDisplayedWindow,a
3467                     ; 434 	_bres(m_woDisplayedWindow, WIN_6MESSAGES);
3469  0996 c60006        	ld	a,_m_woDisplayedWindow+1
3470  0999 a4ff          	and	a,#255
3471  099b c70006        	ld	_m_woDisplayedWindow+1,a
3472  099e c60005        	ld	a,_m_woDisplayedWindow
3473  09a1 a4bf          	and	a,#191
3474  09a3 c70005        	ld	_m_woDisplayedWindow,a
3475                     ; 435 }
3478  09a6 81            	ret
3531                     ; 438 void window6Menu(BYTE * a_byGroup, BYTE * a_bySelected)
3531                     ; 439 {
3532                     	switch	.text
3534                     	xref.b	_window6Menu$L
3535  09a7               _window6Menu:
3537  09a7 b701          	ld	_window6Menu$L+1,a
3538  09a9 bf00          	ld	_window6Menu$L,x
3540                     ; 440 	if ( !  (	((*a_byGroup == MENU_GROUP_MENU) 		&& _btst(m_woDisplayedWindow, WIN_MENUS)) ||
3540                     ; 441 				((*a_byGroup == MENU_GROUP_ARCHIVE) 	&& _btst(m_woDisplayedWindow, WIN_ARCHIVES)) ||
3540                     ; 442 				((*a_byGroup == MENU_GROUP_CUP) 	&& _btst(m_woDisplayedWindow, WIN_CUP)) 
3540                     ; 443 			))  // Is not only a refresh
3542  09ab 92c600        	ld	a,[_window6Menu$L.w]
3543  09ae a101          	cp	a,#1
3544  09b0 260a          	jrne	L3341
3546  09b2 c60005        	ld	a,_m_woDisplayedWindow
3547  09b5 a502          	bcp	a,#2
3548  09b7 2703          	jreq	L051
3549  09b9 cc0c81        	jp	L1341
3550  09bc               L051:
3551  09bc               L3341:
3553  09bc 92c600        	ld	a,[_window6Menu$L.w]
3554  09bf a102          	cp	a,#2
3555  09c1 260a          	jrne	L5341
3557  09c3 c60005        	ld	a,_m_woDisplayedWindow
3558  09c6 a508          	bcp	a,#8
3559  09c8 2703          	jreq	L251
3560  09ca cc0c81        	jp	L1341
3561  09cd               L251:
3562  09cd               L5341:
3564  09cd 92c600        	ld	a,[_window6Menu$L.w]
3565  09d0 a103          	cp	a,#3
3566  09d2 260a          	jrne	L7341
3568  09d4 c60005        	ld	a,_m_woDisplayedWindow
3569  09d7 a580          	bcp	a,#128
3570  09d9 2703          	jreq	L451
3571  09db cc0c81        	jp	L1341
3572  09de               L451:
3573  09de               L7341:
3574                     ; 445 		displayClearArea(0,0,126,64);
3576  09de a640          	ld	a,#64
3577  09e0 b703          	ld	_displayClearArea$L+3,a
3578  09e2 a67e          	ld	a,#126
3579  09e4 b702          	ld	_displayClearArea$L+2,a
3580  09e6 4f            	clr	a
3581  09e7 5f            	clr	x
3582  09e8 cd0000        	call	_displayClearArea
3584                     ; 447 		switch(*a_byGroup)
3586  09eb 92c600        	ld	a,[_window6Menu$L.w]
3588                     ; 497 				break;
3589  09ee 4a            	dec	a
3590  09ef 270f          	jreq	L1041
3591  09f1 4a            	dec	a
3592  09f2 2603          	jrne	L651
3593  09f4 cc0ad2        	jp	L3041
3594  09f7               L651:
3595  09f7 4a            	dec	a
3596  09f8 2603          	jrne	L061
3597  09fa cc0b56        	jp	L5041
3598  09fd               L061:
3599  09fd cc0bd5        	jp	L3441
3600  0a00               L1041:
3601                     ; 449 			case MENU_GROUP_MENU:
3601                     ; 450 				displayWriteString("1", 			DISPLAY_SELECT_FONT_10x14, 	2, 		17);
3603  0a00 a611          	ld	a,#17
3604  0a02 b704          	ld	_displayWriteString$L+4,a
3605  0a04 a602          	ld	a,#2
3606  0a06 b703          	ld	_displayWriteString$L+3,a
3607  0a08 a61e          	ld	a,#30
3608  0a0a b702          	ld	_displayWriteString$L+2,a
3609  0a0c a615          	ld	a,#low(L5441)
3610  0a0e ae15          	ld	x,#high(L5441)
3611  0a10 cd0000        	call	_displayWriteString
3613                     ; 451 				displayWriteString("2", 			DISPLAY_NULL, 				2, 		39);
3615  0a13 a627          	ld	a,#39
3616  0a15 b704          	ld	_displayWriteString$L+4,a
3617  0a17 a602          	ld	a,#2
3618  0a19 b703          	ld	_displayWriteString$L+3,a
3619  0a1b a6ff          	ld	a,#255
3620  0a1d b702          	ld	_displayWriteString$L+2,a
3621  0a1f a613          	ld	a,#low(L7441)
3622  0a21 ae13          	ld	x,#high(L7441)
3623  0a23 cd0000        	call	_displayWriteString
3625                     ; 452 				displayWriteString("3", 			DISPLAY_NULL, 				2, 		61);
3627  0a26 a63d          	ld	a,#61
3628  0a28 b704          	ld	_displayWriteString$L+4,a
3629  0a2a a602          	ld	a,#2
3630  0a2c b703          	ld	_displayWriteString$L+3,a
3631  0a2e a6ff          	ld	a,#255
3632  0a30 b702          	ld	_displayWriteString$L+2,a
3633  0a32 a611          	ld	a,#low(L1541)
3634  0a34 ae11          	ld	x,#high(L1541)
3635  0a36 cd0000        	call	_displayWriteString
3637                     ; 453 				displayWriteString("4", 			DISPLAY_NULL, 				67,		17);
3639  0a39 a611          	ld	a,#17
3640  0a3b b704          	ld	_displayWriteString$L+4,a
3641  0a3d a643          	ld	a,#67
3642  0a3f b703          	ld	_displayWriteString$L+3,a
3643  0a41 a6ff          	ld	a,#255
3644  0a43 b702          	ld	_displayWriteString$L+2,a
3645  0a45 a60f          	ld	a,#low(L3541)
3646  0a47 ae0f          	ld	x,#high(L3541)
3647  0a49 cd0000        	call	_displayWriteString
3649                     ; 457 				displayWriteString(labelGet(LABEL_CALIBRATION),						DISPLAY_SELECT_FONT_MINI, 	13, 	9);
3651  0a4c a609          	ld	a,#9
3652  0a4e b704          	ld	_displayWriteString$L+4,a
3653  0a50 a60d          	ld	a,#13
3654  0a52 b703          	ld	_displayWriteString$L+3,a
3655  0a54 a61c          	ld	a,#28
3656  0a56 b702          	ld	_displayWriteString$L+2,a
3657  0a58 a617          	ld	a,#23
3658  0a5a cd0000        	call	_labelGet
3660  0a5d cd0000        	call	_displayWriteString
3662                     ; 458 				displayWriteString(labelGet(LABEL_SETUP), 								DISPLAY_NULL, 				13, 	31);
3664  0a60 a61f          	ld	a,#31
3665  0a62 b704          	ld	_displayWriteString$L+4,a
3666  0a64 a60d          	ld	a,#13
3667  0a66 b703          	ld	_displayWriteString$L+3,a
3668  0a68 a6ff          	ld	a,#255
3669  0a6a b702          	ld	_displayWriteString$L+2,a
3670  0a6c a618          	ld	a,#24
3671  0a6e cd0000        	call	_labelGet
3673  0a71 cd0000        	call	_displayWriteString
3675                     ; 460 				displayWriteString(labelGet(LABEL_SW_VERSION_01), 				DISPLAY_NULL, 				13, 	52);
3677  0a74 a634          	ld	a,#52
3678  0a76 b704          	ld	_displayWriteString$L+4,a
3679  0a78 a60d          	ld	a,#13
3680  0a7a b703          	ld	_displayWriteString$L+3,a
3681  0a7c a6ff          	ld	a,#255
3682  0a7e b702          	ld	_displayWriteString$L+2,a
3683  0a80 a60c          	ld	a,#12
3684  0a82 cd0000        	call	_labelGet
3686  0a85 cd0000        	call	_displayWriteString
3688                     ; 461 				displayWriteString(labelGet(LABEL_SW_VERSION_02), 				DISPLAY_NULL, 				13, 	61);
3690  0a88 a63d          	ld	a,#61
3691  0a8a b704          	ld	_displayWriteString$L+4,a
3692  0a8c a60d          	ld	a,#13
3693  0a8e b703          	ld	_displayWriteString$L+3,a
3694  0a90 a6ff          	ld	a,#255
3695  0a92 b702          	ld	_displayWriteString$L+2,a
3696  0a94 a60d          	ld	a,#13
3697  0a96 cd0000        	call	_labelGet
3699  0a99 cd0000        	call	_displayWriteString
3701                     ; 462 				displayWriteString(labelGet(LABEL_RESET_CALIBRATION_01), 	DISPLAY_NULL, 				78, 	9);
3703  0a9c a609          	ld	a,#9
3704  0a9e b704          	ld	_displayWriteString$L+4,a
3705  0aa0 a64e          	ld	a,#78
3706  0aa2 b703          	ld	_displayWriteString$L+3,a
3707  0aa4 a6ff          	ld	a,#255
3708  0aa6 b702          	ld	_displayWriteString$L+2,a
3709  0aa8 a625          	ld	a,#37
3710  0aaa cd0000        	call	_labelGet
3712  0aad cd0000        	call	_displayWriteString
3714                     ; 463 				displayWriteString(labelGet(LABEL_RESET_CALIBRATION_02), 	DISPLAY_NULL, 				78, 	18);
3716  0ab0 a612          	ld	a,#18
3717  0ab2 b704          	ld	_displayWriteString$L+4,a
3718  0ab4 a64e          	ld	a,#78
3719  0ab6 b703          	ld	_displayWriteString$L+3,a
3720  0ab8 a6ff          	ld	a,#255
3721  0aba b702          	ld	_displayWriteString$L+2,a
3722  0abc a626          	ld	a,#38
3723  0abe cd0000        	call	_labelGet
3725  0ac1 cd0000        	call	_displayWriteString
3727                     ; 465 				windowForceRepaint();
3729  0ac4 cd000c        	call	_windowForceRepaint
3731                     ; 466 				_bset(m_woDisplayedWindow, WIN_MENUS);
3733  0ac7 c60005        	ld	a,_m_woDisplayedWindow
3734  0aca aa02          	or	a,#2
3735  0acc c70005        	ld	_m_woDisplayedWindow,a
3736                     ; 467 				break;
3738  0acf cc0bd5        	jp	L3441
3739  0ad2               L3041:
3740                     ; 468 			case MENU_GROUP_ARCHIVE:
3740                     ; 469 				displayWriteString("1", 			DISPLAY_SELECT_FONT_10x14, 	2, 		17);
3742  0ad2 a611          	ld	a,#17
3743  0ad4 b704          	ld	_displayWriteString$L+4,a
3744  0ad6 a602          	ld	a,#2
3745  0ad8 b703          	ld	_displayWriteString$L+3,a
3746  0ada a61e          	ld	a,#30
3747  0adc b702          	ld	_displayWriteString$L+2,a
3748  0ade a615          	ld	a,#low(L5441)
3749  0ae0 ae15          	ld	x,#high(L5441)
3750  0ae2 cd0000        	call	_displayWriteString
3752                     ; 470 				displayWriteString("2", 			DISPLAY_NULL, 				2, 		39);
3754  0ae5 a627          	ld	a,#39
3755  0ae7 b704          	ld	_displayWriteString$L+4,a
3756  0ae9 a602          	ld	a,#2
3757  0aeb b703          	ld	_displayWriteString$L+3,a
3758  0aed a6ff          	ld	a,#255
3759  0aef b702          	ld	_displayWriteString$L+2,a
3760  0af1 a613          	ld	a,#low(L7441)
3761  0af3 ae13          	ld	x,#high(L7441)
3762  0af5 cd0000        	call	_displayWriteString
3764                     ; 476 				displayWriteString(labelGet(LABEL_SAVE_JOB_01),				DISPLAY_SELECT_FONT_MINI, 	13, 	9);
3766  0af8 a609          	ld	a,#9
3767  0afa b704          	ld	_displayWriteString$L+4,a
3768  0afc a60d          	ld	a,#13
3769  0afe b703          	ld	_displayWriteString$L+3,a
3770  0b00 a61c          	ld	a,#28
3771  0b02 b702          	ld	_displayWriteString$L+2,a
3772  0b04 a612          	ld	a,#18
3773  0b06 cd0000        	call	_labelGet
3775  0b09 cd0000        	call	_displayWriteString
3777                     ; 477 				displayWriteString(labelGet(LABEL_SAVE_JOB_02), 			DISPLAY_NULL, 				13, 	18);
3779  0b0c a612          	ld	a,#18
3780  0b0e b704          	ld	_displayWriteString$L+4,a
3781  0b10 a60d          	ld	a,#13
3782  0b12 b703          	ld	_displayWriteString$L+3,a
3783  0b14 a6ff          	ld	a,#255
3784  0b16 b702          	ld	_displayWriteString$L+2,a
3785  0b18 a613          	ld	a,#19
3786  0b1a cd0000        	call	_labelGet
3788  0b1d cd0000        	call	_displayWriteString
3790                     ; 478 				displayWriteString(labelGet(LABEL_LOAD_JOB_01), 			DISPLAY_NULL, 				13, 	31);
3792  0b20 a61f          	ld	a,#31
3793  0b22 b704          	ld	_displayWriteString$L+4,a
3794  0b24 a60d          	ld	a,#13
3795  0b26 b703          	ld	_displayWriteString$L+3,a
3796  0b28 a6ff          	ld	a,#255
3797  0b2a b702          	ld	_displayWriteString$L+2,a
3798  0b2c a614          	ld	a,#20
3799  0b2e cd0000        	call	_labelGet
3801  0b31 cd0000        	call	_displayWriteString
3803                     ; 479 				displayWriteString(labelGet(LABEL_LOAD_JOB_02), 			DISPLAY_NULL, 				13, 	40);
3805  0b34 a628          	ld	a,#40
3806  0b36 b704          	ld	_displayWriteString$L+4,a
3807  0b38 a60d          	ld	a,#13
3808  0b3a b703          	ld	_displayWriteString$L+3,a
3809  0b3c a6ff          	ld	a,#255
3810  0b3e b702          	ld	_displayWriteString$L+2,a
3811  0b40 a615          	ld	a,#21
3812  0b42 cd0000        	call	_labelGet
3814  0b45 cd0000        	call	_displayWriteString
3816                     ; 480 				windowForceRepaint();
3818  0b48 cd000c        	call	_windowForceRepaint
3820                     ; 481 				_bset(m_woDisplayedWindow, WIN_ARCHIVES);
3822  0b4b c60005        	ld	a,_m_woDisplayedWindow
3823  0b4e aa08          	or	a,#8
3824  0b50 c70005        	ld	_m_woDisplayedWindow,a
3825                     ; 482 				break;
3827  0b53 cc0bd5        	jp	L3441
3828  0b56               L5041:
3829                     ; 483 			case MENU_GROUP_CUP:
3829                     ; 484 				displayWriteString("1", 			DISPLAY_SELECT_FONT_10x14, 	2, 		17);
3831  0b56 a611          	ld	a,#17
3832  0b58 b704          	ld	_displayWriteString$L+4,a
3833  0b5a a602          	ld	a,#2
3834  0b5c b703          	ld	_displayWriteString$L+3,a
3835  0b5e a61e          	ld	a,#30
3836  0b60 b702          	ld	_displayWriteString$L+2,a
3837  0b62 a615          	ld	a,#low(L5441)
3838  0b64 ae15          	ld	x,#high(L5441)
3839  0b66 cd0000        	call	_displayWriteString
3841                     ; 485 				displayWriteString("2", 			DISPLAY_NULL, 				2, 		39);
3843  0b69 a627          	ld	a,#39
3844  0b6b b704          	ld	_displayWriteString$L+4,a
3845  0b6d a602          	ld	a,#2
3846  0b6f b703          	ld	_displayWriteString$L+3,a
3847  0b71 a6ff          	ld	a,#255
3848  0b73 b702          	ld	_displayWriteString$L+2,a
3849  0b75 a613          	ld	a,#low(L7441)
3850  0b77 ae13          	ld	x,#high(L7441)
3851  0b79 cd0000        	call	_displayWriteString
3853                     ; 491 				displayWriteString(labelGet(LABEL_CUP),								DISPLAY_SELECT_FONT_MINI, 	13, 	9);
3855  0b7c a609          	ld	a,#9
3856  0b7e b704          	ld	_displayWriteString$L+4,a
3857  0b80 a60d          	ld	a,#13
3858  0b82 b703          	ld	_displayWriteString$L+3,a
3859  0b84 a61c          	ld	a,#28
3860  0b86 b702          	ld	_displayWriteString$L+2,a
3861  0b88 a623          	ld	a,#35
3862  0b8a cd0000        	call	_labelGet
3864  0b8d cd0000        	call	_displayWriteString
3866                     ; 492 				displayWriteString("Ford 4", 								DISPLAY_NULL, 				13, 	18);
3868  0b90 a612          	ld	a,#18
3869  0b92 b704          	ld	_displayWriteString$L+4,a
3870  0b94 a60d          	ld	a,#13
3871  0b96 b703          	ld	_displayWriteString$L+3,a
3872  0b98 a6ff          	ld	a,#255
3873  0b9a b702          	ld	_displayWriteString$L+2,a
3874  0b9c a608          	ld	a,#low(L5541)
3875  0b9e ae08          	ld	x,#high(L5541)
3876  0ba0 cd0000        	call	_displayWriteString
3878                     ; 493 				displayWriteString(labelGet(LABEL_CUP), 						  DISPLAY_NULL, 				13, 	31);
3880  0ba3 a61f          	ld	a,#31
3881  0ba5 b704          	ld	_displayWriteString$L+4,a
3882  0ba7 a60d          	ld	a,#13
3883  0ba9 b703          	ld	_displayWriteString$L+3,a
3884  0bab a6ff          	ld	a,#255
3885  0bad b702          	ld	_displayWriteString$L+2,a
3886  0baf a623          	ld	a,#35
3887  0bb1 cd0000        	call	_labelGet
3889  0bb4 cd0000        	call	_displayWriteString
3891                     ; 494 				displayWriteString("Zhan 2", 								DISPLAY_NULL, 				13, 	40);
3893  0bb7 a628          	ld	a,#40
3894  0bb9 b704          	ld	_displayWriteString$L+4,a
3895  0bbb a60d          	ld	a,#13
3896  0bbd b703          	ld	_displayWriteString$L+3,a
3897  0bbf a6ff          	ld	a,#255
3898  0bc1 b702          	ld	_displayWriteString$L+2,a
3899  0bc3 a601          	ld	a,#low(L7541)
3900  0bc5 ae01          	ld	x,#high(L7541)
3901  0bc7 cd0000        	call	_displayWriteString
3903                     ; 495 				windowForceRepaint();
3905  0bca cd000c        	call	_windowForceRepaint
3907                     ; 496 				_bset(m_woDisplayedWindow, WIN_CUP);
3909  0bcd c60005        	ld	a,_m_woDisplayedWindow
3910  0bd0 aa80          	or	a,#128
3911  0bd2 c70005        	ld	_m_woDisplayedWindow,a
3912                     ; 497 				break;
3914  0bd5               L3441:
3915                     ; 501 		displaySetOutLine(0, 	0, 	63, 	20, 	(*a_bySelected == 1));
3917  0bd5 92c602        	ld	a,[_window6Menu$L+2.w]
3918  0bd8 a101          	cp	a,#1
3919  0bda 2604          	jrne	L401
3920  0bdc a601          	ld	a,#1
3921  0bde 2001          	jra	L601
3922  0be0               L401:
3923  0be0 4f            	clr	a
3924  0be1               L601:
3925  0be1 b704          	ld	_displaySetOutLine$L+4,a
3926  0be3 a614          	ld	a,#20
3927  0be5 b703          	ld	_displaySetOutLine$L+3,a
3928  0be7 a63f          	ld	a,#63
3929  0be9 b702          	ld	_displaySetOutLine$L+2,a
3930  0beb 4f            	clr	a
3931  0bec 5f            	clr	x
3932  0bed cd0000        	call	_displaySetOutLine
3934                     ; 502 		displaySetOutLine(0, 	22, 63, 	42, 	(*a_bySelected == 2));
3936  0bf0 92c602        	ld	a,[_window6Menu$L+2.w]
3937  0bf3 a102          	cp	a,#2
3938  0bf5 2604          	jrne	L011
3939  0bf7 a601          	ld	a,#1
3940  0bf9 2001          	jra	L211
3941  0bfb               L011:
3942  0bfb 4f            	clr	a
3943  0bfc               L211:
3944  0bfc b704          	ld	_displaySetOutLine$L+4,a
3945  0bfe a62a          	ld	a,#42
3946  0c00 b703          	ld	_displaySetOutLine$L+3,a
3947  0c02 a63f          	ld	a,#63
3948  0c04 b702          	ld	_displaySetOutLine$L+2,a
3949  0c06 a616          	ld	a,#22
3950  0c08 5f            	clr	x
3951  0c09 cd0000        	call	_displaySetOutLine
3953                     ; 503 		displaySetOutLine(0, 	44, 63, 	64, 	(*a_bySelected == 3));
3955  0c0c 92c602        	ld	a,[_window6Menu$L+2.w]
3956  0c0f a103          	cp	a,#3
3957  0c11 2604          	jrne	L411
3958  0c13 a601          	ld	a,#1
3959  0c15 2001          	jra	L611
3960  0c17               L411:
3961  0c17 4f            	clr	a
3962  0c18               L611:
3963  0c18 b704          	ld	_displaySetOutLine$L+4,a
3964  0c1a a640          	ld	a,#64
3965  0c1c b703          	ld	_displaySetOutLine$L+3,a
3966  0c1e a63f          	ld	a,#63
3967  0c20 b702          	ld	_displaySetOutLine$L+2,a
3968  0c22 a62c          	ld	a,#44
3969  0c24 5f            	clr	x
3970  0c25 cd0000        	call	_displaySetOutLine
3972                     ; 504 		displaySetOutLine(65, 	0, 	126, 	20, 	(*a_bySelected == 4));
3974  0c28 92c602        	ld	a,[_window6Menu$L+2.w]
3975  0c2b a104          	cp	a,#4
3976  0c2d 2604          	jrne	L021
3977  0c2f a601          	ld	a,#1
3978  0c31 2001          	jra	L221
3979  0c33               L021:
3980  0c33 4f            	clr	a
3981  0c34               L221:
3982  0c34 b704          	ld	_displaySetOutLine$L+4,a
3983  0c36 a614          	ld	a,#20
3984  0c38 b703          	ld	_displaySetOutLine$L+3,a
3985  0c3a a67e          	ld	a,#126
3986  0c3c b702          	ld	_displaySetOutLine$L+2,a
3987  0c3e 4f            	clr	a
3988  0c3f ae41          	ld	x,#65
3989  0c41 cd0000        	call	_displaySetOutLine
3991                     ; 505 		displaySetOutLine(65, 	22, 126, 	42, 	(*a_bySelected == 5));
3993  0c44 92c602        	ld	a,[_window6Menu$L+2.w]
3994  0c47 a105          	cp	a,#5
3995  0c49 2604          	jrne	L421
3996  0c4b a601          	ld	a,#1
3997  0c4d 2001          	jra	L621
3998  0c4f               L421:
3999  0c4f 4f            	clr	a
4000  0c50               L621:
4001  0c50 b704          	ld	_displaySetOutLine$L+4,a
4002  0c52 a62a          	ld	a,#42
4003  0c54 b703          	ld	_displaySetOutLine$L+3,a
4004  0c56 a67e          	ld	a,#126
4005  0c58 b702          	ld	_displaySetOutLine$L+2,a
4006  0c5a a616          	ld	a,#22
4007  0c5c ae41          	ld	x,#65
4008  0c5e cd0000        	call	_displaySetOutLine
4010                     ; 506 		displaySetOutLine(65, 	44,	126, 	64, 	(*a_bySelected == 6));
4012  0c61 92c602        	ld	a,[_window6Menu$L+2.w]
4013  0c64 a106          	cp	a,#6
4014  0c66 2604          	jrne	L031
4015  0c68 a601          	ld	a,#1
4016  0c6a 2001          	jra	L231
4017  0c6c               L031:
4018  0c6c 4f            	clr	a
4019  0c6d               L231:
4020  0c6d b704          	ld	_displaySetOutLine$L+4,a
4021  0c6f a640          	ld	a,#64
4022  0c71 b703          	ld	_displaySetOutLine$L+3,a
4023  0c73 a67e          	ld	a,#126
4024  0c75 b702          	ld	_displaySetOutLine$L+2,a
4025  0c77 a62c          	ld	a,#44
4026  0c79 ae41          	ld	x,#65
4027  0c7b cd0000        	call	_displaySetOutLine
4030  0c7e cc0d53        	jp	L1641
4031  0c81               L1341:
4032                     ; 511 		if ((*a_bySelected == 1) || parametersGetValue(PARAM_PAGE_SEL) == 1)
4034  0c81 92c602        	ld	a,[_window6Menu$L+2.w]
4035  0c84 a101          	cp	a,#1
4036  0c86 270d          	jreq	L5641
4038  0c88 a60f          	ld	a,#15
4039  0c8a cd0000        	call	_parametersGetValue
4041  0c8d a101          	cp	a,#1
4042  0c8f 2602          	jrne	L431
4043  0c91 a300          	cp	x,#0
4044  0c93               L431:
4045  0c93 260f          	jrne	L3641
4046  0c95               L5641:
4047                     ; 512 			displayInvertArea(1, 	1, 	62, 	19);
4049  0c95 a613          	ld	a,#19
4050  0c97 b703          	ld	_displayInvertArea$L+3,a
4051  0c99 a63e          	ld	a,#62
4052  0c9b b702          	ld	_displayInvertArea$L+2,a
4053  0c9d a601          	ld	a,#1
4054  0c9f ae01          	ld	x,#1
4055  0ca1 cd0000        	call	_displayInvertArea
4057  0ca4               L3641:
4058                     ; 514 		if ((*a_bySelected == 2) || parametersGetValue(PARAM_PAGE_SEL) == 2)
4060  0ca4 92c602        	ld	a,[_window6Menu$L+2.w]
4061  0ca7 a102          	cp	a,#2
4062  0ca9 270d          	jreq	L1741
4064  0cab a60f          	ld	a,#15
4065  0cad cd0000        	call	_parametersGetValue
4067  0cb0 a102          	cp	a,#2
4068  0cb2 2602          	jrne	L631
4069  0cb4 a300          	cp	x,#0
4070  0cb6               L631:
4071  0cb6 260f          	jrne	L7641
4072  0cb8               L1741:
4073                     ; 515 			displayInvertArea(1, 	23, 62, 	41);
4075  0cb8 a629          	ld	a,#41
4076  0cba b703          	ld	_displayInvertArea$L+3,a
4077  0cbc a63e          	ld	a,#62
4078  0cbe b702          	ld	_displayInvertArea$L+2,a
4079  0cc0 a617          	ld	a,#23
4080  0cc2 ae01          	ld	x,#1
4081  0cc4 cd0000        	call	_displayInvertArea
4083  0cc7               L7641:
4084                     ; 517 		if ((*a_bySelected == 3) || parametersGetValue(PARAM_PAGE_SEL) == 3)
4086  0cc7 92c602        	ld	a,[_window6Menu$L+2.w]
4087  0cca a103          	cp	a,#3
4088  0ccc 270d          	jreq	L5741
4090  0cce a60f          	ld	a,#15
4091  0cd0 cd0000        	call	_parametersGetValue
4093  0cd3 a103          	cp	a,#3
4094  0cd5 2602          	jrne	L041
4095  0cd7 a300          	cp	x,#0
4096  0cd9               L041:
4097  0cd9 260f          	jrne	L3741
4098  0cdb               L5741:
4099                     ; 518 			displayInvertArea(1, 	45, 62, 	63);
4101  0cdb a63f          	ld	a,#63
4102  0cdd b703          	ld	_displayInvertArea$L+3,a
4103  0cdf a63e          	ld	a,#62
4104  0ce1 b702          	ld	_displayInvertArea$L+2,a
4105  0ce3 a62d          	ld	a,#45
4106  0ce5 ae01          	ld	x,#1
4107  0ce7 cd0000        	call	_displayInvertArea
4109  0cea               L3741:
4110                     ; 520 		if ((*a_bySelected == 4) || parametersGetValue(PARAM_PAGE_SEL) == 4)
4112  0cea 92c602        	ld	a,[_window6Menu$L+2.w]
4113  0ced a104          	cp	a,#4
4114  0cef 270d          	jreq	L1051
4116  0cf1 a60f          	ld	a,#15
4117  0cf3 cd0000        	call	_parametersGetValue
4119  0cf6 a104          	cp	a,#4
4120  0cf8 2602          	jrne	L241
4121  0cfa a300          	cp	x,#0
4122  0cfc               L241:
4123  0cfc 260f          	jrne	L7741
4124  0cfe               L1051:
4125                     ; 521 			displayInvertArea(66, 	1, 	125, 	19);
4127  0cfe a613          	ld	a,#19
4128  0d00 b703          	ld	_displayInvertArea$L+3,a
4129  0d02 a67d          	ld	a,#125
4130  0d04 b702          	ld	_displayInvertArea$L+2,a
4131  0d06 a601          	ld	a,#1
4132  0d08 ae42          	ld	x,#66
4133  0d0a cd0000        	call	_displayInvertArea
4135  0d0d               L7741:
4136                     ; 523 		if ((*a_bySelected == 5) || parametersGetValue(PARAM_PAGE_SEL) == 5)
4138  0d0d 92c602        	ld	a,[_window6Menu$L+2.w]
4139  0d10 a105          	cp	a,#5
4140  0d12 270d          	jreq	L5051
4142  0d14 a60f          	ld	a,#15
4143  0d16 cd0000        	call	_parametersGetValue
4145  0d19 a105          	cp	a,#5
4146  0d1b 2602          	jrne	L441
4147  0d1d a300          	cp	x,#0
4148  0d1f               L441:
4149  0d1f 260f          	jrne	L3051
4150  0d21               L5051:
4151                     ; 524 			displayInvertArea(66, 	23, 125, 	41);
4153  0d21 a629          	ld	a,#41
4154  0d23 b703          	ld	_displayInvertArea$L+3,a
4155  0d25 a67d          	ld	a,#125
4156  0d27 b702          	ld	_displayInvertArea$L+2,a
4157  0d29 a617          	ld	a,#23
4158  0d2b ae42          	ld	x,#66
4159  0d2d cd0000        	call	_displayInvertArea
4161  0d30               L3051:
4162                     ; 526 		if ((*a_bySelected == 6) || parametersGetValue(PARAM_PAGE_SEL) == 6)
4164  0d30 92c602        	ld	a,[_window6Menu$L+2.w]
4165  0d33 a106          	cp	a,#6
4166  0d35 270d          	jreq	L1151
4168  0d37 a60f          	ld	a,#15
4169  0d39 cd0000        	call	_parametersGetValue
4171  0d3c a106          	cp	a,#6
4172  0d3e 2602          	jrne	L641
4173  0d40 a300          	cp	x,#0
4174  0d42               L641:
4175  0d42 260f          	jrne	L1641
4176  0d44               L1151:
4177                     ; 527 			displayInvertArea(66, 	45,	125, 	63);
4179  0d44 a63f          	ld	a,#63
4180  0d46 b703          	ld	_displayInvertArea$L+3,a
4181  0d48 a67d          	ld	a,#125
4182  0d4a b702          	ld	_displayInvertArea$L+2,a
4183  0d4c a62d          	ld	a,#45
4184  0d4e ae42          	ld	x,#66
4185  0d50 cd0000        	call	_displayInvertArea
4187  0d53               L1641:
4188                     ; 530 	parametersSet(PARAM_PAGE_SEL, *a_bySelected);	
4190  0d53 92c602        	ld	a,[_window6Menu$L+2.w]
4191  0d56 5f            	clr	x
4192  0d57 b702          	ld	_parametersSet$L+2,a
4193  0d59 bf01          	ld	_parametersSet$L+1,x
4194  0d5b a60f          	ld	a,#15
4195  0d5d cd0000        	call	_parametersSet
4197                     ; 531 }
4200  0d60 81            	ret
4321                     ; 534 BYTE windowSetupParameter(BYTE a_byOffset, WORD a_woCurrentValue)
4321                     ; 535 {
4322                     	switch	.text
4324                     	xref.b	_windowSetupParameter$L
4325  0d61               _windowSetupParameter:
4327  0d61 b700          	ld	_windowSetupParameter$L,a
4329                     ; 537 	BYTE byParametersJumped = 0x00;
4331  0d63 3fc7          	clr	_windowSetupParameter$L-57
4332                     ; 538 	BYTE byProgressive		= 0x00;
4334  0d65 3fff          	clr	_windowSetupParameter$L-1
4335                     ; 541 	BYTE bySelectedIndex	= 0xFF;
4337  0d67 a6ff          	ld	a,#255
4338  0d69 b7c8          	ld	_windowSetupParameter$L-56,a
4340  0d6b 2006          	jra	L5751
4341  0d6d               L1751:
4342                     ; 546 		a_byOffset-=PARAMETER_NUMBER-PARAMETER_SETUP_INITIAL_INDEX;
4344  0d6d b600          	ld	a,_windowSetupParameter$L
4345  0d6f a01b          	sub	a,#27
4346  0d71 b700          	ld	_windowSetupParameter$L,a
4347  0d73               L5751:
4348                     ; 544 	while(a_byOffset > PARAMETER_NUMBER-PARAMETER_SETUP_INITIAL_INDEX)
4350  0d73 b600          	ld	a,_windowSetupParameter$L
4351  0d75 a11c          	cp	a,#28
4352  0d77 24f4          	jruge	L1751
4353                     ; 550 	if (!_btst(m_woDisplayedWindow, WIN_SETUP)) //Not displayed
4355  0d79 c60005        	ld	a,_m_woDisplayedWindow
4356  0d7c a504          	bcp	a,#4
4357  0d7e 2665          	jrne	L1061
4358                     ; 552 		displayClearArea(0, 0, 126, 64);
4360  0d80 a640          	ld	a,#64
4361  0d82 b703          	ld	_displayClearArea$L+3,a
4362  0d84 a67e          	ld	a,#126
4363  0d86 b702          	ld	_displayClearArea$L+2,a
4364  0d88 4f            	clr	a
4365  0d89 5f            	clr	x
4366  0d8a cd0000        	call	_displayClearArea
4368                     ; 553 		displaySetOutLine(0, 0, 126, 64, false);
4370  0d8d 3f04          	clr	_displaySetOutLine$L+4
4371  0d8f a640          	ld	a,#64
4372  0d91 b703          	ld	_displaySetOutLine$L+3,a
4373  0d93 a67e          	ld	a,#126
4374  0d95 b702          	ld	_displaySetOutLine$L+2,a
4375  0d97 4f            	clr	a
4376  0d98 5f            	clr	x
4377  0d99 cd0000        	call	_displaySetOutLine
4379                     ; 556 		if (parametersGetValue(PARAM_VISUAL_SETUP_FULL))
4381  0d9c a612          	ld	a,#18
4382  0d9e cd0000        	call	_parametersGetValue
4384  0da1 4d            	tnz	a
4385  0da2 2601          	jrne	L461
4386  0da4 5d            	tnz	x
4387  0da5               L461:
4388  0da5 2716          	jreq	L3061
4389                     ; 558 			displayWriteString(labelGet(LABEL_FULL_SETUP), DISPLAY_SELECT_FONT_MINI, 2, 6);
4391  0da7 a606          	ld	a,#6
4392  0da9 b704          	ld	_displayWriteString$L+4,a
4393  0dab a602          	ld	a,#2
4394  0dad b703          	ld	_displayWriteString$L+3,a
4395  0daf a61c          	ld	a,#28
4396  0db1 b702          	ld	_displayWriteString$L+2,a
4397  0db3 a611          	ld	a,#17
4398  0db5 cd0000        	call	_labelGet
4400  0db8 cd0000        	call	_displayWriteString
4403  0dbb 2014          	jra	L5061
4404  0dbd               L3061:
4405                     ; 562 			displayWriteString(labelGet(LABEL_SIMPLE_SETUP), DISPLAY_SELECT_FONT_MINI, 2, 6);
4407  0dbd a606          	ld	a,#6
4408  0dbf b704          	ld	_displayWriteString$L+4,a
4409  0dc1 a602          	ld	a,#2
4410  0dc3 b703          	ld	_displayWriteString$L+3,a
4411  0dc5 a61c          	ld	a,#28
4412  0dc7 b702          	ld	_displayWriteString$L+2,a
4413  0dc9 a610          	ld	a,#16
4414  0dcb cd0000        	call	_labelGet
4416  0dce cd0000        	call	_displayWriteString
4418  0dd1               L5061:
4419                     ; 564 		displayInvertArea(1, 1, 124, 6);
4421  0dd1 a606          	ld	a,#6
4422  0dd3 b703          	ld	_displayInvertArea$L+3,a
4423  0dd5 a67c          	ld	a,#124
4424  0dd7 b702          	ld	_displayInvertArea$L+2,a
4425  0dd9 a601          	ld	a,#1
4426  0ddb ae01          	ld	x,#1
4427  0ddd cd0000        	call	_displayInvertArea
4429                     ; 570 			m_byVisibleMenu = PARAMETER_NUMBER-PARAMETER_SETUP_INITIAL_INDEX;
4431  0de0 a61b          	ld	a,#27
4432  0de2 c70004        	ld	_m_byVisibleMenu,a
4433  0de5               L1061:
4434                     ; 588 	a_byOffset = MAX(0, a_byOffset);
4436  0de5 b600          	ld	a,_windowSetupParameter$L
4437  0de7 b700          	ld	_windowSetupParameter$L,a
4438                     ; 589 	for(i=0; i<7+byParametersJumped; i++)
4440  0de9 3fcb          	clr	_windowSetupParameter$L-53
4442  0deb cc0fa4        	jp	L3161
4443  0dee               L7061:
4444                     ; 591 		byParameterIndex = a_byOffset + i;
4446  0dee b600          	ld	a,_windowSetupParameter$L
4447  0df0 bbcb          	add	a,_windowSetupParameter$L-53
4448  0df2 b7fe          	ld	_windowSetupParameter$L-2,a
4450  0df4 2007          	jra	L3261
4451  0df6               L7161:
4452                     ; 594 			byProgressive -= m_byVisibleMenu;
4454  0df6 b6ff          	ld	a,_windowSetupParameter$L-1
4455  0df8 c00004        	sub	a,_m_byVisibleMenu
4456  0dfb b7ff          	ld	_windowSetupParameter$L-1,a
4457  0dfd               L3261:
4458                     ; 592 		while(byProgressive>=m_byVisibleMenu)
4460  0dfd b6ff          	ld	a,_windowSetupParameter$L-1
4461  0dff c10004        	cp	a,_m_byVisibleMenu
4462  0e02 24f2          	jruge	L7161
4464  0e04 2006          	jra	L1361
4465  0e06               L7261:
4466                     ; 598 			byParameterIndex -= (PARAMETER_NUMBER-PARAMETER_SETUP_INITIAL_INDEX);
4468  0e06 b6fe          	ld	a,_windowSetupParameter$L-2
4469  0e08 a01b          	sub	a,#27
4470  0e0a b7fe          	ld	_windowSetupParameter$L-2,a
4471  0e0c               L1361:
4472                     ; 596 		while(byParameterIndex>= (PARAMETER_NUMBER-PARAMETER_SETUP_INITIAL_INDEX))
4474  0e0c b6fe          	ld	a,_windowSetupParameter$L-2
4475  0e0e a11b          	cp	a,#27
4476  0e10 24f4          	jruge	L7261
4477                     ; 602 		if(	parametersVisible(byParameterIndex + PARAMETER_SETUP_INITIAL_INDEX))
4479  0e12 b6fe          	ld	a,_windowSetupParameter$L-2
4480  0e14 ab13          	add	a,#19
4481  0e16 cd0000        	call	_parametersVisible
4483  0e19 4d            	tnz	a
4484  0e1a 2603          	jrne	L222
4485  0e1c cc0fa0        	jp	L5361
4486  0e1f               L222:
4487                     ; 604 			if(bySelectedIndex == 0xFF)
4489  0e1f b6c8          	ld	a,_windowSetupParameter$L-56
4490  0e21 a1ff          	cp	a,#255
4491  0e23 2635          	jrne	L7361
4492                     ; 606 				bySelectedIndex = byParameterIndex + PARAMETER_SETUP_INITIAL_INDEX;
4494  0e25 b6fe          	ld	a,_windowSetupParameter$L-2
4495  0e27 ab13          	add	a,#19
4496  0e29 b7c8          	ld	_windowSetupParameter$L-56,a
4497                     ; 607 				parametersSet(PARAM_PAGE_SEL, byParameterIndex);
4499  0e2b b6fe          	ld	a,_windowSetupParameter$L-2
4500  0e2d 5f            	clr	x
4501  0e2e b702          	ld	_parametersSet$L+2,a
4502  0e30 bf01          	ld	_parametersSet$L+1,x
4503  0e32 a60f          	ld	a,#15
4504  0e34 cd0000        	call	_parametersSet
4506                     ; 609 				if (a_woCurrentValue == 0xFFFF)
4508  0e37 b602          	ld	a,_windowSetupParameter$L+2
4509  0e39 a1ff          	cp	a,#255
4510  0e3b 2604          	jrne	L661
4511  0e3d be01          	ld	x,_windowSetupParameter$L+1
4512  0e3f a3ff          	cp	x,#255
4513  0e41               L661:
4514  0e41 260d          	jrne	L1461
4515                     ; 611 					woCurrentValue = parametersGetValue(byParameterIndex + PARAMETER_SETUP_INITIAL_INDEX);
4517  0e43 b6fe          	ld	a,_windowSetupParameter$L-2
4518  0e45 ab13          	add	a,#19
4519  0e47 cd0000        	call	_parametersGetValue
4521  0e4a b7ca          	ld	_windowSetupParameter$L-54,a
4522  0e4c bfc9          	ld	_windowSetupParameter$L-55,x
4524  0e4e 2015          	jra	L5461
4525  0e50               L1461:
4526                     ; 615 					woCurrentValue = a_woCurrentValue;
4528  0e50 be01          	ld	x,_windowSetupParameter$L+1
4529  0e52 bfc9          	ld	_windowSetupParameter$L-55,x
4530  0e54 b602          	ld	a,_windowSetupParameter$L+2
4531  0e56 b7ca          	ld	_windowSetupParameter$L-54,a
4532  0e58 200b          	jra	L5461
4533  0e5a               L7361:
4534                     ; 620 				woCurrentValue = parametersGetValue(byParameterIndex + PARAMETER_SETUP_INITIAL_INDEX);
4536  0e5a b6fe          	ld	a,_windowSetupParameter$L-2
4537  0e5c ab13          	add	a,#19
4538  0e5e cd0000        	call	_parametersGetValue
4540  0e61 b7ca          	ld	_windowSetupParameter$L-54,a
4541  0e63 bfc9          	ld	_windowSetupParameter$L-55,x
4542  0e65               L5461:
4543                     ; 623 			if ( parametersIsChanged(PARAM_PAGE_SEL) ||
4543                     ; 624 				(parametersGetValue(PARAM_PAGE) != PAGE_SETUP) ||
4543                     ; 625 				!_btst(m_woDisplayedWindow, WIN_SETUP))
4545  0e65 a60f          	ld	a,#15
4546  0e67 cd0000        	call	_parametersIsChanged
4548  0e6a 4d            	tnz	a
4549  0e6b 2617          	jrne	L1561
4551  0e6d a60e          	ld	a,#14
4552  0e6f cd0000        	call	_parametersGetValue
4554  0e72 a105          	cp	a,#5
4555  0e74 2602          	jrne	L071
4556  0e76 a300          	cp	x,#0
4557  0e78               L071:
4558  0e78 260a          	jrne	L1561
4560  0e7a c60005        	ld	a,_m_woDisplayedWindow
4561  0e7d a504          	bcp	a,#4
4562  0e7f 2703          	jreq	L422
4563  0e81 cc0f40        	jp	L7461
4564  0e84               L422:
4565  0e84               L1561:
4566                     ; 627 				displayClearArea(1,8+(byProgressive * 8), 10, MIN(15 + (byProgressive * 8), 62));
4568  0e84 b6ff          	ld	a,_windowSetupParameter$L-1
4569  0e86 ae08          	ld	x,#8
4570  0e88 42            	mul	x,a
4571  0e89 ab0f          	add	a,#15
4572  0e8b 2401          	jrnc	L471
4573  0e8d 5c            	inc	x
4574  0e8e               L471:
4575  0e8e a03f          	sub	a,#63
4576  0e90 9f            	ld	a,x
4577  0e91 a200          	sbc	a,#0
4578  0e93 2b04          	jrmi	L271
4579  0e95 a63e          	ld	a,#62
4580  0e97 2007          	jra	L671
4581  0e99               L271:
4582  0e99 b6ff          	ld	a,_windowSetupParameter$L-1
4583  0e9b 48            	sll	a
4584  0e9c 48            	sll	a
4585  0e9d 48            	sll	a
4586  0e9e ab0f          	add	a,#15
4587  0ea0               L671:
4588  0ea0 b703          	ld	_displayClearArea$L+3,a
4589  0ea2 a60a          	ld	a,#10
4590  0ea4 b702          	ld	_displayClearArea$L+2,a
4591  0ea6 b6ff          	ld	a,_windowSetupParameter$L-1
4592  0ea8 48            	sll	a
4593  0ea9 48            	sll	a
4594  0eaa 48            	sll	a
4595  0eab ab08          	add	a,#8
4596  0ead ae01          	ld	x,#1
4597  0eaf cd0000        	call	_displayClearArea
4599                     ; 628 				formatNumber(byParameterIndex+1, 2, 0, strMessage);
4601  0eb2 aecc          	ld	x,#high(_windowSetupParameter$L-52)
4602  0eb4 bf04          	ld	_formatNumber$L+4,x
4603  0eb6 a6cc          	ld	a,#low(_windowSetupParameter$L-52)
4604  0eb8 b705          	ld	_formatNumber$L+5,a
4605  0eba 3f03          	clr	_formatNumber$L+3
4606  0ebc a602          	ld	a,#2
4607  0ebe b702          	ld	_formatNumber$L+2,a
4608  0ec0 5f            	clr	x
4609  0ec1 a601          	ld	a,#1
4610  0ec3 bbfe          	add	a,_windowSetupParameter$L-2
4611  0ec5 2401          	jrnc	L002
4612  0ec7 5c            	inc	x
4613  0ec8               L002:
4614  0ec8 cd0000        	call	_formatNumber
4616                     ; 629 				strMessage[2] = 0x00;
4618  0ecb 3fce          	clr	_windowSetupParameter$L-50
4619                     ; 630 				displayWriteString(strMessage, 				DISPLAY_SELECT_FONT_MINI, 	2, 14 + (byProgressive * 8));
4621  0ecd b6ff          	ld	a,_windowSetupParameter$L-1
4622  0ecf 48            	sll	a
4623  0ed0 48            	sll	a
4624  0ed1 48            	sll	a
4625  0ed2 ab0e          	add	a,#14
4626  0ed4 b704          	ld	_displayWriteString$L+4,a
4627  0ed6 a602          	ld	a,#2
4628  0ed8 b703          	ld	_displayWriteString$L+3,a
4629  0eda a61c          	ld	a,#28
4630  0edc b702          	ld	_displayWriteString$L+2,a
4631  0ede a6cc          	ld	a,#_windowSetupParameter$L-52
4632  0ee0 5f            	clr	x
4633  0ee1 cd0000        	call	_displayWriteString
4635                     ; 632 				displayClearArea(11,8+(byProgressive * 8), 104, MIN(15 + (byProgressive * 8), 62));
4637  0ee4 b6ff          	ld	a,_windowSetupParameter$L-1
4638  0ee6 ae08          	ld	x,#8
4639  0ee8 42            	mul	x,a
4640  0ee9 ab0f          	add	a,#15
4641  0eeb 2401          	jrnc	L402
4642  0eed 5c            	inc	x
4643  0eee               L402:
4644  0eee a03f          	sub	a,#63
4645  0ef0 9f            	ld	a,x
4646  0ef1 a200          	sbc	a,#0
4647  0ef3 2b04          	jrmi	L202
4648  0ef5 a63e          	ld	a,#62
4649  0ef7 2007          	jra	L602
4650  0ef9               L202:
4651  0ef9 b6ff          	ld	a,_windowSetupParameter$L-1
4652  0efb 48            	sll	a
4653  0efc 48            	sll	a
4654  0efd 48            	sll	a
4655  0efe ab0f          	add	a,#15
4656  0f00               L602:
4657  0f00 b703          	ld	_displayClearArea$L+3,a
4658  0f02 a668          	ld	a,#104
4659  0f04 b702          	ld	_displayClearArea$L+2,a
4660  0f06 b6ff          	ld	a,_windowSetupParameter$L-1
4661  0f08 48            	sll	a
4662  0f09 48            	sll	a
4663  0f0a 48            	sll	a
4664  0f0b ab08          	add	a,#8
4665  0f0d ae0b          	ld	x,#11
4666  0f0f cd0000        	call	_displayClearArea
4668                     ; 633 				memcpy(strMessage,  parametersGetLabel(byParameterIndex + PARAMETER_SETUP_INITIAL_INDEX),22);
4670  0f12 a616          	ld	a,#22
4671  0f14 b704          	ld	_memcpy$L+4,a
4672  0f16 b6fe          	ld	a,_windowSetupParameter$L-2
4673  0f18 ab13          	add	a,#19
4674  0f1a cd0000        	call	_parametersGetLabel
4676  0f1d b703          	ld	_memcpy$L+3,a
4677  0f1f bf02          	ld	_memcpy$L+2,x
4678  0f21 a6cc          	ld	a,#_windowSetupParameter$L-52
4679  0f23 5f            	clr	x
4680  0f24 cd0000        	call	_memcpy
4682                     ; 634 				strMessage[22] = 0x00;
4684  0f27 3fe2          	clr	_windowSetupParameter$L-30
4685                     ; 635 				displayWriteString(strMessage, 				DISPLAY_SELECT_FONT_MINI, 	11, 14 + (byProgressive * 8));
4687  0f29 b6ff          	ld	a,_windowSetupParameter$L-1
4688  0f2b 48            	sll	a
4689  0f2c 48            	sll	a
4690  0f2d 48            	sll	a
4691  0f2e ab0e          	add	a,#14
4692  0f30 b704          	ld	_displayWriteString$L+4,a
4693  0f32 a60b          	ld	a,#11
4694  0f34 b703          	ld	_displayWriteString$L+3,a
4695  0f36 a61c          	ld	a,#28
4696  0f38 b702          	ld	_displayWriteString$L+2,a
4697  0f3a a6cc          	ld	a,#_windowSetupParameter$L-52
4698  0f3c 5f            	clr	x
4699  0f3d cd0000        	call	_displayWriteString
4701  0f40               L7461:
4702                     ; 638 			displayClearArea(105,8+(byProgressive * 8), 124, MIN(15 + (byProgressive * 8), 62));
4704  0f40 b6ff          	ld	a,_windowSetupParameter$L-1
4705  0f42 ae08          	ld	x,#8
4706  0f44 42            	mul	x,a
4707  0f45 ab0f          	add	a,#15
4708  0f47 2401          	jrnc	L212
4709  0f49 5c            	inc	x
4710  0f4a               L212:
4711  0f4a a03f          	sub	a,#63
4712  0f4c 9f            	ld	a,x
4713  0f4d a200          	sbc	a,#0
4714  0f4f 2b04          	jrmi	L012
4715  0f51 a63e          	ld	a,#62
4716  0f53 2007          	jra	L412
4717  0f55               L012:
4718  0f55 b6ff          	ld	a,_windowSetupParameter$L-1
4719  0f57 48            	sll	a
4720  0f58 48            	sll	a
4721  0f59 48            	sll	a
4722  0f5a ab0f          	add	a,#15
4723  0f5c               L412:
4724  0f5c b703          	ld	_displayClearArea$L+3,a
4725  0f5e a67c          	ld	a,#124
4726  0f60 b702          	ld	_displayClearArea$L+2,a
4727  0f62 b6ff          	ld	a,_windowSetupParameter$L-1
4728  0f64 48            	sll	a
4729  0f65 48            	sll	a
4730  0f66 48            	sll	a
4731  0f67 ab08          	add	a,#8
4732  0f69 ae69          	ld	x,#105
4733  0f6b cd0000        	call	_displayClearArea
4735                     ; 639 			formatNumber(woCurrentValue , 5, 0, strMessage);
4737  0f6e aecc          	ld	x,#high(_windowSetupParameter$L-52)
4738  0f70 bf04          	ld	_formatNumber$L+4,x
4739  0f72 a6cc          	ld	a,#low(_windowSetupParameter$L-52)
4740  0f74 b705          	ld	_formatNumber$L+5,a
4741  0f76 3f03          	clr	_formatNumber$L+3
4742  0f78 a605          	ld	a,#5
4743  0f7a b702          	ld	_formatNumber$L+2,a
4744  0f7c b6ca          	ld	a,_windowSetupParameter$L-54
4745  0f7e bec9          	ld	x,_windowSetupParameter$L-55
4746  0f80 cd0000        	call	_formatNumber
4748                     ; 640 			strMessage[5] = 0x00;
4750  0f83 3fd1          	clr	_windowSetupParameter$L-47
4751                     ; 641 			displayWriteString(strMessage, 				DISPLAY_SELECT_FONT_MINI, 105, 14 + (byProgressive * 8));
4753  0f85 b6ff          	ld	a,_windowSetupParameter$L-1
4754  0f87 48            	sll	a
4755  0f88 48            	sll	a
4756  0f89 48            	sll	a
4757  0f8a ab0e          	add	a,#14
4758  0f8c b704          	ld	_displayWriteString$L+4,a
4759  0f8e a669          	ld	a,#105
4760  0f90 b703          	ld	_displayWriteString$L+3,a
4761  0f92 a61c          	ld	a,#28
4762  0f94 b702          	ld	_displayWriteString$L+2,a
4763  0f96 a6cc          	ld	a,#_windowSetupParameter$L-52
4764  0f98 5f            	clr	x
4765  0f99 cd0000        	call	_displayWriteString
4767                     ; 643 			byProgressive++;
4769  0f9c 3cff          	inc	_windowSetupParameter$L-1
4771  0f9e 2002          	jra	L5561
4772  0fa0               L5361:
4773                     ; 647 			byParametersJumped++;
4775  0fa0 3cc7          	inc	_windowSetupParameter$L-57
4776  0fa2               L5561:
4777                     ; 589 	for(i=0; i<7+byParametersJumped; i++)
4779  0fa2 3ccb          	inc	_windowSetupParameter$L-53
4780  0fa4               L3161:
4783  0fa4 5f            	clr	x
4784  0fa5 a607          	ld	a,#7
4785  0fa7 bbc7          	add	a,_windowSetupParameter$L-57
4786  0fa9 2401          	jrnc	L612
4787  0fab 5c            	inc	x
4788  0fac               L612:
4789  0fac 90becb        	ld	y,_windowSetupParameter$L-53
4790  0faf 3f00          	clr	c_y
4791  0fb1 90bf01        	ld	c_y+1,y
4792  0fb4 99            	scf
4793  0fb5 b201          	sbc	a,c_y+1
4794  0fb7 9f            	ld	a,x
4795  0fb8 b200          	sbc	a,c_y
4796  0fba 2b03          	jrmi	L622
4797  0fbc cc0dee        	jp	L7061
4798  0fbf               L622:
4799                     ; 652 	if ( parametersIsChanged(PARAM_PAGE_SEL) ||
4799                     ; 653 		(parametersGetValue(PARAM_PAGE) != PAGE_SETUP) ||
4799                     ; 654 		!_btst(m_woDisplayedWindow, WIN_SETUP))
4801  0fbf a60f          	ld	a,#15
4802  0fc1 cd0000        	call	_parametersIsChanged
4804  0fc4 4d            	tnz	a
4805  0fc5 2617          	jrne	L1661
4807  0fc7 a60e          	ld	a,#14
4808  0fc9 cd0000        	call	_parametersGetValue
4810  0fcc a105          	cp	a,#5
4811  0fce 2602          	jrne	L022
4812  0fd0 a300          	cp	x,#0
4813  0fd2               L022:
4814  0fd2 260a          	jrne	L1661
4816  0fd4 c60005        	ld	a,_m_woDisplayedWindow
4817  0fd7 a504          	bcp	a,#4
4818  0fd9 2703          	jreq	L032
4819  0fdb cc1068        	jp	L7561
4820  0fde               L032:
4821  0fde               L1661:
4822                     ; 656 		displayInvertArea(1,8, 124, 14 );
4824  0fde a60e          	ld	a,#14
4825  0fe0 b703          	ld	_displayInvertArea$L+3,a
4826  0fe2 a67c          	ld	a,#124
4827  0fe4 b702          	ld	_displayInvertArea$L+2,a
4828  0fe6 a608          	ld	a,#8
4829  0fe8 ae01          	ld	x,#1
4830  0fea cd0000        	call	_displayInvertArea
4833  0fed               L5661:
4834                     ; 663 	_bres(m_woDisplayedWindow, WIN_TEMPERATURE);
4836  0fed c60006        	ld	a,_m_woDisplayedWindow+1
4837  0ff0 a4fd          	and	a,#253
4838  0ff2 c70006        	ld	_m_woDisplayedWindow+1,a
4839                     ; 664 	_bres(m_woDisplayedWindow, WIN_MODE);
4841  0ff5 c60006        	ld	a,_m_woDisplayedWindow+1
4842  0ff8 a4fe          	and	a,#254
4843  0ffa c70006        	ld	_m_woDisplayedWindow+1,a
4844                     ; 665 	_bres(m_woDisplayedWindow, WIN_MAIN);
4846  0ffd c60006        	ld	a,_m_woDisplayedWindow+1
4847  1000 a4f7          	and	a,#247
4848  1002 c70006        	ld	_m_woDisplayedWindow+1,a
4849                     ; 666 	_bres(m_woDisplayedWindow, WIN_ALARM);
4851  1005 c60006        	ld	a,_m_woDisplayedWindow+1
4852  1008 a4ef          	and	a,#239
4853  100a c70006        	ld	_m_woDisplayedWindow+1,a
4854                     ; 667 	_bres(m_woDisplayedWindow, WIN_MESSAGE);
4856  100d c60006        	ld	a,_m_woDisplayedWindow+1
4857  1010 a4df          	and	a,#223
4858  1012 c70006        	ld	_m_woDisplayedWindow+1,a
4859                     ; 668 	_bres(m_woDisplayedWindow, WIN_VISCO_REF);
4861  1015 c60006        	ld	a,_m_woDisplayedWindow+1
4862  1018 a47f          	and	a,#127
4863  101a c70006        	ld	_m_woDisplayedWindow+1,a
4864                     ; 669 	_bres(m_woDisplayedWindow, WIN_VISCO_REAL);
4866  101d c60006        	ld	a,_m_woDisplayedWindow+1
4867  1020 a4ff          	and	a,#255
4868  1022 c70006        	ld	_m_woDisplayedWindow+1,a
4869  1025 c60005        	ld	a,_m_woDisplayedWindow
4870  1028 a4fe          	and	a,#254
4871  102a c70005        	ld	_m_woDisplayedWindow,a
4872                     ; 670 	_bset(m_woDisplayedWindow, WIN_SETUP);
4874  102d c60005        	ld	a,_m_woDisplayedWindow
4875  1030 aa04          	or	a,#4
4876  1032 c70005        	ld	_m_woDisplayedWindow,a
4877                     ; 671 	_bres(m_woDisplayedWindow, WIN_MENUS);	
4879  1035 c60006        	ld	a,_m_woDisplayedWindow+1
4880  1038 a4ff          	and	a,#255
4881  103a c70006        	ld	_m_woDisplayedWindow+1,a
4882  103d c60005        	ld	a,_m_woDisplayedWindow
4883  1040 a4fd          	and	a,#253
4884  1042 c70005        	ld	_m_woDisplayedWindow,a
4885                     ; 672 	_bres(m_woDisplayedWindow, WIN_ARCHIVES);
4887  1045 c60006        	ld	a,_m_woDisplayedWindow+1
4888  1048 a4ff          	and	a,#255
4889  104a c70006        	ld	_m_woDisplayedWindow+1,a
4890  104d c60005        	ld	a,_m_woDisplayedWindow
4891  1050 a4f7          	and	a,#247
4892  1052 c70005        	ld	_m_woDisplayedWindow,a
4893                     ; 673 	_bres(m_woDisplayedWindow, WIN_6MESSAGES);
4895  1055 c60006        	ld	a,_m_woDisplayedWindow+1
4896  1058 a4ff          	and	a,#255
4897  105a c70006        	ld	_m_woDisplayedWindow+1,a
4898  105d c60005        	ld	a,_m_woDisplayedWindow
4899  1060 a4bf          	and	a,#191
4900  1062 c70005        	ld	_m_woDisplayedWindow,a
4901                     ; 675 	return bySelectedIndex;
4903  1065 b6c8          	ld	a,_windowSetupParameter$L-56
4906  1067 81            	ret
4907  1068               L7561:
4908                     ; 660 		displayInvertArea(105,8, 124, 14 );
4910  1068 a60e          	ld	a,#14
4911  106a b703          	ld	_displayInvertArea$L+3,a
4912  106c a67c          	ld	a,#124
4913  106e b702          	ld	_displayInvertArea$L+2,a
4914  1070 a608          	ld	a,#8
4915  1072 ae69          	ld	x,#105
4916  1074 cd0000        	call	_displayInvertArea
4918  1077 cc0fed        	jp	L5661
4971                     ; 680 void window6Messages(void)
4971                     ; 681 {
4972                     	switch	.text
4974                     	xref.b	_window6Messages$L
4975  107a               _window6Messages:
4978                     ; 684 	BYTE i=6;	
4980  107a a606          	ld	a,#6
4981  107c b7ff          	ld	_window6Messages$L-1,a
4982                     ; 686 	if (!_btst(m_woDisplayedWindow, WIN_6MESSAGES)) //Not displayed
4984  107e c60005        	ld	a,_m_woDisplayedWindow
4985  1081 a540          	bcp	a,#64
4986  1083 263f          	jrne	L1171
4987                     ; 688 		displayClearArea(0, 0, 126, 64);
4989  1085 a640          	ld	a,#64
4990  1087 b703          	ld	_displayClearArea$L+3,a
4991  1089 a67e          	ld	a,#126
4992  108b b702          	ld	_displayClearArea$L+2,a
4993  108d 4f            	clr	a
4994  108e 5f            	clr	x
4995  108f cd0000        	call	_displayClearArea
4997                     ; 689 		displaySetOutLine(0, 0, 126, 64, false);
4999  1092 3f04          	clr	_displaySetOutLine$L+4
5000  1094 a640          	ld	a,#64
5001  1096 b703          	ld	_displaySetOutLine$L+3,a
5002  1098 a67e          	ld	a,#126
5003  109a b702          	ld	_displaySetOutLine$L+2,a
5004  109c 4f            	clr	a
5005  109d 5f            	clr	x
5006  109e cd0000        	call	_displaySetOutLine
5008                     ; 692 		displayWriteString(labelGet(LABEL_MESSAGE), DISPLAY_SELECT_FONT_MINI, 2, 6);
5010  10a1 a606          	ld	a,#6
5011  10a3 b704          	ld	_displayWriteString$L+4,a
5012  10a5 a602          	ld	a,#2
5013  10a7 b703          	ld	_displayWriteString$L+3,a
5014  10a9 a61c          	ld	a,#28
5015  10ab b702          	ld	_displayWriteString$L+2,a
5016  10ad a606          	ld	a,#6
5017  10af cd0000        	call	_labelGet
5019  10b2 cd0000        	call	_displayWriteString
5021                     ; 693 		displayInvertArea(1, 1, 124, 6);
5023  10b5 a606          	ld	a,#6
5024  10b7 b703          	ld	_displayInvertArea$L+3,a
5025  10b9 a67c          	ld	a,#124
5026  10bb b702          	ld	_displayInvertArea$L+2,a
5027  10bd a601          	ld	a,#1
5028  10bf ae01          	ld	x,#1
5029  10c1 cd0000        	call	_displayInvertArea
5031  10c4               L1171:
5032                     ; 697 	if (parametersIsChanged(PARAM_VALVES) || (!_btst(m_woDisplayedWindow, WIN_6MESSAGES)))
5034  10c4 a611          	ld	a,#17
5035  10c6 cd0000        	call	_parametersIsChanged
5037  10c9 4d            	tnz	a
5038  10ca 2607          	jrne	L5171
5040  10cc c60005        	ld	a,_m_woDisplayedWindow
5041  10cf a540          	bcp	a,#64
5042  10d1 2670          	jrne	L3171
5043  10d3               L5171:
5044                     ; 699 		strValue[7] = 0x00;
5046  10d3 3ffc          	clr	_window6Messages$L-4
5047                     ; 700 		strValue[8] = 0x00;
5049  10d5 3ffd          	clr	_window6Messages$L-3
5050                     ; 701 		strValue[9] = 0x00;	
5052  10d7 3ffe          	clr	_window6Messages$L-2
5054  10d9 205c          	jra	L3271
5055  10db               L7171:
5056                     ; 704 			formatNumber(measureGetHistoricalViscosityValue(i) , 7, 0, strValue);
5058  10db aef5          	ld	x,#high(_window6Messages$L-11)
5059  10dd bf04          	ld	_formatNumber$L+4,x
5060  10df a6f5          	ld	a,#low(_window6Messages$L-11)
5061  10e1 b705          	ld	_formatNumber$L+5,a
5062  10e3 3f03          	clr	_formatNumber$L+3
5063  10e5 a607          	ld	a,#7
5064  10e7 b702          	ld	_formatNumber$L+2,a
5065  10e9 b6ff          	ld	a,_window6Messages$L-1
5066  10eb cd0000        	call	_measureGetHistoricalViscosityValue
5068  10ee cd0000        	call	_formatNumber
5070                     ; 705 			displayWriteString(strValue, DISPLAY_SELECT_FONT_5x7, 10, 15+(9*i));	
5072  10f1 b6ff          	ld	a,_window6Messages$L-1
5073  10f3 ae09          	ld	x,#9
5074  10f5 42            	mul	x,a
5075  10f6 ab0f          	add	a,#15
5076  10f8 b704          	ld	_displayWriteString$L+4,a
5077  10fa a60a          	ld	a,#10
5078  10fc b703          	ld	_displayWriteString$L+3,a
5079  10fe a61d          	ld	a,#29
5080  1100 b702          	ld	_displayWriteString$L+2,a
5081  1102 a6f5          	ld	a,#_window6Messages$L-11
5082  1104 5f            	clr	x
5083  1105 cd0000        	call	_displayWriteString
5085                     ; 707 			formatNumber(measureGetHistoricalViscosityValue(i+6) , 7, 0, strValue);
5087  1108 aef5          	ld	x,#high(_window6Messages$L-11)
5088  110a bf04          	ld	_formatNumber$L+4,x
5089  110c a6f5          	ld	a,#low(_window6Messages$L-11)
5090  110e b705          	ld	_formatNumber$L+5,a
5091  1110 3f03          	clr	_formatNumber$L+3
5092  1112 a607          	ld	a,#7
5093  1114 b702          	ld	_formatNumber$L+2,a
5094  1116 b6ff          	ld	a,_window6Messages$L-1
5095  1118 ab06          	add	a,#6
5096  111a cd0000        	call	_measureGetHistoricalViscosityValue
5098  111d cd0000        	call	_formatNumber
5100                     ; 708 			displayWriteString(strValue, DISPLAY_SELECT_FONT_5x7, 75, 15+(9*i));	
5102  1120 b6ff          	ld	a,_window6Messages$L-1
5103  1122 ae09          	ld	x,#9
5104  1124 42            	mul	x,a
5105  1125 ab0f          	add	a,#15
5106  1127 b704          	ld	_displayWriteString$L+4,a
5107  1129 a64b          	ld	a,#75
5108  112b b703          	ld	_displayWriteString$L+3,a
5109  112d a61d          	ld	a,#29
5110  112f b702          	ld	_displayWriteString$L+2,a
5111  1131 a6f5          	ld	a,#_window6Messages$L-11
5112  1133 5f            	clr	x
5113  1134 cd0000        	call	_displayWriteString
5115  1137               L3271:
5116                     ; 702 		while(i-->0)
5118  1137 b6ff          	ld	a,_window6Messages$L-1
5119  1139 3aff          	dec	_window6Messages$L-1
5120  113b 4d            	tnz	a
5121  113c 269d          	jrne	L7171
5122                     ; 710 		parametersChangedFlagReset(PARAM_VALVES);
5124  113e a611          	ld	a,#17
5125  1140 cd0000        	call	_parametersChangedFlagReset
5127  1143               L3171:
5128                     ; 713 	_bres(m_woDisplayedWindow, WIN_TEMPERATURE);
5130  1143 c60006        	ld	a,_m_woDisplayedWindow+1
5131  1146 a4fd          	and	a,#253
5132  1148 c70006        	ld	_m_woDisplayedWindow+1,a
5133                     ; 714 	_bres(m_woDisplayedWindow, WIN_MODE);
5135  114b c60006        	ld	a,_m_woDisplayedWindow+1
5136  114e a4fe          	and	a,#254
5137  1150 c70006        	ld	_m_woDisplayedWindow+1,a
5138                     ; 715 	_bres(m_woDisplayedWindow, WIN_MAIN);
5140  1153 c60006        	ld	a,_m_woDisplayedWindow+1
5141  1156 a4f7          	and	a,#247
5142  1158 c70006        	ld	_m_woDisplayedWindow+1,a
5143                     ; 716 	_bres(m_woDisplayedWindow, WIN_ALARM);
5145  115b c60006        	ld	a,_m_woDisplayedWindow+1
5146  115e a4ef          	and	a,#239
5147  1160 c70006        	ld	_m_woDisplayedWindow+1,a
5148                     ; 717 	_bres(m_woDisplayedWindow, WIN_MESSAGE);
5150  1163 c60006        	ld	a,_m_woDisplayedWindow+1
5151  1166 a4df          	and	a,#223
5152  1168 c70006        	ld	_m_woDisplayedWindow+1,a
5153                     ; 718 	_bres(m_woDisplayedWindow, WIN_VISCO_REF);
5155  116b c60006        	ld	a,_m_woDisplayedWindow+1
5156  116e a47f          	and	a,#127
5157  1170 c70006        	ld	_m_woDisplayedWindow+1,a
5158                     ; 719 	_bres(m_woDisplayedWindow, WIN_VISCO_REAL);
5160  1173 c60006        	ld	a,_m_woDisplayedWindow+1
5161  1176 a4ff          	and	a,#255
5162  1178 c70006        	ld	_m_woDisplayedWindow+1,a
5163  117b c60005        	ld	a,_m_woDisplayedWindow
5164  117e a4fe          	and	a,#254
5165  1180 c70005        	ld	_m_woDisplayedWindow,a
5166                     ; 720 	_bres(m_woDisplayedWindow, WIN_SETUP);
5168  1183 c60006        	ld	a,_m_woDisplayedWindow+1
5169  1186 a4ff          	and	a,#255
5170  1188 c70006        	ld	_m_woDisplayedWindow+1,a
5171  118b c60005        	ld	a,_m_woDisplayedWindow
5172  118e a4fb          	and	a,#251
5173  1190 c70005        	ld	_m_woDisplayedWindow,a
5174                     ; 721 	_bres(m_woDisplayedWindow, WIN_MENUS);	
5176  1193 c60006        	ld	a,_m_woDisplayedWindow+1
5177  1196 a4ff          	and	a,#255
5178  1198 c70006        	ld	_m_woDisplayedWindow+1,a
5179  119b c60005        	ld	a,_m_woDisplayedWindow
5180  119e a4fd          	and	a,#253
5181  11a0 c70005        	ld	_m_woDisplayedWindow,a
5182                     ; 722 	_bres(m_woDisplayedWindow, WIN_ARCHIVES);
5184  11a3 c60006        	ld	a,_m_woDisplayedWindow+1
5185  11a6 a4ff          	and	a,#255
5186  11a8 c70006        	ld	_m_woDisplayedWindow+1,a
5187  11ab c60005        	ld	a,_m_woDisplayedWindow
5188  11ae a4f7          	and	a,#247
5189  11b0 c70005        	ld	_m_woDisplayedWindow,a
5190                     ; 723 	_bset(m_woDisplayedWindow, WIN_6MESSAGES);
5192  11b3 c60005        	ld	a,_m_woDisplayedWindow
5193  11b6 aa40          	or	a,#64
5194  11b8 c70005        	ld	_m_woDisplayedWindow,a
5195                     ; 724 }
5198  11bb 81            	ret
5259                     	xdef	_windowMainPrepareFormateValue
5260                     	switch	.bss
5261  0000               _dblParamErrorZoom:
5262  0000 00000000      	ds.b	4
5263                     	xdef	_dblParamErrorZoom
5264  0004               _m_byVisibleMenu:
5265  0004 00            	ds.b	1
5266                     	xdef	_m_byVisibleMenu
5267  0005               _m_woDisplayedWindow:
5268  0005 0000          	ds.b	2
5269                     	xdef	_m_woDisplayedWindow
5270  0007               _m_byCurrentSelectorX:
5271  0007 00            	ds.b	1
5272                     	xdef	_m_byCurrentSelectorX
5273  0008               _m_woRegisterValue:
5274  0008 0000          	ds.b	2
5275                     	xdef	_m_woRegisterValue
5276                     	xdef	_window6Messages
5277                     	xdef	_window6Menu
5278                     	xdef	_windowSetupParameter
5279                     	xdef	_windowForceRepaintAlarm
5280                     	xdef	_windowForceRepaint
5281                     	xdef	_windowMain
5282                     	xdef	_windowAlarm
5283                     	xdef	_windowBigMessage
5284                     	xdef	_windowTemperature
5285                     	xdef	_windowViscosityReal
5286                     	xdef	_windowViscosityRef
5287                     	xdef	_windowMode
5288                     	xdef	_windowInit
5289                     	xref	_formatNumber
5290                     	xref	_memcpy
5291                     	xref	_displayDrawBox
5292                     	xref	_displayDrawValveStatus
5293                     	xref	_displayDrawSelector
5294                     	xref	_displayDrawHorizontalLine
5295                     	xref	_displayDrawVerticalLine
5296                     	xref	_displayInvertArea
5297                     	xref	_displaySetOutLine
5298                     	xref	_displayClearArea
5299                     	xref	_displayWriteString
5300                     	xref	_labelGet
5301                     	xref	_measureGetHistoricalViscosityValue
5302                     	xref	_parametersVisible
5303                     	xref	_parametersGetLabel
5304                     	xref	_parametersIsChanged
5305                     	xref	_parametersChangedFlagReset
5306                     	xref	_parametersSet
5307                     	xref	_parametersGetValue
5308                     	switch	.const
5309  0001               L7541:
5310  0001 5a68616e2032  	dc.b	"Zhan 2",0
5311  0008               L5541:
5312  0008 466f72642034  	dc.b	"Ford 4",0
5313  000f               L3541:
5314  000f 3400          	dc.b	"4",0
5315  0011               L1541:
5316  0011 3300          	dc.b	"3",0
5317  0013               L7441:
5318  0013 3200          	dc.b	"2",0
5319  0015               L5441:
5320  0015 3100          	dc.b	"1",0
5321  0017               L1731:
5322  0017 40a00000      	dc.w	16544,0
5323  001b               L1631:
5324  001b 42640000      	dc.w	16996,0
5325  001f               L1531:
5326  001f 3f800000      	dc.w	16256,0
5327  0023               L1431:
5328  0023 2b00          	dc.b	"+",0
5329  0025               L7331:
5330  0025 2d00          	dc.b	"-",0
5331  0027               L3331:
5332  0027 42c80000      	dc.w	17096,0
5333  002b               L5131:
5334  002b 41200000      	dc.w	16672,0
5335  002f               L7501:
5336  002f 00            	dc.b	0
5337                     	xref.b	c_x
5338                     	xref.b	c_y
5358                     	xref	c_ftoi
5359                     	xref	c_xfmul
5360                     	xref	c_xfadd
5361                     	xref	c_fcmp
5362                     	xref	c_fneg
5363                     	xref	c_xltor
5364                     	xref	c_xfcmp
5365                     	xref	c_ltor
5366                     	xref	c_fsub
5367                     	xref	c_rtol
5368                     	xref	c_uitof
5369                     	xref	c_rtoxl
5370                     	xref	c_xfdiv
5371                     	xref	c_itof
5372                     	xref.b	_displayDrawSelector$L
5373                     	xref.b	_displayDrawVerticalLine$L
5374                     	xref.b	_displayDrawHorizontalLine$L
5375                     	xref.b	_formatNumber$L
5376                     	xref.b	_memcpy$L
5377                     	xref.b	_displayInvertArea$L
5378                     	xref.b	_displayWriteString$L
5379                     	xref.b	_displaySetOutLine$L
5380                     	xref.b	_displayClearArea$L
5381                     	xref.b	_parametersSet$L
5382                     	xref.b	_displayDrawBox$L
5383                     	end
