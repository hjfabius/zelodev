#include "common.h"
#include "common.h"

/*****************************************************************************/
// Variables declaration
/*****************************************************************************/
BYTE m_byCode;
BYTE m_byAdditionalCode;
WORD m_woValue;

BYTE m_byNextPage;
BYTE m_bySelection;
BYTE m_byPause;


static const unsigned char mc_displayPages[][] = {	
/* NONE=0          */ {NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA}, 
	};


/*****************************************************************************/
// Functions declaration
/*****************************************************************************/

/*****************************************************************************/
void displayAppInit(void)
{
	screenInit();
	parametersSet(PARAM_OSCIL_ZOOM, 0x0004);
	parametersSet(PARAM_OSCIL_OFFSET, 0x0000);
	m_byPause = false;
	
}

/*****************************************************************************/
void displayAppNavigate(void)
{
	BYTE byKey;
	WORD woValue;
	WORD woValueOffset;
	byKey = isDisplayKeyPressed();
	if (byKey != KEY_NULL)
	{	
		switch(byKey)
		{
			case KEY_ZOOM_IN:
				if (parametersGetValue(PARAM_OSCIL_ZOOM)>1)
				{
					woValue = parametersGetValue(PARAM_OSCIL_ZOOM)/2;
					parametersSet(PARAM_OSCIL_ZOOM,  woValue);
					woValueOffset = 32;
					while(woValue > 0x0000)
					{
						woValueOffset *= 2; 
						woValue = woValue>>1;
					}
					
					woValue = (parametersGetValue(PARAM_OSCIL_OFFSET) + woValueOffset)&(ENCODER_PULSES-1)&(ENCODER_PULSES-1);
					parametersSet(PARAM_OSCIL_OFFSET, woValue);
				}			
				break;
			case KEY_ZOOM_OUT:
				if (parametersGetValue(PARAM_OSCIL_ZOOM)<16)  
				{
					woValue = parametersGetValue(PARAM_OSCIL_ZOOM)*2;
					parametersSet(PARAM_OSCIL_ZOOM,  woValue);
					woValueOffset = 16;
					while(woValue > 0x0000)
					{
						woValueOffset *= 2; 
						woValue = woValue>>1;
					}
					
					woValue = (ENCODER_PULSES+parametersGetValue(PARAM_OSCIL_OFFSET) - woValueOffset)&(ENCODER_PULSES-1);
					parametersSet(PARAM_OSCIL_OFFSET, woValue);
				}			
				break;
			case KEY_GATE_LEFT:
				woValue = (parametersGetValue(PARAM_OSCIL_OFFSET)+4*parametersGetValue(PARAM_OSCIL_ZOOM))&(ENCODER_PULSES-1);
				parametersSet(PARAM_OSCIL_OFFSET, woValue);			
				break;
			case KEY_GATE_RIGHT:
				woValue = (ENCODER_PULSES+parametersGetValue(PARAM_OSCIL_OFFSET)-4*parametersGetValue(PARAM_OSCIL_ZOOM))&(ENCODER_PULSES-1);
				parametersSet(PARAM_OSCIL_OFFSET, woValue);			
				break;
			case KEY_OFF:
				//displayOff();
				break;
			case KEY_PAUSE:
				m_byPause != m_byPause;
				break;
			case KEY_CENTER:
				parametersSet(PARAM_OSCIL_OFFSET, 0xFFFF);
				//screenBigMessage("Center", "");
				break;
			case KEY_F1:
				//screenBigMessage("F1", "");
				break;
			case KEY_F2:
				//screenBigMessage("F2", "");
				break;
			case KEY_F3:
				//screenBigMessage("F3", "");
				break;
			default:
				break;
		}
	}
}


/*****************************************************************************/
void displayAppLoop(void)
{

	screenBigMessage("Test Encoder", "Zero channel");
	scanningHeadSignalTestEncoderZero();
	screenBigMessage("Test Encoder", "AB channels");
	scanningHeadSignalTestEncoderAB();
	screenBigMessage("Waiting Encoder", "signals");

	while(1)
	{
		if(!m_byPause)
		{
			if (!displayIsKeyPress())
				scanningHeadSignalAcquireGate();
		
			if (!displayIsKeyPress())
				scanningHeadSignalAcquire();
			
			if (!displayIsKeyPress())
				screenOscilloscope(PAGE_OSCILLOSCOPE);
		}

		displayAppNavigate();
	}
}