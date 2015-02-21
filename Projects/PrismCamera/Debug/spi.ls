   1                     ; C Compiler for ST7 (COSMIC Software)
   2                     ; Generator V4.5.5 - 12 Jan 2006
1329                     ; 4 BYTE SPI_MoveByte ( BYTE a_byData)
1329                     ; 5 { 
1330                     	switch	.text
1332                     	xref.b	_SPI_MoveByte$L
1333  0000               _SPI_MoveByte:
1335  0000 b700          	ld	_SPI_MoveByte$L,a
1337                     ; 6 	BYTE 	byCounter 		= 0x00;
1339  0002 3fff          	clr	_SPI_MoveByte$L-1
1340                     ; 7 	byCounter = 8;
1342  0004 a608          	ld	a,#8
1343  0006 b7ff          	ld	_SPI_MoveByte$L-1,a
1344                     ; 10 	_bres(_Pa_SCK, _Pin_SCK);
1346  0008 1100          	bres	_PADR,#0
1347                     ; 12 	for(byCounter=0; byCounter<8; byCounter++)
1349  000a 3fff          	clr	_SPI_MoveByte$L-1
1350  000c               L357:
1351                     ; 15 		if ((a_byData & 0x80)!=0)
1353  000c b600          	ld	a,_SPI_MoveByte$L
1354  000e a580          	bcp	a,#128
1355  0010 2704          	jreq	L167
1356                     ; 17 			_bset(_Pa_MOSI, _Pin_MOSI);
1358  0012 1200          	bset	_PADR,#1
1360  0014 2002          	jra	L367
1361  0016               L167:
1362                     ; 21 			_bres(_Pa_MOSI, _Pin_MOSI);
1364  0016 1300          	bres	_PADR,#1
1365  0018               L367:
1366                     ; 23 		a_byData <<= 1;
1368  0018 3800          	sll	_SPI_MoveByte$L
1369                     ; 24 		_bset(_Pa_SCK, _Pin_SCK);
1371  001a 1000          	bset	_PADR,#0
1372                     ; 25 		Nop();
1375  001c 9d            nop
1377                     ; 26 		if(_btst(_Pa_MISO, _Pin_MISO))
1379  001d b600          	ld	a,_PADR
1380  001f a504          	bcp	a,#4
1381  0021 2702          	jreq	L567
1382                     ; 28 			a_byData+=1;
1384  0023 3c00          	inc	_SPI_MoveByte$L
1385  0025               L567:
1386                     ; 30 		_bres(_Pa_SCK, _Pin_SCK);
1388  0025 1100          	bres	_PADR,#0
1389                     ; 12 	for(byCounter=0; byCounter<8; byCounter++)
1391  0027 3cff          	inc	_SPI_MoveByte$L-1
1394  0029 b6ff          	ld	a,_SPI_MoveByte$L-1
1395  002b a108          	cp	a,#8
1396  002d 25dd          	jrult	L357
1397                     ; 33 	return a_byData; //byReceivedValue;
1399  002f b600          	ld	a,_SPI_MoveByte$L
1402  0031 81            	ret
1446                     ; 37 void SPI_PutString(BYTE * a_strMessage)
1446                     ; 38 {
1447                     	switch	.text
1449                     	xref.b	_SPI_PutString$L
1450  0032               _SPI_PutString:
1452  0032 b701          	ld	_SPI_PutString$L+1,a
1453  0034 bf00          	ld	_SPI_PutString$L,x
1455                     ; 39 	BYTE i = 0x00;
1457  0036 3fff          	clr	_SPI_PutString$L-1
1459  0038 2009          	jra	L5101
1460  003a               L1101:
1461                     ; 43 		SPI_MoveByte(a_strMessage[i]);
1463  003a beff          	ld	x,_SPI_PutString$L-1
1464  003c 92d600        	ld	a,([_SPI_PutString$L.w],x)
1465  003f adbf          	call	_SPI_MoveByte
1467                     ; 44 		i++;
1469  0041 3cff          	inc	_SPI_PutString$L-1
1470  0043               L5101:
1471                     ; 41 	while((i<SPI_MAX_LENGTH) && (a_strMessage[i] != SPI_EOL))
1473  0043 b6ff          	ld	a,_SPI_PutString$L-1
1474  0045 a180          	cp	a,#128
1475  0047 2409          	jruge	L1201
1477  0049 beff          	ld	x,_SPI_PutString$L-1
1478  004b 92d600        	ld	a,([_SPI_PutString$L.w],x)
1479  004e a1ff          	cp	a,#255
1480  0050 26e8          	jrne	L1101
1481  0052               L1201:
1482                     ; 46 }
1485  0052 81            	ret
1497                     	xdef	_SPI_PutString
1498                     	xdef	_SPI_MoveByte
1517                     	end
