// Include files
#include "common.h"

#pragma DATA_SEG SHORT DEFAULT_RAM
#define left()	{PBDR=0x02;}
#define right()	{PBDR=0x04;}
	unsigned char i;

void sleep(unsigned int iTime)
{
	while(iTime>0)
	{
		iTime--;
	}
}

/*****************************************************************************/
@interrupt void itExt1(void)
{
	/*
	unsigned char v1;
	unsigned char v2;
	unsigned char i;
	*/

	//v1 = PADR;
	/*i = 1;
	while(i>0)
	{
		i--;
	}
	v2 = _btst(PADR, 4);

	
	if(v1==v2)
	{*/
	//DisableInterrupts();
	if (_btst(PADR, 4))
	{
		i = 0x01;
	}
	else
	{
		i = 0x10;
	}
	sleep(20);
	if (_btst(PADR, 4))
	{
		i += 0x01;
	}
	else
	{
		i += 0x10;
	}

	if (i==0x02)
	{
		left();
		
	}
	else if (i==0x20)
	{
		right();
	}
	
	//EnableInterrupts();
}

@interrupt void itExt0(void)
{
	if(_btst(PADR, 0))
	{
		_bres(PBDR, 0);
	}
	else
	{
		_bset(PBDR, 0);
	}
}

/*****************************************************************************/
void init(void)
{
	//Port configuration	
	//A0 = fiber input    - PIN 5
	//A1 = fiber output   - PIN 6 - Out 1
	//A2 = Green Led      - 
	//A3 = White Led      - PIN 7 - Out 2
	//A4 = Camera Shutter - PIN 8 - Out 3
	PADR 	= 0x00;       
	PADDR 	= 0x00; // 0,4,7 input
	PAOR 	= 0xFF; // pull-up
	PADR 	= 0x00;       
	
	PBDR 	= 0x00;  	
	PBDDR 	= 0xFF;	// output
	PBOR 	= 0xFF; // push-pull
	PBDR 	= 0x00;  	
	
	//External interrupt control register
	EICR 	= 0b00000111;    //ei1=raising and falling edge
	
	EnableInterrupts();
}	

/*****************************************************************************/
void main(void)
{
	init();
	while(1)
	{
		Nop();
	}

}
