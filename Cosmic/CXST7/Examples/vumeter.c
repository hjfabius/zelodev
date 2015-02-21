/*	VU-METER
 *	Copyright (c) 2000 by COSMIC Software
 *
 *	This program displays the potentiometer value
 *	on the LED's using the PWM feature to implement
 *	a progressive lighting.
 */
#include "defs.h"

unsigned char led_max;	// led value at cycle start
unsigned char led_min;	// led value at cycle end
unsigned int width;	// led pulse width

unsigned char const led_table[] = {	// led display table
	0x00, 0x01, 0x03, 0x07,
	0x0F, 0x1F, 0x3F, 0x7F,
	0xFF
	};

/*	main program
 */
void main(void)
	{
	unsigned char input, i;
	unsigned int value;

	port_init();
	timer_init();

	for (;;)
		{
		input = read_adc();

		i = input >> 5;
		led_min = led_table[i];
		led_max = led_table[i + 1];

		i = input & 0x1F;
		value = (i << 7) | 0x0f;
		if (value != width)
			{
			sim();
			width = value;
			rim();
			}
		}
	}

