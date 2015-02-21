   1                     ; C Compiler for ST7 (COSMIC Software)
   2                     ; Generator V4.5.5 - 12 Jan 2006
1280                     .const:	section	.text
1281  0000               L327_mc_byApplicationVersion:
1282  0000 9d            	dc.b	157
1375                     ; 13 void init(void)
1375                     ; 14 {
1376                     	switch	.text
1377  0000               _init:
1380                     ; 15 	m_bySNIIndexValue = 0;	
1382  0000 4f            	clr	a
1383  0001 c70000        	ld	_m_bySNIIndexValue,a
1384                     ; 16 	PADR 	= _PADR;       
1386  0004 3f00          	clr	_PADR
1387                     ; 17 	PADDR 	= _PADDR;
1389  0006 a623          	ld	a,#35
1390  0008 b701          	ld	_PADDR,a
1391                     ; 18 	PAOR 	= _PAOR;
1393  000a a633          	ld	a,#51
1394  000c b702          	ld	_PAOR,a
1395                     ; 19 	PADR 	= _PADR;
1397  000e 3f00          	clr	_PADR
1398                     ; 21 	PBDR 	= _PBDR;  	
1400  0010 3f03          	clr	_PBDR
1401                     ; 22 	PBDDR 	= _PBDDR;
1403  0012 a63f          	ld	a,#63
1404  0014 b704          	ld	_PBDDR,a
1405                     ; 23 	PBOR 	= _PBOR;
1407  0016 a67f          	ld	a,#127
1408  0018 b705          	ld	_PBOR,a
1409                     ; 24 	PBDR 	= _PBDR;
1411  001a 3f03          	clr	_PBDR
1412                     ; 26 	PCDR 	= _PCDR;  	
1414  001c 3f06          	clr	_PCDR
1415                     ; 27 	PCDDR 	= _PCDDR;
1417  001e a682          	ld	a,#130
1418  0020 b707          	ld	_PCDDR,a
1419                     ; 28 	PCOR 	= _PCOR; 
1421  0022 a682          	ld	a,#130
1422  0024 b708          	ld	_PCOR,a
1423                     ; 29 	PCDR 	= _PCDR;  	
1425  0026 3f06          	clr	_PCDR
1426                     ; 31 	PDDR 	= _PDDR;       
1428  0028 3f09          	clr	_PDDR
1429                     ; 32 	PDDDR 	= _PDDDR;
1431  002a a6ff          	ld	a,#255
1432  002c b70a          	ld	_PDDDR,a
1433                     ; 33 	PDOR 	= _PDOR;
1435  002e a6ff          	ld	a,#255
1436  0030 b70b          	ld	_PDOR,a
1437                     ; 34 	PDDR 	= _PDDR;
1439  0032 3f09          	clr	_PDDR
1440                     ; 36 	PEDR 	= _PEDR;       
1442  0034 a6f0          	ld	a,#240
1443  0036 b70c          	ld	_PEDR,a
1444                     ; 37 	PEDDR 	= _PEDDR;
1446  0038 a6fd          	ld	a,#253
1447  003a b70d          	ld	_PEDDR,a
1448                     ; 38 	PEOR 	= _PEOR;
1450  003c a6fd          	ld	a,#253
1451  003e b70e          	ld	_PEOR,a
1452                     ; 39 	PEDR 	= _PEDR;	
1454  0040 a6f0          	ld	a,#240
1455  0042 b70c          	ld	_PEDR,a
1456                     ; 41 	PFDR 	= _PFDR;       
1458  0044 3f0f          	clr	_PFDR
1459                     ; 42 	PFDDR 	= _PFDDR;
1461  0046 a60b          	ld	a,#11
1462  0048 b710          	ld	_PFDDR,a
1463                     ; 43 	PFOR 	= _PFOR;
1465  004a a60b          	ld	a,#11
1466  004c b711          	ld	_PFOR,a
1467                     ; 44 	PFDR 	= _PFDR;
1469  004e 3f0f          	clr	_PFDR
1470                     ; 46 	PGDR 	= _PGDR;       
1472  0050 3f12          	clr	_PGDR
1473                     ; 47 	PGDDR 	= _PGDDR;
1475  0052 a6fd          	ld	a,#253
1476  0054 b713          	ld	_PGDDR,a
1477                     ; 48 	PGOR 	= _PGOR;
1479  0056 a6fd          	ld	a,#253
1480  0058 b714          	ld	_PGOR,a
1481                     ; 49 	PGDR 	= _PGDR;
1483  005a 3f12          	clr	_PGDR
1484                     ; 51 	PHDR 	= _PHDR;       
1486  005c 3f15          	clr	_PHDR
1487                     ; 52 	PHDDR 	= _PHDDR;
1489  005e a67f          	ld	a,#127
1490  0060 b716          	ld	_PHDDR,a
1491                     ; 53 	PHOR 	= _PHOR;
1493  0062 a67f          	ld	a,#127
1494  0064 b717          	ld	_PHOR,a
1495                     ; 54 	PHDR 	= _PHDR;
1497  0066 3f15          	clr	_PHDR
1498                     ; 63 	MCCSR = 0b10000000;
1500  0068 a680          	ld	a,#128
1501  006a b72c          	ld	_MCCSR,a
1502                     ; 67 	DisableInterrupts();
1505  006c 9b            sim
1507                     ; 69 	ISPR0 = _ISPR0;
1509  006d a6fc          	ld	a,#252
1510  006f b724          	ld	_ISPR0,a
1511                     ; 70 	ISPR1 = _ISPR1;
1513  0071 a6fc          	ld	a,#252
1514  0073 b725          	ld	_ISPR1,a
1515                     ; 72 	ISPR2 = _ISPR2; // interrupt no.8 bit0&1 priority level 2. if the are 11 the timer A interrupt is disable.
1517  0075 a6fc          	ld	a,#252
1518  0077 b726          	ld	_ISPR2,a
1519                     ; 73 	ISPR3 = _ISPR3;  
1521  0079 a6fc          	ld	a,#252
1522  007b b727          	ld	_ISPR3,a
1523                     ; 74 	EICR  = _EICR;	
1525  007d a640          	ld	a,#64
1526  007f b728          	ld	_EICR,a
1527                     ; 76 	FIFO_Init();
1529  0081 cd0000        	call	_FIFO_Init
1531                     ; 77 	SCI_Init();
1533  0084 cd0000        	call	_SCI_Init
1535                     ; 80 	eepromInit();
1537  0087 cd0000        	call	_eepromInit
1539                     ; 82 	displayInit();
1541  008a cd0000        	call	_displayInit
1543                     ; 85 	_bres(_Pa_Led_D1, _Pin_Led_D1);
1545  008d 1f0c          	bres	_PEDR,#7
1546                     ; 86 	_bres(_Pa_Led_D2, _Pin_Led_D2);
1548  008f 1d0c          	bres	_PEDR,#6
1549                     ; 87 	_bres(_Pa_Led_D3, _Pin_Led_D3);
1551  0091 1b0c          	bres	_PEDR,#5
1552                     ; 88 	_bres(_Pa_Led_D4, _Pin_Led_D4);
1554  0093 190c          	bres	_PEDR,#4
1555                     ; 94 	EnableInterrupts();
1558  0095 9a            rim
1560                     ; 97 }	
1563  0096 81            	ret
1636                     ; 100 void mainMessage(WORD a_byCode, WORD a_byCode2, WORD a_byCode3, WORD a_byCode4)
1636                     ; 101 {
1637                     	switch	.text
1639                     	xref.b	_mainMessage$L
1640  0097               _mainMessage:
1642  0097 b701          	ld	_mainMessage$L+1,a
1643  0099 bf00          	ld	_mainMessage$L,x
1645                     ; 106 	strString[15] = 0x00;
1647  009b 3fff          	clr	_mainMessage$L-1
1648                     ; 107 	memcpy(strString, "Code 1 = ", 9); 
1650  009d a609          	ld	a,#9
1651  009f b704          	ld	_memcpy$L+4,a
1652  00a1 ae1f          	ld	x,#high(L5101)
1653  00a3 bf02          	ld	_memcpy$L+2,x
1654  00a5 a61f          	ld	a,#low(L5101)
1655  00a7 b703          	ld	_memcpy$L+3,a
1656  00a9 a6f0          	ld	a,#_mainMessage$L-16
1657  00ab 5f            	clr	x
1658  00ac cd0000        	call	_memcpy
1660                     ; 108 	formatNumber(a_byCode, 6, 0, strString+9);
1662  00af aef9          	ld	x,#high(_mainMessage$L-7)
1663  00b1 bf04          	ld	_formatNumber$L+4,x
1664  00b3 a6f9          	ld	a,#low(_mainMessage$L-7)
1665  00b5 b705          	ld	_formatNumber$L+5,a
1666  00b7 3f03          	clr	_formatNumber$L+3
1667  00b9 a606          	ld	a,#6
1668  00bb b702          	ld	_formatNumber$L+2,a
1669  00bd b601          	ld	a,_mainMessage$L+1
1670  00bf be00          	ld	x,_mainMessage$L
1671  00c1 cd0000        	call	_formatNumber
1673                     ; 109 	displayWriteString(strString, DISPLAY_SELECT_FONT_5x7, 10, 10);
1675  00c4 a60a          	ld	a,#10
1676  00c6 b704          	ld	_displayWriteString$L+4,a
1677  00c8 a60a          	ld	a,#10
1678  00ca b703          	ld	_displayWriteString$L+3,a
1679  00cc a61d          	ld	a,#29
1680  00ce b702          	ld	_displayWriteString$L+2,a
1681  00d0 a6f0          	ld	a,#_mainMessage$L-16
1682  00d2 5f            	clr	x
1683  00d3 cd0000        	call	_displayWriteString
1685                     ; 112 	memcpy(strString, "Code 2 = ", 9); 
1687  00d6 a609          	ld	a,#9
1688  00d8 b704          	ld	_memcpy$L+4,a
1689  00da ae15          	ld	x,#high(L7101)
1690  00dc bf02          	ld	_memcpy$L+2,x
1691  00de a615          	ld	a,#low(L7101)
1692  00e0 b703          	ld	_memcpy$L+3,a
1693  00e2 a6f0          	ld	a,#_mainMessage$L-16
1694  00e4 5f            	clr	x
1695  00e5 cd0000        	call	_memcpy
1697                     ; 113 	formatNumber(a_byCode2, 6, 0, strString+9);
1699  00e8 aef9          	ld	x,#high(_mainMessage$L-7)
1700  00ea bf04          	ld	_formatNumber$L+4,x
1701  00ec a6f9          	ld	a,#low(_mainMessage$L-7)
1702  00ee b705          	ld	_formatNumber$L+5,a
1703  00f0 3f03          	clr	_formatNumber$L+3
1704  00f2 a606          	ld	a,#6
1705  00f4 b702          	ld	_formatNumber$L+2,a
1706  00f6 b603          	ld	a,_mainMessage$L+3
1707  00f8 be02          	ld	x,_mainMessage$L+2
1708  00fa cd0000        	call	_formatNumber
1710                     ; 114 	displayWriteString(strString, DISPLAY_SELECT_FONT_5x7, 10, 20);
1712  00fd a614          	ld	a,#20
1713  00ff b704          	ld	_displayWriteString$L+4,a
1714  0101 a60a          	ld	a,#10
1715  0103 b703          	ld	_displayWriteString$L+3,a
1716  0105 a61d          	ld	a,#29
1717  0107 b702          	ld	_displayWriteString$L+2,a
1718  0109 a6f0          	ld	a,#_mainMessage$L-16
1719  010b 5f            	clr	x
1720  010c cd0000        	call	_displayWriteString
1722                     ; 116 	strString[15] = 0x00;
1724  010f 3fff          	clr	_mainMessage$L-1
1725                     ; 117 	memcpy(strString, "Code 3 = ", 9); 
1727  0111 a609          	ld	a,#9
1728  0113 b704          	ld	_memcpy$L+4,a
1729  0115 ae0b          	ld	x,#high(L1201)
1730  0117 bf02          	ld	_memcpy$L+2,x
1731  0119 a60b          	ld	a,#low(L1201)
1732  011b b703          	ld	_memcpy$L+3,a
1733  011d a6f0          	ld	a,#_mainMessage$L-16
1734  011f 5f            	clr	x
1735  0120 cd0000        	call	_memcpy
1737                     ; 118 	formatNumber(a_byCode3, 6, 0, strString+9);
1739  0123 aef9          	ld	x,#high(_mainMessage$L-7)
1740  0125 bf04          	ld	_formatNumber$L+4,x
1741  0127 a6f9          	ld	a,#low(_mainMessage$L-7)
1742  0129 b705          	ld	_formatNumber$L+5,a
1743  012b 3f03          	clr	_formatNumber$L+3
1744  012d a606          	ld	a,#6
1745  012f b702          	ld	_formatNumber$L+2,a
1746  0131 b605          	ld	a,_mainMessage$L+5
1747  0133 be04          	ld	x,_mainMessage$L+4
1748  0135 cd0000        	call	_formatNumber
1750                     ; 119 	displayWriteString(strString, DISPLAY_SELECT_FONT_5x7, 10, 30);
1752  0138 a61e          	ld	a,#30
1753  013a b704          	ld	_displayWriteString$L+4,a
1754  013c a60a          	ld	a,#10
1755  013e b703          	ld	_displayWriteString$L+3,a
1756  0140 a61d          	ld	a,#29
1757  0142 b702          	ld	_displayWriteString$L+2,a
1758  0144 a6f0          	ld	a,#_mainMessage$L-16
1759  0146 5f            	clr	x
1760  0147 cd0000        	call	_displayWriteString
1762                     ; 121 	memcpy(strString, "Code 4 = ", 9); 
1764  014a a609          	ld	a,#9
1765  014c b704          	ld	_memcpy$L+4,a
1766  014e ae01          	ld	x,#high(L3201)
1767  0150 bf02          	ld	_memcpy$L+2,x
1768  0152 a601          	ld	a,#low(L3201)
1769  0154 b703          	ld	_memcpy$L+3,a
1770  0156 a6f0          	ld	a,#_mainMessage$L-16
1771  0158 5f            	clr	x
1772  0159 cd0000        	call	_memcpy
1774                     ; 122 	formatNumber(a_byCode4, 6, 0, strString+9);
1776  015c aef9          	ld	x,#high(_mainMessage$L-7)
1777  015e bf04          	ld	_formatNumber$L+4,x
1778  0160 a6f9          	ld	a,#low(_mainMessage$L-7)
1779  0162 b705          	ld	_formatNumber$L+5,a
1780  0164 3f03          	clr	_formatNumber$L+3
1781  0166 a606          	ld	a,#6
1782  0168 b702          	ld	_formatNumber$L+2,a
1783  016a b607          	ld	a,_mainMessage$L+7
1784  016c be06          	ld	x,_mainMessage$L+6
1785  016e cd0000        	call	_formatNumber
1787                     ; 123 	displayWriteString(strString, DISPLAY_SELECT_FONT_5x7, 10, 40);
1789  0171 a628          	ld	a,#40
1790  0173 b704          	ld	_displayWriteString$L+4,a
1791  0175 a60a          	ld	a,#10
1792  0177 b703          	ld	_displayWriteString$L+3,a
1793  0179 a61d          	ld	a,#29
1794  017b b702          	ld	_displayWriteString$L+2,a
1795  017d a6f0          	ld	a,#_mainMessage$L-16
1796  017f 5f            	clr	x
1797  0180 cd0000        	call	_displayWriteString
1799                     ; 124 }
1802  0183 81            	ret
1824                     ; 127 void mainTestRegister(void)
1824                     ; 128 {
1825                     	switch	.text
1826  0184               _mainTestRegister:
1829                     ; 183 }
1832  0184 81            	ret
1854                     ; 186 void mainTestStrobo(void)
1854                     ; 187 {
1855                     	switch	.text
1856  0185               _mainTestStrobo:
1859                     ; 210 }
1862  0185 81            	ret
1896                     ; 213 void mainTestRepeatedStrobo(WORD a_woEncDistance, WORD a_woRepeated)
1896                     ; 214 {
1897                     	switch	.text
1899                     	xref.b	_mainTestRepeatedStrobo$L
1900  0186               _mainTestRepeatedStrobo:
1903                     ; 257 }
1906  0186 81            	ret
1929                     ; 260 void mainKeyCodeLoop(void)
1929                     ; 261 {
1930                     	switch	.text
1931  0187               _mainKeyCodeLoop:
1934  0187               L3701:
1935                     ; 264 		screenKeyCode();
1937  0187 cd0000        	call	_screenKeyCode
1940  018a 20fb          	jra	L3701
1967                     ; 270 void main(void)
1967                     ; 271 {
1968                     	switch	.text
1969  018c               _main:
1972                     ; 277 	init();
1974  018c cd0000        	call	_init
1976                     ; 280 	_bset(_Pa_Led_D4, _Pin_Led_D4);	
1978  018f 180c          	bset	_PEDR,#4
1979                     ; 287 	displayReset();
1981  0191 cd0000        	call	_displayReset
1983                     ; 288 	displayAppInit();
1985  0194 cd0000        	call	_displayAppInit
1987                     ; 290 	displayAppLoop();
1989  0197 cd0000        	call	_displayAppLoop
1991                     ; 291 }
1994  019a 81            	ret
2006                     	xdef	_mainKeyCodeLoop
2007                     	xdef	_mainTestRepeatedStrobo
2008                     	xdef	_mainTestStrobo
2009                     	xdef	_mainTestRegister
2010                     	xdef	_mainMessage
2011                     	xref	_m_bySNIIndexValue
2012                     	xdef	_init
2013                     	xdef	_main
2014                     	xref	_formatNumber
2015                     	xref	_memcpy
2016                     	xref	_displayAppLoop
2017                     	xref	_displayAppInit
2018                     	xref	_screenKeyCode
2019                     	xref	_displayWriteString
2020                     	xref	_displayReset
2021                     	xref	_displayInit
2022                     	xref	_eepromInit
2023                     	xref	_SCI_Init
2024                     	xref	_FIFO_Init
2025                     	switch	.const
2026  0001               L3201:
2027  0001 436f64652034  	dc.b	"Code 4 = ",0
2028  000b               L1201:
2029  000b 436f64652033  	dc.b	"Code 3 = ",0
2030  0015               L7101:
2031  0015 436f64652032  	dc.b	"Code 2 = ",0
2032  001f               L5101:
2033  001f 436f64652031  	dc.b	"Code 1 = ",0
2053                     	xref.b	_displayWriteString$L
2054                     	xref.b	_formatNumber$L
2055                     	xref.b	_memcpy$L
2056                     	end
