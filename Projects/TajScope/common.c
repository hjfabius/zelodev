#include "common.h"

/*****************************************************************************/
void sleep(LWORD a_uintMilliSec)
{
#ifdef NO_WAIT
	return;
#endif
	while(a_uintMilliSec>0)
	{
		a_uintMilliSec--;
	}
}

/*****************************************************************************/
void sleepFix(void)
{
	sleep(18750);
}

/*****************************************************************************/
void sleepSec(WORD a_uintSec)
{/*
	WORD wo10MilliSeconds;
	
	wo10MilliSeconds = m_wo10MilliSeconds;
	while(m_wo10MilliSeconds < (wo10MilliSeconds+100))
	{
		Nop();
	}
	*/
	WORD j = 0;

#ifdef NO_WAIT
	return;
#endif

	while(a_uintSec>0)
	{
		a_uintSec--;
		j=128;
		while(j>0)
		{
			sleep(255);
			j--;
		}
	}
}


/*****************************************************************************/
void memcpyFull(STRING a_strTo, STRING a_strFROM, BYTE a_byLength)
{
	BYTE i = 0x00;
	BYTE j = 0x00;
	while(i<a_byLength)
	{
		a_strTo[i++] = a_strFROM[j++];
	}
}


/*****************************************************************************/
BYTE memcpy(STRING a_strTo, STRING a_strFROM, BYTE a_byLength)
{
	BYTE i = 0x00;
	BYTE j = 0x00;
	while((i<a_byLength) && (a_strFROM[j] != 0x00))
	{
		a_strTo[i++] = a_strFROM[j++];
	}
	while(i<a_byLength)
	{
		a_strTo[i++] = 0x00;
	}
	return j;
}

/*****************************************************************************/
void timersOnOff(BYTE a_blnEnable)
{
	if(a_blnEnable)
	{
		DisableInterrupts();
		TACR1 = MEASURE_TACR1;
		TACR2 = MEASURE_TACR2;
		TBCR1 = 0x00;
		TBCR2 = 0x00;
		
		TASR  = MEASURE_TIMER_ON;
		EnableInterrupts();		
	}
	else
	{
		DisableInterrupts();
		TBCR1 = 0x40;
		TBCR2 = 0x08;
		
		TACR1 = 0x00;
		TACR2 = 0x00;
		TASR  = MEASURE_TIMER_OFF;
		EnableInterrupts();		
	}
}

/*****************************************************************************/
void formatNumber(WORD a_woValue, BYTE a_byNumDigit, BYTE a_byNumDecimal, BYTE * a_byString)
{
	BYTE byValue    		= 0x00;
	
	if (a_byNumDecimal == 0x00)
	{
		a_byNumDecimal = 0xFF;
	}
	
	if (a_woValue==0x0000)
	{
		while(a_byNumDigit--!=0)
		{
			a_byString[a_byNumDigit] = '-';
		}
	}
	else
	{
		while(a_byNumDigit-->0)
		{
			if(a_byNumDecimal == 0x00)
			{
				a_byString[a_byNumDigit] = '.'; //0x2E; // .
			}
			else
			{
				if (a_woValue>0x00) 
				{
					byValue = a_woValue % 10;
					a_woValue = (a_woValue-(WORD)byValue)/(BYTE)10;
					a_byString[a_byNumDigit] = (byValue+'0');
				}
				else // (a_woValue==0x00) 
				{
					if(a_byNumDecimal<=a_byNumDigit)
					{
						a_byString[a_byNumDigit] = '0';
					}
					else
					{
						a_byString[a_byNumDigit] = ' ';
					}
				}
			}
			a_byNumDecimal--;	
		}
	}
}

/*****************************************************************************/
WORD getBoundedValue(WORD * a_woValue, SWORD a_swoChange, WORD * a_woMax, WORD *a_woMin)
{
	SLWORD slwoChange = 0x00000000;
	slwoChange = ((SLWORD)(*a_woValue)) + ((SLWORD)a_swoChange);
	
	if (slwoChange > (*a_woMax))
	{
		return (*a_woMax);
	} 
	else if (slwoChange < (*a_woMin))
	{
		return (*a_woMin);
	}
	else
	{
		return (WORD)slwoChange;			
	}
}

