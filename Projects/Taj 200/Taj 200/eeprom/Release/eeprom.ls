   1                     ; C Compiler for ST7 (COSMIC Software)
   2                     ; Generator V4.5.5 - 12 Jan 2006
1309                     ; 4 void initEeprom(void)
1309                     ; 5 {
1310                     	switch	.text
1311  0000               _initEeprom:
1314                     ; 6 	_bres(_Pa_Select_EEPROM, _Pin_Select_EEPROM);
1316  0000 1503          	bres	_PBDR,#2
1317                     ; 9 	SPI_MoveByte(EEPROM_WRSR);                       
1319  0002 a601          	ld	a,#1
1320  0004 cd0000        	call	_SPI_MoveByte
1322                     ; 13 	SPI_MoveByte((BYTE)0xF0);          
1324  0007 a6f0          	ld	a,#240
1325  0009 cd0000        	call	_SPI_MoveByte
1327                     ; 16 	_bset(_Pa_Select_EEPROM, _Pin_Select_EEPROM);	
1329  000c 1403          	bset	_PBDR,#2
1330                     ; 17 }
1333  000e 81            	ret
1396                     ; 22 void writeEeprom(WORD a_intAddr, BYTE * a_strBuffer)
1396                     ; 23 {
1397                     	switch	.text
1399                     	xref.b	_writeEeprom$L
1400  000f               _writeEeprom:
1402  000f b701          	ld	_writeEeprom$L+1,a
1403  0011 bf00          	ld	_writeEeprom$L,x
1405                     ; 24     BYTE i 				= 0x00; 
1407  0013 3ffe          	clr	_writeEeprom$L-2
1408                     ; 25 	BYTE ucReadValue 	= 0x00;	
1410  0015 3fff          	clr	_writeEeprom$L-1
1411  0017               L377:
1412                     ; 31 		_bres(_Pa_Select_EEPROM, _Pin_Select_EEPROM);
1414  0017 1503          	bres	_PBDR,#2
1415                     ; 32 		SPI_MoveByte(EEPROM_WREN);                
1417  0019 a606          	ld	a,#6
1418  001b cd0000        	call	_SPI_MoveByte
1420                     ; 33 		_bset(_Pa_Select_EEPROM, _Pin_Select_EEPROM);
1422  001e 1403          	bset	_PBDR,#2
1423                     ; 38 		_bres(_Pa_Select_EEPROM, _Pin_Select_EEPROM);
1425  0020 1503          	bres	_PBDR,#2
1426                     ; 39 		SPI_MoveByte(EEPROM_WRITE);           
1428  0022 a602          	ld	a,#2
1429  0024 cd0000        	call	_SPI_MoveByte
1431                     ; 42         SPI_MoveByte(HIBYTE(a_intAddr));     
1433  0027 b600          	ld	a,_writeEeprom$L
1434  0029 a4ff          	and	a,#255
1435  002b cd0000        	call	_SPI_MoveByte
1437                     ; 43 		SPI_MoveByte(LOBYTE(a_intAddr));  
1439  002e b601          	ld	a,_writeEeprom$L+1
1440  0030 cd0000        	call	_SPI_MoveByte
1442                     ; 44 		a_intAddr++;
1444  0033 3c01          	inc	_writeEeprom$L+1
1445  0035 2602          	jrne	L01
1446  0037 3c00          	inc	_writeEeprom$L
1447  0039               L01:
1448                     ; 47 		SPI_MoveByte((BYTE)a_strBuffer[i]);      
1450  0039 befe          	ld	x,_writeEeprom$L-2
1451  003b 92d602        	ld	a,([_writeEeprom$L+2.w],x)
1452  003e cd0000        	call	_SPI_MoveByte
1454                     ; 49 		_bset(_Pa_Select_EEPROM, _Pin_Select_EEPROM);
1456  0041 1403          	bset	_PBDR,#2
1457  0043               L1001:
1458                     ; 55 			_bres(_Pa_Select_EEPROM, _Pin_Select_EEPROM);
1460  0043 1503          	bres	_PBDR,#2
1461                     ; 56 			SPI_MoveByte(EEPROM_RDSR);      
1463  0045 a605          	ld	a,#5
1464  0047 cd0000        	call	_SPI_MoveByte
1466                     ; 57 			ucReadValue = SPI_MoveByte(SPI_DUMMY);
1468  004a a60b          	ld	a,#11
1469  004c cd0000        	call	_SPI_MoveByte
1471  004f b7ff          	ld	_writeEeprom$L-1,a
1472                     ; 58 			_bset(_Pa_Select_EEPROM, _Pin_Select_EEPROM);
1474  0051 1403          	bset	_PBDR,#2
1475                     ; 59 		} while ((ucReadValue & EEPROM_WIP) > 0);  
1477  0053 b6ff          	ld	a,_writeEeprom$L-1
1478  0055 a501          	bcp	a,#1
1479  0057 26ea          	jrne	L1001
1480                     ; 61 	}while (a_strBuffer[i++] != EEPROM_EOF);
1482  0059 befe          	ld	x,_writeEeprom$L-2
1483  005b 3cfe          	inc	_writeEeprom$L-2
1484  005d 92d602        	ld	a,([_writeEeprom$L+2.w],x)
1485  0060 a1ff          	cp	a,#255
1486  0062 26b3          	jrne	L377
1487                     ; 63 }
1490  0064 81            	ret
1544                     ; 68 void readEeprom(WORD a_intAddr, BYTE * a_strBuffer)
1544                     ; 69 {
1545                     	switch	.text
1547                     	xref.b	_readEeprom$L
1548  0065               _readEeprom:
1550  0065 b701          	ld	_readEeprom$L+1,a
1551  0067 bf00          	ld	_readEeprom$L,x
1553                     ; 70     BYTE ucIndex		= 0x00; 
1555  0069 3fff          	clr	_readEeprom$L-1
1556                     ; 72 	_bres(_Pa_Select_EEPROM, _Pin_Select_EEPROM);
1558  006b 1503          	bres	_PBDR,#2
1559                     ; 75 	SPI_MoveByte(EEPROM_READ);    
1561  006d a603          	ld	a,#3
1562  006f cd0000        	call	_SPI_MoveByte
1564                     ; 81 	SPI_MoveByte(HIBYTE(a_intAddr));     
1566  0072 b600          	ld	a,_readEeprom$L
1567  0074 a4ff          	and	a,#255
1568  0076 cd0000        	call	_SPI_MoveByte
1570                     ; 82 	SPI_MoveByte(LOBYTE(a_intAddr));     
1572  0079 b601          	ld	a,_readEeprom$L+1
1573  007b cd0000        	call	_SPI_MoveByte
1575  007e               L5301:
1576                     ; 87 		a_strBuffer[ucIndex] = SPI_MoveByte(SPI_DUMMY);
1578  007e a60b          	ld	a,#11
1579  0080 cd0000        	call	_SPI_MoveByte
1581  0083 beff          	ld	x,_readEeprom$L-1
1582  0085 92d702        	ld	([_readEeprom$L+2.w],x),a
1583                     ; 88 	} while((a_strBuffer[ucIndex++] != EEPROM_EOF) && (ucIndex<SPI_MAX_LENGTH));
1585  0088 beff          	ld	x,_readEeprom$L-1
1586  008a 3cff          	inc	_readEeprom$L-1
1587  008c 92d602        	ld	a,([_readEeprom$L+2.w],x)
1588  008f a1ff          	cp	a,#255
1589  0091 2706          	jreq	L3401
1591  0093 b6ff          	ld	a,_readEeprom$L-1
1592  0095 a180          	cp	a,#128
1593  0097 25e5          	jrult	L5301
1594  0099               L3401:
1595                     ; 90 	a_strBuffer[SPI_MAX_LENGTH-1] = EEPROM_EOF;
1597  0099 ae7f          	ld	x,#127
1598  009b a6ff          	ld	a,#255
1599  009d 92d702        	ld	([_readEeprom$L+2.w],x),a
1600                     ; 91 	_bset(_Pa_Select_EEPROM, _Pin_Select_EEPROM);		
1602  00a0 1403          	bset	_PBDR,#2
1603                     ; 92 }
1606  00a2 81            	ret
1640                     ; 96 WORD GetAddressByMessage(BYTE byMessageID)
1640                     ; 97 {
1641                     	switch	.text
1643                     	xref.b	_GetAddressByMessage$L
1644  00a3               _GetAddressByMessage:
1647                     ; 98 	return 0x0000;
1649  00a3 5f            	clr	x
1650  00a4 4f            	clr	a
1653  00a5 81            	ret
1665                     	xdef	_GetAddressByMessage
1666                     	xdef	_readEeprom
1667                     	xdef	_writeEeprom
1668                     	xdef	_initEeprom
1669                     	xref	_SPI_MoveByte
1688                     	end
