   1                     ; C Compiler for ST7 (COSMIC Software)
   2                     ; Generator V4.5.5 - 12 Jan 2006
1309                     ; 9 void eepromInit(void)
1309                     ; 10 {
1310                     	switch	.text
1311  0000               _eepromInit:
1314                     ; 12 	eepromSelection(EEPROM_ADR_00); //Select first eeprom
1316  0000 4f            	clr	a
1317  0001 ad71          	call	_eepromSelection
1319                     ; 13 	SPI_MoveByte(EEPROM_WRSR);		//access the EEPROM register
1321  0003 a601          	ld	a,#1
1322  0005 cd0000        	call	_SPI_MoveByte
1324                     ; 14 	SPI_MoveByte((BYTE)0xF0);  		//clear all flags in the EEPROM registers
1326  0008 a6f0          	ld	a,#240
1327  000a cd0000        	call	_SPI_MoveByte
1329                     ; 16 	eepromSelection(EEPROM_ADR_01); //Select second eeprom
1331  000d a601          	ld	a,#1
1332  000f ad63          	call	_eepromSelection
1334                     ; 17 	SPI_MoveByte(EEPROM_WRSR);		//access the EEPROM register
1336  0011 a601          	ld	a,#1
1337  0013 cd0000        	call	_SPI_MoveByte
1339                     ; 18 	SPI_MoveByte((BYTE)0xF0);  		//clear all flags in the EEPROM registers
1341  0016 a6f0          	ld	a,#240
1342  0018 cd0000        	call	_SPI_MoveByte
1344                     ; 20 	eepromSelection(EEPROM_ADR_02); //Select third eeprom
1346  001b a602          	ld	a,#2
1347  001d ad55          	call	_eepromSelection
1349                     ; 21 	SPI_MoveByte(EEPROM_WRSR);		//access the EEPROM register
1351  001f a601          	ld	a,#1
1352  0021 cd0000        	call	_SPI_MoveByte
1354                     ; 22 	SPI_MoveByte((BYTE)0xF0);  		//clear all flags in the EEPROM registers
1356  0024 a6f0          	ld	a,#240
1357  0026 cd0000        	call	_SPI_MoveByte
1359                     ; 24 	eepromSelection(EEPROM_ADR_03); //Select fourth eeprom
1361  0029 a603          	ld	a,#3
1362  002b ad47          	call	_eepromSelection
1364                     ; 25 	SPI_MoveByte(EEPROM_WRSR);		//access the EEPROM register
1366  002d a601          	ld	a,#1
1367  002f cd0000        	call	_SPI_MoveByte
1369                     ; 26 	SPI_MoveByte((BYTE)0xF0);  		//clear all flags in the EEPROM registers
1371  0032 a6f0          	ld	a,#240
1372  0034 cd0000        	call	_SPI_MoveByte
1374                     ; 28 	eepromSelection(EEPROM_ADR_04); //Select fiveth eeprom
1376  0037 a604          	ld	a,#4
1377  0039 ad39          	call	_eepromSelection
1379                     ; 29 	SPI_MoveByte(EEPROM_WRSR);		//access the EEPROM register
1381  003b a601          	ld	a,#1
1382  003d cd0000        	call	_SPI_MoveByte
1384                     ; 30 	SPI_MoveByte((BYTE)0xF0);  		//clear all flags in the EEPROM registers
1386  0040 a6f0          	ld	a,#240
1387  0042 cd0000        	call	_SPI_MoveByte
1389                     ; 32 	eepromSelection(EEPROM_ADR_05); //Select sixth eeprom
1391  0045 a605          	ld	a,#5
1392  0047 ad2b          	call	_eepromSelection
1394                     ; 33 	SPI_MoveByte(EEPROM_WRSR);		//access the EEPROM register
1396  0049 a601          	ld	a,#1
1397  004b cd0000        	call	_SPI_MoveByte
1399                     ; 34 	SPI_MoveByte((BYTE)0xF0);  		//clear all flags in the EEPROM registers
1401  004e a6f0          	ld	a,#240
1402  0050 cd0000        	call	_SPI_MoveByte
1404                     ; 36 	eepromSelection(EEPROM_ADR_06); //Select seventh eeprom
1406  0053 a606          	ld	a,#6
1407  0055 ad1d          	call	_eepromSelection
1409                     ; 37 	SPI_MoveByte(EEPROM_WRSR);		//access the EEPROM register
1411  0057 a601          	ld	a,#1
1412  0059 cd0000        	call	_SPI_MoveByte
1414                     ; 38 	SPI_MoveByte((BYTE)0xF0);  		//clear all flags in the EEPROM registers
1416  005c a6f0          	ld	a,#240
1417  005e cd0000        	call	_SPI_MoveByte
1419                     ; 40 	eepromSelection(EEPROM_ADR_07); //Select eightth eeprom
1421  0061 a607          	ld	a,#7
1422  0063 ad0f          	call	_eepromSelection
1424                     ; 41 	SPI_MoveByte(EEPROM_WRSR);		//access the EEPROM register
1426  0065 a601          	ld	a,#1
1427  0067 cd0000        	call	_SPI_MoveByte
1429                     ; 42 	SPI_MoveByte((BYTE)0xF0);  		//clear all flags in the EEPROM registers
1431  006a a6f0          	ld	a,#240
1432  006c cd0000        	call	_SPI_MoveByte
1434                     ; 45 	eepromSelection(EEPROM_ADR_NONE);
1436  006f a6ff          	ld	a,#255
1437  0071 ad01          	call	_eepromSelection
1439                     ; 46 }
1442  0073 81            	ret
1476                     ; 49 void eepromSelection(BYTE a_byEeprom)
1476                     ; 50 {
1477                     	switch	.text
1479                     	xref.b	_eepromSelection$L
1480  0074               _eepromSelection:
1483                     ; 54 	switch (a_byEeprom)
1486                     ; 102 			break;
1488  0074 4d            	tnz	a
1489  0075 271b          	jreq	L147
1490  0077 4a            	dec	a
1491  0078 2720          	jreq	L347
1492  007a 4a            	dec	a
1493  007b 2725          	jreq	L547
1494  007d 4a            	dec	a
1495  007e 272a          	jreq	L747
1496  0080 4a            	dec	a
1497  0081 272f          	jreq	L157
1498  0083 4a            	dec	a
1499  0084 2734          	jreq	L357
1500  0086 4a            	dec	a
1501  0087 2739          	jreq	L557
1502  0089 4a            	dec	a
1503  008a 273e          	jreq	L757
1504  008c a0f8          	sub	a,#248
1505  008e 2742          	jreq	L167
1506  0090 2049          	jra	L3001
1507  0092               L147:
1508                     ; 56 		case EEPROM_ADR_00:
1508                     ; 57 			_bres(_Pa_Select_UA, _Pin_Select_UA);
1510  0092 1115          	bres	_PHDR,#0
1511                     ; 58 			_bres(_Pa_Select_UB, _Pin_Select_UB);
1513  0094 1315          	bres	_PHDR,#1
1514                     ; 59 			_bres(_Pa_Select_UC, _Pin_Select_UC);
1516  0096 1515          	bres	_PHDR,#2
1517                     ; 60 			break;
1519  0098 2041          	jra	L3001
1520  009a               L347:
1521                     ; 61 		case EEPROM_ADR_01:
1521                     ; 62 			_bset(_Pa_Select_UA, _Pin_Select_UA);
1523  009a 1015          	bset	_PHDR,#0
1524                     ; 63 			_bres(_Pa_Select_UB, _Pin_Select_UB);
1526  009c 1315          	bres	_PHDR,#1
1527                     ; 64 			_bres(_Pa_Select_UC, _Pin_Select_UC);
1529  009e 1515          	bres	_PHDR,#2
1530                     ; 65 			break;
1532  00a0 2039          	jra	L3001
1533  00a2               L547:
1534                     ; 66 		case EEPROM_ADR_02:
1534                     ; 67 			_bres(_Pa_Select_UA, _Pin_Select_UA);
1536  00a2 1115          	bres	_PHDR,#0
1537                     ; 68 			_bset(_Pa_Select_UB, _Pin_Select_UB);
1539  00a4 1215          	bset	_PHDR,#1
1540                     ; 69 			_bres(_Pa_Select_UC, _Pin_Select_UC);
1542  00a6 1515          	bres	_PHDR,#2
1543                     ; 70 			break;
1545  00a8 2031          	jra	L3001
1546  00aa               L747:
1547                     ; 71 		case EEPROM_ADR_03:
1547                     ; 72 			_bset(_Pa_Select_UA, _Pin_Select_UA);
1549  00aa 1015          	bset	_PHDR,#0
1550                     ; 73 			_bset(_Pa_Select_UB, _Pin_Select_UB);
1552  00ac 1215          	bset	_PHDR,#1
1553                     ; 74 			_bres(_Pa_Select_UC, _Pin_Select_UC);
1555  00ae 1515          	bres	_PHDR,#2
1556                     ; 75 			break;
1558  00b0 2029          	jra	L3001
1559  00b2               L157:
1560                     ; 76 		case EEPROM_ADR_04:
1560                     ; 77 			_bres(_Pa_Select_UA, _Pin_Select_UA);
1562  00b2 1115          	bres	_PHDR,#0
1563                     ; 78 			_bres(_Pa_Select_UB, _Pin_Select_UB);
1565  00b4 1315          	bres	_PHDR,#1
1566                     ; 79 			_bset(_Pa_Select_UC, _Pin_Select_UC);
1568  00b6 1415          	bset	_PHDR,#2
1569                     ; 80 			break;
1571  00b8 2021          	jra	L3001
1572  00ba               L357:
1573                     ; 81 		case EEPROM_ADR_05:
1573                     ; 82 			_bset(_Pa_Select_UA, _Pin_Select_UA);
1575  00ba 1015          	bset	_PHDR,#0
1576                     ; 83 			_bres(_Pa_Select_UB, _Pin_Select_UB);
1578  00bc 1315          	bres	_PHDR,#1
1579                     ; 84 			_bset(_Pa_Select_UC, _Pin_Select_UC);
1581  00be 1415          	bset	_PHDR,#2
1582                     ; 85 			break;
1584  00c0 2019          	jra	L3001
1585  00c2               L557:
1586                     ; 86 		case EEPROM_ADR_06:
1586                     ; 87 			_bres(_Pa_Select_UA, _Pin_Select_UA);
1588  00c2 1115          	bres	_PHDR,#0
1589                     ; 88 			_bset(_Pa_Select_UB, _Pin_Select_UB);
1591  00c4 1215          	bset	_PHDR,#1
1592                     ; 89 			_bset(_Pa_Select_UC, _Pin_Select_UC);
1594  00c6 1415          	bset	_PHDR,#2
1595                     ; 90 			break;
1597  00c8 2011          	jra	L3001
1598  00ca               L757:
1599                     ; 91 		case EEPROM_ADR_07:
1599                     ; 92 			_bset(_Pa_Select_UA, _Pin_Select_UA);
1601  00ca 1015          	bset	_PHDR,#0
1602                     ; 93 			_bset(_Pa_Select_UB, _Pin_Select_UB);
1604  00cc 1215          	bset	_PHDR,#1
1605                     ; 94 			_bset(_Pa_Select_UC, _Pin_Select_UC);
1607  00ce 1415          	bset	_PHDR,#2
1608                     ; 95 			break;
1610  00d0 2009          	jra	L3001
1611  00d2               L167:
1612                     ; 96 		case EEPROM_ADR_NONE:
1612                     ; 97 			_bres(_Pa_Select_UA, _Pin_Select_UA);
1614  00d2 1115          	bres	_PHDR,#0
1615                     ; 98 			_bres(_Pa_Select_UB, _Pin_Select_UB);
1617  00d4 1315          	bres	_PHDR,#1
1618                     ; 99 			_bres(_Pa_Select_UC, _Pin_Select_UC);		
1620  00d6 1515          	bres	_PHDR,#2
1621                     ; 100 			_bres(_Pa_Select_U1, _Pin_Select_U1);
1623  00d8 1715          	bres	_PHDR,#3
1624                     ; 101 			return;
1627  00da 81            	ret
1628  00db               L3001:
1629                     ; 105 	_bset(_Pa_Select_U1, _Pin_Select_U1);
1631  00db 1615          	bset	_PHDR,#3
1632                     ; 107 }
1635  00dd 81            	ret
1707                     ; 110 void writeEepromString(BYTE a_byEeprom, WORD a_intAddr, BYTE * a_strBuffer)
1707                     ; 111 {
1708                     	switch	.text
1710                     	xref.b	_writeEepromString$L
1711  00de               _writeEepromString:
1713  00de b700          	ld	_writeEepromString$L,a
1715                     ; 112     BYTE i 				= 0x00; 
1717  00e0 3ffe          	clr	_writeEepromString$L-2
1718                     ; 113 	BYTE ucReadValue 	= 0x00;	
1720  00e2 3fff          	clr	_writeEepromString$L-1
1721  00e4               L3401:
1722                     ; 119 		eepromSelection(a_byEeprom);
1724  00e4 b600          	ld	a,_writeEepromString$L
1725  00e6 ad8c          	call	_eepromSelection
1727                     ; 120 		SPI_MoveByte(EEPROM_WREN);                
1729  00e8 a606          	ld	a,#6
1730  00ea cd0000        	call	_SPI_MoveByte
1732                     ; 121 		eepromSelection(EEPROM_ADR_NONE);
1734  00ed a6ff          	ld	a,#255
1735  00ef ad83          	call	_eepromSelection
1737                     ; 126 		eepromSelection(a_byEeprom);
1739  00f1 b600          	ld	a,_writeEepromString$L
1740  00f3 cd0074        	call	_eepromSelection
1742                     ; 127 		SPI_MoveByte(EEPROM_WRITE);           
1744  00f6 a602          	ld	a,#2
1745  00f8 cd0000        	call	_SPI_MoveByte
1747                     ; 130         SPI_MoveByte(HIBYTE(a_intAddr));     
1749  00fb b601          	ld	a,_writeEepromString$L+1
1750  00fd a4ff          	and	a,#255
1751  00ff cd0000        	call	_SPI_MoveByte
1753                     ; 131 		SPI_MoveByte(LOBYTE(a_intAddr));  
1755  0102 b602          	ld	a,_writeEepromString$L+2
1756  0104 cd0000        	call	_SPI_MoveByte
1758                     ; 132 		a_intAddr++;
1760  0107 3c02          	inc	_writeEepromString$L+2
1761  0109 2602          	jrne	L21
1762  010b 3c01          	inc	_writeEepromString$L+1
1763  010d               L21:
1764                     ; 135 		SPI_MoveByte((BYTE)a_strBuffer[i]);      
1766  010d befe          	ld	x,_writeEepromString$L-2
1767  010f 92d603        	ld	a,([_writeEepromString$L+3.w],x)
1768  0112 cd0000        	call	_SPI_MoveByte
1770                     ; 137 		eepromSelection(EEPROM_ADR_NONE);
1772  0115 a6ff          	ld	a,#255
1773  0117 cd0074        	call	_eepromSelection
1775  011a               L1501:
1776                     ; 143 			eepromSelection(a_byEeprom);
1778  011a b600          	ld	a,_writeEepromString$L
1779  011c cd0074        	call	_eepromSelection
1781                     ; 144 			SPI_MoveByte(EEPROM_RDSR);      
1783  011f a605          	ld	a,#5
1784  0121 cd0000        	call	_SPI_MoveByte
1786                     ; 145 			ucReadValue = SPI_MoveByte(SPI_DUMMY);
1788  0124 a60b          	ld	a,#11
1789  0126 cd0000        	call	_SPI_MoveByte
1791  0129 b7ff          	ld	_writeEepromString$L-1,a
1792                     ; 146 			eepromSelection(EEPROM_ADR_NONE);
1794  012b a6ff          	ld	a,#255
1795  012d cd0074        	call	_eepromSelection
1797                     ; 147 		} while ((ucReadValue & EEPROM_WIP) > 0);  
1799  0130 b6ff          	ld	a,_writeEepromString$L-1
1800  0132 a501          	bcp	a,#1
1801  0134 26e4          	jrne	L1501
1802                     ; 149 	}while (a_strBuffer[i++] != 0x00);
1804  0136 befe          	ld	x,_writeEepromString$L-2
1805  0138 3cfe          	inc	_writeEepromString$L-2
1806  013a 92d603        	ld	a,([_writeEepromString$L+3.w],x)
1807  013d 4d            	tnz	a
1808  013e 26a4          	jrne	L3401
1809                     ; 151 }
1812  0140 81            	ret
1893                     ; 155 void writeEeprom(BYTE a_byEeprom, WORD a_intAddr, WORD a_intLength, BYTE * a_strBuffer)
1893                     ; 156 {
1894                     	switch	.text
1896                     	xref.b	_writeEeprom$L
1897  0141               _writeEeprom:
1899  0141 b700          	ld	_writeEeprom$L,a
1901                     ; 157     BYTE i 				= 0x00; 
1903  0143 3ffe          	clr	_writeEeprom$L-2
1904                     ; 158 	BYTE ucReadValue 	= 0x00;	
1906  0145 3fff          	clr	_writeEeprom$L-1
1907  0147               L1211:
1908                     ; 164 		eepromSelection(a_byEeprom);
1910  0147 b600          	ld	a,_writeEeprom$L
1911  0149 cd0074        	call	_eepromSelection
1913                     ; 165 		SPI_MoveByte(EEPROM_WREN);                
1915  014c a606          	ld	a,#6
1916  014e cd0000        	call	_SPI_MoveByte
1918                     ; 166 		eepromSelection(EEPROM_ADR_NONE);
1920  0151 a6ff          	ld	a,#255
1921  0153 cd0074        	call	_eepromSelection
1923                     ; 171 		eepromSelection(a_byEeprom);
1925  0156 b600          	ld	a,_writeEeprom$L
1926  0158 cd0074        	call	_eepromSelection
1928                     ; 172 		SPI_MoveByte(EEPROM_WRITE);           
1930  015b a602          	ld	a,#2
1931  015d cd0000        	call	_SPI_MoveByte
1933                     ; 175         SPI_MoveByte(HIBYTE(a_intAddr));     
1935  0160 b601          	ld	a,_writeEeprom$L+1
1936  0162 a4ff          	and	a,#255
1937  0164 cd0000        	call	_SPI_MoveByte
1939                     ; 176 		SPI_MoveByte(LOBYTE(a_intAddr));  
1941  0167 b602          	ld	a,_writeEeprom$L+2
1942  0169 cd0000        	call	_SPI_MoveByte
1944                     ; 177 		a_intAddr++;
1946  016c 3c02          	inc	_writeEeprom$L+2
1947  016e 2602          	jrne	L61
1948  0170 3c01          	inc	_writeEeprom$L+1
1949  0172               L61:
1950                     ; 180 		SPI_MoveByte((BYTE)a_strBuffer[i]);      
1952  0172 befe          	ld	x,_writeEeprom$L-2
1953  0174 92d605        	ld	a,([_writeEeprom$L+5.w],x)
1954  0177 cd0000        	call	_SPI_MoveByte
1956                     ; 182 		eepromSelection(EEPROM_ADR_NONE);
1958  017a a6ff          	ld	a,#255
1959  017c cd0074        	call	_eepromSelection
1961  017f               L7211:
1962                     ; 188 			eepromSelection(a_byEeprom);
1964  017f b600          	ld	a,_writeEeprom$L
1965  0181 cd0074        	call	_eepromSelection
1967                     ; 189 			SPI_MoveByte(EEPROM_RDSR);      
1969  0184 a605          	ld	a,#5
1970  0186 cd0000        	call	_SPI_MoveByte
1972                     ; 190 			ucReadValue = SPI_MoveByte(SPI_DUMMY);
1974  0189 a60b          	ld	a,#11
1975  018b cd0000        	call	_SPI_MoveByte
1977  018e b7ff          	ld	_writeEeprom$L-1,a
1978                     ; 191 			eepromSelection(EEPROM_ADR_NONE);
1980  0190 a6ff          	ld	a,#255
1981  0192 cd0074        	call	_eepromSelection
1983                     ; 192 		} while ((ucReadValue & EEPROM_WIP) > 0);  
1985  0195 b6ff          	ld	a,_writeEeprom$L-1
1986  0197 a501          	bcp	a,#1
1987  0199 26e4          	jrne	L7211
1988                     ; 194 		i++;
1990  019b 3cfe          	inc	_writeEeprom$L-2
1991                     ; 195 	}while (i<a_intLength);
1993  019d b6fe          	ld	a,_writeEeprom$L-2
1994  019f 5f            	clr	x
1995  01a0 b004          	sub	a,_writeEeprom$L+4
1996  01a2 9f            	ld	a,x
1997  01a3 b203          	sbc	a,_writeEeprom$L+3
1998  01a5 25a0          	jrult	L1211
1999                     ; 197 }
2002  01a7 81            	ret
2066                     ; 200 BYTE * readEepromString(BYTE a_byEeprom, WORD a_intAddr, BYTE * a_strBuffer)
2066                     ; 201 {
2067                     	switch	.text
2069                     	xref.b	_readEepromString$L
2070  01a8               _readEepromString:
2072  01a8 b700          	ld	_readEepromString$L,a
2074                     ; 202     BYTE ucIndex		= 0x00; 
2076  01aa 3fff          	clr	_readEepromString$L-1
2077                     ; 204 	eepromSelection(a_byEeprom);
2079  01ac b600          	ld	a,_readEepromString$L
2080  01ae cd0074        	call	_eepromSelection
2082                     ; 207 	SPI_MoveByte(EEPROM_READ);    
2084  01b1 a603          	ld	a,#3
2085  01b3 cd0000        	call	_SPI_MoveByte
2087                     ; 210 	SPI_MoveByte(HIBYTE(a_intAddr));     
2089  01b6 b601          	ld	a,_readEepromString$L+1
2090  01b8 a4ff          	and	a,#255
2091  01ba cd0000        	call	_SPI_MoveByte
2093                     ; 211 	SPI_MoveByte(LOBYTE(a_intAddr));     
2095  01bd b602          	ld	a,_readEepromString$L+2
2096  01bf cd0000        	call	_SPI_MoveByte
2098  01c2               L7611:
2099                     ; 216 		a_strBuffer[ucIndex] = SPI_MoveByte(SPI_DUMMY);
2101  01c2 a60b          	ld	a,#11
2102  01c4 cd0000        	call	_SPI_MoveByte
2104  01c7 beff          	ld	x,_readEepromString$L-1
2105  01c9 92d703        	ld	([_readEepromString$L+3.w],x),a
2106                     ; 217 	} while((a_strBuffer[ucIndex++] != 0x00) && (ucIndex<SPI_MAX_LENGTH));
2108  01cc beff          	ld	x,_readEepromString$L-1
2109  01ce 3cff          	inc	_readEepromString$L-1
2110  01d0 92d603        	ld	a,([_readEepromString$L+3.w],x)
2111  01d3 4d            	tnz	a
2112  01d4 2706          	jreq	L5711
2114  01d6 b6ff          	ld	a,_readEepromString$L-1
2115  01d8 a180          	cp	a,#128
2116  01da 25e6          	jrult	L7611
2117  01dc               L5711:
2118                     ; 219 	a_strBuffer[SPI_MAX_LENGTH-1] = EEPROM_EOF;
2120  01dc ae7f          	ld	x,#127
2121  01de a6ff          	ld	a,#255
2122  01e0 92d703        	ld	([_readEepromString$L+3.w],x),a
2123                     ; 220 	eepromSelection(EEPROM_ADR_NONE);
2125  01e3 a6ff          	ld	a,#255
2126  01e5 cd0074        	call	_eepromSelection
2128                     ; 222 	return a_strBuffer + ucIndex;
2130  01e8 b604          	ld	a,_readEepromString$L+4
2131  01ea be03          	ld	x,_readEepromString$L+3
2132  01ec bbff          	add	a,_readEepromString$L-1
2133  01ee 2401          	jrnc	L22
2134  01f0 5c            	inc	x
2135  01f1               L22:
2138  01f1 81            	ret
2210                     ; 226 void readEeprom(BYTE a_byEeprom, WORD a_intAddr, WORD a_intLength, BYTE * a_strBuffer)
2210                     ; 227 {
2211                     	switch	.text
2213                     	xref.b	_readEeprom$L
2214  01f2               _readEeprom:
2216  01f2 b700          	ld	_readEeprom$L,a
2218                     ; 228     WORD woIndex		= 0x00; 
2220  01f4 3ffe          	clr	_readEeprom$L-2
2221  01f6 3fff          	clr	_readEeprom$L-1
2222                     ; 230 	eepromSelection(a_byEeprom);
2224  01f8 b600          	ld	a,_readEeprom$L
2225  01fa cd0074        	call	_eepromSelection
2227                     ; 233 	SPI_MoveByte(EEPROM_READ);    
2229  01fd a603          	ld	a,#3
2230  01ff cd0000        	call	_SPI_MoveByte
2232                     ; 236 	SPI_MoveByte(HIBYTE(a_intAddr));     
2234  0202 b601          	ld	a,_readEeprom$L+1
2235  0204 a4ff          	and	a,#255
2236  0206 cd0000        	call	_SPI_MoveByte
2238                     ; 237 	SPI_MoveByte(LOBYTE(a_intAddr));     
2240  0209 b602          	ld	a,_readEeprom$L+2
2241  020b cd0000        	call	_SPI_MoveByte
2243  020e               L5321:
2244                     ; 242 		a_strBuffer[woIndex] = SPI_MoveByte(SPI_DUMMY);
2246  020e b606          	ld	a,_readEeprom$L+6
2247  0210 be05          	ld	x,_readEeprom$L+5
2248  0212 bbff          	add	a,_readEeprom$L-1
2249  0214 88            	push	a
2250  0215 9f            	ld	a,x
2251  0216 b9fe          	adc	a,_readEeprom$L-2
2252  0218 97            	ld	x,a
2253  0219 84            	pop	a
2254  021a bf00          	ld	c_x,x
2255  021c 97            	ld	x,a
2256  021d 89            	push	x
2257  021e be00          	ld	x,c_x
2258  0220 89            	push	x
2259  0221 a60b          	ld	a,#11
2260  0223 cd0000        	call	_SPI_MoveByte
2262  0226 85            	pop	x
2263  0227 bf00          	ld	c_x,x
2264  0229 85            	pop	x
2265  022a bf01          	ld	c_x+1,x
2266  022c 92c700        	ld	[c_x.w],a
2267                     ; 243 		woIndex++;
2269  022f 3cff          	inc	_readEeprom$L-1
2270  0231 2602          	jrne	L62
2271  0233 3cfe          	inc	_readEeprom$L-2
2272  0235               L62:
2273                     ; 244 	} while(woIndex<a_intLength);
2275  0235 b6ff          	ld	a,_readEeprom$L-1
2276  0237 b004          	sub	a,_readEeprom$L+4
2277  0239 b6fe          	ld	a,_readEeprom$L-2
2278  023b b203          	sbc	a,_readEeprom$L+3
2279  023d 25cf          	jrult	L5321
2280                     ; 246 	eepromSelection(EEPROM_ADR_NONE);
2282  023f a6ff          	ld	a,#255
2283  0241 cd0074        	call	_eepromSelection
2285                     ; 247 }
2288  0244 81            	ret
2360                     ; 250 BYTE * readEepromMessage(BYTE a_byEeprom, BYTE a_byMessageID, BYTE a_byLanguageID, BYTE * a_strBuffer)
2360                     ; 251 {
2361                     	switch	.text
2363                     	xref.b	_readEepromMessage$L
2364  0245               _readEepromMessage:
2366  0245 b701          	ld	_readEepromMessage$L+1,a
2367  0247 bf00          	ld	_readEepromMessage$L,x
2369                     ; 252 	WORD woAddress = 0x0000;
2371  0249 3ffe          	clr	_readEepromMessage$L-2
2372  024b 3fff          	clr	_readEepromMessage$L-1
2373                     ; 254 	if (a_byMessageID<EEPROM_MIN_INDEX_NORMAL)
2375  024d b601          	ld	a,_readEepromMessage$L+1
2376  024f a144          	cp	a,#68
2377  0251 241f          	jruge	L1031
2378                     ; 256 		woAddress	= EEPROM_INITIAL_OFFSET + (a_byLanguageID*EEPROM_LANGUAGE_LENGTH) + ((WORD)a_byMessageID * (WORD)EEPROM_MSG_LENGTH_SHORT);
2380  0253 b601          	ld	a,_readEepromMessage$L+1
2381  0255 ae10          	ld	x,#16
2382  0257 42            	mul	x,a
2383  0258 b7fd          	ld	_readEepromMessage$L-3,a
2384  025a bffc          	ld	_readEepromMessage$L-4,x
2385  025c b602          	ld	a,_readEepromMessage$L+2
2386  025e 5f            	clr	x
2387  025f 48            	sll	a
2388  0260 48            	sll	a
2389  0261 48            	sll	a
2390  0262 97            	ld	x,a
2391  0263 4f            	clr	a
2392  0264 bbfd          	add	a,_readEepromMessage$L-3
2393  0266 88            	push	a
2394  0267 9f            	ld	a,x
2395  0268 b9fc          	adc	a,_readEepromMessage$L-4
2396  026a 97            	ld	x,a
2397  026b 84            	pop	a
2398  026c b7ff          	ld	_readEepromMessage$L-1,a
2399  026e bffe          	ld	_readEepromMessage$L-2,x
2401  0270 2032          	jra	L3031
2402  0272               L1031:
2403                     ; 260 		woAddress	= (EEPROM_MSG_LENGTH_SHORT*EEPROM_MIN_INDEX_NORMAL) + EEPROM_INITIAL_OFFSET + (a_byLanguageID*EEPROM_LANGUAGE_LENGTH) + ((WORD)(a_byMessageID-EEPROM_MIN_INDEX_NORMAL) * (WORD)EEPROM_MSG_LENGTH_NORMAL);
2405  0272 b601          	ld	a,_readEepromMessage$L+1
2406  0274 5f            	clr	x
2407  0275 a044          	sub	a,#68
2408  0277 2401          	jrnc	L23
2409  0279 5a            	dec	x
2410  027a               L23:
2411  027a 48            	sll	a
2412  027b 59            	rlc	x
2413  027c 48            	sll	a
2414  027d 59            	rlc	x
2415  027e 48            	sll	a
2416  027f 59            	rlc	x
2417  0280 48            	sll	a
2418  0281 59            	rlc	x
2419  0282 48            	sll	a
2420  0283 59            	rlc	x
2421  0284 b7fd          	ld	_readEepromMessage$L-3,a
2422  0286 bffc          	ld	_readEepromMessage$L-4,x
2423  0288 b602          	ld	a,_readEepromMessage$L+2
2424  028a 5f            	clr	x
2425  028b 48            	sll	a
2426  028c 48            	sll	a
2427  028d 48            	sll	a
2428  028e 97            	ld	x,a
2429  028f 4f            	clr	a
2430  0290 bbfd          	add	a,_readEepromMessage$L-3
2431  0292 88            	push	a
2432  0293 9f            	ld	a,x
2433  0294 b9fc          	adc	a,_readEepromMessage$L-4
2434  0296 97            	ld	x,a
2435  0297 84            	pop	a
2436  0298 ab40          	add	a,#64
2437  029a 88            	push	a
2438  029b 9f            	ld	a,x
2439  029c a904          	adc	a,#4
2440  029e 97            	ld	x,a
2441  029f 84            	pop	a
2442  02a0 b7ff          	ld	_readEepromMessage$L-1,a
2443  02a2 bffe          	ld	_readEepromMessage$L-2,x
2444  02a4               L3031:
2445                     ; 262 	return readEepromString(a_byEeprom, woAddress, a_strBuffer)-1;
2447  02a4 be03          	ld	x,_readEepromMessage$L+3
2448  02a6 bf03          	ld	_readEepromString$L+3,x
2449  02a8 b604          	ld	a,_readEepromMessage$L+4
2450  02aa b704          	ld	_readEepromString$L+4,a
2451  02ac befe          	ld	x,_readEepromMessage$L-2
2452  02ae bf01          	ld	_readEepromString$L+1,x
2453  02b0 b6ff          	ld	a,_readEepromMessage$L-1
2454  02b2 b702          	ld	_readEepromString$L+2,a
2455  02b4 b600          	ld	a,_readEepromMessage$L
2456  02b6 cd01a8        	call	_readEepromString
2458  02b9 4d            	tnz	a
2459  02ba 2601          	jrne	L43
2460  02bc 5a            	dec	x
2461  02bd               L43:
2462  02bd 4a            	dec	a
2465  02be 81            	ret
2477                     	xdef	_eepromSelection
2478                     	xdef	_readEepromMessage
2479                     	xdef	_readEeprom
2480                     	xdef	_writeEeprom
2481                     	xdef	_readEepromString
2482                     	xdef	_writeEepromString
2483                     	xdef	_eepromInit
2484                     	xref	_SPI_MoveByte
2485                     	xref.b	c_x
2504                     	xref.b	_readEepromString$L
2505                     	end
