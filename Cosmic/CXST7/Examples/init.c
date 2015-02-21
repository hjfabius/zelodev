/*	VU-METER - INITIALIZATIONS
 *	Copyright (c) 2000 by COSMIC Software
 */
#include <io7flit0.h>
#include "defs.h"

/*	data ports initialization
 */
void port_init(void)
	{
	PADDR = 0x1F;	// PORTA: bits 0..4 output
	PAOR = 0x1F;	//        push-pull
	PADR = 0x00;	//        clear output
	PBDDR = 0x07;	// PORTB: bits 0..2 output
	PBOR = 0x07;	//        push-pull
	PBDR = 0x00;	//        clear output
	}

/*	timers initialization
 */
void timer_init(void)
	{
	ATCSR = 0x13;		// enable interrupts
	ATR = 0;		// auto-reload value
	}

