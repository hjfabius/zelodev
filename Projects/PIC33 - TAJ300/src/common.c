#include "common.h"

/*****************************************************************************/
void sleep(LWORD a_uintMilliSec)
{
	while(a_uintMilliSec>0)
	{
		a_uintMilliSec--;
		__delay_us(4);
		//__delay_ms(1);
	}
}

/*****************************************************************************/
void sleepForIRQ(LWORD a_uintMilliSec)
{
	while(a_uintMilliSec>0)
	{
		a_uintMilliSec--;
		__delay_us(4);
		//__delay_ms(1);
	}
}

/*****************************************************************************/
void sleepFix(void)
{
	sleep(2000);
}

/*****************************************************************************/
void sleepSec(WORD a_uintSec)
{
	WORD i = 0;

	while(a_uintSec>0)
	{
		for( i= 0; i<20; i++) 
		    __delay_ms(50);
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
void formatNumberBinary(WORD a_woValue,BYTE * a_byString)
{
	BYTE byNumDigit = 8;
	
	while(byNumDigit-->0)
	{
		if _btst(a_woValue,byNumDigit)
		{
			a_byString[byNumDigit] = '1';
		}
		else
		{
			a_byString[byNumDigit] = '0';
		}
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
void formatNumberLong(LWORD a_lwoValue, BYTE a_byNumDigit, BYTE a_byNumDecimal, BYTE * a_byString)
{
	BYTE byValue    		= 0x00;
	
	if (a_byNumDecimal == 0x00)
	{
		a_byNumDecimal = 0xFF;
	}
	
	if (a_lwoValue==0x0000)
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
				if (a_lwoValue>0x00) 
				{
					byValue = a_lwoValue % 10;
					a_lwoValue = (a_lwoValue-(WORD)byValue)/(BYTE)10;
					a_byString[a_byNumDigit] = (byValue+'0');
				}
				else // (a_lwoValue==0x00) 
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


/*****************************************************************************/
WORD BCDtoHEX(LWORD a_lwoValue)
{
	WORD woValue;
	WORD woTmpValue;
	
	woTmpValue = (WORD) (a_lwoValue & (LWORD)0x0000000F);
	woTmpValue = MIN(woTmpValue, 0x0009);
	woValue = woTmpValue;
	
	woTmpValue = (WORD) ((a_lwoValue & (LWORD)0x000000F0)>>4);
	woTmpValue = MIN(woTmpValue, 0x0009)*10;
	woValue += woTmpValue;

	woTmpValue = (WORD) ((a_lwoValue & (LWORD)0x00000F00)>>8);
	woTmpValue = MIN(woTmpValue, 0x0009)*100;
	woValue += woTmpValue;

	woTmpValue = (WORD) ((a_lwoValue & (LWORD)0x0000F000)>>12);
	woTmpValue = MIN(woTmpValue, 0x0009)*1000;
	woValue += woTmpValue;

	woTmpValue = (WORD) ((a_lwoValue & (LWORD)0x000F0000)>>16);
	woTmpValue = MIN(woTmpValue, 0x0009)*10000;
	woValue += woTmpValue;

	return woValue;
}

BYTE memcpyCustom(STRING a_strTo, STRING a_strFROM, BYTE a_byLength)
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
WORD convertEncoder(WORD a_woEncoder)
{
	return (ENCODER_PERIOD + a_woEncoder)&(ENCODER_PERIOD-1);
}