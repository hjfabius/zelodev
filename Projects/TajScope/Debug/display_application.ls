   1                     ; C Compiler for ST7 (COSMIC Software)
   2                     ; Generator V4.5.5 - 12 Jan 2006
1280                     .const:	section	.text
1281  0000               L327_mc_displayPages:
1282  0000 00            	dc.b	0
1283  0001 00            	dc.b	0
1284  0002 00            	dc.b	0
1285  0003 00            	dc.b	0
1286  0004 00            	dc.b	0
1287  0005 00            	dc.b	0
1288  0006 00            	dc.b	0
1289  0007 00            	dc.b	0
1290  0008 00            	dc.b	0
1291  0009 00            	dc.b	0
1292  000a 00            	dc.b	0
1293  000b 00            	dc.b	0
1294  000c 00            	dc.b	0
1295  000d 00            	dc.b	0
1296  000e 00            	dc.b	0
1297  000f 00            	dc.b	0
1298  0010 00            	dc.b	0
1299  0011 00            	dc.b	0
1300  0012 00            	dc.b	0
1301  0013 00            	dc.b	0
1302  0014 00            	dc.b	0
1303  0015 00            	dc.b	0
1304  0016 00            	dc.b	0
1305  0017 00            	dc.b	0
1306  0018 00            	dc.b	0
1307  0019 00            	dc.b	0
1308  001a 00            	dc.b	0
1309  001b 00            	dc.b	0
1310  001c 00            	dc.b	0
1311  001d 00            	dc.b	0
1312  001e 00            	dc.b	0
1313  001f 00            	dc.b	0
1314  0020 00            	dc.b	0
1315  0021 00            	dc.b	0
1316  0022 00            	dc.b	0
1317  0023 00            	dc.b	0
1350                     ; 26 void displayAppInit(void)
1350                     ; 27 {
1351                     	switch	.text
1352  0000               _displayAppInit:
1355                     ; 28 	screenInit();
1357  0000 cd0000        	call	_screenInit
1359                     ; 29 	parametersSet(PARAM_OSCIL_ZOOM, 0x0004);
1361  0003 a604          	ld	a,#4
1362  0005 b702          	ld	_parametersSet$L+2,a
1363  0007 3f01          	clr	_parametersSet$L+1
1364  0009 a60b          	ld	a,#11
1365  000b cd0000        	call	_parametersSet
1367                     ; 30 	parametersSet(PARAM_OSCIL_OFFSET, 0x0000);
1369  000e 3f01          	clr	_parametersSet$L+1
1370  0010 3f02          	clr	_parametersSet$L+2
1371  0012 a60c          	ld	a,#12
1372  0014 cd0000        	call	_parametersSet
1374                     ; 31 	m_byPause = false;
1376  0017 4f            	clr	a
1377  0018 c70000        	ld	_m_byPause,a
1378                     ; 33 }
1381  001b 81            	ret
1436                     ; 36 void displayAppNavigate(void)
1436                     ; 37 {
1437                     	switch	.text
1439                     	xref.b	_displayAppNavigate$L
1440  001c               _displayAppNavigate:
1443                     ; 41 	byKey = isDisplayKeyPressed();
1445  001c cd0000        	call	_isDisplayKeyPressed
1447  001f b7fb          	ld	_displayAppNavigate$L-5,a
1448                     ; 42 	if (byKey != KEY_NULL)
1450  0021 b6fb          	ld	a,_displayAppNavigate$L-5
1451  0023 a1ff          	cp	a,#255
1452  0025 2603          	jrne	L01
1453  0027 cc01b0        	jp	L7101
1454  002a               L01:
1455                     ; 44 		switch(byKey)
1457  002a b6fb          	ld	a,_displayAppNavigate$L-5
1459                     ; 105 			default:
1459                     ; 106 				break;
1460  002c 4d            	tnz	a
1461  002d 2722          	jreq	L347
1462  002f 4a            	dec	a
1463  0030 2603          	jrne	L21
1464  0032 cc00bf        	jp	L547
1465  0035               L21:
1466  0035 4a            	dec	a
1467  0036 2603          	jrne	L41
1468  0038 cc012d        	jp	L747
1469  003b               L41:
1470  003b 4a            	dec	a
1471  003c 2603          	jrne	L61
1472  003e cc0162        	jp	L157
1473  0041               L61:
1474  0041 a002          	sub	a,#2
1475  0043 2603          	jrne	L02
1476  0045 cc01a1        	jp	L557
1477  0048               L02:
1478  0048 4a            	dec	a
1479  0049 2603          	jrne	L22
1480  004b cc01a3        	jp	L757
1481  004e               L22:
1482  004e cc01b0        	jp	L7101
1483  0051               L347:
1484                     ; 46 			case KEY_ZOOM_IN:
1484                     ; 47 				if (parametersGetValue(PARAM_OSCIL_ZOOM)>1)
1486  0051 a60b          	ld	a,#11
1487  0053 cd0000        	call	_parametersGetValue
1489  0056 a002          	sub	a,#2
1490  0058 9f            	ld	a,x
1491  0059 a200          	sbc	a,#0
1492  005b 2403          	jruge	L42
1493  005d cc01b0        	jp	L7101
1494  0060               L42:
1495                     ; 49 					woValue = parametersGetValue(PARAM_OSCIL_ZOOM)/2;
1497  0060 a60b          	ld	a,#11
1498  0062 cd0000        	call	_parametersGetValue
1500  0065 54            	srl	x
1501  0066 46            	rrc	a
1502  0067 b7ff          	ld	_displayAppNavigate$L-1,a
1503  0069 bffe          	ld	_displayAppNavigate$L-2,x
1504                     ; 50 					parametersSet(PARAM_OSCIL_ZOOM,  woValue);
1506  006b befe          	ld	x,_displayAppNavigate$L-2
1507  006d bf01          	ld	_parametersSet$L+1,x
1508  006f b6ff          	ld	a,_displayAppNavigate$L-1
1509  0071 b702          	ld	_parametersSet$L+2,a
1510  0073 a60b          	ld	a,#11
1511  0075 cd0000        	call	_parametersSet
1513                     ; 51 					woValueOffset = 32;
1515  0078 a620          	ld	a,#32
1516  007a b7fd          	ld	_displayAppNavigate$L-3,a
1517  007c 3ffc          	clr	_displayAppNavigate$L-4
1519  007e 2008          	jra	L3301
1520  0080               L7201:
1521                     ; 54 						woValueOffset *= 2; 
1523  0080 38fd          	sll	_displayAppNavigate$L-3
1524  0082 39fc          	rlc	_displayAppNavigate$L-4
1525                     ; 55 						woValue = woValue>>1;
1527  0084 34fe          	srl	_displayAppNavigate$L-2
1528  0086 36ff          	rrc	_displayAppNavigate$L-1
1529  0088               L3301:
1530                     ; 52 					while(woValue > 0x0000)
1532  0088 b6ff          	ld	a,_displayAppNavigate$L-1
1533  008a bafe          	or	a,_displayAppNavigate$L-2
1534  008c 26f2          	jrne	L7201
1535                     ; 58 					woValue = (parametersGetValue(PARAM_OSCIL_OFFSET) + woValueOffset)&(ENCODER_PULSES-1)&(ENCODER_PULSES-1);
1537  008e a60c          	ld	a,#12
1538  0090 cd0000        	call	_parametersGetValue
1540  0093 bbfd          	add	a,_displayAppNavigate$L-3
1541  0095 88            	push	a
1542  0096 9f            	ld	a,x
1543  0097 b9fc          	adc	a,_displayAppNavigate$L-4
1544  0099 97            	ld	x,a
1545  009a 84            	pop	a
1546  009b a4ff          	and	a,#255
1547  009d 88            	push	a
1548  009e 9f            	ld	a,x
1549  009f a403          	and	a,#3
1550  00a1 97            	ld	x,a
1551  00a2 84            	pop	a
1552  00a3 a4ff          	and	a,#255
1553  00a5 88            	push	a
1554  00a6 9f            	ld	a,x
1555  00a7 a403          	and	a,#3
1556  00a9 97            	ld	x,a
1557  00aa 84            	pop	a
1558  00ab b7ff          	ld	_displayAppNavigate$L-1,a
1559  00ad bffe          	ld	_displayAppNavigate$L-2,x
1560                     ; 59 					parametersSet(PARAM_OSCIL_OFFSET, woValue);
1562  00af befe          	ld	x,_displayAppNavigate$L-2
1563  00b1 bf01          	ld	_parametersSet$L+1,x
1564  00b3 b6ff          	ld	a,_displayAppNavigate$L-1
1565  00b5 b702          	ld	_parametersSet$L+2,a
1566  00b7 a60c          	ld	a,#12
1567  00b9 cd0000        	call	_parametersSet
1569  00bc cc01b0        	jp	L7101
1570  00bf               L547:
1571                     ; 62 			case KEY_ZOOM_OUT:
1571                     ; 63 				if (parametersGetValue(PARAM_OSCIL_ZOOM)<16)  
1573  00bf a60b          	ld	a,#11
1574  00c1 cd0000        	call	_parametersGetValue
1576  00c4 a010          	sub	a,#16
1577  00c6 9f            	ld	a,x
1578  00c7 a200          	sbc	a,#0
1579  00c9 2503          	jrult	L62
1580  00cb cc01b0        	jp	L7101
1581  00ce               L62:
1582                     ; 65 					woValue = parametersGetValue(PARAM_OSCIL_ZOOM)*2;
1584  00ce a60b          	ld	a,#11
1585  00d0 cd0000        	call	_parametersGetValue
1587  00d3 48            	sll	a
1588  00d4 59            	rlc	x
1589  00d5 b7ff          	ld	_displayAppNavigate$L-1,a
1590  00d7 bffe          	ld	_displayAppNavigate$L-2,x
1591                     ; 66 					parametersSet(PARAM_OSCIL_ZOOM,  woValue);
1593  00d9 befe          	ld	x,_displayAppNavigate$L-2
1594  00db bf01          	ld	_parametersSet$L+1,x
1595  00dd b6ff          	ld	a,_displayAppNavigate$L-1
1596  00df b702          	ld	_parametersSet$L+2,a
1597  00e1 a60b          	ld	a,#11
1598  00e3 cd0000        	call	_parametersSet
1600                     ; 67 					woValueOffset = 16;
1602  00e6 a610          	ld	a,#16
1603  00e8 b7fd          	ld	_displayAppNavigate$L-3,a
1604  00ea 3ffc          	clr	_displayAppNavigate$L-4
1606  00ec 2008          	jra	L5401
1607  00ee               L1401:
1608                     ; 70 						woValueOffset *= 2; 
1610  00ee 38fd          	sll	_displayAppNavigate$L-3
1611  00f0 39fc          	rlc	_displayAppNavigate$L-4
1612                     ; 71 						woValue = woValue>>1;
1614  00f2 34fe          	srl	_displayAppNavigate$L-2
1615  00f4 36ff          	rrc	_displayAppNavigate$L-1
1616  00f6               L5401:
1617                     ; 68 					while(woValue > 0x0000)
1619  00f6 b6ff          	ld	a,_displayAppNavigate$L-1
1620  00f8 bafe          	or	a,_displayAppNavigate$L-2
1621  00fa 26f2          	jrne	L1401
1622                     ; 74 					woValue = (ENCODER_PULSES+parametersGetValue(PARAM_OSCIL_OFFSET) - woValueOffset)&(ENCODER_PULSES-1);
1624  00fc a60c          	ld	a,#12
1625  00fe cd0000        	call	_parametersGetValue
1627  0101 ab00          	add	a,#0
1628  0103 88            	push	a
1629  0104 9f            	ld	a,x
1630  0105 a904          	adc	a,#4
1631  0107 97            	ld	x,a
1632  0108 84            	pop	a
1633  0109 b0fd          	sub	a,_displayAppNavigate$L-3
1634  010b 88            	push	a
1635  010c 9f            	ld	a,x
1636  010d b2fc          	sbc	a,_displayAppNavigate$L-4
1637  010f 97            	ld	x,a
1638  0110 84            	pop	a
1639  0111 a4ff          	and	a,#255
1640  0113 88            	push	a
1641  0114 9f            	ld	a,x
1642  0115 a403          	and	a,#3
1643  0117 97            	ld	x,a
1644  0118 84            	pop	a
1645  0119 b7ff          	ld	_displayAppNavigate$L-1,a
1646  011b bffe          	ld	_displayAppNavigate$L-2,x
1647                     ; 75 					parametersSet(PARAM_OSCIL_OFFSET, woValue);
1649  011d befe          	ld	x,_displayAppNavigate$L-2
1650  011f bf01          	ld	_parametersSet$L+1,x
1651  0121 b6ff          	ld	a,_displayAppNavigate$L-1
1652  0123 b702          	ld	_parametersSet$L+2,a
1653  0125 a60c          	ld	a,#12
1654  0127 cd0000        	call	_parametersSet
1656  012a cc01b0        	jp	L7101
1657  012d               L747:
1658                     ; 78 			case KEY_GATE_LEFT:
1658                     ; 79 				woValue = (parametersGetValue(PARAM_OSCIL_OFFSET)+4*parametersGetValue(PARAM_OSCIL_ZOOM))&(ENCODER_PULSES-1);
1660  012d a60b          	ld	a,#11
1661  012f cd0000        	call	_parametersGetValue
1663  0132 48            	sll	a
1664  0133 59            	rlc	x
1665  0134 48            	sll	a
1666  0135 59            	rlc	x
1667  0136 b7fa          	ld	_displayAppNavigate$L-6,a
1668  0138 bff9          	ld	_displayAppNavigate$L-7,x
1669  013a a60c          	ld	a,#12
1670  013c cd0000        	call	_parametersGetValue
1672  013f bbfa          	add	a,_displayAppNavigate$L-6
1673  0141 88            	push	a
1674  0142 9f            	ld	a,x
1675  0143 b9f9          	adc	a,_displayAppNavigate$L-7
1676  0145 97            	ld	x,a
1677  0146 84            	pop	a
1678  0147 a4ff          	and	a,#255
1679  0149 88            	push	a
1680  014a 9f            	ld	a,x
1681  014b a403          	and	a,#3
1682  014d 97            	ld	x,a
1683  014e 84            	pop	a
1684  014f b7ff          	ld	_displayAppNavigate$L-1,a
1685  0151 bffe          	ld	_displayAppNavigate$L-2,x
1686                     ; 80 				parametersSet(PARAM_OSCIL_OFFSET, woValue);			
1688  0153 befe          	ld	x,_displayAppNavigate$L-2
1689  0155 bf01          	ld	_parametersSet$L+1,x
1690  0157 b6ff          	ld	a,_displayAppNavigate$L-1
1691  0159 b702          	ld	_parametersSet$L+2,a
1692  015b a60c          	ld	a,#12
1693  015d cd0000        	call	_parametersSet
1695                     ; 81 				break;
1697  0160 204e          	jra	L7101
1698  0162               L157:
1699                     ; 82 			case KEY_GATE_RIGHT:
1699                     ; 83 				woValue = (ENCODER_PULSES+parametersGetValue(PARAM_OSCIL_OFFSET)-4*parametersGetValue(PARAM_OSCIL_ZOOM))&(ENCODER_PULSES-1);
1701  0162 a60b          	ld	a,#11
1702  0164 cd0000        	call	_parametersGetValue
1704  0167 48            	sll	a
1705  0168 59            	rlc	x
1706  0169 48            	sll	a
1707  016a 59            	rlc	x
1708  016b b7fa          	ld	_displayAppNavigate$L-6,a
1709  016d bff9          	ld	_displayAppNavigate$L-7,x
1710  016f a60c          	ld	a,#12
1711  0171 cd0000        	call	_parametersGetValue
1713  0174 ab00          	add	a,#0
1714  0176 88            	push	a
1715  0177 9f            	ld	a,x
1716  0178 a904          	adc	a,#4
1717  017a 97            	ld	x,a
1718  017b 84            	pop	a
1719  017c b0fa          	sub	a,_displayAppNavigate$L-6
1720  017e 88            	push	a
1721  017f 9f            	ld	a,x
1722  0180 b2f9          	sbc	a,_displayAppNavigate$L-7
1723  0182 97            	ld	x,a
1724  0183 84            	pop	a
1725  0184 a4ff          	and	a,#255
1726  0186 88            	push	a
1727  0187 9f            	ld	a,x
1728  0188 a403          	and	a,#3
1729  018a 97            	ld	x,a
1730  018b 84            	pop	a
1731  018c b7ff          	ld	_displayAppNavigate$L-1,a
1732  018e bffe          	ld	_displayAppNavigate$L-2,x
1733                     ; 84 				parametersSet(PARAM_OSCIL_OFFSET, woValue);			
1735  0190 befe          	ld	x,_displayAppNavigate$L-2
1736  0192 bf01          	ld	_parametersSet$L+1,x
1737  0194 b6ff          	ld	a,_displayAppNavigate$L-1
1738  0196 b702          	ld	_parametersSet$L+2,a
1739  0198 a60c          	ld	a,#12
1740  019a cd0000        	call	_parametersSet
1742                     ; 85 				break;
1744  019d 2011          	jra	L7101
1745  019f               L357:
1746                     ; 86 			case KEY_OFF:
1746                     ; 87 				//displayOff();
1746                     ; 88 				break;
1748  019f 200f          	jra	L7101
1749  01a1               L557:
1750                     ; 89 			case KEY_PAUSE:
1750                     ; 90 				m_byPause != m_byPause;
1752                     ; 91 				break;
1754  01a1 200d          	jra	L7101
1755  01a3               L757:
1756                     ; 92 			case KEY_CENTER:
1756                     ; 93 				parametersSet(PARAM_OSCIL_OFFSET, 0xFFFF);
1758  01a3 aeff          	ld	x,#255
1759  01a5 bf01          	ld	_parametersSet$L+1,x
1760  01a7 a6ff          	ld	a,#255
1761  01a9 b702          	ld	_parametersSet$L+2,a
1762  01ab a60c          	ld	a,#12
1763  01ad cd0000        	call	_parametersSet
1765                     ; 95 				break;
1767  01b0               L167:
1768                     ; 96 			case KEY_F1:
1768                     ; 97 				//screenBigMessage("F1", "");
1768                     ; 98 				break;
1770  01b0               L367:
1771                     ; 99 			case KEY_F2:
1771                     ; 100 				//screenBigMessage("F2", "");
1771                     ; 101 				break;
1773  01b0               L567:
1774                     ; 102 			case KEY_F3:
1774                     ; 103 				//screenBigMessage("F3", "");
1774                     ; 104 				break;
1776  01b0               L767:
1777                     ; 105 			default:
1777                     ; 106 				break;
1779  01b0               L3201:
1780  01b0               L7101:
1781                     ; 109 }
1784  01b0 81            	ret
1815                     ; 113 void displayAppLoop(void)
1815                     ; 114 {
1816                     	switch	.text
1817  01b1               _displayAppLoop:
1820                     ; 116 	screenBigMessage("Test Encoder", "Zero channel");
1822  01b1 ae48          	ld	x,#high(L3601)
1823  01b3 bf02          	ld	_screenBigMessage$L+2,x
1824  01b5 a648          	ld	a,#low(L3601)
1825  01b7 b703          	ld	_screenBigMessage$L+3,a
1826  01b9 a655          	ld	a,#low(L1601)
1827  01bb ae55          	ld	x,#high(L1601)
1828  01bd cd0000        	call	_screenBigMessage
1830                     ; 117 	scanningHeadSignalTestEncoderZero();
1832  01c0 cd0000        	call	_scanningHeadSignalTestEncoderZero
1834                     ; 118 	screenBigMessage("Test Encoder", "AB channels");
1836  01c3 ae3c          	ld	x,#high(L5601)
1837  01c5 bf02          	ld	_screenBigMessage$L+2,x
1838  01c7 a63c          	ld	a,#low(L5601)
1839  01c9 b703          	ld	_screenBigMessage$L+3,a
1840  01cb a655          	ld	a,#low(L1601)
1841  01cd ae55          	ld	x,#high(L1601)
1842  01cf cd0000        	call	_screenBigMessage
1844                     ; 119 	scanningHeadSignalTestEncoderAB();
1846  01d2 cd0000        	call	_scanningHeadSignalTestEncoderAB
1848                     ; 120 	screenBigMessage("Waiting Encoder", "signals");
1850  01d5 ae24          	ld	x,#high(L1701)
1851  01d7 bf02          	ld	_screenBigMessage$L+2,x
1852  01d9 a624          	ld	a,#low(L1701)
1853  01db b703          	ld	_screenBigMessage$L+3,a
1854  01dd a62c          	ld	a,#low(L7601)
1855  01df ae2c          	ld	x,#high(L7601)
1856  01e1 cd0000        	call	_screenBigMessage
1858  01e4               L3701:
1859                     ; 124 		if(!m_byPause)
1861  01e4 c60000        	ld	a,_m_byPause
1862  01e7 4d            	tnz	a
1863  01e8 261d          	jrne	L7701
1864                     ; 126 			if (!displayIsKeyPress())
1866  01ea cd0000        	call	_displayIsKeyPress
1868  01ed 4d            	tnz	a
1869  01ee 2603          	jrne	L1011
1870                     ; 127 				scanningHeadSignalAcquireGate();
1872  01f0 cd0000        	call	_scanningHeadSignalAcquireGate
1874  01f3               L1011:
1875                     ; 129 			if (!displayIsKeyPress())
1877  01f3 cd0000        	call	_displayIsKeyPress
1879  01f6 4d            	tnz	a
1880  01f7 2603          	jrne	L3011
1881                     ; 130 				scanningHeadSignalAcquire();
1883  01f9 cd0000        	call	_scanningHeadSignalAcquire
1885  01fc               L3011:
1886                     ; 132 			if (!displayIsKeyPress())
1888  01fc cd0000        	call	_displayIsKeyPress
1890  01ff 4d            	tnz	a
1891  0200 2605          	jrne	L7701
1892                     ; 133 				screenOscilloscope(PAGE_OSCILLOSCOPE);
1894  0202 a605          	ld	a,#5
1895  0204 cd0000        	call	_screenOscilloscope
1897  0207               L7701:
1898                     ; 136 		displayAppNavigate();
1900  0207 cd001c        	call	_displayAppNavigate
1903  020a 20d8          	jra	L3701
1982                     	xdef	_displayAppNavigate
1983                     	switch	.bss
1984  0000               _m_byPause:
1985  0000 00            	ds.b	1
1986                     	xdef	_m_byPause
1987  0001               _m_bySelection:
1988  0001 00            	ds.b	1
1989                     	xdef	_m_bySelection
1990  0002               _m_byNextPage:
1991  0002 00            	ds.b	1
1992                     	xdef	_m_byNextPage
1993  0003               _m_woValue:
1994  0003 0000          	ds.b	2
1995                     	xdef	_m_woValue
1996  0005               _m_byAdditionalCode:
1997  0005 00            	ds.b	1
1998                     	xdef	_m_byAdditionalCode
1999  0006               _m_byCode:
2000  0006 00            	ds.b	1
2001                     	xdef	_m_byCode
2002                     	xref	_screenBigMessage
2003                     	xref	_screenOscilloscope
2004                     	xref	_screenInit
2005                     	xdef	_displayAppLoop
2006                     	xdef	_displayAppInit
2007                     	xref	_displayIsKeyPress
2008                     	xref	_isDisplayKeyPressed
2009                     	xref	_scanningHeadSignalTestEncoderAB
2010                     	xref	_scanningHeadSignalTestEncoderZero
2011                     	xref	_scanningHeadSignalAcquireGate
2012                     	xref	_scanningHeadSignalAcquire
2013                     	xref	_parametersSet
2014                     	xref	_parametersGetValue
2015                     	switch	.const
2016  0024               L1701:
2017  0024 7369676e616c  	dc.b	"signals",0
2018  002c               L7601:
2019  002c 57616974696e  	dc.b	"Waiting Encoder",0
2020  003c               L5601:
2021  003c 414220636861  	dc.b	"AB channels",0
2022  0048               L3601:
2023  0048 5a65726f2063  	dc.b	"Zero channel",0
2024  0055               L1601:
2025  0055 546573742045  	dc.b	"Test Encoder",0
2045                     	xref.b	_screenBigMessage$L
2046                     	xref.b	_parametersSet$L
2047                     	end
