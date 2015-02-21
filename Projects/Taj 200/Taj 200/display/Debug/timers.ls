   1                     ; C Compiler for ST7 (COSMIC Software)
   2                     ; Generator V4.5.5 - 12 Jan 2006
1280                     .const:	section	.text
1281  0000               L327_mc_byApplicationVersion:
1282  0000 9d            	dc.b	157
1313                     	switch	.data
1314  0000               _m_arbyTimeouts:
1315  0000 00            	dc.b	0
1316  0001 00            	dc.b	0
1317  0002 00            	dc.b	0
1318  0003 00            	dc.b	0
1319  0004 00            	dc.b	0
1320  0005 00            	dc.b	0
1321  0006 00            	dc.b	0
1322  0007 00            	dc.b	0
1323  0008               _m_byTimersFlag:
1324  0008 00            	dc.b	0
1325  0009               _m_byTenMilliSeconds:
1326  0009 00            	dc.b	0
1369                     ; 16 void timersWaitTimeout(BYTE a_byIndex)
1369                     ; 17 {
1370                     	switch	.text
1372                     	xref.b	_timersWaitTimeout$L
1373  0000               _timersWaitTimeout:
1375  0000 b700          	ld	_timersWaitTimeout$L,a
1377  0002 2001          	jra	L767
1378  0004               L567:
1379                     ; 21 		Nop();
1382  0004 9d            nop
1384  0005               L767:
1385                     ; 18 	while(m_arbyTimeouts[a_byIndex] > 0x00)
1387  0005 be00          	ld	x,_timersWaitTimeout$L
1388  0007 d60000        	ld	a,(_m_arbyTimeouts,x)
1389  000a 4d            	tnz	a
1390  000b 26f7          	jrne	L567
1391                     ; 23 	timersReset(a_byIndex);
1393  000d b600          	ld	a,_timersWaitTimeout$L
1394  000f ad01          	call	_timersReset
1396                     ; 24 }
1399  0011 81            	ret
1434                     ; 27 void timersReset(BYTE a_byIndex)
1434                     ; 28 {
1435                     	switch	.text
1437                     	xref.b	_timersReset$L
1438  0012               _timersReset:
1440  0012 b700          	ld	_timersReset$L,a
1442                     ; 29 	m_arbyTimeouts[a_byIndex] = 0x00;
1444  0014 97            	ld	x,a
1445  0015 4f            	clr	a
1446  0016 d70000        	ld	(_m_arbyTimeouts,x),a
1447                     ; 30 	_bres(m_byTimersFlag, a_byIndex);
1449  0019 a601          	ld	a,#1
1450  001b be00          	ld	x,_timersReset$L
1451  001d 5d            	tnz	x
1452  001e 2704          	jreq	L01
1453  0020               L21:
1454  0020 48            	sll	a
1455  0021 5a            	dec	x
1456  0022 26fc          	jrne	L21
1457  0024               L01:
1458  0024 43            	cpl	a
1459  0025 c40008        	and	a,_m_byTimersFlag
1460  0028 c70008        	ld	_m_byTimersFlag,a
1461                     ; 31 }
1464  002b 81            	ret
1508                     ; 34 void timersSet(BYTE a_byIndex, BYTE a_byTimeoutValue)
1508                     ; 35 {
1509                     	switch	.text
1511                     	xref.b	_timersSet$L
1512  002c               _timersSet:
1514  002c b701          	ld	_timersSet$L+1,a
1515  002e bf00          	ld	_timersSet$L,x
1517                     ; 37 	m_arbyTimeouts[a_byIndex] = a_byTimeoutValue;
1519  0030 d70000        	ld	(_m_arbyTimeouts,x),a
1520                     ; 38 	_bres(m_byTimersFlag, a_byIndex);
1522  0033 a601          	ld	a,#1
1523  0035 be00          	ld	x,_timersSet$L
1524  0037 5d            	tnz	x
1525  0038 2704          	jreq	L61
1526  003a               L02:
1527  003a 48            	sll	a
1528  003b 5a            	dec	x
1529  003c 26fc          	jrne	L02
1530  003e               L61:
1531  003e 43            	cpl	a
1532  003f c40008        	and	a,_m_byTimersFlag
1533  0042 c70008        	ld	_m_byTimersFlag,a
1534                     ; 39 }
1537  0045 81            	ret
1573                     ; 42 void timersUpdate(void)
1573                     ; 43 {
1574                     	switch	.text
1576                     	xref.b	_timersUpdate$L
1577  0046               _timersUpdate:
1580                     ; 44 	BYTE byIndex = 0x08;
1582  0046 a608          	ld	a,#8
1583  0048 b7ff          	ld	_timersUpdate$L-1,a
1584                     ; 46 	m_byTenMilliSeconds++;
1586  004a c60009        	ld	a,_m_byTenMilliSeconds
1587  004d ab01          	add	a,#1
1588  004f c70009        	ld	_m_byTenMilliSeconds,a
1590  0052 2065          	jra	L3501
1591  0054               L1501:
1592                     ; 50 		if (byIndex<0x03) 
1594  0054 b6ff          	ld	a,_timersUpdate$L-1
1595  0056 a103          	cp	a,#3
1596  0058 242d          	jruge	L7501
1597                     ; 53 			if(m_arbyTimeouts[byIndex] > 0x00)
1599  005a beff          	ld	x,_timersUpdate$L-1
1600  005c d60000        	ld	a,(_m_arbyTimeouts,x)
1601  005f 4d            	tnz	a
1602  0060 2757          	jreq	L3501
1603                     ; 55 				m_arbyTimeouts[byIndex]--;
1605  0062 beff          	ld	x,_timersUpdate$L-1
1606  0064 d60000        	ld	a,(_m_arbyTimeouts,x)
1607  0067 a001          	sub	a,#1
1608  0069 d70000        	ld	(_m_arbyTimeouts,x),a
1609                     ; 56 				if(m_arbyTimeouts[byIndex] == 0x00)
1611  006c beff          	ld	x,_timersUpdate$L-1
1612  006e d60000        	ld	a,(_m_arbyTimeouts,x)
1613  0071 4d            	tnz	a
1614  0072 2645          	jrne	L3501
1615                     ; 58 					_bset(m_byTimersFlag, byIndex);
1617  0074 a601          	ld	a,#1
1618  0076 beff          	ld	x,_timersUpdate$L-1
1619  0078 5d            	tnz	x
1620  0079 2704          	jreq	L42
1621  007b               L62:
1622  007b 48            	sll	a
1623  007c 5a            	dec	x
1624  007d 26fc          	jrne	L62
1625  007f               L42:
1626  007f ca0008        	or	a,_m_byTimersFlag
1627  0082 c70008        	ld	_m_byTimersFlag,a
1628  0085 2032          	jra	L3501
1629  0087               L7501:
1630                     ; 65 			if (m_byTenMilliSeconds == 100)
1632  0087 c60009        	ld	a,_m_byTenMilliSeconds
1633  008a a164          	cp	a,#100
1634  008c 262b          	jrne	L3501
1635                     ; 67 				if(m_arbyTimeouts[byIndex] > 0x00)
1637  008e beff          	ld	x,_timersUpdate$L-1
1638  0090 d60000        	ld	a,(_m_arbyTimeouts,x)
1639  0093 4d            	tnz	a
1640  0094 2723          	jreq	L3501
1641                     ; 69 					m_arbyTimeouts[byIndex]--;
1643  0096 beff          	ld	x,_timersUpdate$L-1
1644  0098 d60000        	ld	a,(_m_arbyTimeouts,x)
1645  009b a001          	sub	a,#1
1646  009d d70000        	ld	(_m_arbyTimeouts,x),a
1647                     ; 70 					if(m_arbyTimeouts[byIndex] == 0x00)
1649  00a0 beff          	ld	x,_timersUpdate$L-1
1650  00a2 d60000        	ld	a,(_m_arbyTimeouts,x)
1651  00a5 4d            	tnz	a
1652  00a6 2611          	jrne	L3501
1653                     ; 72 						_bset(m_byTimersFlag, byIndex);
1655  00a8 a601          	ld	a,#1
1656  00aa beff          	ld	x,_timersUpdate$L-1
1657  00ac 5d            	tnz	x
1658  00ad 2704          	jreq	L03
1659  00af               L23:
1660  00af 48            	sll	a
1661  00b0 5a            	dec	x
1662  00b1 26fc          	jrne	L23
1663  00b3               L03:
1664  00b3 ca0008        	or	a,_m_byTimersFlag
1665  00b6 c70008        	ld	_m_byTimersFlag,a
1666  00b9               L3501:
1667                     ; 48 	while((byIndex--)>0x00)
1669  00b9 b6ff          	ld	a,_timersUpdate$L-1
1670  00bb 3aff          	dec	_timersUpdate$L-1
1671  00bd 4d            	tnz	a
1672  00be 2694          	jrne	L1501
1673                     ; 78 	if (m_byTenMilliSeconds == 100)
1675  00c0 c60009        	ld	a,_m_byTenMilliSeconds
1676  00c3 a164          	cp	a,#100
1677  00c5 2604          	jrne	L5701
1678                     ; 80 		m_byTenMilliSeconds = 0x00;
1680  00c7 4f            	clr	a
1681  00c8 c70009        	ld	_m_byTenMilliSeconds,a
1682  00cb               L5701:
1683                     ; 83 }
1686  00cb 81            	ret
1710                     ; 86 void timersInit(void)
1710                     ; 87 {
1711                     	switch	.text
1712  00cc               _timersInit:
1715                     ; 99 	TBCR1 = 0x40; 	//Output Compare Interrupt Enable
1717  00cc a640          	ld	a,#64
1718  00ce b742          	ld	_TBCR1,a
1719                     ; 117 	TBCR2 = 0x08;	//fcpu/8
1721  00d0 a608          	ld	a,#8
1722  00d2 b741          	ld	_TBCR2,a
1723                     ; 119 }
1726  00d4 81            	ret
1765                     ; 123 void timersTicIRQ()
1765                     ; 124 {  
1766                     	switch	.text
1768                     	xref.b	_timersTicIRQ$L
1769  00d5               _timersTicIRQ:
1771  00d5 9089          	push	y
1772  00d7 b600          	ld	a,c_x
1773  00d9 b700          	ld	_timersTicIRQ$L+0,a
1774  00db b601          	ld	a,c_x+1
1775  00dd b701          	ld	_timersTicIRQ$L+1,a
1776  00df b600          	ld	a,c_y
1777  00e1 b702          	ld	_timersTicIRQ$L+2,a
1778  00e3 b601          	ld	a,c_y+1
1779  00e5 b703          	ld	_timersTicIRQ$L+3,a
1781                     ; 127 	byTemp = TBSR;	
1783  00e7 b643          	ld	a,_TBSR
1784  00e9 b7ff          	ld	_timersTicIRQ$L-1,a
1785                     ; 128 	if (byTemp & 0x40) // if OCF1 flag
1787  00eb b6ff          	ld	a,_timersTicIRQ$L-1
1788  00ed a540          	bcp	a,#64
1789  00ef 2713          	jreq	L5211
1790                     ; 130 		byTemp 	= TBOC1LR;				//Clears OCF1 flag.
1792  00f1 b647          	ld	a,_TBOC1LR
1793  00f3 b7ff          	ld	_timersTicIRQ$L-1,a
1794                     ; 133 		TBCR = 0x0000;
1796  00f5 3f48          	clr	_TBCR
1797  00f7 3f49          	clr	_TBCR+1
1798                     ; 136 		TBOC1HR = HIBYTE(TIMERS_B_TIMEOUT);
1800  00f9 a60a          	ld	a,#10
1801  00fb b746          	ld	_TBOC1HR,a
1802                     ; 137 		TBOC1LR = LOBYTE(TIMERS_B_TIMEOUT);
1804  00fd a668          	ld	a,#104
1805  00ff b747          	ld	_TBOC1LR,a
1806                     ; 140 		timersUpdate();
1808  0101 cd0046        	call	_timersUpdate
1810  0104               L5211:
1811                     ; 144 	byTemp = TBOC2LR;
1813  0104 b64f          	ld	a,_TBOC2LR
1814  0106 b7ff          	ld	_timersTicIRQ$L-1,a
1815                     ; 145 }
1818  0108 b600          	ld	a,_timersTicIRQ$L+0
1819  010a b700          	ld	c_x,a
1820  010c b601          	ld	a,_timersTicIRQ$L+1
1821  010e b701          	ld	c_x+1,a
1822  0110 b602          	ld	a,_timersTicIRQ$L+2
1823  0112 b700          	ld	c_y,a
1824  0114 b603          	ld	a,_timersTicIRQ$L+3
1825  0116 b701          	ld	c_y+1,a
1826  0118 9085          	pop	y
1827  011a 80            	iret
1870                     	xdef	_timersUpdate
1871                     	xdef	_m_byTenMilliSeconds
1872                     	xdef	_m_arbyTimeouts
1873                     	xdef	_timersWaitTimeout
1874                     	xdef	_timersReset
1875                     	xdef	_timersSet
1876                     	xdef	_timersTicIRQ
1877                     	xdef	_timersInit
1878                     	xdef	_m_byTimersFlag
1879                     	xref.b	c_x
1880                     	xref.b	c_y
1899                     	end
