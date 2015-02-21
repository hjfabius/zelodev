   1                     ; C Compiler for ST7 (COSMIC Software)
   2                     ; Generator V4.5.5 - 12 Jan 2006
1312                     ; 27 void scanningHeadSignalWaitEncoder(void)
1312                     ; 28 {
1313                     	switch	.text
1314  0000               _scanningHeadSignalWaitEncoder:
1317  0000 2001          	jra	L347
1318  0002               L147:
1319                     ; 36 		Nop();
1322  0002 9d            nop
1324  0003               L347:
1325                     ; 29 	while (!_btst(_Pa_EncoderAB, _Pin_EncoderAB))
1327  0003 b60f          	ld	a,_PFDR
1328  0005 a580          	bcp	a,#128
1329  0007 27f9          	jreq	L147
1331  0009 2001          	jra	L157
1332  000b               L747:
1333                     ; 46 		Nop();
1336  000b 9d            nop
1338  000c               L157:
1339                     ; 38 	while (_btst(_Pa_EncoderAB, _Pin_EncoderAB))
1341  000c b60f          	ld	a,_PFDR
1342  000e a580          	bcp	a,#128
1343  0010 26f9          	jrne	L747
1344                     ; 48 }
1347  0012 81            	ret
1392                     ; 51 void scanningHeadSignalTestEncoderZero(void)
1392                     ; 52 {
1393                     	switch	.text
1395                     	xref.b	_scanningHeadSignalTestEncoderZero$L
1396  0013               _scanningHeadSignalTestEncoderZero:
1399                     ; 53 	BYTE byGate = 0x00;
1401  0013 3ffe          	clr	_scanningHeadSignalTestEncoderZero$L-2
1402                     ; 56 	for(i=0;i<4;i++)
1404  0015 3fff          	clr	_scanningHeadSignalTestEncoderZero$L-1
1405  0017               L7001:
1406                     ; 58 		while(_btst(_Pa_EncoderAB, _Pin_EncoderAB));
1408  0017 b60f          	ld	a,_PFDR
1409  0019 a580          	bcp	a,#128
1410  001b 26fa          	jrne	L7001
1412  001d               L5101:
1413                     ; 59 		while(!_btst(_Pa_EncoderAB, _Pin_EncoderAB));
1415  001d b60f          	ld	a,_PFDR
1416  001f a580          	bcp	a,#128
1417  0021 27fa          	jreq	L5101
1419  0023               L3201:
1420                     ; 60 		while(_btst(_Pa_EncoderAB, _Pin_EncoderAB));
1422  0023 b60f          	ld	a,_PFDR
1423  0025 a580          	bcp	a,#128
1424  0027 26fa          	jrne	L3201
1426  0029               L1301:
1427                     ; 61 		while(!_btst(_Pa_EncoderAB, _Pin_EncoderAB));
1429  0029 b60f          	ld	a,_PFDR
1430  002b a580          	bcp	a,#128
1431  002d 27fa          	jreq	L1301
1433  002f               L7301:
1434                     ; 62 		while(_btst(_Pa_EncoderAB, _Pin_EncoderAB));
1436  002f b60f          	ld	a,_PFDR
1437  0031 a580          	bcp	a,#128
1438  0033 26fa          	jrne	L7301
1440  0035               L5401:
1441                     ; 63 		while(!_btst(_Pa_EncoderAB, _Pin_EncoderAB));
1443  0035 b60f          	ld	a,_PFDR
1444  0037 a580          	bcp	a,#128
1445  0039 27fa          	jreq	L5401
1447  003b               L3501:
1448                     ; 64 		while(_btst(_Pa_EncoderAB, _Pin_EncoderAB));
1450  003b b60f          	ld	a,_PFDR
1451  003d a580          	bcp	a,#128
1452  003f 26fa          	jrne	L3501
1454  0041               L1601:
1455                     ; 65 		while(!_btst(_Pa_EncoderAB, _Pin_EncoderAB));
1457  0041 b60f          	ld	a,_PFDR
1458  0043 a580          	bcp	a,#128
1459  0045 27fa          	jreq	L1601
1460                     ; 66 		if(_btst(_Pa_Encoder0, _Pin_Encoder0))
1462  0047 b60f          	ld	a,_PFDR
1463  0049 a504          	bcp	a,#4
1464  004b 2702          	jreq	L5601
1465                     ; 68 			byGate++;
1467  004d 3cfe          	inc	_scanningHeadSignalTestEncoderZero$L-2
1468  004f               L5601:
1469                     ; 56 	for(i=0;i<4;i++)
1471  004f 3cff          	inc	_scanningHeadSignalTestEncoderZero$L-1
1474  0051 b6ff          	ld	a,_scanningHeadSignalTestEncoderZero$L-1
1475  0053 a104          	cp	a,#4
1476  0055 25c0          	jrult	L7001
1477                     ; 72 	m_woEncoderGateHiLow = (byGate>2);
1479  0057 b6fe          	ld	a,_scanningHeadSignalTestEncoderZero$L-2
1480  0059 a103          	cp	a,#3
1481  005b 2504          	jrult	L01
1482  005d a601          	ld	a,#1
1483  005f 2001          	jra	L21
1484  0061               L01:
1485  0061 4f            	clr	a
1486  0062               L21:
1487  0062 c70000        	ld	_m_woEncoderGateHiLow,a
1488                     ; 74 	if(m_woEncoderGateHiLow)
1490  0065 c60000        	ld	a,_m_woEncoderGateHiLow
1491  0068 4d            	tnz	a
1492  0069 270d          	jreq	L1111
1494  006b               L3701:
1495                     ; 76 		while(_btst(_Pa_Encoder0, _Pin_Encoder0));
1497  006b b60f          	ld	a,_PFDR
1498  006d a504          	bcp	a,#4
1499  006f 26fa          	jrne	L3701
1501  0071               L1011:
1502                     ; 77 		while(!_btst(_Pa_Encoder0, _Pin_Encoder0));
1504  0071 b60f          	ld	a,_PFDR
1505  0073 a504          	bcp	a,#4
1506  0075 27fa          	jreq	L1011
1508  0077               L5011:
1509                     ; 87 }
1512  0077 81            	ret
1513  0078               L1111:
1514                     ; 81 		while(!_btst(_Pa_Encoder0, _Pin_Encoder0));
1516  0078 b60f          	ld	a,_PFDR
1517  007a a504          	bcp	a,#4
1518  007c 27fa          	jreq	L1111
1520  007e               L7111:
1521                     ; 82 		while(_btst(_Pa_Encoder0, _Pin_Encoder0));
1523  007e b60f          	ld	a,_PFDR
1524  0080 a504          	bcp	a,#4
1525  0082 26fa          	jrne	L7111
1526  0084 20f1          	jra	L5011
1563                     ; 90 WORD scanningHeadSignalTestEncoderAB(void)
1563                     ; 91 {
1564                     	switch	.text
1566                     	xref.b	_scanningHeadSignalTestEncoderAB$L
1567  0086               _scanningHeadSignalTestEncoderAB:
1570                     ; 93 	arbyLoop[0] = 0x00;
1572  0086 4f            	clr	a
1573  0087 c70001        	ld	_arbyLoop,a
1574                     ; 94 	arbyLoop[1] = 0x00;
1576  008a 4f            	clr	a
1577  008b c70002        	ld	_arbyLoop+1,a
1578                     ; 95 	arbyLoop[2] = 0x00;
1580  008e 4f            	clr	a
1581  008f c70003        	ld	_arbyLoop+2,a
1582                     ; 96 	arbyLoop[3] = 0x00;
1584  0092 4f            	clr	a
1585  0093 c70004        	ld	_arbyLoop+3,a
1586                     ; 99 	if (m_woEncoderGateHiLow)
1588  0096 c60000        	ld	a,_m_woEncoderGateHiLow
1589  0099 4d            	tnz	a
1590  009a 2603          	jrne	L61
1591  009c cc01a0        	jp	L1331
1592  009f               L61:
1594  009f               L5411:
1595                     ; 101 		while(_btst(_Pa_Encoder0, _Pin_Encoder0));
1597  009f b60f          	ld	a,_PFDR
1598  00a1 a504          	bcp	a,#4
1599  00a3 26fa          	jrne	L5411
1601  00a5               L3511:
1602                     ; 102 		while(!_btst(_Pa_Encoder0, _Pin_Encoder0));
1604  00a5 b60f          	ld	a,_PFDR
1605  00a7 a504          	bcp	a,#4
1606  00a9 27fa          	jreq	L3511
1608  00ab cc014e        	jp	L1611
1609  00ae               L7611:
1610                     ; 106 			while((_Pa_EncoderAB & 0b10000100)==0b10000100); 	// Enc = 1 & Zero = 1
1612  00ae b60f          	ld	a,_PFDR
1613  00b0 a484          	and	a,#132
1614  00b2 a184          	cp	a,#132
1615  00b4 27f8          	jreq	L7611
1617  00b6               L5711:
1618                     ; 107 			while((_Pa_EncoderAB & 0b10000100)==0b00000100); 	// Enc = 0 & Zero = 1
1620  00b6 b60f          	ld	a,_PFDR
1621  00b8 a484          	and	a,#132
1622  00ba a104          	cp	a,#4
1623  00bc 27f8          	jreq	L5711
1625  00be               L3021:
1626                     ; 108 			while((_Pa_EncoderAB & 0b10000100)==0b10000100); 	// Enc = 1 & Zero = 1
1628  00be b60f          	ld	a,_PFDR
1629  00c0 a484          	and	a,#132
1630  00c2 a184          	cp	a,#132
1631  00c4 27f8          	jreq	L3021
1633  00c6               L1121:
1634                     ; 109 			while((_Pa_EncoderAB & 0b10000100)==0b00000100); 	// Enc = 0 & Zero = 1
1636  00c6 b60f          	ld	a,_PFDR
1637  00c8 a484          	and	a,#132
1638  00ca a104          	cp	a,#4
1639  00cc 27f8          	jreq	L1121
1640                     ; 110 			arbyLoop[0]++;
1642  00ce c60001        	ld	a,_arbyLoop
1643  00d1 ab01          	add	a,#1
1644  00d3 c70001        	ld	_arbyLoop,a
1646  00d6               L7121:
1647                     ; 111 			while((_Pa_EncoderAB & 0b10000100)==0b10000100); 	// Enc = 1 & Zero = 1
1649  00d6 b60f          	ld	a,_PFDR
1650  00d8 a484          	and	a,#132
1651  00da a184          	cp	a,#132
1652  00dc 27f8          	jreq	L7121
1654  00de               L5221:
1655                     ; 112 			while((_Pa_EncoderAB & 0b10000100)==0b00000100); 	// Enc = 0 & Zero = 1
1657  00de b60f          	ld	a,_PFDR
1658  00e0 a484          	and	a,#132
1659  00e2 a104          	cp	a,#4
1660  00e4 27f8          	jreq	L5221
1662  00e6               L3321:
1663                     ; 113 			while((_Pa_EncoderAB & 0b10000100)==0b10000100); 	// Enc = 1 & Zero = 1
1665  00e6 b60f          	ld	a,_PFDR
1666  00e8 a484          	and	a,#132
1667  00ea a184          	cp	a,#132
1668  00ec 27f8          	jreq	L3321
1670  00ee               L1421:
1671                     ; 114 			while((_Pa_EncoderAB & 0b10000100)==0b00000100); 	// Enc = 0 & Zero = 1
1673  00ee b60f          	ld	a,_PFDR
1674  00f0 a484          	and	a,#132
1675  00f2 a104          	cp	a,#4
1676  00f4 27f8          	jreq	L1421
1677                     ; 115 			arbyLoop[1]++;
1679  00f6 c60002        	ld	a,_arbyLoop+1
1680  00f9 ab01          	add	a,#1
1681  00fb c70002        	ld	_arbyLoop+1,a
1683  00fe               L7421:
1684                     ; 116 			while((_Pa_EncoderAB & 0b10000100)==0b10000100); 	// Enc = 1 & Zero = 1
1686  00fe b60f          	ld	a,_PFDR
1687  0100 a484          	and	a,#132
1688  0102 a184          	cp	a,#132
1689  0104 27f8          	jreq	L7421
1691  0106               L5521:
1692                     ; 117 			while((_Pa_EncoderAB & 0b10000100)==0b00000100); 	// Enc = 0 & Zero = 1
1694  0106 b60f          	ld	a,_PFDR
1695  0108 a484          	and	a,#132
1696  010a a104          	cp	a,#4
1697  010c 27f8          	jreq	L5521
1699  010e               L3621:
1700                     ; 118 			while((_Pa_EncoderAB & 0b10000100)==0b10000100); 	// Enc = 1 & Zero = 1
1702  010e b60f          	ld	a,_PFDR
1703  0110 a484          	and	a,#132
1704  0112 a184          	cp	a,#132
1705  0114 27f8          	jreq	L3621
1707  0116               L1721:
1708                     ; 119 			while((_Pa_EncoderAB & 0b10000100)==0b00000100); 	// Enc = 0 & Zero = 1
1710  0116 b60f          	ld	a,_PFDR
1711  0118 a484          	and	a,#132
1712  011a a104          	cp	a,#4
1713  011c 27f8          	jreq	L1721
1714                     ; 120 			arbyLoop[2]++;
1716  011e c60003        	ld	a,_arbyLoop+2
1717  0121 ab01          	add	a,#1
1718  0123 c70003        	ld	_arbyLoop+2,a
1720  0126               L7721:
1721                     ; 121 			while((_Pa_EncoderAB & 0b10000100)==0b10000100); 	// Enc = 1 & Zero = 1
1723  0126 b60f          	ld	a,_PFDR
1724  0128 a484          	and	a,#132
1725  012a a184          	cp	a,#132
1726  012c 27f8          	jreq	L7721
1728  012e               L5031:
1729                     ; 122 			while((_Pa_EncoderAB & 0b10000100)==0b00000100); 	// Enc = 0 & Zero = 1
1731  012e b60f          	ld	a,_PFDR
1732  0130 a484          	and	a,#132
1733  0132 a104          	cp	a,#4
1734  0134 27f8          	jreq	L5031
1736  0136               L3131:
1737                     ; 123 			while((_Pa_EncoderAB & 0b10000100)==0b10000100); 	// Enc = 1 & Zero = 1
1739  0136 b60f          	ld	a,_PFDR
1740  0138 a484          	and	a,#132
1741  013a a184          	cp	a,#132
1742  013c 27f8          	jreq	L3131
1744  013e               L1231:
1745                     ; 124 			while((_Pa_EncoderAB & 0b10000100)==0b00000100); 	// Enc = 0 & Zero = 1
1747  013e b60f          	ld	a,_PFDR
1748  0140 a484          	and	a,#132
1749  0142 a104          	cp	a,#4
1750  0144 27f8          	jreq	L1231
1751                     ; 125 			arbyLoop[3]++;
1753  0146 c60004        	ld	a,_arbyLoop+3
1754  0149 ab01          	add	a,#1
1755  014b c70004        	ld	_arbyLoop+3,a
1756  014e               L1611:
1757                     ; 104 		while (_btst(_Pa_Encoder0, _Pin_Encoder0))
1759  014e b60f          	ld	a,_PFDR
1760  0150 a504          	bcp	a,#4
1761  0152 2703          	jreq	L02
1762  0154 cc00ae        	jp	L7611
1763  0157               L02:
1765  0157               L5231:
1766                     ; 158 	woResult =  (WORD) arbyLoop[0];
1768  0157 c60001        	ld	a,_arbyLoop
1769  015a 5f            	clr	x
1770  015b b7ff          	ld	_scanningHeadSignalTestEncoderAB$L-1,a
1771  015d bffe          	ld	_scanningHeadSignalTestEncoderAB$L-2,x
1772                     ; 159 	woResult += (WORD) arbyLoop[1];
1774  015f c60002        	ld	a,_arbyLoop+1
1775  0162 5f            	clr	x
1776  0163 b7fd          	ld	_scanningHeadSignalTestEncoderAB$L-3,a
1777  0165 bffc          	ld	_scanningHeadSignalTestEncoderAB$L-4,x
1778  0167 b6ff          	ld	a,_scanningHeadSignalTestEncoderAB$L-1
1779  0169 bbfd          	add	a,_scanningHeadSignalTestEncoderAB$L-3
1780  016b b7ff          	ld	_scanningHeadSignalTestEncoderAB$L-1,a
1781  016d b6fe          	ld	a,_scanningHeadSignalTestEncoderAB$L-2
1782  016f b9fc          	adc	a,_scanningHeadSignalTestEncoderAB$L-4
1783  0171 b7fe          	ld	_scanningHeadSignalTestEncoderAB$L-2,a
1784                     ; 160 	woResult += (WORD) arbyLoop[2];
1786  0173 c60003        	ld	a,_arbyLoop+2
1787  0176 5f            	clr	x
1788  0177 b7fd          	ld	_scanningHeadSignalTestEncoderAB$L-3,a
1789  0179 bffc          	ld	_scanningHeadSignalTestEncoderAB$L-4,x
1790  017b b6ff          	ld	a,_scanningHeadSignalTestEncoderAB$L-1
1791  017d bbfd          	add	a,_scanningHeadSignalTestEncoderAB$L-3
1792  017f b7ff          	ld	_scanningHeadSignalTestEncoderAB$L-1,a
1793  0181 b6fe          	ld	a,_scanningHeadSignalTestEncoderAB$L-2
1794  0183 b9fc          	adc	a,_scanningHeadSignalTestEncoderAB$L-4
1795  0185 b7fe          	ld	_scanningHeadSignalTestEncoderAB$L-2,a
1796                     ; 161 	woResult += (WORD) arbyLoop[3];
1798  0187 c60004        	ld	a,_arbyLoop+3
1799  018a 5f            	clr	x
1800  018b b7fd          	ld	_scanningHeadSignalTestEncoderAB$L-3,a
1801  018d bffc          	ld	_scanningHeadSignalTestEncoderAB$L-4,x
1802  018f b6ff          	ld	a,_scanningHeadSignalTestEncoderAB$L-1
1803  0191 bbfd          	add	a,_scanningHeadSignalTestEncoderAB$L-3
1804  0193 b7ff          	ld	_scanningHeadSignalTestEncoderAB$L-1,a
1805  0195 b6fe          	ld	a,_scanningHeadSignalTestEncoderAB$L-2
1806  0197 b9fc          	adc	a,_scanningHeadSignalTestEncoderAB$L-4
1807  0199 b7fe          	ld	_scanningHeadSignalTestEncoderAB$L-2,a
1808                     ; 162 	return woResult;
1810  019b b6ff          	ld	a,_scanningHeadSignalTestEncoderAB$L-1
1811  019d befe          	ld	x,_scanningHeadSignalTestEncoderAB$L-2
1814  019f 81            	ret
1815  01a0               L1331:
1816                     ; 130 		while(!_btst(_Pa_Encoder0, _Pin_Encoder0));
1818  01a0 b60f          	ld	a,_PFDR
1819  01a2 a504          	bcp	a,#4
1820  01a4 27fa          	jreq	L1331
1822  01a6               L7331:
1823                     ; 131 		while(_btst(_Pa_Encoder0, _Pin_Encoder0));
1825  01a6 b60f          	ld	a,_PFDR
1826  01a8 a504          	bcp	a,#4
1827  01aa 26fa          	jrne	L7331
1829  01ac cc023f        	jp	L5431
1830  01af               L3531:
1831                     ; 135 			while((_Pa_EncoderAB & 0b10000100)==0b10000000); 	// Enc = 1 & Zero = 0
1833  01af b60f          	ld	a,_PFDR
1834  01b1 a484          	and	a,#132
1835  01b3 a180          	cp	a,#128
1836  01b5 27f8          	jreq	L3531
1838  01b7               L1631:
1839                     ; 136 			while((_Pa_EncoderAB & 0b10000100)==0b00000000); 	// Enc = 0 & Zero = 0
1841  01b7 b60f          	ld	a,_PFDR
1842  01b9 a584          	bcp	a,#132
1843  01bb 27fa          	jreq	L1631
1845  01bd               L7631:
1846                     ; 137 			while((_Pa_EncoderAB & 0b10000100)==0b10000000); 	// Enc = 1 & Zero = 0
1848  01bd b60f          	ld	a,_PFDR
1849  01bf a484          	and	a,#132
1850  01c1 a180          	cp	a,#128
1851  01c3 27f8          	jreq	L7631
1853  01c5               L5731:
1854                     ; 138 			while((_Pa_EncoderAB & 0b10000100)==0b00000000); 	// Enc = 0 & Zero = 0
1856  01c5 b60f          	ld	a,_PFDR
1857  01c7 a584          	bcp	a,#132
1858  01c9 27fa          	jreq	L5731
1859                     ; 139 			arbyLoop[0]++;
1861  01cb c60001        	ld	a,_arbyLoop
1862  01ce ab01          	add	a,#1
1863  01d0 c70001        	ld	_arbyLoop,a
1865  01d3               L3041:
1866                     ; 140 			while((_Pa_EncoderAB & 0b10000100)==0b10000000); 	// Enc = 1 & Zero = 0
1868  01d3 b60f          	ld	a,_PFDR
1869  01d5 a484          	and	a,#132
1870  01d7 a180          	cp	a,#128
1871  01d9 27f8          	jreq	L3041
1873  01db               L1141:
1874                     ; 141 			while((_Pa_EncoderAB & 0b10000100)==0b00000000); 	// Enc = 0 & Zero = 0
1876  01db b60f          	ld	a,_PFDR
1877  01dd a584          	bcp	a,#132
1878  01df 27fa          	jreq	L1141
1880  01e1               L7141:
1881                     ; 142 			while((_Pa_EncoderAB & 0b10000100)==0b10000000); 	// Enc = 1 & Zero = 0
1883  01e1 b60f          	ld	a,_PFDR
1884  01e3 a484          	and	a,#132
1885  01e5 a180          	cp	a,#128
1886  01e7 27f8          	jreq	L7141
1888  01e9               L5241:
1889                     ; 143 			while((_Pa_EncoderAB & 0b10000100)==0b00000000); 	// Enc = 0 & Zero = 0
1891  01e9 b60f          	ld	a,_PFDR
1892  01eb a584          	bcp	a,#132
1893  01ed 27fa          	jreq	L5241
1894                     ; 144 			arbyLoop[1]++;
1896  01ef c60002        	ld	a,_arbyLoop+1
1897  01f2 ab01          	add	a,#1
1898  01f4 c70002        	ld	_arbyLoop+1,a
1900  01f7               L3341:
1901                     ; 145 			while((_Pa_EncoderAB & 0b10000100)==0b10000000); 	// Enc = 1 & Zero = 0
1903  01f7 b60f          	ld	a,_PFDR
1904  01f9 a484          	and	a,#132
1905  01fb a180          	cp	a,#128
1906  01fd 27f8          	jreq	L3341
1908  01ff               L1441:
1909                     ; 146 			while((_Pa_EncoderAB & 0b10000100)==0b00000000); 	// Enc = 0 & Zero = 0
1911  01ff b60f          	ld	a,_PFDR
1912  0201 a584          	bcp	a,#132
1913  0203 27fa          	jreq	L1441
1915  0205               L7441:
1916                     ; 147 			while((_Pa_EncoderAB & 0b10000100)==0b10000000); 	// Enc = 1 & Zero = 0
1918  0205 b60f          	ld	a,_PFDR
1919  0207 a484          	and	a,#132
1920  0209 a180          	cp	a,#128
1921  020b 27f8          	jreq	L7441
1923  020d               L5541:
1924                     ; 148 			while((_Pa_EncoderAB & 0b10000100)==0b00000000); 	// Enc = 0 & Zero = 0
1926  020d b60f          	ld	a,_PFDR
1927  020f a584          	bcp	a,#132
1928  0211 27fa          	jreq	L5541
1929                     ; 149 			arbyLoop[2]++;
1931  0213 c60003        	ld	a,_arbyLoop+2
1932  0216 ab01          	add	a,#1
1933  0218 c70003        	ld	_arbyLoop+2,a
1935  021b               L3641:
1936                     ; 150 			while((_Pa_EncoderAB & 0b10000100)==0b10000000); 	// Enc = 1 & Zero = 0
1938  021b b60f          	ld	a,_PFDR
1939  021d a484          	and	a,#132
1940  021f a180          	cp	a,#128
1941  0221 27f8          	jreq	L3641
1943  0223               L1741:
1944                     ; 151 			while((_Pa_EncoderAB & 0b10000100)==0b00000000); 	// Enc = 0 & Zero = 0
1946  0223 b60f          	ld	a,_PFDR
1947  0225 a584          	bcp	a,#132
1948  0227 27fa          	jreq	L1741
1950  0229               L7741:
1951                     ; 152 			while((_Pa_EncoderAB & 0b10000100)==0b10000000); 	// Enc = 1 & Zero = 0
1953  0229 b60f          	ld	a,_PFDR
1954  022b a484          	and	a,#132
1955  022d a180          	cp	a,#128
1956  022f 27f8          	jreq	L7741
1958  0231               L5051:
1959                     ; 153 			while((_Pa_EncoderAB & 0b10000100)==0b00000000); 	// Enc = 0 & Zero = 0
1961  0231 b60f          	ld	a,_PFDR
1962  0233 a584          	bcp	a,#132
1963  0235 27fa          	jreq	L5051
1964                     ; 154 			arbyLoop[3]++;
1966  0237 c60004        	ld	a,_arbyLoop+3
1967  023a ab01          	add	a,#1
1968  023c c70004        	ld	_arbyLoop+3,a
1969  023f               L5431:
1970                     ; 133 		while (!_btst(_Pa_Encoder0, _Pin_Encoder0))
1972  023f b60f          	ld	a,_PFDR
1973  0241 a504          	bcp	a,#4
1974  0243 2603          	jrne	L22
1975  0245 cc01af        	jp	L3531
1976  0248               L22:
1977  0248 cc0157        	jp	L5231
2047                     ; 167 void scanningHeadSignalAcquireGate(void)
2047                     ; 168 {
2048                     	switch	.text
2050                     	xref.b	_scanningHeadSignalAcquireGate$L
2051  024b               _scanningHeadSignalAcquireGate:
2054                     ; 169 	BYTE byGate				= false;
2056  024b 3ffe          	clr	_scanningHeadSignalAcquireGate$L-2
2057                     ; 170 	BYTE byPrevGate			= false;
2059  024d 3ffd          	clr	_scanningHeadSignalAcquireGate$L-3
2060                     ; 171 	BYTE byFoundIndex		= 0;
2062  024f 3fff          	clr	_scanningHeadSignalAcquireGate$L-1
2063                     ; 173 	BYTE i					= 16;
2065  0251 a610          	ld	a,#16
2066  0253 b7fc          	ld	_scanningHeadSignalAcquireGate$L-4,a
2067                     ; 175 	m_woEncoderGateStart 	= 0xFFFF;
2069  0255 aeff          	ld	x,#255
2070  0257 cf0031        	ld	_m_woEncoderGateStart,x
2071  025a a6ff          	ld	a,#255
2072  025c c70032        	ld	_m_woEncoderGateStart+1,a
2073                     ; 176 	m_woEncoderGateEnd 		= 0xFFFF;
2075  025f aeff          	ld	x,#255
2076  0261 cf002f        	ld	_m_woEncoderGateEnd,x
2077  0264 a6ff          	ld	a,#255
2078  0266 c70030        	ld	_m_woEncoderGateEnd+1,a
2079                     ; 178 	m_arbyEncoderSignals[0]	= 0x00;
2081  0269 4f            	clr	a
2082  026a c70027        	ld	_m_arbyEncoderSignals,a
2083  026d c70028        	ld	_m_arbyEncoderSignals+1,a
2084                     ; 179 	m_arbyEncoderSignals[1]	= 0x00;
2086  0270 4f            	clr	a
2087  0271 c70029        	ld	_m_arbyEncoderSignals+2,a
2088  0274 c7002a        	ld	_m_arbyEncoderSignals+3,a
2089                     ; 180 	m_arbyEncoderSignals[2]	= 0x00;
2091  0277 4f            	clr	a
2092  0278 c7002b        	ld	_m_arbyEncoderSignals+4,a
2093  027b c7002c        	ld	_m_arbyEncoderSignals+5,a
2094                     ; 181 	m_arbyEncoderSignals[3]	= 0x00;
2096  027e 4f            	clr	a
2097  027f c7002d        	ld	_m_arbyEncoderSignals+6,a
2098  0282 c7002e        	ld	_m_arbyEncoderSignals+7,a
2100  0285 200a          	jra	L7451
2101  0287               L3451:
2102                     ; 185 		m_arbyEncoderGate[i] = 0x00;
2104  0287 befc          	ld	x,_scanningHeadSignalAcquireGate$L-4
2105  0289 58            	sll	x
2106  028a 4f            	clr	a
2107  028b d70007        	ld	(_m_arbyEncoderGate,x),a
2108  028e d70008        	ld	(_m_arbyEncoderGate+1,x),a
2109  0291               L7451:
2110                     ; 183 	while(i-->0)
2112  0291 b6fc          	ld	a,_scanningHeadSignalAcquireGate$L-4
2113  0293 3afc          	dec	_scanningHeadSignalAcquireGate$L-4
2114  0295 4d            	tnz	a
2115  0296 26ef          	jrne	L3451
2116                     ; 189 	if (m_woEncoderGateHiLow)
2118  0298 c60000        	ld	a,_m_woEncoderGateHiLow
2119  029b 4d            	tnz	a
2120  029c 271a          	jreq	L1061
2122  029e               L7551:
2123                     ; 191 		while(_btst(_Pa_Encoder0, _Pin_Encoder0)&& !displayIsKeyPress());
2125  029e b60f          	ld	a,_PFDR
2126  02a0 a504          	bcp	a,#4
2127  02a2 2706          	jreq	L7651
2129  02a4 cd0000        	call	_displayIsKeyPress
2131  02a7 4d            	tnz	a
2132  02a8 27f4          	jreq	L7551
2133  02aa               L7651:
2134                     ; 192 		while(!_btst(_Pa_Encoder0, _Pin_Encoder0)&& !displayIsKeyPress());
2136  02aa b60f          	ld	a,_PFDR
2137  02ac a504          	bcp	a,#4
2138  02ae 2620          	jrne	L5751
2140  02b0 cd0000        	call	_displayIsKeyPress
2142  02b3 4d            	tnz	a
2143  02b4 27f4          	jreq	L7651
2144  02b6 2018          	jra	L5751
2145  02b8               L1061:
2146                     ; 196 		while(!_btst(_Pa_Encoder0, _Pin_Encoder0)&& !displayIsKeyPress());
2148  02b8 b60f          	ld	a,_PFDR
2149  02ba a504          	bcp	a,#4
2150  02bc 2606          	jrne	L1161
2152  02be cd0000        	call	_displayIsKeyPress
2154  02c1 4d            	tnz	a
2155  02c2 27f4          	jreq	L1061
2156  02c4               L1161:
2157                     ; 197 		while(_btst(_Pa_Encoder0, _Pin_Encoder0)&& !displayIsKeyPress());
2159  02c4 b60f          	ld	a,_PFDR
2160  02c6 a504          	bcp	a,#4
2161  02c8 2706          	jreq	L5751
2163  02ca cd0000        	call	_displayIsKeyPress
2165  02cd 4d            	tnz	a
2166  02ce 27f4          	jreq	L1161
2167  02d0               L5751:
2168                     ; 200 	if (!displayIsKeyPress())
2170  02d0 cd0000        	call	_displayIsKeyPress
2172  02d3 4d            	tnz	a
2173  02d4 2703          	jreq	L63
2174  02d6 cc0895        	jp	L7161
2175  02d9               L63:
2176                     ; 202 		if (m_woEncoderGateHiLow)
2178  02d9 c60000        	ld	a,_m_woEncoderGateHiLow
2179  02dc 4d            	tnz	a
2180  02dd 2603          	jrne	L04
2181  02df cc0735        	jp	L5302
2182  02e2               L04:
2184  02e2 cc0511        	jp	L5261
2185  02e5               L3261:
2186                     ; 206 				if _btst(_Pa_Encoder0, _Pin_Encoder0)
2188  02e5 b60f          	ld	a,_PFDR
2189  02e7 a504          	bcp	a,#4
2190  02e9 2603          	jrne	L24
2191  02eb cc0370        	jp	L1361
2192  02ee               L24:
2194  02ee               L5361:
2195                     ; 208 					while((_Pa_EncoderAB & 0b10000100)==0b10000100); 	// Enc = 1 & Zero = 1
2197  02ee b60f          	ld	a,_PFDR
2198  02f0 a484          	and	a,#132
2199  02f2 a184          	cp	a,#132
2200  02f4 27f8          	jreq	L5361
2201                     ; 209 					byPrevGate = byGate;
2203  02f6 b6fe          	ld	a,_scanningHeadSignalAcquireGate$L-2
2204  02f8 b7fd          	ld	_scanningHeadSignalAcquireGate$L-3,a
2206  02fa               L5461:
2207                     ; 210 					while((_Pa_EncoderAB & 0b10000100)==0b00000100); 	// Enc = 0 & Zero = 1
2209  02fa b60f          	ld	a,_PFDR
2210  02fc a484          	and	a,#132
2211  02fe a104          	cp	a,#4
2212  0300 27f8          	jreq	L5461
2213                     ; 211 					byGate = _btst(_Pa_Gate, _Pin_Gate);
2215  0302 b603          	ld	a,_PBDR
2216  0304 a480          	and	a,#128
2217  0306 b7fe          	ld	_scanningHeadSignalAcquireGate$L-2,a
2219  0308               L5561:
2220                     ; 212 					while((_Pa_EncoderAB & 0b10000100)==0b10000100); 	// Enc = 1 & Zero = 1
2222  0308 b60f          	ld	a,_PFDR
2223  030a a484          	and	a,#132
2224  030c a184          	cp	a,#132
2225  030e 27f8          	jreq	L5561
2226                     ; 213 					m_arbyEncoderSignals[0]++;
2228  0310 c60028        	ld	a,_m_arbyEncoderSignals+1
2229  0313 ab01          	add	a,#1
2230  0315 c70028        	ld	_m_arbyEncoderSignals+1,a
2231  0318 c60027        	ld	a,_m_arbyEncoderSignals
2232  031b a900          	adc	a,#0
2233  031d c70027        	ld	_m_arbyEncoderSignals,a
2235  0320               L3661:
2236                     ; 214 					while((_Pa_EncoderAB & 0b10000100)==0b00000100); 	// Enc = 0 & Zero = 1
2238  0320 b60f          	ld	a,_PFDR
2239  0322 a484          	and	a,#132
2240  0324 a104          	cp	a,#4
2241  0326 27f8          	jreq	L3661
2242                     ; 215 					if(byPrevGate != byGate)
2244  0328 b6fd          	ld	a,_scanningHeadSignalAcquireGate$L-3
2245  032a b1fe          	cp	a,_scanningHeadSignalAcquireGate$L-2
2246  032c 2742          	jreq	L1361
2247                     ; 217 						m_arbyEncoderGate[byFoundIndex]   = m_arbyEncoderSignals[0];
2249  032e beff          	ld	x,_scanningHeadSignalAcquireGate$L-1
2250  0330 58            	sll	x
2251  0331 c60027        	ld	a,_m_arbyEncoderSignals
2252  0334 d70007        	ld	(_m_arbyEncoderGate,x),a
2253  0337 c60028        	ld	a,_m_arbyEncoderSignals+1
2254  033a d70008        	ld	(_m_arbyEncoderGate+1,x),a
2255                     ; 218 						m_arbyEncoderGate[byFoundIndex+1] = m_arbyEncoderSignals[1];
2257  033d beff          	ld	x,_scanningHeadSignalAcquireGate$L-1
2258  033f 58            	sll	x
2259  0340 c60029        	ld	a,_m_arbyEncoderSignals+2
2260  0343 d70009        	ld	(_m_arbyEncoderGate+2,x),a
2261  0346 c6002a        	ld	a,_m_arbyEncoderSignals+3
2262  0349 d7000a        	ld	(_m_arbyEncoderGate+3,x),a
2263                     ; 219 						m_arbyEncoderGate[byFoundIndex+2] = m_arbyEncoderSignals[2];
2265  034c beff          	ld	x,_scanningHeadSignalAcquireGate$L-1
2266  034e 58            	sll	x
2267  034f c6002b        	ld	a,_m_arbyEncoderSignals+4
2268  0352 d7000b        	ld	(_m_arbyEncoderGate+4,x),a
2269  0355 c6002c        	ld	a,_m_arbyEncoderSignals+5
2270  0358 d7000c        	ld	(_m_arbyEncoderGate+5,x),a
2271                     ; 220 						m_arbyEncoderGate[byFoundIndex+3] = m_arbyEncoderSignals[3];
2273  035b beff          	ld	x,_scanningHeadSignalAcquireGate$L-1
2274  035d 58            	sll	x
2275  035e c6002d        	ld	a,_m_arbyEncoderSignals+6
2276  0361 d7000d        	ld	(_m_arbyEncoderGate+6,x),a
2277  0364 c6002e        	ld	a,_m_arbyEncoderSignals+7
2278  0367 d7000e        	ld	(_m_arbyEncoderGate+7,x),a
2279                     ; 221 						byFoundIndex+=4;
2281  036a b6ff          	ld	a,_scanningHeadSignalAcquireGate$L-1
2282  036c ab04          	add	a,#4
2283  036e b7ff          	ld	_scanningHeadSignalAcquireGate$L-1,a
2284  0370               L1361:
2285                     ; 225 				if _btst(_Pa_Encoder0, _Pin_Encoder0)
2287  0370 b60f          	ld	a,_PFDR
2288  0372 a504          	bcp	a,#4
2289  0374 2603          	jrne	L44
2290  0376 cc03fb        	jp	L1761
2291  0379               L44:
2293  0379               L5761:
2294                     ; 227 					while((_Pa_EncoderAB & 0b10000100)==0b10000100); 	// Enc = 1 & Zero = 1
2296  0379 b60f          	ld	a,_PFDR
2297  037b a484          	and	a,#132
2298  037d a184          	cp	a,#132
2299  037f 27f8          	jreq	L5761
2300                     ; 228 					byPrevGate = byGate;
2302  0381 b6fe          	ld	a,_scanningHeadSignalAcquireGate$L-2
2303  0383 b7fd          	ld	_scanningHeadSignalAcquireGate$L-3,a
2305  0385               L5071:
2306                     ; 229 					while((_Pa_EncoderAB & 0b10000100)==0b00000100); 	// Enc = 0 & Zero = 1
2308  0385 b60f          	ld	a,_PFDR
2309  0387 a484          	and	a,#132
2310  0389 a104          	cp	a,#4
2311  038b 27f8          	jreq	L5071
2312                     ; 230 					byGate = _btst(_Pa_Gate, _Pin_Gate);
2314  038d b603          	ld	a,_PBDR
2315  038f a480          	and	a,#128
2316  0391 b7fe          	ld	_scanningHeadSignalAcquireGate$L-2,a
2318  0393               L5171:
2319                     ; 231 					while((_Pa_EncoderAB & 0b10000100)==0b10000100); 	// Enc = 1 & Zero = 1
2321  0393 b60f          	ld	a,_PFDR
2322  0395 a484          	and	a,#132
2323  0397 a184          	cp	a,#132
2324  0399 27f8          	jreq	L5171
2325                     ; 232 					m_arbyEncoderSignals[1]++;
2327  039b c6002a        	ld	a,_m_arbyEncoderSignals+3
2328  039e ab01          	add	a,#1
2329  03a0 c7002a        	ld	_m_arbyEncoderSignals+3,a
2330  03a3 c60029        	ld	a,_m_arbyEncoderSignals+2
2331  03a6 a900          	adc	a,#0
2332  03a8 c70029        	ld	_m_arbyEncoderSignals+2,a
2334  03ab               L3271:
2335                     ; 233 					while((_Pa_EncoderAB & 0b10000100)==0b00000100); 	// Enc = 0 & Zero = 1
2337  03ab b60f          	ld	a,_PFDR
2338  03ad a484          	and	a,#132
2339  03af a104          	cp	a,#4
2340  03b1 27f8          	jreq	L3271
2341                     ; 234 					if(byPrevGate != byGate)
2343  03b3 b6fd          	ld	a,_scanningHeadSignalAcquireGate$L-3
2344  03b5 b1fe          	cp	a,_scanningHeadSignalAcquireGate$L-2
2345  03b7 2742          	jreq	L1761
2346                     ; 236 						m_arbyEncoderGate[byFoundIndex]   = m_arbyEncoderSignals[0];
2348  03b9 beff          	ld	x,_scanningHeadSignalAcquireGate$L-1
2349  03bb 58            	sll	x
2350  03bc c60027        	ld	a,_m_arbyEncoderSignals
2351  03bf d70007        	ld	(_m_arbyEncoderGate,x),a
2352  03c2 c60028        	ld	a,_m_arbyEncoderSignals+1
2353  03c5 d70008        	ld	(_m_arbyEncoderGate+1,x),a
2354                     ; 237 						m_arbyEncoderGate[byFoundIndex+1] = m_arbyEncoderSignals[1];
2356  03c8 beff          	ld	x,_scanningHeadSignalAcquireGate$L-1
2357  03ca 58            	sll	x
2358  03cb c60029        	ld	a,_m_arbyEncoderSignals+2
2359  03ce d70009        	ld	(_m_arbyEncoderGate+2,x),a
2360  03d1 c6002a        	ld	a,_m_arbyEncoderSignals+3
2361  03d4 d7000a        	ld	(_m_arbyEncoderGate+3,x),a
2362                     ; 238 						m_arbyEncoderGate[byFoundIndex+2] = m_arbyEncoderSignals[2];
2364  03d7 beff          	ld	x,_scanningHeadSignalAcquireGate$L-1
2365  03d9 58            	sll	x
2366  03da c6002b        	ld	a,_m_arbyEncoderSignals+4
2367  03dd d7000b        	ld	(_m_arbyEncoderGate+4,x),a
2368  03e0 c6002c        	ld	a,_m_arbyEncoderSignals+5
2369  03e3 d7000c        	ld	(_m_arbyEncoderGate+5,x),a
2370                     ; 239 						m_arbyEncoderGate[byFoundIndex+3] = m_arbyEncoderSignals[3];
2372  03e6 beff          	ld	x,_scanningHeadSignalAcquireGate$L-1
2373  03e8 58            	sll	x
2374  03e9 c6002d        	ld	a,_m_arbyEncoderSignals+6
2375  03ec d7000d        	ld	(_m_arbyEncoderGate+6,x),a
2376  03ef c6002e        	ld	a,_m_arbyEncoderSignals+7
2377  03f2 d7000e        	ld	(_m_arbyEncoderGate+7,x),a
2378                     ; 240 						byFoundIndex+=4;
2380  03f5 b6ff          	ld	a,_scanningHeadSignalAcquireGate$L-1
2381  03f7 ab04          	add	a,#4
2382  03f9 b7ff          	ld	_scanningHeadSignalAcquireGate$L-1,a
2383  03fb               L1761:
2384                     ; 244 				if _btst(_Pa_Encoder0, _Pin_Encoder0)
2386  03fb b60f          	ld	a,_PFDR
2387  03fd a504          	bcp	a,#4
2388  03ff 2603          	jrne	L64
2389  0401 cc0486        	jp	L1371
2390  0404               L64:
2392  0404               L5371:
2393                     ; 246 					while((_Pa_EncoderAB & 0b10000100)==0b10000100); 	// Enc = 1 & Zero = 1
2395  0404 b60f          	ld	a,_PFDR
2396  0406 a484          	and	a,#132
2397  0408 a184          	cp	a,#132
2398  040a 27f8          	jreq	L5371
2399                     ; 247 					byPrevGate = byGate;
2401  040c b6fe          	ld	a,_scanningHeadSignalAcquireGate$L-2
2402  040e b7fd          	ld	_scanningHeadSignalAcquireGate$L-3,a
2404  0410               L5471:
2405                     ; 248 					while((_Pa_EncoderAB & 0b10000100)==0b00000100); 	// Enc = 0 & Zero = 1
2407  0410 b60f          	ld	a,_PFDR
2408  0412 a484          	and	a,#132
2409  0414 a104          	cp	a,#4
2410  0416 27f8          	jreq	L5471
2411                     ; 249 					byGate = _btst(_Pa_Gate, _Pin_Gate);
2413  0418 b603          	ld	a,_PBDR
2414  041a a480          	and	a,#128
2415  041c b7fe          	ld	_scanningHeadSignalAcquireGate$L-2,a
2417  041e               L5571:
2418                     ; 250 					while((_Pa_EncoderAB & 0b10000100)==0b10000100); 	// Enc = 1 & Zero = 1
2420  041e b60f          	ld	a,_PFDR
2421  0420 a484          	and	a,#132
2422  0422 a184          	cp	a,#132
2423  0424 27f8          	jreq	L5571
2424                     ; 251 					m_arbyEncoderSignals[2]++;
2426  0426 c6002c        	ld	a,_m_arbyEncoderSignals+5
2427  0429 ab01          	add	a,#1
2428  042b c7002c        	ld	_m_arbyEncoderSignals+5,a
2429  042e c6002b        	ld	a,_m_arbyEncoderSignals+4
2430  0431 a900          	adc	a,#0
2431  0433 c7002b        	ld	_m_arbyEncoderSignals+4,a
2433  0436               L3671:
2434                     ; 252 					while((_Pa_EncoderAB & 0b10000100)==0b00000100); 	// Enc = 0 & Zero = 1
2436  0436 b60f          	ld	a,_PFDR
2437  0438 a484          	and	a,#132
2438  043a a104          	cp	a,#4
2439  043c 27f8          	jreq	L3671
2440                     ; 253 					if(byPrevGate != byGate)
2442  043e b6fd          	ld	a,_scanningHeadSignalAcquireGate$L-3
2443  0440 b1fe          	cp	a,_scanningHeadSignalAcquireGate$L-2
2444  0442 2742          	jreq	L1371
2445                     ; 255 						m_arbyEncoderGate[byFoundIndex]   = m_arbyEncoderSignals[0];
2447  0444 beff          	ld	x,_scanningHeadSignalAcquireGate$L-1
2448  0446 58            	sll	x
2449  0447 c60027        	ld	a,_m_arbyEncoderSignals
2450  044a d70007        	ld	(_m_arbyEncoderGate,x),a
2451  044d c60028        	ld	a,_m_arbyEncoderSignals+1
2452  0450 d70008        	ld	(_m_arbyEncoderGate+1,x),a
2453                     ; 256 						m_arbyEncoderGate[byFoundIndex+1] = m_arbyEncoderSignals[1];
2455  0453 beff          	ld	x,_scanningHeadSignalAcquireGate$L-1
2456  0455 58            	sll	x
2457  0456 c60029        	ld	a,_m_arbyEncoderSignals+2
2458  0459 d70009        	ld	(_m_arbyEncoderGate+2,x),a
2459  045c c6002a        	ld	a,_m_arbyEncoderSignals+3
2460  045f d7000a        	ld	(_m_arbyEncoderGate+3,x),a
2461                     ; 257 						m_arbyEncoderGate[byFoundIndex+2] = m_arbyEncoderSignals[2];
2463  0462 beff          	ld	x,_scanningHeadSignalAcquireGate$L-1
2464  0464 58            	sll	x
2465  0465 c6002b        	ld	a,_m_arbyEncoderSignals+4
2466  0468 d7000b        	ld	(_m_arbyEncoderGate+4,x),a
2467  046b c6002c        	ld	a,_m_arbyEncoderSignals+5
2468  046e d7000c        	ld	(_m_arbyEncoderGate+5,x),a
2469                     ; 258 						m_arbyEncoderGate[byFoundIndex+3] = m_arbyEncoderSignals[3];
2471  0471 beff          	ld	x,_scanningHeadSignalAcquireGate$L-1
2472  0473 58            	sll	x
2473  0474 c6002d        	ld	a,_m_arbyEncoderSignals+6
2474  0477 d7000d        	ld	(_m_arbyEncoderGate+6,x),a
2475  047a c6002e        	ld	a,_m_arbyEncoderSignals+7
2476  047d d7000e        	ld	(_m_arbyEncoderGate+7,x),a
2477                     ; 259 						byFoundIndex+=4;
2479  0480 b6ff          	ld	a,_scanningHeadSignalAcquireGate$L-1
2480  0482 ab04          	add	a,#4
2481  0484 b7ff          	ld	_scanningHeadSignalAcquireGate$L-1,a
2482  0486               L1371:
2483                     ; 263 				if _btst(_Pa_Encoder0, _Pin_Encoder0)
2485  0486 b60f          	ld	a,_PFDR
2486  0488 a504          	bcp	a,#4
2487  048a 2603          	jrne	L05
2488  048c cc0511        	jp	L5261
2489  048f               L05:
2491  048f               L5771:
2492                     ; 265 					while((_Pa_EncoderAB & 0b10000100)==0b10000100); 	// Enc = 1 & Zero = 1
2494  048f b60f          	ld	a,_PFDR
2495  0491 a484          	and	a,#132
2496  0493 a184          	cp	a,#132
2497  0495 27f8          	jreq	L5771
2498                     ; 266 					byPrevGate = byGate;
2500  0497 b6fe          	ld	a,_scanningHeadSignalAcquireGate$L-2
2501  0499 b7fd          	ld	_scanningHeadSignalAcquireGate$L-3,a
2503  049b               L5002:
2504                     ; 267 					while((_Pa_EncoderAB & 0b10000100)==0b00000100); 	// Enc = 0 & Zero = 1
2506  049b b60f          	ld	a,_PFDR
2507  049d a484          	and	a,#132
2508  049f a104          	cp	a,#4
2509  04a1 27f8          	jreq	L5002
2510                     ; 268 					byGate = _btst(_Pa_Gate, _Pin_Gate);
2512  04a3 b603          	ld	a,_PBDR
2513  04a5 a480          	and	a,#128
2514  04a7 b7fe          	ld	_scanningHeadSignalAcquireGate$L-2,a
2516  04a9               L5102:
2517                     ; 269 					while((_Pa_EncoderAB & 0b10000100)==0b10000100); 	// Enc = 1 & Zero = 1
2519  04a9 b60f          	ld	a,_PFDR
2520  04ab a484          	and	a,#132
2521  04ad a184          	cp	a,#132
2522  04af 27f8          	jreq	L5102
2523                     ; 270 					m_arbyEncoderSignals[3]++;
2525  04b1 c6002e        	ld	a,_m_arbyEncoderSignals+7
2526  04b4 ab01          	add	a,#1
2527  04b6 c7002e        	ld	_m_arbyEncoderSignals+7,a
2528  04b9 c6002d        	ld	a,_m_arbyEncoderSignals+6
2529  04bc a900          	adc	a,#0
2530  04be c7002d        	ld	_m_arbyEncoderSignals+6,a
2532  04c1               L3202:
2533                     ; 271 					while((_Pa_EncoderAB & 0b10000100)==0b00000100); 	// Enc = 0 & Zero = 1
2535  04c1 b60f          	ld	a,_PFDR
2536  04c3 a484          	and	a,#132
2537  04c5 a104          	cp	a,#4
2538  04c7 27f8          	jreq	L3202
2539                     ; 272 					if(byPrevGate != byGate)
2541  04c9 b6fd          	ld	a,_scanningHeadSignalAcquireGate$L-3
2542  04cb b1fe          	cp	a,_scanningHeadSignalAcquireGate$L-2
2543  04cd 2742          	jreq	L5261
2544                     ; 274 						m_arbyEncoderGate[byFoundIndex]   = m_arbyEncoderSignals[0];
2546  04cf beff          	ld	x,_scanningHeadSignalAcquireGate$L-1
2547  04d1 58            	sll	x
2548  04d2 c60027        	ld	a,_m_arbyEncoderSignals
2549  04d5 d70007        	ld	(_m_arbyEncoderGate,x),a
2550  04d8 c60028        	ld	a,_m_arbyEncoderSignals+1
2551  04db d70008        	ld	(_m_arbyEncoderGate+1,x),a
2552                     ; 275 						m_arbyEncoderGate[byFoundIndex+1] = m_arbyEncoderSignals[1];
2554  04de beff          	ld	x,_scanningHeadSignalAcquireGate$L-1
2555  04e0 58            	sll	x
2556  04e1 c60029        	ld	a,_m_arbyEncoderSignals+2
2557  04e4 d70009        	ld	(_m_arbyEncoderGate+2,x),a
2558  04e7 c6002a        	ld	a,_m_arbyEncoderSignals+3
2559  04ea d7000a        	ld	(_m_arbyEncoderGate+3,x),a
2560                     ; 276 						m_arbyEncoderGate[byFoundIndex+2] = m_arbyEncoderSignals[2];
2562  04ed beff          	ld	x,_scanningHeadSignalAcquireGate$L-1
2563  04ef 58            	sll	x
2564  04f0 c6002b        	ld	a,_m_arbyEncoderSignals+4
2565  04f3 d7000b        	ld	(_m_arbyEncoderGate+4,x),a
2566  04f6 c6002c        	ld	a,_m_arbyEncoderSignals+5
2567  04f9 d7000c        	ld	(_m_arbyEncoderGate+5,x),a
2568                     ; 277 						m_arbyEncoderGate[byFoundIndex+3] = m_arbyEncoderSignals[3];
2570  04fc beff          	ld	x,_scanningHeadSignalAcquireGate$L-1
2571  04fe 58            	sll	x
2572  04ff c6002d        	ld	a,_m_arbyEncoderSignals+6
2573  0502 d7000d        	ld	(_m_arbyEncoderGate+6,x),a
2574  0505 c6002e        	ld	a,_m_arbyEncoderSignals+7
2575  0508 d7000e        	ld	(_m_arbyEncoderGate+7,x),a
2576                     ; 278 						byFoundIndex+=4;
2578  050b b6ff          	ld	a,_scanningHeadSignalAcquireGate$L-1
2579  050d ab04          	add	a,#4
2580  050f b7ff          	ld	_scanningHeadSignalAcquireGate$L-1,a
2581  0511               L5261:
2582                     ; 204 			while (_btst(_Pa_Encoder0, _Pin_Encoder0))
2584  0511 b60f          	ld	a,_PFDR
2585  0513 a504          	bcp	a,#4
2586  0515 2703          	jreq	L25
2587  0517 cc02e5        	jp	L3261
2588  051a               L25:
2590  051a cc073e        	jp	L1302
2591  051d               L3302:
2592                     ; 288 				if (!_btst(_Pa_Encoder0, _Pin_Encoder0))
2594  051d b60f          	ld	a,_PFDR
2595  051f a504          	bcp	a,#4
2596  0521 2702          	jreq	L45
2597  0523 207e          	jp	L1402
2598  0525               L45:
2600  0525               L5402:
2601                     ; 290 					while((_Pa_EncoderAB & 0b10000100)==0b10000000); 	// Enc = 1 & Zero = 0
2603  0525 b60f          	ld	a,_PFDR
2604  0527 a484          	and	a,#132
2605  0529 a180          	cp	a,#128
2606  052b 27f8          	jreq	L5402
2607                     ; 291 					byPrevGate = byGate;
2609  052d b6fe          	ld	a,_scanningHeadSignalAcquireGate$L-2
2610  052f b7fd          	ld	_scanningHeadSignalAcquireGate$L-3,a
2612  0531               L5502:
2613                     ; 292 					while((_Pa_EncoderAB & 0b10000100)==0b00000000); 	// Enc = 0 & Zero = 0
2615  0531 b60f          	ld	a,_PFDR
2616  0533 a584          	bcp	a,#132
2617  0535 27fa          	jreq	L5502
2618                     ; 293 					byGate = _btst(_Pa_Gate, _Pin_Gate);
2620  0537 b603          	ld	a,_PBDR
2621  0539 a480          	and	a,#128
2622  053b b7fe          	ld	_scanningHeadSignalAcquireGate$L-2,a
2624  053d               L5602:
2625                     ; 294 					while((_Pa_EncoderAB & 0b10000100)==0b10000000); 	// Enc = 1 & Zero = 0
2627  053d b60f          	ld	a,_PFDR
2628  053f a484          	and	a,#132
2629  0541 a180          	cp	a,#128
2630  0543 27f8          	jreq	L5602
2631                     ; 295 					m_arbyEncoderSignals[0]++;
2633  0545 c60028        	ld	a,_m_arbyEncoderSignals+1
2634  0548 ab01          	add	a,#1
2635  054a c70028        	ld	_m_arbyEncoderSignals+1,a
2636  054d c60027        	ld	a,_m_arbyEncoderSignals
2637  0550 a900          	adc	a,#0
2638  0552 c70027        	ld	_m_arbyEncoderSignals,a
2640  0555               L3702:
2641                     ; 296 					while((_Pa_EncoderAB & 0b10000100)==0b00000000); 	// Enc = 0 & Zero = 0
2643  0555 b60f          	ld	a,_PFDR
2644  0557 a584          	bcp	a,#132
2645  0559 27fa          	jreq	L3702
2646                     ; 297 					if(byPrevGate != byGate)
2648  055b b6fd          	ld	a,_scanningHeadSignalAcquireGate$L-3
2649  055d b1fe          	cp	a,_scanningHeadSignalAcquireGate$L-2
2650  055f 2742          	jreq	L1402
2651                     ; 299 						m_arbyEncoderGate[byFoundIndex]   = m_arbyEncoderSignals[0];
2653  0561 beff          	ld	x,_scanningHeadSignalAcquireGate$L-1
2654  0563 58            	sll	x
2655  0564 c60027        	ld	a,_m_arbyEncoderSignals
2656  0567 d70007        	ld	(_m_arbyEncoderGate,x),a
2657  056a c60028        	ld	a,_m_arbyEncoderSignals+1
2658  056d d70008        	ld	(_m_arbyEncoderGate+1,x),a
2659                     ; 300 						m_arbyEncoderGate[byFoundIndex+1] = m_arbyEncoderSignals[1];
2661  0570 beff          	ld	x,_scanningHeadSignalAcquireGate$L-1
2662  0572 58            	sll	x
2663  0573 c60029        	ld	a,_m_arbyEncoderSignals+2
2664  0576 d70009        	ld	(_m_arbyEncoderGate+2,x),a
2665  0579 c6002a        	ld	a,_m_arbyEncoderSignals+3
2666  057c d7000a        	ld	(_m_arbyEncoderGate+3,x),a
2667                     ; 301 						m_arbyEncoderGate[byFoundIndex+2] = m_arbyEncoderSignals[2];
2669  057f beff          	ld	x,_scanningHeadSignalAcquireGate$L-1
2670  0581 58            	sll	x
2671  0582 c6002b        	ld	a,_m_arbyEncoderSignals+4
2672  0585 d7000b        	ld	(_m_arbyEncoderGate+4,x),a
2673  0588 c6002c        	ld	a,_m_arbyEncoderSignals+5
2674  058b d7000c        	ld	(_m_arbyEncoderGate+5,x),a
2675                     ; 302 						m_arbyEncoderGate[byFoundIndex+3] = m_arbyEncoderSignals[3];
2677  058e beff          	ld	x,_scanningHeadSignalAcquireGate$L-1
2678  0590 58            	sll	x
2679  0591 c6002d        	ld	a,_m_arbyEncoderSignals+6
2680  0594 d7000d        	ld	(_m_arbyEncoderGate+6,x),a
2681  0597 c6002e        	ld	a,_m_arbyEncoderSignals+7
2682  059a d7000e        	ld	(_m_arbyEncoderGate+7,x),a
2683                     ; 303 						byFoundIndex+=4;
2685  059d b6ff          	ld	a,_scanningHeadSignalAcquireGate$L-1
2686  059f ab04          	add	a,#4
2687  05a1 b7ff          	ld	_scanningHeadSignalAcquireGate$L-1,a
2688  05a3               L1402:
2689                     ; 307 				if (!_btst(_Pa_Encoder0, _Pin_Encoder0))
2691  05a3 b60f          	ld	a,_PFDR
2692  05a5 a504          	bcp	a,#4
2693  05a7 2702          	jreq	L65
2694  05a9 207e          	jp	L1012
2695  05ab               L65:
2697  05ab               L5012:
2698                     ; 309 					while((_Pa_EncoderAB & 0b10000100)==0b10000000); 	// Enc = 1 & Zero = 0
2700  05ab b60f          	ld	a,_PFDR
2701  05ad a484          	and	a,#132
2702  05af a180          	cp	a,#128
2703  05b1 27f8          	jreq	L5012
2704                     ; 310 					byPrevGate = byGate;
2706  05b3 b6fe          	ld	a,_scanningHeadSignalAcquireGate$L-2
2707  05b5 b7fd          	ld	_scanningHeadSignalAcquireGate$L-3,a
2709  05b7               L5112:
2710                     ; 311 					while((_Pa_EncoderAB & 0b10000100)==0b00000000); 	// Enc = 0 & Zero = 0
2712  05b7 b60f          	ld	a,_PFDR
2713  05b9 a584          	bcp	a,#132
2714  05bb 27fa          	jreq	L5112
2715                     ; 312 					byGate = _btst(_Pa_Gate, _Pin_Gate);
2717  05bd b603          	ld	a,_PBDR
2718  05bf a480          	and	a,#128
2719  05c1 b7fe          	ld	_scanningHeadSignalAcquireGate$L-2,a
2721  05c3               L5212:
2722                     ; 313 					while((_Pa_EncoderAB & 0b10000100)==0b10000000); 	// Enc = 1 & Zero = 0
2724  05c3 b60f          	ld	a,_PFDR
2725  05c5 a484          	and	a,#132
2726  05c7 a180          	cp	a,#128
2727  05c9 27f8          	jreq	L5212
2728                     ; 314 					m_arbyEncoderSignals[1]++;
2730  05cb c6002a        	ld	a,_m_arbyEncoderSignals+3
2731  05ce ab01          	add	a,#1
2732  05d0 c7002a        	ld	_m_arbyEncoderSignals+3,a
2733  05d3 c60029        	ld	a,_m_arbyEncoderSignals+2
2734  05d6 a900          	adc	a,#0
2735  05d8 c70029        	ld	_m_arbyEncoderSignals+2,a
2737  05db               L3312:
2738                     ; 315 					while((_Pa_EncoderAB & 0b10000100)==0b00000000); 	// Enc = 0 & Zero = 0
2740  05db b60f          	ld	a,_PFDR
2741  05dd a584          	bcp	a,#132
2742  05df 27fa          	jreq	L3312
2743                     ; 316 					if(byPrevGate != byGate)
2745  05e1 b6fd          	ld	a,_scanningHeadSignalAcquireGate$L-3
2746  05e3 b1fe          	cp	a,_scanningHeadSignalAcquireGate$L-2
2747  05e5 2742          	jreq	L1012
2748                     ; 318 						m_arbyEncoderGate[byFoundIndex]   = m_arbyEncoderSignals[0];
2750  05e7 beff          	ld	x,_scanningHeadSignalAcquireGate$L-1
2751  05e9 58            	sll	x
2752  05ea c60027        	ld	a,_m_arbyEncoderSignals
2753  05ed d70007        	ld	(_m_arbyEncoderGate,x),a
2754  05f0 c60028        	ld	a,_m_arbyEncoderSignals+1
2755  05f3 d70008        	ld	(_m_arbyEncoderGate+1,x),a
2756                     ; 319 						m_arbyEncoderGate[byFoundIndex+1] = m_arbyEncoderSignals[1];
2758  05f6 beff          	ld	x,_scanningHeadSignalAcquireGate$L-1
2759  05f8 58            	sll	x
2760  05f9 c60029        	ld	a,_m_arbyEncoderSignals+2
2761  05fc d70009        	ld	(_m_arbyEncoderGate+2,x),a
2762  05ff c6002a        	ld	a,_m_arbyEncoderSignals+3
2763  0602 d7000a        	ld	(_m_arbyEncoderGate+3,x),a
2764                     ; 320 						m_arbyEncoderGate[byFoundIndex+2] = m_arbyEncoderSignals[2];
2766  0605 beff          	ld	x,_scanningHeadSignalAcquireGate$L-1
2767  0607 58            	sll	x
2768  0608 c6002b        	ld	a,_m_arbyEncoderSignals+4
2769  060b d7000b        	ld	(_m_arbyEncoderGate+4,x),a
2770  060e c6002c        	ld	a,_m_arbyEncoderSignals+5
2771  0611 d7000c        	ld	(_m_arbyEncoderGate+5,x),a
2772                     ; 321 						m_arbyEncoderGate[byFoundIndex+3] = m_arbyEncoderSignals[3];
2774  0614 beff          	ld	x,_scanningHeadSignalAcquireGate$L-1
2775  0616 58            	sll	x
2776  0617 c6002d        	ld	a,_m_arbyEncoderSignals+6
2777  061a d7000d        	ld	(_m_arbyEncoderGate+6,x),a
2778  061d c6002e        	ld	a,_m_arbyEncoderSignals+7
2779  0620 d7000e        	ld	(_m_arbyEncoderGate+7,x),a
2780                     ; 322 						byFoundIndex+=4;
2782  0623 b6ff          	ld	a,_scanningHeadSignalAcquireGate$L-1
2783  0625 ab04          	add	a,#4
2784  0627 b7ff          	ld	_scanningHeadSignalAcquireGate$L-1,a
2785  0629               L1012:
2786                     ; 326 				if (!_btst(_Pa_Encoder0, _Pin_Encoder0))
2788  0629 b60f          	ld	a,_PFDR
2789  062b a504          	bcp	a,#4
2790  062d 2702          	jreq	L06
2791  062f 207e          	jp	L1412
2792  0631               L06:
2794  0631               L5412:
2795                     ; 328 					while((_Pa_EncoderAB & 0b10000100)==0b10000000); 	// Enc = 1 & Zero = 0
2797  0631 b60f          	ld	a,_PFDR
2798  0633 a484          	and	a,#132
2799  0635 a180          	cp	a,#128
2800  0637 27f8          	jreq	L5412
2801                     ; 329 					byPrevGate = byGate;
2803  0639 b6fe          	ld	a,_scanningHeadSignalAcquireGate$L-2
2804  063b b7fd          	ld	_scanningHeadSignalAcquireGate$L-3,a
2806  063d               L5512:
2807                     ; 330 					while((_Pa_EncoderAB & 0b10000100)==0b00000000); 	// Enc = 0 & Zero = 0
2809  063d b60f          	ld	a,_PFDR
2810  063f a584          	bcp	a,#132
2811  0641 27fa          	jreq	L5512
2812                     ; 331 					byGate = _btst(_Pa_Gate, _Pin_Gate);
2814  0643 b603          	ld	a,_PBDR
2815  0645 a480          	and	a,#128
2816  0647 b7fe          	ld	_scanningHeadSignalAcquireGate$L-2,a
2818  0649               L5612:
2819                     ; 332 					while((_Pa_EncoderAB & 0b10000100)==0b10000000); 	// Enc = 1 & Zero = 0
2821  0649 b60f          	ld	a,_PFDR
2822  064b a484          	and	a,#132
2823  064d a180          	cp	a,#128
2824  064f 27f8          	jreq	L5612
2825                     ; 333 					m_arbyEncoderSignals[2]++;
2827  0651 c6002c        	ld	a,_m_arbyEncoderSignals+5
2828  0654 ab01          	add	a,#1
2829  0656 c7002c        	ld	_m_arbyEncoderSignals+5,a
2830  0659 c6002b        	ld	a,_m_arbyEncoderSignals+4
2831  065c a900          	adc	a,#0
2832  065e c7002b        	ld	_m_arbyEncoderSignals+4,a
2834  0661               L3712:
2835                     ; 334 					while((_Pa_EncoderAB & 0b10000100)==0b00000000); 	// Enc = 0 & Zero = 0
2837  0661 b60f          	ld	a,_PFDR
2838  0663 a584          	bcp	a,#132
2839  0665 27fa          	jreq	L3712
2840                     ; 335 					if(byPrevGate != byGate)
2842  0667 b6fd          	ld	a,_scanningHeadSignalAcquireGate$L-3
2843  0669 b1fe          	cp	a,_scanningHeadSignalAcquireGate$L-2
2844  066b 2742          	jreq	L1412
2845                     ; 337 						m_arbyEncoderGate[byFoundIndex]   = m_arbyEncoderSignals[0];
2847  066d beff          	ld	x,_scanningHeadSignalAcquireGate$L-1
2848  066f 58            	sll	x
2849  0670 c60027        	ld	a,_m_arbyEncoderSignals
2850  0673 d70007        	ld	(_m_arbyEncoderGate,x),a
2851  0676 c60028        	ld	a,_m_arbyEncoderSignals+1
2852  0679 d70008        	ld	(_m_arbyEncoderGate+1,x),a
2853                     ; 338 						m_arbyEncoderGate[byFoundIndex+1] = m_arbyEncoderSignals[1];
2855  067c beff          	ld	x,_scanningHeadSignalAcquireGate$L-1
2856  067e 58            	sll	x
2857  067f c60029        	ld	a,_m_arbyEncoderSignals+2
2858  0682 d70009        	ld	(_m_arbyEncoderGate+2,x),a
2859  0685 c6002a        	ld	a,_m_arbyEncoderSignals+3
2860  0688 d7000a        	ld	(_m_arbyEncoderGate+3,x),a
2861                     ; 339 						m_arbyEncoderGate[byFoundIndex+2] = m_arbyEncoderSignals[2];
2863  068b beff          	ld	x,_scanningHeadSignalAcquireGate$L-1
2864  068d 58            	sll	x
2865  068e c6002b        	ld	a,_m_arbyEncoderSignals+4
2866  0691 d7000b        	ld	(_m_arbyEncoderGate+4,x),a
2867  0694 c6002c        	ld	a,_m_arbyEncoderSignals+5
2868  0697 d7000c        	ld	(_m_arbyEncoderGate+5,x),a
2869                     ; 340 						m_arbyEncoderGate[byFoundIndex+3] = m_arbyEncoderSignals[3];
2871  069a beff          	ld	x,_scanningHeadSignalAcquireGate$L-1
2872  069c 58            	sll	x
2873  069d c6002d        	ld	a,_m_arbyEncoderSignals+6
2874  06a0 d7000d        	ld	(_m_arbyEncoderGate+6,x),a
2875  06a3 c6002e        	ld	a,_m_arbyEncoderSignals+7
2876  06a6 d7000e        	ld	(_m_arbyEncoderGate+7,x),a
2877                     ; 341 						byFoundIndex+=4;
2879  06a9 b6ff          	ld	a,_scanningHeadSignalAcquireGate$L-1
2880  06ab ab04          	add	a,#4
2881  06ad b7ff          	ld	_scanningHeadSignalAcquireGate$L-1,a
2882  06af               L1412:
2883                     ; 345 				if (!_btst(_Pa_Encoder0, _Pin_Encoder0))
2885  06af b60f          	ld	a,_PFDR
2886  06b1 a504          	bcp	a,#4
2887  06b3 2702          	jreq	L26
2888  06b5 207e          	jp	L5302
2889  06b7               L26:
2891  06b7               L5022:
2892                     ; 347 					while((_Pa_EncoderAB & 0b10000100)==0b10000000); 	// Enc = 1 & Zero = 0
2894  06b7 b60f          	ld	a,_PFDR
2895  06b9 a484          	and	a,#132
2896  06bb a180          	cp	a,#128
2897  06bd 27f8          	jreq	L5022
2898                     ; 348 					byPrevGate = byGate;
2900  06bf b6fe          	ld	a,_scanningHeadSignalAcquireGate$L-2
2901  06c1 b7fd          	ld	_scanningHeadSignalAcquireGate$L-3,a
2903  06c3               L5122:
2904                     ; 349 					while((_Pa_EncoderAB & 0b10000100)==0b00000000); 	// Enc = 0 & Zero = 0
2906  06c3 b60f          	ld	a,_PFDR
2907  06c5 a584          	bcp	a,#132
2908  06c7 27fa          	jreq	L5122
2909                     ; 350 					byGate = _btst(_Pa_Gate, _Pin_Gate);
2911  06c9 b603          	ld	a,_PBDR
2912  06cb a480          	and	a,#128
2913  06cd b7fe          	ld	_scanningHeadSignalAcquireGate$L-2,a
2915  06cf               L5222:
2916                     ; 351 					while((_Pa_EncoderAB & 0b10000100)==0b10000000); 	// Enc = 1 & Zero = 0
2918  06cf b60f          	ld	a,_PFDR
2919  06d1 a484          	and	a,#132
2920  06d3 a180          	cp	a,#128
2921  06d5 27f8          	jreq	L5222
2922                     ; 352 					m_arbyEncoderSignals[3]++;
2924  06d7 c6002e        	ld	a,_m_arbyEncoderSignals+7
2925  06da ab01          	add	a,#1
2926  06dc c7002e        	ld	_m_arbyEncoderSignals+7,a
2927  06df c6002d        	ld	a,_m_arbyEncoderSignals+6
2928  06e2 a900          	adc	a,#0
2929  06e4 c7002d        	ld	_m_arbyEncoderSignals+6,a
2931  06e7               L3322:
2932                     ; 353 					while((_Pa_EncoderAB & 0b10000100)==0b00000000); 	// Enc = 0 & Zero = 0
2934  06e7 b60f          	ld	a,_PFDR
2935  06e9 a584          	bcp	a,#132
2936  06eb 27fa          	jreq	L3322
2937                     ; 354 					if(byPrevGate != byGate)
2939  06ed b6fd          	ld	a,_scanningHeadSignalAcquireGate$L-3
2940  06ef b1fe          	cp	a,_scanningHeadSignalAcquireGate$L-2
2941  06f1 2742          	jreq	L5302
2942                     ; 356 						m_arbyEncoderGate[byFoundIndex]   = m_arbyEncoderSignals[0];
2944  06f3 beff          	ld	x,_scanningHeadSignalAcquireGate$L-1
2945  06f5 58            	sll	x
2946  06f6 c60027        	ld	a,_m_arbyEncoderSignals
2947  06f9 d70007        	ld	(_m_arbyEncoderGate,x),a
2948  06fc c60028        	ld	a,_m_arbyEncoderSignals+1
2949  06ff d70008        	ld	(_m_arbyEncoderGate+1,x),a
2950                     ; 357 						m_arbyEncoderGate[byFoundIndex+1] = m_arbyEncoderSignals[1];
2952  0702 beff          	ld	x,_scanningHeadSignalAcquireGate$L-1
2953  0704 58            	sll	x
2954  0705 c60029        	ld	a,_m_arbyEncoderSignals+2
2955  0708 d70009        	ld	(_m_arbyEncoderGate+2,x),a
2956  070b c6002a        	ld	a,_m_arbyEncoderSignals+3
2957  070e d7000a        	ld	(_m_arbyEncoderGate+3,x),a
2958                     ; 358 						m_arbyEncoderGate[byFoundIndex+2] = m_arbyEncoderSignals[2];
2960  0711 beff          	ld	x,_scanningHeadSignalAcquireGate$L-1
2961  0713 58            	sll	x
2962  0714 c6002b        	ld	a,_m_arbyEncoderSignals+4
2963  0717 d7000b        	ld	(_m_arbyEncoderGate+4,x),a
2964  071a c6002c        	ld	a,_m_arbyEncoderSignals+5
2965  071d d7000c        	ld	(_m_arbyEncoderGate+5,x),a
2966                     ; 359 						m_arbyEncoderGate[byFoundIndex+3] = m_arbyEncoderSignals[3];
2968  0720 beff          	ld	x,_scanningHeadSignalAcquireGate$L-1
2969  0722 58            	sll	x
2970  0723 c6002d        	ld	a,_m_arbyEncoderSignals+6
2971  0726 d7000d        	ld	(_m_arbyEncoderGate+6,x),a
2972  0729 c6002e        	ld	a,_m_arbyEncoderSignals+7
2973  072c d7000e        	ld	(_m_arbyEncoderGate+7,x),a
2974                     ; 360 						byFoundIndex+=4;
2976  072f b6ff          	ld	a,_scanningHeadSignalAcquireGate$L-1
2977  0731 ab04          	add	a,#4
2978  0733 b7ff          	ld	_scanningHeadSignalAcquireGate$L-1,a
2979  0735               L5302:
2980                     ; 286 			while (!_btst(_Pa_Encoder0, _Pin_Encoder0))
2982  0735 b60f          	ld	a,_PFDR
2983  0737 a504          	bcp	a,#4
2984  0739 2603          	jrne	L46
2985  073b cc051d        	jp	L3302
2986  073e               L46:
2987  073e               L1302:
2988                     ; 367 		i=4;
2990  073e a604          	ld	a,#4
2991  0740 b7fc          	ld	_scanningHeadSignalAcquireGate$L-4,a
2992                     ; 368 		m_woEncoderGateEnd = 0x0000;
2994  0742 4f            	clr	a
2995  0743 c7002f        	ld	_m_woEncoderGateEnd,a
2996  0746 c70030        	ld	_m_woEncoderGateEnd+1,a
2998  0749 2017          	jra	L5422
2999  074b               L1422:
3000                     ; 371 			m_woEncoderGateEnd += (WORD) m_arbyEncoderGate[--byFoundIndex];
3002  074b 3aff          	dec	_scanningHeadSignalAcquireGate$L-1
3003  074d beff          	ld	x,_scanningHeadSignalAcquireGate$L-1
3004  074f 58            	sll	x
3005  0750 c60030        	ld	a,_m_woEncoderGateEnd+1
3006  0753 db0008        	add	a,(_m_arbyEncoderGate+1,x)
3007  0756 c70030        	ld	_m_woEncoderGateEnd+1,a
3008  0759 c6002f        	ld	a,_m_woEncoderGateEnd
3009  075c d90007        	adc	a,(_m_arbyEncoderGate,x)
3010  075f c7002f        	ld	_m_woEncoderGateEnd,a
3011  0762               L5422:
3012                     ; 369 		while(i-->0)
3014  0762 b6fc          	ld	a,_scanningHeadSignalAcquireGate$L-4
3015  0764 3afc          	dec	_scanningHeadSignalAcquireGate$L-4
3016  0766 4d            	tnz	a
3017  0767 26e2          	jrne	L1422
3018                     ; 373 		i=4;
3020  0769 a604          	ld	a,#4
3021  076b b7fc          	ld	_scanningHeadSignalAcquireGate$L-4,a
3022                     ; 374 		m_woEncoderGateStart = 0x0000;
3024  076d 4f            	clr	a
3025  076e c70031        	ld	_m_woEncoderGateStart,a
3026  0771 c70032        	ld	_m_woEncoderGateStart+1,a
3028  0774 2017          	jra	L5522
3029  0776               L1522:
3030                     ; 377 			m_woEncoderGateStart += (WORD) m_arbyEncoderGate[--byFoundIndex];
3032  0776 3aff          	dec	_scanningHeadSignalAcquireGate$L-1
3033  0778 beff          	ld	x,_scanningHeadSignalAcquireGate$L-1
3034  077a 58            	sll	x
3035  077b c60032        	ld	a,_m_woEncoderGateStart+1
3036  077e db0008        	add	a,(_m_arbyEncoderGate+1,x)
3037  0781 c70032        	ld	_m_woEncoderGateStart+1,a
3038  0784 c60031        	ld	a,_m_woEncoderGateStart
3039  0787 d90007        	adc	a,(_m_arbyEncoderGate,x)
3040  078a c70031        	ld	_m_woEncoderGateStart,a
3041  078d               L5522:
3042                     ; 375 		while(i-->0)
3044  078d b6fc          	ld	a,_scanningHeadSignalAcquireGate$L-4
3045  078f 3afc          	dec	_scanningHeadSignalAcquireGate$L-4
3046  0791 4d            	tnz	a
3047  0792 26e2          	jrne	L1522
3048                     ; 380 		m_woEncoderGateWidth = MIN(m_woEncoderGateEnd-m_woEncoderGateStart, ENCODER_PULSES-m_woEncoderGateEnd+m_woEncoderGateStart);
3050  0794 c60030        	ld	a,_m_woEncoderGateEnd+1
3051  0797 ce002f        	ld	x,_m_woEncoderGateEnd
3052  079a c00032        	sub	a,_m_woEncoderGateStart+1
3053  079d 88            	push	a
3054  079e 9f            	ld	a,x
3055  079f c20031        	sbc	a,_m_woEncoderGateStart
3056  07a2 97            	ld	x,a
3057  07a3 84            	pop	a
3058  07a4 b7fb          	ld	_scanningHeadSignalAcquireGate$L-5,a
3059  07a6 bffa          	ld	_scanningHeadSignalAcquireGate$L-6,x
3060  07a8 a604          	ld	a,#4
3061  07aa 97            	ld	x,a
3062  07ab 4f            	clr	a
3063  07ac c00030        	sub	a,_m_woEncoderGateEnd+1
3064  07af 88            	push	a
3065  07b0 9f            	ld	a,x
3066  07b1 c2002f        	sbc	a,_m_woEncoderGateEnd
3067  07b4 97            	ld	x,a
3068  07b5 84            	pop	a
3069  07b6 cb0032        	add	a,_m_woEncoderGateStart+1
3070  07b9 88            	push	a
3071  07ba 9f            	ld	a,x
3072  07bb c90031        	adc	a,_m_woEncoderGateStart
3073  07be 97            	ld	x,a
3074  07bf 84            	pop	a
3075  07c0 b0fb          	sub	a,_scanningHeadSignalAcquireGate$L-5
3076  07c2 9f            	ld	a,x
3077  07c3 b2fa          	sbc	a,_scanningHeadSignalAcquireGate$L-6
3078  07c5 241a          	jruge	L62
3079  07c7 a604          	ld	a,#4
3080  07c9 97            	ld	x,a
3081  07ca 4f            	clr	a
3082  07cb c00030        	sub	a,_m_woEncoderGateEnd+1
3083  07ce 88            	push	a
3084  07cf 9f            	ld	a,x
3085  07d0 c2002f        	sbc	a,_m_woEncoderGateEnd
3086  07d3 97            	ld	x,a
3087  07d4 84            	pop	a
3088  07d5 cb0032        	add	a,_m_woEncoderGateStart+1
3089  07d8 88            	push	a
3090  07d9 9f            	ld	a,x
3091  07da c90031        	adc	a,_m_woEncoderGateStart
3092  07dd 97            	ld	x,a
3093  07de 84            	pop	a
3094  07df 2010          	jra	L03
3095  07e1               L62:
3096  07e1 c60030        	ld	a,_m_woEncoderGateEnd+1
3097  07e4 ce002f        	ld	x,_m_woEncoderGateEnd
3098  07e7 c00032        	sub	a,_m_woEncoderGateStart+1
3099  07ea 88            	push	a
3100  07eb 9f            	ld	a,x
3101  07ec c20031        	sbc	a,_m_woEncoderGateStart
3102  07ef 97            	ld	x,a
3103  07f0 84            	pop	a
3104  07f1               L03:
3105  07f1 c70006        	ld	_m_woEncoderGateWidth+1,a
3106  07f4 cf0005        	ld	_m_woEncoderGateWidth,x
3107                     ; 383 		if(m_woEncoderGateEnd-m_woEncoderGateStart>(ENCODER_PULSES-m_woEncoderGateEnd+m_woEncoderGateStart) &(ENCODER_PULSES-1))
3109  07f7 c60030        	ld	a,_m_woEncoderGateEnd+1
3110  07fa ce002f        	ld	x,_m_woEncoderGateEnd
3111  07fd c00032        	sub	a,_m_woEncoderGateStart+1
3112  0800 88            	push	a
3113  0801 9f            	ld	a,x
3114  0802 c20031        	sbc	a,_m_woEncoderGateStart
3115  0805 97            	ld	x,a
3116  0806 84            	pop	a
3117  0807 b7fb          	ld	_scanningHeadSignalAcquireGate$L-5,a
3118  0809 bffa          	ld	_scanningHeadSignalAcquireGate$L-6,x
3119  080b a604          	ld	a,#4
3120  080d 97            	ld	x,a
3121  080e 4f            	clr	a
3122  080f c00030        	sub	a,_m_woEncoderGateEnd+1
3123  0812 88            	push	a
3124  0813 9f            	ld	a,x
3125  0814 c2002f        	sbc	a,_m_woEncoderGateEnd
3126  0817 97            	ld	x,a
3127  0818 84            	pop	a
3128  0819 cb0032        	add	a,_m_woEncoderGateStart+1
3129  081c 88            	push	a
3130  081d 9f            	ld	a,x
3131  081e c90031        	adc	a,_m_woEncoderGateStart
3132  0821 97            	ld	x,a
3133  0822 84            	pop	a
3134  0823 b0fb          	sub	a,_scanningHeadSignalAcquireGate$L-5
3135  0825 9f            	ld	a,x
3136  0826 b2fa          	sbc	a,_scanningHeadSignalAcquireGate$L-6
3137  0828 2404          	jruge	L23
3138  082a a601          	ld	a,#1
3139  082c 2001          	jra	L43
3140  082e               L23:
3141  082e 4f            	clr	a
3142  082f               L43:
3143  082f a5ff          	bcp	a,#255
3144  0831 272a          	jreq	L1622
3145                     ; 385 			m_woEncoderGateStart = m_woEncoderGateEnd;
3147  0833 ce002f        	ld	x,_m_woEncoderGateEnd
3148  0836 cf0031        	ld	_m_woEncoderGateStart,x
3149  0839 c60030        	ld	a,_m_woEncoderGateEnd+1
3150  083c c70032        	ld	_m_woEncoderGateStart+1,a
3151                     ; 386 			m_woEncoderGateEnd = (m_woEncoderGateEnd+m_woEncoderGateWidth)&(ENCODER_PULSES-1);
3153  083f c60030        	ld	a,_m_woEncoderGateEnd+1
3154  0842 ce002f        	ld	x,_m_woEncoderGateEnd
3155  0845 cb0006        	add	a,_m_woEncoderGateWidth+1
3156  0848 88            	push	a
3157  0849 9f            	ld	a,x
3158  084a c90005        	adc	a,_m_woEncoderGateWidth
3159  084d 97            	ld	x,a
3160  084e 84            	pop	a
3161  084f a4ff          	and	a,#255
3162  0851 88            	push	a
3163  0852 9f            	ld	a,x
3164  0853 a403          	and	a,#3
3165  0855 97            	ld	x,a
3166  0856 84            	pop	a
3167  0857 c70030        	ld	_m_woEncoderGateEnd+1,a
3168  085a cf002f        	ld	_m_woEncoderGateEnd,x
3169  085d               L1622:
3170                     ; 389 		m_woEncoderGateStart = (ENCODER_PULSES + m_woEncoderGateStart - 8) &(ENCODER_PULSES-1);
3172  085d c60032        	ld	a,_m_woEncoderGateStart+1
3173  0860 ce0031        	ld	x,_m_woEncoderGateStart
3174  0863 abf8          	add	a,#248
3175  0865 88            	push	a
3176  0866 9f            	ld	a,x
3177  0867 a903          	adc	a,#3
3178  0869 97            	ld	x,a
3179  086a 84            	pop	a
3180  086b a4ff          	and	a,#255
3181  086d 88            	push	a
3182  086e 9f            	ld	a,x
3183  086f a403          	and	a,#3
3184  0871 97            	ld	x,a
3185  0872 84            	pop	a
3186  0873 c70032        	ld	_m_woEncoderGateStart+1,a
3187  0876 cf0031        	ld	_m_woEncoderGateStart,x
3188                     ; 390 		m_woEncoderGateEnd = (ENCODER_PULSES + m_woEncoderGateEnd - 8)&(ENCODER_PULSES-1);
3190  0879 c60030        	ld	a,_m_woEncoderGateEnd+1
3191  087c ce002f        	ld	x,_m_woEncoderGateEnd
3192  087f abf8          	add	a,#248
3193  0881 88            	push	a
3194  0882 9f            	ld	a,x
3195  0883 a903          	adc	a,#3
3196  0885 97            	ld	x,a
3197  0886 84            	pop	a
3198  0887 a4ff          	and	a,#255
3199  0889 88            	push	a
3200  088a 9f            	ld	a,x
3201  088b a403          	and	a,#3
3202  088d 97            	ld	x,a
3203  088e 84            	pop	a
3204  088f c70030        	ld	_m_woEncoderGateEnd+1,a
3205  0892 cf002f        	ld	_m_woEncoderGateEnd,x
3206  0895               L7161:
3207                     ; 393 }
3210  0895 81            	ret
3253                     ; 397 void scanningHeadSignalAcquire(void)
3253                     ; 398 {
3254                     	switch	.text
3256                     	xref.b	_scanningHeadSignalAcquire$L
3257  0896               _scanningHeadSignalAcquire:
3260                     ; 399 	BYTE byScanningHeadValue	  = 0x00;;
3262  0896 3fff          	clr	_scanningHeadSignalAcquire$L-1
3263                     ; 400 	m_byScanningHeadSignalPointer = m_arbyScanningHeadSignal;
3266  0898 ae36          	ld	x,#high(_m_arbyScanningHeadSignal)
3267  089a cf0034        	ld	_m_byScanningHeadSignalPointer,x
3268  089d a636          	ld	a,#low(_m_arbyScanningHeadSignal)
3269  089f c70035        	ld	_m_byScanningHeadSignalPointer+1,a
3270                     ; 402 	if (m_woEncoderGateHiLow)
3272  08a2 c60000        	ld	a,_m_woEncoderGateHiLow
3273  08a5 4d            	tnz	a
3274  08a6 2603          	jrne	L07
3275  08a8 cc0a1a        	jp	L7652
3276  08ab               L07:
3278  08ab               L5032:
3279                     ; 404 		while(_btst(_Pa_Encoder0, _Pin_Encoder0) && !displayIsKeyPress());
3281  08ab b60f          	ld	a,_PFDR
3282  08ad a504          	bcp	a,#4
3283  08af 2706          	jreq	L5132
3285  08b1 cd0000        	call	_displayIsKeyPress
3287  08b4 4d            	tnz	a
3288  08b5 27f4          	jreq	L5032
3289  08b7               L5132:
3290                     ; 405 		while(!_btst(_Pa_Encoder0, _Pin_Encoder0)&& !displayIsKeyPress());
3292  08b7 b60f          	ld	a,_PFDR
3293  08b9 a504          	bcp	a,#4
3294  08bb 2606          	jrne	L1232
3296  08bd cd0000        	call	_displayIsKeyPress
3298  08c0 4d            	tnz	a
3299  08c1 27f4          	jreq	L5132
3300  08c3               L1232:
3301                     ; 407 		if (!displayIsKeyPress())
3303  08c3 cd0000        	call	_displayIsKeyPress
3305  08c6 4d            	tnz	a
3306  08c7 2703          	jreq	L27
3307  08c9 cc0b76        	jp	L3652
3308  08cc               L27:
3310  08cc cc0a0e        	jp	L7232
3311  08cf               L5232:
3312                     ; 411 				if _btst(_Pa_Encoder0, _Pin_Encoder0)
3314  08cf b60f          	ld	a,_PFDR
3315  08d1 a504          	bcp	a,#4
3316  08d3 2763          	jreq	L3332
3317                     ; 413 					ADCCSR = ADSPEED | ADON | _Ain_S1Analogic; //PF4							// enables the A/D peripheral on Scanning Head
3319  08d5 a66a          	ld	a,#106
3320  08d7 b770          	ld	_ADCCSR,a
3322  08d9               L1432:
3323                     ; 414 					while((_Pa_EncoderAB & 0b10000100)==0b10000100); 				// Enc = 1 & Zero = 1
3325  08d9 b60f          	ld	a,_PFDR
3326  08db a484          	and	a,#132
3327  08dd a184          	cp	a,#132
3328  08df 27f8          	jreq	L1432
3329                     ; 415 					m_byScanningHeadValue += (byScanningHeadValue & 0b11000000)>>6;
3331  08e1 b6ff          	ld	a,_scanningHeadSignalAcquire$L-1
3332  08e3 a4c0          	and	a,#192
3333  08e5 4e            	swap	a
3334  08e6 44            	srl	a
3335  08e7 44            	srl	a
3336  08e8 a403          	and	a,#3
3337  08ea cb0033        	add	a,_m_byScanningHeadValue
3338  08ed c70033        	ld	_m_byScanningHeadValue,a
3340  08f0               L7432:
3341                     ; 416 					while((_Pa_EncoderAB & 0b10000100)==0b00000100); 				// Enc = 0 & Zero = 1
3343  08f0 b60f          	ld	a,_PFDR
3344  08f2 a484          	and	a,#132
3345  08f4 a104          	cp	a,#4
3346  08f6 27f8          	jreq	L7432
3347                     ; 417 					(*m_byScanningHeadSignalPointer) = m_byScanningHeadValue;
3349  08f8 c60034        	ld	a,_m_byScanningHeadSignalPointer
3350  08fb b700          	ld	c_x,a
3351  08fd ce0035        	ld	x,_m_byScanningHeadSignalPointer+1
3352  0900 c60033        	ld	a,_m_byScanningHeadValue
3353  0903 bf01          	ld	c_x+1,x
3354  0905 92c700        	ld	[c_x.w],a
3356  0908               L7532:
3357                     ; 418 					while((_Pa_EncoderAB & 0b10000100)==0b10000100); 				// Enc = 1 & Zero = 1
3359  0908 b60f          	ld	a,_PFDR
3360  090a a484          	and	a,#132
3361  090c a184          	cp	a,#132
3362  090e 27f8          	jreq	L7532
3363                     ; 419 					m_byScanningHeadSignalPointer++;			
3365  0910 c60035        	ld	a,_m_byScanningHeadSignalPointer+1
3366  0913 ab01          	add	a,#1
3367  0915 c70035        	ld	_m_byScanningHeadSignalPointer+1,a
3368  0918 c60034        	ld	a,_m_byScanningHeadSignalPointer
3369  091b a900          	adc	a,#0
3370  091d c70034        	ld	_m_byScanningHeadSignalPointer,a
3372  0920               L5632:
3373                     ; 420 					while((_Pa_EncoderAB & 0b10000100)==0b00000100); 				// Enc = 0 & Zero = 1
3375  0920 b60f          	ld	a,_PFDR
3376  0922 a484          	and	a,#132
3377  0924 a104          	cp	a,#4
3378  0926 27f8          	jreq	L5632
3380  0928               L3732:
3381                     ; 421 					while(!(ADCCSR & EOC)&& (_btst(_Pa_Encoder0, _Pin_Encoder0)));	// waits for the end of the conversion
3383  0928 b670          	ld	a,_ADCCSR
3384  092a a580          	bcp	a,#128
3385  092c 2606          	jrne	L7732
3387  092e b60f          	ld	a,_PFDR
3388  0930 a504          	bcp	a,#4
3389  0932 26f4          	jrne	L3732
3390  0934               L7732:
3391                     ; 422 					byScanningHeadValue = ADCDRH;
3393  0934 b671          	ld	a,_ADCDRH
3394  0936 b7ff          	ld	_scanningHeadSignalAcquire$L-1,a
3395  0938               L3332:
3396                     ; 425 				if _btst(_Pa_Encoder0, _Pin_Encoder0)
3398  0938 b60f          	ld	a,_PFDR
3399  093a a504          	bcp	a,#4
3400  093c 273b          	jreq	L1042
3401                     ; 427 					ADCCSR = ADSPEED | ADON | _Ain_S1Analogic; //PF4							// enables the A/D peripheral on Scanning Head
3403  093e a66a          	ld	a,#106
3404  0940 b770          	ld	_ADCCSR,a
3406  0942               L7042:
3407                     ; 428 					while((_Pa_EncoderAB & 0b10000100)==0b10000100); 				// Enc = 1 & Zero = 1
3409  0942 b60f          	ld	a,_PFDR
3410  0944 a484          	and	a,#132
3411  0946 a184          	cp	a,#132
3412  0948 27f8          	jreq	L7042
3413                     ; 429 					m_byScanningHeadValue = byScanningHeadValue & 0b11000000;
3415  094a b6ff          	ld	a,_scanningHeadSignalAcquire$L-1
3416  094c a4c0          	and	a,#192
3417  094e c70033        	ld	_m_byScanningHeadValue,a
3419  0951               L7142:
3420                     ; 430 					while((_Pa_EncoderAB & 0b10000100)==0b00000100); 				// Enc = 0 & Zero = 1
3422  0951 b60f          	ld	a,_PFDR
3423  0953 a484          	and	a,#132
3424  0955 a104          	cp	a,#4
3425  0957 27f8          	jreq	L7142
3427  0959               L5242:
3428                     ; 431 					while((_Pa_EncoderAB & 0b10000100)==0b10000100); 				// Enc = 1 & Zero = 1
3430  0959 b60f          	ld	a,_PFDR
3431  095b a484          	and	a,#132
3432  095d a184          	cp	a,#132
3433  095f 27f8          	jreq	L5242
3435  0961               L3342:
3436                     ; 432 					while((_Pa_EncoderAB & 0b10000100)==0b00000100); 				// Enc = 0 & Zero = 1
3438  0961 b60f          	ld	a,_PFDR
3439  0963 a484          	and	a,#132
3440  0965 a104          	cp	a,#4
3441  0967 27f8          	jreq	L3342
3443  0969               L1442:
3444                     ; 433 					while(!(ADCCSR & EOC)&& (_btst(_Pa_Encoder0, _Pin_Encoder0)));	// waits for the end of the conversion
3446  0969 b670          	ld	a,_ADCCSR
3447  096b a580          	bcp	a,#128
3448  096d 2606          	jrne	L5442
3450  096f b60f          	ld	a,_PFDR
3451  0971 a504          	bcp	a,#4
3452  0973 26f4          	jrne	L1442
3453  0975               L5442:
3454                     ; 434 					byScanningHeadValue = ADCDRH;
3456  0975 b671          	ld	a,_ADCDRH
3457  0977 b7ff          	ld	_scanningHeadSignalAcquire$L-1,a
3458  0979               L1042:
3459                     ; 437 				if _btst(_Pa_Encoder0, _Pin_Encoder0)
3461  0979 b60f          	ld	a,_PFDR
3462  097b a504          	bcp	a,#4
3463  097d 2744          	jreq	L7442
3464                     ; 439 					ADCCSR = ADSPEED | ADON | _Ain_S1Analogic; //PF4							// enables the A/D peripheral on Scanning Head
3466  097f a66a          	ld	a,#106
3467  0981 b770          	ld	_ADCCSR,a
3469  0983               L5542:
3470                     ; 440 					while((_Pa_EncoderAB & 0b10000100)==0b10000100); 				// Enc = 1 & Zero = 1
3472  0983 b60f          	ld	a,_PFDR
3473  0985 a484          	and	a,#132
3474  0987 a184          	cp	a,#132
3475  0989 27f8          	jreq	L5542
3476                     ; 441 					byScanningHeadValue = (byScanningHeadValue & 0b11000000)>>2;
3478  098b b6ff          	ld	a,_scanningHeadSignalAcquire$L-1
3479  098d a4c0          	and	a,#192
3480  098f 44            	srl	a
3481  0990 44            	srl	a
3482  0991 b7ff          	ld	_scanningHeadSignalAcquire$L-1,a
3484  0993               L5642:
3485                     ; 442 					while((_Pa_EncoderAB & 0b10000100)==0b00000100); 				// Enc = 0 & Zero = 1
3487  0993 b60f          	ld	a,_PFDR
3488  0995 a484          	and	a,#132
3489  0997 a104          	cp	a,#4
3490  0999 27f8          	jreq	L5642
3491                     ; 443 					m_byScanningHeadValue += byScanningHeadValue;
3493  099b c60033        	ld	a,_m_byScanningHeadValue
3494  099e bbff          	add	a,_scanningHeadSignalAcquire$L-1
3495  09a0 c70033        	ld	_m_byScanningHeadValue,a
3497  09a3               L3742:
3498                     ; 444 					while((_Pa_EncoderAB & 0b10000100)==0b10000100); 				// Enc = 1 & Zero = 1
3500  09a3 b60f          	ld	a,_PFDR
3501  09a5 a484          	and	a,#132
3502  09a7 a184          	cp	a,#132
3503  09a9 27f8          	jreq	L3742
3505  09ab               L1052:
3506                     ; 445 					while((_Pa_EncoderAB & 0b10000100)==0b00000100); 				// Enc = 0 & Zero = 1
3508  09ab b60f          	ld	a,_PFDR
3509  09ad a484          	and	a,#132
3510  09af a104          	cp	a,#4
3511  09b1 27f8          	jreq	L1052
3513  09b3               L7052:
3514                     ; 446 					while(!(ADCCSR & EOC)&& (_btst(_Pa_Encoder0, _Pin_Encoder0)));	// waits for the end of the conversion
3516  09b3 b670          	ld	a,_ADCCSR
3517  09b5 a580          	bcp	a,#128
3518  09b7 2606          	jrne	L3152
3520  09b9 b60f          	ld	a,_PFDR
3521  09bb a504          	bcp	a,#4
3522  09bd 26f4          	jrne	L7052
3523  09bf               L3152:
3524                     ; 447 					byScanningHeadValue = ADCDRH;
3526  09bf b671          	ld	a,_ADCDRH
3527  09c1 b7ff          	ld	_scanningHeadSignalAcquire$L-1,a
3528  09c3               L7442:
3529                     ; 450 				if _btst(_Pa_Encoder0, _Pin_Encoder0)
3531  09c3 b60f          	ld	a,_PFDR
3532  09c5 a504          	bcp	a,#4
3533  09c7 2745          	jreq	L7232
3534                     ; 452 					ADCCSR = ADSPEED | ADON | _Ain_S1Analogic; //PF4							// enables the A/D peripheral on Scanning Head
3536  09c9 a66a          	ld	a,#106
3537  09cb b770          	ld	_ADCCSR,a
3539  09cd               L3252:
3540                     ; 453 					while((_Pa_EncoderAB & 0b10000100)==0b10000100); 				// Enc = 1 & Zero = 1
3542  09cd b60f          	ld	a,_PFDR
3543  09cf a484          	and	a,#132
3544  09d1 a184          	cp	a,#132
3545  09d3 27f8          	jreq	L3252
3546                     ; 454 					byScanningHeadValue = (byScanningHeadValue & 0b11000000)>>4;
3548  09d5 b6ff          	ld	a,_scanningHeadSignalAcquire$L-1
3549  09d7 a4c0          	and	a,#192
3550  09d9 4e            	swap	a
3551  09da a40f          	and	a,#15
3552  09dc b7ff          	ld	_scanningHeadSignalAcquire$L-1,a
3554  09de               L3352:
3555                     ; 455 					while((_Pa_EncoderAB & 0b10000100)==0b00000100); 				// Enc = 0 & Zero = 1
3557  09de b60f          	ld	a,_PFDR
3558  09e0 a484          	and	a,#132
3559  09e2 a104          	cp	a,#4
3560  09e4 27f8          	jreq	L3352
3561                     ; 456 					m_byScanningHeadValue += byScanningHeadValue;
3563  09e6 c60033        	ld	a,_m_byScanningHeadValue
3564  09e9 bbff          	add	a,_scanningHeadSignalAcquire$L-1
3565  09eb c70033        	ld	_m_byScanningHeadValue,a
3567  09ee               L1452:
3568                     ; 457 					while((_Pa_EncoderAB & 0b10000100)==0b10000100); 				// Enc = 1 & Zero = 1
3570  09ee b60f          	ld	a,_PFDR
3571  09f0 a484          	and	a,#132
3572  09f2 a184          	cp	a,#132
3573  09f4 27f8          	jreq	L1452
3575  09f6               L7452:
3576                     ; 458 					while((_Pa_EncoderAB & 0b10000100)==0b00000100); 				// Enc = 0 & Zero = 1
3578  09f6 b60f          	ld	a,_PFDR
3579  09f8 a484          	and	a,#132
3580  09fa a104          	cp	a,#4
3581  09fc 27f8          	jreq	L7452
3583  09fe               L5552:
3584                     ; 459 					while(!(ADCCSR & EOC)&& (_btst(_Pa_Encoder0, _Pin_Encoder0)));	// waits for the end of the conversion
3586  09fe b670          	ld	a,_ADCCSR
3587  0a00 a580          	bcp	a,#128
3588  0a02 2606          	jrne	L1652
3590  0a04 b60f          	ld	a,_PFDR
3591  0a06 a504          	bcp	a,#4
3592  0a08 26f4          	jrne	L5552
3593  0a0a               L1652:
3594                     ; 460 					byScanningHeadValue = ADCDRH;
3596  0a0a b671          	ld	a,_ADCDRH
3597  0a0c b7ff          	ld	_scanningHeadSignalAcquire$L-1,a
3598  0a0e               L7232:
3599                     ; 409 			while (_btst(_Pa_Encoder0, _Pin_Encoder0))
3601  0a0e b60f          	ld	a,_PFDR
3602  0a10 a504          	bcp	a,#4
3603  0a12 2703          	jreq	L47
3604  0a14 cc08cf        	jp	L5232
3605  0a17               L47:
3606  0a17 cc0b76        	jp	L3652
3607  0a1a               L7652:
3608                     ; 467 		while(!_btst(_Pa_Encoder0, _Pin_Encoder0) && !displayIsKeyPress());
3610  0a1a b60f          	ld	a,_PFDR
3611  0a1c a504          	bcp	a,#4
3612  0a1e 2606          	jrne	L7752
3614  0a20 cd0000        	call	_displayIsKeyPress
3616  0a23 4d            	tnz	a
3617  0a24 27f4          	jreq	L7652
3618  0a26               L7752:
3619                     ; 468 		while(_btst(_Pa_Encoder0, _Pin_Encoder0)&& !displayIsKeyPress());
3621  0a26 b60f          	ld	a,_PFDR
3622  0a28 a504          	bcp	a,#4
3623  0a2a 2706          	jreq	L3062
3625  0a2c cd0000        	call	_displayIsKeyPress
3627  0a2f 4d            	tnz	a
3628  0a30 27f4          	jreq	L7752
3629  0a32               L3062:
3630                     ; 470 		if (!displayIsKeyPress())
3632  0a32 cd0000        	call	_displayIsKeyPress
3634  0a35 4d            	tnz	a
3635  0a36 2703          	jreq	L67
3636  0a38 cc0b76        	jp	L3652
3637  0a3b               L67:
3639  0a3b cc0b6d        	jp	L1162
3640  0a3e               L7062:
3641                     ; 474 				if (!_btst(_Pa_Encoder0, _Pin_Encoder0))
3643  0a3e b60f          	ld	a,_PFDR
3644  0a40 a504          	bcp	a,#4
3645  0a42 265f          	jrne	L5162
3646                     ; 476 					ADCCSR = ADSPEED | ADON | _Ain_S1Analogic; //PF4							// enables the A/D peripheral on Scanning Head
3648  0a44 a66a          	ld	a,#106
3649  0a46 b770          	ld	_ADCCSR,a
3651  0a48               L3262:
3652                     ; 477 					while((_Pa_EncoderAB & 0b10000100)==0b10000000); 				// Enc = 1 & Zero = 0
3654  0a48 b60f          	ld	a,_PFDR
3655  0a4a a484          	and	a,#132
3656  0a4c a180          	cp	a,#128
3657  0a4e 27f8          	jreq	L3262
3658                     ; 478 					m_byScanningHeadValue += (byScanningHeadValue & 0b11000000)>>6;
3660  0a50 b6ff          	ld	a,_scanningHeadSignalAcquire$L-1
3661  0a52 a4c0          	and	a,#192
3662  0a54 4e            	swap	a
3663  0a55 44            	srl	a
3664  0a56 44            	srl	a
3665  0a57 a403          	and	a,#3
3666  0a59 cb0033        	add	a,_m_byScanningHeadValue
3667  0a5c c70033        	ld	_m_byScanningHeadValue,a
3669  0a5f               L1362:
3670                     ; 479 					while((_Pa_EncoderAB & 0b10000100)==0b00000000); 				// Enc = 0 & Zero = 0
3672  0a5f b60f          	ld	a,_PFDR
3673  0a61 a584          	bcp	a,#132
3674  0a63 27fa          	jreq	L1362
3675                     ; 480 					(*m_byScanningHeadSignalPointer) = m_byScanningHeadValue;
3677  0a65 c60034        	ld	a,_m_byScanningHeadSignalPointer
3678  0a68 b700          	ld	c_x,a
3679  0a6a ce0035        	ld	x,_m_byScanningHeadSignalPointer+1
3680  0a6d c60033        	ld	a,_m_byScanningHeadValue
3681  0a70 bf01          	ld	c_x+1,x
3682  0a72 92c700        	ld	[c_x.w],a
3684  0a75               L1462:
3685                     ; 481 					while((_Pa_EncoderAB & 0b10000100)==0b10000000); 				// Enc = 1 & Zero = 0
3687  0a75 b60f          	ld	a,_PFDR
3688  0a77 a484          	and	a,#132
3689  0a79 a180          	cp	a,#128
3690  0a7b 27f8          	jreq	L1462
3691                     ; 482 					m_byScanningHeadSignalPointer++;			
3693  0a7d c60035        	ld	a,_m_byScanningHeadSignalPointer+1
3694  0a80 ab01          	add	a,#1
3695  0a82 c70035        	ld	_m_byScanningHeadSignalPointer+1,a
3696  0a85 c60034        	ld	a,_m_byScanningHeadSignalPointer
3697  0a88 a900          	adc	a,#0
3698  0a8a c70034        	ld	_m_byScanningHeadSignalPointer,a
3700  0a8d               L7462:
3701                     ; 483 					while((_Pa_EncoderAB & 0b10000100)==0b00000000); 				// Enc = 0 & Zero = 0
3703  0a8d b60f          	ld	a,_PFDR
3704  0a8f a584          	bcp	a,#132
3705  0a91 27fa          	jreq	L7462
3707  0a93               L5562:
3708                     ; 484 					while(!(ADCCSR & EOC)&& (!_btst(_Pa_Encoder0, _Pin_Encoder0)));	// waits for the end of the conversion
3710  0a93 b670          	ld	a,_ADCCSR
3711  0a95 a580          	bcp	a,#128
3712  0a97 2606          	jrne	L1662
3714  0a99 b60f          	ld	a,_PFDR
3715  0a9b a504          	bcp	a,#4
3716  0a9d 27f4          	jreq	L5562
3717  0a9f               L1662:
3718                     ; 485 					byScanningHeadValue = ADCDRH;
3720  0a9f b671          	ld	a,_ADCDRH
3721  0aa1 b7ff          	ld	_scanningHeadSignalAcquire$L-1,a
3722  0aa3               L5162:
3723                     ; 488 				if (!_btst(_Pa_Encoder0, _Pin_Encoder0))
3725  0aa3 b60f          	ld	a,_PFDR
3726  0aa5 a504          	bcp	a,#4
3727  0aa7 2637          	jrne	L3662
3728                     ; 490 					ADCCSR = ADSPEED | ADON | _Ain_S1Analogic; //PF4							// enables the A/D peripheral on Scanning Head
3730  0aa9 a66a          	ld	a,#106
3731  0aab b770          	ld	_ADCCSR,a
3733  0aad               L1762:
3734                     ; 491 					while((_Pa_EncoderAB & 0b10000100)==0b10000000); 				// Enc = 1 & Zero = 0
3736  0aad b60f          	ld	a,_PFDR
3737  0aaf a484          	and	a,#132
3738  0ab1 a180          	cp	a,#128
3739  0ab3 27f8          	jreq	L1762
3740                     ; 492 					m_byScanningHeadValue = byScanningHeadValue & 0b11000000;
3742  0ab5 b6ff          	ld	a,_scanningHeadSignalAcquire$L-1
3743  0ab7 a4c0          	and	a,#192
3744  0ab9 c70033        	ld	_m_byScanningHeadValue,a
3746  0abc               L1072:
3747                     ; 493 					while((_Pa_EncoderAB & 0b10000100)==0b00000000); 				// Enc = 0 & Zero = 0
3749  0abc b60f          	ld	a,_PFDR
3750  0abe a584          	bcp	a,#132
3751  0ac0 27fa          	jreq	L1072
3753  0ac2               L7072:
3754                     ; 494 					while((_Pa_EncoderAB & 0b10000100)==0b10000000); 				// Enc = 1 & Zero = 0
3756  0ac2 b60f          	ld	a,_PFDR
3757  0ac4 a484          	and	a,#132
3758  0ac6 a180          	cp	a,#128
3759  0ac8 27f8          	jreq	L7072
3761  0aca               L5172:
3762                     ; 495 					while((_Pa_EncoderAB & 0b10000100)==0b00000000); 				// Enc = 0 & Zero = 0
3764  0aca b60f          	ld	a,_PFDR
3765  0acc a584          	bcp	a,#132
3766  0ace 27fa          	jreq	L5172
3768  0ad0               L3272:
3769                     ; 496 					while(!(ADCCSR & EOC)&& (!_btst(_Pa_Encoder0, _Pin_Encoder0)));	// waits for the end of the conversion
3771  0ad0 b670          	ld	a,_ADCCSR
3772  0ad2 a580          	bcp	a,#128
3773  0ad4 2606          	jrne	L7272
3775  0ad6 b60f          	ld	a,_PFDR
3776  0ad8 a504          	bcp	a,#4
3777  0ada 27f4          	jreq	L3272
3778  0adc               L7272:
3779                     ; 497 					byScanningHeadValue = ADCDRH;
3781  0adc b671          	ld	a,_ADCDRH
3782  0ade b7ff          	ld	_scanningHeadSignalAcquire$L-1,a
3783  0ae0               L3662:
3784                     ; 500 				if (!_btst(_Pa_Encoder0, _Pin_Encoder0))
3786  0ae0 b60f          	ld	a,_PFDR
3787  0ae2 a504          	bcp	a,#4
3788  0ae4 2640          	jrne	L1372
3789                     ; 502 					ADCCSR = ADSPEED | ADON | _Ain_S1Analogic; //PF4							// enables the A/D peripheral on Scanning Head
3791  0ae6 a66a          	ld	a,#106
3792  0ae8 b770          	ld	_ADCCSR,a
3794  0aea               L7372:
3795                     ; 503 					while((_Pa_EncoderAB & 0b10000100)==0b10000000); 				// Enc = 1 & Zero = 0
3797  0aea b60f          	ld	a,_PFDR
3798  0aec a484          	and	a,#132
3799  0aee a180          	cp	a,#128
3800  0af0 27f8          	jreq	L7372
3801                     ; 504 					byScanningHeadValue = (byScanningHeadValue & 0b11000000)>>2;
3803  0af2 b6ff          	ld	a,_scanningHeadSignalAcquire$L-1
3804  0af4 a4c0          	and	a,#192
3805  0af6 44            	srl	a
3806  0af7 44            	srl	a
3807  0af8 b7ff          	ld	_scanningHeadSignalAcquire$L-1,a
3809  0afa               L7472:
3810                     ; 505 					while((_Pa_EncoderAB & 0b10000100)==0b00000000); 				// Enc = 0 & Zero = 0
3812  0afa b60f          	ld	a,_PFDR
3813  0afc a584          	bcp	a,#132
3814  0afe 27fa          	jreq	L7472
3815                     ; 506 					m_byScanningHeadValue += byScanningHeadValue;
3817  0b00 c60033        	ld	a,_m_byScanningHeadValue
3818  0b03 bbff          	add	a,_scanningHeadSignalAcquire$L-1
3819  0b05 c70033        	ld	_m_byScanningHeadValue,a
3821  0b08               L5572:
3822                     ; 507 					while((_Pa_EncoderAB & 0b10000100)==0b10000000); 				// Enc = 1 & Zero = 0
3824  0b08 b60f          	ld	a,_PFDR
3825  0b0a a484          	and	a,#132
3826  0b0c a180          	cp	a,#128
3827  0b0e 27f8          	jreq	L5572
3829  0b10               L3672:
3830                     ; 508 					while((_Pa_EncoderAB & 0b10000100)==0b00000000); 				// Enc = 0 & Zero = 0
3832  0b10 b60f          	ld	a,_PFDR
3833  0b12 a584          	bcp	a,#132
3834  0b14 27fa          	jreq	L3672
3836  0b16               L1772:
3837                     ; 509 					while(!(ADCCSR & EOC)&& (!_btst(_Pa_Encoder0, _Pin_Encoder0)));	// waits for the end of the conversion
3839  0b16 b670          	ld	a,_ADCCSR
3840  0b18 a580          	bcp	a,#128
3841  0b1a 2606          	jrne	L5772
3843  0b1c b60f          	ld	a,_PFDR
3844  0b1e a504          	bcp	a,#4
3845  0b20 27f4          	jreq	L1772
3846  0b22               L5772:
3847                     ; 510 					byScanningHeadValue = ADCDRH;
3849  0b22 b671          	ld	a,_ADCDRH
3850  0b24 b7ff          	ld	_scanningHeadSignalAcquire$L-1,a
3851  0b26               L1372:
3852                     ; 513 				if (!_btst(_Pa_Encoder0, _Pin_Encoder0))
3854  0b26 b60f          	ld	a,_PFDR
3855  0b28 a504          	bcp	a,#4
3856  0b2a 2641          	jrne	L1162
3857                     ; 515 					ADCCSR = ADSPEED | ADON | _Ain_S1Analogic; //PF4							// enables the A/D peripheral on Scanning Head
3859  0b2c a66a          	ld	a,#106
3860  0b2e b770          	ld	_ADCCSR,a
3862  0b30               L5003:
3863                     ; 516 					while((_Pa_EncoderAB & 0b10000100)==0b10000000); 				// Enc = 1 & Zero = 0
3865  0b30 b60f          	ld	a,_PFDR
3866  0b32 a484          	and	a,#132
3867  0b34 a180          	cp	a,#128
3868  0b36 27f8          	jreq	L5003
3869                     ; 517 					byScanningHeadValue = (byScanningHeadValue & 0b11000000)>>4;
3871  0b38 b6ff          	ld	a,_scanningHeadSignalAcquire$L-1
3872  0b3a a4c0          	and	a,#192
3873  0b3c 4e            	swap	a
3874  0b3d a40f          	and	a,#15
3875  0b3f b7ff          	ld	_scanningHeadSignalAcquire$L-1,a
3877  0b41               L5103:
3878                     ; 518 					while((_Pa_EncoderAB & 0b10000100)==0b00000000); 				// Enc = 0 & Zero = 0
3880  0b41 b60f          	ld	a,_PFDR
3881  0b43 a584          	bcp	a,#132
3882  0b45 27fa          	jreq	L5103
3883                     ; 519 					m_byScanningHeadValue += byScanningHeadValue;
3885  0b47 c60033        	ld	a,_m_byScanningHeadValue
3886  0b4a bbff          	add	a,_scanningHeadSignalAcquire$L-1
3887  0b4c c70033        	ld	_m_byScanningHeadValue,a
3889  0b4f               L3203:
3890                     ; 520 					while((_Pa_EncoderAB & 0b10000100)==0b10000000); 				// Enc = 1 & Zero = 0
3892  0b4f b60f          	ld	a,_PFDR
3893  0b51 a484          	and	a,#132
3894  0b53 a180          	cp	a,#128
3895  0b55 27f8          	jreq	L3203
3897  0b57               L1303:
3898                     ; 521 					while((_Pa_EncoderAB & 0b10000100)==0b00000000); 				// Enc = 0 & Zero = 0
3900  0b57 b60f          	ld	a,_PFDR
3901  0b59 a584          	bcp	a,#132
3902  0b5b 27fa          	jreq	L1303
3904  0b5d               L7303:
3905                     ; 522 					while(!(ADCCSR & EOC)&& (!_btst(_Pa_Encoder0, _Pin_Encoder0)));	// waits for the end of the conversion
3907  0b5d b670          	ld	a,_ADCCSR
3908  0b5f a580          	bcp	a,#128
3909  0b61 2606          	jrne	L3403
3911  0b63 b60f          	ld	a,_PFDR
3912  0b65 a504          	bcp	a,#4
3913  0b67 27f4          	jreq	L7303
3914  0b69               L3403:
3915                     ; 523 					byScanningHeadValue = ADCDRH;
3917  0b69 b671          	ld	a,_ADCDRH
3918  0b6b b7ff          	ld	_scanningHeadSignalAcquire$L-1,a
3919  0b6d               L1162:
3920                     ; 472 			while (!_btst(_Pa_Encoder0, _Pin_Encoder0))
3922  0b6d b60f          	ld	a,_PFDR
3923  0b6f a504          	bcp	a,#4
3924  0b71 2603          	jrne	L001
3925  0b73 cc0a3e        	jp	L7062
3926  0b76               L001:
3927  0b76               L3652:
3928                     ; 528 }
3931  0b76 81            	ret
4049                     	xdef	_scanningHeadSignalWaitEncoder
4050                     	switch	.bss
4051  0000               _m_woEncoderGateHiLow:
4052  0000 00            	ds.b	1
4053                     	xdef	_m_woEncoderGateHiLow
4054  0001               _arbyLoop:
4055  0001 00000000      	ds.b	4
4056                     	xdef	_arbyLoop
4057  0005               _m_woEncoderGateWidth:
4058  0005 0000          	ds.b	2
4059                     	xdef	_m_woEncoderGateWidth
4060  0007               _m_arbyEncoderGate:
4061  0007 000000000000  	ds.b	32
4062                     	xdef	_m_arbyEncoderGate
4063  0027               _m_arbyEncoderSignals:
4064  0027 000000000000  	ds.b	8
4065                     	xdef	_m_arbyEncoderSignals
4066  002f               _m_woEncoderGateEnd:
4067  002f 0000          	ds.b	2
4068                     	xdef	_m_woEncoderGateEnd
4069  0031               _m_woEncoderGateStart:
4070  0031 0000          	ds.b	2
4071                     	xdef	_m_woEncoderGateStart
4072  0033               _m_byScanningHeadValue:
4073  0033 00            	ds.b	1
4074                     	xdef	_m_byScanningHeadValue
4075  0034               _m_byScanningHeadSignalPointer:
4076  0034 0000          	ds.b	2
4077                     	xdef	_m_byScanningHeadSignalPointer
4078  0036               _m_arbyScanningHeadSignal:
4079  0036 000000000000  	ds.b	1024
4080                     	xdef	_m_arbyScanningHeadSignal
4081                     	xdef	_scanningHeadSignalTestEncoderAB
4082                     	xdef	_scanningHeadSignalTestEncoderZero
4083                     	xdef	_scanningHeadSignalAcquireGate
4084                     	xdef	_scanningHeadSignalAcquire
4085                     	xref	_displayIsKeyPress
4086                     	xref.b	c_x
4106                     	end
