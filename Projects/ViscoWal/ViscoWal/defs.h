#ifndef DEFS_H
	#define	DEFS_H

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

	#define LOBYTE(w)			((BYTE)(w))
	#define HIBYTE(w)			((BYTE)(((UINT)(w) >> 8) & 0xFF))
	#define MAX(A,B)			(A>B?A:B)
	#define MIN(A,B)			(A>B?B:A)
	#define ABS(A)				(A>0?A:-A)

	//#define EICR				0x37;		/* External Interrupt Control Register 	*/   
	//#define MCCSR				0x38;		/* Main Clock Control/Status Register	*/   
	//#define RCCR				0x39;		/* RC Oscillator Control Register  	*/   
	#define SPI_SICSR				0x3A;		/* System Integrity Control/Status Register*/   

	#define EnableInterrupts() 		_asm ("rim")  
	#define DisableInterrupts()		_asm ("sim") 
	#define Nop() 					_asm ("nop") 
	#define WaitforInterrupt() 		_asm ("wfi")
	#define ReturnFromInterrupt()	_asm ("iret")

	#define _bset(A, B)		 	 (A |= (0x01<<(B)))
	#define _bres(A, B)		 	 (A &= ~(0x01<<(B)))
	#define _btst(A, B)		 	 ((A) & (0x01<<(B)))
	#define _switch(A, B)		 if(_btst(A, B)){_bres(A, B);}else{_bset(A, B);}
	#define _peak(A, B)			 _bres(A, B);Nop();Nop();Nop();Nop();Nop();Nop();Nop();Nop();Nop();Nop();Nop();Nop();Nop();Nop();Nop();_bset(A, B);

	#define	 true 				 1
	#define	 false 				 0
	
	
	#define Fcpu ((unsigned long) 8000000)   
	#define Fosc2 ((unsigned long) 8000000)   
	#define SPI_POLLING_TX                         /* Polling mode transmission */                   
	#define SPI_POLLING_RX

	typedef enum {
		STATUS_EMPTY                = (unsigned char) 0x00,
		STATUS_LOGO                 = (unsigned char) 0x01,
		STATUS_01           		= (unsigned char) 0x02,
		STATUS_02       		    = (unsigned char) 0x03,
		STATUS_MENU          	    = (unsigned char) 0x04,
		STATUS_MENU_ACTIVE_01       = (unsigned char) 0x04,
		STATUS_MENU_ACTIVE_02       = (unsigned char) 0x05,
		STATUS_MENU_ACTIVE_03       = (unsigned char) 0x06,
		STATUS_MENU_ACTIVE_04       = (unsigned char) 0x07,
		STATUS_03					= (unsigned char) 0x09,
		STATUS_04	                = (unsigned char) 0x0A,
		STATUS_05                	= (unsigned char) 0x0B,
		STATUS_06           	    = (unsigned char) 0x0C,
		STATUS_07       	        = (unsigned char) 0x0D, 	
		STATUS_08	                = (unsigned char) 0x0E 	 	
		} tyStatus;	



#endif