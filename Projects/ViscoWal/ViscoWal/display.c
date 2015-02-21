#include "display.h"
#include "display_navigation.h"


/*****************************************************************************/
// Variables declaration
/*****************************************************************************/
static volatile BYTE 		m_enmKeyIRQReceived					= KEY_NULL;
static volatile BYTE 		m_enmTraslatedKeyPressed 			= KEY_NULL;
static volatile BYTE 		m_enmPreviousWasRemoteKey 			= false;
static volatile BYTE 		m_enmKeyPressed[2];
@near 			BYTE 		m_arbyDisplayCommand[DISPLAY_CMD_BUFFER];



/*****************************************************************************/
// Private declaration
/*****************************************************************************/
void displayCmdToDisplay(STRING strMessage);
void displayClearCommandBuffer(void);
void displayTraslateKeyPressed(void);


/*****************************************************************************/
void displayKeyPressedReset(void)
{
	m_enmTraslatedKeyPressed = KEY_NULL;
}


/*****************************************************************************/
BYTE displayGetKeyPressed(void)
{
	BYTE byKey1;
	BYTE byKey2;
	BYTE byKey3;	
	if (_btst(_Pa_ButtonInk, _Pin_ButtonInk) && _btst(_Pa_ButtonSolvent, _Pin_ButtonSolvent))
	{
		sleep(parametersGetValue(PARAM_KEYBOARD_DELAY));
		if (_btst(_Pa_ButtonInk, _Pin_ButtonInk) && _btst(_Pa_ButtonSolvent, _Pin_ButtonSolvent))
		{
			m_enmTraslatedKeyPressed = KEY_R_BOTH;
			m_enmPreviousWasRemoteKey = true;
		}
	}
	else if _btst(_Pa_ButtonInk, _Pin_ButtonInk)
	{
		sleep(parametersGetValue(PARAM_KEYBOARD_DELAY));
		if _btst(_Pa_ButtonInk, _Pin_ButtonInk)
		{
			m_enmTraslatedKeyPressed = KEY_R_INK;
			m_enmPreviousWasRemoteKey = true;
		}
	}
	else if _btst(_Pa_ButtonSolvent, _Pin_ButtonSolvent)
	{
		sleep(parametersGetValue(PARAM_KEYBOARD_DELAY));
		if _btst(_Pa_ButtonSolvent, _Pin_ButtonSolvent)
		{
			m_enmTraslatedKeyPressed = KEY_R_SOLVENT;
			m_enmPreviousWasRemoteKey = true;
		}
	}	
	else if (m_enmPreviousWasRemoteKey)
	{
		m_enmPreviousWasRemoteKey = false;
		m_enmTraslatedKeyPressed = KEY_RELEASED;
	}
	else if (m_enmKeyIRQReceived)
	{
		m_enmPreviousWasRemoteKey = false;
		
		#ifdef DISPLAY_922_KEYBOARD
			#ifdef CPU_4Mhz
				sleep(parametersGetValue(PARAM_KEYBOARD_DELAY)*5);
			#endif
			#ifdef CPU_8Mhz
				sleep(parametersGetValue(PARAM_KEYBOARD_DELAY)*10);
			#endif
			#ifdef CPU_16Mhz
				sleep(parametersGetValue(PARAM_KEYBOARD_DELAY)*20);
			#endif
		#endif
		_bres(_Pa_Select_UA, _Pin_Select_UA);
		_bres(_Pa_Select_UB, _Pin_Select_UB);
		_bres(_Pa_Select_UC, _Pin_Select_UC);
		_bset(_Pa_Select_U2, _Pin_Select_U2);
	
		//Send Read Port Command
		SPI_MoveByte(DISPLAY_FUNCTION_SET_2);
		SPI_MoveByte(DISPLAY_READ_PORT);
	
		while(!_btst(_Pa_DisplayBusy, _Pin_DisplayBusy) )
		{
			Nop();
		}
	
		//Get received key
		byKey1 = SPI_MoveByte(DISPLAY_HOME);
		
		#ifdef DISPLAY_922_KEYBOARD
			if ((byKey1&0b01111111) == (m_enmKeyPressed[0]&0b01111111))
			{
				if _btst(byKey1, 7)
				{
					m_enmKeyPressed[0] = byKey1;
					/*
					sleep(100);
					SPI_MoveByte(DISPLAY_FUNCTION_SET_2);
					SPI_MoveByte(DISPLAY_READ_PORT);
				
					while(!_btst(_Pa_DisplayBusy, _Pin_DisplayBusy) )
					{
						Nop();
					}
				
					//Get received key
					byKey2 = SPI_MoveByte(DISPLAY_HOME);
				
					if ((byKey1&0b01111111) == (byKey2&0b01111111))
					{
						m_enmKeyPressed[1] = m_enmKeyPressed[0];
						m_enmKeyPressed[0] = byKey1;
						m_enmKeyIRQReceived = false;
					}					*/
				}
				else
				{
					m_enmKeyPressed[0] = m_enmKeyPressed[0]&0b01111111;
				}
				m_enmKeyIRQReceived = false;
			}		
			else
			{
				//Send Read Port Command
				sleep(parametersGetValue(PARAM_KEYBOARD_DELAY));
				SPI_MoveByte(DISPLAY_FUNCTION_SET_2);
				SPI_MoveByte(DISPLAY_READ_PORT);
			
				while(!_btst(_Pa_DisplayBusy, _Pin_DisplayBusy) )
				{
					Nop();
				}
			
				//Get received key
				byKey2 = SPI_MoveByte(DISPLAY_HOME);
			
				if ((byKey1&0b01111111) == (byKey2&0b01111111))
				{
					m_enmKeyPressed[1] = m_enmKeyPressed[0];
					if _btst(byKey1, 7)
					{
						m_enmKeyPressed[0] = byKey1;
					}
					else
					{
						m_enmKeyPressed[0] = m_enmKeyPressed[1]&0b01111111;
					}
					m_enmKeyIRQReceived = false;
				}
				/*
				else
				{
					//Send Read Port Command
					SPI_MoveByte(DISPLAY_FUNCTION_SET_2);
					SPI_MoveByte(DISPLAY_READ_PORT);
				
					while(!_btst(_Pa_DisplayBusy, _Pin_DisplayBusy) )
					{
						Nop();
					}
				
					//Get received key
					byKey3 = SPI_MoveByte(DISPLAY_HOME);		
					if ((byKey2&0b01111111) == (byKey3&0b01111111))
					{
						m_enmKeyPressed[1] = m_enmKeyPressed[0];
						if _btst(byKey2, 7)
						{
							m_enmKeyPressed[0] = byKey2;
						}
						else
						{
							m_enmKeyPressed[0] = m_enmKeyPressed[1]&0b01111111;
						}
						m_enmKeyIRQReceived = false;
					}			
				}*/
			}
		#else
			m_enmKeyPressed[0] = byKey1;
			m_enmKeyIRQReceived = false;
		#endif

		_bres(_Pa_Select_UA, _Pin_Select_UA);
		_bres(_Pa_Select_UB, _Pin_Select_UB);
		_bres(_Pa_Select_UC, _Pin_Select_UC);
		_bres(_Pa_Select_U2, _Pin_Select_U2);	
		
		displayTraslateKeyPressed();
	}

	return m_enmTraslatedKeyPressed;

}

