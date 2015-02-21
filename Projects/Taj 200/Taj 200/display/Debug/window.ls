   1                     ; C Compiler for ST7 (COSMIC Software)
   2                     ; Generator V4.5.5 - 12 Jan 2006
1280                     .const:	section	.text
1281  0000               L327_mc_byApplicationVersion:
1282  0000 9d            	dc.b	157
1344                     ; 46 void windowInit(void)
1344                     ; 47 {
1345                     	switch	.text
1346  0000               _windowInit:
1349                     ; 48 	m_byCurrentSelectorX 	= 0x00;
1351  0000 4f            	clr	a
1352  0001 c70007        	ld	_m_byCurrentSelectorX,a
1353                     ; 49 	m_woDisplayedWindow 	= 0x0000;
1355  0004 4f            	clr	a
1356  0005 c70005        	ld	_m_woDisplayedWindow,a
1357  0008 c70006        	ld	_m_woDisplayedWindow+1,a
1358                     ; 50 	m_woEncoderGateStart 	= 1;
1360  000b a601          	ld	a,#1
1361  000d c70001        	ld	_m_woEncoderGateStart+1,a
1362  0010 4f            	clr	a
1363  0011 c70000        	ld	_m_woEncoderGateStart,a
1364                     ; 51 	m_woEncoderGateEnd 		= 100;
1366  0014 a664          	ld	a,#100
1367  0016 c70001        	ld	_m_woEncoderGateEnd+1,a
1368  0019 4f            	clr	a
1369  001a c70000        	ld	_m_woEncoderGateEnd,a
1370                     ; 53 }
1373  001d 81            	ret
1396                     ; 56 void windowForceRepaint(void)
1396                     ; 57 {
1397                     	switch	.text
1398  001e               _windowForceRepaint:
1401                     ; 58 	m_woDisplayedWindow = 0x0000;
1403  001e 4f            	clr	a
1404  001f c70005        	ld	_m_woDisplayedWindow,a
1405  0022 c70006        	ld	_m_woDisplayedWindow+1,a
1406                     ; 59 }
1409  0025 81            	ret
1433                     ; 62 void windowForceRepaintAlarm(void)
1433                     ; 63 {
1434                     	switch	.text
1435  0026               _windowForceRepaintAlarm:
1438                     ; 64 	m_woDisplayedWindow = 0x0000;
1440  0026 4f            	clr	a
1441  0027 c70005        	ld	_m_woDisplayedWindow,a
1442  002a c70006        	ld	_m_woDisplayedWindow+1,a
1443                     ; 65 	_bres(m_woDisplayedWindow, WIN_ALARM);
1445  002d c60006        	ld	a,_m_woDisplayedWindow+1
1446  0030 a4ef          	and	a,#239
1447  0032 c70006        	ld	_m_woDisplayedWindow+1,a
1448                     ; 66 }
1451  0035 81            	ret
1479                     ; 70 void windowMode(void)
1479                     ; 71 {
1480                     	switch	.text
1481  0036               _windowMode:
1484                     ; 72 	if ((parametersGetValue(PARAM_TRANS_ENABLE)!=0x0000) && (parametersGetValue(PARAM_PULL_ENABLE)!=0x0000))
1486  0036 a630          	ld	a,#48
1487  0038 cd0000        	call	_parametersGetValue
1489  003b 4d            	tnz	a
1490  003c 2601          	jrne	L41
1491  003e 5d            	tnz	x
1492  003f               L41:
1493  003f 2603          	jrne	L43
1494  0041 cc00dd        	jp	L7001
1495  0044               L43:
1497  0044 a631          	ld	a,#49
1498  0046 cd0000        	call	_parametersGetValue
1500  0049 4d            	tnz	a
1501  004a 2601          	jrne	L61
1502  004c 5d            	tnz	x
1503  004d               L61:
1504  004d 2603          	jrne	L63
1505  004f cc00dd        	jp	L7001
1506  0052               L63:
1507                     ; 74 		if (!_btst(m_woDisplayedWindow, WIN_MODE) || parametersIsChanged(PARAM_MODE_LONG))
1509  0052 c60006        	ld	a,_m_woDisplayedWindow+1
1510  0055 a501          	bcp	a,#1
1511  0057 270b          	jreq	L3101
1513  0059 a60a          	ld	a,#10
1514  005b cd0000        	call	_parametersIsChanged
1516  005e 4d            	tnz	a
1517  005f 2603          	jrne	L04
1518  0061 cc0295        	jp	L1201
1519  0064               L04:
1520  0064               L3101:
1521                     ; 76 			if (parametersGetValue(PARAM_MODE_LONG)==PARAM_MODE_AUTO)
1523  0064 a60a          	ld	a,#10
1524  0066 cd0000        	call	_parametersGetValue
1526  0069 a1ff          	cp	a,#255
1527  006b 2602          	jrne	L02
1528  006d a300          	cp	x,#0
1529  006f               L02:
1530  006f 2633          	jrne	L5101
1531                     ; 78 				displayDrawBox(0, 0, 62, 16, labelGet(LABEL_MODE), labelGet(LABEL_AUTO), 0xFFFF,0, 0,_btst(m_woDisplayedWindow, WIN_MODE));
1533  0071 c60006        	ld	a,_m_woDisplayedWindow+1
1534  0074 a401          	and	a,#1
1535  0076 b70c          	ld	_displayDrawBox$L+12,a
1536  0078 3f0b          	clr	_displayDrawBox$L+11
1537  007a 3f0a          	clr	_displayDrawBox$L+10
1538  007c aeff          	ld	x,#255
1539  007e bf08          	ld	_displayDrawBox$L+8,x
1540  0080 a6ff          	ld	a,#255
1541  0082 b709          	ld	_displayDrawBox$L+9,a
1542  0084 a601          	ld	a,#1
1543  0086 cd0000        	call	_labelGet
1545  0089 b707          	ld	_displayDrawBox$L+7,a
1546  008b bf06          	ld	_displayDrawBox$L+6,x
1547  008d 4f            	clr	a
1548  008e cd0000        	call	_labelGet
1550  0091 b705          	ld	_displayDrawBox$L+5,a
1551  0093 bf04          	ld	_displayDrawBox$L+4,x
1552  0095 a610          	ld	a,#16
1553  0097 b703          	ld	_displayDrawBox$L+3,a
1554  0099 a63e          	ld	a,#62
1555  009b b702          	ld	_displayDrawBox$L+2,a
1556  009d 4f            	clr	a
1557  009e 5f            	clr	x
1558  009f cd0000        	call	_displayDrawBox
1561  00a2 2031          	jra	L7101
1562  00a4               L5101:
1563                     ; 82 				displayDrawBox(0, 0, 62, 16, labelGet(LABEL_MODE), labelGet(LABEL_MANUAL), 0xFFFF,0, 0,_btst(m_woDisplayedWindow, WIN_MODE));			
1565  00a4 c60006        	ld	a,_m_woDisplayedWindow+1
1566  00a7 a401          	and	a,#1
1567  00a9 b70c          	ld	_displayDrawBox$L+12,a
1568  00ab 3f0b          	clr	_displayDrawBox$L+11
1569  00ad 3f0a          	clr	_displayDrawBox$L+10
1570  00af aeff          	ld	x,#255
1571  00b1 bf08          	ld	_displayDrawBox$L+8,x
1572  00b3 a6ff          	ld	a,#255
1573  00b5 b709          	ld	_displayDrawBox$L+9,a
1574  00b7 a602          	ld	a,#2
1575  00b9 cd0000        	call	_labelGet
1577  00bc b707          	ld	_displayDrawBox$L+7,a
1578  00be bf06          	ld	_displayDrawBox$L+6,x
1579  00c0 4f            	clr	a
1580  00c1 cd0000        	call	_labelGet
1582  00c4 b705          	ld	_displayDrawBox$L+5,a
1583  00c6 bf04          	ld	_displayDrawBox$L+4,x
1584  00c8 a610          	ld	a,#16
1585  00ca b703          	ld	_displayDrawBox$L+3,a
1586  00cc a63e          	ld	a,#62
1587  00ce b702          	ld	_displayDrawBox$L+2,a
1588  00d0 4f            	clr	a
1589  00d1 5f            	clr	x
1590  00d2 cd0000        	call	_displayDrawBox
1592  00d5               L7101:
1593                     ; 84 			parametersChangedFlagReset(PARAM_MODE_LONG);
1595  00d5 a60a          	ld	a,#10
1596  00d7 cd0000        	call	_parametersChangedFlagReset
1598  00da cc0295        	jp	L1201
1599  00dd               L7001:
1600                     ; 89 		if (!_btst(m_woDisplayedWindow, WIN_MODE) || parametersIsChanged(PARAM_MODE_LONG))
1602  00dd c60006        	ld	a,_m_woDisplayedWindow+1
1603  00e0 a501          	bcp	a,#1
1604  00e2 2708          	jreq	L5201
1606  00e4 a60a          	ld	a,#10
1607  00e6 cd0000        	call	_parametersIsChanged
1609  00e9 4d            	tnz	a
1610  00ea 2778          	jreq	L3201
1611  00ec               L5201:
1612                     ; 91 			if (parametersGetValue(PARAM_MODE_LONG)==PARAM_MODE_AUTO)
1614  00ec a60a          	ld	a,#10
1615  00ee cd0000        	call	_parametersGetValue
1617  00f1 a1ff          	cp	a,#255
1618  00f3 2602          	jrne	L22
1619  00f5 a300          	cp	x,#0
1620  00f7               L22:
1621  00f7 2634          	jrne	L7201
1622                     ; 93 				displayDrawBox(0, 0, 30, 16, labelGet(LABEL_MODE_LONG), labelGet(LABEL_AUTO_SHORT), 0xFFFF,0, 0,_btst(m_woDisplayedWindow, WIN_MODE));
1624  00f9 c60006        	ld	a,_m_woDisplayedWindow+1
1625  00fc a401          	and	a,#1
1626  00fe b70c          	ld	_displayDrawBox$L+12,a
1627  0100 3f0b          	clr	_displayDrawBox$L+11
1628  0102 3f0a          	clr	_displayDrawBox$L+10
1629  0104 aeff          	ld	x,#255
1630  0106 bf08          	ld	_displayDrawBox$L+8,x
1631  0108 a6ff          	ld	a,#255
1632  010a b709          	ld	_displayDrawBox$L+9,a
1633  010c a642          	ld	a,#66
1634  010e cd0000        	call	_labelGet
1636  0111 b707          	ld	_displayDrawBox$L+7,a
1637  0113 bf06          	ld	_displayDrawBox$L+6,x
1638  0115 a644          	ld	a,#68
1639  0117 cd0000        	call	_labelGet
1641  011a b705          	ld	_displayDrawBox$L+5,a
1642  011c bf04          	ld	_displayDrawBox$L+4,x
1643  011e a610          	ld	a,#16
1644  0120 b703          	ld	_displayDrawBox$L+3,a
1645  0122 a61e          	ld	a,#30
1646  0124 b702          	ld	_displayDrawBox$L+2,a
1647  0126 4f            	clr	a
1648  0127 5f            	clr	x
1649  0128 cd0000        	call	_displayDrawBox
1652  012b 2032          	jra	L1301
1653  012d               L7201:
1654                     ; 97 				displayDrawBox(0, 0, 30, 16, labelGet(LABEL_MODE_LONG), labelGet(LABEL_MANUAL_SHORT), 0xFFFF,0, 0,_btst(m_woDisplayedWindow, WIN_MODE));			
1656  012d c60006        	ld	a,_m_woDisplayedWindow+1
1657  0130 a401          	and	a,#1
1658  0132 b70c          	ld	_displayDrawBox$L+12,a
1659  0134 3f0b          	clr	_displayDrawBox$L+11
1660  0136 3f0a          	clr	_displayDrawBox$L+10
1661  0138 aeff          	ld	x,#255
1662  013a bf08          	ld	_displayDrawBox$L+8,x
1663  013c a6ff          	ld	a,#255
1664  013e b709          	ld	_displayDrawBox$L+9,a
1665  0140 a643          	ld	a,#67
1666  0142 cd0000        	call	_labelGet
1668  0145 b707          	ld	_displayDrawBox$L+7,a
1669  0147 bf06          	ld	_displayDrawBox$L+6,x
1670  0149 a644          	ld	a,#68
1671  014b cd0000        	call	_labelGet
1673  014e b705          	ld	_displayDrawBox$L+5,a
1674  0150 bf04          	ld	_displayDrawBox$L+4,x
1675  0152 a610          	ld	a,#16
1676  0154 b703          	ld	_displayDrawBox$L+3,a
1677  0156 a61e          	ld	a,#30
1678  0158 b702          	ld	_displayDrawBox$L+2,a
1679  015a 4f            	clr	a
1680  015b 5f            	clr	x
1681  015c cd0000        	call	_displayDrawBox
1683  015f               L1301:
1684                     ; 99 			parametersChangedFlagReset(PARAM_MODE_LONG);
1686  015f a60a          	ld	a,#10
1687  0161 cd0000        	call	_parametersChangedFlagReset
1689  0164               L3201:
1690                     ; 102 		if ((parametersGetValue(PARAM_TRANS_ENABLE)==0x0000) && ( !_btst(m_woDisplayedWindow, WIN_MODE) || parametersIsChanged(PARAM_MODE_TRANS)))
1692  0164 a630          	ld	a,#48
1693  0166 cd0000        	call	_parametersGetValue
1695  0169 4d            	tnz	a
1696  016a 2601          	jrne	L42
1697  016c 5d            	tnz	x
1698  016d               L42:
1699  016d 2703          	jreq	L24
1700  016f cc01fe        	jp	L3301
1701  0172               L24:
1703  0172 c60006        	ld	a,_m_woDisplayedWindow+1
1704  0175 a501          	bcp	a,#1
1705  0177 2708          	jreq	L5301
1707  0179 a60b          	ld	a,#11
1708  017b cd0000        	call	_parametersIsChanged
1710  017e 4d            	tnz	a
1711  017f 277d          	jreq	L3301
1712  0181               L5301:
1713                     ; 104 			if (parametersGetValue(PARAM_MODE_TRANS)==PARAM_MODE_AUTO)
1715  0181 a60b          	ld	a,#11
1716  0183 cd0000        	call	_parametersGetValue
1718  0186 a1ff          	cp	a,#255
1719  0188 2602          	jrne	L62
1720  018a a300          	cp	x,#0
1721  018c               L62:
1722  018c 2635          	jrne	L7301
1723                     ; 106 				displayDrawBox(32, 0, 30, 16, labelGet(LABEL_MODE_TRANS), labelGet(LABEL_AUTO_SHORT), 0xFFFF,0, 0,_btst(m_woDisplayedWindow, WIN_MODE));
1725  018e c60006        	ld	a,_m_woDisplayedWindow+1
1726  0191 a401          	and	a,#1
1727  0193 b70c          	ld	_displayDrawBox$L+12,a
1728  0195 3f0b          	clr	_displayDrawBox$L+11
1729  0197 3f0a          	clr	_displayDrawBox$L+10
1730  0199 aeff          	ld	x,#255
1731  019b bf08          	ld	_displayDrawBox$L+8,x
1732  019d a6ff          	ld	a,#255
1733  019f b709          	ld	_displayDrawBox$L+9,a
1734  01a1 a642          	ld	a,#66
1735  01a3 cd0000        	call	_labelGet
1737  01a6 b707          	ld	_displayDrawBox$L+7,a
1738  01a8 bf06          	ld	_displayDrawBox$L+6,x
1739  01aa a645          	ld	a,#69
1740  01ac cd0000        	call	_labelGet
1742  01af b705          	ld	_displayDrawBox$L+5,a
1743  01b1 bf04          	ld	_displayDrawBox$L+4,x
1744  01b3 a610          	ld	a,#16
1745  01b5 b703          	ld	_displayDrawBox$L+3,a
1746  01b7 a61e          	ld	a,#30
1747  01b9 b702          	ld	_displayDrawBox$L+2,a
1748  01bb 4f            	clr	a
1749  01bc ae20          	ld	x,#32
1750  01be cd0000        	call	_displayDrawBox
1753  01c1 2033          	jra	L1401
1754  01c3               L7301:
1755                     ; 110 				displayDrawBox(32, 0, 30, 16, labelGet(LABEL_MODE_TRANS), labelGet(LABEL_MANUAL_SHORT), 0xFFFF,0, 0,_btst(m_woDisplayedWindow, WIN_MODE));			
1757  01c3 c60006        	ld	a,_m_woDisplayedWindow+1
1758  01c6 a401          	and	a,#1
1759  01c8 b70c          	ld	_displayDrawBox$L+12,a
1760  01ca 3f0b          	clr	_displayDrawBox$L+11
1761  01cc 3f0a          	clr	_displayDrawBox$L+10
1762  01ce aeff          	ld	x,#255
1763  01d0 bf08          	ld	_displayDrawBox$L+8,x
1764  01d2 a6ff          	ld	a,#255
1765  01d4 b709          	ld	_displayDrawBox$L+9,a
1766  01d6 a643          	ld	a,#67
1767  01d8 cd0000        	call	_labelGet
1769  01db b707          	ld	_displayDrawBox$L+7,a
1770  01dd bf06          	ld	_displayDrawBox$L+6,x
1771  01df a645          	ld	a,#69
1772  01e1 cd0000        	call	_labelGet
1774  01e4 b705          	ld	_displayDrawBox$L+5,a
1775  01e6 bf04          	ld	_displayDrawBox$L+4,x
1776  01e8 a610          	ld	a,#16
1777  01ea b703          	ld	_displayDrawBox$L+3,a
1778  01ec a61e          	ld	a,#30
1779  01ee b702          	ld	_displayDrawBox$L+2,a
1780  01f0 4f            	clr	a
1781  01f1 ae20          	ld	x,#32
1782  01f3 cd0000        	call	_displayDrawBox
1784  01f6               L1401:
1785                     ; 112 			parametersChangedFlagReset(PARAM_MODE_TRANS);
1787  01f6 a60b          	ld	a,#11
1788  01f8 cd0000        	call	_parametersChangedFlagReset
1791  01fb cc0295        	jp	L1201
1792  01fe               L3301:
1793                     ; 114 		else if ((parametersGetValue(PARAM_PULL_ENABLE)==0x0000) && (!_btst(m_woDisplayedWindow, WIN_MODE) || parametersIsChanged(PARAM_MODE_PULL)))
1795  01fe a631          	ld	a,#49
1796  0200 cd0000        	call	_parametersGetValue
1798  0203 4d            	tnz	a
1799  0204 2601          	jrne	L03
1800  0206 5d            	tnz	x
1801  0207               L03:
1802  0207 2703          	jreq	L44
1803  0209 cc0295        	jp	L1201
1804  020c               L44:
1806  020c c60006        	ld	a,_m_woDisplayedWindow+1
1807  020f a501          	bcp	a,#1
1808  0211 2708          	jreq	L7401
1810  0213 a60c          	ld	a,#12
1811  0215 cd0000        	call	_parametersIsChanged
1813  0218 4d            	tnz	a
1814  0219 277a          	jreq	L1201
1815  021b               L7401:
1816                     ; 116 			if (parametersGetValue(PARAM_MODE_PULL)==PARAM_MODE_AUTO)
1818  021b a60c          	ld	a,#12
1819  021d cd0000        	call	_parametersGetValue
1821  0220 a1ff          	cp	a,#255
1822  0222 2602          	jrne	L23
1823  0224 a300          	cp	x,#0
1824  0226               L23:
1825  0226 2635          	jrne	L1501
1826                     ; 118 				displayDrawBox(32, 0, 30, 16, labelGet(LABEL_MODE_PULL), labelGet(LABEL_AUTO_SHORT), 0xFFFF,0, 0,_btst(m_woDisplayedWindow, WIN_MODE));
1828  0228 c60006        	ld	a,_m_woDisplayedWindow+1
1829  022b a401          	and	a,#1
1830  022d b70c          	ld	_displayDrawBox$L+12,a
1831  022f 3f0b          	clr	_displayDrawBox$L+11
1832  0231 3f0a          	clr	_displayDrawBox$L+10
1833  0233 aeff          	ld	x,#255
1834  0235 bf08          	ld	_displayDrawBox$L+8,x
1835  0237 a6ff          	ld	a,#255
1836  0239 b709          	ld	_displayDrawBox$L+9,a
1837  023b a642          	ld	a,#66
1838  023d cd0000        	call	_labelGet
1840  0240 b707          	ld	_displayDrawBox$L+7,a
1841  0242 bf06          	ld	_displayDrawBox$L+6,x
1842  0244 a646          	ld	a,#70
1843  0246 cd0000        	call	_labelGet
1845  0249 b705          	ld	_displayDrawBox$L+5,a
1846  024b bf04          	ld	_displayDrawBox$L+4,x
1847  024d a610          	ld	a,#16
1848  024f b703          	ld	_displayDrawBox$L+3,a
1849  0251 a61e          	ld	a,#30
1850  0253 b702          	ld	_displayDrawBox$L+2,a
1851  0255 4f            	clr	a
1852  0256 ae20          	ld	x,#32
1853  0258 cd0000        	call	_displayDrawBox
1856  025b 2033          	jra	L3501
1857  025d               L1501:
1858                     ; 122 				displayDrawBox(32, 0, 30, 16, labelGet(LABEL_MODE_PULL), labelGet(LABEL_MANUAL_SHORT), 0xFFFF,0, 0,_btst(m_woDisplayedWindow, WIN_MODE));			
1860  025d c60006        	ld	a,_m_woDisplayedWindow+1
1861  0260 a401          	and	a,#1
1862  0262 b70c          	ld	_displayDrawBox$L+12,a
1863  0264 3f0b          	clr	_displayDrawBox$L+11
1864  0266 3f0a          	clr	_displayDrawBox$L+10
1865  0268 aeff          	ld	x,#255
1866  026a bf08          	ld	_displayDrawBox$L+8,x
1867  026c a6ff          	ld	a,#255
1868  026e b709          	ld	_displayDrawBox$L+9,a
1869  0270 a643          	ld	a,#67
1870  0272 cd0000        	call	_labelGet
1872  0275 b707          	ld	_displayDrawBox$L+7,a
1873  0277 bf06          	ld	_displayDrawBox$L+6,x
1874  0279 a646          	ld	a,#70
1875  027b cd0000        	call	_labelGet
1877  027e b705          	ld	_displayDrawBox$L+5,a
1878  0280 bf04          	ld	_displayDrawBox$L+4,x
1879  0282 a610          	ld	a,#16
1880  0284 b703          	ld	_displayDrawBox$L+3,a
1881  0286 a61e          	ld	a,#30
1882  0288 b702          	ld	_displayDrawBox$L+2,a
1883  028a 4f            	clr	a
1884  028b ae20          	ld	x,#32
1885  028d cd0000        	call	_displayDrawBox
1887  0290               L3501:
1888                     ; 124 			parametersChangedFlagReset(PARAM_MODE_PULL);
1890  0290 a60c          	ld	a,#12
1891  0292 cd0000        	call	_parametersChangedFlagReset
1893  0295               L1201:
1894                     ; 129 	_bset(m_woDisplayedWindow, WIN_MODE);
1896  0295 c60006        	ld	a,_m_woDisplayedWindow+1
1897  0298 aa01          	or	a,#1
1898  029a c70006        	ld	_m_woDisplayedWindow+1,a
1899                     ; 130 	_bres(m_woDisplayedWindow, WIN_FUNCTIONS);
1901  029d c60006        	ld	a,_m_woDisplayedWindow+1
1902  02a0 a4bf          	and	a,#191
1903  02a2 c70006        	ld	_m_woDisplayedWindow+1,a
1904                     ; 131 	_bres(m_woDisplayedWindow, WIN_PARAMETERS);
1906  02a5 c60006        	ld	a,_m_woDisplayedWindow+1
1907  02a8 a47f          	and	a,#127
1908  02aa c70006        	ld	_m_woDisplayedWindow+1,a
1909                     ; 132 	_bres(m_woDisplayedWindow, WIN_TESTS);
1911  02ad c60006        	ld	a,_m_woDisplayedWindow+1
1912  02b0 a4ff          	and	a,#255
1913  02b2 c70006        	ld	_m_woDisplayedWindow+1,a
1914  02b5 c60005        	ld	a,_m_woDisplayedWindow
1915  02b8 a4fe          	and	a,#254
1916  02ba c70005        	ld	_m_woDisplayedWindow,a
1917                     ; 133 	_bres(m_woDisplayedWindow, WIN_MESSAGE);
1919  02bd c60006        	ld	a,_m_woDisplayedWindow+1
1920  02c0 a4df          	and	a,#223
1921  02c2 c70006        	ld	_m_woDisplayedWindow+1,a
1922                     ; 134 	_bres(m_woDisplayedWindow, WIN_SETUP);
1924  02c5 c60006        	ld	a,_m_woDisplayedWindow+1
1925  02c8 a4ff          	and	a,#255
1926  02ca c70006        	ld	_m_woDisplayedWindow+1,a
1927  02cd c60005        	ld	a,_m_woDisplayedWindow
1928  02d0 a4fb          	and	a,#251
1929  02d2 c70005        	ld	_m_woDisplayedWindow,a
1930                     ; 135 	_bres(m_woDisplayedWindow, WIN_MENUS);
1932  02d5 c60006        	ld	a,_m_woDisplayedWindow+1
1933  02d8 a4ff          	and	a,#255
1934  02da c70006        	ld	_m_woDisplayedWindow+1,a
1935  02dd c60005        	ld	a,_m_woDisplayedWindow
1936  02e0 a4fd          	and	a,#253
1937  02e2 c70005        	ld	_m_woDisplayedWindow,a
1938                     ; 136 	_bres(m_woDisplayedWindow, WIN_ARCHIVES);
1940  02e5 c60006        	ld	a,_m_woDisplayedWindow+1
1941  02e8 a4ff          	and	a,#255
1942  02ea c70006        	ld	_m_woDisplayedWindow+1,a
1943  02ed c60005        	ld	a,_m_woDisplayedWindow
1944  02f0 a4f7          	and	a,#247
1945  02f2 c70005        	ld	_m_woDisplayedWindow,a
1946                     ; 137 	_bres(m_woDisplayedWindow, WIN_APPLICATION);
1948  02f5 c60006        	ld	a,_m_woDisplayedWindow+1
1949  02f8 a4ff          	and	a,#255
1950  02fa c70006        	ld	_m_woDisplayedWindow+1,a
1951  02fd c60005        	ld	a,_m_woDisplayedWindow
1952  0300 a4ef          	and	a,#239
1953  0302 c70005        	ld	_m_woDisplayedWindow,a
1954                     ; 138 	_bres(m_woDisplayedWindow, WIN_ENCODER);
1956  0305 c60006        	ld	a,_m_woDisplayedWindow+1
1957  0308 a4ff          	and	a,#255
1958  030a c70006        	ld	_m_woDisplayedWindow+1,a
1959  030d c60005        	ld	a,_m_woDisplayedWindow
1960  0310 a4df          	and	a,#223
1961  0312 c70005        	ld	_m_woDisplayedWindow,a
1962                     ; 139 }
1965  0315 81            	ret
1993                     ; 142 void windowSpeed(void)
1993                     ; 143 {
1994                     	switch	.text
1995  0316               _windowSpeed:
1998                     ; 144 	if (!_btst(m_woDisplayedWindow, WIN_SPEED) || parametersIsChanged(PARAM_SPEED))
2000  0316 c60006        	ld	a,_m_woDisplayedWindow+1
2001  0319 a502          	bcp	a,#2
2002  031b 2708          	jreq	L7601
2004  031d a605          	ld	a,#5
2005  031f cd0000        	call	_parametersIsChanged
2007  0322 4d            	tnz	a
2008  0323 2769          	jreq	L5601
2009  0325               L7601:
2010                     ; 146 		if (
2010                     ; 147 			(parametersGetValue(PARAM_LONG_DAC_ENABLE) == 0x00) ||
2010                     ; 148 			(parametersGetValue(PARAM_TRANS_DAC_ENABLE) == 0x00) ||
2010                     ; 149 			(parametersGetValue(PARAM_PULL_DAC_ENABLE) == 0x00) ||
2010                     ; 150 			(parametersGetValue(PARAM_SHOW_CYLINDER) == 0x00)
2010                     ; 151 		   )		
2012  0325 a63b          	ld	a,#59
2013  0327 cd0000        	call	_parametersGetValue
2015  032a 4d            	tnz	a
2016  032b 2601          	jrne	L05
2017  032d 5d            	tnz	x
2018  032e               L05:
2019  032e 2724          	jreq	L3701
2021  0330 a63c          	ld	a,#60
2022  0332 cd0000        	call	_parametersGetValue
2024  0335 4d            	tnz	a
2025  0336 2601          	jrne	L25
2026  0338 5d            	tnz	x
2027  0339               L25:
2028  0339 2719          	jreq	L3701
2030  033b a63d          	ld	a,#61
2031  033d cd0000        	call	_parametersGetValue
2033  0340 4d            	tnz	a
2034  0341 2601          	jrne	L45
2035  0343 5d            	tnz	x
2036  0344               L45:
2037  0344 270e          	jreq	L3701
2039  0346 a642          	ld	a,#66
2040  0348 cd0000        	call	_parametersGetValue
2042  034b 4d            	tnz	a
2043  034c 2601          	jrne	L65
2044  034e 5d            	tnz	x
2045  034f               L65:
2046  034f 2703          	jreq	L06
2047  0351 cc040f        	jp	L1701
2048  0354               L06:
2049  0354               L3701:
2050                     ; 153 			displayDrawBox(98, 0, 28, 16, labelGet(LABEL_SPEED_SHORT), "", parametersGetValue(PARAM_SPEED), 4, 0,_btst(m_woDisplayedWindow, WIN_SPEED));
2052  0354 c60006        	ld	a,_m_woDisplayedWindow+1
2053  0357 a402          	and	a,#2
2054  0359 b70c          	ld	_displayDrawBox$L+12,a
2055  035b 3f0b          	clr	_displayDrawBox$L+11
2056  035d a604          	ld	a,#4
2057  035f b70a          	ld	_displayDrawBox$L+10,a
2058  0361 a605          	ld	a,#5
2059  0363 cd0000        	call	_parametersGetValue
2061  0366 b709          	ld	_displayDrawBox$L+9,a
2062  0368 bf08          	ld	_displayDrawBox$L+8,x
2063  036a ae25          	ld	x,#high(L1011)
2064  036c bf06          	ld	_displayDrawBox$L+6,x
2065  036e a625          	ld	a,#low(L1011)
2066  0370 b707          	ld	_displayDrawBox$L+7,a
2067  0372 a671          	ld	a,#113
2068  0374 cd0000        	call	_labelGet
2070  0377 b705          	ld	_displayDrawBox$L+5,a
2071  0379 bf04          	ld	_displayDrawBox$L+4,x
2072  037b a610          	ld	a,#16
2073  037d b703          	ld	_displayDrawBox$L+3,a
2074  037f a61c          	ld	a,#28
2075  0381 b702          	ld	_displayDrawBox$L+2,a
2076  0383 4f            	clr	a
2077  0384 ae62          	ld	x,#98
2078  0386 cd0000        	call	_displayDrawBox
2080                     ; 154 			parametersChangedFlagReset(PARAM_SPEED);
2082  0389 a605          	ld	a,#5
2083  038b cd0000        	call	_parametersChangedFlagReset
2086  038e               L5601:
2087                     ; 163 	_bset(m_woDisplayedWindow, WIN_SPEED);
2089  038e c60006        	ld	a,_m_woDisplayedWindow+1
2090  0391 aa02          	or	a,#2
2091  0393 c70006        	ld	_m_woDisplayedWindow+1,a
2092                     ; 164 	_bres(m_woDisplayedWindow, WIN_FUNCTIONS);
2094  0396 c60006        	ld	a,_m_woDisplayedWindow+1
2095  0399 a4bf          	and	a,#191
2096  039b c70006        	ld	_m_woDisplayedWindow+1,a
2097                     ; 165 	_bres(m_woDisplayedWindow, WIN_PARAMETERS);
2099  039e c60006        	ld	a,_m_woDisplayedWindow+1
2100  03a1 a47f          	and	a,#127
2101  03a3 c70006        	ld	_m_woDisplayedWindow+1,a
2102                     ; 166 	_bres(m_woDisplayedWindow, WIN_TESTS);
2104  03a6 c60006        	ld	a,_m_woDisplayedWindow+1
2105  03a9 a4ff          	and	a,#255
2106  03ab c70006        	ld	_m_woDisplayedWindow+1,a
2107  03ae c60005        	ld	a,_m_woDisplayedWindow
2108  03b1 a4fe          	and	a,#254
2109  03b3 c70005        	ld	_m_woDisplayedWindow,a
2110                     ; 167 	_bres(m_woDisplayedWindow, WIN_MESSAGE);
2112  03b6 c60006        	ld	a,_m_woDisplayedWindow+1
2113  03b9 a4df          	and	a,#223
2114  03bb c70006        	ld	_m_woDisplayedWindow+1,a
2115                     ; 168 	_bres(m_woDisplayedWindow, WIN_SETUP);
2117  03be c60006        	ld	a,_m_woDisplayedWindow+1
2118  03c1 a4ff          	and	a,#255
2119  03c3 c70006        	ld	_m_woDisplayedWindow+1,a
2120  03c6 c60005        	ld	a,_m_woDisplayedWindow
2121  03c9 a4fb          	and	a,#251
2122  03cb c70005        	ld	_m_woDisplayedWindow,a
2123                     ; 169 	_bres(m_woDisplayedWindow, WIN_MENUS);
2125  03ce c60006        	ld	a,_m_woDisplayedWindow+1
2126  03d1 a4ff          	and	a,#255
2127  03d3 c70006        	ld	_m_woDisplayedWindow+1,a
2128  03d6 c60005        	ld	a,_m_woDisplayedWindow
2129  03d9 a4fd          	and	a,#253
2130  03db c70005        	ld	_m_woDisplayedWindow,a
2131                     ; 170 	_bres(m_woDisplayedWindow, WIN_ARCHIVES);
2133  03de c60006        	ld	a,_m_woDisplayedWindow+1
2134  03e1 a4ff          	and	a,#255
2135  03e3 c70006        	ld	_m_woDisplayedWindow+1,a
2136  03e6 c60005        	ld	a,_m_woDisplayedWindow
2137  03e9 a4f7          	and	a,#247
2138  03eb c70005        	ld	_m_woDisplayedWindow,a
2139                     ; 171 	_bres(m_woDisplayedWindow, WIN_APPLICATION);
2141  03ee c60006        	ld	a,_m_woDisplayedWindow+1
2142  03f1 a4ff          	and	a,#255
2143  03f3 c70006        	ld	_m_woDisplayedWindow+1,a
2144  03f6 c60005        	ld	a,_m_woDisplayedWindow
2145  03f9 a4ef          	and	a,#239
2146  03fb c70005        	ld	_m_woDisplayedWindow,a
2147                     ; 172 	_bres(m_woDisplayedWindow, WIN_ENCODER);
2149  03fe c60006        	ld	a,_m_woDisplayedWindow+1
2150  0401 a4ff          	and	a,#255
2151  0403 c70006        	ld	_m_woDisplayedWindow+1,a
2152  0406 c60005        	ld	a,_m_woDisplayedWindow
2153  0409 a4df          	and	a,#223
2154  040b c70005        	ld	_m_woDisplayedWindow,a
2155                     ; 173 }
2158  040e 81            	ret
2159  040f               L1701:
2160                     ; 158 			displayDrawBox(64, 0, 62, 16, labelGet(LABEL_SPEED), labelGet(LABEL_MT_MIN), parametersGetValue(PARAM_SPEED), 4, 0,_btst(m_woDisplayedWindow, WIN_SPEED));
2162  040f c60006        	ld	a,_m_woDisplayedWindow+1
2163  0412 a402          	and	a,#2
2164  0414 b70c          	ld	_displayDrawBox$L+12,a
2165  0416 3f0b          	clr	_displayDrawBox$L+11
2166  0418 a604          	ld	a,#4
2167  041a b70a          	ld	_displayDrawBox$L+10,a
2168  041c a605          	ld	a,#5
2169  041e cd0000        	call	_parametersGetValue
2171  0421 b709          	ld	_displayDrawBox$L+9,a
2172  0423 bf08          	ld	_displayDrawBox$L+8,x
2173  0425 a604          	ld	a,#4
2174  0427 cd0000        	call	_labelGet
2176  042a b707          	ld	_displayDrawBox$L+7,a
2177  042c bf06          	ld	_displayDrawBox$L+6,x
2178  042e a603          	ld	a,#3
2179  0430 cd0000        	call	_labelGet
2181  0433 b705          	ld	_displayDrawBox$L+5,a
2182  0435 bf04          	ld	_displayDrawBox$L+4,x
2183  0437 a610          	ld	a,#16
2184  0439 b703          	ld	_displayDrawBox$L+3,a
2185  043b a63e          	ld	a,#62
2186  043d b702          	ld	_displayDrawBox$L+2,a
2187  043f 4f            	clr	a
2188  0440 ae40          	ld	x,#64
2189  0442 cd0000        	call	_displayDrawBox
2191                     ; 159 			parametersChangedFlagReset(PARAM_SPEED);
2193  0445 a605          	ld	a,#5
2194  0447 cd0000        	call	_parametersChangedFlagReset
2196  044a cc038e        	jp	L5601
2225                     ; 176 void windowCylinderSizeValue(void)
2225                     ; 177 {
2226                     	switch	.text
2227  044d               _windowCylinderSizeValue:
2230                     ; 178 	if (
2230                     ; 179 	    (parametersGetValue(PARAM_SHOW_CYLINDER) != 0x00) ||
2230                     ; 180 		(parametersGetValue(PARAM_LONG_DAC_ENABLE) == 0x00) ||
2230                     ; 181 		(parametersGetValue(PARAM_TRANS_DAC_ENABLE) == 0x00) ||
2230                     ; 182 		(parametersGetValue(PARAM_PULL_DAC_ENABLE) == 0x00)
2230                     ; 183 	   )		
2232  044d a642          	ld	a,#66
2233  044f cd0000        	call	_parametersGetValue
2235  0452 4d            	tnz	a
2236  0453 2601          	jrne	L46
2237  0455 5d            	tnz	x
2238  0456               L46:
2239  0456 2621          	jrne	L7111
2241  0458 a63b          	ld	a,#59
2242  045a cd0000        	call	_parametersGetValue
2244  045d 4d            	tnz	a
2245  045e 2601          	jrne	L66
2246  0460 5d            	tnz	x
2247  0461               L66:
2248  0461 2716          	jreq	L7111
2250  0463 a63c          	ld	a,#60
2251  0465 cd0000        	call	_parametersGetValue
2253  0468 4d            	tnz	a
2254  0469 2601          	jrne	L07
2255  046b 5d            	tnz	x
2256  046c               L07:
2257  046c 270b          	jreq	L7111
2259  046e a63d          	ld	a,#61
2260  0470 cd0000        	call	_parametersGetValue
2262  0473 4d            	tnz	a
2263  0474 2601          	jrne	L27
2264  0476 5d            	tnz	x
2265  0477               L27:
2266  0477 2601          	jrne	L5111
2267  0479               L7111:
2268                     ; 185 	   return;
2271  0479 81            	ret
2272  047a               L5111:
2273                     ; 188 	if (!_btst(m_woDisplayedWindow, WIN_CYLINDER_SIZE) || parametersIsChanged(PARAM_CYLINDER_TRAVEL))
2275  047a c60005        	ld	a,_m_woDisplayedWindow
2276  047d a580          	bcp	a,#128
2277  047f 2708          	jreq	L7211
2279  0481 a601          	ld	a,#1
2280  0483 cd0000        	call	_parametersIsChanged
2282  0486 4d            	tnz	a
2283  0487 273c          	jreq	L5211
2284  0489               L7211:
2285                     ; 190 		displayDrawBox(64, 0, 32, 16, labelGet(LABEL_CYLINDER_SIZE), "", parametersGetValue(PARAM_CYLINDER_TRAVEL), 5, 1,_btst(m_woDisplayedWindow, WIN_CYLINDER_SIZE));
2287  0489 c60006        	ld	a,_m_woDisplayedWindow+1
2288  048c a400          	and	a,#0
2289  048e b70c          	ld	_displayDrawBox$L+12,a
2290  0490 a601          	ld	a,#1
2291  0492 b70b          	ld	_displayDrawBox$L+11,a
2292  0494 a605          	ld	a,#5
2293  0496 b70a          	ld	_displayDrawBox$L+10,a
2294  0498 a601          	ld	a,#1
2295  049a cd0000        	call	_parametersGetValue
2297  049d b709          	ld	_displayDrawBox$L+9,a
2298  049f bf08          	ld	_displayDrawBox$L+8,x
2299  04a1 ae25          	ld	x,#high(L1011)
2300  04a3 bf06          	ld	_displayDrawBox$L+6,x
2301  04a5 a625          	ld	a,#low(L1011)
2302  04a7 b707          	ld	_displayDrawBox$L+7,a
2303  04a9 a672          	ld	a,#114
2304  04ab cd0000        	call	_labelGet
2306  04ae b705          	ld	_displayDrawBox$L+5,a
2307  04b0 bf04          	ld	_displayDrawBox$L+4,x
2308  04b2 a610          	ld	a,#16
2309  04b4 b703          	ld	_displayDrawBox$L+3,a
2310  04b6 a620          	ld	a,#32
2311  04b8 b702          	ld	_displayDrawBox$L+2,a
2312  04ba 4f            	clr	a
2313  04bb ae40          	ld	x,#64
2314  04bd cd0000        	call	_displayDrawBox
2316                     ; 191 		parametersChangedFlagReset(PARAM_CYLINDER_TRAVEL);
2318  04c0 a601          	ld	a,#1
2319  04c2 cd0000        	call	_parametersChangedFlagReset
2321  04c5               L5211:
2322                     ; 194 	_bset(m_woDisplayedWindow, WIN_CYLINDER_SIZE);
2324  04c5 c60005        	ld	a,_m_woDisplayedWindow
2325  04c8 aa80          	or	a,#128
2326  04ca c70005        	ld	_m_woDisplayedWindow,a
2327                     ; 195 	_bres(m_woDisplayedWindow, WIN_DAC_BASE);
2329  04cd c60006        	ld	a,_m_woDisplayedWindow+1
2330  04d0 a4ff          	and	a,#255
2331  04d2 c70006        	ld	_m_woDisplayedWindow+1,a
2332  04d5 c60005        	ld	a,_m_woDisplayedWindow
2333  04d8 a4bf          	and	a,#191
2334  04da c70005        	ld	_m_woDisplayedWindow,a
2335                     ; 196 	_bres(m_woDisplayedWindow, WIN_FUNCTIONS);
2337  04dd c60006        	ld	a,_m_woDisplayedWindow+1
2338  04e0 a4bf          	and	a,#191
2339  04e2 c70006        	ld	_m_woDisplayedWindow+1,a
2340                     ; 197 	_bres(m_woDisplayedWindow, WIN_PARAMETERS);
2342  04e5 c60006        	ld	a,_m_woDisplayedWindow+1
2343  04e8 a47f          	and	a,#127
2344  04ea c70006        	ld	_m_woDisplayedWindow+1,a
2345                     ; 198 	_bres(m_woDisplayedWindow, WIN_TESTS);
2347  04ed c60006        	ld	a,_m_woDisplayedWindow+1
2348  04f0 a4ff          	and	a,#255
2349  04f2 c70006        	ld	_m_woDisplayedWindow+1,a
2350  04f5 c60005        	ld	a,_m_woDisplayedWindow
2351  04f8 a4fe          	and	a,#254
2352  04fa c70005        	ld	_m_woDisplayedWindow,a
2353                     ; 199 	_bres(m_woDisplayedWindow, WIN_MESSAGE);
2355  04fd c60006        	ld	a,_m_woDisplayedWindow+1
2356  0500 a4df          	and	a,#223
2357  0502 c70006        	ld	_m_woDisplayedWindow+1,a
2358                     ; 200 	_bres(m_woDisplayedWindow, WIN_SETUP);
2360  0505 c60006        	ld	a,_m_woDisplayedWindow+1
2361  0508 a4ff          	and	a,#255
2362  050a c70006        	ld	_m_woDisplayedWindow+1,a
2363  050d c60005        	ld	a,_m_woDisplayedWindow
2364  0510 a4fb          	and	a,#251
2365  0512 c70005        	ld	_m_woDisplayedWindow,a
2366                     ; 201 	_bres(m_woDisplayedWindow, WIN_MENUS);
2368  0515 c60006        	ld	a,_m_woDisplayedWindow+1
2369  0518 a4ff          	and	a,#255
2370  051a c70006        	ld	_m_woDisplayedWindow+1,a
2371  051d c60005        	ld	a,_m_woDisplayedWindow
2372  0520 a4fd          	and	a,#253
2373  0522 c70005        	ld	_m_woDisplayedWindow,a
2374                     ; 202 	_bres(m_woDisplayedWindow, WIN_ARCHIVES);
2376  0525 c60006        	ld	a,_m_woDisplayedWindow+1
2377  0528 a4ff          	and	a,#255
2378  052a c70006        	ld	_m_woDisplayedWindow+1,a
2379  052d c60005        	ld	a,_m_woDisplayedWindow
2380  0530 a4f7          	and	a,#247
2381  0532 c70005        	ld	_m_woDisplayedWindow,a
2382                     ; 203 	_bres(m_woDisplayedWindow, WIN_APPLICATION);
2384  0535 c60006        	ld	a,_m_woDisplayedWindow+1
2385  0538 a4ff          	and	a,#255
2386  053a c70006        	ld	_m_woDisplayedWindow+1,a
2387  053d c60005        	ld	a,_m_woDisplayedWindow
2388  0540 a4ef          	and	a,#239
2389  0542 c70005        	ld	_m_woDisplayedWindow,a
2390                     ; 204 	_bres(m_woDisplayedWindow, WIN_ENCODER);	
2392  0545 c60006        	ld	a,_m_woDisplayedWindow+1
2393  0548 a4ff          	and	a,#255
2394  054a c70006        	ld	_m_woDisplayedWindow+1,a
2395  054d c60005        	ld	a,_m_woDisplayedWindow
2396  0550 a4df          	and	a,#223
2397  0552 c70005        	ld	_m_woDisplayedWindow,a
2398                     ; 205 }
2401  0555 81            	ret
2429                     ; 208 void windowDacValue(void)
2429                     ; 209 {
2430                     	switch	.text
2431  0556               _windowDacValue:
2434                     ; 210 	if (
2434                     ; 211 		(parametersGetValue(PARAM_LONG_DAC_ENABLE) != 0x00) &&
2434                     ; 212 		(parametersGetValue(PARAM_TRANS_DAC_ENABLE) != 0x00) &&
2434                     ; 213 		(parametersGetValue(PARAM_PULL_DAC_ENABLE) != 0x00)
2434                     ; 214 	   )		
2436  0556 a63b          	ld	a,#59
2437  0558 cd0000        	call	_parametersGetValue
2439  055b 4d            	tnz	a
2440  055c 2601          	jrne	L67
2441  055e 5d            	tnz	x
2442  055f               L67:
2443  055f 2717          	jreq	L1411
2445  0561 a63c          	ld	a,#60
2446  0563 cd0000        	call	_parametersGetValue
2448  0566 4d            	tnz	a
2449  0567 2601          	jrne	L001
2450  0569 5d            	tnz	x
2451  056a               L001:
2452  056a 270c          	jreq	L1411
2454  056c a63d          	ld	a,#61
2455  056e cd0000        	call	_parametersGetValue
2457  0571 4d            	tnz	a
2458  0572 2601          	jrne	L201
2459  0574 5d            	tnz	x
2460  0575               L201:
2461  0575 2701          	jreq	L1411
2462                     ; 216 	   return;
2465  0577 81            	ret
2466  0578               L1411:
2467                     ; 220 	if (!_btst(m_woDisplayedWindow, WIN_DAC_BASE) || parametersIsChanged(PARAM_BASE_VALUE_DAC))
2469  0578 c60005        	ld	a,_m_woDisplayedWindow
2470  057b a540          	bcp	a,#64
2471  057d 2708          	jreq	L5411
2473  057f a61b          	ld	a,#27
2474  0581 cd0000        	call	_parametersIsChanged
2476  0584 4d            	tnz	a
2477  0585 273a          	jreq	L3411
2478  0587               L5411:
2479                     ; 222 		displayDrawBox(64, 0, 32, 16, labelGet(LABEL_MODE_PULL), "", parametersGetValue(PARAM_BASE_VALUE_DAC), 4, 0,_btst(m_woDisplayedWindow, WIN_DAC_BASE));
2481  0587 c60006        	ld	a,_m_woDisplayedWindow+1
2482  058a a400          	and	a,#0
2483  058c b70c          	ld	_displayDrawBox$L+12,a
2484  058e 3f0b          	clr	_displayDrawBox$L+11
2485  0590 a604          	ld	a,#4
2486  0592 b70a          	ld	_displayDrawBox$L+10,a
2487  0594 a61b          	ld	a,#27
2488  0596 cd0000        	call	_parametersGetValue
2490  0599 b709          	ld	_displayDrawBox$L+9,a
2491  059b bf08          	ld	_displayDrawBox$L+8,x
2492  059d ae25          	ld	x,#high(L1011)
2493  059f bf06          	ld	_displayDrawBox$L+6,x
2494  05a1 a625          	ld	a,#low(L1011)
2495  05a3 b707          	ld	_displayDrawBox$L+7,a
2496  05a5 a646          	ld	a,#70
2497  05a7 cd0000        	call	_labelGet
2499  05aa b705          	ld	_displayDrawBox$L+5,a
2500  05ac bf04          	ld	_displayDrawBox$L+4,x
2501  05ae a610          	ld	a,#16
2502  05b0 b703          	ld	_displayDrawBox$L+3,a
2503  05b2 a620          	ld	a,#32
2504  05b4 b702          	ld	_displayDrawBox$L+2,a
2505  05b6 4f            	clr	a
2506  05b7 ae40          	ld	x,#64
2507  05b9 cd0000        	call	_displayDrawBox
2509                     ; 223 		parametersChangedFlagReset(PARAM_BASE_VALUE_DAC);
2511  05bc a61b          	ld	a,#27
2512  05be cd0000        	call	_parametersChangedFlagReset
2514  05c1               L3411:
2515                     ; 226 	_bset(m_woDisplayedWindow, WIN_DAC_BASE);
2517  05c1 c60005        	ld	a,_m_woDisplayedWindow
2518  05c4 aa40          	or	a,#64
2519  05c6 c70005        	ld	_m_woDisplayedWindow,a
2520                     ; 227 	_bres(m_woDisplayedWindow, WIN_CYLINDER_SIZE);
2522  05c9 c60006        	ld	a,_m_woDisplayedWindow+1
2523  05cc a4ff          	and	a,#255
2524  05ce c70006        	ld	_m_woDisplayedWindow+1,a
2525  05d1 c60005        	ld	a,_m_woDisplayedWindow
2526  05d4 a47f          	and	a,#127
2527  05d6 c70005        	ld	_m_woDisplayedWindow,a
2528                     ; 228 	_bres(m_woDisplayedWindow, WIN_FUNCTIONS);
2530  05d9 c60006        	ld	a,_m_woDisplayedWindow+1
2531  05dc a4bf          	and	a,#191
2532  05de c70006        	ld	_m_woDisplayedWindow+1,a
2533                     ; 229 	_bres(m_woDisplayedWindow, WIN_PARAMETERS);
2535  05e1 c60006        	ld	a,_m_woDisplayedWindow+1
2536  05e4 a47f          	and	a,#127
2537  05e6 c70006        	ld	_m_woDisplayedWindow+1,a
2538                     ; 230 	_bres(m_woDisplayedWindow, WIN_TESTS);
2540  05e9 c60006        	ld	a,_m_woDisplayedWindow+1
2541  05ec a4ff          	and	a,#255
2542  05ee c70006        	ld	_m_woDisplayedWindow+1,a
2543  05f1 c60005        	ld	a,_m_woDisplayedWindow
2544  05f4 a4fe          	and	a,#254
2545  05f6 c70005        	ld	_m_woDisplayedWindow,a
2546                     ; 231 	_bres(m_woDisplayedWindow, WIN_MESSAGE);
2548  05f9 c60006        	ld	a,_m_woDisplayedWindow+1
2549  05fc a4df          	and	a,#223
2550  05fe c70006        	ld	_m_woDisplayedWindow+1,a
2551                     ; 232 	_bres(m_woDisplayedWindow, WIN_SETUP);
2553  0601 c60006        	ld	a,_m_woDisplayedWindow+1
2554  0604 a4ff          	and	a,#255
2555  0606 c70006        	ld	_m_woDisplayedWindow+1,a
2556  0609 c60005        	ld	a,_m_woDisplayedWindow
2557  060c a4fb          	and	a,#251
2558  060e c70005        	ld	_m_woDisplayedWindow,a
2559                     ; 233 	_bres(m_woDisplayedWindow, WIN_MENUS);
2561  0611 c60006        	ld	a,_m_woDisplayedWindow+1
2562  0614 a4ff          	and	a,#255
2563  0616 c70006        	ld	_m_woDisplayedWindow+1,a
2564  0619 c60005        	ld	a,_m_woDisplayedWindow
2565  061c a4fd          	and	a,#253
2566  061e c70005        	ld	_m_woDisplayedWindow,a
2567                     ; 234 	_bres(m_woDisplayedWindow, WIN_ARCHIVES);
2569  0621 c60006        	ld	a,_m_woDisplayedWindow+1
2570  0624 a4ff          	and	a,#255
2571  0626 c70006        	ld	_m_woDisplayedWindow+1,a
2572  0629 c60005        	ld	a,_m_woDisplayedWindow
2573  062c a4f7          	and	a,#247
2574  062e c70005        	ld	_m_woDisplayedWindow,a
2575                     ; 235 	_bres(m_woDisplayedWindow, WIN_APPLICATION);
2577  0631 c60006        	ld	a,_m_woDisplayedWindow+1
2578  0634 a4ff          	and	a,#255
2579  0636 c70006        	ld	_m_woDisplayedWindow+1,a
2580  0639 c60005        	ld	a,_m_woDisplayedWindow
2581  063c a4ef          	and	a,#239
2582  063e c70005        	ld	_m_woDisplayedWindow,a
2583                     ; 236 	_bres(m_woDisplayedWindow, WIN_ENCODER);
2585  0641 c60006        	ld	a,_m_woDisplayedWindow+1
2586  0644 a4ff          	and	a,#255
2587  0646 c70006        	ld	_m_woDisplayedWindow+1,a
2588  0649 c60005        	ld	a,_m_woDisplayedWindow
2589  064c a4df          	and	a,#223
2590  064e c70005        	ld	_m_woDisplayedWindow,a
2591                     ; 237 }
2594  0651 81            	ret
2644                     ; 240 void windowBigMessage(BYTE * a_strMessage1, BYTE * a_strMessage2)
2644                     ; 241 {
2645                     	switch	.text
2647                     	xref.b	_windowBigMessage$L
2648  0652               _windowBigMessage:
2650  0652 b701          	ld	_windowBigMessage$L+1,a
2651  0654 bf00          	ld	_windowBigMessage$L,x
2653                     ; 242 	if (!_btst(m_woDisplayedWindow, WIN_MESSAGE)) //Not displayed
2655  0656 c60006        	ld	a,_m_woDisplayedWindow+1
2656  0659 a520          	bcp	a,#32
2657  065b 263f          	jrne	L1711
2658                     ; 244 		displayClearArea(0, 0, 126, 64);
2660  065d a640          	ld	a,#64
2661  065f b703          	ld	_displayClearArea$L+3,a
2662  0661 a67e          	ld	a,#126
2663  0663 b702          	ld	_displayClearArea$L+2,a
2664  0665 4f            	clr	a
2665  0666 5f            	clr	x
2666  0667 cd0000        	call	_displayClearArea
2668                     ; 245 		displaySetOutLine(0, 0, 126, 64, false);
2670  066a 3f04          	clr	_displaySetOutLine$L+4
2671  066c a640          	ld	a,#64
2672  066e b703          	ld	_displaySetOutLine$L+3,a
2673  0670 a67e          	ld	a,#126
2674  0672 b702          	ld	_displaySetOutLine$L+2,a
2675  0674 4f            	clr	a
2676  0675 5f            	clr	x
2677  0676 cd0000        	call	_displaySetOutLine
2679                     ; 248 		displayWriteString(labelGet(LABEL_MESSAGE), DISPLAY_SELECT_FONT_MINI, 2, 6);
2681  0679 a606          	ld	a,#6
2682  067b b704          	ld	_displayWriteString$L+4,a
2683  067d a602          	ld	a,#2
2684  067f b703          	ld	_displayWriteString$L+3,a
2685  0681 a61c          	ld	a,#28
2686  0683 b702          	ld	_displayWriteString$L+2,a
2687  0685 a605          	ld	a,#5
2688  0687 cd0000        	call	_labelGet
2690  068a cd0000        	call	_displayWriteString
2692                     ; 249 		displayInvertArea(1, 1, 124, 6);
2694  068d a606          	ld	a,#6
2695  068f b703          	ld	_displayInvertArea$L+3,a
2696  0691 a67c          	ld	a,#124
2697  0693 b702          	ld	_displayInvertArea$L+2,a
2698  0695 a601          	ld	a,#1
2699  0697 ae01          	ld	x,#1
2700  0699 cd0000        	call	_displayInvertArea
2702  069c               L1711:
2703                     ; 252 	displayWriteString(a_strMessage1, DISPLAY_SELECT_FONT_5x7, 5, 25);	
2705  069c a619          	ld	a,#25
2706  069e b704          	ld	_displayWriteString$L+4,a
2707  06a0 a605          	ld	a,#5
2708  06a2 b703          	ld	_displayWriteString$L+3,a
2709  06a4 a61d          	ld	a,#29
2710  06a6 b702          	ld	_displayWriteString$L+2,a
2711  06a8 b601          	ld	a,_windowBigMessage$L+1
2712  06aa be00          	ld	x,_windowBigMessage$L
2713  06ac cd0000        	call	_displayWriteString
2715                     ; 253 	displayWriteString(a_strMessage2, DISPLAY_SELECT_FONT_5x7, 5, 40);	
2717  06af a628          	ld	a,#40
2718  06b1 b704          	ld	_displayWriteString$L+4,a
2719  06b3 a605          	ld	a,#5
2720  06b5 b703          	ld	_displayWriteString$L+3,a
2721  06b7 a61d          	ld	a,#29
2722  06b9 b702          	ld	_displayWriteString$L+2,a
2723  06bb b603          	ld	a,_windowBigMessage$L+3
2724  06bd be02          	ld	x,_windowBigMessage$L+2
2725  06bf cd0000        	call	_displayWriteString
2727                     ; 256 	_bres(m_woDisplayedWindow, WIN_MODE);
2729  06c2 c60006        	ld	a,_m_woDisplayedWindow+1
2730  06c5 a4fe          	and	a,#254
2731  06c7 c70006        	ld	_m_woDisplayedWindow+1,a
2732                     ; 257 	_bres(m_woDisplayedWindow, WIN_SPEED);
2734  06ca c60006        	ld	a,_m_woDisplayedWindow+1
2735  06cd a4fd          	and	a,#253
2736  06cf c70006        	ld	_m_woDisplayedWindow+1,a
2737                     ; 258 	_bres(m_woDisplayedWindow, WIN_CYLINDER_SIZE);
2739  06d2 c60006        	ld	a,_m_woDisplayedWindow+1
2740  06d5 a4ff          	and	a,#255
2741  06d7 c70006        	ld	_m_woDisplayedWindow+1,a
2742  06da c60005        	ld	a,_m_woDisplayedWindow
2743  06dd a47f          	and	a,#127
2744  06df c70005        	ld	_m_woDisplayedWindow,a
2745                     ; 259 	_bres(m_woDisplayedWindow, WIN_DAC_BASE);
2747  06e2 c60006        	ld	a,_m_woDisplayedWindow+1
2748  06e5 a4ff          	and	a,#255
2749  06e7 c70006        	ld	_m_woDisplayedWindow+1,a
2750  06ea c60005        	ld	a,_m_woDisplayedWindow
2751  06ed a4bf          	and	a,#191
2752  06ef c70005        	ld	_m_woDisplayedWindow,a
2753                     ; 260 	_bres(m_woDisplayedWindow, WIN_OSCILLOSCOPE);
2755  06f2 c60006        	ld	a,_m_woDisplayedWindow+1
2756  06f5 a4fb          	and	a,#251
2757  06f7 c70006        	ld	_m_woDisplayedWindow+1,a
2758                     ; 261 	_bres(m_woDisplayedWindow, WIN_REGISTER);
2760  06fa c60006        	ld	a,_m_woDisplayedWindow+1
2761  06fd a4f7          	and	a,#247
2762  06ff c70006        	ld	_m_woDisplayedWindow+1,a
2763                     ; 262 	_bres(m_woDisplayedWindow, WIN_ALARM);
2765  0702 c60006        	ld	a,_m_woDisplayedWindow+1
2766  0705 a4ef          	and	a,#239
2767  0707 c70006        	ld	_m_woDisplayedWindow+1,a
2768                     ; 263 	_bset(m_woDisplayedWindow, WIN_MESSAGE);
2770  070a c60006        	ld	a,_m_woDisplayedWindow+1
2771  070d aa20          	or	a,#32
2772  070f c70006        	ld	_m_woDisplayedWindow+1,a
2773                     ; 264 	_bres(m_woDisplayedWindow, WIN_FUNCTIONS);
2775  0712 c60006        	ld	a,_m_woDisplayedWindow+1
2776  0715 a4bf          	and	a,#191
2777  0717 c70006        	ld	_m_woDisplayedWindow+1,a
2778                     ; 265 	_bres(m_woDisplayedWindow, WIN_PARAMETERS);
2780  071a c60006        	ld	a,_m_woDisplayedWindow+1
2781  071d a47f          	and	a,#127
2782  071f c70006        	ld	_m_woDisplayedWindow+1,a
2783                     ; 266 	_bres(m_woDisplayedWindow, WIN_TESTS);
2785  0722 c60006        	ld	a,_m_woDisplayedWindow+1
2786  0725 a4ff          	and	a,#255
2787  0727 c70006        	ld	_m_woDisplayedWindow+1,a
2788  072a c60005        	ld	a,_m_woDisplayedWindow
2789  072d a4fe          	and	a,#254
2790  072f c70005        	ld	_m_woDisplayedWindow,a
2791                     ; 267 	_bres(m_woDisplayedWindow, WIN_SETUP);
2793  0732 c60006        	ld	a,_m_woDisplayedWindow+1
2794  0735 a4ff          	and	a,#255
2795  0737 c70006        	ld	_m_woDisplayedWindow+1,a
2796  073a c60005        	ld	a,_m_woDisplayedWindow
2797  073d a4fb          	and	a,#251
2798  073f c70005        	ld	_m_woDisplayedWindow,a
2799                     ; 268 	_bres(m_woDisplayedWindow, WIN_MENUS);
2801  0742 c60006        	ld	a,_m_woDisplayedWindow+1
2802  0745 a4ff          	and	a,#255
2803  0747 c70006        	ld	_m_woDisplayedWindow+1,a
2804  074a c60005        	ld	a,_m_woDisplayedWindow
2805  074d a4fd          	and	a,#253
2806  074f c70005        	ld	_m_woDisplayedWindow,a
2807                     ; 269 	_bres(m_woDisplayedWindow, WIN_ARCHIVES);
2809  0752 c60006        	ld	a,_m_woDisplayedWindow+1
2810  0755 a4ff          	and	a,#255
2811  0757 c70006        	ld	_m_woDisplayedWindow+1,a
2812  075a c60005        	ld	a,_m_woDisplayedWindow
2813  075d a4f7          	and	a,#247
2814  075f c70005        	ld	_m_woDisplayedWindow,a
2815                     ; 270 	_bres(m_woDisplayedWindow, WIN_APPLICATION);
2817  0762 c60006        	ld	a,_m_woDisplayedWindow+1
2818  0765 a4ff          	and	a,#255
2819  0767 c70006        	ld	_m_woDisplayedWindow+1,a
2820  076a c60005        	ld	a,_m_woDisplayedWindow
2821  076d a4ef          	and	a,#239
2822  076f c70005        	ld	_m_woDisplayedWindow,a
2823                     ; 271 	_bres(m_woDisplayedWindow, WIN_ENCODER);
2825  0772 c60006        	ld	a,_m_woDisplayedWindow+1
2826  0775 a4ff          	and	a,#255
2827  0777 c70006        	ld	_m_woDisplayedWindow+1,a
2828  077a c60005        	ld	a,_m_woDisplayedWindow
2829  077d a4df          	and	a,#223
2830  077f c70005        	ld	_m_woDisplayedWindow,a
2831                     ; 272 }
2834  0782 81            	ret
2890                     ; 275 void windowAlarm(void)
2890                     ; 276 {
2891                     	switch	.text
2893                     	xref.b	_windowAlarm$L
2894  0783               _windowAlarm:
2897                     ; 280 	woAlarm = parametersGetValue(PARAM_ALARM);
2899  0783 a607          	ld	a,#7
2900  0785 cd0000        	call	_parametersGetValue
2902  0788 b7ff          	ld	_windowAlarm$L-1,a
2903  078a bffe          	ld	_windowAlarm$L-2,x
2904                     ; 282 	if (!_btst(m_woDisplayedWindow, WIN_ALARM) || parametersIsChanged(PARAM_ALARM)) //Not displayed
2906  078c c60006        	ld	a,_m_woDisplayedWindow+1
2907  078f a510          	bcp	a,#16
2908  0791 270b          	jreq	L7121
2910  0793 a607          	ld	a,#7
2911  0795 cd0000        	call	_parametersIsChanged
2913  0798 4d            	tnz	a
2914  0799 2603          	jrne	L011
2915  079b cc0a3b        	jp	L5121
2916  079e               L011:
2917  079e               L7121:
2918                     ; 284 		displayClearArea(WINDOW_3_LEFT, WINDOW_3_TOP, WINDOW_3_RIGHT, WINDOW_3_BOTTOM);
2920  079e a640          	ld	a,#64
2921  07a0 b703          	ld	_displayClearArea$L+3,a
2922  07a2 a67e          	ld	a,#126
2923  07a4 b702          	ld	_displayClearArea$L+2,a
2924  07a6 a612          	ld	a,#18
2925  07a8 5f            	clr	x
2926  07a9 cd0000        	call	_displayClearArea
2928                     ; 285 		displaySetOutLine(WINDOW_3_LEFT, WINDOW_3_TOP, WINDOW_3_RIGHT, WINDOW_3_BOTTOM, false);
2930  07ac 3f04          	clr	_displaySetOutLine$L+4
2931  07ae a640          	ld	a,#64
2932  07b0 b703          	ld	_displaySetOutLine$L+3,a
2933  07b2 a67e          	ld	a,#126
2934  07b4 b702          	ld	_displaySetOutLine$L+2,a
2935  07b6 a612          	ld	a,#18
2936  07b8 5f            	clr	x
2937  07b9 cd0000        	call	_displaySetOutLine
2939                     ; 288 		displayWriteString(labelGet(LABEL_ALARM), DISPLAY_SELECT_FONT_MINI, WINDOW_3_LEFT+2, WINDOW_3_TOP+6);
2941  07bc a618          	ld	a,#24
2942  07be b704          	ld	_displayWriteString$L+4,a
2943  07c0 a602          	ld	a,#2
2944  07c2 b703          	ld	_displayWriteString$L+3,a
2945  07c4 a61c          	ld	a,#28
2946  07c6 b702          	ld	_displayWriteString$L+2,a
2947  07c8 a606          	ld	a,#6
2948  07ca cd0000        	call	_labelGet
2950  07cd cd0000        	call	_displayWriteString
2952                     ; 289 		displayInvertArea(WINDOW_3_LEFT+1, WINDOW_3_TOP+1, WINDOW_3_RIGHT-2, WINDOW_3_TOP+6);
2954  07d0 a618          	ld	a,#24
2955  07d2 b703          	ld	_displayInvertArea$L+3,a
2956  07d4 a67c          	ld	a,#124
2957  07d6 b702          	ld	_displayInvertArea$L+2,a
2958  07d8 a613          	ld	a,#19
2959  07da ae01          	ld	x,#1
2960  07dc cd0000        	call	_displayInvertArea
2962                     ; 291 		if _btst(woAlarm, STI_ANSWER_ALARM_CYLINDER_TRAVEL)
2964  07df b6fe          	ld	a,_windowAlarm$L-2
2965  07e1 a501          	bcp	a,#1
2966  07e3 273d          	jreq	L1221
2967                     ; 293 			displayWriteString(labelGet(LABEL_ALARM_CYLINDER_TRAVEL_01), DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+20);	
2969  07e5 a626          	ld	a,#38
2970  07e7 b704          	ld	_displayWriteString$L+4,a
2971  07e9 a605          	ld	a,#5
2972  07eb b703          	ld	_displayWriteString$L+3,a
2973  07ed a61d          	ld	a,#29
2974  07ef b702          	ld	_displayWriteString$L+2,a
2975  07f1 a60f          	ld	a,#15
2976  07f3 cd0000        	call	_labelGet
2978  07f6 cd0000        	call	_displayWriteString
2980                     ; 294 			displayWriteString(labelGet(LABEL_ALARM_CYLINDER_TRAVEL_02), DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+30);	
2982  07f9 a630          	ld	a,#48
2983  07fb b704          	ld	_displayWriteString$L+4,a
2984  07fd a605          	ld	a,#5
2985  07ff b703          	ld	_displayWriteString$L+3,a
2986  0801 a61d          	ld	a,#29
2987  0803 b702          	ld	_displayWriteString$L+2,a
2988  0805 a610          	ld	a,#16
2989  0807 cd0000        	call	_labelGet
2991  080a cd0000        	call	_displayWriteString
2993                     ; 296 			_bres(woAlarm,STI_ANSWER_ALARM_CYLINDER_TRAVEL);
2995  080d 11fe          	bres	_windowAlarm$L-2,#0
2996                     ; 297 			parametersSet(PARAM_ALARM, woAlarm);
2998  080f befe          	ld	x,_windowAlarm$L-2
2999  0811 bf01          	ld	_parametersSet$L+1,x
3000  0813 b6ff          	ld	a,_windowAlarm$L-1
3001  0815 b702          	ld	_parametersSet$L+2,a
3002  0817 a607          	ld	a,#7
3003  0819 cd0000        	call	_parametersSet
3005                     ; 298 			sleepFix();
3007  081c cd0000        	call	_sleepFix
3010  081f cc0a3b        	jp	L5121
3011  0822               L1221:
3012                     ; 300 		else if _btst(woAlarm, STI_ANSWER_ALARM_GATE_WINDOW)
3014  0822 b6fe          	ld	a,_windowAlarm$L-2
3015  0824 a502          	bcp	a,#2
3016  0826 273d          	jreq	L5221
3017                     ; 302 			displayWriteString(labelGet(LABEL_ALARM_GATE_WINDOW_01), DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+20);	
3019  0828 a626          	ld	a,#38
3020  082a b704          	ld	_displayWriteString$L+4,a
3021  082c a605          	ld	a,#5
3022  082e b703          	ld	_displayWriteString$L+3,a
3023  0830 a61d          	ld	a,#29
3024  0832 b702          	ld	_displayWriteString$L+2,a
3025  0834 a611          	ld	a,#17
3026  0836 cd0000        	call	_labelGet
3028  0839 cd0000        	call	_displayWriteString
3030                     ; 303 			displayWriteString(labelGet(LABEL_ALARM_GATE_WINDOW_02), DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+30);	
3032  083c a630          	ld	a,#48
3033  083e b704          	ld	_displayWriteString$L+4,a
3034  0840 a605          	ld	a,#5
3035  0842 b703          	ld	_displayWriteString$L+3,a
3036  0844 a61d          	ld	a,#29
3037  0846 b702          	ld	_displayWriteString$L+2,a
3038  0848 a612          	ld	a,#18
3039  084a cd0000        	call	_labelGet
3041  084d cd0000        	call	_displayWriteString
3043                     ; 305 			_bres(woAlarm,STI_ANSWER_ALARM_GATE_WINDOW);
3045  0850 13fe          	bres	_windowAlarm$L-2,#1
3046                     ; 306 			parametersSet(PARAM_ALARM, woAlarm);
3048  0852 befe          	ld	x,_windowAlarm$L-2
3049  0854 bf01          	ld	_parametersSet$L+1,x
3050  0856 b6ff          	ld	a,_windowAlarm$L-1
3051  0858 b702          	ld	_parametersSet$L+2,a
3052  085a a607          	ld	a,#7
3053  085c cd0000        	call	_parametersSet
3055                     ; 307 			sleepFix();
3057  085f cd0000        	call	_sleepFix
3060  0862 cc0a3b        	jp	L5121
3061  0865               L5221:
3062                     ; 309 		else if _btst(woAlarm, STI_ANSWER_ALARM_ERR_TEST_SH)
3064  0865 b6ff          	ld	a,_windowAlarm$L-1
3065  0867 a501          	bcp	a,#1
3066  0869 273d          	jreq	L1321
3067                     ; 311 			displayWriteString(labelGet(LABEL_ALARM_ERR_TEST_SH_01), DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+20);	
3069  086b a626          	ld	a,#38
3070  086d b704          	ld	_displayWriteString$L+4,a
3071  086f a605          	ld	a,#5
3072  0871 b703          	ld	_displayWriteString$L+3,a
3073  0873 a61d          	ld	a,#29
3074  0875 b702          	ld	_displayWriteString$L+2,a
3075  0877 a609          	ld	a,#9
3076  0879 cd0000        	call	_labelGet
3078  087c cd0000        	call	_displayWriteString
3080                     ; 312 			displayWriteString(labelGet(LABEL_ALARM_ERR_TEST_SH_02), DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+30);	
3082  087f a630          	ld	a,#48
3083  0881 b704          	ld	_displayWriteString$L+4,a
3084  0883 a605          	ld	a,#5
3085  0885 b703          	ld	_displayWriteString$L+3,a
3086  0887 a61d          	ld	a,#29
3087  0889 b702          	ld	_displayWriteString$L+2,a
3088  088b a60a          	ld	a,#10
3089  088d cd0000        	call	_labelGet
3091  0890 cd0000        	call	_displayWriteString
3093                     ; 313 			_bres(woAlarm,STI_ANSWER_ALARM_ERR_TEST_SH);
3095  0893 11ff          	bres	_windowAlarm$L-1,#0
3096                     ; 314 			parametersSet(PARAM_ALARM, woAlarm);
3098  0895 befe          	ld	x,_windowAlarm$L-2
3099  0897 bf01          	ld	_parametersSet$L+1,x
3100  0899 b6ff          	ld	a,_windowAlarm$L-1
3101  089b b702          	ld	_parametersSet$L+2,a
3102  089d a607          	ld	a,#7
3103  089f cd0000        	call	_parametersSet
3105                     ; 315 			sleepFix();
3107  08a2 cd0000        	call	_sleepFix
3110  08a5 cc0a3b        	jp	L5121
3111  08a8               L1321:
3112                     ; 317 		else if _btst(woAlarm, STI_ANSWER_ALARM_ERR_TEST_ENC)
3114  08a8 b6ff          	ld	a,_windowAlarm$L-1
3115  08aa a502          	bcp	a,#2
3116  08ac 273d          	jreq	L5321
3117                     ; 319 			displayWriteString(labelGet(LABEL_ALARM_ERR_TEST_ENC_01), DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+20);	
3119  08ae a626          	ld	a,#38
3120  08b0 b704          	ld	_displayWriteString$L+4,a
3121  08b2 a605          	ld	a,#5
3122  08b4 b703          	ld	_displayWriteString$L+3,a
3123  08b6 a61d          	ld	a,#29
3124  08b8 b702          	ld	_displayWriteString$L+2,a
3125  08ba a60b          	ld	a,#11
3126  08bc cd0000        	call	_labelGet
3128  08bf cd0000        	call	_displayWriteString
3130                     ; 320 			displayWriteString(labelGet(LABEL_ALARM_ERR_TEST_ENC_02), DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+30);	
3132  08c2 a630          	ld	a,#48
3133  08c4 b704          	ld	_displayWriteString$L+4,a
3134  08c6 a605          	ld	a,#5
3135  08c8 b703          	ld	_displayWriteString$L+3,a
3136  08ca a61d          	ld	a,#29
3137  08cc b702          	ld	_displayWriteString$L+2,a
3138  08ce a60c          	ld	a,#12
3139  08d0 cd0000        	call	_labelGet
3141  08d3 cd0000        	call	_displayWriteString
3143                     ; 321 			_bres(woAlarm,STI_ANSWER_ALARM_ERR_TEST_ENC);
3145  08d6 13ff          	bres	_windowAlarm$L-1,#1
3146                     ; 322 			parametersSet(PARAM_ALARM, woAlarm);
3148  08d8 befe          	ld	x,_windowAlarm$L-2
3149  08da bf01          	ld	_parametersSet$L+1,x
3150  08dc b6ff          	ld	a,_windowAlarm$L-1
3151  08de b702          	ld	_parametersSet$L+2,a
3152  08e0 a607          	ld	a,#7
3153  08e2 cd0000        	call	_parametersSet
3155                     ; 323 			sleepFix();
3157  08e5 cd0000        	call	_sleepFix
3160  08e8 cc0a3b        	jp	L5121
3161  08eb               L5321:
3162                     ; 325 		else if _btst(woAlarm, STI_ANSWER_ALARM_ERR_PHASE_AUTO)
3164  08eb b6ff          	ld	a,_windowAlarm$L-1
3165  08ed a504          	bcp	a,#4
3166  08ef 273d          	jreq	L1421
3167                     ; 327 			displayWriteString(labelGet(LABEL_ALARM_ERR_PHASE_AUTO_01), DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+20);	
3169  08f1 a626          	ld	a,#38
3170  08f3 b704          	ld	_displayWriteString$L+4,a
3171  08f5 a605          	ld	a,#5
3172  08f7 b703          	ld	_displayWriteString$L+3,a
3173  08f9 a61d          	ld	a,#29
3174  08fb b702          	ld	_displayWriteString$L+2,a
3175  08fd a60d          	ld	a,#13
3176  08ff cd0000        	call	_labelGet
3178  0902 cd0000        	call	_displayWriteString
3180                     ; 328 			displayWriteString(labelGet(LABEL_ALARM_ERR_PHASE_AUTO_02), DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+30);	
3182  0905 a630          	ld	a,#48
3183  0907 b704          	ld	_displayWriteString$L+4,a
3184  0909 a605          	ld	a,#5
3185  090b b703          	ld	_displayWriteString$L+3,a
3186  090d a61d          	ld	a,#29
3187  090f b702          	ld	_displayWriteString$L+2,a
3188  0911 a60e          	ld	a,#14
3189  0913 cd0000        	call	_labelGet
3191  0916 cd0000        	call	_displayWriteString
3193                     ; 329 			_bres(woAlarm,STI_ANSWER_ALARM_ERR_PHASE_AUTO);
3195  0919 15ff          	bres	_windowAlarm$L-1,#2
3196                     ; 330 			parametersSet(PARAM_ALARM, woAlarm);
3198  091b befe          	ld	x,_windowAlarm$L-2
3199  091d bf01          	ld	_parametersSet$L+1,x
3200  091f b6ff          	ld	a,_windowAlarm$L-1
3201  0921 b702          	ld	_parametersSet$L+2,a
3202  0923 a607          	ld	a,#7
3203  0925 cd0000        	call	_parametersSet
3205                     ; 331 			sleepFix();
3207  0928 cd0000        	call	_sleepFix
3210  092b cc0a3b        	jp	L5121
3211  092e               L1421:
3212                     ; 333 		else if _btst(woAlarm, STI_ANSWER_ALARM_ERR_DOUBLE_MARK)
3214  092e b6fe          	ld	a,_windowAlarm$L-2
3215  0930 a580          	bcp	a,#128
3216  0932 2729          	jreq	L5421
3217                     ; 335 			displayWriteString(labelGet(LABEL_ALARM_ERR_DOUBLE_MARK), DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+25);	
3219  0934 a62b          	ld	a,#43
3220  0936 b704          	ld	_displayWriteString$L+4,a
3221  0938 a605          	ld	a,#5
3222  093a b703          	ld	_displayWriteString$L+3,a
3223  093c a61d          	ld	a,#29
3224  093e b702          	ld	_displayWriteString$L+2,a
3225  0940 a641          	ld	a,#65
3226  0942 cd0000        	call	_labelGet
3228  0945 cd0000        	call	_displayWriteString
3230                     ; 336 			_bres(woAlarm,STI_ANSWER_ALARM_ERR_DOUBLE_MARK);
3232  0948 1ffe          	bres	_windowAlarm$L-2,#7
3233                     ; 337 			parametersSet(PARAM_ALARM, woAlarm);
3235  094a befe          	ld	x,_windowAlarm$L-2
3236  094c bf01          	ld	_parametersSet$L+1,x
3237  094e b6ff          	ld	a,_windowAlarm$L-1
3238  0950 b702          	ld	_parametersSet$L+2,a
3239  0952 a607          	ld	a,#7
3240  0954 cd0000        	call	_parametersSet
3242                     ; 338 			sleepFix();
3244  0957 cd0000        	call	_sleepFix
3247  095a cc0a3b        	jp	L5121
3248  095d               L5421:
3249                     ; 341 		else if _btst(woAlarm, STI_ANSWER_ALARM_ERR_LOW_SPEED)
3251  095d b6fe          	ld	a,_windowAlarm$L-2
3252  095f a520          	bcp	a,#32
3253  0961 2717          	jreq	L1521
3254                     ; 343 			displayWriteString(labelGet(LABEL_ALARM_ERR_LOW_SPEED), DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+25);	
3256  0963 a62b          	ld	a,#43
3257  0965 b704          	ld	_displayWriteString$L+4,a
3258  0967 a605          	ld	a,#5
3259  0969 b703          	ld	_displayWriteString$L+3,a
3260  096b a61d          	ld	a,#29
3261  096d b702          	ld	_displayWriteString$L+2,a
3262  096f a608          	ld	a,#8
3263  0971 cd0000        	call	_labelGet
3265  0974 cd0000        	call	_displayWriteString
3268  0977 cc0a3b        	jp	L5121
3269  097a               L1521:
3270                     ; 345 		else if _btst(woAlarm, STI_ANSWER_ALARM_ERR_ACCELERATION)
3272  097a b6ff          	ld	a,_windowAlarm$L-1
3273  097c a510          	bcp	a,#16
3274  097e 2717          	jreq	L5521
3275                     ; 347 			displayWriteString(labelGet(LABEL_ALARM_ERR_ACCELERATION), DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+25);	
3277  0980 a62b          	ld	a,#43
3278  0982 b704          	ld	_displayWriteString$L+4,a
3279  0984 a605          	ld	a,#5
3280  0986 b703          	ld	_displayWriteString$L+3,a
3281  0988 a61d          	ld	a,#29
3282  098a b702          	ld	_displayWriteString$L+2,a
3283  098c a63f          	ld	a,#63
3284  098e cd0000        	call	_labelGet
3286  0991 cd0000        	call	_displayWriteString
3289  0994 cc0a3b        	jp	L5121
3290  0997               L5521:
3291                     ; 349 		else if _btst(woAlarm, STI_ANSWER_ALARM_ERR_DECELERATION)
3293  0997 b6ff          	ld	a,_windowAlarm$L-1
3294  0999 a508          	bcp	a,#8
3295  099b 2717          	jreq	L1621
3296                     ; 351 			displayWriteString(labelGet(LABEL_ALARM_ERR_DECELERATION), DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+25);	
3298  099d a62b          	ld	a,#43
3299  099f b704          	ld	_displayWriteString$L+4,a
3300  09a1 a605          	ld	a,#5
3301  09a3 b703          	ld	_displayWriteString$L+3,a
3302  09a5 a61d          	ld	a,#29
3303  09a7 b702          	ld	_displayWriteString$L+2,a
3304  09a9 a640          	ld	a,#64
3305  09ab cd0000        	call	_labelGet
3307  09ae cd0000        	call	_displayWriteString
3310  09b1 cc0a3b        	jp	L5121
3311  09b4               L1621:
3312                     ; 353 		else if _btst(woAlarm, STI_ANSWER_ALARM_ERR_NO_PRINT)
3314  09b4 b6fe          	ld	a,_windowAlarm$L-2
3315  09b6 a510          	bcp	a,#16
3316  09b8 2716          	jreq	L5621
3317                     ; 355 			displayWriteString(labelGet(LABEL_ALARM_ERR_NO_PRINT), DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+25);	
3319  09ba a62b          	ld	a,#43
3320  09bc b704          	ld	_displayWriteString$L+4,a
3321  09be a605          	ld	a,#5
3322  09c0 b703          	ld	_displayWriteString$L+3,a
3323  09c2 a61d          	ld	a,#29
3324  09c4 b702          	ld	_displayWriteString$L+2,a
3325  09c6 a607          	ld	a,#7
3326  09c8 cd0000        	call	_labelGet
3328  09cb cd0000        	call	_displayWriteString
3331  09ce 206b          	jra	L5121
3332  09d0               L5621:
3333                     ; 357 		else if _btst(woAlarm, STI_ANSWER_OK)
3335  09d0 b6ff          	ld	a,_windowAlarm$L-1
3336  09d2 a501          	bcp	a,#1
3337  09d4 2716          	jreq	L1721
3338                     ; 359 			displayWriteString(labelGet(LABEL_ANSWER_OK), DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+25);	
3340  09d6 a62b          	ld	a,#43
3341  09d8 b704          	ld	_displayWriteString$L+4,a
3342  09da a605          	ld	a,#5
3343  09dc b703          	ld	_displayWriteString$L+3,a
3344  09de a61d          	ld	a,#29
3345  09e0 b702          	ld	_displayWriteString$L+2,a
3346  09e2 a613          	ld	a,#19
3347  09e4 cd0000        	call	_labelGet
3349  09e7 cd0000        	call	_displayWriteString
3352  09ea 204f          	jra	L5121
3353  09ec               L1721:
3354                     ; 363 			memcpy(strValue, labelGet(LABEL_GENERIC_ALARM_01), 16);
3356  09ec a610          	ld	a,#16
3357  09ee b704          	ld	_memcpy$L+4,a
3358  09f0 a614          	ld	a,#20
3359  09f2 cd0000        	call	_labelGet
3361  09f5 b703          	ld	_memcpy$L+3,a
3362  09f7 bf02          	ld	_memcpy$L+2,x
3363  09f9 a6ee          	ld	a,#_windowAlarm$L-18
3364  09fb 5f            	clr	x
3365  09fc cd0000        	call	_memcpy
3367                     ; 364 			formatNumber(parametersGetValue(PARAM_ALARM), 5, 0, strValue + 8);
3369  09ff aef6          	ld	x,#high(_windowAlarm$L-10)
3370  0a01 bf04          	ld	_formatNumber$L+4,x
3371  0a03 a6f6          	ld	a,#low(_windowAlarm$L-10)
3372  0a05 b705          	ld	_formatNumber$L+5,a
3373  0a07 3f03          	clr	_formatNumber$L+3
3374  0a09 a605          	ld	a,#5
3375  0a0b b702          	ld	_formatNumber$L+2,a
3376  0a0d a607          	ld	a,#7
3377  0a0f cd0000        	call	_parametersGetValue
3379  0a12 cd0000        	call	_formatNumber
3381                     ; 366 			displayWriteString(strValue, DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+20);	
3383  0a15 a626          	ld	a,#38
3384  0a17 b704          	ld	_displayWriteString$L+4,a
3385  0a19 a605          	ld	a,#5
3386  0a1b b703          	ld	_displayWriteString$L+3,a
3387  0a1d a61d          	ld	a,#29
3388  0a1f b702          	ld	_displayWriteString$L+2,a
3389  0a21 a6ee          	ld	a,#_windowAlarm$L-18
3390  0a23 5f            	clr	x
3391  0a24 cd0000        	call	_displayWriteString
3393                     ; 367 			displayWriteString(labelGet(LABEL_GENERIC_ALARM_02), DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+5, WINDOW_3_TOP+30);	
3395  0a27 a630          	ld	a,#48
3396  0a29 b704          	ld	_displayWriteString$L+4,a
3397  0a2b a605          	ld	a,#5
3398  0a2d b703          	ld	_displayWriteString$L+3,a
3399  0a2f a61d          	ld	a,#29
3400  0a31 b702          	ld	_displayWriteString$L+2,a
3401  0a33 a615          	ld	a,#21
3402  0a35 cd0000        	call	_labelGet
3404  0a38 cd0000        	call	_displayWriteString
3406  0a3b               L5121:
3407                     ; 371 	parametersChangedFlagReset(PARAM_ALARM);
3409  0a3b a607          	ld	a,#7
3410  0a3d cd0000        	call	_parametersChangedFlagReset
3412                     ; 374 	_bres(m_woDisplayedWindow, WIN_OSCILLOSCOPE);
3414  0a40 c60006        	ld	a,_m_woDisplayedWindow+1
3415  0a43 a4fb          	and	a,#251
3416  0a45 c70006        	ld	_m_woDisplayedWindow+1,a
3417                     ; 375 	_bres(m_woDisplayedWindow, WIN_REGISTER);
3419  0a48 c60006        	ld	a,_m_woDisplayedWindow+1
3420  0a4b a4f7          	and	a,#247
3421  0a4d c70006        	ld	_m_woDisplayedWindow+1,a
3422                     ; 376 	_bset(m_woDisplayedWindow, WIN_ALARM);
3424  0a50 c60006        	ld	a,_m_woDisplayedWindow+1
3425  0a53 aa10          	or	a,#16
3426  0a55 c70006        	ld	_m_woDisplayedWindow+1,a
3427                     ; 377 	_bres(m_woDisplayedWindow, WIN_MESSAGE);
3429  0a58 c60006        	ld	a,_m_woDisplayedWindow+1
3430  0a5b a4df          	and	a,#223
3431  0a5d c70006        	ld	_m_woDisplayedWindow+1,a
3432                     ; 378 	_bres(m_woDisplayedWindow, WIN_FUNCTIONS);
3434  0a60 c60006        	ld	a,_m_woDisplayedWindow+1
3435  0a63 a4bf          	and	a,#191
3436  0a65 c70006        	ld	_m_woDisplayedWindow+1,a
3437                     ; 379 	_bres(m_woDisplayedWindow, WIN_PARAMETERS);
3439  0a68 c60006        	ld	a,_m_woDisplayedWindow+1
3440  0a6b a47f          	and	a,#127
3441  0a6d c70006        	ld	_m_woDisplayedWindow+1,a
3442                     ; 380 	_bres(m_woDisplayedWindow, WIN_TESTS);
3444  0a70 c60006        	ld	a,_m_woDisplayedWindow+1
3445  0a73 a4ff          	and	a,#255
3446  0a75 c70006        	ld	_m_woDisplayedWindow+1,a
3447  0a78 c60005        	ld	a,_m_woDisplayedWindow
3448  0a7b a4fe          	and	a,#254
3449  0a7d c70005        	ld	_m_woDisplayedWindow,a
3450                     ; 381 	_bres(m_woDisplayedWindow, WIN_SETUP);
3452  0a80 c60006        	ld	a,_m_woDisplayedWindow+1
3453  0a83 a4ff          	and	a,#255
3454  0a85 c70006        	ld	_m_woDisplayedWindow+1,a
3455  0a88 c60005        	ld	a,_m_woDisplayedWindow
3456  0a8b a4fb          	and	a,#251
3457  0a8d c70005        	ld	_m_woDisplayedWindow,a
3458                     ; 382 	_bres(m_woDisplayedWindow, WIN_MENUS);
3460  0a90 c60006        	ld	a,_m_woDisplayedWindow+1
3461  0a93 a4ff          	and	a,#255
3462  0a95 c70006        	ld	_m_woDisplayedWindow+1,a
3463  0a98 c60005        	ld	a,_m_woDisplayedWindow
3464  0a9b a4fd          	and	a,#253
3465  0a9d c70005        	ld	_m_woDisplayedWindow,a
3466                     ; 383 	_bres(m_woDisplayedWindow, WIN_ARCHIVES);
3468  0aa0 c60006        	ld	a,_m_woDisplayedWindow+1
3469  0aa3 a4ff          	and	a,#255
3470  0aa5 c70006        	ld	_m_woDisplayedWindow+1,a
3471  0aa8 c60005        	ld	a,_m_woDisplayedWindow
3472  0aab a4f7          	and	a,#247
3473  0aad c70005        	ld	_m_woDisplayedWindow,a
3474                     ; 384 	_bres(m_woDisplayedWindow, WIN_APPLICATION);
3476  0ab0 c60006        	ld	a,_m_woDisplayedWindow+1
3477  0ab3 a4ff          	and	a,#255
3478  0ab5 c70006        	ld	_m_woDisplayedWindow+1,a
3479  0ab8 c60005        	ld	a,_m_woDisplayedWindow
3480  0abb a4ef          	and	a,#239
3481  0abd c70005        	ld	_m_woDisplayedWindow,a
3482                     ; 385 	_bres(m_woDisplayedWindow, WIN_ENCODER);
3484  0ac0 c60006        	ld	a,_m_woDisplayedWindow+1
3485  0ac3 a4ff          	and	a,#255
3486  0ac5 c70006        	ld	_m_woDisplayedWindow+1,a
3487  0ac8 c60005        	ld	a,_m_woDisplayedWindow
3488  0acb a4df          	and	a,#223
3489  0acd c70005        	ld	_m_woDisplayedWindow,a
3490                     ; 386 }
3493  0ad0 81            	ret
3537                     ; 390 BYTE windowOscilloscopeGetValue(WORD a_woEncIndex)
3537                     ; 391 {
3538                     	switch	.text
3540                     	xref.b	_windowOscilloscopeGetValue$L
3541  0ad1               _windowOscilloscopeGetValue:
3543  0ad1 b701          	ld	_windowOscilloscopeGetValue$L+1,a
3544  0ad3 bf00          	ld	_windowOscilloscopeGetValue$L,x
3546                     ; 394 	a_woEncIndex = (a_woEncIndex+8)& (ENCODER_PULSES-1);
3548  0ad5 b601          	ld	a,_windowOscilloscopeGetValue$L+1
3549  0ad7 be00          	ld	x,_windowOscilloscopeGetValue$L
3550  0ad9 ab08          	add	a,#8
3551  0adb 2401          	jrnc	L411
3552  0add 5c            	inc	x
3553  0ade               L411:
3554  0ade a4ff          	and	a,#255
3555  0ae0 88            	push	a
3556  0ae1 9f            	ld	a,x
3557  0ae2 a403          	and	a,#3
3558  0ae4 97            	ld	x,a
3559  0ae5 84            	pop	a
3560  0ae6 b701          	ld	_windowOscilloscopeGetValue$L+1,a
3561  0ae8 bf00          	ld	_windowOscilloscopeGetValue$L,x
3562                     ; 395 	byValue = m_arbyScanningHeadSignal[(WORD)(a_woEncIndex>>2)];  //Array Index
3564  0aea b601          	ld	a,_windowOscilloscopeGetValue$L+1
3565  0aec be00          	ld	x,_windowOscilloscopeGetValue$L
3566  0aee 54            	srl	x
3567  0aef 46            	rrc	a
3568  0af0 54            	srl	x
3569  0af1 46            	rrc	a
3570  0af2 ab00          	add	a,#low(_m_arbyScanningHeadSignal)
3571  0af4 88            	push	a
3572  0af5 9f            	ld	a,x
3573  0af6 a900          	adc	a,#high(_m_arbyScanningHeadSignal)
3574  0af8 97            	ld	x,a
3575  0af9 84            	pop	a
3576  0afa bf00          	ld	c_x,x
3577  0afc 97            	ld	x,a
3578  0afd bf01          	ld	c_x+1,x
3579  0aff 92c600        	ld	a,[c_x.w]
3580  0b02 b7ff          	ld	_windowOscilloscopeGetValue$L-1,a
3581                     ; 397 	switch ((BYTE)(a_woEncIndex & 0x0003)) //0b00000011 -->  Byte Index
3583  0b04 b601          	ld	a,_windowOscilloscopeGetValue$L+1
3584  0b06 a403          	and	a,#3
3586                     ; 410 			break;
3588  0b08 4d            	tnz	a
3589  0b09 270b          	jreq	L5721
3590  0b0b 4a            	dec	a
3591  0b0c 2712          	jreq	L7721
3592  0b0e 4a            	dec	a
3593  0b0f 2717          	jreq	L1031
3594  0b11 4a            	dec	a
3595  0b12 271b          	jreq	L3031
3596  0b14 201e          	jra	L1331
3597  0b16               L5721:
3598                     ; 399 		case 0:
3598                     ; 400 			return (BYTE)((byValue & 0b11000000)>>6);
3600  0b16 b6ff          	ld	a,_windowOscilloscopeGetValue$L-1
3601  0b18 a4c0          	and	a,#192
3602  0b1a 4e            	swap	a
3603  0b1b 44            	srl	a
3604  0b1c 44            	srl	a
3605  0b1d a403          	and	a,#3
3608  0b1f 81            	ret
3609  0b20               L7721:
3610                     ; 402 		case 1:
3610                     ; 403 			return (BYTE)((byValue & 0b00110000)>>4);
3613  0b20 b6ff          	ld	a,_windowOscilloscopeGetValue$L-1
3614  0b22 a430          	and	a,#48
3615  0b24 4e            	swap	a
3616  0b25 a40f          	and	a,#15
3619  0b27 81            	ret
3620  0b28               L1031:
3621                     ; 405 		case 2:
3621                     ; 406 			return (BYTE)((byValue & 0b00001100)>>2);
3624  0b28 b6ff          	ld	a,_windowOscilloscopeGetValue$L-1
3625  0b2a a40c          	and	a,#12
3626  0b2c 44            	srl	a
3627  0b2d 44            	srl	a
3630  0b2e 81            	ret
3631  0b2f               L3031:
3632                     ; 408 		case 3:
3632                     ; 409 			return (BYTE)(byValue & 0b00000011);
3635  0b2f b6ff          	ld	a,_windowOscilloscopeGetValue$L-1
3636  0b31 a403          	and	a,#3
3639  0b33 81            	ret
3640  0b34               L1331:
3641                     ; 413 }
3644  0b34 81            	ret
3679                     ; 417 BYTE windowIsInGate(WORD a_woEncIndex)
3679                     ; 418 {
3680                     	switch	.text
3682                     	xref.b	_windowIsInGate$L
3683  0b35               _windowIsInGate:
3685  0b35 b701          	ld	_windowIsInGate$L+1,a
3686  0b37 bf00          	ld	_windowIsInGate$L,x
3688                     ; 419 	if (m_woEncoderGateEnd > m_woEncoderGateStart)
3690  0b39 c60001        	ld	a,_m_woEncoderGateStart+1
3691  0b3c c00001        	sub	a,_m_woEncoderGateEnd+1
3692  0b3f c60000        	ld	a,_m_woEncoderGateStart
3693  0b42 c20000        	sbc	a,_m_woEncoderGateEnd
3694  0b45 241e          	jruge	L1531
3695                     ; 421 		return ((a_woEncIndex >m_woEncoderGateStart) && (a_woEncIndex<m_woEncoderGateEnd));
3697  0b47 c60001        	ld	a,_m_woEncoderGateStart+1
3698  0b4a b001          	sub	a,_windowIsInGate$L+1
3699  0b4c c60000        	ld	a,_m_woEncoderGateStart
3700  0b4f b200          	sbc	a,_windowIsInGate$L
3701  0b51 2410          	jruge	L021
3702  0b53 b601          	ld	a,_windowIsInGate$L+1
3703  0b55 c00001        	sub	a,_m_woEncoderGateEnd+1
3704  0b58 b600          	ld	a,_windowIsInGate$L
3705  0b5a c20000        	sbc	a,_m_woEncoderGateEnd
3706  0b5d 2404          	jruge	L021
3707  0b5f a601          	ld	a,#1
3708  0b61 2001          	jra	L221
3709  0b63               L021:
3710  0b63 4f            	clr	a
3711  0b64               L221:
3714  0b64 81            	ret
3715  0b65               L1531:
3716                     ; 425 		return ((a_woEncIndex >m_woEncoderGateStart) || (a_woEncIndex<m_woEncoderGateEnd));
3718  0b65 c60001        	ld	a,_m_woEncoderGateStart+1
3719  0b68 b001          	sub	a,_windowIsInGate$L+1
3720  0b6a c60000        	ld	a,_m_woEncoderGateStart
3721  0b6d b200          	sbc	a,_windowIsInGate$L
3722  0b6f 250c          	jrult	L621
3723  0b71 b601          	ld	a,_windowIsInGate$L+1
3724  0b73 c00001        	sub	a,_m_woEncoderGateEnd+1
3725  0b76 b600          	ld	a,_windowIsInGate$L
3726  0b78 c20000        	sbc	a,_m_woEncoderGateEnd
3727  0b7b 2404          	jruge	L421
3728  0b7d               L621:
3729  0b7d a601          	ld	a,#1
3730  0b7f 2001          	jra	L031
3731  0b81               L421:
3732  0b81 4f            	clr	a
3733  0b82               L031:
3736  0b82 81            	ret
3774                     ; 430 WORD windowOffsetToHaveCenteredGate(void)
3774                     ; 431 {
3775                     	switch	.text
3777                     	xref.b	_windowOffsetToHaveCenteredGate$L
3778  0b83               _windowOffsetToHaveCenteredGate:
3781                     ; 434 	if ((m_woEncoderGateStart != 0xFFFF) && (m_woEncoderGateEnd != 0xFFFF))
3783  0b83 c60001        	ld	a,_m_woEncoderGateStart+1
3784  0b86 a1ff          	cp	a,#255
3785  0b88 2605          	jrne	L431
3786  0b8a ce0000        	ld	x,_m_woEncoderGateStart
3787  0b8d a3ff          	cp	x,#255
3788  0b8f               L431:
3789  0b8f 2603          	jrne	L041
3790  0b91 cc0c1e        	jp	L3731
3791  0b94               L041:
3793  0b94 c60001        	ld	a,_m_woEncoderGateEnd+1
3794  0b97 a1ff          	cp	a,#255
3795  0b99 2605          	jrne	L631
3796  0b9b ce0000        	ld	x,_m_woEncoderGateEnd
3797  0b9e a3ff          	cp	x,#255
3798  0ba0               L631:
3799  0ba0 2602          	jrne	L241
3800  0ba2 207a          	jp	L3731
3801  0ba4               L241:
3802                     ; 436 		if (m_woEncoderGateEnd > m_woEncoderGateStart)
3804  0ba4 c60001        	ld	a,_m_woEncoderGateStart+1
3805  0ba7 c00001        	sub	a,_m_woEncoderGateEnd+1
3806  0baa c60000        	ld	a,_m_woEncoderGateStart
3807  0bad c20000        	sbc	a,_m_woEncoderGateEnd
3808  0bb0 2418          	jruge	L5731
3809                     ; 438 			woEncoderGateCenter = (m_woEncoderGateEnd + m_woEncoderGateStart)/2;
3811  0bb2 c60001        	ld	a,_m_woEncoderGateEnd+1
3812  0bb5 ce0000        	ld	x,_m_woEncoderGateEnd
3813  0bb8 cb0001        	add	a,_m_woEncoderGateStart+1
3814  0bbb 88            	push	a
3815  0bbc 9f            	ld	a,x
3816  0bbd c90000        	adc	a,_m_woEncoderGateStart
3817  0bc0 97            	ld	x,a
3818  0bc1 84            	pop	a
3819  0bc2 54            	srl	x
3820  0bc3 46            	rrc	a
3821  0bc4 b7ff          	ld	_windowOffsetToHaveCenteredGate$L-1,a
3822  0bc6 bffe          	ld	_windowOffsetToHaveCenteredGate$L-2,x
3824  0bc8 2026          	jra	L7731
3825  0bca               L5731:
3826                     ; 442 			woEncoderGateCenter = ((ENCODER_PULSES+m_woEncoderGateEnd+m_woEncoderGateStart)/2)& (ENCODER_PULSES-1);
3828  0bca c60001        	ld	a,_m_woEncoderGateEnd+1
3829  0bcd ce0000        	ld	x,_m_woEncoderGateEnd
3830  0bd0 cb0001        	add	a,_m_woEncoderGateStart+1
3831  0bd3 88            	push	a
3832  0bd4 9f            	ld	a,x
3833  0bd5 c90000        	adc	a,_m_woEncoderGateStart
3834  0bd8 97            	ld	x,a
3835  0bd9 84            	pop	a
3836  0bda ab00          	add	a,#0
3837  0bdc 88            	push	a
3838  0bdd 9f            	ld	a,x
3839  0bde a904          	adc	a,#4
3840  0be0 97            	ld	x,a
3841  0be1 84            	pop	a
3842  0be2 54            	srl	x
3843  0be3 46            	rrc	a
3844  0be4 a4ff          	and	a,#255
3845  0be6 88            	push	a
3846  0be7 9f            	ld	a,x
3847  0be8 a403          	and	a,#3
3848  0bea 97            	ld	x,a
3849  0beb 84            	pop	a
3850  0bec b7ff          	ld	_windowOffsetToHaveCenteredGate$L-1,a
3851  0bee bffe          	ld	_windowOffsetToHaveCenteredGate$L-2,x
3852  0bf0               L7731:
3853                     ; 445 		return (WORD) (ENCODER_PULSES + woEncoderGateCenter - (((WINDOW_3_WIDTH-4)/2)*parametersGetValue(PARAM_OSCIL_ZOOM)))& (ENCODER_PULSES-1);
3855  0bf0 a610          	ld	a,#16
3856  0bf2 cd0000        	call	_parametersGetValue
3858  0bf5 3f00          	clr	c_y
3859  0bf7 90ae3d        	ld	y,#61
3860  0bfa cd0000        	call	c_imul
3862  0bfd b7fd          	ld	_windowOffsetToHaveCenteredGate$L-3,a
3863  0bff bffc          	ld	_windowOffsetToHaveCenteredGate$L-4,x
3864  0c01 b6ff          	ld	a,_windowOffsetToHaveCenteredGate$L-1
3865  0c03 befe          	ld	x,_windowOffsetToHaveCenteredGate$L-2
3866  0c05 ab00          	add	a,#0
3867  0c07 88            	push	a
3868  0c08 9f            	ld	a,x
3869  0c09 a904          	adc	a,#4
3870  0c0b 97            	ld	x,a
3871  0c0c 84            	pop	a
3872  0c0d b0fd          	sub	a,_windowOffsetToHaveCenteredGate$L-3
3873  0c0f 88            	push	a
3874  0c10 9f            	ld	a,x
3875  0c11 b2fc          	sbc	a,_windowOffsetToHaveCenteredGate$L-4
3876  0c13 97            	ld	x,a
3877  0c14 84            	pop	a
3878  0c15 a4ff          	and	a,#255
3879  0c17 88            	push	a
3880  0c18 9f            	ld	a,x
3881  0c19 a403          	and	a,#3
3882  0c1b 97            	ld	x,a
3883  0c1c 84            	pop	a
3886  0c1d 81            	ret
3887  0c1e               L3731:
3888                     ; 447 	return 0x0000;
3890  0c1e 5f            	clr	x
3891  0c1f 4f            	clr	a
3894  0c20 81            	ret
4017                     ; 452 void windowOscilloscope(BYTE a_byPage)
4017                     ; 453 {
4018                     	switch	.text
4020                     	xref.b	_windowOscilloscope$L
4021  0c21               _windowOscilloscope:
4023  0c21 b700          	ld	_windowOscilloscope$L,a
4025                     ; 460 	BYTE byPrevValue = WINDOW_3_OSCILLOSCOPE_Y;
4027  0c23 a63c          	ld	a,#60
4028  0c25 b7f6          	ld	_windowOscilloscope$L-10,a
4029                     ; 467 	if (!_btst(m_woDisplayedWindow, WIN_OSCILLOSCOPE)) //Not displayed
4031  0c27 c60006        	ld	a,_m_woDisplayedWindow+1
4032  0c2a a504          	bcp	a,#4
4033  0c2c 2703          	jreq	L471
4034  0c2e cc0cc7        	jp	L5641
4035  0c31               L471:
4036                     ; 469 		displayClearArea(WINDOW_3_LEFT, WINDOW_3_TOP, WINDOW_3_RIGHT, WINDOW_3_BOTTOM);
4038  0c31 a640          	ld	a,#64
4039  0c33 b703          	ld	_displayClearArea$L+3,a
4040  0c35 a67e          	ld	a,#126
4041  0c37 b702          	ld	_displayClearArea$L+2,a
4042  0c39 a612          	ld	a,#18
4043  0c3b 5f            	clr	x
4044  0c3c cd0000        	call	_displayClearArea
4046                     ; 470 		displaySetOutLine(WINDOW_3_LEFT, WINDOW_3_TOP, WINDOW_3_RIGHT, WINDOW_3_BOTTOM, false);
4048  0c3f 3f04          	clr	_displaySetOutLine$L+4
4049  0c41 a640          	ld	a,#64
4050  0c43 b703          	ld	_displaySetOutLine$L+3,a
4051  0c45 a67e          	ld	a,#126
4052  0c47 b702          	ld	_displaySetOutLine$L+2,a
4053  0c49 a612          	ld	a,#18
4054  0c4b 5f            	clr	x
4055  0c4c cd0000        	call	_displaySetOutLine
4057                     ; 473 		switch(a_byPage)
4059  0c4f b600          	ld	a,_windowOscilloscope$L
4061                     ; 483 				break;
4062  0c51 a006          	sub	a,#6
4063  0c53 2719          	jreq	L1041
4064  0c55 4a            	dec	a
4065  0c56 272c          	jreq	L3041
4066  0c58               L5041:
4067                     ; 481 			default:
4067                     ; 482 				displayWriteString(labelGet(LABEL_OSCILLOSCOPE), DISPLAY_SELECT_FONT_MINI, WINDOW_3_LEFT+2, WINDOW_3_TOP+6);
4069  0c58 a618          	ld	a,#24
4070  0c5a b704          	ld	_displayWriteString$L+4,a
4071  0c5c a602          	ld	a,#2
4072  0c5e b703          	ld	_displayWriteString$L+3,a
4073  0c60 a61c          	ld	a,#28
4074  0c62 b702          	ld	_displayWriteString$L+2,a
4075  0c64 a618          	ld	a,#24
4076  0c66 cd0000        	call	_labelGet
4078  0c69 cd0000        	call	_displayWriteString
4080                     ; 483 				break;
4082  0c6c 202a          	jra	L1741
4083  0c6e               L1041:
4084                     ; 475 			case PAGE_PHASE_OSCILL:
4084                     ; 476 				displayWriteString(labelGet(LABEL_PHASE_OSCILL), DISPLAY_SELECT_FONT_MINI, WINDOW_3_LEFT+2, WINDOW_3_TOP+6);
4086  0c6e a618          	ld	a,#24
4087  0c70 b704          	ld	_displayWriteString$L+4,a
4088  0c72 a602          	ld	a,#2
4089  0c74 b703          	ld	_displayWriteString$L+3,a
4090  0c76 a61c          	ld	a,#28
4091  0c78 b702          	ld	_displayWriteString$L+2,a
4092  0c7a a616          	ld	a,#22
4093  0c7c cd0000        	call	_labelGet
4095  0c7f cd0000        	call	_displayWriteString
4097                     ; 477 				break;
4099  0c82 2014          	jra	L1741
4100  0c84               L3041:
4101                     ; 478 			case PAGE_PHASE_FAST:
4101                     ; 479 				displayWriteString(labelGet(LABEL_PHASE_FAST), DISPLAY_SELECT_FONT_MINI, WINDOW_3_LEFT+2, WINDOW_3_TOP+6);
4103  0c84 a618          	ld	a,#24
4104  0c86 b704          	ld	_displayWriteString$L+4,a
4105  0c88 a602          	ld	a,#2
4106  0c8a b703          	ld	_displayWriteString$L+3,a
4107  0c8c a61c          	ld	a,#28
4108  0c8e b702          	ld	_displayWriteString$L+2,a
4109  0c90 a617          	ld	a,#23
4110  0c92 cd0000        	call	_labelGet
4112  0c95 cd0000        	call	_displayWriteString
4114                     ; 480 				break;
4116  0c98               L1741:
4117                     ; 486 		displayInvertArea(WINDOW_3_LEFT+1, WINDOW_3_TOP+1, WINDOW_3_RIGHT-2, WINDOW_3_TOP+7);
4119  0c98 a619          	ld	a,#25
4120  0c9a b703          	ld	_displayInvertArea$L+3,a
4121  0c9c a67c          	ld	a,#124
4122  0c9e b702          	ld	_displayInvertArea$L+2,a
4123  0ca0 a613          	ld	a,#19
4124  0ca2 ae01          	ld	x,#1
4125  0ca4 cd0000        	call	_displayInvertArea
4127                     ; 489 		parametersSet(PARAM_OSCIL_ZOOM, 0x0002);
4129  0ca7 a602          	ld	a,#2
4130  0ca9 b702          	ld	_parametersSet$L+2,a
4131  0cab 3f01          	clr	_parametersSet$L+1
4132  0cad a610          	ld	a,#16
4133  0caf cd0000        	call	_parametersSet
4135                     ; 490 		parametersSet(PARAM_OSCIL_OFFSET, windowOffsetToHaveCenteredGate());
4137  0cb2 cd0b83        	call	_windowOffsetToHaveCenteredGate
4139  0cb5 b702          	ld	_parametersSet$L+2,a
4140  0cb7 bf01          	ld	_parametersSet$L+1,x
4141  0cb9 a611          	ld	a,#17
4142  0cbb cd0000        	call	_parametersSet
4144                     ; 491 		parametersSet(PARAM_OSCIL_MANUAL_OFFSET, 0x0000);
4146  0cbe 3f01          	clr	_parametersSet$L+1
4147  0cc0 3f02          	clr	_parametersSet$L+2
4148  0cc2 a612          	ld	a,#18
4149  0cc4 cd0000        	call	_parametersSet
4151  0cc7               L5641:
4152                     ; 504 	if ((m_woEncoderGateStart != 0xFFFF) && (m_woEncoderGateEnd != 0xFFFF))
4154  0cc7 c60001        	ld	a,_m_woEncoderGateStart+1
4155  0cca a1ff          	cp	a,#255
4156  0ccc 2605          	jrne	L641
4157  0cce ce0000        	ld	x,_m_woEncoderGateStart
4158  0cd1 a3ff          	cp	x,#255
4159  0cd3               L641:
4160  0cd3 2603          	jrne	L671
4161  0cd5 cc0e62        	jp	L3741
4162  0cd8               L671:
4164  0cd8 c60001        	ld	a,_m_woEncoderGateEnd+1
4165  0cdb a1ff          	cp	a,#255
4166  0cdd 2605          	jrne	L051
4167  0cdf ce0000        	ld	x,_m_woEncoderGateEnd
4168  0ce2 a3ff          	cp	x,#255
4169  0ce4               L051:
4170  0ce4 2603          	jrne	L002
4171  0ce6 cc0e62        	jp	L3741
4172  0ce9               L002:
4173                     ; 506 		woEncoderIndex = parametersGetValue(PARAM_OSCIL_OFFSET);
4175  0ce9 a611          	ld	a,#17
4176  0ceb cd0000        	call	_parametersGetValue
4178  0cee b7fd          	ld	_windowOscilloscope$L-3,a
4179  0cf0 bffc          	ld	_windowOscilloscope$L-4,x
4180                     ; 508 		if(a_byPage == PAGE_PHASE_OSCILL)
4182  0cf2 b600          	ld	a,_windowOscilloscope$L
4183  0cf4 a106          	cp	a,#6
4184  0cf6 262b          	jrne	L5741
4185                     ; 510 			woEncoderIndexOnGate = (ENCODER_PULSES + woEncoderIndex - parametersGetValue(PARAM_OSCIL_MANUAL_OFFSET)) & (ENCODER_PULSES-1);
4187  0cf8 a612          	ld	a,#18
4188  0cfa cd0000        	call	_parametersGetValue
4190  0cfd b7f5          	ld	_windowOscilloscope$L-11,a
4191  0cff bff4          	ld	_windowOscilloscope$L-12,x
4192  0d01 b6fd          	ld	a,_windowOscilloscope$L-3
4193  0d03 befc          	ld	x,_windowOscilloscope$L-4
4194  0d05 ab00          	add	a,#0
4195  0d07 88            	push	a
4196  0d08 9f            	ld	a,x
4197  0d09 a904          	adc	a,#4
4198  0d0b 97            	ld	x,a
4199  0d0c 84            	pop	a
4200  0d0d b0f5          	sub	a,_windowOscilloscope$L-11
4201  0d0f 88            	push	a
4202  0d10 9f            	ld	a,x
4203  0d11 b2f4          	sbc	a,_windowOscilloscope$L-12
4204  0d13 97            	ld	x,a
4205  0d14 84            	pop	a
4206  0d15 a4ff          	and	a,#255
4207  0d17 88            	push	a
4208  0d18 9f            	ld	a,x
4209  0d19 a403          	and	a,#3
4210  0d1b 97            	ld	x,a
4211  0d1c 84            	pop	a
4212  0d1d b7fb          	ld	_windowOscilloscope$L-5,a
4213  0d1f bffa          	ld	_windowOscilloscope$L-6,x
4215  0d21 2008          	jra	L7741
4216  0d23               L5741:
4217                     ; 514 			woEncoderIndexOnGate = woEncoderIndex;
4219  0d23 befc          	ld	x,_windowOscilloscope$L-4
4220  0d25 bffa          	ld	_windowOscilloscope$L-6,x
4221  0d27 b6fd          	ld	a,_windowOscilloscope$L-3
4222  0d29 b7fb          	ld	_windowOscilloscope$L-5,a
4223  0d2b               L7741:
4224                     ; 517 		byPrevGateValue = windowIsInGate((woEncoderIndexOnGate+parametersGetValue(PARAM_OSCIL_ZOOM)-1)& (ENCODER_PULSES-1))?WINDOW_3_GATE_LOW_Y:WINDOW_3_GATE_HIGH_Y;
4226  0d2b a610          	ld	a,#16
4227  0d2d cd0000        	call	_parametersGetValue
4229  0d30 bbfb          	add	a,_windowOscilloscope$L-5
4230  0d32 88            	push	a
4231  0d33 9f            	ld	a,x
4232  0d34 b9fa          	adc	a,_windowOscilloscope$L-6
4233  0d36 97            	ld	x,a
4234  0d37 84            	pop	a
4235  0d38 4d            	tnz	a
4236  0d39 2601          	jrne	L451
4237  0d3b 5a            	dec	x
4238  0d3c               L451:
4239  0d3c 4a            	dec	a
4240  0d3d a4ff          	and	a,#255
4241  0d3f 88            	push	a
4242  0d40 9f            	ld	a,x
4243  0d41 a403          	and	a,#3
4244  0d43 97            	ld	x,a
4245  0d44 84            	pop	a
4246  0d45 cd0b35        	call	_windowIsInGate
4248  0d48 4d            	tnz	a
4249  0d49 2704          	jreq	L251
4250  0d4b a628          	ld	a,#40
4251  0d4d 2002          	jra	L651
4252  0d4f               L251:
4253  0d4f a623          	ld	a,#35
4254  0d51               L651:
4255  0d51 b7f7          	ld	_windowOscilloscope$L-9,a
4256                     ; 520 		m_arbyDisplayCommand[0] = DISPLAY_CLEAR_AREA;
4258  0d53 a612          	ld	a,#18
4259  0d55 c70000        	ld	_m_arbyDisplayCommand,a
4260                     ; 521 		m_arbyDisplayCommand[5] = DISPLAY_WAIT;
4262  0d58 a6fe          	ld	a,#254
4263  0d5a c70005        	ld	_m_arbyDisplayCommand+5,a
4264                     ; 522 		m_arbyDisplayCommand[6] = DISPLAY_SET_AREA;
4266  0d5d a611          	ld	a,#17
4267  0d5f c70006        	ld	_m_arbyDisplayCommand+6,a
4268                     ; 523 		m_arbyDisplayCommand[11] = DISPLAY_EOF;		
4270  0d62 a6ff          	ld	a,#255
4271  0d64 c7000b        	ld	_m_arbyDisplayCommand+11,a
4272                     ; 526 		for(i=0; (i<(WINDOW_3_WIDTH-4)&&(!displayIsKeyPressed())) ; i++)
4274  0d67 3ff9          	clr	_windowOscilloscope$L-7
4276  0d69 cc0e44        	jp	L5051
4277  0d6c               L1051:
4278                     ; 529 			j = parametersGetValue(PARAM_OSCIL_ZOOM);
4280  0d6c a610          	ld	a,#16
4281  0d6e cd0000        	call	_parametersGetValue
4283  0d71 b7f8          	ld	_windowOscilloscope$L-8,a
4284                     ; 530 			byValue = 0x0000;
4286  0d73 3fff          	clr	_windowOscilloscope$L-1
4288  0d75 2040          	jra	L5151
4289  0d77               L1151:
4290                     ; 533 				byValue = (WORD) MAX(byValue,windowOscilloscopeGetValue(woEncoderIndex));  //(woValue>arwoValue[j]?woValue:arwoValue[j]);
4292  0d77 b6fd          	ld	a,_windowOscilloscope$L-3
4293  0d79 befc          	ld	x,_windowOscilloscope$L-4
4294  0d7b cd0ad1        	call	_windowOscilloscopeGetValue
4296  0d7e b1ff          	cp	a,_windowOscilloscope$L-1
4297  0d80 2404          	jruge	L061
4298  0d82 b6ff          	ld	a,_windowOscilloscope$L-1
4299  0d84 2007          	jra	L261
4300  0d86               L061:
4301  0d86 b6fd          	ld	a,_windowOscilloscope$L-3
4302  0d88 befc          	ld	x,_windowOscilloscope$L-4
4303  0d8a cd0ad1        	call	_windowOscilloscopeGetValue
4305  0d8d               L261:
4306  0d8d b7ff          	ld	_windowOscilloscope$L-1,a
4307                     ; 535 				woEncoderIndex = (woEncoderIndex+1) & (ENCODER_PULSES-1);
4309  0d8f b6fd          	ld	a,_windowOscilloscope$L-3
4310  0d91 befc          	ld	x,_windowOscilloscope$L-4
4311  0d93 4c            	inc	a
4312  0d94 2601          	jrne	L461
4313  0d96 5c            	inc	x
4314  0d97               L461:
4315  0d97 a4ff          	and	a,#255
4316  0d99 88            	push	a
4317  0d9a 9f            	ld	a,x
4318  0d9b a403          	and	a,#3
4319  0d9d 97            	ld	x,a
4320  0d9e 84            	pop	a
4321  0d9f b7fd          	ld	_windowOscilloscope$L-3,a
4322  0da1 bffc          	ld	_windowOscilloscope$L-4,x
4323                     ; 536 				woEncoderIndexOnGate = (woEncoderIndexOnGate+1) & (ENCODER_PULSES-1);
4325  0da3 b6fb          	ld	a,_windowOscilloscope$L-5
4326  0da5 befa          	ld	x,_windowOscilloscope$L-6
4327  0da7 4c            	inc	a
4328  0da8 2601          	jrne	L661
4329  0daa 5c            	inc	x
4330  0dab               L661:
4331  0dab a4ff          	and	a,#255
4332  0dad 88            	push	a
4333  0dae 9f            	ld	a,x
4334  0daf a403          	and	a,#3
4335  0db1 97            	ld	x,a
4336  0db2 84            	pop	a
4337  0db3 b7fb          	ld	_windowOscilloscope$L-5,a
4338  0db5 bffa          	ld	_windowOscilloscope$L-6,x
4339  0db7               L5151:
4340                     ; 531 			while(j-->0)
4342  0db7 b6f8          	ld	a,_windowOscilloscope$L-8
4343  0db9 3af8          	dec	_windowOscilloscope$L-8
4344  0dbb 4d            	tnz	a
4345  0dbc 26b9          	jrne	L1151
4346                     ; 539 			byValue = WINDOW_3_OSCILLOSCOPE_Y-(byValue<<2);
4348  0dbe b6ff          	ld	a,_windowOscilloscope$L-1
4349  0dc0 48            	sll	a
4350  0dc1 48            	sll	a
4351  0dc2 a03c          	sub	a,#60
4352  0dc4 40            	neg	a
4353  0dc5 b7ff          	ld	_windowOscilloscope$L-1,a
4354                     ; 540 			byLeft = WINDOW_3_LEFT + i + 2;
4356  0dc7 b6f9          	ld	a,_windowOscilloscope$L-7
4357  0dc9 ab02          	add	a,#2
4358  0dcb b7fe          	ld	_windowOscilloscope$L-2,a
4359                     ; 545 			m_arbyDisplayCommand[1] = byLeft;
4361  0dcd b6fe          	ld	a,_windowOscilloscope$L-2
4362  0dcf c70001        	ld	_m_arbyDisplayCommand+1,a
4363                     ; 546 			m_arbyDisplayCommand[2] = WINDOW_3_GATE_LOW_Y;
4365  0dd2 a628          	ld	a,#40
4366  0dd4 c70002        	ld	_m_arbyDisplayCommand+2,a
4367                     ; 547 			m_arbyDisplayCommand[3] = byLeft;
4369  0dd7 b6fe          	ld	a,_windowOscilloscope$L-2
4370  0dd9 c70003        	ld	_m_arbyDisplayCommand+3,a
4371                     ; 548 			m_arbyDisplayCommand[4] = WINDOW_3_GATE_HIGH_Y; 
4373  0ddc a623          	ld	a,#35
4374  0dde c70004        	ld	_m_arbyDisplayCommand+4,a
4375                     ; 553 			m_arbyDisplayCommand[7] = byLeft;
4377  0de1 b6fe          	ld	a,_windowOscilloscope$L-2
4378  0de3 c70007        	ld	_m_arbyDisplayCommand+7,a
4379                     ; 554 			m_arbyDisplayCommand[8] = byPrevGateValue;
4381  0de6 b6f7          	ld	a,_windowOscilloscope$L-9
4382  0de8 c70008        	ld	_m_arbyDisplayCommand+8,a
4383                     ; 555 			m_arbyDisplayCommand[9] = byLeft;
4385  0deb b6fe          	ld	a,_windowOscilloscope$L-2
4386  0ded c70009        	ld	_m_arbyDisplayCommand+9,a
4387                     ; 556 			m_arbyDisplayCommand[10] = windowIsInGate(woEncoderIndexOnGate)?WINDOW_3_GATE_LOW_Y:WINDOW_3_GATE_HIGH_Y; 
4389  0df0 b6fb          	ld	a,_windowOscilloscope$L-5
4390  0df2 befa          	ld	x,_windowOscilloscope$L-6
4391  0df4 cd0b35        	call	_windowIsInGate
4393  0df7 4d            	tnz	a
4394  0df8 2704          	jreq	L071
4395  0dfa a628          	ld	a,#40
4396  0dfc 2002          	jra	L271
4397  0dfe               L071:
4398  0dfe a623          	ld	a,#35
4399  0e00               L271:
4400  0e00 c7000a        	ld	_m_arbyDisplayCommand+10,a
4401                     ; 558 			byPrevGateValue =m_arbyDisplayCommand[10];
4403  0e03 c6000a        	ld	a,_m_arbyDisplayCommand+10
4404  0e06 b7f7          	ld	_windowOscilloscope$L-9,a
4405                     ; 560 			displayCmdToDisplay(m_arbyDisplayCommand);
4407  0e08 a600          	ld	a,#low(_m_arbyDisplayCommand)
4408  0e0a ae00          	ld	x,#high(_m_arbyDisplayCommand)
4409  0e0c cd0000        	call	_displayCmdToDisplay
4411                     ; 564 			m_arbyDisplayCommand[1] = byLeft;
4413  0e0f b6fe          	ld	a,_windowOscilloscope$L-2
4414  0e11 c70001        	ld	_m_arbyDisplayCommand+1,a
4415                     ; 565 			m_arbyDisplayCommand[2] = WINDOW_3_OSCILLOSCOPE_Y-12;
4417  0e14 a630          	ld	a,#48
4418  0e16 c70002        	ld	_m_arbyDisplayCommand+2,a
4419                     ; 566 			m_arbyDisplayCommand[3] = byLeft;
4421  0e19 b6fe          	ld	a,_windowOscilloscope$L-2
4422  0e1b c70003        	ld	_m_arbyDisplayCommand+3,a
4423                     ; 567 			m_arbyDisplayCommand[4] = WINDOW_3_OSCILLOSCOPE_Y-1;
4425  0e1e a63b          	ld	a,#59
4426  0e20 c70004        	ld	_m_arbyDisplayCommand+4,a
4427                     ; 572 			m_arbyDisplayCommand[7] = byLeft;
4429  0e23 b6fe          	ld	a,_windowOscilloscope$L-2
4430  0e25 c70007        	ld	_m_arbyDisplayCommand+7,a
4431                     ; 573 			m_arbyDisplayCommand[8] = WINDOW_3_OSCILLOSCOPE_Y;
4433  0e28 a63c          	ld	a,#60
4434  0e2a c70008        	ld	_m_arbyDisplayCommand+8,a
4435                     ; 574 			m_arbyDisplayCommand[9] = byLeft;
4437  0e2d b6fe          	ld	a,_windowOscilloscope$L-2
4438  0e2f c70009        	ld	_m_arbyDisplayCommand+9,a
4439                     ; 575 			m_arbyDisplayCommand[10] = byValue;
4441  0e32 b6ff          	ld	a,_windowOscilloscope$L-1
4442  0e34 c7000a        	ld	_m_arbyDisplayCommand+10,a
4443                     ; 577 			byPrevValue = byValue;
4445  0e37 b6ff          	ld	a,_windowOscilloscope$L-1
4446  0e39 b7f6          	ld	_windowOscilloscope$L-10,a
4447                     ; 579 			displayCmdToDisplay(m_arbyDisplayCommand);			
4449  0e3b a600          	ld	a,#low(_m_arbyDisplayCommand)
4450  0e3d ae00          	ld	x,#high(_m_arbyDisplayCommand)
4451  0e3f cd0000        	call	_displayCmdToDisplay
4453                     ; 526 		for(i=0; (i<(WINDOW_3_WIDTH-4)&&(!displayIsKeyPressed())) ; i++)
4455  0e42 3cf9          	inc	_windowOscilloscope$L-7
4456  0e44               L5051:
4459  0e44 b6f9          	ld	a,_windowOscilloscope$L-7
4460  0e46 a17a          	cp	a,#122
4461  0e48 2409          	jruge	L1251
4463  0e4a cd0000        	call	_displayIsKeyPressed
4465  0e4d 4d            	tnz	a
4466  0e4e 2603          	jrne	L202
4467  0e50 cc0d6c        	jp	L1051
4468  0e53               L202:
4469  0e53               L1251:
4470                     ; 582 		parametersChangedFlagReset(PARAM_OSCIL_ZOOM);
4472  0e53 a610          	ld	a,#16
4473  0e55 cd0000        	call	_parametersChangedFlagReset
4475                     ; 583 		parametersChangedFlagReset(PARAM_OSCIL_OFFSET);
4477  0e58 a611          	ld	a,#17
4478  0e5a cd0000        	call	_parametersChangedFlagReset
4480                     ; 584 		parametersChangedFlagReset(PARAM_OSCIL_MANUAL_OFFSET);
4482  0e5d a612          	ld	a,#18
4483  0e5f cd0000        	call	_parametersChangedFlagReset
4485  0e62               L3741:
4486                     ; 588 	_bset(m_woDisplayedWindow, WIN_OSCILLOSCOPE);
4488  0e62 c60006        	ld	a,_m_woDisplayedWindow+1
4489  0e65 aa04          	or	a,#4
4490  0e67 c70006        	ld	_m_woDisplayedWindow+1,a
4491                     ; 589 	_bres(m_woDisplayedWindow, WIN_REGISTER);
4493  0e6a c60006        	ld	a,_m_woDisplayedWindow+1
4494  0e6d a4f7          	and	a,#247
4495  0e6f c70006        	ld	_m_woDisplayedWindow+1,a
4496                     ; 590 	_bres(m_woDisplayedWindow, WIN_ALARM);
4498  0e72 c60006        	ld	a,_m_woDisplayedWindow+1
4499  0e75 a4ef          	and	a,#239
4500  0e77 c70006        	ld	_m_woDisplayedWindow+1,a
4501                     ; 591 	_bres(m_woDisplayedWindow, WIN_MESSAGE);
4503  0e7a c60006        	ld	a,_m_woDisplayedWindow+1
4504  0e7d a4df          	and	a,#223
4505  0e7f c70006        	ld	_m_woDisplayedWindow+1,a
4506                     ; 592 	_bres(m_woDisplayedWindow, WIN_FUNCTIONS);
4508  0e82 c60006        	ld	a,_m_woDisplayedWindow+1
4509  0e85 a4bf          	and	a,#191
4510  0e87 c70006        	ld	_m_woDisplayedWindow+1,a
4511                     ; 593 	_bres(m_woDisplayedWindow, WIN_PARAMETERS);
4513  0e8a c60006        	ld	a,_m_woDisplayedWindow+1
4514  0e8d a47f          	and	a,#127
4515  0e8f c70006        	ld	_m_woDisplayedWindow+1,a
4516                     ; 594 	_bres(m_woDisplayedWindow, WIN_TESTS);
4518  0e92 c60006        	ld	a,_m_woDisplayedWindow+1
4519  0e95 a4ff          	and	a,#255
4520  0e97 c70006        	ld	_m_woDisplayedWindow+1,a
4521  0e9a c60005        	ld	a,_m_woDisplayedWindow
4522  0e9d a4fe          	and	a,#254
4523  0e9f c70005        	ld	_m_woDisplayedWindow,a
4524                     ; 595 	_bres(m_woDisplayedWindow, WIN_SETUP);
4526  0ea2 c60006        	ld	a,_m_woDisplayedWindow+1
4527  0ea5 a4ff          	and	a,#255
4528  0ea7 c70006        	ld	_m_woDisplayedWindow+1,a
4529  0eaa c60005        	ld	a,_m_woDisplayedWindow
4530  0ead a4fb          	and	a,#251
4531  0eaf c70005        	ld	_m_woDisplayedWindow,a
4532                     ; 596 	_bres(m_woDisplayedWindow, WIN_MENUS);
4534  0eb2 c60006        	ld	a,_m_woDisplayedWindow+1
4535  0eb5 a4ff          	and	a,#255
4536  0eb7 c70006        	ld	_m_woDisplayedWindow+1,a
4537  0eba c60005        	ld	a,_m_woDisplayedWindow
4538  0ebd a4fd          	and	a,#253
4539  0ebf c70005        	ld	_m_woDisplayedWindow,a
4540                     ; 597 	_bres(m_woDisplayedWindow, WIN_ARCHIVES);
4542  0ec2 c60006        	ld	a,_m_woDisplayedWindow+1
4543  0ec5 a4ff          	and	a,#255
4544  0ec7 c70006        	ld	_m_woDisplayedWindow+1,a
4545  0eca c60005        	ld	a,_m_woDisplayedWindow
4546  0ecd a4f7          	and	a,#247
4547  0ecf c70005        	ld	_m_woDisplayedWindow,a
4548                     ; 598 	_bres(m_woDisplayedWindow, WIN_APPLICATION);
4550  0ed2 c60006        	ld	a,_m_woDisplayedWindow+1
4551  0ed5 a4ff          	and	a,#255
4552  0ed7 c70006        	ld	_m_woDisplayedWindow+1,a
4553  0eda c60005        	ld	a,_m_woDisplayedWindow
4554  0edd a4ef          	and	a,#239
4555  0edf c70005        	ld	_m_woDisplayedWindow,a
4556                     ; 599 	_bres(m_woDisplayedWindow, WIN_ENCODER);
4558  0ee2 c60006        	ld	a,_m_woDisplayedWindow+1
4559  0ee5 a4ff          	and	a,#255
4560  0ee7 c70006        	ld	_m_woDisplayedWindow+1,a
4561  0eea c60005        	ld	a,_m_woDisplayedWindow
4562  0eed a4df          	and	a,#223
4563  0eef c70005        	ld	_m_woDisplayedWindow,a
4564                     ; 600 }
4567  0ef2 81            	ret
4613                     ; 603 void windowRegisterPrepareFormateValue(BYTE * a_strErrValue)
4613                     ; 604 {
4614                     	switch	.text
4616                     	xref.b	_windowRegisterPrepareFormateValue$L
4617  0ef3               _windowRegisterPrepareFormateValue:
4619  0ef3 b701          	ld	_windowRegisterPrepareFormateValue$L+1,a
4620  0ef5 bf00          	ld	_windowRegisterPrepareFormateValue$L,x
4622                     ; 607 	if (parametersGetValue(PARAM_ERR_LONG) > 0x8000)
4624  0ef7 a60e          	ld	a,#14
4625  0ef9 cd0000        	call	_parametersGetValue
4627  0efc a001          	sub	a,#1
4628  0efe 9f            	ld	a,x
4629  0eff a280          	sbc	a,#128
4630  0f01 2507          	jrult	L5451
4631                     ; 609 		a_strErrValue[0] = '+';
4633  0f03 a62b          	ld	a,#43
4634  0f05 92c700        	ld	[_windowRegisterPrepareFormateValue$L.w],a
4636  0f08 2018          	jra	L7451
4637  0f0a               L5451:
4638                     ; 611 	else if (parametersGetValue(PARAM_ERR_LONG) < 0x8000)
4640  0f0a a60e          	ld	a,#14
4641  0f0c cd0000        	call	_parametersGetValue
4643  0f0f a000          	sub	a,#0
4644  0f11 9f            	ld	a,x
4645  0f12 a280          	sbc	a,#128
4646  0f14 2407          	jruge	L1551
4647                     ; 613 		a_strErrValue[0] = '-';
4649  0f16 a62d          	ld	a,#45
4650  0f18 92c700        	ld	[_windowRegisterPrepareFormateValue$L.w],a
4652  0f1b 2005          	jra	L7451
4653  0f1d               L1551:
4654                     ; 617 		a_strErrValue[0] = ' ';
4656  0f1d a620          	ld	a,#32
4657  0f1f 92c700        	ld	[_windowRegisterPrepareFormateValue$L.w],a
4658  0f22               L7451:
4659                     ; 619 	a_strErrValue[6] = 0x00;
4661  0f22 ae06          	ld	x,#6
4662  0f24 4f            	clr	a
4663  0f25 92d700        	ld	([_windowRegisterPrepareFormateValue$L.w],x),a
4664                     ; 620 	a_strErrValue[7] = 0x00;
4666  0f28 ae07          	ld	x,#7
4667  0f2a 4f            	clr	a
4668  0f2b 92d700        	ld	([_windowRegisterPrepareFormateValue$L.w],x),a
4669                     ; 622 	woValue = parametersGetValue(PARAM_ERR_LONG) - 0x8000;
4671  0f2e a60e          	ld	a,#14
4672  0f30 cd0000        	call	_parametersGetValue
4674  0f33 a000          	sub	a,#0
4675  0f35 88            	push	a
4676  0f36 9f            	ld	a,x
4677  0f37 a280          	sbc	a,#128
4678  0f39 97            	ld	x,a
4679  0f3a 84            	pop	a
4680  0f3b b7ff          	ld	_windowRegisterPrepareFormateValue$L-1,a
4681  0f3d bffe          	ld	_windowRegisterPrepareFormateValue$L-2,x
4682                     ; 624 	if(woValue==0x0000) //never sent before
4684  0f3f b6ff          	ld	a,_windowRegisterPrepareFormateValue$L-1
4685  0f41 bafe          	or	a,_windowRegisterPrepareFormateValue$L-2
4686  0f43 2620          	jrne	L5551
4687                     ; 626 		a_strErrValue[0] = ' ';
4689  0f45 a620          	ld	a,#32
4690  0f47 92c700        	ld	[_windowRegisterPrepareFormateValue$L.w],a
4691                     ; 627 		formatNumber(0x0000, 6, 2, a_strErrValue+1);
4693  0f4a b601          	ld	a,_windowRegisterPrepareFormateValue$L+1
4694  0f4c be00          	ld	x,_windowRegisterPrepareFormateValue$L
4695  0f4e 4c            	inc	a
4696  0f4f 2601          	jrne	L602
4697  0f51 5c            	inc	x
4698  0f52               L602:
4699  0f52 b705          	ld	_formatNumber$L+5,a
4700  0f54 bf04          	ld	_formatNumber$L+4,x
4701  0f56 a602          	ld	a,#2
4702  0f58 b703          	ld	_formatNumber$L+3,a
4703  0f5a a606          	ld	a,#6
4704  0f5c b702          	ld	_formatNumber$L+2,a
4705  0f5e 5f            	clr	x
4706  0f5f 4f            	clr	a
4707  0f60 cd0000        	call	_formatNumber
4710  0f63 204c          	jra	L7551
4711  0f65               L5551:
4712                     ; 631 		if (woValue<0x8000)
4714  0f65 b6fe          	ld	a,_windowRegisterPrepareFormateValue$L-2
4715  0f67 a180          	cp	a,#128
4716  0f69 241d          	jruge	L1651
4717                     ; 633 			formatNumber(woValue, 6, 2, a_strErrValue+1);
4719  0f6b b601          	ld	a,_windowRegisterPrepareFormateValue$L+1
4720  0f6d be00          	ld	x,_windowRegisterPrepareFormateValue$L
4721  0f6f 4c            	inc	a
4722  0f70 2601          	jrne	L012
4723  0f72 5c            	inc	x
4724  0f73               L012:
4725  0f73 b705          	ld	_formatNumber$L+5,a
4726  0f75 bf04          	ld	_formatNumber$L+4,x
4727  0f77 a602          	ld	a,#2
4728  0f79 b703          	ld	_formatNumber$L+3,a
4729  0f7b a606          	ld	a,#6
4730  0f7d b702          	ld	_formatNumber$L+2,a
4731  0f7f b6ff          	ld	a,_windowRegisterPrepareFormateValue$L-1
4732  0f81 befe          	ld	x,_windowRegisterPrepareFormateValue$L-2
4733  0f83 cd0000        	call	_formatNumber
4736  0f86 2029          	jra	L7551
4737  0f88               L1651:
4738                     ; 638 			woValue = ((WORD)(~woValue)) + 1;
4740  0f88 b6ff          	ld	a,_windowRegisterPrepareFormateValue$L-1
4741  0f8a befe          	ld	x,_windowRegisterPrepareFormateValue$L-2
4742  0f8c 43            	cpl	a
4743  0f8d 53            	cpl	x
4744  0f8e 4c            	inc	a
4745  0f8f 2601          	jrne	L212
4746  0f91 5c            	inc	x
4747  0f92               L212:
4748  0f92 b7ff          	ld	_windowRegisterPrepareFormateValue$L-1,a
4749  0f94 bffe          	ld	_windowRegisterPrepareFormateValue$L-2,x
4750                     ; 639 			formatNumber(woValue, 6, 2, a_strErrValue+1);
4752  0f96 b601          	ld	a,_windowRegisterPrepareFormateValue$L+1
4753  0f98 be00          	ld	x,_windowRegisterPrepareFormateValue$L
4754  0f9a 4c            	inc	a
4755  0f9b 2601          	jrne	L412
4756  0f9d 5c            	inc	x
4757  0f9e               L412:
4758  0f9e b705          	ld	_formatNumber$L+5,a
4759  0fa0 bf04          	ld	_formatNumber$L+4,x
4760  0fa2 a602          	ld	a,#2
4761  0fa4 b703          	ld	_formatNumber$L+3,a
4762  0fa6 a606          	ld	a,#6
4763  0fa8 b702          	ld	_formatNumber$L+2,a
4764  0faa b6ff          	ld	a,_windowRegisterPrepareFormateValue$L-1
4765  0fac befe          	ld	x,_windowRegisterPrepareFormateValue$L-2
4766  0fae cd0000        	call	_formatNumber
4768  0fb1               L7551:
4769                     ; 642 }
4772  0fb1 81            	ret
4841                     ; 645 void windowRegister(void)
4841                     ; 646 {
4842                     	switch	.text
4844                     	xref.b	_windowRegister$L
4845  0fb2               _windowRegister:
4848                     ; 652 	byRulerTop = WINDOW_3_TOP+22;
4850  0fb2 a628          	ld	a,#40
4851  0fb4 b7ff          	ld	_windowRegister$L-1,a
4852                     ; 654 	if (!_btst(m_woDisplayedWindow, WIN_REGISTER)) //Not displayed
4854  0fb6 c60006        	ld	a,_m_woDisplayedWindow+1
4855  0fb9 a508          	bcp	a,#8
4856  0fbb 2703          	jreq	L242
4857  0fbd cc1086        	jp	L3161
4858  0fc0               L242:
4859                     ; 656 		displayClearArea(WINDOW_3_LEFT, WINDOW_3_TOP, WINDOW_3_RIGHT, WINDOW_3_BOTTOM);
4861  0fc0 a640          	ld	a,#64
4862  0fc2 b703          	ld	_displayClearArea$L+3,a
4863  0fc4 a67e          	ld	a,#126
4864  0fc6 b702          	ld	_displayClearArea$L+2,a
4865  0fc8 a612          	ld	a,#18
4866  0fca 5f            	clr	x
4867  0fcb cd0000        	call	_displayClearArea
4869                     ; 657 		displaySetOutLine(WINDOW_3_LEFT, WINDOW_3_TOP, WINDOW_3_RIGHT, WINDOW_3_BOTTOM, false);
4871  0fce 3f04          	clr	_displaySetOutLine$L+4
4872  0fd0 a640          	ld	a,#64
4873  0fd2 b703          	ld	_displaySetOutLine$L+3,a
4874  0fd4 a67e          	ld	a,#126
4875  0fd6 b702          	ld	_displaySetOutLine$L+2,a
4876  0fd8 a612          	ld	a,#18
4877  0fda 5f            	clr	x
4878  0fdb cd0000        	call	_displaySetOutLine
4880                     ; 660 		if (parametersGetValue(PARAM_TWIN_APPLICATION_01) != 0x00)
4882  0fde a634          	ld	a,#52
4883  0fe0 cd0000        	call	_parametersGetValue
4885  0fe3 4d            	tnz	a
4886  0fe4 2601          	jrne	L022
4887  0fe6 5d            	tnz	x
4888  0fe7               L022:
4889  0fe7 271e          	jreq	L5161
4890                     ; 662 			displayWriteString(labelGet(LABEL_REGISTER + parametersGetValue(PARAM_TWIN_CURRENT_APPLICATION)), DISPLAY_SELECT_FONT_MINI, WINDOW_3_LEFT+2, WINDOW_3_TOP+6);
4892  0fe9 a618          	ld	a,#24
4893  0feb b704          	ld	_displayWriteString$L+4,a
4894  0fed a602          	ld	a,#2
4895  0fef b703          	ld	_displayWriteString$L+3,a
4896  0ff1 a61c          	ld	a,#28
4897  0ff3 b702          	ld	_displayWriteString$L+2,a
4898  0ff5 a616          	ld	a,#22
4899  0ff7 cd0000        	call	_parametersGetValue
4901  0ffa ab59          	add	a,#89
4902  0ffc 2401          	jrnc	L222
4903  0ffe 5c            	inc	x
4904  0fff               L222:
4905  0fff cd0000        	call	_labelGet
4907  1002 cd0000        	call	_displayWriteString
4910  1005 2014          	jra	L7161
4911  1007               L5161:
4912                     ; 666 			displayWriteString(labelGet(LABEL_REGISTER), DISPLAY_SELECT_FONT_MINI, WINDOW_3_LEFT+2, WINDOW_3_TOP+6);
4914  1007 a618          	ld	a,#24
4915  1009 b704          	ld	_displayWriteString$L+4,a
4916  100b a602          	ld	a,#2
4917  100d b703          	ld	_displayWriteString$L+3,a
4918  100f a61c          	ld	a,#28
4919  1011 b702          	ld	_displayWriteString$L+2,a
4920  1013 a659          	ld	a,#89
4921  1015 cd0000        	call	_labelGet
4923  1018 cd0000        	call	_displayWriteString
4925  101b               L7161:
4926                     ; 668 		displayInvertArea(WINDOW_3_LEFT+1, WINDOW_3_TOP+1, WINDOW_3_RIGHT-2, WINDOW_3_TOP+6);
4928  101b a618          	ld	a,#24
4929  101d b703          	ld	_displayInvertArea$L+3,a
4930  101f a67c          	ld	a,#124
4931  1021 b702          	ld	_displayInvertArea$L+2,a
4932  1023 a613          	ld	a,#19
4933  1025 ae01          	ld	x,#1
4934  1027 cd0000        	call	_displayInvertArea
4936                     ; 671 		displayDrawHorizontalLine(byRulerTop + 1, WINDOW_3_LEFT + 6, WINDOW_3_WIDTH - 13);
4938  102a a671          	ld	a,#113
4939  102c b702          	ld	_displayDrawHorizontalLine$L+2,a
4940  102e a606          	ld	a,#6
4941  1030 beff          	ld	x,_windowRegister$L-1
4942  1032 5c            	inc	x
4943  1033 cd0000        	call	_displayDrawHorizontalLine
4945                     ; 672 		/* -1   */ displayDrawVerticalLine(WINDOW_3_LEFT + 5								, byRulerTop - 1, 6);	
4947  1036 a606          	ld	a,#6
4948  1038 b702          	ld	_displayDrawVerticalLine$L+2,a
4949  103a b6ff          	ld	a,_windowRegister$L-1
4950  103c 4a            	dec	a
4951  103d ae05          	ld	x,#5
4952  103f cd0000        	call	_displayDrawVerticalLine
4954                     ; 673 		/*  0   */ displayDrawVerticalLine(WINDOW_3_LEFT + 5 + (WINDOW_3_WIDTH - 11) / 2	, byRulerTop - 1, 6);
4956  1042 a606          	ld	a,#6
4957  1044 b702          	ld	_displayDrawVerticalLine$L+2,a
4958  1046 b6ff          	ld	a,_windowRegister$L-1
4959  1048 4a            	dec	a
4960  1049 ae3e          	ld	x,#62
4961  104b cd0000        	call	_displayDrawVerticalLine
4963                     ; 674 		/*  1   */ displayDrawVerticalLine(WINDOW_3_LEFT + 5 + (WINDOW_3_WIDTH - 11)		, byRulerTop - 1, 6);
4965  104e a606          	ld	a,#6
4966  1050 b702          	ld	_displayDrawVerticalLine$L+2,a
4967  1052 b6ff          	ld	a,_windowRegister$L-1
4968  1054 4a            	dec	a
4969  1055 ae78          	ld	x,#120
4970  1057 cd0000        	call	_displayDrawVerticalLine
4972                     ; 675 		/* -0.5 */ displayDrawVerticalLine(WINDOW_3_LEFT + 5 + (WINDOW_3_WIDTH - 11) / 4	, byRulerTop + 2, 1);
4974  105a a601          	ld	a,#1
4975  105c b702          	ld	_displayDrawVerticalLine$L+2,a
4976  105e b6ff          	ld	a,_windowRegister$L-1
4977  1060 ab02          	add	a,#2
4978  1062 ae21          	ld	x,#33
4979  1064 cd0000        	call	_displayDrawVerticalLine
4981                     ; 676 		/* +0.5 */ displayDrawVerticalLine(WINDOW_3_LEFT + 5 + (WINDOW_3_WIDTH - 11) * 3 / 4, byRulerTop + 2, 1);
4983  1067 a601          	ld	a,#1
4984  1069 b702          	ld	_displayDrawVerticalLine$L+2,a
4985  106b b6ff          	ld	a,_windowRegister$L-1
4986  106d ab02          	add	a,#2
4987  106f ae5b          	ld	x,#91
4988  1071 cd0000        	call	_displayDrawVerticalLine
4990                     ; 678 		dblParamErrorZoom = (double) LOBYTE(parametersGetValue(PARAM_ERROR_ZOOM));
4992  1074 a633          	ld	a,#51
4993  1076 cd0000        	call	_parametersGetValue
4995  1079 5f            	clr	x
4996  107a cd0000        	call	c_itof
4998  107d ae00          	ld	x,#high(_dblParamErrorZoom)
4999  107f bf00          	ld	c_x,x
5000  1081 ae00          	ld	x,#low(_dblParamErrorZoom)
5001  1083 cd0000        	call	c_rtoxl
5003  1086               L3161:
5004                     ; 684 	if (parametersIsChanged(PARAM_ERR_LONG) || (!_btst(m_woDisplayedWindow, WIN_REGISTER)) )
5006  1086 a60e          	ld	a,#14
5007  1088 cd0000        	call	_parametersIsChanged
5009  108b 4d            	tnz	a
5010  108c 260a          	jrne	L3261
5012  108e c60006        	ld	a,_m_woDisplayedWindow+1
5013  1091 a508          	bcp	a,#8
5014  1093 2703          	jreq	L442
5015  1095 cc11c3        	jp	L1261
5016  1098               L442:
5017  1098               L3261:
5018                     ; 687 		dblPercentValue = ((double) parametersGetValue(PARAM_ERR_LONG)- (double) 0x8000) / 100.0;
5020  1098 a60e          	ld	a,#14
5021  109a cd0000        	call	_parametersGetValue
5023  109d cd0000        	call	c_uitof
5025  10a0 ae21          	ld	x,#high(L1361)
5026  10a2 bf00          	ld	c_x,x
5027  10a4 ae21          	ld	x,#low(L1361)
5028  10a6 cd0000        	call	c_xfsub
5030  10a9 ae1d          	ld	x,#high(L1461)
5031  10ab bf00          	ld	c_x,x
5032  10ad ae1d          	ld	x,#low(L1461)
5033  10af cd0000        	call	c_xfdiv
5035  10b2 aefb          	ld	x,#_windowRegister$L-5
5036  10b4 cd0000        	call	c_rtol
5038                     ; 688 		dblPercentValue = (dblPercentValue>dblParamErrorZoom?dblParamErrorZoom:dblPercentValue);
5040  10b7 aefb          	ld	x,#_windowRegister$L-5
5041  10b9 cd0000        	call	c_ltor
5043  10bc ae00          	ld	x,#high(_dblParamErrorZoom)
5044  10be bf00          	ld	c_x,x
5045  10c0 ae00          	ld	x,#low(_dblParamErrorZoom)
5046  10c2 cd0000        	call	c_xfcmp
5048                     	jrle	L422
5049  10c9 ae00          	ld	x,#high(_dblParamErrorZoom)
5050  10cb bf00          	ld	c_x,x
5051  10cd ae00          	ld	x,#low(_dblParamErrorZoom)
5052  10cf cd0000        	call	c_xltor
5054  10d2 2005          	jra	L622
5055  10d4               L422:
5056  10d4 aefb          	ld	x,#_windowRegister$L-5
5057  10d6 cd0000        	call	c_ltor
5059  10d9               L622:
5060  10d9 aefb          	ld	x,#_windowRegister$L-5
5061  10db cd0000        	call	c_rtol
5063                     ; 689 		dblPercentValue = (dblPercentValue<-dblParamErrorZoom?-dblParamErrorZoom:dblPercentValue);
5065  10de ae00          	ld	x,#high(_dblParamErrorZoom)
5066  10e0 bf00          	ld	c_x,x
5067  10e2 ae00          	ld	x,#low(_dblParamErrorZoom)
5068  10e4 cd0000        	call	c_xltor
5070  10e7 cd0000        	call	c_fneg
5072  10ea aefb          	ld	x,#_windowRegister$L-5
5073  10ec cd0000        	call	c_fcmp
5075                     	jrle	L032
5076  10f3 ae00          	ld	x,#high(_dblParamErrorZoom)
5077  10f5 bf00          	ld	c_x,x
5078  10f7 ae00          	ld	x,#low(_dblParamErrorZoom)
5079  10f9 cd0000        	call	c_xltor
5081  10fc cd0000        	call	c_fneg
5083  10ff 2005          	jra	L232
5084  1101               L032:
5085  1101 aefb          	ld	x,#_windowRegister$L-5
5086  1103 cd0000        	call	c_ltor
5088  1106               L232:
5089  1106 aefb          	ld	x,#_windowRegister$L-5
5090  1108 cd0000        	call	c_rtol
5092                     ; 690 		dblPercentValue = dblPercentValue  / dblParamErrorZoom;
5094  110b aefb          	ld	x,#_windowRegister$L-5
5095  110d cd0000        	call	c_ltor
5097  1110 ae00          	ld	x,#high(_dblParamErrorZoom)
5098  1112 bf00          	ld	c_x,x
5099  1114 ae00          	ld	x,#low(_dblParamErrorZoom)
5100  1116 cd0000        	call	c_xfdiv
5102  1119 aefb          	ld	x,#_windowRegister$L-5
5103  111b cd0000        	call	c_rtol
5105                     ; 695 		if (m_byCurrentSelectorX>0)
5107  111e c60007        	ld	a,_m_byCurrentSelectorX
5108  1121 4d            	tnz	a
5109  1122 2717          	jreq	L5461
5110                     ; 697 			displayClearArea(m_byCurrentSelectorX-1, byRulerTop - 11, m_byCurrentSelectorX+1, byRulerTop-3);
5112  1124 b6ff          	ld	a,_windowRegister$L-1
5113  1126 a003          	sub	a,#3
5114  1128 b703          	ld	_displayClearArea$L+3,a
5115  112a c60007        	ld	a,_m_byCurrentSelectorX
5116  112d 4c            	inc	a
5117  112e b702          	ld	_displayClearArea$L+2,a
5118  1130 b6ff          	ld	a,_windowRegister$L-1
5119  1132 a00b          	sub	a,#11
5120  1134 ce0007        	ld	x,_m_byCurrentSelectorX
5121  1137 5a            	dec	x
5122  1138 cd0000        	call	_displayClearArea
5124  113b               L5461:
5125                     ; 700 		displayWriteString("-", DISPLAY_SELECT_FONT_MINI, WINDOW_3_LEFT + 4								 , 	byRulerTop - 3);
5127  113b b6ff          	ld	a,_windowRegister$L-1
5128  113d a003          	sub	a,#3
5129  113f b704          	ld	_displayWriteString$L+4,a
5130  1141 a604          	ld	a,#4
5131  1143 b703          	ld	_displayWriteString$L+3,a
5132  1145 a61c          	ld	a,#28
5133  1147 b702          	ld	_displayWriteString$L+2,a
5134  1149 a61b          	ld	a,#low(L7461)
5135  114b ae1b          	ld	x,#high(L7461)
5136  114d cd0000        	call	_displayWriteString
5138                     ; 701 		displayWriteString("+", DISPLAY_SELECT_FONT_MINI, WINDOW_3_LEFT + 4 + (WINDOW_3_WIDTH - 11)		 , 	byRulerTop - 3);
5140  1150 b6ff          	ld	a,_windowRegister$L-1
5141  1152 a003          	sub	a,#3
5142  1154 b704          	ld	_displayWriteString$L+4,a
5143  1156 a677          	ld	a,#119
5144  1158 b703          	ld	_displayWriteString$L+3,a
5145  115a a61c          	ld	a,#28
5146  115c b702          	ld	_displayWriteString$L+2,a
5147  115e a619          	ld	a,#low(L1561)
5148  1160 ae19          	ld	x,#high(L1561)
5149  1162 cd0000        	call	_displayWriteString
5151                     ; 704 		m_byCurrentSelectorX = WINDOW_3_LEFT + 5 + ((WINDOW_3_WIDTH - 11) / 2 * (dblPercentValue + 1));
5153  1165 aefb          	ld	x,#_windowRegister$L-5
5154  1167 cd0000        	call	c_ltor
5156  116a ae15          	ld	x,#high(L7561)
5157  116c bf00          	ld	c_x,x
5158  116e ae15          	ld	x,#low(L7561)
5159  1170 cd0000        	call	c_xfadd
5161  1173 ae11          	ld	x,#high(L7661)
5162  1175 bf00          	ld	c_x,x
5163  1177 ae11          	ld	x,#low(L7661)
5164  1179 cd0000        	call	c_xfmul
5166  117c ae0d          	ld	x,#high(L7761)
5167  117e bf00          	ld	c_x,x
5168  1180 ae0d          	ld	x,#low(L7761)
5169  1182 cd0000        	call	c_xfadd
5171  1185 cd0000        	call	c_ftoi
5173  1188 c70007        	ld	_m_byCurrentSelectorX,a
5174                     ; 705 		displayDrawSelector( m_byCurrentSelectorX, byRulerTop - 11,  (dblPercentValue != 0), true);
5176  118b a601          	ld	a,#1
5177  118d b703          	ld	_displayDrawSelector$L+3,a
5178  118f b6fb          	ld	a,_windowRegister$L-5
5179  1191 2704          	jreq	L432
5180  1193 a601          	ld	a,#1
5181  1195 2001          	jra	L632
5182  1197               L432:
5183  1197 4f            	clr	a
5184  1198               L632:
5185  1198 b702          	ld	_displayDrawSelector$L+2,a
5186  119a b6ff          	ld	a,_windowRegister$L-1
5187  119c a00b          	sub	a,#11
5188  119e ce0007        	ld	x,_m_byCurrentSelectorX
5189  11a1 cd0000        	call	_displayDrawSelector
5191                     ; 708 		windowRegisterPrepareFormateValue(strString);
5193  11a4 a6f3          	ld	a,#_windowRegister$L-13
5194  11a6 5f            	clr	x
5195  11a7 cd0ef3        	call	_windowRegisterPrepareFormateValue
5197                     ; 709 		displayWriteString(strString, DISPLAY_SELECT_FONT_5x7, WINDOW_3_LEFT+42, byRulerTop + 18);	
5199  11aa b6ff          	ld	a,_windowRegister$L-1
5200  11ac ab12          	add	a,#18
5201  11ae b704          	ld	_displayWriteString$L+4,a
5202  11b0 a62a          	ld	a,#42
5203  11b2 b703          	ld	_displayWriteString$L+3,a
5204  11b4 a61d          	ld	a,#29
5205  11b6 b702          	ld	_displayWriteString$L+2,a
5206  11b8 a6f3          	ld	a,#_windowRegister$L-13
5207  11ba 5f            	clr	x
5208  11bb cd0000        	call	_displayWriteString
5210                     ; 711 		parametersChangedFlagReset(PARAM_ERR_LONG);
5212  11be a60e          	ld	a,#14
5213  11c0 cd0000        	call	_parametersChangedFlagReset
5215  11c3               L1261:
5216                     ; 715 	if (parametersIsChanged(PARAM_CORRECTION))
5218  11c3 a60d          	ld	a,#13
5219  11c5 cd0000        	call	_parametersIsChanged
5221  11c8 4d            	tnz	a
5222  11c9 2718          	jreq	L3071
5223                     ; 717 		displayDrawCorrection(WINDOW_3_LEFT, byRulerTop+3, WINDOW_3_WIDTH, LOBYTE(parametersGetValue(PARAM_CORRECTION)));
5225  11cb a60d          	ld	a,#13
5226  11cd cd0000        	call	_parametersGetValue
5228  11d0 b703          	ld	_displayDrawCorrection$L+3,a
5229  11d2 a67e          	ld	a,#126
5230  11d4 b702          	ld	_displayDrawCorrection$L+2,a
5231  11d6 b6ff          	ld	a,_windowRegister$L-1
5232  11d8 ab03          	add	a,#3
5233  11da 5f            	clr	x
5234  11db cd0000        	call	_displayDrawCorrection
5236                     ; 718 		parametersChangedFlagReset(PARAM_CORRECTION);
5238  11de a60d          	ld	a,#13
5239  11e0 cd0000        	call	_parametersChangedFlagReset
5241  11e3               L3071:
5242                     ; 722 	if (parametersIsChanged(PARAM_ERR_BOUND_LONG))
5244  11e3 a613          	ld	a,#19
5245  11e5 cd0000        	call	_parametersIsChanged
5247  11e8 4d            	tnz	a
5248  11e9 2723          	jreq	L5071
5249                     ; 724 		if (parametersGetValue(PARAM_ERR_BOUND_LONG))
5251  11eb a613          	ld	a,#19
5252  11ed cd0000        	call	_parametersGetValue
5254  11f0 4d            	tnz	a
5255  11f1 2601          	jrne	L042
5256  11f3 5d            	tnz	x
5257  11f4               L042:
5258  11f4 2709          	jreq	L7071
5259                     ; 726 			displayDrawAlarm(87, 45);
5261  11f6 a62d          	ld	a,#45
5262  11f8 ae57          	ld	x,#87
5263  11fa cd0000        	call	_displayDrawAlarm
5266  11fd 200f          	jra	L5071
5267  11ff               L7071:
5268                     ; 730 			displayClearArea(87+2,45+7, 87+10, 45+14);
5270  11ff a63b          	ld	a,#59
5271  1201 b703          	ld	_displayClearArea$L+3,a
5272  1203 a661          	ld	a,#97
5273  1205 b702          	ld	_displayClearArea$L+2,a
5274  1207 a634          	ld	a,#52
5275  1209 ae59          	ld	x,#89
5276  120b cd0000        	call	_displayClearArea
5278  120e               L5071:
5279                     ; 735 	_bres(m_woDisplayedWindow, WIN_OSCILLOSCOPE);
5281  120e c60006        	ld	a,_m_woDisplayedWindow+1
5282  1211 a4fb          	and	a,#251
5283  1213 c70006        	ld	_m_woDisplayedWindow+1,a
5284                     ; 736 	_bset(m_woDisplayedWindow, WIN_REGISTER);
5286  1216 c60006        	ld	a,_m_woDisplayedWindow+1
5287  1219 aa08          	or	a,#8
5288  121b c70006        	ld	_m_woDisplayedWindow+1,a
5289                     ; 737 	_bres(m_woDisplayedWindow, WIN_ALARM);
5291  121e c60006        	ld	a,_m_woDisplayedWindow+1
5292  1221 a4ef          	and	a,#239
5293  1223 c70006        	ld	_m_woDisplayedWindow+1,a
5294                     ; 738 	_bres(m_woDisplayedWindow, WIN_MESSAGE);
5296  1226 c60006        	ld	a,_m_woDisplayedWindow+1
5297  1229 a4df          	and	a,#223
5298  122b c70006        	ld	_m_woDisplayedWindow+1,a
5299                     ; 739 	_bres(m_woDisplayedWindow, WIN_FUNCTIONS);
5301  122e c60006        	ld	a,_m_woDisplayedWindow+1
5302  1231 a4bf          	and	a,#191
5303  1233 c70006        	ld	_m_woDisplayedWindow+1,a
5304                     ; 740 	_bres(m_woDisplayedWindow, WIN_PARAMETERS);
5306  1236 c60006        	ld	a,_m_woDisplayedWindow+1
5307  1239 a47f          	and	a,#127
5308  123b c70006        	ld	_m_woDisplayedWindow+1,a
5309                     ; 741 	_bres(m_woDisplayedWindow, WIN_TESTS);
5311  123e c60006        	ld	a,_m_woDisplayedWindow+1
5312  1241 a4ff          	and	a,#255
5313  1243 c70006        	ld	_m_woDisplayedWindow+1,a
5314  1246 c60005        	ld	a,_m_woDisplayedWindow
5315  1249 a4fe          	and	a,#254
5316  124b c70005        	ld	_m_woDisplayedWindow,a
5317                     ; 742 	_bres(m_woDisplayedWindow, WIN_SETUP);
5319  124e c60006        	ld	a,_m_woDisplayedWindow+1
5320  1251 a4ff          	and	a,#255
5321  1253 c70006        	ld	_m_woDisplayedWindow+1,a
5322  1256 c60005        	ld	a,_m_woDisplayedWindow
5323  1259 a4fb          	and	a,#251
5324  125b c70005        	ld	_m_woDisplayedWindow,a
5325                     ; 743 	_bres(m_woDisplayedWindow, WIN_MENUS);
5327  125e c60006        	ld	a,_m_woDisplayedWindow+1
5328  1261 a4ff          	and	a,#255
5329  1263 c70006        	ld	_m_woDisplayedWindow+1,a
5330  1266 c60005        	ld	a,_m_woDisplayedWindow
5331  1269 a4fd          	and	a,#253
5332  126b c70005        	ld	_m_woDisplayedWindow,a
5333                     ; 744 	_bres(m_woDisplayedWindow, WIN_ARCHIVES);
5335  126e c60006        	ld	a,_m_woDisplayedWindow+1
5336  1271 a4ff          	and	a,#255
5337  1273 c70006        	ld	_m_woDisplayedWindow+1,a
5338  1276 c60005        	ld	a,_m_woDisplayedWindow
5339  1279 a4f7          	and	a,#247
5340  127b c70005        	ld	_m_woDisplayedWindow,a
5341                     ; 745 	_bres(m_woDisplayedWindow, WIN_APPLICATION);
5343  127e c60006        	ld	a,_m_woDisplayedWindow+1
5344  1281 a4ff          	and	a,#255
5345  1283 c70006        	ld	_m_woDisplayedWindow+1,a
5346  1286 c60005        	ld	a,_m_woDisplayedWindow
5347  1289 a4ef          	and	a,#239
5348  128b c70005        	ld	_m_woDisplayedWindow,a
5349                     ; 746 	_bres(m_woDisplayedWindow, WIN_ENCODER);
5351  128e c60006        	ld	a,_m_woDisplayedWindow+1
5352  1291 a4ff          	and	a,#255
5353  1293 c70006        	ld	_m_woDisplayedWindow+1,a
5354  1296 c60005        	ld	a,_m_woDisplayedWindow
5355  1299 a4df          	and	a,#223
5356  129b c70005        	ld	_m_woDisplayedWindow,a
5357                     ; 747 }
5360  129e 81            	ret
5413                     ; 750 void window6Menu(BYTE * a_byGroup, BYTE * a_bySelected)
5413                     ; 751 {
5414                     	switch	.text
5416                     	xref.b	_window6Menu$L
5417  129f               _window6Menu:
5419  129f b701          	ld	_window6Menu$L+1,a
5420  12a1 bf00          	ld	_window6Menu$L,x
5422                     ; 752 	if ( !  (	((*a_byGroup == MENU_GROUP_FUNCTION) 	&& _btst(m_woDisplayedWindow, WIN_FUNCTIONS)) ||
5422                     ; 753 				((*a_byGroup == MENU_GROUP_PARAMETER) 	&& _btst(m_woDisplayedWindow, WIN_PARAMETERS)) ||
5422                     ; 754 				((*a_byGroup == MENU_GROUP_MENU) 		&& _btst(m_woDisplayedWindow, WIN_MENUS)) ||
5422                     ; 755 				((*a_byGroup == MENU_GROUP_ARCHIVE) 	&& _btst(m_woDisplayedWindow, WIN_ARCHIVES)) ||
5422                     ; 756 				((*a_byGroup == MENU_GROUP_APP) 		&& _btst(m_woDisplayedWindow, WIN_APPLICATION)) ||
5422                     ; 757 				((*a_byGroup == MENU_GROUP_ENC) 		&& _btst(m_woDisplayedWindow, WIN_ENCODER)) ||
5422                     ; 758 				((*a_byGroup == MENU_GROUP_TEST) 		&& _btst(m_woDisplayedWindow, WIN_TESTS))
5422                     ; 759 			))  // Is not only a refresh
5424  12a3 92c600        	ld	a,[_window6Menu$L.w]
5425  12a6 a101          	cp	a,#1
5426  12a8 260a          	jrne	L7102
5428  12aa c60006        	ld	a,_m_woDisplayedWindow+1
5429  12ad a540          	bcp	a,#64
5430  12af 2703          	jreq	L043
5431  12b1 cc1bd0        	jp	L5102
5432  12b4               L043:
5433  12b4               L7102:
5435  12b4 92c600        	ld	a,[_window6Menu$L.w]
5436  12b7 a102          	cp	a,#2
5437  12b9 260a          	jrne	L1202
5439  12bb c60006        	ld	a,_m_woDisplayedWindow+1
5440  12be a580          	bcp	a,#128
5441  12c0 2703          	jreq	L243
5442  12c2 cc1bd0        	jp	L5102
5443  12c5               L243:
5444  12c5               L1202:
5446  12c5 92c600        	ld	a,[_window6Menu$L.w]
5447  12c8 a104          	cp	a,#4
5448  12ca 260a          	jrne	L3202
5450  12cc c60005        	ld	a,_m_woDisplayedWindow
5451  12cf a502          	bcp	a,#2
5452  12d1 2703          	jreq	L443
5453  12d3 cc1bd0        	jp	L5102
5454  12d6               L443:
5455  12d6               L3202:
5457  12d6 92c600        	ld	a,[_window6Menu$L.w]
5458  12d9 a105          	cp	a,#5
5459  12db 260a          	jrne	L5202
5461  12dd c60005        	ld	a,_m_woDisplayedWindow
5462  12e0 a508          	bcp	a,#8
5463  12e2 2703          	jreq	L643
5464  12e4 cc1bd0        	jp	L5102
5465  12e7               L643:
5466  12e7               L5202:
5468  12e7 92c600        	ld	a,[_window6Menu$L.w]
5469  12ea a106          	cp	a,#6
5470  12ec 260a          	jrne	L7202
5472  12ee c60005        	ld	a,_m_woDisplayedWindow
5473  12f1 a510          	bcp	a,#16
5474  12f3 2703          	jreq	L053
5475  12f5 cc1bd0        	jp	L5102
5476  12f8               L053:
5477  12f8               L7202:
5479  12f8 92c600        	ld	a,[_window6Menu$L.w]
5480  12fb a107          	cp	a,#7
5481  12fd 260a          	jrne	L1302
5483  12ff c60005        	ld	a,_m_woDisplayedWindow
5484  1302 a520          	bcp	a,#32
5485  1304 2703          	jreq	L253
5486  1306 cc1bd0        	jp	L5102
5487  1309               L253:
5488  1309               L1302:
5490  1309 92c600        	ld	a,[_window6Menu$L.w]
5491  130c a103          	cp	a,#3
5492  130e 260a          	jrne	L3302
5494  1310 c60005        	ld	a,_m_woDisplayedWindow
5495  1313 a501          	bcp	a,#1
5496  1315 2703          	jreq	L453
5497  1317 cc1bd0        	jp	L5102
5498  131a               L453:
5499  131a               L3302:
5500                     ; 761 		displayClearArea(0,0,126,64);
5502  131a a640          	ld	a,#64
5503  131c b703          	ld	_displayClearArea$L+3,a
5504  131e a67e          	ld	a,#126
5505  1320 b702          	ld	_displayClearArea$L+2,a
5506  1322 4f            	clr	a
5507  1323 5f            	clr	x
5508  1324 cd0000        	call	_displayClearArea
5510                     ; 763 		displayWriteString("1", 			DISPLAY_SELECT_FONT_10x14, 	2, 		17);
5512  1327 a611          	ld	a,#17
5513  1329 b704          	ld	_displayWriteString$L+4,a
5514  132b a602          	ld	a,#2
5515  132d b703          	ld	_displayWriteString$L+3,a
5516  132f a61e          	ld	a,#30
5517  1331 b702          	ld	_displayWriteString$L+2,a
5518  1333 a60b          	ld	a,#low(L5302)
5519  1335 ae0b          	ld	x,#high(L5302)
5520  1337 cd0000        	call	_displayWriteString
5522                     ; 764 		displayWriteString("2", 			DISPLAY_NULL, 				2, 		39);
5524  133a a627          	ld	a,#39
5525  133c b704          	ld	_displayWriteString$L+4,a
5526  133e a602          	ld	a,#2
5527  1340 b703          	ld	_displayWriteString$L+3,a
5528  1342 a6ff          	ld	a,#255
5529  1344 b702          	ld	_displayWriteString$L+2,a
5530  1346 a609          	ld	a,#low(L7302)
5531  1348 ae09          	ld	x,#high(L7302)
5532  134a cd0000        	call	_displayWriteString
5534                     ; 765 		displayWriteString("3", 			DISPLAY_NULL, 				2, 		61);
5536  134d a63d          	ld	a,#61
5537  134f b704          	ld	_displayWriteString$L+4,a
5538  1351 a602          	ld	a,#2
5539  1353 b703          	ld	_displayWriteString$L+3,a
5540  1355 a6ff          	ld	a,#255
5541  1357 b702          	ld	_displayWriteString$L+2,a
5542  1359 a607          	ld	a,#low(L1402)
5543  135b ae07          	ld	x,#high(L1402)
5544  135d cd0000        	call	_displayWriteString
5546                     ; 766 		displayWriteString("4", 			DISPLAY_NULL, 				67,		17);
5548  1360 a611          	ld	a,#17
5549  1362 b704          	ld	_displayWriteString$L+4,a
5550  1364 a643          	ld	a,#67
5551  1366 b703          	ld	_displayWriteString$L+3,a
5552  1368 a6ff          	ld	a,#255
5553  136a b702          	ld	_displayWriteString$L+2,a
5554  136c a605          	ld	a,#low(L3402)
5555  136e ae05          	ld	x,#high(L3402)
5556  1370 cd0000        	call	_displayWriteString
5558                     ; 767 		displayWriteString("5", 			DISPLAY_NULL, 				67, 	39);
5560  1373 a627          	ld	a,#39
5561  1375 b704          	ld	_displayWriteString$L+4,a
5562  1377 a643          	ld	a,#67
5563  1379 b703          	ld	_displayWriteString$L+3,a
5564  137b a6ff          	ld	a,#255
5565  137d b702          	ld	_displayWriteString$L+2,a
5566  137f a603          	ld	a,#low(L5402)
5567  1381 ae03          	ld	x,#high(L5402)
5568  1383 cd0000        	call	_displayWriteString
5570                     ; 768 		displayWriteString("6", 			DISPLAY_NULL, 				67, 	61);
5572  1386 a63d          	ld	a,#61
5573  1388 b704          	ld	_displayWriteString$L+4,a
5574  138a a643          	ld	a,#67
5575  138c b703          	ld	_displayWriteString$L+3,a
5576  138e a6ff          	ld	a,#255
5577  1390 b702          	ld	_displayWriteString$L+2,a
5578  1392 a601          	ld	a,#low(L7402)
5579  1394 ae01          	ld	x,#high(L7402)
5580  1396 cd0000        	call	_displayWriteString
5582                     ; 772 		switch(*a_byGroup)
5584  1399 92c600        	ld	a,[_window6Menu$L.w]
5586                     ; 954 				break;			
5587  139c 4a            	dec	a
5588  139d 272d          	jreq	L3171
5589  139f 4a            	dec	a
5590  13a0 2603          	jrne	L653
5591  13a2 cc14ad        	jp	L5171
5592  13a5               L653:
5593  13a5 4a            	dec	a
5594  13a6 2603          	jrne	L063
5595  13a8 cc15a4        	jp	L7171
5596  13ab               L063:
5597  13ab 4a            	dec	a
5598  13ac 2603          	jrne	L263
5599  13ae cc162a        	jp	L1271
5600  13b1               L263:
5601  13b1 4a            	dec	a
5602  13b2 2603          	jrne	L463
5603  13b4 cc1754        	jp	L3271
5604  13b7               L463:
5605  13b7 4a            	dec	a
5606  13b8 2603          	jrne	L663
5607  13ba cc17b2        	jp	L5271
5608  13bd               L663:
5609  13bd 4a            	dec	a
5610  13be 2603          	jrne	L073
5611  13c0 cc1a6c        	jp	L7671
5612  13c3               L073:
5613  13c3 4a            	dec	a
5614  13c4 2603          	jrne	L273
5615  13c6 cc1ac9        	jp	L1771
5616  13c9               L273:
5617  13c9 cc1b24        	jp	L3502
5618  13cc               L3171:
5619                     ; 774 			case MENU_GROUP_FUNCTION:
5619                     ; 775 				displayWriteString(labelGet(LABEL_PHASE_CENTER_01), 		DISPLAY_SELECT_FONT_MINI, 	13, 	9);
5621  13cc a609          	ld	a,#9
5622  13ce b704          	ld	_displayWriteString$L+4,a
5623  13d0 a60d          	ld	a,#13
5624  13d2 b703          	ld	_displayWriteString$L+3,a
5625  13d4 a61c          	ld	a,#28
5626  13d6 b702          	ld	_displayWriteString$L+2,a
5627  13d8 a63d          	ld	a,#61
5628  13da cd0000        	call	_labelGet
5630  13dd cd0000        	call	_displayWriteString
5632                     ; 776 				displayWriteString(labelGet(LABEL_PHASE_CENTER_02), 		DISPLAY_NULL, 				13, 	18);
5634  13e0 a612          	ld	a,#18
5635  13e2 b704          	ld	_displayWriteString$L+4,a
5636  13e4 a60d          	ld	a,#13
5637  13e6 b703          	ld	_displayWriteString$L+3,a
5638  13e8 a6ff          	ld	a,#255
5639  13ea b702          	ld	_displayWriteString$L+2,a
5640  13ec a63e          	ld	a,#62
5641  13ee cd0000        	call	_labelGet
5643  13f1 cd0000        	call	_displayWriteString
5645                     ; 779 				displayWriteString(labelGet(LABEL_PHASE_OSCILL_01), 		DISPLAY_NULL, 				13, 	52);
5647  13f4 a634          	ld	a,#52
5648  13f6 b704          	ld	_displayWriteString$L+4,a
5649  13f8 a60d          	ld	a,#13
5650  13fa b703          	ld	_displayWriteString$L+3,a
5651  13fc a6ff          	ld	a,#255
5652  13fe b702          	ld	_displayWriteString$L+2,a
5653  1400 a61e          	ld	a,#30
5654  1402 cd0000        	call	_labelGet
5656  1405 cd0000        	call	_displayWriteString
5658                     ; 780 				displayWriteString(labelGet(LABEL_PHASE_OSCILL_02), 		DISPLAY_NULL, 				13, 	61);
5660  1408 a63d          	ld	a,#61
5661  140a b704          	ld	_displayWriteString$L+4,a
5662  140c a60d          	ld	a,#13
5663  140e b703          	ld	_displayWriteString$L+3,a
5664  1410 a6ff          	ld	a,#255
5665  1412 b702          	ld	_displayWriteString$L+2,a
5666  1414 a61f          	ld	a,#31
5667  1416 cd0000        	call	_labelGet
5669  1419 cd0000        	call	_displayWriteString
5671                     ; 781 				displayWriteString(labelGet(LABEL_PHASE_AUTO_01), 			DISPLAY_NULL, 				78, 	9);
5673  141c a609          	ld	a,#9
5674  141e b704          	ld	_displayWriteString$L+4,a
5675  1420 a64e          	ld	a,#78
5676  1422 b703          	ld	_displayWriteString$L+3,a
5677  1424 a6ff          	ld	a,#255
5678  1426 b702          	ld	_displayWriteString$L+2,a
5679  1428 a61c          	ld	a,#28
5680  142a cd0000        	call	_labelGet
5682  142d cd0000        	call	_displayWriteString
5684                     ; 782 				displayWriteString(labelGet(LABEL_PHASE_AUTO_02), 			DISPLAY_NULL, 				78, 	18);
5686  1430 a612          	ld	a,#18
5687  1432 b704          	ld	_displayWriteString$L+4,a
5688  1434 a64e          	ld	a,#78
5689  1436 b703          	ld	_displayWriteString$L+3,a
5690  1438 a6ff          	ld	a,#255
5691  143a b702          	ld	_displayWriteString$L+2,a
5692  143c a61d          	ld	a,#29
5693  143e cd0000        	call	_labelGet
5695  1441 cd0000        	call	_displayWriteString
5697                     ; 783 				displayWriteString(labelGet(LABEL_PHASE_MANUAL_01), 		DISPLAY_NULL, 				78, 	31);
5699  1444 a61f          	ld	a,#31
5700  1446 b704          	ld	_displayWriteString$L+4,a
5701  1448 a64e          	ld	a,#78
5702  144a b703          	ld	_displayWriteString$L+3,a
5703  144c a6ff          	ld	a,#255
5704  144e b702          	ld	_displayWriteString$L+2,a
5705  1450 a61a          	ld	a,#26
5706  1452 cd0000        	call	_labelGet
5708  1455 cd0000        	call	_displayWriteString
5710                     ; 784 				displayWriteString(labelGet(LABEL_PHASE_MANUAL_02), 		DISPLAY_NULL, 				78, 	40);
5712  1458 a628          	ld	a,#40
5713  145a b704          	ld	_displayWriteString$L+4,a
5714  145c a64e          	ld	a,#78
5715  145e b703          	ld	_displayWriteString$L+3,a
5716  1460 a6ff          	ld	a,#255
5717  1462 b702          	ld	_displayWriteString$L+2,a
5718  1464 a61b          	ld	a,#27
5719  1466 cd0000        	call	_labelGet
5721  1469 cd0000        	call	_displayWriteString
5723                     ; 785 				if (parametersGetValue(PARAM_COLD_SEAL_ENABLE) == 0x0000)
5725  146c a632          	ld	a,#50
5726  146e cd0000        	call	_parametersGetValue
5728  1471 4d            	tnz	a
5729  1472 2601          	jrne	L052
5730  1474 5d            	tnz	x
5731  1475               L052:
5732  1475 2628          	jrne	L5502
5733                     ; 787 					displayWriteString(labelGet(LABEL_PHASE_FAST_01), 			DISPLAY_NULL, 				78, 	52);
5735  1477 a634          	ld	a,#52
5736  1479 b704          	ld	_displayWriteString$L+4,a
5737  147b a64e          	ld	a,#78
5738  147d b703          	ld	_displayWriteString$L+3,a
5739  147f a6ff          	ld	a,#255
5740  1481 b702          	ld	_displayWriteString$L+2,a
5741  1483 a620          	ld	a,#32
5742  1485 cd0000        	call	_labelGet
5744  1488 cd0000        	call	_displayWriteString
5746                     ; 788 					displayWriteString(labelGet(LABEL_PHASE_FAST_02), 			DISPLAY_NULL, 				78, 	61);
5748  148b a63d          	ld	a,#61
5749  148d b704          	ld	_displayWriteString$L+4,a
5750  148f a64e          	ld	a,#78
5751  1491 b703          	ld	_displayWriteString$L+3,a
5752  1493 a6ff          	ld	a,#255
5753  1495 b702          	ld	_displayWriteString$L+2,a
5754  1497 a621          	ld	a,#33
5755  1499 cd0000        	call	_labelGet
5757  149c cd0000        	call	_displayWriteString
5759  149f               L5502:
5760                     ; 790 				windowForceRepaint();
5762  149f cd001e        	call	_windowForceRepaint
5764                     ; 791 				_bset(m_woDisplayedWindow, WIN_FUNCTIONS);
5766  14a2 c60006        	ld	a,_m_woDisplayedWindow+1
5767  14a5 aa40          	or	a,#64
5768  14a7 c70006        	ld	_m_woDisplayedWindow+1,a
5769                     ; 792 				break;
5771  14aa cc1b24        	jp	L3502
5772  14ad               L5171:
5773                     ; 793 			case MENU_GROUP_PARAMETER:
5773                     ; 794 				displayWriteString(labelGet(LABEL_CYLINDER_TRAVEL_01), 		DISPLAY_SELECT_FONT_MINI, 	13, 	9);
5775  14ad a609          	ld	a,#9
5776  14af b704          	ld	_displayWriteString$L+4,a
5777  14b1 a60d          	ld	a,#13
5778  14b3 b703          	ld	_displayWriteString$L+3,a
5779  14b5 a61c          	ld	a,#28
5780  14b7 b702          	ld	_displayWriteString$L+2,a
5781  14b9 a622          	ld	a,#34
5782  14bb cd0000        	call	_labelGet
5784  14be cd0000        	call	_displayWriteString
5786                     ; 795 				displayWriteString(labelGet(LABEL_CYLINDER_TRAVEL_02), 		DISPLAY_NULL, 				13, 	18);
5788  14c1 a612          	ld	a,#18
5789  14c3 b704          	ld	_displayWriteString$L+4,a
5790  14c5 a60d          	ld	a,#13
5791  14c7 b703          	ld	_displayWriteString$L+3,a
5792  14c9 a6ff          	ld	a,#255
5793  14cb b702          	ld	_displayWriteString$L+2,a
5794  14cd a623          	ld	a,#35
5795  14cf cd0000        	call	_labelGet
5797  14d2 cd0000        	call	_displayWriteString
5799                     ; 796 				displayWriteString(labelGet(LABEL_ALARM_BOUND_01), 			DISPLAY_NULL, 				13, 	31);
5801  14d5 a61f          	ld	a,#31
5802  14d7 b704          	ld	_displayWriteString$L+4,a
5803  14d9 a60d          	ld	a,#13
5804  14db b703          	ld	_displayWriteString$L+3,a
5805  14dd a6ff          	ld	a,#255
5806  14df b702          	ld	_displayWriteString$L+2,a
5807  14e1 a624          	ld	a,#36
5808  14e3 cd0000        	call	_labelGet
5810  14e6 cd0000        	call	_displayWriteString
5812                     ; 797 				displayWriteString(labelGet(LABEL_ALARM_BOUND_02), 			DISPLAY_NULL, 				13, 	40);
5814  14e9 a628          	ld	a,#40
5815  14eb b704          	ld	_displayWriteString$L+4,a
5816  14ed a60d          	ld	a,#13
5817  14ef b703          	ld	_displayWriteString$L+3,a
5818  14f1 a6ff          	ld	a,#255
5819  14f3 b702          	ld	_displayWriteString$L+2,a
5820  14f5 a625          	ld	a,#37
5821  14f7 cd0000        	call	_labelGet
5823  14fa cd0000        	call	_displayWriteString
5825                     ; 798 				displayWriteString(labelGet(LABEL_GATE_WINDOW_01), 			DISPLAY_NULL, 				13, 	52);
5827  14fd a634          	ld	a,#52
5828  14ff b704          	ld	_displayWriteString$L+4,a
5829  1501 a60d          	ld	a,#13
5830  1503 b703          	ld	_displayWriteString$L+3,a
5831  1505 a6ff          	ld	a,#255
5832  1507 b702          	ld	_displayWriteString$L+2,a
5833  1509 a626          	ld	a,#38
5834  150b cd0000        	call	_labelGet
5836  150e cd0000        	call	_displayWriteString
5838                     ; 799 				displayWriteString(labelGet(LABEL_GATE_WINDOW_02), 			DISPLAY_NULL, 				13, 	61);
5840  1511 a63d          	ld	a,#61
5841  1513 b704          	ld	_displayWriteString$L+4,a
5842  1515 a60d          	ld	a,#13
5843  1517 b703          	ld	_displayWriteString$L+3,a
5844  1519 a6ff          	ld	a,#255
5845  151b b702          	ld	_displayWriteString$L+2,a
5846  151d a627          	ld	a,#39
5847  151f cd0000        	call	_labelGet
5849  1522 cd0000        	call	_displayWriteString
5851                     ; 800 				displayWriteString(labelGet(LABEL_SW_VERSION_01), 			DISPLAY_NULL, 				78, 	9);
5853  1525 a609          	ld	a,#9
5854  1527 b704          	ld	_displayWriteString$L+4,a
5855  1529 a64e          	ld	a,#78
5856  152b b703          	ld	_displayWriteString$L+3,a
5857  152d a6ff          	ld	a,#255
5858  152f b702          	ld	_displayWriteString$L+2,a
5859  1531 a628          	ld	a,#40
5860  1533 cd0000        	call	_labelGet
5862  1536 cd0000        	call	_displayWriteString
5864                     ; 801 				displayWriteString(labelGet(LABEL_SW_VERSION_02),			DISPLAY_NULL, 				78, 	18);
5866  1539 a612          	ld	a,#18
5867  153b b704          	ld	_displayWriteString$L+4,a
5868  153d a64e          	ld	a,#78
5869  153f b703          	ld	_displayWriteString$L+3,a
5870  1541 a6ff          	ld	a,#255
5871  1543 b702          	ld	_displayWriteString$L+2,a
5872  1545 a629          	ld	a,#41
5873  1547 cd0000        	call	_labelGet
5875  154a cd0000        	call	_displayWriteString
5877                     ; 802 				if (
5877                     ; 803 					(parametersGetValue(PARAM_LONG_DAC_ENABLE) == 0x0000) ||
5877                     ; 804 					(parametersGetValue(PARAM_TRANS_DAC_ENABLE) == 0x0000) ||
5877                     ; 805 					(parametersGetValue(PARAM_PULL_DAC_ENABLE) == 0x0000)
5877                     ; 806 				   )
5879  154d a63b          	ld	a,#59
5880  154f cd0000        	call	_parametersGetValue
5882  1552 4d            	tnz	a
5883  1553 2601          	jrne	L252
5884  1555 5d            	tnz	x
5885  1556               L252:
5886  1556 2716          	jreq	L1602
5888  1558 a63c          	ld	a,#60
5889  155a cd0000        	call	_parametersGetValue
5891  155d 4d            	tnz	a
5892  155e 2601          	jrne	L452
5893  1560 5d            	tnz	x
5894  1561               L452:
5895  1561 270b          	jreq	L1602
5897  1563 a63d          	ld	a,#61
5898  1565 cd0000        	call	_parametersGetValue
5900  1568 4d            	tnz	a
5901  1569 2601          	jrne	L652
5902  156b 5d            	tnz	x
5903  156c               L652:
5904  156c 2628          	jrne	L7502
5905  156e               L1602:
5906                     ; 808 					displayWriteString(labelGet(LABEL_TENSION_BASE_VALUE_01),		DISPLAY_NULL, 				78, 	31);
5908  156e a61f          	ld	a,#31
5909  1570 b704          	ld	_displayWriteString$L+4,a
5910  1572 a64e          	ld	a,#78
5911  1574 b703          	ld	_displayWriteString$L+3,a
5912  1576 a6ff          	ld	a,#255
5913  1578 b702          	ld	_displayWriteString$L+2,a
5914  157a a66f          	ld	a,#111
5915  157c cd0000        	call	_labelGet
5917  157f cd0000        	call	_displayWriteString
5919                     ; 809 					displayWriteString(labelGet(LABEL_TENSION_BASE_VALUE_02), 		DISPLAY_NULL, 				78, 	40);
5921  1582 a628          	ld	a,#40
5922  1584 b704          	ld	_displayWriteString$L+4,a
5923  1586 a64e          	ld	a,#78
5924  1588 b703          	ld	_displayWriteString$L+3,a
5925  158a a6ff          	ld	a,#255
5926  158c b702          	ld	_displayWriteString$L+2,a
5927  158e a670          	ld	a,#112
5928  1590 cd0000        	call	_labelGet
5930  1593 cd0000        	call	_displayWriteString
5932  1596               L7502:
5933                     ; 814 				windowForceRepaint();
5935  1596 cd001e        	call	_windowForceRepaint
5937                     ; 815 				_bset(m_woDisplayedWindow, WIN_PARAMETERS);
5939  1599 c60006        	ld	a,_m_woDisplayedWindow+1
5940  159c aa80          	or	a,#128
5941  159e c70006        	ld	_m_woDisplayedWindow+1,a
5942                     ; 816 				break;
5944  15a1 cc1b24        	jp	L3502
5945  15a4               L7171:
5946                     ; 817 			case MENU_GROUP_TEST:
5946                     ; 818 				displayWriteString(labelGet(LABEL_TEST_SH_01), 				DISPLAY_SELECT_FONT_MINI, 	13, 	9);
5948  15a4 a609          	ld	a,#9
5949  15a6 b704          	ld	_displayWriteString$L+4,a
5950  15a8 a60d          	ld	a,#13
5951  15aa b703          	ld	_displayWriteString$L+3,a
5952  15ac a61c          	ld	a,#28
5953  15ae b702          	ld	_displayWriteString$L+2,a
5954  15b0 a62c          	ld	a,#44
5955  15b2 cd0000        	call	_labelGet
5957  15b5 cd0000        	call	_displayWriteString
5959                     ; 819 				displayWriteString(labelGet(LABEL_TEST_SH_02), 				DISPLAY_NULL, 				13, 	18);
5961  15b8 a612          	ld	a,#18
5962  15ba b704          	ld	_displayWriteString$L+4,a
5963  15bc a60d          	ld	a,#13
5964  15be b703          	ld	_displayWriteString$L+3,a
5965  15c0 a6ff          	ld	a,#255
5966  15c2 b702          	ld	_displayWriteString$L+2,a
5967  15c4 a62d          	ld	a,#45
5968  15c6 cd0000        	call	_labelGet
5970  15c9 cd0000        	call	_displayWriteString
5972                     ; 820 				displayWriteString(labelGet(LABEL_TEST_ENC_01), 			DISPLAY_NULL, 				13, 	31);
5974  15cc a61f          	ld	a,#31
5975  15ce b704          	ld	_displayWriteString$L+4,a
5976  15d0 a60d          	ld	a,#13
5977  15d2 b703          	ld	_displayWriteString$L+3,a
5978  15d4 a6ff          	ld	a,#255
5979  15d6 b702          	ld	_displayWriteString$L+2,a
5980  15d8 a62e          	ld	a,#46
5981  15da cd0000        	call	_labelGet
5983  15dd cd0000        	call	_displayWriteString
5985                     ; 821 				displayWriteString(labelGet(LABEL_TEST_ENC_02), 			DISPLAY_NULL, 				13, 	40);
5987  15e0 a628          	ld	a,#40
5988  15e2 b704          	ld	_displayWriteString$L+4,a
5989  15e4 a60d          	ld	a,#13
5990  15e6 b703          	ld	_displayWriteString$L+3,a
5991  15e8 a6ff          	ld	a,#255
5992  15ea b702          	ld	_displayWriteString$L+2,a
5993  15ec a62f          	ld	a,#47
5994  15ee cd0000        	call	_labelGet
5996  15f1 cd0000        	call	_displayWriteString
5998                     ; 822 				displayWriteString(labelGet(LABEL_TEST_OUTPUT_01), 			DISPLAY_NULL, 				13, 	52);
6000  15f4 a634          	ld	a,#52
6001  15f6 b704          	ld	_displayWriteString$L+4,a
6002  15f8 a60d          	ld	a,#13
6003  15fa b703          	ld	_displayWriteString$L+3,a
6004  15fc a6ff          	ld	a,#255
6005  15fe b702          	ld	_displayWriteString$L+2,a
6006  1600 a630          	ld	a,#48
6007  1602 cd0000        	call	_labelGet
6009  1605 cd0000        	call	_displayWriteString
6011                     ; 823 				displayWriteString(labelGet(LABEL_TEST_OUTPUT_02), 			DISPLAY_NULL, 				13, 	61);
6013  1608 a63d          	ld	a,#61
6014  160a b704          	ld	_displayWriteString$L+4,a
6015  160c a60d          	ld	a,#13
6016  160e b703          	ld	_displayWriteString$L+3,a
6017  1610 a6ff          	ld	a,#255
6018  1612 b702          	ld	_displayWriteString$L+2,a
6019  1614 a631          	ld	a,#49
6020  1616 cd0000        	call	_labelGet
6022  1619 cd0000        	call	_displayWriteString
6024                     ; 830 				windowForceRepaint();
6026  161c cd001e        	call	_windowForceRepaint
6028                     ; 831 				_bset(m_woDisplayedWindow, WIN_TESTS);
6030  161f c60005        	ld	a,_m_woDisplayedWindow
6031  1622 aa01          	or	a,#1
6032  1624 c70005        	ld	_m_woDisplayedWindow,a
6033                     ; 832 				break;
6035  1627 cc1b24        	jp	L3502
6036  162a               L1271:
6037                     ; 833 			case MENU_GROUP_MENU:
6037                     ; 834 				displayWriteString(labelGet(LABEL_VISUAL_REGISTER_01),		DISPLAY_SELECT_FONT_MINI, 	13, 	9);
6039  162a a609          	ld	a,#9
6040  162c b704          	ld	_displayWriteString$L+4,a
6041  162e a60d          	ld	a,#13
6042  1630 b703          	ld	_displayWriteString$L+3,a
6043  1632 a61c          	ld	a,#28
6044  1634 b702          	ld	_displayWriteString$L+2,a
6045  1636 a632          	ld	a,#50
6046  1638 cd0000        	call	_labelGet
6048  163b cd0000        	call	_displayWriteString
6050                     ; 835 				displayWriteString(labelGet(LABEL_VISUAL_REGISTER_02), 		DISPLAY_NULL, 				13, 	18);
6052  163e a612          	ld	a,#18
6053  1640 b704          	ld	_displayWriteString$L+4,a
6054  1642 a60d          	ld	a,#13
6055  1644 b703          	ld	_displayWriteString$L+3,a
6056  1646 a6ff          	ld	a,#255
6057  1648 b702          	ld	_displayWriteString$L+2,a
6058  164a a633          	ld	a,#51
6059  164c cd0000        	call	_labelGet
6061  164f cd0000        	call	_displayWriteString
6063                     ; 836 				displayWriteString(labelGet(LABEL_VISUAL_OSCILL_01), 		DISPLAY_NULL, 				13, 	31);
6065  1652 a61f          	ld	a,#31
6066  1654 b704          	ld	_displayWriteString$L+4,a
6067  1656 a60d          	ld	a,#13
6068  1658 b703          	ld	_displayWriteString$L+3,a
6069  165a a6ff          	ld	a,#255
6070  165c b702          	ld	_displayWriteString$L+2,a
6071  165e a634          	ld	a,#52
6072  1660 cd0000        	call	_labelGet
6074  1663 cd0000        	call	_displayWriteString
6076                     ; 837 				displayWriteString(labelGet(LABEL_VISUAL_OSCILL_02), 		DISPLAY_NULL, 				13, 	40);
6078  1666 a628          	ld	a,#40
6079  1668 b704          	ld	_displayWriteString$L+4,a
6080  166a a60d          	ld	a,#13
6081  166c b703          	ld	_displayWriteString$L+3,a
6082  166e a6ff          	ld	a,#255
6083  1670 b702          	ld	_displayWriteString$L+2,a
6084  1672 a635          	ld	a,#53
6085  1674 cd0000        	call	_labelGet
6087  1677 cd0000        	call	_displayWriteString
6089                     ; 838 				displayWriteString(labelGet(LABEL_JOB_ARCHIVE_01), 			DISPLAY_NULL, 				13, 	52);
6091  167a a634          	ld	a,#52
6092  167c b704          	ld	_displayWriteString$L+4,a
6093  167e a60d          	ld	a,#13
6094  1680 b703          	ld	_displayWriteString$L+3,a
6095  1682 a6ff          	ld	a,#255
6096  1684 b702          	ld	_displayWriteString$L+2,a
6097  1686 a636          	ld	a,#54
6098  1688 cd0000        	call	_labelGet
6100  168b cd0000        	call	_displayWriteString
6102                     ; 839 				displayWriteString(labelGet(LABEL_JOB_ARCHIVE_02), 			DISPLAY_NULL, 				13, 	61);
6104  168e a63d          	ld	a,#61
6105  1690 b704          	ld	_displayWriteString$L+4,a
6106  1692 a60d          	ld	a,#13
6107  1694 b703          	ld	_displayWriteString$L+3,a
6108  1696 a6ff          	ld	a,#255
6109  1698 b702          	ld	_displayWriteString$L+2,a
6110  169a a637          	ld	a,#55
6111  169c cd0000        	call	_labelGet
6113  169f cd0000        	call	_displayWriteString
6115                     ; 840 				if ((parametersGetValue(PARAM_TWIN_APPLICATION_01)>0) && 
6115                     ; 841 					(parametersGetValue(PARAM_TWIN_APPLICATION_02)>0))
6117  16a2 a634          	ld	a,#52
6118  16a4 cd0000        	call	_parametersGetValue
6120  16a7 4d            	tnz	a
6121  16a8 2601          	jrne	L062
6122  16aa 5d            	tnz	x
6123  16ab               L062:
6124  16ab 2733          	jreq	L5602
6126  16ad a635          	ld	a,#53
6127  16af cd0000        	call	_parametersGetValue
6129  16b2 4d            	tnz	a
6130  16b3 2601          	jrne	L262
6131  16b5 5d            	tnz	x
6132  16b6               L262:
6133  16b6 2728          	jreq	L5602
6134                     ; 843 					displayWriteString(labelGet(LABEL_SELECT_APPLICATION_01), 	DISPLAY_NULL, 			78, 	9);
6136  16b8 a609          	ld	a,#9
6137  16ba b704          	ld	_displayWriteString$L+4,a
6138  16bc a64e          	ld	a,#78
6139  16be b703          	ld	_displayWriteString$L+3,a
6140  16c0 a6ff          	ld	a,#255
6141  16c2 b702          	ld	_displayWriteString$L+2,a
6142  16c4 a665          	ld	a,#101
6143  16c6 cd0000        	call	_labelGet
6145  16c9 cd0000        	call	_displayWriteString
6147                     ; 844 					displayWriteString(labelGet(LABEL_SELECT_APPLICATION_02),	DISPLAY_NULL, 			78, 	18);
6149  16cc a612          	ld	a,#18
6150  16ce b704          	ld	_displayWriteString$L+4,a
6151  16d0 a64e          	ld	a,#78
6152  16d2 b703          	ld	_displayWriteString$L+3,a
6153  16d4 a6ff          	ld	a,#255
6154  16d6 b702          	ld	_displayWriteString$L+2,a
6155  16d8 a666          	ld	a,#102
6156  16da cd0000        	call	_labelGet
6158  16dd cd0000        	call	_displayWriteString
6160  16e0               L5602:
6161                     ; 847 				if (parametersGetValue(PARAM_TWIN_ENCODER_ENABLE)==0x0000)
6163  16e0 a636          	ld	a,#54
6164  16e2 cd0000        	call	_parametersGetValue
6166  16e5 4d            	tnz	a
6167  16e6 2601          	jrne	L462
6168  16e8 5d            	tnz	x
6169  16e9               L462:
6170  16e9 2628          	jrne	L7602
6171                     ; 849 					displayWriteString(labelGet(LABEL_SELECT_ENCODER_01),		DISPLAY_NULL, 			78, 	31);
6173  16eb a61f          	ld	a,#31
6174  16ed b704          	ld	_displayWriteString$L+4,a
6175  16ef a64e          	ld	a,#78
6176  16f1 b703          	ld	_displayWriteString$L+3,a
6177  16f3 a6ff          	ld	a,#255
6178  16f5 b702          	ld	_displayWriteString$L+2,a
6179  16f7 a667          	ld	a,#103
6180  16f9 cd0000        	call	_labelGet
6182  16fc cd0000        	call	_displayWriteString
6184                     ; 850 					displayWriteString(labelGet(LABEL_SELECT_ENCODER_02), 		DISPLAY_NULL, 			78, 	40);
6186  16ff a628          	ld	a,#40
6187  1701 b704          	ld	_displayWriteString$L+4,a
6188  1703 a64e          	ld	a,#78
6189  1705 b703          	ld	_displayWriteString$L+3,a
6190  1707 a6ff          	ld	a,#255
6191  1709 b702          	ld	_displayWriteString$L+2,a
6192  170b a668          	ld	a,#104
6193  170d cd0000        	call	_labelGet
6195  1710 cd0000        	call	_displayWriteString
6197  1713               L7602:
6198                     ; 852 				if (parametersGetValue(PARAM_SH_PN_ENABLE)==0x0000)
6200  1713 a63a          	ld	a,#58
6201  1715 cd0000        	call	_parametersGetValue
6203  1718 4d            	tnz	a
6204  1719 2601          	jrne	L662
6205  171b 5d            	tnz	x
6206  171c               L662:
6207  171c 2628          	jrne	L1702
6208                     ; 854 					displayWriteString(labelGet(LABEL_SELECT_SH_PN_01), 		DISPLAY_NULL, 				78, 	52);
6210  171e a634          	ld	a,#52
6211  1720 b704          	ld	_displayWriteString$L+4,a
6212  1722 a64e          	ld	a,#78
6213  1724 b703          	ld	_displayWriteString$L+3,a
6214  1726 a6ff          	ld	a,#255
6215  1728 b702          	ld	_displayWriteString$L+2,a
6216  172a a66d          	ld	a,#109
6217  172c cd0000        	call	_labelGet
6219  172f cd0000        	call	_displayWriteString
6221                     ; 855 					displayWriteString(labelGet(LABEL_SELECT_SH_PN_02), 		DISPLAY_NULL, 				78, 	61);
6223  1732 a63d          	ld	a,#61
6224  1734 b704          	ld	_displayWriteString$L+4,a
6225  1736 a64e          	ld	a,#78
6226  1738 b703          	ld	_displayWriteString$L+3,a
6227  173a a6ff          	ld	a,#255
6228  173c b702          	ld	_displayWriteString$L+2,a
6229  173e a66e          	ld	a,#110
6230  1740 cd0000        	call	_labelGet
6232  1743 cd0000        	call	_displayWriteString
6234  1746               L1702:
6235                     ; 857 				windowForceRepaint();
6237  1746 cd001e        	call	_windowForceRepaint
6239                     ; 858 				_bset(m_woDisplayedWindow, WIN_MENUS);
6241  1749 c60005        	ld	a,_m_woDisplayedWindow
6242  174c aa02          	or	a,#2
6243  174e c70005        	ld	_m_woDisplayedWindow,a
6244                     ; 859 				break;
6246  1751 cc1b24        	jp	L3502
6247  1754               L3271:
6248                     ; 860 			case MENU_GROUP_ARCHIVE:
6248                     ; 861 				displayWriteString(labelGet(LABEL_SAVE_JOB_01),				DISPLAY_SELECT_FONT_MINI, 	13, 	9);
6250  1754 a609          	ld	a,#9
6251  1756 b704          	ld	_displayWriteString$L+4,a
6252  1758 a60d          	ld	a,#13
6253  175a b703          	ld	_displayWriteString$L+3,a
6254  175c a61c          	ld	a,#28
6255  175e b702          	ld	_displayWriteString$L+2,a
6256  1760 a647          	ld	a,#71
6257  1762 cd0000        	call	_labelGet
6259  1765 cd0000        	call	_displayWriteString
6261                     ; 862 				displayWriteString(labelGet(LABEL_SAVE_JOB_02), 			DISPLAY_NULL, 				13, 	18);
6263  1768 a612          	ld	a,#18
6264  176a b704          	ld	_displayWriteString$L+4,a
6265  176c a60d          	ld	a,#13
6266  176e b703          	ld	_displayWriteString$L+3,a
6267  1770 a6ff          	ld	a,#255
6268  1772 b702          	ld	_displayWriteString$L+2,a
6269  1774 a648          	ld	a,#72
6270  1776 cd0000        	call	_labelGet
6272  1779 cd0000        	call	_displayWriteString
6274                     ; 863 				displayWriteString(labelGet(LABEL_LOAD_JOB_01), 			DISPLAY_NULL, 				13, 	31);
6276  177c a61f          	ld	a,#31
6277  177e b704          	ld	_displayWriteString$L+4,a
6278  1780 a60d          	ld	a,#13
6279  1782 b703          	ld	_displayWriteString$L+3,a
6280  1784 a6ff          	ld	a,#255
6281  1786 b702          	ld	_displayWriteString$L+2,a
6282  1788 a649          	ld	a,#73
6283  178a cd0000        	call	_labelGet
6285  178d cd0000        	call	_displayWriteString
6287                     ; 864 				displayWriteString(labelGet(LABEL_LOAD_JOB_02), 			DISPLAY_NULL, 				13, 	40);
6289  1790 a628          	ld	a,#40
6290  1792 b704          	ld	_displayWriteString$L+4,a
6291  1794 a60d          	ld	a,#13
6292  1796 b703          	ld	_displayWriteString$L+3,a
6293  1798 a6ff          	ld	a,#255
6294  179a b702          	ld	_displayWriteString$L+2,a
6295  179c a64a          	ld	a,#74
6296  179e cd0000        	call	_labelGet
6298  17a1 cd0000        	call	_displayWriteString
6300                     ; 865 				windowForceRepaint();
6302  17a4 cd001e        	call	_windowForceRepaint
6304                     ; 866 				_bset(m_woDisplayedWindow, WIN_ARCHIVES);
6306  17a7 c60005        	ld	a,_m_woDisplayedWindow
6307  17aa aa08          	or	a,#8
6308  17ac c70005        	ld	_m_woDisplayedWindow,a
6309                     ; 867 				break;
6311  17af cc1b24        	jp	L3502
6312  17b2               L5271:
6313                     ; 868 			case MENU_GROUP_APP:
6313                     ; 869 				switch(parametersGetValue(PARAM_TWIN_APPLICATION_01))
6315  17b2 a634          	ld	a,#52
6316  17b4 cd0000        	call	_parametersGetValue
6319                     ; 899 					default:
6319                     ; 900 						break;
6320  17b7 5d            	tnz	x
6321  17b8 2703          	jreq	L473
6322  17ba cc1908        	jp	L5702
6323  17bd               L473:
6324  17bd 4a            	dec	a
6325  17be 2721          	jreq	L7271
6326  17c0 4a            	dec	a
6327  17c1 2749          	jreq	L1371
6328  17c3 4a            	dec	a
6329  17c4 2771          	jreq	L3371
6330  17c6 4a            	dec	a
6331  17c7 2603          	jrne	L673
6332  17c9 cc1862        	jp	L5371
6333  17cc               L673:
6334  17cc 4a            	dec	a
6335  17cd 2603          	jrne	L004
6336  17cf cc188c        	jp	L7371
6337  17d2               L004:
6338  17d2 4a            	dec	a
6339  17d3 2603          	jrne	L204
6340  17d5 cc18b6        	jp	L1471
6341  17d8               L204:
6342  17d8 4a            	dec	a
6343  17d9 2603          	jrne	L404
6344  17db cc18e0        	jp	L3471
6345  17de               L404:
6346  17de cc1908        	jp	L5702
6347  17e1               L7271:
6348                     ; 871 					case PARAM_TWIN_APPLICATION_FBSIDE:
6348                     ; 872 						displayWriteString(labelGet(LABEL_TWIN_APPLICATION_01_01), 		DISPLAY_SELECT_FONT_MINI, 	13, 	9);
6350  17e1 a609          	ld	a,#9
6351  17e3 b704          	ld	_displayWriteString$L+4,a
6352  17e5 a60d          	ld	a,#13
6353  17e7 b703          	ld	_displayWriteString$L+3,a
6354  17e9 a61c          	ld	a,#28
6355  17eb b702          	ld	_displayWriteString$L+2,a
6356  17ed a64b          	ld	a,#75
6357  17ef cd0000        	call	_labelGet
6359  17f2 cd0000        	call	_displayWriteString
6361                     ; 873 						displayWriteString(labelGet(LABEL_TWIN_APPLICATION_01_02), 		DISPLAY_NULL, 	13, 	18);
6363  17f5 a612          	ld	a,#18
6364  17f7 b704          	ld	_displayWriteString$L+4,a
6365  17f9 a60d          	ld	a,#13
6366  17fb b703          	ld	_displayWriteString$L+3,a
6367  17fd a6ff          	ld	a,#255
6368  17ff b702          	ld	_displayWriteString$L+2,a
6369  1801 a64c          	ld	a,#76
6370  1803 cd0000        	call	_labelGet
6372  1806 cd0000        	call	_displayWriteString
6374                     ; 874 						break;
6376  1809 cc1908        	jp	L5702
6377  180c               L1371:
6378                     ; 875 					case PARAM_TWIN_APPLICATION_INSETTER:
6378                     ; 876 						displayWriteString(labelGet(LABEL_TWIN_APPLICATION_02_01), 		DISPLAY_SELECT_FONT_MINI, 	13, 	9);
6380  180c a609          	ld	a,#9
6381  180e b704          	ld	_displayWriteString$L+4,a
6382  1810 a60d          	ld	a,#13
6383  1812 b703          	ld	_displayWriteString$L+3,a
6384  1814 a61c          	ld	a,#28
6385  1816 b702          	ld	_displayWriteString$L+2,a
6386  1818 a64d          	ld	a,#77
6387  181a cd0000        	call	_labelGet
6389  181d cd0000        	call	_displayWriteString
6391                     ; 877 						displayWriteString(labelGet(LABEL_TWIN_APPLICATION_02_02), 		DISPLAY_NULL, 	13, 	18);
6393  1820 a612          	ld	a,#18
6394  1822 b704          	ld	_displayWriteString$L+4,a
6395  1824 a60d          	ld	a,#13
6396  1826 b703          	ld	_displayWriteString$L+3,a
6397  1828 a6ff          	ld	a,#255
6398  182a b702          	ld	_displayWriteString$L+2,a
6399  182c a64e          	ld	a,#78
6400  182e cd0000        	call	_labelGet
6402  1831 cd0000        	call	_displayWriteString
6404                     ; 878 						break;
6406  1834 cc1908        	jp	L5702
6407  1837               L3371:
6408                     ; 879 					case PARAM_TWIN_APPLICATION_CUT:
6408                     ; 880 						displayWriteString(labelGet(LABEL_TWIN_APPLICATION_03_01), 		DISPLAY_SELECT_FONT_MINI, 	13, 	9);
6410  1837 a609          	ld	a,#9
6411  1839 b704          	ld	_displayWriteString$L+4,a
6412  183b a60d          	ld	a,#13
6413  183d b703          	ld	_displayWriteString$L+3,a
6414  183f a61c          	ld	a,#28
6415  1841 b702          	ld	_displayWriteString$L+2,a
6416  1843 a64f          	ld	a,#79
6417  1845 cd0000        	call	_labelGet
6419  1848 cd0000        	call	_displayWriteString
6421                     ; 881 						displayWriteString(labelGet(LABEL_TWIN_APPLICATION_03_02), 		DISPLAY_NULL, 	13, 	18);
6423  184b a612          	ld	a,#18
6424  184d b704          	ld	_displayWriteString$L+4,a
6425  184f a60d          	ld	a,#13
6426  1851 b703          	ld	_displayWriteString$L+3,a
6427  1853 a6ff          	ld	a,#255
6428  1855 b702          	ld	_displayWriteString$L+2,a
6429  1857 a650          	ld	a,#80
6430  1859 cd0000        	call	_labelGet
6432  185c cd0000        	call	_displayWriteString
6434                     ; 882 						break;
6436  185f cc1908        	jp	L5702
6437  1862               L5371:
6438                     ; 883 					case PARAM_TWIN_APPLICATION_WEBFOLD:
6438                     ; 884 						displayWriteString(labelGet(LABEL_TWIN_APPLICATION_04_01), 		DISPLAY_SELECT_FONT_MINI, 	13, 	9);
6440  1862 a609          	ld	a,#9
6441  1864 b704          	ld	_displayWriteString$L+4,a
6442  1866 a60d          	ld	a,#13
6443  1868 b703          	ld	_displayWriteString$L+3,a
6444  186a a61c          	ld	a,#28
6445  186c b702          	ld	_displayWriteString$L+2,a
6446  186e a651          	ld	a,#81
6447  1870 cd0000        	call	_labelGet
6449  1873 cd0000        	call	_displayWriteString
6451                     ; 885 						displayWriteString(labelGet(LABEL_TWIN_APPLICATION_04_02), 		DISPLAY_NULL, 	13, 	18);
6453  1876 a612          	ld	a,#18
6454  1878 b704          	ld	_displayWriteString$L+4,a
6455  187a a60d          	ld	a,#13
6456  187c b703          	ld	_displayWriteString$L+3,a
6457  187e a6ff          	ld	a,#255
6458  1880 b702          	ld	_displayWriteString$L+2,a
6459  1882 a652          	ld	a,#82
6460  1884 cd0000        	call	_labelGet
6462  1887 cd0000        	call	_displayWriteString
6464                     ; 886 						break;
6466  188a 207c          	jra	L5702
6467  188c               L7371:
6468                     ; 887 					case PARAM_TWIN_APPLICATION_PERFORAT:
6468                     ; 888 						displayWriteString(labelGet(LABEL_TWIN_APPLICATION_05_01), 		DISPLAY_SELECT_FONT_MINI, 	13, 	9);
6470  188c a609          	ld	a,#9
6471  188e b704          	ld	_displayWriteString$L+4,a
6472  1890 a60d          	ld	a,#13
6473  1892 b703          	ld	_displayWriteString$L+3,a
6474  1894 a61c          	ld	a,#28
6475  1896 b702          	ld	_displayWriteString$L+2,a
6476  1898 a653          	ld	a,#83
6477  189a cd0000        	call	_labelGet
6479  189d cd0000        	call	_displayWriteString
6481                     ; 889 						displayWriteString(labelGet(LABEL_TWIN_APPLICATION_05_02), 		DISPLAY_NULL, 	13, 	18);
6483  18a0 a612          	ld	a,#18
6484  18a2 b704          	ld	_displayWriteString$L+4,a
6485  18a4 a60d          	ld	a,#13
6486  18a6 b703          	ld	_displayWriteString$L+3,a
6487  18a8 a6ff          	ld	a,#255
6488  18aa b702          	ld	_displayWriteString$L+2,a
6489  18ac a654          	ld	a,#84
6490  18ae cd0000        	call	_labelGet
6492  18b1 cd0000        	call	_displayWriteString
6494                     ; 890 						break;
6496  18b4 2052          	jra	L5702
6497  18b6               L1471:
6498                     ; 891 					case PARAM_TWIN_APPLICATION_FSIDE:
6498                     ; 892 						displayWriteString(labelGet(LABEL_TWIN_APPLICATION_06_01), 		DISPLAY_SELECT_FONT_MINI, 	13, 	9);
6500  18b6 a609          	ld	a,#9
6501  18b8 b704          	ld	_displayWriteString$L+4,a
6502  18ba a60d          	ld	a,#13
6503  18bc b703          	ld	_displayWriteString$L+3,a
6504  18be a61c          	ld	a,#28
6505  18c0 b702          	ld	_displayWriteString$L+2,a
6506  18c2 a655          	ld	a,#85
6507  18c4 cd0000        	call	_labelGet
6509  18c7 cd0000        	call	_displayWriteString
6511                     ; 893 						displayWriteString(labelGet(LABEL_TWIN_APPLICATION_06_02), 		DISPLAY_NULL, 	13, 	18);
6513  18ca a612          	ld	a,#18
6514  18cc b704          	ld	_displayWriteString$L+4,a
6515  18ce a60d          	ld	a,#13
6516  18d0 b703          	ld	_displayWriteString$L+3,a
6517  18d2 a6ff          	ld	a,#255
6518  18d4 b702          	ld	_displayWriteString$L+2,a
6519  18d6 a656          	ld	a,#86
6520  18d8 cd0000        	call	_labelGet
6522  18db cd0000        	call	_displayWriteString
6524                     ; 894 						break;
6526  18de 2028          	jra	L5702
6527  18e0               L3471:
6528                     ; 895 					case PARAM_TWIN_APPLICATION_BSIDE:
6528                     ; 896 						displayWriteString(labelGet(LABEL_TWIN_APPLICATION_07_01), 		DISPLAY_SELECT_FONT_MINI, 	13, 	9);
6530  18e0 a609          	ld	a,#9
6531  18e2 b704          	ld	_displayWriteString$L+4,a
6532  18e4 a60d          	ld	a,#13
6533  18e6 b703          	ld	_displayWriteString$L+3,a
6534  18e8 a61c          	ld	a,#28
6535  18ea b702          	ld	_displayWriteString$L+2,a
6536  18ec a657          	ld	a,#87
6537  18ee cd0000        	call	_labelGet
6539  18f1 cd0000        	call	_displayWriteString
6541                     ; 897 						displayWriteString(labelGet(LABEL_TWIN_APPLICATION_07_02), 		DISPLAY_NULL, 	13, 	18);
6543  18f4 a612          	ld	a,#18
6544  18f6 b704          	ld	_displayWriteString$L+4,a
6545  18f8 a60d          	ld	a,#13
6546  18fa b703          	ld	_displayWriteString$L+3,a
6547  18fc a6ff          	ld	a,#255
6548  18fe b702          	ld	_displayWriteString$L+2,a
6549  1900 a658          	ld	a,#88
6550  1902 cd0000        	call	_labelGet
6552  1905 cd0000        	call	_displayWriteString
6554                     ; 898 						break;						
6556  1908               L5471:
6557                     ; 899 					default:
6557                     ; 900 						break;
6559  1908               L5702:
6560                     ; 903 				switch(parametersGetValue(PARAM_TWIN_APPLICATION_02))
6562  1908 a635          	ld	a,#53
6563  190a cd0000        	call	_parametersGetValue
6566                     ; 933 					default:
6566                     ; 934 						break;
6567  190d 5d            	tnz	x
6568  190e 2703          	jreq	L604
6569  1910 cc1a5e        	jp	L1012
6570  1913               L604:
6571  1913 4a            	dec	a
6572  1914 2721          	jreq	L7471
6573  1916 4a            	dec	a
6574  1917 2749          	jreq	L1571
6575  1919 4a            	dec	a
6576  191a 2771          	jreq	L3571
6577  191c 4a            	dec	a
6578  191d 2603          	jrne	L014
6579  191f cc19b8        	jp	L5571
6580  1922               L014:
6581  1922 4a            	dec	a
6582  1923 2603          	jrne	L214
6583  1925 cc19e2        	jp	L7571
6584  1928               L214:
6585  1928 4a            	dec	a
6586  1929 2603          	jrne	L414
6587  192b cc1a0c        	jp	L1671
6588  192e               L414:
6589  192e 4a            	dec	a
6590  192f 2603          	jrne	L614
6591  1931 cc1a36        	jp	L3671
6592  1934               L614:
6593  1934 cc1a5e        	jp	L1012
6594  1937               L7471:
6595                     ; 905 					case PARAM_TWIN_APPLICATION_FBSIDE:
6595                     ; 906 						displayWriteString(labelGet(LABEL_TWIN_APPLICATION_01_01), 		DISPLAY_NULL, 	13, 	31);
6597  1937 a61f          	ld	a,#31
6598  1939 b704          	ld	_displayWriteString$L+4,a
6599  193b a60d          	ld	a,#13
6600  193d b703          	ld	_displayWriteString$L+3,a
6601  193f a6ff          	ld	a,#255
6602  1941 b702          	ld	_displayWriteString$L+2,a
6603  1943 a64b          	ld	a,#75
6604  1945 cd0000        	call	_labelGet
6606  1948 cd0000        	call	_displayWriteString
6608                     ; 907 						displayWriteString(labelGet(LABEL_TWIN_APPLICATION_01_02), 		DISPLAY_NULL, 	13, 	40);
6610  194b a628          	ld	a,#40
6611  194d b704          	ld	_displayWriteString$L+4,a
6612  194f a60d          	ld	a,#13
6613  1951 b703          	ld	_displayWriteString$L+3,a
6614  1953 a6ff          	ld	a,#255
6615  1955 b702          	ld	_displayWriteString$L+2,a
6616  1957 a64c          	ld	a,#76
6617  1959 cd0000        	call	_labelGet
6619  195c cd0000        	call	_displayWriteString
6621                     ; 908 						break;
6623  195f cc1a5e        	jp	L1012
6624  1962               L1571:
6625                     ; 909 					case PARAM_TWIN_APPLICATION_INSETTER:
6625                     ; 910 						displayWriteString(labelGet(LABEL_TWIN_APPLICATION_02_01), 		DISPLAY_NULL, 	13, 	31);
6627  1962 a61f          	ld	a,#31
6628  1964 b704          	ld	_displayWriteString$L+4,a
6629  1966 a60d          	ld	a,#13
6630  1968 b703          	ld	_displayWriteString$L+3,a
6631  196a a6ff          	ld	a,#255
6632  196c b702          	ld	_displayWriteString$L+2,a
6633  196e a64d          	ld	a,#77
6634  1970 cd0000        	call	_labelGet
6636  1973 cd0000        	call	_displayWriteString
6638                     ; 911 						displayWriteString(labelGet(LABEL_TWIN_APPLICATION_02_02), 		DISPLAY_NULL, 	13, 	40);
6640  1976 a628          	ld	a,#40
6641  1978 b704          	ld	_displayWriteString$L+4,a
6642  197a a60d          	ld	a,#13
6643  197c b703          	ld	_displayWriteString$L+3,a
6644  197e a6ff          	ld	a,#255
6645  1980 b702          	ld	_displayWriteString$L+2,a
6646  1982 a64e          	ld	a,#78
6647  1984 cd0000        	call	_labelGet
6649  1987 cd0000        	call	_displayWriteString
6651                     ; 912 						break;
6653  198a cc1a5e        	jp	L1012
6654  198d               L3571:
6655                     ; 913 					case PARAM_TWIN_APPLICATION_CUT:
6655                     ; 914 						displayWriteString(labelGet(LABEL_TWIN_APPLICATION_03_01), 		DISPLAY_NULL, 	13, 	31);
6657  198d a61f          	ld	a,#31
6658  198f b704          	ld	_displayWriteString$L+4,a
6659  1991 a60d          	ld	a,#13
6660  1993 b703          	ld	_displayWriteString$L+3,a
6661  1995 a6ff          	ld	a,#255
6662  1997 b702          	ld	_displayWriteString$L+2,a
6663  1999 a64f          	ld	a,#79
6664  199b cd0000        	call	_labelGet
6666  199e cd0000        	call	_displayWriteString
6668                     ; 915 						displayWriteString(labelGet(LABEL_TWIN_APPLICATION_03_02), 		DISPLAY_NULL, 	13, 	40);
6670  19a1 a628          	ld	a,#40
6671  19a3 b704          	ld	_displayWriteString$L+4,a
6672  19a5 a60d          	ld	a,#13
6673  19a7 b703          	ld	_displayWriteString$L+3,a
6674  19a9 a6ff          	ld	a,#255
6675  19ab b702          	ld	_displayWriteString$L+2,a
6676  19ad a650          	ld	a,#80
6677  19af cd0000        	call	_labelGet
6679  19b2 cd0000        	call	_displayWriteString
6681                     ; 916 						break;
6683  19b5 cc1a5e        	jp	L1012
6684  19b8               L5571:
6685                     ; 917 					case PARAM_TWIN_APPLICATION_WEBFOLD:
6685                     ; 918 						displayWriteString(labelGet(LABEL_TWIN_APPLICATION_04_01), 		DISPLAY_NULL, 	13, 	31);
6687  19b8 a61f          	ld	a,#31
6688  19ba b704          	ld	_displayWriteString$L+4,a
6689  19bc a60d          	ld	a,#13
6690  19be b703          	ld	_displayWriteString$L+3,a
6691  19c0 a6ff          	ld	a,#255
6692  19c2 b702          	ld	_displayWriteString$L+2,a
6693  19c4 a651          	ld	a,#81
6694  19c6 cd0000        	call	_labelGet
6696  19c9 cd0000        	call	_displayWriteString
6698                     ; 919 						displayWriteString(labelGet(LABEL_TWIN_APPLICATION_04_02), 		DISPLAY_NULL, 	13, 	40);
6700  19cc a628          	ld	a,#40
6701  19ce b704          	ld	_displayWriteString$L+4,a
6702  19d0 a60d          	ld	a,#13
6703  19d2 b703          	ld	_displayWriteString$L+3,a
6704  19d4 a6ff          	ld	a,#255
6705  19d6 b702          	ld	_displayWriteString$L+2,a
6706  19d8 a652          	ld	a,#82
6707  19da cd0000        	call	_labelGet
6709  19dd cd0000        	call	_displayWriteString
6711                     ; 920 						break;
6713  19e0 207c          	jra	L1012
6714  19e2               L7571:
6715                     ; 921 					case PARAM_TWIN_APPLICATION_PERFORAT:
6715                     ; 922 						displayWriteString(labelGet(LABEL_TWIN_APPLICATION_05_01), 		DISPLAY_NULL, 	13, 	31);
6717  19e2 a61f          	ld	a,#31
6718  19e4 b704          	ld	_displayWriteString$L+4,a
6719  19e6 a60d          	ld	a,#13
6720  19e8 b703          	ld	_displayWriteString$L+3,a
6721  19ea a6ff          	ld	a,#255
6722  19ec b702          	ld	_displayWriteString$L+2,a
6723  19ee a653          	ld	a,#83
6724  19f0 cd0000        	call	_labelGet
6726  19f3 cd0000        	call	_displayWriteString
6728                     ; 923 						displayWriteString(labelGet(LABEL_TWIN_APPLICATION_05_02), 		DISPLAY_NULL, 	13, 	40);
6730  19f6 a628          	ld	a,#40
6731  19f8 b704          	ld	_displayWriteString$L+4,a
6732  19fa a60d          	ld	a,#13
6733  19fc b703          	ld	_displayWriteString$L+3,a
6734  19fe a6ff          	ld	a,#255
6735  1a00 b702          	ld	_displayWriteString$L+2,a
6736  1a02 a654          	ld	a,#84
6737  1a04 cd0000        	call	_labelGet
6739  1a07 cd0000        	call	_displayWriteString
6741                     ; 924 						break;
6743  1a0a 2052          	jra	L1012
6744  1a0c               L1671:
6745                     ; 925 					case PARAM_TWIN_APPLICATION_FSIDE:
6745                     ; 926 						displayWriteString(labelGet(LABEL_TWIN_APPLICATION_06_01), 		DISPLAY_NULL, 	13, 	31);
6747  1a0c a61f          	ld	a,#31
6748  1a0e b704          	ld	_displayWriteString$L+4,a
6749  1a10 a60d          	ld	a,#13
6750  1a12 b703          	ld	_displayWriteString$L+3,a
6751  1a14 a6ff          	ld	a,#255
6752  1a16 b702          	ld	_displayWriteString$L+2,a
6753  1a18 a655          	ld	a,#85
6754  1a1a cd0000        	call	_labelGet
6756  1a1d cd0000        	call	_displayWriteString
6758                     ; 927 						displayWriteString(labelGet(LABEL_TWIN_APPLICATION_06_02), 		DISPLAY_NULL, 	13, 	40);
6760  1a20 a628          	ld	a,#40
6761  1a22 b704          	ld	_displayWriteString$L+4,a
6762  1a24 a60d          	ld	a,#13
6763  1a26 b703          	ld	_displayWriteString$L+3,a
6764  1a28 a6ff          	ld	a,#255
6765  1a2a b702          	ld	_displayWriteString$L+2,a
6766  1a2c a656          	ld	a,#86
6767  1a2e cd0000        	call	_labelGet
6769  1a31 cd0000        	call	_displayWriteString
6771                     ; 928 						break;
6773  1a34 2028          	jra	L1012
6774  1a36               L3671:
6775                     ; 929 					case PARAM_TWIN_APPLICATION_BSIDE:
6775                     ; 930 						displayWriteString(labelGet(LABEL_TWIN_APPLICATION_07_01), 		DISPLAY_NULL, 	13, 	31);
6777  1a36 a61f          	ld	a,#31
6778  1a38 b704          	ld	_displayWriteString$L+4,a
6779  1a3a a60d          	ld	a,#13
6780  1a3c b703          	ld	_displayWriteString$L+3,a
6781  1a3e a6ff          	ld	a,#255
6782  1a40 b702          	ld	_displayWriteString$L+2,a
6783  1a42 a657          	ld	a,#87
6784  1a44 cd0000        	call	_labelGet
6786  1a47 cd0000        	call	_displayWriteString
6788                     ; 931 						displayWriteString(labelGet(LABEL_TWIN_APPLICATION_07_02), 		DISPLAY_NULL, 	13, 	40);
6790  1a4a a628          	ld	a,#40
6791  1a4c b704          	ld	_displayWriteString$L+4,a
6792  1a4e a60d          	ld	a,#13
6793  1a50 b703          	ld	_displayWriteString$L+3,a
6794  1a52 a6ff          	ld	a,#255
6795  1a54 b702          	ld	_displayWriteString$L+2,a
6796  1a56 a658          	ld	a,#88
6797  1a58 cd0000        	call	_labelGet
6799  1a5b cd0000        	call	_displayWriteString
6801                     ; 932 						break;
6803  1a5e               L5671:
6804                     ; 933 					default:
6804                     ; 934 						break;
6806  1a5e               L1012:
6807                     ; 936 				windowForceRepaint();
6809  1a5e cd001e        	call	_windowForceRepaint
6811                     ; 937 				_bset(m_woDisplayedWindow, WIN_APPLICATION);
6813  1a61 c60005        	ld	a,_m_woDisplayedWindow
6814  1a64 aa10          	or	a,#16
6815  1a66 c70005        	ld	_m_woDisplayedWindow,a
6816                     ; 938 				break;
6818  1a69 cc1b24        	jp	L3502
6819  1a6c               L7671:
6820                     ; 939 			case MENU_GROUP_ENC:
6820                     ; 940 				displayWriteString(labelGet(LABEL_ENCODER_01_01),			DISPLAY_SELECT_FONT_MINI, 	13, 	9);
6822  1a6c a609          	ld	a,#9
6823  1a6e b704          	ld	_displayWriteString$L+4,a
6824  1a70 a60d          	ld	a,#13
6825  1a72 b703          	ld	_displayWriteString$L+3,a
6826  1a74 a61c          	ld	a,#28
6827  1a76 b702          	ld	_displayWriteString$L+2,a
6828  1a78 a661          	ld	a,#97
6829  1a7a cd0000        	call	_labelGet
6831  1a7d cd0000        	call	_displayWriteString
6833                     ; 941 				displayWriteString(labelGet(LABEL_ENCODER_01_02), 			DISPLAY_NULL, 				13, 	18);
6835  1a80 a612          	ld	a,#18
6836  1a82 b704          	ld	_displayWriteString$L+4,a
6837  1a84 a60d          	ld	a,#13
6838  1a86 b703          	ld	_displayWriteString$L+3,a
6839  1a88 a6ff          	ld	a,#255
6840  1a8a b702          	ld	_displayWriteString$L+2,a
6841  1a8c a662          	ld	a,#98
6842  1a8e cd0000        	call	_labelGet
6844  1a91 cd0000        	call	_displayWriteString
6846                     ; 942 				displayWriteString(labelGet(LABEL_ENCODER_02_01), 			DISPLAY_NULL, 				13, 	31);
6848  1a94 a61f          	ld	a,#31
6849  1a96 b704          	ld	_displayWriteString$L+4,a
6850  1a98 a60d          	ld	a,#13
6851  1a9a b703          	ld	_displayWriteString$L+3,a
6852  1a9c a6ff          	ld	a,#255
6853  1a9e b702          	ld	_displayWriteString$L+2,a
6854  1aa0 a663          	ld	a,#99
6855  1aa2 cd0000        	call	_labelGet
6857  1aa5 cd0000        	call	_displayWriteString
6859                     ; 943 				displayWriteString(labelGet(LABEL_ENCODER_02_02), 			DISPLAY_NULL, 				13, 	40);
6861  1aa8 a628          	ld	a,#40
6862  1aaa b704          	ld	_displayWriteString$L+4,a
6863  1aac a60d          	ld	a,#13
6864  1aae b703          	ld	_displayWriteString$L+3,a
6865  1ab0 a6ff          	ld	a,#255
6866  1ab2 b702          	ld	_displayWriteString$L+2,a
6867  1ab4 a664          	ld	a,#100
6868  1ab6 cd0000        	call	_labelGet
6870  1ab9 cd0000        	call	_displayWriteString
6872                     ; 944 				windowForceRepaint();
6874  1abc cd001e        	call	_windowForceRepaint
6876                     ; 945 				_bset(m_woDisplayedWindow, WIN_ENCODER);
6878  1abf c60005        	ld	a,_m_woDisplayedWindow
6879  1ac2 aa20          	or	a,#32
6880  1ac4 c70005        	ld	_m_woDisplayedWindow,a
6881                     ; 946 				break;
6883  1ac7 205b          	jra	L3502
6884  1ac9               L1771:
6885                     ; 947 			case MENU_GROUP_SH_PN:
6885                     ; 948 				displayWriteString(labelGet(LABEL_SH_PN_01_01),				DISPLAY_SELECT_FONT_MINI, 	13, 	9);
6887  1ac9 a609          	ld	a,#9
6888  1acb b704          	ld	_displayWriteString$L+4,a
6889  1acd a60d          	ld	a,#13
6890  1acf b703          	ld	_displayWriteString$L+3,a
6891  1ad1 a61c          	ld	a,#28
6892  1ad3 b702          	ld	_displayWriteString$L+2,a
6893  1ad5 a669          	ld	a,#105
6894  1ad7 cd0000        	call	_labelGet
6896  1ada cd0000        	call	_displayWriteString
6898                     ; 949 				displayWriteString(labelGet(LABEL_SH_PN_01_02), 			DISPLAY_NULL, 				13, 	18);
6900  1add a612          	ld	a,#18
6901  1adf b704          	ld	_displayWriteString$L+4,a
6902  1ae1 a60d          	ld	a,#13
6903  1ae3 b703          	ld	_displayWriteString$L+3,a
6904  1ae5 a6ff          	ld	a,#255
6905  1ae7 b702          	ld	_displayWriteString$L+2,a
6906  1ae9 a66a          	ld	a,#106
6907  1aeb cd0000        	call	_labelGet
6909  1aee cd0000        	call	_displayWriteString
6911                     ; 950 				displayWriteString(labelGet(LABEL_SH_PN_02_01), 			DISPLAY_NULL, 				13, 	31);
6913  1af1 a61f          	ld	a,#31
6914  1af3 b704          	ld	_displayWriteString$L+4,a
6915  1af5 a60d          	ld	a,#13
6916  1af7 b703          	ld	_displayWriteString$L+3,a
6917  1af9 a6ff          	ld	a,#255
6918  1afb b702          	ld	_displayWriteString$L+2,a
6919  1afd a66b          	ld	a,#107
6920  1aff cd0000        	call	_labelGet
6922  1b02 cd0000        	call	_displayWriteString
6924                     ; 951 				displayWriteString(labelGet(LABEL_SH_PN_02_02), 			DISPLAY_NULL, 				13, 	40);
6926  1b05 a628          	ld	a,#40
6927  1b07 b704          	ld	_displayWriteString$L+4,a
6928  1b09 a60d          	ld	a,#13
6929  1b0b b703          	ld	_displayWriteString$L+3,a
6930  1b0d a6ff          	ld	a,#255
6931  1b0f b702          	ld	_displayWriteString$L+2,a
6932  1b11 a66c          	ld	a,#108
6933  1b13 cd0000        	call	_labelGet
6935  1b16 cd0000        	call	_displayWriteString
6937                     ; 952 				windowForceRepaint();
6939  1b19 cd001e        	call	_windowForceRepaint
6941                     ; 953 				_bset(m_woDisplayedWindow, WIN_ENCODER);
6943  1b1c c60005        	ld	a,_m_woDisplayedWindow
6944  1b1f aa20          	or	a,#32
6945  1b21 c70005        	ld	_m_woDisplayedWindow,a
6946                     ; 954 				break;			
6948  1b24               L3502:
6949                     ; 958 		displaySetOutLine(0, 	0, 	63, 	20, 	(*a_bySelected == 1));
6951  1b24 92c602        	ld	a,[_window6Menu$L+2.w]
6952  1b27 a101          	cp	a,#1
6953  1b29 2604          	jrne	L472
6954  1b2b a601          	ld	a,#1
6955  1b2d 2001          	jra	L672
6956  1b2f               L472:
6957  1b2f 4f            	clr	a
6958  1b30               L672:
6959  1b30 b704          	ld	_displaySetOutLine$L+4,a
6960  1b32 a614          	ld	a,#20
6961  1b34 b703          	ld	_displaySetOutLine$L+3,a
6962  1b36 a63f          	ld	a,#63
6963  1b38 b702          	ld	_displaySetOutLine$L+2,a
6964  1b3a 4f            	clr	a
6965  1b3b 5f            	clr	x
6966  1b3c cd0000        	call	_displaySetOutLine
6968                     ; 959 		displaySetOutLine(0, 	22, 63, 	42, 	(*a_bySelected == 2));
6970  1b3f 92c602        	ld	a,[_window6Menu$L+2.w]
6971  1b42 a102          	cp	a,#2
6972  1b44 2604          	jrne	L003
6973  1b46 a601          	ld	a,#1
6974  1b48 2001          	jra	L203
6975  1b4a               L003:
6976  1b4a 4f            	clr	a
6977  1b4b               L203:
6978  1b4b b704          	ld	_displaySetOutLine$L+4,a
6979  1b4d a62a          	ld	a,#42
6980  1b4f b703          	ld	_displaySetOutLine$L+3,a
6981  1b51 a63f          	ld	a,#63
6982  1b53 b702          	ld	_displaySetOutLine$L+2,a
6983  1b55 a616          	ld	a,#22
6984  1b57 5f            	clr	x
6985  1b58 cd0000        	call	_displaySetOutLine
6987                     ; 960 		displaySetOutLine(0, 	44, 63, 	64, 	(*a_bySelected == 3));
6989  1b5b 92c602        	ld	a,[_window6Menu$L+2.w]
6990  1b5e a103          	cp	a,#3
6991  1b60 2604          	jrne	L403
6992  1b62 a601          	ld	a,#1
6993  1b64 2001          	jra	L603
6994  1b66               L403:
6995  1b66 4f            	clr	a
6996  1b67               L603:
6997  1b67 b704          	ld	_displaySetOutLine$L+4,a
6998  1b69 a640          	ld	a,#64
6999  1b6b b703          	ld	_displaySetOutLine$L+3,a
7000  1b6d a63f          	ld	a,#63
7001  1b6f b702          	ld	_displaySetOutLine$L+2,a
7002  1b71 a62c          	ld	a,#44
7003  1b73 5f            	clr	x
7004  1b74 cd0000        	call	_displaySetOutLine
7006                     ; 961 		displaySetOutLine(65, 	0, 	126, 	20, 	(*a_bySelected == 4));
7008  1b77 92c602        	ld	a,[_window6Menu$L+2.w]
7009  1b7a a104          	cp	a,#4
7010  1b7c 2604          	jrne	L013
7011  1b7e a601          	ld	a,#1
7012  1b80 2001          	jra	L213
7013  1b82               L013:
7014  1b82 4f            	clr	a
7015  1b83               L213:
7016  1b83 b704          	ld	_displaySetOutLine$L+4,a
7017  1b85 a614          	ld	a,#20
7018  1b87 b703          	ld	_displaySetOutLine$L+3,a
7019  1b89 a67e          	ld	a,#126
7020  1b8b b702          	ld	_displaySetOutLine$L+2,a
7021  1b8d 4f            	clr	a
7022  1b8e ae41          	ld	x,#65
7023  1b90 cd0000        	call	_displaySetOutLine
7025                     ; 962 		displaySetOutLine(65, 	22, 126, 	42, 	(*a_bySelected == 5));
7027  1b93 92c602        	ld	a,[_window6Menu$L+2.w]
7028  1b96 a105          	cp	a,#5
7029  1b98 2604          	jrne	L413
7030  1b9a a601          	ld	a,#1
7031  1b9c 2001          	jra	L613
7032  1b9e               L413:
7033  1b9e 4f            	clr	a
7034  1b9f               L613:
7035  1b9f b704          	ld	_displaySetOutLine$L+4,a
7036  1ba1 a62a          	ld	a,#42
7037  1ba3 b703          	ld	_displaySetOutLine$L+3,a
7038  1ba5 a67e          	ld	a,#126
7039  1ba7 b702          	ld	_displaySetOutLine$L+2,a
7040  1ba9 a616          	ld	a,#22
7041  1bab ae41          	ld	x,#65
7042  1bad cd0000        	call	_displaySetOutLine
7044                     ; 963 		displaySetOutLine(65, 	44,	126, 	64, 	(*a_bySelected == 6));
7046  1bb0 92c602        	ld	a,[_window6Menu$L+2.w]
7047  1bb3 a106          	cp	a,#6
7048  1bb5 2604          	jrne	L023
7049  1bb7 a601          	ld	a,#1
7050  1bb9 2001          	jra	L223
7051  1bbb               L023:
7052  1bbb 4f            	clr	a
7053  1bbc               L223:
7054  1bbc b704          	ld	_displaySetOutLine$L+4,a
7055  1bbe a640          	ld	a,#64
7056  1bc0 b703          	ld	_displaySetOutLine$L+3,a
7057  1bc2 a67e          	ld	a,#126
7058  1bc4 b702          	ld	_displaySetOutLine$L+2,a
7059  1bc6 a62c          	ld	a,#44
7060  1bc8 ae41          	ld	x,#65
7061  1bca cd0000        	call	_displaySetOutLine
7064  1bcd cc1ca2        	jp	L3012
7065  1bd0               L5102:
7066                     ; 968 		if ((*a_bySelected == 1) || parametersGetValue(PARAM_PAGE_SEL) == 1)
7068  1bd0 92c602        	ld	a,[_window6Menu$L+2.w]
7069  1bd3 a101          	cp	a,#1
7070  1bd5 270d          	jreq	L7012
7072  1bd7 a609          	ld	a,#9
7073  1bd9 cd0000        	call	_parametersGetValue
7075  1bdc a101          	cp	a,#1
7076  1bde 2602          	jrne	L423
7077  1be0 a300          	cp	x,#0
7078  1be2               L423:
7079  1be2 260f          	jrne	L5012
7080  1be4               L7012:
7081                     ; 969 			displayInvertArea(1, 	1, 	62, 	19);
7083  1be4 a613          	ld	a,#19
7084  1be6 b703          	ld	_displayInvertArea$L+3,a
7085  1be8 a63e          	ld	a,#62
7086  1bea b702          	ld	_displayInvertArea$L+2,a
7087  1bec a601          	ld	a,#1
7088  1bee ae01          	ld	x,#1
7089  1bf0 cd0000        	call	_displayInvertArea
7091  1bf3               L5012:
7092                     ; 971 		if ((*a_bySelected == 2) || parametersGetValue(PARAM_PAGE_SEL) == 2)
7094  1bf3 92c602        	ld	a,[_window6Menu$L+2.w]
7095  1bf6 a102          	cp	a,#2
7096  1bf8 270d          	jreq	L3112
7098  1bfa a609          	ld	a,#9
7099  1bfc cd0000        	call	_parametersGetValue
7101  1bff a102          	cp	a,#2
7102  1c01 2602          	jrne	L623
7103  1c03 a300          	cp	x,#0
7104  1c05               L623:
7105  1c05 260f          	jrne	L1112
7106  1c07               L3112:
7107                     ; 972 			displayInvertArea(1, 	23, 62, 	41);
7109  1c07 a629          	ld	a,#41
7110  1c09 b703          	ld	_displayInvertArea$L+3,a
7111  1c0b a63e          	ld	a,#62
7112  1c0d b702          	ld	_displayInvertArea$L+2,a
7113  1c0f a617          	ld	a,#23
7114  1c11 ae01          	ld	x,#1
7115  1c13 cd0000        	call	_displayInvertArea
7117  1c16               L1112:
7118                     ; 974 		if ((*a_bySelected == 3) || parametersGetValue(PARAM_PAGE_SEL) == 3)
7120  1c16 92c602        	ld	a,[_window6Menu$L+2.w]
7121  1c19 a103          	cp	a,#3
7122  1c1b 270d          	jreq	L7112
7124  1c1d a609          	ld	a,#9
7125  1c1f cd0000        	call	_parametersGetValue
7127  1c22 a103          	cp	a,#3
7128  1c24 2602          	jrne	L033
7129  1c26 a300          	cp	x,#0
7130  1c28               L033:
7131  1c28 260f          	jrne	L5112
7132  1c2a               L7112:
7133                     ; 975 			displayInvertArea(1, 	45, 62, 	63);
7135  1c2a a63f          	ld	a,#63
7136  1c2c b703          	ld	_displayInvertArea$L+3,a
7137  1c2e a63e          	ld	a,#62
7138  1c30 b702          	ld	_displayInvertArea$L+2,a
7139  1c32 a62d          	ld	a,#45
7140  1c34 ae01          	ld	x,#1
7141  1c36 cd0000        	call	_displayInvertArea
7143  1c39               L5112:
7144                     ; 977 		if ((*a_bySelected == 4) || parametersGetValue(PARAM_PAGE_SEL) == 4)
7146  1c39 92c602        	ld	a,[_window6Menu$L+2.w]
7147  1c3c a104          	cp	a,#4
7148  1c3e 270d          	jreq	L3212
7150  1c40 a609          	ld	a,#9
7151  1c42 cd0000        	call	_parametersGetValue
7153  1c45 a104          	cp	a,#4
7154  1c47 2602          	jrne	L233
7155  1c49 a300          	cp	x,#0
7156  1c4b               L233:
7157  1c4b 260f          	jrne	L1212
7158  1c4d               L3212:
7159                     ; 978 			displayInvertArea(66, 	1, 	125, 	19);
7161  1c4d a613          	ld	a,#19
7162  1c4f b703          	ld	_displayInvertArea$L+3,a
7163  1c51 a67d          	ld	a,#125
7164  1c53 b702          	ld	_displayInvertArea$L+2,a
7165  1c55 a601          	ld	a,#1
7166  1c57 ae42          	ld	x,#66
7167  1c59 cd0000        	call	_displayInvertArea
7169  1c5c               L1212:
7170                     ; 980 		if ((*a_bySelected == 5) || parametersGetValue(PARAM_PAGE_SEL) == 5)
7172  1c5c 92c602        	ld	a,[_window6Menu$L+2.w]
7173  1c5f a105          	cp	a,#5
7174  1c61 270d          	jreq	L7212
7176  1c63 a609          	ld	a,#9
7177  1c65 cd0000        	call	_parametersGetValue
7179  1c68 a105          	cp	a,#5
7180  1c6a 2602          	jrne	L433
7181  1c6c a300          	cp	x,#0
7182  1c6e               L433:
7183  1c6e 260f          	jrne	L5212
7184  1c70               L7212:
7185                     ; 981 			displayInvertArea(66, 	23, 125, 	41);
7187  1c70 a629          	ld	a,#41
7188  1c72 b703          	ld	_displayInvertArea$L+3,a
7189  1c74 a67d          	ld	a,#125
7190  1c76 b702          	ld	_displayInvertArea$L+2,a
7191  1c78 a617          	ld	a,#23
7192  1c7a ae42          	ld	x,#66
7193  1c7c cd0000        	call	_displayInvertArea
7195  1c7f               L5212:
7196                     ; 983 		if ((*a_bySelected == 6) || parametersGetValue(PARAM_PAGE_SEL) == 6)
7198  1c7f 92c602        	ld	a,[_window6Menu$L+2.w]
7199  1c82 a106          	cp	a,#6
7200  1c84 270d          	jreq	L3312
7202  1c86 a609          	ld	a,#9
7203  1c88 cd0000        	call	_parametersGetValue
7205  1c8b a106          	cp	a,#6
7206  1c8d 2602          	jrne	L633
7207  1c8f a300          	cp	x,#0
7208  1c91               L633:
7209  1c91 260f          	jrne	L3012
7210  1c93               L3312:
7211                     ; 984 			displayInvertArea(66, 	45,	125, 	63);
7213  1c93 a63f          	ld	a,#63
7214  1c95 b703          	ld	_displayInvertArea$L+3,a
7215  1c97 a67d          	ld	a,#125
7216  1c99 b702          	ld	_displayInvertArea$L+2,a
7217  1c9b a62d          	ld	a,#45
7218  1c9d ae42          	ld	x,#66
7219  1c9f cd0000        	call	_displayInvertArea
7221  1ca2               L3012:
7222                     ; 987 	parametersSet(PARAM_PAGE_SEL, *a_bySelected);	
7224  1ca2 92c602        	ld	a,[_window6Menu$L+2.w]
7225  1ca5 5f            	clr	x
7226  1ca6 b702          	ld	_parametersSet$L+2,a
7227  1ca8 bf01          	ld	_parametersSet$L+1,x
7228  1caa a609          	ld	a,#9
7229  1cac cd0000        	call	_parametersSet
7231                     ; 988 }
7234  1caf 81            	ret
7355                     ; 991 BYTE windowSetupParameter(BYTE a_byOffset, WORD a_woCurrentValue)
7355                     ; 992 {
7356                     	switch	.text
7358                     	xref.b	_windowSetupParameter$L
7359  1cb0               _windowSetupParameter:
7361  1cb0 b700          	ld	_windowSetupParameter$L,a
7363                     ; 994 	BYTE byParametersJumped = 0x00;
7365  1cb2 3fc7          	clr	_windowSetupParameter$L-57
7366                     ; 995 	BYTE byProgressive		= 0x00;
7368  1cb4 3fff          	clr	_windowSetupParameter$L-1
7369                     ; 998 	BYTE bySelectedIndex	= 0xFF;
7371  1cb6 a6ff          	ld	a,#255
7372  1cb8 b7c8          	ld	_windowSetupParameter$L-56,a
7374  1cba 2006          	jra	L7122
7375  1cbc               L3122:
7376                     ; 1003 		a_byOffset-=PARAMETER_NUMBER-PARAMETER_SETUP_INITIAL_INDEX;
7378  1cbc b600          	ld	a,_windowSetupParameter$L
7379  1cbe a028          	sub	a,#40
7380  1cc0 b700          	ld	_windowSetupParameter$L,a
7381  1cc2               L7122:
7382                     ; 1001 	while(a_byOffset > PARAMETER_NUMBER-PARAMETER_SETUP_INITIAL_INDEX)
7384  1cc2 b600          	ld	a,_windowSetupParameter$L
7385  1cc4 a129          	cp	a,#41
7386  1cc6 24f4          	jruge	L3122
7387                     ; 1007 	if (!_btst(m_woDisplayedWindow, WIN_SETUP)) //Not displayed
7389  1cc8 c60005        	ld	a,_m_woDisplayedWindow
7390  1ccb a504          	bcp	a,#4
7391  1ccd 2703          	jreq	L464
7392  1ccf cc1d68        	jp	L3222
7393  1cd2               L464:
7394                     ; 1009 		displayClearArea(0, 0, 126, 64);
7396  1cd2 a640          	ld	a,#64
7397  1cd4 b703          	ld	_displayClearArea$L+3,a
7398  1cd6 a67e          	ld	a,#126
7399  1cd8 b702          	ld	_displayClearArea$L+2,a
7400  1cda 4f            	clr	a
7401  1cdb 5f            	clr	x
7402  1cdc cd0000        	call	_displayClearArea
7404                     ; 1010 		displaySetOutLine(0, 0, 126, 64, false);
7406  1cdf 3f04          	clr	_displaySetOutLine$L+4
7407  1ce1 a640          	ld	a,#64
7408  1ce3 b703          	ld	_displaySetOutLine$L+3,a
7409  1ce5 a67e          	ld	a,#126
7410  1ce7 b702          	ld	_displaySetOutLine$L+2,a
7411  1ce9 4f            	clr	a
7412  1cea 5f            	clr	x
7413  1ceb cd0000        	call	_displaySetOutLine
7415                     ; 1013 		if (parametersGetValue(PARAM_VISUAL_SETUP_FULL))
7417  1cee a614          	ld	a,#20
7418  1cf0 cd0000        	call	_parametersGetValue
7420  1cf3 4d            	tnz	a
7421  1cf4 2601          	jrne	L224
7422  1cf6 5d            	tnz	x
7423  1cf7               L224:
7424  1cf7 2716          	jreq	L5222
7425                     ; 1015 			displayWriteString(labelGet(LABEL_FULL_SETUP), DISPLAY_SELECT_FONT_MINI, 2, 6);
7427  1cf9 a606          	ld	a,#6
7428  1cfb b704          	ld	_displayWriteString$L+4,a
7429  1cfd a602          	ld	a,#2
7430  1cff b703          	ld	_displayWriteString$L+3,a
7431  1d01 a61c          	ld	a,#28
7432  1d03 b702          	ld	_displayWriteString$L+2,a
7433  1d05 a63c          	ld	a,#60
7434  1d07 cd0000        	call	_labelGet
7436  1d0a cd0000        	call	_displayWriteString
7439  1d0d 2014          	jra	L7222
7440  1d0f               L5222:
7441                     ; 1019 			displayWriteString(labelGet(LABEL_SIMPLE_SETUP), DISPLAY_SELECT_FONT_MINI, 2, 6);
7443  1d0f a606          	ld	a,#6
7444  1d11 b704          	ld	_displayWriteString$L+4,a
7445  1d13 a602          	ld	a,#2
7446  1d15 b703          	ld	_displayWriteString$L+3,a
7447  1d17 a61c          	ld	a,#28
7448  1d19 b702          	ld	_displayWriteString$L+2,a
7449  1d1b a63b          	ld	a,#59
7450  1d1d cd0000        	call	_labelGet
7452  1d20 cd0000        	call	_displayWriteString
7454  1d23               L7222:
7455                     ; 1021 		displayInvertArea(1, 1, 124, 6);
7457  1d23 a606          	ld	a,#6
7458  1d25 b703          	ld	_displayInvertArea$L+3,a
7459  1d27 a67c          	ld	a,#124
7460  1d29 b702          	ld	_displayInvertArea$L+2,a
7461  1d2b a601          	ld	a,#1
7462  1d2d ae01          	ld	x,#1
7463  1d2f cd0000        	call	_displayInvertArea
7465                     ; 1025 		if (parametersGetValue(PARAM_VISUAL_SETUP_FULL))
7467  1d32 a614          	ld	a,#20
7468  1d34 cd0000        	call	_parametersGetValue
7470  1d37 4d            	tnz	a
7471  1d38 2601          	jrne	L424
7472  1d3a 5d            	tnz	x
7473  1d3b               L424:
7474  1d3b 2707          	jreq	L1322
7475                     ; 1027 			m_byVisibleMenu = PARAMETER_NUMBER-PARAMETER_SETUP_INITIAL_INDEX;
7477  1d3d a628          	ld	a,#40
7478  1d3f c70004        	ld	_m_byVisibleMenu,a
7480  1d42 2024          	jra	L3222
7481  1d44               L1322:
7482                     ; 1031 			m_byVisibleMenu = 0x01;
7484  1d44 a601          	ld	a,#1
7485  1d46 c70004        	ld	_m_byVisibleMenu,a
7486                     ; 1033 			i=PARAMETER_NUMBER-PARAMETER_SETUP_INITIAL_INDEX;
7488  1d49 a628          	ld	a,#40
7489  1d4b b7cb          	ld	_windowSetupParameter$L-53,a
7491  1d4d 2012          	jra	L1422
7492  1d4f               L5322:
7493                     ; 1036 				if(parametersVisible(i + PARAMETER_SETUP_INITIAL_INDEX))
7495  1d4f b6cb          	ld	a,_windowSetupParameter$L-53
7496  1d51 ab1c          	add	a,#28
7497  1d53 cd0000        	call	_parametersVisible
7499  1d56 4d            	tnz	a
7500  1d57 2708          	jreq	L1422
7501                     ; 1038 					m_byVisibleMenu++;
7503  1d59 c60004        	ld	a,_m_byVisibleMenu
7504  1d5c ab01          	add	a,#1
7505  1d5e c70004        	ld	_m_byVisibleMenu,a
7506  1d61               L1422:
7507                     ; 1034 			while(i-->0)
7509  1d61 b6cb          	ld	a,_windowSetupParameter$L-53
7510  1d63 3acb          	dec	_windowSetupParameter$L-53
7511  1d65 4d            	tnz	a
7512  1d66 26e7          	jrne	L5322
7513  1d68               L3222:
7514                     ; 1045 	a_byOffset = MAX(0, a_byOffset);
7516  1d68 b600          	ld	a,_windowSetupParameter$L
7517  1d6a b700          	ld	_windowSetupParameter$L,a
7518                     ; 1046 	for(i=0; i<7+byParametersJumped; i++)
7520  1d6c 3fcb          	clr	_windowSetupParameter$L-53
7522  1d6e cc1f34        	jp	L3522
7523  1d71               L7422:
7524                     ; 1048 		byParameterIndex = a_byOffset + i;
7526  1d71 b600          	ld	a,_windowSetupParameter$L
7527  1d73 bbcb          	add	a,_windowSetupParameter$L-53
7528  1d75 b7fe          	ld	_windowSetupParameter$L-2,a
7530  1d77 2007          	jra	L3622
7531  1d79               L7522:
7532                     ; 1051 			byProgressive -= m_byVisibleMenu;
7534  1d79 b6ff          	ld	a,_windowSetupParameter$L-1
7535  1d7b c00004        	sub	a,_m_byVisibleMenu
7536  1d7e b7ff          	ld	_windowSetupParameter$L-1,a
7537  1d80               L3622:
7538                     ; 1049 		while(byProgressive>=m_byVisibleMenu)
7540  1d80 b6ff          	ld	a,_windowSetupParameter$L-1
7541  1d82 c10004        	cp	a,_m_byVisibleMenu
7542  1d85 24f2          	jruge	L7522
7544  1d87 2006          	jra	L1722
7545  1d89               L7622:
7546                     ; 1055 			byParameterIndex -= (PARAMETER_NUMBER-PARAMETER_SETUP_INITIAL_INDEX);
7548  1d89 b6fe          	ld	a,_windowSetupParameter$L-2
7549  1d8b a028          	sub	a,#40
7550  1d8d b7fe          	ld	_windowSetupParameter$L-2,a
7551  1d8f               L1722:
7552                     ; 1053 		while(byParameterIndex>= (PARAMETER_NUMBER-PARAMETER_SETUP_INITIAL_INDEX))
7554  1d8f b6fe          	ld	a,_windowSetupParameter$L-2
7555  1d91 a128          	cp	a,#40
7556  1d93 24f4          	jruge	L7622
7557                     ; 1059 		if(	parametersVisible(byParameterIndex + PARAMETER_SETUP_INITIAL_INDEX) || 
7557                     ; 1060 			parametersGetValue(PARAM_VISUAL_SETUP_FULL) ) //Not displayed
7559  1d95 b6fe          	ld	a,_windowSetupParameter$L-2
7560  1d97 ab1c          	add	a,#28
7561  1d99 cd0000        	call	_parametersVisible
7563  1d9c 4d            	tnz	a
7564  1d9d 260e          	jrne	L7722
7566  1d9f a614          	ld	a,#20
7567  1da1 cd0000        	call	_parametersGetValue
7569  1da4 4d            	tnz	a
7570  1da5 2601          	jrne	L624
7571  1da7 5d            	tnz	x
7572  1da8               L624:
7573  1da8 2603          	jrne	L664
7574  1daa cc1f30        	jp	L5722
7575  1dad               L664:
7576  1dad               L7722:
7577                     ; 1062 			if(bySelectedIndex == 0xFF)
7579  1dad b6c8          	ld	a,_windowSetupParameter$L-56
7580  1daf a1ff          	cp	a,#255
7581  1db1 2635          	jrne	L1032
7582                     ; 1064 				bySelectedIndex = byParameterIndex + PARAMETER_SETUP_INITIAL_INDEX;
7584  1db3 b6fe          	ld	a,_windowSetupParameter$L-2
7585  1db5 ab1c          	add	a,#28
7586  1db7 b7c8          	ld	_windowSetupParameter$L-56,a
7587                     ; 1065 				parametersSet(PARAM_PAGE_SEL, byParameterIndex);
7589  1db9 b6fe          	ld	a,_windowSetupParameter$L-2
7590  1dbb 5f            	clr	x
7591  1dbc b702          	ld	_parametersSet$L+2,a
7592  1dbe bf01          	ld	_parametersSet$L+1,x
7593  1dc0 a609          	ld	a,#9
7594  1dc2 cd0000        	call	_parametersSet
7596                     ; 1067 				if (a_woCurrentValue == 0xFFFF)
7598  1dc5 b602          	ld	a,_windowSetupParameter$L+2
7599  1dc7 a1ff          	cp	a,#255
7600  1dc9 2604          	jrne	L034
7601  1dcb be01          	ld	x,_windowSetupParameter$L+1
7602  1dcd a3ff          	cp	x,#255
7603  1dcf               L034:
7604  1dcf 260d          	jrne	L3032
7605                     ; 1069 					woCurrentValue = parametersGetValue(byParameterIndex + PARAMETER_SETUP_INITIAL_INDEX);
7607  1dd1 b6fe          	ld	a,_windowSetupParameter$L-2
7608  1dd3 ab1c          	add	a,#28
7609  1dd5 cd0000        	call	_parametersGetValue
7611  1dd8 b7ca          	ld	_windowSetupParameter$L-54,a
7612  1dda bfc9          	ld	_windowSetupParameter$L-55,x
7614  1ddc 2015          	jra	L7032
7615  1dde               L3032:
7616                     ; 1073 					woCurrentValue = a_woCurrentValue;
7618  1dde be01          	ld	x,_windowSetupParameter$L+1
7619  1de0 bfc9          	ld	_windowSetupParameter$L-55,x
7620  1de2 b602          	ld	a,_windowSetupParameter$L+2
7621  1de4 b7ca          	ld	_windowSetupParameter$L-54,a
7622  1de6 200b          	jra	L7032
7623  1de8               L1032:
7624                     ; 1078 				woCurrentValue = parametersGetValue(byParameterIndex + PARAMETER_SETUP_INITIAL_INDEX);
7626  1de8 b6fe          	ld	a,_windowSetupParameter$L-2
7627  1dea ab1c          	add	a,#28
7628  1dec cd0000        	call	_parametersGetValue
7630  1def b7ca          	ld	_windowSetupParameter$L-54,a
7631  1df1 bfc9          	ld	_windowSetupParameter$L-55,x
7632  1df3               L7032:
7633                     ; 1081 			if ( parametersIsChanged(PARAM_PAGE_SEL) ||
7633                     ; 1082 				(parametersGetValue(PARAM_PAGE) != PAGE_SETUP) ||
7633                     ; 1083 				!_btst(m_woDisplayedWindow, WIN_SETUP))
7635  1df3 a609          	ld	a,#9
7636  1df5 cd0000        	call	_parametersIsChanged
7638  1df8 4d            	tnz	a
7639  1df9 2617          	jrne	L3132
7641  1dfb a608          	ld	a,#8
7642  1dfd cd0000        	call	_parametersGetValue
7644  1e00 a119          	cp	a,#25
7645  1e02 2602          	jrne	L234
7646  1e04 a300          	cp	x,#0
7647  1e06               L234:
7648  1e06 260a          	jrne	L3132
7650  1e08 c60005        	ld	a,_m_woDisplayedWindow
7651  1e0b a504          	bcp	a,#4
7652  1e0d 2703          	jreq	L074
7653  1e0f cc1ece        	jp	L1132
7654  1e12               L074:
7655  1e12               L3132:
7656                     ; 1085 				displayClearArea(1,8+(byProgressive * 8), 10, MIN(15 + (byProgressive * 8), 62));
7658  1e12 b6ff          	ld	a,_windowSetupParameter$L-1
7659  1e14 ae08          	ld	x,#8
7660  1e16 42            	mul	x,a
7661  1e17 ab0f          	add	a,#15
7662  1e19 2401          	jrnc	L634
7663  1e1b 5c            	inc	x
7664  1e1c               L634:
7665  1e1c a03f          	sub	a,#63
7666  1e1e 9f            	ld	a,x
7667  1e1f a200          	sbc	a,#0
7668  1e21 2b04          	jrmi	L434
7669  1e23 a63e          	ld	a,#62
7670  1e25 2007          	jra	L044
7671  1e27               L434:
7672  1e27 b6ff          	ld	a,_windowSetupParameter$L-1
7673  1e29 48            	sll	a
7674  1e2a 48            	sll	a
7675  1e2b 48            	sll	a
7676  1e2c ab0f          	add	a,#15
7677  1e2e               L044:
7678  1e2e b703          	ld	_displayClearArea$L+3,a
7679  1e30 a60a          	ld	a,#10
7680  1e32 b702          	ld	_displayClearArea$L+2,a
7681  1e34 b6ff          	ld	a,_windowSetupParameter$L-1
7682  1e36 48            	sll	a
7683  1e37 48            	sll	a
7684  1e38 48            	sll	a
7685  1e39 ab08          	add	a,#8
7686  1e3b ae01          	ld	x,#1
7687  1e3d cd0000        	call	_displayClearArea
7689                     ; 1086 				formatNumber(byParameterIndex+1, 2, 0, strMessage);
7691  1e40 aecc          	ld	x,#high(_windowSetupParameter$L-52)
7692  1e42 bf04          	ld	_formatNumber$L+4,x
7693  1e44 a6cc          	ld	a,#low(_windowSetupParameter$L-52)
7694  1e46 b705          	ld	_formatNumber$L+5,a
7695  1e48 3f03          	clr	_formatNumber$L+3
7696  1e4a a602          	ld	a,#2
7697  1e4c b702          	ld	_formatNumber$L+2,a
7698  1e4e 5f            	clr	x
7699  1e4f a601          	ld	a,#1
7700  1e51 bbfe          	add	a,_windowSetupParameter$L-2
7701  1e53 2401          	jrnc	L244
7702  1e55 5c            	inc	x
7703  1e56               L244:
7704  1e56 cd0000        	call	_formatNumber
7706                     ; 1087 				strMessage[2] = 0x00;
7708  1e59 3fce          	clr	_windowSetupParameter$L-50
7709                     ; 1088 				displayWriteString(strMessage, 				DISPLAY_SELECT_FONT_MINI, 	2, 14 + (byProgressive * 8));
7711  1e5b b6ff          	ld	a,_windowSetupParameter$L-1
7712  1e5d 48            	sll	a
7713  1e5e 48            	sll	a
7714  1e5f 48            	sll	a
7715  1e60 ab0e          	add	a,#14
7716  1e62 b704          	ld	_displayWriteString$L+4,a
7717  1e64 a602          	ld	a,#2
7718  1e66 b703          	ld	_displayWriteString$L+3,a
7719  1e68 a61c          	ld	a,#28
7720  1e6a b702          	ld	_displayWriteString$L+2,a
7721  1e6c a6cc          	ld	a,#_windowSetupParameter$L-52
7722  1e6e 5f            	clr	x
7723  1e6f cd0000        	call	_displayWriteString
7725                     ; 1090 				displayClearArea(11,8+(byProgressive * 8), 104, MIN(15 + (byProgressive * 8), 62));
7727  1e72 b6ff          	ld	a,_windowSetupParameter$L-1
7728  1e74 ae08          	ld	x,#8
7729  1e76 42            	mul	x,a
7730  1e77 ab0f          	add	a,#15
7731  1e79 2401          	jrnc	L644
7732  1e7b 5c            	inc	x
7733  1e7c               L644:
7734  1e7c a03f          	sub	a,#63
7735  1e7e 9f            	ld	a,x
7736  1e7f a200          	sbc	a,#0
7737  1e81 2b04          	jrmi	L444
7738  1e83 a63e          	ld	a,#62
7739  1e85 2007          	jra	L054
7740  1e87               L444:
7741  1e87 b6ff          	ld	a,_windowSetupParameter$L-1
7742  1e89 48            	sll	a
7743  1e8a 48            	sll	a
7744  1e8b 48            	sll	a
7745  1e8c ab0f          	add	a,#15
7746  1e8e               L054:
7747  1e8e b703          	ld	_displayClearArea$L+3,a
7748  1e90 a668          	ld	a,#104
7749  1e92 b702          	ld	_displayClearArea$L+2,a
7750  1e94 b6ff          	ld	a,_windowSetupParameter$L-1
7751  1e96 48            	sll	a
7752  1e97 48            	sll	a
7753  1e98 48            	sll	a
7754  1e99 ab08          	add	a,#8
7755  1e9b ae0b          	ld	x,#11
7756  1e9d cd0000        	call	_displayClearArea
7758                     ; 1091 				memcpy(strMessage,  parametersGetLabel(byParameterIndex + PARAMETER_SETUP_INITIAL_INDEX),22);
7760  1ea0 a616          	ld	a,#22
7761  1ea2 b704          	ld	_memcpy$L+4,a
7762  1ea4 b6fe          	ld	a,_windowSetupParameter$L-2
7763  1ea6 ab1c          	add	a,#28
7764  1ea8 cd0000        	call	_parametersGetLabel
7766  1eab b703          	ld	_memcpy$L+3,a
7767  1ead bf02          	ld	_memcpy$L+2,x
7768  1eaf a6cc          	ld	a,#_windowSetupParameter$L-52
7769  1eb1 5f            	clr	x
7770  1eb2 cd0000        	call	_memcpy
7772                     ; 1092 				strMessage[22] = 0x00;
7774  1eb5 3fe2          	clr	_windowSetupParameter$L-30
7775                     ; 1093 				displayWriteString(strMessage, 				DISPLAY_SELECT_FONT_MINI, 	11, 14 + (byProgressive * 8));
7777  1eb7 b6ff          	ld	a,_windowSetupParameter$L-1
7778  1eb9 48            	sll	a
7779  1eba 48            	sll	a
7780  1ebb 48            	sll	a
7781  1ebc ab0e          	add	a,#14
7782  1ebe b704          	ld	_displayWriteString$L+4,a
7783  1ec0 a60b          	ld	a,#11
7784  1ec2 b703          	ld	_displayWriteString$L+3,a
7785  1ec4 a61c          	ld	a,#28
7786  1ec6 b702          	ld	_displayWriteString$L+2,a
7787  1ec8 a6cc          	ld	a,#_windowSetupParameter$L-52
7788  1eca 5f            	clr	x
7789  1ecb cd0000        	call	_displayWriteString
7791  1ece               L1132:
7792                     ; 1096 			displayClearArea(105,8+(byProgressive * 8), 124, MIN(15 + (byProgressive * 8), 62));
7794  1ece b6ff          	ld	a,_windowSetupParameter$L-1
7795  1ed0 ae08          	ld	x,#8
7796  1ed2 42            	mul	x,a
7797  1ed3 ab0f          	add	a,#15
7798  1ed5 2401          	jrnc	L454
7799  1ed7 5c            	inc	x
7800  1ed8               L454:
7801  1ed8 a03f          	sub	a,#63
7802  1eda 9f            	ld	a,x
7803  1edb a200          	sbc	a,#0
7804  1edd 2b04          	jrmi	L254
7805  1edf a63e          	ld	a,#62
7806  1ee1 2007          	jra	L654
7807  1ee3               L254:
7808  1ee3 b6ff          	ld	a,_windowSetupParameter$L-1
7809  1ee5 48            	sll	a
7810  1ee6 48            	sll	a
7811  1ee7 48            	sll	a
7812  1ee8 ab0f          	add	a,#15
7813  1eea               L654:
7814  1eea b703          	ld	_displayClearArea$L+3,a
7815  1eec a67c          	ld	a,#124
7816  1eee b702          	ld	_displayClearArea$L+2,a
7817  1ef0 b6ff          	ld	a,_windowSetupParameter$L-1
7818  1ef2 48            	sll	a
7819  1ef3 48            	sll	a
7820  1ef4 48            	sll	a
7821  1ef5 ab08          	add	a,#8
7822  1ef7 ae69          	ld	x,#105
7823  1ef9 cd0000        	call	_displayClearArea
7825                     ; 1097 			formatNumber(woCurrentValue , 5, 0, strMessage);
7827  1efc aecc          	ld	x,#high(_windowSetupParameter$L-52)
7828  1efe bf04          	ld	_formatNumber$L+4,x
7829  1f00 a6cc          	ld	a,#low(_windowSetupParameter$L-52)
7830  1f02 b705          	ld	_formatNumber$L+5,a
7831  1f04 3f03          	clr	_formatNumber$L+3
7832  1f06 a605          	ld	a,#5
7833  1f08 b702          	ld	_formatNumber$L+2,a
7834  1f0a b6ca          	ld	a,_windowSetupParameter$L-54
7835  1f0c bec9          	ld	x,_windowSetupParameter$L-55
7836  1f0e cd0000        	call	_formatNumber
7838                     ; 1098 			strMessage[5] = 0x00;
7840  1f11 3fd1          	clr	_windowSetupParameter$L-47
7841                     ; 1099 			displayWriteString(strMessage, 				DISPLAY_SELECT_FONT_MINI, 105, 14 + (byProgressive * 8));
7843  1f13 b6ff          	ld	a,_windowSetupParameter$L-1
7844  1f15 48            	sll	a
7845  1f16 48            	sll	a
7846  1f17 48            	sll	a
7847  1f18 ab0e          	add	a,#14
7848  1f1a b704          	ld	_displayWriteString$L+4,a
7849  1f1c a669          	ld	a,#105
7850  1f1e b703          	ld	_displayWriteString$L+3,a
7851  1f20 a61c          	ld	a,#28
7852  1f22 b702          	ld	_displayWriteString$L+2,a
7853  1f24 a6cc          	ld	a,#_windowSetupParameter$L-52
7854  1f26 5f            	clr	x
7855  1f27 cd0000        	call	_displayWriteString
7857                     ; 1101 			byProgressive++;
7859  1f2a 3cff          	inc	_windowSetupParameter$L-1
7861  1f2c               L7132:
7862                     ; 1046 	for(i=0; i<7+byParametersJumped; i++)
7864  1f2c 3ccb          	inc	_windowSetupParameter$L-53
7865  1f2e 2004          	jra	L3522
7866  1f30               L5722:
7867                     ; 1105 			byParametersJumped++;
7869  1f30 3cc7          	inc	_windowSetupParameter$L-57
7870  1f32 20f8          	jra	L7132
7871  1f34               L3522:
7872                     ; 1046 	for(i=0; i<7+byParametersJumped; i++)
7874  1f34 5f            	clr	x
7875  1f35 a607          	ld	a,#7
7876  1f37 bbc7          	add	a,_windowSetupParameter$L-57
7877  1f39 2401          	jrnc	L064
7878  1f3b 5c            	inc	x
7879  1f3c               L064:
7880  1f3c 90becb        	ld	y,_windowSetupParameter$L-53
7881  1f3f 3f00          	clr	c_y
7882  1f41 90bf01        	ld	c_y+1,y
7883  1f44 99            	scf
7884  1f45 b201          	sbc	a,c_y+1
7885  1f47 9f            	ld	a,x
7886  1f48 b200          	sbc	a,c_y
7887  1f4a 2b03          	jrmi	L274
7888  1f4c cc1d71        	jp	L7422
7889  1f4f               L274:
7890                     ; 1110 	if ( parametersIsChanged(PARAM_PAGE_SEL) ||
7890                     ; 1111 		(parametersGetValue(PARAM_PAGE) != PAGE_SETUP) ||
7890                     ; 1112 		!_btst(m_woDisplayedWindow, WIN_SETUP))
7892  1f4f a609          	ld	a,#9
7893  1f51 cd0000        	call	_parametersIsChanged
7895  1f54 4d            	tnz	a
7896  1f55 2617          	jrne	L3232
7898  1f57 a608          	ld	a,#8
7899  1f59 cd0000        	call	_parametersGetValue
7901  1f5c a119          	cp	a,#25
7902  1f5e 2602          	jrne	L264
7903  1f60 a300          	cp	x,#0
7904  1f62               L264:
7905  1f62 260a          	jrne	L3232
7907  1f64 c60005        	ld	a,_m_woDisplayedWindow
7908  1f67 a504          	bcp	a,#4
7909  1f69 2703          	jreq	L474
7910  1f6b cc2038        	jp	L1232
7911  1f6e               L474:
7912  1f6e               L3232:
7913                     ; 1114 		displayInvertArea(1,8, 124, 14 );
7915  1f6e a60e          	ld	a,#14
7916  1f70 b703          	ld	_displayInvertArea$L+3,a
7917  1f72 a67c          	ld	a,#124
7918  1f74 b702          	ld	_displayInvertArea$L+2,a
7919  1f76 a608          	ld	a,#8
7920  1f78 ae01          	ld	x,#1
7921  1f7a cd0000        	call	_displayInvertArea
7924  1f7d               L7232:
7925                     ; 1121 	_bres(m_woDisplayedWindow, WIN_SPEED);
7927  1f7d c60006        	ld	a,_m_woDisplayedWindow+1
7928  1f80 a4fd          	and	a,#253
7929  1f82 c70006        	ld	_m_woDisplayedWindow+1,a
7930                     ; 1122 	_bres(m_woDisplayedWindow, WIN_CYLINDER_SIZE);
7932  1f85 c60006        	ld	a,_m_woDisplayedWindow+1
7933  1f88 a4ff          	and	a,#255
7934  1f8a c70006        	ld	_m_woDisplayedWindow+1,a
7935  1f8d c60005        	ld	a,_m_woDisplayedWindow
7936  1f90 a47f          	and	a,#127
7937  1f92 c70005        	ld	_m_woDisplayedWindow,a
7938                     ; 1123 	_bres(m_woDisplayedWindow, WIN_DAC_BASE);
7940  1f95 c60006        	ld	a,_m_woDisplayedWindow+1
7941  1f98 a4ff          	and	a,#255
7942  1f9a c70006        	ld	_m_woDisplayedWindow+1,a
7943  1f9d c60005        	ld	a,_m_woDisplayedWindow
7944  1fa0 a4bf          	and	a,#191
7945  1fa2 c70005        	ld	_m_woDisplayedWindow,a
7946                     ; 1124 	_bres(m_woDisplayedWindow, WIN_MODE);
7948  1fa5 c60006        	ld	a,_m_woDisplayedWindow+1
7949  1fa8 a4fe          	and	a,#254
7950  1faa c70006        	ld	_m_woDisplayedWindow+1,a
7951                     ; 1125 	_bres(m_woDisplayedWindow, WIN_OSCILLOSCOPE);
7953  1fad c60006        	ld	a,_m_woDisplayedWindow+1
7954  1fb0 a4fb          	and	a,#251
7955  1fb2 c70006        	ld	_m_woDisplayedWindow+1,a
7956                     ; 1126 	_bres(m_woDisplayedWindow, WIN_REGISTER);
7958  1fb5 c60006        	ld	a,_m_woDisplayedWindow+1
7959  1fb8 a4f7          	and	a,#247
7960  1fba c70006        	ld	_m_woDisplayedWindow+1,a
7961                     ; 1127 	_bres(m_woDisplayedWindow, WIN_ALARM);
7963  1fbd c60006        	ld	a,_m_woDisplayedWindow+1
7964  1fc0 a4ef          	and	a,#239
7965  1fc2 c70006        	ld	_m_woDisplayedWindow+1,a
7966                     ; 1128 	_bres(m_woDisplayedWindow, WIN_MESSAGE);
7968  1fc5 c60006        	ld	a,_m_woDisplayedWindow+1
7969  1fc8 a4df          	and	a,#223
7970  1fca c70006        	ld	_m_woDisplayedWindow+1,a
7971                     ; 1129 	_bres(m_woDisplayedWindow, WIN_FUNCTIONS);
7973  1fcd c60006        	ld	a,_m_woDisplayedWindow+1
7974  1fd0 a4bf          	and	a,#191
7975  1fd2 c70006        	ld	_m_woDisplayedWindow+1,a
7976                     ; 1130 	_bres(m_woDisplayedWindow, WIN_PARAMETERS);
7978  1fd5 c60006        	ld	a,_m_woDisplayedWindow+1
7979  1fd8 a47f          	and	a,#127
7980  1fda c70006        	ld	_m_woDisplayedWindow+1,a
7981                     ; 1131 	_bres(m_woDisplayedWindow, WIN_TESTS);
7983  1fdd c60006        	ld	a,_m_woDisplayedWindow+1
7984  1fe0 a4ff          	and	a,#255
7985  1fe2 c70006        	ld	_m_woDisplayedWindow+1,a
7986  1fe5 c60005        	ld	a,_m_woDisplayedWindow
7987  1fe8 a4fe          	and	a,#254
7988  1fea c70005        	ld	_m_woDisplayedWindow,a
7989                     ; 1132 	_bset(m_woDisplayedWindow, WIN_SETUP);
7991  1fed c60005        	ld	a,_m_woDisplayedWindow
7992  1ff0 aa04          	or	a,#4
7993  1ff2 c70005        	ld	_m_woDisplayedWindow,a
7994                     ; 1133 	_bres(m_woDisplayedWindow, WIN_MENUS);	
7996  1ff5 c60006        	ld	a,_m_woDisplayedWindow+1
7997  1ff8 a4ff          	and	a,#255
7998  1ffa c70006        	ld	_m_woDisplayedWindow+1,a
7999  1ffd c60005        	ld	a,_m_woDisplayedWindow
8000  2000 a4fd          	and	a,#253
8001  2002 c70005        	ld	_m_woDisplayedWindow,a
8002                     ; 1134 	_bres(m_woDisplayedWindow, WIN_ARCHIVES);
8004  2005 c60006        	ld	a,_m_woDisplayedWindow+1
8005  2008 a4ff          	and	a,#255
8006  200a c70006        	ld	_m_woDisplayedWindow+1,a
8007  200d c60005        	ld	a,_m_woDisplayedWindow
8008  2010 a4f7          	and	a,#247
8009  2012 c70005        	ld	_m_woDisplayedWindow,a
8010                     ; 1135 	_bres(m_woDisplayedWindow, WIN_APPLICATION);
8012  2015 c60006        	ld	a,_m_woDisplayedWindow+1
8013  2018 a4ff          	and	a,#255
8014  201a c70006        	ld	_m_woDisplayedWindow+1,a
8015  201d c60005        	ld	a,_m_woDisplayedWindow
8016  2020 a4ef          	and	a,#239
8017  2022 c70005        	ld	_m_woDisplayedWindow,a
8018                     ; 1136 	_bres(m_woDisplayedWindow, WIN_ENCODER);
8020  2025 c60006        	ld	a,_m_woDisplayedWindow+1
8021  2028 a4ff          	and	a,#255
8022  202a c70006        	ld	_m_woDisplayedWindow+1,a
8023  202d c60005        	ld	a,_m_woDisplayedWindow
8024  2030 a4df          	and	a,#223
8025  2032 c70005        	ld	_m_woDisplayedWindow,a
8026                     ; 1139 	return bySelectedIndex;
8028  2035 b6c8          	ld	a,_windowSetupParameter$L-56
8031  2037 81            	ret
8032  2038               L1232:
8033                     ; 1118 		displayInvertArea(105,8, 124, 14 );
8035  2038 a60e          	ld	a,#14
8036  203a b703          	ld	_displayInvertArea$L+3,a
8037  203c a67c          	ld	a,#124
8038  203e b702          	ld	_displayInvertArea$L+2,a
8039  2040 a608          	ld	a,#8
8040  2042 ae69          	ld	x,#105
8041  2044 cd0000        	call	_displayInvertArea
8043  2047 cc1f7d        	jp	L7232
8104                     	xdef	_windowIsInGate
8105                     	xdef	_windowOscilloscopeGetValue
8106                     	xdef	_windowOffsetToHaveCenteredGate
8107                     	xdef	_windowRegisterPrepareFormateValue
8108                     	switch	.bss
8109  0000               _dblParamErrorZoom:
8110  0000 00000000      	ds.b	4
8111                     	xdef	_dblParamErrorZoom
8112  0004               _m_byVisibleMenu:
8113  0004 00            	ds.b	1
8114                     	xdef	_m_byVisibleMenu
8115  0005               _m_woDisplayedWindow:
8116  0005 0000          	ds.b	2
8117                     	xdef	_m_woDisplayedWindow
8118  0007               _m_byCurrentSelectorX:
8119  0007 00            	ds.b	1
8120                     	xdef	_m_byCurrentSelectorX
8121  0008               _m_woRegisterValue:
8122  0008 0000          	ds.b	2
8123                     	xdef	_m_woRegisterValue
8124                     	xref	_m_woEncoderGateEnd
8125                     	xref	_m_woEncoderGateStart
8126                     	xref	_m_arbyScanningHeadSignal
8127                     	xref	_m_arbyDisplayCommand
8128                     	xdef	_window6Menu
8129                     	xdef	_windowSetupParameter
8130                     	xdef	_windowForceRepaintAlarm
8131                     	xdef	_windowForceRepaint
8132                     	xdef	_windowRegister
8133                     	xdef	_windowOscilloscope
8134                     	xdef	_windowAlarm
8135                     	xdef	_windowBigMessage
8136                     	xdef	_windowCylinderSizeValue
8137                     	xdef	_windowDacValue
8138                     	xdef	_windowSpeed
8139                     	xdef	_windowMode
8140                     	xdef	_windowInit
8141                     	xref	_formatNumber
8142                     	xref	_memcpy
8143                     	xref	_sleepFix
8144                     	xref	_displayDrawBox
8145                     	xref	_displayDrawAlarm
8146                     	xref	_displayDrawCorrection
8147                     	xref	_displayDrawSelector
8148                     	xref	_displayDrawHorizontalLine
8149                     	xref	_displayDrawVerticalLine
8150                     	xref	_displayInvertArea
8151                     	xref	_displaySetOutLine
8152                     	xref	_displayClearArea
8153                     	xref	_displayWriteString
8154                     	xref	_displayCmdToDisplay
8155                     	xref	_displayIsKeyPressed
8156                     	xref	_labelGet
8157                     	xref	_parametersVisible
8158                     	xref	_parametersGetLabel
8159                     	xref	_parametersIsChanged
8160                     	xref	_parametersChangedFlagReset
8161                     	xref	_parametersSet
8162                     	xref	_parametersGetValue
8163                     	switch	.const
8164  0001               L7402:
8165  0001 3600          	dc.b	"6",0
8166  0003               L5402:
8167  0003 3500          	dc.b	"5",0
8168  0005               L3402:
8169  0005 3400          	dc.b	"4",0
8170  0007               L1402:
8171  0007 3300          	dc.b	"3",0
8172  0009               L7302:
8173  0009 3200          	dc.b	"2",0
8174  000b               L5302:
8175  000b 3100          	dc.b	"1",0
8176  000d               L7761:
8177  000d 40a00000      	dc.w	16544,0
8178  0011               L7661:
8179  0011 42640000      	dc.w	16996,0
8180  0015               L7561:
8181  0015 3f800000      	dc.w	16256,0
8182  0019               L1561:
8183  0019 2b00          	dc.b	"+",0
8184  001b               L7461:
8185  001b 2d00          	dc.b	"-",0
8186  001d               L1461:
8187  001d 42c80000      	dc.w	17096,0
8188  0021               L1361:
8189  0021 47000000      	dc.w	18176,0
8190  0025               L1011:
8191  0025 00            	dc.b	0
8192                     	xref.b	c_x
8193                     	xref.b	c_y
8213                     	xref	c_ftoi
8214                     	xref	c_xfmul
8215                     	xref	c_xfadd
8216                     	xref	c_fcmp
8217                     	xref	c_fneg
8218                     	xref	c_xltor
8219                     	xref	c_xfcmp
8220                     	xref	c_ltor
8221                     	xref	c_rtol
8222                     	xref	c_xfdiv
8223                     	xref	c_xfsub
8224                     	xref	c_uitof
8225                     	xref	c_rtoxl
8226                     	xref	c_itof
8227                     	xref	c_imul
8228                     	xref.b	_displayDrawCorrection$L
8229                     	xref.b	_displayDrawSelector$L
8230                     	xref.b	_displayDrawVerticalLine$L
8231                     	xref.b	_displayDrawHorizontalLine$L
8232                     	xref.b	_formatNumber$L
8233                     	xref.b	_memcpy$L
8234                     	xref.b	_parametersSet$L
8235                     	xref.b	_displayInvertArea$L
8236                     	xref.b	_displayWriteString$L
8237                     	xref.b	_displaySetOutLine$L
8238                     	xref.b	_displayClearArea$L
8239                     	xref.b	_displayDrawBox$L
8240                     	end
