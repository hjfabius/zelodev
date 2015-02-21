   1                     ; C Compiler for ST7 (COSMIC Software)
   2                     ; Generator V4.5.5 - 12 Jan 2006
1320                     ; 9 void FIFO_Init(void)
1320                     ; 10 {
1321                     	switch	.text
1323                     	xref.b	_FIFO_Init$L
1324  0000               _FIFO_Init:
1327                     ; 11 	BYTE i = FIFO_BUFFER;
1329  0000 a620          	ld	a,#32
1330  0002 b7ff          	ld	_FIFO_Init$L-1,a
1332  0004 2008          	jra	L757
1333  0006               L357:
1334                     ; 14 		m_arbyFifoBuffer[--i]=0x00;
1336  0006 3aff          	dec	_FIFO_Init$L-1
1337  0008 beff          	ld	x,_FIFO_Init$L-1
1338  000a 4f            	clr	a
1339  000b d70001        	ld	(L327_m_arbyFifoBuffer,x),a
1340  000e               L757:
1341                     ; 12 	while(i>0)
1343  000e 3dff          	tnz	_FIFO_Init$L-1
1344  0010 26f4          	jrne	L357
1345                     ; 16 	m_byFifoLength = 0x00;
1347  0012 4f            	clr	a
1348  0013 c70000        	ld	L527_m_byFifoLength,a
1349                     ; 17 }
1352  0016 81            	ret
1387                     ; 20 void FIFO_PutByte(BYTE a_byData)
1387                     ; 21 {
1388                     	switch	.text
1390                     	xref.b	_FIFO_PutByte$L
1391  0017               _FIFO_PutByte:
1393  0017 b700          	ld	_FIFO_PutByte$L,a
1395                     ; 22 	m_arbyFifoBuffer[m_byFifoLength++] = a_byData;
1397  0019 ce0000        	ld	x,L527_m_byFifoLength
1398  001c c60000        	ld	a,L527_m_byFifoLength
1399  001f ab01          	add	a,#1
1400  0021 c70000        	ld	L527_m_byFifoLength,a
1401  0024 b600          	ld	a,_FIFO_PutByte$L
1402  0026 d70001        	ld	(L327_m_arbyFifoBuffer,x),a
1403                     ; 23 }
1406  0029 81            	ret
1450                     ; 26 BYTE FIFO_GetByte(void)
1450                     ; 27 {
1451                     	switch	.text
1453                     	xref.b	_FIFO_GetByte$L
1454  002a               _FIFO_GetByte:
1457                     ; 28 	BYTE i = m_byFifoLength;
1459  002a c60000        	ld	a,L527_m_byFifoLength
1460  002d b7ff          	ld	_FIFO_GetByte$L-1,a
1461                     ; 31 	byResult = m_arbyFifoBuffer[0];
1463  002f c60001        	ld	a,L327_m_arbyFifoBuffer
1464  0032 b7fe          	ld	_FIFO_GetByte$L-2,a
1465                     ; 32 	for(i=0; i<m_byFifoLength; i++)
1467  0034 3fff          	clr	_FIFO_GetByte$L-1
1469  0036 200c          	jra	L7201
1470  0038               L3201:
1471                     ; 34 		m_arbyFifoBuffer[i]= m_arbyFifoBuffer[i+1];
1473  0038 beff          	ld	x,_FIFO_GetByte$L-1
1474  003a d60002        	ld	a,(L327_m_arbyFifoBuffer+1,x)
1475  003d beff          	ld	x,_FIFO_GetByte$L-1
1476  003f d70001        	ld	(L327_m_arbyFifoBuffer,x),a
1477                     ; 32 	for(i=0; i<m_byFifoLength; i++)
1479  0042 3cff          	inc	_FIFO_GetByte$L-1
1480  0044               L7201:
1483  0044 b6ff          	ld	a,_FIFO_GetByte$L-1
1484  0046 c10000        	cp	a,L527_m_byFifoLength
1485  0049 25ed          	jrult	L3201
1486                     ; 37 	m_byFifoLength--;
1488  004b c60000        	ld	a,L527_m_byFifoLength
1489  004e a001          	sub	a,#1
1490  0050 c70000        	ld	L527_m_byFifoLength,a
1491                     ; 38 	return byResult;
1493  0053 b6fe          	ld	a,_FIFO_GetByte$L-2
1496  0055 81            	ret
1519                     ; 42 BYTE FIFO_GetLength(void)
1519                     ; 43 {
1520                     	switch	.text
1521  0056               _FIFO_GetLength:
1524                     ; 44 	return m_byFifoLength;
1526  0056 c60000        	ld	a,L527_m_byFifoLength
1529  0059 81            	ret
1562                     	switch	.bss
1563  0000               L527_m_byFifoLength:
1564  0000 00            	ds.b	1
1565  0001               L327_m_arbyFifoBuffer:
1566  0001 000000000000  	ds.b	32
1567                     	xdef	_FIFO_GetLength
1568                     	xdef	_FIFO_GetByte
1569                     	xdef	_FIFO_PutByte
1570                     	xdef	_FIFO_Init
1590                     	end