/*****************************************************************************/
BYTE displayIsKeyPressed(void)
{
	return m_enmKeyIRQReceived;
}


/*****************************************************************************/
void displayTraslateKeyPressed(void)
{
	switch(m_enmKeyPressed[0])
	{
		case 0b01001000: 
			m_enmTraslatedKeyPressed = KEY_SOLVENT;
			break;
		case 0b10001000: 
			m_enmTraslatedKeyPressed = KEY_PH;
			break;
		case 0b00100100: 
			m_enmTraslatedKeyPressed = KEY_WASHING;
			break;
		case 0b00010100: 
			m_enmTraslatedKeyPressed = KEY_FUNCTION;
			break;
		case 0b10000001:
			m_enmTraslatedKeyPressed = KEY_ARROW_UP_F;
			break;
		case 0b01000001: 
			m_enmTraslatedKeyPressed = KEY_ARROW_DOWN_F;
			break;
		case 0b01000010:
			m_enmTraslatedKeyPressed = KEY_ARROW_DOWN;
			break;
		case 0b10000010: 
			m_enmTraslatedKeyPressed = KEY_ARROW_UP;
			break;
		case 0b00010010:   
			m_enmTraslatedKeyPressed = KEY_OK;
			break;
		case 0b00100010: 
			m_enmTraslatedKeyPressed = KEY_CANCEL;
			break;
		case 0b00010001: 
			m_enmTraslatedKeyPressed = KEY_MENU;
			break;
		case 0b00100001: 
			m_enmTraslatedKeyPressed = KEY_ARCHIVE;
			break;
		case 0b01000100: 
			m_enmTraslatedKeyPressed = KEY_OFF;
			break;
		case 0b10000100: 
			m_enmTraslatedKeyPressed = KEY_PAUSE;
			break;
		case 0b00011000: 
			m_enmTraslatedKeyPressed = KEY_MODE;
			break;
		case 0b00101000: 
			m_enmTraslatedKeyPressed = KEY_VISUAL;
			break;
		default:
			/*
			if (!_btst(m_enmKeyPressed[0],7))
			{
				m_enmTraslatedKeyPressed = KEY_RELEASED;
			}
			else
			{
				
			}*/
			m_enmTraslatedKeyPressed = KEY_NULL;
			break;
	}	
}

