#ifndef COMMON_H
	#define	COMMON_H
	
	#include "ioST7FLITE0.h"

	#define EnableInterrupts() 		_asm ("rim")  
	#define DisableInterrupts()		_asm ("sim") 
	#define Nop() 					_asm ("nop") 
	#define WaitforInterrupt() 		_asm ("wfi")

	#define _bset(A, B)		 	 	(A |= (0x01<<(B)))
	#define _bres(A, B)		 	 	(A &= ~(0x01<<(B)))
	#define _btst(A, B)		 	 	((A) & (0x01<<(B)))
	#define _switch(A, B)		 	if(_btst(A, B)){_bres(A, B);}else{_bset(A, B);}
	#define _peak(A, B)			 	_bres(A, B);Nop();Nop();Nop();Nop();Nop();Nop();Nop();Nop();Nop();Nop();Nop();Nop();Nop();Nop();Nop();_bset(A, B);

	#define	 true 				 	1
	#define	 false 				 	0
	
	
	
	
#endif