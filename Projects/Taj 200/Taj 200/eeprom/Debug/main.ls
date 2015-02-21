   1                     ; C Compiler for ST7 (COSMIC Software)
   2                     ; Generator V4.5.5 - 12 Jan 2006
1338                     ; 60 void init(void)
1338                     ; 61 {
1339                     	switch	.text
1340  0000               _init:
1343                     ; 66 	PADR 	= _PADR;       
1345  0000 3f00          	clr	_PADR
1346                     ; 67 	PADDR 	= _PADDR;
1348  0002 a623          	ld	a,#35
1349  0004 b701          	ld	_PADDR,a
1350                     ; 68 	PAOR 	= _PAOR;
1352  0006 a633          	ld	a,#51
1353  0008 b702          	ld	_PAOR,a
1354                     ; 69 	PADR 	= _PADR;
1356  000a 3f00          	clr	_PADR
1357                     ; 71 	PBDR 	= _PBDR;  	
1359  000c 3f03          	clr	_PBDR
1360                     ; 72 	PBDDR 	= _PBDDR;
1362  000e a63f          	ld	a,#63
1363  0010 b704          	ld	_PBDDR,a
1364                     ; 73 	PBOR 	= _PBOR; 
1366  0012 a67f          	ld	a,#127
1367  0014 b705          	ld	_PBOR,a
1368                     ; 74 	PBDR 	= _PBDR;
1370  0016 3f03          	clr	_PBDR
1371                     ; 76 	PCDR 	= _PCDR;  	
1373  0018 3f06          	clr	_PCDR
1374                     ; 77 	PCDDR 	= _PCDDR;
1376  001a a682          	ld	a,#130
1377  001c b707          	ld	_PCDDR,a
1378                     ; 78 	PCOR 	= _PCOR; 
1380  001e a682          	ld	a,#130
1381  0020 b708          	ld	_PCOR,a
1382                     ; 79 	PCDR 	= _PCDR;  	
1384  0022 3f06          	clr	_PCDR
1385                     ; 81 	PDDR 	= _PDDR;       
1387  0024 3f09          	clr	_PDDR
1388                     ; 82 	PDDDR 	= _PDDDR;
1390  0026 a6ff          	ld	a,#255
1391  0028 b70a          	ld	_PDDDR,a
1392                     ; 83 	PDOR 	= _PDOR;
1394  002a a6ff          	ld	a,#255
1395  002c b70b          	ld	_PDOR,a
1396                     ; 84 	PDDR 	= _PDDR;
1398  002e 3f09          	clr	_PDDR
1399                     ; 86 	PEDR 	= _PEDR;       
1401  0030 a610          	ld	a,#16
1402  0032 b70c          	ld	_PEDR,a
1403                     ; 87 	PEDDR 	= _PEDDR;
1405  0034 a6fd          	ld	a,#253
1406  0036 b70d          	ld	_PEDDR,a
1407                     ; 88 	PEOR 	= _PEOR;
1409  0038 a6fd          	ld	a,#253
1410  003a b70e          	ld	_PEOR,a
1411                     ; 89 	PEDR 	= _PEDR;
1413  003c a610          	ld	a,#16
1414  003e b70c          	ld	_PEDR,a
1415                     ; 91 	PFDR 	= _PFDR;       
1417  0040 3f0f          	clr	_PFDR
1418                     ; 92 	PFDDR 	= _PFDDR;
1420  0042 a60b          	ld	a,#11
1421  0044 b710          	ld	_PFDDR,a
1422                     ; 93 	PFOR 	= _PFOR;
1424  0046 a60b          	ld	a,#11
1425  0048 b711          	ld	_PFOR,a
1426                     ; 94 	PFDR 	= _PFDR;
1428  004a 3f0f          	clr	_PFDR
1429                     ; 96 	PGDR 	= _PGDR;       
1431  004c 3f12          	clr	_PGDR
1432                     ; 97 	PGDDR 	= _PGDDR;
1434  004e a6fd          	ld	a,#253
1435  0050 b713          	ld	_PGDDR,a
1436                     ; 98 	PGOR 	= _PGOR;
1438  0052 a6fd          	ld	a,#253
1439  0054 b714          	ld	_PGOR,a
1440                     ; 99 	PGDR 	= _PGDR;
1442  0056 3f12          	clr	_PGDR
1443                     ; 101 	PHDR 	= _PHDR;       
1445  0058 3f15          	clr	_PHDR
1446                     ; 102 	PHDDR 	= _PHDDR;
1448  005a a67f          	ld	a,#127
1449  005c b716          	ld	_PHDDR,a
1450                     ; 103 	PHOR 	= _PHOR;
1452  005e a67f          	ld	a,#127
1453  0060 b717          	ld	_PHOR,a
1454                     ; 104 	PHDR 	= _PHDR;
1456  0062 3f15          	clr	_PHDR
1457                     ; 106 	DisableInterrupts();
1460  0064 9b            sim
1462                     ; 108     ISPR0 = 0b11111100;
1464  0065 a6fc          	ld	a,#252
1465  0067 b724          	ld	_ISPR0,a
1466                     ; 109 	ISPR1 = 0b11111100;
1468  0069 a6fc          	ld	a,#252
1469  006b b725          	ld	_ISPR1,a
1470                     ; 111 	ISPR2 = 0b11111100; // interrupt no.8 bit0&1 priority level 2. if the are 11 the timer A interrupt is disable.
1472  006d a6fc          	ld	a,#252
1473  006f b726          	ld	_ISPR2,a
1474                     ; 112 	ISPR3 = 0b11111100;  
1476  0071 a6fc          	ld	a,#252
1477  0073 b727          	ld	_ISPR3,a
1478                     ; 113 	EICR  = 0x40;
1480  0075 a640          	ld	a,#64
1481  0077 b728          	ld	_EICR,a
1482                     ; 115 	eepromInit();
1484  0079 cd0000        	call	_eepromInit
1486                     ; 119 }	
1489  007c 81            	ret
1575                     ; 122 void main(void)
1575                     ; 123 {
1576                     	switch	.text
1578                     	xref.b	_main$L
1579  007d               _main:
1582                     ; 125 	WORD woInitialAddressShort 	= 0x0000;
1584  007d 3fba          	clr	_main$L-70
1585  007f 3fbb          	clr	_main$L-69
1586                     ; 126 	WORD woInitialAddressNormal	= 0x0000;
1588  0081 3fb8          	clr	_main$L-72
1589  0083 3fb9          	clr	_main$L-71
1590                     ; 127 	WORD woOffset 				= 0x0000;
1592  0085 3fb6          	clr	_main$L-74
1593  0087 3fb7          	clr	_main$L-73
1594                     ; 128 	WORD woAddress 				= 0x0000;
1596  0089 3ffc          	clr	_main$L-4
1597  008b 3ffd          	clr	_main$L-3
1598                     ; 129 	WORD woMsgIdx 				= 0x0000;
1600  008d 3ffe          	clr	_main$L-2
1601  008f 3fff          	clr	_main$L-1
1602                     ; 131 	woInitialAddressShort	= EEPROM_INITIAL_OFFSET + (EEPROM_LANGUAGE_NUMBER*EEPROM_LANGUAGE_LENGTH);
1604  0091 a610          	ld	a,#16
1605  0093 b7ba          	ld	_main$L-70,a
1606  0095 3fbb          	clr	_main$L-69
1607                     ; 132 	woInitialAddressNormal	= (EEPROM_MSG_LENGTH_SHORT*EEPROM_MIN_INDEX_NORMAL) + EEPROM_INITIAL_OFFSET + (EEPROM_LANGUAGE_NUMBER*EEPROM_LANGUAGE_LENGTH);
1609  0097 ae14          	ld	x,#20
1610  0099 bfb8          	ld	_main$L-72,x
1611  009b a640          	ld	a,#64
1612  009d b7b9          	ld	_main$L-71,a
1613                     ; 134 	init();
1615  009f cd0000        	call	_init
1617                     ; 136 	_bres(_Pa_Led_D1, _Pin_Led_D1);
1619  00a2 1f0c          	bres	_PEDR,#7
1620                     ; 137 	_bres(_Pa_Led_D2, _Pin_Led_D2);
1622  00a4 1d0c          	bres	_PEDR,#6
1623                     ; 138 	_bres(_Pa_Led_D3, _Pin_Led_D3);
1625  00a6 1b0c          	bres	_PEDR,#5
1626                     ; 139 	_bres(_Pa_Led_D4, _Pin_Led_D4);
1628  00a8 190c          	bres	_PEDR,#4
1629                     ; 146 	_bset(_Pa_Led_D1, _Pin_Led_D1);
1631  00aa 1e0c          	bset	_PEDR,#7
1632                     ; 148 	woMsgIdx = MSG_IDX_SEC; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_SEC, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
1634  00ac 3ffe          	clr	_main$L-2
1635  00ae 3fff          	clr	_main$L-1
1638  00b0 beba          	ld	x,_main$L-70
1639  00b2 bffc          	ld	_main$L-4,x
1640  00b4 b6bb          	ld	a,_main$L-69
1641  00b6 b7fd          	ld	_main$L-3,a
1644  00b8 a610          	ld	a,#16
1645  00ba b704          	ld	_memcpy$L+4,a
1646  00bc ae6e          	ld	x,#high(L3001)
1647  00be bf02          	ld	_memcpy$L+2,x
1648  00c0 a66e          	ld	a,#low(L3001)
1649  00c2 b703          	ld	_memcpy$L+3,a
1650  00c4 a6bc          	ld	a,#_main$L-68
1651  00c6 5f            	clr	x
1652  00c7 cd0000        	call	_memcpy
1656  00ca aebc          	ld	x,#high(_main$L-68)
1657  00cc bf03          	ld	_writeEepromString$L+3,x
1658  00ce a6bc          	ld	a,#low(_main$L-68)
1659  00d0 b704          	ld	_writeEepromString$L+4,a
1660  00d2 befc          	ld	x,_main$L-4
1661  00d4 bf01          	ld	_writeEepromString$L+1,x
1662  00d6 b6fd          	ld	a,_main$L-3
1663  00d8 b702          	ld	_writeEepromString$L+2,a
1664  00da a603          	ld	a,#3
1665  00dc cd0000        	call	_writeEepromString
1667                     ; 149 	woMsgIdx = MSG_IDX_MSEC; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_MSEC, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
1669  00df a601          	ld	a,#1
1670  00e1 b7ff          	ld	_main$L-1,a
1671  00e3 3ffe          	clr	_main$L-2
1674  00e5 b6bb          	ld	a,_main$L-69
1675  00e7 beba          	ld	x,_main$L-70
1676  00e9 ab10          	add	a,#16
1677  00eb 2401          	jrnc	L01
1678  00ed 5c            	inc	x
1679  00ee               L01:
1680  00ee b7fd          	ld	_main$L-3,a
1681  00f0 bffc          	ld	_main$L-4,x
1684  00f2 a610          	ld	a,#16
1685  00f4 b704          	ld	_memcpy$L+4,a
1686  00f6 ae68          	ld	x,#high(L5001)
1687  00f8 bf02          	ld	_memcpy$L+2,x
1688  00fa a668          	ld	a,#low(L5001)
1689  00fc b703          	ld	_memcpy$L+3,a
1690  00fe a6bc          	ld	a,#_main$L-68
1691  0100 5f            	clr	x
1692  0101 cd0000        	call	_memcpy
1696  0104 aebc          	ld	x,#high(_main$L-68)
1697  0106 bf03          	ld	_writeEepromString$L+3,x
1698  0108 a6bc          	ld	a,#low(_main$L-68)
1699  010a b704          	ld	_writeEepromString$L+4,a
1700  010c befc          	ld	x,_main$L-4
1701  010e bf01          	ld	_writeEepromString$L+1,x
1702  0110 b6fd          	ld	a,_main$L-3
1703  0112 b702          	ld	_writeEepromString$L+2,a
1704  0114 a603          	ld	a,#3
1705  0116 cd0000        	call	_writeEepromString
1707                     ; 150 	woMsgIdx = MSG_IDX_CELSIUS; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_CELSIUS, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
1709  0119 a602          	ld	a,#2
1710  011b b7ff          	ld	_main$L-1,a
1711  011d 3ffe          	clr	_main$L-2
1714  011f b6bb          	ld	a,_main$L-69
1715  0121 beba          	ld	x,_main$L-70
1716  0123 ab20          	add	a,#32
1717  0125 2401          	jrnc	L21
1718  0127 5c            	inc	x
1719  0128               L21:
1720  0128 b7fd          	ld	_main$L-3,a
1721  012a bffc          	ld	_main$L-4,x
1724  012c a610          	ld	a,#16
1725  012e b704          	ld	_memcpy$L+4,a
1726  0130 ae60          	ld	x,#high(L7001)
1727  0132 bf02          	ld	_memcpy$L+2,x
1728  0134 a660          	ld	a,#low(L7001)
1729  0136 b703          	ld	_memcpy$L+3,a
1730  0138 a6bc          	ld	a,#_main$L-68
1731  013a 5f            	clr	x
1732  013b cd0000        	call	_memcpy
1736  013e aebc          	ld	x,#high(_main$L-68)
1737  0140 bf03          	ld	_writeEepromString$L+3,x
1738  0142 a6bc          	ld	a,#low(_main$L-68)
1739  0144 b704          	ld	_writeEepromString$L+4,a
1740  0146 befc          	ld	x,_main$L-4
1741  0148 bf01          	ld	_writeEepromString$L+1,x
1742  014a b6fd          	ld	a,_main$L-3
1743  014c b702          	ld	_writeEepromString$L+2,a
1744  014e a603          	ld	a,#3
1745  0150 cd0000        	call	_writeEepromString
1747                     ; 151 	woMsgIdx = MSG_IDX_NO; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_NO, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
1749  0153 a603          	ld	a,#3
1750  0155 b7ff          	ld	_main$L-1,a
1751  0157 3ffe          	clr	_main$L-2
1754  0159 b6bb          	ld	a,_main$L-69
1755  015b beba          	ld	x,_main$L-70
1756  015d ab30          	add	a,#48
1757  015f 2401          	jrnc	L41
1758  0161 5c            	inc	x
1759  0162               L41:
1760  0162 b7fd          	ld	_main$L-3,a
1761  0164 bffc          	ld	_main$L-4,x
1764  0166 a610          	ld	a,#16
1765  0168 b704          	ld	_memcpy$L+4,a
1766  016a ae59          	ld	x,#high(L1101)
1767  016c bf02          	ld	_memcpy$L+2,x
1768  016e a659          	ld	a,#low(L1101)
1769  0170 b703          	ld	_memcpy$L+3,a
1770  0172 a6bc          	ld	a,#_main$L-68
1771  0174 5f            	clr	x
1772  0175 cd0000        	call	_memcpy
1776  0178 aebc          	ld	x,#high(_main$L-68)
1777  017a bf03          	ld	_writeEepromString$L+3,x
1778  017c a6bc          	ld	a,#low(_main$L-68)
1779  017e b704          	ld	_writeEepromString$L+4,a
1780  0180 befc          	ld	x,_main$L-4
1781  0182 bf01          	ld	_writeEepromString$L+1,x
1782  0184 b6fd          	ld	a,_main$L-3
1783  0186 b702          	ld	_writeEepromString$L+2,a
1784  0188 a603          	ld	a,#3
1785  018a cd0000        	call	_writeEepromString
1787                     ; 152 	woMsgIdx = MSG_IDX_PH; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_PH, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
1789  018d a604          	ld	a,#4
1790  018f b7ff          	ld	_main$L-1,a
1791  0191 3ffe          	clr	_main$L-2
1794  0193 b6bb          	ld	a,_main$L-69
1795  0195 beba          	ld	x,_main$L-70
1796  0197 ab40          	add	a,#64
1797  0199 2401          	jrnc	L61
1798  019b 5c            	inc	x
1799  019c               L61:
1800  019c b7fd          	ld	_main$L-3,a
1801  019e bffc          	ld	_main$L-4,x
1804  01a0 a610          	ld	a,#16
1805  01a2 b704          	ld	_memcpy$L+4,a
1806  01a4 ae56          	ld	x,#high(L3101)
1807  01a6 bf02          	ld	_memcpy$L+2,x
1808  01a8 a656          	ld	a,#low(L3101)
1809  01aa b703          	ld	_memcpy$L+3,a
1810  01ac a6bc          	ld	a,#_main$L-68
1811  01ae 5f            	clr	x
1812  01af cd0000        	call	_memcpy
1816  01b2 aebc          	ld	x,#high(_main$L-68)
1817  01b4 bf03          	ld	_writeEepromString$L+3,x
1818  01b6 a6bc          	ld	a,#low(_main$L-68)
1819  01b8 b704          	ld	_writeEepromString$L+4,a
1820  01ba befc          	ld	x,_main$L-4
1821  01bc bf01          	ld	_writeEepromString$L+1,x
1822  01be b6fd          	ld	a,_main$L-3
1823  01c0 b702          	ld	_writeEepromString$L+2,a
1824  01c2 a603          	ld	a,#3
1825  01c4 cd0000        	call	_writeEepromString
1827                     ; 153 	woMsgIdx = MSG_IDX_YES; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_YES, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
1829  01c7 a605          	ld	a,#5
1830  01c9 b7ff          	ld	_main$L-1,a
1831  01cb 3ffe          	clr	_main$L-2
1834  01cd b6bb          	ld	a,_main$L-69
1835  01cf beba          	ld	x,_main$L-70
1836  01d1 ab50          	add	a,#80
1837  01d3 2401          	jrnc	L02
1838  01d5 5c            	inc	x
1839  01d6               L02:
1840  01d6 b7fd          	ld	_main$L-3,a
1841  01d8 bffc          	ld	_main$L-4,x
1844  01da a610          	ld	a,#16
1845  01dc b704          	ld	_memcpy$L+4,a
1846  01de ae53          	ld	x,#high(L5101)
1847  01e0 bf02          	ld	_memcpy$L+2,x
1848  01e2 a653          	ld	a,#low(L5101)
1849  01e4 b703          	ld	_memcpy$L+3,a
1850  01e6 a6bc          	ld	a,#_main$L-68
1851  01e8 5f            	clr	x
1852  01e9 cd0000        	call	_memcpy
1856  01ec aebc          	ld	x,#high(_main$L-68)
1857  01ee bf03          	ld	_writeEepromString$L+3,x
1858  01f0 a6bc          	ld	a,#low(_main$L-68)
1859  01f2 b704          	ld	_writeEepromString$L+4,a
1860  01f4 befc          	ld	x,_main$L-4
1861  01f6 bf01          	ld	_writeEepromString$L+1,x
1862  01f8 b6fd          	ld	a,_main$L-3
1863  01fa b702          	ld	_writeEepromString$L+2,a
1864  01fc a603          	ld	a,#3
1865  01fe cd0000        	call	_writeEepromString
1867                     ; 154 	woMsgIdx = MSG_IDX_PAUSE; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_PAUSE, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
1869  0201 a606          	ld	a,#6
1870  0203 b7ff          	ld	_main$L-1,a
1871  0205 3ffe          	clr	_main$L-2
1874  0207 b6bb          	ld	a,_main$L-69
1875  0209 beba          	ld	x,_main$L-70
1876  020b ab60          	add	a,#96
1877  020d 2401          	jrnc	L22
1878  020f 5c            	inc	x
1879  0210               L22:
1880  0210 b7fd          	ld	_main$L-3,a
1881  0212 bffc          	ld	_main$L-4,x
1884  0214 a610          	ld	a,#16
1885  0216 b704          	ld	_memcpy$L+4,a
1886  0218 ae4d          	ld	x,#high(L7101)
1887  021a bf02          	ld	_memcpy$L+2,x
1888  021c a64d          	ld	a,#low(L7101)
1889  021e b703          	ld	_memcpy$L+3,a
1890  0220 a6bc          	ld	a,#_main$L-68
1891  0222 5f            	clr	x
1892  0223 cd0000        	call	_memcpy
1896  0226 aebc          	ld	x,#high(_main$L-68)
1897  0228 bf03          	ld	_writeEepromString$L+3,x
1898  022a a6bc          	ld	a,#low(_main$L-68)
1899  022c b704          	ld	_writeEepromString$L+4,a
1900  022e befc          	ld	x,_main$L-4
1901  0230 bf01          	ld	_writeEepromString$L+1,x
1902  0232 b6fd          	ld	a,_main$L-3
1903  0234 b702          	ld	_writeEepromString$L+2,a
1904  0236 a603          	ld	a,#3
1905  0238 cd0000        	call	_writeEepromString
1907                     ; 155 	woMsgIdx = MSG_IDX_RESET; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_RESET, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
1909  023b a607          	ld	a,#7
1910  023d b7ff          	ld	_main$L-1,a
1911  023f 3ffe          	clr	_main$L-2
1914  0241 b6bb          	ld	a,_main$L-69
1915  0243 beba          	ld	x,_main$L-70
1916  0245 ab70          	add	a,#112
1917  0247 2401          	jrnc	L42
1918  0249 5c            	inc	x
1919  024a               L42:
1920  024a b7fd          	ld	_main$L-3,a
1921  024c bffc          	ld	_main$L-4,x
1924  024e a610          	ld	a,#16
1925  0250 b704          	ld	_memcpy$L+4,a
1926  0252 ae3e          	ld	x,#high(L1201)
1927  0254 bf02          	ld	_memcpy$L+2,x
1928  0256 a63e          	ld	a,#low(L1201)
1929  0258 b703          	ld	_memcpy$L+3,a
1930  025a a6bc          	ld	a,#_main$L-68
1931  025c 5f            	clr	x
1932  025d cd0000        	call	_memcpy
1936  0260 aebc          	ld	x,#high(_main$L-68)
1937  0262 bf03          	ld	_writeEepromString$L+3,x
1938  0264 a6bc          	ld	a,#low(_main$L-68)
1939  0266 b704          	ld	_writeEepromString$L+4,a
1940  0268 befc          	ld	x,_main$L-4
1941  026a bf01          	ld	_writeEepromString$L+1,x
1942  026c b6fd          	ld	a,_main$L-3
1943  026e b702          	ld	_writeEepromString$L+2,a
1944  0270 a603          	ld	a,#3
1945  0272 cd0000        	call	_writeEepromString
1947                     ; 156 	woMsgIdx = MSG_IDX_TIMERS; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_TIMERS, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
1949  0275 a608          	ld	a,#8
1950  0277 b7ff          	ld	_main$L-1,a
1951  0279 3ffe          	clr	_main$L-2
1954  027b b6bb          	ld	a,_main$L-69
1955  027d beba          	ld	x,_main$L-70
1956  027f ab80          	add	a,#128
1957  0281 2401          	jrnc	L62
1958  0283 5c            	inc	x
1959  0284               L62:
1960  0284 b7fd          	ld	_main$L-3,a
1961  0286 bffc          	ld	_main$L-4,x
1964  0288 a610          	ld	a,#16
1965  028a b704          	ld	_memcpy$L+4,a
1966  028c ae37          	ld	x,#high(L3201)
1967  028e bf02          	ld	_memcpy$L+2,x
1968  0290 a637          	ld	a,#low(L3201)
1969  0292 b703          	ld	_memcpy$L+3,a
1970  0294 a6bc          	ld	a,#_main$L-68
1971  0296 5f            	clr	x
1972  0297 cd0000        	call	_memcpy
1976  029a aebc          	ld	x,#high(_main$L-68)
1977  029c bf03          	ld	_writeEepromString$L+3,x
1978  029e a6bc          	ld	a,#low(_main$L-68)
1979  02a0 b704          	ld	_writeEepromString$L+4,a
1980  02a2 befc          	ld	x,_main$L-4
1981  02a4 bf01          	ld	_writeEepromString$L+1,x
1982  02a6 b6fd          	ld	a,_main$L-3
1983  02a8 b702          	ld	_writeEepromString$L+2,a
1984  02aa a603          	ld	a,#3
1985  02ac cd0000        	call	_writeEepromString
1987                     ; 157 	woMsgIdx = MSG_IDX_LANGUAGES; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_LANGUAGES, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
1989  02af a609          	ld	a,#9
1990  02b1 b7ff          	ld	_main$L-1,a
1991  02b3 3ffe          	clr	_main$L-2
1994  02b5 b6bb          	ld	a,_main$L-69
1995  02b7 beba          	ld	x,_main$L-70
1996  02b9 ab90          	add	a,#144
1997  02bb 2401          	jrnc	L03
1998  02bd 5c            	inc	x
1999  02be               L03:
2000  02be b7fd          	ld	_main$L-3,a
2001  02c0 bffc          	ld	_main$L-4,x
2004  02c2 a610          	ld	a,#16
2005  02c4 b704          	ld	_memcpy$L+4,a
2006  02c6 ae2d          	ld	x,#high(L5201)
2007  02c8 bf02          	ld	_memcpy$L+2,x
2008  02ca a62d          	ld	a,#low(L5201)
2009  02cc b703          	ld	_memcpy$L+3,a
2010  02ce a6bc          	ld	a,#_main$L-68
2011  02d0 5f            	clr	x
2012  02d1 cd0000        	call	_memcpy
2016  02d4 aebc          	ld	x,#high(_main$L-68)
2017  02d6 bf03          	ld	_writeEepromString$L+3,x
2018  02d8 a6bc          	ld	a,#low(_main$L-68)
2019  02da b704          	ld	_writeEepromString$L+4,a
2020  02dc befc          	ld	x,_main$L-4
2021  02de bf01          	ld	_writeEepromString$L+1,x
2022  02e0 b6fd          	ld	a,_main$L-3
2023  02e2 b702          	ld	_writeEepromString$L+2,a
2024  02e4 a603          	ld	a,#3
2025  02e6 cd0000        	call	_writeEepromString
2027                     ; 158 	woMsgIdx = MSG_IDX_PH_MAX; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_PH_MAX, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
2029  02e9 a60a          	ld	a,#10
2030  02eb b7ff          	ld	_main$L-1,a
2031  02ed 3ffe          	clr	_main$L-2
2034  02ef b6bb          	ld	a,_main$L-69
2035  02f1 beba          	ld	x,_main$L-70
2036  02f3 aba0          	add	a,#160
2037  02f5 2401          	jrnc	L23
2038  02f7 5c            	inc	x
2039  02f8               L23:
2040  02f8 b7fd          	ld	_main$L-3,a
2041  02fa bffc          	ld	_main$L-4,x
2044  02fc a610          	ld	a,#16
2045  02fe b704          	ld	_memcpy$L+4,a
2046  0300 ae26          	ld	x,#high(L7201)
2047  0302 bf02          	ld	_memcpy$L+2,x
2048  0304 a626          	ld	a,#low(L7201)
2049  0306 b703          	ld	_memcpy$L+3,a
2050  0308 a6bc          	ld	a,#_main$L-68
2051  030a 5f            	clr	x
2052  030b cd0000        	call	_memcpy
2056  030e aebc          	ld	x,#high(_main$L-68)
2057  0310 bf03          	ld	_writeEepromString$L+3,x
2058  0312 a6bc          	ld	a,#low(_main$L-68)
2059  0314 b704          	ld	_writeEepromString$L+4,a
2060  0316 befc          	ld	x,_main$L-4
2061  0318 bf01          	ld	_writeEepromString$L+1,x
2062  031a b6fd          	ld	a,_main$L-3
2063  031c b702          	ld	_writeEepromString$L+2,a
2064  031e a603          	ld	a,#3
2065  0320 cd0000        	call	_writeEepromString
2067                     ; 159 	woMsgIdx = MSG_IDX_PH_MIN; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_PH_MIN, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
2069  0323 a60b          	ld	a,#11
2070  0325 b7ff          	ld	_main$L-1,a
2071  0327 3ffe          	clr	_main$L-2
2074  0329 b6bb          	ld	a,_main$L-69
2075  032b beba          	ld	x,_main$L-70
2076  032d abb0          	add	a,#176
2077  032f 2401          	jrnc	L43
2078  0331 5c            	inc	x
2079  0332               L43:
2080  0332 b7fd          	ld	_main$L-3,a
2081  0334 bffc          	ld	_main$L-4,x
2084  0336 a610          	ld	a,#16
2085  0338 b704          	ld	_memcpy$L+4,a
2086  033a ae1f          	ld	x,#high(L1301)
2087  033c bf02          	ld	_memcpy$L+2,x
2088  033e a61f          	ld	a,#low(L1301)
2089  0340 b703          	ld	_memcpy$L+3,a
2090  0342 a6bc          	ld	a,#_main$L-68
2091  0344 5f            	clr	x
2092  0345 cd0000        	call	_memcpy
2096  0348 aebc          	ld	x,#high(_main$L-68)
2097  034a bf03          	ld	_writeEepromString$L+3,x
2098  034c a6bc          	ld	a,#low(_main$L-68)
2099  034e b704          	ld	_writeEepromString$L+4,a
2100  0350 befc          	ld	x,_main$L-4
2101  0352 bf01          	ld	_writeEepromString$L+1,x
2102  0354 b6fd          	ld	a,_main$L-3
2103  0356 b702          	ld	_writeEepromString$L+2,a
2104  0358 a603          	ld	a,#3
2105  035a cd0000        	call	_writeEepromString
2107                     ; 160 	woMsgIdx = MSG_IDX_RESET_ASK; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_RESET_ASK, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
2109  035d a60c          	ld	a,#12
2110  035f b7ff          	ld	_main$L-1,a
2111  0361 3ffe          	clr	_main$L-2
2114  0363 b6bb          	ld	a,_main$L-69
2115  0365 beba          	ld	x,_main$L-70
2116  0367 abc0          	add	a,#192
2117  0369 2401          	jrnc	L63
2118  036b 5c            	inc	x
2119  036c               L63:
2120  036c b7fd          	ld	_main$L-3,a
2121  036e bffc          	ld	_main$L-4,x
2124  0370 a610          	ld	a,#16
2125  0372 b704          	ld	_memcpy$L+4,a
2126  0374 ae0f          	ld	x,#high(L3301)
2127  0376 bf02          	ld	_memcpy$L+2,x
2128  0378 a60f          	ld	a,#low(L3301)
2129  037a b703          	ld	_memcpy$L+3,a
2130  037c a6bc          	ld	a,#_main$L-68
2131  037e 5f            	clr	x
2132  037f cd0000        	call	_memcpy
2136  0382 aebc          	ld	x,#high(_main$L-68)
2137  0384 bf03          	ld	_writeEepromString$L+3,x
2138  0386 a6bc          	ld	a,#low(_main$L-68)
2139  0388 b704          	ld	_writeEepromString$L+4,a
2140  038a befc          	ld	x,_main$L-4
2141  038c bf01          	ld	_writeEepromString$L+1,x
2142  038e b6fd          	ld	a,_main$L-3
2143  0390 b702          	ld	_writeEepromString$L+2,a
2144  0392 a603          	ld	a,#3
2145  0394 cd0000        	call	_writeEepromString
2147                     ; 161 	woMsgIdx = MSG_IDX_BOUNDS; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_BOUNDS, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
2149  0397 a60d          	ld	a,#13
2150  0399 b7ff          	ld	_main$L-1,a
2151  039b 3ffe          	clr	_main$L-2
2154  039d b6bb          	ld	a,_main$L-69
2155  039f beba          	ld	x,_main$L-70
2156  03a1 abd0          	add	a,#208
2157  03a3 2401          	jrnc	L04
2158  03a5 5c            	inc	x
2159  03a6               L04:
2160  03a6 b7fd          	ld	_main$L-3,a
2161  03a8 bffc          	ld	_main$L-4,x
2164  03aa a610          	ld	a,#16
2165  03ac b704          	ld	_memcpy$L+4,a
2166  03ae ae06          	ld	x,#high(L5301)
2167  03b0 bf02          	ld	_memcpy$L+2,x
2168  03b2 a606          	ld	a,#low(L5301)
2169  03b4 b703          	ld	_memcpy$L+3,a
2170  03b6 a6bc          	ld	a,#_main$L-68
2171  03b8 5f            	clr	x
2172  03b9 cd0000        	call	_memcpy
2176  03bc aebc          	ld	x,#high(_main$L-68)
2177  03be bf03          	ld	_writeEepromString$L+3,x
2178  03c0 a6bc          	ld	a,#low(_main$L-68)
2179  03c2 b704          	ld	_writeEepromString$L+4,a
2180  03c4 befc          	ld	x,_main$L-4
2181  03c6 bf01          	ld	_writeEepromString$L+1,x
2182  03c8 b6fd          	ld	a,_main$L-3
2183  03ca b702          	ld	_writeEepromString$L+2,a
2184  03cc a603          	ld	a,#3
2185  03ce cd0000        	call	_writeEepromString
2187                     ; 162 	woMsgIdx = MSG_IDX_DEUTSCH; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_DEUTSCH, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
2189  03d1 a60e          	ld	a,#14
2190  03d3 b7ff          	ld	_main$L-1,a
2191  03d5 3ffe          	clr	_main$L-2
2194  03d7 b6bb          	ld	a,_main$L-69
2195  03d9 beba          	ld	x,_main$L-70
2196  03db abe0          	add	a,#224
2197  03dd 2401          	jrnc	L24
2198  03df 5c            	inc	x
2199  03e0               L24:
2200  03e0 b7fd          	ld	_main$L-3,a
2201  03e2 bffc          	ld	_main$L-4,x
2204  03e4 a610          	ld	a,#16
2205  03e6 b704          	ld	_memcpy$L+4,a
2206  03e8 aefe          	ld	x,#high(L7301)
2207  03ea bf02          	ld	_memcpy$L+2,x
2208  03ec a6fe          	ld	a,#low(L7301)
2209  03ee b703          	ld	_memcpy$L+3,a
2210  03f0 a6bc          	ld	a,#_main$L-68
2211  03f2 5f            	clr	x
2212  03f3 cd0000        	call	_memcpy
2216  03f6 aebc          	ld	x,#high(_main$L-68)
2217  03f8 bf03          	ld	_writeEepromString$L+3,x
2218  03fa a6bc          	ld	a,#low(_main$L-68)
2219  03fc b704          	ld	_writeEepromString$L+4,a
2220  03fe befc          	ld	x,_main$L-4
2221  0400 bf01          	ld	_writeEepromString$L+1,x
2222  0402 b6fd          	ld	a,_main$L-3
2223  0404 b702          	ld	_writeEepromString$L+2,a
2224  0406 a603          	ld	a,#3
2225  0408 cd0000        	call	_writeEepromString
2227                     ; 163 	woMsgIdx = MSG_IDX_ENGLISH; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_ENGLISH, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
2229  040b a60f          	ld	a,#15
2230  040d b7ff          	ld	_main$L-1,a
2231  040f 3ffe          	clr	_main$L-2
2234  0411 b6bb          	ld	a,_main$L-69
2235  0413 beba          	ld	x,_main$L-70
2236  0415 abf0          	add	a,#240
2237  0417 2401          	jrnc	L44
2238  0419 5c            	inc	x
2239  041a               L44:
2240  041a b7fd          	ld	_main$L-3,a
2241  041c bffc          	ld	_main$L-4,x
2244  041e a610          	ld	a,#16
2245  0420 b704          	ld	_memcpy$L+4,a
2246  0422 aef6          	ld	x,#high(L1401)
2247  0424 bf02          	ld	_memcpy$L+2,x
2248  0426 a6f6          	ld	a,#low(L1401)
2249  0428 b703          	ld	_memcpy$L+3,a
2250  042a a6bc          	ld	a,#_main$L-68
2251  042c 5f            	clr	x
2252  042d cd0000        	call	_memcpy
2256  0430 aebc          	ld	x,#high(_main$L-68)
2257  0432 bf03          	ld	_writeEepromString$L+3,x
2258  0434 a6bc          	ld	a,#low(_main$L-68)
2259  0436 b704          	ld	_writeEepromString$L+4,a
2260  0438 befc          	ld	x,_main$L-4
2261  043a bf01          	ld	_writeEepromString$L+1,x
2262  043c b6fd          	ld	a,_main$L-3
2263  043e b702          	ld	_writeEepromString$L+2,a
2264  0440 a603          	ld	a,#3
2265  0442 cd0000        	call	_writeEepromString
2267                     ; 164 	woMsgIdx = MSG_IDX_ESPANOL; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_ESPANOL, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
2269  0445 a610          	ld	a,#16
2270  0447 b7ff          	ld	_main$L-1,a
2271  0449 3ffe          	clr	_main$L-2
2274  044b b6bb          	ld	a,_main$L-69
2275  044d beba          	ld	x,_main$L-70
2276  044f ab00          	add	a,#0
2277  0451 88            	push	a
2278  0452 9f            	ld	a,x
2279  0453 a901          	adc	a,#1
2280  0455 97            	ld	x,a
2281  0456 84            	pop	a
2282  0457 b7fd          	ld	_main$L-3,a
2283  0459 bffc          	ld	_main$L-4,x
2286  045b a610          	ld	a,#16
2287  045d b704          	ld	_memcpy$L+4,a
2288  045f aeee          	ld	x,#high(L3401)
2289  0461 bf02          	ld	_memcpy$L+2,x
2290  0463 a6ee          	ld	a,#low(L3401)
2291  0465 b703          	ld	_memcpy$L+3,a
2292  0467 a6bc          	ld	a,#_main$L-68
2293  0469 5f            	clr	x
2294  046a cd0000        	call	_memcpy
2298  046d aebc          	ld	x,#high(_main$L-68)
2299  046f bf03          	ld	_writeEepromString$L+3,x
2300  0471 a6bc          	ld	a,#low(_main$L-68)
2301  0473 b704          	ld	_writeEepromString$L+4,a
2302  0475 befc          	ld	x,_main$L-4
2303  0477 bf01          	ld	_writeEepromString$L+1,x
2304  0479 b6fd          	ld	a,_main$L-3
2305  047b b702          	ld	_writeEepromString$L+2,a
2306  047d a603          	ld	a,#3
2307  047f cd0000        	call	_writeEepromString
2309                     ; 165 	woMsgIdx = MSG_IDX_FRANCAIS; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_FRANCAIS, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
2311  0482 a611          	ld	a,#17
2312  0484 b7ff          	ld	_main$L-1,a
2313  0486 3ffe          	clr	_main$L-2
2316  0488 b6bb          	ld	a,_main$L-69
2317  048a beba          	ld	x,_main$L-70
2318  048c ab10          	add	a,#16
2319  048e 88            	push	a
2320  048f 9f            	ld	a,x
2321  0490 a901          	adc	a,#1
2322  0492 97            	ld	x,a
2323  0493 84            	pop	a
2324  0494 b7fd          	ld	_main$L-3,a
2325  0496 bffc          	ld	_main$L-4,x
2328  0498 a610          	ld	a,#16
2329  049a b704          	ld	_memcpy$L+4,a
2330  049c aee5          	ld	x,#high(L5401)
2331  049e bf02          	ld	_memcpy$L+2,x
2332  04a0 a6e5          	ld	a,#low(L5401)
2333  04a2 b703          	ld	_memcpy$L+3,a
2334  04a4 a6bc          	ld	a,#_main$L-68
2335  04a6 5f            	clr	x
2336  04a7 cd0000        	call	_memcpy
2340  04aa aebc          	ld	x,#high(_main$L-68)
2341  04ac bf03          	ld	_writeEepromString$L+3,x
2342  04ae a6bc          	ld	a,#low(_main$L-68)
2343  04b0 b704          	ld	_writeEepromString$L+4,a
2344  04b2 befc          	ld	x,_main$L-4
2345  04b4 bf01          	ld	_writeEepromString$L+1,x
2346  04b6 b6fd          	ld	a,_main$L-3
2347  04b8 b702          	ld	_writeEepromString$L+2,a
2348  04ba a603          	ld	a,#3
2349  04bc cd0000        	call	_writeEepromString
2351                     ; 166 	woMsgIdx = MSG_IDX_GAIN; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_GAIN, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
2353  04bf a612          	ld	a,#18
2354  04c1 b7ff          	ld	_main$L-1,a
2355  04c3 3ffe          	clr	_main$L-2
2358  04c5 b6bb          	ld	a,_main$L-69
2359  04c7 beba          	ld	x,_main$L-70
2360  04c9 ab20          	add	a,#32
2361  04cb 88            	push	a
2362  04cc 9f            	ld	a,x
2363  04cd a901          	adc	a,#1
2364  04cf 97            	ld	x,a
2365  04d0 84            	pop	a
2366  04d1 b7fd          	ld	_main$L-3,a
2367  04d3 bffc          	ld	_main$L-4,x
2370  04d5 a610          	ld	a,#16
2371  04d7 b704          	ld	_memcpy$L+4,a
2372  04d9 aedd          	ld	x,#high(L7401)
2373  04db bf02          	ld	_memcpy$L+2,x
2374  04dd a6dd          	ld	a,#low(L7401)
2375  04df b703          	ld	_memcpy$L+3,a
2376  04e1 a6bc          	ld	a,#_main$L-68
2377  04e3 5f            	clr	x
2378  04e4 cd0000        	call	_memcpy
2382  04e7 aebc          	ld	x,#high(_main$L-68)
2383  04e9 bf03          	ld	_writeEepromString$L+3,x
2384  04eb a6bc          	ld	a,#low(_main$L-68)
2385  04ed b704          	ld	_writeEepromString$L+4,a
2386  04ef befc          	ld	x,_main$L-4
2387  04f1 bf01          	ld	_writeEepromString$L+1,x
2388  04f3 b6fd          	ld	a,_main$L-3
2389  04f5 b702          	ld	_writeEepromString$L+2,a
2390  04f7 a603          	ld	a,#3
2391  04f9 cd0000        	call	_writeEepromString
2393                     ; 167 	woMsgIdx = MSG_IDX_ITALIANO; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_ITALIANO, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
2395  04fc a613          	ld	a,#19
2396  04fe b7ff          	ld	_main$L-1,a
2397  0500 3ffe          	clr	_main$L-2
2400  0502 b6bb          	ld	a,_main$L-69
2401  0504 beba          	ld	x,_main$L-70
2402  0506 ab30          	add	a,#48
2403  0508 88            	push	a
2404  0509 9f            	ld	a,x
2405  050a a901          	adc	a,#1
2406  050c 97            	ld	x,a
2407  050d 84            	pop	a
2408  050e b7fd          	ld	_main$L-3,a
2409  0510 bffc          	ld	_main$L-4,x
2412  0512 a610          	ld	a,#16
2413  0514 b704          	ld	_memcpy$L+4,a
2414  0516 aed4          	ld	x,#high(L1501)
2415  0518 bf02          	ld	_memcpy$L+2,x
2416  051a a6d4          	ld	a,#low(L1501)
2417  051c b703          	ld	_memcpy$L+3,a
2418  051e a6bc          	ld	a,#_main$L-68
2419  0520 5f            	clr	x
2420  0521 cd0000        	call	_memcpy
2424  0524 aebc          	ld	x,#high(_main$L-68)
2425  0526 bf03          	ld	_writeEepromString$L+3,x
2426  0528 a6bc          	ld	a,#low(_main$L-68)
2427  052a b704          	ld	_writeEepromString$L+4,a
2428  052c befc          	ld	x,_main$L-4
2429  052e bf01          	ld	_writeEepromString$L+1,x
2430  0530 b6fd          	ld	a,_main$L-3
2431  0532 b702          	ld	_writeEepromString$L+2,a
2432  0534 a603          	ld	a,#3
2433  0536 cd0000        	call	_writeEepromString
2435                     ; 168 	woMsgIdx = MSG_IDX_WASHING; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_WASHING, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
2437  0539 a614          	ld	a,#20
2438  053b b7ff          	ld	_main$L-1,a
2439  053d 3ffe          	clr	_main$L-2
2442  053f b6bb          	ld	a,_main$L-69
2443  0541 beba          	ld	x,_main$L-70
2444  0543 ab40          	add	a,#64
2445  0545 88            	push	a
2446  0546 9f            	ld	a,x
2447  0547 a901          	adc	a,#1
2448  0549 97            	ld	x,a
2449  054a 84            	pop	a
2450  054b b7fd          	ld	_main$L-3,a
2451  054d bffc          	ld	_main$L-4,x
2454  054f a610          	ld	a,#16
2455  0551 b704          	ld	_memcpy$L+4,a
2456  0553 aec9          	ld	x,#high(L3501)
2457  0555 bf02          	ld	_memcpy$L+2,x
2458  0557 a6c9          	ld	a,#low(L3501)
2459  0559 b703          	ld	_memcpy$L+3,a
2460  055b a6bc          	ld	a,#_main$L-68
2461  055d 5f            	clr	x
2462  055e cd0000        	call	_memcpy
2466  0561 aebc          	ld	x,#high(_main$L-68)
2467  0563 bf03          	ld	_writeEepromString$L+3,x
2468  0565 a6bc          	ld	a,#low(_main$L-68)
2469  0567 b704          	ld	_writeEepromString$L+4,a
2470  0569 befc          	ld	x,_main$L-4
2471  056b bf01          	ld	_writeEepromString$L+1,x
2472  056d b6fd          	ld	a,_main$L-3
2473  056f b702          	ld	_writeEepromString$L+2,a
2474  0571 a603          	ld	a,#3
2475  0573 cd0000        	call	_writeEepromString
2477                     ; 169 	woMsgIdx = MSG_IDX_LANGUAGE_7; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_LANGUAGE_7, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
2479  0576 a615          	ld	a,#21
2480  0578 b7ff          	ld	_main$L-1,a
2481  057a 3ffe          	clr	_main$L-2
2484  057c b6bb          	ld	a,_main$L-69
2485  057e beba          	ld	x,_main$L-70
2486  0580 ab50          	add	a,#80
2487  0582 88            	push	a
2488  0583 9f            	ld	a,x
2489  0584 a901          	adc	a,#1
2490  0586 97            	ld	x,a
2491  0587 84            	pop	a
2492  0588 b7fd          	ld	_main$L-3,a
2493  058a bffc          	ld	_main$L-4,x
2496  058c a610          	ld	a,#16
2497  058e b704          	ld	_memcpy$L+4,a
2498  0590 aebe          	ld	x,#high(L5501)
2499  0592 bf02          	ld	_memcpy$L+2,x
2500  0594 a6be          	ld	a,#low(L5501)
2501  0596 b703          	ld	_memcpy$L+3,a
2502  0598 a6bc          	ld	a,#_main$L-68
2503  059a 5f            	clr	x
2504  059b cd0000        	call	_memcpy
2508  059e aebc          	ld	x,#high(_main$L-68)
2509  05a0 bf03          	ld	_writeEepromString$L+3,x
2510  05a2 a6bc          	ld	a,#low(_main$L-68)
2511  05a4 b704          	ld	_writeEepromString$L+4,a
2512  05a6 befc          	ld	x,_main$L-4
2513  05a8 bf01          	ld	_writeEepromString$L+1,x
2514  05aa b6fd          	ld	a,_main$L-3
2515  05ac b702          	ld	_writeEepromString$L+2,a
2516  05ae a603          	ld	a,#3
2517  05b0 cd0000        	call	_writeEepromString
2519                     ; 170 	woMsgIdx = MSG_IDX_LANGUAGE_8; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_LANGUAGE_8, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
2521  05b3 a616          	ld	a,#22
2522  05b5 b7ff          	ld	_main$L-1,a
2523  05b7 3ffe          	clr	_main$L-2
2526  05b9 b6bb          	ld	a,_main$L-69
2527  05bb beba          	ld	x,_main$L-70
2528  05bd ab60          	add	a,#96
2529  05bf 88            	push	a
2530  05c0 9f            	ld	a,x
2531  05c1 a901          	adc	a,#1
2532  05c3 97            	ld	x,a
2533  05c4 84            	pop	a
2534  05c5 b7fd          	ld	_main$L-3,a
2535  05c7 bffc          	ld	_main$L-4,x
2538  05c9 a610          	ld	a,#16
2539  05cb b704          	ld	_memcpy$L+4,a
2540  05cd aeb4          	ld	x,#high(L7501)
2541  05cf bf02          	ld	_memcpy$L+2,x
2542  05d1 a6b4          	ld	a,#low(L7501)
2543  05d3 b703          	ld	_memcpy$L+3,a
2544  05d5 a6bc          	ld	a,#_main$L-68
2545  05d7 5f            	clr	x
2546  05d8 cd0000        	call	_memcpy
2550  05db aebc          	ld	x,#high(_main$L-68)
2551  05dd bf03          	ld	_writeEepromString$L+3,x
2552  05df a6bc          	ld	a,#low(_main$L-68)
2553  05e1 b704          	ld	_writeEepromString$L+4,a
2554  05e3 befc          	ld	x,_main$L-4
2555  05e5 bf01          	ld	_writeEepromString$L+1,x
2556  05e7 b6fd          	ld	a,_main$L-3
2557  05e9 b702          	ld	_writeEepromString$L+2,a
2558  05eb a603          	ld	a,#3
2559  05ed cd0000        	call	_writeEepromString
2561                     ; 171 	woMsgIdx = MSG_IDX_SOLVENT; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_SOLVENT, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
2563  05f0 a617          	ld	a,#23
2564  05f2 b7ff          	ld	_main$L-1,a
2565  05f4 3ffe          	clr	_main$L-2
2568  05f6 b6bb          	ld	a,_main$L-69
2569  05f8 beba          	ld	x,_main$L-70
2570  05fa ab70          	add	a,#112
2571  05fc 88            	push	a
2572  05fd 9f            	ld	a,x
2573  05fe a901          	adc	a,#1
2574  0600 97            	ld	x,a
2575  0601 84            	pop	a
2576  0602 b7fd          	ld	_main$L-3,a
2577  0604 bffc          	ld	_main$L-4,x
2580  0606 a610          	ld	a,#16
2581  0608 b704          	ld	_memcpy$L+4,a
2582  060a aea5          	ld	x,#high(L1601)
2583  060c bf02          	ld	_memcpy$L+2,x
2584  060e a6a5          	ld	a,#low(L1601)
2585  0610 b703          	ld	_memcpy$L+3,a
2586  0612 a6bc          	ld	a,#_main$L-68
2587  0614 5f            	clr	x
2588  0615 cd0000        	call	_memcpy
2592  0618 aebc          	ld	x,#high(_main$L-68)
2593  061a bf03          	ld	_writeEepromString$L+3,x
2594  061c a6bc          	ld	a,#low(_main$L-68)
2595  061e b704          	ld	_writeEepromString$L+4,a
2596  0620 befc          	ld	x,_main$L-4
2597  0622 bf01          	ld	_writeEepromString$L+1,x
2598  0624 b6fd          	ld	a,_main$L-3
2599  0626 b702          	ld	_writeEepromString$L+2,a
2600  0628 a603          	ld	a,#3
2601  062a cd0000        	call	_writeEepromString
2603                     ; 172 	woMsgIdx = MSG_IDX_CALIBRATION; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_CALIBRATION, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
2605  062d a618          	ld	a,#24
2606  062f b7ff          	ld	_main$L-1,a
2607  0631 3ffe          	clr	_main$L-2
2610  0633 b6bb          	ld	a,_main$L-69
2611  0635 beba          	ld	x,_main$L-70
2612  0637 ab80          	add	a,#128
2613  0639 88            	push	a
2614  063a 9f            	ld	a,x
2615  063b a901          	adc	a,#1
2616  063d 97            	ld	x,a
2617  063e 84            	pop	a
2618  063f b7fd          	ld	_main$L-3,a
2619  0641 bffc          	ld	_main$L-4,x
2622  0643 a610          	ld	a,#16
2623  0645 b704          	ld	_memcpy$L+4,a
2624  0647 ae97          	ld	x,#high(L3601)
2625  0649 bf02          	ld	_memcpy$L+2,x
2626  064b a697          	ld	a,#low(L3601)
2627  064d b703          	ld	_memcpy$L+3,a
2628  064f a6bc          	ld	a,#_main$L-68
2629  0651 5f            	clr	x
2630  0652 cd0000        	call	_memcpy
2634  0655 aebc          	ld	x,#high(_main$L-68)
2635  0657 bf03          	ld	_writeEepromString$L+3,x
2636  0659 a6bc          	ld	a,#low(_main$L-68)
2637  065b b704          	ld	_writeEepromString$L+4,a
2638  065d befc          	ld	x,_main$L-4
2639  065f bf01          	ld	_writeEepromString$L+1,x
2640  0661 b6fd          	ld	a,_main$L-3
2641  0663 b702          	ld	_writeEepromString$L+2,a
2642  0665 a603          	ld	a,#3
2643  0667 cd0000        	call	_writeEepromString
2645                     ; 173 	woMsgIdx = MSG_IDX_ERROR_00; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_ERROR_00, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
2647  066a a619          	ld	a,#25
2648  066c b7ff          	ld	_main$L-1,a
2649  066e 3ffe          	clr	_main$L-2
2652  0670 b6bb          	ld	a,_main$L-69
2653  0672 beba          	ld	x,_main$L-70
2654  0674 ab90          	add	a,#144
2655  0676 88            	push	a
2656  0677 9f            	ld	a,x
2657  0678 a901          	adc	a,#1
2658  067a 97            	ld	x,a
2659  067b 84            	pop	a
2660  067c b7fd          	ld	_main$L-3,a
2661  067e bffc          	ld	_main$L-4,x
2664  0680 a610          	ld	a,#16
2665  0682 b704          	ld	_memcpy$L+4,a
2666  0684 ae8c          	ld	x,#high(L5601)
2667  0686 bf02          	ld	_memcpy$L+2,x
2668  0688 a68c          	ld	a,#low(L5601)
2669  068a b703          	ld	_memcpy$L+3,a
2670  068c a6bc          	ld	a,#_main$L-68
2671  068e 5f            	clr	x
2672  068f cd0000        	call	_memcpy
2676  0692 aebc          	ld	x,#high(_main$L-68)
2677  0694 bf03          	ld	_writeEepromString$L+3,x
2678  0696 a6bc          	ld	a,#low(_main$L-68)
2679  0698 b704          	ld	_writeEepromString$L+4,a
2680  069a befc          	ld	x,_main$L-4
2681  069c bf01          	ld	_writeEepromString$L+1,x
2682  069e b6fd          	ld	a,_main$L-3
2683  06a0 b702          	ld	_writeEepromString$L+2,a
2684  06a2 a603          	ld	a,#3
2685  06a4 cd0000        	call	_writeEepromString
2687                     ; 174 	woMsgIdx = MSG_IDX_ERROR_01; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_ERROR_01, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
2689  06a7 a61a          	ld	a,#26
2690  06a9 b7ff          	ld	_main$L-1,a
2691  06ab 3ffe          	clr	_main$L-2
2694  06ad b6bb          	ld	a,_main$L-69
2695  06af beba          	ld	x,_main$L-70
2696  06b1 aba0          	add	a,#160
2697  06b3 88            	push	a
2698  06b4 9f            	ld	a,x
2699  06b5 a901          	adc	a,#1
2700  06b7 97            	ld	x,a
2701  06b8 84            	pop	a
2702  06b9 b7fd          	ld	_main$L-3,a
2703  06bb bffc          	ld	_main$L-4,x
2706  06bd a610          	ld	a,#16
2707  06bf b704          	ld	_memcpy$L+4,a
2708  06c1 ae81          	ld	x,#high(L7601)
2709  06c3 bf02          	ld	_memcpy$L+2,x
2710  06c5 a681          	ld	a,#low(L7601)
2711  06c7 b703          	ld	_memcpy$L+3,a
2712  06c9 a6bc          	ld	a,#_main$L-68
2713  06cb 5f            	clr	x
2714  06cc cd0000        	call	_memcpy
2718  06cf aebc          	ld	x,#high(_main$L-68)
2719  06d1 bf03          	ld	_writeEepromString$L+3,x
2720  06d3 a6bc          	ld	a,#low(_main$L-68)
2721  06d5 b704          	ld	_writeEepromString$L+4,a
2722  06d7 befc          	ld	x,_main$L-4
2723  06d9 bf01          	ld	_writeEepromString$L+1,x
2724  06db b6fd          	ld	a,_main$L-3
2725  06dd b702          	ld	_writeEepromString$L+2,a
2726  06df a603          	ld	a,#3
2727  06e1 cd0000        	call	_writeEepromString
2729                     ; 175 	woMsgIdx = MSG_IDX_ERROR_02; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_ERROR_02, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
2731  06e4 a61b          	ld	a,#27
2732  06e6 b7ff          	ld	_main$L-1,a
2733  06e8 3ffe          	clr	_main$L-2
2736  06ea b6bb          	ld	a,_main$L-69
2737  06ec beba          	ld	x,_main$L-70
2738  06ee abb0          	add	a,#176
2739  06f0 88            	push	a
2740  06f1 9f            	ld	a,x
2741  06f2 a901          	adc	a,#1
2742  06f4 97            	ld	x,a
2743  06f5 84            	pop	a
2744  06f6 b7fd          	ld	_main$L-3,a
2745  06f8 bffc          	ld	_main$L-4,x
2748  06fa a610          	ld	a,#16
2749  06fc b704          	ld	_memcpy$L+4,a
2750  06fe ae76          	ld	x,#high(L1701)
2751  0700 bf02          	ld	_memcpy$L+2,x
2752  0702 a676          	ld	a,#low(L1701)
2753  0704 b703          	ld	_memcpy$L+3,a
2754  0706 a6bc          	ld	a,#_main$L-68
2755  0708 5f            	clr	x
2756  0709 cd0000        	call	_memcpy
2760  070c aebc          	ld	x,#high(_main$L-68)
2761  070e bf03          	ld	_writeEepromString$L+3,x
2762  0710 a6bc          	ld	a,#low(_main$L-68)
2763  0712 b704          	ld	_writeEepromString$L+4,a
2764  0714 befc          	ld	x,_main$L-4
2765  0716 bf01          	ld	_writeEepromString$L+1,x
2766  0718 b6fd          	ld	a,_main$L-3
2767  071a b702          	ld	_writeEepromString$L+2,a
2768  071c a603          	ld	a,#3
2769  071e cd0000        	call	_writeEepromString
2771                     ; 176 	woMsgIdx = MSG_IDX_ERROR_03; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_ERROR_03, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
2773  0721 a61c          	ld	a,#28
2774  0723 b7ff          	ld	_main$L-1,a
2775  0725 3ffe          	clr	_main$L-2
2778  0727 b6bb          	ld	a,_main$L-69
2779  0729 beba          	ld	x,_main$L-70
2780  072b abc0          	add	a,#192
2781  072d 88            	push	a
2782  072e 9f            	ld	a,x
2783  072f a901          	adc	a,#1
2784  0731 97            	ld	x,a
2785  0732 84            	pop	a
2786  0733 b7fd          	ld	_main$L-3,a
2787  0735 bffc          	ld	_main$L-4,x
2790  0737 a610          	ld	a,#16
2791  0739 b704          	ld	_memcpy$L+4,a
2792  073b ae6b          	ld	x,#high(L3701)
2793  073d bf02          	ld	_memcpy$L+2,x
2794  073f a66b          	ld	a,#low(L3701)
2795  0741 b703          	ld	_memcpy$L+3,a
2796  0743 a6bc          	ld	a,#_main$L-68
2797  0745 5f            	clr	x
2798  0746 cd0000        	call	_memcpy
2802  0749 aebc          	ld	x,#high(_main$L-68)
2803  074b bf03          	ld	_writeEepromString$L+3,x
2804  074d a6bc          	ld	a,#low(_main$L-68)
2805  074f b704          	ld	_writeEepromString$L+4,a
2806  0751 befc          	ld	x,_main$L-4
2807  0753 bf01          	ld	_writeEepromString$L+1,x
2808  0755 b6fd          	ld	a,_main$L-3
2809  0757 b702          	ld	_writeEepromString$L+2,a
2810  0759 a603          	ld	a,#3
2811  075b cd0000        	call	_writeEepromString
2813                     ; 177 	woMsgIdx = MSG_IDX_ERROR_04; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_ERROR_04, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
2815  075e a61d          	ld	a,#29
2816  0760 b7ff          	ld	_main$L-1,a
2817  0762 3ffe          	clr	_main$L-2
2820  0764 b6bb          	ld	a,_main$L-69
2821  0766 beba          	ld	x,_main$L-70
2822  0768 abd0          	add	a,#208
2823  076a 88            	push	a
2824  076b 9f            	ld	a,x
2825  076c a901          	adc	a,#1
2826  076e 97            	ld	x,a
2827  076f 84            	pop	a
2828  0770 b7fd          	ld	_main$L-3,a
2829  0772 bffc          	ld	_main$L-4,x
2832  0774 a610          	ld	a,#16
2833  0776 b704          	ld	_memcpy$L+4,a
2834  0778 ae60          	ld	x,#high(L5701)
2835  077a bf02          	ld	_memcpy$L+2,x
2836  077c a660          	ld	a,#low(L5701)
2837  077e b703          	ld	_memcpy$L+3,a
2838  0780 a6bc          	ld	a,#_main$L-68
2839  0782 5f            	clr	x
2840  0783 cd0000        	call	_memcpy
2844  0786 aebc          	ld	x,#high(_main$L-68)
2845  0788 bf03          	ld	_writeEepromString$L+3,x
2846  078a a6bc          	ld	a,#low(_main$L-68)
2847  078c b704          	ld	_writeEepromString$L+4,a
2848  078e befc          	ld	x,_main$L-4
2849  0790 bf01          	ld	_writeEepromString$L+1,x
2850  0792 b6fd          	ld	a,_main$L-3
2851  0794 b702          	ld	_writeEepromString$L+2,a
2852  0796 a603          	ld	a,#3
2853  0798 cd0000        	call	_writeEepromString
2855                     ; 178 	woMsgIdx = MSG_IDX_ERROR_05; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_ERROR_05, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
2857  079b a61e          	ld	a,#30
2858  079d b7ff          	ld	_main$L-1,a
2859  079f 3ffe          	clr	_main$L-2
2862  07a1 b6bb          	ld	a,_main$L-69
2863  07a3 beba          	ld	x,_main$L-70
2864  07a5 abe0          	add	a,#224
2865  07a7 88            	push	a
2866  07a8 9f            	ld	a,x
2867  07a9 a901          	adc	a,#1
2868  07ab 97            	ld	x,a
2869  07ac 84            	pop	a
2870  07ad b7fd          	ld	_main$L-3,a
2871  07af bffc          	ld	_main$L-4,x
2874  07b1 a610          	ld	a,#16
2875  07b3 b704          	ld	_memcpy$L+4,a
2876  07b5 ae55          	ld	x,#high(L7701)
2877  07b7 bf02          	ld	_memcpy$L+2,x
2878  07b9 a655          	ld	a,#low(L7701)
2879  07bb b703          	ld	_memcpy$L+3,a
2880  07bd a6bc          	ld	a,#_main$L-68
2881  07bf 5f            	clr	x
2882  07c0 cd0000        	call	_memcpy
2886  07c3 aebc          	ld	x,#high(_main$L-68)
2887  07c5 bf03          	ld	_writeEepromString$L+3,x
2888  07c7 a6bc          	ld	a,#low(_main$L-68)
2889  07c9 b704          	ld	_writeEepromString$L+4,a
2890  07cb befc          	ld	x,_main$L-4
2891  07cd bf01          	ld	_writeEepromString$L+1,x
2892  07cf b6fd          	ld	a,_main$L-3
2893  07d1 b702          	ld	_writeEepromString$L+2,a
2894  07d3 a603          	ld	a,#3
2895  07d5 cd0000        	call	_writeEepromString
2897                     ; 179 	woMsgIdx = MSG_IDX_ERROR_06; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_ERROR_06, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
2899  07d8 a61f          	ld	a,#31
2900  07da b7ff          	ld	_main$L-1,a
2901  07dc 3ffe          	clr	_main$L-2
2904  07de b6bb          	ld	a,_main$L-69
2905  07e0 beba          	ld	x,_main$L-70
2906  07e2 abf0          	add	a,#240
2907  07e4 88            	push	a
2908  07e5 9f            	ld	a,x
2909  07e6 a901          	adc	a,#1
2910  07e8 97            	ld	x,a
2911  07e9 84            	pop	a
2912  07ea b7fd          	ld	_main$L-3,a
2913  07ec bffc          	ld	_main$L-4,x
2916  07ee a610          	ld	a,#16
2917  07f0 b704          	ld	_memcpy$L+4,a
2918  07f2 ae4a          	ld	x,#high(L1011)
2919  07f4 bf02          	ld	_memcpy$L+2,x
2920  07f6 a64a          	ld	a,#low(L1011)
2921  07f8 b703          	ld	_memcpy$L+3,a
2922  07fa a6bc          	ld	a,#_main$L-68
2923  07fc 5f            	clr	x
2924  07fd cd0000        	call	_memcpy
2928  0800 aebc          	ld	x,#high(_main$L-68)
2929  0802 bf03          	ld	_writeEepromString$L+3,x
2930  0804 a6bc          	ld	a,#low(_main$L-68)
2931  0806 b704          	ld	_writeEepromString$L+4,a
2932  0808 befc          	ld	x,_main$L-4
2933  080a bf01          	ld	_writeEepromString$L+1,x
2934  080c b6fd          	ld	a,_main$L-3
2935  080e b702          	ld	_writeEepromString$L+2,a
2936  0810 a603          	ld	a,#3
2937  0812 cd0000        	call	_writeEepromString
2939                     ; 180 	woMsgIdx = MSG_IDX_ERROR_07; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_ERROR_07, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
2941  0815 a620          	ld	a,#32
2942  0817 b7ff          	ld	_main$L-1,a
2943  0819 3ffe          	clr	_main$L-2
2946  081b b6bb          	ld	a,_main$L-69
2947  081d beba          	ld	x,_main$L-70
2948  081f ab00          	add	a,#0
2949  0821 88            	push	a
2950  0822 9f            	ld	a,x
2951  0823 a902          	adc	a,#2
2952  0825 97            	ld	x,a
2953  0826 84            	pop	a
2954  0827 b7fd          	ld	_main$L-3,a
2955  0829 bffc          	ld	_main$L-4,x
2958  082b a610          	ld	a,#16
2959  082d b704          	ld	_memcpy$L+4,a
2960  082f ae3f          	ld	x,#high(L3011)
2961  0831 bf02          	ld	_memcpy$L+2,x
2962  0833 a63f          	ld	a,#low(L3011)
2963  0835 b703          	ld	_memcpy$L+3,a
2964  0837 a6bc          	ld	a,#_main$L-68
2965  0839 5f            	clr	x
2966  083a cd0000        	call	_memcpy
2970  083d aebc          	ld	x,#high(_main$L-68)
2971  083f bf03          	ld	_writeEepromString$L+3,x
2972  0841 a6bc          	ld	a,#low(_main$L-68)
2973  0843 b704          	ld	_writeEepromString$L+4,a
2974  0845 befc          	ld	x,_main$L-4
2975  0847 bf01          	ld	_writeEepromString$L+1,x
2976  0849 b6fd          	ld	a,_main$L-3
2977  084b b702          	ld	_writeEepromString$L+2,a
2978  084d a603          	ld	a,#3
2979  084f cd0000        	call	_writeEepromString
2981                     ; 181 	woMsgIdx = MSG_IDX_ERROR_08; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_ERROR_08, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
2983  0852 a621          	ld	a,#33
2984  0854 b7ff          	ld	_main$L-1,a
2985  0856 3ffe          	clr	_main$L-2
2988  0858 b6bb          	ld	a,_main$L-69
2989  085a beba          	ld	x,_main$L-70
2990  085c ab10          	add	a,#16
2991  085e 88            	push	a
2992  085f 9f            	ld	a,x
2993  0860 a902          	adc	a,#2
2994  0862 97            	ld	x,a
2995  0863 84            	pop	a
2996  0864 b7fd          	ld	_main$L-3,a
2997  0866 bffc          	ld	_main$L-4,x
3000  0868 a610          	ld	a,#16
3001  086a b704          	ld	_memcpy$L+4,a
3002  086c ae34          	ld	x,#high(L5011)
3003  086e bf02          	ld	_memcpy$L+2,x
3004  0870 a634          	ld	a,#low(L5011)
3005  0872 b703          	ld	_memcpy$L+3,a
3006  0874 a6bc          	ld	a,#_main$L-68
3007  0876 5f            	clr	x
3008  0877 cd0000        	call	_memcpy
3012  087a aebc          	ld	x,#high(_main$L-68)
3013  087c bf03          	ld	_writeEepromString$L+3,x
3014  087e a6bc          	ld	a,#low(_main$L-68)
3015  0880 b704          	ld	_writeEepromString$L+4,a
3016  0882 befc          	ld	x,_main$L-4
3017  0884 bf01          	ld	_writeEepromString$L+1,x
3018  0886 b6fd          	ld	a,_main$L-3
3019  0888 b702          	ld	_writeEepromString$L+2,a
3020  088a a603          	ld	a,#3
3021  088c cd0000        	call	_writeEepromString
3023                     ; 182 	woMsgIdx = MSG_IDX_ERROR_09; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_ERROR_09, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
3025  088f a622          	ld	a,#34
3026  0891 b7ff          	ld	_main$L-1,a
3027  0893 3ffe          	clr	_main$L-2
3030  0895 b6bb          	ld	a,_main$L-69
3031  0897 beba          	ld	x,_main$L-70
3032  0899 ab20          	add	a,#32
3033  089b 88            	push	a
3034  089c 9f            	ld	a,x
3035  089d a902          	adc	a,#2
3036  089f 97            	ld	x,a
3037  08a0 84            	pop	a
3038  08a1 b7fd          	ld	_main$L-3,a
3039  08a3 bffc          	ld	_main$L-4,x
3042  08a5 a610          	ld	a,#16
3043  08a7 b704          	ld	_memcpy$L+4,a
3044  08a9 ae29          	ld	x,#high(L7011)
3045  08ab bf02          	ld	_memcpy$L+2,x
3046  08ad a629          	ld	a,#low(L7011)
3047  08af b703          	ld	_memcpy$L+3,a
3048  08b1 a6bc          	ld	a,#_main$L-68
3049  08b3 5f            	clr	x
3050  08b4 cd0000        	call	_memcpy
3054  08b7 aebc          	ld	x,#high(_main$L-68)
3055  08b9 bf03          	ld	_writeEepromString$L+3,x
3056  08bb a6bc          	ld	a,#low(_main$L-68)
3057  08bd b704          	ld	_writeEepromString$L+4,a
3058  08bf befc          	ld	x,_main$L-4
3059  08c1 bf01          	ld	_writeEepromString$L+1,x
3060  08c3 b6fd          	ld	a,_main$L-3
3061  08c5 b702          	ld	_writeEepromString$L+2,a
3062  08c7 a603          	ld	a,#3
3063  08c9 cd0000        	call	_writeEepromString
3065                     ; 183 	woMsgIdx = MSG_IDX_ERROR_10; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_ERROR_10, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
3067  08cc a623          	ld	a,#35
3068  08ce b7ff          	ld	_main$L-1,a
3069  08d0 3ffe          	clr	_main$L-2
3072  08d2 b6bb          	ld	a,_main$L-69
3073  08d4 beba          	ld	x,_main$L-70
3074  08d6 ab30          	add	a,#48
3075  08d8 88            	push	a
3076  08d9 9f            	ld	a,x
3077  08da a902          	adc	a,#2
3078  08dc 97            	ld	x,a
3079  08dd 84            	pop	a
3080  08de b7fd          	ld	_main$L-3,a
3081  08e0 bffc          	ld	_main$L-4,x
3084  08e2 a610          	ld	a,#16
3085  08e4 b704          	ld	_memcpy$L+4,a
3086  08e6 ae1e          	ld	x,#high(L1111)
3087  08e8 bf02          	ld	_memcpy$L+2,x
3088  08ea a61e          	ld	a,#low(L1111)
3089  08ec b703          	ld	_memcpy$L+3,a
3090  08ee a6bc          	ld	a,#_main$L-68
3091  08f0 5f            	clr	x
3092  08f1 cd0000        	call	_memcpy
3096  08f4 aebc          	ld	x,#high(_main$L-68)
3097  08f6 bf03          	ld	_writeEepromString$L+3,x
3098  08f8 a6bc          	ld	a,#low(_main$L-68)
3099  08fa b704          	ld	_writeEepromString$L+4,a
3100  08fc befc          	ld	x,_main$L-4
3101  08fe bf01          	ld	_writeEepromString$L+1,x
3102  0900 b6fd          	ld	a,_main$L-3
3103  0902 b702          	ld	_writeEepromString$L+2,a
3104  0904 a603          	ld	a,#3
3105  0906 cd0000        	call	_writeEepromString
3107                     ; 184 	woMsgIdx = MSG_IDX_ERROR_11; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_ERROR_11, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
3109  0909 a624          	ld	a,#36
3110  090b b7ff          	ld	_main$L-1,a
3111  090d 3ffe          	clr	_main$L-2
3114  090f b6bb          	ld	a,_main$L-69
3115  0911 beba          	ld	x,_main$L-70
3116  0913 ab40          	add	a,#64
3117  0915 88            	push	a
3118  0916 9f            	ld	a,x
3119  0917 a902          	adc	a,#2
3120  0919 97            	ld	x,a
3121  091a 84            	pop	a
3122  091b b7fd          	ld	_main$L-3,a
3123  091d bffc          	ld	_main$L-4,x
3126  091f a610          	ld	a,#16
3127  0921 b704          	ld	_memcpy$L+4,a
3128  0923 ae13          	ld	x,#high(L3111)
3129  0925 bf02          	ld	_memcpy$L+2,x
3130  0927 a613          	ld	a,#low(L3111)
3131  0929 b703          	ld	_memcpy$L+3,a
3132  092b a6bc          	ld	a,#_main$L-68
3133  092d 5f            	clr	x
3134  092e cd0000        	call	_memcpy
3138  0931 aebc          	ld	x,#high(_main$L-68)
3139  0933 bf03          	ld	_writeEepromString$L+3,x
3140  0935 a6bc          	ld	a,#low(_main$L-68)
3141  0937 b704          	ld	_writeEepromString$L+4,a
3142  0939 befc          	ld	x,_main$L-4
3143  093b bf01          	ld	_writeEepromString$L+1,x
3144  093d b6fd          	ld	a,_main$L-3
3145  093f b702          	ld	_writeEepromString$L+2,a
3146  0941 a603          	ld	a,#3
3147  0943 cd0000        	call	_writeEepromString
3149                     ; 185 	woMsgIdx = MSG_IDX_ERROR_12; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_ERROR_12, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
3151  0946 a625          	ld	a,#37
3152  0948 b7ff          	ld	_main$L-1,a
3153  094a 3ffe          	clr	_main$L-2
3156  094c b6bb          	ld	a,_main$L-69
3157  094e beba          	ld	x,_main$L-70
3158  0950 ab50          	add	a,#80
3159  0952 88            	push	a
3160  0953 9f            	ld	a,x
3161  0954 a902          	adc	a,#2
3162  0956 97            	ld	x,a
3163  0957 84            	pop	a
3164  0958 b7fd          	ld	_main$L-3,a
3165  095a bffc          	ld	_main$L-4,x
3168  095c a610          	ld	a,#16
3169  095e b704          	ld	_memcpy$L+4,a
3170  0960 ae08          	ld	x,#high(L5111)
3171  0962 bf02          	ld	_memcpy$L+2,x
3172  0964 a608          	ld	a,#low(L5111)
3173  0966 b703          	ld	_memcpy$L+3,a
3174  0968 a6bc          	ld	a,#_main$L-68
3175  096a 5f            	clr	x
3176  096b cd0000        	call	_memcpy
3180  096e aebc          	ld	x,#high(_main$L-68)
3181  0970 bf03          	ld	_writeEepromString$L+3,x
3182  0972 a6bc          	ld	a,#low(_main$L-68)
3183  0974 b704          	ld	_writeEepromString$L+4,a
3184  0976 befc          	ld	x,_main$L-4
3185  0978 bf01          	ld	_writeEepromString$L+1,x
3186  097a b6fd          	ld	a,_main$L-3
3187  097c b702          	ld	_writeEepromString$L+2,a
3188  097e a603          	ld	a,#3
3189  0980 cd0000        	call	_writeEepromString
3191                     ; 186 	woMsgIdx = MSG_IDX_ERROR_13; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_ERROR_13, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
3193  0983 a626          	ld	a,#38
3194  0985 b7ff          	ld	_main$L-1,a
3195  0987 3ffe          	clr	_main$L-2
3198  0989 b6bb          	ld	a,_main$L-69
3199  098b beba          	ld	x,_main$L-70
3200  098d ab60          	add	a,#96
3201  098f 88            	push	a
3202  0990 9f            	ld	a,x
3203  0991 a902          	adc	a,#2
3204  0993 97            	ld	x,a
3205  0994 84            	pop	a
3206  0995 b7fd          	ld	_main$L-3,a
3207  0997 bffc          	ld	_main$L-4,x
3210  0999 a610          	ld	a,#16
3211  099b b704          	ld	_memcpy$L+4,a
3212  099d aefd          	ld	x,#high(L7111)
3213  099f bf02          	ld	_memcpy$L+2,x
3214  09a1 a6fd          	ld	a,#low(L7111)
3215  09a3 b703          	ld	_memcpy$L+3,a
3216  09a5 a6bc          	ld	a,#_main$L-68
3217  09a7 5f            	clr	x
3218  09a8 cd0000        	call	_memcpy
3222  09ab aebc          	ld	x,#high(_main$L-68)
3223  09ad bf03          	ld	_writeEepromString$L+3,x
3224  09af a6bc          	ld	a,#low(_main$L-68)
3225  09b1 b704          	ld	_writeEepromString$L+4,a
3226  09b3 befc          	ld	x,_main$L-4
3227  09b5 bf01          	ld	_writeEepromString$L+1,x
3228  09b7 b6fd          	ld	a,_main$L-3
3229  09b9 b702          	ld	_writeEepromString$L+2,a
3230  09bb a603          	ld	a,#3
3231  09bd cd0000        	call	_writeEepromString
3233                     ; 187 	woMsgIdx = MSG_IDX_ERROR_14; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_ERROR_14, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
3235  09c0 a627          	ld	a,#39
3236  09c2 b7ff          	ld	_main$L-1,a
3237  09c4 3ffe          	clr	_main$L-2
3240  09c6 b6bb          	ld	a,_main$L-69
3241  09c8 beba          	ld	x,_main$L-70
3242  09ca ab70          	add	a,#112
3243  09cc 88            	push	a
3244  09cd 9f            	ld	a,x
3245  09ce a902          	adc	a,#2
3246  09d0 97            	ld	x,a
3247  09d1 84            	pop	a
3248  09d2 b7fd          	ld	_main$L-3,a
3249  09d4 bffc          	ld	_main$L-4,x
3252  09d6 a610          	ld	a,#16
3253  09d8 b704          	ld	_memcpy$L+4,a
3254  09da aef2          	ld	x,#high(L1211)
3255  09dc bf02          	ld	_memcpy$L+2,x
3256  09de a6f2          	ld	a,#low(L1211)
3257  09e0 b703          	ld	_memcpy$L+3,a
3258  09e2 a6bc          	ld	a,#_main$L-68
3259  09e4 5f            	clr	x
3260  09e5 cd0000        	call	_memcpy
3264  09e8 aebc          	ld	x,#high(_main$L-68)
3265  09ea bf03          	ld	_writeEepromString$L+3,x
3266  09ec a6bc          	ld	a,#low(_main$L-68)
3267  09ee b704          	ld	_writeEepromString$L+4,a
3268  09f0 befc          	ld	x,_main$L-4
3269  09f2 bf01          	ld	_writeEepromString$L+1,x
3270  09f4 b6fd          	ld	a,_main$L-3
3271  09f6 b702          	ld	_writeEepromString$L+2,a
3272  09f8 a603          	ld	a,#3
3273  09fa cd0000        	call	_writeEepromString
3275                     ; 188 	woMsgIdx = MSG_IDX_ERROR_15; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_ERROR_15, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
3277  09fd a628          	ld	a,#40
3278  09ff b7ff          	ld	_main$L-1,a
3279  0a01 3ffe          	clr	_main$L-2
3282  0a03 b6bb          	ld	a,_main$L-69
3283  0a05 beba          	ld	x,_main$L-70
3284  0a07 ab80          	add	a,#128
3285  0a09 88            	push	a
3286  0a0a 9f            	ld	a,x
3287  0a0b a902          	adc	a,#2
3288  0a0d 97            	ld	x,a
3289  0a0e 84            	pop	a
3290  0a0f b7fd          	ld	_main$L-3,a
3291  0a11 bffc          	ld	_main$L-4,x
3294  0a13 a610          	ld	a,#16
3295  0a15 b704          	ld	_memcpy$L+4,a
3296  0a17 aee7          	ld	x,#high(L3211)
3297  0a19 bf02          	ld	_memcpy$L+2,x
3298  0a1b a6e7          	ld	a,#low(L3211)
3299  0a1d b703          	ld	_memcpy$L+3,a
3300  0a1f a6bc          	ld	a,#_main$L-68
3301  0a21 5f            	clr	x
3302  0a22 cd0000        	call	_memcpy
3306  0a25 aebc          	ld	x,#high(_main$L-68)
3307  0a27 bf03          	ld	_writeEepromString$L+3,x
3308  0a29 a6bc          	ld	a,#low(_main$L-68)
3309  0a2b b704          	ld	_writeEepromString$L+4,a
3310  0a2d befc          	ld	x,_main$L-4
3311  0a2f bf01          	ld	_writeEepromString$L+1,x
3312  0a31 b6fd          	ld	a,_main$L-3
3313  0a33 b702          	ld	_writeEepromString$L+2,a
3314  0a35 a603          	ld	a,#3
3315  0a37 cd0000        	call	_writeEepromString
3317                     ; 189 	woMsgIdx = MSG_IDX_PARAMETERS; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_PARAMETERS, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
3319  0a3a a629          	ld	a,#41
3320  0a3c b7ff          	ld	_main$L-1,a
3321  0a3e 3ffe          	clr	_main$L-2
3324  0a40 b6bb          	ld	a,_main$L-69
3325  0a42 beba          	ld	x,_main$L-70
3326  0a44 ab90          	add	a,#144
3327  0a46 88            	push	a
3328  0a47 9f            	ld	a,x
3329  0a48 a902          	adc	a,#2
3330  0a4a 97            	ld	x,a
3331  0a4b 84            	pop	a
3332  0a4c b7fd          	ld	_main$L-3,a
3333  0a4e bffc          	ld	_main$L-4,x
3336  0a50 a610          	ld	a,#16
3337  0a52 b704          	ld	_memcpy$L+4,a
3338  0a54 aedc          	ld	x,#high(L5211)
3339  0a56 bf02          	ld	_memcpy$L+2,x
3340  0a58 a6dc          	ld	a,#low(L5211)
3341  0a5a b703          	ld	_memcpy$L+3,a
3342  0a5c a6bc          	ld	a,#_main$L-68
3343  0a5e 5f            	clr	x
3344  0a5f cd0000        	call	_memcpy
3348  0a62 aebc          	ld	x,#high(_main$L-68)
3349  0a64 bf03          	ld	_writeEepromString$L+3,x
3350  0a66 a6bc          	ld	a,#low(_main$L-68)
3351  0a68 b704          	ld	_writeEepromString$L+4,a
3352  0a6a befc          	ld	x,_main$L-4
3353  0a6c bf01          	ld	_writeEepromString$L+1,x
3354  0a6e b6fd          	ld	a,_main$L-3
3355  0a70 b702          	ld	_writeEepromString$L+2,a
3356  0a72 a603          	ld	a,#3
3357  0a74 cd0000        	call	_writeEepromString
3359                     ; 190 	woMsgIdx = MSG_IDX_PORTUGUES; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_PORTUGUES, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
3361  0a77 a62a          	ld	a,#42
3362  0a79 b7ff          	ld	_main$L-1,a
3363  0a7b 3ffe          	clr	_main$L-2
3366  0a7d b6bb          	ld	a,_main$L-69
3367  0a7f beba          	ld	x,_main$L-70
3368  0a81 aba0          	add	a,#160
3369  0a83 88            	push	a
3370  0a84 9f            	ld	a,x
3371  0a85 a902          	adc	a,#2
3372  0a87 97            	ld	x,a
3373  0a88 84            	pop	a
3374  0a89 b7fd          	ld	_main$L-3,a
3375  0a8b bffc          	ld	_main$L-4,x
3378  0a8d a610          	ld	a,#16
3379  0a8f b704          	ld	_memcpy$L+4,a
3380  0a91 aed2          	ld	x,#high(L7211)
3381  0a93 bf02          	ld	_memcpy$L+2,x
3382  0a95 a6d2          	ld	a,#low(L7211)
3383  0a97 b703          	ld	_memcpy$L+3,a
3384  0a99 a6bc          	ld	a,#_main$L-68
3385  0a9b 5f            	clr	x
3386  0a9c cd0000        	call	_memcpy
3390  0a9f aebc          	ld	x,#high(_main$L-68)
3391  0aa1 bf03          	ld	_writeEepromString$L+3,x
3392  0aa3 a6bc          	ld	a,#low(_main$L-68)
3393  0aa5 b704          	ld	_writeEepromString$L+4,a
3394  0aa7 befc          	ld	x,_main$L-4
3395  0aa9 bf01          	ld	_writeEepromString$L+1,x
3396  0aab b6fd          	ld	a,_main$L-3
3397  0aad b702          	ld	_writeEepromString$L+2,a
3398  0aaf a603          	ld	a,#3
3399  0ab1 cd0000        	call	_writeEepromString
3401                     ; 191 	woMsgIdx = MSG_IDX_VISCOSITY; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_VISCOSITY, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
3403  0ab4 a62b          	ld	a,#43
3404  0ab6 b7ff          	ld	_main$L-1,a
3405  0ab8 3ffe          	clr	_main$L-2
3408  0aba b6bb          	ld	a,_main$L-69
3409  0abc beba          	ld	x,_main$L-70
3410  0abe abb0          	add	a,#176
3411  0ac0 88            	push	a
3412  0ac1 9f            	ld	a,x
3413  0ac2 a902          	adc	a,#2
3414  0ac4 97            	ld	x,a
3415  0ac5 84            	pop	a
3416  0ac6 b7fd          	ld	_main$L-3,a
3417  0ac8 bffc          	ld	_main$L-4,x
3420  0aca a610          	ld	a,#16
3421  0acc b704          	ld	_memcpy$L+4,a
3422  0ace aec7          	ld	x,#high(L1311)
3423  0ad0 bf02          	ld	_memcpy$L+2,x
3424  0ad2 a6c7          	ld	a,#low(L1311)
3425  0ad4 b703          	ld	_memcpy$L+3,a
3426  0ad6 a6bc          	ld	a,#_main$L-68
3427  0ad8 5f            	clr	x
3428  0ad9 cd0000        	call	_memcpy
3432  0adc aebc          	ld	x,#high(_main$L-68)
3433  0ade bf03          	ld	_writeEepromString$L+3,x
3434  0ae0 a6bc          	ld	a,#low(_main$L-68)
3435  0ae2 b704          	ld	_writeEepromString$L+4,a
3436  0ae4 befc          	ld	x,_main$L-4
3437  0ae6 bf01          	ld	_writeEepromString$L+1,x
3438  0ae8 b6fd          	ld	a,_main$L-3
3439  0aea b702          	ld	_writeEepromString$L+2,a
3440  0aec a603          	ld	a,#3
3441  0aee cd0000        	call	_writeEepromString
3443                     ; 192 	woMsgIdx = MSG_IDX_ACIDBASE; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_ACIDBASE, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
3445  0af1 a62c          	ld	a,#44
3446  0af3 b7ff          	ld	_main$L-1,a
3447  0af5 3ffe          	clr	_main$L-2
3450  0af7 b6bb          	ld	a,_main$L-69
3451  0af9 beba          	ld	x,_main$L-70
3452  0afb abc0          	add	a,#192
3453  0afd 88            	push	a
3454  0afe 9f            	ld	a,x
3455  0aff a902          	adc	a,#2
3456  0b01 97            	ld	x,a
3457  0b02 84            	pop	a
3458  0b03 b7fd          	ld	_main$L-3,a
3459  0b05 bffc          	ld	_main$L-4,x
3462  0b07 a610          	ld	a,#16
3463  0b09 b704          	ld	_memcpy$L+4,a
3464  0b0b aeb5          	ld	x,#high(L3311)
3465  0b0d bf02          	ld	_memcpy$L+2,x
3466  0b0f a6b5          	ld	a,#low(L3311)
3467  0b11 b703          	ld	_memcpy$L+3,a
3468  0b13 a6bc          	ld	a,#_main$L-68
3469  0b15 5f            	clr	x
3470  0b16 cd0000        	call	_memcpy
3474  0b19 aebc          	ld	x,#high(_main$L-68)
3475  0b1b bf03          	ld	_writeEepromString$L+3,x
3476  0b1d a6bc          	ld	a,#low(_main$L-68)
3477  0b1f b704          	ld	_writeEepromString$L+4,a
3478  0b21 befc          	ld	x,_main$L-4
3479  0b23 bf01          	ld	_writeEepromString$L+1,x
3480  0b25 b6fd          	ld	a,_main$L-3
3481  0b27 b702          	ld	_writeEepromString$L+2,a
3482  0b29 a603          	ld	a,#3
3483  0b2b cd0000        	call	_writeEepromString
3485                     ; 193 	woMsgIdx = MSG_IDX_TEMPERATURE; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_TEMPERATURE, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
3487  0b2e a62d          	ld	a,#45
3488  0b30 b7ff          	ld	_main$L-1,a
3489  0b32 3ffe          	clr	_main$L-2
3492  0b34 b6bb          	ld	a,_main$L-69
3493  0b36 beba          	ld	x,_main$L-70
3494  0b38 abd0          	add	a,#208
3495  0b3a 88            	push	a
3496  0b3b 9f            	ld	a,x
3497  0b3c a902          	adc	a,#2
3498  0b3e 97            	ld	x,a
3499  0b3f 84            	pop	a
3500  0b40 b7fd          	ld	_main$L-3,a
3501  0b42 bffc          	ld	_main$L-4,x
3504  0b44 a610          	ld	a,#16
3505  0b46 b704          	ld	_memcpy$L+4,a
3506  0b48 aea9          	ld	x,#high(L5311)
3507  0b4a bf02          	ld	_memcpy$L+2,x
3508  0b4c a6a9          	ld	a,#low(L5311)
3509  0b4e b703          	ld	_memcpy$L+3,a
3510  0b50 a6bc          	ld	a,#_main$L-68
3511  0b52 5f            	clr	x
3512  0b53 cd0000        	call	_memcpy
3516  0b56 aebc          	ld	x,#high(_main$L-68)
3517  0b58 bf03          	ld	_writeEepromString$L+3,x
3518  0b5a a6bc          	ld	a,#low(_main$L-68)
3519  0b5c b704          	ld	_writeEepromString$L+4,a
3520  0b5e befc          	ld	x,_main$L-4
3521  0b60 bf01          	ld	_writeEepromString$L+1,x
3522  0b62 b6fd          	ld	a,_main$L-3
3523  0b64 b702          	ld	_writeEepromString$L+2,a
3524  0b66 a603          	ld	a,#3
3525  0b68 cd0000        	call	_writeEepromString
3527                     ; 194 	woMsgIdx = MSG_IDX_ENABLE_PH_ASK; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_ENABLE_PH_ASK, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
3529  0b6b a62e          	ld	a,#46
3530  0b6d b7ff          	ld	_main$L-1,a
3531  0b6f 3ffe          	clr	_main$L-2
3534  0b71 b6bb          	ld	a,_main$L-69
3535  0b73 beba          	ld	x,_main$L-70
3536  0b75 abe0          	add	a,#224
3537  0b77 88            	push	a
3538  0b78 9f            	ld	a,x
3539  0b79 a902          	adc	a,#2
3540  0b7b 97            	ld	x,a
3541  0b7c 84            	pop	a
3542  0b7d b7fd          	ld	_main$L-3,a
3543  0b7f bffc          	ld	_main$L-4,x
3546  0b81 a610          	ld	a,#16
3547  0b83 b704          	ld	_memcpy$L+4,a
3548  0b85 ae99          	ld	x,#high(L7311)
3549  0b87 bf02          	ld	_memcpy$L+2,x
3550  0b89 a699          	ld	a,#low(L7311)
3551  0b8b b703          	ld	_memcpy$L+3,a
3552  0b8d a6bc          	ld	a,#_main$L-68
3553  0b8f 5f            	clr	x
3554  0b90 cd0000        	call	_memcpy
3558  0b93 aebc          	ld	x,#high(_main$L-68)
3559  0b95 bf03          	ld	_writeEepromString$L+3,x
3560  0b97 a6bc          	ld	a,#low(_main$L-68)
3561  0b99 b704          	ld	_writeEepromString$L+4,a
3562  0b9b befc          	ld	x,_main$L-4
3563  0b9d bf01          	ld	_writeEepromString$L+1,x
3564  0b9f b6fd          	ld	a,_main$L-3
3565  0ba1 b702          	ld	_writeEepromString$L+2,a
3566  0ba3 a603          	ld	a,#3
3567  0ba5 cd0000        	call	_writeEepromString
3569                     ; 195 	woMsgIdx = MSG_IDX_SAVE_JOB; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_SAVE_JOB, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
3571  0ba8 a62f          	ld	a,#47
3572  0baa b7ff          	ld	_main$L-1,a
3573  0bac 3ffe          	clr	_main$L-2
3576  0bae b6bb          	ld	a,_main$L-69
3577  0bb0 beba          	ld	x,_main$L-70
3578  0bb2 abf0          	add	a,#240
3579  0bb4 88            	push	a
3580  0bb5 9f            	ld	a,x
3581  0bb6 a902          	adc	a,#2
3582  0bb8 97            	ld	x,a
3583  0bb9 84            	pop	a
3584  0bba b7fd          	ld	_main$L-3,a
3585  0bbc bffc          	ld	_main$L-4,x
3588  0bbe a610          	ld	a,#16
3589  0bc0 b704          	ld	_memcpy$L+4,a
3590  0bc2 ae8d          	ld	x,#high(L1411)
3591  0bc4 bf02          	ld	_memcpy$L+2,x
3592  0bc6 a68d          	ld	a,#low(L1411)
3593  0bc8 b703          	ld	_memcpy$L+3,a
3594  0bca a6bc          	ld	a,#_main$L-68
3595  0bcc 5f            	clr	x
3596  0bcd cd0000        	call	_memcpy
3600  0bd0 aebc          	ld	x,#high(_main$L-68)
3601  0bd2 bf03          	ld	_writeEepromString$L+3,x
3602  0bd4 a6bc          	ld	a,#low(_main$L-68)
3603  0bd6 b704          	ld	_writeEepromString$L+4,a
3604  0bd8 befc          	ld	x,_main$L-4
3605  0bda bf01          	ld	_writeEepromString$L+1,x
3606  0bdc b6fd          	ld	a,_main$L-3
3607  0bde b702          	ld	_writeEepromString$L+2,a
3608  0be0 a603          	ld	a,#3
3609  0be2 cd0000        	call	_writeEepromString
3611                     ; 196 	woMsgIdx = MSG_IDX_LOAD_JOB; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_LOAD_JOB, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
3613  0be5 a630          	ld	a,#48
3614  0be7 b7ff          	ld	_main$L-1,a
3615  0be9 3ffe          	clr	_main$L-2
3618  0beb b6bb          	ld	a,_main$L-69
3619  0bed beba          	ld	x,_main$L-70
3620  0bef ab00          	add	a,#0
3621  0bf1 88            	push	a
3622  0bf2 9f            	ld	a,x
3623  0bf3 a903          	adc	a,#3
3624  0bf5 97            	ld	x,a
3625  0bf6 84            	pop	a
3626  0bf7 b7fd          	ld	_main$L-3,a
3627  0bf9 bffc          	ld	_main$L-4,x
3630  0bfb a610          	ld	a,#16
3631  0bfd b704          	ld	_memcpy$L+4,a
3632  0bff ae82          	ld	x,#high(L3411)
3633  0c01 bf02          	ld	_memcpy$L+2,x
3634  0c03 a682          	ld	a,#low(L3411)
3635  0c05 b703          	ld	_memcpy$L+3,a
3636  0c07 a6bc          	ld	a,#_main$L-68
3637  0c09 5f            	clr	x
3638  0c0a cd0000        	call	_memcpy
3642  0c0d aebc          	ld	x,#high(_main$L-68)
3643  0c0f bf03          	ld	_writeEepromString$L+3,x
3644  0c11 a6bc          	ld	a,#low(_main$L-68)
3645  0c13 b704          	ld	_writeEepromString$L+4,a
3646  0c15 befc          	ld	x,_main$L-4
3647  0c17 bf01          	ld	_writeEepromString$L+1,x
3648  0c19 b6fd          	ld	a,_main$L-3
3649  0c1b b702          	ld	_writeEepromString$L+2,a
3650  0c1d a603          	ld	a,#3
3651  0c1f cd0000        	call	_writeEepromString
3653                     ; 197 	woMsgIdx = MSG_IDX_CONFIGURATION; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_CONFIGURATION, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
3655  0c22 a631          	ld	a,#49
3656  0c24 b7ff          	ld	_main$L-1,a
3657  0c26 3ffe          	clr	_main$L-2
3660  0c28 b6bb          	ld	a,_main$L-69
3661  0c2a beba          	ld	x,_main$L-70
3662  0c2c ab10          	add	a,#16
3663  0c2e 88            	push	a
3664  0c2f 9f            	ld	a,x
3665  0c30 a903          	adc	a,#3
3666  0c32 97            	ld	x,a
3667  0c33 84            	pop	a
3668  0c34 b7fd          	ld	_main$L-3,a
3669  0c36 bffc          	ld	_main$L-4,x
3672  0c38 a610          	ld	a,#16
3673  0c3a b704          	ld	_memcpy$L+4,a
3674  0c3c ae73          	ld	x,#high(L5411)
3675  0c3e bf02          	ld	_memcpy$L+2,x
3676  0c40 a673          	ld	a,#low(L5411)
3677  0c42 b703          	ld	_memcpy$L+3,a
3678  0c44 a6bc          	ld	a,#_main$L-68
3679  0c46 5f            	clr	x
3680  0c47 cd0000        	call	_memcpy
3684  0c4a aebc          	ld	x,#high(_main$L-68)
3685  0c4c bf03          	ld	_writeEepromString$L+3,x
3686  0c4e a6bc          	ld	a,#low(_main$L-68)
3687  0c50 b704          	ld	_writeEepromString$L+4,a
3688  0c52 befc          	ld	x,_main$L-4
3689  0c54 bf01          	ld	_writeEepromString$L+1,x
3690  0c56 b6fd          	ld	a,_main$L-3
3691  0c58 b702          	ld	_writeEepromString$L+2,a
3692  0c5a a603          	ld	a,#3
3693  0c5c cd0000        	call	_writeEepromString
3695                     ; 198 	woMsgIdx = MSG_IDX_PH_TOO_DIFFERENT; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_PH_TOO_DIFFERENT, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
3697  0c5f a632          	ld	a,#50
3698  0c61 b7ff          	ld	_main$L-1,a
3699  0c63 3ffe          	clr	_main$L-2
3702  0c65 b6bb          	ld	a,_main$L-69
3703  0c67 beba          	ld	x,_main$L-70
3704  0c69 ab20          	add	a,#32
3705  0c6b 88            	push	a
3706  0c6c 9f            	ld	a,x
3707  0c6d a903          	adc	a,#3
3708  0c6f 97            	ld	x,a
3709  0c70 84            	pop	a
3710  0c71 b7fd          	ld	_main$L-3,a
3711  0c73 bffc          	ld	_main$L-4,x
3714  0c75 a610          	ld	a,#16
3715  0c77 b704          	ld	_memcpy$L+4,a
3716  0c79 ae5c          	ld	x,#high(L7411)
3717  0c7b bf02          	ld	_memcpy$L+2,x
3718  0c7d a65c          	ld	a,#low(L7411)
3719  0c7f b703          	ld	_memcpy$L+3,a
3720  0c81 a6bc          	ld	a,#_main$L-68
3721  0c83 5f            	clr	x
3722  0c84 cd0000        	call	_memcpy
3726  0c87 aebc          	ld	x,#high(_main$L-68)
3727  0c89 bf03          	ld	_writeEepromString$L+3,x
3728  0c8b a6bc          	ld	a,#low(_main$L-68)
3729  0c8d b704          	ld	_writeEepromString$L+4,a
3730  0c8f befc          	ld	x,_main$L-4
3731  0c91 bf01          	ld	_writeEepromString$L+1,x
3732  0c93 b6fd          	ld	a,_main$L-3
3733  0c95 b702          	ld	_writeEepromString$L+2,a
3734  0c97 a603          	ld	a,#3
3735  0c99 cd0000        	call	_writeEepromString
3737                     ; 199 	woMsgIdx = MSG_IDX_MAX_CORRECTION; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_MAX_CORRECTION, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
3739  0c9c a633          	ld	a,#51
3740  0c9e b7ff          	ld	_main$L-1,a
3741  0ca0 3ffe          	clr	_main$L-2
3744  0ca2 b6bb          	ld	a,_main$L-69
3745  0ca4 beba          	ld	x,_main$L-70
3746  0ca6 ab30          	add	a,#48
3747  0ca8 88            	push	a
3748  0ca9 9f            	ld	a,x
3749  0caa a903          	adc	a,#3
3750  0cac 97            	ld	x,a
3751  0cad 84            	pop	a
3752  0cae b7fd          	ld	_main$L-3,a
3753  0cb0 bffc          	ld	_main$L-4,x
3756  0cb2 a610          	ld	a,#16
3757  0cb4 b704          	ld	_memcpy$L+4,a
3758  0cb6 ae4d          	ld	x,#high(L1511)
3759  0cb8 bf02          	ld	_memcpy$L+2,x
3760  0cba a64d          	ld	a,#low(L1511)
3761  0cbc b703          	ld	_memcpy$L+3,a
3762  0cbe a6bc          	ld	a,#_main$L-68
3763  0cc0 5f            	clr	x
3764  0cc1 cd0000        	call	_memcpy
3768  0cc4 aebc          	ld	x,#high(_main$L-68)
3769  0cc6 bf03          	ld	_writeEepromString$L+3,x
3770  0cc8 a6bc          	ld	a,#low(_main$L-68)
3771  0cca b704          	ld	_writeEepromString$L+4,a
3772  0ccc befc          	ld	x,_main$L-4
3773  0cce bf01          	ld	_writeEepromString$L+1,x
3774  0cd0 b6fd          	ld	a,_main$L-3
3775  0cd2 b702          	ld	_writeEepromString$L+2,a
3776  0cd4 a603          	ld	a,#3
3777  0cd6 cd0000        	call	_writeEepromString
3779                     ; 200 	woMsgIdx = MSG_IDX_MIN_CORRECTION; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_MIN_CORRECTION, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
3781  0cd9 a634          	ld	a,#52
3782  0cdb b7ff          	ld	_main$L-1,a
3783  0cdd 3ffe          	clr	_main$L-2
3786  0cdf b6bb          	ld	a,_main$L-69
3787  0ce1 beba          	ld	x,_main$L-70
3788  0ce3 ab40          	add	a,#64
3789  0ce5 88            	push	a
3790  0ce6 9f            	ld	a,x
3791  0ce7 a903          	adc	a,#3
3792  0ce9 97            	ld	x,a
3793  0cea 84            	pop	a
3794  0ceb b7fd          	ld	_main$L-3,a
3795  0ced bffc          	ld	_main$L-4,x
3798  0cef a610          	ld	a,#16
3799  0cf1 b704          	ld	_memcpy$L+4,a
3800  0cf3 ae3e          	ld	x,#high(L3511)
3801  0cf5 bf02          	ld	_memcpy$L+2,x
3802  0cf7 a63e          	ld	a,#low(L3511)
3803  0cf9 b703          	ld	_memcpy$L+3,a
3804  0cfb a6bc          	ld	a,#_main$L-68
3805  0cfd 5f            	clr	x
3806  0cfe cd0000        	call	_memcpy
3810  0d01 aebc          	ld	x,#high(_main$L-68)
3811  0d03 bf03          	ld	_writeEepromString$L+3,x
3812  0d05 a6bc          	ld	a,#low(_main$L-68)
3813  0d07 b704          	ld	_writeEepromString$L+4,a
3814  0d09 befc          	ld	x,_main$L-4
3815  0d0b bf01          	ld	_writeEepromString$L+1,x
3816  0d0d b6fd          	ld	a,_main$L-3
3817  0d0f b702          	ld	_writeEepromString$L+2,a
3818  0d11 a603          	ld	a,#3
3819  0d13 cd0000        	call	_writeEepromString
3821                     ; 201 	woMsgIdx = MSG_IDX_MAX_VISCOSITY; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_MAX_VISCOSITY, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
3823  0d16 a635          	ld	a,#53
3824  0d18 b7ff          	ld	_main$L-1,a
3825  0d1a 3ffe          	clr	_main$L-2
3828  0d1c b6bb          	ld	a,_main$L-69
3829  0d1e beba          	ld	x,_main$L-70
3830  0d20 ab50          	add	a,#80
3831  0d22 88            	push	a
3832  0d23 9f            	ld	a,x
3833  0d24 a903          	adc	a,#3
3834  0d26 97            	ld	x,a
3835  0d27 84            	pop	a
3836  0d28 b7fd          	ld	_main$L-3,a
3837  0d2a bffc          	ld	_main$L-4,x
3840  0d2c a610          	ld	a,#16
3841  0d2e b704          	ld	_memcpy$L+4,a
3842  0d30 ae2f          	ld	x,#high(L5511)
3843  0d32 bf02          	ld	_memcpy$L+2,x
3844  0d34 a62f          	ld	a,#low(L5511)
3845  0d36 b703          	ld	_memcpy$L+3,a
3846  0d38 a6bc          	ld	a,#_main$L-68
3847  0d3a 5f            	clr	x
3848  0d3b cd0000        	call	_memcpy
3852  0d3e aebc          	ld	x,#high(_main$L-68)
3853  0d40 bf03          	ld	_writeEepromString$L+3,x
3854  0d42 a6bc          	ld	a,#low(_main$L-68)
3855  0d44 b704          	ld	_writeEepromString$L+4,a
3856  0d46 befc          	ld	x,_main$L-4
3857  0d48 bf01          	ld	_writeEepromString$L+1,x
3858  0d4a b6fd          	ld	a,_main$L-3
3859  0d4c b702          	ld	_writeEepromString$L+2,a
3860  0d4e a603          	ld	a,#3
3861  0d50 cd0000        	call	_writeEepromString
3863                     ; 202 	woMsgIdx = MSG_IDX_MIN_VISCOSITY; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_MIN_VISCOSITY, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
3865  0d53 a636          	ld	a,#54
3866  0d55 b7ff          	ld	_main$L-1,a
3867  0d57 3ffe          	clr	_main$L-2
3870  0d59 b6bb          	ld	a,_main$L-69
3871  0d5b beba          	ld	x,_main$L-70
3872  0d5d ab60          	add	a,#96
3873  0d5f 88            	push	a
3874  0d60 9f            	ld	a,x
3875  0d61 a903          	adc	a,#3
3876  0d63 97            	ld	x,a
3877  0d64 84            	pop	a
3878  0d65 b7fd          	ld	_main$L-3,a
3879  0d67 bffc          	ld	_main$L-4,x
3882  0d69 a610          	ld	a,#16
3883  0d6b b704          	ld	_memcpy$L+4,a
3884  0d6d ae20          	ld	x,#high(L7511)
3885  0d6f bf02          	ld	_memcpy$L+2,x
3886  0d71 a620          	ld	a,#low(L7511)
3887  0d73 b703          	ld	_memcpy$L+3,a
3888  0d75 a6bc          	ld	a,#_main$L-68
3889  0d77 5f            	clr	x
3890  0d78 cd0000        	call	_memcpy
3894  0d7b aebc          	ld	x,#high(_main$L-68)
3895  0d7d bf03          	ld	_writeEepromString$L+3,x
3896  0d7f a6bc          	ld	a,#low(_main$L-68)
3897  0d81 b704          	ld	_writeEepromString$L+4,a
3898  0d83 befc          	ld	x,_main$L-4
3899  0d85 bf01          	ld	_writeEepromString$L+1,x
3900  0d87 b6fd          	ld	a,_main$L-3
3901  0d89 b702          	ld	_writeEepromString$L+2,a
3902  0d8b a603          	ld	a,#3
3903  0d8d cd0000        	call	_writeEepromString
3905                     ; 203 	woMsgIdx = MSG_IDX_ALLARM; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_ALLARM, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
3907  0d90 a637          	ld	a,#55
3908  0d92 b7ff          	ld	_main$L-1,a
3909  0d94 3ffe          	clr	_main$L-2
3912  0d96 b6bb          	ld	a,_main$L-69
3913  0d98 beba          	ld	x,_main$L-70
3914  0d9a ab70          	add	a,#112
3915  0d9c 88            	push	a
3916  0d9d 9f            	ld	a,x
3917  0d9e a903          	adc	a,#3
3918  0da0 97            	ld	x,a
3919  0da1 84            	pop	a
3920  0da2 b7fd          	ld	_main$L-3,a
3921  0da4 bffc          	ld	_main$L-4,x
3924  0da6 a610          	ld	a,#16
3925  0da8 b704          	ld	_memcpy$L+4,a
3926  0daa ae19          	ld	x,#high(L1611)
3927  0dac bf02          	ld	_memcpy$L+2,x
3928  0dae a619          	ld	a,#low(L1611)
3929  0db0 b703          	ld	_memcpy$L+3,a
3930  0db2 a6bc          	ld	a,#_main$L-68
3931  0db4 5f            	clr	x
3932  0db5 cd0000        	call	_memcpy
3936  0db8 aebc          	ld	x,#high(_main$L-68)
3937  0dba bf03          	ld	_writeEepromString$L+3,x
3938  0dbc a6bc          	ld	a,#low(_main$L-68)
3939  0dbe b704          	ld	_writeEepromString$L+4,a
3940  0dc0 befc          	ld	x,_main$L-4
3941  0dc2 bf01          	ld	_writeEepromString$L+1,x
3942  0dc4 b6fd          	ld	a,_main$L-3
3943  0dc6 b702          	ld	_writeEepromString$L+2,a
3944  0dc8 a603          	ld	a,#3
3945  0dca cd0000        	call	_writeEepromString
3947                     ; 204 	woMsgIdx = MSG_IDX_PH_ONOFF; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_PH_ONOFF, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
3949  0dcd a638          	ld	a,#56
3950  0dcf b7ff          	ld	_main$L-1,a
3951  0dd1 3ffe          	clr	_main$L-2
3954  0dd3 b6bb          	ld	a,_main$L-69
3955  0dd5 beba          	ld	x,_main$L-70
3956  0dd7 ab80          	add	a,#128
3957  0dd9 88            	push	a
3958  0dda 9f            	ld	a,x
3959  0ddb a903          	adc	a,#3
3960  0ddd 97            	ld	x,a
3961  0dde 84            	pop	a
3962  0ddf b7fd          	ld	_main$L-3,a
3963  0de1 bffc          	ld	_main$L-4,x
3966  0de3 a610          	ld	a,#16
3967  0de5 b704          	ld	_memcpy$L+4,a
3968  0de7 ae0d          	ld	x,#high(L3611)
3969  0de9 bf02          	ld	_memcpy$L+2,x
3970  0deb a60d          	ld	a,#low(L3611)
3971  0ded b703          	ld	_memcpy$L+3,a
3972  0def a6bc          	ld	a,#_main$L-68
3973  0df1 5f            	clr	x
3974  0df2 cd0000        	call	_memcpy
3978  0df5 aebc          	ld	x,#high(_main$L-68)
3979  0df7 bf03          	ld	_writeEepromString$L+3,x
3980  0df9 a6bc          	ld	a,#low(_main$L-68)
3981  0dfb b704          	ld	_writeEepromString$L+4,a
3982  0dfd befc          	ld	x,_main$L-4
3983  0dff bf01          	ld	_writeEepromString$L+1,x
3984  0e01 b6fd          	ld	a,_main$L-3
3985  0e03 b702          	ld	_writeEepromString$L+2,a
3986  0e05 a603          	ld	a,#3
3987  0e07 cd0000        	call	_writeEepromString
3989                     ; 205 	woMsgIdx = MSG_IDX_JOB_SAVED; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_JOB_SAVED, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
3991  0e0a a639          	ld	a,#57
3992  0e0c b7ff          	ld	_main$L-1,a
3993  0e0e 3ffe          	clr	_main$L-2
3996  0e10 b6bb          	ld	a,_main$L-69
3997  0e12 beba          	ld	x,_main$L-70
3998  0e14 ab90          	add	a,#144
3999  0e16 88            	push	a
4000  0e17 9f            	ld	a,x
4001  0e18 a903          	adc	a,#3
4002  0e1a 97            	ld	x,a
4003  0e1b 84            	pop	a
4004  0e1c b7fd          	ld	_main$L-3,a
4005  0e1e bffc          	ld	_main$L-4,x
4008  0e20 a610          	ld	a,#16
4009  0e22 b704          	ld	_memcpy$L+4,a
4010  0e24 aefc          	ld	x,#high(L5611)
4011  0e26 bf02          	ld	_memcpy$L+2,x
4012  0e28 a6fc          	ld	a,#low(L5611)
4013  0e2a b703          	ld	_memcpy$L+3,a
4014  0e2c a6bc          	ld	a,#_main$L-68
4015  0e2e 5f            	clr	x
4016  0e2f cd0000        	call	_memcpy
4020  0e32 aebc          	ld	x,#high(_main$L-68)
4021  0e34 bf03          	ld	_writeEepromString$L+3,x
4022  0e36 a6bc          	ld	a,#low(_main$L-68)
4023  0e38 b704          	ld	_writeEepromString$L+4,a
4024  0e3a befc          	ld	x,_main$L-4
4025  0e3c bf01          	ld	_writeEepromString$L+1,x
4026  0e3e b6fd          	ld	a,_main$L-3
4027  0e40 b702          	ld	_writeEepromString$L+2,a
4028  0e42 a603          	ld	a,#3
4029  0e44 cd0000        	call	_writeEepromString
4031                     ; 206 	woMsgIdx = MSG_IDX_JOB_LOADED; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_JOB_LOADED, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
4033  0e47 a63a          	ld	a,#58
4034  0e49 b7ff          	ld	_main$L-1,a
4035  0e4b 3ffe          	clr	_main$L-2
4038  0e4d b6bb          	ld	a,_main$L-69
4039  0e4f beba          	ld	x,_main$L-70
4040  0e51 aba0          	add	a,#160
4041  0e53 88            	push	a
4042  0e54 9f            	ld	a,x
4043  0e55 a903          	adc	a,#3
4044  0e57 97            	ld	x,a
4045  0e58 84            	pop	a
4046  0e59 b7fd          	ld	_main$L-3,a
4047  0e5b bffc          	ld	_main$L-4,x
4050  0e5d a610          	ld	a,#16
4051  0e5f b704          	ld	_memcpy$L+4,a
4052  0e61 aeef          	ld	x,#high(L7611)
4053  0e63 bf02          	ld	_memcpy$L+2,x
4054  0e65 a6ef          	ld	a,#low(L7611)
4055  0e67 b703          	ld	_memcpy$L+3,a
4056  0e69 a6bc          	ld	a,#_main$L-68
4057  0e6b 5f            	clr	x
4058  0e6c cd0000        	call	_memcpy
4062  0e6f aebc          	ld	x,#high(_main$L-68)
4063  0e71 bf03          	ld	_writeEepromString$L+3,x
4064  0e73 a6bc          	ld	a,#low(_main$L-68)
4065  0e75 b704          	ld	_writeEepromString$L+4,a
4066  0e77 befc          	ld	x,_main$L-4
4067  0e79 bf01          	ld	_writeEepromString$L+1,x
4068  0e7b b6fd          	ld	a,_main$L-3
4069  0e7d b702          	ld	_writeEepromString$L+2,a
4070  0e7f a603          	ld	a,#3
4071  0e81 cd0000        	call	_writeEepromString
4073                     ; 207 	woMsgIdx = MSG_IDX_SOLVENT_ASK; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_SOLVENT_ASK, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
4075  0e84 a63b          	ld	a,#59
4076  0e86 b7ff          	ld	_main$L-1,a
4077  0e88 3ffe          	clr	_main$L-2
4080  0e8a b6bb          	ld	a,_main$L-69
4081  0e8c beba          	ld	x,_main$L-70
4082  0e8e abb0          	add	a,#176
4083  0e90 88            	push	a
4084  0e91 9f            	ld	a,x
4085  0e92 a903          	adc	a,#3
4086  0e94 97            	ld	x,a
4087  0e95 84            	pop	a
4088  0e96 b7fd          	ld	_main$L-3,a
4089  0e98 bffc          	ld	_main$L-4,x
4092  0e9a a610          	ld	a,#16
4093  0e9c b704          	ld	_memcpy$L+4,a
4094  0e9e aee2          	ld	x,#high(L1711)
4095  0ea0 bf02          	ld	_memcpy$L+2,x
4096  0ea2 a6e2          	ld	a,#low(L1711)
4097  0ea4 b703          	ld	_memcpy$L+3,a
4098  0ea6 a6bc          	ld	a,#_main$L-68
4099  0ea8 5f            	clr	x
4100  0ea9 cd0000        	call	_memcpy
4104  0eac aebc          	ld	x,#high(_main$L-68)
4105  0eae bf03          	ld	_writeEepromString$L+3,x
4106  0eb0 a6bc          	ld	a,#low(_main$L-68)
4107  0eb2 b704          	ld	_writeEepromString$L+4,a
4108  0eb4 befc          	ld	x,_main$L-4
4109  0eb6 bf01          	ld	_writeEepromString$L+1,x
4110  0eb8 b6fd          	ld	a,_main$L-3
4111  0eba b702          	ld	_writeEepromString$L+2,a
4112  0ebc a603          	ld	a,#3
4113  0ebe cd0000        	call	_writeEepromString
4115                     ; 208 	woMsgIdx = MSG_IDX_SOLVENT_ASK2; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_SOLVENT_ASK2, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
4117  0ec1 a63c          	ld	a,#60
4118  0ec3 b7ff          	ld	_main$L-1,a
4119  0ec5 3ffe          	clr	_main$L-2
4122  0ec7 b6bb          	ld	a,_main$L-69
4123  0ec9 beba          	ld	x,_main$L-70
4124  0ecb abc0          	add	a,#192
4125  0ecd 88            	push	a
4126  0ece 9f            	ld	a,x
4127  0ecf a903          	adc	a,#3
4128  0ed1 97            	ld	x,a
4129  0ed2 84            	pop	a
4130  0ed3 b7fd          	ld	_main$L-3,a
4131  0ed5 bffc          	ld	_main$L-4,x
4134  0ed7 a610          	ld	a,#16
4135  0ed9 b704          	ld	_memcpy$L+4,a
4136  0edb aed1          	ld	x,#high(L3711)
4137  0edd bf02          	ld	_memcpy$L+2,x
4138  0edf a6d1          	ld	a,#low(L3711)
4139  0ee1 b703          	ld	_memcpy$L+3,a
4140  0ee3 a6bc          	ld	a,#_main$L-68
4141  0ee5 5f            	clr	x
4142  0ee6 cd0000        	call	_memcpy
4146  0ee9 aebc          	ld	x,#high(_main$L-68)
4147  0eeb bf03          	ld	_writeEepromString$L+3,x
4148  0eed a6bc          	ld	a,#low(_main$L-68)
4149  0eef b704          	ld	_writeEepromString$L+4,a
4150  0ef1 befc          	ld	x,_main$L-4
4151  0ef3 bf01          	ld	_writeEepromString$L+1,x
4152  0ef5 b6fd          	ld	a,_main$L-3
4153  0ef7 b702          	ld	_writeEepromString$L+2,a
4154  0ef9 a603          	ld	a,#3
4155  0efb cd0000        	call	_writeEepromString
4157                     ; 209 	woMsgIdx = MSG_IDX_ACIDBASE_ASK; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_ACIDBASE_ASK, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
4159  0efe a63d          	ld	a,#61
4160  0f00 b7ff          	ld	_main$L-1,a
4161  0f02 3ffe          	clr	_main$L-2
4164  0f04 b6bb          	ld	a,_main$L-69
4165  0f06 beba          	ld	x,_main$L-70
4166  0f08 abd0          	add	a,#208
4167  0f0a 88            	push	a
4168  0f0b 9f            	ld	a,x
4169  0f0c a903          	adc	a,#3
4170  0f0e 97            	ld	x,a
4171  0f0f 84            	pop	a
4172  0f10 b7fd          	ld	_main$L-3,a
4173  0f12 bffc          	ld	_main$L-4,x
4176  0f14 a610          	ld	a,#16
4177  0f16 b704          	ld	_memcpy$L+4,a
4178  0f18 aec4          	ld	x,#high(L5711)
4179  0f1a bf02          	ld	_memcpy$L+2,x
4180  0f1c a6c4          	ld	a,#low(L5711)
4181  0f1e b703          	ld	_memcpy$L+3,a
4182  0f20 a6bc          	ld	a,#_main$L-68
4183  0f22 5f            	clr	x
4184  0f23 cd0000        	call	_memcpy
4188  0f26 aebc          	ld	x,#high(_main$L-68)
4189  0f28 bf03          	ld	_writeEepromString$L+3,x
4190  0f2a a6bc          	ld	a,#low(_main$L-68)
4191  0f2c b704          	ld	_writeEepromString$L+4,a
4192  0f2e befc          	ld	x,_main$L-4
4193  0f30 bf01          	ld	_writeEepromString$L+1,x
4194  0f32 b6fd          	ld	a,_main$L-3
4195  0f34 b702          	ld	_writeEepromString$L+2,a
4196  0f36 a603          	ld	a,#3
4197  0f38 cd0000        	call	_writeEepromString
4199                     ; 210 	woMsgIdx = MSG_IDX_ACIDBASE_ASK2; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_ACIDBASE_ASK2, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
4201  0f3b a63e          	ld	a,#62
4202  0f3d b7ff          	ld	_main$L-1,a
4203  0f3f 3ffe          	clr	_main$L-2
4206  0f41 b6bb          	ld	a,_main$L-69
4207  0f43 beba          	ld	x,_main$L-70
4208  0f45 abe0          	add	a,#224
4209  0f47 88            	push	a
4210  0f48 9f            	ld	a,x
4211  0f49 a903          	adc	a,#3
4212  0f4b 97            	ld	x,a
4213  0f4c 84            	pop	a
4214  0f4d b7fd          	ld	_main$L-3,a
4215  0f4f bffc          	ld	_main$L-4,x
4218  0f51 a610          	ld	a,#16
4219  0f53 b704          	ld	_memcpy$L+4,a
4220  0f55 aeb1          	ld	x,#high(L7711)
4221  0f57 bf02          	ld	_memcpy$L+2,x
4222  0f59 a6b1          	ld	a,#low(L7711)
4223  0f5b b703          	ld	_memcpy$L+3,a
4224  0f5d a6bc          	ld	a,#_main$L-68
4225  0f5f 5f            	clr	x
4226  0f60 cd0000        	call	_memcpy
4230  0f63 aebc          	ld	x,#high(_main$L-68)
4231  0f65 bf03          	ld	_writeEepromString$L+3,x
4232  0f67 a6bc          	ld	a,#low(_main$L-68)
4233  0f69 b704          	ld	_writeEepromString$L+4,a
4234  0f6b befc          	ld	x,_main$L-4
4235  0f6d bf01          	ld	_writeEepromString$L+1,x
4236  0f6f b6fd          	ld	a,_main$L-3
4237  0f71 b702          	ld	_writeEepromString$L+2,a
4238  0f73 a603          	ld	a,#3
4239  0f75 cd0000        	call	_writeEepromString
4241                     ; 211 	woMsgIdx = MSG_IDX_MAX_TEMPERATURE; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_MAX_TEMPERATURE, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
4243  0f78 a63f          	ld	a,#63
4244  0f7a b7ff          	ld	_main$L-1,a
4245  0f7c 3ffe          	clr	_main$L-2
4248  0f7e b6bb          	ld	a,_main$L-69
4249  0f80 beba          	ld	x,_main$L-70
4250  0f82 abf0          	add	a,#240
4251  0f84 88            	push	a
4252  0f85 9f            	ld	a,x
4253  0f86 a903          	adc	a,#3
4254  0f88 97            	ld	x,a
4255  0f89 84            	pop	a
4256  0f8a b7fd          	ld	_main$L-3,a
4257  0f8c bffc          	ld	_main$L-4,x
4260  0f8e a610          	ld	a,#16
4261  0f90 b704          	ld	_memcpy$L+4,a
4262  0f92 aea1          	ld	x,#high(L1021)
4263  0f94 bf02          	ld	_memcpy$L+2,x
4264  0f96 a6a1          	ld	a,#low(L1021)
4265  0f98 b703          	ld	_memcpy$L+3,a
4266  0f9a a6bc          	ld	a,#_main$L-68
4267  0f9c 5f            	clr	x
4268  0f9d cd0000        	call	_memcpy
4272  0fa0 aebc          	ld	x,#high(_main$L-68)
4273  0fa2 bf03          	ld	_writeEepromString$L+3,x
4274  0fa4 a6bc          	ld	a,#low(_main$L-68)
4275  0fa6 b704          	ld	_writeEepromString$L+4,a
4276  0fa8 befc          	ld	x,_main$L-4
4277  0faa bf01          	ld	_writeEepromString$L+1,x
4278  0fac b6fd          	ld	a,_main$L-3
4279  0fae b702          	ld	_writeEepromString$L+2,a
4280  0fb0 a603          	ld	a,#3
4281  0fb2 cd0000        	call	_writeEepromString
4283                     ; 212 	woMsgIdx = MSG_IDX_MIN_TEMPERATURE; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_MIN_TEMPERATURE, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
4285  0fb5 a640          	ld	a,#64
4286  0fb7 b7ff          	ld	_main$L-1,a
4287  0fb9 3ffe          	clr	_main$L-2
4290  0fbb b6bb          	ld	a,_main$L-69
4291  0fbd beba          	ld	x,_main$L-70
4292  0fbf ab00          	add	a,#0
4293  0fc1 88            	push	a
4294  0fc2 9f            	ld	a,x
4295  0fc3 a904          	adc	a,#4
4296  0fc5 97            	ld	x,a
4297  0fc6 84            	pop	a
4298  0fc7 b7fd          	ld	_main$L-3,a
4299  0fc9 bffc          	ld	_main$L-4,x
4302  0fcb a610          	ld	a,#16
4303  0fcd b704          	ld	_memcpy$L+4,a
4304  0fcf ae91          	ld	x,#high(L3021)
4305  0fd1 bf02          	ld	_memcpy$L+2,x
4306  0fd3 a691          	ld	a,#low(L3021)
4307  0fd5 b703          	ld	_memcpy$L+3,a
4308  0fd7 a6bc          	ld	a,#_main$L-68
4309  0fd9 5f            	clr	x
4310  0fda cd0000        	call	_memcpy
4314  0fdd aebc          	ld	x,#high(_main$L-68)
4315  0fdf bf03          	ld	_writeEepromString$L+3,x
4316  0fe1 a6bc          	ld	a,#low(_main$L-68)
4317  0fe3 b704          	ld	_writeEepromString$L+4,a
4318  0fe5 befc          	ld	x,_main$L-4
4319  0fe7 bf01          	ld	_writeEepromString$L+1,x
4320  0fe9 b6fd          	ld	a,_main$L-3
4321  0feb b702          	ld	_writeEepromString$L+2,a
4322  0fed a603          	ld	a,#3
4323  0fef cd0000        	call	_writeEepromString
4325                     ; 213 	woMsgIdx = MSG_IDX_ADDING_SOLVENT3; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_ADDING_SOLVENT3, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
4327  0ff2 a641          	ld	a,#65
4328  0ff4 b7ff          	ld	_main$L-1,a
4329  0ff6 3ffe          	clr	_main$L-2
4332  0ff8 b6bb          	ld	a,_main$L-69
4333  0ffa beba          	ld	x,_main$L-70
4334  0ffc ab10          	add	a,#16
4335  0ffe 88            	push	a
4336  0fff 9f            	ld	a,x
4337  1000 a904          	adc	a,#4
4338  1002 97            	ld	x,a
4339  1003 84            	pop	a
4340  1004 b7fd          	ld	_main$L-3,a
4341  1006 bffc          	ld	_main$L-4,x
4344  1008 a610          	ld	a,#16
4345  100a b704          	ld	_memcpy$L+4,a
4346  100c ae82          	ld	x,#high(L5021)
4347  100e bf02          	ld	_memcpy$L+2,x
4348  1010 a682          	ld	a,#low(L5021)
4349  1012 b703          	ld	_memcpy$L+3,a
4350  1014 a6bc          	ld	a,#_main$L-68
4351  1016 5f            	clr	x
4352  1017 cd0000        	call	_memcpy
4356  101a aebc          	ld	x,#high(_main$L-68)
4357  101c bf03          	ld	_writeEepromString$L+3,x
4358  101e a6bc          	ld	a,#low(_main$L-68)
4359  1020 b704          	ld	_writeEepromString$L+4,a
4360  1022 befc          	ld	x,_main$L-4
4361  1024 bf01          	ld	_writeEepromString$L+1,x
4362  1026 b6fd          	ld	a,_main$L-3
4363  1028 b702          	ld	_writeEepromString$L+2,a
4364  102a a603          	ld	a,#3
4365  102c cd0000        	call	_writeEepromString
4367                     ; 214 	woMsgIdx = MSG_IDX_ADDING_ACIDBASE3; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_ADDING_ACIDBASE3, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
4369  102f a642          	ld	a,#66
4370  1031 b7ff          	ld	_main$L-1,a
4371  1033 3ffe          	clr	_main$L-2
4374  1035 b6bb          	ld	a,_main$L-69
4375  1037 beba          	ld	x,_main$L-70
4376  1039 ab20          	add	a,#32
4377  103b 88            	push	a
4378  103c 9f            	ld	a,x
4379  103d a904          	adc	a,#4
4380  103f 97            	ld	x,a
4381  1040 84            	pop	a
4382  1041 b7fd          	ld	_main$L-3,a
4383  1043 bffc          	ld	_main$L-4,x
4386  1045 a610          	ld	a,#16
4387  1047 b704          	ld	_memcpy$L+4,a
4388  1049 ae71          	ld	x,#high(L7021)
4389  104b bf02          	ld	_memcpy$L+2,x
4390  104d a671          	ld	a,#low(L7021)
4391  104f b703          	ld	_memcpy$L+3,a
4392  1051 a6bc          	ld	a,#_main$L-68
4393  1053 5f            	clr	x
4394  1054 cd0000        	call	_memcpy
4398  1057 aebc          	ld	x,#high(_main$L-68)
4399  1059 bf03          	ld	_writeEepromString$L+3,x
4400  105b a6bc          	ld	a,#low(_main$L-68)
4401  105d b704          	ld	_writeEepromString$L+4,a
4402  105f befc          	ld	x,_main$L-4
4403  1061 bf01          	ld	_writeEepromString$L+1,x
4404  1063 b6fd          	ld	a,_main$L-3
4405  1065 b702          	ld	_writeEepromString$L+2,a
4406  1067 a603          	ld	a,#3
4407  1069 cd0000        	call	_writeEepromString
4409                     ; 215 	woMsgIdx = MSG_IDX_POMP_ON; woAddress = woInitialAddressShort + ((WORD)woMsgIdx * (WORD)EEPROM_MSG_LENGTH_SHORT); memcpy(strMessage, MSG_VALUE_POMP_ON, EEPROM_MSG_LENGTH_SHORT); writeEepromString(EEPROM_ADR,woAddress, strMessage);
4411  106c a643          	ld	a,#67
4412  106e b7ff          	ld	_main$L-1,a
4413  1070 3ffe          	clr	_main$L-2
4416  1072 b6bb          	ld	a,_main$L-69
4417  1074 beba          	ld	x,_main$L-70
4418  1076 ab30          	add	a,#48
4419  1078 88            	push	a
4420  1079 9f            	ld	a,x
4421  107a a904          	adc	a,#4
4422  107c 97            	ld	x,a
4423  107d 84            	pop	a
4424  107e b7fd          	ld	_main$L-3,a
4425  1080 bffc          	ld	_main$L-4,x
4428  1082 a610          	ld	a,#16
4429  1084 b704          	ld	_memcpy$L+4,a
4430  1086 ae67          	ld	x,#high(L1121)
4431  1088 bf02          	ld	_memcpy$L+2,x
4432  108a a667          	ld	a,#low(L1121)
4433  108c b703          	ld	_memcpy$L+3,a
4434  108e a6bc          	ld	a,#_main$L-68
4435  1090 5f            	clr	x
4436  1091 cd0000        	call	_memcpy
4440  1094 aebc          	ld	x,#high(_main$L-68)
4441  1096 bf03          	ld	_writeEepromString$L+3,x
4442  1098 a6bc          	ld	a,#low(_main$L-68)
4443  109a b704          	ld	_writeEepromString$L+4,a
4444  109c befc          	ld	x,_main$L-4
4445  109e bf01          	ld	_writeEepromString$L+1,x
4446  10a0 b6fd          	ld	a,_main$L-3
4447  10a2 b702          	ld	_writeEepromString$L+2,a
4448  10a4 a603          	ld	a,#3
4449  10a6 cd0000        	call	_writeEepromString
4451                     ; 217 	_bset(_Pa_Led_D2, _Pin_Led_D2);
4453  10a9 1c0c          	bset	_PEDR,#6
4454                     ; 218 	woMsgIdx = MSG_IDX_ADDING_SOLVENT2; woAddress = woInitialAddressNormal + ((WORD)(woMsgIdx-EEPROM_MIN_INDEX_NORMAL) * (WORD)EEPROM_MSG_LENGTH_NORMAL); memcpy(strMessage, MSG_VALUE_ADDING_SOLVENT2, EEPROM_MSG_LENGTH_NORMAL); writeEepromString(EEPROM_ADR,woAddress, strMessage);
4456  10ab a644          	ld	a,#68
4457  10ad b7ff          	ld	_main$L-1,a
4458  10af 3ffe          	clr	_main$L-2
4461  10b1 beb8          	ld	x,_main$L-72
4462  10b3 bffc          	ld	_main$L-4,x
4463  10b5 b6b9          	ld	a,_main$L-71
4464  10b7 b7fd          	ld	_main$L-3,a
4467  10b9 a620          	ld	a,#32
4468  10bb b704          	ld	_memcpy$L+4,a
4469  10bd aee2          	ld	x,#high(L1711)
4470  10bf bf02          	ld	_memcpy$L+2,x
4471  10c1 a6e2          	ld	a,#low(L1711)
4472  10c3 b703          	ld	_memcpy$L+3,a
4473  10c5 a6bc          	ld	a,#_main$L-68
4474  10c7 5f            	clr	x
4475  10c8 cd0000        	call	_memcpy
4479  10cb aebc          	ld	x,#high(_main$L-68)
4480  10cd bf03          	ld	_writeEepromString$L+3,x
4481  10cf a6bc          	ld	a,#low(_main$L-68)
4482  10d1 b704          	ld	_writeEepromString$L+4,a
4483  10d3 befc          	ld	x,_main$L-4
4484  10d5 bf01          	ld	_writeEepromString$L+1,x
4485  10d7 b6fd          	ld	a,_main$L-3
4486  10d9 b702          	ld	_writeEepromString$L+2,a
4487  10db a603          	ld	a,#3
4488  10dd cd0000        	call	_writeEepromString
4490                     ; 219 	woMsgIdx = MSG_IDX_ADDING_ACIDBASE2; woAddress = woInitialAddressNormal + ((WORD)(woMsgIdx-EEPROM_MIN_INDEX_NORMAL) * (WORD)EEPROM_MSG_LENGTH_NORMAL); memcpy(strMessage, MSG_VALUE_ADDING_ACIDBASE2, EEPROM_MSG_LENGTH_NORMAL); writeEepromString(EEPROM_ADR,woAddress, strMessage);
4492  10e0 a645          	ld	a,#69
4493  10e2 b7ff          	ld	_main$L-1,a
4494  10e4 3ffe          	clr	_main$L-2
4497  10e6 b6b9          	ld	a,_main$L-71
4498  10e8 beb8          	ld	x,_main$L-72
4499  10ea ab20          	add	a,#32
4500  10ec 2401          	jrnc	L64
4501  10ee 5c            	inc	x
4502  10ef               L64:
4503  10ef b7fd          	ld	_main$L-3,a
4504  10f1 bffc          	ld	_main$L-4,x
4507  10f3 a620          	ld	a,#32
4508  10f5 b704          	ld	_memcpy$L+4,a
4509  10f7 ae59          	ld	x,#high(L3121)
4510  10f9 bf02          	ld	_memcpy$L+2,x
4511  10fb a659          	ld	a,#low(L3121)
4512  10fd b703          	ld	_memcpy$L+3,a
4513  10ff a6bc          	ld	a,#_main$L-68
4514  1101 5f            	clr	x
4515  1102 cd0000        	call	_memcpy
4519  1105 aebc          	ld	x,#high(_main$L-68)
4520  1107 bf03          	ld	_writeEepromString$L+3,x
4521  1109 a6bc          	ld	a,#low(_main$L-68)
4522  110b b704          	ld	_writeEepromString$L+4,a
4523  110d befc          	ld	x,_main$L-4
4524  110f bf01          	ld	_writeEepromString$L+1,x
4525  1111 b6fd          	ld	a,_main$L-3
4526  1113 b702          	ld	_writeEepromString$L+2,a
4527  1115 a603          	ld	a,#3
4528  1117 cd0000        	call	_writeEepromString
4530                     ; 220 	woMsgIdx = MSG_IDX_GENERIC_ERROR; woAddress = woInitialAddressNormal + ((WORD)(woMsgIdx-EEPROM_MIN_INDEX_NORMAL) * (WORD)EEPROM_MSG_LENGTH_NORMAL); memcpy(strMessage, MSG_VALUE_GENERIC_ERROR, EEPROM_MSG_LENGTH_NORMAL); writeEepromString(EEPROM_ADR,woAddress, strMessage);
4532  111a a646          	ld	a,#70
4533  111c b7ff          	ld	_main$L-1,a
4534  111e 3ffe          	clr	_main$L-2
4537  1120 b6b9          	ld	a,_main$L-71
4538  1122 beb8          	ld	x,_main$L-72
4539  1124 ab40          	add	a,#64
4540  1126 2401          	jrnc	L05
4541  1128 5c            	inc	x
4542  1129               L05:
4543  1129 b7fd          	ld	_main$L-3,a
4544  112b bffc          	ld	_main$L-4,x
4547  112d a620          	ld	a,#32
4548  112f b704          	ld	_memcpy$L+4,a
4549  1131 ae45          	ld	x,#high(L5121)
4550  1133 bf02          	ld	_memcpy$L+2,x
4551  1135 a645          	ld	a,#low(L5121)
4552  1137 b703          	ld	_memcpy$L+3,a
4553  1139 a6bc          	ld	a,#_main$L-68
4554  113b 5f            	clr	x
4555  113c cd0000        	call	_memcpy
4559  113f aebc          	ld	x,#high(_main$L-68)
4560  1141 bf03          	ld	_writeEepromString$L+3,x
4561  1143 a6bc          	ld	a,#low(_main$L-68)
4562  1145 b704          	ld	_writeEepromString$L+4,a
4563  1147 befc          	ld	x,_main$L-4
4564  1149 bf01          	ld	_writeEepromString$L+1,x
4565  114b b6fd          	ld	a,_main$L-3
4566  114d b702          	ld	_writeEepromString$L+2,a
4567  114f a603          	ld	a,#3
4568  1151 cd0000        	call	_writeEepromString
4570                     ; 221 	woMsgIdx = MSG_IDX_OUT_OF_BOUNDS; woAddress = woInitialAddressNormal + ((WORD)(woMsgIdx-EEPROM_MIN_INDEX_NORMAL) * (WORD)EEPROM_MSG_LENGTH_NORMAL); memcpy(strMessage, MSG_VALUE_OUT_OF_BOUNDS, EEPROM_MSG_LENGTH_NORMAL); writeEepromString(EEPROM_ADR,woAddress, strMessage);
4572  1154 a647          	ld	a,#71
4573  1156 b7ff          	ld	_main$L-1,a
4574  1158 3ffe          	clr	_main$L-2
4577  115a b6b9          	ld	a,_main$L-71
4578  115c beb8          	ld	x,_main$L-72
4579  115e ab60          	add	a,#96
4580  1160 2401          	jrnc	L25
4581  1162 5c            	inc	x
4582  1163               L25:
4583  1163 b7fd          	ld	_main$L-3,a
4584  1165 bffc          	ld	_main$L-4,x
4587  1167 a620          	ld	a,#32
4588  1169 b704          	ld	_memcpy$L+4,a
4589  116b ae32          	ld	x,#high(L7121)
4590  116d bf02          	ld	_memcpy$L+2,x
4591  116f a632          	ld	a,#low(L7121)
4592  1171 b703          	ld	_memcpy$L+3,a
4593  1173 a6bc          	ld	a,#_main$L-68
4594  1175 5f            	clr	x
4595  1176 cd0000        	call	_memcpy
4599  1179 aebc          	ld	x,#high(_main$L-68)
4600  117b bf03          	ld	_writeEepromString$L+3,x
4601  117d a6bc          	ld	a,#low(_main$L-68)
4602  117f b704          	ld	_writeEepromString$L+4,a
4603  1181 befc          	ld	x,_main$L-4
4604  1183 bf01          	ld	_writeEepromString$L+1,x
4605  1185 b6fd          	ld	a,_main$L-3
4606  1187 b702          	ld	_writeEepromString$L+2,a
4607  1189 a603          	ld	a,#3
4608  118b cd0000        	call	_writeEepromString
4610                     ; 222 	woMsgIdx = MSG_IDX_VALVES_DELAY; woAddress = woInitialAddressNormal + ((WORD)(woMsgIdx-EEPROM_MIN_INDEX_NORMAL) * (WORD)EEPROM_MSG_LENGTH_NORMAL); memcpy(strMessage, MSG_VALUE_VALVES_DELAY, EEPROM_MSG_LENGTH_NORMAL); writeEepromString(EEPROM_ADR,woAddress, strMessage);
4612  118e a648          	ld	a,#72
4613  1190 b7ff          	ld	_main$L-1,a
4614  1192 3ffe          	clr	_main$L-2
4617  1194 b6b9          	ld	a,_main$L-71
4618  1196 beb8          	ld	x,_main$L-72
4619  1198 ab80          	add	a,#128
4620  119a 2401          	jrnc	L45
4621  119c 5c            	inc	x
4622  119d               L45:
4623  119d b7fd          	ld	_main$L-3,a
4624  119f bffc          	ld	_main$L-4,x
4627  11a1 a620          	ld	a,#32
4628  11a3 b704          	ld	_memcpy$L+4,a
4629  11a5 ae1f          	ld	x,#high(L1221)
4630  11a7 bf02          	ld	_memcpy$L+2,x
4631  11a9 a61f          	ld	a,#low(L1221)
4632  11ab b703          	ld	_memcpy$L+3,a
4633  11ad a6bc          	ld	a,#_main$L-68
4634  11af 5f            	clr	x
4635  11b0 cd0000        	call	_memcpy
4639  11b3 aebc          	ld	x,#high(_main$L-68)
4640  11b5 bf03          	ld	_writeEepromString$L+3,x
4641  11b7 a6bc          	ld	a,#low(_main$L-68)
4642  11b9 b704          	ld	_writeEepromString$L+4,a
4643  11bb befc          	ld	x,_main$L-4
4644  11bd bf01          	ld	_writeEepromString$L+1,x
4645  11bf b6fd          	ld	a,_main$L-3
4646  11c1 b702          	ld	_writeEepromString$L+2,a
4647  11c3 a603          	ld	a,#3
4648  11c5 cd0000        	call	_writeEepromString
4650                     ; 223 	woMsgIdx = MSG_IDX_INTERMEASURING; woAddress = woInitialAddressNormal + ((WORD)(woMsgIdx-EEPROM_MIN_INDEX_NORMAL) * (WORD)EEPROM_MSG_LENGTH_NORMAL); memcpy(strMessage, MSG_VALUE_INTERMEASURING, EEPROM_MSG_LENGTH_NORMAL); writeEepromString(EEPROM_ADR,woAddress, strMessage);
4652  11c8 a649          	ld	a,#73
4653  11ca b7ff          	ld	_main$L-1,a
4654  11cc 3ffe          	clr	_main$L-2
4657  11ce b6b9          	ld	a,_main$L-71
4658  11d0 beb8          	ld	x,_main$L-72
4659  11d2 aba0          	add	a,#160
4660  11d4 2401          	jrnc	L65
4661  11d6 5c            	inc	x
4662  11d7               L65:
4663  11d7 b7fd          	ld	_main$L-3,a
4664  11d9 bffc          	ld	_main$L-4,x
4667  11db a620          	ld	a,#32
4668  11dd b704          	ld	_memcpy$L+4,a
4669  11df ae0e          	ld	x,#high(L3221)
4670  11e1 bf02          	ld	_memcpy$L+2,x
4671  11e3 a60e          	ld	a,#low(L3221)
4672  11e5 b703          	ld	_memcpy$L+3,a
4673  11e7 a6bc          	ld	a,#_main$L-68
4674  11e9 5f            	clr	x
4675  11ea cd0000        	call	_memcpy
4679  11ed aebc          	ld	x,#high(_main$L-68)
4680  11ef bf03          	ld	_writeEepromString$L+3,x
4681  11f1 a6bc          	ld	a,#low(_main$L-68)
4682  11f3 b704          	ld	_writeEepromString$L+4,a
4683  11f5 befc          	ld	x,_main$L-4
4684  11f7 bf01          	ld	_writeEepromString$L+1,x
4685  11f9 b6fd          	ld	a,_main$L-3
4686  11fb b702          	ld	_writeEepromString$L+2,a
4687  11fd a603          	ld	a,#3
4688  11ff cd0000        	call	_writeEepromString
4690                     ; 224 	woMsgIdx = MSG_IDX_ADDING_SOLVENT; woAddress = woInitialAddressNormal + ((WORD)(woMsgIdx-EEPROM_MIN_INDEX_NORMAL) * (WORD)EEPROM_MSG_LENGTH_NORMAL); memcpy(strMessage, MSG_VALUE_ADDING_SOLVENT, EEPROM_MSG_LENGTH_NORMAL); writeEepromString(EEPROM_ADR,woAddress, strMessage);
4692  1202 a64a          	ld	a,#74
4693  1204 b7ff          	ld	_main$L-1,a
4694  1206 3ffe          	clr	_main$L-2
4697  1208 b6b9          	ld	a,_main$L-71
4698  120a beb8          	ld	x,_main$L-72
4699  120c abc0          	add	a,#192
4700  120e 2401          	jrnc	L06
4701  1210 5c            	inc	x
4702  1211               L06:
4703  1211 b7fd          	ld	_main$L-3,a
4704  1213 bffc          	ld	_main$L-4,x
4707  1215 a620          	ld	a,#32
4708  1217 b704          	ld	_memcpy$L+4,a
4709  1219 aef1          	ld	x,#high(L5221)
4710  121b bf02          	ld	_memcpy$L+2,x
4711  121d a6f1          	ld	a,#low(L5221)
4712  121f b703          	ld	_memcpy$L+3,a
4713  1221 a6bc          	ld	a,#_main$L-68
4714  1223 5f            	clr	x
4715  1224 cd0000        	call	_memcpy
4719  1227 aebc          	ld	x,#high(_main$L-68)
4720  1229 bf03          	ld	_writeEepromString$L+3,x
4721  122b a6bc          	ld	a,#low(_main$L-68)
4722  122d b704          	ld	_writeEepromString$L+4,a
4723  122f befc          	ld	x,_main$L-4
4724  1231 bf01          	ld	_writeEepromString$L+1,x
4725  1233 b6fd          	ld	a,_main$L-3
4726  1235 b702          	ld	_writeEepromString$L+2,a
4727  1237 a603          	ld	a,#3
4728  1239 cd0000        	call	_writeEepromString
4730                     ; 225 	woMsgIdx = MSG_IDX_PARAMETER_SAVED; woAddress = woInitialAddressNormal + ((WORD)(woMsgIdx-EEPROM_MIN_INDEX_NORMAL) * (WORD)EEPROM_MSG_LENGTH_NORMAL); memcpy(strMessage, MSG_VALUE_PARAMETER_SAVED, EEPROM_MSG_LENGTH_NORMAL); writeEepromString(EEPROM_ADR,woAddress, strMessage);
4732  123c a64b          	ld	a,#75
4733  123e b7ff          	ld	_main$L-1,a
4734  1240 3ffe          	clr	_main$L-2
4737  1242 b6b9          	ld	a,_main$L-71
4738  1244 beb8          	ld	x,_main$L-72
4739  1246 abe0          	add	a,#224
4740  1248 2401          	jrnc	L26
4741  124a 5c            	inc	x
4742  124b               L26:
4743  124b b7fd          	ld	_main$L-3,a
4744  124d bffc          	ld	_main$L-4,x
4747  124f a620          	ld	a,#32
4748  1251 b704          	ld	_memcpy$L+4,a
4749  1253 aedb          	ld	x,#high(L7221)
4750  1255 bf02          	ld	_memcpy$L+2,x
4751  1257 a6db          	ld	a,#low(L7221)
4752  1259 b703          	ld	_memcpy$L+3,a
4753  125b a6bc          	ld	a,#_main$L-68
4754  125d 5f            	clr	x
4755  125e cd0000        	call	_memcpy
4759  1261 aebc          	ld	x,#high(_main$L-68)
4760  1263 bf03          	ld	_writeEepromString$L+3,x
4761  1265 a6bc          	ld	a,#low(_main$L-68)
4762  1267 b704          	ld	_writeEepromString$L+4,a
4763  1269 befc          	ld	x,_main$L-4
4764  126b bf01          	ld	_writeEepromString$L+1,x
4765  126d b6fd          	ld	a,_main$L-3
4766  126f b702          	ld	_writeEepromString$L+2,a
4767  1271 a603          	ld	a,#3
4768  1273 cd0000        	call	_writeEepromString
4770                     ; 226 	woMsgIdx = MSG_IDX_TOO_DIFFERENT; woAddress = woInitialAddressNormal + ((WORD)(woMsgIdx-EEPROM_MIN_INDEX_NORMAL) * (WORD)EEPROM_MSG_LENGTH_NORMAL); memcpy(strMessage, MSG_VALUE_TOO_DIFFERENT, EEPROM_MSG_LENGTH_NORMAL); writeEepromString(EEPROM_ADR,woAddress, strMessage);
4772  1276 a64c          	ld	a,#76
4773  1278 b7ff          	ld	_main$L-1,a
4774  127a 3ffe          	clr	_main$L-2
4777  127c b6b9          	ld	a,_main$L-71
4778  127e beb8          	ld	x,_main$L-72
4779  1280 ab00          	add	a,#0
4780  1282 88            	push	a
4781  1283 9f            	ld	a,x
4782  1284 a901          	adc	a,#1
4783  1286 97            	ld	x,a
4784  1287 84            	pop	a
4785  1288 b7fd          	ld	_main$L-3,a
4786  128a bffc          	ld	_main$L-4,x
4789  128c a620          	ld	a,#32
4790  128e b704          	ld	_memcpy$L+4,a
4791  1290 aec8          	ld	x,#high(L1321)
4792  1292 bf02          	ld	_memcpy$L+2,x
4793  1294 a6c8          	ld	a,#low(L1321)
4794  1296 b703          	ld	_memcpy$L+3,a
4795  1298 a6bc          	ld	a,#_main$L-68
4796  129a 5f            	clr	x
4797  129b cd0000        	call	_memcpy
4801  129e aebc          	ld	x,#high(_main$L-68)
4802  12a0 bf03          	ld	_writeEepromString$L+3,x
4803  12a2 a6bc          	ld	a,#low(_main$L-68)
4804  12a4 b704          	ld	_writeEepromString$L+4,a
4805  12a6 befc          	ld	x,_main$L-4
4806  12a8 bf01          	ld	_writeEepromString$L+1,x
4807  12aa b6fd          	ld	a,_main$L-3
4808  12ac b702          	ld	_writeEepromString$L+2,a
4809  12ae a603          	ld	a,#3
4810  12b0 cd0000        	call	_writeEepromString
4812                     ; 227 	woMsgIdx = MSG_IDX_TIMEOUT_MEASURE; woAddress = woInitialAddressNormal + ((WORD)(woMsgIdx-EEPROM_MIN_INDEX_NORMAL) * (WORD)EEPROM_MSG_LENGTH_NORMAL); memcpy(strMessage, MSG_VALUE_TIMEOUT_MEASURE, EEPROM_MSG_LENGTH_NORMAL); writeEepromString(EEPROM_ADR,woAddress, strMessage);
4814  12b3 a64d          	ld	a,#77
4815  12b5 b7ff          	ld	_main$L-1,a
4816  12b7 3ffe          	clr	_main$L-2
4819  12b9 b6b9          	ld	a,_main$L-71
4820  12bb beb8          	ld	x,_main$L-72
4821  12bd ab20          	add	a,#32
4822  12bf 88            	push	a
4823  12c0 9f            	ld	a,x
4824  12c1 a901          	adc	a,#1
4825  12c3 97            	ld	x,a
4826  12c4 84            	pop	a
4827  12c5 b7fd          	ld	_main$L-3,a
4828  12c7 bffc          	ld	_main$L-4,x
4831  12c9 a620          	ld	a,#32
4832  12cb b704          	ld	_memcpy$L+4,a
4833  12cd aeb7          	ld	x,#high(L3321)
4834  12cf bf02          	ld	_memcpy$L+2,x
4835  12d1 a6b7          	ld	a,#low(L3321)
4836  12d3 b703          	ld	_memcpy$L+3,a
4837  12d5 a6bc          	ld	a,#_main$L-68
4838  12d7 5f            	clr	x
4839  12d8 cd0000        	call	_memcpy
4843  12db aebc          	ld	x,#high(_main$L-68)
4844  12dd bf03          	ld	_writeEepromString$L+3,x
4845  12df a6bc          	ld	a,#low(_main$L-68)
4846  12e1 b704          	ld	_writeEepromString$L+4,a
4847  12e3 befc          	ld	x,_main$L-4
4848  12e5 bf01          	ld	_writeEepromString$L+1,x
4849  12e7 b6fd          	ld	a,_main$L-3
4850  12e9 b702          	ld	_writeEepromString$L+2,a
4851  12eb a603          	ld	a,#3
4852  12ed cd0000        	call	_writeEepromString
4854                     ; 228 	woMsgIdx = MSG_IDX_WASHING_ASK; woAddress = woInitialAddressNormal + ((WORD)(woMsgIdx-EEPROM_MIN_INDEX_NORMAL) * (WORD)EEPROM_MSG_LENGTH_NORMAL); memcpy(strMessage, MSG_VALUE_WASHING_ASK, EEPROM_MSG_LENGTH_NORMAL); writeEepromString(EEPROM_ADR,woAddress, strMessage);
4856  12f0 a64e          	ld	a,#78
4857  12f2 b7ff          	ld	_main$L-1,a
4858  12f4 3ffe          	clr	_main$L-2
4861  12f6 b6b9          	ld	a,_main$L-71
4862  12f8 beb8          	ld	x,_main$L-72
4863  12fa ab40          	add	a,#64
4864  12fc 88            	push	a
4865  12fd 9f            	ld	a,x
4866  12fe a901          	adc	a,#1
4867  1300 97            	ld	x,a
4868  1301 84            	pop	a
4869  1302 b7fd          	ld	_main$L-3,a
4870  1304 bffc          	ld	_main$L-4,x
4873  1306 a620          	ld	a,#32
4874  1308 b704          	ld	_memcpy$L+4,a
4875  130a aeab          	ld	x,#high(L5321)
4876  130c bf02          	ld	_memcpy$L+2,x
4877  130e a6ab          	ld	a,#low(L5321)
4878  1310 b703          	ld	_memcpy$L+3,a
4879  1312 a6bc          	ld	a,#_main$L-68
4880  1314 5f            	clr	x
4881  1315 cd0000        	call	_memcpy
4885  1318 aebc          	ld	x,#high(_main$L-68)
4886  131a bf03          	ld	_writeEepromString$L+3,x
4887  131c a6bc          	ld	a,#low(_main$L-68)
4888  131e b704          	ld	_writeEepromString$L+4,a
4889  1320 befc          	ld	x,_main$L-4
4890  1322 bf01          	ld	_writeEepromString$L+1,x
4891  1324 b6fd          	ld	a,_main$L-3
4892  1326 b702          	ld	_writeEepromString$L+2,a
4893  1328 a603          	ld	a,#3
4894  132a cd0000        	call	_writeEepromString
4896                     ; 229 	woMsgIdx = MSG_IDX_MEASURING; woAddress = woInitialAddressNormal + ((WORD)(woMsgIdx-EEPROM_MIN_INDEX_NORMAL) * (WORD)EEPROM_MSG_LENGTH_NORMAL); memcpy(strMessage, MSG_VALUE_MEASURING, EEPROM_MSG_LENGTH_NORMAL); writeEepromString(EEPROM_ADR,woAddress, strMessage);
4898  132d a64f          	ld	a,#79
4899  132f b7ff          	ld	_main$L-1,a
4900  1331 3ffe          	clr	_main$L-2
4903  1333 b6b9          	ld	a,_main$L-71
4904  1335 beb8          	ld	x,_main$L-72
4905  1337 ab60          	add	a,#96
4906  1339 88            	push	a
4907  133a 9f            	ld	a,x
4908  133b a901          	adc	a,#1
4909  133d 97            	ld	x,a
4910  133e 84            	pop	a
4911  133f b7fd          	ld	_main$L-3,a
4912  1341 bffc          	ld	_main$L-4,x
4915  1343 a620          	ld	a,#32
4916  1345 b704          	ld	_memcpy$L+4,a
4917  1347 aea2          	ld	x,#high(L7321)
4918  1349 bf02          	ld	_memcpy$L+2,x
4919  134b a6a2          	ld	a,#low(L7321)
4920  134d b703          	ld	_memcpy$L+3,a
4921  134f a6bc          	ld	a,#_main$L-68
4922  1351 5f            	clr	x
4923  1352 cd0000        	call	_memcpy
4927  1355 aebc          	ld	x,#high(_main$L-68)
4928  1357 bf03          	ld	_writeEepromString$L+3,x
4929  1359 a6bc          	ld	a,#low(_main$L-68)
4930  135b b704          	ld	_writeEepromString$L+4,a
4931  135d befc          	ld	x,_main$L-4
4932  135f bf01          	ld	_writeEepromString$L+1,x
4933  1361 b6fd          	ld	a,_main$L-3
4934  1363 b702          	ld	_writeEepromString$L+2,a
4935  1365 a603          	ld	a,#3
4936  1367 cd0000        	call	_writeEepromString
4938                     ; 230 	woMsgIdx = MSG_IDX_CONTACT_YOUR_PROVIDER; woAddress = woInitialAddressNormal + ((WORD)(woMsgIdx-EEPROM_MIN_INDEX_NORMAL) * (WORD)EEPROM_MSG_LENGTH_NORMAL); memcpy(strMessage, MSG_VALUE_CONTACT_YOUR_PROVIDER, EEPROM_MSG_LENGTH_NORMAL); writeEepromString(EEPROM_ADR,woAddress, strMessage);
4940  136a a650          	ld	a,#80
4941  136c b7ff          	ld	_main$L-1,a
4942  136e 3ffe          	clr	_main$L-2
4945  1370 b6b9          	ld	a,_main$L-71
4946  1372 beb8          	ld	x,_main$L-72
4947  1374 ab80          	add	a,#128
4948  1376 88            	push	a
4949  1377 9f            	ld	a,x
4950  1378 a901          	adc	a,#1
4951  137a 97            	ld	x,a
4952  137b 84            	pop	a
4953  137c b7fd          	ld	_main$L-3,a
4954  137e bffc          	ld	_main$L-4,x
4957  1380 a620          	ld	a,#32
4958  1382 b704          	ld	_memcpy$L+4,a
4959  1384 ae72          	ld	x,#high(L1421)
4960  1386 bf02          	ld	_memcpy$L+2,x
4961  1388 a672          	ld	a,#low(L1421)
4962  138a b703          	ld	_memcpy$L+3,a
4963  138c a6bc          	ld	a,#_main$L-68
4964  138e 5f            	clr	x
4965  138f cd0000        	call	_memcpy
4969  1392 aebc          	ld	x,#high(_main$L-68)
4970  1394 bf03          	ld	_writeEepromString$L+3,x
4971  1396 a6bc          	ld	a,#low(_main$L-68)
4972  1398 b704          	ld	_writeEepromString$L+4,a
4973  139a befc          	ld	x,_main$L-4
4974  139c bf01          	ld	_writeEepromString$L+1,x
4975  139e b6fd          	ld	a,_main$L-3
4976  13a0 b702          	ld	_writeEepromString$L+2,a
4977  13a2 a603          	ld	a,#3
4978  13a4 cd0000        	call	_writeEepromString
4980                     ; 231 	woMsgIdx = MSG_IDX_PRESS_ANY_KEY_TO_STOP; woAddress = woInitialAddressNormal + ((WORD)(woMsgIdx-EEPROM_MIN_INDEX_NORMAL) * (WORD)EEPROM_MSG_LENGTH_NORMAL); memcpy(strMessage, MSG_VALUE_PRESS_ANY_KEY_TO_STOP, EEPROM_MSG_LENGTH_NORMAL); writeEepromString(EEPROM_ADR,woAddress, strMessage);
4982  13a7 a651          	ld	a,#81
4983  13a9 b7ff          	ld	_main$L-1,a
4984  13ab 3ffe          	clr	_main$L-2
4987  13ad b6b9          	ld	a,_main$L-71
4988  13af beb8          	ld	x,_main$L-72
4989  13b1 aba0          	add	a,#160
4990  13b3 88            	push	a
4991  13b4 9f            	ld	a,x
4992  13b5 a901          	adc	a,#1
4993  13b7 97            	ld	x,a
4994  13b8 84            	pop	a
4995  13b9 b7fd          	ld	_main$L-3,a
4996  13bb bffc          	ld	_main$L-4,x
4999  13bd a620          	ld	a,#32
5000  13bf b704          	ld	_memcpy$L+4,a
5001  13c1 ae3a          	ld	x,#high(L3421)
5002  13c3 bf02          	ld	_memcpy$L+2,x
5003  13c5 a63a          	ld	a,#low(L3421)
5004  13c7 b703          	ld	_memcpy$L+3,a
5005  13c9 a6bc          	ld	a,#_main$L-68
5006  13cb 5f            	clr	x
5007  13cc cd0000        	call	_memcpy
5011  13cf aebc          	ld	x,#high(_main$L-68)
5012  13d1 bf03          	ld	_writeEepromString$L+3,x
5013  13d3 a6bc          	ld	a,#low(_main$L-68)
5014  13d5 b704          	ld	_writeEepromString$L+4,a
5015  13d7 befc          	ld	x,_main$L-4
5016  13d9 bf01          	ld	_writeEepromString$L+1,x
5017  13db b6fd          	ld	a,_main$L-3
5018  13dd b702          	ld	_writeEepromString$L+2,a
5019  13df a603          	ld	a,#3
5020  13e1 cd0000        	call	_writeEepromString
5022                     ; 232 	woMsgIdx = MSG_IDX_PRESS_ANY_KEY_TO_CONTINUE; woAddress = woInitialAddressNormal + ((WORD)(woMsgIdx-EEPROM_MIN_INDEX_NORMAL) * (WORD)EEPROM_MSG_LENGTH_NORMAL); memcpy(strMessage, MSG_VALUE_PRESS_ANY_KEY_TO_CONTINUE, EEPROM_MSG_LENGTH_NORMAL); writeEepromString(EEPROM_ADR,woAddress, strMessage);
5024  13e4 a652          	ld	a,#82
5025  13e6 b7ff          	ld	_main$L-1,a
5026  13e8 3ffe          	clr	_main$L-2
5029  13ea b6b9          	ld	a,_main$L-71
5030  13ec beb8          	ld	x,_main$L-72
5031  13ee abc0          	add	a,#192
5032  13f0 88            	push	a
5033  13f1 9f            	ld	a,x
5034  13f2 a901          	adc	a,#1
5035  13f4 97            	ld	x,a
5036  13f5 84            	pop	a
5037  13f6 b7fd          	ld	_main$L-3,a
5038  13f8 bffc          	ld	_main$L-4,x
5041  13fa a620          	ld	a,#32
5042  13fc b704          	ld	_memcpy$L+4,a
5043  13fe ae00          	ld	x,#high(L5421)
5044  1400 bf02          	ld	_memcpy$L+2,x
5045  1402 a600          	ld	a,#low(L5421)
5046  1404 b703          	ld	_memcpy$L+3,a
5047  1406 a6bc          	ld	a,#_main$L-68
5048  1408 5f            	clr	x
5049  1409 cd0000        	call	_memcpy
5053  140c aebc          	ld	x,#high(_main$L-68)
5054  140e bf03          	ld	_writeEepromString$L+3,x
5055  1410 a6bc          	ld	a,#low(_main$L-68)
5056  1412 b704          	ld	_writeEepromString$L+4,a
5057  1414 befc          	ld	x,_main$L-4
5058  1416 bf01          	ld	_writeEepromString$L+1,x
5059  1418 b6fd          	ld	a,_main$L-3
5060  141a b702          	ld	_writeEepromString$L+2,a
5061  141c a603          	ld	a,#3
5062  141e cd0000        	call	_writeEepromString
5064                     ; 235 	_bset(_Pa_Led_D1, _Pin_Led_D1);
5066  1421 1e0c          	bset	_PEDR,#7
5067                     ; 236 	_bset(_Pa_Led_D2, _Pin_Led_D2);
5069  1423 1c0c          	bset	_PEDR,#6
5070                     ; 237 	_bset(_Pa_Led_D3, _Pin_Led_D3);
5072  1425 1a0c          	bset	_PEDR,#5
5073                     ; 238 	_bset(_Pa_Led_D4, _Pin_Led_D4);
5075  1427 180c          	bset	_PEDR,#4
5076  1429               L7421:
5077                     ; 242 		Nop();
5080  1429 9d            nop
5083  142a 20fd          	jra	L7421
5095                     	xdef	_init
5096                     	xdef	_main
5097                     	xref	_memcpy
5098                     	xref	_writeEepromString
5099                     	xref	_eepromInit
5100                     .const:	section	.text
5101  0000               L5421:
5102  0000 426574e4      	dc.b	"Bet",228
5103  0004 746967656e20  	dc.b	"tigen Sie jeden m",246
5104  0016 676c69636865  	dc.b	"glichen Schl",252
5105  0023 7373656c2c20  	dc.b	"ssel, um fortzufah"
5106  0035 72656e2000    	dc.b	"ren ",0
5107  003a               L3421:
5108  003a 426574e4      	dc.b	"Bet",228
5109  003e 746967656e20  	dc.b	"tigen Sie jeden m",246
5110  0050 676c69636865  	dc.b	"glichen Schl",252
5111  005d 7373656c2c20  	dc.b	"ssel, um zu stoppe"
5112  006f 6e2000        	dc.b	"n ",0
5113  0072               L1421:
5114  0072 54726574656e  	dc.b	"Treten Sie mit Ihr"
5115  0084 656d204c6965  	dc.b	"em Lieferanten in "
5116  0096 56657262696e  	dc.b	"Verbindung ",0
5117  00a2               L7321:
5118  00a2 4d657373656e  	dc.b	"Messende",0
5119  00ab               L5321:
5120  00ab 5265696e6967  	dc.b	"Reinigung? ",0
5121  00b7               L3321:
5122  00b7 416273636861  	dc.b	"Abschaltung Mass",0
5123  00c8               L1321:
5124  00c8 7a7520756e74  	dc.b	"zu unterschiedlich",0
5125  00db               L7221:
5126  00db 506172616d65  	dc.b	"Parameter speicher"
5127  00ed 74652000      	dc.b	"te ",0
5128  00f1               L5221:
5129  00f1 416464696572  	dc.b	"Addieren Des L",246
5130  0100 73756e67736d  	dc.b	"sungsmittels ",0
5131  010e               L3221:
5132  010e 5a7769736368  	dc.b	"Zwischen-Messen ",0
5133  011f               L1221:
5134  011f 56656e74696c  	dc.b	"Ventile verzogert ",0
5135  0132               L7121:
5136  0132 617573204772  	dc.b	"aus Grenzen heraus",0
5137  0145               L5121:
5138  0145 47656e657269  	dc.b	"Generische St",246
5139  0153 72756e672000  	dc.b	"rung ",0
5140  0159               L3121:
5141  0159 416464696572  	dc.b	"Addieren Der ",0
5142  0167               L1121:
5143  0167 50756d706520  	dc.b	"Pumpe auf",0
5144  0171               L7021:
5145  0171 53617572652d  	dc.b	"Saure-Unterseite",0
5146  0182               L5021:
5147  0182 4c6f73756e67  	dc.b	"Losungsmittels",0
5148  0191               L3021:
5149  0191 4d696e205465  	dc.b	"Min Temperatur ",0
5150  01a1               L1021:
5151  01a1 4d6178205465  	dc.b	"Max Temperatur ",0
5152  01b1               L7711:
5153  01b1 53617572652d  	dc.b	"Saure-Unterseite? ",0
5154  01c4               L5711:
5155  01c4 416464696572  	dc.b	"Addieren Der",0
5156  01d1               L3711:
5157  01d1 4c6f73756e67  	dc.b	"Losungsmittels? ",0
5158  01e2               L1711:
5159  01e2 416464696572  	dc.b	"Addieren Des",0
5160  01ef               L7611:
5161  01ef 4a6f62206765  	dc.b	"Job geladen ",0
5162  01fc               L5611:
5163  01fc 4a6f62206765  	dc.b	"Job gespeichert ",0
5164  020d               L3611:
5165  020d 70482045696e  	dc.b	"pH Ein-Aus ",0
5166  0219               L1611:
5167  0219 416c6c61726d  	dc.b	"Allarm",0
5168  0220               L7511:
5169  0220 4d696e205669  	dc.b	"Min Viskositat",0
5170  022f               L5511:
5171  022f 4d6178205669  	dc.b	"Max Viskositat",0
5172  023e               L3511:
5173  023e 4d696e204b6f  	dc.b	"Min Korrektur ",0
5174  024d               L1511:
5175  024d 4d6178204b6f  	dc.b	"Max Korrektur ",0
5176  025c               L7411:
5177  025c 7048207a7520  	dc.b	"pH zu unterschiedl"
5178  026e 6963682000    	dc.b	"ich ",0
5179  0273               L5411:
5180  0273 4b6f6e666967  	dc.b	"Konfiguration ",0
5181  0282               L3411:
5182  0282 4c6173747363  	dc.b	"LastscJob ",0
5183  028d               L1411:
5184  028d 417573736572  	dc.b	"Ausser Job ",0
5185  0299               L7311:
5186  0299 45726d6f676c  	dc.b	"Ermoglichen pH?",0
5187  02a9               L5311:
5188  02a9 54656d706572  	dc.b	"Temperatur ",0
5189  02b5               L3311:
5190  02b5 53617572652d  	dc.b	"Saure-Unterseite ",0
5191  02c7               L1311:
5192  02c7 5669736b6f73  	dc.b	"Viskositat",0
5193  02d2               L7211:
5194  02d2 506f72747567  	dc.b	"Portugues",0
5195  02dc               L5211:
5196  02dc 506172616d65  	dc.b	"Parameter ",0
5197  02e7               L3211:
5198  02e7 53746f72756e  	dc.b	"Storung 15",0
5199  02f2               L1211:
5200  02f2 53746f72756e  	dc.b	"Storung 14",0
5201  02fd               L7111:
5202  02fd 53746f72756e  	dc.b	"Storung 13",0
5203  0308               L5111:
5204  0308 53746f72756e  	dc.b	"Storung 12",0
5205  0313               L3111:
5206  0313 53746f72756e  	dc.b	"Storung 11",0
5207  031e               L1111:
5208  031e 53746f72756e  	dc.b	"Storung 10",0
5209  0329               L7011:
5210  0329 53746f72756e  	dc.b	"Storung 09",0
5211  0334               L5011:
5212  0334 53746f72756e  	dc.b	"Storung 08",0
5213  033f               L3011:
5214  033f 53746f72756e  	dc.b	"Storung 07",0
5215  034a               L1011:
5216  034a 53746f72756e  	dc.b	"Storung 06",0
5217  0355               L7701:
5218  0355 53746f72756e  	dc.b	"Storung 05",0
5219  0360               L5701:
5220  0360 53746f72756e  	dc.b	"Storung 04",0
5221  036b               L3701:
5222  036b 53746f72756e  	dc.b	"Storung 03",0
5223  0376               L1701:
5224  0376 53746f72756e  	dc.b	"Storung 02",0
5225  0381               L7601:
5226  0381 53746f72756e  	dc.b	"Storung 01",0
5227  038c               L5601:
5228  038c 53746f72756e  	dc.b	"Storung 00",0
5229  0397               L3601:
5230  0397 4b616c696272  	dc.b	"Kalibrierung ",0
5231  03a5               L1601:
5232  03a5 4c6f73756e67  	dc.b	"Losungsmittel ",0
5233  03b4               L7501:
5234  03b4 537072616368  	dc.b	"Sprache 8",0
5235  03be               L5501:
5236  03be 537072616368  	dc.b	"Sprache 7 ",0
5237  03c9               L3501:
5238  03c9 5265696e6967  	dc.b	"Reinigung ",0
5239  03d4               L1501:
5240  03d4 4974616c6961  	dc.b	"Italiano",0
5241  03dd               L7401:
5242  03dd 476577696e6e  	dc.b	"Gewinn ",0
5243  03e5               L5401:
5244  03e5 4672616e6361  	dc.b	"Francais",0
5245  03ee               L3401:
5246  03ee 457370616e6f  	dc.b	"Espanol",0
5247  03f6               L1401:
5248  03f6 456e676c6973  	dc.b	"English",0
5249  03fe               L7301:
5250  03fe 446575747363  	dc.b	"Deutsch",0
5251  0406               L5301:
5252  0406 4772656e7a65  	dc.b	"Grenzen ",0
5253  040f               L3301:
5254  040f 5a757275636b  	dc.b	"Zuruckstellen? ",0
5255  041f               L1301:
5256  041f 7048204d696e  	dc.b	"pH Min",0
5257  0426               L7201:
5258  0426 7048204d6178  	dc.b	"pH Max",0
5259  042d               L5201:
5260  042d 537072616368  	dc.b	"Sprachen ",0
5261  0437               L3201:
5262  0437 54696d657220  	dc.b	"Timer ",0
5263  043e               L1201:
5264  043e 5a757275636b  	dc.b	"Zuruckstellen ",0
5265  044d               L7101:
5266  044d 506175736500  	dc.b	"Pause",0
5267  0453               L5101:
5268  0453 4a6100        	dc.b	"Ja",0
5269  0456               L3101:
5270  0456 704800        	dc.b	"pH",0
5271  0459               L1101:
5272  0459 4b65696e6520  	dc.b	"Keine ",0
5273  0460               L7001:
5274  0460 63656c736975  	dc.b	"celsius",0
5275  0468               L5001:
5276  0468 6d73656b2e00  	dc.b	"msek.",0
5277  046e               L3001:
5278  046e 73656b2e00    	dc.b	"sek.",0
5298                     	xref.b	_writeEepromString$L
5299                     	xref.b	_memcpy$L
5300                     	end