/*****************************************************************************/
@interrupt 
void displayKeyboardIRQ(void)
{
	DisableInterrupts();
	m_enmKeyIRQReceived = true;
	EnableInterrupts();
}

/*****************************************************************************/
void displayInit(void)
{
	BYTE strString[30];	

	memcpy(strString, mc_strVersion, 30); 
	formatNumber(mc_byApplicationVersion, 4, 2, strString+8);
	formatNumber(parametersGetSerialNumber(), 3, 0, strString+13);
	sleep(1000);
	displayCmdToDisplay(mc_strReset);
	displayCmdToDisplay(mc_strLogo);
	displayCmdToDisplay(strString);
	//sleepSec(0x01);
	
	m_enmTraslatedKeyPressed = KEY_NULL;
	m_enmKeyPressed[0] 		= KEY_NULL;
	m_enmKeyPressed[1] 		= KEY_NULL;
	m_enmKeyIRQReceived 	= false;
}


/*****************************************************************************/
void displayOff(void)
{
	if (parametersGetValue(PARAM_MODE) == PARAM_MODE_OFF)
	{
		//displayCmdToDisplay(mc_strLogo);
		m_arbyDisplayCommand[0] = DISPLAY_FUNCTION_SET_2;
		m_arbyDisplayCommand[1] = DISPLAY_POWER_ON;
		m_arbyDisplayCommand[2] = DISPLAY_EOF;		
		displayCmdToDisplay(m_arbyDisplayCommand);	
		parametersSet(PARAM_MODE, !parametersGetValue(PARAM_MODE_MANUAL));
	}
	else
	{
		displayCmdToDisplay(mc_strRecClear);
		m_arbyDisplayCommand[0] = DISPLAY_FUNCTION_SET_2;
		m_arbyDisplayCommand[1] = DISPLAY_POWER_OFF;
		m_arbyDisplayCommand[2] = DISPLAY_EOF;		
		displayCmdToDisplay(m_arbyDisplayCommand);	
		parametersSet(PARAM_MODE, !parametersGetValue(PARAM_MODE_OFF));
	}

}

/*****************************************************************************/
void displayReset(void)
{
	displayCmdToDisplay(mc_strReset);
	sleepFix();
}


