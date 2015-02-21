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
1350                     ; 25 void displayAppInit(void)
1350                     ; 26 {
1351                     	switch	.text
1352  0000               _displayAppInit:
1355                     ; 27 	screenInit();
1357  0000 cd0000        	call	_screenInit
1359                     ; 28 	parametersSet(PARAM_OSCIL_ZOOM, 0x0004);
1361  0003 a604          	ld	a,#4
1362  0005 b702          	ld	_parametersSet$L+2,a
1363  0007 3f01          	clr	_parametersSet$L+1
1364  0009 a60b          	ld	a,#11
1365  000b cd0000        	call	_parametersSet
1367                     ; 29 	parametersSet(PARAM_OSCIL_OFFSET, 0x0000);
1369  000e 3f01          	clr	_parametersSet$L+1
1370  0010 3f02          	clr	_parametersSet$L+2
1371  0012 a60c          	ld	a,#12
1372  0014 cd0000        	call	_parametersSet
1374                     ; 30 	m_byPause = false;
1376  0017 4f            	clr	a
1377  0018 c70000        	ld	_m_byPause,a
1378                     ; 32 }
1381  001b 81            	ret
1438                     ; 35 void displayAppNavigate(void)
1438                     ; 36 {
1439                     	switch	.text
1441                     	xref.b	_displayAppNavigate$L
1442  001c               _displayAppNavigate:
1445                     ; 40 	byKey = isDisplayKeyPressed();
1447  001c cd0000        	call	_isDisplayKeyPressed
1449  001f b7fb          	ld	_displayAppNavigate$L-5,a
1450                     ; 41 	if (byKey != KEY_NULL)
1452  0021 b6fb          	ld	a,_displayAppNavigate$L-5
1453  0023 a1ff          	cp	a,#255
1454  0025 2603          	jrne	L01
1455  0027 cc0200        	jp	L7101
1456  002a               L01:
1457                     ; 43 		switch(byKey)
1459  002a b6fb          	ld	a,_displayAppNavigate$L-5
1461                     ; 103 			default:
1461                     ; 104 				break;
1462  002c 4d            	tnz	a
1463  002d 2739          	jreq	L347
1464  002f 4a            	dec	a
1465  0030 2603          	jrne	L21
1466  0032 cc00d6        	jp	L547
1467  0035               L21:
1468  0035 4a            	dec	a
1469  0036 2603          	jrne	L41
1470  0038 cc0144        	jp	L747
1471  003b               L41:
1472  003b 4a            	dec	a
1473  003c 2603          	jrne	L61
1474  003e cc017a        	jp	L157
1475  0041               L61:
1476  0041 4a            	dec	a
1477  0042 2603          	jrne	L02
1478  0044 cc01b7        	jp	L357
1479  0047               L02:
1480  0047 4a            	dec	a
1481  0048 2603          	jrne	L22
1482  004a cc01bc        	jp	L557
1483  004d               L22:
1484  004d 4a            	dec	a
1485  004e 2603          	jrne	L42
1486  0050 cc01be        	jp	L757
1487  0053               L42:
1488  0053 4a            	dec	a
1489  0054 2603          	jrne	L62
1490  0056 cc01cf        	jp	L167
1491  0059               L62:
1492  0059 4a            	dec	a
1493  005a 2603          	jrne	L03
1494  005c cc01e0        	jp	L367
1495  005f               L03:
1496  005f 4a            	dec	a
1497  0060 2603          	jrne	L23
1498  0062 cc01f1        	jp	L567
1499  0065               L23:
1500  0065 cc0200        	jp	L7101
1501  0068               L347:
1502                     ; 45 			case KEY_ZOOM_IN:
1502                     ; 46 				if (parametersGetValue(PARAM_OSCIL_ZOOM)>1)
1504  0068 a60b          	ld	a,#11
1505  006a cd0000        	call	_parametersGetValue
1507  006d a002          	sub	a,#2
1508  006f 9f            	ld	a,x
1509  0070 a200          	sbc	a,#0
1510  0072 2403          	jruge	L43
1511  0074 cc0200        	jp	L7101
1512  0077               L43:
1513                     ; 48 					woValue = parametersGetValue(PARAM_OSCIL_ZOOM)/2;
1515  0077 a60b          	ld	a,#11
1516  0079 cd0000        	call	_parametersGetValue
1518  007c 54            	srl	x
1519  007d 46            	rrc	a
1520  007e b7ff          	ld	_displayAppNavigate$L-1,a
1521  0080 bffe          	ld	_displayAppNavigate$L-2,x
1522                     ; 49 					parametersSet(PARAM_OSCIL_ZOOM,  woValue);
1524  0082 befe          	ld	x,_displayAppNavigate$L-2
1525  0084 bf01          	ld	_parametersSet$L+1,x
1526  0086 b6ff          	ld	a,_displayAppNavigate$L-1
1527  0088 b702          	ld	_parametersSet$L+2,a
1528  008a a60b          	ld	a,#11
1529  008c cd0000        	call	_parametersSet
1531                     ; 50 					woValueOffset = 32;
1533  008f a620          	ld	a,#32
1534  0091 b7fd          	ld	_displayAppNavigate$L-3,a
1535  0093 3ffc          	clr	_displayAppNavigate$L-4
1537  0095 2008          	jra	L3301
1538  0097               L7201:
1539                     ; 53 						woValueOffset *= 2; 
1541  0097 38fd          	sll	_displayAppNavigate$L-3
1542  0099 39fc          	rlc	_displayAppNavigate$L-4
1543                     ; 54 						woValue = woValue>>1;
1545  009b 34fe          	srl	_displayAppNavigate$L-2
1546  009d 36ff          	rrc	_displayAppNavigate$L-1
1547  009f               L3301:
1548                     ; 51 					while(woValue > 0x0000)
1550  009f b6ff          	ld	a,_displayAppNavigate$L-1
1551  00a1 bafe          	or	a,_displayAppNavigate$L-2
1552  00a3 26f2          	jrne	L7201
1553                     ; 57 					woValue = (parametersGetValue(PARAM_OSCIL_OFFSET) + woValueOffset)&(ENCODER_PULSES-1)&(ENCODER_PULSES-1);
1555  00a5 a60c          	ld	a,#12
1556  00a7 cd0000        	call	_parametersGetValue
1558  00aa bbfd          	add	a,_displayAppNavigate$L-3
1559  00ac 88            	push	a
1560  00ad 9f            	ld	a,x
1561  00ae b9fc          	adc	a,_displayAppNavigate$L-4
1562  00b0 97            	ld	x,a
1563  00b1 84            	pop	a
1564  00b2 a4ff          	and	a,#255
1565  00b4 88            	push	a
1566  00b5 9f            	ld	a,x
1567  00b6 a403          	and	a,#3
1568  00b8 97            	ld	x,a
1569  00b9 84            	pop	a
1570  00ba a4ff          	and	a,#255
1571  00bc 88            	push	a
1572  00bd 9f            	ld	a,x
1573  00be a403          	and	a,#3
1574  00c0 97            	ld	x,a
1575  00c1 84            	pop	a
1576  00c2 b7ff          	ld	_displayAppNavigate$L-1,a
1577  00c4 bffe          	ld	_displayAppNavigate$L-2,x
1578                     ; 58 					parametersSet(PARAM_OSCIL_OFFSET, woValue);
1580  00c6 befe          	ld	x,_displayAppNavigate$L-2
1581  00c8 bf01          	ld	_parametersSet$L+1,x
1582  00ca b6ff          	ld	a,_displayAppNavigate$L-1
1583  00cc b702          	ld	_parametersSet$L+2,a
1584  00ce a60c          	ld	a,#12
1585  00d0 cd0000        	call	_parametersSet
1587  00d3 cc0200        	jp	L7101
1588  00d6               L547:
1589                     ; 61 			case KEY_ZOOM_OUT:
1589                     ; 62 				if (parametersGetValue(PARAM_OSCIL_ZOOM)<16)  
1591  00d6 a60b          	ld	a,#11
1592  00d8 cd0000        	call	_parametersGetValue
1594  00db a010          	sub	a,#16
1595  00dd 9f            	ld	a,x
1596  00de a200          	sbc	a,#0
1597  00e0 2503          	jrult	L63
1598  00e2 cc0200        	jp	L7101
1599  00e5               L63:
1600                     ; 64 					woValue = parametersGetValue(PARAM_OSCIL_ZOOM)*2;
1602  00e5 a60b          	ld	a,#11
1603  00e7 cd0000        	call	_parametersGetValue
1605  00ea 48            	sll	a
1606  00eb 59            	rlc	x
1607  00ec b7ff          	ld	_displayAppNavigate$L-1,a
1608  00ee bffe          	ld	_displayAppNavigate$L-2,x
1609                     ; 65 					parametersSet(PARAM_OSCIL_ZOOM,  woValue);
1611  00f0 befe          	ld	x,_displayAppNavigate$L-2
1612  00f2 bf01          	ld	_parametersSet$L+1,x
1613  00f4 b6ff          	ld	a,_displayAppNavigate$L-1
1614  00f6 b702          	ld	_parametersSet$L+2,a
1615  00f8 a60b          	ld	a,#11
1616  00fa cd0000        	call	_parametersSet
1618                     ; 66 					woValueOffset = 16;
1620  00fd a610          	ld	a,#16
1621  00ff b7fd          	ld	_displayAppNavigate$L-3,a
1622  0101 3ffc          	clr	_displayAppNavigate$L-4
1624  0103 2008          	jra	L5401
1625  0105               L1401:
1626                     ; 69 						woValueOffset *= 2; 
1628  0105 38fd          	sll	_displayAppNavigate$L-3
1629  0107 39fc          	rlc	_displayAppNavigate$L-4
1630                     ; 70 						woValue = woValue>>1;
1632  0109 34fe          	srl	_displayAppNavigate$L-2
1633  010b 36ff          	rrc	_displayAppNavigate$L-1
1634  010d               L5401:
1635                     ; 67 					while(woValue > 0x0000)
1637  010d b6ff          	ld	a,_displayAppNavigate$L-1
1638  010f bafe          	or	a,_displayAppNavigate$L-2
1639  0111 26f2          	jrne	L1401
1640                     ; 73 					woValue = (ENCODER_PULSES+parametersGetValue(PARAM_OSCIL_OFFSET) - woValueOffset)&(ENCODER_PULSES-1);
1642  0113 a60c          	ld	a,#12
1643  0115 cd0000        	call	_parametersGetValue
1645  0118 ab00          	add	a,#0
1646  011a 88            	push	a
1647  011b 9f            	ld	a,x
1648  011c a904          	adc	a,#4
1649  011e 97            	ld	x,a
1650  011f 84            	pop	a
1651  0120 b0fd          	sub	a,_displayAppNavigate$L-3
1652  0122 88            	push	a
1653  0123 9f            	ld	a,x
1654  0124 b2fc          	sbc	a,_displayAppNavigate$L-4
1655  0126 97            	ld	x,a
1656  0127 84            	pop	a
1657  0128 a4ff          	and	a,#255
1658  012a 88            	push	a
1659  012b 9f            	ld	a,x
1660  012c a403          	and	a,#3
1661  012e 97            	ld	x,a
1662  012f 84            	pop	a
1663  0130 b7ff          	ld	_displayAppNavigate$L-1,a
1664  0132 bffe          	ld	_displayAppNavigate$L-2,x
1665                     ; 74 					parametersSet(PARAM_OSCIL_OFFSET, woValue);
1667  0134 befe          	ld	x,_displayAppNavigate$L-2
1668  0136 bf01          	ld	_parametersSet$L+1,x
1669  0138 b6ff          	ld	a,_displayAppNavigate$L-1
1670  013a b702          	ld	_parametersSet$L+2,a
1671  013c a60c          	ld	a,#12
1672  013e cd0000        	call	_parametersSet
1674  0141 cc0200        	jp	L7101
1675  0144               L747:
1676                     ; 77 			case KEY_GATE_LEFT:
1676                     ; 78 				woValue = (parametersGetValue(PARAM_OSCIL_OFFSET)+4*parametersGetValue(PARAM_OSCIL_ZOOM))&(ENCODER_PULSES-1);
1678  0144 a60b          	ld	a,#11
1679  0146 cd0000        	call	_parametersGetValue
1681  0149 48            	sll	a
1682  014a 59            	rlc	x
1683  014b 48            	sll	a
1684  014c 59            	rlc	x
1685  014d b7fa          	ld	_displayAppNavigate$L-6,a
1686  014f bff9          	ld	_displayAppNavigate$L-7,x
1687  0151 a60c          	ld	a,#12
1688  0153 cd0000        	call	_parametersGetValue
1690  0156 bbfa          	add	a,_displayAppNavigate$L-6
1691  0158 88            	push	a
1692  0159 9f            	ld	a,x
1693  015a b9f9          	adc	a,_displayAppNavigate$L-7
1694  015c 97            	ld	x,a
1695  015d 84            	pop	a
1696  015e a4ff          	and	a,#255
1697  0160 88            	push	a
1698  0161 9f            	ld	a,x
1699  0162 a403          	and	a,#3
1700  0164 97            	ld	x,a
1701  0165 84            	pop	a
1702  0166 b7ff          	ld	_displayAppNavigate$L-1,a
1703  0168 bffe          	ld	_displayAppNavigate$L-2,x
1704                     ; 79 				parametersSet(PARAM_OSCIL_OFFSET, woValue);			
1706  016a befe          	ld	x,_displayAppNavigate$L-2
1707  016c bf01          	ld	_parametersSet$L+1,x
1708  016e b6ff          	ld	a,_displayAppNavigate$L-1
1709  0170 b702          	ld	_parametersSet$L+2,a
1710  0172 a60c          	ld	a,#12
1711  0174 cd0000        	call	_parametersSet
1713                     ; 80 				break;
1715  0177 cc0200        	jp	L7101
1716  017a               L157:
1717                     ; 81 			case KEY_GATE_RIGHT:
1717                     ; 82 				woValue = (ENCODER_PULSES+parametersGetValue(PARAM_OSCIL_OFFSET)-4*parametersGetValue(PARAM_OSCIL_ZOOM))&(ENCODER_PULSES-1);
1719  017a a60b          	ld	a,#11
1720  017c cd0000        	call	_parametersGetValue
1722  017f 48            	sll	a
1723  0180 59            	rlc	x
1724  0181 48            	sll	a
1725  0182 59            	rlc	x
1726  0183 b7fa          	ld	_displayAppNavigate$L-6,a
1727  0185 bff9          	ld	_displayAppNavigate$L-7,x
1728  0187 a60c          	ld	a,#12
1729  0189 cd0000        	call	_parametersGetValue
1731  018c ab00          	add	a,#0
1732  018e 88            	push	a
1733  018f 9f            	ld	a,x
1734  0190 a904          	adc	a,#4
1735  0192 97            	ld	x,a
1736  0193 84            	pop	a
1737  0194 b0fa          	sub	a,_displayAppNavigate$L-6
1738  0196 88            	push	a
1739  0197 9f            	ld	a,x
1740  0198 b2f9          	sbc	a,_displayAppNavigate$L-7
1741  019a 97            	ld	x,a
1742  019b 84            	pop	a
1743  019c a4ff          	and	a,#255
1744  019e 88            	push	a
1745  019f 9f            	ld	a,x
1746  01a0 a403          	and	a,#3
1747  01a2 97            	ld	x,a
1748  01a3 84            	pop	a
1749  01a4 b7ff          	ld	_displayAppNavigate$L-1,a
1750  01a6 bffe          	ld	_displayAppNavigate$L-2,x
1751                     ; 83 				parametersSet(PARAM_OSCIL_OFFSET, woValue);			
1753  01a8 befe          	ld	x,_displayAppNavigate$L-2
1754  01aa bf01          	ld	_parametersSet$L+1,x
1755  01ac b6ff          	ld	a,_displayAppNavigate$L-1
1756  01ae b702          	ld	_parametersSet$L+2,a
1757  01b0 a60c          	ld	a,#12
1758  01b2 cd0000        	call	_parametersSet
1760                     ; 84 				break;
1762  01b5 2049          	jra	L7101
1763  01b7               L357:
1764                     ; 85 			case KEY_OFF:
1764                     ; 86 				displayOff();
1766  01b7 cd0000        	call	_displayOff
1768                     ; 87 				break;
1770  01ba 2044          	jra	L7101
1771  01bc               L557:
1772                     ; 88 			case KEY_PAUSE:
1772                     ; 89 				m_byPause != m_byPause;
1774                     ; 90 				break;
1776  01bc 2042          	jra	L7101
1777  01be               L757:
1778                     ; 91 			case KEY_CENTER:
1778                     ; 92 				screenBigMessage("Center", "");
1780  01be ae2d          	ld	x,#high(L3501)
1781  01c0 bf02          	ld	_screenBigMessage$L+2,x
1782  01c2 a62d          	ld	a,#low(L3501)
1783  01c4 b703          	ld	_screenBigMessage$L+3,a
1784  01c6 a62e          	ld	a,#low(L1501)
1785  01c8 ae2e          	ld	x,#high(L1501)
1786  01ca cd0000        	call	_screenBigMessage
1788                     ; 93 				break;
1790  01cd 2031          	jra	L7101
1791  01cf               L167:
1792                     ; 94 			case KEY_F1:
1792                     ; 95 				screenBigMessage("F1", "");
1794  01cf ae2d          	ld	x,#high(L3501)
1795  01d1 bf02          	ld	_screenBigMessage$L+2,x
1796  01d3 a62d          	ld	a,#low(L3501)
1797  01d5 b703          	ld	_screenBigMessage$L+3,a
1798  01d7 a62a          	ld	a,#low(L5501)
1799  01d9 ae2a          	ld	x,#high(L5501)
1800  01db cd0000        	call	_screenBigMessage
1802                     ; 96 				break;
1804  01de 2020          	jra	L7101
1805  01e0               L367:
1806                     ; 97 			case KEY_F2:
1806                     ; 98 				screenBigMessage("F2", "");
1808  01e0 ae2d          	ld	x,#high(L3501)
1809  01e2 bf02          	ld	_screenBigMessage$L+2,x
1810  01e4 a62d          	ld	a,#low(L3501)
1811  01e6 b703          	ld	_screenBigMessage$L+3,a
1812  01e8 a627          	ld	a,#low(L7501)
1813  01ea ae27          	ld	x,#high(L7501)
1814  01ec cd0000        	call	_screenBigMessage
1816                     ; 99 				break;
1818  01ef 200f          	jra	L7101
1819  01f1               L567:
1820                     ; 100 			case KEY_F3:
1820                     ; 101 				screenBigMessage("F3", "");
1822  01f1 ae2d          	ld	x,#high(L3501)
1823  01f3 bf02          	ld	_screenBigMessage$L+2,x
1824  01f5 a62d          	ld	a,#low(L3501)
1825  01f7 b703          	ld	_screenBigMessage$L+3,a
1826  01f9 a624          	ld	a,#low(L1601)
1827  01fb ae24          	ld	x,#high(L1601)
1828  01fd cd0000        	call	_screenBigMessage
1830                     ; 102 				break;
1832  0200               L767:
1833                     ; 103 			default:
1833                     ; 104 				break;
1835  0200               L3201:
1836  0200               L7101:
1837                     ; 107 }
1840  0200 81            	ret
1868                     ; 111 void displayAppLoop(void)
1868                     ; 112 {/*
1869                     	switch	.text
1870  0201               _displayAppLoop:
1873  0201               L3701:
1874                     ; 124 		if(!m_byPause)
1876  0201 c60000        	ld	a,_m_byPause
1877  0204 4d            	tnz	a
1878  0205 261d          	jrne	L7701
1879                     ; 126 			if (!displayIsKeyPress())
1881  0207 cd0000        	call	_displayIsKeyPress
1883  020a 4d            	tnz	a
1884  020b 2603          	jrne	L1011
1885                     ; 127 				scanningHeadSignalAcquireGate();
1887  020d cd0000        	call	_scanningHeadSignalAcquireGate
1889  0210               L1011:
1890                     ; 129 			if (!displayIsKeyPress())
1892  0210 cd0000        	call	_displayIsKeyPress
1894  0213 4d            	tnz	a
1895  0214 2603          	jrne	L3011
1896                     ; 130 				scanningHeadSignalAcquire();
1898  0216 cd0000        	call	_scanningHeadSignalAcquire
1900  0219               L3011:
1901                     ; 132 			if (!displayIsKeyPress())
1903  0219 cd0000        	call	_displayIsKeyPress
1905  021c 4d            	tnz	a
1906  021d 2605          	jrne	L7701
1907                     ; 133 				screenOscilloscope(PAGE_OSCILLOSCOPE);
1909  021f a605          	ld	a,#5
1910  0221 cd0000        	call	_screenOscilloscope
1912  0224               L7701:
1913                     ; 136 		displayAppNavigate();
1915  0224 cd001c        	call	_displayAppNavigate
1918  0227 20d8          	jra	L3701
1997                     	xdef	_displayAppNavigate
1998                     	switch	.bss
1999  0000               _m_byPause:
2000  0000 00            	ds.b	1
2001                     	xdef	_m_byPause
2002  0001               _m_bySelection:
2003  0001 00            	ds.b	1
2004                     	xdef	_m_bySelection
2005  0002               _m_byNextPage:
2006  0002 00            	ds.b	1
2007                     	xdef	_m_byNextPage
2008  0003               _m_woValue:
2009  0003 0000          	ds.b	2
2010                     	xdef	_m_woValue
2011  0005               _m_byAdditionalCode:
2012  0005 00            	ds.b	1
2013                     	xdef	_m_byAdditionalCode
2014  0006               _m_byCode:
2015  0006 00            	ds.b	1
2016                     	xdef	_m_byCode
2017                     	xref	_screenBigMessage
2018                     	xref	_screenOscilloscope
2019                     	xref	_screenInit
2020                     	xdef	_displayAppLoop
2021                     	xdef	_displayAppInit
2022                     	xref	_displayOff
2023                     	xref	_displayIsKeyPress
2024                     	xref	_isDisplayKeyPressed
2025                     	xref	_scanningHeadSignalAcquireGate
2026                     	xref	_scanningHeadSignalAcquire
2027                     	xref	_parametersSet
2028                     	xref	_parametersGetValue
2029                     	switch	.const
2030  0024               L1601:
2031  0024 463300        	dc.b	"F3",0
2032  0027               L7501:
2033  0027 463200        	dc.b	"F2",0
2034  002a               L5501:
2035  002a 463100        	dc.b	"F1",0
2036  002d               L3501:
2037  002d 00            	dc.b	0
2038  002e               L1501:
2039  002e 43656e746572  	dc.b	"Center",0
2059                     	xref.b	_screenBigMessage$L
2060                     	xref.b	_parametersSet$L
2061                     	end
