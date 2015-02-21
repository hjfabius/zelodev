#define NULL	0

extern void _stext();					/* startup routine */
extern void displayKeyboardIRQ();		/* keypad event handler */
//extern void timersTicIRQ();				/* timer event handler */
extern void SCI_DataReceived();
extern void DoNothing();

/* Interrupt vector table, to be linked at the address   0xFFE0 (in ROM) */ 
void (* const _vectab[])() = {
	NULL,					/* 0xFFE0 - PWM ART interrupt							- ARTCSR	*/
	NULL,					/* 0xFFE2 - I2C peripheral interrupt					-  	*/
	NULL,					/* 0xFFE4 - Auxiliary Voltage detector interrupt		- SICSR		*/
	SCI_DataReceived,		/* 0xFFE6 - SCI peripheral interrupt					- SCISR		*/
	NULL,					/* 0xFFE8 - Timer B peripheral interrupt				- TBSR		*/
	NULL,					/* 0xFFEA - Timer A peripheral interrupt				- TASR		*/
	NULL,					/* 0xFFEC - SPI peripheral interrupt					- SPICSR	*/
	NULL,					/* 0xFFEE - CAN peripheral interrupt					- CANISR	*/
	displayKeyboardIRQ, 	/* 0xFFF0 - External Interrupt 3 						- PB4-PB7	*/
	NULL,					/* 0xFFF2 - External Interrupt 2 						- PB0-PB3	*/
	NULL,					/* 0xFFF4 - External Interrupt 1 						- PF0-PF2	*/
	NULL,					/* 0xFFF6 - External Interrupt 0 						- PA0-PA3	*/
	NULL,					/* 0xFFF8 - Main Clock controller time base interrupt 	- MCCSR		*/
	NULL,					/* 0xFFFA - External top level interrupt TLI			- EICR 		*/
	NULL,					/* 0xFFFC - Software Interrupt							- TRAP  	*/
	_stext,					/* 0xFFFE - Reset                    								*/
};

void DoNothing(void)
{
	return;
}