/*****************************************************************************/
void displayCmdToDisplay(STRING a_strMessage)
{
	BYTE i = 0x00;
	BYTE byGraphics = 0x00;

	_bres(_Pa_Select_UA, _Pin_Select_UA);
	_bres(_Pa_Select_UB, _Pin_Select_UB);
	_bres(_Pa_Select_UC, _Pin_Select_UC);
	_bset(_Pa_Select_U2, _Pin_Select_U2);
	
	if (a_strMessage[0] < 0x20)
	{
		//command
		while((a_strMessage[i]!=DISPLAY_EOF) || (byGraphics >0))
		{
			if((a_strMessage[i]==DISPLAY_GRAPHIC_WRITE) && (byGraphics==0) && ((i==0) || (a_strMessage[i-1]==DISPLAY_WAIT)))
			{
				byGraphics = a_strMessage[i+1]+2;
			}
			
			if((a_strMessage[i]!=DISPLAY_WAIT) || (byGraphics >0))
			{
				SPI_MoveByte(a_strMessage[i]);
				#ifdef CPU_4Mhz
					sleep(1); //Requested only if 4MHz
				#endif
				#ifdef CPU_8Mhz
					sleep(1); //Requested only if 8MHz
				#endif
				#ifdef CPU_16Mhz
					sleep(2); //Requested only if 8MHz
				#endif
			}
			
			if (byGraphics>0)
			{
				byGraphics--;
			}
			
			i++;

			while(!_btst(_Pa_DisplayBusy, _Pin_DisplayBusy) && ((a_strMessage[i]!=DISPLAY_EOF) || (byGraphics >0)))
			{
				Nop();
			}

		}		
	}
	else 
	{
		//string
		while(a_strMessage[i]!=0x00)
		{
			SPI_MoveByte(a_strMessage[i]);
			#ifdef CPU_4Mhz
				sleep(15); //15 
			#endif
			#ifdef CPU_8Mhz
				sleep(80);
			#endif
			#ifdef CPU_16Mhz
				sleep(160);
			#endif		
			i++;
		}		
	}

	_bres(_Pa_Select_UA, _Pin_Select_UA);
	_bres(_Pa_Select_UB, _Pin_Select_UB);
	_bres(_Pa_Select_UC, _Pin_Select_UC);
	_bres(_Pa_Select_U2, _Pin_Select_U2);	
}


/*****************************************************************************/
void displayClearCommandBuffer(void)
{
	WORD woIndex = 0x0200;
	while(woIndex>0)
	{
		m_arbyDisplayCommand[--woIndex] = 0x00;
	}
}


/*****************************************************************************/
void displayWriteString(BYTE * a_strValue, BYTE a_byFontSize, BYTE a_byX, BYTE a_byY)
{
	BYTE i = 0x00;
	
	//Set Cursor Position
	if (a_byX != DISPLAY_NULL)
	{
		m_arbyDisplayCommand[i++] = DISPLAY_CURSOR_POSITION;
		m_arbyDisplayCommand[i++] = a_byX;
		m_arbyDisplayCommand[i++] = a_byY;
		m_arbyDisplayCommand[i++] = DISPLAY_WAIT;
	}
	
	//Set Font
	if (a_byFontSize != DISPLAY_NULL)
	{
		m_arbyDisplayCommand[i++] = a_byFontSize;
		m_arbyDisplayCommand[i++] = DISPLAY_WAIT;
	}

	i +=memcpy((m_arbyDisplayCommand+i), a_strValue, DISPLAY_CMD_BUFFER-i);
	
	m_arbyDisplayCommand[i++] = DISPLAY_WAIT;
	m_arbyDisplayCommand[i++] = DISPLAY_WAIT;
	m_arbyDisplayCommand[i++] = DISPLAY_EOF;		
	m_arbyDisplayCommand[i++] = 0x00;
	
	displayCmdToDisplay(m_arbyDisplayCommand);
}

/*****************************************************************************/
void displaySetArea(BYTE a_byLeft, BYTE a_byTop, BYTE a_byRight, BYTE a_byBottom)
{
	BYTE i = 0x00;
	m_arbyDisplayCommand[i++] = DISPLAY_SET_AREA;
	m_arbyDisplayCommand[i++] = a_byLeft;
	m_arbyDisplayCommand[i++] = a_byTop;
	m_arbyDisplayCommand[i++] = a_byRight;
	m_arbyDisplayCommand[i++] = a_byBottom;
	m_arbyDisplayCommand[i++] = DISPLAY_WAIT;
	m_arbyDisplayCommand[i++] = DISPLAY_EOF;		
	
	displayCmdToDisplay(m_arbyDisplayCommand);
}

