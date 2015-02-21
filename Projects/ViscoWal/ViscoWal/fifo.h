#ifndef FIFO_H
	#define FIFO_H

	#include "common.h"

	/*---------------------------------------------------------------------------*/
	void 	FIFO_Init(void);
	void 	FIFO_PutByte(BYTE a_byData);
	BYTE 	FIFO_GetByte(void);
	BYTE 	FIFO_GetLength(void);


	void 	FIFOL_Init(void);
	void 	FIFOL_PutByte(LWORD  a_lwoData);
	LWORD 	FIFOL_GetByte(void);
	LWORD 	FIFOL_GetLength(void);

#endif