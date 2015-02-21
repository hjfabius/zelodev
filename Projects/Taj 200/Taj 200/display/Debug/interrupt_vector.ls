   1                     ; C Compiler for ST7 (COSMIC Software)
   2                     ; Generator V4.5.5 - 12 Jan 2006
   4                     .const:	section	.text
   5  0000               __vectab:
   7  0000 0000          	dc.w	_SNI_Interrupt
   8  0002 0000          	dc.w	0
   9  0004 0000          	dc.w	0
  11  0006 0000          	dc.w	_SCI_DataReceived
  12  0008 0000          	dc.w	0
  13  000a 0000          	dc.w	0
  14  000c 0000          	dc.w	0
  15  000e 0000          	dc.w	0
  17  0010 0000          	dc.w	_displayKeyboardIRQ
  18  0012 0000          	dc.w	0
  19  0014 0000          	dc.w	0
  20  0016 0000          	dc.w	0
  21  0018 0000          	dc.w	0
  22  001a 0000          	dc.w	0
  23  001c 0000          	dc.w	0
  25  001e 0000          	dc.w	__stext
  54                     ; 30 void DoNothing(void)
  54                     ; 31 {
  55                     	switch	.text
  56  0000               _DoNothing:
  59                     ; 32 	return;
  62  0000 81            	ret
  88                     	xdef	__vectab
  89                     	xref	_SNI_Interrupt
  90                     	xdef	_DoNothing
  91                     	xref	_SCI_DataReceived
  92                     	xref	_displayKeyboardIRQ
  93                     	xref	__stext
 112                     	end
