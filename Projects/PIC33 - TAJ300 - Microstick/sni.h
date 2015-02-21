#ifndef SNI_H
	#define SNI_H

	#include "common.h"

	/*---------------------------------------------------------------------------*/
	void SNI_Init(void);
	void SNI_ResetData(void);
	BYTE SNI_ReceivedCmd(void);
	//void SNI_Interrupt(void);
	
	



	/* Functions Mask */
	#define SNI_MASK_FUNZ_CYLINDER_TRAVEL		0x00F00000
	#define SNI_MASK_FUNZ_PHASE_FAST			0x00FFFFFF
	#define SNI_MASK_FUNZ_TEST_OUTPUT			0x00FFFFFF	
	#define SNI_MASK_FUNZ_GO_MANUAL			    0x00FFFFFF	
	#define SNI_MASK_FUNZ_GO_AUTO			    0x00FFFFFF	
	#define SNI_MASK_FUNZ_EXECUTE_F4	    	0x00FFFFFF	


	/* Parameters */
	#define SNI_PARAM_CYLINDER_TRAVEL			0x000FFFFF
	#define SNI_FUNZ_CYLINDER_TRAVEL			0x00100000
	#define SNI_FUNZ_PHASE_FAST					0x00200000
	#define SNI_FUNZ_TEST_OUTPUT				0x00200001
	#define SNI_FUNZ_GO_MANUAL				    0x00200002
	#define SNI_FUNZ_GO_AUTO				    0x00200003
	#define SNI_FUNZ_EXECUTE_F4	    			0x00200004
	
	#define SNI_CLOCK_REVERSE

#endif
