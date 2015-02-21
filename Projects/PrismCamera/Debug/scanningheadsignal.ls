   1                     ; C Compiler for ST7 (COSMIC Software)
   2                     ; Generator V4.5.5 - 12 Jan 2006
   3                     ; Optimizer V4.4.2 - 11 Jan 2006
 235                     ; 24 void scanningHeadSignalWaitEncoderZeroChannel(void)
 235                     ; 25 {
 236  0000               _scanningHeadSignalWaitEncoderZeroChannel:
 237  0000               L5:
 238                     ; 26 	while(_btst(_Pa_Encoder0, _Pin_Encoder0));
 239  0000 040ffd        	btjt	_PFDR,#2,L5
 241  0003               L31:
 242                     ; 27 	while(!_btst(_Pa_Encoder0, _Pin_Encoder0));
 243  0003 050ffd        	btjf	_PFDR,#2,L31
 244                     ; 28 }
 245  0006 81            	ret	
 246                     ; 31 void scanningHeadSignalWaitEncoder(void)
 246                     ; 32 {
 247  0007               _scanningHeadSignalWaitEncoder:
 248  0007 2001          	jra	L12
 249  0009               L71:
 250                     ; 40 		Nop();
 252  0009 9d            	nop	
 254  000a               L12:
 255                     ; 33 	while (!_btst(_Pa_EncoderAB, _Pin_EncoderAB))
 256  000a 0f0ffc        	btjf	_PFDR,#7,L71
 258  000d 2001          	jra	L72
 259  000f               L52:
 260                     ; 50 		Nop();
 262  000f 9d            	nop	
 264  0010               L72:
 265                     ; 42 	while (_btst(_Pa_EncoderAB, _Pin_EncoderAB))
 266  0010 0e0ffc        	btjt	_PFDR,#7,L52
 267                     ; 52 }
 268  0013 81            	ret	
 269                     ; 55 void scanningHeadSignalAcquireGate(void)
 269                     ; 56 {
 271                     	xref.b	_scanningHeadSignalAcquireGate$L
 272  0014               _scanningHeadSignalAcquireGate:
 273                     ; 57 	BYTE byGate				= false;
 274  0014 3ffe          	clr	_scanningHeadSignalAcquireGate$L-2
 275                     ; 58 	BYTE byPrevGate			= false;
 276  0016 3ffd          	clr	_scanningHeadSignalAcquireGate$L-3
 277                     ; 59 	BYTE byFoundIndex		= 0;
 278  0018 3fff          	clr	_scanningHeadSignalAcquireGate$L-1
 279                     ; 61 	BYTE i					= 16;
 280  001a a610          	ld	a,#16
 281  001c b7fc          	ld	_scanningHeadSignalAcquireGate$L-4,a
 282                     ; 63 	m_woEncoderGateStart 	= 0xFFFF;
 283  001e aeff          	ld	x,#255
 284  0020 cf002c        	ld	_m_woEncoderGateStart,x
 285  0023 a6ff          	ld	a,#255
 286  0025 c7002d        	ld	_m_woEncoderGateStart+1,a
 287                     ; 64 	m_woEncoderGateEnd 		= 0xFFFF;
 288  0028 cf002a        	ld	_m_woEncoderGateEnd,x
 289  002b c7002b        	ld	_m_woEncoderGateEnd+1,a
 290                     ; 66 	m_arbyEncoderSignals[0]	= 0x00;
 291  002e 4f            	clr	a
 292  002f c70022        	ld	_m_arbyEncoderSignals,a
 293  0032 c70023        	ld	_m_arbyEncoderSignals+1,a
 294                     ; 67 	m_arbyEncoderSignals[1]	= 0x00;
 295  0035 c70024        	ld	_m_arbyEncoderSignals+2,a
 296  0038 c70025        	ld	_m_arbyEncoderSignals+3,a
 297                     ; 68 	m_arbyEncoderSignals[2]	= 0x00;
 298  003b c70026        	ld	_m_arbyEncoderSignals+4,a
 299  003e c70027        	ld	_m_arbyEncoderSignals+5,a
 300                     ; 69 	m_arbyEncoderSignals[3]	= 0x00;
 301  0041 c70028        	ld	_m_arbyEncoderSignals+6,a
 302  0044 c70029        	ld	_m_arbyEncoderSignals+7,a
 304  0047 200a          	jra	L73
 305  0049               L33:
 306                     ; 73 		m_arbyEncoderGate[i] = 0x00;
 307  0049 befc          	ld	x,_scanningHeadSignalAcquireGate$L-4
 308  004b 58            	sll	x
 309  004c 4f            	clr	a
 310  004d d70002        	ld	(_m_arbyEncoderGate,x),a
 311  0050 d70003        	ld	(_m_arbyEncoderGate+1,x),a
 312  0053               L73:
 313                     ; 71 	while(i-->0)
 314  0053 b6fc          	ld	a,_scanningHeadSignalAcquireGate$L-4
 315  0055 3afc          	dec	_scanningHeadSignalAcquireGate$L-4
 316  0057 4d            	tnz	a
 317  0058 26ef          	jrne	L33
 319  005a               L54:
 320                     ; 77 	while(_btst(_Pa_Encoder0, _Pin_Encoder0)&& !displayIsKeyPress());
 321  005a 050f06        	btjf	_PFDR,#2,L55
 323  005d cd0000        	call	_displayIsKeyPress
 325  0060 4d            	tnz	a
 326  0061 27f7          	jreq	L54
 327  0063               L55:
 328                     ; 78 	while(!_btst(_Pa_Encoder0, _Pin_Encoder0)&& !displayIsKeyPress());
 329  0063 040f06        	btjt	_PFDR,#2,L16
 331  0066 cd0000        	call	_displayIsKeyPress
 333  0069 4d            	tnz	a
 334  006a 27f7          	jreq	L55
 335  006c               L16:
 336                     ; 80 	if (!displayIsKeyPress())
 337  006c cd0000        	call	_displayIsKeyPress
 339  006f 4d            	tnz	a
 340  0070 2703cc0394    	jrne	L36
 342  0075 cc0268        	jra	L76
 343  0078               L56:
 344                     ; 84 			if _btst(_Pa_Encoder0, _Pin_Encoder0)
 345  0078 050f79        	btjf	_PFDR,#2,L37
 347  007b               L77:
 348                     ; 86 				while((_Pa_EncoderAB & 0b10000100)==0b10000100); 	// Enc = 1 & Zero = 1
 349  007b b60f          	ld	a,_PFDR
 350  007d a484          	and	a,#132
 351  007f a184          	cp	a,#132
 352  0081 27f8          	jreq	L77
 353                     ; 87 				byPrevGate = byGate;
 354  0083 b6fe          	ld	a,_scanningHeadSignalAcquireGate$L-2
 355  0085 b7fd          	ld	_scanningHeadSignalAcquireGate$L-3,a
 357  0087               L701:
 358                     ; 88 				while((_Pa_EncoderAB & 0b10000100)==0b00000100); 	// Enc = 0 & Zero = 1
 359  0087 b60f          	ld	a,_PFDR
 360  0089 a484          	and	a,#132
 361  008b a104          	cp	a,#4
 362  008d 27f8          	jreq	L701
 363                     ; 89 				byGate = _btst(_Pa_Gate, _Pin_Gate);
 364  008f b603          	ld	a,_PBDR
 365  0091 a480          	and	a,#128
 366  0093 b7fe          	ld	_scanningHeadSignalAcquireGate$L-2,a
 368  0095               L711:
 369                     ; 90 				while((_Pa_EncoderAB & 0b10000100)==0b10000100); 	// Enc = 1 & Zero = 1
 370  0095 b60f          	ld	a,_PFDR
 371  0097 a484          	and	a,#132
 372  0099 a184          	cp	a,#132
 373  009b 27f8          	jreq	L711
 374                     ; 91 				m_arbyEncoderSignals[0]++;
 375  009d c60023        	ld	a,_m_arbyEncoderSignals+1
 376  00a0 ab01          	add	a,#1
 377  00a2 c70023        	ld	_m_arbyEncoderSignals+1,a
 378  00a5 c60022        	ld	a,_m_arbyEncoderSignals
 379  00a8 a900          	adc	a,#0
 380  00aa c70022        	ld	_m_arbyEncoderSignals,a
 382  00ad               L521:
 383                     ; 92 				while((_Pa_EncoderAB & 0b10000100)==0b00000100); 	// Enc = 0 & Zero = 1
 384  00ad b60f          	ld	a,_PFDR
 385  00af a484          	and	a,#132
 386  00b1 a104          	cp	a,#4
 387  00b3 27f8          	jreq	L521
 388                     ; 93 				if(byPrevGate != byGate)
 389  00b5 b6fd          	ld	a,_scanningHeadSignalAcquireGate$L-3
 390  00b7 b1fe          	cp	a,_scanningHeadSignalAcquireGate$L-2
 391  00b9 2739          	jreq	L37
 392                     ; 95 					m_arbyEncoderGate[byFoundIndex]   = m_arbyEncoderSignals[0];
 393  00bb beff          	ld	x,_scanningHeadSignalAcquireGate$L-1
 394  00bd 58            	sll	x
 395  00be c60022        	ld	a,_m_arbyEncoderSignals
 396  00c1 d70002        	ld	(_m_arbyEncoderGate,x),a
 397  00c4 c60023        	ld	a,_m_arbyEncoderSignals+1
 398  00c7 d70003        	ld	(_m_arbyEncoderGate+1,x),a
 399                     ; 96 					m_arbyEncoderGate[byFoundIndex+1] = m_arbyEncoderSignals[1];
 400  00ca c60024        	ld	a,_m_arbyEncoderSignals+2
 401  00cd d70004        	ld	(_m_arbyEncoderGate+2,x),a
 402  00d0 c60025        	ld	a,_m_arbyEncoderSignals+3
 403  00d3 d70005        	ld	(_m_arbyEncoderGate+3,x),a
 404                     ; 97 					m_arbyEncoderGate[byFoundIndex+2] = m_arbyEncoderSignals[2];
 405  00d6 c60026        	ld	a,_m_arbyEncoderSignals+4
 406  00d9 d70006        	ld	(_m_arbyEncoderGate+4,x),a
 407  00dc c60027        	ld	a,_m_arbyEncoderSignals+5
 408  00df d70007        	ld	(_m_arbyEncoderGate+5,x),a
 409                     ; 98 					m_arbyEncoderGate[byFoundIndex+3] = m_arbyEncoderSignals[3];
 410  00e2 c60028        	ld	a,_m_arbyEncoderSignals+6
 411  00e5 d70008        	ld	(_m_arbyEncoderGate+6,x),a
 412  00e8 c60029        	ld	a,_m_arbyEncoderSignals+7
 413  00eb d70009        	ld	(_m_arbyEncoderGate+7,x),a
 414                     ; 99 					byFoundIndex+=4;
 415  00ee b6ff          	ld	a,_scanningHeadSignalAcquireGate$L-1
 416  00f0 ab04          	add	a,#4
 417  00f2 b7ff          	ld	_scanningHeadSignalAcquireGate$L-1,a
 418  00f4               L37:
 419                     ; 103 			if _btst(_Pa_Encoder0, _Pin_Encoder0)
 420  00f4 050f79        	btjf	_PFDR,#2,L331
 422  00f7               L731:
 423                     ; 105 				while((_Pa_EncoderAB & 0b10000100)==0b10000100); 	// Enc = 1 & Zero = 1
 424  00f7 b60f          	ld	a,_PFDR
 425  00f9 a484          	and	a,#132
 426  00fb a184          	cp	a,#132
 427  00fd 27f8          	jreq	L731
 428                     ; 106 				byPrevGate = byGate;
 429  00ff b6fe          	ld	a,_scanningHeadSignalAcquireGate$L-2
 430  0101 b7fd          	ld	_scanningHeadSignalAcquireGate$L-3,a
 432  0103               L741:
 433                     ; 107 				while((_Pa_EncoderAB & 0b10000100)==0b00000100); 	// Enc = 0 & Zero = 1
 434  0103 b60f          	ld	a,_PFDR
 435  0105 a484          	and	a,#132
 436  0107 a104          	cp	a,#4
 437  0109 27f8          	jreq	L741
 438                     ; 108 				byGate = _btst(_Pa_Gate, _Pin_Gate);
 439  010b b603          	ld	a,_PBDR
 440  010d a480          	and	a,#128
 441  010f b7fe          	ld	_scanningHeadSignalAcquireGate$L-2,a
 443  0111               L751:
 444                     ; 109 				while((_Pa_EncoderAB & 0b10000100)==0b10000100); 	// Enc = 1 & Zero = 1
 445  0111 b60f          	ld	a,_PFDR
 446  0113 a484          	and	a,#132
 447  0115 a184          	cp	a,#132
 448  0117 27f8          	jreq	L751
 449                     ; 110 				m_arbyEncoderSignals[1]++;
 450  0119 c60025        	ld	a,_m_arbyEncoderSignals+3
 451  011c ab01          	add	a,#1
 452  011e c70025        	ld	_m_arbyEncoderSignals+3,a
 453  0121 c60024        	ld	a,_m_arbyEncoderSignals+2
 454  0124 a900          	adc	a,#0
 455  0126 c70024        	ld	_m_arbyEncoderSignals+2,a
 457  0129               L561:
 458                     ; 111 				while((_Pa_EncoderAB & 0b10000100)==0b00000100); 	// Enc = 0 & Zero = 1
 459  0129 b60f          	ld	a,_PFDR
 460  012b a484          	and	a,#132
 461  012d a104          	cp	a,#4
 462  012f 27f8          	jreq	L561
 463                     ; 112 				if(byPrevGate != byGate)
 464  0131 b6fd          	ld	a,_scanningHeadSignalAcquireGate$L-3
 465  0133 b1fe          	cp	a,_scanningHeadSignalAcquireGate$L-2
 466  0135 2739          	jreq	L331
 467                     ; 114 					m_arbyEncoderGate[byFoundIndex]   = m_arbyEncoderSignals[0];
 468  0137 beff          	ld	x,_scanningHeadSignalAcquireGate$L-1
 469  0139 58            	sll	x
 470  013a c60022        	ld	a,_m_arbyEncoderSignals
 471  013d d70002        	ld	(_m_arbyEncoderGate,x),a
 472  0140 c60023        	ld	a,_m_arbyEncoderSignals+1
 473  0143 d70003        	ld	(_m_arbyEncoderGate+1,x),a
 474                     ; 115 					m_arbyEncoderGate[byFoundIndex+1] = m_arbyEncoderSignals[1];
 475  0146 c60024        	ld	a,_m_arbyEncoderSignals+2
 476  0149 d70004        	ld	(_m_arbyEncoderGate+2,x),a
 477  014c c60025        	ld	a,_m_arbyEncoderSignals+3
 478  014f d70005        	ld	(_m_arbyEncoderGate+3,x),a
 479                     ; 116 					m_arbyEncoderGate[byFoundIndex+2] = m_arbyEncoderSignals[2];
 480  0152 c60026        	ld	a,_m_arbyEncoderSignals+4
 481  0155 d70006        	ld	(_m_arbyEncoderGate+4,x),a
 482  0158 c60027        	ld	a,_m_arbyEncoderSignals+5
 483  015b d70007        	ld	(_m_arbyEncoderGate+5,x),a
 484                     ; 117 					m_arbyEncoderGate[byFoundIndex+3] = m_arbyEncoderSignals[3];
 485  015e c60028        	ld	a,_m_arbyEncoderSignals+6
 486  0161 d70008        	ld	(_m_arbyEncoderGate+6,x),a
 487  0164 c60029        	ld	a,_m_arbyEncoderSignals+7
 488  0167 d70009        	ld	(_m_arbyEncoderGate+7,x),a
 489                     ; 118 					byFoundIndex+=4;
 490  016a b6ff          	ld	a,_scanningHeadSignalAcquireGate$L-1
 491  016c ab04          	add	a,#4
 492  016e b7ff          	ld	_scanningHeadSignalAcquireGate$L-1,a
 493  0170               L331:
 494                     ; 122 			if _btst(_Pa_Encoder0, _Pin_Encoder0)
 495  0170 050f79        	btjf	_PFDR,#2,L371
 497  0173               L771:
 498                     ; 124 				while((_Pa_EncoderAB & 0b10000100)==0b10000100); 	// Enc = 1 & Zero = 1
 499  0173 b60f          	ld	a,_PFDR
 500  0175 a484          	and	a,#132
 501  0177 a184          	cp	a,#132
 502  0179 27f8          	jreq	L771
 503                     ; 125 				byPrevGate = byGate;
 504  017b b6fe          	ld	a,_scanningHeadSignalAcquireGate$L-2
 505  017d b7fd          	ld	_scanningHeadSignalAcquireGate$L-3,a
 507  017f               L702:
 508                     ; 126 				while((_Pa_EncoderAB & 0b10000100)==0b00000100); 	// Enc = 0 & Zero = 1
 509  017f b60f          	ld	a,_PFDR
 510  0181 a484          	and	a,#132
 511  0183 a104          	cp	a,#4
 512  0185 27f8          	jreq	L702
 513                     ; 127 				byGate = _btst(_Pa_Gate, _Pin_Gate);
 514  0187 b603          	ld	a,_PBDR
 515  0189 a480          	and	a,#128
 516  018b b7fe          	ld	_scanningHeadSignalAcquireGate$L-2,a
 518  018d               L712:
 519                     ; 128 				while((_Pa_EncoderAB & 0b10000100)==0b10000100); 	// Enc = 1 & Zero = 1
 520  018d b60f          	ld	a,_PFDR
 521  018f a484          	and	a,#132
 522  0191 a184          	cp	a,#132
 523  0193 27f8          	jreq	L712
 524                     ; 129 				m_arbyEncoderSignals[2]++;
 525  0195 c60027        	ld	a,_m_arbyEncoderSignals+5
 526  0198 ab01          	add	a,#1
 527  019a c70027        	ld	_m_arbyEncoderSignals+5,a
 528  019d c60026        	ld	a,_m_arbyEncoderSignals+4
 529  01a0 a900          	adc	a,#0
 530  01a2 c70026        	ld	_m_arbyEncoderSignals+4,a
 532  01a5               L522:
 533                     ; 130 				while((_Pa_EncoderAB & 0b10000100)==0b00000100); 	// Enc = 0 & Zero = 1
 534  01a5 b60f          	ld	a,_PFDR
 535  01a7 a484          	and	a,#132
 536  01a9 a104          	cp	a,#4
 537  01ab 27f8          	jreq	L522
 538                     ; 131 				if(byPrevGate != byGate)
 539  01ad b6fd          	ld	a,_scanningHeadSignalAcquireGate$L-3
 540  01af b1fe          	cp	a,_scanningHeadSignalAcquireGate$L-2
 541  01b1 2739          	jreq	L371
 542                     ; 133 					m_arbyEncoderGate[byFoundIndex]   = m_arbyEncoderSignals[0];
 543  01b3 beff          	ld	x,_scanningHeadSignalAcquireGate$L-1
 544  01b5 58            	sll	x
 545  01b6 c60022        	ld	a,_m_arbyEncoderSignals
 546  01b9 d70002        	ld	(_m_arbyEncoderGate,x),a
 547  01bc c60023        	ld	a,_m_arbyEncoderSignals+1
 548  01bf d70003        	ld	(_m_arbyEncoderGate+1,x),a
 549                     ; 134 					m_arbyEncoderGate[byFoundIndex+1] = m_arbyEncoderSignals[1];
 550  01c2 c60024        	ld	a,_m_arbyEncoderSignals+2
 551  01c5 d70004        	ld	(_m_arbyEncoderGate+2,x),a
 552  01c8 c60025        	ld	a,_m_arbyEncoderSignals+3
 553  01cb d70005        	ld	(_m_arbyEncoderGate+3,x),a
 554                     ; 135 					m_arbyEncoderGate[byFoundIndex+2] = m_arbyEncoderSignals[2];
 555  01ce c60026        	ld	a,_m_arbyEncoderSignals+4
 556  01d1 d70006        	ld	(_m_arbyEncoderGate+4,x),a
 557  01d4 c60027        	ld	a,_m_arbyEncoderSignals+5
 558  01d7 d70007        	ld	(_m_arbyEncoderGate+5,x),a
 559                     ; 136 					m_arbyEncoderGate[byFoundIndex+3] = m_arbyEncoderSignals[3];
 560  01da c60028        	ld	a,_m_arbyEncoderSignals+6
 561  01dd d70008        	ld	(_m_arbyEncoderGate+6,x),a
 562  01e0 c60029        	ld	a,_m_arbyEncoderSignals+7
 563  01e3 d70009        	ld	(_m_arbyEncoderGate+7,x),a
 564                     ; 137 					byFoundIndex+=4;
 565  01e6 b6ff          	ld	a,_scanningHeadSignalAcquireGate$L-1
 566  01e8 ab04          	add	a,#4
 567  01ea b7ff          	ld	_scanningHeadSignalAcquireGate$L-1,a
 568  01ec               L371:
 569                     ; 141 			if _btst(_Pa_Encoder0, _Pin_Encoder0)
 570  01ec 050f79        	btjf	_PFDR,#2,L76
 572  01ef               L732:
 573                     ; 143 				while((_Pa_EncoderAB & 0b10000100)==0b10000100); 	// Enc = 1 & Zero = 1
 574  01ef b60f          	ld	a,_PFDR
 575  01f1 a484          	and	a,#132
 576  01f3 a184          	cp	a,#132
 577  01f5 27f8          	jreq	L732
 578                     ; 144 				byPrevGate = byGate;
 579  01f7 b6fe          	ld	a,_scanningHeadSignalAcquireGate$L-2
 580  01f9 b7fd          	ld	_scanningHeadSignalAcquireGate$L-3,a
 582  01fb               L742:
 583                     ; 145 				while((_Pa_EncoderAB & 0b10000100)==0b00000100); 	// Enc = 0 & Zero = 1
 584  01fb b60f          	ld	a,_PFDR
 585  01fd a484          	and	a,#132
 586  01ff a104          	cp	a,#4
 587  0201 27f8          	jreq	L742
 588                     ; 146 				byGate = _btst(_Pa_Gate, _Pin_Gate);
 589  0203 b603          	ld	a,_PBDR
 590  0205 a480          	and	a,#128
 591  0207 b7fe          	ld	_scanningHeadSignalAcquireGate$L-2,a
 593  0209               L752:
 594                     ; 147 				while((_Pa_EncoderAB & 0b10000100)==0b10000100); 	// Enc = 1 & Zero = 1
 595  0209 b60f          	ld	a,_PFDR
 596  020b a484          	and	a,#132
 597  020d a184          	cp	a,#132
 598  020f 27f8          	jreq	L752
 599                     ; 148 				m_arbyEncoderSignals[3]++;
 600  0211 c60029        	ld	a,_m_arbyEncoderSignals+7
 601  0214 ab01          	add	a,#1
 602  0216 c70029        	ld	_m_arbyEncoderSignals+7,a
 603  0219 c60028        	ld	a,_m_arbyEncoderSignals+6
 604  021c a900          	adc	a,#0
 605  021e c70028        	ld	_m_arbyEncoderSignals+6,a
 607  0221               L562:
 608                     ; 149 				while((_Pa_EncoderAB & 0b10000100)==0b00000100); 	// Enc = 0 & Zero = 1
 609  0221 b60f          	ld	a,_PFDR
 610  0223 a484          	and	a,#132
 611  0225 a104          	cp	a,#4
 612  0227 27f8          	jreq	L562
 613                     ; 150 				if(byPrevGate != byGate)
 614  0229 b6fd          	ld	a,_scanningHeadSignalAcquireGate$L-3
 615  022b b1fe          	cp	a,_scanningHeadSignalAcquireGate$L-2
 616  022d 2739          	jreq	L76
 617                     ; 152 					m_arbyEncoderGate[byFoundIndex]   = m_arbyEncoderSignals[0];
 618  022f beff          	ld	x,_scanningHeadSignalAcquireGate$L-1
 619  0231 58            	sll	x
 620  0232 c60022        	ld	a,_m_arbyEncoderSignals
 621  0235 d70002        	ld	(_m_arbyEncoderGate,x),a
 622  0238 c60023        	ld	a,_m_arbyEncoderSignals+1
 623  023b d70003        	ld	(_m_arbyEncoderGate+1,x),a
 624                     ; 153 					m_arbyEncoderGate[byFoundIndex+1] = m_arbyEncoderSignals[1];
 625  023e c60024        	ld	a,_m_arbyEncoderSignals+2
 626  0241 d70004        	ld	(_m_arbyEncoderGate+2,x),a
 627  0244 c60025        	ld	a,_m_arbyEncoderSignals+3
 628  0247 d70005        	ld	(_m_arbyEncoderGate+3,x),a
 629                     ; 154 					m_arbyEncoderGate[byFoundIndex+2] = m_arbyEncoderSignals[2];
 630  024a c60026        	ld	a,_m_arbyEncoderSignals+4
 631  024d d70006        	ld	(_m_arbyEncoderGate+4,x),a
 632  0250 c60027        	ld	a,_m_arbyEncoderSignals+5
 633  0253 d70007        	ld	(_m_arbyEncoderGate+5,x),a
 634                     ; 155 					m_arbyEncoderGate[byFoundIndex+3] = m_arbyEncoderSignals[3];
 635  0256 c60028        	ld	a,_m_arbyEncoderSignals+6
 636  0259 d70008        	ld	(_m_arbyEncoderGate+6,x),a
 637  025c c60029        	ld	a,_m_arbyEncoderSignals+7
 638  025f d70009        	ld	(_m_arbyEncoderGate+7,x),a
 639                     ; 156 					byFoundIndex+=4;
 640  0262 b6ff          	ld	a,_scanningHeadSignalAcquireGate$L-1
 641  0264 ab04          	add	a,#4
 642  0266 b7ff          	ld	_scanningHeadSignalAcquireGate$L-1,a
 643  0268               L76:
 644                     ; 82 		while (_btst(_Pa_Encoder0, _Pin_Encoder0))
 645  0268 050f03cc0078  	btjt	_PFDR,#2,L56
 646                     ; 162 		i=4;
 647  026e a604          	ld	a,#4
 648  0270 b7fc          	ld	_scanningHeadSignalAcquireGate$L-4,a
 649                     ; 163 		m_woEncoderGateEnd = 0x0000;
 650  0272 4f            	clr	a
 651  0273 c7002a        	ld	_m_woEncoderGateEnd,a
 652  0276 c7002b        	ld	_m_woEncoderGateEnd+1,a
 654  0279 2017          	jra	L772
 655  027b               L372:
 656                     ; 166 			m_woEncoderGateEnd += (WORD) m_arbyEncoderGate[--byFoundIndex];
 657  027b 3aff          	dec	_scanningHeadSignalAcquireGate$L-1
 658  027d beff          	ld	x,_scanningHeadSignalAcquireGate$L-1
 659  027f 58            	sll	x
 660  0280 c6002b        	ld	a,_m_woEncoderGateEnd+1
 661  0283 db0003        	add	a,(_m_arbyEncoderGate+1,x)
 662  0286 c7002b        	ld	_m_woEncoderGateEnd+1,a
 663  0289 c6002a        	ld	a,_m_woEncoderGateEnd
 664  028c d90002        	adc	a,(_m_arbyEncoderGate,x)
 665  028f c7002a        	ld	_m_woEncoderGateEnd,a
 666  0292               L772:
 667                     ; 164 		while(i-->0)
 668  0292 b6fc          	ld	a,_scanningHeadSignalAcquireGate$L-4
 669  0294 3afc          	dec	_scanningHeadSignalAcquireGate$L-4
 670  0296 4d            	tnz	a
 671  0297 26e2          	jrne	L372
 672                     ; 168 		i=4;
 673  0299 a604          	ld	a,#4
 674  029b b7fc          	ld	_scanningHeadSignalAcquireGate$L-4,a
 675                     ; 169 		m_woEncoderGateStart = 0x0000;
 676  029d 4f            	clr	a
 677  029e c7002c        	ld	_m_woEncoderGateStart,a
 678  02a1 c7002d        	ld	_m_woEncoderGateStart+1,a
 680  02a4 2017          	jra	L703
 681  02a6               L303:
 682                     ; 172 			m_woEncoderGateStart += (WORD) m_arbyEncoderGate[--byFoundIndex];
 683  02a6 3aff          	dec	_scanningHeadSignalAcquireGate$L-1
 684  02a8 beff          	ld	x,_scanningHeadSignalAcquireGate$L-1
 685  02aa 58            	sll	x
 686  02ab c6002d        	ld	a,_m_woEncoderGateStart+1
 687  02ae db0003        	add	a,(_m_arbyEncoderGate+1,x)
 688  02b1 c7002d        	ld	_m_woEncoderGateStart+1,a
 689  02b4 c6002c        	ld	a,_m_woEncoderGateStart
 690  02b7 d90002        	adc	a,(_m_arbyEncoderGate,x)
 691  02ba c7002c        	ld	_m_woEncoderGateStart,a
 692  02bd               L703:
 693                     ; 170 		while(i-->0)
 694  02bd b6fc          	ld	a,_scanningHeadSignalAcquireGate$L-4
 695  02bf 3afc          	dec	_scanningHeadSignalAcquireGate$L-4
 696  02c1 4d            	tnz	a
 697  02c2 26e2          	jrne	L303
 698                     ; 175 		m_woEncoderGateWidth = MIN(m_woEncoderGateEnd-m_woEncoderGateStart, ENCODER_PULSES-m_woEncoderGateEnd+m_woEncoderGateStart);
 699  02c4 c6002b        	ld	a,_m_woEncoderGateEnd+1
 700  02c7 c0002d        	sub	a,_m_woEncoderGateStart+1
 701  02ca b7fb          	ld	_scanningHeadSignalAcquireGate$L-5,a
 702  02cc c6002a        	ld	a,_m_woEncoderGateEnd
 703  02cf c2002c        	sbc	a,_m_woEncoderGateStart
 704  02d2 b7fa          	ld	_scanningHeadSignalAcquireGate$L-6,a
 705  02d4 ae04          	ld	x,#4
 706  02d6 4f            	clr	a
 707  02d7 c0002b        	sub	a,_m_woEncoderGateEnd+1
 708  02da 88            	push	a
 709  02db 9f            	ld	a,x
 710  02dc c2002a        	sbc	a,_m_woEncoderGateEnd
 711  02df 97            	ld	x,a
 712  02e0 84            	pop	a
 713  02e1 cb002d        	add	a,_m_woEncoderGateStart+1
 714  02e4 88            	push	a
 715  02e5 9f            	ld	a,x
 716  02e6 c9002c        	adc	a,_m_woEncoderGateStart
 717  02e9 97            	ld	x,a
 718  02ea 84            	pop	a
 719  02eb b0fb          	sub	a,_scanningHeadSignalAcquireGate$L-5
 720  02ed 9f            	ld	a,x
 721  02ee b2fa          	sbc	a,_scanningHeadSignalAcquireGate$L-6
 722  02f0 2417          	jruge	L01
 723  02f2 ae04          	ld	x,#4
 724  02f4 4f            	clr	a
 725  02f5 c0002b        	sub	a,_m_woEncoderGateEnd+1
 726  02f8 88            	push	a
 727  02f9 9f            	ld	a,x
 728  02fa c2002a        	sbc	a,_m_woEncoderGateEnd
 729  02fd 97            	ld	x,a
 730  02fe 84            	pop	a
 731  02ff cb002d        	add	a,_m_woEncoderGateStart+1
 732  0302 88            	push	a
 733  0303 9f            	ld	a,x
 734  0304 c9002c        	adc	a,_m_woEncoderGateStart
 735  0307 200d          	jra	L21
 736  0309               L01:
 737  0309 c6002b        	ld	a,_m_woEncoderGateEnd+1
 738  030c c0002d        	sub	a,_m_woEncoderGateStart+1
 739  030f 88            	push	a
 740  0310 c6002a        	ld	a,_m_woEncoderGateEnd
 741  0313 c2002c        	sbc	a,_m_woEncoderGateStart
 742  0316               L21:
 743  0316 97            	ld	x,a
 744  0317 84            	pop	a
 745  0318 c70001        	ld	_m_woEncoderGateWidth+1,a
 746  031b cf0000        	ld	_m_woEncoderGateWidth,x
 747                     ; 178 		if(m_woEncoderGateEnd-m_woEncoderGateStart>(ENCODER_PULSES-m_woEncoderGateEnd+m_woEncoderGateStart) &(ENCODER_PULSES-1))
 748  031e c6002b        	ld	a,_m_woEncoderGateEnd+1
 749  0321 c0002d        	sub	a,_m_woEncoderGateStart+1
 750  0324 b7fb          	ld	_scanningHeadSignalAcquireGate$L-5,a
 751  0326 c6002a        	ld	a,_m_woEncoderGateEnd
 752  0329 c2002c        	sbc	a,_m_woEncoderGateStart
 753  032c b7fa          	ld	_scanningHeadSignalAcquireGate$L-6,a
 754  032e ae04          	ld	x,#4
 755  0330 4f            	clr	a
 756  0331 c0002b        	sub	a,_m_woEncoderGateEnd+1
 757  0334 88            	push	a
 758  0335 9f            	ld	a,x
 759  0336 c2002a        	sbc	a,_m_woEncoderGateEnd
 760  0339 97            	ld	x,a
 761  033a 84            	pop	a
 762  033b cb002d        	add	a,_m_woEncoderGateStart+1
 763  033e 88            	push	a
 764  033f 9f            	ld	a,x
 765  0340 c9002c        	adc	a,_m_woEncoderGateStart
 766  0343 97            	ld	x,a
 767  0344 84            	pop	a
 768  0345 b0fb          	sub	a,_scanningHeadSignalAcquireGate$L-5
 769  0347 9f            	ld	a,x
 770  0348 b2fa          	sbc	a,_scanningHeadSignalAcquireGate$L-6
 771  034a 2404          	jruge	L41
 772  034c a601          	ld	a,#1
 773  034e 2001          	jra	L61
 774  0350               L41:
 775  0350 4f            	clr	a
 776  0351               L61:
 777  0351 a5ff          	bcp	a,#255
 778  0353 271b          	jreq	L313
 779                     ; 180 			m_woEncoderGateStart = m_woEncoderGateEnd;
 780  0355 ce002a        	ld	x,_m_woEncoderGateEnd
 781  0358 cf002c        	ld	_m_woEncoderGateStart,x
 782  035b c6002b        	ld	a,_m_woEncoderGateEnd+1
 783  035e c7002d        	ld	_m_woEncoderGateStart+1,a
 784                     ; 181 			m_woEncoderGateEnd = (m_woEncoderGateEnd+m_woEncoderGateWidth)&(ENCODER_PULSES-1);
 785  0361 cb0001        	add	a,_m_woEncoderGateWidth+1
 786  0364 c7002b        	ld	_m_woEncoderGateEnd+1,a
 787  0367 9f            	ld	a,x
 788  0368 c90000        	adc	a,_m_woEncoderGateWidth
 789  036b a403          	and	a,#3
 790  036d c7002a        	ld	_m_woEncoderGateEnd,a
 791  0370               L313:
 792                     ; 184 		m_woEncoderGateStart = (ENCODER_PULSES + m_woEncoderGateStart - 8) &(ENCODER_PULSES-1);
 793  0370 c6002d        	ld	a,_m_woEncoderGateStart+1
 794  0373 abf8          	add	a,#248
 795  0375 c7002d        	ld	_m_woEncoderGateStart+1,a
 796  0378 c6002c        	ld	a,_m_woEncoderGateStart
 797  037b a903          	adc	a,#3
 798  037d a403          	and	a,#3
 799  037f c7002c        	ld	_m_woEncoderGateStart,a
 800                     ; 185 		m_woEncoderGateEnd = (ENCODER_PULSES + m_woEncoderGateEnd - 8)&(ENCODER_PULSES-1);
 801  0382 c6002b        	ld	a,_m_woEncoderGateEnd+1
 802  0385 abf8          	add	a,#248
 803  0387 c7002b        	ld	_m_woEncoderGateEnd+1,a
 804  038a c6002a        	ld	a,_m_woEncoderGateEnd
 805  038d a903          	adc	a,#3
 806  038f a403          	and	a,#3
 807  0391 c7002a        	ld	_m_woEncoderGateEnd,a
 808  0394               L36:
 809                     ; 188 }
 810  0394 81            	ret	
 811                     ; 192 void scanningHeadSignalAcquire(void)
 811                     ; 193 {
 812                     	switch	.text
 814                     	xref.b	_scanningHeadSignalAcquire$L
 815  0395               _scanningHeadSignalAcquire:
 816                     ; 194 	BYTE byScanningHeadValue	  = 0x00;;
 817  0395 3fff          	clr	_scanningHeadSignalAcquire$L-1
 818                     ; 195 	m_byScanningHeadSignalPointer = m_arbyScanningHeadSignal;
 819  0397 ae31          	ld	x,#high(_m_arbyScanningHeadSignal)
 820  0399 cf002f        	ld	_m_byScanningHeadSignalPointer,x
 821  039c a631          	ld	a,#low(_m_arbyScanningHeadSignal)
 822  039e c70030        	ld	_m_byScanningHeadSignalPointer+1,a
 824  03a1               L123:
 825                     ; 197 	while(_btst(_Pa_Encoder0, _Pin_Encoder0) && !displayIsKeyPress());
 826  03a1 050f06        	btjf	_PFDR,#2,L133
 828  03a4 cd0000        	call	_displayIsKeyPress
 830  03a7 4d            	tnz	a
 831  03a8 27f7          	jreq	L123
 832  03aa               L133:
 833                     ; 198 	while(!_btst(_Pa_Encoder0, _Pin_Encoder0)&& !displayIsKeyPress());
 834  03aa 040f06        	btjt	_PFDR,#2,L533
 836  03ad cd0000        	call	_displayIsKeyPress
 838  03b0 4d            	tnz	a
 839  03b1 27f7          	jreq	L133
 840  03b3               L533:
 841                     ; 200 	if (!displayIsKeyPress())
 842  03b3 cd0000        	call	_displayIsKeyPress
 844  03b6 4d            	tnz	a
 845  03b7 2703cc04dc    	jrne	L733
 847  03bc cc04d6        	jra	L343
 848  03bf               L143:
 849                     ; 204 			if _btst(_Pa_Encoder0, _Pin_Encoder0)
 850  03bf 050f5b        	btjf	_PFDR,#2,L743
 851                     ; 206 				ADCCSR = ADSPEED | ADON | _Ain_S1Analogic; //PF4							// enables the A/D peripheral on Scanning Head
 852  03c2 a66a          	ld	a,#106
 853  03c4 b770          	ld	_ADCCSR,a
 855  03c6               L553:
 856                     ; 207 				while((_Pa_EncoderAB & 0b10000100)==0b10000100); 				// Enc = 1 & Zero = 1
 857  03c6 b60f          	ld	a,_PFDR
 858  03c8 a484          	and	a,#132
 859  03ca a184          	cp	a,#132
 860  03cc 27f8          	jreq	L553
 861                     ; 208 				m_byScanningHeadValue += (byScanningHeadValue & 0b11000000)>>6;
 862  03ce b6ff          	ld	a,_scanningHeadSignalAcquire$L-1
 863  03d0 4e            	swap	a
 864  03d1 a40c          	and	a,#12
 865  03d3 44            	srl	a
 866  03d4 44            	srl	a
 867  03d5 cb002e        	add	a,_m_byScanningHeadValue
 868  03d8 c7002e        	ld	_m_byScanningHeadValue,a
 870  03db               L363:
 871                     ; 209 				while((_Pa_EncoderAB & 0b10000100)==0b00000100); 				// Enc = 0 & Zero = 1
 872  03db b60f          	ld	a,_PFDR
 873  03dd a484          	and	a,#132
 874  03df a104          	cp	a,#4
 875  03e1 27f8          	jreq	L363
 876                     ; 210 				(*m_byScanningHeadSignalPointer) = m_byScanningHeadValue;
 877  03e3 c6002f        	ld	a,_m_byScanningHeadSignalPointer
 878  03e6 b700          	ld	c_x,a
 879  03e8 c60030        	ld	a,_m_byScanningHeadSignalPointer+1
 880  03eb b701          	ld	c_x+1,a
 881  03ed c6002e        	ld	a,_m_byScanningHeadValue
 882  03f0 92c700        	ld	[c_x.w],a
 884  03f3               L373:
 885                     ; 211 				while((_Pa_EncoderAB & 0b10000100)==0b10000100); 				// Enc = 1 & Zero = 1
 886  03f3 b60f          	ld	a,_PFDR
 887  03f5 a484          	and	a,#132
 888  03f7 a184          	cp	a,#132
 889  03f9 27f8          	jreq	L373
 890                     ; 212 				m_byScanningHeadSignalPointer++;			
 891  03fb c60030        	ld	a,_m_byScanningHeadSignalPointer+1
 892  03fe ab01          	add	a,#1
 893  0400 c70030        	ld	_m_byScanningHeadSignalPointer+1,a
 894  0403 c6002f        	ld	a,_m_byScanningHeadSignalPointer
 895  0406 a900          	adc	a,#0
 896  0408 c7002f        	ld	_m_byScanningHeadSignalPointer,a
 898  040b               L104:
 899                     ; 213 				while((_Pa_EncoderAB & 0b10000100)==0b00000100); 				// Enc = 0 & Zero = 1
 900  040b b60f          	ld	a,_PFDR
 901  040d a484          	and	a,#132
 902  040f a104          	cp	a,#4
 903  0411 27f8          	jreq	L104
 905  0413               L704:
 906                     ; 214 				while(!(ADCCSR & EOC)&& (_btst(_Pa_Encoder0, _Pin_Encoder0)));	// waits for the end of the conversion
 907  0413 0e7003        	btjt	_ADCCSR,#7,L314
 909  0416 040ffa        	btjt	_PFDR,#2,L704
 910  0419               L314:
 911                     ; 215 				byScanningHeadValue = ADCDRH;
 912  0419 b671          	ld	a,_ADCDRH
 913  041b b7ff          	ld	_scanningHeadSignalAcquire$L-1,a
 914  041d               L743:
 915                     ; 218 			if _btst(_Pa_Encoder0, _Pin_Encoder0)
 916  041d 050f35        	btjf	_PFDR,#2,L514
 917                     ; 220 				ADCCSR = ADSPEED | ADON | _Ain_S1Analogic; //PF4							// enables the A/D peripheral on Scanning Head
 918  0420 a66a          	ld	a,#106
 919  0422 b770          	ld	_ADCCSR,a
 921  0424               L324:
 922                     ; 221 				while((_Pa_EncoderAB & 0b10000100)==0b10000100); 				// Enc = 1 & Zero = 1
 923  0424 b60f          	ld	a,_PFDR
 924  0426 a484          	and	a,#132
 925  0428 a184          	cp	a,#132
 926  042a 27f8          	jreq	L324
 927                     ; 222 				m_byScanningHeadValue = byScanningHeadValue & 0b11000000;
 928  042c b6ff          	ld	a,_scanningHeadSignalAcquire$L-1
 929  042e a4c0          	and	a,#192
 930  0430 c7002e        	ld	_m_byScanningHeadValue,a
 932  0433               L334:
 933                     ; 223 				while((_Pa_EncoderAB & 0b10000100)==0b00000100); 				// Enc = 0 & Zero = 1
 934  0433 b60f          	ld	a,_PFDR
 935  0435 a484          	and	a,#132
 936  0437 a104          	cp	a,#4
 937  0439 27f8          	jreq	L334
 939  043b               L144:
 940                     ; 224 				while((_Pa_EncoderAB & 0b10000100)==0b10000100); 				// Enc = 1 & Zero = 1
 941  043b b60f          	ld	a,_PFDR
 942  043d a484          	and	a,#132
 943  043f a184          	cp	a,#132
 944  0441 27f8          	jreq	L144
 946  0443               L744:
 947                     ; 225 				while((_Pa_EncoderAB & 0b10000100)==0b00000100); 				// Enc = 0 & Zero = 1
 948  0443 b60f          	ld	a,_PFDR
 949  0445 a484          	and	a,#132
 950  0447 a104          	cp	a,#4
 951  0449 27f8          	jreq	L744
 953  044b               L554:
 954                     ; 226 				while(!(ADCCSR & EOC)&& (_btst(_Pa_Encoder0, _Pin_Encoder0)));	// waits for the end of the conversion
 955  044b 0e7003        	btjt	_ADCCSR,#7,L164
 957  044e 040ffa        	btjt	_PFDR,#2,L554
 958  0451               L164:
 959                     ; 227 				byScanningHeadValue = ADCDRH;
 960  0451 b671          	ld	a,_ADCDRH
 961  0453 b7ff          	ld	_scanningHeadSignalAcquire$L-1,a
 962  0455               L514:
 963                     ; 230 			if _btst(_Pa_Encoder0, _Pin_Encoder0)
 964  0455 050f3e        	btjf	_PFDR,#2,L364
 965                     ; 232 				ADCCSR = ADSPEED | ADON | _Ain_S1Analogic; //PF4							// enables the A/D peripheral on Scanning Head
 966  0458 a66a          	ld	a,#106
 967  045a b770          	ld	_ADCCSR,a
 969  045c               L174:
 970                     ; 233 				while((_Pa_EncoderAB & 0b10000100)==0b10000100); 				// Enc = 1 & Zero = 1
 971  045c b60f          	ld	a,_PFDR
 972  045e a484          	and	a,#132
 973  0460 a184          	cp	a,#132
 974  0462 27f8          	jreq	L174
 975                     ; 234 				byScanningHeadValue = (byScanningHeadValue & 0b11000000)>>2;
 976  0464 b6ff          	ld	a,_scanningHeadSignalAcquire$L-1
 977  0466 a4c0          	and	a,#192
 978  0468 44            	srl	a
 979  0469 44            	srl	a
 980  046a b7ff          	ld	_scanningHeadSignalAcquire$L-1,a
 982  046c               L105:
 983                     ; 235 				while((_Pa_EncoderAB & 0b10000100)==0b00000100); 				// Enc = 0 & Zero = 1
 984  046c b60f          	ld	a,_PFDR
 985  046e a484          	and	a,#132
 986  0470 a104          	cp	a,#4
 987  0472 27f8          	jreq	L105
 988                     ; 236 				m_byScanningHeadValue += byScanningHeadValue;
 989  0474 c6002e        	ld	a,_m_byScanningHeadValue
 990  0477 bbff          	add	a,_scanningHeadSignalAcquire$L-1
 991  0479 c7002e        	ld	_m_byScanningHeadValue,a
 993  047c               L705:
 994                     ; 237 				while((_Pa_EncoderAB & 0b10000100)==0b10000100); 				// Enc = 1 & Zero = 1
 995  047c b60f          	ld	a,_PFDR
 996  047e a484          	and	a,#132
 997  0480 a184          	cp	a,#132
 998  0482 27f8          	jreq	L705
1000  0484               L515:
1001                     ; 238 				while((_Pa_EncoderAB & 0b10000100)==0b00000100); 				// Enc = 0 & Zero = 1
1002  0484 b60f          	ld	a,_PFDR
1003  0486 a484          	and	a,#132
1004  0488 a104          	cp	a,#4
1005  048a 27f8          	jreq	L515
1007  048c               L325:
1008                     ; 239 				while(!(ADCCSR & EOC)&& (_btst(_Pa_Encoder0, _Pin_Encoder0)));	// waits for the end of the conversion
1009  048c 0e7003        	btjt	_ADCCSR,#7,L725
1011  048f 040ffa        	btjt	_PFDR,#2,L325
1012  0492               L725:
1013                     ; 240 				byScanningHeadValue = ADCDRH;
1014  0492 b671          	ld	a,_ADCDRH
1015  0494 b7ff          	ld	_scanningHeadSignalAcquire$L-1,a
1016  0496               L364:
1017                     ; 243 			if _btst(_Pa_Encoder0, _Pin_Encoder0)
1018  0496 050f3d        	btjf	_PFDR,#2,L343
1019                     ; 245 				ADCCSR = ADSPEED | ADON | _Ain_S1Analogic; //PF4							// enables the A/D peripheral on Scanning Head
1020  0499 a66a          	ld	a,#106
1021  049b b770          	ld	_ADCCSR,a
1023  049d               L735:
1024                     ; 246 				while((_Pa_EncoderAB & 0b10000100)==0b10000100); 				// Enc = 1 & Zero = 1
1025  049d b60f          	ld	a,_PFDR
1026  049f a484          	and	a,#132
1027  04a1 a184          	cp	a,#132
1028  04a3 27f8          	jreq	L735
1029                     ; 247 				byScanningHeadValue = (byScanningHeadValue & 0b11000000)>>4;
1030  04a5 b6ff          	ld	a,_scanningHeadSignalAcquire$L-1
1031  04a7 4e            	swap	a
1032  04a8 a40c          	and	a,#12
1033  04aa b7ff          	ld	_scanningHeadSignalAcquire$L-1,a
1035  04ac               L745:
1036                     ; 248 				while((_Pa_EncoderAB & 0b10000100)==0b00000100); 				// Enc = 0 & Zero = 1
1037  04ac b60f          	ld	a,_PFDR
1038  04ae a484          	and	a,#132
1039  04b0 a104          	cp	a,#4
1040  04b2 27f8          	jreq	L745
1041                     ; 249 				m_byScanningHeadValue += byScanningHeadValue;
1042  04b4 c6002e        	ld	a,_m_byScanningHeadValue
1043  04b7 bbff          	add	a,_scanningHeadSignalAcquire$L-1
1044  04b9 c7002e        	ld	_m_byScanningHeadValue,a
1046  04bc               L555:
1047                     ; 250 				while((_Pa_EncoderAB & 0b10000100)==0b10000100); 				// Enc = 1 & Zero = 1
1048  04bc b60f          	ld	a,_PFDR
1049  04be a484          	and	a,#132
1050  04c0 a184          	cp	a,#132
1051  04c2 27f8          	jreq	L555
1053  04c4               L365:
1054                     ; 251 				while((_Pa_EncoderAB & 0b10000100)==0b00000100); 				// Enc = 0 & Zero = 1
1055  04c4 b60f          	ld	a,_PFDR
1056  04c6 a484          	and	a,#132
1057  04c8 a104          	cp	a,#4
1058  04ca 27f8          	jreq	L365
1060  04cc               L175:
1061                     ; 252 				while(!(ADCCSR & EOC)&& (_btst(_Pa_Encoder0, _Pin_Encoder0)));	// waits for the end of the conversion
1062  04cc 0e7003        	btjt	_ADCCSR,#7,L575
1064  04cf 040ffa        	btjt	_PFDR,#2,L175
1065  04d2               L575:
1066                     ; 253 				byScanningHeadValue = ADCDRH;
1067  04d2 b671          	ld	a,_ADCDRH
1068  04d4 b7ff          	ld	_scanningHeadSignalAcquire$L-1,a
1069  04d6               L343:
1070                     ; 202 		while (_btst(_Pa_Encoder0, _Pin_Encoder0))
1071  04d6 050f03cc03bf  	btjt	_PFDR,#2,L143
1072  04dc               L733:
1073                     ; 257 }
1074  04dc 81            	ret	
1075                     	switch	.bss
1076  0000               _m_woEncoderGateWidth:
1077  0000 0000          	ds.b	2
1078                     	xdef	_m_woEncoderGateWidth
1079  0002               _m_arbyEncoderGate:
1080  0002 000000000000  	ds.b	32
1081                     	xdef	_m_arbyEncoderGate
1082  0022               _m_arbyEncoderSignals:
1083  0022 000000000000  	ds.b	8
1084                     	xdef	_m_arbyEncoderSignals
1085  002a               _m_woEncoderGateEnd:
1086  002a 0000          	ds.b	2
1087                     	xdef	_m_woEncoderGateEnd
1088  002c               _m_woEncoderGateStart:
1089  002c 0000          	ds.b	2
1090                     	xdef	_m_woEncoderGateStart
1091  002e               _m_byScanningHeadValue:
1092  002e 00            	ds.b	1
1093                     	xdef	_m_byScanningHeadValue
1094  002f               _m_byScanningHeadSignalPointer:
1095  002f 0000          	ds.b	2
1096                     	xdef	_m_byScanningHeadSignalPointer
1097  0031               _m_arbyScanningHeadSignal:
1098  0031 000000000000  	ds.b	1024
1099                     	xdef	_m_arbyScanningHeadSignal
1100                     	xdef	_scanningHeadSignalAcquireGate
1101                     	xdef	_scanningHeadSignalAcquire
1102                     	xdef	_scanningHeadSignalWaitEncoder
1103                     	xdef	_scanningHeadSignalWaitEncoderZeroChannel
1104                     	xref	_displayIsKeyPress
1105                     	xref.b	c_x
1106                     	end
