   1                     ; C Compiler for ST7 (COSMIC Software)
   2                     ; Generator V4.5.5 - 12 Jan 2006
1280                     .const:	section	.text
1281  0000               L327_mc_byApplicationVersion:
1282  0000 9d            	dc.b	157
1351                     ; 27 void SNI_Init(void)
1351                     ; 28 {
1352                     	switch	.text
1353  0000               _SNI_Init:
1356                     ; 31 	m_byCounter = 0x00;
1358  0000 4f            	clr	a
1359  0001 c7000c        	ld	_m_byCounter,a
1360                     ; 32 	m_lwoData	= 0x00000000;
1362  0004 a600          	ld	a,#0
1363  0006 c7000b        	ld	_m_lwoData+3,a
1364  0009 a600          	ld	a,#0
1365  000b c7000a        	ld	_m_lwoData+2,a
1366  000e a600          	ld	a,#0
1367  0010 c70009        	ld	_m_lwoData+1,a
1368  0013 a600          	ld	a,#0
1369  0015 c70008        	ld	_m_lwoData,a
1370                     ; 33 	m_lwoReceivedData = 0x00000000;
1372  0018 a600          	ld	a,#0
1373  001a c70007        	ld	_m_lwoReceivedData+3,a
1374  001d a600          	ld	a,#0
1375  001f c70006        	ld	_m_lwoReceivedData+2,a
1376  0022 a600          	ld	a,#0
1377  0024 c70005        	ld	_m_lwoReceivedData+1,a
1378  0027 a600          	ld	a,#0
1379  0029 c70004        	ld	_m_lwoReceivedData,a
1380                     ; 34 	m_byNumBitReceived = 0x00;
1382  002c 4f            	clr	a
1383  002d c70000        	ld	_m_byNumBitReceived,a
1384                     ; 35 	m_byPrevClockHI = false;
1386  0030 4f            	clr	a
1387  0031 c70001        	ld	_m_byPrevClockHI,a
1388                     ; 91 	m_byTimerLO = LOBYTE(parametersGetValue(PARAM_SNI_TIMER));
1390  0034 a643          	ld	a,#67
1391  0036 cd0000        	call	_parametersGetValue
1393  0039 c70003        	ld	_m_byTimerLO,a
1394                     ; 92 	m_byTimerHI = HIBYTE(parametersGetValue(PARAM_SNI_TIMER));
1396  003c a643          	ld	a,#67
1397  003e cd0000        	call	_parametersGetValue
1399  0041 9f            	ld	a,x
1400  0042 5f            	clr	x
1401  0043 a4ff          	and	a,#255
1402  0045 5f            	clr	x
1403  0046 c70002        	ld	_m_byTimerHI,a
1404                     ; 95 	ARTCAR = 0x00;
1406  0049 3f79          	clr	_ARTCAR
1407                     ; 98 	ARTARR = m_byTimerLO;
1409  004b c60003        	ld	a,_m_byTimerLO
1410  004e b77a          	ld	_ARTARR,a
1411                     ; 101 	if(parametersGetValue(PARAM_SNI_TIMER)>0)
1413  0050 a643          	ld	a,#67
1414  0052 cd0000        	call	_parametersGetValue
1416  0055 4d            	tnz	a
1417  0056 2601          	jrne	L6
1418  0058 5d            	tnz	x
1419  0059               L6:
1420  0059 2706          	jreq	L757
1421                     ; 110 		ARTCSR = 0b01101110; //Force reload, Internal timer enabled with prescaler = 64, IRQ enabled
1423  005b a66e          	ld	a,#110
1424  005d b778          	ld	_ARTCSR,a
1426  005f 2004          	jra	L167
1427  0061               L757:
1428                     ; 114 		ARTCSR = 0b01100110; //Timer disabled
1430  0061 a666          	ld	a,#102
1431  0063 b778          	ld	_ARTCSR,a
1432  0065               L167:
1433                     ; 117 }
1436  0065 81            	ret
1476                     ; 121 void SNI_Interrupt(void)
1476                     ; 122 {
1477                     	switch	.text
1478  0066               _SNI_Interrupt:
1480       00000101      OFST:	set	257
1481  0066 b601          	ld	a,c_x+1
1482  0068 88            	push	a
1483  0069 b600          	ld	a,c_x
1484  006b 88            	push	a
1485  006c 88            	push	a
1488                     ; 125 	byARTCSR = ARTCSR; //Reset the flag
1490  006d 96            	ld	x,s
1491  006e b678          	ld	a,_ARTCSR
1492  0070 d70101        	ld	(OFST+0,x),a
1493                     ; 126 	if(m_byCounter == m_byTimerHI)
1495  0073 c6000c        	ld	a,_m_byCounter
1496  0076 c10002        	cp	a,_m_byTimerHI
1497  0079 2703          	jreq	L21
1498  007b cc011d        	jp	L777
1499  007e               L21:
1500                     ; 129 		_switch(PGDR,4); 
1502  007e b612          	ld	a,_PGDR
1503  0080 a510          	bcp	a,#16
1504  0082 2704          	jreq	L1001
1507  0084 1912          	bres	_PGDR,#4
1509  0086 2002          	jra	L3001
1510  0088               L1001:
1513  0088 1812          	bset	_PGDR,#4
1514  008a               L3001:
1515                     ; 130 		m_byCounter = 0x00;
1518  008a 4f            	clr	a
1519  008b c7000c        	ld	_m_byCounter,a
1520                     ; 132 		if _btst(_Pa_SNI_Clk, _Pin_SNI_Clk)
1522  008e b60f          	ld	a,_PFDR
1523  0090 a520          	bcp	a,#32
1524  0092 2748          	jreq	L5001
1525                     ; 135 			if (!m_byPrevClockHI)
1527  0094 c60001        	ld	a,_m_byPrevClockHI
1528  0097 4d            	tnz	a
1529  0098 2623          	jrne	L7001
1530                     ; 138 				m_byNumBitReceived++;
1532  009a c60000        	ld	a,_m_byNumBitReceived
1533  009d ab01          	add	a,#1
1534  009f c70000        	ld	_m_byNumBitReceived,a
1535                     ; 141 				m_lwoData = (LWORD) m_lwoData << 1;
1537  00a2 ae08          	ld	x,#high(_m_lwoData)
1538  00a4 bf00          	ld	c_x,x
1539  00a6 ae08          	ld	x,#low(_m_lwoData)
1540  00a8 a601          	ld	a,#1
1541  00aa cd0000        	call	c_xlglsh
1543                     ; 142 				if _btst(_Pa_SNI_In, _Pin_SNI_In)
1545  00ad b60f          	ld	a,_PFDR
1546  00af a540          	bcp	a,#64
1547  00b1 2722          	jreq	L3101
1548                     ; 144 					_bset(m_lwoData, 0);
1550  00b3 c6000b        	ld	a,_m_lwoData+3
1551  00b6 aa01          	or	a,#1
1552  00b8 c7000b        	ld	_m_lwoData+3,a
1553  00bb 2018          	jra	L3101
1554  00bd               L7001:
1555                     ; 150 				m_byNumBitReceived = 0x00;
1557  00bd 4f            	clr	a
1558  00be c70000        	ld	_m_byNumBitReceived,a
1559                     ; 151 				m_lwoData = 0x00000000;
1561  00c1 a600          	ld	a,#0
1562  00c3 c7000b        	ld	_m_lwoData+3,a
1563  00c6 a600          	ld	a,#0
1564  00c8 c7000a        	ld	_m_lwoData+2,a
1565  00cb a600          	ld	a,#0
1566  00cd c70009        	ld	_m_lwoData+1,a
1567  00d0 a600          	ld	a,#0
1568  00d2 c70008        	ld	_m_lwoData,a
1569  00d5               L3101:
1570                     ; 153 			m_byPrevClockHI = true;
1572  00d5 a601          	ld	a,#1
1573  00d7 c70001        	ld	_m_byPrevClockHI,a
1575  00da 2041          	jra	L777
1576  00dc               L5001:
1577                     ; 158 			if (!m_byPrevClockHI)
1579  00dc c60001        	ld	a,_m_byPrevClockHI
1580  00df 4d            	tnz	a
1581  00e0 2637          	jrne	L7101
1582                     ; 163 				if (m_byNumBitReceived >= 24)
1584  00e2 c60000        	ld	a,_m_byNumBitReceived
1585  00e5 a118          	cp	a,#24
1586  00e7 2518          	jrult	L1201
1587                     ; 165 					m_lwoReceivedData = m_lwoData;
1589  00e9 c6000b        	ld	a,_m_lwoData+3
1590  00ec c70007        	ld	_m_lwoReceivedData+3,a
1591  00ef c6000a        	ld	a,_m_lwoData+2
1592  00f2 c70006        	ld	_m_lwoReceivedData+2,a
1593  00f5 c60009        	ld	a,_m_lwoData+1
1594  00f8 c70005        	ld	_m_lwoReceivedData+1,a
1595  00fb c60008        	ld	a,_m_lwoData
1596  00fe c70004        	ld	_m_lwoReceivedData,a
1597  0101               L1201:
1598                     ; 168 				m_byNumBitReceived = 0x00;
1600  0101 4f            	clr	a
1601  0102 c70000        	ld	_m_byNumBitReceived,a
1602                     ; 169 				m_lwoData = 0x00000000;
1604  0105 a600          	ld	a,#0
1605  0107 c7000b        	ld	_m_lwoData+3,a
1606  010a a600          	ld	a,#0
1607  010c c7000a        	ld	_m_lwoData+2,a
1608  010f a600          	ld	a,#0
1609  0111 c70009        	ld	_m_lwoData+1,a
1610  0114 a600          	ld	a,#0
1611  0116 c70008        	ld	_m_lwoData,a
1612  0119               L7101:
1613                     ; 171 			m_byPrevClockHI = false;
1615  0119 4f            	clr	a
1616  011a c70001        	ld	_m_byPrevClockHI,a
1617  011d               L777:
1618                     ; 174 	m_byCounter++;
1620  011d c6000c        	ld	a,_m_byCounter
1621  0120 ab01          	add	a,#1
1622  0122 c7000c        	ld	_m_byCounter,a
1623                     ; 199 }
1626  0125 84            	pop	a
1627  0126 84            	pop	a
1628  0127 b700          	ld	c_x,a
1629  0129 84            	pop	a
1630  012a b701          	ld	c_x+1,a
1631  012c 80            	iret
1656                     	switch	.const
1657  0001               L61:
1658  0001 00f00000      	dc.l	15728640
1659  0005               L02:
1660  0005 00100000      	dc.l	1048576
1661  0009               L22:
1662  0009 000fffff      	dc.l	1048575
1663  000d               L42:
1664  000d 00ffffff      	dc.l	16777215
1665  0011               L62:
1666  0011 00200000      	dc.l	2097152
1667  0015               L03:
1668  0015 00200001      	dc.l	2097153
1669                     ; 203 BYTE SNI_ReceivedCmd(void)
1669                     ; 204 {
1670                     	switch	.text
1671  012d               _SNI_ReceivedCmd:
1674                     ; 205 	if ((m_lwoReceivedData & SNI_MASK_FUNZ_CYLINDER_TRAVEL) == SNI_FUNZ_CYLINDER_TRAVEL)
1676  012d ae04          	ld	x,#high(_m_lwoReceivedData)
1677  012f bf00          	ld	c_x,x
1678  0131 ae04          	ld	x,#low(_m_lwoReceivedData)
1679  0133 cd0000        	call	c_xltor
1681  0136 ae01          	ld	x,#high(L61)
1682  0138 bf00          	ld	c_x,x
1683  013a ae01          	ld	x,#low(L61)
1684  013c cd0000        	call	c_xland
1686  013f ae05          	ld	x,#high(L02)
1687  0141 bf00          	ld	c_x,x
1688  0143 ae05          	ld	x,#low(L02)
1689  0145 cd0000        	call	c_xlcmp
1691  0148 2639          	jrne	L3301
1692                     ; 207 		parametersSet(PARAM_CYLINDER_TRAVEL, BCDtoHEX(m_lwoReceivedData & SNI_PARAM_CYLINDER_TRAVEL));
1694  014a ae04          	ld	x,#high(_m_lwoReceivedData)
1695  014c bf00          	ld	c_x,x
1696  014e ae04          	ld	x,#low(_m_lwoReceivedData)
1697  0150 cd0000        	call	c_xltor
1699  0153 ae09          	ld	x,#high(L22)
1700  0155 bf00          	ld	c_x,x
1701  0157 ae09          	ld	x,#low(L22)
1702  0159 cd0000        	call	c_xland
1704  015c ae00          	ld	x,#_BCDtoHEX$L
1705  015e cd0000        	call	c_rtol
1707  0161 cd0000        	call	_BCDtoHEX
1709  0164 b702          	ld	_parametersSet$L+2,a
1710  0166 bf01          	ld	_parametersSet$L+1,x
1711  0168 a601          	ld	a,#1
1712  016a cd0000        	call	_parametersSet
1714                     ; 208 		m_lwoReceivedData = 0x00000000;
1716  016d a600          	ld	a,#0
1717  016f c70007        	ld	_m_lwoReceivedData+3,a
1718  0172 a600          	ld	a,#0
1719  0174 c70006        	ld	_m_lwoReceivedData+2,a
1720  0177 a600          	ld	a,#0
1721  0179 c70005        	ld	_m_lwoReceivedData+1,a
1722  017c a600          	ld	a,#0
1723  017e c70004        	ld	_m_lwoReceivedData,a
1725  0181 2068          	jra	L5301
1726  0183               L3301:
1727                     ; 210 	else if((m_lwoReceivedData & SNI_MASK_FUNZ_PHASE_FAST) == SNI_FUNZ_PHASE_FAST)
1729  0183 ae04          	ld	x,#high(_m_lwoReceivedData)
1730  0185 bf00          	ld	c_x,x
1731  0187 ae04          	ld	x,#low(_m_lwoReceivedData)
1732  0189 cd0000        	call	c_xltor
1734  018c ae0d          	ld	x,#high(L42)
1735  018e bf00          	ld	c_x,x
1736  0190 ae0d          	ld	x,#low(L42)
1737  0192 cd0000        	call	c_xland
1739  0195 ae11          	ld	x,#high(L62)
1740  0197 bf00          	ld	c_x,x
1741  0199 ae11          	ld	x,#low(L62)
1742  019b cd0000        	call	c_xlcmp
1744  019e 2617          	jrne	L7301
1745                     ; 212 		m_lwoReceivedData = 0x00000000;
1747  01a0 a600          	ld	a,#0
1748  01a2 c70007        	ld	_m_lwoReceivedData+3,a
1749  01a5 a600          	ld	a,#0
1750  01a7 c70006        	ld	_m_lwoReceivedData+2,a
1751  01aa a600          	ld	a,#0
1752  01ac c70005        	ld	_m_lwoReceivedData+1,a
1753  01af a600          	ld	a,#0
1754  01b1 c70004        	ld	_m_lwoReceivedData,a
1755                     ; 213 		return PAGE_PHASE_FAST;
1757  01b4 a607          	ld	a,#7
1760  01b6 81            	ret
1761  01b7               L7301:
1762                     ; 215 	else if((m_lwoReceivedData & SNI_MASK_FUNZ_TEST_OUTPUT) == SNI_FUNZ_TEST_OUTPUT) 
1764  01b7 ae04          	ld	x,#high(_m_lwoReceivedData)
1765  01b9 bf00          	ld	c_x,x
1766  01bb ae04          	ld	x,#low(_m_lwoReceivedData)
1767  01bd cd0000        	call	c_xltor
1769  01c0 ae0d          	ld	x,#high(L42)
1770  01c2 bf00          	ld	c_x,x
1771  01c4 ae0d          	ld	x,#low(L42)
1772  01c6 cd0000        	call	c_xland
1774  01c9 ae15          	ld	x,#high(L03)
1775  01cb bf00          	ld	c_x,x
1776  01cd ae15          	ld	x,#low(L03)
1777  01cf cd0000        	call	c_xlcmp
1779  01d2 2617          	jrne	L5301
1780                     ; 217 		m_lwoReceivedData = 0x00000000;
1782  01d4 a600          	ld	a,#0
1783  01d6 c70007        	ld	_m_lwoReceivedData+3,a
1784  01d9 a600          	ld	a,#0
1785  01db c70006        	ld	_m_lwoReceivedData+2,a
1786  01de a600          	ld	a,#0
1787  01e0 c70005        	ld	_m_lwoReceivedData+1,a
1788  01e3 a600          	ld	a,#0
1789  01e5 c70004        	ld	_m_lwoReceivedData,a
1790                     ; 218 		return PAGE_EXECUTE_T3;
1792  01e8 a6d1          	ld	a,#209
1795  01ea 81            	ret
1796  01eb               L5301:
1797                     ; 221 	return PAGE_NONE;
1799  01eb 4f            	clr	a
1802  01ec 81            	ret
1825                     ; 227 void SNI_ResetData(void)
1825                     ; 228 {
1826                     	switch	.text
1827  01ed               _SNI_ResetData:
1830                     ; 229 	m_lwoReceivedData = 0x00000000;
1832  01ed a600          	ld	a,#0
1833  01ef c70007        	ld	_m_lwoReceivedData+3,a
1834  01f2 a600          	ld	a,#0
1835  01f4 c70006        	ld	_m_lwoReceivedData+2,a
1836  01f7 a600          	ld	a,#0
1837  01f9 c70005        	ld	_m_lwoReceivedData+1,a
1838  01fc a600          	ld	a,#0
1839  01fe c70004        	ld	_m_lwoReceivedData,a
1840                     ; 230 }
1843  0201 81            	ret
1948                     	xdef	_SNI_Interrupt
1949                     	switch	.bss
1950  0000               _m_byNumBitReceived:
1951  0000 00            	ds.b	1
1952                     	xdef	_m_byNumBitReceived
1953  0001               _m_byPrevClockHI:
1954  0001 00            	ds.b	1
1955                     	xdef	_m_byPrevClockHI
1956  0002               _m_byTimerHI:
1957  0002 00            	ds.b	1
1958                     	xdef	_m_byTimerHI
1959  0003               _m_byTimerLO:
1960  0003 00            	ds.b	1
1961                     	xdef	_m_byTimerLO
1962  0004               _m_lwoReceivedData:
1963  0004 00000000      	ds.b	4
1964                     	xdef	_m_lwoReceivedData
1965  0008               _m_lwoData:
1966  0008 00000000      	ds.b	4
1967                     	xdef	_m_lwoData
1968  000c               _m_byCounter:
1969  000c 00            	ds.b	1
1970                     	xdef	_m_byCounter
1971  000d               _m_bySNIIndexValue:
1972  000d 00            	ds.b	1
1973                     	xdef	_m_bySNIIndexValue
1974  000e               _m_arbySNIValues:
1975  000e 000000000000  	ds.b	20
1976                     	xdef	_m_arbySNIValues
1977  0022               _m_woSNITimeout:
1978  0022 0000          	ds.b	2
1979                     	xdef	_m_woSNITimeout
1980                     	xdef	_SNI_ReceivedCmd
1981                     	xdef	_SNI_ResetData
1982                     	xdef	_SNI_Init
1983                     	xref	_BCDtoHEX
1984                     	xref	_parametersSet
1985                     	xref	_parametersGetValue
1986                     	xref.b	c_x
2006                     	xref	c_rtol
2007                     	xref	c_xlcmp
2008                     	xref	c_xland
2009                     	xref	c_xltor
2010                     	xref	c_xlglsh
2011                     	xref.b	_parametersSet$L
2012                     	xref.b	_BCDtoHEX$L
2013                     	end
