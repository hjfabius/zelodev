#ifndef MAIN
	#define MAIN     
	
	#include "common.h"

	
	/*-----------------------------------------------------------------------------
	   Declaration of global variables and global message buffers used in main.c
	-----------------------------------------------------------------------------*/
	
	#pragma DATA_SEG SHORT DEFAULT_RAM
	
	//void irqKeyboard(void);			/* keypad event handler */	
	BYTE keyPress(void);			/* keypad manager */

	void main(void);	
	void init(void);
	
#endif  
