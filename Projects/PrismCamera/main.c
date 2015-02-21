
// Include files
#include "main.h"


#pragma DATA_SEG SHORT DEFAULT_RAM

void init(void);
void main(void);
extern BYTE	m_byIndexValue;

/*****************************************************************************/
void init(void)
{
	m_byIndexValue = 0;	
	PADR 	= _PADR;       
	PADDR 	= _PADDR;
	PAOR 	= 0b00110011;//0b00100011; //_PAOR; TODO: To replace when display will be connected
	PADR 	= _PADR;

	PBDR 	= _PBDR;  	
	PBDDR 	= _PBDDR;
	PBOR 	= 0b01111111;//0b00111111; //_PBOR; TODO: To replace when display will be connected
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
	//eepromInit();
	parametersInit();
	displayInit();

	//Reset leds
	_bres(_Pa_Led_D1, _Pin_Led_D1);
	_bres(_Pa_Led_D2, _Pin_Led_D2);
	_bres(_Pa_Led_D3, _Pin_Led_D3);
	_bres(_Pa_Led_D4, _Pin_Led_D4);
	
	EnableInterrupts();
}	

void Message(WORD a_byCode, WORD a_byCode2, WORD a_woValue)
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
	memcpy(strString, "Value  = ", 9); 
	formatNumber(a_woValue, 6, 0, strString+9);
	displayWriteString(strString, DISPLAY_SELECT_FONT_5x7, 10, 30);
}

/*****************************************************************************/
void main(void)
{
	BYTE j;
	init();
	_bset(_Pa_Led_D4, _Pin_Led_D4);	
	/*displayReset();
	displayAppInit();
	displayAppLoop();
	*/
	while(1)
	{
		j = 255;
		while(_btst(_Pa_Encoder0, _Pin_Encoder0));
		while(!_btst(_Pa_Encoder0, _Pin_Encoder0));
		if _btst(_Pa_AuxIn_2, _Pin_AuxIn_2)
		{
			while(j-->0)
			{
				while((_Pa_EncoderAB & 0b10000100)==0b10000100); 	// Enc = 1 & Zero = 1
				while((_Pa_EncoderAB & 0b10000100)==0b00000100); 	// Enc = 0 & Zero = 1
			}
		}
		
		_switch(_Pa_Strobo, _Pin_Strobo);
		_switch(_Pa_Led_D3, _Pin_Led_D3);	
		sleep(25);
		_switch(_Pa_Strobo, _Pin_Strobo);
		
	}
}
