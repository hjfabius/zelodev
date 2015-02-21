   1                     ; C Compiler for ST7 (COSMIC Software)
   2                     ; Generator V4.5.5 - 12 Jan 2006
1332                     ; 9 BYTE STI_MoveByte (BYTE a_byData)
1332                     ; 10 { 
1333                     	switch	.text
1335                     	xref.b	_STI_MoveByte$L
1336  0000               _STI_MoveByte:
1338  0000 b700          	ld	_STI_MoveByte$L,a
1340                     ; 11 	BYTE 	byCounter 		= 0x00;
1342  0002 3fff          	clr	_STI_MoveByte$L-1
1343                     ; 12 	byCounter = 8;
1345  0004 a608          	ld	a,#8
1346  0006 b7ff          	ld	_STI_MoveByte$L-1,a
1347                     ; 14 	if (m_woTimeout == 0x0000)
1349  0008 c600ca        	ld	a,_m_woTimeout+1
1350  000b 2603          	jrne	L6
1351  000d ce00c9        	ld	x,_m_woTimeout
1352  0010               L6:
1353  0010 2602          	jrne	L357
1354                     ; 16 		return 0x00;
1356  0012 4f            	clr	a
1359  0013 81            	ret
1360  0014               L357:
1361                     ; 19 	for(byCounter=0; byCounter<8; byCounter++)
1363  0014 3fff          	clr	_STI_MoveByte$L-1
1364  0016               L557:
1365                     ; 21 		m_woTimeout = 0x2000;
1367  0016 a620          	ld	a,#32
1368  0018 c700c9        	ld	_m_woTimeout,a
1369  001b 4f            	clr	a
1370  001c c700ca        	ld	_m_woTimeout+1,a
1372  001f 201c          	jra	L767
1373  0021               L367:
1374                     ; 26 			if((--m_woTimeout)==0)
1376  0021 c600ca        	ld	a,_m_woTimeout+1
1377  0024 2607          	jrne	L01
1378  0026 ce00c9        	ld	x,_m_woTimeout
1379  0029 5a            	dec	x
1380  002a cf00c9        	ld	_m_woTimeout,x
1381  002d               L01:
1382  002d 4a            	dec	a
1383  002e c700ca        	ld	_m_woTimeout+1,a
1384  0031 c600ca        	ld	a,_m_woTimeout+1
1385  0034 2603          	jrne	L21
1386  0036 ce00c9        	ld	x,_m_woTimeout
1387  0039               L21:
1388  0039 2602          	jrne	L767
1389                     ; 28 				return 0x00;
1391  003b 4f            	clr	a
1394  003c 81            	ret
1395  003d               L767:
1396                     ; 24 		while(!_btst(_Pa_DDCLK, _Pin_DDCLK))
1398  003d b606          	ld	a,_PCDR
1399  003f a504          	bcp	a,#4
1400  0041 27de          	jreq	L367
1401                     ; 32 		if ((a_byData & 0x80)!=0)
1404  0043 b600          	ld	a,_STI_MoveByte$L
1405  0045 a580          	bcp	a,#128
1406  0047 2704          	jreq	L577
1407                     ; 34 			_bset(_Pa_DDOUT, _Pin_DDOUT);
1409  0049 1612          	bset	_PGDR,#3
1411  004b 2002          	jra	L777
1412  004d               L577:
1413                     ; 38 			_bres(_Pa_DDOUT, _Pin_DDOUT);
1415  004d 1712          	bres	_PGDR,#3
1416  004f               L777:
1417                     ; 40 		a_byData <<= 1;
1419  004f 3800          	sll	_STI_MoveByte$L
1420                     ; 42 		if(_btst(_Pa_DDIN, _Pin_DDIN))
1422  0051 b606          	ld	a,_PCDR
1423  0053 a508          	bcp	a,#8
1424  0055 2702          	jreq	L1001
1425                     ; 44 			a_byData+=1;
1427  0057 3c00          	inc	_STI_MoveByte$L
1428  0059               L1001:
1429                     ; 47 		m_woTimeout = 0x2000;
1431  0059 a620          	ld	a,#32
1432  005b c700c9        	ld	_m_woTimeout,a
1433  005e 4f            	clr	a
1434  005f c700ca        	ld	_m_woTimeout+1,a
1436  0062 201c          	jra	L7001
1437  0064               L3001:
1438                     ; 50 			if((--m_woTimeout)==0)
1440  0064 c600ca        	ld	a,_m_woTimeout+1
1441  0067 2607          	jrne	L41
1442  0069 ce00c9        	ld	x,_m_woTimeout
1443  006c 5a            	dec	x
1444  006d cf00c9        	ld	_m_woTimeout,x
1445  0070               L41:
1446  0070 4a            	dec	a
1447  0071 c700ca        	ld	_m_woTimeout+1,a
1448  0074 c600ca        	ld	a,_m_woTimeout+1
1449  0077 2603          	jrne	L61
1450  0079 ce00c9        	ld	x,_m_woTimeout
1451  007c               L61:
1452  007c 2602          	jrne	L7001
1453                     ; 52 				return 0x00;
1455  007e 4f            	clr	a
1458  007f 81            	ret
1459  0080               L7001:
1460                     ; 48 		while(_btst(_Pa_DDCLK, _Pin_DDCLK))
1462  0080 b606          	ld	a,_PCDR
1463  0082 a504          	bcp	a,#4
1464  0084 26de          	jrne	L3001
1465                     ; 19 	for(byCounter=0; byCounter<8; byCounter++)
1468  0086 3cff          	inc	_STI_MoveByte$L-1
1471  0088 b6ff          	ld	a,_STI_MoveByte$L-1
1472  008a a108          	cp	a,#8
1473  008c 2588          	jrult	L557
1474                     ; 57 	m_arbyValues[m_byIndexValue++] = a_byData;
1476  008e ce0000        	ld	x,_m_byIndexValue
1477  0091 c60000        	ld	a,_m_byIndexValue
1478  0094 ab01          	add	a,#1
1479  0096 c70000        	ld	_m_byIndexValue,a
1480  0099 b600          	ld	a,_STI_MoveByte$L
1481  009b d70001        	ld	(_m_arbyValues,x),a
1482                     ; 59 	if (m_byIndexValue == 200)
1484  009e c60000        	ld	a,_m_byIndexValue
1485  00a1 a1c8          	cp	a,#200
1486  00a3 2604          	jrne	L5101
1487                     ; 60 	m_byIndexValue = 0;
1489  00a5 4f            	clr	a
1490  00a6 c70000        	ld	_m_byIndexValue,a
1491  00a9               L5101:
1492                     ; 61 	return a_byData; 
1494  00a9 b600          	ld	a,_STI_MoveByte$L
1497  00ab 81            	ret
1556                     ; 65 void STI_GetMessage(BYTE * a_byCode, BYTE * a_byAdditionalCode, WORD * a_woValue)
1556                     ; 66 {
1557                     	switch	.text
1559                     	xref.b	_STI_GetMessage$L
1560  00ac               _STI_GetMessage:
1562  00ac b701          	ld	_STI_GetMessage$L+1,a
1563  00ae bf00          	ld	_STI_GetMessage$L,x
1565                     ; 67 	m_woTimeout = 0x0000;
1567  00b0 4f            	clr	a
1568  00b1 c700c9        	ld	_m_woTimeout,a
1569  00b4 c700ca        	ld	_m_woTimeout+1,a
1570  00b7               L5401:
1571                     ; 70 		m_woTimeout = 0x2000;
1573  00b7 a620          	ld	a,#32
1574  00b9 c700c9        	ld	_m_woTimeout,a
1575  00bc 4f            	clr	a
1576  00bd c700ca        	ld	_m_woTimeout+1,a
1577                     ; 71 		_bset(_Pa_Led_D1, _Pin_Led_D1);	
1579  00c0 1e0c          	bset	_PEDR,#7
1580                     ; 72 		_bset(_Pa_DDSEL, _Pin_DDSEL);
1582  00c2 1a00          	bset	_PADR,#5
1583                     ; 73 		_bset(_Pa_DDQUE, _Pin_DDQUE);
1585  00c4 160f          	bset	_PFDR,#3
1586                     ; 75 		(*a_byCode) = STI_MoveByte(0x00);
1588  00c6 4f            	clr	a
1589  00c7 cd0000        	call	_STI_MoveByte
1591  00ca 92c700        	ld	[_STI_GetMessage$L.w],a
1592                     ; 76 		(*a_byAdditionalCode) = STI_MoveByte(0x00);
1594  00cd 4f            	clr	a
1595  00ce cd0000        	call	_STI_MoveByte
1597  00d1 92c702        	ld	[_STI_GetMessage$L+2.w],a
1598                     ; 77 		(*a_woValue) = (STI_MoveByte(0x00)*256);
1600  00d4 4f            	clr	a
1601  00d5 cd0000        	call	_STI_MoveByte
1603  00d8 5f            	clr	x
1604  00d9 97            	ld	x,a
1605  00da 4f            	clr	a
1606  00db 90be04        	ld	y,_STI_GetMessage$L+4
1607  00de 90bf00        	ld	c_y,y
1608  00e1 90be05        	ld	y,_STI_GetMessage$L+5
1609  00e4 cd0000        	call	c_putw
1611                     ; 78 		(*a_woValue) += STI_MoveByte(0x00);	
1613  00e7 b604          	ld	a,_STI_GetMessage$L+4
1614  00e9 b700          	ld	c_x,a
1615  00eb be05          	ld	x,_STI_GetMessage$L+5
1616  00ed 89            	push	x
1617  00ee be00          	ld	x,c_x
1618  00f0 89            	push	x
1619  00f1 4f            	clr	a
1620  00f2 cd0000        	call	_STI_MoveByte
1622  00f5 b7ff          	ld	_STI_GetMessage$L-1,a
1623  00f7 84            	pop	a
1624  00f8 b700          	ld	c_x,a
1625  00fa 85            	pop	x
1626  00fb 89            	push	x
1627  00fc 88            	push	a
1628  00fd cd0000        	call	c_getwx
1630  0100 bbff          	add	a,_STI_GetMessage$L-1
1631  0102 2401          	jrnc	L22
1632  0104 5c            	inc	x
1633  0105               L22:
1634  0105 9085          	pop	y
1635  0107 90bf00        	ld	c_y,y
1636  010a 9085          	pop	y
1637  010c cd0000        	call	c_putw
1639                     ; 80 		_bres(_Pa_DDQUE, _Pin_DDQUE);
1641  010f 170f          	bres	_PFDR,#3
1642                     ; 81 		_bres(_Pa_DDSEL, _Pin_DDSEL);	
1644  0111 1b00          	bres	_PADR,#5
1645                     ; 82 		_bres(_Pa_Led_D1, _Pin_Led_D1);	
1647  0113 1f0c          	bres	_PEDR,#7
1648                     ; 68 	while(m_woTimeout == 0x0000)
1650  0115 c600ca        	ld	a,_m_woTimeout+1
1651  0118 2603          	jrne	L42
1652  011a ce00c9        	ld	x,_m_woTimeout
1653  011d               L42:
1654  011d 2798          	jreq	L5401
1655                     ; 84 }
1658  011f 81            	ret
1723                     ; 88 WORD STI_SendMessage(BYTE a_byCode, BYTE a_byAdditionalCode, WORD a_woValue)
1723                     ; 89 {
1724                     	switch	.text
1726                     	xref.b	_STI_SendMessage$L
1727  0120               _STI_SendMessage:
1729  0120 b701          	ld	_STI_SendMessage$L+1,a
1730  0122 bf00          	ld	_STI_SendMessage$L,x
1732                     ; 92 	m_woTimeout = 0x0000;
1734  0124 4f            	clr	a
1735  0125 c700c9        	ld	_m_woTimeout,a
1736  0128 c700ca        	ld	_m_woTimeout+1,a
1737  012b               L5011:
1738                     ; 95 		m_woTimeout = 0x2000;
1740  012b a620          	ld	a,#32
1741  012d c700c9        	ld	_m_woTimeout,a
1742  0130 4f            	clr	a
1743  0131 c700ca        	ld	_m_woTimeout+1,a
1744                     ; 97 		_bset(_Pa_Led_D1, _Pin_Led_D1);	
1746  0134 1e0c          	bset	_PEDR,#7
1747                     ; 98 		_bset(_Pa_DDSEL, _Pin_DDSEL);
1749  0136 1a00          	bset	_PADR,#5
1750                     ; 99 		_bset(_Pa_DDQUE, _Pin_DDQUE);
1752  0138 160f          	bset	_PFDR,#3
1753                     ; 101 		STI_MoveByte(a_byCode);
1755  013a b600          	ld	a,_STI_SendMessage$L
1756  013c cd0000        	call	_STI_MoveByte
1758                     ; 102 		STI_MoveByte(a_byAdditionalCode);
1760  013f b601          	ld	a,_STI_SendMessage$L+1
1761  0141 cd0000        	call	_STI_MoveByte
1763                     ; 103 		woPrevValue = STI_MoveByte(HIBYTE(a_woValue))*256;
1765  0144 b602          	ld	a,_STI_SendMessage$L+2
1766  0146 a4ff          	and	a,#255
1767  0148 cd0000        	call	_STI_MoveByte
1769  014b 5f            	clr	x
1770  014c 97            	ld	x,a
1771  014d 4f            	clr	a
1772  014e b7ff          	ld	_STI_SendMessage$L-1,a
1773  0150 bffe          	ld	_STI_SendMessage$L-2,x
1774                     ; 104 		woPrevValue += STI_MoveByte(LOBYTE(a_woValue));
1776  0152 b603          	ld	a,_STI_SendMessage$L+3
1777  0154 cd0000        	call	_STI_MoveByte
1779  0157 bbff          	add	a,_STI_SendMessage$L-1
1780  0159 b7ff          	ld	_STI_SendMessage$L-1,a
1781  015b 2402          	jrnc	L03
1782  015d 3cfe          	inc	_STI_SendMessage$L-2
1783  015f               L03:
1784                     ; 106 		_bres(_Pa_DDQUE, _Pin_DDQUE);
1786  015f 170f          	bres	_PFDR,#3
1787                     ; 107 		_bres(_Pa_DDSEL, _Pin_DDSEL);	
1789  0161 1b00          	bres	_PADR,#5
1790                     ; 108 		_bres(_Pa_Led_D1, _Pin_Led_D1);	
1792  0163 1f0c          	bres	_PEDR,#7
1793                     ; 93 	while(m_woTimeout == 0x0000)
1795  0165 c600ca        	ld	a,_m_woTimeout+1
1796  0168 2603          	jrne	L23
1797  016a ce00c9        	ld	x,_m_woTimeout
1798  016d               L23:
1799  016d 27bc          	jreq	L5011
1800                     ; 111 	return woPrevValue;
1802  016f b6ff          	ld	a,_STI_SendMessage$L-1
1803  0171 befe          	ld	x,_STI_SendMessage$L-2
1806  0173 81            	ret
1848                     	switch	.bss
1849  0000               _m_byIndexValue:
1850  0000 00            	ds.b	1
1851                     	xdef	_m_byIndexValue
1852  0001               _m_arbyValues:
1853  0001 000000000000  	ds.b	200
1854                     	xdef	_m_arbyValues
1855  00c9               _m_woTimeout:
1856  00c9 0000          	ds.b	2
1857                     	xdef	_m_woTimeout
1858                     	xdef	_STI_SendMessage
1859                     	xdef	_STI_GetMessage
1860                     	xdef	_STI_MoveByte
1861                     	xref.b	c_x
1862                     	xref.b	c_y
1882                     	xref	c_getwx
1883                     	xref	c_putw
1884                     	end
