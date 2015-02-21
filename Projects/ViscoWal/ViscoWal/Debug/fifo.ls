   1                     ; C Compiler for ST7 (COSMIC Software)
   2                     ; Generator V4.5.5 - 12 Jan 2006
1280                     .const:	section	.text
1281  0000               L327_mc_byApplicationVersion:
1282  0000 da            	dc.b	218
1353                     ; 13 void FIFO_Init(void)
1353                     ; 14 {
1354                     	switch	.text
1356                     	xref.b	_FIFO_Init$L
1357  0000               _FIFO_Init:
1360                     ; 15 	BYTE i = FIFO_BUFFER;
1362  0000 a620          	ld	a,#32
1363  0002 b7ff          	ld	_FIFO_Init$L-1,a
1365  0004 2008          	jra	L1001
1366  0006               L577:
1367                     ; 18 		m_arbyFifoBuffer[--i]=0x00;
1369  0006 3aff          	dec	_FIFO_Init$L-1
1370  0008 beff          	ld	x,_FIFO_Init$L-1
1371  000a 4f            	clr	a
1372  000b d70082        	ld	(L147_m_arbyFifoBuffer,x),a
1373  000e               L1001:
1374                     ; 16 	while(i>0)
1376  000e 3dff          	tnz	_FIFO_Init$L-1
1377  0010 26f4          	jrne	L577
1378                     ; 20 	m_byFifoLength = 0x00;
1380  0012 4f            	clr	a
1381  0013 c70081        	ld	L347_m_byFifoLength,a
1382                     ; 21 }
1385  0016 81            	ret
1420                     ; 24 void FIFO_PutByte(BYTE a_byData)
1420                     ; 25 {
1421                     	switch	.text
1423                     	xref.b	_FIFO_PutByte$L
1424  0017               _FIFO_PutByte:
1426  0017 b700          	ld	_FIFO_PutByte$L,a
1428                     ; 26 	m_arbyFifoBuffer[m_byFifoLength++] = a_byData;
1430  0019 ce0081        	ld	x,L347_m_byFifoLength
1431  001c c60081        	ld	a,L347_m_byFifoLength
1432  001f ab01          	add	a,#1
1433  0021 c70081        	ld	L347_m_byFifoLength,a
1434  0024 b600          	ld	a,_FIFO_PutByte$L
1435  0026 d70082        	ld	(L147_m_arbyFifoBuffer,x),a
1436                     ; 27 }
1439  0029 81            	ret
1483                     ; 30 BYTE FIFO_GetByte(void)
1483                     ; 31 {
1484                     	switch	.text
1486                     	xref.b	_FIFO_GetByte$L
1487  002a               _FIFO_GetByte:
1490                     ; 32 	BYTE i = m_byFifoLength;
1492  002a c60081        	ld	a,L347_m_byFifoLength
1493  002d b7ff          	ld	_FIFO_GetByte$L-1,a
1494                     ; 35 	byResult = m_arbyFifoBuffer[0];
1496  002f c60082        	ld	a,L147_m_arbyFifoBuffer
1497  0032 b7fe          	ld	_FIFO_GetByte$L-2,a
1498                     ; 36 	for(i=0; i<m_byFifoLength; i++)
1500  0034 3fff          	clr	_FIFO_GetByte$L-1
1502  0036 200c          	jra	L1501
1503  0038               L5401:
1504                     ; 38 		m_arbyFifoBuffer[i]= m_arbyFifoBuffer[i+1];
1506  0038 beff          	ld	x,_FIFO_GetByte$L-1
1507  003a d60083        	ld	a,(L147_m_arbyFifoBuffer+1,x)
1508  003d beff          	ld	x,_FIFO_GetByte$L-1
1509  003f d70082        	ld	(L147_m_arbyFifoBuffer,x),a
1510                     ; 36 	for(i=0; i<m_byFifoLength; i++)
1512  0042 3cff          	inc	_FIFO_GetByte$L-1
1513  0044               L1501:
1516  0044 b6ff          	ld	a,_FIFO_GetByte$L-1
1517  0046 c10081        	cp	a,L347_m_byFifoLength
1518  0049 25ed          	jrult	L5401
1519                     ; 41 	m_byFifoLength--;
1521  004b c60081        	ld	a,L347_m_byFifoLength
1522  004e a001          	sub	a,#1
1523  0050 c70081        	ld	L347_m_byFifoLength,a
1524                     ; 42 	return byResult;
1526  0053 b6fe          	ld	a,_FIFO_GetByte$L-2
1529  0055 81            	ret
1552                     ; 46 BYTE FIFO_GetLength(void)
1552                     ; 47 {
1553                     	switch	.text
1554  0056               _FIFO_GetLength:
1557                     ; 48 	return m_byFifoLength;
1559  0056 c60081        	ld	a,L347_m_byFifoLength
1562  0059 81            	ret
1597                     ; 52 void FIFOL_Init(void)
1597                     ; 53 {
1598                     	switch	.text
1600                     	xref.b	_FIFOL_Init$L
1601  005a               _FIFOL_Init:
1604                     ; 54 	BYTE i = FIFO_BUFFER;
1606  005a a620          	ld	a,#32
1607  005c b7ff          	ld	_FIFOL_Init$L-1,a
1609  005e 201a          	jra	L7011
1610  0060               L3011:
1611                     ; 57 		m_arlwoFifolBuffer[--i]=0x00000000;
1613  0060 3aff          	dec	_FIFOL_Init$L-1
1614  0062 beff          	ld	x,_FIFOL_Init$L-1
1615  0064 58            	sll	x
1616  0065 58            	sll	x
1617  0066 a600          	ld	a,#0
1618  0068 d70004        	ld	(L547_m_arlwoFifolBuffer+3,x),a
1619  006b a600          	ld	a,#0
1620  006d d70003        	ld	(L547_m_arlwoFifolBuffer+2,x),a
1621  0070 a600          	ld	a,#0
1622  0072 d70002        	ld	(L547_m_arlwoFifolBuffer+1,x),a
1623  0075 a600          	ld	a,#0
1624  0077 d70001        	ld	(L547_m_arlwoFifolBuffer,x),a
1625  007a               L7011:
1626                     ; 55 	while(i>0)
1628  007a 3dff          	tnz	_FIFOL_Init$L-1
1629  007c 26e2          	jrne	L3011
1630                     ; 59 	m_byFifolLength = 0x00;
1632  007e 4f            	clr	a
1633  007f c70000        	ld	L747_m_byFifolLength,a
1634                     ; 60 }
1637  0082 81            	ret
1672                     ; 63 void FIFOL_PutByte(LWORD  a_lwoData)
1672                     ; 64 {
1673                     	switch	.text
1675                     	xref.b	_FIFOL_PutByte$L
1676  0083               _FIFOL_PutByte:
1679                     ; 65 	m_arlwoFifolBuffer[m_byFifolLength++] = a_lwoData;
1681  0083 ce0000        	ld	x,L747_m_byFifolLength
1682  0086 c60000        	ld	a,L747_m_byFifolLength
1683  0089 ab01          	add	a,#1
1684  008b c70000        	ld	L747_m_byFifolLength,a
1685  008e 58            	sll	x
1686  008f 58            	sll	x
1687  0090 b603          	ld	a,_FIFOL_PutByte$L+3
1688  0092 d70004        	ld	(L547_m_arlwoFifolBuffer+3,x),a
1689  0095 b602          	ld	a,_FIFOL_PutByte$L+2
1690  0097 d70003        	ld	(L547_m_arlwoFifolBuffer+2,x),a
1691  009a b601          	ld	a,_FIFOL_PutByte$L+1
1692  009c d70002        	ld	(L547_m_arlwoFifolBuffer+1,x),a
1693  009f b600          	ld	a,_FIFOL_PutByte$L
1694  00a1 d70001        	ld	(L547_m_arlwoFifolBuffer,x),a
1695                     ; 66 }
1698  00a4 81            	ret
1742                     ; 69 LWORD FIFOL_GetByte(void)
1742                     ; 70 {
1743                     	switch	.text
1745                     	xref.b	_FIFOL_GetByte$L
1746  00a5               _FIFOL_GetByte:
1749                     ; 71 	BYTE i = m_byFifolLength;
1751  00a5 c60000        	ld	a,L747_m_byFifolLength
1752  00a8 b7ff          	ld	_FIFOL_GetByte$L-1,a
1753                     ; 74 	lwoResult = m_arlwoFifolBuffer[0];
1755  00aa c60004        	ld	a,L547_m_arlwoFifolBuffer+3
1756  00ad b7fe          	ld	_FIFOL_GetByte$L-2,a
1757  00af c60003        	ld	a,L547_m_arlwoFifolBuffer+2
1758  00b2 b7fd          	ld	_FIFOL_GetByte$L-3,a
1759  00b4 c60002        	ld	a,L547_m_arlwoFifolBuffer+1
1760  00b7 b7fc          	ld	_FIFOL_GetByte$L-4,a
1761  00b9 c60001        	ld	a,L547_m_arlwoFifolBuffer
1762  00bc b7fb          	ld	_FIFOL_GetByte$L-5,a
1763                     ; 75 	for(i=0; i<m_byFifolLength; i++)
1765  00be 3fff          	clr	_FIFOL_GetByte$L-1
1767  00c0 2029          	jra	L7511
1768  00c2               L3511:
1769                     ; 77 		m_arlwoFifolBuffer[i]= m_arlwoFifolBuffer[i+1];
1771  00c2 beff          	ld	x,_FIFOL_GetByte$L-1
1772  00c4 58            	sll	x
1773  00c5 58            	sll	x
1774  00c6 90beff        	ld	y,_FIFOL_GetByte$L-1
1775  00c9 9058          	sll	y
1776  00cb 9058          	sll	y
1777  00cd d60008        	ld	a,(L547_m_arlwoFifolBuffer+7,x)
1778  00d0 90d70004      	ld	(L547_m_arlwoFifolBuffer+3,y),a
1779  00d4 d60007        	ld	a,(L547_m_arlwoFifolBuffer+6,x)
1780  00d7 90d70003      	ld	(L547_m_arlwoFifolBuffer+2,y),a
1781  00db d60006        	ld	a,(L547_m_arlwoFifolBuffer+5,x)
1782  00de 90d70002      	ld	(L547_m_arlwoFifolBuffer+1,y),a
1783  00e2 d60005        	ld	a,(L547_m_arlwoFifolBuffer+4,x)
1784  00e5 90d70001      	ld	(L547_m_arlwoFifolBuffer,y),a
1785                     ; 75 	for(i=0; i<m_byFifolLength; i++)
1787  00e9 3cff          	inc	_FIFOL_GetByte$L-1
1788  00eb               L7511:
1791  00eb b6ff          	ld	a,_FIFOL_GetByte$L-1
1792  00ed c10000        	cp	a,L747_m_byFifolLength
1793  00f0 25d0          	jrult	L3511
1794                     ; 80 	m_byFifolLength--;
1796  00f2 c60000        	ld	a,L747_m_byFifolLength
1797  00f5 a001          	sub	a,#1
1798  00f7 c70000        	ld	L747_m_byFifolLength,a
1799                     ; 81 	return lwoResult;
1801  00fa aefb          	ld	x,#_FIFOL_GetByte$L-5
1802  00fc cd0000        	call	c_ltor
1806  00ff 81            	ret
1829                     ; 85 LWORD FIFOL_GetLength(void)
1829                     ; 86 {
1830                     	switch	.text
1831  0100               _FIFOL_GetLength:
1834                     ; 87 	return m_byFifolLength;
1836  0100 c60000        	ld	a,L747_m_byFifolLength
1837  0103 b703          	ld	c_lreg+3,a
1838  0105 4f            	clr	a
1839  0106 b702          	ld	c_lreg+2,a
1840  0108 b701          	ld	c_lreg+1,a
1841  010a b700          	ld	c_lreg,a
1844  010c 81            	ret
1896                     	switch	.bss
1897  0000               L747_m_byFifolLength:
1898  0000 00            	ds.b	1
1899  0001               L547_m_arlwoFifolBuffer:
1900  0001 000000000000  	ds.b	128
1901  0081               L347_m_byFifoLength:
1902  0081 00            	ds.b	1
1903  0082               L147_m_arbyFifoBuffer:
1904  0082 000000000000  	ds.b	32
1905                     	xdef	_FIFOL_GetLength
1906                     	xdef	_FIFOL_GetByte
1907                     	xdef	_FIFOL_PutByte
1908                     	xdef	_FIFOL_Init
1909                     	xdef	_FIFO_GetLength
1910                     	xdef	_FIFO_GetByte
1911                     	xdef	_FIFO_PutByte
1912                     	xdef	_FIFO_Init
1913                     	xref.b	c_lreg
1933                     	xref	c_ltor
1934                     	end
