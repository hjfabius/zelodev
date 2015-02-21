   1                     ; C Compiler for ST7 (COSMIC Software)
   2                     ; Generator V4.5.5 - 12 Jan 2006
1280                     .const:	section	.text
1281  0000               L327_mc_byApplicationVersion:
1282  0000 da            	dc.b	218
1313                     	switch	.const
1314  0001               L147_mc_strReset:
1315  0001 19            	dc.b	25
1316  0002 fe            	dc.b	254
1317  0003 10            	dc.b	16
1318  0004 00            	dc.b	0
1319  0005 00            	dc.b	0
1320  0006 fe            	dc.b	254
1321  0007 12            	dc.b	18
1322  0008 00            	dc.b	0
1323  0009 00            	dc.b	0
1324  000a 7e            	dc.b	126
1325  000b 40            	dc.b	64
1326  000c fe            	dc.b	254
1327  000d 1b            	dc.b	27
1328  000e 4b            	dc.b	75
1329  000f fe            	dc.b	254
1330  0010 1b            	dc.b	27
1331  0011 42            	dc.b	66
1332  0012 fe            	dc.b	254
1333  0013 1a            	dc.b	26
1334  0014 80            	dc.b	128
1335  0015 fe            	dc.b	254
1336  0016 ff            	dc.b	255
1337  0017               L347_mc_strRecClear:
1338  0017 12            	dc.b	18
1339  0018 00            	dc.b	0
1340  0019 00            	dc.b	0
1341  001a 7e            	dc.b	126
1342  001b 40            	dc.b	64
1343  001c fe            	dc.b	254
1344  001d ff            	dc.b	255
1345  001e               L547_mc_strLogo:
1346  001e 1e            	dc.b	30
1347  001f fe            	dc.b	254
1348  0020 10            	dc.b	16
1349  0021 09            	dc.b	9
1350  0022 2b            	dc.b	43
1351  0023 fe            	dc.b	254
1352  0024 56            	dc.b	86
1353  0025 69            	dc.b	105
1354  0026 73            	dc.b	115
1355  0027 63            	dc.b	99
1356  0028 6f            	dc.b	111
1357  0029 57            	dc.b	87
1358  002a 61            	dc.b	97
1359  002b 6c            	dc.b	108
1360  002c fe            	dc.b	254
1361  002d 10            	dc.b	16
1362  002e 05            	dc.b	5
1363  002f 12            	dc.b	18
1364  0030 fe            	dc.b	254
1365  0031 7a            	dc.b	122
1366  0032 65            	dc.b	101
1367  0033 6c            	dc.b	108
1368  0034 6f            	dc.b	111
1369  0035 fe            	dc.b	254
1370  0036 1d            	dc.b	29
1371  0037 fe            	dc.b	254
1372  0038 10            	dc.b	16
1373  0039 36            	dc.b	54
1374  003a 12            	dc.b	18
1375  003b fe            	dc.b	254
1376  003c 65            	dc.b	101
1377  003d 6c            	dc.b	108
1378  003e 65            	dc.b	101
1379  003f 74            	dc.b	116
1380  0040 74            	dc.b	116
1381  0041 72            	dc.b	114
1382  0042 6f            	dc.b	111
1383  0043 6e            	dc.b	110
1384  0044 69            	dc.b	105
1385  0045 63            	dc.b	99
1386  0046 61            	dc.b	97
1387  0047 fe            	dc.b	254
1388  0048 13            	dc.b	19
1389  0049 01            	dc.b	1
1390  004a 01            	dc.b	1
1391  004b 7e            	dc.b	126
1392  004c 15            	dc.b	21
1393  004d fe            	dc.b	254
1394  004e ff            	dc.b	255
1395  004f               L747_mc_strVersion:
1396  004f 1c            	dc.b	28
1397  0050 fe            	dc.b	254
1398  0051 10            	dc.b	16
1399  0052 42            	dc.b	66
1400  0053 3e            	dc.b	62
1401  0054 fe            	dc.b	254
1402  0055 76            	dc.b	118
1403  0056 20            	dc.b	32
1404  0057 58            	dc.b	88
1405  0058 2e            	dc.b	46
1406  0059 58            	dc.b	88
1407  005a 58            	dc.b	88
1408  005b 2d            	dc.b	45
1409  005c 79            	dc.b	121
1410  005d 79            	dc.b	121
1411  005e 79            	dc.b	121
1412  005f fe            	dc.b	254
1413  0060 ff            	dc.b	255
1475                     	switch	.data
1476  0000               L1001_m_enmKeyIRQReceived:
1477  0000 ff            	dc.b	255
1478  0001               L3001_m_enmTraslatedKeyPressed:
1479  0001 ff            	dc.b	255
1480  0002               L5001_m_enmPreviousWasRemoteKey:
1481  0002 00            	dc.b	0
1512                     ; 25 void displayKeyPressedReset(void)
1512                     ; 26 {
1513                     	switch	.text
1514  0000               _displayKeyPressedReset:
1517                     ; 27 	m_enmTraslatedKeyPressed = KEY_NULL;
1519  0000 a6ff          	ld	a,#255
1520  0002 c70001        	ld	L3001_m_enmTraslatedKeyPressed,a
1521                     ; 28 }
1524  0005 81            	ret
1570                     ; 32 BYTE displayGetKeyPressed(void)
1570                     ; 33 {
1571                     	switch	.text
1573                     	xref.b	_displayGetKeyPressed$L
1574  0006               _displayGetKeyPressed:
1577                     ; 37 	if (_btst(_Pa_ButtonInk, _Pin_ButtonInk) && _btst(_Pa_ButtonSolvent, _Pin_ButtonSolvent))
1579  0006 b606          	ld	a,_PCDR
1580  0008 a504          	bcp	a,#4
1581  000a 2735          	jreq	L5401
1583  000c b606          	ld	a,_PCDR
1584  000e a508          	bcp	a,#8
1585  0010 272f          	jreq	L5401
1586                     ; 39 		sleep(parametersGetValue(PARAM_KEYBOARD_DELAY));
1588  0012 a622          	ld	a,#34
1589  0014 cd0000        	call	_parametersGetValue
1591  0017 cd0000        	call	c_uitol
1593  001a ae00          	ld	x,#_sleep$L
1594  001c cd0000        	call	c_rtol
1596  001f cd0000        	call	_sleep
1598                     ; 40 		if (_btst(_Pa_ButtonInk, _Pin_ButtonInk) && _btst(_Pa_ButtonSolvent, _Pin_ButtonSolvent))
1600  0022 b606          	ld	a,_PCDR
1601  0024 a504          	bcp	a,#4
1602  0026 2603          	jrne	L01
1603  0028 cc00e4        	jp	L1501
1604  002b               L01:
1606  002b b606          	ld	a,_PCDR
1607  002d a508          	bcp	a,#8
1608  002f 2603          	jrne	L21
1609  0031 cc00e4        	jp	L1501
1610  0034               L21:
1611                     ; 42 			m_enmTraslatedKeyPressed = KEY_R_BOTH;
1613  0034 a612          	ld	a,#18
1614  0036 c70001        	ld	L3001_m_enmTraslatedKeyPressed,a
1615                     ; 43 			m_enmPreviousWasRemoteKey = true;
1617  0039 a601          	ld	a,#1
1618  003b c70002        	ld	L5001_m_enmPreviousWasRemoteKey,a
1619  003e cc00e4        	jp	L1501
1620  0041               L5401:
1621                     ; 46 	else if _btst(_Pa_ButtonInk, _Pin_ButtonInk)
1623  0041 b606          	ld	a,_PCDR
1624  0043 a504          	bcp	a,#4
1625  0045 2725          	jreq	L3501
1626                     ; 48 		sleep(parametersGetValue(PARAM_KEYBOARD_DELAY));
1628  0047 a622          	ld	a,#34
1629  0049 cd0000        	call	_parametersGetValue
1631  004c cd0000        	call	c_uitol
1633  004f ae00          	ld	x,#_sleep$L
1634  0051 cd0000        	call	c_rtol
1636  0054 cd0000        	call	_sleep
1638                     ; 49 		if _btst(_Pa_ButtonInk, _Pin_ButtonInk)
1640  0057 b606          	ld	a,_PCDR
1641  0059 a504          	bcp	a,#4
1642  005b 2603          	jrne	L41
1643  005d cc00e4        	jp	L1501
1644  0060               L41:
1645                     ; 51 			m_enmTraslatedKeyPressed = KEY_R_INK;
1647  0060 a611          	ld	a,#17
1648  0062 c70001        	ld	L3001_m_enmTraslatedKeyPressed,a
1649                     ; 52 			m_enmPreviousWasRemoteKey = true;
1651  0065 a601          	ld	a,#1
1652  0067 c70002        	ld	L5001_m_enmPreviousWasRemoteKey,a
1653  006a 2078          	jp	L1501
1654  006c               L3501:
1655                     ; 55 	else if _btst(_Pa_ButtonSolvent, _Pin_ButtonSolvent)
1657  006c b606          	ld	a,_PCDR
1658  006e a508          	bcp	a,#8
1659  0070 2722          	jreq	L1601
1660                     ; 57 		sleep(parametersGetValue(PARAM_KEYBOARD_DELAY));
1662  0072 a622          	ld	a,#34
1663  0074 cd0000        	call	_parametersGetValue
1665  0077 cd0000        	call	c_uitol
1667  007a ae00          	ld	x,#_sleep$L
1668  007c cd0000        	call	c_rtol
1670  007f cd0000        	call	_sleep
1672                     ; 58 		if _btst(_Pa_ButtonSolvent, _Pin_ButtonSolvent)
1674  0082 b606          	ld	a,_PCDR
1675  0084 a508          	bcp	a,#8
1676  0086 275c          	jreq	L1501
1677                     ; 60 			m_enmTraslatedKeyPressed = KEY_R_SOLVENT;
1679  0088 a610          	ld	a,#16
1680  008a c70001        	ld	L3001_m_enmTraslatedKeyPressed,a
1681                     ; 61 			m_enmPreviousWasRemoteKey = true;
1683  008d a601          	ld	a,#1
1684  008f c70002        	ld	L5001_m_enmPreviousWasRemoteKey,a
1685  0092 2050          	jra	L1501
1686  0094               L1601:
1687                     ; 64 	else if (m_enmPreviousWasRemoteKey)
1689  0094 c60002        	ld	a,L5001_m_enmPreviousWasRemoteKey
1690  0097 4d            	tnz	a
1691  0098 270b          	jreq	L7601
1692                     ; 66 		m_enmPreviousWasRemoteKey = false;
1694  009a 4f            	clr	a
1695  009b c70002        	ld	L5001_m_enmPreviousWasRemoteKey,a
1696                     ; 67 		m_enmTraslatedKeyPressed = KEY_RELEASED;
1698  009e a613          	ld	a,#19
1699  00a0 c70001        	ld	L3001_m_enmTraslatedKeyPressed,a
1701  00a3 203f          	jra	L1501
1702  00a5               L7601:
1703                     ; 69 	else if (m_enmKeyIRQReceived)
1705  00a5 c60000        	ld	a,L1001_m_enmKeyIRQReceived
1706  00a8 4d            	tnz	a
1707  00a9 2739          	jreq	L1501
1708                     ; 71 		m_enmPreviousWasRemoteKey = false;
1710  00ab 4f            	clr	a
1711  00ac c70002        	ld	L5001_m_enmPreviousWasRemoteKey,a
1712                     ; 84 		_bres(_Pa_Select_UA, _Pin_Select_UA);
1714  00af 1115          	bres	_PHDR,#0
1715                     ; 85 		_bres(_Pa_Select_UB, _Pin_Select_UB);
1717  00b1 1315          	bres	_PHDR,#1
1718                     ; 86 		_bres(_Pa_Select_UC, _Pin_Select_UC);
1720  00b3 1515          	bres	_PHDR,#2
1721                     ; 87 		_bset(_Pa_Select_U2, _Pin_Select_U2);
1723  00b5 1815          	bset	_PHDR,#4
1724                     ; 90 		SPI_MoveByte(DISPLAY_FUNCTION_SET_2);
1726  00b7 a61b          	ld	a,#27
1727  00b9 cd0000        	call	_SPI_MoveByte
1729                     ; 91 		SPI_MoveByte(DISPLAY_READ_PORT);
1731  00bc a652          	ld	a,#82
1732  00be cd0000        	call	_SPI_MoveByte
1735  00c1 2001          	jra	L7701
1736  00c3               L5701:
1737                     ; 95 			Nop();
1740  00c3 9d            nop
1742  00c4               L7701:
1743                     ; 93 		while(!_btst(_Pa_DisplayBusy, _Pin_DisplayBusy) )
1745  00c4 b600          	ld	a,_PADR
1746  00c6 a510          	bcp	a,#16
1747  00c8 27f9          	jreq	L5701
1748                     ; 99 		byKey1 = SPI_MoveByte(DISPLAY_HOME);
1750  00ca a60b          	ld	a,#11
1751  00cc cd0000        	call	_SPI_MoveByte
1753  00cf b7ff          	ld	_displayGetKeyPressed$L-1,a
1754                     ; 191 			m_enmKeyPressed[0] = byKey1;
1756  00d1 b6ff          	ld	a,_displayGetKeyPressed$L-1
1757  00d3 c70080        	ld	L7001_m_enmKeyPressed,a
1758                     ; 192 			m_enmKeyIRQReceived = false;
1760  00d6 4f            	clr	a
1761  00d7 c70000        	ld	L1001_m_enmKeyIRQReceived,a
1762                     ; 195 		_bres(_Pa_Select_UA, _Pin_Select_UA);
1764  00da 1115          	bres	_PHDR,#0
1765                     ; 196 		_bres(_Pa_Select_UB, _Pin_Select_UB);
1767  00dc 1315          	bres	_PHDR,#1
1768                     ; 197 		_bres(_Pa_Select_UC, _Pin_Select_UC);
1770  00de 1515          	bres	_PHDR,#2
1771                     ; 198 		_bres(_Pa_Select_U2, _Pin_Select_U2);	
1773  00e0 1915          	bres	_PHDR,#4
1774                     ; 200 		displayTraslateKeyPressed();
1776  00e2 ad08          	call	_displayTraslateKeyPressed
1778  00e4               L1501:
1779                     ; 203 	return m_enmTraslatedKeyPressed;
1781  00e4 c60001        	ld	a,L3001_m_enmTraslatedKeyPressed
1784  00e7 81            	ret
1808                     ; 208 BYTE displayIsKeyPressed(void)
1808                     ; 209 {
1809                     	switch	.text
1810  00e8               _displayIsKeyPressed:
1813                     ; 210 	return m_enmKeyIRQReceived;
1815  00e8 c60000        	ld	a,L1001_m_enmKeyIRQReceived
1818  00eb 81            	ret
1843                     ; 215 void displayTraslateKeyPressed(void)
1843                     ; 216 {
1844                     	switch	.text
1845  00ec               _displayTraslateKeyPressed:
1848                     ; 217 	switch(m_enmKeyPressed[0])
1850  00ec c60080        	ld	a,L7001_m_enmKeyPressed
1852                     ; 278 			break;
1853  00ef a011          	sub	a,#17
1854  00f1 2603          	jrne	L22
1855  00f3 cc0185        	jp	L7311
1856  00f6               L22:
1857  00f6 4a            	dec	a
1858  00f7 2602          	jrne	L42
1859  00f9 207d          	jp	L3311
1860  00fb               L42:
1861  00fb a002          	sub	a,#2
1862  00fd 2756          	jreq	L1211
1863  00ff a004          	sub	a,#4
1864  0101 2603          	jrne	L62
1865  0103 cc01a1        	jp	L7411
1866  0106               L62:
1867  0106 a009          	sub	a,#9
1868  0108 2603          	jrne	L03
1869  010a cc018c        	jp	L1411
1870  010d               L03:
1871  010d 4a            	dec	a
1872  010e 276e          	jreq	L5311
1873  0110 a002          	sub	a,#2
1874  0112 273a          	jreq	L7111
1875  0114 a004          	sub	a,#4
1876  0116 2603          	jrne	L23
1877  0118 cc01a8        	jp	L1511
1878  011b               L23:
1879  011b a019          	sub	a,#25
1880  011d 2744          	jreq	L5211
1881  011f 4a            	dec	a
1882  0120 2748          	jreq	L7211
1883  0122 a002          	sub	a,#2
1884  0124 276d          	jreq	L3411
1885  0126 a004          	sub	a,#4
1886  0128 2716          	jreq	L3111
1887  012a a039          	sub	a,#57
1888  012c 272e          	jreq	L3211
1889  012e 4a            	dec	a
1890  012f 2740          	jreq	L1311
1891  0131 a002          	sub	a,#2
1892  0133 2765          	jreq	L5411
1893  0135 a004          	sub	a,#4
1894  0137 270e          	jreq	L5111
1895  0139               L3511:
1896                     ; 267 		default:
1896                     ; 268 			/*
1896                     ; 269 			if (!_btst(m_enmKeyPressed[0],7))
1896                     ; 270 			{
1896                     ; 271 				m_enmTraslatedKeyPressed = KEY_RELEASED;
1896                     ; 272 			}
1896                     ; 273 			else
1896                     ; 274 			{
1896                     ; 275 				
1896                     ; 276 			}*/
1896                     ; 277 			m_enmTraslatedKeyPressed = KEY_NULL;
1898  0139 a6ff          	ld	a,#255
1899  013b c70001        	ld	L3001_m_enmTraslatedKeyPressed,a
1900                     ; 278 			break;
1902  013e 206d          	jra	L7611
1903  0140               L3111:
1904                     ; 219 		case 0b01001000: 
1904                     ; 220 			m_enmTraslatedKeyPressed = KEY_SOLVENT;
1906  0140 a60f          	ld	a,#15
1907  0142 c70001        	ld	L3001_m_enmTraslatedKeyPressed,a
1908                     ; 221 			break;
1910  0145 2066          	jra	L7611
1911  0147               L5111:
1912                     ; 222 		case 0b10001000: 
1912                     ; 223 			m_enmTraslatedKeyPressed = KEY_PH;
1914  0147 a60e          	ld	a,#14
1915  0149 c70001        	ld	L3001_m_enmTraslatedKeyPressed,a
1916                     ; 224 			break;
1918  014c 205f          	jra	L7611
1919  014e               L7111:
1920                     ; 225 		case 0b00100100: 
1920                     ; 226 			m_enmTraslatedKeyPressed = KEY_WASHING;
1922  014e a60d          	ld	a,#13
1923  0150 c70001        	ld	L3001_m_enmTraslatedKeyPressed,a
1924                     ; 227 			break;
1926  0153 2058          	jra	L7611
1927  0155               L1211:
1928                     ; 228 		case 0b00010100: 
1928                     ; 229 			m_enmTraslatedKeyPressed = KEY_FUNCTION;
1930  0155 a60c          	ld	a,#12
1931  0157 c70001        	ld	L3001_m_enmTraslatedKeyPressed,a
1932                     ; 230 			break;
1934  015a 2051          	jra	L7611
1935  015c               L3211:
1936                     ; 231 		case 0b10000001:
1936                     ; 232 			m_enmTraslatedKeyPressed = KEY_ARROW_UP_F;
1938  015c a60a          	ld	a,#10
1939  015e c70001        	ld	L3001_m_enmTraslatedKeyPressed,a
1940                     ; 233 			break;
1942  0161 204a          	jra	L7611
1943  0163               L5211:
1944                     ; 234 		case 0b01000001: 
1944                     ; 235 			m_enmTraslatedKeyPressed = KEY_ARROW_DOWN_F;
1946  0163 a60b          	ld	a,#11
1947  0165 c70001        	ld	L3001_m_enmTraslatedKeyPressed,a
1948                     ; 236 			break;
1950  0168 2043          	jra	L7611
1951  016a               L7211:
1952                     ; 237 		case 0b01000010:
1952                     ; 238 			m_enmTraslatedKeyPressed = KEY_ARROW_DOWN;
1954  016a a609          	ld	a,#9
1955  016c c70001        	ld	L3001_m_enmTraslatedKeyPressed,a
1956                     ; 239 			break;
1958  016f 203c          	jra	L7611
1959  0171               L1311:
1960                     ; 240 		case 0b10000010: 
1960                     ; 241 			m_enmTraslatedKeyPressed = KEY_ARROW_UP;
1962  0171 a608          	ld	a,#8
1963  0173 c70001        	ld	L3001_m_enmTraslatedKeyPressed,a
1964                     ; 242 			break;
1966  0176 2035          	jra	L7611
1967  0178               L3311:
1968                     ; 243 		case 0b00010010:   
1968                     ; 244 			m_enmTraslatedKeyPressed = KEY_OK;
1970  0178 4f            	clr	a
1971  0179 c70001        	ld	L3001_m_enmTraslatedKeyPressed,a
1972                     ; 245 			break;
1974  017c 202f          	jra	L7611
1975  017e               L5311:
1976                     ; 246 		case 0b00100010: 
1976                     ; 247 			m_enmTraslatedKeyPressed = KEY_CANCEL;
1978  017e a601          	ld	a,#1
1979  0180 c70001        	ld	L3001_m_enmTraslatedKeyPressed,a
1980                     ; 248 			break;
1982  0183 2028          	jra	L7611
1983  0185               L7311:
1984                     ; 249 		case 0b00010001: 
1984                     ; 250 			m_enmTraslatedKeyPressed = KEY_MENU;
1986  0185 a602          	ld	a,#2
1987  0187 c70001        	ld	L3001_m_enmTraslatedKeyPressed,a
1988                     ; 251 			break;
1990  018a 2021          	jra	L7611
1991  018c               L1411:
1992                     ; 252 		case 0b00100001: 
1992                     ; 253 			m_enmTraslatedKeyPressed = KEY_ARCHIVE;
1994  018c a603          	ld	a,#3
1995  018e c70001        	ld	L3001_m_enmTraslatedKeyPressed,a
1996                     ; 254 			break;
1998  0191 201a          	jra	L7611
1999  0193               L3411:
2000                     ; 255 		case 0b01000100: 
2000                     ; 256 			m_enmTraslatedKeyPressed = KEY_OFF;
2002  0193 a604          	ld	a,#4
2003  0195 c70001        	ld	L3001_m_enmTraslatedKeyPressed,a
2004                     ; 257 			break;
2006  0198 2013          	jra	L7611
2007  019a               L5411:
2008                     ; 258 		case 0b10000100: 
2008                     ; 259 			m_enmTraslatedKeyPressed = KEY_PAUSE;
2010  019a a605          	ld	a,#5
2011  019c c70001        	ld	L3001_m_enmTraslatedKeyPressed,a
2012                     ; 260 			break;
2014  019f 200c          	jra	L7611
2015  01a1               L7411:
2016                     ; 261 		case 0b00011000: 
2016                     ; 262 			m_enmTraslatedKeyPressed = KEY_MODE;
2018  01a1 a606          	ld	a,#6
2019  01a3 c70001        	ld	L3001_m_enmTraslatedKeyPressed,a
2020                     ; 263 			break;
2022  01a6 2005          	jra	L7611
2023  01a8               L1511:
2024                     ; 264 		case 0b00101000: 
2024                     ; 265 			m_enmTraslatedKeyPressed = KEY_VISUAL;
2026  01a8 a607          	ld	a,#7
2027  01aa c70001        	ld	L3001_m_enmTraslatedKeyPressed,a
2028                     ; 266 			break;
2030  01ad               L7611:
2031                     ; 280 }
2034  01ad 81            	ret
2057                     ; 284 void displayKeyboardIRQ(void)
2057                     ; 285 {
2058                     	switch	.text
2059  01ae               _displayKeyboardIRQ:
2063                     ; 286 	DisableInterrupts();
2066  01ae 9b            sim
2068                     ; 287 	m_enmKeyIRQReceived = true;
2070  01af a601          	ld	a,#1
2071  01b1 c70000        	ld	L1001_m_enmKeyIRQReceived,a
2072                     ; 288 	EnableInterrupts();
2075  01b4 9a            rim
2077                     ; 289 }
2080  01b5 80            	iret
2126                     ; 292 void displayInit(void)
2126                     ; 293 {
2127                     	switch	.text
2129                     	xref.b	_displayInit$L
2130  01b6               _displayInit:
2133                     ; 296 	memcpy(strString, mc_strVersion, 30); 
2135  01b6 a61e          	ld	a,#30
2136  01b8 b704          	ld	_memcpy$L+4,a
2137  01ba ae4f          	ld	x,#high(L747_mc_strVersion)
2138  01bc bf02          	ld	_memcpy$L+2,x
2139  01be a64f          	ld	a,#low(L747_mc_strVersion)
2140  01c0 b703          	ld	_memcpy$L+3,a
2141  01c2 a6e2          	ld	a,#_displayInit$L-30
2142  01c4 5f            	clr	x
2143  01c5 cd0000        	call	_memcpy
2145                     ; 297 	formatNumber(mc_byApplicationVersion, 4, 2, strString+8);
2147  01c8 aeea          	ld	x,#high(_displayInit$L-22)
2148  01ca bf04          	ld	_formatNumber$L+4,x
2149  01cc a6ea          	ld	a,#low(_displayInit$L-22)
2150  01ce b705          	ld	_formatNumber$L+5,a
2151  01d0 a602          	ld	a,#2
2152  01d2 b703          	ld	_formatNumber$L+3,a
2153  01d4 a604          	ld	a,#4
2154  01d6 b702          	ld	_formatNumber$L+2,a
2155  01d8 5f            	clr	x
2156  01d9 a6da          	ld	a,#218
2157  01db cd0000        	call	_formatNumber
2159                     ; 298 	formatNumber(parametersGetSerialNumber(), 3, 0, strString+13);
2161  01de aeef          	ld	x,#high(_displayInit$L-17)
2162  01e0 bf04          	ld	_formatNumber$L+4,x
2163  01e2 a6ef          	ld	a,#low(_displayInit$L-17)
2164  01e4 b705          	ld	_formatNumber$L+5,a
2165  01e6 3f03          	clr	_formatNumber$L+3
2166  01e8 a603          	ld	a,#3
2167  01ea b702          	ld	_formatNumber$L+2,a
2168  01ec cd0000        	call	_parametersGetSerialNumber
2170  01ef cd0000        	call	_formatNumber
2172                     ; 299 	sleep(1000);
2174  01f2 a6e8          	ld	a,#232
2175  01f4 b703          	ld	_sleep$L+3,a
2176  01f6 a603          	ld	a,#3
2177  01f8 b702          	ld	_sleep$L+2,a
2178  01fa a600          	ld	a,#0
2179  01fc b701          	ld	_sleep$L+1,a
2180  01fe a600          	ld	a,#0
2181  0200 b700          	ld	_sleep$L,a
2182  0202 cd0000        	call	_sleep
2184                     ; 300 	displayCmdToDisplay(mc_strReset);
2186  0205 a601          	ld	a,#low(L147_mc_strReset)
2187  0207 ae01          	ld	x,#high(L147_mc_strReset)
2188  0209 cd02aa        	call	_displayCmdToDisplay
2190                     ; 301 	displayCmdToDisplay(mc_strLogo);
2192  020c a61e          	ld	a,#low(L547_mc_strLogo)
2193  020e ae1e          	ld	x,#high(L547_mc_strLogo)
2194  0210 cd02aa        	call	_displayCmdToDisplay
2196                     ; 302 	displayCmdToDisplay(strString);
2198  0213 a6e2          	ld	a,#_displayInit$L-30
2199  0215 5f            	clr	x
2200  0216 cd02aa        	call	_displayCmdToDisplay
2202                     ; 305 	m_enmTraslatedKeyPressed = KEY_NULL;
2204  0219 a6ff          	ld	a,#255
2205  021b c70001        	ld	L3001_m_enmTraslatedKeyPressed,a
2206                     ; 306 	m_enmKeyPressed[0] 		= KEY_NULL;
2208  021e a6ff          	ld	a,#255
2209  0220 c70080        	ld	L7001_m_enmKeyPressed,a
2210                     ; 307 	m_enmKeyPressed[1] 		= KEY_NULL;
2212  0223 a6ff          	ld	a,#255
2213  0225 c70081        	ld	L7001_m_enmKeyPressed+1,a
2214                     ; 308 	m_enmKeyIRQReceived 	= false;
2216  0228 4f            	clr	a
2217  0229 c70000        	ld	L1001_m_enmKeyIRQReceived,a
2218                     ; 309 }
2221  022c 81            	ret
2248                     ; 313 void displayOff(void)
2248                     ; 314 {
2249                     	switch	.text
2250  022d               _displayOff:
2253                     ; 315 	if (parametersGetValue(PARAM_MODE) == PARAM_MODE_OFF)
2255  022d a610          	ld	a,#16
2256  022f cd0000        	call	_parametersGetValue
2258  0232 a102          	cp	a,#2
2259  0234 2602          	jrne	L24
2260  0236 a300          	cp	x,#0
2261  0238               L24:
2262  0238 2630          	jrne	L7221
2263                     ; 318 		m_arbyDisplayCommand[0] = DISPLAY_FUNCTION_SET_2;
2265  023a a61b          	ld	a,#27
2266  023c c70000        	ld	_m_arbyDisplayCommand,a
2267                     ; 319 		m_arbyDisplayCommand[1] = DISPLAY_POWER_ON;
2269  023f a650          	ld	a,#80
2270  0241 c70001        	ld	_m_arbyDisplayCommand+1,a
2271                     ; 320 		m_arbyDisplayCommand[2] = DISPLAY_EOF;		
2273  0244 a6ff          	ld	a,#255
2274  0246 c70002        	ld	_m_arbyDisplayCommand+2,a
2275                     ; 321 		displayCmdToDisplay(m_arbyDisplayCommand);	
2277  0249 a600          	ld	a,#low(_m_arbyDisplayCommand)
2278  024b ae00          	ld	x,#high(_m_arbyDisplayCommand)
2279  024d ad5b          	call	_displayCmdToDisplay
2281                     ; 322 		parametersSet(PARAM_MODE, !parametersGetValue(PARAM_MODE_MANUAL));
2283  024f 4f            	clr	a
2284  0250 cd0000        	call	_parametersGetValue
2286  0253 4d            	tnz	a
2287  0254 2601          	jrne	L64
2288  0256 5d            	tnz	x
2289  0257               L64:
2290  0257 2604          	jrne	L44
2291  0259 a601          	ld	a,#1
2292  025b 2001          	jra	L05
2293  025d               L44:
2294  025d 4f            	clr	a
2295  025e               L05:
2296  025e 5f            	clr	x
2297  025f b702          	ld	_parametersSet$L+2,a
2298  0261 bf01          	ld	_parametersSet$L+1,x
2299  0263 a610          	ld	a,#16
2300  0265 cd0000        	call	_parametersSet
2303  0268 2035          	jra	L1321
2304  026a               L7221:
2305                     ; 326 		displayCmdToDisplay(mc_strRecClear);
2307  026a a617          	ld	a,#low(L347_mc_strRecClear)
2308  026c ae17          	ld	x,#high(L347_mc_strRecClear)
2309  026e ad3a          	call	_displayCmdToDisplay
2311                     ; 327 		m_arbyDisplayCommand[0] = DISPLAY_FUNCTION_SET_2;
2313  0270 a61b          	ld	a,#27
2314  0272 c70000        	ld	_m_arbyDisplayCommand,a
2315                     ; 328 		m_arbyDisplayCommand[1] = DISPLAY_POWER_OFF;
2317  0275 a646          	ld	a,#70
2318  0277 c70001        	ld	_m_arbyDisplayCommand+1,a
2319                     ; 329 		m_arbyDisplayCommand[2] = DISPLAY_EOF;		
2321  027a a6ff          	ld	a,#255
2322  027c c70002        	ld	_m_arbyDisplayCommand+2,a
2323                     ; 330 		displayCmdToDisplay(m_arbyDisplayCommand);	
2325  027f a600          	ld	a,#low(_m_arbyDisplayCommand)
2326  0281 ae00          	ld	x,#high(_m_arbyDisplayCommand)
2327  0283 ad25          	call	_displayCmdToDisplay
2329                     ; 331 		parametersSet(PARAM_MODE, !parametersGetValue(PARAM_MODE_OFF));
2331  0285 a602          	ld	a,#2
2332  0287 cd0000        	call	_parametersGetValue
2334  028a 4d            	tnz	a
2335  028b 2601          	jrne	L45
2336  028d 5d            	tnz	x
2337  028e               L45:
2338  028e 2604          	jrne	L25
2339  0290 a601          	ld	a,#1
2340  0292 2001          	jra	L65
2341  0294               L25:
2342  0294 4f            	clr	a
2343  0295               L65:
2344  0295 5f            	clr	x
2345  0296 b702          	ld	_parametersSet$L+2,a
2346  0298 bf01          	ld	_parametersSet$L+1,x
2347  029a a610          	ld	a,#16
2348  029c cd0000        	call	_parametersSet
2350  029f               L1321:
2351                     ; 334 }
2354  029f 81            	ret
2379                     ; 337 void displayReset(void)
2379                     ; 338 {
2380                     	switch	.text
2381  02a0               _displayReset:
2384                     ; 339 	displayCmdToDisplay(mc_strReset);
2386  02a0 a601          	ld	a,#low(L147_mc_strReset)
2387  02a2 ae01          	ld	x,#high(L147_mc_strReset)
2388  02a4 ad04          	call	_displayCmdToDisplay
2390                     ; 340 	sleepFix();
2392  02a6 cd0000        	call	_sleepFix
2394                     ; 341 }
2397  02a9 81            	ret
2455                     ; 345 void displayCmdToDisplay(STRING a_strMessage)
2455                     ; 346 {
2456                     	switch	.text
2458                     	xref.b	_displayCmdToDisplay$L
2459  02aa               _displayCmdToDisplay:
2461  02aa b701          	ld	_displayCmdToDisplay$L+1,a
2462  02ac bf00          	ld	_displayCmdToDisplay$L,x
2464                     ; 347 	BYTE i = 0x00;
2466  02ae 3fff          	clr	_displayCmdToDisplay$L-1
2467                     ; 348 	BYTE byGraphics = 0x00;
2469  02b0 3ffe          	clr	_displayCmdToDisplay$L-2
2470                     ; 350 	_bres(_Pa_Select_UA, _Pin_Select_UA);
2472  02b2 1115          	bres	_PHDR,#0
2473                     ; 351 	_bres(_Pa_Select_UB, _Pin_Select_UB);
2475  02b4 1315          	bres	_PHDR,#1
2476                     ; 352 	_bres(_Pa_Select_UC, _Pin_Select_UC);
2478  02b6 1515          	bres	_PHDR,#2
2479                     ; 353 	_bset(_Pa_Select_U2, _Pin_Select_U2);
2481  02b8 1815          	bset	_PHDR,#4
2482                     ; 355 	if (a_strMessage[0] < 0x20)
2484  02ba 92c600        	ld	a,[_displayCmdToDisplay$L.w]
2485  02bd a120          	cp	a,#32
2486  02bf 2503          	jrult	L66
2487  02c1 cc0386        	jp	L7231
2488  02c4               L66:
2490  02c4 cc0354        	jp	L5721
2491  02c7               L3721:
2492                     ; 360 			if((a_strMessage[i]==DISPLAY_GRAPHIC_WRITE) && (byGraphics==0) && ((i==0) || (a_strMessage[i-1]==DISPLAY_WAIT)))
2494  02c7 beff          	ld	x,_displayCmdToDisplay$L-1
2495  02c9 92d600        	ld	a,([_displayCmdToDisplay$L.w],x)
2496  02cc a118          	cp	a,#24
2497  02ce 263e          	jrne	L1031
2499  02d0 3dfe          	tnz	_displayCmdToDisplay$L-2
2500  02d2 263a          	jrne	L1031
2502  02d4 3dff          	tnz	_displayCmdToDisplay$L-1
2503  02d6 271c          	jreq	L3031
2505  02d8 b6ff          	ld	a,_displayCmdToDisplay$L-1
2506  02da 5f            	clr	x
2507  02db 4d            	tnz	a
2508  02dc 2601          	jrne	L46
2509  02de 5a            	dec	x
2510  02df               L46:
2511  02df 4a            	dec	a
2512  02e0 bb01          	add	a,_displayCmdToDisplay$L+1
2513  02e2 88            	push	a
2514  02e3 9f            	ld	a,x
2515  02e4 b900          	adc	a,_displayCmdToDisplay$L
2516  02e6 97            	ld	x,a
2517  02e7 84            	pop	a
2518  02e8 bf00          	ld	c_x,x
2519  02ea 97            	ld	x,a
2520  02eb bf01          	ld	c_x+1,x
2521  02ed 92c600        	ld	a,[c_x.w]
2522  02f0 a1fe          	cp	a,#254
2523  02f2 261a          	jrne	L1031
2524  02f4               L3031:
2525                     ; 362 				byGraphics = a_strMessage[i+1]+2;
2527  02f4 b6ff          	ld	a,_displayCmdToDisplay$L-1
2528  02f6 5f            	clr	x
2529  02f7 bb01          	add	a,_displayCmdToDisplay$L+1
2530  02f9 88            	push	a
2531  02fa 9f            	ld	a,x
2532  02fb b900          	adc	a,_displayCmdToDisplay$L
2533  02fd 97            	ld	x,a
2534  02fe 84            	pop	a
2535  02ff bf00          	ld	c_x,x
2536  0301 97            	ld	x,a
2537  0302 a601          	ld	a,#1
2538  0304 bf01          	ld	c_x+1,x
2539  0306 97            	ld	x,a
2540  0307 92d600        	ld	a,([c_x.w],x)
2541  030a ab02          	add	a,#2
2542  030c b7fe          	ld	_displayCmdToDisplay$L-2,a
2543  030e               L1031:
2544                     ; 365 			if((a_strMessage[i]!=DISPLAY_WAIT) || (byGraphics >0))
2546  030e beff          	ld	x,_displayCmdToDisplay$L-1
2547  0310 92d600        	ld	a,([_displayCmdToDisplay$L.w],x)
2548  0313 a1fe          	cp	a,#254
2549  0315 2604          	jrne	L7031
2551  0317 3dfe          	tnz	_displayCmdToDisplay$L-2
2552  0319 271b          	jreq	L5031
2553  031b               L7031:
2554                     ; 367 				SPI_MoveByte(a_strMessage[i]);
2556  031b beff          	ld	x,_displayCmdToDisplay$L-1
2557  031d 92d600        	ld	a,([_displayCmdToDisplay$L.w],x)
2558  0320 cd0000        	call	_SPI_MoveByte
2560                     ; 372 					sleep(1); //Requested only if 8MHz
2562  0323 a601          	ld	a,#1
2563  0325 b703          	ld	_sleep$L+3,a
2564  0327 a600          	ld	a,#0
2565  0329 b702          	ld	_sleep$L+2,a
2566  032b a600          	ld	a,#0
2567  032d b701          	ld	_sleep$L+1,a
2568  032f a600          	ld	a,#0
2569  0331 b700          	ld	_sleep$L,a
2570  0333 cd0000        	call	_sleep
2572  0336               L5031:
2573                     ; 379 			if (byGraphics>0)
2575  0336 3dfe          	tnz	_displayCmdToDisplay$L-2
2576  0338 2702          	jreq	L1131
2577                     ; 381 				byGraphics--;
2579  033a 3afe          	dec	_displayCmdToDisplay$L-2
2580  033c               L1131:
2581                     ; 384 			i++;
2583  033c 3cff          	inc	_displayCmdToDisplay$L-1
2585  033e 2001          	jra	L5131
2586  0340               L3131:
2587                     ; 388 				Nop();
2590  0340 9d            nop
2592  0341               L5131:
2593                     ; 386 			while(!_btst(_Pa_DisplayBusy, _Pin_DisplayBusy) && ((a_strMessage[i]!=DISPLAY_EOF) || (byGraphics >0)))
2595  0341 b600          	ld	a,_PADR
2596  0343 a510          	bcp	a,#16
2597  0345 260d          	jrne	L5721
2599  0347 beff          	ld	x,_displayCmdToDisplay$L-1
2600  0349 92d600        	ld	a,([_displayCmdToDisplay$L.w],x)
2601  034c a1ff          	cp	a,#255
2602  034e 26f0          	jrne	L3131
2604  0350 3dfe          	tnz	_displayCmdToDisplay$L-2
2605  0352 26ec          	jrne	L3131
2606  0354               L5721:
2607                     ; 358 		while((a_strMessage[i]!=DISPLAY_EOF) || (byGraphics >0))
2609  0354 beff          	ld	x,_displayCmdToDisplay$L-1
2610  0356 92d600        	ld	a,([_displayCmdToDisplay$L.w],x)
2611  0359 a1ff          	cp	a,#255
2612  035b 2703          	jreq	L07
2613  035d cc02c7        	jp	L3721
2614  0360               L07:
2616  0360 3dfe          	tnz	_displayCmdToDisplay$L-2
2617  0362 2703          	jreq	L27
2618  0364 cc02c7        	jp	L3721
2619  0367               L27:
2621  0367 2025          	jra	L3231
2622  0369               L5231:
2623                     ; 398 			SPI_MoveByte(a_strMessage[i]);
2625  0369 beff          	ld	x,_displayCmdToDisplay$L-1
2626  036b 92d600        	ld	a,([_displayCmdToDisplay$L.w],x)
2627  036e cd0000        	call	_SPI_MoveByte
2629                     ; 403 				sleep(80);
2631  0371 a650          	ld	a,#80
2632  0373 b703          	ld	_sleep$L+3,a
2633  0375 a600          	ld	a,#0
2634  0377 b702          	ld	_sleep$L+2,a
2635  0379 a600          	ld	a,#0
2636  037b b701          	ld	_sleep$L+1,a
2637  037d a600          	ld	a,#0
2638  037f b700          	ld	_sleep$L,a
2639  0381 cd0000        	call	_sleep
2641                     ; 408 			i++;
2643  0384 3cff          	inc	_displayCmdToDisplay$L-1
2644  0386               L7231:
2645                     ; 396 		while(a_strMessage[i]!=0x00)
2647  0386 beff          	ld	x,_displayCmdToDisplay$L-1
2648  0388 92d600        	ld	a,([_displayCmdToDisplay$L.w],x)
2649  038b 4d            	tnz	a
2650  038c 26db          	jrne	L5231
2651  038e               L3231:
2652                     ; 412 	_bres(_Pa_Select_UA, _Pin_Select_UA);
2654  038e 1115          	bres	_PHDR,#0
2655                     ; 413 	_bres(_Pa_Select_UB, _Pin_Select_UB);
2657  0390 1315          	bres	_PHDR,#1
2658                     ; 414 	_bres(_Pa_Select_UC, _Pin_Select_UC);
2660  0392 1515          	bres	_PHDR,#2
2661                     ; 415 	_bres(_Pa_Select_U2, _Pin_Select_U2);	
2663  0394 1915          	bres	_PHDR,#4
2664                     ; 416 }
2667  0396 81            	ret
2702                     ; 420 void displayClearCommandBuffer(void)
2702                     ; 421 {
2703                     	switch	.text
2705                     	xref.b	_displayClearCommandBuffer$L
2706  0397               _displayClearCommandBuffer:
2709                     ; 422 	WORD woIndex = 0x0200;
2711  0397 a602          	ld	a,#2
2712  0399 b7fe          	ld	_displayClearCommandBuffer$L-2,a
2713  039b 3fff          	clr	_displayClearCommandBuffer$L-1
2715  039d 2016          	jra	L5531
2716  039f               L1531:
2717                     ; 425 		m_arbyDisplayCommand[--woIndex] = 0x00;
2719  039f b6ff          	ld	a,_displayClearCommandBuffer$L-1
2720  03a1 befe          	ld	x,_displayClearCommandBuffer$L-2
2721  03a3 4d            	tnz	a
2722  03a4 2601          	jrne	L67
2723  03a6 5a            	dec	x
2724  03a7               L67:
2725  03a7 4a            	dec	a
2726  03a8 b7ff          	ld	_displayClearCommandBuffer$L-1,a
2727  03aa bffe          	ld	_displayClearCommandBuffer$L-2,x
2728  03ac b6ff          	ld	a,_displayClearCommandBuffer$L-1
2729  03ae befe          	ld	x,_displayClearCommandBuffer$L-2
2730  03b0 97            	ld	x,a
2731  03b1 4f            	clr	a
2732  03b2 d70000        	ld	(_m_arbyDisplayCommand,x),a
2733  03b5               L5531:
2734                     ; 423 	while(woIndex>0)
2736  03b5 b6ff          	ld	a,_displayClearCommandBuffer$L-1
2737  03b7 bafe          	or	a,_displayClearCommandBuffer$L-2
2738  03b9 26e4          	jrne	L1531
2739                     ; 427 }
2742  03bb 81            	ret
2815                     ; 431 void displayWriteString(BYTE * a_strValue, BYTE a_byFontSize, BYTE a_byX, BYTE a_byY)
2815                     ; 432 {
2816                     	switch	.text
2818                     	xref.b	_displayWriteString$L
2819  03bc               _displayWriteString:
2821  03bc b701          	ld	_displayWriteString$L+1,a
2822  03be bf00          	ld	_displayWriteString$L,x
2824                     ; 433 	BYTE i = 0x00;
2826  03c0 3fff          	clr	_displayWriteString$L-1
2827                     ; 436 	if (a_byX != DISPLAY_NULL)
2829  03c2 b603          	ld	a,_displayWriteString$L+3
2830  03c4 a1ff          	cp	a,#255
2831  03c6 2724          	jreq	L7141
2832                     ; 438 		m_arbyDisplayCommand[i++] = DISPLAY_CURSOR_POSITION;
2834  03c8 beff          	ld	x,_displayWriteString$L-1
2835  03ca 3cff          	inc	_displayWriteString$L-1
2836  03cc a610          	ld	a,#16
2837  03ce d70000        	ld	(_m_arbyDisplayCommand,x),a
2838                     ; 439 		m_arbyDisplayCommand[i++] = a_byX;
2840  03d1 beff          	ld	x,_displayWriteString$L-1
2841  03d3 3cff          	inc	_displayWriteString$L-1
2842  03d5 b603          	ld	a,_displayWriteString$L+3
2843  03d7 d70000        	ld	(_m_arbyDisplayCommand,x),a
2844                     ; 440 		m_arbyDisplayCommand[i++] = a_byY;
2846  03da beff          	ld	x,_displayWriteString$L-1
2847  03dc 3cff          	inc	_displayWriteString$L-1
2848  03de b604          	ld	a,_displayWriteString$L+4
2849  03e0 d70000        	ld	(_m_arbyDisplayCommand,x),a
2850                     ; 441 		m_arbyDisplayCommand[i++] = DISPLAY_WAIT;
2852  03e3 beff          	ld	x,_displayWriteString$L-1
2853  03e5 3cff          	inc	_displayWriteString$L-1
2854  03e7 a6fe          	ld	a,#254
2855  03e9 d70000        	ld	(_m_arbyDisplayCommand,x),a
2856  03ec               L7141:
2857                     ; 445 	if (a_byFontSize != DISPLAY_NULL)
2859  03ec b602          	ld	a,_displayWriteString$L+2
2860  03ee a1ff          	cp	a,#255
2861  03f0 2712          	jreq	L1241
2862                     ; 447 		m_arbyDisplayCommand[i++] = a_byFontSize;
2864  03f2 beff          	ld	x,_displayWriteString$L-1
2865  03f4 3cff          	inc	_displayWriteString$L-1
2866  03f6 b602          	ld	a,_displayWriteString$L+2
2867  03f8 d70000        	ld	(_m_arbyDisplayCommand,x),a
2868                     ; 448 		m_arbyDisplayCommand[i++] = DISPLAY_WAIT;
2870  03fb beff          	ld	x,_displayWriteString$L-1
2871  03fd 3cff          	inc	_displayWriteString$L-1
2872  03ff a6fe          	ld	a,#254
2873  0401 d70000        	ld	(_m_arbyDisplayCommand,x),a
2874  0404               L1241:
2875                     ; 451 	i +=memcpy((m_arbyDisplayCommand+i), a_strValue, DISPLAY_CMD_BUFFER-i);
2877  0404 a680          	ld	a,#128
2878  0406 b0ff          	sub	a,_displayWriteString$L-1
2879  0408 b704          	ld	_memcpy$L+4,a
2880  040a be00          	ld	x,_displayWriteString$L
2881  040c bf02          	ld	_memcpy$L+2,x
2882  040e b601          	ld	a,_displayWriteString$L+1
2883  0410 b703          	ld	_memcpy$L+3,a
2884  0412 a600          	ld	a,#low(_m_arbyDisplayCommand)
2885  0414 ae00          	ld	x,#high(_m_arbyDisplayCommand)
2886  0416 bbff          	add	a,_displayWriteString$L-1
2887  0418 2401          	jrnc	L201
2888  041a 5c            	inc	x
2889  041b               L201:
2890  041b cd0000        	call	_memcpy
2892  041e bbff          	add	a,_displayWriteString$L-1
2893  0420 b7ff          	ld	_displayWriteString$L-1,a
2894                     ; 453 	m_arbyDisplayCommand[i++] = DISPLAY_WAIT;
2896  0422 beff          	ld	x,_displayWriteString$L-1
2897  0424 3cff          	inc	_displayWriteString$L-1
2898  0426 a6fe          	ld	a,#254
2899  0428 d70000        	ld	(_m_arbyDisplayCommand,x),a
2900                     ; 454 	m_arbyDisplayCommand[i++] = DISPLAY_WAIT;
2902  042b beff          	ld	x,_displayWriteString$L-1
2903  042d 3cff          	inc	_displayWriteString$L-1
2904  042f a6fe          	ld	a,#254
2905  0431 d70000        	ld	(_m_arbyDisplayCommand,x),a
2906                     ; 455 	m_arbyDisplayCommand[i++] = DISPLAY_EOF;		
2908  0434 beff          	ld	x,_displayWriteString$L-1
2909  0436 3cff          	inc	_displayWriteString$L-1
2910  0438 a6ff          	ld	a,#255
2911  043a d70000        	ld	(_m_arbyDisplayCommand,x),a
2912                     ; 456 	m_arbyDisplayCommand[i++] = 0x00;
2914  043d beff          	ld	x,_displayWriteString$L-1
2915  043f 3cff          	inc	_displayWriteString$L-1
2916  0441 4f            	clr	a
2917  0442 d70000        	ld	(_m_arbyDisplayCommand,x),a
2918                     ; 458 	displayCmdToDisplay(m_arbyDisplayCommand);
2920  0445 a600          	ld	a,#low(_m_arbyDisplayCommand)
2921  0447 ae00          	ld	x,#high(_m_arbyDisplayCommand)
2922  0449 cd02aa        	call	_displayCmdToDisplay
2924                     ; 459 }
2927  044c 81            	ret
2998                     ; 462 void displaySetArea(BYTE a_byLeft, BYTE a_byTop, BYTE a_byRight, BYTE a_byBottom)
2998                     ; 463 {
2999                     	switch	.text
3001                     	xref.b	_displaySetArea$L
3002  044d               _displaySetArea:
3004  044d b701          	ld	_displaySetArea$L+1,a
3005  044f bf00          	ld	_displaySetArea$L,x
3007                     ; 464 	BYTE i = 0x00;
3009  0451 3fff          	clr	_displaySetArea$L-1
3010                     ; 465 	m_arbyDisplayCommand[i++] = DISPLAY_SET_AREA;
3012  0453 beff          	ld	x,_displaySetArea$L-1
3013  0455 3cff          	inc	_displaySetArea$L-1
3014  0457 a611          	ld	a,#17
3015  0459 d70000        	ld	(_m_arbyDisplayCommand,x),a
3016                     ; 466 	m_arbyDisplayCommand[i++] = a_byLeft;
3018  045c beff          	ld	x,_displaySetArea$L-1
3019  045e 3cff          	inc	_displaySetArea$L-1
3020  0460 b600          	ld	a,_displaySetArea$L
3021  0462 d70000        	ld	(_m_arbyDisplayCommand,x),a
3022                     ; 467 	m_arbyDisplayCommand[i++] = a_byTop;
3024  0465 beff          	ld	x,_displaySetArea$L-1
3025  0467 3cff          	inc	_displaySetArea$L-1
3026  0469 b601          	ld	a,_displaySetArea$L+1
3027  046b d70000        	ld	(_m_arbyDisplayCommand,x),a
3028                     ; 468 	m_arbyDisplayCommand[i++] = a_byRight;
3030  046e beff          	ld	x,_displaySetArea$L-1
3031  0470 3cff          	inc	_displaySetArea$L-1
3032  0472 b602          	ld	a,_displaySetArea$L+2
3033  0474 d70000        	ld	(_m_arbyDisplayCommand,x),a
3034                     ; 469 	m_arbyDisplayCommand[i++] = a_byBottom;
3036  0477 beff          	ld	x,_displaySetArea$L-1
3037  0479 3cff          	inc	_displaySetArea$L-1
3038  047b b603          	ld	a,_displaySetArea$L+3
3039  047d d70000        	ld	(_m_arbyDisplayCommand,x),a
3040                     ; 470 	m_arbyDisplayCommand[i++] = DISPLAY_WAIT;
3042  0480 beff          	ld	x,_displaySetArea$L-1
3043  0482 3cff          	inc	_displaySetArea$L-1
3044  0484 a6fe          	ld	a,#254
3045  0486 d70000        	ld	(_m_arbyDisplayCommand,x),a
3046                     ; 471 	m_arbyDisplayCommand[i++] = DISPLAY_EOF;		
3048  0489 beff          	ld	x,_displaySetArea$L-1
3049  048b 3cff          	inc	_displaySetArea$L-1
3050  048d a6ff          	ld	a,#255
3051  048f d70000        	ld	(_m_arbyDisplayCommand,x),a
3052                     ; 473 	displayCmdToDisplay(m_arbyDisplayCommand);
3054  0492 a600          	ld	a,#low(_m_arbyDisplayCommand)
3055  0494 ae00          	ld	x,#high(_m_arbyDisplayCommand)
3056  0496 cd02aa        	call	_displayCmdToDisplay
3058                     ; 474 }
3061  0499 81            	ret
3142                     ; 477 void displaySetOutLine(BYTE a_byLeft, BYTE a_byTop, BYTE a_byRight, BYTE a_byBottom, BYTE a_byReversed)
3142                     ; 478 {
3143                     	switch	.text
3145                     	xref.b	_displaySetOutLine$L
3146  049a               _displaySetOutLine:
3148  049a b701          	ld	_displaySetOutLine$L+1,a
3149  049c bf00          	ld	_displaySetOutLine$L,x
3151                     ; 479 	BYTE i = 0x00;
3153  049e 3fff          	clr	_displaySetOutLine$L-1
3154                     ; 480 	m_arbyDisplayCommand[i++] = DISPLAY_SET_OUTLINE;
3156  04a0 beff          	ld	x,_displaySetOutLine$L-1
3157  04a2 3cff          	inc	_displaySetOutLine$L-1
3158  04a4 a614          	ld	a,#20
3159  04a6 d70000        	ld	(_m_arbyDisplayCommand,x),a
3160                     ; 481 	m_arbyDisplayCommand[i++] = a_byLeft;
3162  04a9 beff          	ld	x,_displaySetOutLine$L-1
3163  04ab 3cff          	inc	_displaySetOutLine$L-1
3164  04ad b600          	ld	a,_displaySetOutLine$L
3165  04af d70000        	ld	(_m_arbyDisplayCommand,x),a
3166                     ; 482 	m_arbyDisplayCommand[i++] = a_byTop;
3168  04b2 beff          	ld	x,_displaySetOutLine$L-1
3169  04b4 3cff          	inc	_displaySetOutLine$L-1
3170  04b6 b601          	ld	a,_displaySetOutLine$L+1
3171  04b8 d70000        	ld	(_m_arbyDisplayCommand,x),a
3172                     ; 483 	m_arbyDisplayCommand[i++] = a_byRight;
3174  04bb beff          	ld	x,_displaySetOutLine$L-1
3175  04bd 3cff          	inc	_displaySetOutLine$L-1
3176  04bf b602          	ld	a,_displaySetOutLine$L+2
3177  04c1 d70000        	ld	(_m_arbyDisplayCommand,x),a
3178                     ; 484 	m_arbyDisplayCommand[i++] = a_byBottom;
3180  04c4 beff          	ld	x,_displaySetOutLine$L-1
3181  04c6 3cff          	inc	_displaySetOutLine$L-1
3182  04c8 b603          	ld	a,_displaySetOutLine$L+3
3183  04ca d70000        	ld	(_m_arbyDisplayCommand,x),a
3184                     ; 485 	m_arbyDisplayCommand[i++] = DISPLAY_WAIT;
3186  04cd beff          	ld	x,_displaySetOutLine$L-1
3187  04cf 3cff          	inc	_displaySetOutLine$L-1
3188  04d1 a6fe          	ld	a,#254
3189  04d3 d70000        	ld	(_m_arbyDisplayCommand,x),a
3190                     ; 486 	m_arbyDisplayCommand[i++] = DISPLAY_EOF;		
3192  04d6 beff          	ld	x,_displaySetOutLine$L-1
3193  04d8 3cff          	inc	_displaySetOutLine$L-1
3194  04da a6ff          	ld	a,#255
3195  04dc d70000        	ld	(_m_arbyDisplayCommand,x),a
3196                     ; 488 	displayCmdToDisplay(m_arbyDisplayCommand);
3198  04df a600          	ld	a,#low(_m_arbyDisplayCommand)
3199  04e1 ae00          	ld	x,#high(_m_arbyDisplayCommand)
3200  04e3 cd02aa        	call	_displayCmdToDisplay
3202                     ; 490 	if (a_byReversed)
3204  04e6 3d04          	tnz	_displaySetOutLine$L+4
3205  04e8 2712          	jreq	L3251
3206                     ; 492 		displayInvertArea(a_byLeft + 1, a_byTop + 1, a_byRight - 1, a_byBottom - 1);
3208  04ea b603          	ld	a,_displaySetOutLine$L+3
3209  04ec 4a            	dec	a
3210  04ed b703          	ld	_displayInvertArea$L+3,a
3211  04ef b602          	ld	a,_displaySetOutLine$L+2
3212  04f1 4a            	dec	a
3213  04f2 b702          	ld	_displayInvertArea$L+2,a
3214  04f4 b601          	ld	a,_displaySetOutLine$L+1
3215  04f6 4c            	inc	a
3216  04f7 be00          	ld	x,_displaySetOutLine$L
3217  04f9 5c            	inc	x
3218  04fa ad4e          	call	_displayInvertArea
3220  04fc               L3251:
3221                     ; 494 }
3224  04fc 81            	ret
3295                     ; 497 void displayClearArea(BYTE a_byLeft, BYTE a_byTop, BYTE a_byRight, BYTE a_byBottom)
3295                     ; 498 {
3296                     	switch	.text
3298                     	xref.b	_displayClearArea$L
3299  04fd               _displayClearArea:
3301  04fd b701          	ld	_displayClearArea$L+1,a
3302  04ff bf00          	ld	_displayClearArea$L,x
3304                     ; 499 	BYTE i = 0x00;
3306  0501 3fff          	clr	_displayClearArea$L-1
3307                     ; 500 	m_arbyDisplayCommand[i++] = DISPLAY_CLEAR_AREA;
3309  0503 beff          	ld	x,_displayClearArea$L-1
3310  0505 3cff          	inc	_displayClearArea$L-1
3311  0507 a612          	ld	a,#18
3312  0509 d70000        	ld	(_m_arbyDisplayCommand,x),a
3313                     ; 501 	m_arbyDisplayCommand[i++] = a_byLeft;
3315  050c beff          	ld	x,_displayClearArea$L-1
3316  050e 3cff          	inc	_displayClearArea$L-1
3317  0510 b600          	ld	a,_displayClearArea$L
3318  0512 d70000        	ld	(_m_arbyDisplayCommand,x),a
3319                     ; 502 	m_arbyDisplayCommand[i++] = a_byTop;
3321  0515 beff          	ld	x,_displayClearArea$L-1
3322  0517 3cff          	inc	_displayClearArea$L-1
3323  0519 b601          	ld	a,_displayClearArea$L+1
3324  051b d70000        	ld	(_m_arbyDisplayCommand,x),a
3325                     ; 503 	m_arbyDisplayCommand[i++] = a_byRight;
3327  051e beff          	ld	x,_displayClearArea$L-1
3328  0520 3cff          	inc	_displayClearArea$L-1
3329  0522 b602          	ld	a,_displayClearArea$L+2
3330  0524 d70000        	ld	(_m_arbyDisplayCommand,x),a
3331                     ; 504 	m_arbyDisplayCommand[i++] = a_byBottom;
3333  0527 beff          	ld	x,_displayClearArea$L-1
3334  0529 3cff          	inc	_displayClearArea$L-1
3335  052b b603          	ld	a,_displayClearArea$L+3
3336  052d d70000        	ld	(_m_arbyDisplayCommand,x),a
3337                     ; 505 	m_arbyDisplayCommand[i++] = DISPLAY_WAIT;
3339  0530 beff          	ld	x,_displayClearArea$L-1
3340  0532 3cff          	inc	_displayClearArea$L-1
3341  0534 a6fe          	ld	a,#254
3342  0536 d70000        	ld	(_m_arbyDisplayCommand,x),a
3343                     ; 506 	m_arbyDisplayCommand[i++] = DISPLAY_EOF;		
3345  0539 beff          	ld	x,_displayClearArea$L-1
3346  053b 3cff          	inc	_displayClearArea$L-1
3347  053d a6ff          	ld	a,#255
3348  053f d70000        	ld	(_m_arbyDisplayCommand,x),a
3349                     ; 508 	displayCmdToDisplay(m_arbyDisplayCommand);
3351  0542 a600          	ld	a,#low(_m_arbyDisplayCommand)
3352  0544 ae00          	ld	x,#high(_m_arbyDisplayCommand)
3353  0546 cd02aa        	call	_displayCmdToDisplay
3355                     ; 509 }
3358  0549 81            	ret
3429                     ; 512 void displayInvertArea(BYTE a_byLeft, BYTE a_byTop, BYTE a_byRight, BYTE a_byBottom)
3429                     ; 513 {
3430                     	switch	.text
3432                     	xref.b	_displayInvertArea$L
3433  054a               _displayInvertArea:
3435  054a b701          	ld	_displayInvertArea$L+1,a
3436  054c bf00          	ld	_displayInvertArea$L,x
3438                     ; 514 	BYTE i = 0x00;
3440  054e 3fff          	clr	_displayInvertArea$L-1
3441                     ; 515 	m_arbyDisplayCommand[i++] = DISPLAY_INVERT_AREA;
3443  0550 beff          	ld	x,_displayInvertArea$L-1
3444  0552 3cff          	inc	_displayInvertArea$L-1
3445  0554 a613          	ld	a,#19
3446  0556 d70000        	ld	(_m_arbyDisplayCommand,x),a
3447                     ; 516 	m_arbyDisplayCommand[i++] = a_byLeft;
3449  0559 beff          	ld	x,_displayInvertArea$L-1
3450  055b 3cff          	inc	_displayInvertArea$L-1
3451  055d b600          	ld	a,_displayInvertArea$L
3452  055f d70000        	ld	(_m_arbyDisplayCommand,x),a
3453                     ; 517 	m_arbyDisplayCommand[i++] = a_byTop;
3455  0562 beff          	ld	x,_displayInvertArea$L-1
3456  0564 3cff          	inc	_displayInvertArea$L-1
3457  0566 b601          	ld	a,_displayInvertArea$L+1
3458  0568 d70000        	ld	(_m_arbyDisplayCommand,x),a
3459                     ; 518 	m_arbyDisplayCommand[i++] = (a_byRight>124?124:a_byRight);
3461  056b b602          	ld	a,_displayInvertArea$L+2
3462  056d a17d          	cp	a,#125
3463  056f 2504          	jrult	L411
3464  0571 a67c          	ld	a,#124
3465  0573 2002          	jra	L611
3466  0575               L411:
3467  0575 b602          	ld	a,_displayInvertArea$L+2
3468  0577               L611:
3469  0577 beff          	ld	x,_displayInvertArea$L-1
3470  0579 3cff          	inc	_displayInvertArea$L-1
3471  057b d70000        	ld	(_m_arbyDisplayCommand,x),a
3472                     ; 519 	m_arbyDisplayCommand[i++] = (a_byBottom>62?62:a_byBottom);
3474  057e b603          	ld	a,_displayInvertArea$L+3
3475  0580 a13f          	cp	a,#63
3476  0582 2504          	jrult	L021
3477  0584 a63e          	ld	a,#62
3478  0586 2002          	jra	L221
3479  0588               L021:
3480  0588 b603          	ld	a,_displayInvertArea$L+3
3481  058a               L221:
3482  058a beff          	ld	x,_displayInvertArea$L-1
3483  058c 3cff          	inc	_displayInvertArea$L-1
3484  058e d70000        	ld	(_m_arbyDisplayCommand,x),a
3485                     ; 520 	m_arbyDisplayCommand[i++] = DISPLAY_WAIT;
3487  0591 beff          	ld	x,_displayInvertArea$L-1
3488  0593 3cff          	inc	_displayInvertArea$L-1
3489  0595 a6fe          	ld	a,#254
3490  0597 d70000        	ld	(_m_arbyDisplayCommand,x),a
3491                     ; 521 	m_arbyDisplayCommand[i++] = DISPLAY_EOF;		
3493  059a beff          	ld	x,_displayInvertArea$L-1
3494  059c 3cff          	inc	_displayInvertArea$L-1
3495  059e a6ff          	ld	a,#255
3496  05a0 d70000        	ld	(_m_arbyDisplayCommand,x),a
3497                     ; 523 	displayCmdToDisplay(m_arbyDisplayCommand);
3499  05a3 a600          	ld	a,#low(_m_arbyDisplayCommand)
3500  05a5 ae00          	ld	x,#high(_m_arbyDisplayCommand)
3501  05a7 cd02aa        	call	_displayCmdToDisplay
3503                     ; 524 }
3506  05aa 81            	ret
3559                     ; 527 void displayDrawVerticalLine(BYTE a_byX, BYTE a_byTop, BYTE a_byLength)
3559                     ; 528 {
3560                     	switch	.text
3562                     	xref.b	_displayDrawVerticalLine$L
3563  05ab               _displayDrawVerticalLine:
3565  05ab b701          	ld	_displayDrawVerticalLine$L+1,a
3566  05ad bf00          	ld	_displayDrawVerticalLine$L,x
3568                     ; 529 	displaySetArea(a_byX, a_byTop, a_byX, a_byTop + a_byLength);
3570  05af bb02          	add	a,_displayDrawVerticalLine$L+2
3571  05b1 b703          	ld	_displaySetArea$L+3,a
3572  05b3 b600          	ld	a,_displayDrawVerticalLine$L
3573  05b5 b702          	ld	_displaySetArea$L+2,a
3574  05b7 b601          	ld	a,_displayDrawVerticalLine$L+1
3575  05b9 be00          	ld	x,_displayDrawVerticalLine$L
3576  05bb cd044d        	call	_displaySetArea
3578                     ; 530 }
3581  05be 81            	ret
3634                     ; 533 void displayDrawHorizontalLine(BYTE a_byY, BYTE a_byLeft, BYTE a_byWidth)
3634                     ; 534 {
3635                     	switch	.text
3637                     	xref.b	_displayDrawHorizontalLine$L
3638  05bf               _displayDrawHorizontalLine:
3640  05bf b701          	ld	_displayDrawHorizontalLine$L+1,a
3641  05c1 bf00          	ld	_displayDrawHorizontalLine$L,x
3643                     ; 535 	displaySetArea(a_byLeft, a_byY, a_byLeft+a_byWidth, a_byY);
3645  05c3 bf03          	ld	_displaySetArea$L+3,x
3646  05c5 bb02          	add	a,_displayDrawHorizontalLine$L+2
3647  05c7 b702          	ld	_displaySetArea$L+2,a
3648  05c9 b600          	ld	a,_displayDrawHorizontalLine$L
3649  05cb be01          	ld	x,_displayDrawHorizontalLine$L+1
3650  05cd cd044d        	call	_displaySetArea
3652                     ; 536 }
3655  05d0 81            	ret
3717                     ; 539 void displayDrawLed(BYTE a_byX, BYTE a_byY, BYTE a_byFilled)
3717                     ; 540 {
3718                     	switch	.text
3720                     	xref.b	_displayDrawLed$L
3721  05d1               _displayDrawLed:
3723  05d1 b701          	ld	_displayDrawLed$L+1,a
3724  05d3 bf00          	ld	_displayDrawLed$L,x
3726                     ; 541 	BYTE i = 0x00;
3728  05d5 3fff          	clr	_displayDrawLed$L-1
3729                     ; 544 	if (a_byX != DISPLAY_NULL)
3731  05d7 b600          	ld	a,_displayDrawLed$L
3732  05d9 a1ff          	cp	a,#255
3733  05db 2726          	jreq	L7271
3734                     ; 546 		m_arbyDisplayCommand[i++] = DISPLAY_CURSOR_POSITION;
3736  05dd beff          	ld	x,_displayDrawLed$L-1
3737  05df 3cff          	inc	_displayDrawLed$L-1
3738  05e1 a610          	ld	a,#16
3739  05e3 d70000        	ld	(_m_arbyDisplayCommand,x),a
3740                     ; 547 		m_arbyDisplayCommand[i++] = a_byX - 2;
3742  05e6 b600          	ld	a,_displayDrawLed$L
3743  05e8 a002          	sub	a,#2
3744  05ea beff          	ld	x,_displayDrawLed$L-1
3745  05ec 3cff          	inc	_displayDrawLed$L-1
3746  05ee d70000        	ld	(_m_arbyDisplayCommand,x),a
3747                     ; 548 		m_arbyDisplayCommand[i++] = a_byY;
3749  05f1 beff          	ld	x,_displayDrawLed$L-1
3750  05f3 3cff          	inc	_displayDrawLed$L-1
3751  05f5 b601          	ld	a,_displayDrawLed$L+1
3752  05f7 d70000        	ld	(_m_arbyDisplayCommand,x),a
3753                     ; 549 		m_arbyDisplayCommand[i++] = DISPLAY_WAIT;
3755  05fa beff          	ld	x,_displayDrawLed$L-1
3756  05fc 3cff          	inc	_displayDrawLed$L-1
3757  05fe a6fe          	ld	a,#254
3758  0600 d70000        	ld	(_m_arbyDisplayCommand,x),a
3759  0603               L7271:
3760                     ; 551 	m_arbyDisplayCommand[i++] = DISPLAY_GRAPHIC_WRITE;
3762  0603 beff          	ld	x,_displayDrawLed$L-1
3763  0605 3cff          	inc	_displayDrawLed$L-1
3764  0607 a618          	ld	a,#24
3765  0609 d70000        	ld	(_m_arbyDisplayCommand,x),a
3766                     ; 552     m_arbyDisplayCommand[i++] = 8; //Length
3768  060c beff          	ld	x,_displayDrawLed$L-1
3769  060e 3cff          	inc	_displayDrawLed$L-1
3770  0610 a608          	ld	a,#8
3771  0612 d70000        	ld	(_m_arbyDisplayCommand,x),a
3772                     ; 555 	if (a_byFilled)
3774  0615 3d02          	tnz	_displayDrawLed$L+2
3775  0617 2748          	jreq	L1371
3776                     ; 557 		m_arbyDisplayCommand[i++] = 0x30;
3778  0619 beff          	ld	x,_displayDrawLed$L-1
3779  061b 3cff          	inc	_displayDrawLed$L-1
3780  061d a630          	ld	a,#48
3781  061f d70000        	ld	(_m_arbyDisplayCommand,x),a
3782                     ; 558 		m_arbyDisplayCommand[i++] = 0x78;
3784  0622 beff          	ld	x,_displayDrawLed$L-1
3785  0624 3cff          	inc	_displayDrawLed$L-1
3786  0626 a678          	ld	a,#120
3787  0628 d70000        	ld	(_m_arbyDisplayCommand,x),a
3788                     ; 559 		m_arbyDisplayCommand[i++] = 0xFC;
3790  062b beff          	ld	x,_displayDrawLed$L-1
3791  062d 3cff          	inc	_displayDrawLed$L-1
3792  062f a6fc          	ld	a,#252
3793  0631 d70000        	ld	(_m_arbyDisplayCommand,x),a
3794                     ; 560 		m_arbyDisplayCommand[i++] = 0xFC;
3796  0634 beff          	ld	x,_displayDrawLed$L-1
3797  0636 3cff          	inc	_displayDrawLed$L-1
3798  0638 a6fc          	ld	a,#252
3799  063a d70000        	ld	(_m_arbyDisplayCommand,x),a
3800                     ; 561 		m_arbyDisplayCommand[i++] = 0x78;
3802  063d beff          	ld	x,_displayDrawLed$L-1
3803  063f 3cff          	inc	_displayDrawLed$L-1
3804  0641 a678          	ld	a,#120
3805  0643 d70000        	ld	(_m_arbyDisplayCommand,x),a
3806                     ; 562 		m_arbyDisplayCommand[i++] = 0x30;
3808  0646 beff          	ld	x,_displayDrawLed$L-1
3809  0648 3cff          	inc	_displayDrawLed$L-1
3810  064a a630          	ld	a,#48
3811  064c d70000        	ld	(_m_arbyDisplayCommand,x),a
3812                     ; 563 		m_arbyDisplayCommand[i++] = 0x00;
3814  064f beff          	ld	x,_displayDrawLed$L-1
3815  0651 3cff          	inc	_displayDrawLed$L-1
3816  0653 4f            	clr	a
3817  0654 d70000        	ld	(_m_arbyDisplayCommand,x),a
3818                     ; 564 		m_arbyDisplayCommand[i++] = 0x00;		
3820  0657 beff          	ld	x,_displayDrawLed$L-1
3821  0659 3cff          	inc	_displayDrawLed$L-1
3822  065b 4f            	clr	a
3823  065c d70000        	ld	(_m_arbyDisplayCommand,x),a
3825  065f 2046          	jra	L3371
3826  0661               L1371:
3827                     ; 568 		m_arbyDisplayCommand[i++] = 0x30;
3829  0661 beff          	ld	x,_displayDrawLed$L-1
3830  0663 3cff          	inc	_displayDrawLed$L-1
3831  0665 a630          	ld	a,#48
3832  0667 d70000        	ld	(_m_arbyDisplayCommand,x),a
3833                     ; 569 		m_arbyDisplayCommand[i++] = 0x48;
3835  066a beff          	ld	x,_displayDrawLed$L-1
3836  066c 3cff          	inc	_displayDrawLed$L-1
3837  066e a648          	ld	a,#72
3838  0670 d70000        	ld	(_m_arbyDisplayCommand,x),a
3839                     ; 570 		m_arbyDisplayCommand[i++] = 0x84;
3841  0673 beff          	ld	x,_displayDrawLed$L-1
3842  0675 3cff          	inc	_displayDrawLed$L-1
3843  0677 a684          	ld	a,#132
3844  0679 d70000        	ld	(_m_arbyDisplayCommand,x),a
3845                     ; 571 		m_arbyDisplayCommand[i++] = 0x84;
3847  067c beff          	ld	x,_displayDrawLed$L-1
3848  067e 3cff          	inc	_displayDrawLed$L-1
3849  0680 a684          	ld	a,#132
3850  0682 d70000        	ld	(_m_arbyDisplayCommand,x),a
3851                     ; 572 		m_arbyDisplayCommand[i++] = 0x48;
3853  0685 beff          	ld	x,_displayDrawLed$L-1
3854  0687 3cff          	inc	_displayDrawLed$L-1
3855  0689 a648          	ld	a,#72
3856  068b d70000        	ld	(_m_arbyDisplayCommand,x),a
3857                     ; 573 		m_arbyDisplayCommand[i++] = 0x30;
3859  068e beff          	ld	x,_displayDrawLed$L-1
3860  0690 3cff          	inc	_displayDrawLed$L-1
3861  0692 a630          	ld	a,#48
3862  0694 d70000        	ld	(_m_arbyDisplayCommand,x),a
3863                     ; 574 		m_arbyDisplayCommand[i++] = 0x00;
3865  0697 beff          	ld	x,_displayDrawLed$L-1
3866  0699 3cff          	inc	_displayDrawLed$L-1
3867  069b 4f            	clr	a
3868  069c d70000        	ld	(_m_arbyDisplayCommand,x),a
3869                     ; 575 		m_arbyDisplayCommand[i++] = 0x00;		
3871  069f beff          	ld	x,_displayDrawLed$L-1
3872  06a1 3cff          	inc	_displayDrawLed$L-1
3873  06a3 4f            	clr	a
3874  06a4 d70000        	ld	(_m_arbyDisplayCommand,x),a
3875  06a7               L3371:
3876                     ; 578 	m_arbyDisplayCommand[i++] = DISPLAY_WAIT;
3878  06a7 beff          	ld	x,_displayDrawLed$L-1
3879  06a9 3cff          	inc	_displayDrawLed$L-1
3880  06ab a6fe          	ld	a,#254
3881  06ad d70000        	ld	(_m_arbyDisplayCommand,x),a
3882                     ; 579 	m_arbyDisplayCommand[i++] = DISPLAY_EOF;		
3884  06b0 beff          	ld	x,_displayDrawLed$L-1
3885  06b2 3cff          	inc	_displayDrawLed$L-1
3886  06b4 a6ff          	ld	a,#255
3887  06b6 d70000        	ld	(_m_arbyDisplayCommand,x),a
3888                     ; 581 	displayCmdToDisplay(m_arbyDisplayCommand);	
3890  06b9 a600          	ld	a,#low(_m_arbyDisplayCommand)
3891  06bb ae00          	ld	x,#high(_m_arbyDisplayCommand)
3892  06bd cd02aa        	call	_displayCmdToDisplay
3894                     ; 582 }
3897  06c0 81            	ret
3969                     ; 586 void displayDrawSelector(BYTE a_byX, BYTE a_byY, BYTE a_byFilled, BYTE a_byReversed)
3969                     ; 587 {
3970                     	switch	.text
3972                     	xref.b	_displayDrawSelector$L
3973  06c1               _displayDrawSelector:
3975  06c1 b701          	ld	_displayDrawSelector$L+1,a
3976  06c3 bf00          	ld	_displayDrawSelector$L,x
3978                     ; 588 	BYTE i = 0x00;
3980  06c5 3fff          	clr	_displayDrawSelector$L-1
3981                     ; 590 	i=0;
3983  06c7 3fff          	clr	_displayDrawSelector$L-1
3984                     ; 593 	if (a_byX != DISPLAY_NULL)
3986  06c9 b600          	ld	a,_displayDrawSelector$L
3987  06cb a1ff          	cp	a,#255
3988  06cd 2725          	jreq	L3771
3989                     ; 595 		m_arbyDisplayCommand[i++] = DISPLAY_CURSOR_POSITION;
3991  06cf beff          	ld	x,_displayDrawSelector$L-1
3992  06d1 3cff          	inc	_displayDrawSelector$L-1
3993  06d3 a610          	ld	a,#16
3994  06d5 d70000        	ld	(_m_arbyDisplayCommand,x),a
3995                     ; 596 		m_arbyDisplayCommand[i++] = a_byX-1;
3997  06d8 b600          	ld	a,_displayDrawSelector$L
3998  06da 4a            	dec	a
3999  06db beff          	ld	x,_displayDrawSelector$L-1
4000  06dd 3cff          	inc	_displayDrawSelector$L-1
4001  06df d70000        	ld	(_m_arbyDisplayCommand,x),a
4002                     ; 597 		m_arbyDisplayCommand[i++] = a_byY;
4004  06e2 beff          	ld	x,_displayDrawSelector$L-1
4005  06e4 3cff          	inc	_displayDrawSelector$L-1
4006  06e6 b601          	ld	a,_displayDrawSelector$L+1
4007  06e8 d70000        	ld	(_m_arbyDisplayCommand,x),a
4008                     ; 598 		m_arbyDisplayCommand[i++] = DISPLAY_WAIT;
4010  06eb beff          	ld	x,_displayDrawSelector$L-1
4011  06ed 3cff          	inc	_displayDrawSelector$L-1
4012  06ef a6fe          	ld	a,#254
4013  06f1 d70000        	ld	(_m_arbyDisplayCommand,x),a
4014  06f4               L3771:
4015                     ; 601 	m_arbyDisplayCommand[i++] = DISPLAY_GRAPHIC_WRITE;
4017  06f4 beff          	ld	x,_displayDrawSelector$L-1
4018  06f6 3cff          	inc	_displayDrawSelector$L-1
4019  06f8 a618          	ld	a,#24
4020  06fa d70000        	ld	(_m_arbyDisplayCommand,x),a
4021                     ; 604 	if (a_byReversed)
4023  06fd 3d03          	tnz	_displayDrawSelector$L+3
4024  06ff 2752          	jreq	L5771
4025                     ; 606 		if (a_byFilled)
4027  0701 3d02          	tnz	_displayDrawSelector$L+2
4028  0703 2727          	jreq	L7771
4029                     ; 608 			m_arbyDisplayCommand[i++] = 3; //Length
4031  0705 beff          	ld	x,_displayDrawSelector$L-1
4032  0707 3cff          	inc	_displayDrawSelector$L-1
4033  0709 a603          	ld	a,#3
4034  070b d70000        	ld	(_m_arbyDisplayCommand,x),a
4035                     ; 609 			m_arbyDisplayCommand[i++] = 0xFE;
4037  070e beff          	ld	x,_displayDrawSelector$L-1
4038  0710 3cff          	inc	_displayDrawSelector$L-1
4039  0712 a6fe          	ld	a,#254
4040  0714 d70000        	ld	(_m_arbyDisplayCommand,x),a
4041                     ; 610 			m_arbyDisplayCommand[i++] = 0xFF;
4043  0717 beff          	ld	x,_displayDrawSelector$L-1
4044  0719 3cff          	inc	_displayDrawSelector$L-1
4045  071b a6ff          	ld	a,#255
4046  071d d70000        	ld	(_m_arbyDisplayCommand,x),a
4047                     ; 611 			m_arbyDisplayCommand[i++] = 0xFE;
4049  0720 beff          	ld	x,_displayDrawSelector$L-1
4050  0722 3cff          	inc	_displayDrawSelector$L-1
4051  0724 a6fe          	ld	a,#254
4052  0726 d70000        	ld	(_m_arbyDisplayCommand,x),a
4054  0729 cc07f7        	jp	L3002
4055  072c               L7771:
4056                     ; 616 			m_arbyDisplayCommand[i++] = 3; //Length
4058  072c beff          	ld	x,_displayDrawSelector$L-1
4059  072e 3cff          	inc	_displayDrawSelector$L-1
4060  0730 a603          	ld	a,#3
4061  0732 d70000        	ld	(_m_arbyDisplayCommand,x),a
4062                     ; 617 			m_arbyDisplayCommand[i++] = 0xFE;
4064  0735 beff          	ld	x,_displayDrawSelector$L-1
4065  0737 3cff          	inc	_displayDrawSelector$L-1
4066  0739 a6fe          	ld	a,#254
4067  073b d70000        	ld	(_m_arbyDisplayCommand,x),a
4068                     ; 618 			m_arbyDisplayCommand[i++] = 0x81;
4070  073e beff          	ld	x,_displayDrawSelector$L-1
4071  0740 3cff          	inc	_displayDrawSelector$L-1
4072  0742 a681          	ld	a,#129
4073  0744 d70000        	ld	(_m_arbyDisplayCommand,x),a
4074                     ; 619 			m_arbyDisplayCommand[i++] = 0xFE;
4076  0747 beff          	ld	x,_displayDrawSelector$L-1
4077  0749 3cff          	inc	_displayDrawSelector$L-1
4078  074b a6fe          	ld	a,#254
4079  074d d70000        	ld	(_m_arbyDisplayCommand,x),a
4080  0750 cc07f7        	jp	L3002
4081  0753               L5771:
4082                     ; 624 		if (a_byFilled)
4084  0753 3d02          	tnz	_displayDrawSelector$L+2
4085  0755 2751          	jreq	L5002
4086                     ; 626 			m_arbyDisplayCommand[i++] = 8; //Length
4088  0757 beff          	ld	x,_displayDrawSelector$L-1
4089  0759 3cff          	inc	_displayDrawSelector$L-1
4090  075b a608          	ld	a,#8
4091  075d d70000        	ld	(_m_arbyDisplayCommand,x),a
4092                     ; 627 			m_arbyDisplayCommand[i++] = 0x00;
4094  0760 beff          	ld	x,_displayDrawSelector$L-1
4095  0762 3cff          	inc	_displayDrawSelector$L-1
4096  0764 4f            	clr	a
4097  0765 d70000        	ld	(_m_arbyDisplayCommand,x),a
4098                     ; 628 			m_arbyDisplayCommand[i++] = 0x10;
4100  0768 beff          	ld	x,_displayDrawSelector$L-1
4101  076a 3cff          	inc	_displayDrawSelector$L-1
4102  076c a610          	ld	a,#16
4103  076e d70000        	ld	(_m_arbyDisplayCommand,x),a
4104                     ; 629 			m_arbyDisplayCommand[i++] = 0x38;
4106  0771 beff          	ld	x,_displayDrawSelector$L-1
4107  0773 3cff          	inc	_displayDrawSelector$L-1
4108  0775 a638          	ld	a,#56
4109  0777 d70000        	ld	(_m_arbyDisplayCommand,x),a
4110                     ; 630 			m_arbyDisplayCommand[i++] = 0x38;
4112  077a beff          	ld	x,_displayDrawSelector$L-1
4113  077c 3cff          	inc	_displayDrawSelector$L-1
4114  077e a638          	ld	a,#56
4115  0780 d70000        	ld	(_m_arbyDisplayCommand,x),a
4116                     ; 631 			m_arbyDisplayCommand[i++] = 0x38;
4118  0783 beff          	ld	x,_displayDrawSelector$L-1
4119  0785 3cff          	inc	_displayDrawSelector$L-1
4120  0787 a638          	ld	a,#56
4121  0789 d70000        	ld	(_m_arbyDisplayCommand,x),a
4122                     ; 632 			m_arbyDisplayCommand[i++] = 0x38;
4124  078c beff          	ld	x,_displayDrawSelector$L-1
4125  078e 3cff          	inc	_displayDrawSelector$L-1
4126  0790 a638          	ld	a,#56
4127  0792 d70000        	ld	(_m_arbyDisplayCommand,x),a
4128                     ; 633 			m_arbyDisplayCommand[i++] = 0x38;
4130  0795 beff          	ld	x,_displayDrawSelector$L-1
4131  0797 3cff          	inc	_displayDrawSelector$L-1
4132  0799 a638          	ld	a,#56
4133  079b d70000        	ld	(_m_arbyDisplayCommand,x),a
4134                     ; 634 			m_arbyDisplayCommand[i++] = 0x00;
4136  079e beff          	ld	x,_displayDrawSelector$L-1
4137  07a0 3cff          	inc	_displayDrawSelector$L-1
4138  07a2 4f            	clr	a
4139  07a3 d70000        	ld	(_m_arbyDisplayCommand,x),a
4141  07a6 204f          	jra	L3002
4142  07a8               L5002:
4143                     ; 638 			m_arbyDisplayCommand[i++] = 8; //Length
4145  07a8 beff          	ld	x,_displayDrawSelector$L-1
4146  07aa 3cff          	inc	_displayDrawSelector$L-1
4147  07ac a608          	ld	a,#8
4148  07ae d70000        	ld	(_m_arbyDisplayCommand,x),a
4149                     ; 639 			m_arbyDisplayCommand[i++] = 0x00;
4151  07b1 beff          	ld	x,_displayDrawSelector$L-1
4152  07b3 3cff          	inc	_displayDrawSelector$L-1
4153  07b5 4f            	clr	a
4154  07b6 d70000        	ld	(_m_arbyDisplayCommand,x),a
4155                     ; 640 			m_arbyDisplayCommand[i++] = 0x10;
4157  07b9 beff          	ld	x,_displayDrawSelector$L-1
4158  07bb 3cff          	inc	_displayDrawSelector$L-1
4159  07bd a610          	ld	a,#16
4160  07bf d70000        	ld	(_m_arbyDisplayCommand,x),a
4161                     ; 641 			m_arbyDisplayCommand[i++] = 0x28;
4163  07c2 beff          	ld	x,_displayDrawSelector$L-1
4164  07c4 3cff          	inc	_displayDrawSelector$L-1
4165  07c6 a628          	ld	a,#40
4166  07c8 d70000        	ld	(_m_arbyDisplayCommand,x),a
4167                     ; 642 			m_arbyDisplayCommand[i++] = 0x28;
4169  07cb beff          	ld	x,_displayDrawSelector$L-1
4170  07cd 3cff          	inc	_displayDrawSelector$L-1
4171  07cf a628          	ld	a,#40
4172  07d1 d70000        	ld	(_m_arbyDisplayCommand,x),a
4173                     ; 643 			m_arbyDisplayCommand[i++] = 0x28;
4175  07d4 beff          	ld	x,_displayDrawSelector$L-1
4176  07d6 3cff          	inc	_displayDrawSelector$L-1
4177  07d8 a628          	ld	a,#40
4178  07da d70000        	ld	(_m_arbyDisplayCommand,x),a
4179                     ; 644 			m_arbyDisplayCommand[i++] = 0x28;
4181  07dd beff          	ld	x,_displayDrawSelector$L-1
4182  07df 3cff          	inc	_displayDrawSelector$L-1
4183  07e1 a628          	ld	a,#40
4184  07e3 d70000        	ld	(_m_arbyDisplayCommand,x),a
4185                     ; 645 			m_arbyDisplayCommand[i++] = 0x38;
4187  07e6 beff          	ld	x,_displayDrawSelector$L-1
4188  07e8 3cff          	inc	_displayDrawSelector$L-1
4189  07ea a638          	ld	a,#56
4190  07ec d70000        	ld	(_m_arbyDisplayCommand,x),a
4191                     ; 646 			m_arbyDisplayCommand[i++] = 0x00;
4193  07ef beff          	ld	x,_displayDrawSelector$L-1
4194  07f1 3cff          	inc	_displayDrawSelector$L-1
4195  07f3 4f            	clr	a
4196  07f4 d70000        	ld	(_m_arbyDisplayCommand,x),a
4197  07f7               L3002:
4198                     ; 650 	m_arbyDisplayCommand[i++] = DISPLAY_WAIT;
4200  07f7 beff          	ld	x,_displayDrawSelector$L-1
4201  07f9 3cff          	inc	_displayDrawSelector$L-1
4202  07fb a6fe          	ld	a,#254
4203  07fd d70000        	ld	(_m_arbyDisplayCommand,x),a
4204                     ; 651 	m_arbyDisplayCommand[i++] = DISPLAY_EOF;		
4206  0800 beff          	ld	x,_displayDrawSelector$L-1
4207  0802 3cff          	inc	_displayDrawSelector$L-1
4208  0804 a6ff          	ld	a,#255
4209  0806 d70000        	ld	(_m_arbyDisplayCommand,x),a
4210                     ; 653 	displayCmdToDisplay(m_arbyDisplayCommand);
4212  0809 a600          	ld	a,#low(_m_arbyDisplayCommand)
4213  080b ae00          	ld	x,#high(_m_arbyDisplayCommand)
4214  080d cd02aa        	call	_displayCmdToDisplay
4216                     ; 654 }
4219  0810 81            	ret
4272                     ; 657 void displayDrawAlarm(BYTE a_byX, BYTE a_byY)
4272                     ; 658 {
4273                     	switch	.text
4275                     	xref.b	_displayDrawAlarm$L
4276  0811               _displayDrawAlarm:
4278  0811 b701          	ld	_displayDrawAlarm$L+1,a
4279  0813 bf00          	ld	_displayDrawAlarm$L,x
4281                     ; 659 	BYTE i = 0x00;
4283  0815 3fff          	clr	_displayDrawAlarm$L-1
4284                     ; 661 	if (a_byX != DISPLAY_NULL)
4286  0817 b600          	ld	a,_displayDrawAlarm$L
4287  0819 a1ff          	cp	a,#255
4288  081b 2728          	jreq	L7302
4289                     ; 663 		m_arbyDisplayCommand[i++] = DISPLAY_CURSOR_POSITION;
4291  081d beff          	ld	x,_displayDrawAlarm$L-1
4292  081f 3cff          	inc	_displayDrawAlarm$L-1
4293  0821 a610          	ld	a,#16
4294  0823 d70000        	ld	(_m_arbyDisplayCommand,x),a
4295                     ; 664 		m_arbyDisplayCommand[i++] = a_byX + 2;
4297  0826 b600          	ld	a,_displayDrawAlarm$L
4298  0828 ab02          	add	a,#2
4299  082a beff          	ld	x,_displayDrawAlarm$L-1
4300  082c 3cff          	inc	_displayDrawAlarm$L-1
4301  082e d70000        	ld	(_m_arbyDisplayCommand,x),a
4302                     ; 665 		m_arbyDisplayCommand[i++] = a_byY +7 ;
4304  0831 b601          	ld	a,_displayDrawAlarm$L+1
4305  0833 ab07          	add	a,#7
4306  0835 beff          	ld	x,_displayDrawAlarm$L-1
4307  0837 3cff          	inc	_displayDrawAlarm$L-1
4308  0839 d70000        	ld	(_m_arbyDisplayCommand,x),a
4309                     ; 666 		m_arbyDisplayCommand[i++] = DISPLAY_WAIT;
4311  083c beff          	ld	x,_displayDrawAlarm$L-1
4312  083e 3cff          	inc	_displayDrawAlarm$L-1
4313  0840 a6fe          	ld	a,#254
4314  0842 d70000        	ld	(_m_arbyDisplayCommand,x),a
4315  0845               L7302:
4316                     ; 669 	m_arbyDisplayCommand[i++] = DISPLAY_GRAPHIC_WRITE;
4318  0845 beff          	ld	x,_displayDrawAlarm$L-1
4319  0847 3cff          	inc	_displayDrawAlarm$L-1
4320  0849 a618          	ld	a,#24
4321  084b d70000        	ld	(_m_arbyDisplayCommand,x),a
4322                     ; 670 	m_arbyDisplayCommand[i++] = 7; //Length
4324  084e beff          	ld	x,_displayDrawAlarm$L-1
4325  0850 3cff          	inc	_displayDrawAlarm$L-1
4326  0852 a607          	ld	a,#7
4327  0854 d70000        	ld	(_m_arbyDisplayCommand,x),a
4328                     ; 673 	m_arbyDisplayCommand[i++] = 0x04;
4330  0857 beff          	ld	x,_displayDrawAlarm$L-1
4331  0859 3cff          	inc	_displayDrawAlarm$L-1
4332  085b a604          	ld	a,#4
4333  085d d70000        	ld	(_m_arbyDisplayCommand,x),a
4334                     ; 674 	m_arbyDisplayCommand[i++] = 0x3A;
4336  0860 beff          	ld	x,_displayDrawAlarm$L-1
4337  0862 3cff          	inc	_displayDrawAlarm$L-1
4338  0864 a63a          	ld	a,#58
4339  0866 d70000        	ld	(_m_arbyDisplayCommand,x),a
4340                     ; 675 	m_arbyDisplayCommand[i++] = 0x42;
4342  0869 beff          	ld	x,_displayDrawAlarm$L-1
4343  086b 3cff          	inc	_displayDrawAlarm$L-1
4344  086d a642          	ld	a,#66
4345  086f d70000        	ld	(_m_arbyDisplayCommand,x),a
4346                     ; 676 	m_arbyDisplayCommand[i++] = 0xC2;
4348  0872 beff          	ld	x,_displayDrawAlarm$L-1
4349  0874 3cff          	inc	_displayDrawAlarm$L-1
4350  0876 a6c2          	ld	a,#194
4351  0878 d70000        	ld	(_m_arbyDisplayCommand,x),a
4352                     ; 677 	m_arbyDisplayCommand[i++] = 0x43;
4354  087b beff          	ld	x,_displayDrawAlarm$L-1
4355  087d 3cff          	inc	_displayDrawAlarm$L-1
4356  087f a643          	ld	a,#67
4357  0881 d70000        	ld	(_m_arbyDisplayCommand,x),a
4358                     ; 678 	m_arbyDisplayCommand[i++] = 0x3A;
4360  0884 beff          	ld	x,_displayDrawAlarm$L-1
4361  0886 3cff          	inc	_displayDrawAlarm$L-1
4362  0888 a63a          	ld	a,#58
4363  088a d70000        	ld	(_m_arbyDisplayCommand,x),a
4364                     ; 679 	m_arbyDisplayCommand[i++] = 0x04;
4366  088d beff          	ld	x,_displayDrawAlarm$L-1
4367  088f 3cff          	inc	_displayDrawAlarm$L-1
4368  0891 a604          	ld	a,#4
4369  0893 d70000        	ld	(_m_arbyDisplayCommand,x),a
4370                     ; 681 	m_arbyDisplayCommand[i++] = DISPLAY_WAIT;
4372  0896 beff          	ld	x,_displayDrawAlarm$L-1
4373  0898 3cff          	inc	_displayDrawAlarm$L-1
4374  089a a6fe          	ld	a,#254
4375  089c d70000        	ld	(_m_arbyDisplayCommand,x),a
4376                     ; 682 	m_arbyDisplayCommand[i++] = DISPLAY_EOF;		
4378  089f beff          	ld	x,_displayDrawAlarm$L-1
4379  08a1 3cff          	inc	_displayDrawAlarm$L-1
4380  08a3 a6ff          	ld	a,#255
4381  08a5 d70000        	ld	(_m_arbyDisplayCommand,x),a
4382                     ; 684 	displayCmdToDisplay(m_arbyDisplayCommand);			
4384  08a8 a600          	ld	a,#low(_m_arbyDisplayCommand)
4385  08aa ae00          	ld	x,#high(_m_arbyDisplayCommand)
4386  08ac cd02aa        	call	_displayCmdToDisplay
4388                     ; 685 }
4391  08af 81            	ret
4437                     ; 688 void displayDrawValveStatus(BYTE a_byX, BYTE a_byY)
4437                     ; 689 {
4438                     	switch	.text
4440                     	xref.b	_displayDrawValveStatus$L
4441  08b0               _displayDrawValveStatus:
4443  08b0 b701          	ld	_displayDrawValveStatus$L+1,a
4444  08b2 bf00          	ld	_displayDrawValveStatus$L,x
4446                     ; 690 	displayClearArea(a_byX + 2, a_byY +8, a_byX +40, a_byY +13);
4448  08b4 ab0d          	add	a,#13
4449  08b6 b703          	ld	_displayClearArea$L+3,a
4450  08b8 b600          	ld	a,_displayDrawValveStatus$L
4451  08ba ab28          	add	a,#40
4452  08bc b702          	ld	_displayClearArea$L+2,a
4453  08be b600          	ld	a,_displayDrawValveStatus$L
4454  08c0 ab02          	add	a,#2
4455  08c2 97            	ld	x,a
4456  08c3 b601          	ld	a,_displayDrawValveStatus$L+1
4457  08c5 ab08          	add	a,#8
4458  08c7 cd04fd        	call	_displayClearArea
4460                     ; 692 	switch(parametersGetValue(PARAM_VALVES))
4462  08ca a611          	ld	a,#17
4463  08cc cd0000        	call	_parametersGetValue
4466                     ; 720 		default: //VALVES_OPENED
4466                     ; 721 			//displayWriteString("Open", DISPLAY_SELECT_FONT_MINI, a_byX + 2, a_byY+13);
4466                     ; 722 			//displayClearArea(a_byX + 2, a_byY +8, a_byX +40, a_byY +13);
4466                     ; 723 			break;
4467  08cf 5d            	tnz	x
4468  08d0 2703          	jreq	L441
4469  08d2 cc0993        	jp	L1012
4470  08d5               L441:
4471  08d5 a003          	sub	a,#3
4472  08d7 2603          	jrne	L641
4473  08d9 cc0963        	jp	L7402
4474  08dc               L641:
4475  08dc a003          	sub	a,#3
4476  08de 276a          	jreq	L5402
4477  08e0 a006          	sub	a,#6
4478  08e2 2603          	jrne	L051
4479  08e4 cc097c        	jp	L1502
4480  08e7               L051:
4481  08e7 a074          	sub	a,#116
4482  08e9 2707          	jreq	L1402
4483  08eb a07f          	sub	a,#127
4484  08ed 2742          	jreq	L3402
4485  08ef cc0993        	jp	L1012
4486  08f2               L1402:
4487                     ; 694 		case VALVES_CLOSED:		
4487                     ; 695 			if (parametersGetValue(PARAM_MODE)!=PARAM_MODE_OFF)
4489  08f2 a610          	ld	a,#16
4490  08f4 cd0000        	call	_parametersGetValue
4492  08f7 a102          	cp	a,#2
4493  08f9 2602          	jrne	L041
4494  08fb a300          	cp	x,#0
4495  08fd               L041:
4496  08fd 2719          	jreq	L3012
4497                     ; 697 				displayWriteString("Measure", DISPLAY_SELECT_FONT_MINI, a_byX + 2, a_byY+13);
4499  08ff b601          	ld	a,_displayDrawValveStatus$L+1
4500  0901 ab0d          	add	a,#13
4501  0903 b704          	ld	_displayWriteString$L+4,a
4502  0905 b600          	ld	a,_displayDrawValveStatus$L
4503  0907 ab02          	add	a,#2
4504  0909 b703          	ld	_displayWriteString$L+3,a
4505  090b a61c          	ld	a,#28
4506  090d b702          	ld	_displayWriteString$L+2,a
4507  090f a675          	ld	a,#low(L5012)
4508  0911 ae75          	ld	x,#high(L5012)
4509  0913 cd03bc        	call	_displayWriteString
4512  0916 207b          	jra	L1012
4513  0918               L3012:
4514                     ; 701 				displayWriteString("Closed", DISPLAY_SELECT_FONT_MINI, a_byX + 2, a_byY+13);
4516  0918 b601          	ld	a,_displayDrawValveStatus$L+1
4517  091a ab0d          	add	a,#13
4518  091c b704          	ld	_displayWriteString$L+4,a
4519  091e b600          	ld	a,_displayDrawValveStatus$L
4520  0920 ab02          	add	a,#2
4521  0922 b703          	ld	_displayWriteString$L+3,a
4522  0924 a61c          	ld	a,#28
4523  0926 b702          	ld	_displayWriteString$L+2,a
4524  0928 a66e          	ld	a,#low(L1112)
4525  092a ae6e          	ld	x,#high(L1112)
4526  092c cd03bc        	call	_displayWriteString
4528  092f 2062          	jra	L1012
4529  0931               L3402:
4530                     ; 704 		case VALVES_MEASURING:
4530                     ; 705 			displayWriteString("Measure", DISPLAY_SELECT_FONT_MINI, a_byX + 2, a_byY+13);
4532  0931 b601          	ld	a,_displayDrawValveStatus$L+1
4533  0933 ab0d          	add	a,#13
4534  0935 b704          	ld	_displayWriteString$L+4,a
4535  0937 b600          	ld	a,_displayDrawValveStatus$L
4536  0939 ab02          	add	a,#2
4537  093b b703          	ld	_displayWriteString$L+3,a
4538  093d a61c          	ld	a,#28
4539  093f b702          	ld	_displayWriteString$L+2,a
4540  0941 a675          	ld	a,#low(L5012)
4541  0943 ae75          	ld	x,#high(L5012)
4542  0945 cd03bc        	call	_displayWriteString
4544                     ; 706 			break;
4546  0948 2049          	jra	L1012
4547  094a               L5402:
4548                     ; 708 		case VALVES_ADDSOLVENT:
4548                     ; 709 			displayWriteString("Solv", DISPLAY_SELECT_FONT_MINI, a_byX + 2, a_byY+13);
4550  094a b601          	ld	a,_displayDrawValveStatus$L+1
4551  094c ab0d          	add	a,#13
4552  094e b704          	ld	_displayWriteString$L+4,a
4553  0950 b600          	ld	a,_displayDrawValveStatus$L
4554  0952 ab02          	add	a,#2
4555  0954 b703          	ld	_displayWriteString$L+3,a
4556  0956 a61c          	ld	a,#28
4557  0958 b702          	ld	_displayWriteString$L+2,a
4558  095a a669          	ld	a,#low(L3112)
4559  095c ae69          	ld	x,#high(L3112)
4560  095e cd03bc        	call	_displayWriteString
4562                     ; 710 			break;
4564  0961 2030          	jra	L1012
4565  0963               L7402:
4566                     ; 712 		case VALVES_ADDPH:
4566                     ; 713 			displayWriteString("pH", DISPLAY_SELECT_FONT_MINI, a_byX + 2, a_byY+13);
4568  0963 b601          	ld	a,_displayDrawValveStatus$L+1
4569  0965 ab0d          	add	a,#13
4570  0967 b704          	ld	_displayWriteString$L+4,a
4571  0969 b600          	ld	a,_displayDrawValveStatus$L
4572  096b ab02          	add	a,#2
4573  096d b703          	ld	_displayWriteString$L+3,a
4574  096f a61c          	ld	a,#28
4575  0971 b702          	ld	_displayWriteString$L+2,a
4576  0973 a666          	ld	a,#low(L5112)
4577  0975 ae66          	ld	x,#high(L5112)
4578  0977 cd03bc        	call	_displayWriteString
4580                     ; 714 			break;
4582  097a 2017          	jra	L1012
4583  097c               L1502:
4584                     ; 716 		case VALVES_WASH:
4584                     ; 717 			displayWriteString("Wash", DISPLAY_SELECT_FONT_MINI, a_byX + 2, a_byY+13);
4586  097c b601          	ld	a,_displayDrawValveStatus$L+1
4587  097e ab0d          	add	a,#13
4588  0980 b704          	ld	_displayWriteString$L+4,a
4589  0982 b600          	ld	a,_displayDrawValveStatus$L
4590  0984 ab02          	add	a,#2
4591  0986 b703          	ld	_displayWriteString$L+3,a
4592  0988 a61c          	ld	a,#28
4593  098a b702          	ld	_displayWriteString$L+2,a
4594  098c a661          	ld	a,#low(L7112)
4595  098e ae61          	ld	x,#high(L7112)
4596  0990 cd03bc        	call	_displayWriteString
4598                     ; 718 			break;
4600  0993               L3502:
4601                     ; 720 		default: //VALVES_OPENED
4601                     ; 721 			//displayWriteString("Open", DISPLAY_SELECT_FONT_MINI, a_byX + 2, a_byY+13);
4601                     ; 722 			//displayClearArea(a_byX + 2, a_byY +8, a_byX +40, a_byY +13);
4601                     ; 723 			break;
4603  0993               L1012:
4604                     ; 725 }
4607  0993 81            	ret
4747                     ; 728 void displayDrawBox(BYTE a_byLeft, BYTE a_byTop, BYTE a_byWidth, BYTE a_byHeigth, BYTE * a_strLabel, BYTE * a_strLabel2, WORD a_woValue, BYTE a_byLength, BYTE a_byDecimal, BYTE a_byRefresh)
4747                     ; 729 {
4748                     	switch	.text
4750                     	xref.b	_displayDrawBox$L
4751  0994               _displayDrawBox:
4753  0994 b701          	ld	_displayDrawBox$L+1,a
4754  0996 bf00          	ld	_displayDrawBox$L,x
4756                     ; 733 	byRight = a_byLeft + a_byWidth;
4758  0998 9f            	ld	a,x
4759  0999 bb02          	add	a,_displayDrawBox$L+2
4760  099b b7ff          	ld	_displayDrawBox$L-1,a
4761                     ; 735 	if (!a_byRefresh)
4763  099d 3d0c          	tnz	_displayDrawBox$L+12
4764  099f 2703          	jreq	L061
4765  09a1 cc0a37        	jp	L3122
4766  09a4               L061:
4767                     ; 737 		displayClearArea(a_byLeft, a_byTop, byRight + 1, a_byTop + a_byHeigth + 1);
4769  09a4 b601          	ld	a,_displayDrawBox$L+1
4770  09a6 bb03          	add	a,_displayDrawBox$L+3
4771  09a8 4c            	inc	a
4772  09a9 b703          	ld	_displayClearArea$L+3,a
4773  09ab b6ff          	ld	a,_displayDrawBox$L-1
4774  09ad 4c            	inc	a
4775  09ae b702          	ld	_displayClearArea$L+2,a
4776  09b0 b601          	ld	a,_displayDrawBox$L+1
4777  09b2 be00          	ld	x,_displayDrawBox$L
4778  09b4 cd04fd        	call	_displayClearArea
4780                     ; 738 		displaySetOutLine(a_byLeft, a_byTop, byRight, a_byTop + a_byHeigth, false);
4782  09b7 3f04          	clr	_displaySetOutLine$L+4
4783  09b9 b601          	ld	a,_displayDrawBox$L+1
4784  09bb bb03          	add	a,_displayDrawBox$L+3
4785  09bd b703          	ld	_displaySetOutLine$L+3,a
4786  09bf b6ff          	ld	a,_displayDrawBox$L-1
4787  09c1 b702          	ld	_displaySetOutLine$L+2,a
4788  09c3 b601          	ld	a,_displayDrawBox$L+1
4789  09c5 be00          	ld	x,_displayDrawBox$L
4790  09c7 cd049a        	call	_displaySetOutLine
4792                     ; 740 		if (a_strLabel != NULL)
4794  09ca b605          	ld	a,_displayDrawBox$L+5
4795  09cc ba04          	or	a,_displayDrawBox$L+4
4796  09ce 2748          	jreq	L5122
4797                     ; 742 			displayWriteString(a_strLabel, DISPLAY_SELECT_FONT_MINI, a_byLeft + 2, a_byTop + 6);
4799  09d0 b601          	ld	a,_displayDrawBox$L+1
4800  09d2 ab06          	add	a,#6
4801  09d4 b704          	ld	_displayWriteString$L+4,a
4802  09d6 b600          	ld	a,_displayDrawBox$L
4803  09d8 ab02          	add	a,#2
4804  09da b703          	ld	_displayWriteString$L+3,a
4805  09dc a61c          	ld	a,#28
4806  09de b702          	ld	_displayWriteString$L+2,a
4807  09e0 b605          	ld	a,_displayDrawBox$L+5
4808  09e2 be04          	ld	x,_displayDrawBox$L+4
4809  09e4 cd03bc        	call	_displayWriteString
4811                     ; 744 			if (byRight == 126) //workaround
4813  09e7 b6ff          	ld	a,_displayDrawBox$L-1
4814  09e9 a17e          	cp	a,#126
4815  09eb 2617          	jrne	L7122
4816                     ; 746 				displayInvertArea(a_byLeft + 1, a_byTop + 1, byRight - 2, a_byTop + 6);
4818  09ed b601          	ld	a,_displayDrawBox$L+1
4819  09ef ab06          	add	a,#6
4820  09f1 b703          	ld	_displayInvertArea$L+3,a
4821  09f3 b6ff          	ld	a,_displayDrawBox$L-1
4822  09f5 a002          	sub	a,#2
4823  09f7 b702          	ld	_displayInvertArea$L+2,a
4824  09f9 b601          	ld	a,_displayDrawBox$L+1
4825  09fb 4c            	inc	a
4826  09fc be00          	ld	x,_displayDrawBox$L
4827  09fe 5c            	inc	x
4828  09ff cd054a        	call	_displayInvertArea
4831  0a02 2014          	jra	L5122
4832  0a04               L7122:
4833                     ; 750 				displayInvertArea(a_byLeft + 1, a_byTop + 1, byRight - 1, a_byTop + 6);
4835  0a04 b601          	ld	a,_displayDrawBox$L+1
4836  0a06 ab06          	add	a,#6
4837  0a08 b703          	ld	_displayInvertArea$L+3,a
4838  0a0a b6ff          	ld	a,_displayDrawBox$L-1
4839  0a0c 4a            	dec	a
4840  0a0d b702          	ld	_displayInvertArea$L+2,a
4841  0a0f b601          	ld	a,_displayDrawBox$L+1
4842  0a11 4c            	inc	a
4843  0a12 be00          	ld	x,_displayDrawBox$L
4844  0a14 5c            	inc	x
4845  0a15 cd054a        	call	_displayInvertArea
4847  0a18               L5122:
4848                     ; 754 		if(a_strLabel2 != NULL)
4850  0a18 b607          	ld	a,_displayDrawBox$L+7
4851  0a1a ba06          	or	a,_displayDrawBox$L+6
4852  0a1c 2719          	jreq	L3122
4853                     ; 756 			displayWriteString(a_strLabel2, DISPLAY_SELECT_FONT_MINI, a_byLeft + 2, a_byTop + a_byHeigth - 2);
4855  0a1e b601          	ld	a,_displayDrawBox$L+1
4856  0a20 bb03          	add	a,_displayDrawBox$L+3
4857  0a22 a002          	sub	a,#2
4858  0a24 b704          	ld	_displayWriteString$L+4,a
4859  0a26 b600          	ld	a,_displayDrawBox$L
4860  0a28 ab02          	add	a,#2
4861  0a2a b703          	ld	_displayWriteString$L+3,a
4862  0a2c a61c          	ld	a,#28
4863  0a2e b702          	ld	_displayWriteString$L+2,a
4864  0a30 b607          	ld	a,_displayDrawBox$L+7
4865  0a32 be06          	ld	x,_displayDrawBox$L+6
4866  0a34 cd03bc        	call	_displayWriteString
4868  0a37               L3122:
4869                     ; 760 	if ((a_byRefresh) && (a_woValue == 0xFFFF))
4871  0a37 3d0c          	tnz	_displayDrawBox$L+12
4872  0a39 273b          	jreq	L5222
4874  0a3b b609          	ld	a,_displayDrawBox$L+9
4875  0a3d a1ff          	cp	a,#255
4876  0a3f 2604          	jrne	L451
4877  0a41 be08          	ld	x,_displayDrawBox$L+8
4878  0a43 a3ff          	cp	x,#255
4879  0a45               L451:
4880  0a45 262f          	jrne	L5222
4881                     ; 762 		displayClearArea(a_byLeft+1, a_byTop+7, byRight - 1, a_byTop + a_byHeigth - 1);
4883  0a47 b601          	ld	a,_displayDrawBox$L+1
4884  0a49 bb03          	add	a,_displayDrawBox$L+3
4885  0a4b 4a            	dec	a
4886  0a4c b703          	ld	_displayClearArea$L+3,a
4887  0a4e b6ff          	ld	a,_displayDrawBox$L-1
4888  0a50 4a            	dec	a
4889  0a51 b702          	ld	_displayClearArea$L+2,a
4890  0a53 b601          	ld	a,_displayDrawBox$L+1
4891  0a55 ab07          	add	a,#7
4892  0a57 be00          	ld	x,_displayDrawBox$L
4893  0a59 5c            	inc	x
4894  0a5a cd04fd        	call	_displayClearArea
4896                     ; 763 		displayWriteString(a_strLabel2, DISPLAY_SELECT_FONT_MINI, a_byLeft + 2, a_byTop + a_byHeigth - 2);
4898  0a5d b601          	ld	a,_displayDrawBox$L+1
4899  0a5f bb03          	add	a,_displayDrawBox$L+3
4900  0a61 a002          	sub	a,#2
4901  0a63 b704          	ld	_displayWriteString$L+4,a
4902  0a65 b600          	ld	a,_displayDrawBox$L
4903  0a67 ab02          	add	a,#2
4904  0a69 b703          	ld	_displayWriteString$L+3,a
4905  0a6b a61c          	ld	a,#28
4906  0a6d b702          	ld	_displayWriteString$L+2,a
4907  0a6f b607          	ld	a,_displayDrawBox$L+7
4908  0a71 be06          	ld	x,_displayDrawBox$L+6
4909  0a73 cd03bc        	call	_displayWriteString
4911  0a76               L5222:
4912                     ; 766 	if (a_woValue != 0xFFFF)
4914  0a76 b609          	ld	a,_displayDrawBox$L+9
4915  0a78 a1ff          	cp	a,#255
4916  0a7a 2604          	jrne	L651
4917  0a7c be08          	ld	x,_displayDrawBox$L+8
4918  0a7e a3ff          	cp	x,#255
4919  0a80               L651:
4920  0a80 2738          	jreq	L7222
4921                     ; 768 		formatNumber(a_woValue, a_byLength, a_byDecimal, strString);
4923  0a82 aeef          	ld	x,#high(_displayDrawBox$L-17)
4924  0a84 bf04          	ld	_formatNumber$L+4,x
4925  0a86 a6ef          	ld	a,#low(_displayDrawBox$L-17)
4926  0a88 b705          	ld	_formatNumber$L+5,a
4927  0a8a b60b          	ld	a,_displayDrawBox$L+11
4928  0a8c b703          	ld	_formatNumber$L+3,a
4929  0a8e b60a          	ld	a,_displayDrawBox$L+10
4930  0a90 b702          	ld	_formatNumber$L+2,a
4931  0a92 b609          	ld	a,_displayDrawBox$L+9
4932  0a94 be08          	ld	x,_displayDrawBox$L+8
4933  0a96 cd0000        	call	_formatNumber
4935                     ; 769 		strString[a_byLength] = 0x00;
4937  0a99 be0a          	ld	x,_displayDrawBox$L+10
4938  0a9b 4f            	clr	a
4939  0a9c e7ef          	ld	(_displayDrawBox$L-17,x),a
4940                     ; 771 		displayWriteString(strString, DISPLAY_SELECT_FONT_5x7, byRight - (a_byLength * 6) - 1, a_byTop + a_byHeigth - 1);
4942  0a9e b601          	ld	a,_displayDrawBox$L+1
4943  0aa0 bb03          	add	a,_displayDrawBox$L+3
4944  0aa2 4a            	dec	a
4945  0aa3 b704          	ld	_displayWriteString$L+4,a
4946  0aa5 b60a          	ld	a,_displayDrawBox$L+10
4947  0aa7 ae06          	ld	x,#6
4948  0aa9 42            	mul	x,a
4949  0aaa b0ff          	sub	a,_displayDrawBox$L-1
4950  0aac 40            	neg	a
4951  0aad 4a            	dec	a
4952  0aae b703          	ld	_displayWriteString$L+3,a
4953  0ab0 a61d          	ld	a,#29
4954  0ab2 b702          	ld	_displayWriteString$L+2,a
4955  0ab4 a6ef          	ld	a,#_displayDrawBox$L-17
4956  0ab6 5f            	clr	x
4957  0ab7 cd03bc        	call	_displayWriteString
4959  0aba               L7222:
4960                     ; 774 }
4963  0aba 81            	ret
5028                     	xdef	_displayKeyboardIRQ
5029                     	xdef	_displayTraslateKeyPressed
5030                     	xdef	_displayClearCommandBuffer
5031                     	switch	.bss
5032  0000               _m_arbyDisplayCommand:
5033  0000 000000000000  	ds.b	128
5034                     	xdef	_m_arbyDisplayCommand
5035  0080               L7001_m_enmKeyPressed:
5036  0080 0000          	ds.b	2
5037                     	xdef	_displayDrawBox
5038                     	xdef	_displayDrawAlarm
5039                     	xdef	_displayDrawLed
5040                     	xdef	_displayDrawValveStatus
5041                     	xdef	_displayDrawSelector
5042                     	xdef	_displayDrawHorizontalLine
5043                     	xdef	_displayDrawVerticalLine
5044                     	xdef	_displayInvertArea
5045                     	xdef	_displaySetOutLine
5046                     	xdef	_displayClearArea
5047                     	xdef	_displaySetArea
5048                     	xdef	_displayWriteString
5049                     	xdef	_displayOff
5050                     	xdef	_displayCmdToDisplay
5051                     	xdef	_displayIsKeyPressed
5052                     	xdef	_displayKeyPressedReset
5053                     	xdef	_displayGetKeyPressed
5054                     	xdef	_displayReset
5055                     	xdef	_displayInit
5056                     	xref	_formatNumber
5057                     	xref	_memcpy
5058                     	xref	_sleepFix
5059                     	xref	_sleep
5060                     	xref	_parametersGetSerialNumber
5061                     	xref	_parametersSet
5062                     	xref	_parametersGetValue
5063                     	xref	_SPI_MoveByte
5064                     	switch	.const
5065  0061               L7112:
5066  0061 5761736800    	dc.b	"Wash",0
5067  0066               L5112:
5068  0066 704800        	dc.b	"pH",0
5069  0069               L3112:
5070  0069 536f6c7600    	dc.b	"Solv",0
5071  006e               L1112:
5072  006e 436c6f736564  	dc.b	"Closed",0
5073  0075               L5012:
5074  0075 4d6561737572  	dc.b	"Measure",0
5075                     	xref.b	c_x
5095                     	xref	c_rtol
5096                     	xref	c_uitol
5097                     	xref.b	_displaySetOutLine$L
5098                     	xref.b	_displayWriteString$L
5099                     	xref.b	_displayClearArea$L
5100                     	xref.b	_displaySetArea$L
5101                     	xref.b	_displayInvertArea$L
5102                     	xref.b	_parametersSet$L
5103                     	xref.b	_formatNumber$L
5104                     	xref.b	_memcpy$L
5105                     	xref.b	_sleep$L
5106                     	end
