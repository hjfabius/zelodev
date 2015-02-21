/*	VU-METER - INTERRUPT HANDLER
 *	Copyright (c) 2000 by COSMIC Software
 */
#include <io7flit0.h>
#include "defs.h"

/*	timer overflow interrupt handling
 */
@interrupt void it_tovf(void)
	{
	unsigned char status;

	ATCSR;			// clear OVF flag
	PADR = led_max;		// Set Led's value
	PBDR = led_max >> 5;
	DCR0 = width;		// Set duty cycle value
	}

/*	timer compare interrupt handling
 */
@interrupt void it_tcmp(void)
	{
	PWM0CSR;		// clear flag
	PADR = led_min;		// Set Led's value
	PBDR = led_min >> 5;
	}
