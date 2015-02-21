   1                     ; C Compiler for ST7 (COSMIC Software)
   2                     ; Generator V4.5.5 - 12 Jan 2006
1280                     .const:	section	.text
1281  0000               L327_mc_byApplicationVersion:
1282  0000 da            	dc.b	218
1374                     ; 12 void init(void)
1374                     ; 13 {
1375                     	switch	.text
1376  0000               _init:
1379                     ; 14 	PADR 	= _PADR;       
1381  0000 3f00          	clr	_PADR
1382                     ; 15 	PADDR 	= _PADDR;
1384  0002 a623          	ld	a,#35
1385  0004 b701          	ld	_PADDR,a
1386                     ; 16 	PAOR 	= _PAOR;
1388  0006 a633          	ld	a,#51
1389  0008 b702          	ld	_PAOR,a
1390                     ; 17 	PADR 	= _PADR;
1392  000a 3f00          	clr	_PADR
1393                     ; 19 	PBDR 	= _PBDR;  	
1395  000c 3f03          	clr	_PBDR
1396                     ; 20 	PBDDR 	= _PBDDR;
1398  000e a63f          	ld	a,#63
1399  0010 b704          	ld	_PBDDR,a
1400                     ; 21 	PBOR 	= _PBOR;
1402  0012 a67f          	ld	a,#127
1403  0014 b705          	ld	_PBOR,a
1404                     ; 22 	PBDR 	= _PBDR;
1406  0016 3f03          	clr	_PBDR
1407                     ; 24 	PCDR 	= _PCDR;  	
1409  0018 3f06          	clr	_PCDR
1410                     ; 25 	PCDDR 	= _PCDDR;
1412  001a a682          	ld	a,#130
1413  001c b707          	ld	_PCDDR,a
1414                     ; 26 	PCOR 	= _PCOR; 
1416  001e a682          	ld	a,#130
1417  0020 b708          	ld	_PCOR,a
1418                     ; 27 	PCDR 	= _PCDR;  	
1420  0022 3f06          	clr	_PCDR
1421                     ; 29 	PDDR 	= _PDDR;       
1423  0024 3f09          	clr	_PDDR
1424                     ; 30 	PDDDR 	= _PDDDR;
1426  0026 a6ff          	ld	a,#255
1427  0028 b70a          	ld	_PDDDR,a
1428                     ; 31 	PDOR 	= _PDOR;
1430  002a a6ff          	ld	a,#255
1431  002c b70b          	ld	_PDOR,a
1432                     ; 32 	PDDR 	= _PDDR;
1434  002e 3f09          	clr	_PDDR
1435                     ; 34 	PEDR 	= _PEDR;       
1437  0030 a6f0          	ld	a,#240
1438  0032 b70c          	ld	_PEDR,a
1439                     ; 35 	PEDDR 	= _PEDDR;
1441  0034 a6fd          	ld	a,#253
1442  0036 b70d          	ld	_PEDDR,a
1443                     ; 36 	PEOR 	= _PEOR;
1445  0038 a6fd          	ld	a,#253
1446  003a b70e          	ld	_PEOR,a
1447                     ; 37 	PEDR 	= _PEDR;	
1449  003c a6f0          	ld	a,#240
1450  003e b70c          	ld	_PEDR,a
1451                     ; 39 	PFDR 	= _PFDR;       
1453  0040 3f0f          	clr	_PFDR
1454                     ; 40 	PFDDR 	= _PFDDR;
1456  0042 a60b          	ld	a,#11
1457  0044 b710          	ld	_PFDDR,a
1458                     ; 41 	PFOR 	= _PFOR;
1460  0046 a60b          	ld	a,#11
1461  0048 b711          	ld	_PFOR,a
1462                     ; 42 	PFDR 	= _PFDR;
1464  004a 3f0f          	clr	_PFDR
1465                     ; 44 	PGDR 	= _PGDR;       
1467  004c 3f12          	clr	_PGDR
1468                     ; 45 	PGDDR 	= _PGDDR;
1470  004e a6fd          	ld	a,#253
1471  0050 b713          	ld	_PGDDR,a
1472                     ; 46 	PGOR 	= _PGOR;
1474  0052 a6fd          	ld	a,#253
1475  0054 b714          	ld	_PGOR,a
1476                     ; 47 	PGDR 	= _PGDR;
1478  0056 3f12          	clr	_PGDR
1479                     ; 49 	PHDR 	= _PHDR;       
1481  0058 3f15          	clr	_PHDR
1482                     ; 50 	PHDDR 	= _PHDDR;
1484  005a a67f          	ld	a,#127
1485  005c b716          	ld	_PHDDR,a
1486                     ; 51 	PHOR 	= _PHOR;
1488  005e a67f          	ld	a,#127
1489  0060 b717          	ld	_PHOR,a
1490                     ; 52 	PHDR 	= _PHDR;
1492  0062 3f15          	clr	_PHDR
1493                     ; 61 	MCCSR = 0b10000000;
1495  0064 a680          	ld	a,#128
1496  0066 b72c          	ld	_MCCSR,a
1497                     ; 65 	DisableInterrupts();
1500  0068 9b            sim
1502                     ; 67 	ISPR0 = _ISPR0;
1504  0069 a6fc          	ld	a,#252
1505  006b b724          	ld	_ISPR0,a
1506                     ; 68 	ISPR1 = _ISPR1;
1508  006d a6fc          	ld	a,#252
1509  006f b725          	ld	_ISPR1,a
1510                     ; 70 	ISPR2 = _ISPR2; // interrupt no.8 bit0&1 priority level 2. if the are 11 the timer A interrupt is disable.
1512  0071 a6fc          	ld	a,#252
1513  0073 b726          	ld	_ISPR2,a
1514                     ; 71 	ISPR3 = _ISPR3;  
1516  0075 a6fc          	ld	a,#252
1517  0077 b727          	ld	_ISPR3,a
1518                     ; 72 	EICR  = _EICR;	
1520  0079 a640          	ld	a,#64
1521  007b b728          	ld	_EICR,a
1522                     ; 74 	FIFO_Init();
1524  007d cd0000        	call	_FIFO_Init
1526                     ; 75 	SCI_Init();
1528  0080 cd0000        	call	_SCI_Init
1530                     ; 77 	eepromInit();
1532  0083 cd0000        	call	_eepromInit
1534                     ; 79 	displayInit();
1536  0086 cd0000        	call	_displayInit
1538                     ; 82 	_bres(_Pa_Led_D1, _Pin_Led_D1);
1540  0089 1f0c          	bres	_PEDR,#7
1541                     ; 83 	_bres(_Pa_Led_D2, _Pin_Led_D2);
1543  008b 1d0c          	bres	_PEDR,#6
1544                     ; 84 	_bres(_Pa_Led_D3, _Pin_Led_D3);
1546  008d 1b0c          	bres	_PEDR,#5
1547                     ; 85 	_bres(_Pa_Led_D4, _Pin_Led_D4);
1549  008f 190c          	bres	_PEDR,#4
1550                     ; 95 	EnableInterrupts();
1553  0091 9a            rim
1555                     ; 100 }	
1558  0092 81            	ret
1631                     ; 103 void mainMessage(WORD a_byCode, WORD a_byCode2, WORD a_byCode3, WORD a_byCode4)
1631                     ; 104 {
1632                     	switch	.text
1634                     	xref.b	_mainMessage$L
1635  0093               _mainMessage:
1637  0093 b701          	ld	_mainMessage$L+1,a
1638  0095 bf00          	ld	_mainMessage$L,x
1640                     ; 109 	strString[15] = 0x00;
1642  0097 3fff          	clr	_mainMessage$L-1
1643                     ; 110 	memcpy(strString, "Code 1 = ", 9); 
1645  0099 a609          	ld	a,#9
1646  009b b704          	ld	_memcpy$L+4,a
1647  009d ae1f          	ld	x,#high(L5101)
1648  009f bf02          	ld	_memcpy$L+2,x
1649  00a1 a61f          	ld	a,#low(L5101)
1650  00a3 b703          	ld	_memcpy$L+3,a
1651  00a5 a6f0          	ld	a,#_mainMessage$L-16
1652  00a7 5f            	clr	x
1653  00a8 cd0000        	call	_memcpy
1655                     ; 111 	formatNumber(a_byCode, 6, 0, strString+9);
1657  00ab aef9          	ld	x,#high(_mainMessage$L-7)
1658  00ad bf04          	ld	_formatNumber$L+4,x
1659  00af a6f9          	ld	a,#low(_mainMessage$L-7)
1660  00b1 b705          	ld	_formatNumber$L+5,a
1661  00b3 3f03          	clr	_formatNumber$L+3
1662  00b5 a606          	ld	a,#6
1663  00b7 b702          	ld	_formatNumber$L+2,a
1664  00b9 b601          	ld	a,_mainMessage$L+1
1665  00bb be00          	ld	x,_mainMessage$L
1666  00bd cd0000        	call	_formatNumber
1668                     ; 112 	displayWriteString(strString, DISPLAY_SELECT_FONT_5x7, 10, 10);
1670  00c0 a60a          	ld	a,#10
1671  00c2 b704          	ld	_displayWriteString$L+4,a
1672  00c4 a60a          	ld	a,#10
1673  00c6 b703          	ld	_displayWriteString$L+3,a
1674  00c8 a61d          	ld	a,#29
1675  00ca b702          	ld	_displayWriteString$L+2,a
1676  00cc a6f0          	ld	a,#_mainMessage$L-16
1677  00ce 5f            	clr	x
1678  00cf cd0000        	call	_displayWriteString
1680                     ; 115 	memcpy(strString, "Code 2 = ", 9); 
1682  00d2 a609          	ld	a,#9
1683  00d4 b704          	ld	_memcpy$L+4,a
1684  00d6 ae15          	ld	x,#high(L7101)
1685  00d8 bf02          	ld	_memcpy$L+2,x
1686  00da a615          	ld	a,#low(L7101)
1687  00dc b703          	ld	_memcpy$L+3,a
1688  00de a6f0          	ld	a,#_mainMessage$L-16
1689  00e0 5f            	clr	x
1690  00e1 cd0000        	call	_memcpy
1692                     ; 116 	formatNumber(a_byCode2, 6, 0, strString+9);
1694  00e4 aef9          	ld	x,#high(_mainMessage$L-7)
1695  00e6 bf04          	ld	_formatNumber$L+4,x
1696  00e8 a6f9          	ld	a,#low(_mainMessage$L-7)
1697  00ea b705          	ld	_formatNumber$L+5,a
1698  00ec 3f03          	clr	_formatNumber$L+3
1699  00ee a606          	ld	a,#6
1700  00f0 b702          	ld	_formatNumber$L+2,a
1701  00f2 b603          	ld	a,_mainMessage$L+3
1702  00f4 be02          	ld	x,_mainMessage$L+2
1703  00f6 cd0000        	call	_formatNumber
1705                     ; 117 	displayWriteString(strString, DISPLAY_SELECT_FONT_5x7, 10, 20);
1707  00f9 a614          	ld	a,#20
1708  00fb b704          	ld	_displayWriteString$L+4,a
1709  00fd a60a          	ld	a,#10
1710  00ff b703          	ld	_displayWriteString$L+3,a
1711  0101 a61d          	ld	a,#29
1712  0103 b702          	ld	_displayWriteString$L+2,a
1713  0105 a6f0          	ld	a,#_mainMessage$L-16
1714  0107 5f            	clr	x
1715  0108 cd0000        	call	_displayWriteString
1717                     ; 119 	strString[15] = 0x00;
1719  010b 3fff          	clr	_mainMessage$L-1
1720                     ; 120 	memcpy(strString, "Code 3 = ", 9); 
1722  010d a609          	ld	a,#9
1723  010f b704          	ld	_memcpy$L+4,a
1724  0111 ae0b          	ld	x,#high(L1201)
1725  0113 bf02          	ld	_memcpy$L+2,x
1726  0115 a60b          	ld	a,#low(L1201)
1727  0117 b703          	ld	_memcpy$L+3,a
1728  0119 a6f0          	ld	a,#_mainMessage$L-16
1729  011b 5f            	clr	x
1730  011c cd0000        	call	_memcpy
1732                     ; 121 	formatNumber(a_byCode3, 6, 0, strString+9);
1734  011f aef9          	ld	x,#high(_mainMessage$L-7)
1735  0121 bf04          	ld	_formatNumber$L+4,x
1736  0123 a6f9          	ld	a,#low(_mainMessage$L-7)
1737  0125 b705          	ld	_formatNumber$L+5,a
1738  0127 3f03          	clr	_formatNumber$L+3
1739  0129 a606          	ld	a,#6
1740  012b b702          	ld	_formatNumber$L+2,a
1741  012d b605          	ld	a,_mainMessage$L+5
1742  012f be04          	ld	x,_mainMessage$L+4
1743  0131 cd0000        	call	_formatNumber
1745                     ; 122 	displayWriteString(strString, DISPLAY_SELECT_FONT_5x7, 10, 30);
1747  0134 a61e          	ld	a,#30
1748  0136 b704          	ld	_displayWriteString$L+4,a
1749  0138 a60a          	ld	a,#10
1750  013a b703          	ld	_displayWriteString$L+3,a
1751  013c a61d          	ld	a,#29
1752  013e b702          	ld	_displayWriteString$L+2,a
1753  0140 a6f0          	ld	a,#_mainMessage$L-16
1754  0142 5f            	clr	x
1755  0143 cd0000        	call	_displayWriteString
1757                     ; 124 	memcpy(strString, "Code 4 = ", 9); 
1759  0146 a609          	ld	a,#9
1760  0148 b704          	ld	_memcpy$L+4,a
1761  014a ae01          	ld	x,#high(L3201)
1762  014c bf02          	ld	_memcpy$L+2,x
1763  014e a601          	ld	a,#low(L3201)
1764  0150 b703          	ld	_memcpy$L+3,a
1765  0152 a6f0          	ld	a,#_mainMessage$L-16
1766  0154 5f            	clr	x
1767  0155 cd0000        	call	_memcpy
1769                     ; 125 	formatNumber(a_byCode4, 6, 0, strString+9);
1771  0158 aef9          	ld	x,#high(_mainMessage$L-7)
1772  015a bf04          	ld	_formatNumber$L+4,x
1773  015c a6f9          	ld	a,#low(_mainMessage$L-7)
1774  015e b705          	ld	_formatNumber$L+5,a
1775  0160 3f03          	clr	_formatNumber$L+3
1776  0162 a606          	ld	a,#6
1777  0164 b702          	ld	_formatNumber$L+2,a
1778  0166 b607          	ld	a,_mainMessage$L+7
1779  0168 be06          	ld	x,_mainMessage$L+6
1780  016a cd0000        	call	_formatNumber
1782                     ; 126 	displayWriteString(strString, DISPLAY_SELECT_FONT_5x7, 10, 40);
1784  016d a628          	ld	a,#40
1785  016f b704          	ld	_displayWriteString$L+4,a
1786  0171 a60a          	ld	a,#10
1787  0173 b703          	ld	_displayWriteString$L+3,a
1788  0175 a61d          	ld	a,#29
1789  0177 b702          	ld	_displayWriteString$L+2,a
1790  0179 a6f0          	ld	a,#_mainMessage$L-16
1791  017b 5f            	clr	x
1792  017c cd0000        	call	_displayWriteString
1794                     ; 127 }
1797  017f 81            	ret
1820                     ; 130 void mainKeyCodeLoop(void)
1820                     ; 131 {
1821                     	switch	.text
1822  0180               _mainKeyCodeLoop:
1825  0180               L5301:
1826                     ; 134 		screenKeyCode();
1828  0180 cd0000        	call	_screenKeyCode
1831  0183 20fb          	jra	L5301
1858                     ; 140 void main(void)
1858                     ; 141 {
1859                     	switch	.text
1860  0185               _main:
1863                     ; 142 	init();
1865  0185 cd0000        	call	_init
1867                     ; 144 	_bres(_Pa_Led_D1, _Pin_Led_D1);
1869  0188 1f0c          	bres	_PEDR,#7
1870                     ; 145 	_bres(_Pa_Led_D2, _Pin_Led_D2);
1872  018a 1d0c          	bres	_PEDR,#6
1873                     ; 146 	_bres(_Pa_Led_D3, _Pin_Led_D3);
1875  018c 1b0c          	bres	_PEDR,#5
1876                     ; 147 	_bset(_Pa_Led_D4, _Pin_Led_D4);	
1878  018e 180c          	bset	_PEDR,#4
1879                     ; 149 	displayReset();
1881  0190 cd0000        	call	_displayReset
1883                     ; 150 	displayAppInit();
1885  0193 cd0000        	call	_displayAppInit
1887                     ; 152 	displayAppLoop();
1889  0196 cd0000        	call	_displayAppLoop
1891                     ; 153 }
1894  0199 81            	ret
1906                     	xdef	_mainKeyCodeLoop
1907                     	xdef	_mainMessage
1908                     	xdef	_init
1909                     	xdef	_main
1910                     	xref	_formatNumber
1911                     	xref	_memcpy
1912                     	xref	_displayAppLoop
1913                     	xref	_displayAppInit
1914                     	xref	_screenKeyCode
1915                     	xref	_displayWriteString
1916                     	xref	_displayReset
1917                     	xref	_displayInit
1918                     	xref	_eepromInit
1919                     	xref	_SCI_Init
1920                     	xref	_FIFO_Init
1921                     	switch	.const
1922  0001               L3201:
1923  0001 436f64652034  	dc.b	"Code 4 = ",0
1924  000b               L1201:
1925  000b 436f64652033  	dc.b	"Code 3 = ",0
1926  0015               L7101:
1927  0015 436f64652032  	dc.b	"Code 2 = ",0
1928  001f               L5101:
1929  001f 436f64652031  	dc.b	"Code 1 = ",0
1949                     	xref.b	_displayWriteString$L
1950                     	xref.b	_formatNumber$L
1951                     	xref.b	_memcpy$L
1952                     	end
