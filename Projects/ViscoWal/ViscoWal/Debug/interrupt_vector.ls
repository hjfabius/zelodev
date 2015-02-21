   1                     ; C Compiler for ST7 (COSMIC Software)
   2                     ; Generator V4.5.5 - 12 Jan 2006
   4                     .const:	section	.text
   5  0000               __vectab:
   6  0000 0000          	dc.w	0
   7  0002 0000          	dc.w	0
   8  0004 0000          	dc.w	0
  10  0006 0000          	dc.w	_SCI_DataReceived
  11  0008 0000          	dc.w	0
  12  000a 0000          	dc.w	0
  13  000c 0000          	dc.w	0
  14  000e 0000          	dc.w	0
  16  0010 0000          	dc.w	_displayKeyboardIRQ
  17  0012 0000          	dc.w	0
  18  0014 0000          	dc.w	0
  19  0016 0000          	dc.w	0
  20  0018 0000          	dc.w	0
  21  001a 0000          	dc.w	0
  22  001c 0000          	dc.w	0
  24  001e 0000          	dc.w	__stext
  53                     ; 29 void DoNothing(void)
  53                     ; 30 {
  54                     	switch	.text
  55  0000               _DoNothing:
  58                     ; 31 	return;
  61  0000 81            	ret
  87                     	xdef	__vectab
  88                     	xdef	_DoNothing
  89                     	xref	_SCI_DataReceived
  90                     	xref	_displayKeyboardIRQ
  91                     	xref	__stext
 110                     	end
