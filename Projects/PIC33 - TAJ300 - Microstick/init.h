#ifndef __INIT_H__
	#define __INIT_H__
	
	#include "common.h"



void initMicro();
void initQuadratureEncoderInterface();
void initTimers();
void initInputCaptures();
void initSPI();
void initINT();
void initIOPorts();

#endif
