#define NULL	0

extern void _stext();				/* startup routine */
//extern void irqKeyboard();		/* keypad event handler */

void (* const _vectab[])() = {
	NULL,					/* unused                   	*/
	NULL,					/* SPI                      	*/
	NULL,					/* LITE TIMER RTC           	*/
	NULL,					/* LITE TIMER Input Compare 	*/
	NULL,					/* AT TIMER Overflow        	*/
	NULL,					/* AT TIMER Output Compare  	*/
	NULL,					/* AVD                      	*/
	NULL,					/* unused                   	*/
	NULL,					/* unused                   	*/
	NULL,					/* External Interrupt 3 - PB0   */
	NULL,					/* External Interrupt 2 - PB3   */
	NULL,					/* External Interrupt 1 - PA7   */
	NULL,					/* External Interrupt 0 - PA0  	*/
	NULL,					/* unused                   	*/
	NULL,					/* TRAP                     	*/
	_stext,					/* RESET                    	*/
	};