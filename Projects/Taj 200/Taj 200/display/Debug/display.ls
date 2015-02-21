   1                     ; C Compiler for ST7 (COSMIC Software)
   2                     ; Generator V4.5.5 - 12 Jan 2006
1280                     .const:	section	.text
1281  0000               L327_mc_byApplicationVersion:
1282  0000 9d            	dc.b	157
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
1328  000e 44            	dc.b	68
1329  000f 9f            	dc.b	159
1330  0010 fe            	dc.b	254
1331  0011 1b            	dc.b	27
1332  0012 4f            	dc.b	79
1333  0013 9f            	dc.b	159
1334  0014 1b            	dc.b	27
1335  0015 42            	dc.b	66
1336  0016 fe            	dc.b	254
1337  0017 1a            	dc.b	26
1338  0018 80            	dc.b	128
1339  0019 fe            	dc.b	254
1340  001a ff            	dc.b	255
1341  001b               L347_mc_strRecClear:
1342  001b 12            	dc.b	18
1343  001c 00            	dc.b	0
1344  001d 00            	dc.b	0
1345  001e 7e            	dc.b	126
1346  001f 40            	dc.b	64
1347  0020 fe            	dc.b	254
1348  0021 ff            	dc.b	255
1349  0022               L547_mc_strLogo:
1350  0022 1e            	dc.b	30
1351  0023 fe            	dc.b	254
1352  0024 10            	dc.b	16
1353  0025 09            	dc.b	9
1354  0026 2b            	dc.b	43
1355  0027 fe            	dc.b	254
1356  0028 54            	dc.b	84
1357  0029 61            	dc.b	97
1358  002a 6a            	dc.b	106
1359  002b fe            	dc.b	254
1360  002c 10            	dc.b	16
1361  002d 08            	dc.b	8
1362  002e 3b            	dc.b	59
1363  002f fe            	dc.b	254
1364  0030 32            	dc.b	50
1365  0031 30            	dc.b	48
1366  0032 30            	dc.b	48
1367  0033 fe            	dc.b	254
1368  0034 10            	dc.b	16
1369  0035 05            	dc.b	5
1370  0036 12            	dc.b	18
1371  0037 fe            	dc.b	254
1372  0038 7a            	dc.b	122
1373  0039 65            	dc.b	101
1374  003a 6c            	dc.b	108
1375  003b 6f            	dc.b	111
1376  003c fe            	dc.b	254
1377  003d 1d            	dc.b	29
1378  003e fe            	dc.b	254
1379  003f 10            	dc.b	16
1380  0040 36            	dc.b	54
1381  0041 12            	dc.b	18
1382  0042 fe            	dc.b	254
1383  0043 65            	dc.b	101
1384  0044 6c            	dc.b	108
1385  0045 65            	dc.b	101
1386  0046 74            	dc.b	116
1387  0047 74            	dc.b	116
1388  0048 72            	dc.b	114
1389  0049 6f            	dc.b	111
1390  004a 6e            	dc.b	110
1391  004b 69            	dc.b	105
1392  004c 63            	dc.b	99
1393  004d 61            	dc.b	97
1394  004e fe            	dc.b	254
1395  004f 13            	dc.b	19
1396  0050 01            	dc.b	1
1397  0051 01            	dc.b	1
1398  0052 7e            	dc.b	126
1399  0053 15            	dc.b	21
1400  0054 fe            	dc.b	254
1401  0055 ff            	dc.b	255
1402  0056               L747_mc_strVersion:
1403  0056 1c            	dc.b	28
1404  0057 fe            	dc.b	254
1405  0058 10            	dc.b	16
1406  0059 42            	dc.b	66
1407  005a 3e            	dc.b	62
1408  005b fe            	dc.b	254
1409  005c 76            	dc.b	118
1410  005d 20            	dc.b	32
1411  005e 58            	dc.b	88
1412  005f 2e            	dc.b	46
1413  0060 58            	dc.b	88
1414  0061 58            	dc.b	88
1415  0062 2d            	dc.b	45
1416  0063 79            	dc.b	121
1417  0064 79            	dc.b	121
1418  0065 79            	dc.b	121
1419  0066 fe            	dc.b	254
1420  0067 ff            	dc.b	255
1482                     	switch	.data
1483  0000               L1001_m_enmKeyIRQReceived:
1484  0000 ff            	dc.b	255
1485  0001               L3001_m_enmTraslatedKeyPressed:
1486  0001 ff            	dc.b	255
1517                     ; 24 void displayKeyPressedReset(void)
1517                     ; 25 {
1518                     	switch	.text
1519  0000               _displayKeyPressedReset:
1522                     ; 26 	m_enmTraslatedKeyPressed = KEY_NULL;
1524  0000 a6ff          	ld	a,#255
1525  0002 c70001        	ld	L3001_m_enmTraslatedKeyPressed,a
1526                     ; 27 }
1529  0005 81            	ret
1583                     ; 31 BYTE displayGetKeyPressed(void)
1583                     ; 32 {
1584                     	switch	.text
1586                     	xref.b	_displayGetKeyPressed$L
1587  0006               _displayGetKeyPressed:
1590                     ; 37 	if (m_enmKeyIRQReceived)
1592  0006 c60000        	ld	a,L1001_m_enmKeyIRQReceived
1593  0009 4d            	tnz	a
1594  000a 2603          	jrne	L01
1595  000c cc00d6        	jp	L7401
1596  000f               L01:
1597                     ; 41 				sleep(parametersGetValue(PARAM_KEYBOARD_DELAY)*5);
1599  000f a639          	ld	a,#57
1600  0011 cd0000        	call	_parametersGetValue
1602  0014 3f00          	clr	c_y
1603  0016 90ae05        	ld	y,#5
1604  0019 cd0000        	call	c_imul
1606  001c cd0000        	call	c_uitol
1608  001f ae00          	ld	x,#_sleep$L
1609  0021 cd0000        	call	c_rtol
1611  0024 cd0000        	call	_sleep
1613                     ; 47 		_bres(_Pa_Select_UA, _Pin_Select_UA);
1615  0027 1115          	bres	_PHDR,#0
1616                     ; 48 		_bres(_Pa_Select_UB, _Pin_Select_UB);
1618  0029 1315          	bres	_PHDR,#1
1619                     ; 49 		_bres(_Pa_Select_UC, _Pin_Select_UC);
1621  002b 1515          	bres	_PHDR,#2
1622                     ; 50 		_bset(_Pa_Select_U2, _Pin_Select_U2);
1624  002d 1815          	bset	_PHDR,#4
1625                     ; 53 		SPI_MoveByte(DISPLAY_FUNCTION_SET_2);
1627  002f a61b          	ld	a,#27
1628  0031 cd0000        	call	_SPI_MoveByte
1630                     ; 54 		SPI_MoveByte(DISPLAY_READ_PORT);
1632  0034 a652          	ld	a,#82
1633  0036 cd0000        	call	_SPI_MoveByte
1636  0039 2001          	jra	L3501
1637  003b               L1501:
1638                     ; 58 			Nop();
1641  003b 9d            nop
1643  003c               L3501:
1644                     ; 56 		while(!_btst(_Pa_DisplayBusy, _Pin_DisplayBusy) )
1646  003c b600          	ld	a,_PADR
1647  003e a510          	bcp	a,#16
1648  0040 27f9          	jreq	L1501
1649                     ; 62 		byKey1 = SPI_MoveByte(DISPLAY_HOME);
1651  0042 a60b          	ld	a,#11
1652  0044 cd0000        	call	_SPI_MoveByte
1654  0047 b7ff          	ld	_displayGetKeyPressed$L-1,a
1655                     ; 65 			if ((byKey1&0b01111111) == (m_enmKeyPressed[0]&0b01111111))
1657  0049 c60080        	ld	a,L5001_m_enmKeyPressed
1658  004c a47f          	and	a,#127
1659  004e b7fd          	ld	_displayGetKeyPressed$L-3,a
1660  0050 b6ff          	ld	a,_displayGetKeyPressed$L-1
1661  0052 a47f          	and	a,#127
1662  0054 b1fd          	cp	a,_displayGetKeyPressed$L-3
1663  0056 2625          	jrne	L7501
1664                     ; 67 				if _btst(byKey1, 7)
1666  0058 b6ff          	ld	a,_displayGetKeyPressed$L-1
1667  005a a580          	bcp	a,#128
1668  005c 2707          	jreq	L1601
1669                     ; 69 					m_enmKeyPressed[0] = byKey1;
1671  005e b6ff          	ld	a,_displayGetKeyPressed$L-1
1672  0060 c70080        	ld	L5001_m_enmKeyPressed,a
1674  0063 2008          	jra	L3601
1675  0065               L1601:
1676                     ; 92 					m_enmKeyPressed[0] = m_enmKeyPressed[0]&0b01111111;
1678  0065 c60080        	ld	a,L5001_m_enmKeyPressed
1679  0068 a47f          	and	a,#127
1680  006a c70080        	ld	L5001_m_enmKeyPressed,a
1681  006d               L3601:
1682                     ; 94 				m_enmKeyIRQReceived = false;
1684  006d 4f            	clr	a
1685  006e c70000        	ld	L1001_m_enmKeyIRQReceived,a
1687  0071               L5601:
1688                     ; 158 		_bres(_Pa_Select_UA, _Pin_Select_UA);
1690  0071 1115          	bres	_PHDR,#0
1691                     ; 159 		_bres(_Pa_Select_UB, _Pin_Select_UB);
1693  0073 1315          	bres	_PHDR,#1
1694                     ; 160 		_bres(_Pa_Select_UC, _Pin_Select_UC);
1696  0075 1515          	bres	_PHDR,#2
1697                     ; 161 		_bres(_Pa_Select_U2, _Pin_Select_U2);	
1699  0077 1915          	bres	_PHDR,#4
1700                     ; 163 		displayTraslateKeyPressed();
1702  0079 ad63          	call	_displayTraslateKeyPressed
1704  007b 2059          	jra	L7401
1705  007d               L7501:
1706                     ; 99 				sleep(parametersGetValue(PARAM_KEYBOARD_DELAY));
1708  007d a639          	ld	a,#57
1709  007f cd0000        	call	_parametersGetValue
1711  0082 cd0000        	call	c_uitol
1713  0085 ae00          	ld	x,#_sleep$L
1714  0087 cd0000        	call	c_rtol
1716  008a cd0000        	call	_sleep
1718                     ; 100 				SPI_MoveByte(DISPLAY_FUNCTION_SET_2);
1720  008d a61b          	ld	a,#27
1721  008f cd0000        	call	_SPI_MoveByte
1723                     ; 101 				SPI_MoveByte(DISPLAY_READ_PORT);
1725  0092 a652          	ld	a,#82
1726  0094 cd0000        	call	_SPI_MoveByte
1729  0097 2001          	jra	L1701
1730  0099               L7601:
1731                     ; 105 					Nop();
1734  0099 9d            nop
1736  009a               L1701:
1737                     ; 103 				while(!_btst(_Pa_DisplayBusy, _Pin_DisplayBusy) )
1739  009a b600          	ld	a,_PADR
1740  009c a510          	bcp	a,#16
1741  009e 27f9          	jreq	L7601
1742                     ; 109 				byKey2 = SPI_MoveByte(DISPLAY_HOME);
1744  00a0 a60b          	ld	a,#11
1745  00a2 cd0000        	call	_SPI_MoveByte
1747  00a5 b7fe          	ld	_displayGetKeyPressed$L-2,a
1748                     ; 111 				if ((byKey1&0b01111111) == (byKey2&0b01111111))
1750  00a7 b6fe          	ld	a,_displayGetKeyPressed$L-2
1751  00a9 a47f          	and	a,#127
1752  00ab b7fd          	ld	_displayGetKeyPressed$L-3,a
1753  00ad b6ff          	ld	a,_displayGetKeyPressed$L-1
1754  00af a47f          	and	a,#127
1755  00b1 b1fd          	cp	a,_displayGetKeyPressed$L-3
1756  00b3 26bc          	jrne	L5601
1757                     ; 113 					m_enmKeyPressed[1] = m_enmKeyPressed[0];
1759  00b5 c60080        	ld	a,L5001_m_enmKeyPressed
1760  00b8 c70081        	ld	L5001_m_enmKeyPressed+1,a
1761                     ; 114 					if _btst(byKey1, 7)
1763  00bb b6ff          	ld	a,_displayGetKeyPressed$L-1
1764  00bd a580          	bcp	a,#128
1765  00bf 2707          	jreq	L7701
1766                     ; 116 						m_enmKeyPressed[0] = byKey1;
1768  00c1 b6ff          	ld	a,_displayGetKeyPressed$L-1
1769  00c3 c70080        	ld	L5001_m_enmKeyPressed,a
1771  00c6 2008          	jra	L1011
1772  00c8               L7701:
1773                     ; 120 						m_enmKeyPressed[0] = m_enmKeyPressed[1]&0b01111111;
1775  00c8 c60081        	ld	a,L5001_m_enmKeyPressed+1
1776  00cb a47f          	and	a,#127
1777  00cd c70080        	ld	L5001_m_enmKeyPressed,a
1778  00d0               L1011:
1779                     ; 122 					m_enmKeyIRQReceived = false;
1781  00d0 4f            	clr	a
1782  00d1 c70000        	ld	L1001_m_enmKeyIRQReceived,a
1783  00d4 209b          	jra	L5601
1784  00d6               L7401:
1785                     ; 166 	return m_enmTraslatedKeyPressed;
1787  00d6 c60001        	ld	a,L3001_m_enmTraslatedKeyPressed
1790  00d9 81            	ret
1814                     ; 171 BYTE displayIsKeyPressed(void)
1814                     ; 172 {
1815                     	switch	.text
1816  00da               _displayIsKeyPressed:
1819                     ; 173 	return m_enmKeyIRQReceived;/* && 
1821  00da c60000        	ld	a,L1001_m_enmKeyIRQReceived
1824  00dd 81            	ret
1849                     	switch	.const
1850  0068               L02:
1851  0068 016c          	dc.w	L1511
1852  006a 0144          	dc.w	L7311
1853  006c 014c          	dc.w	L1411
1854  006e 00f5          	dc.w	L3111
1855  0070 0164          	dc.w	L7411
1856  0072 0174          	dc.w	L3511
1857  0074 0104          	dc.w	L7111
1858  0076 00fc          	dc.w	L5111
1859  0078 019e          	dc.w	L7611
1860  007a 017b          	dc.w	L5511
1861  007c 01dd          	dc.w	L1121
1862  007e 01cf          	dc.w	L5021
1863  0080 0190          	dc.w	L3611
1864  0082 01ac          	dc.w	L3711
1865  0084 0124          	dc.w	L7211
1866  0086 01c8          	dc.w	L3021
1867  0088 01a5          	dc.w	L1711
1868  008a 01ba          	dc.w	L7711
1869  008c 013c          	dc.w	L5311
1870  008e 01d6          	dc.w	L7021
1871  0090 0197          	dc.w	L5611
1872  0092 01c1          	dc.w	L1021
1873  0094 010c          	dc.w	L1211
1874  0096 0182          	dc.w	L7511
1875  0098 0189          	dc.w	L1611
1876  009a 01b3          	dc.w	L5711
1877  009c 0134          	dc.w	L3311
1878  009e 012c          	dc.w	L1311
1879  00a0 015c          	dc.w	L5411
1880  00a2 0154          	dc.w	L3411
1881  00a4 011c          	dc.w	L5211
1882  00a6 0114          	dc.w	L3211
1883                     ; 185 void displayTraslateKeyPressed(void)
1883                     ; 186 {
1884                     	switch	.text
1885  00de               _displayTraslateKeyPressed:
1888                     ; 187 	switch(m_enmKeyPressed[0])
1890  00de c60080        	ld	a,L5001_m_enmKeyPressed
1892                     ; 294 			break;
1893  00e1 a080          	sub	a,#128
1894  00e3 a120          	cp	a,#32
1895  00e5 240b          	jruge	L61
1896  00e7 48            	sll	a
1897  00e8 97            	ld	x,a
1898  00e9 d60069        	ld	a,(L02+1,x)
1899  00ec 88            	push	a
1900  00ed d60068        	ld	a,(L02,x)
1901  00f0 88            	push	a
1902  00f1 81            	ret
1903  00f2               L61:
1904  00f2 cc01e4        	jp	L3121
1905  00f5               L3111:
1906                     ; 189 		case 131:
1906                     ; 190 			m_enmTraslatedKeyPressed = KEY_NUM_0;
1908  00f5 4f            	clr	a
1909  00f6 c70001        	ld	L3001_m_enmTraslatedKeyPressed,a
1910                     ; 191 			break;
1912  00f9 cc01f7        	jp	L7221
1913  00fc               L5111:
1914                     ; 192 		case 135:
1914                     ; 193 			m_enmTraslatedKeyPressed = KEY_NUM_1;
1916  00fc a601          	ld	a,#1
1917  00fe c70001        	ld	L3001_m_enmTraslatedKeyPressed,a
1918                     ; 194 			break;
1920  0101 cc01f7        	jp	L7221
1921  0104               L7111:
1922                     ; 195 		case 134:
1922                     ; 196 			m_enmTraslatedKeyPressed = KEY_NUM_2;
1924  0104 a602          	ld	a,#2
1925  0106 c70001        	ld	L3001_m_enmTraslatedKeyPressed,a
1926                     ; 197 			break;
1928  0109 cc01f7        	jp	L7221
1929  010c               L1211:
1930                     ; 198 		case 150:
1930                     ; 199 			m_enmTraslatedKeyPressed = KEY_NUM_3;
1932  010c a603          	ld	a,#3
1933  010e c70001        	ld	L3001_m_enmTraslatedKeyPressed,a
1934                     ; 200 			break;
1936  0111 cc01f7        	jp	L7221
1937  0114               L3211:
1938                     ; 201 		case 159:
1938                     ; 202 			m_enmTraslatedKeyPressed = KEY_NUM_4;
1940  0114 a604          	ld	a,#4
1941  0116 c70001        	ld	L3001_m_enmTraslatedKeyPressed,a
1942                     ; 203 			break;
1944  0119 cc01f7        	jp	L7221
1945  011c               L5211:
1946                     ; 204 		case 158:
1946                     ; 205 			m_enmTraslatedKeyPressed = KEY_NUM_5;
1948  011c a605          	ld	a,#5
1949  011e c70001        	ld	L3001_m_enmTraslatedKeyPressed,a
1950                     ; 206 			break;
1952  0121 cc01f7        	jp	L7221
1953  0124               L7211:
1954                     ; 207 		case 142:
1954                     ; 208 			m_enmTraslatedKeyPressed = KEY_NUM_6;
1956  0124 a606          	ld	a,#6
1957  0126 c70001        	ld	L3001_m_enmTraslatedKeyPressed,a
1958                     ; 209 			break;
1960  0129 cc01f7        	jp	L7221
1961  012c               L1311:
1962                     ; 210 		case 155:
1962                     ; 211 			m_enmTraslatedKeyPressed = KEY_NUM_7;
1964  012c a607          	ld	a,#7
1965  012e c70001        	ld	L3001_m_enmTraslatedKeyPressed,a
1966                     ; 212 			break;
1968  0131 cc01f7        	jp	L7221
1969  0134               L3311:
1970                     ; 213 		case 154:
1970                     ; 214 			m_enmTraslatedKeyPressed = KEY_NUM_8;
1972  0134 a608          	ld	a,#8
1973  0136 c70001        	ld	L3001_m_enmTraslatedKeyPressed,a
1974                     ; 215 			break;
1976  0139 cc01f7        	jp	L7221
1977  013c               L5311:
1978                     ; 216 		case 146:
1978                     ; 217 			m_enmTraslatedKeyPressed = KEY_NUM_9;
1980  013c a609          	ld	a,#9
1981  013e c70001        	ld	L3001_m_enmTraslatedKeyPressed,a
1982                     ; 218 			break;
1984  0141 cc01f7        	jp	L7221
1985  0144               L7311:
1986                     ; 219 		case 129:
1986                     ; 220 			m_enmTraslatedKeyPressed = KEY_OK;
1988  0144 a60a          	ld	a,#10
1989  0146 c70001        	ld	L3001_m_enmTraslatedKeyPressed,a
1990                     ; 221 			break;
1992  0149 cc01f7        	jp	L7221
1993  014c               L1411:
1994                     ; 222 		case 130:
1994                     ; 223 			m_enmTraslatedKeyPressed = KEY_CANCEL;
1996  014c a60b          	ld	a,#11
1997  014e c70001        	ld	L3001_m_enmTraslatedKeyPressed,a
1998                     ; 224 			break;
2000  0151 cc01f7        	jp	L7221
2001  0154               L3411:
2002                     ; 225 		case 157:
2002                     ; 226 			m_enmTraslatedKeyPressed = KEY_FUNCTION;
2004  0154 a60c          	ld	a,#12
2005  0156 c70001        	ld	L3001_m_enmTraslatedKeyPressed,a
2006                     ; 227 			break;
2008  0159 cc01f7        	jp	L7221
2009  015c               L5411:
2010                     ; 228 		case 156:
2010                     ; 229 			m_enmTraslatedKeyPressed = KEY_PARAM;
2012  015c a60d          	ld	a,#13
2013  015e c70001        	ld	L3001_m_enmTraslatedKeyPressed,a
2014                     ; 230 			break;
2016  0161 cc01f7        	jp	L7221
2017  0164               L7411:
2018                     ; 231 		case 132:
2018                     ; 232 			m_enmTraslatedKeyPressed = KEY_SETUP;
2020  0164 a60e          	ld	a,#14
2021  0166 c70001        	ld	L3001_m_enmTraslatedKeyPressed,a
2022                     ; 233 			break;
2024  0169 cc01f7        	jp	L7221
2025  016c               L1511:
2026                     ; 234 		case 128:
2026                     ; 235 			m_enmTraslatedKeyPressed = KEY_MENU;
2028  016c a60f          	ld	a,#15
2029  016e c70001        	ld	L3001_m_enmTraslatedKeyPressed,a
2030                     ; 236 			break;
2032  0171 cc01f7        	jp	L7221
2033  0174               L3511:
2034                     ; 237 		case 133:
2034                     ; 238 			m_enmTraslatedKeyPressed = KEY_TEST;
2036  0174 a610          	ld	a,#16
2037  0176 c70001        	ld	L3001_m_enmTraslatedKeyPressed,a
2038                     ; 239 			break;
2040  0179 207c          	jra	L7221
2041  017b               L5511:
2042                     ; 240 		case 137:
2042                     ; 241 			m_enmTraslatedKeyPressed = KEY_OFF;
2044  017b a611          	ld	a,#17
2045  017d c70001        	ld	L3001_m_enmTraslatedKeyPressed,a
2046                     ; 242 			break;
2048  0180 2075          	jra	L7221
2049  0182               L7511:
2050                     ; 243 		case 151:
2050                     ; 244 			m_enmTraslatedKeyPressed = KEY_MODE_LONG;
2052  0182 a612          	ld	a,#18
2053  0184 c70001        	ld	L3001_m_enmTraslatedKeyPressed,a
2054                     ; 245 			break;
2056  0187 206e          	jra	L7221
2057  0189               L1611:
2058                     ; 246 		case 152:
2058                     ; 247 			m_enmTraslatedKeyPressed = KEY_MODE_LAT;
2060  0189 a613          	ld	a,#19
2061  018b c70001        	ld	L3001_m_enmTraslatedKeyPressed,a
2062                     ; 248 			break;
2064  018e 2067          	jra	L7221
2065  0190               L3611:
2066                     ; 249 		case 140:
2066                     ; 250 			m_enmTraslatedKeyPressed = KEY_ARROW_UP;
2068  0190 a614          	ld	a,#20
2069  0192 c70001        	ld	L3001_m_enmTraslatedKeyPressed,a
2070                     ; 251 			break;
2072  0195 2060          	jra	L7221
2073  0197               L5611:
2074                     ; 252 		case 148:
2074                     ; 253 			m_enmTraslatedKeyPressed = KEY_ARROW_DOWN;
2076  0197 a615          	ld	a,#21
2077  0199 c70001        	ld	L3001_m_enmTraslatedKeyPressed,a
2078                     ; 254 			break;
2080  019c 2059          	jra	L7221
2081  019e               L7611:
2082                     ; 255 		case 136:
2082                     ; 256 			m_enmTraslatedKeyPressed = KEY_ARROW_LEFT;
2084  019e a616          	ld	a,#22
2085  01a0 c70001        	ld	L3001_m_enmTraslatedKeyPressed,a
2086                     ; 257 			break;
2088  01a3 2052          	jra	L7221
2089  01a5               L1711:
2090                     ; 258 		case 144:
2090                     ; 259 			m_enmTraslatedKeyPressed = KEY_ARROW_RIGHT;
2092  01a5 a617          	ld	a,#23
2093  01a7 c70001        	ld	L3001_m_enmTraslatedKeyPressed,a
2094                     ; 260 			break;
2096  01aa 204b          	jra	L7221
2097  01ac               L3711:
2098                     ; 261 		case 141:
2098                     ; 262 			m_enmTraslatedKeyPressed = KEY_CORRECTION_UP;
2100  01ac a618          	ld	a,#24
2101  01ae c70001        	ld	L3001_m_enmTraslatedKeyPressed,a
2102                     ; 263 			break;
2104  01b1 2044          	jra	L7221
2105  01b3               L5711:
2106                     ; 264 		case 153:
2106                     ; 265 			m_enmTraslatedKeyPressed = KEY_CORRECTION_DOWN;
2108  01b3 a619          	ld	a,#25
2109  01b5 c70001        	ld	L3001_m_enmTraslatedKeyPressed,a
2110                     ; 266 			break;
2112  01b8 203d          	jra	L7221
2113  01ba               L7711:
2114                     ; 267 		case 145:
2114                     ; 268 			m_enmTraslatedKeyPressed = KEY_CORRECTION_LEFT;
2116  01ba a61a          	ld	a,#26
2117  01bc c70001        	ld	L3001_m_enmTraslatedKeyPressed,a
2118                     ; 269 			break;
2120  01bf 2036          	jra	L7221
2121  01c1               L1021:
2122                     ; 270 		case 149:
2122                     ; 271 			m_enmTraslatedKeyPressed = KEY_CORRECTION_RIGHT;
2124  01c1 a61b          	ld	a,#27
2125  01c3 c70001        	ld	L3001_m_enmTraslatedKeyPressed,a
2126                     ; 272 			break;
2128  01c6 202f          	jra	L7221
2129  01c8               L3021:
2130                     ; 273 		case 143:
2130                     ; 274 			m_enmTraslatedKeyPressed = KEY_GATE_LEFT;
2132  01c8 a61c          	ld	a,#28
2133  01ca c70001        	ld	L3001_m_enmTraslatedKeyPressed,a
2134                     ; 275 			break;
2136  01cd 2028          	jra	L7221
2137  01cf               L5021:
2138                     ; 276 		case 139:
2138                     ; 277 			m_enmTraslatedKeyPressed = KEY_GATE_RIGHT;
2140  01cf a61d          	ld	a,#29
2141  01d1 c70001        	ld	L3001_m_enmTraslatedKeyPressed,a
2142                     ; 278 			break;
2144  01d4 2021          	jra	L7221
2145  01d6               L7021:
2146                     ; 279 		case 147:
2146                     ; 280 			m_enmTraslatedKeyPressed = KEY_ZOOM_IN;
2148  01d6 a61e          	ld	a,#30
2149  01d8 c70001        	ld	L3001_m_enmTraslatedKeyPressed,a
2150                     ; 281 			break;
2152  01db 201a          	jra	L7221
2153  01dd               L1121:
2154                     ; 282 		case 138:
2154                     ; 283 			m_enmTraslatedKeyPressed = KEY_ZOOM_OUT;
2156  01dd a61f          	ld	a,#31
2157  01df c70001        	ld	L3001_m_enmTraslatedKeyPressed,a
2158                     ; 284 			break;
2160  01e2 2013          	jra	L7221
2161  01e4               L3121:
2162                     ; 285 		default:
2162                     ; 286 			if (!_btst(m_enmKeyPressed[0],7))
2164  01e4 c60080        	ld	a,L5001_m_enmKeyPressed
2165  01e7 a580          	bcp	a,#128
2166  01e9 2607          	jrne	L1321
2167                     ; 288 				m_enmTraslatedKeyPressed = KEY_RELEASED;
2169  01eb a620          	ld	a,#32
2170  01ed c70001        	ld	L3001_m_enmTraslatedKeyPressed,a
2172  01f0 2005          	jra	L7221
2173  01f2               L1321:
2174                     ; 292 				m_enmTraslatedKeyPressed = KEY_NULL;
2176  01f2 a6ff          	ld	a,#255
2177  01f4 c70001        	ld	L3001_m_enmTraslatedKeyPressed,a
2178  01f7               L7221:
2179                     ; 296 }
2182  01f7 81            	ret
2205                     ; 300 void displayKeyboardIRQ(void)
2205                     ; 301 {
2206                     	switch	.text
2207  01f8               _displayKeyboardIRQ:
2211                     ; 302 	DisableInterrupts();
2214  01f8 9b            sim
2216                     ; 303 	m_enmKeyIRQReceived = true;
2218  01f9 a601          	ld	a,#1
2219  01fb c70000        	ld	L1001_m_enmKeyIRQReceived,a
2220                     ; 304 	EnableInterrupts();
2223  01fe 9a            rim
2225                     ; 305 }
2228  01ff 80            	iret
2275                     ; 308 void displayInit(void)
2275                     ; 309 {
2276                     	switch	.text
2278                     	xref.b	_displayInit$L
2279  0200               _displayInit:
2282                     ; 312 	memcpy(strString, mc_strVersion, 30); 
2284  0200 a61e          	ld	a,#30
2285  0202 b704          	ld	_memcpy$L+4,a
2286  0204 ae56          	ld	x,#high(L747_mc_strVersion)
2287  0206 bf02          	ld	_memcpy$L+2,x
2288  0208 a656          	ld	a,#low(L747_mc_strVersion)
2289  020a b703          	ld	_memcpy$L+3,a
2290  020c a6e2          	ld	a,#_displayInit$L-30
2291  020e 5f            	clr	x
2292  020f cd0000        	call	_memcpy
2294                     ; 313 	formatNumber(mc_byApplicationVersion, 4, 2, strString+8);
2296  0212 aeea          	ld	x,#high(_displayInit$L-22)
2297  0214 bf04          	ld	_formatNumber$L+4,x
2298  0216 a6ea          	ld	a,#low(_displayInit$L-22)
2299  0218 b705          	ld	_formatNumber$L+5,a
2300  021a a602          	ld	a,#2
2301  021c b703          	ld	_formatNumber$L+3,a
2302  021e a604          	ld	a,#4
2303  0220 b702          	ld	_formatNumber$L+2,a
2304  0222 5f            	clr	x
2305  0223 a69d          	ld	a,#157
2306  0225 cd0000        	call	_formatNumber
2308                     ; 314 	formatNumber(parametersGetSerialNumber(), 3, 0, strString+13);
2310  0228 aeef          	ld	x,#high(_displayInit$L-17)
2311  022a bf04          	ld	_formatNumber$L+4,x
2312  022c a6ef          	ld	a,#low(_displayInit$L-17)
2313  022e b705          	ld	_formatNumber$L+5,a
2314  0230 3f03          	clr	_formatNumber$L+3
2315  0232 a603          	ld	a,#3
2316  0234 b702          	ld	_formatNumber$L+2,a
2317  0236 cd0000        	call	_parametersGetSerialNumber
2319  0239 cd0000        	call	_formatNumber
2321                     ; 315 	sleep(1000);
2323  023c a6e8          	ld	a,#232
2324  023e b703          	ld	_sleep$L+3,a
2325  0240 a603          	ld	a,#3
2326  0242 b702          	ld	_sleep$L+2,a
2327  0244 a600          	ld	a,#0
2328  0246 b701          	ld	_sleep$L+1,a
2329  0248 a600          	ld	a,#0
2330  024a b700          	ld	_sleep$L,a
2331  024c cd0000        	call	_sleep
2333                     ; 316 	displayCmdToDisplay(mc_strReset);
2335  024f a601          	ld	a,#low(L147_mc_strReset)
2336  0251 ae01          	ld	x,#high(L147_mc_strReset)
2337  0253 cd02ef        	call	_displayCmdToDisplay
2339                     ; 317 	displayCmdToDisplay(mc_strLogo);
2341  0256 a622          	ld	a,#low(L547_mc_strLogo)
2342  0258 ae22          	ld	x,#high(L547_mc_strLogo)
2343  025a cd02ef        	call	_displayCmdToDisplay
2345                     ; 318 	displayCmdToDisplay(strString);
2347  025d a6e2          	ld	a,#_displayInit$L-30
2348  025f 5f            	clr	x
2349  0260 cd02ef        	call	_displayCmdToDisplay
2351                     ; 319 	sleepSec(0x01);
2353  0263 5f            	clr	x
2354  0264 a601          	ld	a,#1
2355  0266 cd0000        	call	_sleepSec
2357                     ; 321 	m_enmTraslatedKeyPressed = KEY_NULL;
2359  0269 a6ff          	ld	a,#255
2360  026b c70001        	ld	L3001_m_enmTraslatedKeyPressed,a
2361                     ; 322 	m_enmKeyPressed[0] 		= KEY_NULL;
2363  026e a6ff          	ld	a,#255
2364  0270 c70080        	ld	L5001_m_enmKeyPressed,a
2365                     ; 323 	m_enmKeyPressed[1] 		= KEY_NULL;
2367  0273 a6ff          	ld	a,#255
2368  0275 c70081        	ld	L5001_m_enmKeyPressed+1,a
2369                     ; 324 	m_enmKeyIRQReceived 	= false;
2371  0278 4f            	clr	a
2372  0279 c70000        	ld	L1001_m_enmKeyIRQReceived,a
2373                     ; 325 }
2376  027c 81            	ret
2403                     ; 329 void displayOff(void)
2403                     ; 330 {
2404                     	switch	.text
2405  027d               _displayOff:
2408                     ; 331 	if (parametersGetValue(PARAM_OFF))
2410  027d a615          	ld	a,#21
2411  027f cd0000        	call	_parametersGetValue
2413  0282 4d            	tnz	a
2414  0283 2601          	jrne	L03
2415  0285 5d            	tnz	x
2416  0286               L03:
2417  0286 2717          	jreq	L3721
2418                     ; 334 		m_arbyDisplayCommand[0] = DISPLAY_FUNCTION_SET_2;
2420  0288 a61b          	ld	a,#27
2421  028a c70000        	ld	_m_arbyDisplayCommand,a
2422                     ; 335 		m_arbyDisplayCommand[1] = DISPLAY_POWER_ON;
2424  028d a650          	ld	a,#80
2425  028f c70001        	ld	_m_arbyDisplayCommand+1,a
2426                     ; 336 		m_arbyDisplayCommand[2] = DISPLAY_EOF;		
2428  0292 a6ff          	ld	a,#255
2429  0294 c70002        	ld	_m_arbyDisplayCommand+2,a
2430                     ; 337 		displayCmdToDisplay(m_arbyDisplayCommand);	
2432  0297 a600          	ld	a,#low(_m_arbyDisplayCommand)
2433  0299 ae00          	ld	x,#high(_m_arbyDisplayCommand)
2434  029b ad52          	call	_displayCmdToDisplay
2437  029d 201b          	jra	L5721
2438  029f               L3721:
2439                     ; 341 		displayCmdToDisplay(mc_strRecClear);
2441  029f a61b          	ld	a,#low(L347_mc_strRecClear)
2442  02a1 ae1b          	ld	x,#high(L347_mc_strRecClear)
2443  02a3 ad4a          	call	_displayCmdToDisplay
2445                     ; 342 		m_arbyDisplayCommand[0] = DISPLAY_FUNCTION_SET_2;
2447  02a5 a61b          	ld	a,#27
2448  02a7 c70000        	ld	_m_arbyDisplayCommand,a
2449                     ; 343 		m_arbyDisplayCommand[1] = DISPLAY_POWER_OFF;
2451  02aa a646          	ld	a,#70
2452  02ac c70001        	ld	_m_arbyDisplayCommand+1,a
2453                     ; 344 		m_arbyDisplayCommand[2] = DISPLAY_EOF;		
2455  02af a6ff          	ld	a,#255
2456  02b1 c70002        	ld	_m_arbyDisplayCommand+2,a
2457                     ; 345 		displayCmdToDisplay(m_arbyDisplayCommand);	
2459  02b4 a600          	ld	a,#low(_m_arbyDisplayCommand)
2460  02b6 ae00          	ld	x,#high(_m_arbyDisplayCommand)
2461  02b8 ad35          	call	_displayCmdToDisplay
2463  02ba               L5721:
2464                     ; 348 	parametersSet(PARAM_OFF, !parametersGetValue(PARAM_OFF));
2466  02ba a615          	ld	a,#21
2467  02bc cd0000        	call	_parametersGetValue
2469  02bf 4d            	tnz	a
2470  02c0 2601          	jrne	L43
2471  02c2 5d            	tnz	x
2472  02c3               L43:
2473  02c3 2604          	jrne	L23
2474  02c5 a601          	ld	a,#1
2475  02c7 2001          	jra	L63
2476  02c9               L23:
2477  02c9 4f            	clr	a
2478  02ca               L63:
2479  02ca 5f            	clr	x
2480  02cb b702          	ld	_parametersSet$L+2,a
2481  02cd bf01          	ld	_parametersSet$L+1,x
2482  02cf a615          	ld	a,#21
2483  02d1 cd0000        	call	_parametersSet
2485                     ; 349 }
2488  02d4 81            	ret
2513                     ; 352 void displayReset(void)
2513                     ; 353 {
2514                     	switch	.text
2515  02d5               _displayReset:
2518                     ; 354 	displayCmdToDisplay(mc_strReset);
2520  02d5 a601          	ld	a,#low(L147_mc_strReset)
2521  02d7 ae01          	ld	x,#high(L147_mc_strReset)
2522  02d9 ad14          	call	_displayCmdToDisplay
2524                     ; 355 	sleep(1000);
2526  02db a6e8          	ld	a,#232
2527  02dd b703          	ld	_sleep$L+3,a
2528  02df a603          	ld	a,#3
2529  02e1 b702          	ld	_sleep$L+2,a
2530  02e3 a600          	ld	a,#0
2531  02e5 b701          	ld	_sleep$L+1,a
2532  02e7 a600          	ld	a,#0
2533  02e9 b700          	ld	_sleep$L,a
2534  02eb cd0000        	call	_sleep
2536                     ; 356 }
2539  02ee 81            	ret
2597                     ; 360 void displayCmdToDisplay(STRING a_strMessage)
2597                     ; 361 {
2598                     	switch	.text
2600                     	xref.b	_displayCmdToDisplay$L
2601  02ef               _displayCmdToDisplay:
2603  02ef b701          	ld	_displayCmdToDisplay$L+1,a
2604  02f1 bf00          	ld	_displayCmdToDisplay$L,x
2606                     ; 362 	BYTE i = 0x00;
2608  02f3 3fff          	clr	_displayCmdToDisplay$L-1
2609                     ; 363 	BYTE byGraphics = 0x00;
2611  02f5 3ffe          	clr	_displayCmdToDisplay$L-2
2612                     ; 365 	_bres(_Pa_Select_UA, _Pin_Select_UA);
2614  02f7 1115          	bres	_PHDR,#0
2615                     ; 366 	_bres(_Pa_Select_UB, _Pin_Select_UB);
2617  02f9 1315          	bres	_PHDR,#1
2618                     ; 367 	_bres(_Pa_Select_UC, _Pin_Select_UC);
2620  02fb 1515          	bres	_PHDR,#2
2621                     ; 368 	_bset(_Pa_Select_U2, _Pin_Select_U2);
2623  02fd 1815          	bset	_PHDR,#4
2624                     ; 370 	if (a_strMessage[0] < 0x20)
2626  02ff 92c600        	ld	a,[_displayCmdToDisplay$L.w]
2627  0302 a120          	cp	a,#32
2628  0304 2503          	jrult	L64
2629  0306 cc03b7        	jp	L3731
2630  0309               L64:
2632  0309 207a          	jp	L1431
2633  030b               L7331:
2634                     ; 375 			if((a_strMessage[i]==DISPLAY_GRAPHIC_WRITE) && (byGraphics==0) && ((i==0) || (a_strMessage[i-1]==DISPLAY_WAIT)))
2636  030b beff          	ld	x,_displayCmdToDisplay$L-1
2637  030d 92d600        	ld	a,([_displayCmdToDisplay$L.w],x)
2638  0310 a118          	cp	a,#24
2639  0312 263e          	jrne	L5431
2641  0314 3dfe          	tnz	_displayCmdToDisplay$L-2
2642  0316 263a          	jrne	L5431
2644  0318 3dff          	tnz	_displayCmdToDisplay$L-1
2645  031a 271c          	jreq	L7431
2647  031c b6ff          	ld	a,_displayCmdToDisplay$L-1
2648  031e 5f            	clr	x
2649  031f 4d            	tnz	a
2650  0320 2601          	jrne	L44
2651  0322 5a            	dec	x
2652  0323               L44:
2653  0323 4a            	dec	a
2654  0324 bb01          	add	a,_displayCmdToDisplay$L+1
2655  0326 88            	push	a
2656  0327 9f            	ld	a,x
2657  0328 b900          	adc	a,_displayCmdToDisplay$L
2658  032a 97            	ld	x,a
2659  032b 84            	pop	a
2660  032c bf00          	ld	c_x,x
2661  032e 97            	ld	x,a
2662  032f bf01          	ld	c_x+1,x
2663  0331 92c600        	ld	a,[c_x.w]
2664  0334 a1fe          	cp	a,#254
2665  0336 261a          	jrne	L5431
2666  0338               L7431:
2667                     ; 377 				byGraphics = a_strMessage[i+1]+2;
2669  0338 b6ff          	ld	a,_displayCmdToDisplay$L-1
2670  033a 5f            	clr	x
2671  033b bb01          	add	a,_displayCmdToDisplay$L+1
2672  033d 88            	push	a
2673  033e 9f            	ld	a,x
2674  033f b900          	adc	a,_displayCmdToDisplay$L
2675  0341 97            	ld	x,a
2676  0342 84            	pop	a
2677  0343 bf00          	ld	c_x,x
2678  0345 97            	ld	x,a
2679  0346 a601          	ld	a,#1
2680  0348 bf01          	ld	c_x+1,x
2681  034a 97            	ld	x,a
2682  034b 92d600        	ld	a,([c_x.w],x)
2683  034e ab02          	add	a,#2
2684  0350 b7fe          	ld	_displayCmdToDisplay$L-2,a
2685  0352               L5431:
2686                     ; 380 			if((a_strMessage[i]!=DISPLAY_WAIT) || (byGraphics >0))
2688  0352 beff          	ld	x,_displayCmdToDisplay$L-1
2689  0354 92d600        	ld	a,([_displayCmdToDisplay$L.w],x)
2690  0357 a1fe          	cp	a,#254
2691  0359 2604          	jrne	L3531
2693  035b 3dfe          	tnz	_displayCmdToDisplay$L-2
2694  035d 2708          	jreq	L1531
2695  035f               L3531:
2696                     ; 382 				SPI_MoveByte(a_strMessage[i]);
2698  035f beff          	ld	x,_displayCmdToDisplay$L-1
2699  0361 92d600        	ld	a,([_displayCmdToDisplay$L.w],x)
2700  0364 cd0000        	call	_SPI_MoveByte
2702  0367               L1531:
2703                     ; 388 			if (byGraphics>0)
2705  0367 3dfe          	tnz	_displayCmdToDisplay$L-2
2706  0369 2702          	jreq	L5531
2707                     ; 390 				byGraphics--;
2709  036b 3afe          	dec	_displayCmdToDisplay$L-2
2710  036d               L5531:
2711                     ; 393 			i++;
2713  036d 3cff          	inc	_displayCmdToDisplay$L-1
2715  036f 2001          	jra	L1631
2716  0371               L7531:
2717                     ; 397 				Nop();
2720  0371 9d            nop
2722  0372               L1631:
2723                     ; 395 			while(!_btst(_Pa_DisplayBusy, _Pin_DisplayBusy) && ((a_strMessage[i]!=DISPLAY_EOF) || (byGraphics >0)))
2725  0372 b600          	ld	a,_PADR
2726  0374 a510          	bcp	a,#16
2727  0376 260d          	jrne	L1431
2729  0378 beff          	ld	x,_displayCmdToDisplay$L-1
2730  037a 92d600        	ld	a,([_displayCmdToDisplay$L.w],x)
2731  037d a1ff          	cp	a,#255
2732  037f 26f0          	jrne	L7531
2734  0381 3dfe          	tnz	_displayCmdToDisplay$L-2
2735  0383 26ec          	jrne	L7531
2736  0385               L1431:
2737                     ; 373 		while((a_strMessage[i]!=DISPLAY_EOF) || (byGraphics >0))
2739  0385 beff          	ld	x,_displayCmdToDisplay$L-1
2740  0387 92d600        	ld	a,([_displayCmdToDisplay$L.w],x)
2741  038a a1ff          	cp	a,#255
2742  038c 2703          	jreq	L05
2743  038e cc030b        	jp	L7331
2744  0391               L05:
2746  0391 3dfe          	tnz	_displayCmdToDisplay$L-2
2747  0393 2703          	jreq	L25
2748  0395 cc030b        	jp	L7331
2749  0398               L25:
2751  0398 2025          	jra	L7631
2752  039a               L1731:
2753                     ; 407 			SPI_MoveByte(a_strMessage[i]);
2755  039a beff          	ld	x,_displayCmdToDisplay$L-1
2756  039c 92d600        	ld	a,([_displayCmdToDisplay$L.w],x)
2757  039f cd0000        	call	_SPI_MoveByte
2759                     ; 409 				sleep(15); //15 
2761  03a2 a60f          	ld	a,#15
2762  03a4 b703          	ld	_sleep$L+3,a
2763  03a6 a600          	ld	a,#0
2764  03a8 b702          	ld	_sleep$L+2,a
2765  03aa a600          	ld	a,#0
2766  03ac b701          	ld	_sleep$L+1,a
2767  03ae a600          	ld	a,#0
2768  03b0 b700          	ld	_sleep$L,a
2769  03b2 cd0000        	call	_sleep
2771                     ; 415 			i++;
2773  03b5 3cff          	inc	_displayCmdToDisplay$L-1
2774  03b7               L3731:
2775                     ; 405 		while(a_strMessage[i]!=0x00)
2777  03b7 beff          	ld	x,_displayCmdToDisplay$L-1
2778  03b9 92d600        	ld	a,([_displayCmdToDisplay$L.w],x)
2779  03bc 4d            	tnz	a
2780  03bd 26db          	jrne	L1731
2781  03bf               L7631:
2782                     ; 419 	_bres(_Pa_Select_UA, _Pin_Select_UA);
2784  03bf 1115          	bres	_PHDR,#0
2785                     ; 420 	_bres(_Pa_Select_UB, _Pin_Select_UB);
2787  03c1 1315          	bres	_PHDR,#1
2788                     ; 421 	_bres(_Pa_Select_UC, _Pin_Select_UC);
2790  03c3 1515          	bres	_PHDR,#2
2791                     ; 422 	_bres(_Pa_Select_U2, _Pin_Select_U2);	
2793  03c5 1915          	bres	_PHDR,#4
2794                     ; 423 }
2797  03c7 81            	ret
2832                     ; 427 void displayClearCommandBuffer(void)
2832                     ; 428 {
2833                     	switch	.text
2835                     	xref.b	_displayClearCommandBuffer$L
2836  03c8               _displayClearCommandBuffer:
2839                     ; 429 	WORD woIndex = 0x0200;
2841  03c8 a602          	ld	a,#2
2842  03ca b7fe          	ld	_displayClearCommandBuffer$L-2,a
2843  03cc 3fff          	clr	_displayClearCommandBuffer$L-1
2845  03ce 2016          	jra	L1241
2846  03d0               L5141:
2847                     ; 432 		m_arbyDisplayCommand[--woIndex] = 0x00;
2849  03d0 b6ff          	ld	a,_displayClearCommandBuffer$L-1
2850  03d2 befe          	ld	x,_displayClearCommandBuffer$L-2
2851  03d4 4d            	tnz	a
2852  03d5 2601          	jrne	L65
2853  03d7 5a            	dec	x
2854  03d8               L65:
2855  03d8 4a            	dec	a
2856  03d9 b7ff          	ld	_displayClearCommandBuffer$L-1,a
2857  03db bffe          	ld	_displayClearCommandBuffer$L-2,x
2858  03dd b6ff          	ld	a,_displayClearCommandBuffer$L-1
2859  03df befe          	ld	x,_displayClearCommandBuffer$L-2
2860  03e1 97            	ld	x,a
2861  03e2 4f            	clr	a
2862  03e3 d70000        	ld	(_m_arbyDisplayCommand,x),a
2863  03e6               L1241:
2864                     ; 430 	while(woIndex>0)
2866  03e6 b6ff          	ld	a,_displayClearCommandBuffer$L-1
2867  03e8 bafe          	or	a,_displayClearCommandBuffer$L-2
2868  03ea 26e4          	jrne	L5141
2869                     ; 434 }
2872  03ec 81            	ret
2945                     ; 438 void displayWriteString(BYTE * a_strValue, BYTE a_byFontSize, BYTE a_byX, BYTE a_byY)
2945                     ; 439 {
2946                     	switch	.text
2948                     	xref.b	_displayWriteString$L
2949  03ed               _displayWriteString:
2951  03ed b701          	ld	_displayWriteString$L+1,a
2952  03ef bf00          	ld	_displayWriteString$L,x
2954                     ; 440 	BYTE i = 0x00;
2956  03f1 3fff          	clr	_displayWriteString$L-1
2957                     ; 443 	if (a_byX != DISPLAY_NULL)
2959  03f3 b603          	ld	a,_displayWriteString$L+3
2960  03f5 a1ff          	cp	a,#255
2961  03f7 2724          	jreq	L3641
2962                     ; 445 		m_arbyDisplayCommand[i++] = DISPLAY_CURSOR_POSITION;
2964  03f9 beff          	ld	x,_displayWriteString$L-1
2965  03fb 3cff          	inc	_displayWriteString$L-1
2966  03fd a610          	ld	a,#16
2967  03ff d70000        	ld	(_m_arbyDisplayCommand,x),a
2968                     ; 446 		m_arbyDisplayCommand[i++] = a_byX;
2970  0402 beff          	ld	x,_displayWriteString$L-1
2971  0404 3cff          	inc	_displayWriteString$L-1
2972  0406 b603          	ld	a,_displayWriteString$L+3
2973  0408 d70000        	ld	(_m_arbyDisplayCommand,x),a
2974                     ; 447 		m_arbyDisplayCommand[i++] = a_byY;
2976  040b beff          	ld	x,_displayWriteString$L-1
2977  040d 3cff          	inc	_displayWriteString$L-1
2978  040f b604          	ld	a,_displayWriteString$L+4
2979  0411 d70000        	ld	(_m_arbyDisplayCommand,x),a
2980                     ; 448 		m_arbyDisplayCommand[i++] = DISPLAY_WAIT;
2982  0414 beff          	ld	x,_displayWriteString$L-1
2983  0416 3cff          	inc	_displayWriteString$L-1
2984  0418 a6fe          	ld	a,#254
2985  041a d70000        	ld	(_m_arbyDisplayCommand,x),a
2986  041d               L3641:
2987                     ; 452 	if (a_byFontSize != DISPLAY_NULL)
2989  041d b602          	ld	a,_displayWriteString$L+2
2990  041f a1ff          	cp	a,#255
2991  0421 2712          	jreq	L5641
2992                     ; 454 		m_arbyDisplayCommand[i++] = a_byFontSize;
2994  0423 beff          	ld	x,_displayWriteString$L-1
2995  0425 3cff          	inc	_displayWriteString$L-1
2996  0427 b602          	ld	a,_displayWriteString$L+2
2997  0429 d70000        	ld	(_m_arbyDisplayCommand,x),a
2998                     ; 455 		m_arbyDisplayCommand[i++] = DISPLAY_WAIT;
3000  042c beff          	ld	x,_displayWriteString$L-1
3001  042e 3cff          	inc	_displayWriteString$L-1
3002  0430 a6fe          	ld	a,#254
3003  0432 d70000        	ld	(_m_arbyDisplayCommand,x),a
3004  0435               L5641:
3005                     ; 458 	i +=memcpy((m_arbyDisplayCommand+i), a_strValue, DISPLAY_CMD_BUFFER-i);
3007  0435 a680          	ld	a,#128
3008  0437 b0ff          	sub	a,_displayWriteString$L-1
3009  0439 b704          	ld	_memcpy$L+4,a
3010  043b be00          	ld	x,_displayWriteString$L
3011  043d bf02          	ld	_memcpy$L+2,x
3012  043f b601          	ld	a,_displayWriteString$L+1
3013  0441 b703          	ld	_memcpy$L+3,a
3014  0443 a600          	ld	a,#low(_m_arbyDisplayCommand)
3015  0445 ae00          	ld	x,#high(_m_arbyDisplayCommand)
3016  0447 bbff          	add	a,_displayWriteString$L-1
3017  0449 2401          	jrnc	L26
3018  044b 5c            	inc	x
3019  044c               L26:
3020  044c cd0000        	call	_memcpy
3022  044f bbff          	add	a,_displayWriteString$L-1
3023  0451 b7ff          	ld	_displayWriteString$L-1,a
3024                     ; 460 	m_arbyDisplayCommand[i++] = DISPLAY_WAIT;
3026  0453 beff          	ld	x,_displayWriteString$L-1
3027  0455 3cff          	inc	_displayWriteString$L-1
3028  0457 a6fe          	ld	a,#254
3029  0459 d70000        	ld	(_m_arbyDisplayCommand,x),a
3030                     ; 461 	m_arbyDisplayCommand[i++] = DISPLAY_WAIT;
3032  045c beff          	ld	x,_displayWriteString$L-1
3033  045e 3cff          	inc	_displayWriteString$L-1
3034  0460 a6fe          	ld	a,#254
3035  0462 d70000        	ld	(_m_arbyDisplayCommand,x),a
3036                     ; 462 	m_arbyDisplayCommand[i++] = DISPLAY_EOF;		
3038  0465 beff          	ld	x,_displayWriteString$L-1
3039  0467 3cff          	inc	_displayWriteString$L-1
3040  0469 a6ff          	ld	a,#255
3041  046b d70000        	ld	(_m_arbyDisplayCommand,x),a
3042                     ; 463 	m_arbyDisplayCommand[i++] = 0x00;
3044  046e beff          	ld	x,_displayWriteString$L-1
3045  0470 3cff          	inc	_displayWriteString$L-1
3046  0472 4f            	clr	a
3047  0473 d70000        	ld	(_m_arbyDisplayCommand,x),a
3048                     ; 465 	displayCmdToDisplay(m_arbyDisplayCommand);
3050  0476 a600          	ld	a,#low(_m_arbyDisplayCommand)
3051  0478 ae00          	ld	x,#high(_m_arbyDisplayCommand)
3052  047a cd02ef        	call	_displayCmdToDisplay
3054                     ; 466 }
3057  047d 81            	ret
3128                     ; 469 void displaySetArea(BYTE a_byLeft, BYTE a_byTop, BYTE a_byRight, BYTE a_byBottom)
3128                     ; 470 {
3129                     	switch	.text
3131                     	xref.b	_displaySetArea$L
3132  047e               _displaySetArea:
3134  047e b701          	ld	_displaySetArea$L+1,a
3135  0480 bf00          	ld	_displaySetArea$L,x
3137                     ; 471 	BYTE i = 0x00;
3139  0482 3fff          	clr	_displaySetArea$L-1
3140                     ; 472 	m_arbyDisplayCommand[i++] = DISPLAY_SET_AREA;
3142  0484 beff          	ld	x,_displaySetArea$L-1
3143  0486 3cff          	inc	_displaySetArea$L-1
3144  0488 a611          	ld	a,#17
3145  048a d70000        	ld	(_m_arbyDisplayCommand,x),a
3146                     ; 473 	m_arbyDisplayCommand[i++] = a_byLeft;
3148  048d beff          	ld	x,_displaySetArea$L-1
3149  048f 3cff          	inc	_displaySetArea$L-1
3150  0491 b600          	ld	a,_displaySetArea$L
3151  0493 d70000        	ld	(_m_arbyDisplayCommand,x),a
3152                     ; 474 	m_arbyDisplayCommand[i++] = a_byTop;
3154  0496 beff          	ld	x,_displaySetArea$L-1
3155  0498 3cff          	inc	_displaySetArea$L-1
3156  049a b601          	ld	a,_displaySetArea$L+1
3157  049c d70000        	ld	(_m_arbyDisplayCommand,x),a
3158                     ; 475 	m_arbyDisplayCommand[i++] = a_byRight;
3160  049f beff          	ld	x,_displaySetArea$L-1
3161  04a1 3cff          	inc	_displaySetArea$L-1
3162  04a3 b602          	ld	a,_displaySetArea$L+2
3163  04a5 d70000        	ld	(_m_arbyDisplayCommand,x),a
3164                     ; 476 	m_arbyDisplayCommand[i++] = a_byBottom;
3166  04a8 beff          	ld	x,_displaySetArea$L-1
3167  04aa 3cff          	inc	_displaySetArea$L-1
3168  04ac b603          	ld	a,_displaySetArea$L+3
3169  04ae d70000        	ld	(_m_arbyDisplayCommand,x),a
3170                     ; 477 	m_arbyDisplayCommand[i++] = DISPLAY_WAIT;
3172  04b1 beff          	ld	x,_displaySetArea$L-1
3173  04b3 3cff          	inc	_displaySetArea$L-1
3174  04b5 a6fe          	ld	a,#254
3175  04b7 d70000        	ld	(_m_arbyDisplayCommand,x),a
3176                     ; 478 	m_arbyDisplayCommand[i++] = DISPLAY_EOF;		
3178  04ba beff          	ld	x,_displaySetArea$L-1
3179  04bc 3cff          	inc	_displaySetArea$L-1
3180  04be a6ff          	ld	a,#255
3181  04c0 d70000        	ld	(_m_arbyDisplayCommand,x),a
3182                     ; 480 	displayCmdToDisplay(m_arbyDisplayCommand);
3184  04c3 a600          	ld	a,#low(_m_arbyDisplayCommand)
3185  04c5 ae00          	ld	x,#high(_m_arbyDisplayCommand)
3186  04c7 cd02ef        	call	_displayCmdToDisplay
3188                     ; 481 }
3191  04ca 81            	ret
3272                     ; 484 void displaySetOutLine(BYTE a_byLeft, BYTE a_byTop, BYTE a_byRight, BYTE a_byBottom, BYTE a_byReversed)
3272                     ; 485 {
3273                     	switch	.text
3275                     	xref.b	_displaySetOutLine$L
3276  04cb               _displaySetOutLine:
3278  04cb b701          	ld	_displaySetOutLine$L+1,a
3279  04cd bf00          	ld	_displaySetOutLine$L,x
3281                     ; 486 	BYTE i = 0x00;
3283  04cf 3fff          	clr	_displaySetOutLine$L-1
3284                     ; 487 	m_arbyDisplayCommand[i++] = DISPLAY_SET_OUTLINE;
3286  04d1 beff          	ld	x,_displaySetOutLine$L-1
3287  04d3 3cff          	inc	_displaySetOutLine$L-1
3288  04d5 a614          	ld	a,#20
3289  04d7 d70000        	ld	(_m_arbyDisplayCommand,x),a
3290                     ; 488 	m_arbyDisplayCommand[i++] = a_byLeft;
3292  04da beff          	ld	x,_displaySetOutLine$L-1
3293  04dc 3cff          	inc	_displaySetOutLine$L-1
3294  04de b600          	ld	a,_displaySetOutLine$L
3295  04e0 d70000        	ld	(_m_arbyDisplayCommand,x),a
3296                     ; 489 	m_arbyDisplayCommand[i++] = a_byTop;
3298  04e3 beff          	ld	x,_displaySetOutLine$L-1
3299  04e5 3cff          	inc	_displaySetOutLine$L-1
3300  04e7 b601          	ld	a,_displaySetOutLine$L+1
3301  04e9 d70000        	ld	(_m_arbyDisplayCommand,x),a
3302                     ; 490 	m_arbyDisplayCommand[i++] = a_byRight;
3304  04ec beff          	ld	x,_displaySetOutLine$L-1
3305  04ee 3cff          	inc	_displaySetOutLine$L-1
3306  04f0 b602          	ld	a,_displaySetOutLine$L+2
3307  04f2 d70000        	ld	(_m_arbyDisplayCommand,x),a
3308                     ; 491 	m_arbyDisplayCommand[i++] = a_byBottom;
3310  04f5 beff          	ld	x,_displaySetOutLine$L-1
3311  04f7 3cff          	inc	_displaySetOutLine$L-1
3312  04f9 b603          	ld	a,_displaySetOutLine$L+3
3313  04fb d70000        	ld	(_m_arbyDisplayCommand,x),a
3314                     ; 492 	m_arbyDisplayCommand[i++] = DISPLAY_WAIT;
3316  04fe beff          	ld	x,_displaySetOutLine$L-1
3317  0500 3cff          	inc	_displaySetOutLine$L-1
3318  0502 a6fe          	ld	a,#254
3319  0504 d70000        	ld	(_m_arbyDisplayCommand,x),a
3320                     ; 493 	m_arbyDisplayCommand[i++] = DISPLAY_EOF;		
3322  0507 beff          	ld	x,_displaySetOutLine$L-1
3323  0509 3cff          	inc	_displaySetOutLine$L-1
3324  050b a6ff          	ld	a,#255
3325  050d d70000        	ld	(_m_arbyDisplayCommand,x),a
3326                     ; 495 	displayCmdToDisplay(m_arbyDisplayCommand);
3328  0510 a600          	ld	a,#low(_m_arbyDisplayCommand)
3329  0512 ae00          	ld	x,#high(_m_arbyDisplayCommand)
3330  0514 cd02ef        	call	_displayCmdToDisplay
3332                     ; 497 	if (a_byReversed)
3334  0517 3d04          	tnz	_displaySetOutLine$L+4
3335  0519 2712          	jreq	L7651
3336                     ; 499 		displayInvertArea(a_byLeft + 1, a_byTop + 1, a_byRight - 1, a_byBottom - 1);
3338  051b b603          	ld	a,_displaySetOutLine$L+3
3339  051d 4a            	dec	a
3340  051e b703          	ld	_displayInvertArea$L+3,a
3341  0520 b602          	ld	a,_displaySetOutLine$L+2
3342  0522 4a            	dec	a
3343  0523 b702          	ld	_displayInvertArea$L+2,a
3344  0525 b601          	ld	a,_displaySetOutLine$L+1
3345  0527 4c            	inc	a
3346  0528 be00          	ld	x,_displaySetOutLine$L
3347  052a 5c            	inc	x
3348  052b ad4e          	call	_displayInvertArea
3350  052d               L7651:
3351                     ; 501 }
3354  052d 81            	ret
3425                     ; 504 void displayClearArea(BYTE a_byLeft, BYTE a_byTop, BYTE a_byRight, BYTE a_byBottom)
3425                     ; 505 {
3426                     	switch	.text
3428                     	xref.b	_displayClearArea$L
3429  052e               _displayClearArea:
3431  052e b701          	ld	_displayClearArea$L+1,a
3432  0530 bf00          	ld	_displayClearArea$L,x
3434                     ; 506 	BYTE i = 0x00;
3436  0532 3fff          	clr	_displayClearArea$L-1
3437                     ; 507 	m_arbyDisplayCommand[i++] = DISPLAY_CLEAR_AREA;
3439  0534 beff          	ld	x,_displayClearArea$L-1
3440  0536 3cff          	inc	_displayClearArea$L-1
3441  0538 a612          	ld	a,#18
3442  053a d70000        	ld	(_m_arbyDisplayCommand,x),a
3443                     ; 508 	m_arbyDisplayCommand[i++] = a_byLeft;
3445  053d beff          	ld	x,_displayClearArea$L-1
3446  053f 3cff          	inc	_displayClearArea$L-1
3447  0541 b600          	ld	a,_displayClearArea$L
3448  0543 d70000        	ld	(_m_arbyDisplayCommand,x),a
3449                     ; 509 	m_arbyDisplayCommand[i++] = a_byTop;
3451  0546 beff          	ld	x,_displayClearArea$L-1
3452  0548 3cff          	inc	_displayClearArea$L-1
3453  054a b601          	ld	a,_displayClearArea$L+1
3454  054c d70000        	ld	(_m_arbyDisplayCommand,x),a
3455                     ; 510 	m_arbyDisplayCommand[i++] = a_byRight;
3457  054f beff          	ld	x,_displayClearArea$L-1
3458  0551 3cff          	inc	_displayClearArea$L-1
3459  0553 b602          	ld	a,_displayClearArea$L+2
3460  0555 d70000        	ld	(_m_arbyDisplayCommand,x),a
3461                     ; 511 	m_arbyDisplayCommand[i++] = a_byBottom;
3463  0558 beff          	ld	x,_displayClearArea$L-1
3464  055a 3cff          	inc	_displayClearArea$L-1
3465  055c b603          	ld	a,_displayClearArea$L+3
3466  055e d70000        	ld	(_m_arbyDisplayCommand,x),a
3467                     ; 512 	m_arbyDisplayCommand[i++] = DISPLAY_WAIT;
3469  0561 beff          	ld	x,_displayClearArea$L-1
3470  0563 3cff          	inc	_displayClearArea$L-1
3471  0565 a6fe          	ld	a,#254
3472  0567 d70000        	ld	(_m_arbyDisplayCommand,x),a
3473                     ; 513 	m_arbyDisplayCommand[i++] = DISPLAY_EOF;		
3475  056a beff          	ld	x,_displayClearArea$L-1
3476  056c 3cff          	inc	_displayClearArea$L-1
3477  056e a6ff          	ld	a,#255
3478  0570 d70000        	ld	(_m_arbyDisplayCommand,x),a
3479                     ; 515 	displayCmdToDisplay(m_arbyDisplayCommand);
3481  0573 a600          	ld	a,#low(_m_arbyDisplayCommand)
3482  0575 ae00          	ld	x,#high(_m_arbyDisplayCommand)
3483  0577 cd02ef        	call	_displayCmdToDisplay
3485                     ; 516 }
3488  057a 81            	ret
3559                     ; 519 void displayInvertArea(BYTE a_byLeft, BYTE a_byTop, BYTE a_byRight, BYTE a_byBottom)
3559                     ; 520 {
3560                     	switch	.text
3562                     	xref.b	_displayInvertArea$L
3563  057b               _displayInvertArea:
3565  057b b701          	ld	_displayInvertArea$L+1,a
3566  057d bf00          	ld	_displayInvertArea$L,x
3568                     ; 521 	BYTE i = 0x00;
3570  057f 3fff          	clr	_displayInvertArea$L-1
3571                     ; 522 	m_arbyDisplayCommand[i++] = DISPLAY_INVERT_AREA;
3573  0581 beff          	ld	x,_displayInvertArea$L-1
3574  0583 3cff          	inc	_displayInvertArea$L-1
3575  0585 a613          	ld	a,#19
3576  0587 d70000        	ld	(_m_arbyDisplayCommand,x),a
3577                     ; 523 	m_arbyDisplayCommand[i++] = a_byLeft;
3579  058a beff          	ld	x,_displayInvertArea$L-1
3580  058c 3cff          	inc	_displayInvertArea$L-1
3581  058e b600          	ld	a,_displayInvertArea$L
3582  0590 d70000        	ld	(_m_arbyDisplayCommand,x),a
3583                     ; 524 	m_arbyDisplayCommand[i++] = a_byTop;
3585  0593 beff          	ld	x,_displayInvertArea$L-1
3586  0595 3cff          	inc	_displayInvertArea$L-1
3587  0597 b601          	ld	a,_displayInvertArea$L+1
3588  0599 d70000        	ld	(_m_arbyDisplayCommand,x),a
3589                     ; 525 	m_arbyDisplayCommand[i++] = (a_byRight>124?124:a_byRight);
3591  059c b602          	ld	a,_displayInvertArea$L+2
3592  059e a17d          	cp	a,#125
3593  05a0 2504          	jrult	L47
3594  05a2 a67c          	ld	a,#124
3595  05a4 2002          	jra	L67
3596  05a6               L47:
3597  05a6 b602          	ld	a,_displayInvertArea$L+2
3598  05a8               L67:
3599  05a8 beff          	ld	x,_displayInvertArea$L-1
3600  05aa 3cff          	inc	_displayInvertArea$L-1
3601  05ac d70000        	ld	(_m_arbyDisplayCommand,x),a
3602                     ; 526 	m_arbyDisplayCommand[i++] = (a_byBottom>62?62:a_byBottom);
3604  05af b603          	ld	a,_displayInvertArea$L+3
3605  05b1 a13f          	cp	a,#63
3606  05b3 2504          	jrult	L001
3607  05b5 a63e          	ld	a,#62
3608  05b7 2002          	jra	L201
3609  05b9               L001:
3610  05b9 b603          	ld	a,_displayInvertArea$L+3
3611  05bb               L201:
3612  05bb beff          	ld	x,_displayInvertArea$L-1
3613  05bd 3cff          	inc	_displayInvertArea$L-1
3614  05bf d70000        	ld	(_m_arbyDisplayCommand,x),a
3615                     ; 527 	m_arbyDisplayCommand[i++] = DISPLAY_WAIT;
3617  05c2 beff          	ld	x,_displayInvertArea$L-1
3618  05c4 3cff          	inc	_displayInvertArea$L-1
3619  05c6 a6fe          	ld	a,#254
3620  05c8 d70000        	ld	(_m_arbyDisplayCommand,x),a
3621                     ; 528 	m_arbyDisplayCommand[i++] = DISPLAY_EOF;		
3623  05cb beff          	ld	x,_displayInvertArea$L-1
3624  05cd 3cff          	inc	_displayInvertArea$L-1
3625  05cf a6ff          	ld	a,#255
3626  05d1 d70000        	ld	(_m_arbyDisplayCommand,x),a
3627                     ; 530 	displayCmdToDisplay(m_arbyDisplayCommand);
3629  05d4 a600          	ld	a,#low(_m_arbyDisplayCommand)
3630  05d6 ae00          	ld	x,#high(_m_arbyDisplayCommand)
3631  05d8 cd02ef        	call	_displayCmdToDisplay
3633                     ; 531 }
3636  05db 81            	ret
3689                     ; 534 void displayDrawVerticalLine(BYTE a_byX, BYTE a_byTop, BYTE a_byLength)
3689                     ; 535 {
3690                     	switch	.text
3692                     	xref.b	_displayDrawVerticalLine$L
3693  05dc               _displayDrawVerticalLine:
3695  05dc b701          	ld	_displayDrawVerticalLine$L+1,a
3696  05de bf00          	ld	_displayDrawVerticalLine$L,x
3698                     ; 536 	displaySetArea(a_byX, a_byTop, a_byX, a_byTop + a_byLength);
3700  05e0 bb02          	add	a,_displayDrawVerticalLine$L+2
3701  05e2 b703          	ld	_displaySetArea$L+3,a
3702  05e4 b600          	ld	a,_displayDrawVerticalLine$L
3703  05e6 b702          	ld	_displaySetArea$L+2,a
3704  05e8 b601          	ld	a,_displayDrawVerticalLine$L+1
3705  05ea be00          	ld	x,_displayDrawVerticalLine$L
3706  05ec cd047e        	call	_displaySetArea
3708                     ; 537 }
3711  05ef 81            	ret
3764                     ; 540 void displayDrawHorizontalLine(BYTE a_byY, BYTE a_byLeft, BYTE a_byWidth)
3764                     ; 541 {
3765                     	switch	.text
3767                     	xref.b	_displayDrawHorizontalLine$L
3768  05f0               _displayDrawHorizontalLine:
3770  05f0 b701          	ld	_displayDrawHorizontalLine$L+1,a
3771  05f2 bf00          	ld	_displayDrawHorizontalLine$L,x
3773                     ; 542 	displaySetArea(a_byLeft, a_byY, a_byLeft+a_byWidth, a_byY);
3775  05f4 bf03          	ld	_displaySetArea$L+3,x
3776  05f6 bb02          	add	a,_displayDrawHorizontalLine$L+2
3777  05f8 b702          	ld	_displaySetArea$L+2,a
3778  05fa b600          	ld	a,_displayDrawHorizontalLine$L
3779  05fc be01          	ld	x,_displayDrawHorizontalLine$L+1
3780  05fe cd047e        	call	_displaySetArea
3782                     ; 543 }
3785  0601 81            	ret
3847                     ; 546 void displayDrawLed(BYTE a_byX, BYTE a_byY, BYTE a_byFilled)
3847                     ; 547 {
3848                     	switch	.text
3850                     	xref.b	_displayDrawLed$L
3851  0602               _displayDrawLed:
3853  0602 b701          	ld	_displayDrawLed$L+1,a
3854  0604 bf00          	ld	_displayDrawLed$L,x
3856                     ; 548 	BYTE i = 0x00;
3858  0606 3fff          	clr	_displayDrawLed$L-1
3859                     ; 551 	if (a_byX != DISPLAY_NULL)
3861  0608 b600          	ld	a,_displayDrawLed$L
3862  060a a1ff          	cp	a,#255
3863  060c 2726          	jreq	L3771
3864                     ; 553 		m_arbyDisplayCommand[i++] = DISPLAY_CURSOR_POSITION;
3866  060e beff          	ld	x,_displayDrawLed$L-1
3867  0610 3cff          	inc	_displayDrawLed$L-1
3868  0612 a610          	ld	a,#16
3869  0614 d70000        	ld	(_m_arbyDisplayCommand,x),a
3870                     ; 554 		m_arbyDisplayCommand[i++] = a_byX - 2;
3872  0617 b600          	ld	a,_displayDrawLed$L
3873  0619 a002          	sub	a,#2
3874  061b beff          	ld	x,_displayDrawLed$L-1
3875  061d 3cff          	inc	_displayDrawLed$L-1
3876  061f d70000        	ld	(_m_arbyDisplayCommand,x),a
3877                     ; 555 		m_arbyDisplayCommand[i++] = a_byY;
3879  0622 beff          	ld	x,_displayDrawLed$L-1
3880  0624 3cff          	inc	_displayDrawLed$L-1
3881  0626 b601          	ld	a,_displayDrawLed$L+1
3882  0628 d70000        	ld	(_m_arbyDisplayCommand,x),a
3883                     ; 556 		m_arbyDisplayCommand[i++] = DISPLAY_WAIT;
3885  062b beff          	ld	x,_displayDrawLed$L-1
3886  062d 3cff          	inc	_displayDrawLed$L-1
3887  062f a6fe          	ld	a,#254
3888  0631 d70000        	ld	(_m_arbyDisplayCommand,x),a
3889  0634               L3771:
3890                     ; 558 	m_arbyDisplayCommand[i++] = DISPLAY_GRAPHIC_WRITE;
3892  0634 beff          	ld	x,_displayDrawLed$L-1
3893  0636 3cff          	inc	_displayDrawLed$L-1
3894  0638 a618          	ld	a,#24
3895  063a d70000        	ld	(_m_arbyDisplayCommand,x),a
3896                     ; 559     m_arbyDisplayCommand[i++] = 8; //Length
3898  063d beff          	ld	x,_displayDrawLed$L-1
3899  063f 3cff          	inc	_displayDrawLed$L-1
3900  0641 a608          	ld	a,#8
3901  0643 d70000        	ld	(_m_arbyDisplayCommand,x),a
3902                     ; 562 	if (a_byFilled)
3904  0646 3d02          	tnz	_displayDrawLed$L+2
3905  0648 2748          	jreq	L5771
3906                     ; 564 		m_arbyDisplayCommand[i++] = 0x30;
3908  064a beff          	ld	x,_displayDrawLed$L-1
3909  064c 3cff          	inc	_displayDrawLed$L-1
3910  064e a630          	ld	a,#48
3911  0650 d70000        	ld	(_m_arbyDisplayCommand,x),a
3912                     ; 565 		m_arbyDisplayCommand[i++] = 0x78;
3914  0653 beff          	ld	x,_displayDrawLed$L-1
3915  0655 3cff          	inc	_displayDrawLed$L-1
3916  0657 a678          	ld	a,#120
3917  0659 d70000        	ld	(_m_arbyDisplayCommand,x),a
3918                     ; 566 		m_arbyDisplayCommand[i++] = 0xFC;
3920  065c beff          	ld	x,_displayDrawLed$L-1
3921  065e 3cff          	inc	_displayDrawLed$L-1
3922  0660 a6fc          	ld	a,#252
3923  0662 d70000        	ld	(_m_arbyDisplayCommand,x),a
3924                     ; 567 		m_arbyDisplayCommand[i++] = 0xFC;
3926  0665 beff          	ld	x,_displayDrawLed$L-1
3927  0667 3cff          	inc	_displayDrawLed$L-1
3928  0669 a6fc          	ld	a,#252
3929  066b d70000        	ld	(_m_arbyDisplayCommand,x),a
3930                     ; 568 		m_arbyDisplayCommand[i++] = 0x78;
3932  066e beff          	ld	x,_displayDrawLed$L-1
3933  0670 3cff          	inc	_displayDrawLed$L-1
3934  0672 a678          	ld	a,#120
3935  0674 d70000        	ld	(_m_arbyDisplayCommand,x),a
3936                     ; 569 		m_arbyDisplayCommand[i++] = 0x30;
3938  0677 beff          	ld	x,_displayDrawLed$L-1
3939  0679 3cff          	inc	_displayDrawLed$L-1
3940  067b a630          	ld	a,#48
3941  067d d70000        	ld	(_m_arbyDisplayCommand,x),a
3942                     ; 570 		m_arbyDisplayCommand[i++] = 0x00;
3944  0680 beff          	ld	x,_displayDrawLed$L-1
3945  0682 3cff          	inc	_displayDrawLed$L-1
3946  0684 4f            	clr	a
3947  0685 d70000        	ld	(_m_arbyDisplayCommand,x),a
3948                     ; 571 		m_arbyDisplayCommand[i++] = 0x00;		
3950  0688 beff          	ld	x,_displayDrawLed$L-1
3951  068a 3cff          	inc	_displayDrawLed$L-1
3952  068c 4f            	clr	a
3953  068d d70000        	ld	(_m_arbyDisplayCommand,x),a
3955  0690 2046          	jra	L7771
3956  0692               L5771:
3957                     ; 575 		m_arbyDisplayCommand[i++] = 0x30;
3959  0692 beff          	ld	x,_displayDrawLed$L-1
3960  0694 3cff          	inc	_displayDrawLed$L-1
3961  0696 a630          	ld	a,#48
3962  0698 d70000        	ld	(_m_arbyDisplayCommand,x),a
3963                     ; 576 		m_arbyDisplayCommand[i++] = 0x48;
3965  069b beff          	ld	x,_displayDrawLed$L-1
3966  069d 3cff          	inc	_displayDrawLed$L-1
3967  069f a648          	ld	a,#72
3968  06a1 d70000        	ld	(_m_arbyDisplayCommand,x),a
3969                     ; 577 		m_arbyDisplayCommand[i++] = 0x84;
3971  06a4 beff          	ld	x,_displayDrawLed$L-1
3972  06a6 3cff          	inc	_displayDrawLed$L-1
3973  06a8 a684          	ld	a,#132
3974  06aa d70000        	ld	(_m_arbyDisplayCommand,x),a
3975                     ; 578 		m_arbyDisplayCommand[i++] = 0x84;
3977  06ad beff          	ld	x,_displayDrawLed$L-1
3978  06af 3cff          	inc	_displayDrawLed$L-1
3979  06b1 a684          	ld	a,#132
3980  06b3 d70000        	ld	(_m_arbyDisplayCommand,x),a
3981                     ; 579 		m_arbyDisplayCommand[i++] = 0x48;
3983  06b6 beff          	ld	x,_displayDrawLed$L-1
3984  06b8 3cff          	inc	_displayDrawLed$L-1
3985  06ba a648          	ld	a,#72
3986  06bc d70000        	ld	(_m_arbyDisplayCommand,x),a
3987                     ; 580 		m_arbyDisplayCommand[i++] = 0x30;
3989  06bf beff          	ld	x,_displayDrawLed$L-1
3990  06c1 3cff          	inc	_displayDrawLed$L-1
3991  06c3 a630          	ld	a,#48
3992  06c5 d70000        	ld	(_m_arbyDisplayCommand,x),a
3993                     ; 581 		m_arbyDisplayCommand[i++] = 0x00;
3995  06c8 beff          	ld	x,_displayDrawLed$L-1
3996  06ca 3cff          	inc	_displayDrawLed$L-1
3997  06cc 4f            	clr	a
3998  06cd d70000        	ld	(_m_arbyDisplayCommand,x),a
3999                     ; 582 		m_arbyDisplayCommand[i++] = 0x00;		
4001  06d0 beff          	ld	x,_displayDrawLed$L-1
4002  06d2 3cff          	inc	_displayDrawLed$L-1
4003  06d4 4f            	clr	a
4004  06d5 d70000        	ld	(_m_arbyDisplayCommand,x),a
4005  06d8               L7771:
4006                     ; 585 	m_arbyDisplayCommand[i++] = DISPLAY_WAIT;
4008  06d8 beff          	ld	x,_displayDrawLed$L-1
4009  06da 3cff          	inc	_displayDrawLed$L-1
4010  06dc a6fe          	ld	a,#254
4011  06de d70000        	ld	(_m_arbyDisplayCommand,x),a
4012                     ; 586 	m_arbyDisplayCommand[i++] = DISPLAY_EOF;		
4014  06e1 beff          	ld	x,_displayDrawLed$L-1
4015  06e3 3cff          	inc	_displayDrawLed$L-1
4016  06e5 a6ff          	ld	a,#255
4017  06e7 d70000        	ld	(_m_arbyDisplayCommand,x),a
4018                     ; 588 	displayCmdToDisplay(m_arbyDisplayCommand);	
4020  06ea a600          	ld	a,#low(_m_arbyDisplayCommand)
4021  06ec ae00          	ld	x,#high(_m_arbyDisplayCommand)
4022  06ee cd02ef        	call	_displayCmdToDisplay
4024                     ; 589 }
4027  06f1 81            	ret
4099                     ; 593 void displayDrawSelector(BYTE a_byX, BYTE a_byY, BYTE a_byFilled, BYTE a_byReversed)
4099                     ; 594 {
4100                     	switch	.text
4102                     	xref.b	_displayDrawSelector$L
4103  06f2               _displayDrawSelector:
4105  06f2 b701          	ld	_displayDrawSelector$L+1,a
4106  06f4 bf00          	ld	_displayDrawSelector$L,x
4108                     ; 595 	BYTE i = 0x00;
4110  06f6 3fff          	clr	_displayDrawSelector$L-1
4111                     ; 597 	i=0;
4113  06f8 3fff          	clr	_displayDrawSelector$L-1
4114                     ; 600 	if (a_byX != DISPLAY_NULL)
4116  06fa b600          	ld	a,_displayDrawSelector$L
4117  06fc a1ff          	cp	a,#255
4118  06fe 2725          	jreq	L7302
4119                     ; 602 		m_arbyDisplayCommand[i++] = DISPLAY_CURSOR_POSITION;
4121  0700 beff          	ld	x,_displayDrawSelector$L-1
4122  0702 3cff          	inc	_displayDrawSelector$L-1
4123  0704 a610          	ld	a,#16
4124  0706 d70000        	ld	(_m_arbyDisplayCommand,x),a
4125                     ; 603 		m_arbyDisplayCommand[i++] = a_byX-1;
4127  0709 b600          	ld	a,_displayDrawSelector$L
4128  070b 4a            	dec	a
4129  070c beff          	ld	x,_displayDrawSelector$L-1
4130  070e 3cff          	inc	_displayDrawSelector$L-1
4131  0710 d70000        	ld	(_m_arbyDisplayCommand,x),a
4132                     ; 604 		m_arbyDisplayCommand[i++] = a_byY;
4134  0713 beff          	ld	x,_displayDrawSelector$L-1
4135  0715 3cff          	inc	_displayDrawSelector$L-1
4136  0717 b601          	ld	a,_displayDrawSelector$L+1
4137  0719 d70000        	ld	(_m_arbyDisplayCommand,x),a
4138                     ; 605 		m_arbyDisplayCommand[i++] = DISPLAY_WAIT;
4140  071c beff          	ld	x,_displayDrawSelector$L-1
4141  071e 3cff          	inc	_displayDrawSelector$L-1
4142  0720 a6fe          	ld	a,#254
4143  0722 d70000        	ld	(_m_arbyDisplayCommand,x),a
4144  0725               L7302:
4145                     ; 608 	m_arbyDisplayCommand[i++] = DISPLAY_GRAPHIC_WRITE;
4147  0725 beff          	ld	x,_displayDrawSelector$L-1
4148  0727 3cff          	inc	_displayDrawSelector$L-1
4149  0729 a618          	ld	a,#24
4150  072b d70000        	ld	(_m_arbyDisplayCommand,x),a
4151                     ; 611 	if (a_byReversed)
4153  072e 3d03          	tnz	_displayDrawSelector$L+3
4154  0730 2752          	jreq	L1402
4155                     ; 613 		if (a_byFilled)
4157  0732 3d02          	tnz	_displayDrawSelector$L+2
4158  0734 2727          	jreq	L3402
4159                     ; 615 			m_arbyDisplayCommand[i++] = 3; //Length
4161  0736 beff          	ld	x,_displayDrawSelector$L-1
4162  0738 3cff          	inc	_displayDrawSelector$L-1
4163  073a a603          	ld	a,#3
4164  073c d70000        	ld	(_m_arbyDisplayCommand,x),a
4165                     ; 616 			m_arbyDisplayCommand[i++] = 0xFE;
4167  073f beff          	ld	x,_displayDrawSelector$L-1
4168  0741 3cff          	inc	_displayDrawSelector$L-1
4169  0743 a6fe          	ld	a,#254
4170  0745 d70000        	ld	(_m_arbyDisplayCommand,x),a
4171                     ; 617 			m_arbyDisplayCommand[i++] = 0xFF;
4173  0748 beff          	ld	x,_displayDrawSelector$L-1
4174  074a 3cff          	inc	_displayDrawSelector$L-1
4175  074c a6ff          	ld	a,#255
4176  074e d70000        	ld	(_m_arbyDisplayCommand,x),a
4177                     ; 618 			m_arbyDisplayCommand[i++] = 0xFE;
4179  0751 beff          	ld	x,_displayDrawSelector$L-1
4180  0753 3cff          	inc	_displayDrawSelector$L-1
4181  0755 a6fe          	ld	a,#254
4182  0757 d70000        	ld	(_m_arbyDisplayCommand,x),a
4184  075a cc0828        	jp	L7402
4185  075d               L3402:
4186                     ; 623 			m_arbyDisplayCommand[i++] = 3; //Length
4188  075d beff          	ld	x,_displayDrawSelector$L-1
4189  075f 3cff          	inc	_displayDrawSelector$L-1
4190  0761 a603          	ld	a,#3
4191  0763 d70000        	ld	(_m_arbyDisplayCommand,x),a
4192                     ; 624 			m_arbyDisplayCommand[i++] = 0xFE;
4194  0766 beff          	ld	x,_displayDrawSelector$L-1
4195  0768 3cff          	inc	_displayDrawSelector$L-1
4196  076a a6fe          	ld	a,#254
4197  076c d70000        	ld	(_m_arbyDisplayCommand,x),a
4198                     ; 625 			m_arbyDisplayCommand[i++] = 0x81;
4200  076f beff          	ld	x,_displayDrawSelector$L-1
4201  0771 3cff          	inc	_displayDrawSelector$L-1
4202  0773 a681          	ld	a,#129
4203  0775 d70000        	ld	(_m_arbyDisplayCommand,x),a
4204                     ; 626 			m_arbyDisplayCommand[i++] = 0xFE;
4206  0778 beff          	ld	x,_displayDrawSelector$L-1
4207  077a 3cff          	inc	_displayDrawSelector$L-1
4208  077c a6fe          	ld	a,#254
4209  077e d70000        	ld	(_m_arbyDisplayCommand,x),a
4210  0781 cc0828        	jp	L7402
4211  0784               L1402:
4212                     ; 631 		if (a_byFilled)
4214  0784 3d02          	tnz	_displayDrawSelector$L+2
4215  0786 2751          	jreq	L1502
4216                     ; 633 			m_arbyDisplayCommand[i++] = 8; //Length
4218  0788 beff          	ld	x,_displayDrawSelector$L-1
4219  078a 3cff          	inc	_displayDrawSelector$L-1
4220  078c a608          	ld	a,#8
4221  078e d70000        	ld	(_m_arbyDisplayCommand,x),a
4222                     ; 634 			m_arbyDisplayCommand[i++] = 0x00;
4224  0791 beff          	ld	x,_displayDrawSelector$L-1
4225  0793 3cff          	inc	_displayDrawSelector$L-1
4226  0795 4f            	clr	a
4227  0796 d70000        	ld	(_m_arbyDisplayCommand,x),a
4228                     ; 635 			m_arbyDisplayCommand[i++] = 0x10;
4230  0799 beff          	ld	x,_displayDrawSelector$L-1
4231  079b 3cff          	inc	_displayDrawSelector$L-1
4232  079d a610          	ld	a,#16
4233  079f d70000        	ld	(_m_arbyDisplayCommand,x),a
4234                     ; 636 			m_arbyDisplayCommand[i++] = 0x38;
4236  07a2 beff          	ld	x,_displayDrawSelector$L-1
4237  07a4 3cff          	inc	_displayDrawSelector$L-1
4238  07a6 a638          	ld	a,#56
4239  07a8 d70000        	ld	(_m_arbyDisplayCommand,x),a
4240                     ; 637 			m_arbyDisplayCommand[i++] = 0x38;
4242  07ab beff          	ld	x,_displayDrawSelector$L-1
4243  07ad 3cff          	inc	_displayDrawSelector$L-1
4244  07af a638          	ld	a,#56
4245  07b1 d70000        	ld	(_m_arbyDisplayCommand,x),a
4246                     ; 638 			m_arbyDisplayCommand[i++] = 0x38;
4248  07b4 beff          	ld	x,_displayDrawSelector$L-1
4249  07b6 3cff          	inc	_displayDrawSelector$L-1
4250  07b8 a638          	ld	a,#56
4251  07ba d70000        	ld	(_m_arbyDisplayCommand,x),a
4252                     ; 639 			m_arbyDisplayCommand[i++] = 0x38;
4254  07bd beff          	ld	x,_displayDrawSelector$L-1
4255  07bf 3cff          	inc	_displayDrawSelector$L-1
4256  07c1 a638          	ld	a,#56
4257  07c3 d70000        	ld	(_m_arbyDisplayCommand,x),a
4258                     ; 640 			m_arbyDisplayCommand[i++] = 0x38;
4260  07c6 beff          	ld	x,_displayDrawSelector$L-1
4261  07c8 3cff          	inc	_displayDrawSelector$L-1
4262  07ca a638          	ld	a,#56
4263  07cc d70000        	ld	(_m_arbyDisplayCommand,x),a
4264                     ; 641 			m_arbyDisplayCommand[i++] = 0x00;
4266  07cf beff          	ld	x,_displayDrawSelector$L-1
4267  07d1 3cff          	inc	_displayDrawSelector$L-1
4268  07d3 4f            	clr	a
4269  07d4 d70000        	ld	(_m_arbyDisplayCommand,x),a
4271  07d7 204f          	jra	L7402
4272  07d9               L1502:
4273                     ; 645 			m_arbyDisplayCommand[i++] = 8; //Length
4275  07d9 beff          	ld	x,_displayDrawSelector$L-1
4276  07db 3cff          	inc	_displayDrawSelector$L-1
4277  07dd a608          	ld	a,#8
4278  07df d70000        	ld	(_m_arbyDisplayCommand,x),a
4279                     ; 646 			m_arbyDisplayCommand[i++] = 0x00;
4281  07e2 beff          	ld	x,_displayDrawSelector$L-1
4282  07e4 3cff          	inc	_displayDrawSelector$L-1
4283  07e6 4f            	clr	a
4284  07e7 d70000        	ld	(_m_arbyDisplayCommand,x),a
4285                     ; 647 			m_arbyDisplayCommand[i++] = 0x10;
4287  07ea beff          	ld	x,_displayDrawSelector$L-1
4288  07ec 3cff          	inc	_displayDrawSelector$L-1
4289  07ee a610          	ld	a,#16
4290  07f0 d70000        	ld	(_m_arbyDisplayCommand,x),a
4291                     ; 648 			m_arbyDisplayCommand[i++] = 0x28;
4293  07f3 beff          	ld	x,_displayDrawSelector$L-1
4294  07f5 3cff          	inc	_displayDrawSelector$L-1
4295  07f7 a628          	ld	a,#40
4296  07f9 d70000        	ld	(_m_arbyDisplayCommand,x),a
4297                     ; 649 			m_arbyDisplayCommand[i++] = 0x28;
4299  07fc beff          	ld	x,_displayDrawSelector$L-1
4300  07fe 3cff          	inc	_displayDrawSelector$L-1
4301  0800 a628          	ld	a,#40
4302  0802 d70000        	ld	(_m_arbyDisplayCommand,x),a
4303                     ; 650 			m_arbyDisplayCommand[i++] = 0x28;
4305  0805 beff          	ld	x,_displayDrawSelector$L-1
4306  0807 3cff          	inc	_displayDrawSelector$L-1
4307  0809 a628          	ld	a,#40
4308  080b d70000        	ld	(_m_arbyDisplayCommand,x),a
4309                     ; 651 			m_arbyDisplayCommand[i++] = 0x28;
4311  080e beff          	ld	x,_displayDrawSelector$L-1
4312  0810 3cff          	inc	_displayDrawSelector$L-1
4313  0812 a628          	ld	a,#40
4314  0814 d70000        	ld	(_m_arbyDisplayCommand,x),a
4315                     ; 652 			m_arbyDisplayCommand[i++] = 0x38;
4317  0817 beff          	ld	x,_displayDrawSelector$L-1
4318  0819 3cff          	inc	_displayDrawSelector$L-1
4319  081b a638          	ld	a,#56
4320  081d d70000        	ld	(_m_arbyDisplayCommand,x),a
4321                     ; 653 			m_arbyDisplayCommand[i++] = 0x00;
4323  0820 beff          	ld	x,_displayDrawSelector$L-1
4324  0822 3cff          	inc	_displayDrawSelector$L-1
4325  0824 4f            	clr	a
4326  0825 d70000        	ld	(_m_arbyDisplayCommand,x),a
4327  0828               L7402:
4328                     ; 657 	m_arbyDisplayCommand[i++] = DISPLAY_WAIT;
4330  0828 beff          	ld	x,_displayDrawSelector$L-1
4331  082a 3cff          	inc	_displayDrawSelector$L-1
4332  082c a6fe          	ld	a,#254
4333  082e d70000        	ld	(_m_arbyDisplayCommand,x),a
4334                     ; 658 	m_arbyDisplayCommand[i++] = DISPLAY_EOF;		
4336  0831 beff          	ld	x,_displayDrawSelector$L-1
4337  0833 3cff          	inc	_displayDrawSelector$L-1
4338  0835 a6ff          	ld	a,#255
4339  0837 d70000        	ld	(_m_arbyDisplayCommand,x),a
4340                     ; 660 	displayCmdToDisplay(m_arbyDisplayCommand);
4342  083a a600          	ld	a,#low(_m_arbyDisplayCommand)
4343  083c ae00          	ld	x,#high(_m_arbyDisplayCommand)
4344  083e cd02ef        	call	_displayCmdToDisplay
4346                     ; 661 }
4349  0841 81            	ret
4402                     ; 664 void displayDrawAlarm(BYTE a_byX, BYTE a_byY)
4402                     ; 665 {
4403                     	switch	.text
4405                     	xref.b	_displayDrawAlarm$L
4406  0842               _displayDrawAlarm:
4408  0842 b701          	ld	_displayDrawAlarm$L+1,a
4409  0844 bf00          	ld	_displayDrawAlarm$L,x
4411                     ; 666 	BYTE i = 0x00;
4413  0846 3fff          	clr	_displayDrawAlarm$L-1
4414                     ; 668 	if (a_byX != DISPLAY_NULL)
4416  0848 b600          	ld	a,_displayDrawAlarm$L
4417  084a a1ff          	cp	a,#255
4418  084c 2728          	jreq	L3012
4419                     ; 670 		m_arbyDisplayCommand[i++] = DISPLAY_CURSOR_POSITION;
4421  084e beff          	ld	x,_displayDrawAlarm$L-1
4422  0850 3cff          	inc	_displayDrawAlarm$L-1
4423  0852 a610          	ld	a,#16
4424  0854 d70000        	ld	(_m_arbyDisplayCommand,x),a
4425                     ; 671 		m_arbyDisplayCommand[i++] = a_byX + 2;
4427  0857 b600          	ld	a,_displayDrawAlarm$L
4428  0859 ab02          	add	a,#2
4429  085b beff          	ld	x,_displayDrawAlarm$L-1
4430  085d 3cff          	inc	_displayDrawAlarm$L-1
4431  085f d70000        	ld	(_m_arbyDisplayCommand,x),a
4432                     ; 672 		m_arbyDisplayCommand[i++] = a_byY +7 ;
4434  0862 b601          	ld	a,_displayDrawAlarm$L+1
4435  0864 ab07          	add	a,#7
4436  0866 beff          	ld	x,_displayDrawAlarm$L-1
4437  0868 3cff          	inc	_displayDrawAlarm$L-1
4438  086a d70000        	ld	(_m_arbyDisplayCommand,x),a
4439                     ; 673 		m_arbyDisplayCommand[i++] = DISPLAY_WAIT;
4441  086d beff          	ld	x,_displayDrawAlarm$L-1
4442  086f 3cff          	inc	_displayDrawAlarm$L-1
4443  0871 a6fe          	ld	a,#254
4444  0873 d70000        	ld	(_m_arbyDisplayCommand,x),a
4445  0876               L3012:
4446                     ; 676 	m_arbyDisplayCommand[i++] = DISPLAY_GRAPHIC_WRITE;
4448  0876 beff          	ld	x,_displayDrawAlarm$L-1
4449  0878 3cff          	inc	_displayDrawAlarm$L-1
4450  087a a618          	ld	a,#24
4451  087c d70000        	ld	(_m_arbyDisplayCommand,x),a
4452                     ; 677 	m_arbyDisplayCommand[i++] = 7; //Length
4454  087f beff          	ld	x,_displayDrawAlarm$L-1
4455  0881 3cff          	inc	_displayDrawAlarm$L-1
4456  0883 a607          	ld	a,#7
4457  0885 d70000        	ld	(_m_arbyDisplayCommand,x),a
4458                     ; 680 	m_arbyDisplayCommand[i++] = 0x04;
4460  0888 beff          	ld	x,_displayDrawAlarm$L-1
4461  088a 3cff          	inc	_displayDrawAlarm$L-1
4462  088c a604          	ld	a,#4
4463  088e d70000        	ld	(_m_arbyDisplayCommand,x),a
4464                     ; 681 	m_arbyDisplayCommand[i++] = 0x3A;
4466  0891 beff          	ld	x,_displayDrawAlarm$L-1
4467  0893 3cff          	inc	_displayDrawAlarm$L-1
4468  0895 a63a          	ld	a,#58
4469  0897 d70000        	ld	(_m_arbyDisplayCommand,x),a
4470                     ; 682 	m_arbyDisplayCommand[i++] = 0x42;
4472  089a beff          	ld	x,_displayDrawAlarm$L-1
4473  089c 3cff          	inc	_displayDrawAlarm$L-1
4474  089e a642          	ld	a,#66
4475  08a0 d70000        	ld	(_m_arbyDisplayCommand,x),a
4476                     ; 683 	m_arbyDisplayCommand[i++] = 0xC2;
4478  08a3 beff          	ld	x,_displayDrawAlarm$L-1
4479  08a5 3cff          	inc	_displayDrawAlarm$L-1
4480  08a7 a6c2          	ld	a,#194
4481  08a9 d70000        	ld	(_m_arbyDisplayCommand,x),a
4482                     ; 684 	m_arbyDisplayCommand[i++] = 0x43;
4484  08ac beff          	ld	x,_displayDrawAlarm$L-1
4485  08ae 3cff          	inc	_displayDrawAlarm$L-1
4486  08b0 a643          	ld	a,#67
4487  08b2 d70000        	ld	(_m_arbyDisplayCommand,x),a
4488                     ; 685 	m_arbyDisplayCommand[i++] = 0x3A;
4490  08b5 beff          	ld	x,_displayDrawAlarm$L-1
4491  08b7 3cff          	inc	_displayDrawAlarm$L-1
4492  08b9 a63a          	ld	a,#58
4493  08bb d70000        	ld	(_m_arbyDisplayCommand,x),a
4494                     ; 686 	m_arbyDisplayCommand[i++] = 0x04;
4496  08be beff          	ld	x,_displayDrawAlarm$L-1
4497  08c0 3cff          	inc	_displayDrawAlarm$L-1
4498  08c2 a604          	ld	a,#4
4499  08c4 d70000        	ld	(_m_arbyDisplayCommand,x),a
4500                     ; 688 	m_arbyDisplayCommand[i++] = DISPLAY_WAIT;
4502  08c7 beff          	ld	x,_displayDrawAlarm$L-1
4503  08c9 3cff          	inc	_displayDrawAlarm$L-1
4504  08cb a6fe          	ld	a,#254
4505  08cd d70000        	ld	(_m_arbyDisplayCommand,x),a
4506                     ; 689 	m_arbyDisplayCommand[i++] = DISPLAY_EOF;		
4508  08d0 beff          	ld	x,_displayDrawAlarm$L-1
4509  08d2 3cff          	inc	_displayDrawAlarm$L-1
4510  08d4 a6ff          	ld	a,#255
4511  08d6 d70000        	ld	(_m_arbyDisplayCommand,x),a
4512                     ; 691 	displayCmdToDisplay(m_arbyDisplayCommand);			
4514  08d9 a600          	ld	a,#low(_m_arbyDisplayCommand)
4515  08db ae00          	ld	x,#high(_m_arbyDisplayCommand)
4516  08dd cd02ef        	call	_displayCmdToDisplay
4518                     ; 692 }
4521  08e0 81            	ret
4595                     ; 695 void displayDrawCorrection(BYTE a_byX, BYTE a_byY, BYTE a_byWidth, BYTE a_byDirection)
4595                     ; 696 {
4596                     	switch	.text
4598                     	xref.b	_displayDrawCorrection$L
4599  08e1               _displayDrawCorrection:
4601  08e1 b701          	ld	_displayDrawCorrection$L+1,a
4602  08e3 bf00          	ld	_displayDrawCorrection$L,x
4604                     ; 697 	BYTE i = 0x00;
4606  08e5 3fff          	clr	_displayDrawCorrection$L-1
4607                     ; 699 	if _btst(a_byDirection, 1) //plus
4609  08e7 b603          	ld	a,_displayDrawCorrection$L+3
4610  08e9 a502          	bcp	a,#2
4611  08eb 2603          	jrne	L021
4612  08ed cc098a        	jp	L3412
4613  08f0               L021:
4614                     ; 701 		i = 0x00;
4616  08f0 3fff          	clr	_displayDrawCorrection$L-1
4617                     ; 703 		if (a_byX != DISPLAY_NULL)
4619  08f2 b600          	ld	a,_displayDrawCorrection$L
4620  08f4 a1ff          	cp	a,#255
4621  08f6 2728          	jreq	L5412
4622                     ; 705 			m_arbyDisplayCommand[i++] = DISPLAY_CURSOR_POSITION;
4624  08f8 beff          	ld	x,_displayDrawCorrection$L-1
4625  08fa 3cff          	inc	_displayDrawCorrection$L-1
4626  08fc a610          	ld	a,#16
4627  08fe d70000        	ld	(_m_arbyDisplayCommand,x),a
4628                     ; 706 			m_arbyDisplayCommand[i++] = a_byX + 2;
4630  0901 b600          	ld	a,_displayDrawCorrection$L
4631  0903 ab02          	add	a,#2
4632  0905 beff          	ld	x,_displayDrawCorrection$L-1
4633  0907 3cff          	inc	_displayDrawCorrection$L-1
4634  0909 d70000        	ld	(_m_arbyDisplayCommand,x),a
4635                     ; 707 			m_arbyDisplayCommand[i++] = a_byY +7 ;
4637  090c b601          	ld	a,_displayDrawCorrection$L+1
4638  090e ab07          	add	a,#7
4639  0910 beff          	ld	x,_displayDrawCorrection$L-1
4640  0912 3cff          	inc	_displayDrawCorrection$L-1
4641  0914 d70000        	ld	(_m_arbyDisplayCommand,x),a
4642                     ; 708 			m_arbyDisplayCommand[i++] = DISPLAY_WAIT;
4644  0917 beff          	ld	x,_displayDrawCorrection$L-1
4645  0919 3cff          	inc	_displayDrawCorrection$L-1
4646  091b a6fe          	ld	a,#254
4647  091d d70000        	ld	(_m_arbyDisplayCommand,x),a
4648  0920               L5412:
4649                     ; 711 		m_arbyDisplayCommand[i++] = DISPLAY_GRAPHIC_WRITE;
4651  0920 beff          	ld	x,_displayDrawCorrection$L-1
4652  0922 3cff          	inc	_displayDrawCorrection$L-1
4653  0924 a618          	ld	a,#24
4654  0926 d70000        	ld	(_m_arbyDisplayCommand,x),a
4655                     ; 712 		m_arbyDisplayCommand[i++] = 8; //Length
4657  0929 beff          	ld	x,_displayDrawCorrection$L-1
4658  092b 3cff          	inc	_displayDrawCorrection$L-1
4659  092d a608          	ld	a,#8
4660  092f d70000        	ld	(_m_arbyDisplayCommand,x),a
4661                     ; 715 		m_arbyDisplayCommand[i++] = 0x00;
4663  0932 beff          	ld	x,_displayDrawCorrection$L-1
4664  0934 3cff          	inc	_displayDrawCorrection$L-1
4665  0936 4f            	clr	a
4666  0937 d70000        	ld	(_m_arbyDisplayCommand,x),a
4667                     ; 716 		m_arbyDisplayCommand[i++] = 0x3C;
4669  093a beff          	ld	x,_displayDrawCorrection$L-1
4670  093c 3cff          	inc	_displayDrawCorrection$L-1
4671  093e a63c          	ld	a,#60
4672  0940 d70000        	ld	(_m_arbyDisplayCommand,x),a
4673                     ; 717 		m_arbyDisplayCommand[i++] = 0x42;
4675  0943 beff          	ld	x,_displayDrawCorrection$L-1
4676  0945 3cff          	inc	_displayDrawCorrection$L-1
4677  0947 a642          	ld	a,#66
4678  0949 d70000        	ld	(_m_arbyDisplayCommand,x),a
4679                     ; 718 		m_arbyDisplayCommand[i++] = 0x02;
4681  094c beff          	ld	x,_displayDrawCorrection$L-1
4682  094e 3cff          	inc	_displayDrawCorrection$L-1
4683  0950 a602          	ld	a,#2
4684  0952 d70000        	ld	(_m_arbyDisplayCommand,x),a
4685                     ; 719 		m_arbyDisplayCommand[i++] = 0x72;
4687  0955 beff          	ld	x,_displayDrawCorrection$L-1
4688  0957 3cff          	inc	_displayDrawCorrection$L-1
4689  0959 a672          	ld	a,#114
4690  095b d70000        	ld	(_m_arbyDisplayCommand,x),a
4691                     ; 720 		m_arbyDisplayCommand[i++] = 0x62;
4693  095e beff          	ld	x,_displayDrawCorrection$L-1
4694  0960 3cff          	inc	_displayDrawCorrection$L-1
4695  0962 a662          	ld	a,#98
4696  0964 d70000        	ld	(_m_arbyDisplayCommand,x),a
4697                     ; 721 		m_arbyDisplayCommand[i++] = 0x5C;
4699  0967 beff          	ld	x,_displayDrawCorrection$L-1
4700  0969 3cff          	inc	_displayDrawCorrection$L-1
4701  096b a65c          	ld	a,#92
4702  096d d70000        	ld	(_m_arbyDisplayCommand,x),a
4703                     ; 722 		m_arbyDisplayCommand[i++] = 0x00;		
4705  0970 beff          	ld	x,_displayDrawCorrection$L-1
4706  0972 3cff          	inc	_displayDrawCorrection$L-1
4707  0974 4f            	clr	a
4708  0975 d70000        	ld	(_m_arbyDisplayCommand,x),a
4709                     ; 723 		m_arbyDisplayCommand[i++] = DISPLAY_EOF;		
4711  0978 beff          	ld	x,_displayDrawCorrection$L-1
4712  097a 3cff          	inc	_displayDrawCorrection$L-1
4713  097c a6ff          	ld	a,#255
4714  097e d70000        	ld	(_m_arbyDisplayCommand,x),a
4715                     ; 724 		displayCmdToDisplay(m_arbyDisplayCommand);
4717  0981 a600          	ld	a,#low(_m_arbyDisplayCommand)
4718  0983 ae00          	ld	x,#high(_m_arbyDisplayCommand)
4719  0985 cd02ef        	call	_displayCmdToDisplay
4722  0988 2018          	jra	L7412
4723  098a               L3412:
4724                     ; 729 		displayClearArea(a_byX + 2, a_byY +7, a_byX + 9, a_byY +14);
4726  098a b601          	ld	a,_displayDrawCorrection$L+1
4727  098c ab0e          	add	a,#14
4728  098e b703          	ld	_displayClearArea$L+3,a
4729  0990 b600          	ld	a,_displayDrawCorrection$L
4730  0992 ab09          	add	a,#9
4731  0994 b702          	ld	_displayClearArea$L+2,a
4732  0996 b600          	ld	a,_displayDrawCorrection$L
4733  0998 ab02          	add	a,#2
4734  099a 97            	ld	x,a
4735  099b b601          	ld	a,_displayDrawCorrection$L+1
4736  099d ab07          	add	a,#7
4737  099f cd052e        	call	_displayClearArea
4739  09a2               L7412:
4740                     ; 732 	if _btst(a_byDirection, 0) //minus
4742  09a2 b603          	ld	a,_displayDrawCorrection$L+3
4743  09a4 a501          	bcp	a,#1
4744  09a6 2603          	jrne	L221
4745  09a8 cc0a47        	jp	L1512
4746  09ab               L221:
4747                     ; 734 		i = 0x00;
4749  09ab 3fff          	clr	_displayDrawCorrection$L-1
4750                     ; 736 		if (a_byX != DISPLAY_NULL)
4752  09ad b600          	ld	a,_displayDrawCorrection$L
4753  09af a1ff          	cp	a,#255
4754  09b1 272a          	jreq	L3512
4755                     ; 738 			m_arbyDisplayCommand[i++] = DISPLAY_CURSOR_POSITION;
4757  09b3 beff          	ld	x,_displayDrawCorrection$L-1
4758  09b5 3cff          	inc	_displayDrawCorrection$L-1
4759  09b7 a610          	ld	a,#16
4760  09b9 d70000        	ld	(_m_arbyDisplayCommand,x),a
4761                     ; 739 			m_arbyDisplayCommand[i++] = a_byX + a_byWidth - 10;
4763  09bc b600          	ld	a,_displayDrawCorrection$L
4764  09be bb02          	add	a,_displayDrawCorrection$L+2
4765  09c0 a00a          	sub	a,#10
4766  09c2 beff          	ld	x,_displayDrawCorrection$L-1
4767  09c4 3cff          	inc	_displayDrawCorrection$L-1
4768  09c6 d70000        	ld	(_m_arbyDisplayCommand,x),a
4769                     ; 740 			m_arbyDisplayCommand[i++] = a_byY +7 ;
4771  09c9 b601          	ld	a,_displayDrawCorrection$L+1
4772  09cb ab07          	add	a,#7
4773  09cd beff          	ld	x,_displayDrawCorrection$L-1
4774  09cf 3cff          	inc	_displayDrawCorrection$L-1
4775  09d1 d70000        	ld	(_m_arbyDisplayCommand,x),a
4776                     ; 741 			m_arbyDisplayCommand[i++] = DISPLAY_WAIT;
4778  09d4 beff          	ld	x,_displayDrawCorrection$L-1
4779  09d6 3cff          	inc	_displayDrawCorrection$L-1
4780  09d8 a6fe          	ld	a,#254
4781  09da d70000        	ld	(_m_arbyDisplayCommand,x),a
4782  09dd               L3512:
4783                     ; 744 		m_arbyDisplayCommand[i++] = DISPLAY_GRAPHIC_WRITE;
4785  09dd beff          	ld	x,_displayDrawCorrection$L-1
4786  09df 3cff          	inc	_displayDrawCorrection$L-1
4787  09e1 a618          	ld	a,#24
4788  09e3 d70000        	ld	(_m_arbyDisplayCommand,x),a
4789                     ; 745 		m_arbyDisplayCommand[i++] = 8; //Length
4791  09e6 beff          	ld	x,_displayDrawCorrection$L-1
4792  09e8 3cff          	inc	_displayDrawCorrection$L-1
4793  09ea a608          	ld	a,#8
4794  09ec d70000        	ld	(_m_arbyDisplayCommand,x),a
4795                     ; 748 		m_arbyDisplayCommand[i++] = 0x00;
4797  09ef beff          	ld	x,_displayDrawCorrection$L-1
4798  09f1 3cff          	inc	_displayDrawCorrection$L-1
4799  09f3 4f            	clr	a
4800  09f4 d70000        	ld	(_m_arbyDisplayCommand,x),a
4801                     ; 749 		m_arbyDisplayCommand[i++] = 0x3C;
4803  09f7 beff          	ld	x,_displayDrawCorrection$L-1
4804  09f9 3cff          	inc	_displayDrawCorrection$L-1
4805  09fb a63c          	ld	a,#60
4806  09fd d70000        	ld	(_m_arbyDisplayCommand,x),a
4807                     ; 750 		m_arbyDisplayCommand[i++] = 0x42;
4809  0a00 beff          	ld	x,_displayDrawCorrection$L-1
4810  0a02 3cff          	inc	_displayDrawCorrection$L-1
4811  0a04 a642          	ld	a,#66
4812  0a06 d70000        	ld	(_m_arbyDisplayCommand,x),a
4813                     ; 751 		m_arbyDisplayCommand[i++] = 0x40;
4815  0a09 beff          	ld	x,_displayDrawCorrection$L-1
4816  0a0b 3cff          	inc	_displayDrawCorrection$L-1
4817  0a0d a640          	ld	a,#64
4818  0a0f d70000        	ld	(_m_arbyDisplayCommand,x),a
4819                     ; 752 		m_arbyDisplayCommand[i++] = 0x4E;
4821  0a12 beff          	ld	x,_displayDrawCorrection$L-1
4822  0a14 3cff          	inc	_displayDrawCorrection$L-1
4823  0a16 a64e          	ld	a,#78
4824  0a18 d70000        	ld	(_m_arbyDisplayCommand,x),a
4825                     ; 753 		m_arbyDisplayCommand[i++] = 0x46;
4827  0a1b beff          	ld	x,_displayDrawCorrection$L-1
4828  0a1d 3cff          	inc	_displayDrawCorrection$L-1
4829  0a1f a646          	ld	a,#70
4830  0a21 d70000        	ld	(_m_arbyDisplayCommand,x),a
4831                     ; 754 		m_arbyDisplayCommand[i++] = 0x3A;
4833  0a24 beff          	ld	x,_displayDrawCorrection$L-1
4834  0a26 3cff          	inc	_displayDrawCorrection$L-1
4835  0a28 a63a          	ld	a,#58
4836  0a2a d70000        	ld	(_m_arbyDisplayCommand,x),a
4837                     ; 755 		m_arbyDisplayCommand[i++] = 0x00;	
4839  0a2d beff          	ld	x,_displayDrawCorrection$L-1
4840  0a2f 3cff          	inc	_displayDrawCorrection$L-1
4841  0a31 4f            	clr	a
4842  0a32 d70000        	ld	(_m_arbyDisplayCommand,x),a
4843                     ; 757 		m_arbyDisplayCommand[i++] = DISPLAY_EOF;		
4845  0a35 beff          	ld	x,_displayDrawCorrection$L-1
4846  0a37 3cff          	inc	_displayDrawCorrection$L-1
4847  0a39 a6ff          	ld	a,#255
4848  0a3b d70000        	ld	(_m_arbyDisplayCommand,x),a
4849                     ; 758 		displayCmdToDisplay(m_arbyDisplayCommand);
4851  0a3e a600          	ld	a,#low(_m_arbyDisplayCommand)
4852  0a40 ae00          	ld	x,#high(_m_arbyDisplayCommand)
4853  0a42 cd02ef        	call	_displayCmdToDisplay
4856  0a45 201c          	jra	L5512
4857  0a47               L1512:
4858                     ; 763 		displayClearArea(a_byX + a_byWidth - 10, a_byY +7, a_byX + a_byWidth - 3, a_byY +14);
4860  0a47 b601          	ld	a,_displayDrawCorrection$L+1
4861  0a49 ab0e          	add	a,#14
4862  0a4b b703          	ld	_displayClearArea$L+3,a
4863  0a4d b600          	ld	a,_displayDrawCorrection$L
4864  0a4f bb02          	add	a,_displayDrawCorrection$L+2
4865  0a51 a003          	sub	a,#3
4866  0a53 b702          	ld	_displayClearArea$L+2,a
4867  0a55 b600          	ld	a,_displayDrawCorrection$L
4868  0a57 bb02          	add	a,_displayDrawCorrection$L+2
4869  0a59 a00a          	sub	a,#10
4870  0a5b 97            	ld	x,a
4871  0a5c b601          	ld	a,_displayDrawCorrection$L+1
4872  0a5e ab07          	add	a,#7
4873  0a60 cd052e        	call	_displayClearArea
4875  0a63               L5512:
4876                     ; 766 	if _btst(a_byDirection, 7) //Operator -  -Tension
4878  0a63 b603          	ld	a,_displayDrawCorrection$L+3
4879  0a65 a580          	bcp	a,#128
4880  0a67 2719          	jreq	L7512
4881                     ; 768 		displayWriteString("-T", DISPLAY_SELECT_FONT_MINI, a_byX+12, a_byY+13);
4883  0a69 b601          	ld	a,_displayDrawCorrection$L+1
4884  0a6b ab0d          	add	a,#13
4885  0a6d b704          	ld	_displayWriteString$L+4,a
4886  0a6f b600          	ld	a,_displayDrawCorrection$L
4887  0a71 ab0c          	add	a,#12
4888  0a73 b703          	ld	_displayWriteString$L+3,a
4889  0a75 a61c          	ld	a,#28
4890  0a77 b702          	ld	_displayWriteString$L+2,a
4891  0a79 a6ab          	ld	a,#low(L1612)
4892  0a7b aeab          	ld	x,#high(L1612)
4893  0a7d cd03ed        	call	_displayWriteString
4896  0a80 2018          	jra	L3612
4897  0a82               L7512:
4898                     ; 772 		displayClearArea(a_byX + 12, a_byY +8, a_byX + 19, a_byY +13);
4900  0a82 b601          	ld	a,_displayDrawCorrection$L+1
4901  0a84 ab0d          	add	a,#13
4902  0a86 b703          	ld	_displayClearArea$L+3,a
4903  0a88 b600          	ld	a,_displayDrawCorrection$L
4904  0a8a ab13          	add	a,#19
4905  0a8c b702          	ld	_displayClearArea$L+2,a
4906  0a8e b600          	ld	a,_displayDrawCorrection$L
4907  0a90 ab0c          	add	a,#12
4908  0a92 97            	ld	x,a
4909  0a93 b601          	ld	a,_displayDrawCorrection$L+1
4910  0a95 ab08          	add	a,#8
4911  0a97 cd052e        	call	_displayClearArea
4913  0a9a               L3612:
4914                     ; 775 	if _btst(a_byDirection, 6) //Gear - +Tension
4916  0a9a b603          	ld	a,_displayDrawCorrection$L+3
4917  0a9c a540          	bcp	a,#64
4918  0a9e 271b          	jreq	L5612
4919                     ; 777 		displayWriteString("+T", DISPLAY_SELECT_FONT_MINI, a_byX+ a_byWidth - 20, a_byY+13);
4921  0aa0 b601          	ld	a,_displayDrawCorrection$L+1
4922  0aa2 ab0d          	add	a,#13
4923  0aa4 b704          	ld	_displayWriteString$L+4,a
4924  0aa6 b600          	ld	a,_displayDrawCorrection$L
4925  0aa8 bb02          	add	a,_displayDrawCorrection$L+2
4926  0aaa a014          	sub	a,#20
4927  0aac b703          	ld	_displayWriteString$L+3,a
4928  0aae a61c          	ld	a,#28
4929  0ab0 b702          	ld	_displayWriteString$L+2,a
4930  0ab2 a6a8          	ld	a,#low(L7612)
4931  0ab4 aea8          	ld	x,#high(L7612)
4932  0ab6 cd03ed        	call	_displayWriteString
4935  0ab9 201c          	jra	L1712
4936  0abb               L5612:
4937                     ; 781 		displayClearArea(a_byX + a_byWidth - 20, a_byY +8, a_byX + a_byWidth - 13, a_byY +13);
4939  0abb b601          	ld	a,_displayDrawCorrection$L+1
4940  0abd ab0d          	add	a,#13
4941  0abf b703          	ld	_displayClearArea$L+3,a
4942  0ac1 b600          	ld	a,_displayDrawCorrection$L
4943  0ac3 bb02          	add	a,_displayDrawCorrection$L+2
4944  0ac5 a00d          	sub	a,#13
4945  0ac7 b702          	ld	_displayClearArea$L+2,a
4946  0ac9 b600          	ld	a,_displayDrawCorrection$L
4947  0acb bb02          	add	a,_displayDrawCorrection$L+2
4948  0acd a014          	sub	a,#20
4949  0acf 97            	ld	x,a
4950  0ad0 b601          	ld	a,_displayDrawCorrection$L+1
4951  0ad2 ab08          	add	a,#8
4952  0ad4 cd052e        	call	_displayClearArea
4954  0ad7               L1712:
4955                     ; 783 }
4958  0ad7 81            	ret
5108                     ; 786 void displayDrawBox(BYTE a_byLeft, BYTE a_byTop, BYTE a_byWidth, BYTE a_byHeigth, BYTE * a_strLabel, BYTE * a_strLabel2, WORD a_woValue, BYTE a_byLength, BYTE a_byDecimal, BYTE a_byRefresh)
5108                     ; 787 {
5109                     	switch	.text
5111                     	xref.b	_displayDrawBox$L
5112  0ad8               _displayDrawBox:
5114  0ad8 b701          	ld	_displayDrawBox$L+1,a
5115  0ada bf00          	ld	_displayDrawBox$L,x
5117                     ; 792 	byRight = a_byLeft + a_byWidth;
5119  0adc 9f            	ld	a,x
5120  0add bb02          	add	a,_displayDrawBox$L+2
5121  0adf b7ff          	ld	_displayDrawBox$L-1,a
5122                     ; 794 	if (!a_byRefresh)
5124  0ae1 3d0c          	tnz	_displayDrawBox$L+12
5125  0ae3 2703          	jreq	L631
5126  0ae5 cc0b7b        	jp	L1722
5127  0ae8               L631:
5128                     ; 796 		displayClearArea(a_byLeft, a_byTop, byRight + 1, a_byTop + a_byHeigth + 1);
5130  0ae8 b601          	ld	a,_displayDrawBox$L+1
5131  0aea bb03          	add	a,_displayDrawBox$L+3
5132  0aec 4c            	inc	a
5133  0aed b703          	ld	_displayClearArea$L+3,a
5134  0aef b6ff          	ld	a,_displayDrawBox$L-1
5135  0af1 4c            	inc	a
5136  0af2 b702          	ld	_displayClearArea$L+2,a
5137  0af4 b601          	ld	a,_displayDrawBox$L+1
5138  0af6 be00          	ld	x,_displayDrawBox$L
5139  0af8 cd052e        	call	_displayClearArea
5141                     ; 797 		displaySetOutLine(a_byLeft, a_byTop, byRight, a_byTop + a_byHeigth, false);
5143  0afb 3f04          	clr	_displaySetOutLine$L+4
5144  0afd b601          	ld	a,_displayDrawBox$L+1
5145  0aff bb03          	add	a,_displayDrawBox$L+3
5146  0b01 b703          	ld	_displaySetOutLine$L+3,a
5147  0b03 b6ff          	ld	a,_displayDrawBox$L-1
5148  0b05 b702          	ld	_displaySetOutLine$L+2,a
5149  0b07 b601          	ld	a,_displayDrawBox$L+1
5150  0b09 be00          	ld	x,_displayDrawBox$L
5151  0b0b cd04cb        	call	_displaySetOutLine
5153                     ; 799 		if (a_strLabel != NULL)
5155  0b0e b605          	ld	a,_displayDrawBox$L+5
5156  0b10 ba04          	or	a,_displayDrawBox$L+4
5157  0b12 2748          	jreq	L3722
5158                     ; 801 			displayWriteString(a_strLabel, DISPLAY_SELECT_FONT_MINI, a_byLeft + 2, a_byTop + 6);
5160  0b14 b601          	ld	a,_displayDrawBox$L+1
5161  0b16 ab06          	add	a,#6
5162  0b18 b704          	ld	_displayWriteString$L+4,a
5163  0b1a b600          	ld	a,_displayDrawBox$L
5164  0b1c ab02          	add	a,#2
5165  0b1e b703          	ld	_displayWriteString$L+3,a
5166  0b20 a61c          	ld	a,#28
5167  0b22 b702          	ld	_displayWriteString$L+2,a
5168  0b24 b605          	ld	a,_displayDrawBox$L+5
5169  0b26 be04          	ld	x,_displayDrawBox$L+4
5170  0b28 cd03ed        	call	_displayWriteString
5172                     ; 803 			if (byRight == 126) //workaround
5174  0b2b b6ff          	ld	a,_displayDrawBox$L-1
5175  0b2d a17e          	cp	a,#126
5176  0b2f 2617          	jrne	L5722
5177                     ; 805 				displayInvertArea(a_byLeft + 1, a_byTop + 1, byRight - 2, a_byTop + 6);
5179  0b31 b601          	ld	a,_displayDrawBox$L+1
5180  0b33 ab06          	add	a,#6
5181  0b35 b703          	ld	_displayInvertArea$L+3,a
5182  0b37 b6ff          	ld	a,_displayDrawBox$L-1
5183  0b39 a002          	sub	a,#2
5184  0b3b b702          	ld	_displayInvertArea$L+2,a
5185  0b3d b601          	ld	a,_displayDrawBox$L+1
5186  0b3f 4c            	inc	a
5187  0b40 be00          	ld	x,_displayDrawBox$L
5188  0b42 5c            	inc	x
5189  0b43 cd057b        	call	_displayInvertArea
5192  0b46 2014          	jra	L3722
5193  0b48               L5722:
5194                     ; 809 				displayInvertArea(a_byLeft + 1, a_byTop + 1, byRight - 1, a_byTop + 6);
5196  0b48 b601          	ld	a,_displayDrawBox$L+1
5197  0b4a ab06          	add	a,#6
5198  0b4c b703          	ld	_displayInvertArea$L+3,a
5199  0b4e b6ff          	ld	a,_displayDrawBox$L-1
5200  0b50 4a            	dec	a
5201  0b51 b702          	ld	_displayInvertArea$L+2,a
5202  0b53 b601          	ld	a,_displayDrawBox$L+1
5203  0b55 4c            	inc	a
5204  0b56 be00          	ld	x,_displayDrawBox$L
5205  0b58 5c            	inc	x
5206  0b59 cd057b        	call	_displayInvertArea
5208  0b5c               L3722:
5209                     ; 813 		if(a_strLabel2 != NULL)
5211  0b5c b607          	ld	a,_displayDrawBox$L+7
5212  0b5e ba06          	or	a,_displayDrawBox$L+6
5213  0b60 2719          	jreq	L1722
5214                     ; 815 			displayWriteString(a_strLabel2, DISPLAY_SELECT_FONT_MINI, a_byLeft + 2, a_byTop + a_byHeigth - 2);
5216  0b62 b601          	ld	a,_displayDrawBox$L+1
5217  0b64 bb03          	add	a,_displayDrawBox$L+3
5218  0b66 a002          	sub	a,#2
5219  0b68 b704          	ld	_displayWriteString$L+4,a
5220  0b6a b600          	ld	a,_displayDrawBox$L
5221  0b6c ab02          	add	a,#2
5222  0b6e b703          	ld	_displayWriteString$L+3,a
5223  0b70 a61c          	ld	a,#28
5224  0b72 b702          	ld	_displayWriteString$L+2,a
5225  0b74 b607          	ld	a,_displayDrawBox$L+7
5226  0b76 be06          	ld	x,_displayDrawBox$L+6
5227  0b78 cd03ed        	call	_displayWriteString
5229  0b7b               L1722:
5230                     ; 819 	if ((a_byRefresh) && (a_woValue == 0xFFFF))
5232  0b7b 3d0c          	tnz	_displayDrawBox$L+12
5233  0b7d 273b          	jreq	L3032
5235  0b7f b609          	ld	a,_displayDrawBox$L+9
5236  0b81 a1ff          	cp	a,#255
5237  0b83 2604          	jrne	L621
5238  0b85 be08          	ld	x,_displayDrawBox$L+8
5239  0b87 a3ff          	cp	x,#255
5240  0b89               L621:
5241  0b89 262f          	jrne	L3032
5242                     ; 821 		displayClearArea(a_byLeft+1, a_byTop+7, byRight - 1, a_byTop + a_byHeigth - 1);
5244  0b8b b601          	ld	a,_displayDrawBox$L+1
5245  0b8d bb03          	add	a,_displayDrawBox$L+3
5246  0b8f 4a            	dec	a
5247  0b90 b703          	ld	_displayClearArea$L+3,a
5248  0b92 b6ff          	ld	a,_displayDrawBox$L-1
5249  0b94 4a            	dec	a
5250  0b95 b702          	ld	_displayClearArea$L+2,a
5251  0b97 b601          	ld	a,_displayDrawBox$L+1
5252  0b99 ab07          	add	a,#7
5253  0b9b be00          	ld	x,_displayDrawBox$L
5254  0b9d 5c            	inc	x
5255  0b9e cd052e        	call	_displayClearArea
5257                     ; 822 		displayWriteString(a_strLabel2, DISPLAY_SELECT_FONT_MINI, a_byLeft + 2, a_byTop + a_byHeigth - 2);
5259  0ba1 b601          	ld	a,_displayDrawBox$L+1
5260  0ba3 bb03          	add	a,_displayDrawBox$L+3
5261  0ba5 a002          	sub	a,#2
5262  0ba7 b704          	ld	_displayWriteString$L+4,a
5263  0ba9 b600          	ld	a,_displayDrawBox$L
5264  0bab ab02          	add	a,#2
5265  0bad b703          	ld	_displayWriteString$L+3,a
5266  0baf a61c          	ld	a,#28
5267  0bb1 b702          	ld	_displayWriteString$L+2,a
5268  0bb3 b607          	ld	a,_displayDrawBox$L+7
5269  0bb5 be06          	ld	x,_displayDrawBox$L+6
5270  0bb7 cd03ed        	call	_displayWriteString
5272  0bba               L3032:
5273                     ; 825 	if (a_woValue != 0xFFFF)
5275  0bba b609          	ld	a,_displayDrawBox$L+9
5276  0bbc a1ff          	cp	a,#255
5277  0bbe 2604          	jrne	L031
5278  0bc0 be08          	ld	x,_displayDrawBox$L+8
5279  0bc2 a3ff          	cp	x,#255
5280  0bc4               L031:
5281  0bc4 2767          	jreq	L5032
5282                     ; 827 		formatNumber(a_woValue, a_byLength, 0, strString);
5284  0bc6 aeef          	ld	x,#high(_displayDrawBox$L-17)
5285  0bc8 bf04          	ld	_formatNumber$L+4,x
5286  0bca a6ef          	ld	a,#low(_displayDrawBox$L-17)
5287  0bcc b705          	ld	_formatNumber$L+5,a
5288  0bce 3f03          	clr	_formatNumber$L+3
5289  0bd0 b60a          	ld	a,_displayDrawBox$L+10
5290  0bd2 b702          	ld	_formatNumber$L+2,a
5291  0bd4 b609          	ld	a,_displayDrawBox$L+9
5292  0bd6 be08          	ld	x,_displayDrawBox$L+8
5293  0bd8 cd0000        	call	_formatNumber
5295                     ; 828 		strString[a_byLength] = 0x00;
5297  0bdb be0a          	ld	x,_displayDrawBox$L+10
5298  0bdd 4f            	clr	a
5299  0bde e7ef          	ld	(_displayDrawBox$L-17,x),a
5300                     ; 830 		byDecimal = byRight - (a_byDecimal*6)-1;
5302  0be0 b60b          	ld	a,_displayDrawBox$L+11
5303  0be2 ae06          	ld	x,#6
5304  0be4 42            	mul	x,a
5305  0be5 b0ff          	sub	a,_displayDrawBox$L-1
5306  0be7 40            	neg	a
5307  0be8 4a            	dec	a
5308  0be9 b7ee          	ld	_displayDrawBox$L-18,a
5309                     ; 831 		byRight = MIN(byRight, 125);
5311  0beb b6ff          	ld	a,_displayDrawBox$L-1
5312  0bed a17e          	cp	a,#126
5313  0bef 2504          	jrult	L231
5314  0bf1 a67d          	ld	a,#125
5315  0bf3 2002          	jra	L431
5316  0bf5               L231:
5317  0bf5 b6ff          	ld	a,_displayDrawBox$L-1
5318  0bf7               L431:
5319  0bf7 b7ff          	ld	_displayDrawBox$L-1,a
5320                     ; 832 		displayWriteString(strString, DISPLAY_SELECT_FONT_5x7, byRight - (a_byLength * 6), a_byTop + a_byHeigth - 1);			
5322  0bf9 b601          	ld	a,_displayDrawBox$L+1
5323  0bfb bb03          	add	a,_displayDrawBox$L+3
5324  0bfd 4a            	dec	a
5325  0bfe b704          	ld	_displayWriteString$L+4,a
5326  0c00 b60a          	ld	a,_displayDrawBox$L+10
5327  0c02 ae06          	ld	x,#6
5328  0c04 42            	mul	x,a
5329  0c05 b0ff          	sub	a,_displayDrawBox$L-1
5330  0c07 40            	neg	a
5331  0c08 b703          	ld	_displayWriteString$L+3,a
5332  0c0a a61d          	ld	a,#29
5333  0c0c b702          	ld	_displayWriteString$L+2,a
5334  0c0e a6ef          	ld	a,#_displayDrawBox$L-17
5335  0c10 5f            	clr	x
5336  0c11 cd03ed        	call	_displayWriteString
5338                     ; 833 		if (a_byDecimal>0)
5340  0c14 3d0b          	tnz	_displayDrawBox$L+11
5341  0c16 2715          	jreq	L5032
5342                     ; 835 			displaySetArea(byDecimal, a_byTop + a_byHeigth - 2, byDecimal, a_byTop + a_byHeigth );
5344  0c18 b601          	ld	a,_displayDrawBox$L+1
5345  0c1a bb03          	add	a,_displayDrawBox$L+3
5346  0c1c b703          	ld	_displaySetArea$L+3,a
5347  0c1e b6ee          	ld	a,_displayDrawBox$L-18
5348  0c20 b702          	ld	_displaySetArea$L+2,a
5349  0c22 b601          	ld	a,_displayDrawBox$L+1
5350  0c24 bb03          	add	a,_displayDrawBox$L+3
5351  0c26 a002          	sub	a,#2
5352  0c28 beee          	ld	x,_displayDrawBox$L-18
5353  0c2a cd047e        	call	_displaySetArea
5355  0c2d               L5032:
5356                     ; 839 }
5359  0c2d 81            	ret
5414                     	xdef	_displayKeyboardIRQ
5415                     	xdef	_displayTraslateKeyPressed
5416                     	xdef	_displayClearCommandBuffer
5417                     	switch	.bss
5418  0000               _m_arbyDisplayCommand:
5419  0000 000000000000  	ds.b	128
5420                     	xdef	_m_arbyDisplayCommand
5421  0080               L5001_m_enmKeyPressed:
5422  0080 0000          	ds.b	2
5423                     	xdef	_displayDrawBox
5424                     	xdef	_displayDrawAlarm
5425                     	xdef	_displayDrawLed
5426                     	xdef	_displayDrawCorrection
5427                     	xdef	_displayDrawSelector
5428                     	xdef	_displayDrawHorizontalLine
5429                     	xdef	_displayDrawVerticalLine
5430                     	xdef	_displayInvertArea
5431                     	xdef	_displaySetOutLine
5432                     	xdef	_displayClearArea
5433                     	xdef	_displaySetArea
5434                     	xdef	_displayWriteString
5435                     	xdef	_displayOff
5436                     	xdef	_displayCmdToDisplay
5437                     	xdef	_displayIsKeyPressed
5438                     	xdef	_displayKeyPressedReset
5439                     	xdef	_displayGetKeyPressed
5440                     	xdef	_displayReset
5441                     	xdef	_displayInit
5442                     	xref	_formatNumber
5443                     	xref	_memcpy
5444                     	xref	_sleep
5445                     	xref	_sleepSec
5446                     	xref	_parametersGetSerialNumber
5447                     	xref	_parametersSet
5448                     	xref	_parametersGetValue
5449                     	xref	_SPI_MoveByte
5450                     	switch	.const
5451  00a8               L7612:
5452  00a8 2b5400        	dc.b	"+T",0
5453  00ab               L1612:
5454  00ab 2d5400        	dc.b	"-T",0
5455                     	xref.b	c_x
5456                     	xref.b	c_y
5476                     	xref	c_rtol
5477                     	xref	c_uitol
5478                     	xref	c_imul
5479                     	xref.b	_displaySetOutLine$L
5480                     	xref.b	_displayWriteString$L
5481                     	xref.b	_displayClearArea$L
5482                     	xref.b	_displaySetArea$L
5483                     	xref.b	_displayInvertArea$L
5484                     	xref.b	_parametersSet$L
5485                     	xref.b	_formatNumber$L
5486                     	xref.b	_memcpy$L
5487                     	xref.b	_sleep$L
5488                     	end
