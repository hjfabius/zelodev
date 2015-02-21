
// Include files
#include "main.h"


#pragma DATA_SEG SHORT DEFAULT_RAM

void init(void);
void main(void);

/*****************************************************************************/
void init(void)
{
	PADR 	= _PADR;       
	PADDR 	= _PADDR;
	PAOR 	= _PAOR;
	PADR 	= _PADR;

	PBDR 	= _PBDR;  	
	PBDDR 	= _PBDDR;
	PBOR 	= _PBOR;
	PBDR 	= _PBDR;

	PCDR 	= _PCDR;  	
	PCDDR 	= _PCDDR;
	PCOR 	= _PCOR; 
	PCDR 	= _PCDR;  	
	
	PDDR 	= _PDDR;       
	PDDDR 	= _PDDDR;
	PDOR 	= _PDOR;
	PDDR 	= _PDDR;
	
	PEDR 	= _PEDR;       
	PEDDR 	= _PEDDR;
	PEOR 	= _PEOR;
	PEDR 	= _PEDR;	
	
	PFDR 	= _PFDR;       
	PFDDR 	= _PFDDR;
	PFOR 	= _PFOR;
	PFDR 	= _PFDR;

	PGDR 	= _PGDR;       
	PGDDR 	= _PGDDR;
	PGOR 	= _PGOR;
	PGDR 	= _PGDR;

	PHDR 	= _PHDR;       
	PHDDR 	= _PHDDR;
	PHOR 	= _PHOR;
	PHDR 	= _PHDR;

	//MCC CONTROL/STATUS REGISTER
	// bit 7 = 1 -> MCO alternate function enabled on PF0 (clock)
	// bit 6 e 5 -> Prescale to work in slow mode (00 is the fastest)
	// bit 4 = 1 -> Slow Mode endabled
	// bit 3 e 2 -> Time base control (00 is the fastest)
	// bit 1 = 1 -> Oscillator interrupt enabled
	// bit 0 = 1 -> Oscillator interrupt flag = Timeout reached
	MCCSR = 0b10000000;



	DisableInterrupts();
	//External interrupt control register
	ISPR0 = _ISPR0;
	ISPR1 = _ISPR1;

	ISPR2 = _ISPR2; // interrupt no.8 bit0&1 priority level 2. if the are 11 the timer A interrupt is disable.
	ISPR3 = _ISPR3;  
	EICR  = _EICR;	

	FIFO_Init();
	SCI_Init();
	//timersInit();
	eepromInit();
	//parametersInit();
	displayInit();

	//Reset leds
	_bres(_Pa_Led_D1, _Pin_Led_D1);
	_bres(_Pa_Led_D2, _Pin_Led_D2);
	_bres(_Pa_Led_D3, _Pin_Led_D3);
	_bres(_Pa_Led_D4, _Pin_Led_D4);
	
	#ifdef EEPROM_RESET
		eepromReset();
	#endif
	
	#ifdef VISCO_SIMULATOR
		_bset(_Pa_Led_D1, _Pin_Led_D1);
		sleepSec(1);
	#endif
	EnableInterrupts();
	#ifdef VISCO_SIMULATOR
		_bset(_Pa_Led_D2, _Pin_Led_D2);
		sleepSec(1);
	#endif
}	

/*****************************************************************************/
void mainMessage(WORD a_byCode, WORD a_byCode2, WORD a_byCode3, WORD a_byCode4)
{
	BYTE i;
	WORD j;
	BYTE strString[16];

	strString[15] = 0x00;
	memcpy(strString, "Code 1 = ", 9); 
	formatNumber(a_byCode, 6, 0, strString+9);
	displayWriteString(strString, DISPLAY_SELECT_FONT_5x7, 10, 10);
	

	memcpy(strString, "Code 2 = ", 9); 
	formatNumber(a_byCode2, 6, 0, strString+9);
	displayWriteString(strString, DISPLAY_SELECT_FONT_5x7, 10, 20);

	strString[15] = 0x00;
	memcpy(strString, "Code 3 = ", 9); 
	formatNumber(a_byCode3, 6, 0, strString+9);
	displayWriteString(strString, DISPLAY_SELECT_FONT_5x7, 10, 30);

	memcpy(strString, "Code 4 = ", 9); 
	formatNumber(a_byCode4, 6, 0, strString+9);
	displayWriteString(strString, DISPLAY_SELECT_FONT_5x7, 10, 40);
}

/*****************************************************************************/
void mainKeyCodeLoop(void)
{
	while(1)
	{
		screenKeyCode();
	}
}


/*****************************************************************************/
void main(void)
{
	init();

	_bres(_Pa_Led_D1, _Pin_Led_D1);
	_bres(_Pa_Led_D2, _Pin_Led_D2);
	_bres(_Pa_Led_D3, _Pin_Led_D3);
	_bset(_Pa_Led_D4, _Pin_Led_D4);	
	
	displayReset();
	displayAppInit();
	//mainKeyCodeLoop();
	displayAppLoop();
}
