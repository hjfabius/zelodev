   1                     ; C Compiler for ST7 (COSMIC Software)
   2                     ; Generator V4.5.5 - 12 Jan 2006
1280                     .const:	section	.text
1281  0000               L327_mc_byApplicationVersion:
1282  0000 9d            	dc.b	157
1375                     ; 23 void scanningHeadSignalEncoderAutoSet(void)
1375                     ; 24 {
1376                     	switch	.text
1378                     	xref.b	_scanningHeadSignalEncoderAutoSet$L
1379  0000               _scanningHeadSignalEncoderAutoSet:
1382                     ; 26 	BYTE byGate = 0x00;
1384  0000 3ffe          	clr	_scanningHeadSignalEncoderAutoSet$L-2
1385                     ; 29 	for(i=0;i<4;i++)
1387  0002 3fff          	clr	_scanningHeadSignalEncoderAutoSet$L-1
1388  0004               L5001:
1389                     ; 31 		while(_btst(_Pa_EncoderAB, _Pin_EncoderAB));
1391  0004 b60f          	ld	a,_PFDR
1392  0006 a580          	bcp	a,#128
1393  0008 26fa          	jrne	L5001
1395  000a               L3101:
1396                     ; 32 		while(!_btst(_Pa_EncoderAB, _Pin_EncoderAB));
1398  000a b60f          	ld	a,_PFDR
1399  000c a580          	bcp	a,#128
1400  000e 27fa          	jreq	L3101
1402  0010               L1201:
1403                     ; 33 		while(_btst(_Pa_EncoderAB, _Pin_EncoderAB));
1405  0010 b60f          	ld	a,_PFDR
1406  0012 a580          	bcp	a,#128
1407  0014 26fa          	jrne	L1201
1409  0016               L7201:
1410                     ; 34 		while(!_btst(_Pa_EncoderAB, _Pin_EncoderAB));
1412  0016 b60f          	ld	a,_PFDR
1413  0018 a580          	bcp	a,#128
1414  001a 27fa          	jreq	L7201
1416  001c               L5301:
1417                     ; 35 		while(_btst(_Pa_EncoderAB, _Pin_EncoderAB));
1419  001c b60f          	ld	a,_PFDR
1420  001e a580          	bcp	a,#128
1421  0020 26fa          	jrne	L5301
1423  0022               L3401:
1424                     ; 36 		while(!_btst(_Pa_EncoderAB, _Pin_EncoderAB));
1426  0022 b60f          	ld	a,_PFDR
1427  0024 a580          	bcp	a,#128
1428  0026 27fa          	jreq	L3401
1430  0028               L1501:
1431                     ; 37 		while(_btst(_Pa_EncoderAB, _Pin_EncoderAB));
1433  0028 b60f          	ld	a,_PFDR
1434  002a a580          	bcp	a,#128
1435  002c 26fa          	jrne	L1501
1437  002e               L7501:
1438                     ; 38 		while(!_btst(_Pa_EncoderAB, _Pin_EncoderAB));
1440  002e b60f          	ld	a,_PFDR
1441  0030 a580          	bcp	a,#128
1442  0032 27fa          	jreq	L7501
1443                     ; 39 		if(_btst(_Pa_Encoder0, _Pin_Encoder0))
1445  0034 b60f          	ld	a,_PFDR
1446  0036 a504          	bcp	a,#4
1447  0038 2702          	jreq	L3601
1448                     ; 41 			byGate++;
1450  003a 3cfe          	inc	_scanningHeadSignalEncoderAutoSet$L-2
1451  003c               L3601:
1452                     ; 29 	for(i=0;i<4;i++)
1454  003c 3cff          	inc	_scanningHeadSignalEncoderAutoSet$L-1
1457  003e b6ff          	ld	a,_scanningHeadSignalEncoderAutoSet$L-1
1458  0040 a104          	cp	a,#4
1459  0042 25c0          	jrult	L5001
1460                     ; 45 	if(byGate>2)
1462  0044 b6fe          	ld	a,_scanningHeadSignalEncoderAutoSet$L-2
1463  0046 a103          	cp	a,#3
1464  0048 2508          	jrult	L5601
1465                     ; 47 		woResult = 0x0001;
1467  004a a601          	ld	a,#1
1468  004c b7fd          	ld	_scanningHeadSignalEncoderAutoSet$L-3,a
1469  004e 3ffc          	clr	_scanningHeadSignalEncoderAutoSet$L-4
1471  0050 2004          	jra	L7601
1472  0052               L5601:
1473                     ; 51 		woResult = 0x0000;
1475  0052 3ffc          	clr	_scanningHeadSignalEncoderAutoSet$L-4
1476  0054 3ffd          	clr	_scanningHeadSignalEncoderAutoSet$L-3
1477  0056               L7601:
1478                     ; 56 	STI_SendMessage(STI_FUNZ_WRITE_PARAM, STI_PARAM_ZERO_ENCODER, woResult);
1480  0056 befc          	ld	x,_scanningHeadSignalEncoderAutoSet$L-4
1481  0058 bf02          	ld	_STI_SendMessage$L+2,x
1482  005a b6fd          	ld	a,_scanningHeadSignalEncoderAutoSet$L-3
1483  005c b703          	ld	_STI_SendMessage$L+3,a
1484  005e a629          	ld	a,#41
1485  0060 ae81          	ld	x,#129
1486  0062 cd0000        	call	_STI_SendMessage
1488                     ; 57 	parametersSet(PARAM_ENCODER_NP, STI_GetMessage(STI_PARAM_ZERO_ENCODER));
1490  0065 a629          	ld	a,#41
1491  0067 cd0000        	call	_STI_GetMessage
1493  006a b702          	ld	_parametersSet$L+2,a
1494  006c bf01          	ld	_parametersSet$L+1,x
1495  006e a603          	ld	a,#3
1496  0070 cd0000        	call	_parametersSet
1498                     ; 58 }
1501  0073 81            	ret
1549                     ; 62 void scanningHeadSignalAcquireGate(void)
1549                     ; 63 {
1550                     	switch	.text
1552                     	xref.b	_scanningHeadSignalAcquireGate$L
1553  0074               _scanningHeadSignalAcquireGate:
1556                     ; 72 	i = 1;
1558  0074 a601          	ld	a,#1
1559  0076 b7eb          	ld	_scanningHeadSignalAcquireGate$L-21,a
1560                     ; 74 	ardblValue[0] = STI_GetMessage(STI_PARAM_PHASE_START)/4; 	//Expressed in 4096 on Z80
1562  0078 a628          	ld	a,#40
1563  007a cd0000        	call	_STI_GetMessage
1565  007d 54            	srl	x
1566  007e 46            	rrc	a
1567  007f 54            	srl	x
1568  0080 46            	rrc	a
1569  0081 cd0000        	call	c_uitof
1571  0084 aeec          	ld	x,#_scanningHeadSignalAcquireGate$L-20
1572  0086 cd0000        	call	c_rtol
1574                     ; 75 	ardblValue[1] = STI_GetMessage(STI_PARAM_CYLINDER_TRAVEL)/10; 
1576  0089 4f            	clr	a
1577  008a cd0000        	call	_STI_GetMessage
1579  008d 3f00          	clr	c_y
1580  008f 90ae0a        	ld	y,#10
1581  0092 cd0000        	call	c_udiv
1583  0095 cd0000        	call	c_uitof
1585  0098 aef0          	ld	x,#_scanningHeadSignalAcquireGate$L-16
1586  009a cd0000        	call	c_rtol
1588                     ; 76 	ardblValue[2] = STI_GetMessage(STI_PARAM_GATE_WINDOW);
1590  009d a602          	ld	a,#2
1591  009f cd0000        	call	_STI_GetMessage
1593  00a2 cd0000        	call	c_uitof
1595  00a5 aef4          	ld	x,#_scanningHeadSignalAcquireGate$L-12
1596  00a7 cd0000        	call	c_rtol
1598                     ; 77 	ardblValue[3] = (WORD)((ardblValue[2] / ardblValue[1])*1024);
1600  00aa aef4          	ld	x,#_scanningHeadSignalAcquireGate$L-12
1601  00ac cd0000        	call	c_ltor
1603  00af aef0          	ld	x,#_scanningHeadSignalAcquireGate$L-16
1604  00b1 cd0000        	call	c_fdiv
1606  00b4 ae01          	ld	x,#high(L7111)
1607  00b6 bf00          	ld	c_x,x
1608  00b8 ae01          	ld	x,#low(L7111)
1609  00ba cd0000        	call	c_xfmul
1611  00bd cd0000        	call	c_ftoi
1613  00c0 cd0000        	call	c_uitof
1615  00c3 aef8          	ld	x,#_scanningHeadSignalAcquireGate$L-8
1616  00c5 cd0000        	call	c_rtol
1618                     ; 78 	ardblValue[4] = (ENCODER_PULSES + (WORD)ardblValue[0] + (WORD)ardblValue[3])&(ENCODER_PULSES-1);	
1620  00c8 aef8          	ld	x,#_scanningHeadSignalAcquireGate$L-8
1621  00ca cd0000        	call	c_ltor
1623  00cd cd0000        	call	c_ftoi
1625  00d0 b7ea          	ld	_scanningHeadSignalAcquireGate$L-22,a
1626  00d2 bfe9          	ld	_scanningHeadSignalAcquireGate$L-23,x
1627  00d4 aeec          	ld	x,#_scanningHeadSignalAcquireGate$L-20
1628  00d6 cd0000        	call	c_ltor
1630  00d9 cd0000        	call	c_ftoi
1632  00dc bbea          	add	a,_scanningHeadSignalAcquireGate$L-22
1633  00de 88            	push	a
1634  00df 9f            	ld	a,x
1635  00e0 b9e9          	adc	a,_scanningHeadSignalAcquireGate$L-23
1636  00e2 97            	ld	x,a
1637  00e3 84            	pop	a
1638  00e4 ab00          	add	a,#0
1639  00e6 88            	push	a
1640  00e7 9f            	ld	a,x
1641  00e8 a904          	adc	a,#4
1642  00ea 97            	ld	x,a
1643  00eb 84            	pop	a
1644  00ec a4ff          	and	a,#255
1645  00ee 88            	push	a
1646  00ef 9f            	ld	a,x
1647  00f0 a403          	and	a,#3
1648  00f2 97            	ld	x,a
1649  00f3 84            	pop	a
1650  00f4 cd0000        	call	c_uitof
1652  00f7 aefc          	ld	x,#_scanningHeadSignalAcquireGate$L-4
1653  00f9 cd0000        	call	c_rtol
1655                     ; 80 	m_woEncoderGateStart 	= (ENCODER_PULSES + (WORD)(ardblValue[0]) - 8) &(ENCODER_PULSES-1);;
1657  00fc aeec          	ld	x,#_scanningHeadSignalAcquireGate$L-20
1658  00fe cd0000        	call	c_ltor
1660  0101 cd0000        	call	c_ftoi
1662  0104 abf8          	add	a,#248
1663  0106 88            	push	a
1664  0107 9f            	ld	a,x
1665  0108 a903          	adc	a,#3
1666  010a 97            	ld	x,a
1667  010b 84            	pop	a
1668  010c a4ff          	and	a,#255
1669  010e 88            	push	a
1670  010f 9f            	ld	a,x
1671  0110 a403          	and	a,#3
1672  0112 97            	ld	x,a
1673  0113 84            	pop	a
1674  0114 c7002f        	ld	_m_woEncoderGateStart+1,a
1675  0117 cf002e        	ld	_m_woEncoderGateStart,x
1676                     ; 81 	m_woEncoderGateEnd 		= (ENCODER_PULSES + (WORD)(ardblValue[4]) - 8)&(ENCODER_PULSES-1);
1679  011a aefc          	ld	x,#_scanningHeadSignalAcquireGate$L-4
1680  011c cd0000        	call	c_ltor
1682  011f cd0000        	call	c_ftoi
1684  0122 abf8          	add	a,#248
1685  0124 88            	push	a
1686  0125 9f            	ld	a,x
1687  0126 a903          	adc	a,#3
1688  0128 97            	ld	x,a
1689  0129 84            	pop	a
1690  012a a4ff          	and	a,#255
1691  012c 88            	push	a
1692  012d 9f            	ld	a,x
1693  012e a403          	and	a,#3
1694  0130 97            	ld	x,a
1695  0131 84            	pop	a
1696  0132 c7002d        	ld	_m_woEncoderGateEnd+1,a
1697  0135 cf002c        	ld	_m_woEncoderGateEnd,x
1698                     ; 83 	m_woEncoderGateWidth = (WORD) ardblValue[3];
1700  0138 aef8          	ld	x,#_scanningHeadSignalAcquireGate$L-8
1701  013a cd0000        	call	c_ltor
1703  013d cd0000        	call	c_ftoi
1705  0140 c70003        	ld	_m_woEncoderGateWidth+1,a
1706  0143 cf0002        	ld	_m_woEncoderGateWidth,x
1707                     ; 84 }
1710  0146 81            	ret
1772                     ; 88 void scanningHeadSignalAcquire(void)
1772                     ; 89 {
1773                     	switch	.text
1775                     	xref.b	_scanningHeadSignalAcquire$L
1776  0147               _scanningHeadSignalAcquire:
1779                     ; 90 	BYTE byScanningHeadValue	  = 0x00;
1781  0147 3fff          	clr	_scanningHeadSignalAcquire$L-1
1782                     ; 91 	BYTE byPointerIncrement		  = 0xFF;
1784  0149 a6ff          	ld	a,#255
1785  014b b7fc          	ld	_scanningHeadSignalAcquire$L-4,a
1786                     ; 92 	WORD woLoopIndex			  = 0x0000;
1788  014d 3ffd          	clr	_scanningHeadSignalAcquire$L-3
1789  014f 3ffe          	clr	_scanningHeadSignalAcquire$L-2
1790                     ; 93 	m_byScanningHeadSignalPointer = m_arbyScanningHeadSignal;
1792  0151 ae33          	ld	x,#high(_m_arbyScanningHeadSignal)
1793  0153 cf0031        	ld	_m_byScanningHeadSignalPointer,x
1794  0156 a633          	ld	a,#low(_m_arbyScanningHeadSignal)
1795  0158 c70032        	ld	_m_byScanningHeadSignalPointer+1,a
1796                     ; 95 	if(displayIsKeyPressed()) return;
1798  015b cd0000        	call	_displayIsKeyPressed
1800  015e 4d            	tnz	a
1801  015f 2603          	jrne	L02
1802  0161 cc04e0        	jp	L5511
1803  0164               L02:
1807  0164 81            	ret
1808  0165               L3511:
1809                     ; 99 		if (parametersGetValue(PARAM_ENCODER_NP)==0x0001)
1811  0165 a603          	ld	a,#3
1812  0167 cd0000        	call	_parametersGetValue
1814  016a a101          	cp	a,#1
1815  016c 2602          	jrne	L21
1816  016e a300          	cp	x,#0
1817  0170               L21:
1818  0170 2703          	jreq	L22
1819  0172 cc034a        	jp	L1611
1820  0175               L22:
1821                     ; 101 			m_woEncoderZeroLoop = 0x0000;
1823  0175 4f            	clr	a
1824  0176 c70000        	ld	_m_woEncoderZeroLoop,a
1825  0179 c70001        	ld	_m_woEncoderZeroLoop+1,a
1827  017c 202a          	jra	L7611
1828  017e               L5711:
1829                     ; 104 				while(_btst(_Pa_Encoder0, _Pin_Encoder0) && (!displayIsKeyPressed()) );
1831  017e b60f          	ld	a,_PFDR
1832  0180 a504          	bcp	a,#4
1833  0182 2718          	jreq	L5021
1835  0184 cd0000        	call	_displayIsKeyPressed
1837  0187 4d            	tnz	a
1838  0188 27f4          	jreq	L5711
1839  018a 2010          	jra	L5021
1840  018c               L3021:
1841                     ; 105 				while(!_btst(_Pa_Encoder0, _Pin_Encoder0)&& (!displayIsKeyPressed())) {m_woEncoderZeroLoop++;};
1843  018c c60001        	ld	a,_m_woEncoderZeroLoop+1
1844  018f ab01          	add	a,#1
1845  0191 c70001        	ld	_m_woEncoderZeroLoop+1,a
1846  0194 c60000        	ld	a,_m_woEncoderZeroLoop
1847  0197 a900          	adc	a,#0
1848  0199 c70000        	ld	_m_woEncoderZeroLoop,a
1849  019c               L5021:
1852  019c b60f          	ld	a,_PFDR
1853  019e a504          	bcp	a,#4
1854  01a0 2606          	jrne	L7611
1856  01a2 cd0000        	call	_displayIsKeyPressed
1858  01a5 4d            	tnz	a
1859  01a6 27e4          	jreq	L3021
1860  01a8               L7611:
1861                     ; 102 			while((m_woEncoderZeroLoop<3)&& (!displayIsKeyPressed()))
1863  01a8 c60001        	ld	a,_m_woEncoderZeroLoop+1
1864  01ab a003          	sub	a,#3
1865  01ad c60000        	ld	a,_m_woEncoderZeroLoop
1866  01b0 a200          	sbc	a,#0
1867  01b2 2503          	jrult	L42
1868  01b4 cc0335        	jp	L7121
1869  01b7               L42:
1871  01b7 cd0000        	call	_displayIsKeyPressed
1873  01ba 4d            	tnz	a
1874  01bb 27c1          	jreq	L5711
1875  01bd cc0335        	jp	L7121
1876  01c0               L5221:
1877                     ; 111 				while(m_byScanningHeadSignalPointer>=(m_arbyScanningHeadSignal+(ENCODER_PULSES/4))){};
1879  01c0 c60032        	ld	a,_m_byScanningHeadSignalPointer+1
1880  01c3 a033          	sub	a,#low(_m_arbyScanningHeadSignal+256)
1881  01c5 c60031        	ld	a,_m_byScanningHeadSignalPointer
1882  01c8 a233          	sbc	a,#high(_m_arbyScanningHeadSignal+256)
1883  01ca 24f4          	jruge	L5221
1884                     ; 112 				if _btst(_Pa_Encoder0, _Pin_Encoder0)
1887  01cc b60f          	ld	a,_PFDR
1888  01ce a504          	bcp	a,#4
1889  01d0 2763          	jreq	L1031
1890                     ; 114 					ADCCSR = ADSPEED | ADON | _Ain_S1Analogic; //PF4				// enables the A/D peripheral on Scanning Head
1892  01d2 a66a          	ld	a,#106
1893  01d4 b770          	ld	_ADCCSR,a
1895  01d6               L7321:
1896                     ; 115 					while((_Pa_EncoderAB & 0b10000100)==0b10000100); 				// Enc = 1 & Zero = 1
1898  01d6 b60f          	ld	a,_PFDR
1899  01d8 a484          	and	a,#132
1900  01da a184          	cp	a,#132
1901  01dc 27f8          	jreq	L7321
1902                     ; 116 					m_byScanningHeadValue += (byScanningHeadValue & 0b11000000)>>6;
1904  01de b6ff          	ld	a,_scanningHeadSignalAcquire$L-1
1905  01e0 a4c0          	and	a,#192
1906  01e2 4e            	swap	a
1907  01e3 44            	srl	a
1908  01e4 44            	srl	a
1909  01e5 a403          	and	a,#3
1910  01e7 cb0030        	add	a,_m_byScanningHeadValue
1911  01ea c70030        	ld	_m_byScanningHeadValue,a
1913  01ed               L5421:
1914                     ; 117 					while((_Pa_EncoderAB & 0b10000100)==0b00000100); 				// Enc = 0 & Zero = 1
1916  01ed b60f          	ld	a,_PFDR
1917  01ef a484          	and	a,#132
1918  01f1 a104          	cp	a,#4
1919  01f3 27f8          	jreq	L5421
1920                     ; 118 					(*m_byScanningHeadSignalPointer) = m_byScanningHeadValue;
1922  01f5 c60031        	ld	a,_m_byScanningHeadSignalPointer
1923  01f8 b700          	ld	c_x,a
1924  01fa ce0032        	ld	x,_m_byScanningHeadSignalPointer+1
1925  01fd c60030        	ld	a,_m_byScanningHeadValue
1926  0200 bf01          	ld	c_x+1,x
1927  0202 92c700        	ld	[c_x.w],a
1929  0205               L5521:
1930                     ; 119 					while((_Pa_EncoderAB & 0b10000100)==0b10000100); 				// Enc = 1 & Zero = 1
1932  0205 b60f          	ld	a,_PFDR
1933  0207 a484          	and	a,#132
1934  0209 a184          	cp	a,#132
1935  020b 27f8          	jreq	L5521
1936                     ; 120 					m_byScanningHeadSignalPointer++;			
1938  020d c60032        	ld	a,_m_byScanningHeadSignalPointer+1
1939  0210 ab01          	add	a,#1
1940  0212 c70032        	ld	_m_byScanningHeadSignalPointer+1,a
1941  0215 c60031        	ld	a,_m_byScanningHeadSignalPointer
1942  0218 a900          	adc	a,#0
1943  021a c70031        	ld	_m_byScanningHeadSignalPointer,a
1945  021d               L3621:
1946                     ; 121 					while((_Pa_EncoderAB & 0b10000100)==0b00000100); 				// Enc = 0 & Zero = 1
1948  021d b60f          	ld	a,_PFDR
1949  021f a484          	and	a,#132
1950  0221 a104          	cp	a,#4
1951  0223 27f8          	jreq	L3621
1953  0225               L1721:
1954                     ; 122 					while(!(ADCCSR & EOC)&& (_btst(_Pa_Encoder0, _Pin_Encoder0)));	// waits for the end of the conversion
1956  0225 b670          	ld	a,_ADCCSR
1957  0227 a580          	bcp	a,#128
1958  0229 2606          	jrne	L5721
1960  022b b60f          	ld	a,_PFDR
1961  022d a504          	bcp	a,#4
1962  022f 26f4          	jrne	L1721
1963  0231               L5721:
1964                     ; 123 					byScanningHeadValue = ADCDRH;
1966  0231 b671          	ld	a,_ADCDRH
1967  0233 b7ff          	ld	_scanningHeadSignalAcquire$L-1,a
1968  0235               L1031:
1969                     ; 127 				while(m_byScanningHeadSignalPointer>=(m_arbyScanningHeadSignal+(ENCODER_PULSES/4))){};
1971  0235 c60032        	ld	a,_m_byScanningHeadSignalPointer+1
1972  0238 a033          	sub	a,#low(_m_arbyScanningHeadSignal+256)
1973  023a c60031        	ld	a,_m_byScanningHeadSignalPointer
1974  023d a233          	sbc	a,#high(_m_arbyScanningHeadSignal+256)
1975  023f 24f4          	jruge	L1031
1976                     ; 128 				if _btst(_Pa_Encoder0, _Pin_Encoder0)
1979  0241 b60f          	ld	a,_PFDR
1980  0243 a504          	bcp	a,#4
1981  0245 273b          	jreq	L5531
1982                     ; 130 					ADCCSR = ADSPEED | ADON | _Ain_S1Analogic; //PF4				// enables the A/D peripheral on Scanning Head
1984  0247 a66a          	ld	a,#106
1985  0249 b770          	ld	_ADCCSR,a
1987  024b               L3131:
1988                     ; 131 					while((_Pa_EncoderAB & 0b10000100)==0b10000100); 				// Enc = 1 & Zero = 1
1990  024b b60f          	ld	a,_PFDR
1991  024d a484          	and	a,#132
1992  024f a184          	cp	a,#132
1993  0251 27f8          	jreq	L3131
1994                     ; 132 					m_byScanningHeadValue = byScanningHeadValue & 0b11000000;
1996  0253 b6ff          	ld	a,_scanningHeadSignalAcquire$L-1
1997  0255 a4c0          	and	a,#192
1998  0257 c70030        	ld	_m_byScanningHeadValue,a
2000  025a               L3231:
2001                     ; 133 					while((_Pa_EncoderAB & 0b10000100)==0b00000100); 				// Enc = 0 & Zero = 1
2003  025a b60f          	ld	a,_PFDR
2004  025c a484          	and	a,#132
2005  025e a104          	cp	a,#4
2006  0260 27f8          	jreq	L3231
2008  0262               L1331:
2009                     ; 134 					while((_Pa_EncoderAB & 0b10000100)==0b10000100); 				// Enc = 1 & Zero = 1
2011  0262 b60f          	ld	a,_PFDR
2012  0264 a484          	and	a,#132
2013  0266 a184          	cp	a,#132
2014  0268 27f8          	jreq	L1331
2016  026a               L7331:
2017                     ; 135 					while((_Pa_EncoderAB & 0b10000100)==0b00000100); 				// Enc = 0 & Zero = 1
2019  026a b60f          	ld	a,_PFDR
2020  026c a484          	and	a,#132
2021  026e a104          	cp	a,#4
2022  0270 27f8          	jreq	L7331
2024  0272               L5431:
2025                     ; 136 					while(!(ADCCSR & EOC)&& (_btst(_Pa_Encoder0, _Pin_Encoder0)));	// waits for the end of the conversion
2027  0272 b670          	ld	a,_ADCCSR
2028  0274 a580          	bcp	a,#128
2029  0276 2606          	jrne	L1531
2031  0278 b60f          	ld	a,_PFDR
2032  027a a504          	bcp	a,#4
2033  027c 26f4          	jrne	L5431
2034  027e               L1531:
2035                     ; 137 					byScanningHeadValue = ADCDRH;
2037  027e b671          	ld	a,_ADCDRH
2038  0280 b7ff          	ld	_scanningHeadSignalAcquire$L-1,a
2039  0282               L5531:
2040                     ; 140 				while(m_byScanningHeadSignalPointer>=(m_arbyScanningHeadSignal+(ENCODER_PULSES/4))){};
2042  0282 c60032        	ld	a,_m_byScanningHeadSignalPointer+1
2043  0285 a033          	sub	a,#low(_m_arbyScanningHeadSignal+256)
2044  0287 c60031        	ld	a,_m_byScanningHeadSignalPointer
2045  028a a233          	sbc	a,#high(_m_arbyScanningHeadSignal+256)
2046  028c 24f4          	jruge	L5531
2047                     ; 141 				if _btst(_Pa_Encoder0, _Pin_Encoder0)
2050  028e b60f          	ld	a,_PFDR
2051  0290 a504          	bcp	a,#4
2052  0292 2744          	jreq	L1341
2053                     ; 143 					ADCCSR = ADSPEED | ADON | _Ain_S1Analogic; //PF4				// enables the A/D peripheral on Scanning Head
2055  0294 a66a          	ld	a,#106
2056  0296 b770          	ld	_ADCCSR,a
2058  0298               L7631:
2059                     ; 144 					while((_Pa_EncoderAB & 0b10000100)==0b10000100); 				// Enc = 1 & Zero = 1
2061  0298 b60f          	ld	a,_PFDR
2062  029a a484          	and	a,#132
2063  029c a184          	cp	a,#132
2064  029e 27f8          	jreq	L7631
2065                     ; 145 					byScanningHeadValue = (byScanningHeadValue & 0b11000000)>>2;
2067  02a0 b6ff          	ld	a,_scanningHeadSignalAcquire$L-1
2068  02a2 a4c0          	and	a,#192
2069  02a4 44            	srl	a
2070  02a5 44            	srl	a
2071  02a6 b7ff          	ld	_scanningHeadSignalAcquire$L-1,a
2073  02a8               L7731:
2074                     ; 146 					while((_Pa_EncoderAB & 0b10000100)==0b00000100); 				// Enc = 0 & Zero = 1
2076  02a8 b60f          	ld	a,_PFDR
2077  02aa a484          	and	a,#132
2078  02ac a104          	cp	a,#4
2079  02ae 27f8          	jreq	L7731
2080                     ; 147 					m_byScanningHeadValue += byScanningHeadValue;
2082  02b0 c60030        	ld	a,_m_byScanningHeadValue
2083  02b3 bbff          	add	a,_scanningHeadSignalAcquire$L-1
2084  02b5 c70030        	ld	_m_byScanningHeadValue,a
2086  02b8               L5041:
2087                     ; 148 					while((_Pa_EncoderAB & 0b10000100)==0b10000100); 				// Enc = 1 & Zero = 1
2089  02b8 b60f          	ld	a,_PFDR
2090  02ba a484          	and	a,#132
2091  02bc a184          	cp	a,#132
2092  02be 27f8          	jreq	L5041
2094  02c0               L3141:
2095                     ; 149 					while((_Pa_EncoderAB & 0b10000100)==0b00000100); 				// Enc = 0 & Zero = 1
2097  02c0 b60f          	ld	a,_PFDR
2098  02c2 a484          	and	a,#132
2099  02c4 a104          	cp	a,#4
2100  02c6 27f8          	jreq	L3141
2102  02c8               L1241:
2103                     ; 150 					while(!(ADCCSR & EOC)&& (_btst(_Pa_Encoder0, _Pin_Encoder0)));	// waits for the end of the conversion
2105  02c8 b670          	ld	a,_ADCCSR
2106  02ca a580          	bcp	a,#128
2107  02cc 2606          	jrne	L5241
2109  02ce b60f          	ld	a,_PFDR
2110  02d0 a504          	bcp	a,#4
2111  02d2 26f4          	jrne	L1241
2112  02d4               L5241:
2113                     ; 151 					byScanningHeadValue = ADCDRH;
2115  02d4 b671          	ld	a,_ADCDRH
2116  02d6 b7ff          	ld	_scanningHeadSignalAcquire$L-1,a
2117  02d8               L1341:
2118                     ; 154 				while(m_byScanningHeadSignalPointer>=(m_arbyScanningHeadSignal+(ENCODER_PULSES/4))){};
2120  02d8 c60032        	ld	a,_m_byScanningHeadSignalPointer+1
2121  02db a033          	sub	a,#low(_m_arbyScanningHeadSignal+256)
2122  02dd c60031        	ld	a,_m_byScanningHeadSignalPointer
2123  02e0 a233          	sbc	a,#high(_m_arbyScanningHeadSignal+256)
2124  02e2 24f4          	jruge	L1341
2125                     ; 155 				if _btst(_Pa_Encoder0, _Pin_Encoder0)
2128  02e4 b60f          	ld	a,_PFDR
2129  02e6 a504          	bcp	a,#4
2130  02e8 2745          	jreq	L5341
2131                     ; 157 					ADCCSR = ADSPEED | ADON | _Ain_S1Analogic; //PF4				// enables the A/D peripheral on Scanning Head
2133  02ea a66a          	ld	a,#106
2134  02ec b770          	ld	_ADCCSR,a
2136  02ee               L3441:
2137                     ; 158 					while((_Pa_EncoderAB & 0b10000100)==0b10000100); 				// Enc = 1 & Zero = 1
2139  02ee b60f          	ld	a,_PFDR
2140  02f0 a484          	and	a,#132
2141  02f2 a184          	cp	a,#132
2142  02f4 27f8          	jreq	L3441
2143                     ; 159 					byScanningHeadValue = (byScanningHeadValue & 0b11000000)>>4;
2145  02f6 b6ff          	ld	a,_scanningHeadSignalAcquire$L-1
2146  02f8 a4c0          	and	a,#192
2147  02fa 4e            	swap	a
2148  02fb a40f          	and	a,#15
2149  02fd b7ff          	ld	_scanningHeadSignalAcquire$L-1,a
2151  02ff               L3541:
2152                     ; 160 					while((_Pa_EncoderAB & 0b10000100)==0b00000100); 				// Enc = 0 & Zero = 1
2154  02ff b60f          	ld	a,_PFDR
2155  0301 a484          	and	a,#132
2156  0303 a104          	cp	a,#4
2157  0305 27f8          	jreq	L3541
2158                     ; 161 					m_byScanningHeadValue += byScanningHeadValue;
2160  0307 c60030        	ld	a,_m_byScanningHeadValue
2161  030a bbff          	add	a,_scanningHeadSignalAcquire$L-1
2162  030c c70030        	ld	_m_byScanningHeadValue,a
2164  030f               L1641:
2165                     ; 162 					while((_Pa_EncoderAB & 0b10000100)==0b10000100); 				// Enc = 1 & Zero = 1
2167  030f b60f          	ld	a,_PFDR
2168  0311 a484          	and	a,#132
2169  0313 a184          	cp	a,#132
2170  0315 27f8          	jreq	L1641
2172  0317               L7641:
2173                     ; 163 					while((_Pa_EncoderAB & 0b10000100)==0b00000100); 				// Enc = 0 & Zero = 1
2175  0317 b60f          	ld	a,_PFDR
2176  0319 a484          	and	a,#132
2177  031b a104          	cp	a,#4
2178  031d 27f8          	jreq	L7641
2180  031f               L5741:
2181                     ; 164 					while(!(ADCCSR & EOC)&& (_btst(_Pa_Encoder0, _Pin_Encoder0)));	// waits for the end of the conversion
2183  031f b670          	ld	a,_ADCCSR
2184  0321 a580          	bcp	a,#128
2185  0323 2606          	jrne	L1051
2187  0325 b60f          	ld	a,_PFDR
2188  0327 a504          	bcp	a,#4
2189  0329 26f4          	jrne	L5741
2190  032b               L1051:
2191                     ; 165 					byScanningHeadValue = ADCDRH;
2193  032b b671          	ld	a,_ADCDRH
2194  032d b7ff          	ld	_scanningHeadSignalAcquire$L-1,a
2195  032f               L5341:
2196                     ; 167 				woLoopIndex++;
2198  032f 3cfe          	inc	_scanningHeadSignalAcquire$L-2
2199  0331 2602          	jrne	L41
2200  0333 3cfd          	inc	_scanningHeadSignalAcquire$L-3
2201  0335               L41:
2202  0335               L7121:
2203                     ; 108 			while (_btst(_Pa_Encoder0, _Pin_Encoder0) && (!displayIsKeyPressed()))
2205  0335 b60f          	ld	a,_PFDR
2206  0337 a504          	bcp	a,#4
2207  0339 2603          	jrne	L62
2208  033b cc04e0        	jp	L5511
2209  033e               L62:
2211  033e cd0000        	call	_displayIsKeyPressed
2213  0341 4d            	tnz	a
2214  0342 2603          	jrne	L03
2215  0344 cc01c0        	jp	L5221
2216  0347               L03:
2217  0347 cc04e0        	jp	L5511
2218  034a               L1611:
2219                     ; 172 			m_woEncoderZeroLoop =0x0000;
2221  034a 4f            	clr	a
2222  034b c70000        	ld	_m_woEncoderZeroLoop,a
2223  034e c70001        	ld	_m_woEncoderZeroLoop+1,a
2225  0351 202a          	jra	L3151
2226  0353               L1251:
2227                     ; 175 				while(!_btst(_Pa_Encoder0, _Pin_Encoder0)&& (!displayIsKeyPressed()));
2229  0353 b60f          	ld	a,_PFDR
2230  0355 a504          	bcp	a,#4
2231  0357 2618          	jrne	L1351
2233  0359 cd0000        	call	_displayIsKeyPressed
2235  035c 4d            	tnz	a
2236  035d 27f4          	jreq	L1251
2237  035f 2010          	jra	L1351
2238  0361               L7251:
2239                     ; 176 				while(_btst(_Pa_Encoder0, _Pin_Encoder0)&& (!displayIsKeyPressed())){m_woEncoderZeroLoop++;};
2241  0361 c60001        	ld	a,_m_woEncoderZeroLoop+1
2242  0364 ab01          	add	a,#1
2243  0366 c70001        	ld	_m_woEncoderZeroLoop+1,a
2244  0369 c60000        	ld	a,_m_woEncoderZeroLoop
2245  036c a900          	adc	a,#0
2246  036e c70000        	ld	_m_woEncoderZeroLoop,a
2247  0371               L1351:
2250  0371 b60f          	ld	a,_PFDR
2251  0373 a504          	bcp	a,#4
2252  0375 2706          	jreq	L3151
2254  0377 cd0000        	call	_displayIsKeyPressed
2256  037a 4d            	tnz	a
2257  037b 27e4          	jreq	L7251
2258  037d               L3151:
2259                     ; 173 			while((m_woEncoderZeroLoop<3)&& (!displayIsKeyPressed()))
2261  037d c60001        	ld	a,_m_woEncoderZeroLoop+1
2262  0380 a003          	sub	a,#3
2263  0382 c60000        	ld	a,_m_woEncoderZeroLoop
2264  0385 a200          	sbc	a,#0
2265  0387 2503          	jrult	L23
2266  0389 cc04ca        	jp	L3451
2267  038c               L23:
2269  038c cd0000        	call	_displayIsKeyPressed
2271  038f 4d            	tnz	a
2272  0390 27c1          	jreq	L1251
2273  0392 cc04ca        	jp	L3451
2274  0395               L1451:
2275                     ; 182 				if (!_btst(_Pa_Encoder0, _Pin_Encoder0))
2277  0395 b60f          	ld	a,_PFDR
2278  0397 a504          	bcp	a,#4
2279  0399 265f          	jrne	L7451
2280                     ; 184 					ADCCSR = ADSPEED | ADON | _Ain_S1Analogic; //PF4				// enables the A/D peripheral on Scanning Head
2282  039b a66a          	ld	a,#106
2283  039d b770          	ld	_ADCCSR,a
2285  039f               L5551:
2286                     ; 185 					while((_Pa_EncoderAB & 0b10000100)==0b10000000); 				// Enc = 1 & Zero = 0
2288  039f b60f          	ld	a,_PFDR
2289  03a1 a484          	and	a,#132
2290  03a3 a180          	cp	a,#128
2291  03a5 27f8          	jreq	L5551
2292                     ; 186 					m_byScanningHeadValue += (byScanningHeadValue & 0b11000000)>>6;
2294  03a7 b6ff          	ld	a,_scanningHeadSignalAcquire$L-1
2295  03a9 a4c0          	and	a,#192
2296  03ab 4e            	swap	a
2297  03ac 44            	srl	a
2298  03ad 44            	srl	a
2299  03ae a403          	and	a,#3
2300  03b0 cb0030        	add	a,_m_byScanningHeadValue
2301  03b3 c70030        	ld	_m_byScanningHeadValue,a
2303  03b6               L3651:
2304                     ; 187 					while((_Pa_EncoderAB & 0b10000100)==0b00000000); 				// Enc = 0 & Zero = 0
2306  03b6 b60f          	ld	a,_PFDR
2307  03b8 a584          	bcp	a,#132
2308  03ba 27fa          	jreq	L3651
2309                     ; 188 					(*m_byScanningHeadSignalPointer) = m_byScanningHeadValue;
2311  03bc c60031        	ld	a,_m_byScanningHeadSignalPointer
2312  03bf b700          	ld	c_x,a
2313  03c1 ce0032        	ld	x,_m_byScanningHeadSignalPointer+1
2314  03c4 c60030        	ld	a,_m_byScanningHeadValue
2315  03c7 bf01          	ld	c_x+1,x
2316  03c9 92c700        	ld	[c_x.w],a
2318  03cc               L3751:
2319                     ; 189 					while((_Pa_EncoderAB & 0b10000100)==0b10000000); 				// Enc = 1 & Zero = 0
2321  03cc b60f          	ld	a,_PFDR
2322  03ce a484          	and	a,#132
2323  03d0 a180          	cp	a,#128
2324  03d2 27f8          	jreq	L3751
2325                     ; 190 					m_byScanningHeadSignalPointer++;			
2327  03d4 c60032        	ld	a,_m_byScanningHeadSignalPointer+1
2328  03d7 ab01          	add	a,#1
2329  03d9 c70032        	ld	_m_byScanningHeadSignalPointer+1,a
2330  03dc c60031        	ld	a,_m_byScanningHeadSignalPointer
2331  03df a900          	adc	a,#0
2332  03e1 c70031        	ld	_m_byScanningHeadSignalPointer,a
2334  03e4               L1061:
2335                     ; 191 					while((_Pa_EncoderAB & 0b10000100)==0b00000000); 				// Enc = 0 & Zero = 0
2337  03e4 b60f          	ld	a,_PFDR
2338  03e6 a584          	bcp	a,#132
2339  03e8 27fa          	jreq	L1061
2341  03ea               L7061:
2342                     ; 192 					while(!(ADCCSR & EOC)&& (_btst(_Pa_Encoder0, _Pin_Encoder0)));	// waits for the end of the conversion
2344  03ea b670          	ld	a,_ADCCSR
2345  03ec a580          	bcp	a,#128
2346  03ee 2606          	jrne	L3161
2348  03f0 b60f          	ld	a,_PFDR
2349  03f2 a504          	bcp	a,#4
2350  03f4 26f4          	jrne	L7061
2351  03f6               L3161:
2352                     ; 193 					byScanningHeadValue = ADCDRH;
2354  03f6 b671          	ld	a,_ADCDRH
2355  03f8 b7ff          	ld	_scanningHeadSignalAcquire$L-1,a
2356  03fa               L7451:
2357                     ; 197 				if (!_btst(_Pa_Encoder0, _Pin_Encoder0))
2359  03fa b60f          	ld	a,_PFDR
2360  03fc a504          	bcp	a,#4
2361  03fe 2637          	jrne	L5161
2362                     ; 199 					ADCCSR = ADSPEED | ADON | _Ain_S1Analogic; //PF4				// enables the A/D peripheral on Scanning Head
2364  0400 a66a          	ld	a,#106
2365  0402 b770          	ld	_ADCCSR,a
2367  0404               L3261:
2368                     ; 200 					while((_Pa_EncoderAB & 0b10000100)==0b10000000); 				// Enc = 1 & Zero = 0
2370  0404 b60f          	ld	a,_PFDR
2371  0406 a484          	and	a,#132
2372  0408 a180          	cp	a,#128
2373  040a 27f8          	jreq	L3261
2374                     ; 201 					m_byScanningHeadValue = byScanningHeadValue & 0b11000000;
2376  040c b6ff          	ld	a,_scanningHeadSignalAcquire$L-1
2377  040e a4c0          	and	a,#192
2378  0410 c70030        	ld	_m_byScanningHeadValue,a
2380  0413               L3361:
2381                     ; 202 					while((_Pa_EncoderAB & 0b10000100)==0b00000000); 				// Enc = 0 & Zero = 0
2383  0413 b60f          	ld	a,_PFDR
2384  0415 a584          	bcp	a,#132
2385  0417 27fa          	jreq	L3361
2387  0419               L1461:
2388                     ; 203 					while((_Pa_EncoderAB & 0b10000100)==0b10000000); 				// Enc = 1 & Zero = 0
2390  0419 b60f          	ld	a,_PFDR
2391  041b a484          	and	a,#132
2392  041d a180          	cp	a,#128
2393  041f 27f8          	jreq	L1461
2395  0421               L7461:
2396                     ; 204 					while((_Pa_EncoderAB & 0b10000100)==0b00000000); 				// Enc = 0 & Zero = 0
2398  0421 b60f          	ld	a,_PFDR
2399  0423 a584          	bcp	a,#132
2400  0425 27fa          	jreq	L7461
2402  0427               L5561:
2403                     ; 205 					while(!(ADCCSR & EOC)&& (_btst(_Pa_Encoder0, _Pin_Encoder0)));	// waits for the end of the conversion
2405  0427 b670          	ld	a,_ADCCSR
2406  0429 a580          	bcp	a,#128
2407  042b 2606          	jrne	L1661
2409  042d b60f          	ld	a,_PFDR
2410  042f a504          	bcp	a,#4
2411  0431 26f4          	jrne	L5561
2412  0433               L1661:
2413                     ; 206 					byScanningHeadValue = ADCDRH;
2415  0433 b671          	ld	a,_ADCDRH
2416  0435 b7ff          	ld	_scanningHeadSignalAcquire$L-1,a
2417  0437               L5161:
2418                     ; 210 				if (!_btst(_Pa_Encoder0, _Pin_Encoder0))
2420  0437 b60f          	ld	a,_PFDR
2421  0439 a504          	bcp	a,#4
2422  043b 2640          	jrne	L3661
2423                     ; 212 					ADCCSR = ADSPEED | ADON | _Ain_S1Analogic; //PF4				// enables the A/D peripheral on Scanning Head
2425  043d a66a          	ld	a,#106
2426  043f b770          	ld	_ADCCSR,a
2428  0441               L1761:
2429                     ; 213 					while((_Pa_EncoderAB & 0b10000100)==0b10000000); 				// Enc = 1 & Zero = 0
2431  0441 b60f          	ld	a,_PFDR
2432  0443 a484          	and	a,#132
2433  0445 a180          	cp	a,#128
2434  0447 27f8          	jreq	L1761
2435                     ; 214 					byScanningHeadValue = (byScanningHeadValue & 0b11000000)>>2;
2437  0449 b6ff          	ld	a,_scanningHeadSignalAcquire$L-1
2438  044b a4c0          	and	a,#192
2439  044d 44            	srl	a
2440  044e 44            	srl	a
2441  044f b7ff          	ld	_scanningHeadSignalAcquire$L-1,a
2443  0451               L1071:
2444                     ; 215 					while((_Pa_EncoderAB & 0b10000100)==0b00000000); 				// Enc = 0 & Zero = 0
2446  0451 b60f          	ld	a,_PFDR
2447  0453 a584          	bcp	a,#132
2448  0455 27fa          	jreq	L1071
2449                     ; 216 					m_byScanningHeadValue += byScanningHeadValue;
2451  0457 c60030        	ld	a,_m_byScanningHeadValue
2452  045a bbff          	add	a,_scanningHeadSignalAcquire$L-1
2453  045c c70030        	ld	_m_byScanningHeadValue,a
2455  045f               L7071:
2456                     ; 217 					while((_Pa_EncoderAB & 0b10000100)==0b10000000); 				// Enc = 1 & Zero = 0
2458  045f b60f          	ld	a,_PFDR
2459  0461 a484          	and	a,#132
2460  0463 a180          	cp	a,#128
2461  0465 27f8          	jreq	L7071
2463  0467               L5171:
2464                     ; 218 					while((_Pa_EncoderAB & 0b10000100)==0b00000000); 				// Enc = 0 & Zero = 0
2466  0467 b60f          	ld	a,_PFDR
2467  0469 a584          	bcp	a,#132
2468  046b 27fa          	jreq	L5171
2470  046d               L3271:
2471                     ; 219 					while(!(ADCCSR & EOC)&& (_btst(_Pa_Encoder0, _Pin_Encoder0)));	// waits for the end of the conversion
2473  046d b670          	ld	a,_ADCCSR
2474  046f a580          	bcp	a,#128
2475  0471 2606          	jrne	L7271
2477  0473 b60f          	ld	a,_PFDR
2478  0475 a504          	bcp	a,#4
2479  0477 26f4          	jrne	L3271
2480  0479               L7271:
2481                     ; 220 					byScanningHeadValue = ADCDRH;
2483  0479 b671          	ld	a,_ADCDRH
2484  047b b7ff          	ld	_scanningHeadSignalAcquire$L-1,a
2485  047d               L3661:
2486                     ; 224 				if (!_btst(_Pa_Encoder0, _Pin_Encoder0))
2488  047d b60f          	ld	a,_PFDR
2489  047f a504          	bcp	a,#4
2490  0481 2641          	jrne	L1371
2491                     ; 226 					ADCCSR = ADSPEED | ADON | _Ain_S1Analogic; //PF4				// enables the A/D peripheral on Scanning Head
2493  0483 a66a          	ld	a,#106
2494  0485 b770          	ld	_ADCCSR,a
2496  0487               L7371:
2497                     ; 227 					while((_Pa_EncoderAB & 0b10000100)==0b10000000); 				// Enc = 1 & Zero = 0
2499  0487 b60f          	ld	a,_PFDR
2500  0489 a484          	and	a,#132
2501  048b a180          	cp	a,#128
2502  048d 27f8          	jreq	L7371
2503                     ; 228 					byScanningHeadValue = (byScanningHeadValue & 0b11000000)>>4;
2505  048f b6ff          	ld	a,_scanningHeadSignalAcquire$L-1
2506  0491 a4c0          	and	a,#192
2507  0493 4e            	swap	a
2508  0494 a40f          	and	a,#15
2509  0496 b7ff          	ld	_scanningHeadSignalAcquire$L-1,a
2511  0498               L7471:
2512                     ; 229 					while((_Pa_EncoderAB & 0b10000100)==0b00000000); 				// Enc = 0 & Zero = 0
2514  0498 b60f          	ld	a,_PFDR
2515  049a a584          	bcp	a,#132
2516  049c 27fa          	jreq	L7471
2517                     ; 230 					m_byScanningHeadValue += byScanningHeadValue;
2519  049e c60030        	ld	a,_m_byScanningHeadValue
2520  04a1 bbff          	add	a,_scanningHeadSignalAcquire$L-1
2521  04a3 c70030        	ld	_m_byScanningHeadValue,a
2523  04a6               L5571:
2524                     ; 231 					while((_Pa_EncoderAB & 0b10000100)==0b10000000); 				// Enc = 1 & Zero = 0
2526  04a6 b60f          	ld	a,_PFDR
2527  04a8 a484          	and	a,#132
2528  04aa a180          	cp	a,#128
2529  04ac 27f8          	jreq	L5571
2531  04ae               L3671:
2532                     ; 232 					while((_Pa_EncoderAB & 0b10000100)==0b00000000); 				// Enc = 0 & Zero = 0
2534  04ae b60f          	ld	a,_PFDR
2535  04b0 a584          	bcp	a,#132
2536  04b2 27fa          	jreq	L3671
2538  04b4               L1771:
2539                     ; 233 					while(!(ADCCSR & EOC)&& (_btst(_Pa_Encoder0, _Pin_Encoder0)));	// waits for the end of the conversion
2541  04b4 b670          	ld	a,_ADCCSR
2542  04b6 a580          	bcp	a,#128
2543  04b8 2606          	jrne	L5771
2545  04ba b60f          	ld	a,_PFDR
2546  04bc a504          	bcp	a,#4
2547  04be 26f4          	jrne	L1771
2548  04c0               L5771:
2549                     ; 234 					byScanningHeadValue = ADCDRH;
2551  04c0 b671          	ld	a,_ADCDRH
2552  04c2 b7ff          	ld	_scanningHeadSignalAcquire$L-1,a
2553  04c4               L1371:
2554                     ; 236 				woLoopIndex++;
2556  04c4 3cfe          	inc	_scanningHeadSignalAcquire$L-2
2557  04c6 2602          	jrne	L61
2558  04c8 3cfd          	inc	_scanningHeadSignalAcquire$L-3
2559  04ca               L61:
2560  04ca               L3451:
2561                     ; 179 			while (!_btst(_Pa_Encoder0, _Pin_Encoder0)&& (!displayIsKeyPressed()) && byPointerIncrement-->0)
2563  04ca b60f          	ld	a,_PFDR
2564  04cc a504          	bcp	a,#4
2565  04ce 2610          	jrne	L5511
2567  04d0 cd0000        	call	_displayIsKeyPressed
2569  04d3 4d            	tnz	a
2570  04d4 260a          	jrne	L5511
2572  04d6 b6fc          	ld	a,_scanningHeadSignalAcquire$L-4
2573  04d8 3afc          	dec	_scanningHeadSignalAcquire$L-4
2574  04da 4d            	tnz	a
2575  04db 2703          	jreq	L43
2576  04dd cc0395        	jp	L1451
2577  04e0               L43:
2578  04e0               L5511:
2579                     ; 97 	while((woLoopIndex<100)&&(!displayIsKeyPressed()))
2581  04e0 b6fe          	ld	a,_scanningHeadSignalAcquire$L-2
2582  04e2 a064          	sub	a,#100
2583  04e4 b6fd          	ld	a,_scanningHeadSignalAcquire$L-3
2584  04e6 a200          	sbc	a,#0
2585  04e8 2409          	jruge	L3002
2587  04ea cd0000        	call	_displayIsKeyPressed
2589  04ed 4d            	tnz	a
2590  04ee 2603          	jrne	L63
2591  04f0 cc0165        	jp	L3511
2592  04f3               L63:
2593  04f3               L3002:
2594                     ; 240 }
2597  04f3 81            	ret
2705                     	switch	.bss
2706  0000               _m_woEncoderZeroLoop:
2707  0000 0000          	ds.b	2
2708                     	xdef	_m_woEncoderZeroLoop
2709  0002               _m_woEncoderGateWidth:
2710  0002 0000          	ds.b	2
2711                     	xdef	_m_woEncoderGateWidth
2712  0004               _m_arbyEncoderGate:
2713  0004 000000000000  	ds.b	32
2714                     	xdef	_m_arbyEncoderGate
2715  0024               _m_arbyEncoderSignals:
2716  0024 000000000000  	ds.b	8
2717                     	xdef	_m_arbyEncoderSignals
2718  002c               _m_woEncoderGateEnd:
2719  002c 0000          	ds.b	2
2720                     	xdef	_m_woEncoderGateEnd
2721  002e               _m_woEncoderGateStart:
2722  002e 0000          	ds.b	2
2723                     	xdef	_m_woEncoderGateStart
2724  0030               _m_byScanningHeadValue:
2725  0030 00            	ds.b	1
2726                     	xdef	_m_byScanningHeadValue
2727  0031               _m_byScanningHeadSignalPointer:
2728  0031 0000          	ds.b	2
2729                     	xdef	_m_byScanningHeadSignalPointer
2730  0033               _m_arbyScanningHeadSignal:
2731  0033 000000000000  	ds.b	256
2732                     	xdef	_m_arbyScanningHeadSignal
2733                     	xdef	_scanningHeadSignalEncoderAutoSet
2734                     	xdef	_scanningHeadSignalAcquireGate
2735                     	xdef	_scanningHeadSignalAcquire
2736                     	xref	_displayIsKeyPressed
2737                     	xref	_parametersSet
2738                     	xref	_parametersGetValue
2739                     	xref	_STI_SendMessage
2740                     	xref	_STI_GetMessage
2741                     	switch	.const
2742  0001               L7111:
2743  0001 44800000      	dc.w	17536,0
2744                     	xref.b	c_x
2745                     	xref.b	c_y
2765                     	xref	c_ftoi
2766                     	xref	c_xfmul
2767                     	xref	c_fdiv
2768                     	xref	c_ltor
2769                     	xref	c_udiv
2770                     	xref	c_rtol
2771                     	xref	c_uitof
2772                     	xref.b	_parametersSet$L
2773                     	xref.b	_STI_SendMessage$L
2774                     	end
