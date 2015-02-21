   1                     ; C Compiler for ST7 (COSMIC Software)
   2                     ; Generator V4.5.5 - 12 Jan 2006
1280                     	switch	.data
1281  0000               _m_arbyTimeouts:
1282  0000 00            	dc.b	0
1283  0001 00            	dc.b	0
1284  0002 00            	dc.b	0
1285  0003 00            	dc.b	0
1286  0004 00            	dc.b	0
1287  0005 00            	dc.b	0
1288  0006 00            	dc.b	0
1289  0007 00            	dc.b	0
1290  0008               _m_byTimersFlag:
1291  0008 00            	dc.b	0
1292  0009               _m_byTenMilliSeconds:
1293  0009 00            	dc.b	0
1336                     ; 16 void timersWaitTimeout(BYTE a_byIndex)
1336                     ; 17 {
1337                     	switch	.text
1339                     	xref.b	_timersWaitTimeout$L
1340  0000               _timersWaitTimeout:
1342  0000 b700          	ld	_timersWaitTimeout$L,a
1344  0002 2001          	jra	L157
1345  0004               L747:
1346                     ; 21 		Nop();
1349  0004 9d            nop
1351  0005               L157:
1352                     ; 18 	while(m_arbyTimeouts[a_byIndex] > 0x00)
1354  0005 be00          	ld	x,_timersWaitTimeout$L
1355  0007 d60000        	ld	a,(_m_arbyTimeouts,x)
1356  000a 4d            	tnz	a
1357  000b 26f7          	jrne	L747
1358                     ; 23 	timersReset(a_byIndex);
1360  000d b600          	ld	a,_timersWaitTimeout$L
1361  000f ad01          	call	_timersReset
1363                     ; 24 }
1366  0011 81            	ret
1401                     ; 27 void timersReset(BYTE a_byIndex)
1401                     ; 28 {
1402                     	switch	.text
1404                     	xref.b	_timersReset$L
1405  0012               _timersReset:
1407  0012 b700          	ld	_timersReset$L,a
1409                     ; 29 	m_arbyTimeouts[a_byIndex] = 0x00;
1411  0014 97            	ld	x,a
1412  0015 4f            	clr	a
1413  0016 d70000        	ld	(_m_arbyTimeouts,x),a
1414                     ; 30 	_bres(m_byTimersFlag, a_byIndex);
1416  0019 a601          	ld	a,#1
1417  001b be00          	ld	x,_timersReset$L
1418  001d 5d            	tnz	x
1419  001e 2704          	jreq	L01
1420  0020               L21:
1421  0020 48            	sll	a
1422  0021 5a            	dec	x
1423  0022 26fc          	jrne	L21
1424  0024               L01:
1425  0024 43            	cpl	a
1426  0025 c40008        	and	a,_m_byTimersFlag
1427  0028 c70008        	ld	_m_byTimersFlag,a
1428                     ; 31 }
1431  002b 81            	ret
1475                     ; 34 void timersSet(BYTE a_byIndex, BYTE a_byTimeoutValue)
1475                     ; 35 {
1476                     	switch	.text
1478                     	xref.b	_timersSet$L
1479  002c               _timersSet:
1481  002c b701          	ld	_timersSet$L+1,a
1482  002e bf00          	ld	_timersSet$L,x
1484                     ; 37 	m_arbyTimeouts[a_byIndex] = a_byTimeoutValue;
1486  0030 d70000        	ld	(_m_arbyTimeouts,x),a
1487                     ; 38 	_bres(m_byTimersFlag, a_byIndex);
1489  0033 a601          	ld	a,#1
1490  0035 be00          	ld	x,_timersSet$L
1491  0037 5d            	tnz	x
1492  0038 2704          	jreq	L61
1493  003a               L02:
1494  003a 48            	sll	a
1495  003b 5a            	dec	x
1496  003c 26fc          	jrne	L02
1497  003e               L61:
1498  003e 43            	cpl	a
1499  003f c40008        	and	a,_m_byTimersFlag
1500  0042 c70008        	ld	_m_byTimersFlag,a
1501                     ; 39 }
1504  0045 81            	ret
1540                     ; 42 void timersUpdate(void)
1540                     ; 43 {
1541                     	switch	.text
1543                     	xref.b	_timersUpdate$L
1544  0046               _timersUpdate:
1547                     ; 44 	BYTE byIndex = 0x08;
1549  0046 a608          	ld	a,#8
1550  0048 b7ff          	ld	_timersUpdate$L-1,a
1551                     ; 46 	m_byTenMilliSeconds++;
1553  004a c60009        	ld	a,_m_byTenMilliSeconds
1554  004d ab01          	add	a,#1
1555  004f c70009        	ld	_m_byTenMilliSeconds,a
1557  0052 2065          	jra	L5301
1558  0054               L3301:
1559                     ; 50 		if (byIndex<0x03) 
1561  0054 b6ff          	ld	a,_timersUpdate$L-1
1562  0056 a103          	cp	a,#3
1563  0058 242d          	jruge	L1401
1564                     ; 53 			if(m_arbyTimeouts[byIndex] > 0x00)
1566  005a beff          	ld	x,_timersUpdate$L-1
1567  005c d60000        	ld	a,(_m_arbyTimeouts,x)
1568  005f 4d            	tnz	a
1569  0060 2757          	jreq	L5301
1570                     ; 55 				m_arbyTimeouts[byIndex]--;
1572  0062 beff          	ld	x,_timersUpdate$L-1
1573  0064 d60000        	ld	a,(_m_arbyTimeouts,x)
1574  0067 a001          	sub	a,#1
1575  0069 d70000        	ld	(_m_arbyTimeouts,x),a
1576                     ; 56 				if(m_arbyTimeouts[byIndex] == 0x00)
1578  006c beff          	ld	x,_timersUpdate$L-1
1579  006e d60000        	ld	a,(_m_arbyTimeouts,x)
1580  0071 4d            	tnz	a
1581  0072 2645          	jrne	L5301
1582                     ; 58 					_bset(m_byTimersFlag, byIndex);
1584  0074 a601          	ld	a,#1
1585  0076 beff          	ld	x,_timersUpdate$L-1
1586  0078 5d            	tnz	x
1587  0079 2704          	jreq	L42
1588  007b               L62:
1589  007b 48            	sll	a
1590  007c 5a            	dec	x
1591  007d 26fc          	jrne	L62
1592  007f               L42:
1593  007f ca0008        	or	a,_m_byTimersFlag
1594  0082 c70008        	ld	_m_byTimersFlag,a
1595  0085 2032          	jra	L5301
1596  0087               L1401:
1597                     ; 65 			if (m_byTenMilliSeconds == 100)
1599  0087 c60009        	ld	a,_m_byTenMilliSeconds
1600  008a a164          	cp	a,#100
1601  008c 262b          	jrne	L5301
1602                     ; 67 				if(m_arbyTimeouts[byIndex] > 0x00)
1604  008e beff          	ld	x,_timersUpdate$L-1
1605  0090 d60000        	ld	a,(_m_arbyTimeouts,x)
1606  0093 4d            	tnz	a
1607  0094 2723          	jreq	L5301
1608                     ; 69 					m_arbyTimeouts[byIndex]--;
1610  0096 beff          	ld	x,_timersUpdate$L-1
1611  0098 d60000        	ld	a,(_m_arbyTimeouts,x)
1612  009b a001          	sub	a,#1
1613  009d d70000        	ld	(_m_arbyTimeouts,x),a
1614                     ; 70 					if(m_arbyTimeouts[byIndex] == 0x00)
1616  00a0 beff          	ld	x,_timersUpdate$L-1
1617  00a2 d60000        	ld	a,(_m_arbyTimeouts,x)
1618  00a5 4d            	tnz	a
1619  00a6 2611          	jrne	L5301
1620                     ; 72 						_bset(m_byTimersFlag, byIndex);
1622  00a8 a601          	ld	a,#1
1623  00aa beff          	ld	x,_timersUpdate$L-1
1624  00ac 5d            	tnz	x
1625  00ad 2704          	jreq	L03
1626  00af               L23:
1627  00af 48            	sll	a
1628  00b0 5a            	dec	x
1629  00b1 26fc          	jrne	L23
1630  00b3               L03:
1631  00b3 ca0008        	or	a,_m_byTimersFlag
1632  00b6 c70008        	ld	_m_byTimersFlag,a
1633  00b9               L5301:
1634                     ; 48 	while((byIndex--)>0x00)
1636  00b9 b6ff          	ld	a,_timersUpdate$L-1
1637  00bb 3aff          	dec	_timersUpdate$L-1
1638  00bd 4d            	tnz	a
1639  00be 2694          	jrne	L3301
1640                     ; 78 	if (m_byTenMilliSeconds == 100)
1642  00c0 c60009        	ld	a,_m_byTenMilliSeconds
1643  00c3 a164          	cp	a,#100
1644  00c5 2604          	jrne	L7501
1645                     ; 80 		m_byTenMilliSeconds = 0x00;
1647  00c7 4f            	clr	a
1648  00c8 c70009        	ld	_m_byTenMilliSeconds,a
1649  00cb               L7501:
1650                     ; 83 }
1653  00cb 81            	ret
1677                     ; 86 void timersInit(void)
1677                     ; 87 {
1678                     	switch	.text
1679  00cc               _timersInit:
1682                     ; 99 	TBCR1 = 0x40; 	//Output Compare Interrupt Enable
1684  00cc a640          	ld	a,#64
1685  00ce b742          	ld	_TBCR1,a
1686                     ; 117 	TBCR2 = 0x08;	//fcpu/8
1688  00d0 a608          	ld	a,#8
1689  00d2 b741          	ld	_TBCR2,a
1690                     ; 119 }
1693  00d4 81            	ret
1732                     ; 123 void timersTicIRQ()
1732                     ; 124 {  
1733                     	switch	.text
1735                     	xref.b	_timersTicIRQ$L
1736  00d5               _timersTicIRQ:
1738  00d5 9089          	push	y
1739  00d7 b600          	ld	a,c_x
1740  00d9 b700          	ld	_timersTicIRQ$L+0,a
1741  00db b601          	ld	a,c_x+1
1742  00dd b701          	ld	_timersTicIRQ$L+1,a
1743  00df b600          	ld	a,c_y
1744  00e1 b702          	ld	_timersTicIRQ$L+2,a
1745  00e3 b601          	ld	a,c_y+1
1746  00e5 b703          	ld	_timersTicIRQ$L+3,a
1748                     ; 127 	byTemp = TBSR;	
1750  00e7 b643          	ld	a,_TBSR
1751  00e9 b7ff          	ld	_timersTicIRQ$L-1,a
1752                     ; 128 	if (byTemp & 0x40) // if OCF1 flag
1754  00eb b6ff          	ld	a,_timersTicIRQ$L-1
1755  00ed a540          	bcp	a,#64
1756  00ef 2713          	jreq	L7011
1757                     ; 130 		byTemp 	= TBOC1LR;				//Clears OCF1 flag.
1759  00f1 b647          	ld	a,_TBOC1LR
1760  00f3 b7ff          	ld	_timersTicIRQ$L-1,a
1761                     ; 133 		TBCR = 0x0000;
1763  00f5 3f48          	clr	_TBCR
1764  00f7 3f49          	clr	_TBCR+1
1765                     ; 136 		TBOC1HR = HIBYTE(TIMERS_B_TIMEOUT);
1767  00f9 a60a          	ld	a,#10
1768  00fb b746          	ld	_TBOC1HR,a
1769                     ; 137 		TBOC1LR = LOBYTE(TIMERS_B_TIMEOUT);
1771  00fd a668          	ld	a,#104
1772  00ff b747          	ld	_TBOC1LR,a
1773                     ; 140 		timersUpdate();
1775  0101 cd0046        	call	_timersUpdate
1777  0104               L7011:
1778                     ; 144 	byTemp = TBOC2LR;
1780  0104 b64f          	ld	a,_TBOC2LR
1781  0106 b7ff          	ld	_timersTicIRQ$L-1,a
1782                     ; 145 }
1785  0108 b600          	ld	a,_timersTicIRQ$L+0
1786  010a b700          	ld	c_x,a
1787  010c b601          	ld	a,_timersTicIRQ$L+1
1788  010e b701          	ld	c_x+1,a
1789  0110 b602          	ld	a,_timersTicIRQ$L+2
1790  0112 b700          	ld	c_y,a
1791  0114 b603          	ld	a,_timersTicIRQ$L+3
1792  0116 b701          	ld	c_y+1,a
1793  0118 9085          	pop	y
1794  011a 80            	iret
1837                     	xdef	_timersUpdate
1838                     	xdef	_m_byTenMilliSeconds
1839                     	xdef	_m_arbyTimeouts
1840                     	xdef	_timersWaitTimeout
1841                     	xdef	_timersReset
1842                     	xdef	_timersSet
1843                     	xdef	_timersTicIRQ
1844                     	xdef	_timersInit
1845                     	xdef	_m_byTimersFlag
1846                     	xref.b	c_x
1847                     	xref.b	c_y
1866                     	end
