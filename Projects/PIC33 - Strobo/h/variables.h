#ifndef __VARIABLES_H__
	#define __VARIABLES_H__

	BYTE m_byCurrentParameter;
/*	#define PARAM_FREQUENCY 			0
	#define PARAM_CYLINDER   			1
	#define PARAM_SPEED 				2
	#define PARAM_MULT_FACTOR 			3
	#define PARAM_MAX_NORMAL			5
	
	#define PARAM_LIGHT 				4
	#define PARAM_LANGUAGE				5
	#define PARAM_MAX_LONG				5
*/
	
	//WORD  	m_arwoParameters[PARAM_MAX_LONG+1];

	volatile WORD m_woCurrentPOS1CNT;
	volatile WORD m_woPreviousPOS1CNT;
	volatile SWORD m_intDeltaEncoder;
	
	
	

#endif
