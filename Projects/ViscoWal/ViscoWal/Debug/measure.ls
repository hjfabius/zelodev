   1                     ; C Compiler for ST7 (COSMIC Software)
   2                     ; Generator V4.5.5 - 12 Jan 2006
1280                     .const:	section	.text
1281  0000               L327_mc_byApplicationVersion:
1282  0000 da            	dc.b	218
1370                     ; 25 void measureInit(void)
1370                     ; 26 {
1371                     	switch	.text
1373                     	xref.b	_measureInit$L
1374  0000               _measureInit:
1377                     ; 27 	BYTE i = MEASURE_VISCOSITY_CALC_INDEXES;
1379  0000 a602          	ld	a,#2
1380  0002 b7ff          	ld	_measureInit$L-1,a
1381                     ; 28 	BYTE j = MEASURE_VISCOSITY_ARRAY_LENGTH;
1383  0004 a620          	ld	a,#32
1384  0006 b7fe          	ld	_measureInit$L-2,a
1385                     ; 30 	measureSetValveStatus(VALVES_CLOSED);
1387  0008 a680          	ld	a,#128
1388  000a cd0312        	call	_measureSetValveStatus
1391  000d cc0119        	jp	L377
1392  0010               L177:
1393                     ; 34 		m_ardblViscosityPreviousPValue	[i] = 0.0;
1395  0010 beff          	ld	x,_measureInit$L-1
1396  0012 58            	sll	x
1397  0013 58            	sll	x
1398  0014 c60020        	ld	a,L3001+3
1399  0017 d701eb        	ld	(_m_ardblViscosityPreviousPValue+3,x),a
1400  001a c6001f        	ld	a,L3001+2
1401  001d d701ea        	ld	(_m_ardblViscosityPreviousPValue+2,x),a
1402  0020 c6001e        	ld	a,L3001+1
1403  0023 d701e9        	ld	(_m_ardblViscosityPreviousPValue+1,x),a
1404  0026 c6001d        	ld	a,L3001
1405  0029 d701e8        	ld	(_m_ardblViscosityPreviousPValue,x),a
1406                     ; 35 		m_ardblViscosityPValue			[i] = 0.0;
1408  002c beff          	ld	x,_measureInit$L-1
1409  002e 58            	sll	x
1410  002f 58            	sll	x
1411  0030 c60020        	ld	a,L3001+3
1412  0033 d701e3        	ld	(_m_ardblViscosityPValue+3,x),a
1413  0036 c6001f        	ld	a,L3001+2
1414  0039 d701e2        	ld	(_m_ardblViscosityPValue+2,x),a
1415  003c c6001e        	ld	a,L3001+1
1416  003f d701e1        	ld	(_m_ardblViscosityPValue+1,x),a
1417  0042 c6001d        	ld	a,L3001
1418  0045 d701e0        	ld	(_m_ardblViscosityPValue,x),a
1419                     ; 36 		m_ardblViscosityIValue			[i] = 0.0;
1421  0048 beff          	ld	x,_measureInit$L-1
1422  004a 58            	sll	x
1423  004b 58            	sll	x
1424  004c c60020        	ld	a,L3001+3
1425  004f d701db        	ld	(_m_ardblViscosityIValue+3,x),a
1426  0052 c6001f        	ld	a,L3001+2
1427  0055 d701da        	ld	(_m_ardblViscosityIValue+2,x),a
1428  0058 c6001e        	ld	a,L3001+1
1429  005b d701d9        	ld	(_m_ardblViscosityIValue+1,x),a
1430  005e c6001d        	ld	a,L3001
1431  0061 d701d8        	ld	(_m_ardblViscosityIValue,x),a
1432                     ; 37 		m_ardblViscosityDValue			[i] = 0.0;
1434  0064 beff          	ld	x,_measureInit$L-1
1435  0066 58            	sll	x
1436  0067 58            	sll	x
1437  0068 c60020        	ld	a,L3001+3
1438  006b d701d3        	ld	(_m_ardblViscosityDValue+3,x),a
1439  006e c6001f        	ld	a,L3001+2
1440  0071 d701d2        	ld	(_m_ardblViscosityDValue+2,x),a
1441  0074 c6001e        	ld	a,L3001+1
1442  0077 d701d1        	ld	(_m_ardblViscosityDValue+1,x),a
1443  007a c6001d        	ld	a,L3001
1444  007d d701d0        	ld	(_m_ardblViscosityDValue,x),a
1445                     ; 38 		m_ardblViscosityMeasured		[i] = 0.0;
1447  0080 beff          	ld	x,_measureInit$L-1
1448  0082 58            	sll	x
1449  0083 58            	sll	x
1450  0084 c60020        	ld	a,L3001+3
1451  0087 d7000b        	ld	(_m_ardblViscosityMeasured+3,x),a
1452  008a c6001f        	ld	a,L3001+2
1453  008d d7000a        	ld	(_m_ardblViscosityMeasured+2,x),a
1454  0090 c6001e        	ld	a,L3001+1
1455  0093 d70009        	ld	(_m_ardblViscosityMeasured+1,x),a
1456  0096 c6001d        	ld	a,L3001
1457  0099 d70008        	ld	(_m_ardblViscosityMeasured,x),a
1458                     ; 39 		m_ardblViscosityCalibratedValues[i] = 0.0;
1460  009c beff          	ld	x,_measureInit$L-1
1461  009e 58            	sll	x
1462  009f 58            	sll	x
1463  00a0 c60020        	ld	a,L3001+3
1464  00a3 d70003        	ld	(_m_ardblViscosityCalibratedValues+3,x),a
1465  00a6 c6001f        	ld	a,L3001+2
1466  00a9 d70002        	ld	(_m_ardblViscosityCalibratedValues+2,x),a
1467  00ac c6001e        	ld	a,L3001+1
1468  00af d70001        	ld	(_m_ardblViscosityCalibratedValues+1,x),a
1469  00b2 c6001d        	ld	a,L3001
1470  00b5 d70000        	ld	(_m_ardblViscosityCalibratedValues,x),a
1472  00b8 2058          	jra	L3101
1473  00ba               L7001:
1474                     ; 42 			m_ardblViscosityVValues			[i][j] = 0.0;
1476  00ba b6fe          	ld	a,_measureInit$L-2
1477  00bc 48            	sll	a
1478  00bd 48            	sll	a
1479  00be b7fd          	ld	_measureInit$L-3,a
1480  00c0 b6ff          	ld	a,_measureInit$L-1
1481  00c2 ae80          	ld	x,#128
1482  00c4 42            	mul	x,a
1483  00c5 bbfd          	add	a,_measureInit$L-3
1484  00c7 2401          	jrnc	L6
1485  00c9 5c            	inc	x
1486  00ca               L6:
1487  00ca abd0          	add	a,#low(_m_ardblViscosityVValues)
1488  00cc 88            	push	a
1489  00cd 9f            	ld	a,x
1490  00ce a9d0          	adc	a,#high(_m_ardblViscosityVValues)
1491  00d0 97            	ld	x,a
1492  00d1 84            	pop	a
1493  00d2 bf00          	ld	c_x,x
1494  00d4 97            	ld	x,a
1495  00d5 c60020        	ld	a,L3001+3
1496  00d8 b703          	ld	c_lreg+3,a
1497  00da c6001f        	ld	a,L3001+2
1498  00dd b702          	ld	c_lreg+2,a
1499  00df c6001e        	ld	a,L3001+1
1500  00e2 b701          	ld	c_lreg+1,a
1501  00e4 c6001d        	ld	a,L3001
1502  00e7 b700          	ld	c_lreg,a
1503  00e9 cd0000        	call	c_putlx
1505                     ; 43 			m_ardblViscosityRValues			   [j] = 0.0;
1507  00ec befe          	ld	x,_measureInit$L-2
1508  00ee 58            	sll	x
1509  00ef 58            	sll	x
1510  00f0 c60020        	ld	a,L3001+3
1511  00f3 d70053        	ld	(_m_ardblViscosityRValues+3,x),a
1512  00f6 c6001f        	ld	a,L3001+2
1513  00f9 d70052        	ld	(_m_ardblViscosityRValues+2,x),a
1514  00fc c6001e        	ld	a,L3001+1
1515  00ff d70051        	ld	(_m_ardblViscosityRValues+1,x),a
1516  0102 c6001d        	ld	a,L3001
1517  0105 d70050        	ld	(_m_ardblViscosityRValues,x),a
1518                     ; 44 			m_arwoViscosityMValues			   [j] = 0x0000;
1520  0108 befe          	ld	x,_measureInit$L-2
1521  010a 58            	sll	x
1522  010b 4f            	clr	a
1523  010c d70010        	ld	(_m_arwoViscosityMValues,x),a
1524  010f d70011        	ld	(_m_arwoViscosityMValues+1,x),a
1525  0112               L3101:
1526                     ; 40 		while(j-->0)
1528  0112 b6fe          	ld	a,_measureInit$L-2
1529  0114 3afe          	dec	_measureInit$L-2
1530  0116 4d            	tnz	a
1531  0117 26a1          	jrne	L7001
1532  0119               L377:
1533                     ; 32 	while(i-->0)
1535  0119 b6ff          	ld	a,_measureInit$L-1
1536  011b 3aff          	dec	_measureInit$L-1
1537  011d 4d            	tnz	a
1538  011e 2703          	jreq	L01
1539  0120 cc0010        	jp	L177
1540  0123               L01:
1541                     ; 47 }
1544  0123 81            	ret
1591                     ; 51 void measureUpdateTemperature(void)
1591                     ; 52 {
1592                     	switch	.text
1594                     	xref.b	_measureUpdateTemperature$L
1595  0124               _measureUpdateTemperature:
1598                     ; 53 	BYTE 	i 				= MEASURE_TEMPERATURE_AVG_FIELDS;
1600  0124 a620          	ld	a,#32
1601  0126 b7fb          	ld	_measureUpdateTemperature$L-5,a
1602                     ; 54 	LWORD 	lwoTemperature 	= 0x00000000;
1604  0128 a600          	ld	a,#0
1605  012a b7ff          	ld	_measureUpdateTemperature$L-1,a
1606  012c a600          	ld	a,#0
1607  012e b7fe          	ld	_measureUpdateTemperature$L-2,a
1608  0130 a600          	ld	a,#0
1609  0132 b7fd          	ld	_measureUpdateTemperature$L-3,a
1610  0134 a600          	ld	a,#0
1611  0136 b7fc          	ld	_measureUpdateTemperature$L-4,a
1613  0138 202f          	jra	L5401
1614  013a               L1401:
1615                     ; 58 		ADCCSR = ADON | _Ain_Temp;						// enables the A/D peripheral on Temperature                     
1617  013a a62c          	ld	a,#44
1618  013c b770          	ld	_ADCCSR,a
1620  013e               L5501:
1621                     ; 59 		while (!(ADCCSR & EOC));						// waits for the end of the conversion
1623  013e b670          	ld	a,_ADCCSR
1624  0140 a580          	bcp	a,#128
1625  0142 27fa          	jreq	L5501
1626                     ; 60 		lwoTemperature += ((LWORD)(ADCDRH*16))+((LWORD)(ADCDRL/16));
1628  0144 b672          	ld	a,_ADCDRL
1629  0146 4e            	swap	a
1630  0147 a40f          	and	a,#15
1631  0149 b703          	ld	c_lreg+3,a
1632  014b 4f            	clr	a
1633  014c b702          	ld	c_lreg+2,a
1634  014e b701          	ld	c_lreg+1,a
1635  0150 b700          	ld	c_lreg,a
1636  0152 aef7          	ld	x,#_measureUpdateTemperature$L-9
1637  0154 cd0000        	call	c_rtol
1639  0157 b671          	ld	a,_ADCDRH
1640  0159 ae10          	ld	x,#16
1641  015b 42            	mul	x,a
1642  015c cd0000        	call	c_itol
1644  015f aef7          	ld	x,#_measureUpdateTemperature$L-9
1645  0161 cd0000        	call	c_ladd
1647  0164 aefc          	ld	x,#_measureUpdateTemperature$L-4
1648  0166 cd0000        	call	c_lgadd
1650  0169               L5401:
1651                     ; 56 	while(i-->0)
1653  0169 b6fb          	ld	a,_measureUpdateTemperature$L-5
1654  016b 3afb          	dec	_measureUpdateTemperature$L-5
1655  016d 4d            	tnz	a
1656  016e 26ca          	jrne	L1401
1657                     ; 63 	if(lwoTemperature==0x00000000)		
1659  0170 aefc          	ld	x,#_measureUpdateTemperature$L-4
1660  0172 cd0000        	call	c_lzmp
1662  0175 260d          	jrne	L1601
1663                     ; 65 		parametersSet(PARAM_ALARM,PARAM_ALARM_MEASURING_TEMPERATURE);
1665  0177 a602          	ld	a,#2
1666  0179 b702          	ld	_parametersSet$L+2,a
1667  017b 3f01          	clr	_parametersSet$L+1
1668  017d a60d          	ld	a,#13
1669  017f cd0000        	call	_parametersSet
1672  0182 2020          	jra	L3601
1673  0184               L1601:
1674                     ; 69 		parametersSet(PARAM_IN_TEMPERATURE, (WORD) (lwoTemperature / MEASURE_TEMPERATURE_AVG_FIELDS));
1676  0184 aefc          	ld	x,#_measureUpdateTemperature$L-4
1677  0186 cd0000        	call	c_ltor
1679  0189 a605          	ld	a,#5
1680  018b cd0000        	call	c_lursh
1682  018e b603          	ld	a,c_lreg+3
1683  0190 b702          	ld	_parametersSet$L+2,a
1684  0192 b602          	ld	a,c_lreg+2
1685  0194 b701          	ld	_parametersSet$L+1,a
1686  0196 a605          	ld	a,#5
1687  0198 cd0000        	call	_parametersSet
1689                     ; 70 		parametersSet(PARAM_ALARM,PARAM_ALARM_OK);
1691  019b 3f01          	clr	_parametersSet$L+1
1692  019d 3f02          	clr	_parametersSet$L+2
1693  019f a60d          	ld	a,#13
1694  01a1 cd0000        	call	_parametersSet
1696  01a4               L3601:
1697                     ; 72 }
1700  01a4 81            	ret
1759                     ; 76 void measureUpdateViscosity(void)
1759                     ; 77 {
1760                     	switch	.text
1762                     	xref.b	_measureUpdateViscosity$L
1763  01a5               _measureUpdateViscosity:
1766                     ; 78 	LWORD 	lwoValue 	= 0x00000000;
1768  01a5 a600          	ld	a,#0
1769  01a7 b7fa          	ld	_measureUpdateViscosity$L-6,a
1770  01a9 a600          	ld	a,#0
1771  01ab b7f9          	ld	_measureUpdateViscosity$L-7,a
1772  01ad a600          	ld	a,#0
1773  01af b7f8          	ld	_measureUpdateViscosity$L-8,a
1774  01b1 a600          	ld	a,#0
1775  01b3 b7f7          	ld	_measureUpdateViscosity$L-9,a
1776                     ; 79 	LWORD 	lwoTimeout	= 0x00000000;
1778  01b5 a600          	ld	a,#0
1779  01b7 b7ff          	ld	_measureUpdateViscosity$L-1,a
1780  01b9 a600          	ld	a,#0
1781  01bb b7fe          	ld	_measureUpdateViscosity$L-2,a
1782  01bd a600          	ld	a,#0
1783  01bf b7fd          	ld	_measureUpdateViscosity$L-3,a
1784  01c1 a600          	ld	a,#0
1785  01c3 b7fc          	ld	_measureUpdateViscosity$L-4,a
1786                     ; 80 	BYTE 	byLoop		= MEASURE_VISCOSITY_INTERNAL_LOOP_COUNT;
1788  01c5 a601          	ld	a,#1
1789  01c7 b7fb          	ld	_measureUpdateViscosity$L-5,a
1790                     ; 84 	_bres(_Pa_Led_D1, _Pin_Led_D1);
1792  01c9 1f0c          	bres	_PEDR,#7
1793                     ; 85 	_bres(_Pa_Led_D2, _Pin_Led_D2);
1795  01cb 1d0c          	bres	_PEDR,#6
1796                     ; 86 	_bres(_Pa_Led_D3, _Pin_Led_D3);
1798  01cd 1b0c          	bres	_PEDR,#5
1800  01cf cc0296        	jp	L7211
1801  01d2               L5211:
1802                     ; 90 		switch(byLoop)
1804  01d2 b6fb          	ld	a,_measureUpdateViscosity$L-5
1806                     ; 112 			default:
1806                     ; 113 				break;
1807  01d4 4d            	tnz	a
1808  01d5 270b          	jreq	L5601
1809  01d7 4a            	dec	a
1810  01d8 2710          	jreq	L7601
1811  01da 4a            	dec	a
1812  01db 2715          	jreq	L1701
1813  01dd 4a            	dec	a
1814  01de 271a          	jreq	L3701
1815  01e0 201e          	jra	L5311
1816  01e2               L5601:
1817                     ; 92 			case 0:
1817                     ; 93 				_bset(_Pa_Led_D1, _Pin_Led_D1);
1819  01e2 1e0c          	bset	_PEDR,#7
1820                     ; 94 				_bres(_Pa_Led_D2, _Pin_Led_D2);
1822  01e4 1d0c          	bres	_PEDR,#6
1823                     ; 95 				_bres(_Pa_Led_D3, _Pin_Led_D3);			
1825  01e6 1b0c          	bres	_PEDR,#5
1826                     ; 96 				break;
1828  01e8 2016          	jra	L5311
1829  01ea               L7601:
1830                     ; 97 			case 1:
1830                     ; 98 				_bres(_Pa_Led_D1, _Pin_Led_D1);
1832  01ea 1f0c          	bres	_PEDR,#7
1833                     ; 99 				_bset(_Pa_Led_D2, _Pin_Led_D2);
1835  01ec 1c0c          	bset	_PEDR,#6
1836                     ; 100 				_bres(_Pa_Led_D3, _Pin_Led_D3);			
1838  01ee 1b0c          	bres	_PEDR,#5
1839                     ; 101 				break;
1841  01f0 200e          	jra	L5311
1842  01f2               L1701:
1843                     ; 102 			case 2:
1843                     ; 103 				_bset(_Pa_Led_D1, _Pin_Led_D1);
1845  01f2 1e0c          	bset	_PEDR,#7
1846                     ; 104 				_bset(_Pa_Led_D2, _Pin_Led_D2);			
1848  01f4 1c0c          	bset	_PEDR,#6
1849                     ; 105 				_bres(_Pa_Led_D3, _Pin_Led_D3);			
1851  01f6 1b0c          	bres	_PEDR,#5
1852                     ; 106 				break;
1854  01f8 2006          	jra	L5311
1855  01fa               L3701:
1856                     ; 107 			case 3:
1856                     ; 108 				_bres(_Pa_Led_D1, _Pin_Led_D1);
1858  01fa 1f0c          	bres	_PEDR,#7
1859                     ; 109 				_bres(_Pa_Led_D2, _Pin_Led_D2);			
1861  01fc 1d0c          	bres	_PEDR,#6
1862                     ; 110 				_bset(_Pa_Led_D3, _Pin_Led_D3);			
1864  01fe 1a0c          	bset	_PEDR,#5
1865                     ; 111 				break;
1867  0200               L5701:
1868                     ; 112 			default:
1868                     ; 113 				break;
1870  0200               L5311:
1871                     ; 117 		lwoTimeout = MEASURE_VISCOSITY_MEASURATION_TIMEOUT;
1873  0200 a6ff          	ld	a,#255
1874  0202 b7ff          	ld	_measureUpdateViscosity$L-1,a
1875  0204 a6ff          	ld	a,#255
1876  0206 b7fe          	ld	_measureUpdateViscosity$L-2,a
1877  0208 a602          	ld	a,#2
1878  020a b7fd          	ld	_measureUpdateViscosity$L-3,a
1879  020c a600          	ld	a,#0
1880  020e b7fc          	ld	_measureUpdateViscosity$L-4,a
1881                     ; 118 		measureSetValveStatus(VALVES_CLOSED);
1883  0210 a680          	ld	a,#128
1884  0212 cd0312        	call	_measureSetValveStatus
1887  0215 2007          	jra	L1411
1888  0217               L7311:
1889                     ; 146 				lwoTimeout--;
1891  0217 aefc          	ld	x,#_measureUpdateViscosity$L-4
1892  0219 a601          	ld	a,#1
1893  021b cd0000        	call	c_lgsbc
1895  021e               L1411:
1896                     ; 140 			while(
1896                     ; 141 					_btst(_Pa_NamurUp, _Pin_NamurUp) && 
1896                     ; 142 					(lwoTimeout>0x00000000) && 
1896                     ; 143 					!displayIsKeyPressed()
1896                     ; 144 				 )
1898  021e b60f          	ld	a,_PFDR
1899  0220 a540          	bcp	a,#64
1900  0222 271d          	jreq	L3511
1902  0224 aefc          	ld	x,#_measureUpdateViscosity$L-4
1903  0226 cd0000        	call	c_lzmp
1905  0229 2716          	jreq	L3511
1907  022b cd0000        	call	_displayIsKeyPressed
1909  022e 4d            	tnz	a
1910  022f 27e6          	jreq	L7311
1911  0231 200e          	jra	L3511
1912  0233               L1511:
1913                     ; 154 				lwoTimeout--;
1915  0233 aefc          	ld	x,#_measureUpdateViscosity$L-4
1916  0235 a601          	ld	a,#1
1917  0237 cd0000        	call	c_lgsbc
1919                     ; 155 				lwoValue++;
1921  023a aef7          	ld	x,#_measureUpdateViscosity$L-9
1922  023c a601          	ld	a,#1
1923  023e cd0000        	call	c_lgadc
1925  0241               L3511:
1926                     ; 149 			while(	_btst(_Pa_NamurDown, _Pin_NamurDown) && 
1926                     ; 150 					(lwoTimeout>0x00000000) && 
1926                     ; 151 					!displayIsKeyPressed() 
1926                     ; 152 				 )
1928  0241 b60f          	ld	a,_PFDR
1929  0243 a520          	bcp	a,#32
1930  0245 270d          	jreq	L7511
1932  0247 aefc          	ld	x,#_measureUpdateViscosity$L-4
1933  0249 cd0000        	call	c_lzmp
1935  024c 2706          	jreq	L7511
1937  024e cd0000        	call	_displayIsKeyPressed
1939  0251 4d            	tnz	a
1940  0252 27df          	jreq	L1511
1941  0254               L7511:
1942                     ; 158 		measureSetValveStatus(VALVES_OPENED);
1944  0254 a60a          	ld	a,#10
1945  0256 cd0312        	call	_measureSetValveStatus
1947                     ; 160 		if((lwoTimeout==0) || displayIsKeyPressed()) 
1949  0259 aefc          	ld	x,#_measureUpdateViscosity$L-4
1950  025b cd0000        	call	c_lzmp
1952  025e 2706          	jreq	L5611
1954  0260 cd0000        	call	_displayIsKeyPressed
1956  0263 4d            	tnz	a
1957  0264 2702          	jreq	L3611
1958  0266               L5611:
1959                     ; 162 			byLoop = 0x00;
1961  0266 3ffb          	clr	_measureUpdateViscosity$L-5
1962  0268               L3611:
1963                     ; 165 		if (byLoop>0)
1965  0268 3dfb          	tnz	_measureUpdateViscosity$L-5
1966  026a 272a          	jreq	L7211
1967                     ; 167 			lwoTimeout = MEASURE_VISCOSITY_INTERNAL_LOOP_TIME;
1969  026c a600          	ld	a,#0
1970  026e b7ff          	ld	_measureUpdateViscosity$L-1,a
1971  0270 a600          	ld	a,#0
1972  0272 b7fe          	ld	_measureUpdateViscosity$L-2,a
1973  0274 a601          	ld	a,#1
1974  0276 b7fd          	ld	_measureUpdateViscosity$L-3,a
1975  0278 a600          	ld	a,#0
1976  027a b7fc          	ld	_measureUpdateViscosity$L-4,a
1978  027c 2001          	jra	L5711
1979  027e               L1711:
1980                     ; 170 				Nop();
1983  027e 9d            nop
1985  027f               L5711:
1986                     ; 168 			while((lwoTimeout-->0) && !displayIsKeyPressed())
1988  027f aefc          	ld	x,#_measureUpdateViscosity$L-4
1989  0281 cd0000        	call	c_ltor
1991  0284 aefc          	ld	x,#_measureUpdateViscosity$L-4
1992  0286 a601          	ld	a,#1
1993  0288 cd0000        	call	c_lgsbc
1995  028b cd0000        	call	c_lrzmp
1997  028e 2706          	jreq	L7211
1999  0290 cd0000        	call	_displayIsKeyPressed
2001  0293 4d            	tnz	a
2002  0294 27e8          	jreq	L1711
2003  0296               L7211:
2004                     ; 88 	while(byLoop-->0)
2006  0296 b6fb          	ld	a,_measureUpdateViscosity$L-5
2007  0298 3afb          	dec	_measureUpdateViscosity$L-5
2008  029a 4d            	tnz	a
2009  029b 2703          	jreq	L61
2010  029d cc01d2        	jp	L5211
2011  02a0               L61:
2012                     ; 177 	lwoValue /= ((MEASURE_VISCOSITY_INTERNAL_LOOP_COUNT)*2);
2014  02a0 34f7          	srl	_measureUpdateViscosity$L-9
2015  02a2 36f8          	rrc	_measureUpdateViscosity$L-8
2016  02a4 36f9          	rrc	_measureUpdateViscosity$L-7
2017  02a6 36fa          	rrc	_measureUpdateViscosity$L-6
2018                     ; 180 	byLoop = MEASURE_VISCOSITY_ARRAY_LENGTH;
2020  02a8 a620          	ld	a,#32
2021  02aa b7fb          	ld	_measureUpdateViscosity$L-5,a
2023  02ac 2018          	jra	L7021
2024  02ae               L3021:
2025                     ; 183 		m_arwoViscosityMValues[byLoop] = m_arwoViscosityMValues[byLoop-1];
2027  02ae befb          	ld	x,_measureUpdateViscosity$L-5
2028  02b0 5a            	dec	x
2029  02b1 58            	sll	x
2030  02b2 d60011        	ld	a,(_m_arwoViscosityMValues+1,x)
2031  02b5 de0010        	ld	x,(_m_arwoViscosityMValues,x)
2032  02b8 90befb        	ld	y,_measureUpdateViscosity$L-5
2033  02bb 9058          	sll	y
2034  02bd 90d70011      	ld	(_m_arwoViscosityMValues+1,y),a
2035  02c1 9f            	ld	a,x
2036  02c2 90d70010      	ld	(_m_arwoViscosityMValues,y),a
2037  02c6               L7021:
2038                     ; 181 	while(byLoop-->1)
2040  02c6 b6fb          	ld	a,_measureUpdateViscosity$L-5
2041  02c8 3afb          	dec	_measureUpdateViscosity$L-5
2042  02ca a102          	cp	a,#2
2043  02cc 24e0          	jruge	L3021
2044                     ; 187 	if (!displayIsKeyPressed())
2046  02ce cd0000        	call	_displayIsKeyPressed
2048  02d1 4d            	tnz	a
2049  02d2 2634          	jrne	L1221
2050                     ; 189 		if (lwoTimeout == 0x00000000)
2052  02d4 aefc          	ld	x,#_measureUpdateViscosity$L-4
2053  02d6 cd0000        	call	c_lzmp
2055  02d9 260d          	jrne	L5121
2056                     ; 191 			parametersSet(PARAM_ALARM,PARAM_ALARM_MEASURING_VISCOSITY);
2058  02db a601          	ld	a,#1
2059  02dd b702          	ld	_parametersSet$L+2,a
2060  02df 3f01          	clr	_parametersSet$L+1
2061  02e1 a60d          	ld	a,#13
2062  02e3 cd0000        	call	_parametersSet
2065  02e6 2016          	jra	L7121
2066  02e8               L5121:
2067                     ; 196 			parametersSet(PARAM_ALARM,PARAM_ALARM_OK);
2069  02e8 3f01          	clr	_parametersSet$L+1
2070  02ea 3f02          	clr	_parametersSet$L+2
2071  02ec a60d          	ld	a,#13
2072  02ee cd0000        	call	_parametersSet
2074                     ; 197 			parametersSet(PARAM_IN_VISCOSITY,(WORD) lwoValue );
2076  02f1 bef9          	ld	x,_measureUpdateViscosity$L-7
2077  02f3 bf01          	ld	_parametersSet$L+1,x
2078  02f5 b6fa          	ld	a,_measureUpdateViscosity$L-6
2079  02f7 b702          	ld	_parametersSet$L+2,a
2080  02f9 a606          	ld	a,#6
2081  02fb cd0000        	call	_parametersSet
2083  02fe               L7121:
2084                     ; 200 		m_arwoViscosityMValues[0] = (WORD) lwoValue;
2086  02fe bef9          	ld	x,_measureUpdateViscosity$L-7
2087  0300 cf0010        	ld	_m_arwoViscosityMValues,x
2088  0303 b6fa          	ld	a,_measureUpdateViscosity$L-6
2089  0305 c70011        	ld	_m_arwoViscosityMValues+1,a
2091  0308               L1221:
2092                     ; 207 }
2095  0308 81            	ret
2130                     ; 210 WORD measureGetHistoricalViscosityValue(BYTE byIndex)
2130                     ; 211 {
2131                     	switch	.text
2133                     	xref.b	_measureGetHistoricalViscosityValue$L
2134  0309               _measureGetHistoricalViscosityValue:
2137                     ; 212 	return m_arwoViscosityMValues[byIndex];
2139  0309 97            	ld	x,a
2140  030a 58            	sll	x
2141  030b d60011        	ld	a,(_m_arwoViscosityMValues+1,x)
2142  030e de0010        	ld	x,(_m_arwoViscosityMValues,x)
2145  0311 81            	ret
2233                     ; 216 void measureSetValveStatus(tyMeasureValveStatus a_enmMeasureValveStatus)
2233                     ; 217 {
2234                     	switch	.text
2236                     	xref.b	_measureSetValveStatus$L
2237  0312               _measureSetValveStatus:
2239  0312 b700          	ld	_measureSetValveStatus$L,a
2241                     ; 218 	if (a_enmMeasureValveStatus == parametersGetValue(PARAM_VALVES))
2243  0314 a611          	ld	a,#17
2244  0316 cd0000        	call	_parametersGetValue
2246  0319 90be00        	ld	y,_measureSetValveStatus$L
2247  031c 3f00          	clr	c_y
2248  031e b300          	cp	x,c_y
2249  0320 2605          	jrne	L42
2250  0322 90bf01        	ld	c_y+1,y
2251  0325 b101          	cp	a,c_y+1
2252  0327               L42:
2253  0327 2601          	jrne	L7031
2254                     ; 220 		return;
2257  0329 81            	ret
2258  032a               L7031:
2259                     ; 223 	parametersSet(PARAM_VALVES, a_enmMeasureValveStatus);
2261  032a b600          	ld	a,_measureSetValveStatus$L
2262  032c 5f            	clr	x
2263  032d b702          	ld	_parametersSet$L+2,a
2264  032f bf01          	ld	_parametersSet$L+1,x
2265  0331 a611          	ld	a,#17
2266  0333 cd0000        	call	_parametersSet
2268                     ; 224 	if (a_enmMeasureValveStatus ==  VALVES_MEASURING)
2270  0336 b600          	ld	a,_measureSetValveStatus$L
2271  0338 a1ff          	cp	a,#255
2272  033a 2601          	jrne	L1131
2273                     ; 227 		return;
2276  033c 81            	ret
2277  033d               L1131:
2278                     ; 230 	if((a_enmMeasureValveStatus ==  VALVES_OPENED) && 
2278                     ; 231 	   (parametersGetValue(PARAM_VALVES) == VALVES_MEASURING))
2280  033d b600          	ld	a,_measureSetValveStatus$L
2281  033f a10a          	cp	a,#10
2282  0341 260e          	jrne	L3131
2284  0343 a611          	ld	a,#17
2285  0345 cd0000        	call	_parametersGetValue
2287  0348 a1ff          	cp	a,#255
2288  034a 2602          	jrne	L62
2289  034c a300          	cp	x,#0
2290  034e               L62:
2291  034e 2601          	jrne	L3131
2292                     ; 233 	   return; //To avoid valves flikering
2295  0350 81            	ret
2296  0351               L3131:
2297                     ; 238 	_bres(_Pa_ValveInk, 	_Pin_ValveInk);
2299  0351 1103          	bres	_PBDR,#0
2300                     ; 239 	_bres(_Pa_ValveSolvent, _Pin_ValveSolvent);
2302  0353 1303          	bres	_PBDR,#1
2303                     ; 240 	_bres(_Pa_ValveExit, 	_Pin_ValveExit);
2305  0355 1503          	bres	_PBDR,#2
2306                     ; 241 	_bres(_Pa_ValvePh, 		_Pin_ValvePh);
2308  0357 1b12          	bres	_PGDR,#5
2309                     ; 246 	switch(a_enmMeasureValveStatus)
2311  0359 b600          	ld	a,_measureSetValveStatus$L
2313                     ; 275 			break;
2314  035b a003          	sub	a,#3
2315  035d 271a          	jreq	L5421
2316  035f a003          	sub	a,#3
2317  0361 2710          	jreq	L3421
2318  0363 a004          	sub	a,#4
2319  0365 2706          	jreq	L1421
2320  0367 a002          	sub	a,#2
2321  0369 2714          	jreq	L7421
2322  036b 2016          	jra	L7131
2323  036d               L1421:
2324                     ; 248 		case VALVES_OPENED:		
2324                     ; 249 			_bset(_Pa_ValveExit, 	_Pin_ValveExit);
2326  036d 1403          	bset	_PBDR,#2
2327                     ; 253 			_bset(_Pa_ValveInk, 	_Pin_ValveInk);
2329  036f 1003          	bset	_PBDR,#0
2330                     ; 254 			break;
2332  0371 2010          	jra	L7131
2333  0373               L3421:
2334                     ; 256 		case VALVES_ADDSOLVENT:
2334                     ; 257 			_bset(_Pa_ValveExit, 	_Pin_ValveExit);
2336  0373 1403          	bset	_PBDR,#2
2337                     ; 260 			_bset(_Pa_ValveSolvent, _Pin_ValveSolvent);
2339  0375 1203          	bset	_PBDR,#1
2340                     ; 261 			break;
2342  0377 200a          	jra	L7131
2343  0379               L5421:
2344                     ; 263 		case VALVES_ADDPH:
2344                     ; 264 			_bset(_Pa_ValvePh, 		_Pin_ValvePh);
2346  0379 1a12          	bset	_PGDR,#5
2347                     ; 267 			_bset(_Pa_ValveExit, 	_Pin_ValveExit);
2349  037b 1403          	bset	_PBDR,#2
2350                     ; 268 			break;
2352  037d 2004          	jra	L7131
2353  037f               L7421:
2354                     ; 270 		case VALVES_WASH:
2354                     ; 271 			_bset(_Pa_ValveSolvent, _Pin_ValveSolvent);
2356  037f 1203          	bset	_PBDR,#1
2357                     ; 274 			_bset(_Pa_ValveInk, 	_Pin_ValveInk);
2359  0381 1003          	bset	_PBDR,#0
2360                     ; 275 			break;
2362  0383               L7131:
2363                     ; 278 }
2366  0383 81            	ret
2498                     ; 284 BYTE measureCalculation(void)
2498                     ; 285 {
2499                     	switch	.text
2501                     	xref.b	_measureCalculation$L
2502  0384               _measureCalculation:
2505                     ; 302 	dblOutValue = (	(double) parametersGetValue(PARAM_IN_TEMPERATURE)* 
2505                     ; 303 					(double) parametersGetValue(PARAM_TEMP_MULT)
2505                     ; 304 				  )/10000.0 - /* Changed from + to - to allow right set-up with PR Electronics Inputs*/ 
2505                     ; 305 				  ((double) parametersGetValue(PARAM_TEMP_OFFSET));// / 10.0);
2507  0384 a628          	ld	a,#40
2508  0386 cd0000        	call	_parametersGetValue
2510  0389 cd0000        	call	c_uitof
2512  038c aed9          	ld	x,#_measureCalculation$L-39
2513  038e cd0000        	call	c_rtol
2515  0391 a627          	ld	a,#39
2516  0393 cd0000        	call	_parametersGetValue
2518  0396 cd0000        	call	c_uitof
2520  0399 aed5          	ld	x,#_measureCalculation$L-43
2521  039b cd0000        	call	c_rtol
2523  039e a605          	ld	a,#5
2524  03a0 cd0000        	call	_parametersGetValue
2526  03a3 cd0000        	call	c_uitof
2528  03a6 aed5          	ld	x,#_measureCalculation$L-43
2529  03a8 cd0000        	call	c_fmul
2531  03ab ae19          	ld	x,#high(L7141)
2532  03ad bf00          	ld	c_x,x
2533  03af ae19          	ld	x,#low(L7141)
2534  03b1 cd0000        	call	c_xfdiv
2536  03b4 aed9          	ld	x,#_measureCalculation$L-39
2537  03b6 cd0000        	call	c_fsub
2539  03b9 aefa          	ld	x,#_measureCalculation$L-6
2540  03bb cd0000        	call	c_rtol
2542                     ; 307 	parametersSet(PARAM_CALC_TEMPERATURE, (WORD) dblOutValue);
2544  03be aefa          	ld	x,#_measureCalculation$L-6
2545  03c0 cd0000        	call	c_ltor
2547  03c3 cd0000        	call	c_ftoi
2549  03c6 b702          	ld	_parametersSet$L+2,a
2550  03c8 bf01          	ld	_parametersSet$L+1,x
2551  03ca a601          	ld	a,#1
2552  03cc cd0000        	call	_parametersSet
2554                     ; 308 	parametersSet(PARAM_OUT_TEMPERATURE, (WORD) dblOutValue);
2556  03cf aefa          	ld	x,#_measureCalculation$L-6
2557  03d1 cd0000        	call	c_ltor
2559  03d4 cd0000        	call	c_ftoi
2561  03d7 b702          	ld	_parametersSet$L+2,a
2562  03d9 bf01          	ld	_parametersSet$L+1,x
2563  03db a608          	ld	a,#8
2564  03dd cd0000        	call	_parametersSet
2566                     ; 311 	if (parametersGetValue(PARAM_VISCO_OFFSET) < 32000)
2568  03e0 a626          	ld	a,#38
2569  03e2 cd0000        	call	_parametersGetValue
2571  03e5 a000          	sub	a,#0
2572  03e7 9f            	ld	a,x
2573  03e8 a27d          	sbc	a,#125
2574  03ea 240f          	jruge	L3241
2575                     ; 313 		dblOffset = (double) parametersGetValue(PARAM_VISCO_OFFSET);
2577  03ec a626          	ld	a,#38
2578  03ee cd0000        	call	_parametersGetValue
2580  03f1 cd0000        	call	c_uitof
2582  03f4 aedd          	ld	x,#_measureCalculation$L-35
2583  03f6 cd0000        	call	c_rtol
2586  03f9 2012          	jra	L5241
2587  03fb               L3241:
2588                     ; 317 		dblOffset = -(double) ~parametersGetValue(PARAM_VISCO_OFFSET);
2590  03fb a626          	ld	a,#38
2591  03fd cd0000        	call	_parametersGetValue
2593  0400 43            	cpl	a
2594  0401 53            	cpl	x
2595  0402 cd0000        	call	c_uitof
2597  0405 cd0000        	call	c_fneg
2599  0408 aedd          	ld	x,#_measureCalculation$L-35
2600  040a cd0000        	call	c_rtol
2602  040d               L5241:
2603                     ; 323 	dblOutValue = (	(double) parametersGetValue(PARAM_IN_VISCOSITY)* 
2603                     ; 324 					(double) parametersGetValue(PARAM_VISCO_MULT)
2603                     ; 325 					)/10000.0 + 
2603                     ; 326 					(dblOffset/10.0);
2605  040d aedd          	ld	x,#_measureCalculation$L-35
2606  040f cd0000        	call	c_ltor
2608  0412 ae15          	ld	x,#high(L3341)
2609  0414 bf00          	ld	c_x,x
2610  0416 ae15          	ld	x,#low(L3341)
2611  0418 cd0000        	call	c_xfdiv
2613  041b aed9          	ld	x,#_measureCalculation$L-39
2614  041d cd0000        	call	c_rtol
2616  0420 a625          	ld	a,#37
2617  0422 cd0000        	call	_parametersGetValue
2619  0425 cd0000        	call	c_uitof
2621  0428 aed5          	ld	x,#_measureCalculation$L-43
2622  042a cd0000        	call	c_rtol
2624  042d a606          	ld	a,#6
2625  042f cd0000        	call	_parametersGetValue
2627  0432 cd0000        	call	c_uitof
2629  0435 aed5          	ld	x,#_measureCalculation$L-43
2630  0437 cd0000        	call	c_fmul
2632  043a ae19          	ld	x,#high(L7141)
2633  043c bf00          	ld	c_x,x
2634  043e ae19          	ld	x,#low(L7141)
2635  0440 cd0000        	call	c_xfdiv
2637  0443 aed9          	ld	x,#_measureCalculation$L-39
2638  0445 cd0000        	call	c_fadd
2640  0448 aefa          	ld	x,#_measureCalculation$L-6
2641  044a cd0000        	call	c_rtol
2643                     ; 328 	switch(parametersGetValue(PARAM_CUP))
2645  044d a62b          	ld	a,#43
2646  044f cd0000        	call	_parametersGetValue
2648  0452 a101          	cp	a,#1
2649  0454 2602          	jrne	L23
2650  0456 a300          	cp	x,#0
2651  0458               L23:
2652  0458 261c          	jrne	L1441
2655  045a               L1231:
2656                     ; 330 		case PARAM_CUP_ZHAN_2: //Ford 4 cup to Zhan 2 cup conversion
2656                     ; 331 			dblOutValue = 1.286386676	* dblOutValue +	8.024877408;
2658  045a aefa          	ld	x,#_measureCalculation$L-6
2659  045c cd0000        	call	c_ltor
2661  045f ae11          	ld	x,#high(L7441)
2662  0461 bf00          	ld	c_x,x
2663  0463 ae11          	ld	x,#low(L7441)
2664  0465 cd0000        	call	c_xfmul
2666  0468 ae0d          	ld	x,#high(L7541)
2667  046a bf00          	ld	c_x,x
2668  046c ae0d          	ld	x,#low(L7541)
2669  046e cd0000        	call	c_xfadd
2671  0471 aefa          	ld	x,#_measureCalculation$L-6
2672  0473 cd0000        	call	c_rtol
2674                     ; 332 			break;
2676  0476               L3231:
2677                     ; 333 		default: //PARAM_CUP_FORD_4 - Ford 4
2677                     ; 334 			break;
2679  0476               L1441:
2680                     ; 338 	byCalculationIndex = MEASURE_VISCOSITY_CALC_INDEXES;
2682  0476 a602          	ld	a,#2
2683  0478 b7ff          	ld	_measureCalculation$L-1,a
2685  047a cc07f8        	jp	L7641
2686  047d               L3641:
2687                     ; 341 		if(byCalculationIndex == MEASURE_VISCOSITY_CALC_IDX_CONTROL)
2689  047d 3dff          	tnz	_measureCalculation$L-1
2690  047f 2662          	jrne	L3741
2691                     ; 343 			dblParamP	= parametersGetValue(PARAM_VISCOSITY_P)/100.0;
2693  0481 a616          	ld	a,#22
2694  0483 cd0000        	call	_parametersGetValue
2696  0486 cd0000        	call	c_uitof
2698  0489 ae09          	ld	x,#high(L1051)
2699  048b bf00          	ld	c_x,x
2700  048d ae09          	ld	x,#low(L1051)
2701  048f cd0000        	call	c_xfdiv
2703  0492 aee1          	ld	x,#_measureCalculation$L-31
2704  0494 cd0000        	call	c_rtol
2706                     ; 344 			dblParamI	= parametersGetValue(PARAM_VISCOSITY_I)/100.0;
2708  0497 a617          	ld	a,#23
2709  0499 cd0000        	call	_parametersGetValue
2711  049c cd0000        	call	c_uitof
2713  049f ae09          	ld	x,#high(L1051)
2714  04a1 bf00          	ld	c_x,x
2715  04a3 ae09          	ld	x,#low(L1051)
2716  04a5 cd0000        	call	c_xfdiv
2718  04a8 aee5          	ld	x,#_measureCalculation$L-27
2719  04aa cd0000        	call	c_rtol
2721                     ; 345 			dblParamD	= parametersGetValue(PARAM_VISCOSITY_D)/100.0;
2723  04ad a618          	ld	a,#24
2724  04af cd0000        	call	_parametersGetValue
2726  04b2 cd0000        	call	c_uitof
2728  04b5 ae09          	ld	x,#high(L1051)
2729  04b7 bf00          	ld	c_x,x
2730  04b9 ae09          	ld	x,#low(L1051)
2731  04bb cd0000        	call	c_xfdiv
2733  04be aee9          	ld	x,#_measureCalculation$L-23
2734  04c0 cd0000        	call	c_rtol
2736                     ; 346 			dblParamAVG	= parametersGetValue(PARAM_VISCOSITY_AVG);
2738  04c3 a619          	ld	a,#25
2739  04c5 cd0000        	call	_parametersGetValue
2741  04c8 cd0000        	call	c_uitof
2743  04cb aef6          	ld	x,#_measureCalculation$L-10
2744  04cd cd0000        	call	c_rtol
2746                     ; 347 			byResultParameterIndex = PARAM_CALC_VISCOSITY;
2748  04d0 a602          	ld	a,#2
2749  04d2 b7ed          	ld	_measureCalculation$L-19,a
2750                     ; 348 			dblParamARMA = parametersGetValue(PARAM_ARMA);
2752  04d4 a62a          	ld	a,#42
2753  04d6 cd0000        	call	_parametersGetValue
2755  04d9 cd0000        	call	c_uitof
2757  04dc aeee          	ld	x,#_measureCalculation$L-18
2758  04de cd0000        	call	c_rtol
2761  04e1 2069          	jra	L5051
2762  04e3               L3741:
2763                     ; 352 			dblParamP	= parametersGetValue(PARAM_VISCOSITY_P_VISUAL)/100.0;
2765  04e3 a61a          	ld	a,#26
2766  04e5 cd0000        	call	_parametersGetValue
2768  04e8 cd0000        	call	c_uitof
2770  04eb ae09          	ld	x,#high(L1051)
2771  04ed bf00          	ld	c_x,x
2772  04ef ae09          	ld	x,#low(L1051)
2773  04f1 cd0000        	call	c_xfdiv
2775  04f4 aee1          	ld	x,#_measureCalculation$L-31
2776  04f6 cd0000        	call	c_rtol
2778                     ; 353 			dblParamI	= parametersGetValue(PARAM_VISCOSITY_I_VISUAL)/100.0;
2780  04f9 a61b          	ld	a,#27
2781  04fb cd0000        	call	_parametersGetValue
2783  04fe cd0000        	call	c_uitof
2785  0501 ae09          	ld	x,#high(L1051)
2786  0503 bf00          	ld	c_x,x
2787  0505 ae09          	ld	x,#low(L1051)
2788  0507 cd0000        	call	c_xfdiv
2790  050a aee5          	ld	x,#_measureCalculation$L-27
2791  050c cd0000        	call	c_rtol
2793                     ; 354 			dblParamD	= parametersGetValue(PARAM_VISCOSITY_D_VISUAL)/100.0;
2795  050f a61c          	ld	a,#28
2796  0511 cd0000        	call	_parametersGetValue
2798  0514 cd0000        	call	c_uitof
2800  0517 ae09          	ld	x,#high(L1051)
2801  0519 bf00          	ld	c_x,x
2802  051b ae09          	ld	x,#low(L1051)
2803  051d cd0000        	call	c_xfdiv
2805  0520 aee9          	ld	x,#_measureCalculation$L-23
2806  0522 cd0000        	call	c_rtol
2808                     ; 355 			dblParamAVG	= parametersGetValue(PARAM_VISCOSITY_AVG_VISUAL);
2810  0525 a61d          	ld	a,#29
2811  0527 cd0000        	call	_parametersGetValue
2813  052a cd0000        	call	c_uitof
2815  052d aef6          	ld	x,#_measureCalculation$L-10
2816  052f cd0000        	call	c_rtol
2818                     ; 356 			byResultParameterIndex = PARAM_OUT_VISCOSITY;
2820  0532 a609          	ld	a,#9
2821  0534 b7ed          	ld	_measureCalculation$L-19,a
2822                     ; 357 			dblParamARMA = parametersGetValue(PARAM_ARMA)/100.0;
2824  0536 a62a          	ld	a,#42
2825  0538 cd0000        	call	_parametersGetValue
2827  053b cd0000        	call	c_uitof
2829  053e ae09          	ld	x,#high(L1051)
2830  0540 bf00          	ld	c_x,x
2831  0542 ae09          	ld	x,#low(L1051)
2832  0544 cd0000        	call	c_xfdiv
2834  0547 aeee          	ld	x,#_measureCalculation$L-18
2835  0549 cd0000        	call	c_rtol
2837  054c               L5051:
2838                     ; 361 		if (m_ardblViscosityPreviousPValue[byCalculationIndex] == 0)
2840  054c beff          	ld	x,_measureCalculation$L-1
2841  054e 58            	sll	x
2842  054f 58            	sll	x
2843  0550 d601e8        	ld	a,(_m_ardblViscosityPreviousPValue,x)
2844  0553 2702          	jreq	L67
2845  0555 206a          	jp	L7051
2846  0557               L67:
2847                     ; 363 			m_ardblViscosityPreviousPValue[byCalculationIndex] 	= dblOutValue;
2849  0557 beff          	ld	x,_measureCalculation$L-1
2850  0559 58            	sll	x
2851  055a 58            	sll	x
2852  055b b6fd          	ld	a,_measureCalculation$L-3
2853  055d d701eb        	ld	(_m_ardblViscosityPreviousPValue+3,x),a
2854  0560 b6fc          	ld	a,_measureCalculation$L-4
2855  0562 d701ea        	ld	(_m_ardblViscosityPreviousPValue+2,x),a
2856  0565 b6fb          	ld	a,_measureCalculation$L-5
2857  0567 d701e9        	ld	(_m_ardblViscosityPreviousPValue+1,x),a
2858  056a b6fa          	ld	a,_measureCalculation$L-6
2859  056c d701e8        	ld	(_m_ardblViscosityPreviousPValue,x),a
2860                     ; 364 			m_ardblViscosityVValues[byCalculationIndex][0] 		= dblOutValue;
2862  056f b6ff          	ld	a,_measureCalculation$L-1
2863  0571 ae80          	ld	x,#128
2864  0573 42            	mul	x,a
2865  0574 abd0          	add	a,#low(_m_ardblViscosityVValues)
2866  0576 88            	push	a
2867  0577 9f            	ld	a,x
2868  0578 a9d0          	adc	a,#high(_m_ardblViscosityVValues)
2869  057a 97            	ld	x,a
2870  057b 84            	pop	a
2871  057c bf00          	ld	c_x,x
2872  057e 97            	ld	x,a
2873  057f b6fd          	ld	a,_measureCalculation$L-3
2874  0581 b703          	ld	c_lreg+3,a
2875  0583 b6fc          	ld	a,_measureCalculation$L-4
2876  0585 b702          	ld	c_lreg+2,a
2877  0587 b6fb          	ld	a,_measureCalculation$L-5
2878  0589 b701          	ld	c_lreg+1,a
2879  058b b6fa          	ld	a,_measureCalculation$L-6
2880  058d b700          	ld	c_lreg,a
2881  058f cd0000        	call	c_putlx
2883                     ; 365 			i = (BYTE) dblParamAVG;
2885  0592 aef6          	ld	x,#_measureCalculation$L-10
2886  0594 cd0000        	call	c_ltor
2888  0597 cd0000        	call	c_ftoi
2890  059a b7fe          	ld	_measureCalculation$L-2,a
2892  059c 2018          	jra	L5151
2893  059e               L1151:
2894                     ; 368 				m_ardblViscosityRValues[i] = dblOutValue;
2896  059e befe          	ld	x,_measureCalculation$L-2
2897  05a0 58            	sll	x
2898  05a1 58            	sll	x
2899  05a2 b6fd          	ld	a,_measureCalculation$L-3
2900  05a4 d70053        	ld	(_m_ardblViscosityRValues+3,x),a
2901  05a7 b6fc          	ld	a,_measureCalculation$L-4
2902  05a9 d70052        	ld	(_m_ardblViscosityRValues+2,x),a
2903  05ac b6fb          	ld	a,_measureCalculation$L-5
2904  05ae d70051        	ld	(_m_ardblViscosityRValues+1,x),a
2905  05b1 b6fa          	ld	a,_measureCalculation$L-6
2906  05b3 d70050        	ld	(_m_ardblViscosityRValues,x),a
2907  05b6               L5151:
2908                     ; 366 			while((i-->0) && (byCalculationIndex == MEASURE_VISCOSITY_CALC_IDX_CONTROL))
2910  05b6 b6fe          	ld	a,_measureCalculation$L-2
2911  05b8 3afe          	dec	_measureCalculation$L-2
2912  05ba 4d            	tnz	a
2913  05bb 2704          	jreq	L7051
2915  05bd 3dff          	tnz	_measureCalculation$L-1
2916  05bf 27dd          	jreq	L1151
2917  05c1               L7051:
2918                     ; 373 		m_ardblViscosityPValue[byCalculationIndex] = (dblOutValue+
2918                     ; 374 														(
2918                     ; 375 															m_ardblViscosityPreviousPValue[byCalculationIndex]*dblParamARMA+
2918                     ; 376 															m_ardblViscosityRValues[0]*(1.0-dblParamARMA)
2918                     ; 377 														)
2918                     ; 378 													 )/2;
2920  05c1 ae05          	ld	x,#high(L7251)
2921  05c3 bf00          	ld	c_x,x
2922  05c5 ae05          	ld	x,#low(L7251)
2923  05c7 cd0000        	call	c_xltor
2925  05ca aeee          	ld	x,#_measureCalculation$L-18
2926  05cc cd0000        	call	c_fsub
2928  05cf ae50          	ld	x,#high(_m_ardblViscosityRValues)
2929  05d1 bf00          	ld	c_x,x
2930  05d3 ae50          	ld	x,#low(_m_ardblViscosityRValues)
2931  05d5 cd0000        	call	c_xfmul
2933  05d8 aed9          	ld	x,#_measureCalculation$L-39
2934  05da cd0000        	call	c_rtol
2936  05dd beff          	ld	x,_measureCalculation$L-1
2937  05df 58            	sll	x
2938  05e0 58            	sll	x
2939  05e1 9f            	ld	a,x
2940  05e2 aee8          	ld	x,#high(_m_ardblViscosityPreviousPValue)
2941  05e4 abe8          	add	a,#low(_m_ardblViscosityPreviousPValue)
2942  05e6 2401          	jrnc	L43
2943  05e8 5c            	inc	x
2944  05e9               L43:
2945  05e9 bf00          	ld	c_x,x
2946  05eb 97            	ld	x,a
2947  05ec cd0000        	call	c_xltor
2949  05ef aeee          	ld	x,#_measureCalculation$L-18
2950  05f1 cd0000        	call	c_fmul
2952  05f4 aed9          	ld	x,#_measureCalculation$L-39
2953  05f6 cd0000        	call	c_fadd
2955  05f9 aefa          	ld	x,#_measureCalculation$L-6
2956  05fb cd0000        	call	c_fadd
2958  05fe ae01          	ld	x,#high(L7351)
2959  0600 bf00          	ld	c_x,x
2960  0602 ae01          	ld	x,#low(L7351)
2961  0604 cd0000        	call	c_xfdiv
2963  0607 beff          	ld	x,_measureCalculation$L-1
2964  0609 58            	sll	x
2965  060a 58            	sll	x
2966  060b 9f            	ld	a,x
2967  060c aee0          	ld	x,#high(_m_ardblViscosityPValue)
2968  060e abe0          	add	a,#low(_m_ardblViscosityPValue)
2969  0610 2401          	jrnc	L63
2970  0612 5c            	inc	x
2971  0613               L63:
2972  0613 bf00          	ld	c_x,x
2973  0615 97            	ld	x,a
2974  0616 cd0000        	call	c_rtoxl
2976                     ; 381 		m_ardblViscosityIValue[byCalculationIndex] = 0.0;
2978  0619 beff          	ld	x,_measureCalculation$L-1
2979  061b 58            	sll	x
2980  061c 58            	sll	x
2981  061d c60020        	ld	a,L3001+3
2982  0620 d701db        	ld	(_m_ardblViscosityIValue+3,x),a
2983  0623 c6001f        	ld	a,L3001+2
2984  0626 d701da        	ld	(_m_ardblViscosityIValue+2,x),a
2985  0629 c6001e        	ld	a,L3001+1
2986  062c d701d9        	ld	(_m_ardblViscosityIValue+1,x),a
2987  062f c6001d        	ld	a,L3001
2988  0632 d701d8        	ld	(_m_ardblViscosityIValue,x),a
2989                     ; 382 		i = (BYTE) dblParamAVG;
2991  0635 aef6          	ld	x,#_measureCalculation$L-10
2992  0637 cd0000        	call	c_ltor
2994  063a cd0000        	call	c_ftoi
2996  063d b7fe          	ld	_measureCalculation$L-2,a
2998  063f 2031          	jra	L7451
2999  0641               L3451:
3000                     ; 385 			m_ardblViscosityIValue[byCalculationIndex] += m_ardblViscosityRValues[i];
3002  0641 beff          	ld	x,_measureCalculation$L-1
3003  0643 58            	sll	x
3004  0644 58            	sll	x
3005  0645 90befe        	ld	y,_measureCalculation$L-2
3006  0648 9058          	sll	y
3007  064a 9058          	sll	y
3008  064c 90d60053      	ld	a,(_m_ardblViscosityRValues+3,y)
3009  0650 b703          	ld	c_lreg+3,a
3010  0652 90d60052      	ld	a,(_m_ardblViscosityRValues+2,y)
3011  0656 b702          	ld	c_lreg+2,a
3012  0658 90d60051      	ld	a,(_m_ardblViscosityRValues+1,y)
3013  065c b701          	ld	c_lreg+1,a
3014  065e 90d60050      	ld	a,(_m_ardblViscosityRValues,y)
3015  0662 b700          	ld	c_lreg,a
3016  0664 9f            	ld	a,x
3017  0665 aed8          	ld	x,#high(_m_ardblViscosityIValue)
3018  0667 abd8          	add	a,#low(_m_ardblViscosityIValue)
3019  0669 2401          	jrnc	L04
3020  066b 5c            	inc	x
3021  066c               L04:
3022  066c bf00          	ld	c_x,x
3023  066e 97            	ld	x,a
3024  066f cd0000        	call	c_xfgadd
3026  0672               L7451:
3027                     ; 383 		while(i-->0)
3029  0672 b6fe          	ld	a,_measureCalculation$L-2
3030  0674 3afe          	dec	_measureCalculation$L-2
3031  0676 4d            	tnz	a
3032  0677 26c8          	jrne	L3451
3033                     ; 387 		m_ardblViscosityIValue[byCalculationIndex] /= dblParamAVG;
3035  0679 beff          	ld	x,_measureCalculation$L-1
3036  067b 58            	sll	x
3037  067c 58            	sll	x
3038  067d 89            	push	x
3039  067e 85            	pop	x
3040  067f 89            	push	x
3041  0680 9f            	ld	a,x
3042  0681 aed8          	ld	x,#high(_m_ardblViscosityIValue)
3043  0683 abd8          	add	a,#low(_m_ardblViscosityIValue)
3044  0685 2401          	jrnc	L24
3045  0687 5c            	inc	x
3046  0688               L24:
3047  0688 bf00          	ld	c_x,x
3048  068a 97            	ld	x,a
3049  068b cd0000        	call	c_xltor
3051  068e aef6          	ld	x,#_measureCalculation$L-10
3052  0690 cd0000        	call	c_fdiv
3054  0693 85            	pop	x
3055  0694 9f            	ld	a,x
3056  0695 aed8          	ld	x,#high(_m_ardblViscosityIValue)
3057  0697 abd8          	add	a,#low(_m_ardblViscosityIValue)
3058  0699 2401          	jrnc	L44
3059  069b 5c            	inc	x
3060  069c               L44:
3061  069c bf00          	ld	c_x,x
3062  069e 97            	ld	x,a
3063  069f cd0000        	call	c_rtoxl
3065                     ; 390 		m_ardblViscosityDValue[byCalculationIndex] = m_ardblViscosityVValues[byCalculationIndex][0] - dblOutValue;
3067  06a2 b6ff          	ld	a,_measureCalculation$L-1
3068  06a4 ae80          	ld	x,#128
3069  06a6 42            	mul	x,a
3070  06a7 abd0          	add	a,#low(_m_ardblViscosityVValues)
3071  06a9 88            	push	a
3072  06aa 9f            	ld	a,x
3073  06ab a9d0          	adc	a,#high(_m_ardblViscosityVValues)
3074  06ad 97            	ld	x,a
3075  06ae 84            	pop	a
3076  06af bf00          	ld	c_x,x
3077  06b1 97            	ld	x,a
3078  06b2 cd0000        	call	c_getlx
3080  06b5 aefa          	ld	x,#_measureCalculation$L-6
3081  06b7 cd0000        	call	c_fsub
3083  06ba beff          	ld	x,_measureCalculation$L-1
3084  06bc 58            	sll	x
3085  06bd 58            	sll	x
3086  06be 9f            	ld	a,x
3087  06bf aed0          	ld	x,#high(_m_ardblViscosityDValue)
3088  06c1 abd0          	add	a,#low(_m_ardblViscosityDValue)
3089  06c3 2401          	jrnc	L64
3090  06c5 5c            	inc	x
3091  06c6               L64:
3092  06c6 bf00          	ld	c_x,x
3093  06c8 97            	ld	x,a
3094  06c9 cd0000        	call	c_rtoxl
3096                     ; 394 		i=(BYTE) dblParamAVG;
3098  06cc aef6          	ld	x,#_measureCalculation$L-10
3099  06ce cd0000        	call	c_ltor
3101  06d1 cd0000        	call	c_ftoi
3103  06d4 b7fe          	ld	_measureCalculation$L-2,a
3105  06d6 203c          	jra	L7551
3106  06d8               L3551:
3107                     ; 397 			m_ardblViscosityVValues[byCalculationIndex][i] = m_ardblViscosityVValues[byCalculationIndex][i-1];
3109  06d8 b6fe          	ld	a,_measureCalculation$L-2
3110  06da 48            	sll	a
3111  06db 48            	sll	a
3112  06dc b7dc          	ld	_measureCalculation$L-36,a
3113  06de b6ff          	ld	a,_measureCalculation$L-1
3114  06e0 ae80          	ld	x,#128
3115  06e2 42            	mul	x,a
3116  06e3 bbdc          	add	a,_measureCalculation$L-36
3117  06e5 2401          	jrnc	L05
3118  06e7 5c            	inc	x
3119  06e8               L05:
3120  06e8 abcc          	add	a,#low(_m_ardblViscosityVValues-4)
3121  06ea 88            	push	a
3122  06eb 9f            	ld	a,x
3123  06ec a9cc          	adc	a,#high(_m_ardblViscosityVValues-4)
3124  06ee 97            	ld	x,a
3125  06ef 84            	pop	a
3126  06f0 bf00          	ld	c_x,x
3127  06f2 97            	ld	x,a
3128  06f3 cd0000        	call	c_getlx
3130  06f6 b6fe          	ld	a,_measureCalculation$L-2
3131  06f8 48            	sll	a
3132  06f9 48            	sll	a
3133  06fa b7db          	ld	_measureCalculation$L-37,a
3134  06fc b6ff          	ld	a,_measureCalculation$L-1
3135  06fe ae80          	ld	x,#128
3136  0700 42            	mul	x,a
3137  0701 bbdb          	add	a,_measureCalculation$L-37
3138  0703 2401          	jrnc	L25
3139  0705 5c            	inc	x
3140  0706               L25:
3141  0706 abd0          	add	a,#low(_m_ardblViscosityVValues)
3142  0708 88            	push	a
3143  0709 9f            	ld	a,x
3144  070a a9d0          	adc	a,#high(_m_ardblViscosityVValues)
3145  070c 97            	ld	x,a
3146  070d 84            	pop	a
3147  070e bf00          	ld	c_x,x
3148  0710 97            	ld	x,a
3149  0711 cd0000        	call	c_putlx
3151  0714               L7551:
3152                     ; 395 		while(i-->1)
3154  0714 b6fe          	ld	a,_measureCalculation$L-2
3155  0716 3afe          	dec	_measureCalculation$L-2
3156  0718 a102          	cp	a,#2
3157  071a 24bc          	jruge	L3551
3158                     ; 400 		if(byCalculationIndex == MEASURE_VISCOSITY_CALC_IDX_CONTROL)
3160  071c 3dff          	tnz	_measureCalculation$L-1
3161  071e 2650          	jrne	L3651
3162                     ; 402 			i=(BYTE) dblParamAVG;
3164  0720 aef6          	ld	x,#_measureCalculation$L-10
3165  0722 cd0000        	call	c_ltor
3167  0725 cd0000        	call	c_ftoi
3169  0728 b7fe          	ld	_measureCalculation$L-2,a
3171  072a 2028          	jra	L1751
3172  072c               L5651:
3173                     ; 405 				m_ardblViscosityRValues[i] = m_ardblViscosityRValues[i-1];
3175  072c befe          	ld	x,_measureCalculation$L-2
3176  072e 5a            	dec	x
3177  072f 58            	sll	x
3178  0730 58            	sll	x
3179  0731 90befe        	ld	y,_measureCalculation$L-2
3180  0734 9058          	sll	y
3181  0736 9058          	sll	y
3182  0738 d60053        	ld	a,(_m_ardblViscosityRValues+3,x)
3183  073b 90d70053      	ld	(_m_ardblViscosityRValues+3,y),a
3184  073f d60052        	ld	a,(_m_ardblViscosityRValues+2,x)
3185  0742 90d70052      	ld	(_m_ardblViscosityRValues+2,y),a
3186  0746 d60051        	ld	a,(_m_ardblViscosityRValues+1,x)
3187  0749 90d70051      	ld	(_m_ardblViscosityRValues+1,y),a
3188  074d d60050        	ld	a,(_m_ardblViscosityRValues,x)
3189  0750 90d70050      	ld	(_m_ardblViscosityRValues,y),a
3190  0754               L1751:
3191                     ; 403 			while(i-->1)
3193  0754 b6fe          	ld	a,_measureCalculation$L-2
3194  0756 3afe          	dec	_measureCalculation$L-2
3195  0758 a102          	cp	a,#2
3196  075a 24d0          	jruge	L5651
3197                     ; 408 			m_ardblViscosityRValues[0] = dblOutValue; 
3199  075c b6fd          	ld	a,_measureCalculation$L-3
3200  075e c70053        	ld	_m_ardblViscosityRValues+3,a
3201  0761 b6fc          	ld	a,_measureCalculation$L-4
3202  0763 c70052        	ld	_m_ardblViscosityRValues+2,a
3203  0766 b6fb          	ld	a,_measureCalculation$L-5
3204  0768 c70051        	ld	_m_ardblViscosityRValues+1,a
3205  076b b6fa          	ld	a,_measureCalculation$L-6
3206  076d c70050        	ld	_m_ardblViscosityRValues,a
3207  0770               L3651:
3208                     ; 412 		dblTempValue  = m_ardblViscosityPValue[byCalculationIndex] * dblParamP;
3210  0770 beff          	ld	x,_measureCalculation$L-1
3211  0772 58            	sll	x
3212  0773 58            	sll	x
3213  0774 9f            	ld	a,x
3214  0775 aee0          	ld	x,#high(_m_ardblViscosityPValue)
3215  0777 abe0          	add	a,#low(_m_ardblViscosityPValue)
3216  0779 2401          	jrnc	L45
3217  077b 5c            	inc	x
3218  077c               L45:
3219  077c bf00          	ld	c_x,x
3220  077e 97            	ld	x,a
3221  077f cd0000        	call	c_xltor
3223  0782 aee1          	ld	x,#_measureCalculation$L-31
3224  0784 cd0000        	call	c_fmul
3226  0787 aef2          	ld	x,#_measureCalculation$L-14
3227  0789 cd0000        	call	c_rtol
3229                     ; 413 		dblTempValue += m_ardblViscosityIValue[byCalculationIndex] * dblParamI;
3231  078c beff          	ld	x,_measureCalculation$L-1
3232  078e 58            	sll	x
3233  078f 58            	sll	x
3234  0790 9f            	ld	a,x
3235  0791 aed8          	ld	x,#high(_m_ardblViscosityIValue)
3236  0793 abd8          	add	a,#low(_m_ardblViscosityIValue)
3237  0795 2401          	jrnc	L65
3238  0797 5c            	inc	x
3239  0798               L65:
3240  0798 bf00          	ld	c_x,x
3241  079a 97            	ld	x,a
3242  079b cd0000        	call	c_xltor
3244  079e aee5          	ld	x,#_measureCalculation$L-27
3245  07a0 cd0000        	call	c_fmul
3247  07a3 aef2          	ld	x,#_measureCalculation$L-14
3248  07a5 cd0000        	call	c_fgadd
3250                     ; 414 		dblTempValue += m_ardblViscosityDValue[byCalculationIndex] * dblParamD;
3252  07a8 beff          	ld	x,_measureCalculation$L-1
3253  07aa 58            	sll	x
3254  07ab 58            	sll	x
3255  07ac 9f            	ld	a,x
3256  07ad aed0          	ld	x,#high(_m_ardblViscosityDValue)
3257  07af abd0          	add	a,#low(_m_ardblViscosityDValue)
3258  07b1 2401          	jrnc	L06
3259  07b3 5c            	inc	x
3260  07b4               L06:
3261  07b4 bf00          	ld	c_x,x
3262  07b6 97            	ld	x,a
3263  07b7 cd0000        	call	c_xltor
3265  07ba aee9          	ld	x,#_measureCalculation$L-23
3266  07bc cd0000        	call	c_fmul
3268  07bf aef2          	ld	x,#_measureCalculation$L-14
3269  07c1 cd0000        	call	c_fgadd
3271                     ; 415 		m_ardblViscosityVValues[byCalculationIndex][0] = dblTempValue;
3273  07c4 b6ff          	ld	a,_measureCalculation$L-1
3274  07c6 ae80          	ld	x,#128
3275  07c8 42            	mul	x,a
3276  07c9 abd0          	add	a,#low(_m_ardblViscosityVValues)
3277  07cb 88            	push	a
3278  07cc 9f            	ld	a,x
3279  07cd a9d0          	adc	a,#high(_m_ardblViscosityVValues)
3280  07cf 97            	ld	x,a
3281  07d0 84            	pop	a
3282  07d1 bf00          	ld	c_x,x
3283  07d3 97            	ld	x,a
3284  07d4 b6f5          	ld	a,_measureCalculation$L-11
3285  07d6 b703          	ld	c_lreg+3,a
3286  07d8 b6f4          	ld	a,_measureCalculation$L-12
3287  07da b702          	ld	c_lreg+2,a
3288  07dc b6f3          	ld	a,_measureCalculation$L-13
3289  07de b701          	ld	c_lreg+1,a
3290  07e0 b6f2          	ld	a,_measureCalculation$L-14
3291  07e2 b700          	ld	c_lreg,a
3292  07e4 cd0000        	call	c_putlx
3294                     ; 417 		parametersSet(byResultParameterIndex, (WORD) dblTempValue);
3296  07e7 aef2          	ld	x,#_measureCalculation$L-14
3297  07e9 cd0000        	call	c_ltor
3299  07ec cd0000        	call	c_ftoi
3301  07ef b702          	ld	_parametersSet$L+2,a
3302  07f1 bf01          	ld	_parametersSet$L+1,x
3303  07f3 b6ed          	ld	a,_measureCalculation$L-19
3304  07f5 cd0000        	call	_parametersSet
3306  07f8               L7641:
3307                     ; 339 	while(byCalculationIndex-->0)
3309  07f8 b6ff          	ld	a,_measureCalculation$L-1
3310  07fa 3aff          	dec	_measureCalculation$L-1
3311  07fc 4d            	tnz	a
3312  07fd 2703          	jreq	L001
3313  07ff cc047d        	jp	L3641
3314  0802               L001:
3315                     ; 421 	return (BYTE) MAX(1.0, 
3315                     ; 422 						ABS(
3315                     ; 423 								(	m_ardblViscosityVValues[MEASURE_VISCOSITY_CALC_IDX_CONTROL][1] - 
3315                     ; 424 									m_ardblViscosityVValues[MEASURE_VISCOSITY_CALC_IDX_CONTROL][0]
3315                     ; 425 								) /10.0
3315                     ; 426 						)
3315                     ; 427 					   );
3317  0802 aed4          	ld	x,#high(_m_ardblViscosityVValues+4)
3318  0804 bf00          	ld	c_x,x
3319  0806 aed4          	ld	x,#low(_m_ardblViscosityVValues+4)
3320  0808 cd0000        	call	c_xltor
3322  080b aed0          	ld	x,#high(_m_ardblViscosityVValues)
3323  080d bf00          	ld	c_x,x
3324  080f aed0          	ld	x,#low(_m_ardblViscosityVValues)
3325  0811 cd0000        	call	c_xfsub
3327  0814 ae15          	ld	x,#high(L3341)
3328  0816 bf00          	ld	c_x,x
3329  0818 ae15          	ld	x,#low(L3341)
3330  081a cd0000        	call	c_xfdiv
3332  081d 3d00          	tnz	c_lreg
3333                     	jrle	L46
3334  0823 aed4          	ld	x,#high(_m_ardblViscosityVValues+4)
3335  0825 bf00          	ld	c_x,x
3336  0827 aed4          	ld	x,#low(_m_ardblViscosityVValues+4)
3337  0829 cd0000        	call	c_xltor
3339  082c aed0          	ld	x,#high(_m_ardblViscosityVValues)
3340  082e bf00          	ld	c_x,x
3341  0830 aed0          	ld	x,#low(_m_ardblViscosityVValues)
3342  0832 cd0000        	call	c_xfsub
3344  0835 ae15          	ld	x,#high(L3341)
3345  0837 bf00          	ld	c_x,x
3346  0839 ae15          	ld	x,#low(L3341)
3347  083b cd0000        	call	c_xfdiv
3349  083e 201b          	jra	L66
3350  0840               L46:
3351  0840 aed0          	ld	x,#high(_m_ardblViscosityVValues)
3352  0842 bf00          	ld	c_x,x
3353  0844 aed0          	ld	x,#low(_m_ardblViscosityVValues)
3354  0846 cd0000        	call	c_xltor
3356  0849 aed4          	ld	x,#high(_m_ardblViscosityVValues+4)
3357  084b bf00          	ld	c_x,x
3358  084d aed4          	ld	x,#low(_m_ardblViscosityVValues+4)
3359  084f cd0000        	call	c_xfsub
3361  0852 ae15          	ld	x,#high(L3341)
3362  0854 bf00          	ld	c_x,x
3363  0856 ae15          	ld	x,#low(L3341)
3364  0858 cd0000        	call	c_xfdiv
3366  085b               L66:
3367  085b ae05          	ld	x,#high(L7251)
3368  085d bf00          	ld	c_x,x
3369  085f ae05          	ld	x,#low(L7251)
3370  0861 cd0000        	call	c_xfcmp
3372  0864 2a0b          	jrpl	L26
3373  0866 ae05          	ld	x,#high(L7251)
3374  0868 bf00          	ld	c_x,x
3375  086a ae05          	ld	x,#low(L7251)
3376  086c cd0000        	call	c_xltor
3378  086f 2059          	jra	L07
3379  0871               L26:
3380  0871 aed4          	ld	x,#high(_m_ardblViscosityVValues+4)
3381  0873 bf00          	ld	c_x,x
3382  0875 aed4          	ld	x,#low(_m_ardblViscosityVValues+4)
3383  0877 cd0000        	call	c_xltor
3385  087a aed0          	ld	x,#high(_m_ardblViscosityVValues)
3386  087c bf00          	ld	c_x,x
3387  087e aed0          	ld	x,#low(_m_ardblViscosityVValues)
3388  0880 cd0000        	call	c_xfsub
3390  0883 ae15          	ld	x,#high(L3341)
3391  0885 bf00          	ld	c_x,x
3392  0887 ae15          	ld	x,#low(L3341)
3393  0889 cd0000        	call	c_xfdiv
3395  088c 3d00          	tnz	c_lreg
3396                     	jrle	L27
3397  0892 aed4          	ld	x,#high(_m_ardblViscosityVValues+4)
3398  0894 bf00          	ld	c_x,x
3399  0896 aed4          	ld	x,#low(_m_ardblViscosityVValues+4)
3400  0898 cd0000        	call	c_xltor
3402  089b aed0          	ld	x,#high(_m_ardblViscosityVValues)
3403  089d bf00          	ld	c_x,x
3404  089f aed0          	ld	x,#low(_m_ardblViscosityVValues)
3405  08a1 cd0000        	call	c_xfsub
3407  08a4 ae15          	ld	x,#high(L3341)
3408  08a6 bf00          	ld	c_x,x
3409  08a8 ae15          	ld	x,#low(L3341)
3410  08aa cd0000        	call	c_xfdiv
3412  08ad 201b          	jra	L47
3413  08af               L27:
3414  08af aed0          	ld	x,#high(_m_ardblViscosityVValues)
3415  08b1 bf00          	ld	c_x,x
3416  08b3 aed0          	ld	x,#low(_m_ardblViscosityVValues)
3417  08b5 cd0000        	call	c_xltor
3419  08b8 aed4          	ld	x,#high(_m_ardblViscosityVValues+4)
3420  08ba bf00          	ld	c_x,x
3421  08bc aed4          	ld	x,#low(_m_ardblViscosityVValues+4)
3422  08be cd0000        	call	c_xfsub
3424  08c1 ae15          	ld	x,#high(L3341)
3425  08c3 bf00          	ld	c_x,x
3426  08c5 ae15          	ld	x,#low(L3341)
3427  08c7 cd0000        	call	c_xfdiv
3429  08ca               L47:
3430  08ca               L07:
3431  08ca cd0000        	call	c_ftoi
3435  08cd 81            	ret
3483                     ; 435 void measureViscosityCalibration(void)
3483                     ; 436 {
3484                     	switch	.text
3486                     	xref.b	_measureViscosityCalibration$L
3487  08ce               _measureViscosityCalibration:
3490                     ; 444 	m_ardblViscosityCalibratedValues[1] = m_ardblViscosityCalibratedValues[0];
3492  08ce c60003        	ld	a,_m_ardblViscosityCalibratedValues+3
3493  08d1 c70007        	ld	_m_ardblViscosityCalibratedValues+7,a
3494  08d4 c60002        	ld	a,_m_ardblViscosityCalibratedValues+2
3495  08d7 c70006        	ld	_m_ardblViscosityCalibratedValues+6,a
3496  08da c60001        	ld	a,_m_ardblViscosityCalibratedValues+1
3497  08dd c70005        	ld	_m_ardblViscosityCalibratedValues+5,a
3498  08e0 c60000        	ld	a,_m_ardblViscosityCalibratedValues
3499  08e3 c70004        	ld	_m_ardblViscosityCalibratedValues+4,a
3500                     ; 445 	m_ardblViscosityMeasured[1] = m_ardblViscosityMeasured[0];
3502  08e6 c6000b        	ld	a,_m_ardblViscosityMeasured+3
3503  08e9 c7000f        	ld	_m_ardblViscosityMeasured+7,a
3504  08ec c6000a        	ld	a,_m_ardblViscosityMeasured+2
3505  08ef c7000e        	ld	_m_ardblViscosityMeasured+6,a
3506  08f2 c60009        	ld	a,_m_ardblViscosityMeasured+1
3507  08f5 c7000d        	ld	_m_ardblViscosityMeasured+5,a
3508  08f8 c60008        	ld	a,_m_ardblViscosityMeasured
3509  08fb c7000c        	ld	_m_ardblViscosityMeasured+4,a
3510                     ; 446 	m_ardblViscosityCalibratedValues[0] = (double) parametersGetValue(PARAM_CALIBRATION_VALUE);
3512  08fe a604          	ld	a,#4
3513  0900 cd0000        	call	_parametersGetValue
3515  0903 cd0000        	call	c_uitof
3517  0906 ae00          	ld	x,#high(_m_ardblViscosityCalibratedValues)
3518  0908 bf00          	ld	c_x,x
3519  090a ae00          	ld	x,#low(_m_ardblViscosityCalibratedValues)
3520  090c cd0000        	call	c_rtoxl
3522                     ; 447 	m_ardblViscosityMeasured[0] = (double) parametersGetValue(PARAM_IN_VISCOSITY);
3524  090f a606          	ld	a,#6
3525  0911 cd0000        	call	_parametersGetValue
3527  0914 cd0000        	call	c_uitof
3529  0917 ae08          	ld	x,#high(_m_ardblViscosityMeasured)
3530  0919 bf00          	ld	c_x,x
3531  091b ae08          	ld	x,#low(_m_ardblViscosityMeasured)
3532  091d cd0000        	call	c_rtoxl
3534                     ; 471 	dblValue = parametersGetValue(PARAM_VISCO_MULT);
3536  0920 a625          	ld	a,#37
3537  0922 cd0000        	call	_parametersGetValue
3539  0925 cd0000        	call	c_uitof
3541  0928 aef8          	ld	x,#_measureViscosityCalibration$L-8
3542  092a cd0000        	call	c_rtol
3544                     ; 472 	dblValue2 = 10.0 * (m_ardblViscosityCalibratedValues[0] - (dblValue * m_ardblViscosityMeasured[0] /10000.0));
3546  092d aef8          	ld	x,#_measureViscosityCalibration$L-8
3547  092f cd0000        	call	c_ltor
3549  0932 ae08          	ld	x,#high(_m_ardblViscosityMeasured)
3550  0934 bf00          	ld	c_x,x
3551  0936 ae08          	ld	x,#low(_m_ardblViscosityMeasured)
3552  0938 cd0000        	call	c_xfmul
3554  093b ae19          	ld	x,#high(L7141)
3555  093d bf00          	ld	c_x,x
3556  093f ae19          	ld	x,#low(L7141)
3557  0941 cd0000        	call	c_xfdiv
3559  0944 aef4          	ld	x,#_measureViscosityCalibration$L-12
3560  0946 cd0000        	call	c_rtol
3562  0949 ae00          	ld	x,#high(_m_ardblViscosityCalibratedValues)
3563  094b bf00          	ld	c_x,x
3564  094d ae00          	ld	x,#low(_m_ardblViscosityCalibratedValues)
3565  094f cd0000        	call	c_xltor
3567  0952 aef4          	ld	x,#_measureViscosityCalibration$L-12
3568  0954 cd0000        	call	c_fsub
3570  0957 ae15          	ld	x,#high(L3341)
3571  0959 bf00          	ld	c_x,x
3572  095b ae15          	ld	x,#low(L3341)
3573  095d cd0000        	call	c_xfmul
3575  0960 aefc          	ld	x,#_measureViscosityCalibration$L-4
3576  0962 cd0000        	call	c_rtol
3578                     ; 473 	parametersSet(PARAM_VISCO_OFFSET, (WORD) dblValue2);
3580  0965 aefc          	ld	x,#_measureViscosityCalibration$L-4
3581  0967 cd0000        	call	c_ltor
3583  096a cd0000        	call	c_ftoi
3585  096d b702          	ld	_parametersSet$L+2,a
3586  096f bf01          	ld	_parametersSet$L+1,x
3587  0971 a626          	ld	a,#38
3588  0973 cd0000        	call	_parametersSet
3590                     ; 481 	m_ardblViscosityPreviousPValue[MEASURE_VISCOSITY_CALC_IDX_CONTROL] = 0.0;
3592  0976 c60020        	ld	a,L3001+3
3593  0979 c701eb        	ld	_m_ardblViscosityPreviousPValue+3,a
3594  097c c6001f        	ld	a,L3001+2
3595  097f c701ea        	ld	_m_ardblViscosityPreviousPValue+2,a
3596  0982 c6001e        	ld	a,L3001+1
3597  0985 c701e9        	ld	_m_ardblViscosityPreviousPValue+1,a
3598  0988 c6001d        	ld	a,L3001
3599  098b c701e8        	ld	_m_ardblViscosityPreviousPValue,a
3600                     ; 482 	m_ardblViscosityPreviousPValue[MEASURE_VISCOSITY_CALC_IDX_VISUAL] = 0.0;
3602  098e c60020        	ld	a,L3001+3
3603  0991 c701ef        	ld	_m_ardblViscosityPreviousPValue+7,a
3604  0994 c6001f        	ld	a,L3001+2
3605  0997 c701ee        	ld	_m_ardblViscosityPreviousPValue+6,a
3606  099a c6001e        	ld	a,L3001+1
3607  099d c701ed        	ld	_m_ardblViscosityPreviousPValue+5,a
3608  09a0 c6001d        	ld	a,L3001
3609  09a3 c701ec        	ld	_m_ardblViscosityPreviousPValue+4,a
3610                     ; 486 }
3613  09a6 81            	ret
3652                     ; 491 void measureViscosityCalibration2Points(void)
3652                     ; 492 {
3653                     	switch	.text
3655                     	xref.b	_measureViscosityCalibration2Points$L
3656  09a7               _measureViscosityCalibration2Points:
3659                     ; 498 	m_ardblViscosityCalibratedValues[1] = m_ardblViscosityCalibratedValues[0];
3661  09a7 c60003        	ld	a,_m_ardblViscosityCalibratedValues+3
3662  09aa c70007        	ld	_m_ardblViscosityCalibratedValues+7,a
3663  09ad c60002        	ld	a,_m_ardblViscosityCalibratedValues+2
3664  09b0 c70006        	ld	_m_ardblViscosityCalibratedValues+6,a
3665  09b3 c60001        	ld	a,_m_ardblViscosityCalibratedValues+1
3666  09b6 c70005        	ld	_m_ardblViscosityCalibratedValues+5,a
3667  09b9 c60000        	ld	a,_m_ardblViscosityCalibratedValues
3668  09bc c70004        	ld	_m_ardblViscosityCalibratedValues+4,a
3669                     ; 499 	m_ardblViscosityMeasured[1] = m_ardblViscosityMeasured[0];
3671  09bf c6000b        	ld	a,_m_ardblViscosityMeasured+3
3672  09c2 c7000f        	ld	_m_ardblViscosityMeasured+7,a
3673  09c5 c6000a        	ld	a,_m_ardblViscosityMeasured+2
3674  09c8 c7000e        	ld	_m_ardblViscosityMeasured+6,a
3675  09cb c60009        	ld	a,_m_ardblViscosityMeasured+1
3676  09ce c7000d        	ld	_m_ardblViscosityMeasured+5,a
3677  09d1 c60008        	ld	a,_m_ardblViscosityMeasured
3678  09d4 c7000c        	ld	_m_ardblViscosityMeasured+4,a
3679                     ; 500 	m_ardblViscosityCalibratedValues[0] = (double) parametersGetValue(PARAM_CALIBRATION_VALUE);
3681  09d7 a604          	ld	a,#4
3682  09d9 cd0000        	call	_parametersGetValue
3684  09dc cd0000        	call	c_uitof
3686  09df ae00          	ld	x,#high(_m_ardblViscosityCalibratedValues)
3687  09e1 bf00          	ld	c_x,x
3688  09e3 ae00          	ld	x,#low(_m_ardblViscosityCalibratedValues)
3689  09e5 cd0000        	call	c_rtoxl
3691                     ; 501 	m_ardblViscosityMeasured[0] = (double) parametersGetValue(PARAM_IN_VISCOSITY);
3693  09e8 a606          	ld	a,#6
3694  09ea cd0000        	call	_parametersGetValue
3696  09ed cd0000        	call	c_uitof
3698  09f0 ae08          	ld	x,#high(_m_ardblViscosityMeasured)
3699  09f2 bf00          	ld	c_x,x
3700  09f4 ae08          	ld	x,#low(_m_ardblViscosityMeasured)
3701  09f6 cd0000        	call	c_rtoxl
3703                     ; 517 	dblValue = (m_ardblViscosityCalibratedValues[0] -  m_ardblViscosityCalibratedValues[1]) * (10000.0 / (m_ardblViscosityMeasured[0]-m_ardblViscosityMeasured[1]));
3705  09f9 ae08          	ld	x,#high(_m_ardblViscosityMeasured)
3706  09fb bf00          	ld	c_x,x
3707  09fd ae08          	ld	x,#low(_m_ardblViscosityMeasured)
3708  09ff cd0000        	call	c_xltor
3710  0a02 ae0c          	ld	x,#high(_m_ardblViscosityMeasured+4)
3711  0a04 bf00          	ld	c_x,x
3712  0a06 ae0c          	ld	x,#low(_m_ardblViscosityMeasured+4)
3713  0a08 cd0000        	call	c_xfsub
3715  0a0b aef8          	ld	x,#_measureViscosityCalibration2Points$L-8
3716  0a0d cd0000        	call	c_rtol
3718  0a10 ae19          	ld	x,#high(L7141)
3719  0a12 bf00          	ld	c_x,x
3720  0a14 ae19          	ld	x,#low(L7141)
3721  0a16 cd0000        	call	c_xltor
3723  0a19 aef8          	ld	x,#_measureViscosityCalibration2Points$L-8
3724  0a1b cd0000        	call	c_fdiv
3726  0a1e aef4          	ld	x,#_measureViscosityCalibration2Points$L-12
3727  0a20 cd0000        	call	c_rtol
3729  0a23 ae00          	ld	x,#high(_m_ardblViscosityCalibratedValues)
3730  0a25 bf00          	ld	c_x,x
3731  0a27 ae00          	ld	x,#low(_m_ardblViscosityCalibratedValues)
3732  0a29 cd0000        	call	c_xltor
3734  0a2c ae04          	ld	x,#high(_m_ardblViscosityCalibratedValues+4)
3735  0a2e bf00          	ld	c_x,x
3736  0a30 ae04          	ld	x,#low(_m_ardblViscosityCalibratedValues+4)
3737  0a32 cd0000        	call	c_xfsub
3739  0a35 aef4          	ld	x,#_measureViscosityCalibration2Points$L-12
3740  0a37 cd0000        	call	c_fmul
3742  0a3a aefc          	ld	x,#_measureViscosityCalibration2Points$L-4
3743  0a3c cd0000        	call	c_rtol
3745                     ; 518 	parametersSet(PARAM_VISCO_MULT, (WORD) dblValue);
3747  0a3f aefc          	ld	x,#_measureViscosityCalibration2Points$L-4
3748  0a41 cd0000        	call	c_ltor
3750  0a44 cd0000        	call	c_ftoi
3752  0a47 b702          	ld	_parametersSet$L+2,a
3753  0a49 bf01          	ld	_parametersSet$L+1,x
3754  0a4b a625          	ld	a,#37
3755  0a4d cd0000        	call	_parametersSet
3757                     ; 523 	dblValue = 10.0 * (m_ardblViscosityCalibratedValues[0] - (dblValue * m_ardblViscosityMeasured[0] /10000.0));
3759  0a50 aefc          	ld	x,#_measureViscosityCalibration2Points$L-4
3760  0a52 cd0000        	call	c_ltor
3762  0a55 ae08          	ld	x,#high(_m_ardblViscosityMeasured)
3763  0a57 bf00          	ld	c_x,x
3764  0a59 ae08          	ld	x,#low(_m_ardblViscosityMeasured)
3765  0a5b cd0000        	call	c_xfmul
3767  0a5e ae19          	ld	x,#high(L7141)
3768  0a60 bf00          	ld	c_x,x
3769  0a62 ae19          	ld	x,#low(L7141)
3770  0a64 cd0000        	call	c_xfdiv
3772  0a67 aef8          	ld	x,#_measureViscosityCalibration2Points$L-8
3773  0a69 cd0000        	call	c_rtol
3775  0a6c ae00          	ld	x,#high(_m_ardblViscosityCalibratedValues)
3776  0a6e bf00          	ld	c_x,x
3777  0a70 ae00          	ld	x,#low(_m_ardblViscosityCalibratedValues)
3778  0a72 cd0000        	call	c_xltor
3780  0a75 aef8          	ld	x,#_measureViscosityCalibration2Points$L-8
3781  0a77 cd0000        	call	c_fsub
3783  0a7a ae15          	ld	x,#high(L3341)
3784  0a7c bf00          	ld	c_x,x
3785  0a7e ae15          	ld	x,#low(L3341)
3786  0a80 cd0000        	call	c_xfmul
3788  0a83 aefc          	ld	x,#_measureViscosityCalibration2Points$L-4
3789  0a85 cd0000        	call	c_rtol
3791                     ; 524 	parametersSet(PARAM_VISCO_OFFSET, (WORD) dblValue);
3793  0a88 aefc          	ld	x,#_measureViscosityCalibration2Points$L-4
3794  0a8a cd0000        	call	c_ltor
3796  0a8d cd0000        	call	c_ftoi
3798  0a90 b702          	ld	_parametersSet$L+2,a
3799  0a92 bf01          	ld	_parametersSet$L+1,x
3800  0a94 a626          	ld	a,#38
3801  0a96 cd0000        	call	_parametersSet
3803                     ; 527 	m_ardblViscosityPreviousPValue[MEASURE_VISCOSITY_CALC_IDX_CONTROL] = 0.0;
3805  0a99 c60020        	ld	a,L3001+3
3806  0a9c c701eb        	ld	_m_ardblViscosityPreviousPValue+3,a
3807  0a9f c6001f        	ld	a,L3001+2
3808  0aa2 c701ea        	ld	_m_ardblViscosityPreviousPValue+2,a
3809  0aa5 c6001e        	ld	a,L3001+1
3810  0aa8 c701e9        	ld	_m_ardblViscosityPreviousPValue+1,a
3811  0aab c6001d        	ld	a,L3001
3812  0aae c701e8        	ld	_m_ardblViscosityPreviousPValue,a
3813                     ; 528 	m_ardblViscosityPreviousPValue[MEASURE_VISCOSITY_CALC_IDX_VISUAL] = 0.0;
3815  0ab1 c60020        	ld	a,L3001+3
3816  0ab4 c701ef        	ld	_m_ardblViscosityPreviousPValue+7,a
3817  0ab7 c6001f        	ld	a,L3001+2
3818  0aba c701ee        	ld	_m_ardblViscosityPreviousPValue+6,a
3819  0abd c6001e        	ld	a,L3001+1
3820  0ac0 c701ed        	ld	_m_ardblViscosityPreviousPValue+5,a
3821  0ac3 c6001d        	ld	a,L3001
3822  0ac6 c701ec        	ld	_m_ardblViscosityPreviousPValue+4,a
3823                     ; 532 }
3826  0ac9 81            	ret
3940                     	switch	.bss
3941  0000               _m_ardblViscosityCalibratedValues:
3942  0000 000000000000  	ds.b	8
3943                     	xdef	_m_ardblViscosityCalibratedValues
3944  0008               _m_ardblViscosityMeasured:
3945  0008 000000000000  	ds.b	8
3946                     	xdef	_m_ardblViscosityMeasured
3947  0010               _m_arwoViscosityMValues:
3948  0010 000000000000  	ds.b	64
3949                     	xdef	_m_arwoViscosityMValues
3950  0050               _m_ardblViscosityRValues:
3951  0050 000000000000  	ds.b	128
3952                     	xdef	_m_ardblViscosityRValues
3953  00d0               _m_ardblViscosityVValues:
3954  00d0 000000000000  	ds.b	256
3955                     	xdef	_m_ardblViscosityVValues
3956  01d0               _m_ardblViscosityDValue:
3957  01d0 000000000000  	ds.b	8
3958                     	xdef	_m_ardblViscosityDValue
3959  01d8               _m_ardblViscosityIValue:
3960  01d8 000000000000  	ds.b	8
3961                     	xdef	_m_ardblViscosityIValue
3962  01e0               _m_ardblViscosityPValue:
3963  01e0 000000000000  	ds.b	8
3964                     	xdef	_m_ardblViscosityPValue
3965  01e8               _m_ardblViscosityPreviousPValue:
3966  01e8 000000000000  	ds.b	8
3967                     	xdef	_m_ardblViscosityPreviousPValue
3968                     	xdef	_measureGetHistoricalViscosityValue
3969                     	xdef	_measureViscosityCalibration2Points
3970                     	xdef	_measureViscosityCalibration
3971                     	xdef	_measureCalculation
3972                     	xdef	_measureSetValveStatus
3973                     	xdef	_measureUpdateViscosity
3974                     	xdef	_measureUpdateTemperature
3975                     	xdef	_measureInit
3976                     	xref	_displayIsKeyPressed
3977                     	xref	_parametersSet
3978                     	xref	_parametersGetValue
3979                     	switch	.const
3980  0001               L7351:
3981  0001 40000000      	dc.w	16384,0
3982  0005               L7251:
3983  0005 3f800000      	dc.w	16256,0
3984  0009               L1051:
3985  0009 42c80000      	dc.w	17096,0
3986  000d               L7541:
3987  000d 410065e5      	dc.w	16640,26085
3988  0011               L7441:
3989  0011 3fa4a851      	dc.w	16292,-22447
3990  0015               L3341:
3991  0015 41200000      	dc.w	16672,0
3992  0019               L7141:
3993  0019 461c4000      	dc.w	17948,16384
3994  001d               L3001:
3995  001d 00000000      	dc.w	0,0
3996                     	xref.b	c_lreg
3997                     	xref.b	c_x
3998                     	xref.b	c_y
4018                     	xref	c_xfcmp
4019                     	xref	c_xfsub
4020                     	xref	c_fgadd
4021                     	xref	c_getlx
4022                     	xref	c_fdiv
4023                     	xref	c_xfgadd
4024                     	xref	c_rtoxl
4025                     	xref	c_xltor
4026                     	xref	c_xfadd
4027                     	xref	c_xfmul
4028                     	xref	c_fadd
4029                     	xref	c_fneg
4030                     	xref	c_ftoi
4031                     	xref	c_fsub
4032                     	xref	c_xfdiv
4033                     	xref	c_fmul
4034                     	xref	c_uitof
4035                     	xref	c_lrzmp
4036                     	xref	c_lgadc
4037                     	xref	c_lgsbc
4038                     	xref	c_lursh
4039                     	xref	c_ltor
4040                     	xref	c_lzmp
4041                     	xref	c_lgadd
4042                     	xref	c_ladd
4043                     	xref	c_rtol
4044                     	xref	c_itol
4045                     	xref	c_putlx
4046                     	xref.b	_parametersSet$L
4047                     	end
