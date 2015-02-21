   1                     ; C Compiler for ST7 (COSMIC Software)
   2                     ; Generator V4.4f - 27 May 2003
   4                     .const:	section	.text
   5  0000               __vectab:
   6  0000 0000          	dc.w	0
   7  0002 0000          	dc.w	0
   8  0004 0000          	dc.w	0
   9  0006 0000          	dc.w	0
  11  0008 0000          	dc.w	_AT_Overflow_Irq
  12  000a 0000          	dc.w	0
  13  000c 0000          	dc.w	0
  14  000e 0000          	dc.w	0
  15  0010 0000          	dc.w	0
  16  0012 0000          	dc.w	0
  17  0014 0000          	dc.w	0
  18  0016 0000          	dc.w	0
  19  0018 0000          	dc.w	0
  20  001a 0000          	dc.w	0
  21  001c 0000          	dc.w	0
  23  001e 0000          	dc.w	__stext
  56                     	xdef	__vectab
  57                     	xref	_AT_Overflow_Irq
  58                     	xref	__stext
  77                     	end
