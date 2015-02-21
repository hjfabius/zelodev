   1                     ; C Compiler for ST7 (COSMIC Software)
   2                     ; Generator V4.5.5 - 12 Jan 2006
1280                     .const:	section	.text
1281  0000               L327_mc_byApplicationVersion:
1282  0000 9d            	dc.b	157
1313                     	switch	.data
1314  0000               _Pr_Value:
1315  0000 01            	dc.b	1
1316  0001 03            	dc.b	3
1317  0002 04            	dc.b	4
1318  0003 0d            	dc.b	13
1523                     ; 63 void SCI_Compute_Baudrate(WORD BaudRate_Tx, WORD BaudRate_Rx)
1523                     ; 64 {
1524                     	switch	.text
1526                     	xref.b	_SCI_Compute_Baudrate$L
1527  0000               _SCI_Compute_Baudrate:
1529  0000 b701          	ld	_SCI_Compute_Baudrate$L+1,a
1530  0002 bf00          	ld	_SCI_Compute_Baudrate$L,x
1532                     ; 70     TPR1 = 0;
1534  0004 3ff2          	clr	_SCI_Compute_Baudrate$L-14
1535                     ; 71     TPR2 = 0;
1537  0006 3fe9          	clr	_SCI_Compute_Baudrate$L-23
1538                     ; 72     RPR1 = 0;
1540  0008 3fee          	clr	_SCI_Compute_Baudrate$L-18
1541                     ; 73     RPR2 = 0; 
1543  000a 3fe8          	clr	_SCI_Compute_Baudrate$L-24
1544                     ; 74     temp = 0; 
1546  000c a600          	ld	a,#0
1547  000e b7f6          	ld	_SCI_Compute_Baudrate$L-10,a
1548  0010 a600          	ld	a,#0
1549  0012 b7f5          	ld	_SCI_Compute_Baudrate$L-11,a
1550  0014 a600          	ld	a,#0
1551  0016 b7f4          	ld	_SCI_Compute_Baudrate$L-12,a
1552  0018 a600          	ld	a,#0
1553  001a b7f3          	ld	_SCI_Compute_Baudrate$L-13,a
1554                     ; 76     temp = Fcpu/BaudRate_Tx;                       
1556  001c b601          	ld	a,_SCI_Compute_Baudrate$L+1
1557  001e be00          	ld	x,_SCI_Compute_Baudrate$L
1558  0020 cd0000        	call	c_uitol
1560  0023 aede          	ld	x,#_SCI_Compute_Baudrate$L-34
1561  0025 cd0000        	call	c_rtol
1563  0028 a600          	ld	a,#0
1564  002a b703          	ld	c_lreg+3,a
1565  002c a612          	ld	a,#18
1566  002e b702          	ld	c_lreg+2,a
1567  0030 a67a          	ld	a,#122
1568  0032 b701          	ld	c_lreg+1,a
1569  0034 a600          	ld	a,#0
1570  0036 b700          	ld	c_lreg,a
1571  0038 aede          	ld	x,#_SCI_Compute_Baudrate$L-34
1572  003a cd0000        	call	c_ludv
1574  003d aef3          	ld	x,#_SCI_Compute_Baudrate$L-13
1575  003f cd0000        	call	c_rtol
1577                     ; 77     for (temp1 = 0,count = 1;temp1 < 1;count++)    
1579  0042 3ff9          	clr	_SCI_Compute_Baudrate$L-7
1580  0044 3ffa          	clr	_SCI_Compute_Baudrate$L-6
1581  0046 a601          	ld	a,#1
1582  0048 b7f8          	ld	_SCI_Compute_Baudrate$L-8,a
1583  004a 3ff7          	clr	_SCI_Compute_Baudrate$L-9
1585  004c cc010e        	jp	L1011
1586  004f               L5701:
1587                     ; 79         Presc_Fact = ((WORD)(temp/16)) ;
1589  004f aef3          	ld	x,#_SCI_Compute_Baudrate$L-13
1590  0051 cd0000        	call	c_ltor
1592  0054 a604          	ld	a,#4
1593  0056 cd0000        	call	c_lursh
1595  0059 b603          	ld	a,c_lreg+3
1596  005b be02          	ld	x,c_lreg+2
1597  005d b7fc          	ld	_SCI_Compute_Baudrate$L-4,a
1598  005f bffb          	ld	_SCI_Compute_Baudrate$L-5,x
1599                     ; 80         for (i = 0; i != 4; i++)
1601  0061 3ffd          	clr	_SCI_Compute_Baudrate$L-3
1602  0063               L5011:
1603                     ; 82             for (j = 1; j <= 128; j = j*2)
1605  0063 a601          	ld	a,#1
1606  0065 b7ff          	ld	_SCI_Compute_Baudrate$L-1,a
1607  0067 3ffe          	clr	_SCI_Compute_Baudrate$L-2
1608  0069               L3111:
1609                     ; 84                 if ( ((Pr_Value[i]*j) == Presc_Fact) && (TPR1 == 0) )
1611  0069 befd          	ld	x,_SCI_Compute_Baudrate$L-3
1612  006b d60000        	ld	a,(_Pr_Value,x)
1613  006e 5f            	clr	x
1614  006f 90befe        	ld	y,_SCI_Compute_Baudrate$L-2
1615  0072 90bf00        	ld	c_y,y
1616  0075 90beff        	ld	y,_SCI_Compute_Baudrate$L-1
1617  0078 cd0000        	call	c_imul
1619  007b b1fc          	cp	a,_SCI_Compute_Baudrate$L-4
1620  007d 2602          	jrne	L6
1621  007f b3fb          	cp	x,_SCI_Compute_Baudrate$L-5
1622  0081               L6:
1623  0081 261b          	jrne	L1211
1625  0083 3df2          	tnz	_SCI_Compute_Baudrate$L-14
1626  0085 2617          	jrne	L1211
1627                     ; 86                     TPR1 = Pr_Value[i];     /*Prescalar value for Transmitter*/
1629  0087 befd          	ld	x,_SCI_Compute_Baudrate$L-3
1630  0089 d60000        	ld	a,(_Pr_Value,x)
1631  008c b7f2          	ld	_SCI_Compute_Baudrate$L-14,a
1632                     ; 87                     TR1  = j;                      /*Transmitter rate divisor*/
1634  008e befe          	ld	x,_SCI_Compute_Baudrate$L-2
1635  0090 bfea          	ld	_SCI_Compute_Baudrate$L-22,x
1636  0092 b6ff          	ld	a,_SCI_Compute_Baudrate$L-1
1637  0094 b7eb          	ld	_SCI_Compute_Baudrate$L-21,a
1638                     ; 88                     temp1++;
1640  0096 3cfa          	inc	_SCI_Compute_Baudrate$L-6
1641  0098 2602          	jrne	L01
1642  009a 3cf9          	inc	_SCI_Compute_Baudrate$L-7
1643  009c               L01:
1645  009c 202f          	jra	L3211
1646  009e               L1211:
1647                     ; 90                 else if ((Pr_Value[i]*j) == Presc_Fact)
1649  009e befd          	ld	x,_SCI_Compute_Baudrate$L-3
1650  00a0 d60000        	ld	a,(_Pr_Value,x)
1651  00a3 5f            	clr	x
1652  00a4 90befe        	ld	y,_SCI_Compute_Baudrate$L-2
1653  00a7 90bf00        	ld	c_y,y
1654  00aa 90beff        	ld	y,_SCI_Compute_Baudrate$L-1
1655  00ad cd0000        	call	c_imul
1657  00b0 b1fc          	cp	a,_SCI_Compute_Baudrate$L-4
1658  00b2 2602          	jrne	L21
1659  00b4 b3fb          	cp	x,_SCI_Compute_Baudrate$L-5
1660  00b6               L21:
1661  00b6 2615          	jrne	L3211
1662                     ; 92                     TPR2 = Pr_Value[i]; 
1664  00b8 befd          	ld	x,_SCI_Compute_Baudrate$L-3
1665  00ba d60000        	ld	a,(_Pr_Value,x)
1666  00bd b7e9          	ld	_SCI_Compute_Baudrate$L-23,a
1667                     ; 94                     TR2 = j;               /*Another Transmitter rate divisor*/
1669  00bf befe          	ld	x,_SCI_Compute_Baudrate$L-2
1670  00c1 bfe2          	ld	_SCI_Compute_Baudrate$L-30,x
1671  00c3 b6ff          	ld	a,_SCI_Compute_Baudrate$L-1
1672  00c5 b7e3          	ld	_SCI_Compute_Baudrate$L-29,a
1673                     ; 95                     temp1++;
1675  00c7 3cfa          	inc	_SCI_Compute_Baudrate$L-6
1676  00c9 2602          	jrne	L41
1677  00cb 3cf9          	inc	_SCI_Compute_Baudrate$L-7
1678  00cd               L41:
1679  00cd               L3211:
1680                     ; 82             for (j = 1; j <= 128; j = j*2)
1682  00cd 38ff          	sll	_SCI_Compute_Baudrate$L-1
1683  00cf 39fe          	rlc	_SCI_Compute_Baudrate$L-2
1686  00d1 b6ff          	ld	a,_SCI_Compute_Baudrate$L-1
1687  00d3 a081          	sub	a,#129
1688  00d5 b6fe          	ld	a,_SCI_Compute_Baudrate$L-2
1689  00d7 a200          	sbc	a,#0
1690  00d9 2402          	jruge	L64
1691  00db 208c          	jp	L3111
1692  00dd               L64:
1693                     ; 80         for (i = 0; i != 4; i++)
1695  00dd 3cfd          	inc	_SCI_Compute_Baudrate$L-3
1698  00df b6fd          	ld	a,_SCI_Compute_Baudrate$L-3
1699  00e1 a104          	cp	a,#4
1700  00e3 2703          	jreq	L05
1701  00e5 cc0063        	jp	L5011
1702  00e8               L05:
1703                     ; 99         if(count%2 == 0)      /*Changes the temp value if no prescalar factor
1705  00e8 b6f8          	ld	a,_SCI_Compute_Baudrate$L-8
1706  00ea a501          	bcp	a,#1
1707  00ec 260e          	jrne	L7211
1708                     ; 102             temp = temp + count;                           
1710  00ee b6f8          	ld	a,_SCI_Compute_Baudrate$L-8
1711  00f0 bef7          	ld	x,_SCI_Compute_Baudrate$L-9
1712  00f2 cd0000        	call	c_uitol
1714  00f5 aef3          	ld	x,#_SCI_Compute_Baudrate$L-13
1715  00f7 cd0000        	call	c_lgadd
1718  00fa 200c          	jra	L1311
1719  00fc               L7211:
1720                     ; 106             temp = temp - count;
1722  00fc b6f8          	ld	a,_SCI_Compute_Baudrate$L-8
1723  00fe bef7          	ld	x,_SCI_Compute_Baudrate$L-9
1724  0100 cd0000        	call	c_uitol
1726  0103 aef3          	ld	x,#_SCI_Compute_Baudrate$L-13
1727  0105 cd0000        	call	c_lgsub
1729  0108               L1311:
1730                     ; 77     for (temp1 = 0,count = 1;temp1 < 1;count++)    
1732  0108 3cf8          	inc	_SCI_Compute_Baudrate$L-8
1733  010a 2602          	jrne	L61
1734  010c 3cf7          	inc	_SCI_Compute_Baudrate$L-9
1735  010e               L61:
1736  010e               L1011:
1739  010e b6fa          	ld	a,_SCI_Compute_Baudrate$L-6
1740  0110 a001          	sub	a,#1
1741  0112 b6f9          	ld	a,_SCI_Compute_Baudrate$L-7
1742  0114 a200          	sbc	a,#0
1743  0116 2403          	jruge	L25
1744  0118 cc004f        	jp	L5701
1745  011b               L25:
1746                     ; 109     temp = Fcpu/BaudRate_Rx; 
1748  011b b603          	ld	a,_SCI_Compute_Baudrate$L+3
1749  011d be02          	ld	x,_SCI_Compute_Baudrate$L+2
1750  011f cd0000        	call	c_uitol
1752  0122 aede          	ld	x,#_SCI_Compute_Baudrate$L-34
1753  0124 cd0000        	call	c_rtol
1755  0127 a600          	ld	a,#0
1756  0129 b703          	ld	c_lreg+3,a
1757  012b a612          	ld	a,#18
1758  012d b702          	ld	c_lreg+2,a
1759  012f a67a          	ld	a,#122
1760  0131 b701          	ld	c_lreg+1,a
1761  0133 a600          	ld	a,#0
1762  0135 b700          	ld	c_lreg,a
1763  0137 aede          	ld	x,#_SCI_Compute_Baudrate$L-34
1764  0139 cd0000        	call	c_ludv
1766  013c aef3          	ld	x,#_SCI_Compute_Baudrate$L-13
1767  013e cd0000        	call	c_rtol
1769                     ; 110     for (temp1 = 0,count = 1;temp1 < 1;count++)
1771  0141 3ff9          	clr	_SCI_Compute_Baudrate$L-7
1772  0143 3ffa          	clr	_SCI_Compute_Baudrate$L-6
1773  0145 a601          	ld	a,#1
1774  0147 b7f8          	ld	_SCI_Compute_Baudrate$L-8,a
1775  0149 3ff7          	clr	_SCI_Compute_Baudrate$L-9
1777  014b cc020d        	jp	L7311
1778  014e               L3311:
1779                     ; 112         Presc_Fact = (WORD)(temp/16); 
1781  014e aef3          	ld	x,#_SCI_Compute_Baudrate$L-13
1782  0150 cd0000        	call	c_ltor
1784  0153 a604          	ld	a,#4
1785  0155 cd0000        	call	c_lursh
1787  0158 b603          	ld	a,c_lreg+3
1788  015a be02          	ld	x,c_lreg+2
1789  015c b7fc          	ld	_SCI_Compute_Baudrate$L-4,a
1790  015e bffb          	ld	_SCI_Compute_Baudrate$L-5,x
1791                     ; 113         for (i = 0; i != 4; i++)
1793  0160 3ffd          	clr	_SCI_Compute_Baudrate$L-3
1794  0162               L3411:
1795                     ; 115             for (j = 1; j <= 128; j = j*2)
1797  0162 a601          	ld	a,#1
1798  0164 b7ff          	ld	_SCI_Compute_Baudrate$L-1,a
1799  0166 3ffe          	clr	_SCI_Compute_Baudrate$L-2
1800  0168               L1511:
1801                     ; 117                 if (((Pr_Value[i]*j) == Presc_Fact) && (RPR1 == 0))
1803  0168 befd          	ld	x,_SCI_Compute_Baudrate$L-3
1804  016a d60000        	ld	a,(_Pr_Value,x)
1805  016d 5f            	clr	x
1806  016e 90befe        	ld	y,_SCI_Compute_Baudrate$L-2
1807  0171 90bf00        	ld	c_y,y
1808  0174 90beff        	ld	y,_SCI_Compute_Baudrate$L-1
1809  0177 cd0000        	call	c_imul
1811  017a b1fc          	cp	a,_SCI_Compute_Baudrate$L-4
1812  017c 2602          	jrne	L02
1813  017e b3fb          	cp	x,_SCI_Compute_Baudrate$L-5
1814  0180               L02:
1815  0180 261b          	jrne	L7511
1817  0182 3dee          	tnz	_SCI_Compute_Baudrate$L-18
1818  0184 2617          	jrne	L7511
1819                     ; 119                     RPR1 = Pr_Value[i];        /*Prescalar value for Receiver*/
1821  0186 befd          	ld	x,_SCI_Compute_Baudrate$L-3
1822  0188 d60000        	ld	a,(_Pr_Value,x)
1823  018b b7ee          	ld	_SCI_Compute_Baudrate$L-18,a
1824                     ; 120                     RR1    = j;                       /*Receiver rate divisor*/
1826  018d befe          	ld	x,_SCI_Compute_Baudrate$L-2
1827  018f bfe4          	ld	_SCI_Compute_Baudrate$L-28,x
1828  0191 b6ff          	ld	a,_SCI_Compute_Baudrate$L-1
1829  0193 b7e5          	ld	_SCI_Compute_Baudrate$L-27,a
1830                     ; 121                     temp1++;
1832  0195 3cfa          	inc	_SCI_Compute_Baudrate$L-6
1833  0197 2602          	jrne	L22
1834  0199 3cf9          	inc	_SCI_Compute_Baudrate$L-7
1835  019b               L22:
1837  019b 202f          	jra	L1611
1838  019d               L7511:
1839                     ; 123                 else if ((Pr_Value[i]*j) == Presc_Fact)
1841  019d befd          	ld	x,_SCI_Compute_Baudrate$L-3
1842  019f d60000        	ld	a,(_Pr_Value,x)
1843  01a2 5f            	clr	x
1844  01a3 90befe        	ld	y,_SCI_Compute_Baudrate$L-2
1845  01a6 90bf00        	ld	c_y,y
1846  01a9 90beff        	ld	y,_SCI_Compute_Baudrate$L-1
1847  01ac cd0000        	call	c_imul
1849  01af b1fc          	cp	a,_SCI_Compute_Baudrate$L-4
1850  01b1 2602          	jrne	L42
1851  01b3 b3fb          	cp	x,_SCI_Compute_Baudrate$L-5
1852  01b5               L42:
1853  01b5 2615          	jrne	L1611
1854                     ; 125                     RPR2 = Pr_Value[i];
1856  01b7 befd          	ld	x,_SCI_Compute_Baudrate$L-3
1857  01b9 d60000        	ld	a,(_Pr_Value,x)
1858  01bc b7e8          	ld	_SCI_Compute_Baudrate$L-24,a
1859                     ; 127                     RR2    = j;                /*Another Receiver rate divisor*/
1861  01be befe          	ld	x,_SCI_Compute_Baudrate$L-2
1862  01c0 bfe6          	ld	_SCI_Compute_Baudrate$L-26,x
1863  01c2 b6ff          	ld	a,_SCI_Compute_Baudrate$L-1
1864  01c4 b7e7          	ld	_SCI_Compute_Baudrate$L-25,a
1865                     ; 128                     temp1++;
1867  01c6 3cfa          	inc	_SCI_Compute_Baudrate$L-6
1868  01c8 2602          	jrne	L62
1869  01ca 3cf9          	inc	_SCI_Compute_Baudrate$L-7
1870  01cc               L62:
1871  01cc               L1611:
1872                     ; 115             for (j = 1; j <= 128; j = j*2)
1874  01cc 38ff          	sll	_SCI_Compute_Baudrate$L-1
1875  01ce 39fe          	rlc	_SCI_Compute_Baudrate$L-2
1878  01d0 b6ff          	ld	a,_SCI_Compute_Baudrate$L-1
1879  01d2 a081          	sub	a,#129
1880  01d4 b6fe          	ld	a,_SCI_Compute_Baudrate$L-2
1881  01d6 a200          	sbc	a,#0
1882  01d8 2402          	jruge	L45
1883  01da 208c          	jp	L1511
1884  01dc               L45:
1885                     ; 113         for (i = 0; i != 4; i++)
1887  01dc 3cfd          	inc	_SCI_Compute_Baudrate$L-3
1890  01de b6fd          	ld	a,_SCI_Compute_Baudrate$L-3
1891  01e0 a104          	cp	a,#4
1892  01e2 2703          	jreq	L65
1893  01e4 cc0162        	jp	L3411
1894  01e7               L65:
1895                     ; 132         if(count%2 == 0)
1897  01e7 b6f8          	ld	a,_SCI_Compute_Baudrate$L-8
1898  01e9 a501          	bcp	a,#1
1899  01eb 260e          	jrne	L5611
1900                     ; 135             temp = temp + count;
1902  01ed b6f8          	ld	a,_SCI_Compute_Baudrate$L-8
1903  01ef bef7          	ld	x,_SCI_Compute_Baudrate$L-9
1904  01f1 cd0000        	call	c_uitol
1906  01f4 aef3          	ld	x,#_SCI_Compute_Baudrate$L-13
1907  01f6 cd0000        	call	c_lgadd
1910  01f9 200c          	jra	L7611
1911  01fb               L5611:
1912                     ; 139             temp = temp - count;
1914  01fb b6f8          	ld	a,_SCI_Compute_Baudrate$L-8
1915  01fd bef7          	ld	x,_SCI_Compute_Baudrate$L-9
1916  01ff cd0000        	call	c_uitol
1918  0202 aef3          	ld	x,#_SCI_Compute_Baudrate$L-13
1919  0204 cd0000        	call	c_lgsub
1921  0207               L7611:
1922                     ; 110     for (temp1 = 0,count = 1;temp1 < 1;count++)
1924  0207 3cf8          	inc	_SCI_Compute_Baudrate$L-8
1925  0209 2602          	jrne	L03
1926  020b 3cf7          	inc	_SCI_Compute_Baudrate$L-9
1927  020d               L03:
1928  020d               L7311:
1931  020d b6fa          	ld	a,_SCI_Compute_Baudrate$L-6
1932  020f a001          	sub	a,#1
1933  0211 b6f9          	ld	a,_SCI_Compute_Baudrate$L-7
1934  0213 a200          	sbc	a,#0
1935  0215 2403          	jruge	L06
1936  0217 cc014e        	jp	L3311
1937  021a               L06:
1938                     ; 143     if (TPR1 == RPR1)    
1940  021a b6f2          	ld	a,_SCI_Compute_Baudrate$L-14
1941  021c b1ee          	cp	a,_SCI_Compute_Baudrate$L-18
1942  021e 2616          	jrne	L1711
1943                     ; 145         Presc_Value = TPR1;
1945  0220 b6f2          	ld	a,_SCI_Compute_Baudrate$L-14
1946  0222 b7f1          	ld	_SCI_Compute_Baudrate$L-15,a
1947                     ; 146         Tx_Value    = TR1;
1949  0224 beea          	ld	x,_SCI_Compute_Baudrate$L-22
1950  0226 bfef          	ld	_SCI_Compute_Baudrate$L-17,x
1951  0228 b6eb          	ld	a,_SCI_Compute_Baudrate$L-21
1952  022a b7f0          	ld	_SCI_Compute_Baudrate$L-16,a
1953                     ; 147         Rx_Value    = RR1;
1955  022c bee4          	ld	x,_SCI_Compute_Baudrate$L-28
1956  022e bfec          	ld	_SCI_Compute_Baudrate$L-20,x
1957  0230 b6e5          	ld	a,_SCI_Compute_Baudrate$L-27
1958  0232 b7ed          	ld	_SCI_Compute_Baudrate$L-19,a
1960  0234 2052          	jra	L3711
1961  0236               L1711:
1962                     ; 149     else if ( TPR1 == RPR2)
1964  0236 b6f2          	ld	a,_SCI_Compute_Baudrate$L-14
1965  0238 b1e8          	cp	a,_SCI_Compute_Baudrate$L-24
1966  023a 2616          	jrne	L5711
1967                     ; 151         Presc_Value = TPR1;
1969  023c b6f2          	ld	a,_SCI_Compute_Baudrate$L-14
1970  023e b7f1          	ld	_SCI_Compute_Baudrate$L-15,a
1971                     ; 152         Tx_Value    = TR1;
1973  0240 beea          	ld	x,_SCI_Compute_Baudrate$L-22
1974  0242 bfef          	ld	_SCI_Compute_Baudrate$L-17,x
1975  0244 b6eb          	ld	a,_SCI_Compute_Baudrate$L-21
1976  0246 b7f0          	ld	_SCI_Compute_Baudrate$L-16,a
1977                     ; 153         Rx_Value    = RR2;
1979  0248 bee6          	ld	x,_SCI_Compute_Baudrate$L-26
1980  024a bfec          	ld	_SCI_Compute_Baudrate$L-20,x
1981  024c b6e7          	ld	a,_SCI_Compute_Baudrate$L-25
1982  024e b7ed          	ld	_SCI_Compute_Baudrate$L-19,a
1984  0250 2036          	jra	L3711
1985  0252               L5711:
1986                     ; 155     else if ( TPR2 == RPR1)
1988  0252 b6e9          	ld	a,_SCI_Compute_Baudrate$L-23
1989  0254 b1ee          	cp	a,_SCI_Compute_Baudrate$L-18
1990  0256 2616          	jrne	L1021
1991                     ; 157         Presc_Value = TPR2;
1993  0258 b6e9          	ld	a,_SCI_Compute_Baudrate$L-23
1994  025a b7f1          	ld	_SCI_Compute_Baudrate$L-15,a
1995                     ; 158         Tx_Value    = TR2;
1997  025c bee2          	ld	x,_SCI_Compute_Baudrate$L-30
1998  025e bfef          	ld	_SCI_Compute_Baudrate$L-17,x
1999  0260 b6e3          	ld	a,_SCI_Compute_Baudrate$L-29
2000  0262 b7f0          	ld	_SCI_Compute_Baudrate$L-16,a
2001                     ; 159         Rx_Value    = RR1;
2003  0264 bee4          	ld	x,_SCI_Compute_Baudrate$L-28
2004  0266 bfec          	ld	_SCI_Compute_Baudrate$L-20,x
2005  0268 b6e5          	ld	a,_SCI_Compute_Baudrate$L-27
2006  026a b7ed          	ld	_SCI_Compute_Baudrate$L-19,a
2008  026c 201a          	jra	L3711
2009  026e               L1021:
2010                     ; 161     else if ( TPR2 == RPR2)
2012  026e b6e9          	ld	a,_SCI_Compute_Baudrate$L-23
2013  0270 b1e8          	cp	a,_SCI_Compute_Baudrate$L-24
2014  0272 2622          	jrne	L5021
2015                     ; 163         Presc_Value = TPR2;
2017  0274 b6e9          	ld	a,_SCI_Compute_Baudrate$L-23
2018  0276 b7f1          	ld	_SCI_Compute_Baudrate$L-15,a
2019                     ; 164         Tx_Value    = TR2;
2021  0278 bee2          	ld	x,_SCI_Compute_Baudrate$L-30
2022  027a bfef          	ld	_SCI_Compute_Baudrate$L-17,x
2023  027c b6e3          	ld	a,_SCI_Compute_Baudrate$L-29
2024  027e b7f0          	ld	_SCI_Compute_Baudrate$L-16,a
2025                     ; 165         Rx_Value    = RR2;
2027  0280 bee6          	ld	x,_SCI_Compute_Baudrate$L-26
2028  0282 bfec          	ld	_SCI_Compute_Baudrate$L-20,x
2029  0284 b6e7          	ld	a,_SCI_Compute_Baudrate$L-25
2030  0286 b7ed          	ld	_SCI_Compute_Baudrate$L-19,a
2032  0288               L3711:
2033                     ; 191     if (Presc_Value == 1)
2035  0288 b6f1          	ld	a,_SCI_Compute_Baudrate$L-15
2036  028a a101          	cp	a,#1
2037  028c 2703          	jreq	L26
2038  028e cc031c        	jp	L5321
2039  0291               L26:
2040                     ; 193         Presc_Value = 0;
2042  0291 3ff1          	clr	_SCI_Compute_Baudrate$L-15
2044  0293 cc0338        	jp	L7321
2045  0296               L5021:
2046                     ; 169         for (temp1=0,count=1;temp1<1;count++)
2048  0296 3ff9          	clr	_SCI_Compute_Baudrate$L-7
2049  0298 3ffa          	clr	_SCI_Compute_Baudrate$L-6
2050  029a a601          	ld	a,#1
2051  029c b7f8          	ld	_SCI_Compute_Baudrate$L-8,a
2052  029e 3ff7          	clr	_SCI_Compute_Baudrate$L-9
2054  02a0 206b          	jp	L5121
2055  02a2               L1121:
2056                     ; 171             for (j=1; j<=128; j= j*2)
2058  02a2 a601          	ld	a,#1
2059  02a4 b7ff          	ld	_SCI_Compute_Baudrate$L-1,a
2060  02a6 3ffe          	clr	_SCI_Compute_Baudrate$L-2
2061  02a8               L1221:
2062                     ; 173                 if ( (TPR1*j) == Presc_Fact)
2064  02a8 b6f2          	ld	a,_SCI_Compute_Baudrate$L-14
2065  02aa 5f            	clr	x
2066  02ab 90befe        	ld	y,_SCI_Compute_Baudrate$L-2
2067  02ae 90bf00        	ld	c_y,y
2068  02b1 90beff        	ld	y,_SCI_Compute_Baudrate$L-1
2069  02b4 cd0000        	call	c_imul
2071  02b7 b1fc          	cp	a,_SCI_Compute_Baudrate$L-4
2072  02b9 2602          	jrne	L23
2073  02bb b3fb          	cp	x,_SCI_Compute_Baudrate$L-5
2074  02bd               L23:
2075  02bd 261a          	jrne	L7221
2076                     ; 175                     Presc_Value = TPR1; 
2078  02bf b6f2          	ld	a,_SCI_Compute_Baudrate$L-14
2079  02c1 b7f1          	ld	_SCI_Compute_Baudrate$L-15,a
2080                     ; 176                     Tx_Value = TR1; 
2082  02c3 beea          	ld	x,_SCI_Compute_Baudrate$L-22
2083  02c5 bfef          	ld	_SCI_Compute_Baudrate$L-17,x
2084  02c7 b6eb          	ld	a,_SCI_Compute_Baudrate$L-21
2085  02c9 b7f0          	ld	_SCI_Compute_Baudrate$L-16,a
2086                     ; 177                     Rx_Value = j;
2088  02cb befe          	ld	x,_SCI_Compute_Baudrate$L-2
2089  02cd bfec          	ld	_SCI_Compute_Baudrate$L-20,x
2090  02cf b6ff          	ld	a,_SCI_Compute_Baudrate$L-1
2091  02d1 b7ed          	ld	_SCI_Compute_Baudrate$L-19,a
2092                     ; 178                     temp1++; 
2094  02d3 3cfa          	inc	_SCI_Compute_Baudrate$L-6
2095  02d5 2602          	jrne	L43
2096  02d7 3cf9          	inc	_SCI_Compute_Baudrate$L-7
2097  02d9               L43:
2098  02d9               L7221:
2099                     ; 171             for (j=1; j<=128; j= j*2)
2101  02d9 38ff          	sll	_SCI_Compute_Baudrate$L-1
2102  02db 39fe          	rlc	_SCI_Compute_Baudrate$L-2
2105  02dd b6ff          	ld	a,_SCI_Compute_Baudrate$L-1
2106  02df a081          	sub	a,#129
2107  02e1 b6fe          	ld	a,_SCI_Compute_Baudrate$L-2
2108  02e3 a200          	sbc	a,#0
2109  02e5 25c1          	jrult	L1221
2110                     ; 181             if(count%2 == 0)
2112  02e7 b6f8          	ld	a,_SCI_Compute_Baudrate$L-8
2113  02e9 a501          	bcp	a,#1
2114  02eb 260e          	jrne	L1321
2115                     ; 183                 Presc_Fact = Presc_Fact+count;
2117  02ed b6fc          	ld	a,_SCI_Compute_Baudrate$L-4
2118  02ef bbf8          	add	a,_SCI_Compute_Baudrate$L-8
2119  02f1 b7fc          	ld	_SCI_Compute_Baudrate$L-4,a
2120  02f3 b6fb          	ld	a,_SCI_Compute_Baudrate$L-5
2121  02f5 b9f7          	adc	a,_SCI_Compute_Baudrate$L-9
2122  02f7 b7fb          	ld	_SCI_Compute_Baudrate$L-5,a
2124  02f9 200c          	jra	L3321
2125  02fb               L1321:
2126                     ; 187                 Presc_Fact = Presc_Fact-count;
2128  02fb b6fc          	ld	a,_SCI_Compute_Baudrate$L-4
2129  02fd b0f8          	sub	a,_SCI_Compute_Baudrate$L-8
2130  02ff b7fc          	ld	_SCI_Compute_Baudrate$L-4,a
2131  0301 b6fb          	ld	a,_SCI_Compute_Baudrate$L-5
2132  0303 b2f7          	sbc	a,_SCI_Compute_Baudrate$L-9
2133  0305 b7fb          	ld	_SCI_Compute_Baudrate$L-5,a
2134  0307               L3321:
2135                     ; 169         for (temp1=0,count=1;temp1<1;count++)
2137  0307 3cf8          	inc	_SCI_Compute_Baudrate$L-8
2138  0309 2602          	jrne	L63
2139  030b 3cf7          	inc	_SCI_Compute_Baudrate$L-9
2140  030d               L63:
2141  030d               L5121:
2144  030d b6fa          	ld	a,_SCI_Compute_Baudrate$L-6
2145  030f a001          	sub	a,#1
2146  0311 b6f9          	ld	a,_SCI_Compute_Baudrate$L-7
2147  0313 a200          	sbc	a,#0
2148  0315 2402          	jruge	L46
2149  0317 2089          	jp	L1121
2150  0319               L46:
2151  0319 cc0288        	jp	L3711
2152  031c               L5321:
2153                     ; 195     else if (Presc_Value == 3)
2155  031c b6f1          	ld	a,_SCI_Compute_Baudrate$L-15
2156  031e a103          	cp	a,#3
2157  0320 2606          	jrne	L1421
2158                     ; 197         Presc_Value = 1;
2160  0322 a601          	ld	a,#1
2161  0324 b7f1          	ld	_SCI_Compute_Baudrate$L-15,a
2163  0326 2010          	jra	L7321
2164  0328               L1421:
2165                     ; 199     else if (Presc_Value == 4)
2167  0328 b6f1          	ld	a,_SCI_Compute_Baudrate$L-15
2168  032a a104          	cp	a,#4
2169  032c 2606          	jrne	L5421
2170                     ; 201         Presc_Value = 2;
2172  032e a602          	ld	a,#2
2173  0330 b7f1          	ld	_SCI_Compute_Baudrate$L-15,a
2175  0332 2004          	jra	L7321
2176  0334               L5421:
2177                     ; 205         Presc_Value = 3;
2179  0334 a603          	ld	a,#3
2180  0336 b7f1          	ld	_SCI_Compute_Baudrate$L-15,a
2181  0338               L7321:
2182                     ; 207     for (i=0,j=1; j<=128; j=j*2)
2184  0338 3ffd          	clr	_SCI_Compute_Baudrate$L-3
2185  033a a601          	ld	a,#1
2186  033c b7ff          	ld	_SCI_Compute_Baudrate$L-1,a
2187  033e 3ffe          	clr	_SCI_Compute_Baudrate$L-2
2188  0340               L1521:
2189                     ; 209         if ( j == Tx_Value )
2191  0340 b6ff          	ld	a,_SCI_Compute_Baudrate$L-1
2192  0342 b1f0          	cp	a,_SCI_Compute_Baudrate$L-16
2193  0344 2604          	jrne	L04
2194  0346 befe          	ld	x,_SCI_Compute_Baudrate$L-2
2195  0348 b3ef          	cp	x,_SCI_Compute_Baudrate$L-17
2196  034a               L04:
2197  034a 2607          	jrne	L7521
2198                     ; 211             Tx_Value = i;
2200  034c b6fd          	ld	a,_SCI_Compute_Baudrate$L-3
2201  034e 5f            	clr	x
2202  034f b7f0          	ld	_SCI_Compute_Baudrate$L-16,a
2203  0351 bfef          	ld	_SCI_Compute_Baudrate$L-17,x
2204  0353               L7521:
2205                     ; 213         i++;
2207  0353 3cfd          	inc	_SCI_Compute_Baudrate$L-3
2208                     ; 207     for (i=0,j=1; j<=128; j=j*2)
2210  0355 38ff          	sll	_SCI_Compute_Baudrate$L-1
2211  0357 39fe          	rlc	_SCI_Compute_Baudrate$L-2
2214  0359 b6ff          	ld	a,_SCI_Compute_Baudrate$L-1
2215  035b a081          	sub	a,#129
2216  035d b6fe          	ld	a,_SCI_Compute_Baudrate$L-2
2217  035f a200          	sbc	a,#0
2218  0361 25dd          	jrult	L1521
2219                     ; 215     for (i=0,j=1; j<=128; j=j*2)
2221  0363 3ffd          	clr	_SCI_Compute_Baudrate$L-3
2222  0365 a601          	ld	a,#1
2223  0367 b7ff          	ld	_SCI_Compute_Baudrate$L-1,a
2224  0369 3ffe          	clr	_SCI_Compute_Baudrate$L-2
2225  036b               L1621:
2226                     ; 217     if ( j == Rx_Value )
2228  036b b6ff          	ld	a,_SCI_Compute_Baudrate$L-1
2229  036d b1ed          	cp	a,_SCI_Compute_Baudrate$L-19
2230  036f 2604          	jrne	L24
2231  0371 befe          	ld	x,_SCI_Compute_Baudrate$L-2
2232  0373 b3ec          	cp	x,_SCI_Compute_Baudrate$L-20
2233  0375               L24:
2234  0375 2607          	jrne	L7621
2235                     ; 219             Rx_Value = i;
2237  0377 b6fd          	ld	a,_SCI_Compute_Baudrate$L-3
2238  0379 5f            	clr	x
2239  037a b7ed          	ld	_SCI_Compute_Baudrate$L-19,a
2240  037c bfec          	ld	_SCI_Compute_Baudrate$L-20,x
2241  037e               L7621:
2242                     ; 221         i++;
2244  037e 3cfd          	inc	_SCI_Compute_Baudrate$L-3
2245                     ; 215     for (i=0,j=1; j<=128; j=j*2)
2247  0380 38ff          	sll	_SCI_Compute_Baudrate$L-1
2248  0382 39fe          	rlc	_SCI_Compute_Baudrate$L-2
2251  0384 b6ff          	ld	a,_SCI_Compute_Baudrate$L-1
2252  0386 a081          	sub	a,#129
2253  0388 b6fe          	ld	a,_SCI_Compute_Baudrate$L-2
2254  038a a200          	sbc	a,#0
2255  038c 25dd          	jrult	L1621
2256                     ; 223     Presc_Value <<= 6 ;
2258  038e b6f1          	ld	a,_SCI_Compute_Baudrate$L-15
2259  0390 4e            	swap	a
2260  0391 48            	sll	a
2261  0392 48            	sll	a
2262  0393 a4c0          	and	a,#192
2263  0395 b7f1          	ld	_SCI_Compute_Baudrate$L-15,a
2264                     ; 224     SCIBRR &= SCI_PR ;  
2266  0397 b652          	ld	a,_SCIBRR
2267  0399 a43f          	and	a,#63
2268  039b b752          	ld	_SCIBRR,a
2269                     ; 225     SCIBRR |= Presc_Value ;                             /*Loads the prescalar*/
2271  039d b652          	ld	a,_SCIBRR
2272  039f baf1          	or	a,_SCI_Compute_Baudrate$L-15
2273  03a1 b752          	ld	_SCIBRR,a
2274                     ; 227     Tx_Value <<= 3 ;                     /*Loads the transmitter rate divisor*/
2276  03a3 a603          	ld	a,#3
2277  03a5               L44:
2278  03a5 38f0          	sll	_SCI_Compute_Baudrate$L-16
2279  03a7 39ef          	rlc	_SCI_Compute_Baudrate$L-17
2280  03a9 4a            	dec	a
2281  03aa 26f9          	jrne	L44
2282                     ; 228     SCIBRR &= SCI_TR ;
2284  03ac b652          	ld	a,_SCIBRR
2285  03ae a4c7          	and	a,#199
2286  03b0 b752          	ld	_SCIBRR,a
2287                     ; 229     SCIBRR |= (BYTE)Tx_Value ;
2289  03b2 b652          	ld	a,_SCIBRR
2290  03b4 baf0          	or	a,_SCI_Compute_Baudrate$L-16
2291  03b6 b752          	ld	_SCIBRR,a
2292                     ; 231     SCIBRR &= SCI_RR ;                      /*Loads the receiver rate divisor*/
2294  03b8 b652          	ld	a,_SCIBRR
2295  03ba a4f8          	and	a,#248
2296  03bc b752          	ld	_SCIBRR,a
2297                     ; 232     SCIBRR |= (BYTE)Rx_Value ;
2299  03be b652          	ld	a,_SCIBRR
2300  03c0 baed          	or	a,_SCI_Compute_Baudrate$L-19
2301  03c2 b752          	ld	_SCIBRR,a
2302                     ; 233 }
2305  03c4 81            	ret
2345                     ; 236 void SCI_Init(void)
2345                     ; 237 {
2346                     	switch	.text
2348                     	xref.b	_SCI_Init$L
2349  03c5               _SCI_Init:
2352                     ; 240 	byTemp = SCISR; //Touch registers to remove pending interrupt
2354  03c5 b650          	ld	a,_SCISR
2355  03c7 b7ff          	ld	_SCI_Init$L-1,a
2356                     ; 241 	byTemp = SCIDR; //Touch registers to remove pending interrupt	
2358  03c9 b651          	ld	a,_SCIDR
2359  03cb b7ff          	ld	_SCI_Init$L-1,a
2360                     ; 271 	SCICR1 = 0b00000000;
2362  03cd 3f53          	clr	_SCICR1
2363                     ; 307 	SCICR2 = 0b00011100;
2365  03cf a61c          	ld	a,#28
2366  03d1 b754          	ld	_SCICR2,a
2367                     ; 313 	SCIBRR = 0b00010010; //PR=1 TR=RR=4 ETPR=ERPR=10 fcpu=3.1 --> 4800 bps
2369  03d3 a612          	ld	a,#18
2370  03d5 b752          	ld	_SCIBRR,a
2371                     ; 320 	SCIERPR = 0x0A;
2373  03d7 a60a          	ld	a,#10
2374  03d9 b755          	ld	_SCIERPR,a
2375                     ; 328 	SCIETPR = 0x0A;
2377  03db a60a          	ld	a,#10
2378  03dd b757          	ld	_SCIETPR,a
2379                     ; 342 }
2382  03df 81            	ret
2427                     ; 345 void SCI_SendByte ( BYTE a_byData)
2427                     ; 346 {
2428                     	switch	.text
2430                     	xref.b	_SCI_SendByte$L
2431  03e0               _SCI_SendByte:
2433  03e0 b700          	ld	_SCI_SendByte$L,a
2435                     ; 348 	byTemp = SCISR; // Reset TDRE bit
2437  03e2 b650          	ld	a,_SCISR
2438  03e4 b7ff          	ld	_SCI_SendByte$L-1,a
2439                     ; 349 	SCIDR = a_byData;
2441  03e6 b600          	ld	a,_SCI_SendByte$L
2442  03e8 b751          	ld	_SCIDR,a
2444  03ea 2001          	jra	L5331
2445  03ec               L1331:
2446                     ; 353 		Nop();			
2449  03ec 9d            nop
2451  03ed               L5331:
2452                     ; 351 	while (!_btst(SCISR, SCI_SR_TDRE))
2454  03ed b650          	ld	a,_SCISR
2455  03ef a580          	bcp	a,#128
2456  03f1 27f9          	jreq	L1331
2457                     ; 355 }
2460  03f3 81            	ret
2506                     ; 359 void SCI_SendString (STRING a_strData)
2506                     ; 360 {
2507                     	switch	.text
2509                     	xref.b	_SCI_SendString$L
2510  03f4               _SCI_SendString:
2512  03f4 b701          	ld	_SCI_SendString$L+1,a
2513  03f6 bf00          	ld	_SCI_SendString$L,x
2515                     ; 362 	byTemp = SCISR; // Reset TDRE bit
2517  03f8 b650          	ld	a,_SCISR
2518  03fa b7ff          	ld	_SCI_SendString$L-1,a
2520  03fc 2014          	jra	L7631
2521  03fe               L3631:
2522                     ; 366 		SCIDR = (BYTE) (*a_strData);
2524  03fe 92c600        	ld	a,[_SCI_SendString$L.w]
2525  0401 b751          	ld	_SCIDR,a
2526                     ; 367 		a_strData++; //Next char
2528  0403 3c01          	inc	_SCI_SendString$L+1
2529  0405 2602          	jrne	L47
2530  0407 3c00          	inc	_SCI_SendString$L
2531  0409               L47:
2533  0409 2001          	jra	L5731
2534  040b               L3731:
2535                     ; 370 			Nop();			
2538  040b 9d            nop
2540  040c               L5731:
2541                     ; 368 		while (!_btst(SCISR, SCI_SR_TDRE))
2543  040c b650          	ld	a,_SCISR
2544  040e a580          	bcp	a,#128
2545  0410 27f9          	jreq	L3731
2546  0412               L7631:
2547                     ; 364 	while((*a_strData) != 0x00)
2549  0412 92c600        	ld	a,[_SCI_SendString$L.w]
2550  0415 4d            	tnz	a
2551  0416 26e6          	jrne	L3631
2552                     ; 373 }
2555  0418 81            	ret
2590                     ; 377 void SCI_DataReceived(void)
2590                     ; 378 {
2591                     	switch	.text
2592  0419               _SCI_DataReceived:
2594  0419 9089          	push	y
2595       00000101      OFST:	set	257
2596  041b b601          	ld	a,c_x+1
2597  041d 88            	push	a
2598  041e b600          	ld	a,c_x
2599  0420 88            	push	a
2600  0421 b601          	ld	a,c_y+1
2601  0423 88            	push	a
2602  0424 b600          	ld	a,c_y
2603  0426 88            	push	a
2604  0427 88            	push	a
2607                     ; 388 	byTemp = SCISR;
2609  0428 96            	ld	x,s
2610  0429 b650          	ld	a,_SCISR
2611  042b d70101        	ld	(OFST+0,x),a
2612                     ; 390     if(byTemp & SCI_ORE)      	/*If Interrupt is generated due to overrun error*/
2614  042e 96            	ld	x,s
2615  042f d60101        	ld	a,(OFST+0,x)
2616  0432 a508          	bcp	a,#8
2617  0434 270a          	jreq	L5141
2618                     ; 392         byTemp = SCIDR;    
2620  0436 96            	ld	x,s
2621  0437 b651          	ld	a,_SCIDR
2622  0439 d70101        	ld	(OFST+0,x),a
2623                     ; 393 		_bres(_Pa_Led_D4, _Pin_Led_D4);
2625  043c 190c          	bres	_PEDR,#4
2627  043e 205b          	jra	L7141
2628  0440               L5141:
2629                     ; 395     else if (byTemp & SCI_RDRF)	/*If Interrupt is generated due to received data flag*/
2631  0440 96            	ld	x,s
2632  0441 d60101        	ld	a,(OFST+0,x)
2633  0444 a520          	bcp	a,#32
2634  0446 2747          	jreq	L1241
2635                     ; 397 		if(byTemp & SCI_NE) // Noise
2637  0448 96            	ld	x,s
2638  0449 d60101        	ld	a,(OFST+0,x)
2639  044c a504          	bcp	a,#4
2640  044e 270a          	jreq	L3241
2641                     ; 399 			byTemp = SCIDR;    
2643  0450 96            	ld	x,s
2644  0451 b651          	ld	a,_SCIDR
2645  0453 d70101        	ld	(OFST+0,x),a
2646                     ; 400 			_bset(_Pa_Led_D3, _Pin_Led_D3);
2648  0456 1a0c          	bset	_PEDR,#5
2650  0458 2041          	jra	L7141
2651  045a               L3241:
2652                     ; 402 		else if(byTemp & SCI_FE) // Framing Error
2654  045a 96            	ld	x,s
2655  045b d60101        	ld	a,(OFST+0,x)
2656  045e a502          	bcp	a,#2
2657  0460 270a          	jreq	L7241
2658                     ; 404 			byTemp = SCIDR;    
2660  0462 96            	ld	x,s
2661  0463 b651          	ld	a,_SCIDR
2662  0465 d70101        	ld	(OFST+0,x),a
2663                     ; 405 			_bset(_Pa_Led_D1, _Pin_Led_D1);
2665  0468 1e0c          	bset	_PEDR,#7
2667  046a 202f          	jra	L7141
2668  046c               L7241:
2669                     ; 407 		else if(byTemp & SCI_PE) // Parity Error
2671  046c 96            	ld	x,s
2672  046d d60101        	ld	a,(OFST+0,x)
2673  0470 a501          	bcp	a,#1
2674  0472 2714          	jreq	L3341
2675                     ; 409 			byTemp = SCIDR;    
2677  0474 96            	ld	x,s
2678  0475 b651          	ld	a,_SCIDR
2679  0477 d70101        	ld	(OFST+0,x),a
2680                     ; 410 			_switch(_Pa_Led_D4, _Pin_Led_D4);
2682  047a b60c          	ld	a,_PEDR
2683  047c a510          	bcp	a,#16
2684  047e 2704          	jreq	L5341
2687  0480 190c          	bres	_PEDR,#4
2689  0482 2017          	jra	L7141
2690  0484               L5341:
2693  0484 180c          	bset	_PEDR,#4
2694  0486 2013          	jra	L7141
2695  0488               L3341:
2696                     ; 414 			FIFO_PutByte(SCIDR);	
2698  0488 b651          	ld	a,_SCIDR
2699  048a cd0000        	call	_FIFO_PutByte
2701  048d 200c          	jra	L7141
2702  048f               L1241:
2703                     ; 419 		_switch(_Pa_Led_D1, _Pin_Led_D1);		
2705  048f b60c          	ld	a,_PEDR
2706  0491 a580          	bcp	a,#128
2707  0493 2704          	jreq	L5441
2710  0495 1f0c          	bres	_PEDR,#7
2712  0497 2002          	jra	L7141
2713  0499               L5441:
2716  0499 1e0c          	bset	_PEDR,#7
2717  049b               L7141:
2718                     ; 421 }
2721  049b 84            	pop	a
2722  049c 84            	pop	a
2723  049d b700          	ld	c_y,a
2724  049f 84            	pop	a
2725  04a0 b701          	ld	c_y+1,a
2726  04a2 84            	pop	a
2727  04a3 b700          	ld	c_x,a
2728  04a5 84            	pop	a
2729  04a6 b701          	ld	c_x+1,a
2730  04a8 9085          	pop	y
2731  04aa 80            	iret
2755                     	xdef	_SCI_DataReceived
2756                     	xdef	_Pr_Value
2757                     	xdef	_SCI_SendString
2758                     	xdef	_SCI_SendByte
2759                     	xdef	_SCI_Compute_Baudrate
2760                     	xdef	_SCI_Init
2761                     	xref	_FIFO_PutByte
2762                     	xref.b	c_lreg
2763                     	xref.b	c_x
2764                     	xref.b	c_y
2783                     	xref	c_lgsub
2784                     	xref	c_lgadd
2785                     	xref	c_imul
2786                     	xref	c_lursh
2787                     	xref	c_ltor
2788                     	xref	c_ludv
2789                     	xref	c_rtol
2790                     	xref	c_uitol
2791                     	end
