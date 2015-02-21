   1                     ; C Compiler for ST7 (COSMIC Software)
   2                     ; Generator V4.5.5 - 12 Jan 2006
1280                     .const:	section	.text
1281  0000               L327_mc_byApplicationVersion:
1282  0000 9d            	dc.b	157
1363                     ; 6 BYTE STI_MoveByte (BYTE a_byData)
1363                     ; 7 { 
1364                     	switch	.text
1366                     	xref.b	_STI_MoveByte$L
1367  0000               _STI_MoveByte:
1369  0000 b700          	ld	_STI_MoveByte$L,a
1371                     ; 8 	BYTE 	byCounter 		= 8;
1373  0002 a608          	ld	a,#8
1374  0004 b7ff          	ld	_STI_MoveByte$L-1,a
1375                     ; 10 	if (m_woTimeout == 0x0000)
1377  0006 c60001        	ld	a,_m_woTimeout+1
1378  0009 2603          	jrne	L6
1379  000b ce0000        	ld	x,_m_woTimeout
1380  000e               L6:
1381  000e 2602          	jrne	L177
1382                     ; 12 		return 0x00;
1384  0010 4f            	clr	a
1387  0011 81            	ret
1388  0012               L177:
1389                     ; 15 	for(byCounter=0; byCounter<8; byCounter++)
1391  0012 3fff          	clr	_STI_MoveByte$L-1
1392  0014               L377:
1393                     ; 17 		m_woTimeout = 0x2000;
1395  0014 a620          	ld	a,#32
1396  0016 c70000        	ld	_m_woTimeout,a
1397  0019 4f            	clr	a
1398  001a c70001        	ld	_m_woTimeout+1,a
1400  001d 201c          	jra	L5001
1401  001f               L1001:
1402                     ; 22 			if((--m_woTimeout)==0)
1404  001f c60001        	ld	a,_m_woTimeout+1
1405  0022 2607          	jrne	L01
1406  0024 ce0000        	ld	x,_m_woTimeout
1407  0027 5a            	dec	x
1408  0028 cf0000        	ld	_m_woTimeout,x
1409  002b               L01:
1410  002b 4a            	dec	a
1411  002c c70001        	ld	_m_woTimeout+1,a
1412  002f c60001        	ld	a,_m_woTimeout+1
1413  0032 2603          	jrne	L21
1414  0034 ce0000        	ld	x,_m_woTimeout
1415  0037               L21:
1416  0037 2602          	jrne	L5001
1417                     ; 24 				return 0x00;
1419  0039 4f            	clr	a
1422  003a 81            	ret
1423  003b               L5001:
1424                     ; 20 		while(!_btst(_Pa_DDCLK, _Pin_DDCLK))
1426  003b b606          	ld	a,_PCDR
1427  003d a504          	bcp	a,#4
1428  003f 27de          	jreq	L1001
1429                     ; 28 		if ((a_byData & 0x80)!=0)
1432  0041 b600          	ld	a,_STI_MoveByte$L
1433  0043 a580          	bcp	a,#128
1434  0045 2704          	jreq	L3101
1435                     ; 30 			_bset(_Pa_DDOUT, _Pin_DDOUT);
1437  0047 1612          	bset	_PGDR,#3
1439  0049 2002          	jra	L5101
1440  004b               L3101:
1441                     ; 34 			_bres(_Pa_DDOUT, _Pin_DDOUT);
1443  004b 1712          	bres	_PGDR,#3
1444  004d               L5101:
1445                     ; 36 		a_byData <<= 1;
1447  004d 3800          	sll	_STI_MoveByte$L
1448                     ; 38 		if(_btst(_Pa_DDIN, _Pin_DDIN))
1450  004f b606          	ld	a,_PCDR
1451  0051 a508          	bcp	a,#8
1452  0053 2702          	jreq	L7101
1453                     ; 40 			a_byData+=1;
1455  0055 3c00          	inc	_STI_MoveByte$L
1456  0057               L7101:
1457                     ; 43 		m_woTimeout = 0x2000;
1459  0057 a620          	ld	a,#32
1460  0059 c70000        	ld	_m_woTimeout,a
1461  005c 4f            	clr	a
1462  005d c70001        	ld	_m_woTimeout+1,a
1464  0060 201c          	jra	L5201
1465  0062               L1201:
1466                     ; 46 			if((--m_woTimeout)==0)
1468  0062 c60001        	ld	a,_m_woTimeout+1
1469  0065 2607          	jrne	L41
1470  0067 ce0000        	ld	x,_m_woTimeout
1471  006a 5a            	dec	x
1472  006b cf0000        	ld	_m_woTimeout,x
1473  006e               L41:
1474  006e 4a            	dec	a
1475  006f c70001        	ld	_m_woTimeout+1,a
1476  0072 c60001        	ld	a,_m_woTimeout+1
1477  0075 2603          	jrne	L61
1478  0077 ce0000        	ld	x,_m_woTimeout
1479  007a               L61:
1480  007a 2602          	jrne	L5201
1481                     ; 48 				return 0x00;
1483  007c 4f            	clr	a
1486  007d 81            	ret
1487  007e               L5201:
1488                     ; 44 		while(_btst(_Pa_DDCLK, _Pin_DDCLK))
1490  007e b606          	ld	a,_PCDR
1491  0080 a504          	bcp	a,#4
1492  0082 26de          	jrne	L1201
1493                     ; 15 	for(byCounter=0; byCounter<8; byCounter++)
1496  0084 3cff          	inc	_STI_MoveByte$L-1
1499  0086 b6ff          	ld	a,_STI_MoveByte$L-1
1500  0088 a108          	cp	a,#8
1501  008a 2588          	jrult	L377
1502                     ; 53 	return a_byData; 
1504  008c b600          	ld	a,_STI_MoveByte$L
1507  008e 81            	ret
1567                     ; 57 void STI_ReceiveMessage(BYTE * a_byCode, BYTE * a_byAdditionalCode, WORD * a_woValue)
1567                     ; 58 {
1568                     	switch	.text
1570                     	xref.b	_STI_ReceiveMessage$L
1571  008f               _STI_ReceiveMessage:
1573  008f b701          	ld	_STI_ReceiveMessage$L+1,a
1574  0091 bf00          	ld	_STI_ReceiveMessage$L,x
1576                     ; 59 	m_woTimeout = 0x0000;
1578  0093 4f            	clr	a
1579  0094 c70000        	ld	_m_woTimeout,a
1580  0097 c70001        	ld	_m_woTimeout+1,a
1581                     ; 60 	_bset(_Pa_Led_D1, _Pin_Led_D1);	
1583  009a 1e0c          	bset	_PEDR,#7
1585  009c 2077          	jra	L3601
1586  009e               L1601:
1587                     ; 63 		m_woTimeout = 0x2000;
1589  009e a620          	ld	a,#32
1590  00a0 c70000        	ld	_m_woTimeout,a
1591  00a3 4f            	clr	a
1592  00a4 c70001        	ld	_m_woTimeout+1,a
1593                     ; 64 		_bset(_Pa_DDSEL, _Pin_DDSEL);
1595  00a7 1a00          	bset	_PADR,#5
1596                     ; 65 		_bset(_Pa_DDQUE, _Pin_DDQUE);
1598  00a9 160f          	bset	_PFDR,#3
1599                     ; 67 		(*a_byCode) = STI_MoveByte(0x00);
1601  00ab 4f            	clr	a
1602  00ac cd0000        	call	_STI_MoveByte
1604  00af 92c700        	ld	[_STI_ReceiveMessage$L.w],a
1605                     ; 68 		(*a_byAdditionalCode) = STI_MoveByte(0x00);
1607  00b2 4f            	clr	a
1608  00b3 cd0000        	call	_STI_MoveByte
1610  00b6 92c702        	ld	[_STI_ReceiveMessage$L+2.w],a
1611                     ; 69 		(*a_woValue) = (STI_MoveByte(0x00)*256);
1613  00b9 4f            	clr	a
1614  00ba cd0000        	call	_STI_MoveByte
1616  00bd 5f            	clr	x
1617  00be 97            	ld	x,a
1618  00bf 4f            	clr	a
1619  00c0 90be04        	ld	y,_STI_ReceiveMessage$L+4
1620  00c3 90bf00        	ld	c_y,y
1621  00c6 90be05        	ld	y,_STI_ReceiveMessage$L+5
1622  00c9 cd0000        	call	c_putw
1624                     ; 70 		(*a_woValue) += STI_MoveByte(0x00);	
1626  00cc b604          	ld	a,_STI_ReceiveMessage$L+4
1627  00ce b700          	ld	c_x,a
1628  00d0 be05          	ld	x,_STI_ReceiveMessage$L+5
1629  00d2 89            	push	x
1630  00d3 be00          	ld	x,c_x
1631  00d5 89            	push	x
1632  00d6 4f            	clr	a
1633  00d7 cd0000        	call	_STI_MoveByte
1635  00da b7ff          	ld	_STI_ReceiveMessage$L-1,a
1636  00dc 84            	pop	a
1637  00dd b700          	ld	c_x,a
1638  00df 85            	pop	x
1639  00e0 89            	push	x
1640  00e1 88            	push	a
1641  00e2 cd0000        	call	c_getwx
1643  00e5 bbff          	add	a,_STI_ReceiveMessage$L-1
1644  00e7 2401          	jrnc	L22
1645  00e9 5c            	inc	x
1646  00ea               L22:
1647  00ea 9085          	pop	y
1648  00ec 90bf00        	ld	c_y,y
1649  00ef 9085          	pop	y
1650  00f1 cd0000        	call	c_putw
1652                     ; 72 		_bres(_Pa_DDQUE, _Pin_DDQUE);
1654  00f4 170f          	bres	_PFDR,#3
1655                     ; 73 		_bres(_Pa_DDSEL, _Pin_DDSEL);	
1657  00f6 1b00          	bres	_PADR,#5
1658                     ; 75 		if(m_woTimeout == 0x0000)
1660  00f8 c60001        	ld	a,_m_woTimeout+1
1661  00fb 2603          	jrne	L42
1662  00fd ce0000        	ld	x,_m_woTimeout
1663  0100               L42:
1664  0100 2613          	jrne	L3601
1665                     ; 77 			sleep(1000);
1667  0102 a6e8          	ld	a,#232
1668  0104 b703          	ld	_sleep$L+3,a
1669  0106 a603          	ld	a,#3
1670  0108 b702          	ld	_sleep$L+2,a
1671  010a a600          	ld	a,#0
1672  010c b701          	ld	_sleep$L+1,a
1673  010e a600          	ld	a,#0
1674  0110 b700          	ld	_sleep$L,a
1675  0112 cd0000        	call	_sleep
1677  0115               L3601:
1678                     ; 61 	while(m_woTimeout == 0x0000)
1680  0115 c60001        	ld	a,_m_woTimeout+1
1681  0118 2603          	jrne	L62
1682  011a ce0000        	ld	x,_m_woTimeout
1683  011d               L62:
1684  011d 2603          	jrne	L03
1685  011f cc009e        	jp	L1601
1686  0122               L03:
1687                     ; 80 	_bres(_Pa_Led_D1, _Pin_Led_D1);	
1689  0122 1f0c          	bres	_PEDR,#7
1690                     ; 81 }
1693  0124 81            	ret
1741                     ; 85 WORD STI_GetMessage(BYTE a_byParamCode)
1741                     ; 86 {
1742                     	switch	.text
1744                     	xref.b	_STI_GetMessage$L
1745  0125               _STI_GetMessage:
1747  0125 b700          	ld	_STI_GetMessage$L,a
1749                     ; 89 	m_woTimeout = 0x0000;
1751  0127 4f            	clr	a
1752  0128 c70000        	ld	_m_woTimeout,a
1753  012b c70001        	ld	_m_woTimeout+1,a
1754                     ; 90 	_bset(_Pa_Led_D1, _Pin_Led_D1);	
1756  012e 1e0c          	bset	_PEDR,#7
1758  0130 204f          	jra	L5111
1759  0132               L3111:
1760                     ; 93 		m_woTimeout = 0x2000;
1762  0132 a620          	ld	a,#32
1763  0134 c70000        	ld	_m_woTimeout,a
1764  0137 4f            	clr	a
1765  0138 c70001        	ld	_m_woTimeout+1,a
1766                     ; 94 		_bset(_Pa_DDSEL, _Pin_DDSEL);
1768  013b 1a00          	bset	_PADR,#5
1769                     ; 95 		_bset(_Pa_DDQUE, _Pin_DDQUE);
1771  013d 160f          	bset	_PFDR,#3
1772                     ; 97 		STI_MoveByte(STI_FUNZ_READ_PARAM);
1774  013f a680          	ld	a,#128
1775  0141 cd0000        	call	_STI_MoveByte
1777                     ; 98 		STI_MoveByte(a_byParamCode);
1779  0144 b600          	ld	a,_STI_GetMessage$L
1780  0146 cd0000        	call	_STI_MoveByte
1782                     ; 99 		woValue = (STI_MoveByte(0x00)*256);
1784  0149 4f            	clr	a
1785  014a cd0000        	call	_STI_MoveByte
1787  014d 5f            	clr	x
1788  014e 97            	ld	x,a
1789  014f 4f            	clr	a
1790  0150 b7ff          	ld	_STI_GetMessage$L-1,a
1791  0152 bffe          	ld	_STI_GetMessage$L-2,x
1792                     ; 100 		woValue += STI_MoveByte(0x00);	
1794  0154 4f            	clr	a
1795  0155 cd0000        	call	_STI_MoveByte
1797  0158 bbff          	add	a,_STI_GetMessage$L-1
1798  015a b7ff          	ld	_STI_GetMessage$L-1,a
1799  015c 2402          	jrnc	L43
1800  015e 3cfe          	inc	_STI_GetMessage$L-2
1801  0160               L43:
1802                     ; 102 		_bres(_Pa_DDQUE, _Pin_DDQUE);
1804  0160 170f          	bres	_PFDR,#3
1805                     ; 103 		_bres(_Pa_DDSEL, _Pin_DDSEL);	
1807  0162 1b00          	bres	_PADR,#5
1808                     ; 105 		if(m_woTimeout == 0x0000)
1810  0164 c60001        	ld	a,_m_woTimeout+1
1811  0167 2603          	jrne	L63
1812  0169 ce0000        	ld	x,_m_woTimeout
1813  016c               L63:
1814  016c 2613          	jrne	L5111
1815                     ; 107 			sleep(1000);
1817  016e a6e8          	ld	a,#232
1818  0170 b703          	ld	_sleep$L+3,a
1819  0172 a603          	ld	a,#3
1820  0174 b702          	ld	_sleep$L+2,a
1821  0176 a600          	ld	a,#0
1822  0178 b701          	ld	_sleep$L+1,a
1823  017a a600          	ld	a,#0
1824  017c b700          	ld	_sleep$L,a
1825  017e cd0000        	call	_sleep
1827  0181               L5111:
1828                     ; 91 	while(m_woTimeout == 0x0000)
1830  0181 c60001        	ld	a,_m_woTimeout+1
1831  0184 2603          	jrne	L04
1832  0186 ce0000        	ld	x,_m_woTimeout
1833  0189               L04:
1834  0189 27a7          	jreq	L3111
1835                     ; 110 	_bres(_Pa_Led_D1, _Pin_Led_D1);	
1837  018b 1f0c          	bres	_PEDR,#7
1838                     ; 112 	return woValue;
1840  018d b6ff          	ld	a,_STI_GetMessage$L-1
1841  018f befe          	ld	x,_STI_GetMessage$L-2
1844  0191 81            	ret
1910                     ; 117 WORD STI_SendMessage(BYTE a_byCode, BYTE a_byAdditionalCode, WORD a_woValue)
1910                     ; 118 {
1911                     	switch	.text
1913                     	xref.b	_STI_SendMessage$L
1914  0192               _STI_SendMessage:
1916  0192 b701          	ld	_STI_SendMessage$L+1,a
1917  0194 bf00          	ld	_STI_SendMessage$L,x
1919                     ; 121 	m_woTimeout = 0x0000;
1921  0196 4f            	clr	a
1922  0197 c70000        	ld	_m_woTimeout,a
1923  019a c70001        	ld	_m_woTimeout+1,a
1924                     ; 122 	_bset(_Pa_Led_D1, _Pin_Led_D1);	
1926  019d 1e0c          	bset	_PEDR,#7
1928  019f 2053          	jra	L7511
1929  01a1               L5511:
1930                     ; 125 		m_woTimeout = 0x2000;
1932  01a1 a620          	ld	a,#32
1933  01a3 c70000        	ld	_m_woTimeout,a
1934  01a6 4f            	clr	a
1935  01a7 c70001        	ld	_m_woTimeout+1,a
1936                     ; 127 		_bset(_Pa_DDSEL, _Pin_DDSEL);
1938  01aa 1a00          	bset	_PADR,#5
1939                     ; 128 		_bset(_Pa_DDQUE, _Pin_DDQUE);
1941  01ac 160f          	bset	_PFDR,#3
1942                     ; 130 		STI_MoveByte(a_byCode);
1944  01ae b600          	ld	a,_STI_SendMessage$L
1945  01b0 cd0000        	call	_STI_MoveByte
1947                     ; 131 		STI_MoveByte(a_byAdditionalCode);
1949  01b3 b601          	ld	a,_STI_SendMessage$L+1
1950  01b5 cd0000        	call	_STI_MoveByte
1952                     ; 132 		woPrevValue = STI_MoveByte(HIBYTE(a_woValue))*256;
1954  01b8 b602          	ld	a,_STI_SendMessage$L+2
1955  01ba a4ff          	and	a,#255
1956  01bc cd0000        	call	_STI_MoveByte
1958  01bf 5f            	clr	x
1959  01c0 97            	ld	x,a
1960  01c1 4f            	clr	a
1961  01c2 b7ff          	ld	_STI_SendMessage$L-1,a
1962  01c4 bffe          	ld	_STI_SendMessage$L-2,x
1963                     ; 133 		woPrevValue += STI_MoveByte(LOBYTE(a_woValue));
1965  01c6 b603          	ld	a,_STI_SendMessage$L+3
1966  01c8 cd0000        	call	_STI_MoveByte
1968  01cb bbff          	add	a,_STI_SendMessage$L-1
1969  01cd b7ff          	ld	_STI_SendMessage$L-1,a
1970  01cf 2402          	jrnc	L44
1971  01d1 3cfe          	inc	_STI_SendMessage$L-2
1972  01d3               L44:
1973                     ; 137 		_bres(_Pa_DDQUE, _Pin_DDQUE);
1975  01d3 170f          	bres	_PFDR,#3
1976                     ; 138 		_bres(_Pa_DDSEL, _Pin_DDSEL);	
1978  01d5 1b00          	bres	_PADR,#5
1979                     ; 140 		if(m_woTimeout == 0x0000)
1981  01d7 c60001        	ld	a,_m_woTimeout+1
1982  01da 2603          	jrne	L64
1983  01dc ce0000        	ld	x,_m_woTimeout
1984  01df               L64:
1985  01df 2613          	jrne	L7511
1986                     ; 142 			sleep(1000);
1988  01e1 a6e8          	ld	a,#232
1989  01e3 b703          	ld	_sleep$L+3,a
1990  01e5 a603          	ld	a,#3
1991  01e7 b702          	ld	_sleep$L+2,a
1992  01e9 a600          	ld	a,#0
1993  01eb b701          	ld	_sleep$L+1,a
1994  01ed a600          	ld	a,#0
1995  01ef b700          	ld	_sleep$L,a
1996  01f1 cd0000        	call	_sleep
1998  01f4               L7511:
1999                     ; 123 	while(m_woTimeout == 0x0000)
2001  01f4 c60001        	ld	a,_m_woTimeout+1
2002  01f7 2603          	jrne	L05
2003  01f9 ce0000        	ld	x,_m_woTimeout
2004  01fc               L05:
2005  01fc 27a3          	jreq	L5511
2006                     ; 145 	_bres(_Pa_Led_D1, _Pin_Led_D1);	
2008  01fe 1f0c          	bres	_PEDR,#7
2009                     ; 147 	return woPrevValue;
2011  0200 b6ff          	ld	a,_STI_SendMessage$L-1
2012  0202 befe          	ld	x,_STI_SendMessage$L-2
2015  0204 81            	ret
2038                     	switch	.bss
2039  0000               _m_woTimeout:
2040  0000 0000          	ds.b	2
2041                     	xdef	_m_woTimeout
2042                     	xdef	_STI_ReceiveMessage
2043                     	xdef	_STI_SendMessage
2044                     	xdef	_STI_GetMessage
2045                     	xdef	_STI_MoveByte
2046                     	xref	_sleep
2047                     	xref.b	c_x
2048                     	xref.b	c_y
2068                     	xref	c_getwx
2069                     	xref	c_putw
2070                     	xref.b	_sleep$L
2071                     	end
