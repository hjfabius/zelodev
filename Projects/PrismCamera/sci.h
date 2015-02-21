#ifndef SCI_H
	#define SCI_H

	#include "common.h"

	/*---------------------------------------------------------------------------*/
	void SCI_Init(void);
	void SCI_Compute_Baudrate(WORD BaudRate_Tx, WORD BaudRate_Rx);
	void SCI_SendByte ( BYTE a_byData);
	void SCI_SendString (STRING a_strData);
	
	//Received byte are saved to FIFO Buffer
	
#endif