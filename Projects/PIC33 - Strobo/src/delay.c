#include "delay.h"

unsigned char delay_quartz_frequency_value = 20;


//************************************************************
//             delay_ms function implementation
//************************************************************

void delay_ms (int value) {
	/*
	unsigned int reference = 0;
	unsigned int mainDelay;
	unsigned int subDelay;	
	
	reference = value * delay_quartz_frequency_value;
	
	for (mainDelay = 0; mainDelay < reference; mainDelay++) {
		
		for (subDelay = 0; subDelay < 12; subDelay++);
	}*/
	__delay_ms(value);
}


//************************************************************
//             setQuartz function implementation
//************************************************************

void setQuartz (unsigned char frequency) {

	delay_quartz_frequency_value = frequency;
	
} 

