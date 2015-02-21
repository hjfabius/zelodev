// Include files
#include "common.h"

#pragma DATA_SEG SHORT DEFAULT_RAM


#define Pa_SNI_CLK 		PADR
#define Pa_SNI_DATA		PADR
#define Pa_CMD_A2		PADR
#define Pa_CMD_A1		PADR
#define Pa_CMD_A0		PADR
#define Pa_KEY_A2		PADR
#define Pa_KEY_A1		PADR
#define Pa_KEY_A0		PADR


#define Pin_SNI_DATA	0
#define Pin_SNI_CLK 	1
#define Pin_CMD_A2		2
#define Pin_CMD_A1		3
#define Pin_CMD_A0		4
#define Pin_KEY_A2		5
#define Pin_KEY_A1		6
#define Pin_KEY_A0		7




#define Pa_LED 			PBDR
#define Pa_S1 			PBDR
#define Pa_ENC_Z 		PBDR
#define Pa_ENC_A 		PBDR
#define Pa_ENC_B 		PBDR

#define Pin_LED 		0
#define Pin_S1 			1
#define Pin_ENC_Z 		2
#define Pin_ENC_A 		3
#define Pin_ENC_B 		4


static WORD m_woValue;

static WORD m_woEncoder;
static WORD m_woMarkStart1;
static WORD m_woMarkEnd1;
static WORD m_woMarkStart2;
static WORD m_woMarkEnd2;
static WORD m_woCylinderSize;           
		   
		   
		   
/*****************************************************************************/
@interrupt 
void AT_Overflow_Irq(void)
{
	BYTE byTemp;
	DisableInterrupts();
	if (m_woValue == 0x00)
	{
		_switch(Pa_SNI_CLK, Pin_SNI_CLK);
		m_woValue = 10;
	}
	else
	{
		m_woValue--;
	}
	
	byTemp = ATCSR;
	EnableInterrupts();
}

/*****************************************************************************/
void init(void)
{
	//Port configuration	
	// PA0  OUT SNI_DATA	 
	// PA1	OUT SNI_CLK
	// PA2	IN  CMD_A2
	// PA3	IN  CMD_A1
	// PA4	IN  CMD_A0
	// PA5	IN  KEY_A2	//debugger
	// PA6  IN  KEY_A1  //debugger
	// PA7	IN  KEY_A0
	PADR 	= 0x00;       
	PADDR 	= 0b00000011; // 1=output
	PAOR 	= 0b00000011; // pull-up and push-pull
	PADR 	= 0x00;       
	
	// PB0  OUT LED
	// PB1	OUT S1_A
	// PB2	OUT ENC_Z
	// PB3	OUT ENC_A
	// PB4	OUT ENC_B
	PBDR 	= 0x00;
	PBDDR 	= 0b00011111;  	// 1=output
	PBOR 	= 0b00011111; 	// push-pull
	PBDR 	= 0x00;  	
	
	ATRH	= 0x04;	
	ATRL	= 0xC8;
	ATCSR	= 0b00010010;	
}	

/*****************************************************************************/
void sleep(WORD a_woValue)
{
	while(a_woValue--> 0)
	{
		Nop();
	}
}

/*****************************************************************************/
BYTE chkKeyboard(void)
{
	BYTE byTemp;
	BYTE byKey;
	byTemp = PADR & 0b11100000;
	switch(byTemp)
	{
		case 0b01000000:
			byKey = 5;
			break;
		case 0b11000000:
			byKey = 4;
			break;
		case 0b00100000:
			byKey = 3;
			break;
		case 0b10100000:
			byKey = 2;
			break;
		case 0b01100000:
			byKey = 1;
			break;
		default:
			byKey = 0; 
			break;
	}
	return byKey;
}

/*****************************************************************************/
BYTE chkCmdOutput(void)
{
	BYTE byTemp;
	BYTE byCmd;
	byTemp = PADR & 0b00011100;
	switch(byTemp)
	{
		case 0b00001000:
			byCmd = 6;
			break;
		case 0b00011000:
			byCmd = 5;
			break;
		case 0b00000100:
			byCmd = 4;
			break;
		case 0b00010100:
			byCmd = 3;
			break;
		case 0b00001100:
			byCmd = 2;
			break;
		default:
			byCmd = 0; 
			break;
	}
	return byCmd;
}

/*****************************************************************************/
void ledBlink(void)
{
	_bset(Pa_LED, Pin_LED);
	sleep(10000);
	_bres(Pa_LED, Pin_LED);
	sleep(10000);
}


/*****************************************************************************/
void ledDoubleBlink(void)
{
	_bset(Pa_LED, Pin_LED);
	sleep(6000);
	_bres(Pa_LED, Pin_LED);
	sleep(12000);
	_bset(Pa_LED, Pin_LED);
	sleep(6000);
	_bres(Pa_LED, Pin_LED);
}

/*****************************************************************************/
void simulateSignals(void)
{
	if(m_woEncoder--==0)
	{
		m_woEncoder = 1024;
		_bset(Pa_ENC_Z, Pin_ENC_Z);
	}

	_bset(Pa_ENC_A, Pin_ENC_A);
	sleep(100);
	_bset(Pa_ENC_B, Pin_ENC_B);
	
	if (
	    ((m_woEncoder>m_woMarkStart1) && (m_woEncoder<m_woMarkEnd1)) ||
		((m_woEncoder>m_woMarkStart2) && (m_woEncoder<m_woMarkEnd2))
	   )
	{
		_bset(Pa_S1, Pa_S1);
	}
	else
	{
		_bres(Pa_S1, Pa_S1);
	}
	
	if(m_woEncoder==1024)
	{	
		_bres(Pa_ENC_Z, Pin_ENC_Z);
	}

	_bres(Pa_ENC_A, Pin_ENC_A);
	sleep(100);
	_bres(Pa_ENC_B, Pin_ENC_B);



}

/*****************************************************************************/
void main(void)
{
	WORD woIndex = 0;
	init();
	
	m_woEncoder 	= 1024;
	m_woMarkStart1	= 500;
	m_woMarkEnd1	= 505;
	m_woMarkStart2	= 800;
	m_woMarkEnd2	= 808;
	
	m_woCylinderSize = 4800;
	
	
	EnableInterrupts();
	
	while(1)
	{
		simulateSignals();
		
		switch(chkKeyboard())
		{
			case 1:	/*Move Signal*/
				ledDoubleBlink();
				sleep(50000);
				m_woMarkStart1	= 550;
				m_woMarkEnd1	= 555;
				break;
			case 2:
				ledDoubleBlink();
				sleep(50000);
				break;
			case 3:
				ledDoubleBlink();
				sleep(50000);
				break;
			case 4:
				ledDoubleBlink();
				sleep(50000);
				break;
			case 5:
				ledDoubleBlink();
				sleep(50000);
				chkCmdOutput();
				break;
			default:
				m_woMarkStart1	= 500;
				m_woMarkEnd1	= 505;
				break;
		}
	}
}

