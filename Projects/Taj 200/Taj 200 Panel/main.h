#ifndef MAIN
	#define MAIN     
	
	/*-----------------------------------------------------------------------------
	   Declaration of global variables and global message buffers used in main.c
	-----------------------------------------------------------------------------*/
	
	#pragma DATA_SEG SHORT DEFAULT_RAM
	

	void main(void);	
	void init(void);
	void sourceSwitched (void);
	void resetVariables(void);
	void updateDistances(void);
	int isSimilar(unsigned int a_intValue1, unsigned int a_intValue2);
	int isMark(void);
	void delay(unsigned int a_intTime);
	void speedDelay(unsigned int a_intTime);

	
#endif  
