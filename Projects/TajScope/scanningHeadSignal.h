#ifndef SCANNINGHEADSIGNAL_H
	#define SCANNINGHEADSIGNAL_H

	#include "common.h"
	
/*****************************************************************************/
// Costants declaration
/*****************************************************************************/
#define ENCODER_PULSES		1024  //power of 2


/*****************************************************************************/
// Functions declaration
/*****************************************************************************/
void scanningHeadSignalAcquire(void);
void scanningHeadSignalAcquireGate(void);
void scanningHeadSignalTestEncoderZero(void);
WORD scanningHeadSignalTestEncoderAB(void);

#endif