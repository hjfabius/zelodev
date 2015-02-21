#ifndef FIFO_H
	#define FIFO_H

	#include "common.h"

	/*---------------------------------------------------------------------------*/
	void FIFO_Init(void);
	void FIFO_PutByte(BYTE a_byData);
	BYTE FIFO_GetByte(void);
	BYTE FIFO_GetLength(void);

#endif