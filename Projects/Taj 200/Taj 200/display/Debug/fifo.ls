   1                     ; C Compiler for ST7 (COSMIC Software)
   2                     ; Generator V4.5.5 - 12 Jan 2006
1280                     .const:	section	.text
1281  0000               L327_mc_byApplicationVersion:
1282  0000 9d            	dc.b	157
1353                     ; 9 void FIFO_Init(void)
1353                     ; 10 {
1354                     	switch	.text
1356                     	xref.b	_FIFO_Init$L
1357  0000               _FIFO_Init:
1360                     ; 11 	BYTE i = FIFO_BUFFER;
1362  0000 a620          	ld	a,#32
1363  0002 b7ff          	ld	_FIFO_Init$L-1,a
1365  0004 2008          	jra	L577
1366  0006               L177:
1367                     ; 14 		m_arbyFifoBuffer[--i]=0x00;
1369  0006 3aff          	dec	_FIFO_Init$L-1
1370  0008 beff          	ld	x,_FIFO_Init$L-1
1371  000a 4f            	clr	a
1372  000b d70001        	ld	(L147_m_arbyFifoBuffer,x),a
1373  000e               L577:
1374                     ; 12 	while(i>0)
1376  000e 3dff          	tnz	_FIFO_Init$L-1
1377  0010 26f4          	jrne	L177
1378                     ; 16 	m_byFifoLength = 0x00;
1380  0012 4f            	clr	a
1381  0013 c70000        	ld	L347_m_byFifoLength,a
1382                     ; 17 }
1385  0016 81            	ret
1420                     ; 20 void FIFO_PutByte(BYTE a_byData)
1420                     ; 21 {
1421                     	switch	.text
1423                     	xref.b	_FIFO_PutByte$L
1424  0017               _FIFO_PutByte:
1426  0017 b700          	ld	_FIFO_PutByte$L,a
1428                     ; 22 	m_arbyFifoBuffer[m_byFifoLength++] = a_byData;
1430  0019 ce0000        	ld	x,L347_m_byFifoLength
1431  001c c60000        	ld	a,L347_m_byFifoLength
1432  001f ab01          	add	a,#1
1433  0021 c70000        	ld	L347_m_byFifoLength,a
1434  0024 b600          	ld	a,_FIFO_PutByte$L
1435  0026 d70001        	ld	(L147_m_arbyFifoBuffer,x),a
1436                     ; 23 }
1439  0029 81            	ret
1483                     ; 26 BYTE FIFO_GetByte(void)
1483                     ; 27 {
1484                     	switch	.text
1486                     	xref.b	_FIFO_GetByte$L
1487  002a               _FIFO_GetByte:
1490                     ; 28 	BYTE i = m_byFifoLength;
1492  002a c60000        	ld	a,L347_m_byFifoLength
1493  002d b7ff          	ld	_FIFO_GetByte$L-1,a
1494                     ; 31 	byResult = m_arbyFifoBuffer[0];
1496  002f c60001        	ld	a,L147_m_arbyFifoBuffer
1497  0032 b7fe          	ld	_FIFO_GetByte$L-2,a
1498                     ; 32 	for(i=0; i<m_byFifoLength; i++)
1500  0034 3fff          	clr	_FIFO_GetByte$L-1
1502  0036 200c          	jra	L5401
1503  0038               L1401:
1504                     ; 34 		m_arbyFifoBuffer[i]= m_arbyFifoBuffer[i+1];
1506  0038 beff          	ld	x,_FIFO_GetByte$L-1
1507  003a d60002        	ld	a,(L147_m_arbyFifoBuffer+1,x)
1508  003d beff          	ld	x,_FIFO_GetByte$L-1
1509  003f d70001        	ld	(L147_m_arbyFifoBuffer,x),a
1510                     ; 32 	for(i=0; i<m_byFifoLength; i++)
1512  0042 3cff          	inc	_FIFO_GetByte$L-1
1513  0044               L5401:
1516  0044 b6ff          	ld	a,_FIFO_GetByte$L-1
1517  0046 c10000        	cp	a,L347_m_byFifoLength
1518  0049 25ed          	jrult	L1401
1519                     ; 37 	m_byFifoLength--;
1521  004b c60000        	ld	a,L347_m_byFifoLength
1522  004e a001          	sub	a,#1
1523  0050 c70000        	ld	L347_m_byFifoLength,a
1524                     ; 38 	return byResult;
1526  0053 b6fe          	ld	a,_FIFO_GetByte$L-2
1529  0055 81            	ret
1552                     ; 42 BYTE FIFO_GetLength(void)
1552                     ; 43 {
1553                     	switch	.text
1554  0056               _FIFO_GetLength:
1557                     ; 44 	return m_byFifoLength;
1559  0056 c60000        	ld	a,L347_m_byFifoLength
1562  0059 81            	ret
1595                     	switch	.bss
1596  0000               L347_m_byFifoLength:
1597  0000 00            	ds.b	1
1598  0001               L147_m_arbyFifoBuffer:
1599  0001 000000000000  	ds.b	32
1600                     	xdef	_FIFO_GetLength
1601                     	xdef	_FIFO_GetByte
1602                     	xdef	_FIFO_PutByte
1603                     	xdef	_FIFO_Init
1623                     	end
