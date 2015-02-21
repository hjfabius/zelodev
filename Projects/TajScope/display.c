#include "display.h"
#include "display_navigation.h"


/*****************************************************************************/
// Variables declaration
/*****************************************************************************/
static volatile BYTE 		m_enmKeyPressed 	= KEY_NULL;
@near 			BYTE 		m_arbyDisplayCommand[DISPLAY_CMD_BUFFER];
//static			BYTE *		m_arbyItems	 = 0x00;
//static			BYTE		m_byCurrentScreen = 0x00;
//static			BYTE		m_byNextScreen = 0x00;
//static			WORD		m_woTempValue = 0x0000;
static			BYTE		m_byDisplayOff		= false;
static			BYTE		m_byPrecKey;
/*****************************************************************************/
// Private declaration
/*****************************************************************************/
void displayCmdToDisplay(STRING strMessage);
void displayClearCommandBuffer(void);




/*****************************************************************************/
@interrupt 
void displayKeyboardIRQ(void)
{
	DisableInterrupts();
	
	m_enmKeyPressed = KEY_ANY_KEYS;
	
	EnableInterrupts();
	
	//ReturnFromInterrupt();
}

/*****************************************************************************/
void displayInit(void)
{
	m_byDisplayOff		= false;
	m_byPrecKey			= KEY_NULL;
	
	sleep(1000);
	displayCmdToDisplay(mc_strReset);
	sleep(1000);
	
	displayCmdToDisplay(mc_strLogo);
	sleepSec(0x01);
}


/*****************************************************************************/
void displayOff(void)
{
	if (m_byDisplayOff)
	{
		m_byDisplayOff = false;
		m_arbyDisplayCommand[0] = DISPLAY_FUNCTION_SET_2;
		m_arbyDisplayCommand[1] = DISPLAY_POWER_ON;
		m_arbyDisplayCommand[2] = DISPLAY_WAIT;		
		m_arbyDisplayCommand[3] = DISPLAY_EOF;		
		displayCmdToDisplay(m_arbyDisplayCommand);	
		//sleep(1000);
		//displayCmdToDisplay(mc_strReset);
		//sleep(1000);
		
		displayCmdToDisplay(mc_strLogo);
		sleepSec(0x01);
		m_enmKeyPressed = KEY_NULL;
	}	
	else
	{
		m_byDisplayOff = true;
		m_arbyDisplayCommand[0] = DISPLAY_FUNCTION_SET_2;
		m_arbyDisplayCommand[1] = DISPLAY_POWER_OFF;
		m_arbyDisplayCommand[2] = DISPLAY_WAIT;		
		m_arbyDisplayCommand[3] = DISPLAY_EOF;		
		displayCmdToDisplay(m_arbyDisplayCommand);	
	}
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
			if((a_strMessage[i]==DISPLAY_GRAPHIC_WRITE) && (byGraphics==0))
			{
				if (a_strMessage[i+1]<0x20)
				{
					//byGraphics = a_strMessage[i+1]+2;
				}
			}
			
			if((a_strMessage[i]!=DISPLAY_WAIT) || (byGraphics >0))
			{
				SPI_MoveByte(a_strMessage[i]);
				//sleep(0);
				//sleep(1); //Requested only if 8MHz
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
			sleep(15); //15->4Mhz  80->8MHz
			i++;
		}		
	}

	_bres(_Pa_Select_UA, _Pin_Select_UA);
	_bres(_Pa_Select_UB, _Pin_Select_UB);
	_bres(_Pa_Select_UC, _Pin_Select_UC);
	_bres(_Pa_Select_U2, _Pin_Select_U2);	
}

