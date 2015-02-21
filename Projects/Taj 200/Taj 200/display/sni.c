#include "sni.h"

#ifdef CPU_8Mhz
	#define TIMER_10ms	1250	/*10ms @ 8MHz */
	//#define TIMER_10ms	10000	/*10ms @ 8MHz */
#else /*CPU_4Mhz*/
	//#define TIMER_10ms	 5000	/*10ms @ 4MHz */
	#define TIMER_10ms	 625	/*10ms @ 4MHz */
#endif

WORD	m_woSNITimeout;

BYTE 	m_arbySNIValues[20];
BYTE	m_bySNIIndexValue;

BYTE	m_byCounter;
LWORD	m_lwoData;
LWORD	m_lwoReceivedData;
BYTE 	m_byTimerLO;
BYTE 	m_byTimerHI;
BYTE	m_byPrevClockHI;
BYTE 	m_byNumBitReceived;



/*****************************************************************************/
void SNI_Init(void)
{
	BYTE byTemp;

	m_byCounter = 0x00;
	m_lwoData	= 0x00000000;
	m_lwoReceivedData = 0x00000000;
	m_byNumBitReceived = 0x00;
	m_byPrevClockHI = false;
	
	/*
	//CR1 Register
	//0 = OLVL1 Output Level 1
	//1 = IEDG1 Input Edge 1
	//		00 = falling edge
	//		02 = raising edge	
	//2 = OLVL2 Output Level 2
	//3 = FOLV1 Forced Output Compare 1
	//4 = FOLV2 Forced Output Compare 2
	//5 = TOIE  Timer Overflow Interrupt Enable
	//6 = OCIE  Output Compare Interrupt Enable
	//7 = ICIE  Input  Capture Interrupt Enable
	TACR1 = 0b00000000; 	
	
	//CR2 Register
	//0 = EXEDG External Clock Edge
	//1 = IEDG2 Input Edge 2
	//		00 = falling edge
	//		02 = raising edge
	//2 = CC0  Clock Control
	//3 = CC1
	//		CC = 00	fcpu/4	
	//		CC = 04	fcpu/2
	//		CC = 08	fcpu/8
	//		CC = 0C	External from EXCLK_A pin
	//4 = PWM  Pulse Width Modulation
	//5 = OPM  One Pulse Mode
	//6 = OC2E Output Compare 2 Pin Enable
	//7 = OC1E Output Compare 1 Pin Enable
	
	TACR2 = 0b00001000;	//fcpu/8	
	
	
	//SR Register
	//0 = Reserved
	//1 = Reserved
	//2 = TIMD Timer disabled
	//      0=Timer Enable
	//      1=Timer Disable
	//3 = OCF2 Output Compare Flag 2
	//4 = ICF2 Input Compare Flag 2
	//5 = TOF Timer overflow flag
	//6 = OCF1 Output Compare Flag 1
	//7 = ICF1 Input Compare Flag 1
	TASR = 0b00000000; //Timer Enable
	
	TAOC1HR = HIBYTE(TIMER_10ms);	//10ms @ 8MHz
	TAOC1LR = LOBYTE(TIMER_10ms);
	
	byTemp = TACHR;
	byTemp = TACLR;	//To reset the timer and flags

	*/
	
	m_byTimerLO = LOBYTE(parametersGetValue(PARAM_SNI_TIMER));
	m_byTimerHI = HIBYTE(parametersGetValue(PARAM_SNI_TIMER));

	//ARTCAR Actual Counter value
	ARTCAR = 0x00;
	
	//ARTARR Auto-Reload counter
	ARTARR = m_byTimerLO;
	
	
	if(parametersGetValue(PARAM_SNI_TIMER)>0)
	{
		//ARTCSR Status register
		//0  = OVF Overflow flag
		//1  = OIE Overflow IRQ enabled
		//2  = FCRL Force reload (only to use in init)
		//3  = TCE Timer enabled
		//456= CC Prescaler = 64 
		//7  = EXCL Timer internal/External
		ARTCSR = 0b01101110; //Force reload, Internal timer enabled with prescaler = 64, IRQ enabled
	}
	else
	{
		ARTCSR = 0b01100110; //Timer disabled
	}

}

