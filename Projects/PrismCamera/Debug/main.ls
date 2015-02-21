   1                     ; C Compiler for ST7 (COSMIC Software)
   2                     ; Generator V4.5.5 - 12 Jan 2006
1342                     ; 13 void init(void)
1342                     ; 14 {
1343                     	switch	.text
1344  0000               _init:
1347                     ; 15 	m_byIndexValue = 0;	
1349  0000 4f            	clr	a
1350  0001 c70000        	ld	_m_byIndexValue,a
1351                     ; 16 	PADR 	= _PADR;       
1353  0004 3f00          	clr	_PADR
1354                     ; 17 	PADDR 	= _PADDR;
1356  0006 a623          	ld	a,#35
1357  0008 b701          	ld	_PADDR,a
1358                     ; 18 	PAOR 	= 0b00110011;//0b00100011; //_PAOR; TODO: To replace when display will be connected
1360  000a a633          	ld	a,#51
1361  000c b702          	ld	_PAOR,a
1362                     ; 19 	PADR 	= _PADR;
1364  000e 3f00          	clr	_PADR
1365                     ; 21 	PBDR 	= _PBDR;  	
1367  0010 3f03          	clr	_PBDR
1368                     ; 22 	PBDDR 	= _PBDDR;
1370  0012 a63f          	ld	a,#63
1371  0014 b704          	ld	_PBDDR,a
1372                     ; 23 	PBOR 	= 0b01111111;//0b00111111; //_PBOR; TODO: To replace when display will be connected
1374  0016 a67f          	ld	a,#127
1375  0018 b705          	ld	_PBOR,a
1376                     ; 24 	PBDR 	= _PBDR;
1378  001a 3f03          	clr	_PBDR
1379                     ; 26 	PCDR 	= _PCDR;  	
1381  001c 3f06          	clr	_PCDR
1382                     ; 27 	PCDDR 	= _PCDDR;
1384  001e a682          	ld	a,#130
1385  0020 b707          	ld	_PCDDR,a
1386                     ; 28 	PCOR 	= _PCOR; 
1388  0022 a682          	ld	a,#130
1389  0024 b708          	ld	_PCOR,a
1390                     ; 29 	PCDR 	= _PCDR;  	
1392  0026 3f06          	clr	_PCDR
1393                     ; 31 	PDDR 	= _PDDR;       
1395  0028 3f09          	clr	_PDDR
1396                     ; 32 	PDDDR 	= _PDDDR;
1398  002a a6ff          	ld	a,#255
1399  002c b70a          	ld	_PDDDR,a
1400                     ; 33 	PDOR 	= _PDOR;
1402  002e a6ff          	ld	a,#255
1403  0030 b70b          	ld	_PDOR,a
1404                     ; 34 	PDDR 	= _PDDR;
1406  0032 3f09          	clr	_PDDR
1407                     ; 36 	PEDR 	= _PEDR;       
1409  0034 a6f0          	ld	a,#240
1410  0036 b70c          	ld	_PEDR,a
1411                     ; 37 	PEDDR 	= _PEDDR;
1413  0038 a6fd          	ld	a,#253
1414  003a b70d          	ld	_PEDDR,a
1415                     ; 38 	PEOR 	= _PEOR;
1417  003c a6fd          	ld	a,#253
1418  003e b70e          	ld	_PEOR,a
1419                     ; 39 	PEDR 	= _PEDR;	
1421  0040 a6f0          	ld	a,#240
1422  0042 b70c          	ld	_PEDR,a
1423                     ; 41 	PFDR 	= _PFDR;       
1425  0044 3f0f          	clr	_PFDR
1426                     ; 42 	PFDDR 	= _PFDDR;
1428  0046 a60b          	ld	a,#11
1429  0048 b710          	ld	_PFDDR,a
1430                     ; 43 	PFOR 	= _PFOR;
1432  004a a60b          	ld	a,#11
1433  004c b711          	ld	_PFOR,a
1434                     ; 44 	PFDR 	= _PFDR;
1436  004e 3f0f          	clr	_PFDR
1437                     ; 46 	PGDR 	= _PGDR;       
1439  0050 3f12          	clr	_PGDR
1440                     ; 47 	PGDDR 	= _PGDDR;
1442  0052 a6fd          	ld	a,#253
1443  0054 b713          	ld	_PGDDR,a
1444                     ; 48 	PGOR 	= _PGOR;
1446  0056 a6fd          	ld	a,#253
1447  0058 b714          	ld	_PGOR,a
1448                     ; 49 	PGDR 	= _PGDR;
1450  005a 3f12          	clr	_PGDR
1451                     ; 51 	PHDR 	= _PHDR;       
1453  005c 3f15          	clr	_PHDR
1454                     ; 52 	PHDDR 	= _PHDDR;
1456  005e a67f          	ld	a,#127
1457  0060 b716          	ld	_PHDDR,a
1458                     ; 53 	PHOR 	= _PHOR;
1460  0062 a67f          	ld	a,#127
1461  0064 b717          	ld	_PHOR,a
1462                     ; 54 	PHDR 	= _PHDR;
1464  0066 3f15          	clr	_PHDR
1465                     ; 63 	MCCSR = 0b10000000;
1467  0068 a680          	ld	a,#128
1468  006a b72c          	ld	_MCCSR,a
1469                     ; 67 	DisableInterrupts();
1472  006c 9b            sim
1474                     ; 69 	ISPR0 = _ISPR0;
1476  006d a6fc          	ld	a,#252
1477  006f b724          	ld	_ISPR0,a
1478                     ; 70 	ISPR1 = _ISPR1;
1480  0071 a6fc          	ld	a,#252
1481  0073 b725          	ld	_ISPR1,a
1482                     ; 72 	ISPR2 = _ISPR2; // interrupt no.8 bit0&1 priority level 2. if the are 11 the timer A interrupt is disable.
1484  0075 a6fc          	ld	a,#252
1485  0077 b726          	ld	_ISPR2,a
1486                     ; 73 	ISPR3 = _ISPR3;  
1488  0079 a6fc          	ld	a,#252
1489  007b b727          	ld	_ISPR3,a
1490                     ; 74 	EICR  = _EICR;	
1492  007d a640          	ld	a,#64
1493  007f b728          	ld	_EICR,a
1494                     ; 76 	FIFO_Init();
1496  0081 cd0000        	call	_FIFO_Init
1498                     ; 77 	SCI_Init();
1500  0084 cd0000        	call	_SCI_Init
1502                     ; 80 	parametersInit();
1504  0087 cd0000        	call	_parametersInit
1506                     ; 81 	displayInit();
1508  008a cd0000        	call	_displayInit
1510                     ; 84 	_bres(_Pa_Led_D1, _Pin_Led_D1);
1512  008d 1f0c          	bres	_PEDR,#7
1513                     ; 85 	_bres(_Pa_Led_D2, _Pin_Led_D2);
1515  008f 1d0c          	bres	_PEDR,#6
1516                     ; 86 	_bres(_Pa_Led_D3, _Pin_Led_D3);
1518  0091 1b0c          	bres	_PEDR,#5
1519                     ; 87 	_bres(_Pa_Led_D4, _Pin_Led_D4);
1521  0093 190c          	bres	_PEDR,#4
1522                     ; 89 	EnableInterrupts();
1525  0095 9a            rim
1527                     ; 90 }	
1530  0096 81            	ret
1594                     ; 92 void Message(WORD a_byCode, WORD a_byCode2, WORD a_woValue)
1594                     ; 93 {
1595                     	switch	.text
1597                     	xref.b	_Message$L
1598  0097               _Message:
1600  0097 b701          	ld	_Message$L+1,a
1601  0099 bf00          	ld	_Message$L,x
1603                     ; 98 	strString[15] = 0x00;
1605  009b 3fff          	clr	_Message$L-1
1606                     ; 99 	memcpy(strString, "Code 1 = ", 9); 
1608  009d a609          	ld	a,#9
1609  009f b704          	ld	_memcpy$L+4,a
1610  00a1 ae14          	ld	x,#high(L377)
1611  00a3 bf02          	ld	_memcpy$L+2,x
1612  00a5 a614          	ld	a,#low(L377)
1613  00a7 b703          	ld	_memcpy$L+3,a
1614  00a9 a6f0          	ld	a,#_Message$L-16
1615  00ab 5f            	clr	x
1616  00ac cd0000        	call	_memcpy
1618                     ; 100 	formatNumber(a_byCode, 6, 0, strString+9);
1620  00af aef9          	ld	x,#high(_Message$L-7)
1621  00b1 bf04          	ld	_formatNumber$L+4,x
1622  00b3 a6f9          	ld	a,#low(_Message$L-7)
1623  00b5 b705          	ld	_formatNumber$L+5,a
1624  00b7 3f03          	clr	_formatNumber$L+3
1625  00b9 a606          	ld	a,#6
1626  00bb b702          	ld	_formatNumber$L+2,a
1627  00bd b601          	ld	a,_Message$L+1
1628  00bf be00          	ld	x,_Message$L
1629  00c1 cd0000        	call	_formatNumber
1631                     ; 101 	displayWriteString(strString, DISPLAY_SELECT_FONT_5x7, 10, 10);
1633  00c4 a60a          	ld	a,#10
1634  00c6 b704          	ld	_displayWriteString$L+4,a
1635  00c8 a60a          	ld	a,#10
1636  00ca b703          	ld	_displayWriteString$L+3,a
1637  00cc a61d          	ld	a,#29
1638  00ce b702          	ld	_displayWriteString$L+2,a
1639  00d0 a6f0          	ld	a,#_Message$L-16
1640  00d2 5f            	clr	x
1641  00d3 cd0000        	call	_displayWriteString
1643                     ; 104 	memcpy(strString, "Code 2 = ", 9); 
1645  00d6 a609          	ld	a,#9
1646  00d8 b704          	ld	_memcpy$L+4,a
1647  00da ae0a          	ld	x,#high(L577)
1648  00dc bf02          	ld	_memcpy$L+2,x
1649  00de a60a          	ld	a,#low(L577)
1650  00e0 b703          	ld	_memcpy$L+3,a
1651  00e2 a6f0          	ld	a,#_Message$L-16
1652  00e4 5f            	clr	x
1653  00e5 cd0000        	call	_memcpy
1655                     ; 105 	formatNumber(a_byCode2, 6, 0, strString+9);
1657  00e8 aef9          	ld	x,#high(_Message$L-7)
1658  00ea bf04          	ld	_formatNumber$L+4,x
1659  00ec a6f9          	ld	a,#low(_Message$L-7)
1660  00ee b705          	ld	_formatNumber$L+5,a
1661  00f0 3f03          	clr	_formatNumber$L+3
1662  00f2 a606          	ld	a,#6
1663  00f4 b702          	ld	_formatNumber$L+2,a
1664  00f6 b603          	ld	a,_Message$L+3
1665  00f8 be02          	ld	x,_Message$L+2
1666  00fa cd0000        	call	_formatNumber
1668                     ; 106 	displayWriteString(strString, DISPLAY_SELECT_FONT_5x7, 10, 20);
1670  00fd a614          	ld	a,#20
1671  00ff b704          	ld	_displayWriteString$L+4,a
1672  0101 a60a          	ld	a,#10
1673  0103 b703          	ld	_displayWriteString$L+3,a
1674  0105 a61d          	ld	a,#29
1675  0107 b702          	ld	_displayWriteString$L+2,a
1676  0109 a6f0          	ld	a,#_Message$L-16
1677  010b 5f            	clr	x
1678  010c cd0000        	call	_displayWriteString
1680                     ; 108 	strString[15] = 0x00;
1682  010f 3fff          	clr	_Message$L-1
1683                     ; 109 	memcpy(strString, "Value  = ", 9); 
1685  0111 a609          	ld	a,#9
1686  0113 b704          	ld	_memcpy$L+4,a
1687  0115 ae00          	ld	x,#high(L777)
1688  0117 bf02          	ld	_memcpy$L+2,x
1689  0119 a600          	ld	a,#low(L777)
1690  011b b703          	ld	_memcpy$L+3,a
1691  011d a6f0          	ld	a,#_Message$L-16
1692  011f 5f            	clr	x
1693  0120 cd0000        	call	_memcpy
1695                     ; 110 	formatNumber(a_woValue, 6, 0, strString+9);
1697  0123 aef9          	ld	x,#high(_Message$L-7)
1698  0125 bf04          	ld	_formatNumber$L+4,x
1699  0127 a6f9          	ld	a,#low(_Message$L-7)
1700  0129 b705          	ld	_formatNumber$L+5,a
1701  012b 3f03          	clr	_formatNumber$L+3
1702  012d a606          	ld	a,#6
1703  012f b702          	ld	_formatNumber$L+2,a
1704  0131 b605          	ld	a,_Message$L+5
1705  0133 be04          	ld	x,_Message$L+4
1706  0135 cd0000        	call	_formatNumber
1708                     ; 111 	displayWriteString(strString, DISPLAY_SELECT_FONT_5x7, 10, 30);
1710  0138 a61e          	ld	a,#30
1711  013a b704          	ld	_displayWriteString$L+4,a
1712  013c a60a          	ld	a,#10
1713  013e b703          	ld	_displayWriteString$L+3,a
1714  0140 a61d          	ld	a,#29
1715  0142 b702          	ld	_displayWriteString$L+2,a
1716  0144 a6f0          	ld	a,#_Message$L-16
1717  0146 5f            	clr	x
1718  0147 cd0000        	call	_displayWriteString
1720                     ; 112 }
1723  014a 81            	ret
1762                     ; 115 void main(void)
1762                     ; 116 {
1763                     	switch	.text
1765                     	xref.b	_main$L
1766  014b               _main:
1769                     ; 118 	init();
1771  014b cd0000        	call	_init
1773                     ; 119 	_bset(_Pa_Led_D4, _Pin_Led_D4);	
1775  014e 180c          	bset	_PEDR,#4
1776  0150               L7101:
1777                     ; 126 		j = 255;
1779  0150 a6ff          	ld	a,#255
1780  0152 b7ff          	ld	_main$L-1,a
1782  0154               L7201:
1783                     ; 127 		while(_btst(_Pa_Encoder0, _Pin_Encoder0));
1785  0154 b60f          	ld	a,_PFDR
1786  0156 a504          	bcp	a,#4
1787  0158 26fa          	jrne	L7201
1789  015a               L5301:
1790                     ; 128 		while(!_btst(_Pa_Encoder0, _Pin_Encoder0));
1792  015a b60f          	ld	a,_PFDR
1793  015c a504          	bcp	a,#4
1794  015e 27fa          	jreq	L5301
1795                     ; 129 		if _btst(_Pa_AuxIn_2, _Pin_AuxIn_2)
1797  0160 b600          	ld	a,_PADR
1798  0162 a540          	bcp	a,#64
1799  0164 2719          	jreq	L1401
1801  0166 2010          	jra	L5401
1802  0168               L3501:
1803                     ; 133 				while((_Pa_EncoderAB & 0b10000100)==0b10000100); 	// Enc = 1 & Zero = 1
1805  0168 b60f          	ld	a,_PFDR
1806  016a a484          	and	a,#132
1807  016c a184          	cp	a,#132
1808  016e 27f8          	jreq	L3501
1810  0170               L1601:
1811                     ; 134 				while((_Pa_EncoderAB & 0b10000100)==0b00000100); 	// Enc = 0 & Zero = 1
1813  0170 b60f          	ld	a,_PFDR
1814  0172 a484          	and	a,#132
1815  0174 a104          	cp	a,#4
1816  0176 27f8          	jreq	L1601
1817  0178               L5401:
1818                     ; 131 			while(j-->0)
1820  0178 b6ff          	ld	a,_main$L-1
1821  017a 3aff          	dec	_main$L-1
1822  017c 4d            	tnz	a
1823  017d 26e9          	jrne	L3501
1824  017f               L1401:
1825                     ; 138 		_switch(_Pa_Strobo, _Pin_Strobo);
1827  017f b603          	ld	a,_PBDR
1828  0181 a510          	bcp	a,#16
1829  0183 2704          	jreq	L5601
1832  0185 1903          	bres	_PBDR,#4
1834  0187 2002          	jra	L7601
1835  0189               L5601:
1838  0189 1803          	bset	_PBDR,#4
1839  018b               L7601:
1840                     ; 139 		_switch(_Pa_Led_D3, _Pin_Led_D3);	
1843  018b b60c          	ld	a,_PEDR
1844  018d a520          	bcp	a,#32
1845  018f 2704          	jreq	L1701
1848  0191 1b0c          	bres	_PEDR,#5
1850  0193 2002          	jra	L3701
1851  0195               L1701:
1854  0195 1a0c          	bset	_PEDR,#5
1855  0197               L3701:
1856                     ; 140 		sleep(25);
1859  0197 a619          	ld	a,#25
1860  0199 b703          	ld	_sleep$L+3,a
1861  019b a600          	ld	a,#0
1862  019d b702          	ld	_sleep$L+2,a
1863  019f a600          	ld	a,#0
1864  01a1 b701          	ld	_sleep$L+1,a
1865  01a3 a600          	ld	a,#0
1866  01a5 b700          	ld	_sleep$L,a
1867  01a7 cd0000        	call	_sleep
1869                     ; 141 		_switch(_Pa_Strobo, _Pin_Strobo);
1871  01aa b603          	ld	a,_PBDR
1872  01ac a510          	bcp	a,#16
1873  01ae 2704          	jreq	L5701
1876  01b0 1903          	bres	_PBDR,#4
1878  01b2 209c          	jra	L7101
1879  01b4               L5701:
1882  01b4 1803          	bset	_PBDR,#4
1883  01b6 2098          	jra	L7101
1895                     	xdef	_Message
1896                     	xref	_m_byIndexValue
1897                     	xdef	_init
1898                     	xdef	_main
1899                     	xref	_formatNumber
1900                     	xref	_memcpy
1901                     	xref	_sleep
1902                     	xref	_displayWriteString
1903                     	xref	_displayInit
1904                     	xref	_parametersInit
1905                     	xref	_SCI_Init
1906                     	xref	_FIFO_Init
1907                     .const:	section	.text
1908  0000               L777:
1909  0000 56616c756520  	dc.b	"Value  = ",0
1910  000a               L577:
1911  000a 436f64652032  	dc.b	"Code 2 = ",0
1912  0014               L377:
1913  0014 436f64652031  	dc.b	"Code 1 = ",0
1933                     	xref.b	_sleep$L
1934                     	xref.b	_displayWriteString$L
1935                     	xref.b	_formatNumber$L
1936                     	xref.b	_memcpy$L
1937                     	end