/*****************************************************************************/
BYTE displayKeyPressed()
{
	BYTE byKey1 = 0x00;
	BYTE byKey  = 0x00;
	BYTE strString[15];
	BYTE i;	
	
	
	//Select Display
	//_bres(_Pa_Select_Display, _Pin_Select_Display);
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
	
	//De-Select display
	_bres(_Pa_Select_UA, _Pin_Select_UA);
	_bres(_Pa_Select_UB, _Pin_Select_UB);
	_bres(_Pa_Select_UC, _Pin_Select_UC);
	_bres(_Pa_Select_U2, _Pin_Select_U2);	
	
	switch(byKey1)
	{
	
		case 0x12:
			byKey = KEY_ZOOM_IN;
			break;
		case 0x88:
			byKey = KEY_ZOOM_OUT;
			break;
		case 0x14:
			byKey = KEY_GATE_LEFT;
			break;
		case 0x18:
			byKey = KEY_GATE_RIGHT;
			break;
		case 0x24:
			byKey = KEY_OFF;
			break;
		case 0x48:
			byKey = KEY_PAUSE;
			break;
		case 0x28:
			byKey = KEY_CENTER;
			break;
		case 0x42:
			byKey = KEY_F1;
			break;
		case 0x22:
			byKey = KEY_F2;
			break;
		case 0x44:
			byKey = KEY_F3;
			break;
		default:
			byKey = KEY_NULL;
			break;
	}	
	
	//m_byPrecKey = byKey;
	
	return byKey;
	
}



/*****************************************************************************/
BYTE displayIsKeyPress(void)
{
	//return (m_enmKeyPressed == KEY_ANY_KEYS);
	if (m_enmKeyPressed == KEY_ANY_KEYS)
	{
		
		if (displayKeyPressed() == KEY_RELEASED)
		{
			m_enmKeyPressed = KEY_NULL;
		}
	}
	return (m_enmKeyPressed == KEY_ANY_KEYS);
}


/*****************************************************************************/
BYTE isDisplayKeyPressed(void)
{
	if (m_enmKeyPressed == KEY_ANY_KEYS)
	{
		m_enmKeyPressed = KEY_NULL;
		
		return displayKeyPressed();
	}
	return KEY_NULL;
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
void displayDrawCorrection(BYTE a_byX, BYTE a_byY, BYTE a_byWidth, BYTE a_byDirection, BYTE a_bySize)
{
	BYTE i = 0x00;
		
	if (a_bySize == 0x00) //Little
	{
		if (a_byDirection == 0x02)
		{
			displaySetArea(a_byX + 2, a_byY, a_byX + 3, a_byY + 2);
		}
		else if (a_byDirection == 0x01)
		{
			displaySetArea(a_byX + a_byWidth - 4, a_byY, a_byX + a_byWidth - 3, a_byY + 2);
		}
	}
	else
	{
		if (a_byDirection == 0x02) //Minus
		{
			displayClearArea(a_byX + a_byWidth - 10, a_byY +7, a_byX + a_byWidth - 3, a_byY +14);
			
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
		}
		else if(a_byDirection == 0x01) //Plus
		{
			displayClearArea(a_byX + 2, a_byY +7, a_byX + 9, a_byY +14);
			
			
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
		}	
		else
		{
			displayClearArea(a_byX + 2, a_byY +7, a_byX + 9, a_byY +14);
			displayClearArea(a_byX + a_byWidth - 10, a_byY +7, a_byX + a_byWidth - 3, a_byY +14);

		}
		
		m_arbyDisplayCommand[i++] = DISPLAY_WAIT;
		m_arbyDisplayCommand[i++] = DISPLAY_EOF;		
	
		if (i>2) //Direction is specified
		{
			displayCmdToDisplay(m_arbyDisplayCommand);
		}
	}
}

/*****************************************************************************/
void displayDrawBox(BYTE a_byLeft, BYTE a_byTop, BYTE a_byWidth, BYTE a_byHeigth, BYTE * a_strLabel, BYTE * a_strLabel2, WORD a_woValue, BYTE a_byLength, BYTE a_byRefresh)
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
		formatNumber(a_woValue, a_byLength, 0, strString);
		strString[a_byLength] = 0x00;
		
		displayWriteString(strString, DISPLAY_SELECT_FONT_5x7, byRight - (a_byLength * 6) - 1, a_byTop + a_byHeigth - 1);
	}
	
}
