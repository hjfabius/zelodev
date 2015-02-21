/*	VU-METER - GLOBAL DEFINITIONS
 *	Copyright (c) 2000 by COSMIC Software
 */

/*	IO Bits
 */
#define OVF	0x04	// Timer Overflow

#define ADON	0x20	// AD Converter On
#define COCO	0x80	// Conversion Complete

/*	Macros
 */
#define sim()	_asm("sim")	// set interrupt mask
#define rim()	_asm("rim")	// reset interrupt mask

/*	Global Variables
 */
extern unsigned char led_min, led_max;
extern unsigned int width;

