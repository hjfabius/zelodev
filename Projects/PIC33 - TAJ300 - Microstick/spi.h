#ifndef SPI_H
	#define SPI_H

	#include "common.h"

	#define SPI_DUMMY			0x0B		//Dummy byte sent to get a byte
	#define SPI_EOL				0xFF
	#define SPI_MAX_LENGTH 		0x80	

	/*---------------------------------------------------------------------------*/
	BYTE 	SPI_MoveByte ( BYTE a_byData);
	BYTE 	SPI_MoveByteMan ( BYTE a_byData);
	BYTE 	SPI_MoveByteForIRQ ( BYTE a_byData);
	void 	SPI_PutString(BYTE * a_strMessage);
	
	/*---------------------------------------------------------------------------*/
	
	

#endif
