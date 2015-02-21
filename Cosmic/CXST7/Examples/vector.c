/*	INTERRUPT VECTORS TABLE FOR ST7LITE0
 *	Copyright (c) 2000 by COSMIC Software
 */
#define NULL	0

extern void _stext();		/* startup routine */
extern void it_tovf();		/* timer overflow interrupt */
extern void it_tcmp();		/* timer compare interrupt */

void (* const _vectab[])() = {
	NULL,			/* unused                   */
	NULL,			/* SPI                      */
	NULL,			/* LITE TIMER RTC           */
	NULL,			/* LITE TIMER Input Compare */
	it_tovf,		/* AT TIMER Overflow        */
	it_tcmp,		/* AT TIMER Output Compare  */
	NULL,			/* AVD                      */
	NULL,			/* unused                   */
	NULL,			/* unused                   */
	NULL,			/* External Interrupt 3     */
	NULL,			/* External Interrupt 2     */
	NULL,			/* External Interrupt 1     */
	NULL,			/* External Interrupt 0     */
	NULL,			/* unused                   */
	NULL,			/* TRAP                     */
	_stext,			/* RESET                    */
	};
