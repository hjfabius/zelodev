/*	INTERRUPT VECTORS TABLE FOR ST7LITE0
 *	Copyright (c) 2000 by COSMIC Software
 */
#define NULL	0

extern void _stext();				/* startup routine */
extern void itExt0();				/* button interrupt */
extern void itExt1();				/* encoder interrupt */

void (* const _vectab[])() = {
	NULL,					/* unused                   */
	NULL,					/* SPI                      */
	NULL,					/* LITE TIMER RTC           */
	NULL,					/* LITE TIMER Input Compare */
	NULL,					/* AT TIMER Overflow        */
	NULL,					/* AT TIMER Output Compare  */
	NULL,					/* AVD                      */
	NULL,					/* unused                   */
	NULL,					/* unused                   */
	NULL,					/* External Interrupt 3     */
	NULL,					/* External Interrupt 2     */
	itExt1,					/* External Interrupt 1     */
	itExt0,					/* External Interrupt 0     */
	NULL,					/* unused                   */
	NULL,					/* TRAP                     */
	_stext,					/* RESET                    */
	};
