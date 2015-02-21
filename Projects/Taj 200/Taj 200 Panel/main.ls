   1                     ; C Compiler for ST7 (COSMIC Software)
   2                     ; Generator V4.4f - 27 May 2003
 416                     ; 9 void sleep(unsigned int iTime)
 416                     ; 10 {
 417                     	switch	.text
 419                     	xref.b	_sleep$L
 420  0000               _sleep:
 422  0000 b701          	ld	_sleep$L+1,a
 423  0002 bf00          	ld	_sleep$L,x
 425  0004 2008          	jra	L142
 426  0006               L732:
 427                     ; 13 		iTime--;
 429  0006 3d01          	tnz	_sleep$L+1
 430  0008 2602          	jrne	L6
 431  000a 3a00          	dec	_sleep$L
 432  000c               L6:
 433  000c 3a01          	dec	_sleep$L+1
 434  000e               L142:
 435                     ; 11 	while(iTime>0)
 437  000e b601          	ld	a,_sleep$L+1
 438  0010 ba00          	or	a,_sleep$L
 439  0012 26f2          	jrne	L732
 440                     ; 15 }
 443  0014 81            	ret
 469                     ; 18 @interrupt void itExt1(void)
 469                     ; 19 {
 470                     	switch	.text
 471  0015               _itExt1:
 473  0015 9089          	push	y
 474  0017 b601          	ld	a,c_x+1
 475  0019 88            	push	a
 476  001a b600          	ld	a,c_x
 477  001c 88            	push	a
 478  001d b601          	ld	a,c_y+1
 479  001f 88            	push	a
 480  0020 b600          	ld	a,c_y
 481  0022 88            	push	a
 484                     ; 38 	if (_btst(PADR, 4))
 486  0023 b600          	ld	a,_PADR
 487  0025 a510          	bcp	a,#16
 488  0027 2706          	jreq	L552
 489                     ; 40 		i = 0x01;
 491  0029 a601          	ld	a,#1
 492  002b b700          	ld	_i,a
 494  002d 2004          	jra	L752
 495  002f               L552:
 496                     ; 44 		i = 0x10;
 498  002f a610          	ld	a,#16
 499  0031 b700          	ld	_i,a
 500  0033               L752:
 501                     ; 46 	sleep(20);
 503  0033 5f            	clr	x
 504  0034 a614          	ld	a,#20
 505  0036 adc8          	call	_sleep
 507                     ; 47 	if (_btst(PADR, 4))
 509  0038 b600          	ld	a,_PADR
 510  003a a510          	bcp	a,#16
 511  003c 2704          	jreq	L162
 512                     ; 49 		i += 0x01;
 514  003e 3c00          	inc	_i
 516  0040 2006          	jra	L362
 517  0042               L162:
 518                     ; 53 		i += 0x10;
 520  0042 b600          	ld	a,_i
 521  0044 ab10          	add	a,#16
 522  0046 b700          	ld	_i,a
 523  0048               L362:
 524                     ; 56 	if (i==0x02)
 526  0048 b600          	ld	a,_i
 527  004a a102          	cp	a,#2
 528  004c 2606          	jrne	L562
 529                     ; 58 		left();
 531  004e a602          	ld	a,#2
 532  0050 b703          	ld	_PBDR,a
 535  0052 200a          	jra	L762
 536  0054               L562:
 537                     ; 61 	else if (i==0x20)
 539  0054 b600          	ld	a,_i
 540  0056 a120          	cp	a,#32
 541  0058 2604          	jrne	L762
 542                     ; 63 		right();
 544  005a a604          	ld	a,#4
 545  005c b703          	ld	_PBDR,a
 547  005e               L762:
 548                     ; 67 }
 551  005e 84            	pop	a
 552  005f b700          	ld	c_y,a
 553  0061 84            	pop	a
 554  0062 b701          	ld	c_y+1,a
 555  0064 84            	pop	a
 556  0065 b700          	ld	c_x,a
 557  0067 84            	pop	a
 558  0068 b701          	ld	c_x+1,a
 559  006a 9085          	pop	y
 560  006c 80            	iret
 584                     ; 69 @interrupt void itExt0(void)
 584                     ; 70 {
 585                     	switch	.text
 586  006d               _itExt0:
 590                     ; 71 	if(_btst(PADR, 0))
 592  006d b600          	ld	a,_PADR
 593  006f a501          	bcp	a,#1
 594  0071 2704          	jreq	L303
 595                     ; 73 		_bres(PBDR, 0);
 597  0073 1103          	bres	_PBDR,#0
 599  0075 2002          	jra	L503
 600  0077               L303:
 601                     ; 77 		_bset(PBDR, 0);
 603  0077 1003          	bset	_PBDR,#0
 604  0079               L503:
 605                     ; 79 }
 608  0079 80            	iret
 638                     ; 82 void init(void)
 638                     ; 83 {
 639                     	switch	.text
 640  007a               _init:
 643                     ; 90 	PADR 	= 0x00;       
 645  007a 3f00          	clr	_PADR
 646                     ; 91 	PADDR 	= 0x00; // 0,4,7 input
 648  007c 3f01          	clr	_PADDR
 649                     ; 92 	PAOR 	= 0xFF; // pull-up
 651  007e a6ff          	ld	a,#255
 652  0080 b702          	ld	_PAOR,a
 653                     ; 93 	PADR 	= 0x00;       
 655  0082 3f00          	clr	_PADR
 656                     ; 95 	PBDR 	= 0x00;  	
 658  0084 3f03          	clr	_PBDR
 659                     ; 96 	PBDDR 	= 0xFF;	// output
 661  0086 a6ff          	ld	a,#255
 662  0088 b704          	ld	_PBDDR,a
 663                     ; 97 	PBOR 	= 0xFF; // push-pull
 665  008a a6ff          	ld	a,#255
 666  008c b705          	ld	_PBOR,a
 667                     ; 98 	PBDR 	= 0x00;  	
 669  008e 3f03          	clr	_PBDR
 670                     ; 101 	EICR 	= 0b00000111;    //ei1=raising and falling edge
 672  0090 a607          	ld	a,#7
 673  0092 b737          	ld	_EICR,a
 674                     ; 103 	EnableInterrupts();
 677  0094 9a            rim
 679                     ; 104 }	
 682  0095 81            	ret
 706                     ; 107 void main(void)
 706                     ; 108 {
 707                     	switch	.text
 708  0096               _main:
 711                     ; 109 	init();
 713  0096 ade2          	call	_init
 715  0098               L723:
 716                     ; 112 		Nop();
 719  0098 9d            nop
 722  0099 20fd          	jra	L723
 745                     	xdef	_main
 746                     	xdef	_init
 747                     	xdef	_itExt0
 748                     	xdef	_itExt1
 749                     	xdef	_sleep
 750                     	switch	.ubsct
 751  0000               _i:
 752  0000 00            	ds.b	1
 753                     	xdef	_i
 754                     	xref.b	c_x
 755                     	xref.b	c_y
 775                     	end
