   1                     ; C Compiler for ST7 (COSMIC Software)
   2                     ; Generator V4.4f - 27 May 2003
 474                     ; 5 char sendIntNumber(unsigned int intNumber)
 474                     ; 6 {
 475                     	switch	.text
 477                     	xref.b	_sendIntNumber$L
 478  0000               _sendIntNumber:
 480  0000 b701          	ld	_sendIntNumber$L+1,a
 481  0002 bf00          	ld	_sendIntNumber$L,x
 483                     ; 8 	char i = 0x00;
 485  0004 3fff          	clr	_sendIntNumber$L-1
 486                     ; 9 	char j = 0x00;
 488  0006 3ffb          	clr	_sendIntNumber$L-5
 489                     ; 10 	unsigned int intTimeOut = 0x0000;
 491  0008 3ffd          	clr	_sendIntNumber$L-3
 492  000a 3ffe          	clr	_sendIntNumber$L-2
 493                     ; 11 	char blnInput = 0x00;
 495  000c 3ffc          	clr	_sendIntNumber$L-4
 496                     ; 16 	strMessage[0] = 'I';
 498  000e a649          	ld	a,#73
 499  0010 b7f8          	ld	_sendIntNumber$L-8,a
 500                     ; 17 	strMessage[1] = intNumber%256;  intNumber/=256;
 502  0012 b601          	ld	a,_sendIntNumber$L+1
 503  0014 a4ff          	and	a,#255
 504  0016 b7f9          	ld	_sendIntNumber$L-7,a
 507  0018 b600          	ld	a,_sendIntNumber$L
 508  001a b701          	ld	_sendIntNumber$L+1,a
 509  001c 3f00          	clr	_sendIntNumber$L
 510                     ; 18 	strMessage[2] = intNumber;
 512  001e b601          	ld	a,_sendIntNumber$L+1
 513  0020 b7fa          	ld	_sendIntNumber$L-6,a
 514                     ; 20 	j=0x00;
 516  0022 3ffb          	clr	_sendIntNumber$L-5
 517  0024               L762:
 518                     ; 23 		for(i=0; i<8;i++)
 520  0024 3fff          	clr	_sendIntNumber$L-1
 521  0026               L572:
 522                     ; 25 			intTimeOut = 40000;
 524  0026 ae9c          	ld	x,#156
 525  0028 bffd          	ld	_sendIntNumber$L-3,x
 526  002a a640          	ld	a,#64
 527  002c b7fe          	ld	_sendIntNumber$L-2,a
 528  002e               L303:
 529                     ; 28 				blnInput = _btst(PBDR, 1)/2;
 531  002e b603          	ld	a,_PBDR
 532  0030 a402          	and	a,#2
 533  0032 44            	srl	a
 534  0033 b7fc          	ld	_sendIntNumber$L-4,a
 535                     ; 29 				intTimeOut--;
 537  0035 3dfe          	tnz	_sendIntNumber$L-2
 538  0037 2602          	jrne	L6
 539  0039 3afd          	dec	_sendIntNumber$L-3
 540  003b               L6:
 541  003b 3afe          	dec	_sendIntNumber$L-2
 542                     ; 30 			}while((blnInput==(i%2)) && (intTimeOut>0));
 544  003d b6ff          	ld	a,_sendIntNumber$L-1
 545  003f a401          	and	a,#1
 546  0041 b1fc          	cp	a,_sendIntNumber$L-4
 547  0043 2606          	jrne	L113
 549  0045 b6fe          	ld	a,_sendIntNumber$L-2
 550  0047 bafd          	or	a,_sendIntNumber$L-3
 551  0049 26e3          	jrne	L303
 552  004b               L113:
 553                     ; 32 			if(intTimeOut==0)
 555  004b b6fe          	ld	a,_sendIntNumber$L-2
 556  004d bafd          	or	a,_sendIntNumber$L-3
 557  004f 2602          	jrne	L313
 558                     ; 35 				return (char) 0;
 560  0051 4f            	clr	a
 563  0052 81            	ret
 564  0053               L313:
 565                     ; 39 			if(_btst(strMessage[j], i))
 567  0053 befb          	ld	x,_sendIntNumber$L-5
 568  0055 e6f8          	ld	a,(_sendIntNumber$L-8,x)
 569  0057 5f            	clr	x
 570  0058 b7e7          	ld	_sendIntNumber$L-25,a
 571  005a bfe6          	ld	_sendIntNumber$L-26,x
 572  005c 5f            	clr	x
 573  005d a601          	ld	a,#1
 574  005f 90beff        	ld	y,_sendIntNumber$L-1
 575  0062 905d          	tnz	y
 576  0064 2706          	jreq	L01
 577  0066               L21:
 578  0066 48            	sll	a
 579  0067 59            	rlc	x
 580  0068 905a          	dec	y
 581  006a 26fa          	jrne	L21
 582  006c               L01:
 583  006c b4e7          	and	a,_sendIntNumber$L-25
 584  006e 88            	push	a
 585  006f 9f            	ld	a,x
 586  0070 b4e6          	and	a,_sendIntNumber$L-26
 587  0072 97            	ld	x,a
 588  0073 84            	pop	a
 589  0074 4d            	tnz	a
 590  0075 2601          	jrne	L41
 591  0077 5d            	tnz	x
 592  0078               L41:
 593  0078 2704          	jreq	L513
 594                     ; 41 				_bres(PADR, 1);
 596  007a 1300          	bres	_PADR,#1
 598  007c 2002          	jra	L713
 599  007e               L513:
 600                     ; 45 				_bset(PADR, 1);
 602  007e 1200          	bset	_PADR,#1
 603  0080               L713:
 604                     ; 47 			arintTimeouts[i] = intTimeOut;
 606  0080 beff          	ld	x,_sendIntNumber$L-1
 607  0082 58            	sll	x
 608  0083 b6fd          	ld	a,_sendIntNumber$L-3
 609  0085 e7e8          	ld	(_sendIntNumber$L-24,x),a
 610  0087 b6fe          	ld	a,_sendIntNumber$L-2
 611  0089 e7e9          	ld	(_sendIntNumber$L-23,x),a
 612                     ; 23 		for(i=0; i<8;i++)
 614  008b 3cff          	inc	_sendIntNumber$L-1
 617  008d b6ff          	ld	a,_sendIntNumber$L-1
 618  008f a108          	cp	a,#8
 619  0091 2402          	jruge	L61
 620  0093 2091          	jp	L572
 621  0095               L61:
 622                     ; 50 		j++;
 624  0095 3cfb          	inc	_sendIntNumber$L-5
 625                     ; 51 	}while	(j<3);
 627  0097 b6fb          	ld	a,_sendIntNumber$L-5
 628  0099 a103          	cp	a,#3
 629  009b 2402          	jruge	L02
 630  009d 2085          	jp	L762
 631  009f               L02:
 632                     ; 53 	return (char) 1;
 634  009f a601          	ld	a,#1
 637  00a1 81            	ret
 649                     	xdef	_sendIntNumber
 668                     	end