/*****************************************************************************/
void displaySetOutLine(BYTE a_byLeft, BYTE a_byTop, BYTE a_byRight, BYTE a_byBottom, BYTE a_byReversed)
{
	BYTE i = 0x00;
	m_arbyDisplayCommand[i++] = DISPLAY_SET_OUTLINE;
	m_arbyDisplayCommand[i++] = a_byLeft;
	m_arbyDisplayCommand[i++] = a_byTop;
	m_arbyDisplayCommand[i++] = a_byRight;
	m_arbyDisplayCommand[i++] = a_byBottom;
	m_arbyDisplayCommand[i++] = DISPLAY_WAIT;
	m_arbyDisplayCommand[i++] = DISPLAY_EOF;		
	
	displayCmdToDisplay(m_arbyDisplayCommand);
	
	if (a_byReversed)
	{
		displayInvertArea(a_byLeft + 1, a_byTop + 1, a_byRight - 1, a_byBottom - 1);
	}
}

/*****************************************************************************/
void displayClearArea(BYTE a_byLeft, BYTE a_byTop, BYTE a_byRight, BYTE a_byBottom)
{
	BYTE i = 0x00;
	m_arbyDisplayCommand[i++] = DISPLAY_CLEAR_AREA;
	m_arbyDisplayCommand[i++] = a_byLeft;
	m_arbyDisplayCommand[i++] = a_byTop;
	m_arbyDisplayCommand[i++] = a_byRight;
	m_arbyDisplayCommand[i++] = a_byBottom;
	m_arbyDisplayCommand[i++] = DISPLAY_WAIT;
	m_arbyDisplayCommand[i++] = DISPLAY_EOF;		
	
	displayCmdToDisplay(m_arbyDisplayCommand);
}

/*****************************************************************************/
void displayInvertArea(BYTE a_byLeft, BYTE a_byTop, BYTE a_byRight, BYTE a_byBottom)
{
	BYTE i = 0x00;
	m_arbyDisplayCommand[i++] = DISPLAY_INVERT_AREA;
	m_arbyDisplayCommand[i++] = a_byLeft;
	m_arbyDisplayCommand[i++] = a_byTop;
	m_arbyDisplayCommand[i++] = (a_byRight>124?124:a_byRight);
	m_arbyDisplayCommand[i++] = (a_byBottom>62?62:a_byBottom);
	m_arbyDisplayCommand[i++] = DISPLAY_WAIT;
	m_arbyDisplayCommand[i++] = DISPLAY_EOF;		
	
	displayCmdToDisplay(m_arbyDisplayCommand);
}

/*****************************************************************************/
void displayDrawVerticalLine(BYTE a_byX, BYTE a_byTop, BYTE a_byLength)
{
	displaySetArea(a_byX, a_byTop, a_byX, a_byTop + a_byLength);
}

/*****************************************************************************/
void displayDrawHorizontalLine(BYTE a_byY, BYTE a_byLeft, BYTE a_byWidth)
{
	displaySetArea(a_byLeft, a_byY, a_byLeft+a_byWidth, a_byY);
}

/*****************************************************************************/
void displayDrawLed(BYTE a_byX, BYTE a_byY, BYTE a_byFilled)
{
	BYTE i = 0x00;

	//Set Cursor Position
	if (a_byX != DISPLAY_NULL)
	{
		m_arbyDisplayCommand[i++] = DISPLAY_CURSOR_POSITION;
		m_arbyDisplayCommand[i++] = a_byX - 2;
		m_arbyDisplayCommand[i++] = a_byY;
		m_arbyDisplayCommand[i++] = DISPLAY_WAIT;
	}
	m_arbyDisplayCommand[i++] = DISPLAY_GRAPHIC_WRITE;
    m_arbyDisplayCommand[i++] = 8; //Length


	if (a_byFilled)
	{
		m_arbyDisplayCommand[i++] = 0x30;
		m_arbyDisplayCommand[i++] = 0x78;
		m_arbyDisplayCommand[i++] = 0xFC;
		m_arbyDisplayCommand[i++] = 0xFC;
		m_arbyDisplayCommand[i++] = 0x78;
		m_arbyDisplayCommand[i++] = 0x30;
		m_arbyDisplayCommand[i++] = 0x00;
		m_arbyDisplayCommand[i++] = 0x00;		
	}
	else
	{
		m_arbyDisplayCommand[i++] = 0x30;
		m_arbyDisplayCommand[i++] = 0x48;
		m_arbyDisplayCommand[i++] = 0x84;
		m_arbyDisplayCommand[i++] = 0x84;
		m_arbyDisplayCommand[i++] = 0x48;
		m_arbyDisplayCommand[i++] = 0x30;
		m_arbyDisplayCommand[i++] = 0x00;
		m_arbyDisplayCommand[i++] = 0x00;		
	}
	
	m_arbyDisplayCommand[i++] = DISPLAY_WAIT;
	m_arbyDisplayCommand[i++] = DISPLAY_EOF;		

	displayCmdToDisplay(m_arbyDisplayCommand);	
}