/*****************************************************************************/
@interrupt
void SNI_Interrupt(void)
{
	BYTE byARTCSR;
	BYTE byPort;
	byARTCSR = ARTCSR; //Reset the flag
	if(m_byCounter == m_byTimerHI)
	{
		//TODO: to remove
		_switch(PGDR,4); 
		m_byCounter = 0x00;
		
		if _btst(_Pa_SNI_Clk, _Pin_SNI_Clk)
		{
			//If SNI_Clock is high..
			if (!m_byPrevClockHI)
			{
				//and previous clock was low
				m_byNumBitReceived++;

				//data has to be updated
				m_lwoData = (LWORD) m_lwoData << 1;
				if _btst(_Pa_SNI_In, _Pin_SNI_In)
				{
					_bset(m_lwoData, 0);
				}
			}
			else
			{
				//Error... Clock high twice 
				m_byNumBitReceived = 0x00;
				m_lwoData = 0x00000000;
			}
			m_byPrevClockHI = true;
		}
		else
		{
			//If SNI_Clock is low..
			if (!m_byPrevClockHI)
			{
				//and previous clock was low
				//I'm in clear time
				
				if (m_byNumBitReceived >= 24)
				{
					m_lwoReceivedData = m_lwoData;
					
				}
				m_byNumBitReceived = 0x00;
				m_lwoData = 0x00000000;
			}
			m_byPrevClockHI = false;
		}
	}
	m_byCounter++;
	

	/*
	BYTE byStatus;
	WORD woCounter;
	//procedure suggested by manual
	//split the writing on TAO1C to avoid  OCF1 to be set in the meantime
	
	TAOC1HR = HIBYTE(TIMER_10ms);
	byStatus = TASR;
	TAOC1LR = LOBYTE(TIMER_10ms);


	//6 = OCF1 Output Compare Flag 1
	if _btst(byStatus, 6)
	{
		woCounter = TACHR*256;
		woCounter += TACLR;	//To reset the timer and flags		
	}
	else
	{
		if (woCounter>TAOC1LR)		
	}
	*/
}


/*****************************************************************************/
BYTE SNI_ReceivedCmd(void)
{
	if ((m_lwoReceivedData & SNI_MASK_FUNZ_CYLINDER_TRAVEL) == SNI_FUNZ_CYLINDER_TRAVEL)
	{
		parametersSet(PARAM_CYLINDER_TRAVEL, BCDtoHEX(m_lwoReceivedData & SNI_PARAM_CYLINDER_TRAVEL));
		m_lwoReceivedData = 0x00000000;
	}
	else if((m_lwoReceivedData & SNI_MASK_FUNZ_PHASE_FAST) == SNI_FUNZ_PHASE_FAST)
	{
		m_lwoReceivedData = 0x00000000;
		return PAGE_PHASE_FAST;
	}
	else if((m_lwoReceivedData & SNI_MASK_FUNZ_TEST_OUTPUT) == SNI_FUNZ_TEST_OUTPUT) 
	{
		m_lwoReceivedData = 0x00000000;
		return PAGE_EXECUTE_T3;
	}

	else if((m_lwoReceivedData & SNI_MASK_FUNZ_GO_MANUAL) == SNI_FUNZ_GO_MANUAL) 
	{
		m_lwoReceivedData = 0x00000000;

		//Set mode to MANUAL
		parametersSet(PARAM_MODE_LONG, 	PARAM_MODE_MANUAL);
		parametersSet(PARAM_MODE_TRANS, PARAM_MODE_MANUAL);
		parametersSet(PARAM_MODE_PULL, 	PARAM_MODE_MANUAL);
		//Force message to Z80
		STI_SendMessage(STI_FUNZ_WRITE_PARAM, STI_PARAM_MODE_LONG,  PARAM_MODE_MANUAL);
		STI_SendMessage(STI_FUNZ_WRITE_PARAM, STI_PARAM_MODE_TRANS, PARAM_MODE_MANUAL);
		STI_SendMessage(STI_FUNZ_WRITE_PARAM, STI_PARAM_MODE_PULL,  PARAM_MODE_MANUAL);

		//Write current output corrections = off
		parametersSet(PARAM_CORRECTION, STI_GetMessage(STI_PARAM_CORRECTIONS));				
		parametersSet(PARAM_CORRECTION, 0x0000);
	}
	else if((m_lwoReceivedData & SNI_MASK_FUNZ_GO_AUTO) == SNI_FUNZ_GO_AUTO) 
	{
		m_lwoReceivedData = 0x00000000;
		
		//Read current output corrections
		parametersSet(PARAM_CORRECTION, 		STI_GetMessage(STI_PARAM_CORRECTIONS));				

		//Set mode to AUTO
		parametersSet(PARAM_MODE_LONG, 	PARAM_MODE_AUTO);
		parametersSet(PARAM_MODE_TRANS, PARAM_MODE_AUTO);
		parametersSet(PARAM_MODE_PULL, 	PARAM_MODE_AUTO);
		//Force message to Z80
		STI_SendMessage(STI_FUNZ_WRITE_PARAM, STI_PARAM_MODE_LONG,  PARAM_MODE_AUTO);
		STI_SendMessage(STI_FUNZ_WRITE_PARAM, STI_PARAM_MODE_TRANS, PARAM_MODE_AUTO);
		STI_SendMessage(STI_FUNZ_WRITE_PARAM, STI_PARAM_MODE_PULL,  PARAM_MODE_AUTO);
	}
	else if((m_lwoReceivedData & SNI_MASK_FUNZ_EXECUTE_F4) == SNI_FUNZ_EXECUTE_F4)
	{
		m_lwoReceivedData = 0x00000000;
		return PAGE_EXECUTE_F4;
	}

	return PAGE_NONE;

}


/*****************************************************************************/
void SNI_ResetData(void)
{
	m_lwoReceivedData = 0x00000000;
}
