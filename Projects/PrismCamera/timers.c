#include "timers.h"

//#define TIMERS_B_TIMEOUT 0x0E68  //with fcpu/8 -> interrupt each 10 milliseconds*/
#define TIMERS_B_TIMEOUT 0x0A68  //with fcpu/8 -> interrupt each 10 milliseconds*/


volatile BYTE m_arbyTimeouts[] = {0x00, 0x00, 0x00, 0x00,     0x00, 0x00, 0x00, 0x00};  //7..4 in seconds, 3..0 in 10 millisecs
volatile BYTE m_byTimersFlag = 0x00;
volatile BYTE m_byTenMilliSeconds = 0x00;

/*****************************************************************************/
void timersUpdate(void);


/*****************************************************************************/
void timersWaitTimeout(BYTE a_byIndex)
{
	while(m_arbyTimeouts[a_byIndex] > 0x00)
	{
		//WDGCR = 0xFF;
		Nop();
	}
	timersReset(a_byIndex);
}

/*****************************************************************************/
void timersReset(BYTE a_byIndex)
{
	m_arbyTimeouts[a_byIndex] = 0x00;
	_bres(m_byTimersFlag, a_byIndex);
}

/*****************************************************************************/
void timersSet(BYTE a_byIndex, BYTE a_byTimeoutValue)
{
	//a_byIndex 7..4 in seconds, 3..0 in 10 millisecs
	m_arbyTimeouts[a_byIndex] = a_byTimeoutValue;
	_bres(m_byTimersFlag, a_byIndex);
}

/*****************************************************************************/
void timersUpdate(void)
{
	BYTE byIndex = 0x08;
	
	m_byTenMilliSeconds++;

	while((byIndex--)>0x00)
	{
		if (byIndex<0x03) 
		{
			//10 millisecs timers
			if(m_arbyTimeouts[byIndex] > 0x00)
			{
				m_arbyTimeouts[byIndex]--;
				if(m_arbyTimeouts[byIndex] == 0x00)
				{
					_bset(m_byTimersFlag, byIndex);
				}
			}
		}
		else
		{
			//1 second timers
			if (m_byTenMilliSeconds == 100)
			{
				if(m_arbyTimeouts[byIndex] > 0x00)
				{
					m_arbyTimeouts[byIndex]--;
					if(m_arbyTimeouts[byIndex] == 0x00)
					{
						_bset(m_byTimersFlag, byIndex);
					}
				}
			}
		}
	}
	if (m_byTenMilliSeconds == 100)
	{
		m_byTenMilliSeconds = 0x00;
	}

}

/*****************************************************************************/
void timersInit(void)
{
	//CR1 Register
	//0 = OLVL1 Output Level 1
	//1 = IEDG1 Input Edge 1
	//		00 = falling edge
	//		02 = raising edge	
	//2 = OLVL2 Output Level 2
	//3 = FOLV1 Forced Output Compare 1
	//4 = FOLV2 Forced Output Compare 2
	//5 = TOIE  Timer Overflow Interrupt Enable
	//6 = OCIE  Output Compare Interrupt Enable
	//7 = ICIE  Input  Capture Interrupt Enable
	TBCR1 = 0x40; 	//Output Compare Interrupt Enable
	
	//CR2 Register
	//0 = EXEDG External Clock Edge
	//1 = IEDG2 Input Edge 2
	//		00 = falling edge
	//		02 = raising edge
	//2 = CC0  Clock Control
	//3 = CC1
	//		CC = 00	fcpu/4	
	//		CC = 04	fcpu/2
	//		CC = 08	fcpu/8
	//		CC = 0C	External from EXCLK_A pin
	//4 = PWM  Pulse Width Modulation
	//5 = OPM  One Pulse Mode
	//6 = OC2E Output Compare 2 Pin Enable
	//7 = OC1E Output Compare 1 Pin Enable
	
	TBCR2 = 0x08;	//fcpu/8
	
}

/*****************************************************************************/
@interrupt 
void timersTicIRQ()
{  
	BYTE byTemp;
	
	byTemp = TBSR;	
	if (byTemp & 0x40) // if OCF1 flag
	{
		byTemp 	= TBOC1LR;				//Clears OCF1 flag.
		
		//Reset the timer
		TBCR = 0x0000;
		
		//Clear OCF1 flag
		TBOC1HR = HIBYTE(TIMERS_B_TIMEOUT);
		TBOC1LR = LOBYTE(TIMERS_B_TIMEOUT);
		
		//Increment the counter
		timersUpdate();
	}

	//Clear OCF2 flag
	byTemp = TBOC2LR;
}