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
void scanningHeadSignalWaitEncoderZeroChannel(void);
void scanningHeadSignalWaitEncoder(void);
void scanningHeadSignalAcquire(void);
void scanningHeadSignalAcquireGate(void);


#endif