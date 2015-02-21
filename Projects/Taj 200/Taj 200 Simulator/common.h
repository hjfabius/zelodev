#ifndef COMMON_H
	#define	COMMON_H
	
	#include "ioST7FLITE0.h"

	#define EnableInterrupts() 		_asm ("rim")  
	#define DisableInterrupts()		_asm ("sim") 
	#define Nop() 					_asm ("nop") 
	#define WaitforInterrupt() 		_asm ("wfi")

	typedef unsigned char *		STRING;
	typedef unsigned char 		BYTE;		/* Unsigned 8-bit */
	typedef unsigned int		WORD;		/* Unsigned 16-bit */
	typedef	unsigned long int	LWORD;		/* Unsigned 32-bit */

	typedef	signed char			SBYTE;		/* Signed 8-bit */
	typedef	signed int			SWORD;		/* Signed 16-bit */
	typedef	signed long int		SLWORD;		/* Signed 32-bit */

	typedef	unsigned int		UINT;		/* Unsigned 16-bit */
	typedef	unsigned long int	LONG;		/* Signed 32-bit */
	typedef unsigned char		BOOLEAN;	/* Bit flag */
	typedef	unsigned char		BIT;		/* Bit flag */

	#define	TRUE				(1)
	#define	FALSE				(0)
	#define	YES					(1)
	#define	NO					(0)
	#define NULL				(void *)0

	#define LOBYTE(w)	((BYTE)(w))
	#define HIBYTE(w)	((BYTE)(((UINT)(w) >> 8) & 0xFF))



	#define _bset(A, B)		 	 	(A |= (0x01<<(B)))
	#define _bres(A, B)		 	 	(A &= ~(0x01<<(B)))
	#define _btst(A, B)		 	 	((A) & (0x01<<(B)))
	#define _switch(A, B)		 	if(_btst(A, B)){_bres(A, B);}else{_bset(A, B);}
	#define _peak(A, B)			 	_bres(A, B);Nop();Nop();Nop();Nop();Nop();Nop();Nop();Nop();Nop();Nop();Nop();Nop();Nop();Nop();Nop();_bset(A, B);

	#define	 true 				 	1
	#define	 false 				 	0
	
	
	
	
#endif