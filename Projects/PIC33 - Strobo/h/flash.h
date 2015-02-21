#ifndef __FLASH_H__
	#define	__FLASH_H__

	#include "common.h"

	void SetFlashOscillatorDutyCycle(BYTE a_byDutyCycle);
	void InitFlash();
	void ExecuteFlash();
	void DisableFlashInternalTrigger();

#endif