/*****************************************************************************/
void displayDrawSelector(BYTE a_byX, BYTE a_byY, BYTE a_byFilled, BYTE a_byReversed)
{
	BYTE i = 0x00;
	
	i=0;
	
	//Set Cursor Position
	if (a_byX != DISPLAY_NULL)
	{
		m_arbyDisplayCommand[i++] = DISPLAY_CURSOR_POSITION;
		m_arbyDisplayCommand[i++] = a_byX-1;
		m_arbyDisplayCommand[i++] = a_byY;
		m_arbyDisplayCommand[i++] = DISPLAY_WAIT;
	}

	m_arbyDisplayCommand[i++] = DISPLAY_GRAPHIC_WRITE;


	if (a_byReversed)
	{
		if (a_byFilled)
		{
			m_arbyDisplayCommand[i++] = 3; //Length
			m_arbyDisplayCommand[i++] = 0xFE;
			m_arbyDisplayCommand[i++] = 0xFF;
			m_arbyDisplayCommand[i++] = 0xFE;
		}
		else
		{
			
			m_arbyDisplayCommand[i++] = 3; //Length
			m_arbyDisplayCommand[i++] = 0xFE;
			m_arbyDisplayCommand[i++] = 0x81;
			m_arbyDisplayCommand[i++] = 0xFE;
		}
	}
	else
	{
		if (a_byFilled)
		{
			m_arbyDisplayCommand[i++] = 8; //Length
			m_arbyDisplayCommand[i++] = 0x00;
			m_arbyDisplayCommand[i++] = 0x10;
			m_arbyDisplayCommand[i++] = 0x38;
			m_arbyDisplayCommand[i++] = 0x38;
			m_arbyDisplayCommand[i++] = 0x38;
			m_arbyDisplayCommand[i++] = 0x38;
			m_arbyDisplayCommand[i++] = 0x38;
			m_arbyDisplayCommand[i++] = 0x00;
		}
		else
		{
			m_arbyDisplayCommand[i++] = 8; //Length
			m_arbyDisplayCommand[i++] = 0x00;
			m_arbyDisplayCommand[i++] = 0x10;
			m_arbyDisplayCommand[i++] = 0x28;
			m_arbyDisplayCommand[i++] = 0x28;
			m_arbyDisplayCommand[i++] = 0x28;
			m_arbyDisplayCommand[i++] = 0x28;
			m_arbyDisplayCommand[i++] = 0x38;
			m_arbyDisplayCommand[i++] = 0x00;
		}	
	}

	m_arbyDisplayCommand[i++] = DISPLAY_WAIT;
	m_arbyDisplayCommand[i++] = DISPLAY_EOF;		

	displayCmdToDisplay(m_arbyDisplayCommand);
}

/*****************************************************************************/
void displayDrawAlarm(BYTE a_byX, BYTE a_byY)
{
	BYTE i = 0x00;
	
	if (a_byX != DISPLAY_NULL)
	{
		m_arbyDisplayCommand[i++] = DISPLAY_CURSOR_POSITION;
		m_arbyDisplayCommand[i++] = a_byX + 2;
		m_arbyDisplayCommand[i++] = a_byY +7 ;
		m_arbyDisplayCommand[i++] = DISPLAY_WAIT;
	}

	m_arbyDisplayCommand[i++] = DISPLAY_GRAPHIC_WRITE;
	m_arbyDisplayCommand[i++] = 7; //Length
	
	
	m_arbyDisplayCommand[i++] = 0x04;
	m_arbyDisplayCommand[i++] = 0x3A;
	m_arbyDisplayCommand[i++] = 0x42;
	m_arbyDisplayCommand[i++] = 0xC2;
	m_arbyDisplayCommand[i++] = 0x43;
	m_arbyDisplayCommand[i++] = 0x3A;
	m_arbyDisplayCommand[i++] = 0x04;

	m_arbyDisplayCommand[i++] = DISPLAY_WAIT;
	m_arbyDisplayCommand[i++] = DISPLAY_EOF;		

	displayCmdToDisplay(m_arbyDisplayCommand);			
}

