#ifndef TIMERS_H
	#define TIMERS_H

	#include "common.h"
	
	extern volatile BYTE m_byTimersFlag;
	
	#define TIMER_TIME_SOLVENT_PH			5
	#define TIMER_TIMEINTERMEASURE 			7
	#define TIMER_TIMEALLARM				6
	#define TIMER_TIMEVALVEDELAY			0
	
	#define TIMER_TIMEOUTMEASURE			4
	#define TIMER_TIME_WASH					3
	
	//Used always the same timer, because it cannot be used at the same time
	
	
	
	void timersInit(void);
	void timersTicIRQ(void);
	void timersSet(BYTE a_byIndex, BYTE a_byTimeoutValue);
	void timersReset(BYTE a_byIndex);
	void timersWaitTimeout(BYTE a_byIndex);
	
#endif