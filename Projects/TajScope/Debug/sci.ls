   1                     ; C Compiler for ST7 (COSMIC Software)
   2                     ; Generator V4.5.5 - 12 Jan 2006
1280                     	switch	.data
1281  0000               _Pr_Value:
1282  0000 01            	dc.b	1
1283  0001 03            	dc.b	3
1284  0002 04            	dc.b	4
1285  0003 0d            	dc.b	13
1490                     ; 63 void SCI_Compute_Baudrate(WORD BaudRate_Tx, WORD BaudRate_Rx)
1490                     ; 64 {
1491                     	switch	.text
1493                     	xref.b	_SCI_Compute_Baudrate$L
1494  0000               _SCI_Compute_Baudrate:
1496  0000 b701          	ld	_SCI_Compute_Baudrate$L+1,a
1497  0002 bf00          	ld	_SCI_Compute_Baudrate$L,x
1499                     ; 70     TPR1 = 0;
1501  0004 3ff2          	clr	_SCI_Compute_Baudrate$L-14
1502                     ; 71     TPR2 = 0;
1504  0006 3fe9          	clr	_SCI_Compute_Baudrate$L-23
1505                     ; 72     RPR1 = 0;
1507  0008 3fee          	clr	_SCI_Compute_Baudrate$L-18
1508                     ; 73     RPR2 = 0; 
1510  000a 3fe8          	clr	_SCI_Compute_Baudrate$L-24
1511                     ; 74     temp = 0; 
1513  000c a600          	ld	a,#0
1514  000e b7f6          	ld	_SCI_Compute_Baudrate$L-10,a
1515  0010 a600          	ld	a,#0
1516  0012 b7f5          	ld	_SCI_Compute_Baudrate$L-11,a
1517  0014 a600          	ld	a,#0
1518  0016 b7f4          	ld	_SCI_Compute_Baudrate$L-12,a
1519  0018 a600          	ld	a,#0
1520  001a b7f3          	ld	_SCI_Compute_Baudrate$L-13,a
1521                     ; 76     temp = Fcpu/BaudRate_Tx;                       
1523  001c b601          	ld	a,_SCI_Compute_Baudrate$L+1
1524  001e be00          	ld	x,_SCI_Compute_Baudrate$L
1525  0020 cd0000        	call	c_uitol
1527  0023 aede          	ld	x,#_SCI_Compute_Baudrate$L-34
1528  0025 cd0000        	call	c_rtol
1530  0028 a600          	ld	a,#0
1531  002a b703          	ld	c_lreg+3,a
1532  002c a612          	ld	a,#18
1533  002e b702          	ld	c_lreg+2,a
1534  0030 a67a          	ld	a,#122
1535  0032 b701          	ld	c_lreg+1,a
1536  0034 a600          	ld	a,#0
1537  0036 b700          	ld	c_lreg,a
1538  0038 aede          	ld	x,#_SCI_Compute_Baudrate$L-34
1539  003a cd0000        	call	c_ludv
1541  003d aef3          	ld	x,#_SCI_Compute_Baudrate$L-13
1542  003f cd0000        	call	c_rtol
1544                     ; 77     for (temp1 = 0,count = 1;temp1 < 1;count++)    
1546  0042 3ff9          	clr	_SCI_Compute_Baudrate$L-7
1547  0044 3ffa          	clr	_SCI_Compute_Baudrate$L-6
1548  0046 a601          	ld	a,#1
1549  0048 b7f8          	ld	_SCI_Compute_Baudrate$L-8,a
1550  004a 3ff7          	clr	_SCI_Compute_Baudrate$L-9
1552  004c cc010e        	jp	L3601
1553  004f               L7501:
1554                     ; 79         Presc_Fact = ((WORD)(temp/16)) ;
1556  004f aef3          	ld	x,#_SCI_Compute_Baudrate$L-13
1557  0051 cd0000        	call	c_ltor
1559  0054 a604          	ld	a,#4
1560  0056 cd0000        	call	c_lursh
1562  0059 b603          	ld	a,c_lreg+3
1563  005b be02          	ld	x,c_lreg+2
1564  005d b7fc          	ld	_SCI_Compute_Baudrate$L-4,a
1565  005f bffb          	ld	_SCI_Compute_Baudrate$L-5,x
1566                     ; 80         for (i = 0; i != 4; i++)
1568  0061 3ffd          	clr	_SCI_Compute_Baudrate$L-3
1569  0063               L7601:
1570                     ; 82             for (j = 1; j <= 128; j = j*2)
1572  0063 a601          	ld	a,#1
1573  0065 b7ff          	ld	_SCI_Compute_Baudrate$L-1,a
1574  0067 3ffe          	clr	_SCI_Compute_Baudrate$L-2
1575  0069               L5701:
1576                     ; 84                 if ( ((Pr_Value[i]*j) == Presc_Fact) && (TPR1 == 0) )
1578  0069 befd          	ld	x,_SCI_Compute_Baudrate$L-3
1579  006b d60000        	ld	a,(_Pr_Value,x)
1580  006e 5f            	clr	x
1581  006f 90befe        	ld	y,_SCI_Compute_Baudrate$L-2
1582  0072 90bf00        	ld	c_y,y
1583  0075 90beff        	ld	y,_SCI_Compute_Baudrate$L-1
1584  0078 cd0000        	call	c_imul
1586  007b b1fc          	cp	a,_SCI_Compute_Baudrate$L-4
1587  007d 2602          	jrne	L6
1588  007f b3fb          	cp	x,_SCI_Compute_Baudrate$L-5
1589  0081               L6:
1590  0081 261b          	jrne	L3011
1592  0083 3df2          	tnz	_SCI_Compute_Baudrate$L-14
1593  0085 2617          	jrne	L3011
1594                     ; 86                     TPR1 = Pr_Value[i];     /*Prescalar value for Transmitter*/
1596  0087 befd          	ld	x,_SCI_Compute_Baudrate$L-3
1597  0089 d60000        	ld	a,(_Pr_Value,x)
1598  008c b7f2          	ld	_SCI_Compute_Baudrate$L-14,a
1599                     ; 87                     TR1  = j;                      /*Transmitter rate divisor*/
1601  008e befe          	ld	x,_SCI_Compute_Baudrate$L-2
1602  0090 bfea          	ld	_SCI_Compute_Baudrate$L-22,x
1603  0092 b6ff          	ld	a,_SCI_Compute_Baudrate$L-1
1604  0094 b7eb          	ld	_SCI_Compute_Baudrate$L-21,a
1605                     ; 88                     temp1++;
1607  0096 3cfa          	inc	_SCI_Compute_Baudrate$L-6
1608  0098 2602          	jrne	L01
1609  009a 3cf9          	inc	_SCI_Compute_Baudrate$L-7
1610  009c               L01:
1612  009c 202f          	jra	L5011
1613  009e               L3011:
1614                     ; 90                 else if ((Pr_Value[i]*j) == Presc_Fact)
1616  009e befd          	ld	x,_SCI_Compute_Baudrate$L-3
1617  00a0 d60000        	ld	a,(_Pr_Value,x)
1618  00a3 5f            	clr	x
1619  00a4 90befe        	ld	y,_SCI_Compute_Baudrate$L-2
1620  00a7 90bf00        	ld	c_y,y
1621  00aa 90beff        	ld	y,_SCI_Compute_Baudrate$L-1
1622  00ad cd0000        	call	c_imul
1624  00b0 b1fc          	cp	a,_SCI_Compute_Baudrate$L-4
1625  00b2 2602          	jrne	L21
1626  00b4 b3fb          	cp	x,_SCI_Compute_Baudrate$L-5
1627  00b6               L21:
1628  00b6 2615          	jrne	L5011
1629                     ; 92                     TPR2 = Pr_Value[i]; 
1631  00b8 befd          	ld	x,_SCI_Compute_Baudrate$L-3
1632  00ba d60000        	ld	a,(_Pr_Value,x)
1633  00bd b7e9          	ld	_SCI_Compute_Baudrate$L-23,a
1634                     ; 94                     TR2 = j;               /*Another Transmitter rate divisor*/
1636  00bf befe          	ld	x,_SCI_Compute_Baudrate$L-2
1637  00c1 bfe2          	ld	_SCI_Compute_Baudrate$L-30,x
1638  00c3 b6ff          	ld	a,_SCI_Compute_Baudrate$L-1
1639  00c5 b7e3          	ld	_SCI_Compute_Baudrate$L-29,a
1640                     ; 95                     temp1++;
1642  00c7 3cfa          	inc	_SCI_Compute_Baudrate$L-6
1643  00c9 2602          	jrne	L41
1644  00cb 3cf9          	inc	_SCI_Compute_Baudrate$L-7
1645  00cd               L41:
1646  00cd               L5011:
1647                     ; 82             for (j = 1; j <= 128; j = j*2)
1649  00cd 38ff          	sll	_SCI_Compute_Baudrate$L-1
1650  00cf 39fe          	rlc	_SCI_Compute_Baudrate$L-2
1653  00d1 b6ff          	ld	a,_SCI_Compute_Baudrate$L-1
1654  00d3 a081          	sub	a,#129
1655  00d5 b6fe          	ld	a,_SCI_Compute_Baudrate$L-2
1656  00d7 a200          	sbc	a,#0
1657  00d9 2402          	jruge	L64
1658  00db 208c          	jp	L5701
1659  00dd               L64:
1660                     ; 80         for (i = 0; i != 4; i++)
1662  00dd 3cfd          	inc	_SCI_Compute_Baudrate$L-3
1665  00df b6fd          	ld	a,_SCI_Compute_Baudrate$L-3
1666  00e1 a104          	cp	a,#4
1667  00e3 2703          	jreq	L05
1668  00e5 cc0063        	jp	L7601
1669  00e8               L05:
1670                     ; 99         if(count%2 == 0)      /*Changes the temp value if no prescalar factor
1672  00e8 b6f8          	ld	a,_SCI_Compute_Baudrate$L-8
1673  00ea a501          	bcp	a,#1
1674  00ec 260e          	jrne	L1111
1675                     ; 102             temp = temp + count;                           
1677  00ee b6f8          	ld	a,_SCI_Compute_Baudrate$L-8
1678  00f0 bef7          	ld	x,_SCI_Compute_Baudrate$L-9
1679  00f2 cd0000        	call	c_uitol
1681  00f5 aef3          	ld	x,#_SCI_Compute_Baudrate$L-13
1682  00f7 cd0000        	call	c_lgadd
1685  00fa 200c          	jra	L3111
1686  00fc               L1111:
1687                     ; 106             temp = temp - count;
1689  00fc b6f8          	ld	a,_SCI_Compute_Baudrate$L-8
1690  00fe bef7          	ld	x,_SCI_Compute_Baudrate$L-9
1691  0100 cd0000        	call	c_uitol
1693  0103 aef3          	ld	x,#_SCI_Compute_Baudrate$L-13
1694  0105 cd0000        	call	c_lgsub
1696  0108               L3111:
1697                     ; 77     for (temp1 = 0,count = 1;temp1 < 1;count++)    
1699  0108 3cf8          	inc	_SCI_Compute_Baudrate$L-8
1700  010a 2602          	jrne	L61
1701  010c 3cf7          	inc	_SCI_Compute_Baudrate$L-9
1702  010e               L61:
1703  010e               L3601:
1706  010e b6fa          	ld	a,_SCI_Compute_Baudrate$L-6
1707  0110 a001          	sub	a,#1
1708  0112 b6f9          	ld	a,_SCI_Compute_Baudrate$L-7
1709  0114 a200          	sbc	a,#0
1710  0116 2403          	jruge	L25
1711  0118 cc004f        	jp	L7501
1712  011b               L25:
1713                     ; 109     temp = Fcpu/BaudRate_Rx; 
1715  011b b603          	ld	a,_SCI_Compute_Baudrate$L+3
1716  011d be02          	ld	x,_SCI_Compute_Baudrate$L+2
1717  011f cd0000        	call	c_uitol
1719  0122 aede          	ld	x,#_SCI_Compute_Baudrate$L-34
1720  0124 cd0000        	call	c_rtol
1722  0127 a600          	ld	a,#0
1723  0129 b703          	ld	c_lreg+3,a
1724  012b a612          	ld	a,#18
1725  012d b702          	ld	c_lreg+2,a
1726  012f a67a          	ld	a,#122
1727  0131 b701          	ld	c_lreg+1,a
1728  0133 a600          	ld	a,#0
1729  0135 b700          	ld	c_lreg,a
1730  0137 aede          	ld	x,#_SCI_Compute_Baudrate$L-34
1731  0139 cd0000        	call	c_ludv
1733  013c aef3          	ld	x,#_SCI_Compute_Baudrate$L-13
1734  013e cd0000        	call	c_rtol
1736                     ; 110     for (temp1 = 0,count = 1;temp1 < 1;count++)
1738  0141 3ff9          	clr	_SCI_Compute_Baudrate$L-7
1739  0143 3ffa          	clr	_SCI_Compute_Baudrate$L-6
1740  0145 a601          	ld	a,#1
1741  0147 b7f8          	ld	_SCI_Compute_Baudrate$L-8,a
1742  0149 3ff7          	clr	_SCI_Compute_Baudrate$L-9
1744  014b cc020d        	jp	L1211
1745  014e               L5111:
1746                     ; 112         Presc_Fact = (WORD)(temp/16); 
1748  014e aef3          	ld	x,#_SCI_Compute_Baudrate$L-13
1749  0150 cd0000        	call	c_ltor
1751  0153 a604          	ld	a,#4
1752  0155 cd0000        	call	c_lursh
1754  0158 b603          	ld	a,c_lreg+3
1755  015a be02          	ld	x,c_lreg+2
1756  015c b7fc          	ld	_SCI_Compute_Baudrate$L-4,a
1757  015e bffb          	ld	_SCI_Compute_Baudrate$L-5,x
1758                     ; 113         for (i = 0; i != 4; i++)
1760  0160 3ffd          	clr	_SCI_Compute_Baudrate$L-3
1761  0162               L5211:
1762                     ; 115             for (j = 1; j <= 128; j = j*2)
1764  0162 a601          	ld	a,#1
1765  0164 b7ff          	ld	_SCI_Compute_Baudrate$L-1,a
1766  0166 3ffe          	clr	_SCI_Compute_Baudrate$L-2
1767  0168               L3311:
1768                     ; 117                 if (((Pr_Value[i]*j) == Presc_Fact) && (RPR1 == 0))
1770  0168 befd          	ld	x,_SCI_Compute_Baudrate$L-3
1771  016a d60000        	ld	a,(_Pr_Value,x)
1772  016d 5f            	clr	x
1773  016e 90befe        	ld	y,_SCI_Compute_Baudrate$L-2
1774  0171 90bf00        	ld	c_y,y
1775  0174 90beff        	ld	y,_SCI_Compute_Baudrate$L-1
1776  0177 cd0000        	call	c_imul
1778  017a b1fc          	cp	a,_SCI_Compute_Baudrate$L-4
1779  017c 2602          	jrne	L02
1780  017e b3fb          	cp	x,_SCI_Compute_Baudrate$L-5
1781  0180               L02:
1782  0180 261b          	jrne	L1411
1784  0182 3dee          	tnz	_SCI_Compute_Baudrate$L-18
1785  0184 2617          	jrne	L1411
1786                     ; 119                     RPR1 = Pr_Value[i];        /*Prescalar value for Receiver*/
1788  0186 befd          	ld	x,_SCI_Compute_Baudrate$L-3
1789  0188 d60000        	ld	a,(_Pr_Value,x)
1790  018b b7ee          	ld	_SCI_Compute_Baudrate$L-18,a
1791                     ; 120                     RR1    = j;                       /*Receiver rate divisor*/
1793  018d befe          	ld	x,_SCI_Compute_Baudrate$L-2
1794  018f bfe4          	ld	_SCI_Compute_Baudrate$L-28,x
1795  0191 b6ff          	ld	a,_SCI_Compute_Baudrate$L-1
1796  0193 b7e5          	ld	_SCI_Compute_Baudrate$L-27,a
1797                     ; 121                     temp1++;
1799  0195 3cfa          	inc	_SCI_Compute_Baudrate$L-6
1800  0197 2602          	jrne	L22
1801  0199 3cf9          	inc	_SCI_Compute_Baudrate$L-7
1802  019b               L22:
1804  019b 202f          	jra	L3411
1805  019d               L1411:
1806                     ; 123                 else if ((Pr_Value[i]*j) == Presc_Fact)
1808  019d befd          	ld	x,_SCI_Compute_Baudrate$L-3
1809  019f d60000        	ld	a,(_Pr_Value,x)
1810  01a2 5f            	clr	x
1811  01a3 90befe        	ld	y,_SCI_Compute_Baudrate$L-2
1812  01a6 90bf00        	ld	c_y,y
1813  01a9 90beff        	ld	y,_SCI_Compute_Baudrate$L-1
1814  01ac cd0000        	call	c_imul
1816  01af b1fc          	cp	a,_SCI_Compute_Baudrate$L-4
1817  01b1 2602          	jrne	L42
1818  01b3 b3fb          	cp	x,_SCI_Compute_Baudrate$L-5
1819  01b5               L42:
1820  01b5 2615          	jrne	L3411
1821                     ; 125                     RPR2 = Pr_Value[i];
1823  01b7 befd          	ld	x,_SCI_Compute_Baudrate$L-3
1824  01b9 d60000        	ld	a,(_Pr_Value,x)
1825  01bc b7e8          	ld	_SCI_Compute_Baudrate$L-24,a
1826                     ; 127                     RR2    = j;                /*Another Receiver rate divisor*/
1828  01be befe          	ld	x,_SCI_Compute_Baudrate$L-2
1829  01c0 bfe6          	ld	_SCI_Compute_Baudrate$L-26,x
1830  01c2 b6ff          	ld	a,_SCI_Compute_Baudrate$L-1
1831  01c4 b7e7          	ld	_SCI_Compute_Baudrate$L-25,a
1832                     ; 128                     temp1++;
1834  01c6 3cfa          	inc	_SCI_Compute_Baudrate$L-6
1835  01c8 2602          	jrne	L62
1836  01ca 3cf9          	inc	_SCI_Compute_Baudrate$L-7
1837  01cc               L62:
1838  01cc               L3411:
1839                     ; 115             for (j = 1; j <= 128; j = j*2)
1841  01cc 38ff          	sll	_SCI_Compute_Baudrate$L-1
1842  01ce 39fe          	rlc	_SCI_Compute_Baudrate$L-2
1845  01d0 b6ff          	ld	a,_SCI_Compute_Baudrate$L-1
1846  01d2 a081          	sub	a,#129
1847  01d4 b6fe          	ld	a,_SCI_Compute_Baudrate$L-2
1848  01d6 a200          	sbc	a,#0
1849  01d8 2402          	jruge	L45
1850  01da 208c          	jp	L3311
1851  01dc               L45:
1852                     ; 113         for (i = 0; i != 4; i++)
1854  01dc 3cfd          	inc	_SCI_Compute_Baudrate$L-3
1857  01de b6fd          	ld	a,_SCI_Compute_Baudrate$L-3
1858  01e0 a104          	cp	a,#4
1859  01e2 2703          	jreq	L65
1860  01e4 cc0162        	jp	L5211
1861  01e7               L65:
1862                     ; 132         if(count%2 == 0)
1864  01e7 b6f8          	ld	a,_SCI_Compute_Baudrate$L-8
1865  01e9 a501          	bcp	a,#1
1866  01eb 260e          	jrne	L7411
1867                     ; 135             temp = temp + count;
1869  01ed b6f8          	ld	a,_SCI_Compute_Baudrate$L-8
1870  01ef bef7          	ld	x,_SCI_Compute_Baudrate$L-9
1871  01f1 cd0000        	call	c_uitol
1873  01f4 aef3          	ld	x,#_SCI_Compute_Baudrate$L-13
1874  01f6 cd0000        	call	c_lgadd
1877  01f9 200c          	jra	L1511
1878  01fb               L7411:
1879                     ; 139             temp = temp - count;
1881  01fb b6f8          	ld	a,_SCI_Compute_Baudrate$L-8
1882  01fd bef7          	ld	x,_SCI_Compute_Baudrate$L-9
1883  01ff cd0000        	call	c_uitol
1885  0202 aef3          	ld	x,#_SCI_Compute_Baudrate$L-13
1886  0204 cd0000        	call	c_lgsub
1888  0207               L1511:
1889                     ; 110     for (temp1 = 0,count = 1;temp1 < 1;count++)
1891  0207 3cf8          	inc	_SCI_Compute_Baudrate$L-8
1892  0209 2602          	jrne	L03
1893  020b 3cf7          	inc	_SCI_Compute_Baudrate$L-9
1894  020d               L03:
1895  020d               L1211:
1898  020d b6fa          	ld	a,_SCI_Compute_Baudrate$L-6
1899  020f a001          	sub	a,#1
1900  0211 b6f9          	ld	a,_SCI_Compute_Baudrate$L-7
1901  0213 a200          	sbc	a,#0
1902  0215 2403          	jruge	L06
1903  0217 cc014e        	jp	L5111
1904  021a               L06:
1905                     ; 143     if (TPR1 == RPR1)    
1907  021a b6f2          	ld	a,_SCI_Compute_Baudrate$L-14
1908  021c b1ee          	cp	a,_SCI_Compute_Baudrate$L-18
1909  021e 2616          	jrne	L3511
1910                     ; 145         Presc_Value = TPR1;
1912  0220 b6f2          	ld	a,_SCI_Compute_Baudrate$L-14
1913  0222 b7f1          	ld	_SCI_Compute_Baudrate$L-15,a
1914                     ; 146         Tx_Value    = TR1;
1916  0224 beea          	ld	x,_SCI_Compute_Baudrate$L-22
1917  0226 bfef          	ld	_SCI_Compute_Baudrate$L-17,x
1918  0228 b6eb          	ld	a,_SCI_Compute_Baudrate$L-21
1919  022a b7f0          	ld	_SCI_Compute_Baudrate$L-16,a
1920                     ; 147         Rx_Value    = RR1;
1922  022c bee4          	ld	x,_SCI_Compute_Baudrate$L-28
1923  022e bfec          	ld	_SCI_Compute_Baudrate$L-20,x
1924  0230 b6e5          	ld	a,_SCI_Compute_Baudrate$L-27
1925  0232 b7ed          	ld	_SCI_Compute_Baudrate$L-19,a
1927  0234 2052          	jra	L5511
1928  0236               L3511:
1929                     ; 149     else if ( TPR1 == RPR2)
1931  0236 b6f2          	ld	a,_SCI_Compute_Baudrate$L-14
1932  0238 b1e8          	cp	a,_SCI_Compute_Baudrate$L-24
1933  023a 2616          	jrne	L7511
1934                     ; 151         Presc_Value = TPR1;
1936  023c b6f2          	ld	a,_SCI_Compute_Baudrate$L-14
1937  023e b7f1          	ld	_SCI_Compute_Baudrate$L-15,a
1938                     ; 152         Tx_Value    = TR1;
1940  0240 beea          	ld	x,_SCI_Compute_Baudrate$L-22
1941  0242 bfef          	ld	_SCI_Compute_Baudrate$L-17,x
1942  0244 b6eb          	ld	a,_SCI_Compute_Baudrate$L-21
1943  0246 b7f0          	ld	_SCI_Compute_Baudrate$L-16,a
1944                     ; 153         Rx_Value    = RR2;
1946  0248 bee6          	ld	x,_SCI_Compute_Baudrate$L-26
1947  024a bfec          	ld	_SCI_Compute_Baudrate$L-20,x
1948  024c b6e7          	ld	a,_SCI_Compute_Baudrate$L-25
1949  024e b7ed          	ld	_SCI_Compute_Baudrate$L-19,a
1951  0250 2036          	jra	L5511
1952  0252               L7511:
1953                     ; 155     else if ( TPR2 == RPR1)
1955  0252 b6e9          	ld	a,_SCI_Compute_Baudrate$L-23
1956  0254 b1ee          	cp	a,_SCI_Compute_Baudrate$L-18
1957  0256 2616          	jrne	L3611
1958                     ; 157         Presc_Value = TPR2;
1960  0258 b6e9          	ld	a,_SCI_Compute_Baudrate$L-23
1961  025a b7f1          	ld	_SCI_Compute_Baudrate$L-15,a
1962                     ; 158         Tx_Value    = TR2;
1964  025c bee2          	ld	x,_SCI_Compute_Baudrate$L-30
1965  025e bfef          	ld	_SCI_Compute_Baudrate$L-17,x
1966  0260 b6e3          	ld	a,_SCI_Compute_Baudrate$L-29
1967  0262 b7f0          	ld	_SCI_Compute_Baudrate$L-16,a
1968                     ; 159         Rx_Value    = RR1;
1970  0264 bee4          	ld	x,_SCI_Compute_Baudrate$L-28
1971  0266 bfec          	ld	_SCI_Compute_Baudrate$L-20,x
1972  0268 b6e5          	ld	a,_SCI_Compute_Baudrate$L-27
1973  026a b7ed          	ld	_SCI_Compute_Baudrate$L-19,a
1975  026c 201a          	jra	L5511
1976  026e               L3611:
1977                     ; 161     else if ( TPR2 == RPR2)
1979  026e b6e9          	ld	a,_SCI_Compute_Baudrate$L-23
1980  0270 b1e8          	cp	a,_SCI_Compute_Baudrate$L-24
1981  0272 2622          	jrne	L7611
1982                     ; 163         Presc_Value = TPR2;
1984  0274 b6e9          	ld	a,_SCI_Compute_Baudrate$L-23
1985  0276 b7f1          	ld	_SCI_Compute_Baudrate$L-15,a
1986                     ; 164         Tx_Value    = TR2;
1988  0278 bee2          	ld	x,_SCI_Compute_Baudrate$L-30
1989  027a bfef          	ld	_SCI_Compute_Baudrate$L-17,x
1990  027c b6e3          	ld	a,_SCI_Compute_Baudrate$L-29
1991  027e b7f0          	ld	_SCI_Compute_Baudrate$L-16,a
1992                     ; 165         Rx_Value    = RR2;
1994  0280 bee6          	ld	x,_SCI_Compute_Baudrate$L-26
1995  0282 bfec          	ld	_SCI_Compute_Baudrate$L-20,x
1996  0284 b6e7          	ld	a,_SCI_Compute_Baudrate$L-25
1997  0286 b7ed          	ld	_SCI_Compute_Baudrate$L-19,a
1999  0288               L5511:
2000                     ; 191     if (Presc_Value == 1)
2002  0288 b6f1          	ld	a,_SCI_Compute_Baudrate$L-15
2003  028a a101          	cp	a,#1
2004  028c 2703          	jreq	L26
2005  028e cc031c        	jp	L7121
2006  0291               L26:
2007                     ; 193         Presc_Value = 0;
2009  0291 3ff1          	clr	_SCI_Compute_Baudrate$L-15
2011  0293 cc0338        	jp	L1221
2012  0296               L7611:
2013                     ; 169         for (temp1=0,count=1;temp1<1;count++)
2015  0296 3ff9          	clr	_SCI_Compute_Baudrate$L-7
2016  0298 3ffa          	clr	_SCI_Compute_Baudrate$L-6
2017  029a a601          	ld	a,#1
2018  029c b7f8          	ld	_SCI_Compute_Baudrate$L-8,a
2019  029e 3ff7          	clr	_SCI_Compute_Baudrate$L-9
2021  02a0 206b          	jp	L7711
2022  02a2               L3711:
2023                     ; 171             for (j=1; j<=128; j= j*2)
2025  02a2 a601          	ld	a,#1
2026  02a4 b7ff          	ld	_SCI_Compute_Baudrate$L-1,a
2027  02a6 3ffe          	clr	_SCI_Compute_Baudrate$L-2
2028  02a8               L3021:
2029                     ; 173                 if ( (TPR1*j) == Presc_Fact)
2031  02a8 b6f2          	ld	a,_SCI_Compute_Baudrate$L-14
2032  02aa 5f            	clr	x
2033  02ab 90befe        	ld	y,_SCI_Compute_Baudrate$L-2
2034  02ae 90bf00        	ld	c_y,y
2035  02b1 90beff        	ld	y,_SCI_Compute_Baudrate$L-1
2036  02b4 cd0000        	call	c_imul
2038  02b7 b1fc          	cp	a,_SCI_Compute_Baudrate$L-4
2039  02b9 2602          	jrne	L23
2040  02bb b3fb          	cp	x,_SCI_Compute_Baudrate$L-5
2041  02bd               L23:
2042  02bd 261a          	jrne	L1121
2043                     ; 175                     Presc_Value = TPR1; 
2045  02bf b6f2          	ld	a,_SCI_Compute_Baudrate$L-14
2046  02c1 b7f1          	ld	_SCI_Compute_Baudrate$L-15,a
2047                     ; 176                     Tx_Value = TR1; 
2049  02c3 beea          	ld	x,_SCI_Compute_Baudrate$L-22
2050  02c5 bfef          	ld	_SCI_Compute_Baudrate$L-17,x
2051  02c7 b6eb          	ld	a,_SCI_Compute_Baudrate$L-21
2052  02c9 b7f0          	ld	_SCI_Compute_Baudrate$L-16,a
2053                     ; 177                     Rx_Value = j;
2055  02cb befe          	ld	x,_SCI_Compute_Baudrate$L-2
2056  02cd bfec          	ld	_SCI_Compute_Baudrate$L-20,x
2057  02cf b6ff          	ld	a,_SCI_Compute_Baudrate$L-1
2058  02d1 b7ed          	ld	_SCI_Compute_Baudrate$L-19,a
2059                     ; 178                     temp1++; 
2061  02d3 3cfa          	inc	_SCI_Compute_Baudrate$L-6
2062  02d5 2602          	jrne	L43
2063  02d7 3cf9          	inc	_SCI_Compute_Baudrate$L-7
2064  02d9               L43:
2065  02d9               L1121:
2066                     ; 171             for (j=1; j<=128; j= j*2)
2068  02d9 38ff          	sll	_SCI_Compute_Baudrate$L-1
2069  02db 39fe          	rlc	_SCI_Compute_Baudrate$L-2
2072  02dd b6ff          	ld	a,_SCI_Compute_Baudrate$L-1
2073  02df a081          	sub	a,#129
2074  02e1 b6fe          	ld	a,_SCI_Compute_Baudrate$L-2
2075  02e3 a200          	sbc	a,#0
2076  02e5 25c1          	jrult	L3021
2077                     ; 181             if(count%2 == 0)
2079  02e7 b6f8          	ld	a,_SCI_Compute_Baudrate$L-8
2080  02e9 a501          	bcp	a,#1
2081  02eb 260e          	jrne	L3121
2082                     ; 183                 Presc_Fact = Presc_Fact+count;
2084  02ed b6fc          	ld	a,_SCI_Compute_Baudrate$L-4
2085  02ef bbf8          	add	a,_SCI_Compute_Baudrate$L-8
2086  02f1 b7fc          	ld	_SCI_Compute_Baudrate$L-4,a
2087  02f3 b6fb          	ld	a,_SCI_Compute_Baudrate$L-5
2088  02f5 b9f7          	adc	a,_SCI_Compute_Baudrate$L-9
2089  02f7 b7fb          	ld	_SCI_Compute_Baudrate$L-5,a
2091  02f9 200c          	jra	L5121
2092  02fb               L3121:
2093                     ; 187                 Presc_Fact = Presc_Fact-count;
2095  02fb b6fc          	ld	a,_SCI_Compute_Baudrate$L-4
2096  02fd b0f8          	sub	a,_SCI_Compute_Baudrate$L-8
2097  02ff b7fc          	ld	_SCI_Compute_Baudrate$L-4,a
2098  0301 b6fb          	ld	a,_SCI_Compute_Baudrate$L-5
2099  0303 b2f7          	sbc	a,_SCI_Compute_Baudrate$L-9
2100  0305 b7fb          	ld	_SCI_Compute_Baudrate$L-5,a
2101  0307               L5121:
2102                     ; 169         for (temp1=0,count=1;temp1<1;count++)
2104  0307 3cf8          	inc	_SCI_Compute_Baudrate$L-8
2105  0309 2602          	jrne	L63
2106  030b 3cf7          	inc	_SCI_Compute_Baudrate$L-9
2107  030d               L63:
2108  030d               L7711:
2111  030d b6fa          	ld	a,_SCI_Compute_Baudrate$L-6
2112  030f a001          	sub	a,#1
2113  0311 b6f9          	ld	a,_SCI_Compute_Baudrate$L-7
2114  0313 a200          	sbc	a,#0
2115  0315 2402          	jruge	L46
2116  0317 2089          	jp	L3711
2117  0319               L46:
2118  0319 cc0288        	jp	L5511
2119  031c               L7121:
2120                     ; 195     else if (Presc_Value == 3)
2122  031c b6f1          	ld	a,_SCI_Compute_Baudrate$L-15
2123  031e a103          	cp	a,#3
2124  0320 2606          	jrne	L3221
2125                     ; 197         Presc_Value = 1;
2127  0322 a601          	ld	a,#1
2128  0324 b7f1          	ld	_SCI_Compute_Baudrate$L-15,a
2130  0326 2010          	jra	L1221
2131  0328               L3221:
2132                     ; 199     else if (Presc_Value == 4)
2134  0328 b6f1          	ld	a,_SCI_Compute_Baudrate$L-15
2135  032a a104          	cp	a,#4
2136  032c 2606          	jrne	L7221
2137                     ; 201         Presc_Value = 2;
2139  032e a602          	ld	a,#2
2140  0330 b7f1          	ld	_SCI_Compute_Baudrate$L-15,a
2142  0332 2004          	jra	L1221
2143  0334               L7221:
2144                     ; 205         Presc_Value = 3;
2146  0334 a603          	ld	a,#3
2147  0336 b7f1          	ld	_SCI_Compute_Baudrate$L-15,a
2148  0338               L1221:
2149                     ; 207     for (i=0,j=1; j<=128; j=j*2)
2151  0338 3ffd          	clr	_SCI_Compute_Baudrate$L-3
2152  033a a601          	ld	a,#1
2153  033c b7ff          	ld	_SCI_Compute_Baudrate$L-1,a
2154  033e 3ffe          	clr	_SCI_Compute_Baudrate$L-2
2155  0340               L3321:
2156                     ; 209         if ( j == Tx_Value )
2158  0340 b6ff          	ld	a,_SCI_Compute_Baudrate$L-1
2159  0342 b1f0          	cp	a,_SCI_Compute_Baudrate$L-16
2160  0344 2604          	jrne	L04
2161  0346 befe          	ld	x,_SCI_Compute_Baudrate$L-2
2162  0348 b3ef          	cp	x,_SCI_Compute_Baudrate$L-17
2163  034a               L04:
2164  034a 2607          	jrne	L1421
2165                     ; 211             Tx_Value = i;
2167  034c b6fd          	ld	a,_SCI_Compute_Baudrate$L-3
2168  034e 5f            	clr	x
2169  034f b7f0          	ld	_SCI_Compute_Baudrate$L-16,a
2170  0351 bfef          	ld	_SCI_Compute_Baudrate$L-17,x
2171  0353               L1421:
2172                     ; 213         i++;
2174  0353 3cfd          	inc	_SCI_Compute_Baudrate$L-3
2175                     ; 207     for (i=0,j=1; j<=128; j=j*2)
2177  0355 38ff          	sll	_SCI_Compute_Baudrate$L-1
2178  0357 39fe          	rlc	_SCI_Compute_Baudrate$L-2
2181  0359 b6ff          	ld	a,_SCI_Compute_Baudrate$L-1
2182  035b a081          	sub	a,#129
2183  035d b6fe          	ld	a,_SCI_Compute_Baudrate$L-2
2184  035f a200          	sbc	a,#0
2185  0361 25dd          	jrult	L3321
2186                     ; 215     for (i=0,j=1; j<=128; j=j*2)
2188  0363 3ffd          	clr	_SCI_Compute_Baudrate$L-3
2189  0365 a601          	ld	a,#1
2190  0367 b7ff          	ld	_SCI_Compute_Baudrate$L-1,a
2191  0369 3ffe          	clr	_SCI_Compute_Baudrate$L-2
2192  036b               L3421:
2193                     ; 217     if ( j == Rx_Value )
2195  036b b6ff          	ld	a,_SCI_Compute_Baudrate$L-1
2196  036d b1ed          	cp	a,_SCI_Compute_Baudrate$L-19
2197  036f 2604          	jrne	L24
2198  0371 befe          	ld	x,_SCI_Compute_Baudrate$L-2
2199  0373 b3ec          	cp	x,_SCI_Compute_Baudrate$L-20
2200  0375               L24:
2201  0375 2607          	jrne	L1521
2202                     ; 219             Rx_Value = i;
2204  0377 b6fd          	ld	a,_SCI_Compute_Baudrate$L-3
2205  0379 5f            	clr	x
2206  037a b7ed          	ld	_SCI_Compute_Baudrate$L-19,a
2207  037c bfec          	ld	_SCI_Compute_Baudrate$L-20,x
2208  037e               L1521:
2209                     ; 221         i++;
2211  037e 3cfd          	inc	_SCI_Compute_Baudrate$L-3
2212                     ; 215     for (i=0,j=1; j<=128; j=j*2)
2214  0380 38ff          	sll	_SCI_Compute_Baudrate$L-1
2215  0382 39fe          	rlc	_SCI_Compute_Baudrate$L-2
2218  0384 b6ff          	ld	a,_SCI_Compute_Baudrate$L-1
2219  0386 a081          	sub	a,#129
2220  0388 b6fe          	ld	a,_SCI_Compute_Baudrate$L-2
2221  038a a200          	sbc	a,#0
2222  038c 25dd          	jrult	L3421
2223                     ; 223     Presc_Value <<= 6 ;
2225  038e b6f1          	ld	a,_SCI_Compute_Baudrate$L-15
2226  0390 4e            	swap	a
2227  0391 48            	sll	a
2228  0392 48            	sll	a
2229  0393 a4c0          	and	a,#192
2230  0395 b7f1          	ld	_SCI_Compute_Baudrate$L-15,a
2231                     ; 224     SCIBRR &= SCI_PR ;  
2233  0397 b652          	ld	a,_SCIBRR
2234  0399 a43f          	and	a,#63
2235  039b b752          	ld	_SCIBRR,a
2236                     ; 225     SCIBRR |= Presc_Value ;                             /*Loads the prescalar*/
2238  039d b652          	ld	a,_SCIBRR
2239  039f baf1          	or	a,_SCI_Compute_Baudrate$L-15
2240  03a1 b752          	ld	_SCIBRR,a
2241                     ; 227     Tx_Value <<= 3 ;                     /*Loads the transmitter rate divisor*/
2243  03a3 a603          	ld	a,#3
2244  03a5               L44:
2245  03a5 38f0          	sll	_SCI_Compute_Baudrate$L-16
2246  03a7 39ef          	rlc	_SCI_Compute_Baudrate$L-17
2247  03a9 4a            	dec	a
2248  03aa 26f9          	jrne	L44
2249                     ; 228     SCIBRR &= SCI_TR ;
2251  03ac b652          	ld	a,_SCIBRR
2252  03ae a4c7          	and	a,#199
2253  03b0 b752          	ld	_SCIBRR,a
2254                     ; 229     SCIBRR |= (BYTE)Tx_Value ;
2256  03b2 b652          	ld	a,_SCIBRR
2257  03b4 baf0          	or	a,_SCI_Compute_Baudrate$L-16
2258  03b6 b752          	ld	_SCIBRR,a
2259                     ; 231     SCIBRR &= SCI_RR ;                      /*Loads the receiver rate divisor*/
2261  03b8 b652          	ld	a,_SCIBRR
2262  03ba a4f8          	and	a,#248
2263  03bc b752          	ld	_SCIBRR,a
2264                     ; 232     SCIBRR |= (BYTE)Rx_Value ;
2266  03be b652          	ld	a,_SCIBRR
2267  03c0 baed          	or	a,_SCI_Compute_Baudrate$L-19
2268  03c2 b752          	ld	_SCIBRR,a
2269                     ; 233 }
2272  03c4 81            	ret
2312                     ; 236 void SCI_Init(void)
2312                     ; 237 {
2313                     	switch	.text
2315                     	xref.b	_SCI_Init$L
2316  03c5               _SCI_Init:
2319                     ; 240 	byTemp = SCISR; //Touch registers to remove pending interrupt
2321  03c5 b650          	ld	a,_SCISR
2322  03c7 b7ff          	ld	_SCI_Init$L-1,a
2323                     ; 241 	byTemp = SCIDR; //Touch registers to remove pending interrupt	
2325  03c9 b651          	ld	a,_SCIDR
2326  03cb b7ff          	ld	_SCI_Init$L-1,a
2327                     ; 271 	SCICR1 = 0b00000000;
2329  03cd 3f53          	clr	_SCICR1
2330                     ; 307 	SCICR2 = 0b00011100;
2332  03cf a61c          	ld	a,#28
2333  03d1 b754          	ld	_SCICR2,a
2334                     ; 313 	SCIBRR = 0b00010010; //PR=1 TR=RR=4 ETPR=ERPR=10 fcpu=3.1 --> 4800 bps
2336  03d3 a612          	ld	a,#18
2337  03d5 b752          	ld	_SCIBRR,a
2338                     ; 320 	SCIERPR = 0x0A;
2340  03d7 a60a          	ld	a,#10
2341  03d9 b755          	ld	_SCIERPR,a
2342                     ; 328 	SCIETPR = 0x0A;
2344  03db a60a          	ld	a,#10
2345  03dd b757          	ld	_SCIETPR,a
2346                     ; 342 }
2349  03df 81            	ret
2394                     ; 345 void SCI_SendByte ( BYTE a_byData)
2394                     ; 346 {
2395                     	switch	.text
2397                     	xref.b	_SCI_SendByte$L
2398  03e0               _SCI_SendByte:
2400  03e0 b700          	ld	_SCI_SendByte$L,a
2402                     ; 348 	byTemp = SCISR; // Reset TDRE bit
2404  03e2 b650          	ld	a,_SCISR
2405  03e4 b7ff          	ld	_SCI_SendByte$L-1,a
2406                     ; 349 	SCIDR = a_byData;
2408  03e6 b600          	ld	a,_SCI_SendByte$L
2409  03e8 b751          	ld	_SCIDR,a
2411  03ea 2001          	jra	L7131
2412  03ec               L3131:
2413                     ; 353 		Nop();			
2416  03ec 9d            nop
2418  03ed               L7131:
2419                     ; 351 	while (!_btst(SCISR, SCI_SR_TDRE))
2421  03ed b650          	ld	a,_SCISR
2422  03ef a580          	bcp	a,#128
2423  03f1 27f9          	jreq	L3131
2424                     ; 355 }
2427  03f3 81            	ret
2473                     ; 359 void SCI_SendString (STRING a_strData)
2473                     ; 360 {
2474                     	switch	.text
2476                     	xref.b	_SCI_SendString$L
2477  03f4               _SCI_SendString:
2479  03f4 b701          	ld	_SCI_SendString$L+1,a
2480  03f6 bf00          	ld	_SCI_SendString$L,x
2482                     ; 362 	byTemp = SCISR; // Reset TDRE bit
2484  03f8 b650          	ld	a,_SCISR
2485  03fa b7ff          	ld	_SCI_SendString$L-1,a
2487  03fc 2014          	jra	L1531
2488  03fe               L5431:
2489                     ; 366 		SCIDR = (BYTE) (*a_strData);
2491  03fe 92c600        	ld	a,[_SCI_SendString$L.w]
2492  0401 b751          	ld	_SCIDR,a
2493                     ; 367 		a_strData++; //Next char
2495  0403 3c01          	inc	_SCI_SendString$L+1
2496  0405 2602          	jrne	L47
2497  0407 3c00          	inc	_SCI_SendString$L
2498  0409               L47:
2500  0409 2001          	jra	L7531
2501  040b               L5531:
2502                     ; 370 			Nop();			
2505  040b 9d            nop
2507  040c               L7531:
2508                     ; 368 		while (!_btst(SCISR, SCI_SR_TDRE))
2510  040c b650          	ld	a,_SCISR
2511  040e a580          	bcp	a,#128
2512  0410 27f9          	jreq	L5531
2513  0412               L1531:
2514                     ; 364 	while((*a_strData) != 0x00)
2516  0412 92c600        	ld	a,[_SCI_SendString$L.w]
2517  0415 4d            	tnz	a
2518  0416 26e6          	jrne	L5431
2519                     ; 373 }
2522  0418 81            	ret
2557                     ; 377 void SCI_DataReceived(void)
2557                     ; 378 {
2558                     	switch	.text
2559  0419               _SCI_DataReceived:
2561  0419 9089          	push	y
2562       00000101      OFST:	set	257
2563  041b b601          	ld	a,c_x+1
2564  041d 88            	push	a
2565  041e b600          	ld	a,c_x
2566  0420 88            	push	a
2567  0421 b601          	ld	a,c_y+1
2568  0423 88            	push	a
2569  0424 b600          	ld	a,c_y
2570  0426 88            	push	a
2571  0427 88            	push	a
2574                     ; 388 	byTemp = SCISR;
2576  0428 96            	ld	x,s
2577  0429 b650          	ld	a,_SCISR
2578  042b d70101        	ld	(OFST+0,x),a
2579                     ; 390     if(byTemp & SCI_ORE)      	/*If Interrupt is generated due to overrun error*/
2581  042e 96            	ld	x,s
2582  042f d60101        	ld	a,(OFST+0,x)
2583  0432 a508          	bcp	a,#8
2584  0434 270a          	jreq	L7731
2585                     ; 392         byTemp = SCIDR;    
2587  0436 96            	ld	x,s
2588  0437 b651          	ld	a,_SCIDR
2589  0439 d70101        	ld	(OFST+0,x),a
2590                     ; 393 		_bres(_Pa_Led_D4, _Pin_Led_D4);
2592  043c 190c          	bres	_PEDR,#4
2594  043e 205b          	jra	L1041
2595  0440               L7731:
2596                     ; 395     else if (byTemp & SCI_RDRF)	/*If Interrupt is generated due to received data flag*/
2598  0440 96            	ld	x,s
2599  0441 d60101        	ld	a,(OFST+0,x)
2600  0444 a520          	bcp	a,#32
2601  0446 2747          	jreq	L3041
2602                     ; 397 		if(byTemp & SCI_NE) // Noise
2604  0448 96            	ld	x,s
2605  0449 d60101        	ld	a,(OFST+0,x)
2606  044c a504          	bcp	a,#4
2607  044e 270a          	jreq	L5041
2608                     ; 399 			byTemp = SCIDR;    
2610  0450 96            	ld	x,s
2611  0451 b651          	ld	a,_SCIDR
2612  0453 d70101        	ld	(OFST+0,x),a
2613                     ; 400 			_bset(_Pa_Led_D3, _Pin_Led_D3);
2615  0456 1a0c          	bset	_PEDR,#5
2617  0458 2041          	jra	L1041
2618  045a               L5041:
2619                     ; 402 		else if(byTemp & SCI_FE) // Framing Error
2621  045a 96            	ld	x,s
2622  045b d60101        	ld	a,(OFST+0,x)
2623  045e a502          	bcp	a,#2
2624  0460 270a          	jreq	L1141
2625                     ; 404 			byTemp = SCIDR;    
2627  0462 96            	ld	x,s
2628  0463 b651          	ld	a,_SCIDR
2629  0465 d70101        	ld	(OFST+0,x),a
2630                     ; 405 			_bset(_Pa_Led_D1, _Pin_Led_D1);
2632  0468 1e0c          	bset	_PEDR,#7
2634  046a 202f          	jra	L1041
2635  046c               L1141:
2636                     ; 407 		else if(byTemp & SCI_PE) // Parity Error
2638  046c 96            	ld	x,s
2639  046d d60101        	ld	a,(OFST+0,x)
2640  0470 a501          	bcp	a,#1
2641  0472 2714          	jreq	L5141
2642                     ; 409 			byTemp = SCIDR;    
2644  0474 96            	ld	x,s
2645  0475 b651          	ld	a,_SCIDR
2646  0477 d70101        	ld	(OFST+0,x),a
2647                     ; 410 			_switch(_Pa_Led_D4, _Pin_Led_D4);
2649  047a b60c          	ld	a,_PEDR
2650  047c a510          	bcp	a,#16
2651  047e 2704          	jreq	L7141
2654  0480 190c          	bres	_PEDR,#4
2656  0482 2017          	jra	L1041
2657  0484               L7141:
2660  0484 180c          	bset	_PEDR,#4
2661  0486 2013          	jra	L1041
2662  0488               L5141:
2663                     ; 414 			FIFO_PutByte(SCIDR);	
2665  0488 b651          	ld	a,_SCIDR
2666  048a cd0000        	call	_FIFO_PutByte
2668  048d 200c          	jra	L1041
2669  048f               L3041:
2670                     ; 419 		_switch(_Pa_Led_D1, _Pin_Led_D1);		
2672  048f b60c          	ld	a,_PEDR
2673  0491 a580          	bcp	a,#128
2674  0493 2704          	jreq	L7241
2677  0495 1f0c          	bres	_PEDR,#7
2679  0497 2002          	jra	L1041
2680  0499               L7241:
2683  0499 1e0c          	bset	_PEDR,#7
2684  049b               L1041:
2685                     ; 421 }
2688  049b 84            	pop	a
2689  049c 84            	pop	a
2690  049d b700          	ld	c_y,a
2691  049f 84            	pop	a
2692  04a0 b701          	ld	c_y+1,a
2693  04a2 84            	pop	a
2694  04a3 b700          	ld	c_x,a
2695  04a5 84            	pop	a
2696  04a6 b701          	ld	c_x+1,a
2697  04a8 9085          	pop	y
2698  04aa 80            	iret
2722                     	xdef	_SCI_DataReceived
2723                     	xdef	_Pr_Value
2724                     	xdef	_SCI_SendString
2725                     	xdef	_SCI_SendByte
2726                     	xdef	_SCI_Compute_Baudrate
2727                     	xdef	_SCI_Init
2728                     	xref	_FIFO_PutByte
2729                     	xref.b	c_lreg
2730                     	xref.b	c_x
2731                     	xref.b	c_y
2750                     	xref	c_lgsub
2751                     	xref	c_lgadd
2752                     	xref	c_imul
2753                     	xref	c_lursh
2754                     	xref	c_ltor
2755                     	xref	c_ludv
2756                     	xref	c_rtol
2757                     	xref	c_uitol
2758                     	end