/*****************************************************************************/
void displayDrawValveStatus(BYTE a_byX, BYTE a_byY)
{
	displayClearArea(a_byX + 2, a_byY +8, a_byX +40, a_byY +13);

	switch(parametersGetValue(PARAM_VALVES))
	{
		case VALVES_CLOSED:		
			if (parametersGetValue(PARAM_MODE)!=PARAM_MODE_OFF)
			{
				displayWriteString("Measure", DISPLAY_SELECT_FONT_MINI, a_byX + 2, a_byY+13);
			}
			else
			{
				displayWriteString("Closed", DISPLAY_SELECT_FONT_MINI, a_byX + 2, a_byY+13);
			}
			break;
		case VALVES_MEASURING:
			displayWriteString("Measure", DISPLAY_SELECT_FONT_MINI, a_byX + 2, a_byY+13);
			break;
			
		case VALVES_ADDSOLVENT:
			displayWriteString("Solv", DISPLAY_SELECT_FONT_MINI, a_byX + 2, a_byY+13);
			break;
			
		case VALVES_ADDPH:
			displayWriteString("pH", DISPLAY_SELECT_FONT_MINI, a_byX + 2, a_byY+13);
			break;
			
		case VALVES_WASH:
			displayWriteString("Wash", DISPLAY_SELECT_FONT_MINI, a_byX + 2, a_byY+13);
			break;

		default: //VALVES_OPENED
			//displayWriteString("Open", DISPLAY_SELECT_FONT_MINI, a_byX + 2, a_byY+13);
			//displayClearArea(a_byX + 2, a_byY +8, a_byX +40, a_byY +13);
			break;
	}
}

/*****************************************************************************/
void displayDrawBox(BYTE a_byLeft, BYTE a_byTop, BYTE a_byWidth, BYTE a_byHeigth, BYTE * a_strLabel, BYTE * a_strLabel2, WORD a_woValue, BYTE a_byLength, BYTE a_byDecimal, BYTE a_byRefresh)
{
	BYTE byRight;
	BYTE strString[16];
	
	byRight = a_byLeft + a_byWidth;
	
	if (!a_byRefresh)
	{
		displayClearArea(a_byLeft, a_byTop, byRight + 1, a_byTop + a_byHeigth + 1);
		displaySetOutLine(a_byLeft, a_byTop, byRight, a_byTop + a_byHeigth, false);
		
		if (a_strLabel != NULL)
		{
			displayWriteString(a_strLabel, DISPLAY_SELECT_FONT_MINI, a_byLeft + 2, a_byTop + 6);
	
			if (byRight == 126) //workaround
			{
				displayInvertArea(a_byLeft + 1, a_byTop + 1, byRight - 2, a_byTop + 6);
			}
			else
			{
				displayInvertArea(a_byLeft + 1, a_byTop + 1, byRight - 1, a_byTop + 6);
			}
		}
	
		if(a_strLabel2 != NULL)
		{
			displayWriteString(a_strLabel2, DISPLAY_SELECT_FONT_MINI, a_byLeft + 2, a_byTop + a_byHeigth - 2);
		}
	} 
	
	if ((a_byRefresh) && (a_woValue == 0xFFFF))
	{
		displayClearArea(a_byLeft+1, a_byTop+7, byRight - 1, a_byTop + a_byHeigth - 1);
		displayWriteString(a_strLabel2, DISPLAY_SELECT_FONT_MINI, a_byLeft + 2, a_byTop + a_byHeigth - 2);
	}

	if (a_woValue != 0xFFFF)
	{
		formatNumber(a_woValue, a_byLength, a_byDecimal, strString);
		strString[a_byLength] = 0x00;
		
		displayWriteString(strString, DISPLAY_SELECT_FONT_5x7, byRight - (a_byLength * 6) - 1, a_byTop + a_byHeigth - 1);
	}
	
}
