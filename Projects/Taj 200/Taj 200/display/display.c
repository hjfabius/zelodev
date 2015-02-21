#include "display.h"
#include "display_navigation.h"


/*****************************************************************************/
// Variables declaration
/*****************************************************************************/
static volatile BYTE 		m_enmKeyIRQReceived					= KEY_NULL;
static volatile BYTE 		m_enmTraslatedKeyPressed 			= KEY_NULL;
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
	
	if (m_enmKeyIRQReceived)
	{
		#ifdef DISPLAY_922_KEYBOARD
			#ifdef CPU_4Mhz
				sleep(parametersGetValue(PARAM_KEYBOARD_DELAY)*5);
			#endif
			#ifdef CPU_8Mhz
				sleep(parametersGetValue(PARAM_KEYBOARD_DELAY)*10);
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
	return m_enmKeyIRQReceived;/* && 
	        _btst(m_enmKeyPressed[0],7) &&
			(
				(m_enmKeyPressed[0] == 141) ||
				(m_enmKeyPressed[0] == 153) ||
				(m_enmKeyPressed[0] == 145) ||
				(m_enmKeyPressed[0] == 149)
			);*/
}


/*****************************************************************************/
void displayTraslateKeyPressed(void)
{
	switch(m_enmKeyPressed[0])
	{
		case 131:
			m_enmTraslatedKeyPressed = KEY_NUM_0;
			break;
		case 135:
			m_enmTraslatedKeyPressed = KEY_NUM_1;
			break;
		case 134:
			m_enmTraslatedKeyPressed = KEY_NUM_2;
			break;
		case 150:
			m_enmTraslatedKeyPressed = KEY_NUM_3;
			break;
		case 159:
			m_enmTraslatedKeyPressed = KEY_NUM_4;
			break;
		case 158:
			m_enmTraslatedKeyPressed = KEY_NUM_5;
			break;
		case 142:
			m_enmTraslatedKeyPressed = KEY_NUM_6;
			break;
		case 155:
			m_enmTraslatedKeyPressed = KEY_NUM_7;
			break;
		case 154:
			m_enmTraslatedKeyPressed = KEY_NUM_8;
			break;
		case 146:
			m_enmTraslatedKeyPressed = KEY_NUM_9;
			break;
		case 129:
			m_enmTraslatedKeyPressed = KEY_OK;
			break;
		case 130:
			m_enmTraslatedKeyPressed = KEY_CANCEL;
			break;
		case 157:
			m_enmTraslatedKeyPressed = KEY_FUNCTION;
			break;
		case 156:
			m_enmTraslatedKeyPressed = KEY_PARAM;
			break;
		case 132:
			m_enmTraslatedKeyPressed = KEY_SETUP;
			break;
		case 128:
			m_enmTraslatedKeyPressed = KEY_MENU;
			break;
		case 133:
			m_enmTraslatedKeyPressed = KEY_TEST;
			break;
		case 137:
			m_enmTraslatedKeyPressed = KEY_OFF;
			break;
		case 151:
			m_enmTraslatedKeyPressed = KEY_MODE_LONG;
			break;
		case 152:
			m_enmTraslatedKeyPressed = KEY_MODE_LAT;
			break;
		case 140:
			m_enmTraslatedKeyPressed = KEY_ARROW_UP;
			break;
		case 148:
			m_enmTraslatedKeyPressed = KEY_ARROW_DOWN;
			break;
		case 136:
			m_enmTraslatedKeyPressed = KEY_ARROW_LEFT;
			break;
		case 144:
			m_enmTraslatedKeyPressed = KEY_ARROW_RIGHT;
			break;
		case 141:
			m_enmTraslatedKeyPressed = KEY_CORRECTION_UP;
			break;
		case 153:
			m_enmTraslatedKeyPressed = KEY_CORRECTION_DOWN;
			break;
		case 145:
			m_enmTraslatedKeyPressed = KEY_CORRECTION_LEFT;
			break;
		case 149:
			m_enmTraslatedKeyPressed = KEY_CORRECTION_RIGHT;
			break;
		case 143:
			m_enmTraslatedKeyPressed = KEY_GATE_LEFT;
			break;
		case 139:
			m_enmTraslatedKeyPressed = KEY_GATE_RIGHT;
			break;
		case 147:
			m_enmTraslatedKeyPressed = KEY_ZOOM_IN;
			break;
		case 138:
			m_enmTraslatedKeyPressed = KEY_ZOOM_OUT;
			break;
		default:
			if (!_btst(m_enmKeyPressed[0],7))
			{
				m_enmTraslatedKeyPressed = KEY_RELEASED;
			}
			else
			{
				m_enmTraslatedKeyPressed = KEY_NULL;
			}
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
	sleepSec(0x01);
	
	m_enmTraslatedKeyPressed = KEY_NULL;
	m_enmKeyPressed[0] 		= KEY_NULL;
	m_enmKeyPressed[1] 		= KEY_NULL;
	m_enmKeyIRQReceived 	= false;
}


/*****************************************************************************/
void displayOff(void)
{
	if (parametersGetValue(PARAM_OFF))
	{
		//displayCmdToDisplay(mc_strLogo);
		m_arbyDisplayCommand[0] = DISPLAY_FUNCTION_SET_2;
		m_arbyDisplayCommand[1] = DISPLAY_POWER_ON;
		m_arbyDisplayCommand[2] = DISPLAY_EOF;		
		displayCmdToDisplay(m_arbyDisplayCommand);	
	}
	else
	{
		displayCmdToDisplay(mc_strRecClear);
		m_arbyDisplayCommand[0] = DISPLAY_FUNCTION_SET_2;
		m_arbyDisplayCommand[1] = DISPLAY_POWER_OFF;
		m_arbyDisplayCommand[2] = DISPLAY_EOF;		
		displayCmdToDisplay(m_arbyDisplayCommand);	
	}

	parametersSet(PARAM_OFF, !parametersGetValue(PARAM_OFF));
}

/*****************************************************************************/
void displayReset(void)
{
	displayCmdToDisplay(mc_strReset);
	sleep(1000);
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
				#ifdef CPU_8Mhz
					sleep(1); //Requested only if 8MHz
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
void displayDrawCorrection(BYTE a_byX, BYTE a_byY, BYTE a_byWidth, BYTE a_byDirection)
{
	BYTE i = 0x00;

	if _btst(a_byDirection, 1) //plus
	{
		i = 0x00;
		//Set Cursor Position
		if (a_byX != DISPLAY_NULL)
		{
			m_arbyDisplayCommand[i++] = DISPLAY_CURSOR_POSITION;
			m_arbyDisplayCommand[i++] = a_byX + 2;
			m_arbyDisplayCommand[i++] = a_byY +7 ;
			m_arbyDisplayCommand[i++] = DISPLAY_WAIT;
		}
	
		m_arbyDisplayCommand[i++] = DISPLAY_GRAPHIC_WRITE;
		m_arbyDisplayCommand[i++] = 8; //Length
		
		
		m_arbyDisplayCommand[i++] = 0x00;
		m_arbyDisplayCommand[i++] = 0x3C;
		m_arbyDisplayCommand[i++] = 0x42;
		m_arbyDisplayCommand[i++] = 0x02;
		m_arbyDisplayCommand[i++] = 0x72;
		m_arbyDisplayCommand[i++] = 0x62;
		m_arbyDisplayCommand[i++] = 0x5C;
		m_arbyDisplayCommand[i++] = 0x00;		
		m_arbyDisplayCommand[i++] = DISPLAY_EOF;		
		displayCmdToDisplay(m_arbyDisplayCommand);
		
	}
	else
	{
		displayClearArea(a_byX + 2, a_byY +7, a_byX + 9, a_byY +14);
	}
	
	if _btst(a_byDirection, 0) //minus
	{
		i = 0x00;
		//Set Cursor Position
		if (a_byX != DISPLAY_NULL)
		{
			m_arbyDisplayCommand[i++] = DISPLAY_CURSOR_POSITION;
			m_arbyDisplayCommand[i++] = a_byX + a_byWidth - 10;
			m_arbyDisplayCommand[i++] = a_byY +7 ;
			m_arbyDisplayCommand[i++] = DISPLAY_WAIT;
		}

		m_arbyDisplayCommand[i++] = DISPLAY_GRAPHIC_WRITE;
		m_arbyDisplayCommand[i++] = 8; //Length


		m_arbyDisplayCommand[i++] = 0x00;
		m_arbyDisplayCommand[i++] = 0x3C;
		m_arbyDisplayCommand[i++] = 0x42;
		m_arbyDisplayCommand[i++] = 0x40;
		m_arbyDisplayCommand[i++] = 0x4E;
		m_arbyDisplayCommand[i++] = 0x46;
		m_arbyDisplayCommand[i++] = 0x3A;
		m_arbyDisplayCommand[i++] = 0x00;	

		m_arbyDisplayCommand[i++] = DISPLAY_EOF;		
		displayCmdToDisplay(m_arbyDisplayCommand);

	}
	else
	{
		displayClearArea(a_byX + a_byWidth - 10, a_byY +7, a_byX + a_byWidth - 3, a_byY +14);
	}
	
	if _btst(a_byDirection, 7) //Operator -  -Tension
	{
		displayWriteString("-T", DISPLAY_SELECT_FONT_MINI, a_byX+12, a_byY+13);
	}
	else
	{
		displayClearArea(a_byX + 12, a_byY +8, a_byX + 19, a_byY +13);
	}
	
	if _btst(a_byDirection, 6) //Gear - +Tension
	{
		displayWriteString("+T", DISPLAY_SELECT_FONT_MINI, a_byX+ a_byWidth - 20, a_byY+13);
	}
	else
	{
		displayClearArea(a_byX + a_byWidth - 20, a_byY +8, a_byX + a_byWidth - 13, a_byY +13);
	}		
}

/*****************************************************************************/
void displayDrawBox(BYTE a_byLeft, BYTE a_byTop, BYTE a_byWidth, BYTE a_byHeigth, BYTE * a_strLabel, BYTE * a_strLabel2, WORD a_woValue, BYTE a_byLength, BYTE a_byDecimal, BYTE a_byRefresh)
{
	BYTE byRight;
	BYTE byDecimal;
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
		formatNumber(a_woValue, a_byLength, 0, strString);
		strString[a_byLength] = 0x00;
		
		byDecimal = byRight - (a_byDecimal*6)-1;
		byRight = MIN(byRight, 125);
		displayWriteString(strString, DISPLAY_SELECT_FONT_5x7, byRight - (a_byLength * 6), a_byTop + a_byHeigth - 1);			
		if (a_byDecimal>0)
		{
			displaySetArea(byDecimal, a_byTop + a_byHeigth - 2, byDecimal, a_byTop + a_byHeigth );
		}
	}
	
}
