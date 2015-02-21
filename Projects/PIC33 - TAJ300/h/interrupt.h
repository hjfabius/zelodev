#ifndef __INTERRUPT_H__
	#define __INTERRUPT_H__
	
	#include "common.h"

	void __attribute__((__interrupt__, no_auto_psv)) _T1Interrupt( void );
	void __attribute__((__interrupt__, no_auto_psv)) _IC1Interrupt( void );
	void __attribute__((__interrupt__, no_auto_psv)) _IC2Interrupt( void );
	void __attribute__((__interrupt__, no_auto_psv)) _IC8Interrupt( void );
	void __attribute__((__interrupt__, no_auto_psv)) _INT1Interrupt( void );
	void __attribute__((__interrupt__, no_auto_psv)) _INT2Interrupt( void );


#endif
