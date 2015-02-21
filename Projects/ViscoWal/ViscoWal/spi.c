#include "spi.h"

/*****************************************************************************/
BYTE SPI_MoveByte ( BYTE a_byData)
{ 
	BYTE 	byCounter 		= 0x00;
	byCounter = 8;
	
	// Clock starts low */
	_bres(_Pa_SCK, _Pin_SCK);
	
	for(byCounter=0; byCounter<8; byCounter++)
	{
		// Most sig bit first
		if ((a_byData & 0x80)!=0)
		{
			_bset(_Pa_MOSI, _Pin_MOSI);
		}
		else
		{
			_bres(_Pa_MOSI, _Pin_MOSI);
		}
		a_byData <<= 1;
		_bset(_Pa_SCK, _Pin_SCK);
		#ifdef CPU_4Mhz
			sleep(Nop(););
		#endif
		#ifdef CPU_8Mhz
			sleep(2);
		#endif
		#ifdef CPU_16Mhz
			sleep(4);
		#endif
		if(_btst(_Pa_MISO, _Pin_MISO))
		{
			a_byData+=1;
		}
		_bres(_Pa_SCK, _Pin_SCK);
	}

	return a_byData;
}

/*****************************************************************************/
BYTE SPI_MoveByteForIRQ ( BYTE a_byData)
{ 
	BYTE 	byCounter 		= 0x00;
	byCounter = 8;
	
	// Clock starts low */
	_bres(_Pa_SCK, _Pin_SCK);
	
	for(byCounter=0; byCounter<8; byCounter++)
	{
		// Most sig bit first
		if ((a_byData & 0x80)!=0)
		{
			_bset(_Pa_MOSI, _Pin_MOSI);
		}
		else
		{
			_bres(_Pa_MOSI, _Pin_MOSI);
		}
		a_byData <<= 1;
		_bset(_Pa_SCK, _Pin_SCK);
		#ifdef CPU_4Mhz
			sleep(Nop(););
		#endif
		#ifdef CPU_8Mhz
			sleep(2);
		#endif
		#ifdef CPU_16Mhz
			sleep(4);
		#endif
		if(_btst(_Pa_MISO, _Pin_MISO))
		{
			a_byData+=1;
		}
		_bres(_Pa_SCK, _Pin_SCK);
	}

	return a_byData;
}


/*****************************************************************************/
void SPI_PutString(BYTE * a_strMessage)
{
	BYTE i = 0x00;
	
	while((i<SPI_MAX_LENGTH) && (a_strMessage[i] != SPI_EOL))
	{
		SPI_MoveByte(a_strMessage[i]);
		i++;
	}
}