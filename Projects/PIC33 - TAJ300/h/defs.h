#ifndef __DEFS_H__
	#define	__DEFS_H__



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

#endif
