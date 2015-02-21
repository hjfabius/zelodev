   1                     ; C Compiler for ST7 (COSMIC Software)
   2                     ; Generator V4.5.5 - 12 Jan 2006
1280                     	switch	.data
1281  0000               _m_byParamJob:
1282  0000 01            	dc.b	1
1283  0001               _m_byParamLanguage:
1284  0001 00            	dc.b	0
1285  0002               _m_byParamMode:
1286  0002 00            	dc.b	0
1287  0003               _m_byParamVisual:
1288  0003 00            	dc.b	0
1289  0004               _m_byParamFirstTime:
1290  0004 ff            	dc.b	255
1323                     ; 21 void parametersInit(void)
1323                     ; 22 {
1324                     	switch	.text
1325  0000               _parametersInit:
1328                     ; 23 	parametersChangedFlagReset(0xFF);
1330  0000 a6ff          	ld	a,#255
1331  0002 ad0e          	call	_parametersChangedFlagReset
1333                     ; 24 	parametersLoadJob(0x00);
1335  0004 4f            	clr	a
1336  0005 cd00dd        	call	_parametersLoadJob
1338                     ; 25 	if (m_byParamFirstTime == 0xFF) //First time Taj 200 is start up
1340  0008 c60004        	ld	a,_m_byParamFirstTime
1341  000b a1ff          	cp	a,#255
1342  000d 2602          	jrne	L147
1343                     ; 27 		parametersReset(); //Save default parameters
1345  000f ad65          	call	_parametersReset
1347  0011               L147:
1348                     ; 29 }
1351  0011 81            	ret
1386                     ; 32 void parametersChangedFlagReset(BYTE a_byParameterIndex)
1386                     ; 33 {
1387                     	switch	.text
1389                     	xref.b	_parametersChangedFlagReset$L
1390  0012               _parametersChangedFlagReset:
1392  0012 b700          	ld	_parametersChangedFlagReset$L,a
1394                     ; 34 	if (a_byParameterIndex == 0xFF)
1396  0014 a1ff          	cp	a,#255
1397  0016 2616          	jrne	L167
1398                     ; 36 		m_lwoParameterChangedFlag = 0x00000000;
1400  0018 a600          	ld	a,#0
1401  001a c70003        	ld	_m_lwoParameterChangedFlag+3,a
1402  001d a600          	ld	a,#0
1403  001f c70002        	ld	_m_lwoParameterChangedFlag+2,a
1404  0022 a600          	ld	a,#0
1405  0024 c70001        	ld	_m_lwoParameterChangedFlag+1,a
1406  0027 a600          	ld	a,#0
1407  0029 c70000        	ld	_m_lwoParameterChangedFlag,a
1409  002c 201e          	jra	L367
1410  002e               L167:
1411                     ; 40 		_bres(m_lwoParameterChangedFlag, a_byParameterIndex);
1413  002e 5f            	clr	x
1414  002f a601          	ld	a,#1
1415  0031 90be00        	ld	y,_parametersChangedFlagReset$L
1416  0034 905d          	tnz	y
1417  0036 2706          	jreq	L01
1418  0038               L21:
1419  0038 48            	sll	a
1420  0039 59            	rlc	x
1421  003a 905a          	dec	y
1422  003c 26fa          	jrne	L21
1423  003e               L01:
1424  003e 43            	cpl	a
1425  003f 53            	cpl	x
1426  0040 cd0000        	call	c_itol
1428  0043 ae00          	ld	x,#high(_m_lwoParameterChangedFlag)
1429  0045 bf00          	ld	c_x,x
1430  0047 ae00          	ld	x,#low(_m_lwoParameterChangedFlag)
1431  0049 cd0000        	call	c_xlgand
1433  004c               L367:
1434                     ; 42 }
1437  004c 81            	ret
1472                     ; 45 BYTE parametersIsChanged(BYTE a_byParameterIndex)
1472                     ; 46 {
1473                     	switch	.text
1475                     	xref.b	_parametersIsChanged$L
1476  004d               _parametersIsChanged:
1478  004d b700          	ld	_parametersIsChanged$L,a
1480                     ; 47 	return (BYTE)(_btst(m_lwoParameterChangedFlag, a_byParameterIndex)!=0);
1482  004f 5f            	clr	x
1483  0050 a601          	ld	a,#1
1484  0052 90be00        	ld	y,_parametersIsChanged$L
1485  0055 905d          	tnz	y
1486  0057 2706          	jreq	L02
1487  0059               L22:
1488  0059 48            	sll	a
1489  005a 59            	rlc	x
1490  005b 905a          	dec	y
1491  005d 26fa          	jrne	L22
1492  005f               L02:
1493  005f cd0000        	call	c_itol
1495  0062 ae00          	ld	x,#high(_m_lwoParameterChangedFlag)
1496  0064 bf00          	ld	c_x,x
1497  0066 ae00          	ld	x,#low(_m_lwoParameterChangedFlag)
1498  0068 cd0000        	call	c_xland
1500  006b cd0000        	call	c_lrzmp
1502  006e 2704          	jreq	L61
1503  0070 a601          	ld	a,#1
1504  0072 2001          	jra	L42
1505  0074               L61:
1506  0074 4f            	clr	a
1507  0075               L42:
1510  0075 81            	ret
1534                     ; 51 void parametersReset(void)
1534                     ; 52 {
1535                     	switch	.text
1536  0076               _parametersReset:
1539                     ; 53 	m_arwoParameters[PARAM_JOB] 				= (WORD)   1; //0 used for current job
1541  0076 a601          	ld	a,#1
1542  0078 c70005        	ld	_m_arwoParameters+1,a
1543  007b 4f            	clr	a
1544  007c c70004        	ld	_m_arwoParameters,a
1545                     ; 54 	m_arwoParameters[PARAM_LANGUAGE]			= (WORD)   0; //0=IT 1=EN 2=DE
1547  007f 4f            	clr	a
1548  0080 c70006        	ld	_m_arwoParameters+2,a
1549  0083 c70007        	ld	_m_arwoParameters+3,a
1550                     ; 55 	m_arwoParameters[PARAM_SPEED]				= (WORD)   0; 
1552  0086 4f            	clr	a
1553  0087 c7000a        	ld	_m_arwoParameters+6,a
1554  008a c7000b        	ld	_m_arwoParameters+7,a
1555                     ; 56 	m_arwoParameters[PAGE_REGISTER]				= (WORD)   0; //
1557  008d 4f            	clr	a
1558  008e c7000c        	ld	_m_arwoParameters+8,a
1559  0091 c7000d        	ld	_m_arwoParameters+9,a
1560                     ; 57 	m_arwoParameters[PARAM_MODE_LONG]			= (WORD)   0; //0=Auto 1=Man
1562  0094 4f            	clr	a
1563  0095 c70010        	ld	_m_arwoParameters+12,a
1564  0098 c70011        	ld	_m_arwoParameters+13,a
1565                     ; 58 	m_arwoParameters[PARAM_CORRECTION]			= (WORD)   0; //0=Off  1=Minus 2=Plus
1567  009b 4f            	clr	a
1568  009c c70014        	ld	_m_arwoParameters+16,a
1569  009f c70015        	ld	_m_arwoParameters+17,a
1570                     ; 59 	m_arwoParameters[PARAM_ALARM_OUT_OF_BOUND] 	= false;
1572  00a2 4f            	clr	a
1573  00a3 c70020        	ld	_m_arwoParameters+28,a
1574  00a6 c70021        	ld	_m_arwoParameters+29,a
1575                     ; 60 	m_arwoParameters[PARAM_ALARM]				= (WORD)	STI_ANSWER_OK;
1577  00a9 4f            	clr	a
1578  00aa c70008        	ld	_m_arwoParameters+4,a
1579  00ad c70009        	ld	_m_arwoParameters+5,a
1580                     ; 61 	m_arwoParameters[PARAM_OSCIL_ZOOM] 			= (WORD)   0x0001;
1582  00b0 a601          	ld	a,#1
1583  00b2 c7001b        	ld	_m_arwoParameters+23,a
1584  00b5 4f            	clr	a
1585  00b6 c7001a        	ld	_m_arwoParameters+22,a
1586                     ; 62 	m_arwoParameters[PARAM_OSCIL_OFFSET] 		= (WORD)   0xFFFF;
1588  00b9 aeff          	ld	x,#255
1589  00bb cf001c        	ld	_m_arwoParameters+24,x
1590  00be a6ff          	ld	a,#255
1591  00c0 c7001d        	ld	_m_arwoParameters+25,a
1592                     ; 63 	parametersSaveJob(0x00);
1594  00c3 4f            	clr	a
1595  00c4 ad05          	call	_parametersSaveJob
1597                     ; 64 }
1600  00c6 81            	ret
1634                     ; 67 void parametersSave(BYTE a_byParameterIndex)
1634                     ; 68 {
1635                     	switch	.text
1637                     	xref.b	_parametersSave$L
1638  00c7               _parametersSave:
1641                     ; 69 	parametersSaveJob(0x00);
1643  00c7 4f            	clr	a
1644  00c8 ad01          	call	_parametersSaveJob
1646                     ; 70 }
1649  00ca 81            	ret
1692                     ; 73 void parametersSaveJob(BYTE a_byJob)
1692                     ; 74 {
1693                     	switch	.text
1695                     	xref.b	_parametersSaveJob$L
1696  00cb               _parametersSaveJob:
1698  00cb b700          	ld	_parametersSaveJob$L,a
1700                     ; 76 	BYTE i = 0x00;
1702  00cd 3fff          	clr	_parametersSaveJob$L-1
1703                     ; 78 	if(a_byJob>0)
1705  00cf 3d00          	tnz	_parametersSaveJob$L
1706  00d1 2709          	jreq	L3501
1707                     ; 80 		m_arwoParameters[PARAM_JOB] = a_byJob;
1709  00d3 b600          	ld	a,_parametersSaveJob$L
1710  00d5 5f            	clr	x
1711  00d6 c70005        	ld	_m_arwoParameters+1,a
1712  00d9 cf0004        	ld	_m_arwoParameters,x
1713  00dc               L3501:
1714                     ; 85 }
1717  00dc 81            	ret
1752                     ; 88 void parametersLoadJob(BYTE a_byJob)
1752                     ; 89 {
1753                     	switch	.text
1755                     	xref.b	_parametersLoadJob$L
1756  00dd               _parametersLoadJob:
1759                     ; 93 	if (a_byJob > 0x00)
1761  00dd 4d            	tnz	a
1762  00de 270a          	jreq	L3701
1763                     ; 95 		m_arwoParameters[PARAM_JOB] = a_byJob;
1765  00e0 5f            	clr	x
1766  00e1 c70005        	ld	_m_arwoParameters+1,a
1767  00e4 cf0004        	ld	_m_arwoParameters,x
1768                     ; 96 		parametersSaveJob(0x00); //save current parameters in position 0
1770  00e7 4f            	clr	a
1771  00e8 ade1          	call	_parametersSaveJob
1773  00ea               L3701:
1774                     ; 98 }
1777  00ea 81            	ret
1820                     ; 101 WORD parametersGetValue(BYTE a_byParameterIndex)
1820                     ; 102 {
1821                     	switch	.text
1823                     	xref.b	_parametersGetValue$L
1824  00eb               _parametersGetValue:
1826  00eb b700          	ld	_parametersGetValue$L,a
1828                     ; 103 	WORD woValue = 0x0000;
1830  00ed 3ffe          	clr	_parametersGetValue$L-2
1831  00ef 3fff          	clr	_parametersGetValue$L-1
1832                     ; 104 	parametersGet(a_byParameterIndex, &woValue);
1834  00f1 aefe          	ld	x,#high(_parametersGetValue$L-2)
1835  00f3 bf01          	ld	_parametersGet$L+1,x
1836  00f5 a6fe          	ld	a,#low(_parametersGetValue$L-2)
1837  00f7 b702          	ld	_parametersGet$L+2,a
1838  00f9 b600          	ld	a,_parametersGetValue$L
1839  00fb ad05          	call	_parametersGet
1841                     ; 105 	return woValue;
1843  00fd b6ff          	ld	a,_parametersGetValue$L-1
1844  00ff befe          	ld	x,_parametersGetValue$L-2
1847  0101 81            	ret
1891                     ; 109 void parametersGet(BYTE a_byParameterIndex, WORD * a_woValue)
1891                     ; 110 {
1892                     	switch	.text
1894                     	xref.b	_parametersGet$L
1895  0102               _parametersGet:
1898                     ; 111 	*a_woValue = (WORD) m_arwoParameters[a_byParameterIndex];
1900  0102 97            	ld	x,a
1901  0103 58            	sll	x
1902  0104 d60005        	ld	a,(_m_arwoParameters+1,x)
1903  0107 de0004        	ld	x,(_m_arwoParameters,x)
1904  010a 90be01        	ld	y,_parametersGet$L+1
1905  010d 90bf00        	ld	c_y,y
1906  0110 90be02        	ld	y,_parametersGet$L+2
1907  0113 cd0000        	call	c_putw
1909                     ; 112 }
1912  0116 81            	ret
1957                     ; 115 void parametersSet(BYTE a_byParameterIndex, WORD a_woValue)
1957                     ; 116 {
1958                     	switch	.text
1960                     	xref.b	_parametersSet$L
1961  0117               _parametersSet:
1963  0117 b700          	ld	_parametersSet$L,a
1965                     ; 117 	if (m_arwoParameters[a_byParameterIndex] != a_woValue)
1967  0119 97            	ld	x,a
1968  011a 58            	sll	x
1969  011b d60005        	ld	a,(_m_arwoParameters+1,x)
1970  011e b102          	cp	a,_parametersSet$L+2
1971  0120 2605          	jrne	L44
1972  0122 d60004        	ld	a,(_m_arwoParameters,x)
1973  0125 b101          	cp	a,_parametersSet$L+1
1974  0127               L44:
1975  0127 272d          	jreq	L3611
1976                     ; 119 		m_arwoParameters[a_byParameterIndex] = a_woValue;
1978  0129 be00          	ld	x,_parametersSet$L
1979  012b 58            	sll	x
1980  012c b601          	ld	a,_parametersSet$L+1
1981  012e d70004        	ld	(_m_arwoParameters,x),a
1982  0131 b602          	ld	a,_parametersSet$L+2
1983  0133 d70005        	ld	(_m_arwoParameters+1,x),a
1984                     ; 120 		_bset(m_lwoParameterChangedFlag, a_byParameterIndex);
1986  0136 5f            	clr	x
1987  0137 a601          	ld	a,#1
1988  0139 90be00        	ld	y,_parametersSet$L
1989  013c 905d          	tnz	y
1990  013e 2706          	jreq	L64
1991  0140               L05:
1992  0140 48            	sll	a
1993  0141 59            	rlc	x
1994  0142 905a          	dec	y
1995  0144 26fa          	jrne	L05
1996  0146               L64:
1997  0146 cd0000        	call	c_itol
1999  0149 ae00          	ld	x,#high(_m_lwoParameterChangedFlag)
2000  014b bf00          	ld	c_x,x
2001  014d ae00          	ld	x,#low(_m_lwoParameterChangedFlag)
2002  014f cd0000        	call	c_xlgor
2004                     ; 123 		parametersSaveJob(0x00);
2006  0152 4f            	clr	a
2007  0153 cd00cb        	call	_parametersSaveJob
2009  0156               L3611:
2010                     ; 129 }
2013  0156 81            	ret
2092                     	xdef	_m_byParamFirstTime
2093                     	switch	.bss
2094  0000               _m_lwoParameterChangedFlag:
2095  0000 00000000      	ds.b	4
2096                     	xdef	_m_lwoParameterChangedFlag
2097  0004               _m_arwoParameters:
2098  0004 000000000000  	ds.b	30
2099                     	xdef	_m_arwoParameters
2100                     	xdef	_m_byParamVisual
2101                     	xdef	_m_byParamMode
2102                     	xdef	_m_byParamLanguage
2103                     	xdef	_m_byParamJob
2104                     	xdef	_parametersIsChanged
2105                     	xdef	_parametersChangedFlagReset
2106                     	xdef	_parametersSet
2107                     	xdef	_parametersGetValue
2108                     	xdef	_parametersGet
2109                     	xdef	_parametersLoadJob
2110                     	xdef	_parametersSaveJob
2111                     	xdef	_parametersSave
2112                     	xdef	_parametersReset
2113                     	xdef	_parametersInit
2114                     	xref.b	c_x
2115                     	xref.b	c_y
2135                     	xref	c_xlgor
2136                     	xref	c_putw
2137                     	xref	c_lrzmp
2138                     	xref	c_xland
2139                     	xref	c_xlgand
2140                     	xref	c_itol
2141                     	xref.b	_parametersGet$L
2142                     	end
