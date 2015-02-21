#include "spi.h"

/*****************************************************************************/
BYTE SPI_MoveByte ( BYTE a_byData)
{ 
	#ifndef SPI_MANUAL
	
		SPI1STATbits.SPIROV = 0; 
		SPI1BUF = a_byData;                  // initiate bus cycle 
		while(!SPI1STATbits.SPIRBF); 
		// Check for Receive buffer full status bit of status register
		if (SPI1STATbits.SPIRBF) 
		{ 
			SPI1STATbits.SPIROV = 0;              
			a_byData = SPI1BUF;    // return BYTE read 
		} 
		IFS0bits.SPI1IF = 0;
	
		return a_byData;
	#else
		return SPI_MoveByteMan(a_byData);
	#endif
	
}

/*****************************************************************************/
BYTE SPI_MoveByteMan ( BYTE a_byData)
{ 
	
		BYTE 	byCounter 		= 0x00;
		byCounter = 8;
		
		// Clock starts low 
		PIN_DDCK = 0;
		
		for(byCounter=0; byCounter<8; byCounter++)
		{
	
			// Most sig bit first
			if ((a_byData & 0x80)!=0)
			{
				PIN_DDIN = 1;
			}
			else
			{
				PIN_DDIN = 0;
			}
			sleep(4); //3
			a_byData <<= 1;
			PIN_DDCK = 1;
			sleep(10); //10
			if(PIN_DDOUT == 1)
			{
				a_byData+=1;
			}
			PIN_DDCK = 0;
		}
	
		return a_byData;
	
}

/*****************************************************************************/
BYTE SPI_MoveByteForIRQ ( BYTE a_byData)
{ 
	return SPI_MoveByte(a_byData);
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
