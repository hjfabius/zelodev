   1                     ; C Compiler for ST7 (COSMIC Software)
   2                     ; Generator V4.5.5 - 12 Jan 2006
1280                     .const:	section	.text
1281  0000               L327_mc_byApplicationVersion:
1282  0000 9d            	dc.b	157
1342                     ; 9 void eepromInit(void)
1342                     ; 10 {
1343                     	switch	.text
1344  0000               _eepromInit:
1347                     ; 12 	eepromSelection(EEPROM_ADR_00); //Select first eeprom
1349  0000 4f            	clr	a
1350  0001 ad71          	call	_eepromSelection
1352                     ; 13 	SPI_MoveByte(EEPROM_WRSR);		//access the EEPROM register
1354  0003 a601          	ld	a,#1
1355  0005 cd0000        	call	_SPI_MoveByte
1357                     ; 14 	SPI_MoveByte((BYTE)0xF0);  		//clear all flags in the EEPROM registers
1359  0008 a6f0          	ld	a,#240
1360  000a cd0000        	call	_SPI_MoveByte
1362                     ; 16 	eepromSelection(EEPROM_ADR_01); //Select second eeprom
1364  000d a601          	ld	a,#1
1365  000f ad63          	call	_eepromSelection
1367                     ; 17 	SPI_MoveByte(EEPROM_WRSR);		//access the EEPROM register
1369  0011 a601          	ld	a,#1
1370  0013 cd0000        	call	_SPI_MoveByte
1372                     ; 18 	SPI_MoveByte((BYTE)0xF0);  		//clear all flags in the EEPROM registers
1374  0016 a6f0          	ld	a,#240
1375  0018 cd0000        	call	_SPI_MoveByte
1377                     ; 20 	eepromSelection(EEPROM_ADR_02); //Select third eeprom
1379  001b a602          	ld	a,#2
1380  001d ad55          	call	_eepromSelection
1382                     ; 21 	SPI_MoveByte(EEPROM_WRSR);		//access the EEPROM register
1384  001f a601          	ld	a,#1
1385  0021 cd0000        	call	_SPI_MoveByte
1387                     ; 22 	SPI_MoveByte((BYTE)0xF0);  		//clear all flags in the EEPROM registers
1389  0024 a6f0          	ld	a,#240
1390  0026 cd0000        	call	_SPI_MoveByte
1392                     ; 24 	eepromSelection(EEPROM_ADR_03); //Select fourth eeprom
1394  0029 a603          	ld	a,#3
1395  002b ad47          	call	_eepromSelection
1397                     ; 25 	SPI_MoveByte(EEPROM_WRSR);		//access the EEPROM register
1399  002d a601          	ld	a,#1
1400  002f cd0000        	call	_SPI_MoveByte
1402                     ; 26 	SPI_MoveByte((BYTE)0xF0);  		//clear all flags in the EEPROM registers
1404  0032 a6f0          	ld	a,#240
1405  0034 cd0000        	call	_SPI_MoveByte
1407                     ; 28 	eepromSelection(EEPROM_ADR_04); //Select fiveth eeprom
1409  0037 a604          	ld	a,#4
1410  0039 ad39          	call	_eepromSelection
1412                     ; 29 	SPI_MoveByte(EEPROM_WRSR);		//access the EEPROM register
1414  003b a601          	ld	a,#1
1415  003d cd0000        	call	_SPI_MoveByte
1417                     ; 30 	SPI_MoveByte((BYTE)0xF0);  		//clear all flags in the EEPROM registers
1419  0040 a6f0          	ld	a,#240
1420  0042 cd0000        	call	_SPI_MoveByte
1422                     ; 32 	eepromSelection(EEPROM_ADR_05); //Select sixth eeprom
1424  0045 a605          	ld	a,#5
1425  0047 ad2b          	call	_eepromSelection
1427                     ; 33 	SPI_MoveByte(EEPROM_WRSR);		//access the EEPROM register
1429  0049 a601          	ld	a,#1
1430  004b cd0000        	call	_SPI_MoveByte
1432                     ; 34 	SPI_MoveByte((BYTE)0xF0);  		//clear all flags in the EEPROM registers
1434  004e a6f0          	ld	a,#240
1435  0050 cd0000        	call	_SPI_MoveByte
1437                     ; 36 	eepromSelection(EEPROM_ADR_06); //Select seventh eeprom
1439  0053 a606          	ld	a,#6
1440  0055 ad1d          	call	_eepromSelection
1442                     ; 37 	SPI_MoveByte(EEPROM_WRSR);		//access the EEPROM register
1444  0057 a601          	ld	a,#1
1445  0059 cd0000        	call	_SPI_MoveByte
1447                     ; 38 	SPI_MoveByte((BYTE)0xF0);  		//clear all flags in the EEPROM registers
1449  005c a6f0          	ld	a,#240
1450  005e cd0000        	call	_SPI_MoveByte
1452                     ; 40 	eepromSelection(EEPROM_ADR_07); //Select eightth eeprom
1454  0061 a607          	ld	a,#7
1455  0063 ad0f          	call	_eepromSelection
1457                     ; 41 	SPI_MoveByte(EEPROM_WRSR);		//access the EEPROM register
1459  0065 a601          	ld	a,#1
1460  0067 cd0000        	call	_SPI_MoveByte
1462                     ; 42 	SPI_MoveByte((BYTE)0xF0);  		//clear all flags in the EEPROM registers
1464  006a a6f0          	ld	a,#240
1465  006c cd0000        	call	_SPI_MoveByte
1467                     ; 45 	eepromSelection(EEPROM_ADR_NONE);
1469  006f a6ff          	ld	a,#255
1470  0071 ad01          	call	_eepromSelection
1472                     ; 46 }
1475  0073 81            	ret
1509                     ; 49 void eepromSelection(BYTE a_byEeprom)
1509                     ; 50 {
1510                     	switch	.text
1512                     	xref.b	_eepromSelection$L
1513  0074               _eepromSelection:
1516                     ; 54 	switch (a_byEeprom)
1519                     ; 102 			break;
1521  0074 4d            	tnz	a
1522  0075 271b          	jreq	L757
1523  0077 4a            	dec	a
1524  0078 2720          	jreq	L167
1525  007a 4a            	dec	a
1526  007b 2725          	jreq	L367
1527  007d 4a            	dec	a
1528  007e 272a          	jreq	L567
1529  0080 4a            	dec	a
1530  0081 272f          	jreq	L767
1531  0083 4a            	dec	a
1532  0084 2734          	jreq	L177
1533  0086 4a            	dec	a
1534  0087 2739          	jreq	L377
1535  0089 4a            	dec	a
1536  008a 273e          	jreq	L577
1537  008c a0f8          	sub	a,#248
1538  008e 2742          	jreq	L777
1539  0090 2049          	jra	L1201
1540  0092               L757:
1541                     ; 56 		case EEPROM_ADR_00:
1541                     ; 57 			_bres(_Pa_Select_UA, _Pin_Select_UA);
1543  0092 1115          	bres	_PHDR,#0
1544                     ; 58 			_bres(_Pa_Select_UB, _Pin_Select_UB);
1546  0094 1315          	bres	_PHDR,#1
1547                     ; 59 			_bres(_Pa_Select_UC, _Pin_Select_UC);
1549  0096 1515          	bres	_PHDR,#2
1550                     ; 60 			break;
1552  0098 2041          	jra	L1201
1553  009a               L167:
1554                     ; 61 		case EEPROM_ADR_01:
1554                     ; 62 			_bset(_Pa_Select_UA, _Pin_Select_UA);
1556  009a 1015          	bset	_PHDR,#0
1557                     ; 63 			_bres(_Pa_Select_UB, _Pin_Select_UB);
1559  009c 1315          	bres	_PHDR,#1
1560                     ; 64 			_bres(_Pa_Select_UC, _Pin_Select_UC);
1562  009e 1515          	bres	_PHDR,#2
1563                     ; 65 			break;
1565  00a0 2039          	jra	L1201
1566  00a2               L367:
1567                     ; 66 		case EEPROM_ADR_02:
1567                     ; 67 			_bres(_Pa_Select_UA, _Pin_Select_UA);
1569  00a2 1115          	bres	_PHDR,#0
1570                     ; 68 			_bset(_Pa_Select_UB, _Pin_Select_UB);
1572  00a4 1215          	bset	_PHDR,#1
1573                     ; 69 			_bres(_Pa_Select_UC, _Pin_Select_UC);
1575  00a6 1515          	bres	_PHDR,#2
1576                     ; 70 			break;
1578  00a8 2031          	jra	L1201
1579  00aa               L567:
1580                     ; 71 		case EEPROM_ADR_03:
1580                     ; 72 			_bset(_Pa_Select_UA, _Pin_Select_UA);
1582  00aa 1015          	bset	_PHDR,#0
1583                     ; 73 			_bset(_Pa_Select_UB, _Pin_Select_UB);
1585  00ac 1215          	bset	_PHDR,#1
1586                     ; 74 			_bres(_Pa_Select_UC, _Pin_Select_UC);
1588  00ae 1515          	bres	_PHDR,#2
1589                     ; 75 			break;
1591  00b0 2029          	jra	L1201
1592  00b2               L767:
1593                     ; 76 		case EEPROM_ADR_04:
1593                     ; 77 			_bres(_Pa_Select_UA, _Pin_Select_UA);
1595  00b2 1115          	bres	_PHDR,#0
1596                     ; 78 			_bres(_Pa_Select_UB, _Pin_Select_UB);
1598  00b4 1315          	bres	_PHDR,#1
1599                     ; 79 			_bset(_Pa_Select_UC, _Pin_Select_UC);
1601  00b6 1415          	bset	_PHDR,#2
1602                     ; 80 			break;
1604  00b8 2021          	jra	L1201
1605  00ba               L177:
1606                     ; 81 		case EEPROM_ADR_05:
1606                     ; 82 			_bset(_Pa_Select_UA, _Pin_Select_UA);
1608  00ba 1015          	bset	_PHDR,#0
1609                     ; 83 			_bres(_Pa_Select_UB, _Pin_Select_UB);
1611  00bc 1315          	bres	_PHDR,#1
1612                     ; 84 			_bset(_Pa_Select_UC, _Pin_Select_UC);
1614  00be 1415          	bset	_PHDR,#2
1615                     ; 85 			break;
1617  00c0 2019          	jra	L1201
1618  00c2               L377:
1619                     ; 86 		case EEPROM_ADR_06:
1619                     ; 87 			_bres(_Pa_Select_UA, _Pin_Select_UA);
1621  00c2 1115          	bres	_PHDR,#0
1622                     ; 88 			_bset(_Pa_Select_UB, _Pin_Select_UB);
1624  00c4 1215          	bset	_PHDR,#1
1625                     ; 89 			_bset(_Pa_Select_UC, _Pin_Select_UC);
1627  00c6 1415          	bset	_PHDR,#2
1628                     ; 90 			break;
1630  00c8 2011          	jra	L1201
1631  00ca               L577:
1632                     ; 91 		case EEPROM_ADR_07:
1632                     ; 92 			_bset(_Pa_Select_UA, _Pin_Select_UA);
1634  00ca 1015          	bset	_PHDR,#0
1635                     ; 93 			_bset(_Pa_Select_UB, _Pin_Select_UB);
1637  00cc 1215          	bset	_PHDR,#1
1638                     ; 94 			_bset(_Pa_Select_UC, _Pin_Select_UC);
1640  00ce 1415          	bset	_PHDR,#2
1641                     ; 95 			break;
1643  00d0 2009          	jra	L1201
1644  00d2               L777:
1645                     ; 96 		case EEPROM_ADR_NONE:
1645                     ; 97 			_bres(_Pa_Select_UA, _Pin_Select_UA);
1647  00d2 1115          	bres	_PHDR,#0
1648                     ; 98 			_bres(_Pa_Select_UB, _Pin_Select_UB);
1650  00d4 1315          	bres	_PHDR,#1
1651                     ; 99 			_bres(_Pa_Select_UC, _Pin_Select_UC);		
1653  00d6 1515          	bres	_PHDR,#2
1654                     ; 100 			_bres(_Pa_Select_U1, _Pin_Select_U1);
1656  00d8 1715          	bres	_PHDR,#3
1657                     ; 101 			return;
1660  00da 81            	ret
1661  00db               L1201:
1662                     ; 105 	_bset(_Pa_Select_U1, _Pin_Select_U1);
1664  00db 1615          	bset	_PHDR,#3
1665                     ; 107 }
1668  00dd 81            	ret
1713                     ; 110 void eepromReset(void)
1713                     ; 111 {
1714                     	switch	.text
1716                     	xref.b	_eepromReset$L
1717  00de               _eepromReset:
1720                     ; 114 	WORD woAddress = 0x0000;
1722  00de 3ffd          	clr	_eepromReset$L-3
1723  00e0 3ffe          	clr	_eepromReset$L-2
1724                     ; 116 	for(byEeprom = EEPROM_ADR_00; byEeprom<=EEPROM_ADR_07; byEeprom++)
1726  00e2 3fff          	clr	_eepromReset$L-1
1727  00e4               L5401:
1728                     ; 118 		_switch(_Pa_Led_D1, _Pin_Led_D1);
1730  00e4 b60c          	ld	a,_PEDR
1731  00e6 a580          	bcp	a,#128
1732  00e8 2704          	jreq	L3501
1735  00ea 1f0c          	bres	_PEDR,#7
1737  00ec 2002          	jra	L5501
1738  00ee               L3501:
1741  00ee 1e0c          	bset	_PEDR,#7
1742  00f0               L5501:
1743                     ; 121 		eepromSelection(byEeprom);
1746  00f0 b6ff          	ld	a,_eepromReset$L-1
1747  00f2 ad80          	call	_eepromSelection
1749                     ; 122 		SPI_MoveByte(EEPROM_WREN);                
1751  00f4 a606          	ld	a,#6
1752  00f6 cd0000        	call	_SPI_MoveByte
1754                     ; 123 		eepromSelection(EEPROM_ADR_NONE);
1756  00f9 a6ff          	ld	a,#255
1757  00fb cd0074        	call	_eepromSelection
1759                     ; 127 		eepromSelection(byEeprom);
1761  00fe b6ff          	ld	a,_eepromReset$L-1
1762  0100 cd0074        	call	_eepromSelection
1764                     ; 128 		SPI_MoveByte(EEPROM_WRITE);           
1766  0103 a602          	ld	a,#2
1767  0105 cd0000        	call	_SPI_MoveByte
1769                     ; 131 		SPI_MoveByte(0x00);     
1771  0108 4f            	clr	a
1772  0109 cd0000        	call	_SPI_MoveByte
1774                     ; 132 		SPI_MoveByte(0x00);  
1776  010c 4f            	clr	a
1777  010d cd0000        	call	_SPI_MoveByte
1779                     ; 134 		woAddress = 32768;
1781  0110 a680          	ld	a,#128
1782  0112 b7fd          	ld	_eepromReset$L-3,a
1783  0114 3ffe          	clr	_eepromReset$L-2
1785  0116 2005          	jra	L3601
1786  0118               L7501:
1787                     ; 138 			SPI_MoveByte((BYTE)0xFF);      
1789  0118 a6ff          	ld	a,#255
1790  011a cd0000        	call	_SPI_MoveByte
1792  011d               L3601:
1793                     ; 135 		while (woAddress-- != 0x00)
1795  011d b6fe          	ld	a,_eepromReset$L-2
1796  011f 97            	ld	x,a
1797  0120 a001          	sub	a,#1
1798  0122 b7fe          	ld	_eepromReset$L-2,a
1799  0124 b6fd          	ld	a,_eepromReset$L-3
1800  0126 b700          	ld	c_x,a
1801  0128 a200          	sbc	a,#0
1802  012a b7fd          	ld	_eepromReset$L-3,a
1803  012c a300          	cp	x,#0
1804  012e 2604          	jrne	L21
1805  0130 b600          	ld	a,c_x
1806  0132 a100          	cp	a,#0
1807  0134               L21:
1808  0134 26e2          	jrne	L7501
1809                     ; 151 		eepromSelection(EEPROM_ADR_NONE);
1811  0136 a6ff          	ld	a,#255
1812  0138 cd0074        	call	_eepromSelection
1814                     ; 116 	for(byEeprom = EEPROM_ADR_00; byEeprom<=EEPROM_ADR_07; byEeprom++)
1816  013b 3cff          	inc	_eepromReset$L-1
1819  013d b6ff          	ld	a,_eepromReset$L-1
1820  013f a108          	cp	a,#8
1821  0141 25a1          	jrult	L5401
1822                     ; 154 	_bres(_Pa_Led_D1, _Pin_Led_D1);
1824  0143 1f0c          	bres	_PEDR,#7
1825                     ; 155 }
1828  0145 81            	ret
1900                     ; 158 void writeEepromString(BYTE a_byEeprom, WORD a_intAddr, BYTE * a_strBuffer)
1900                     ; 159 {
1901                     	switch	.text
1903                     	xref.b	_writeEepromString$L
1904  0146               _writeEepromString:
1906  0146 b700          	ld	_writeEepromString$L,a
1908                     ; 160     BYTE i 				= 0x00; 
1910  0148 3ffe          	clr	_writeEepromString$L-2
1911                     ; 161 	BYTE byReadValue 	= 0x00;	
1913  014a 3fff          	clr	_writeEepromString$L-1
1914  014c               L5211:
1915                     ; 167 		eepromSelection(a_byEeprom);
1917  014c b600          	ld	a,_writeEepromString$L
1918  014e cd0074        	call	_eepromSelection
1920                     ; 168 		SPI_MoveByte(EEPROM_WREN);                
1922  0151 a606          	ld	a,#6
1923  0153 cd0000        	call	_SPI_MoveByte
1925                     ; 169 		eepromSelection(EEPROM_ADR_NONE);
1927  0156 a6ff          	ld	a,#255
1928  0158 cd0074        	call	_eepromSelection
1930                     ; 174 		eepromSelection(a_byEeprom);
1932  015b b600          	ld	a,_writeEepromString$L
1933  015d cd0074        	call	_eepromSelection
1935                     ; 175 		SPI_MoveByte(EEPROM_WRITE);           
1937  0160 a602          	ld	a,#2
1938  0162 cd0000        	call	_SPI_MoveByte
1940                     ; 178         SPI_MoveByte(HIBYTE(a_intAddr));     
1942  0165 b601          	ld	a,_writeEepromString$L+1
1943  0167 a4ff          	and	a,#255
1944  0169 cd0000        	call	_SPI_MoveByte
1946                     ; 179 		SPI_MoveByte(LOBYTE(a_intAddr));  
1948  016c b602          	ld	a,_writeEepromString$L+2
1949  016e cd0000        	call	_SPI_MoveByte
1951                     ; 180 		a_intAddr++;
1953  0171 3c02          	inc	_writeEepromString$L+2
1954  0173 2602          	jrne	L61
1955  0175 3c01          	inc	_writeEepromString$L+1
1956  0177               L61:
1957                     ; 183 		SPI_MoveByte((BYTE)a_strBuffer[i]);      
1959  0177 befe          	ld	x,_writeEepromString$L-2
1960  0179 92d603        	ld	a,([_writeEepromString$L+3.w],x)
1961  017c cd0000        	call	_SPI_MoveByte
1963                     ; 185 		eepromSelection(EEPROM_ADR_NONE);
1965  017f a6ff          	ld	a,#255
1966  0181 cd0074        	call	_eepromSelection
1968  0184               L3311:
1969                     ; 191 			eepromSelection(a_byEeprom);
1971  0184 b600          	ld	a,_writeEepromString$L
1972  0186 cd0074        	call	_eepromSelection
1974                     ; 192 			SPI_MoveByte(EEPROM_RDSR);      
1976  0189 a605          	ld	a,#5
1977  018b cd0000        	call	_SPI_MoveByte
1979                     ; 193 			byReadValue = SPI_MoveByte(SPI_DUMMY);
1981  018e a60b          	ld	a,#11
1982  0190 cd0000        	call	_SPI_MoveByte
1984  0193 b7ff          	ld	_writeEepromString$L-1,a
1985                     ; 194 			eepromSelection(EEPROM_ADR_NONE);
1987  0195 a6ff          	ld	a,#255
1988  0197 cd0074        	call	_eepromSelection
1990                     ; 195 		} while ((byReadValue & EEPROM_WIP) > 0);  
1992  019a b6ff          	ld	a,_writeEepromString$L-1
1993  019c a501          	bcp	a,#1
1994  019e 26e4          	jrne	L3311
1995                     ; 197 	}while (a_strBuffer[i++] != 0x00);
1997  01a0 befe          	ld	x,_writeEepromString$L-2
1998  01a2 3cfe          	inc	_writeEepromString$L-2
1999  01a4 92d603        	ld	a,([_writeEepromString$L+3.w],x)
2000  01a7 4d            	tnz	a
2001  01a8 26a2          	jrne	L5211
2002                     ; 199 }
2005  01aa 81            	ret
2086                     ; 203 void writeEeprom(BYTE a_byEeprom, WORD a_intAddr, WORD a_intLength, BYTE * a_strBuffer)
2086                     ; 204 {
2087                     	switch	.text
2089                     	xref.b	_writeEeprom$L
2090  01ab               _writeEeprom:
2092  01ab b700          	ld	_writeEeprom$L,a
2094                     ; 205     BYTE i 				= 0x00; 
2096  01ad 3ffe          	clr	_writeEeprom$L-2
2097                     ; 206 	BYTE byReadValue 	= 0x00;	
2099  01af 3fff          	clr	_writeEeprom$L-1
2100  01b1               L3021:
2101                     ; 212 		eepromSelection(a_byEeprom);
2103  01b1 b600          	ld	a,_writeEeprom$L
2104  01b3 cd0074        	call	_eepromSelection
2106                     ; 213 		SPI_MoveByte(EEPROM_WREN);                
2108  01b6 a606          	ld	a,#6
2109  01b8 cd0000        	call	_SPI_MoveByte
2111                     ; 214 		eepromSelection(EEPROM_ADR_NONE);
2113  01bb a6ff          	ld	a,#255
2114  01bd cd0074        	call	_eepromSelection
2116                     ; 219 		eepromSelection(a_byEeprom);
2118  01c0 b600          	ld	a,_writeEeprom$L
2119  01c2 cd0074        	call	_eepromSelection
2121                     ; 220 		SPI_MoveByte(EEPROM_WRITE);           
2123  01c5 a602          	ld	a,#2
2124  01c7 cd0000        	call	_SPI_MoveByte
2126                     ; 223         SPI_MoveByte(HIBYTE(a_intAddr));     
2128  01ca b601          	ld	a,_writeEeprom$L+1
2129  01cc a4ff          	and	a,#255
2130  01ce cd0000        	call	_SPI_MoveByte
2132                     ; 224 		SPI_MoveByte(LOBYTE(a_intAddr));  
2134  01d1 b602          	ld	a,_writeEeprom$L+2
2135  01d3 cd0000        	call	_SPI_MoveByte
2137                     ; 225 		a_intAddr++;
2139  01d6 3c02          	inc	_writeEeprom$L+2
2140  01d8 2602          	jrne	L22
2141  01da 3c01          	inc	_writeEeprom$L+1
2142  01dc               L22:
2143                     ; 228 		SPI_MoveByte((BYTE)a_strBuffer[i]);      
2145  01dc befe          	ld	x,_writeEeprom$L-2
2146  01de 92d605        	ld	a,([_writeEeprom$L+5.w],x)
2147  01e1 cd0000        	call	_SPI_MoveByte
2149                     ; 230 		eepromSelection(EEPROM_ADR_NONE);
2151  01e4 a6ff          	ld	a,#255
2152  01e6 cd0074        	call	_eepromSelection
2154  01e9               L1121:
2155                     ; 236 			eepromSelection(a_byEeprom);
2157  01e9 b600          	ld	a,_writeEeprom$L
2158  01eb cd0074        	call	_eepromSelection
2160                     ; 237 			SPI_MoveByte(EEPROM_RDSR);      
2162  01ee a605          	ld	a,#5
2163  01f0 cd0000        	call	_SPI_MoveByte
2165                     ; 238 			byReadValue = SPI_MoveByte(SPI_DUMMY);
2167  01f3 a60b          	ld	a,#11
2168  01f5 cd0000        	call	_SPI_MoveByte
2170  01f8 b7ff          	ld	_writeEeprom$L-1,a
2171                     ; 239 			eepromSelection(EEPROM_ADR_NONE);
2173  01fa a6ff          	ld	a,#255
2174  01fc cd0074        	call	_eepromSelection
2176                     ; 240 		} while ((byReadValue & EEPROM_WIP) > 0);  
2178  01ff b6ff          	ld	a,_writeEeprom$L-1
2179  0201 a501          	bcp	a,#1
2180  0203 26e4          	jrne	L1121
2181                     ; 242 		i++;
2183  0205 3cfe          	inc	_writeEeprom$L-2
2184                     ; 243 	}while (i<a_intLength);
2186  0207 b6fe          	ld	a,_writeEeprom$L-2
2187  0209 5f            	clr	x
2188  020a b004          	sub	a,_writeEeprom$L+4
2189  020c 9f            	ld	a,x
2190  020d b203          	sbc	a,_writeEeprom$L+3
2191  020f 25a0          	jrult	L3021
2192                     ; 245 }
2195  0211 81            	ret
2259                     ; 248 BYTE * readEepromString(BYTE a_byEeprom, WORD a_intAddr, BYTE * a_strBuffer)
2259                     ; 249 {
2260                     	switch	.text
2262                     	xref.b	_readEepromString$L
2263  0212               _readEepromString:
2265  0212 b700          	ld	_readEepromString$L,a
2267                     ; 250     BYTE ucIndex		= 0x00; 
2269  0214 3fff          	clr	_readEepromString$L-1
2271  0216               L5521:
2272                     ; 252 	while(ucIndex==0){};
2274  0216 3dff          	tnz	_readEepromString$L-1
2275  0218 27fc          	jreq	L5521
2276                     ; 254 	eepromSelection(a_byEeprom);
2279  021a b600          	ld	a,_readEepromString$L
2280  021c cd0074        	call	_eepromSelection
2282                     ; 257 	SPI_MoveByte(EEPROM_READ);    
2284  021f a603          	ld	a,#3
2285  0221 cd0000        	call	_SPI_MoveByte
2287                     ; 260 	SPI_MoveByte(HIBYTE(a_intAddr));     
2289  0224 b601          	ld	a,_readEepromString$L+1
2290  0226 a4ff          	and	a,#255
2291  0228 cd0000        	call	_SPI_MoveByte
2293                     ; 261 	SPI_MoveByte(LOBYTE(a_intAddr));     
2295  022b b602          	ld	a,_readEepromString$L+2
2296  022d cd0000        	call	_SPI_MoveByte
2298  0230               L1621:
2299                     ; 266 		a_strBuffer[ucIndex] = SPI_MoveByte(SPI_DUMMY);
2301  0230 a60b          	ld	a,#11
2302  0232 cd0000        	call	_SPI_MoveByte
2304  0235 beff          	ld	x,_readEepromString$L-1
2305  0237 92d703        	ld	([_readEepromString$L+3.w],x),a
2306                     ; 267 	} while((a_strBuffer[ucIndex++] != 0x00) && (ucIndex<SPI_MAX_LENGTH));
2308  023a beff          	ld	x,_readEepromString$L-1
2309  023c 3cff          	inc	_readEepromString$L-1
2310  023e 92d603        	ld	a,([_readEepromString$L+3.w],x)
2311  0241 4d            	tnz	a
2312  0242 2706          	jreq	L7621
2314  0244 b6ff          	ld	a,_readEepromString$L-1
2315  0246 a180          	cp	a,#128
2316  0248 25e6          	jrult	L1621
2317  024a               L7621:
2318                     ; 269 	a_strBuffer[SPI_MAX_LENGTH-1] = EEPROM_EOF;
2320  024a ae7f          	ld	x,#127
2321  024c a6ff          	ld	a,#255
2322  024e 92d703        	ld	([_readEepromString$L+3.w],x),a
2323                     ; 270 	eepromSelection(EEPROM_ADR_NONE);
2325  0251 a6ff          	ld	a,#255
2326  0253 cd0074        	call	_eepromSelection
2328                     ; 272 	return a_strBuffer + ucIndex;
2330  0256 b604          	ld	a,_readEepromString$L+4
2331  0258 be03          	ld	x,_readEepromString$L+3
2332  025a bbff          	add	a,_readEepromString$L-1
2333  025c 2401          	jrnc	L62
2334  025e 5c            	inc	x
2335  025f               L62:
2338  025f 81            	ret
2410                     ; 276 void readEeprom(BYTE a_byEeprom, WORD a_intAddr, WORD a_intLength, BYTE * a_strBuffer)
2410                     ; 277 {
2411                     	switch	.text
2413                     	xref.b	_readEeprom$L
2414  0260               _readEeprom:
2416  0260 b700          	ld	_readEeprom$L,a
2418                     ; 278     WORD woIndex		= 0x00; 
2420  0262 3ffe          	clr	_readEeprom$L-2
2421  0264 3fff          	clr	_readEeprom$L-1
2422                     ; 280 	eepromSelection(a_byEeprom);
2424  0266 b600          	ld	a,_readEeprom$L
2425  0268 cd0074        	call	_eepromSelection
2427                     ; 283 	SPI_MoveByte(EEPROM_READ);    
2429  026b a603          	ld	a,#3
2430  026d cd0000        	call	_SPI_MoveByte
2432                     ; 286 	SPI_MoveByte(HIBYTE(a_intAddr));     
2434  0270 b601          	ld	a,_readEeprom$L+1
2435  0272 a4ff          	and	a,#255
2436  0274 cd0000        	call	_SPI_MoveByte
2438                     ; 287 	SPI_MoveByte(LOBYTE(a_intAddr));     
2440  0277 b602          	ld	a,_readEeprom$L+2
2441  0279 cd0000        	call	_SPI_MoveByte
2443  027c               L7231:
2444                     ; 292 		a_strBuffer[woIndex] = SPI_MoveByte(SPI_DUMMY);
2446  027c b606          	ld	a,_readEeprom$L+6
2447  027e be05          	ld	x,_readEeprom$L+5
2448  0280 bbff          	add	a,_readEeprom$L-1
2449  0282 88            	push	a
2450  0283 9f            	ld	a,x
2451  0284 b9fe          	adc	a,_readEeprom$L-2
2452  0286 97            	ld	x,a
2453  0287 84            	pop	a
2454  0288 bf00          	ld	c_x,x
2455  028a 97            	ld	x,a
2456  028b 89            	push	x
2457  028c be00          	ld	x,c_x
2458  028e 89            	push	x
2459  028f a60b          	ld	a,#11
2460  0291 cd0000        	call	_SPI_MoveByte
2462  0294 85            	pop	x
2463  0295 bf00          	ld	c_x,x
2464  0297 85            	pop	x
2465  0298 bf01          	ld	c_x+1,x
2466  029a 92c700        	ld	[c_x.w],a
2467                     ; 293 		woIndex++;
2469  029d 3cff          	inc	_readEeprom$L-1
2470  029f 2602          	jrne	L23
2471  02a1 3cfe          	inc	_readEeprom$L-2
2472  02a3               L23:
2473                     ; 294 	} while(woIndex<a_intLength);
2475  02a3 b6ff          	ld	a,_readEeprom$L-1
2476  02a5 b004          	sub	a,_readEeprom$L+4
2477  02a7 b6fe          	ld	a,_readEeprom$L-2
2478  02a9 b203          	sbc	a,_readEeprom$L+3
2479  02ab 25cf          	jrult	L7231
2480                     ; 296 	eepromSelection(EEPROM_ADR_NONE);
2482  02ad a6ff          	ld	a,#255
2483  02af cd0074        	call	_eepromSelection
2485                     ; 297 }
2488  02b2 81            	ret
2560                     ; 300 BYTE * readEepromMessage(BYTE a_byEeprom, BYTE a_byMessageID, BYTE a_byLanguageID, BYTE * a_strBuffer)
2560                     ; 301 {
2561                     	switch	.text
2563                     	xref.b	_readEepromMessage$L
2564  02b3               _readEepromMessage:
2566  02b3 b701          	ld	_readEepromMessage$L+1,a
2567  02b5 bf00          	ld	_readEepromMessage$L,x
2569                     ; 302 	WORD woAddress = 0x0000;
2571  02b7 3ffe          	clr	_readEepromMessage$L-2
2572  02b9 3fff          	clr	_readEepromMessage$L-1
2573                     ; 304 	if (a_byMessageID<EEPROM_MIN_INDEX_NORMAL)
2575  02bb b601          	ld	a,_readEepromMessage$L+1
2576  02bd a144          	cp	a,#68
2577  02bf 241f          	jruge	L3731
2578                     ; 306 		woAddress	= EEPROM_INITIAL_OFFSET + (a_byLanguageID*EEPROM_LANGUAGE_LENGTH) + ((WORD)a_byMessageID * (WORD)EEPROM_MSG_LENGTH_SHORT);
2580  02c1 b601          	ld	a,_readEepromMessage$L+1
2581  02c3 ae10          	ld	x,#16
2582  02c5 42            	mul	x,a
2583  02c6 b7fd          	ld	_readEepromMessage$L-3,a
2584  02c8 bffc          	ld	_readEepromMessage$L-4,x
2585  02ca b602          	ld	a,_readEepromMessage$L+2
2586  02cc 5f            	clr	x
2587  02cd 48            	sll	a
2588  02ce 48            	sll	a
2589  02cf 48            	sll	a
2590  02d0 97            	ld	x,a
2591  02d1 4f            	clr	a
2592  02d2 bbfd          	add	a,_readEepromMessage$L-3
2593  02d4 88            	push	a
2594  02d5 9f            	ld	a,x
2595  02d6 b9fc          	adc	a,_readEepromMessage$L-4
2596  02d8 97            	ld	x,a
2597  02d9 84            	pop	a
2598  02da b7ff          	ld	_readEepromMessage$L-1,a
2599  02dc bffe          	ld	_readEepromMessage$L-2,x
2601  02de 2032          	jra	L5731
2602  02e0               L3731:
2603                     ; 310 		woAddress	= (EEPROM_MSG_LENGTH_SHORT*EEPROM_MIN_INDEX_NORMAL) + EEPROM_INITIAL_OFFSET + (a_byLanguageID*EEPROM_LANGUAGE_LENGTH) + ((WORD)(a_byMessageID-EEPROM_MIN_INDEX_NORMAL) * (WORD)EEPROM_MSG_LENGTH_NORMAL);
2605  02e0 b601          	ld	a,_readEepromMessage$L+1
2606  02e2 5f            	clr	x
2607  02e3 a044          	sub	a,#68
2608  02e5 2401          	jrnc	L63
2609  02e7 5a            	dec	x
2610  02e8               L63:
2611  02e8 48            	sll	a
2612  02e9 59            	rlc	x
2613  02ea 48            	sll	a
2614  02eb 59            	rlc	x
2615  02ec 48            	sll	a
2616  02ed 59            	rlc	x
2617  02ee 48            	sll	a
2618  02ef 59            	rlc	x
2619  02f0 48            	sll	a
2620  02f1 59            	rlc	x
2621  02f2 b7fd          	ld	_readEepromMessage$L-3,a
2622  02f4 bffc          	ld	_readEepromMessage$L-4,x
2623  02f6 b602          	ld	a,_readEepromMessage$L+2
2624  02f8 5f            	clr	x
2625  02f9 48            	sll	a
2626  02fa 48            	sll	a
2627  02fb 48            	sll	a
2628  02fc 97            	ld	x,a
2629  02fd 4f            	clr	a
2630  02fe bbfd          	add	a,_readEepromMessage$L-3
2631  0300 88            	push	a
2632  0301 9f            	ld	a,x
2633  0302 b9fc          	adc	a,_readEepromMessage$L-4
2634  0304 97            	ld	x,a
2635  0305 84            	pop	a
2636  0306 ab40          	add	a,#64
2637  0308 88            	push	a
2638  0309 9f            	ld	a,x
2639  030a a904          	adc	a,#4
2640  030c 97            	ld	x,a
2641  030d 84            	pop	a
2642  030e b7ff          	ld	_readEepromMessage$L-1,a
2643  0310 bffe          	ld	_readEepromMessage$L-2,x
2644  0312               L5731:
2645                     ; 312 	return readEepromString(a_byEeprom, woAddress, a_strBuffer)-1;
2647  0312 be03          	ld	x,_readEepromMessage$L+3
2648  0314 bf03          	ld	_readEepromString$L+3,x
2649  0316 b604          	ld	a,_readEepromMessage$L+4
2650  0318 b704          	ld	_readEepromString$L+4,a
2651  031a befe          	ld	x,_readEepromMessage$L-2
2652  031c bf01          	ld	_readEepromString$L+1,x
2653  031e b6ff          	ld	a,_readEepromMessage$L-1
2654  0320 b702          	ld	_readEepromString$L+2,a
2655  0322 b600          	ld	a,_readEepromMessage$L
2656  0324 cd0212        	call	_readEepromString
2658  0327 4d            	tnz	a
2659  0328 2601          	jrne	L04
2660  032a 5a            	dec	x
2661  032b               L04:
2662  032b 4a            	dec	a
2665  032c 81            	ret
2677                     	xdef	_eepromSelection
2678                     	xdef	_readEepromMessage
2679                     	xdef	_readEeprom
2680                     	xdef	_writeEeprom
2681                     	xdef	_readEepromString
2682                     	xdef	_writeEepromString
2683                     	xdef	_eepromReset
2684                     	xdef	_eepromInit
2685                     	xref	_SPI_MoveByte
2686                     	xref.b	c_x
2705                     	xref.b	_readEepromString$L
2706                     	end
