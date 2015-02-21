#include "sti.h"

WORD	m_woTimeout;

BYTE 	m_arbyValues[200];
BYTE	m_byIndexValue;

/*****************************************************************************/
BYTE STI_MoveByte (BYTE a_byData)
{ 
	BYTE 	byCounter 		= 0x00;
	byCounter = 8;
	
	if (m_woTimeout == 0x0000)
	{
		return 0x00;
	}
	
	for(byCounter=0; byCounter<8; byCounter++)
	{
		m_woTimeout = 0x2000;
		
		// Most sig bit first
		while(!_btst(_Pa_DDCLK, _Pin_DDCLK))
		{
			if((--m_woTimeout)==0)
			{
				return 0x00;
			}
		};
		
		if ((a_byData & 0x80)!=0)
		{
			_bset(_Pa_DDOUT, _Pin_DDOUT);
		}
		else
		{
			_bres(_Pa_DDOUT, _Pin_DDOUT);
		}
		a_byData <<= 1;
		
		if(_btst(_Pa_DDIN, _Pin_DDIN))
		{
			a_byData+=1;
		}
		
		m_woTimeout = 0x2000;
		while(_btst(_Pa_DDCLK, _Pin_DDCLK))
		{
			if((--m_woTimeout)==0)
			{
				return 0x00;
			}		
		};
	}
	
	m_arbyValues[m_byIndexValue++] = a_byData;

	if (m_byIndexValue == 200)
	m_byIndexValue = 0;
	return a_byData; 
}

/*****************************************************************************/
void STI_GetMessage(BYTE * a_byCode, BYTE * a_byAdditionalCode, WORD * a_woValue)
{
	m_woTimeout = 0x0000;
	while(m_woTimeout == 0x0000)
	{
		m_woTimeout = 0x2000;
		_bset(_Pa_Led_D1, _Pin_Led_D1);	
		_bset(_Pa_DDSEL, _Pin_DDSEL);
		_bset(_Pa_DDQUE, _Pin_DDQUE);
		
		(*a_byCode) = STI_MoveByte(0x00);
		(*a_byAdditionalCode) = STI_MoveByte(0x00);
		(*a_woValue) = (STI_MoveByte(0x00)*256);
		(*a_woValue) += STI_MoveByte(0x00);	
		
		_bres(_Pa_DDQUE, _Pin_DDQUE);
		_bres(_Pa_DDSEL, _Pin_DDSEL);	
		_bres(_Pa_Led_D1, _Pin_Led_D1);	
	}
}


/*****************************************************************************/
WORD STI_SendMessage(BYTE a_byCode, BYTE a_byAdditionalCode, WORD a_woValue)
{
	WORD woPrevValue;

	m_woTimeout = 0x0000;
	while(m_woTimeout == 0x0000)
	{
		m_woTimeout = 0x2000;

		_bset(_Pa_Led_D1, _Pin_Led_D1);	
		_bset(_Pa_DDSEL, _Pin_DDSEL);
		_bset(_Pa_DDQUE, _Pin_DDQUE);
		
		STI_MoveByte(a_byCode);
		STI_MoveByte(a_byAdditionalCode);
		woPrevValue = STI_MoveByte(HIBYTE(a_woValue))*256;
		woPrevValue += STI_MoveByte(LOBYTE(a_woValue));
		
		_bres(_Pa_DDQUE, _Pin_DDQUE);
		_bres(_Pa_DDSEL, _Pin_DDSEL);	
		_bres(_Pa_Led_D1, _Pin_Led_D1);	
	}
	
	return woPrevValue;
}


