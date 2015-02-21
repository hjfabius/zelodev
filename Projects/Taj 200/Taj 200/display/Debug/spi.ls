   1                     ; C Compiler for ST7 (COSMIC Software)
   2                     ; Generator V4.5.5 - 12 Jan 2006
1280                     .const:	section	.text
1281  0000               L327_mc_byApplicationVersion:
1282  0000 9d            	dc.b	157
1362                     ; 4 BYTE SPI_MoveByte ( BYTE a_byData)
1362                     ; 5 { 
1363                     	switch	.text
1365                     	xref.b	_SPI_MoveByte$L
1366  0000               _SPI_MoveByte:
1368  0000 b700          	ld	_SPI_MoveByte$L,a
1370                     ; 6 	BYTE 	byCounter 		= 0x00;
1372  0002 3fff          	clr	_SPI_MoveByte$L-1
1373                     ; 7 	byCounter = 8;
1375  0004 a608          	ld	a,#8
1376  0006 b7ff          	ld	_SPI_MoveByte$L-1,a
1377                     ; 10 	_bres(_Pa_SCK, _Pin_SCK);
1379  0008 1100          	bres	_PADR,#0
1380                     ; 12 	for(byCounter=0; byCounter<8; byCounter++)
1382  000a 3fff          	clr	_SPI_MoveByte$L-1
1383  000c               L177:
1384                     ; 15 		if ((a_byData & 0x80)!=0)
1386  000c b600          	ld	a,_SPI_MoveByte$L
1387  000e a580          	bcp	a,#128
1388  0010 2704          	jreq	L777
1389                     ; 17 			_bset(_Pa_MOSI, _Pin_MOSI);
1391  0012 1200          	bset	_PADR,#1
1393  0014 2002          	jra	L1001
1394  0016               L777:
1395                     ; 21 			_bres(_Pa_MOSI, _Pin_MOSI);
1397  0016 1300          	bres	_PADR,#1
1398  0018               L1001:
1399                     ; 23 		a_byData <<= 1;
1401  0018 3800          	sll	_SPI_MoveByte$L
1402                     ; 24 		_bset(_Pa_SCK, _Pin_SCK);
1404  001a 1000          	bset	_PADR,#0
1405                     ; 25 		Nop();
1408  001c 9d            nop
1410                     ; 26 		if(_btst(_Pa_MISO, _Pin_MISO))
1412  001d b600          	ld	a,_PADR
1413  001f a504          	bcp	a,#4
1414  0021 2702          	jreq	L3001
1415                     ; 28 			a_byData+=1;
1417  0023 3c00          	inc	_SPI_MoveByte$L
1418  0025               L3001:
1419                     ; 30 		_bres(_Pa_SCK, _Pin_SCK);
1421  0025 1100          	bres	_PADR,#0
1422                     ; 12 	for(byCounter=0; byCounter<8; byCounter++)
1424  0027 3cff          	inc	_SPI_MoveByte$L-1
1427  0029 b6ff          	ld	a,_SPI_MoveByte$L-1
1428  002b a108          	cp	a,#8
1429  002d 25dd          	jrult	L177
1430                     ; 33 	return a_byData;
1432  002f b600          	ld	a,_SPI_MoveByte$L
1435  0031 81            	ret
1479                     ; 37 BYTE SPI_MoveByteForIRQ ( BYTE a_byData)
1479                     ; 38 { 
1480                     	switch	.text
1482                     	xref.b	_SPI_MoveByteForIRQ$L
1483  0032               _SPI_MoveByteForIRQ:
1485  0032 b700          	ld	_SPI_MoveByteForIRQ$L,a
1487                     ; 39 	BYTE 	byCounter 		= 0x00;
1489  0034 3fff          	clr	_SPI_MoveByteForIRQ$L-1
1490                     ; 40 	byCounter = 8;
1492  0036 a608          	ld	a,#8
1493  0038 b7ff          	ld	_SPI_MoveByteForIRQ$L-1,a
1494                     ; 43 	_bres(_Pa_SCK, _Pin_SCK);
1496  003a 1100          	bres	_PADR,#0
1497                     ; 45 	for(byCounter=0; byCounter<8; byCounter++)
1499  003c 3fff          	clr	_SPI_MoveByteForIRQ$L-1
1500  003e               L7201:
1501                     ; 48 		if ((a_byData & 0x80)!=0)
1503  003e b600          	ld	a,_SPI_MoveByteForIRQ$L
1504  0040 a580          	bcp	a,#128
1505  0042 2704          	jreq	L5301
1506                     ; 50 			_bset(_Pa_MOSI, _Pin_MOSI);
1508  0044 1200          	bset	_PADR,#1
1510  0046 2002          	jra	L7301
1511  0048               L5301:
1512                     ; 54 			_bres(_Pa_MOSI, _Pin_MOSI);
1514  0048 1300          	bres	_PADR,#1
1515  004a               L7301:
1516                     ; 56 		a_byData <<= 1;
1518  004a 3800          	sll	_SPI_MoveByteForIRQ$L
1519                     ; 57 		_bset(_Pa_SCK, _Pin_SCK);
1521  004c 1000          	bset	_PADR,#0
1522                     ; 58 		Nop();
1525  004e 9d            nop
1527                     ; 59 		if(_btst(_Pa_MISO, _Pin_MISO))
1529  004f b600          	ld	a,_PADR
1530  0051 a504          	bcp	a,#4
1531  0053 2702          	jreq	L1401
1532                     ; 61 			a_byData+=1;
1534  0055 3c00          	inc	_SPI_MoveByteForIRQ$L
1535  0057               L1401:
1536                     ; 63 		_bres(_Pa_SCK, _Pin_SCK);
1538  0057 1100          	bres	_PADR,#0
1539                     ; 45 	for(byCounter=0; byCounter<8; byCounter++)
1541  0059 3cff          	inc	_SPI_MoveByteForIRQ$L-1
1544  005b b6ff          	ld	a,_SPI_MoveByteForIRQ$L-1
1545  005d a108          	cp	a,#8
1546  005f 25dd          	jrult	L7201
1547                     ; 66 	return a_byData;
1549  0061 b600          	ld	a,_SPI_MoveByteForIRQ$L
1552  0063 81            	ret
1596                     ; 71 void SPI_PutString(BYTE * a_strMessage)
1596                     ; 72 {
1597                     	switch	.text
1599                     	xref.b	_SPI_PutString$L
1600  0064               _SPI_PutString:
1602  0064 b701          	ld	_SPI_PutString$L+1,a
1603  0066 bf00          	ld	_SPI_PutString$L,x
1605                     ; 73 	BYTE i = 0x00;
1607  0068 3fff          	clr	_SPI_PutString$L-1
1609  006a 2009          	jra	L1701
1610  006c               L5601:
1611                     ; 77 		SPI_MoveByte(a_strMessage[i]);
1613  006c beff          	ld	x,_SPI_PutString$L-1
1614  006e 92d600        	ld	a,([_SPI_PutString$L.w],x)
1615  0071 ad8d          	call	_SPI_MoveByte
1617                     ; 78 		i++;
1619  0073 3cff          	inc	_SPI_PutString$L-1
1620  0075               L1701:
1621                     ; 75 	while((i<SPI_MAX_LENGTH) && (a_strMessage[i] != SPI_EOL))
1623  0075 b6ff          	ld	a,_SPI_PutString$L-1
1624  0077 a180          	cp	a,#128
1625  0079 2409          	jruge	L5701
1627  007b beff          	ld	x,_SPI_PutString$L-1
1628  007d 92d600        	ld	a,([_SPI_PutString$L.w],x)
1629  0080 a1ff          	cp	a,#255
1630  0082 26e8          	jrne	L5601
1631  0084               L5701:
1632                     ; 80 }
1635  0084 81            	ret
1647                     	xdef	_SPI_PutString
1648                     	xdef	_SPI_MoveByteForIRQ
1649                     	xdef	_SPI_MoveByte
1668                     	end
