#include "LCD_44780.h"


//************************************************************
//                  Epulse  Implementation
//************************************************************
void Epulse (void) {
	
	LCD_E = 1;
	__delay_ms (1);	//Marcucci
	LCD_E = 0;
	__delay_ms (1);	//Marcucci
}


//************************************************************
//                  SendCommand  Implementation
//************************************************************
void SendCommand (unsigned char D3, unsigned char D2, unsigned char D1, unsigned char D0) {
	
	LCD_D0 = D0;
	LCD_D1 = D1;
	LCD_D2 = D2;
	LCD_D3 = D3;
	Epulse ();

}


//************************************************************
//                  Line2LCD  Implementation
//************************************************************
void Line2LCD(void) {
	
	SendCommand (1,1,0,0);	
	SendCommand (0,0,0,0); 		
}


//************************************************************
//                  HomeLCD  Implementation
//************************************************************
void HomeLCD(void) {
	
	SendCommand (0,0,0,0);	
	SendCommand (0,0,1,0); 		
}


//************************************************************
//                  ShiftLCD  Implementation
//************************************************************
void ShiftLCD(char shift, char number_of_shift) {
	
	char i;
	
	for (i=0; i < number_of_shift; i++) {	
		SendCommand (0,0,0,1);	
		SendCommand (1,shift,0,0); 	
	}	
}


//************************************************************
//                  ShiftCursorLCD  Implementation
//************************************************************
void ShiftCursorLCD(char shift, char number_of_shift){
	
	char i;
	
	for (i=0; i < number_of_shift; i++) {
		SendCommand (0,0,0,1);	
		SendCommand (0,shift,0,0);
	} 		
}

//************************************************************
//                  GotoLineLCD  Implementation
//************************************************************
void GotoLineLCD (char line) {

switch(line) {

	case 1: SendCommand(1,0,0,0);
			SendCommand(0,0,0,0);
			break;

	case 2: SendCommand(1,1,0,0);
			SendCommand(0,0,0,0);
			break;

	case 3: SendCommand(1,0,0,1);
			SendCommand(0,1,0,0);
			break;

	case 4: SendCommand(1,1,0,1);
			SendCommand(0,1,0,0);
	}
}

//************************************************************
//                  WriteCharLCD  Implementation
//************************************************************
void WriteCharLCD (unsigned char value) {	
	
	unsigned char D3,D2,D1,D0;
	
	LCD_RS = 1;
		
	// Splitting of the first nibble				
	D3 = (value & 0b10000000) >> 7;	
	D2 = (value & 0b01000000) >> 6;
	D1 = (value & 0b00100000) >> 5;
	D0 = (value & 0b00010000) >> 4;
		
	SendCommand (D3,D2,D1,D0);
		
	// Splitting of the second nibble
	D3 = (value & 0b00001000) >> 3;	
	D2 = (value & 0b00000100) >> 2;
	D1 = (value & 0b00000010) >> 1;
	D0 = (value & 0b00000001);
			
	SendCommand (D3,D2,D1,D0);
		
	LCD_RS = 0;
}

//************************************************************
//                  WriteStringLCD  Implementation
//************************************************************
void WriteStringLCD(const char *buffer) {

	 // Write data to LCD up to null
    while(*buffer) {

	    // Write character to LCD
	    WriteCharLCD(*buffer);  
	    // Increment buffer
	    buffer++;
            
   }
}

//************************************************************
//                  WriteVarLCD  Implementation
//************************************************************
void WriteVarLCD(unsigned char *buffer) {
	
	// Write data to LCD up to null
	while(*buffer){
		
		// Write character to LCD
		WriteCharLCD(*buffer); 
		// Increment buffer
		buffer++;               
	}
}


//************************************************************
//                  WriteIntLCD  Implementation
//************************************************************
void WriteIntLCD(int value, char number_of_digits){
	
	// The array size is 5 plus end of string \0
	unsigned char convertedInt [10];
	
	// Integer is converted to string
	formatNumber(value, number_of_digits, 0, convertedInt);
	
	convertedInt[number_of_digits] = '\0';

	WriteVarLCD (convertedInt);
	
}	


//************************************************************
//                  ClearLCD  Implementation
//************************************************************
void ClearLCD (void){
	
	SendCommand (0,0,0,0);	
	SendCommand (0,0,0,1);		
}

//************************************************************
//                  CursorLCD  Implementation
//************************************************************
void CursorLCD(char active,char blinking) {	
	
	SendCommand (0,0,0,0);	
	SendCommand (1,1,active,blinking);								
}

//************************************************************
//                  CursorLCD  Implementation
//************************************************************
void BacklightLCD(char active) {

	LCD_LED = active;	
}

//************************************************************
//                  OpenLCD  Implementation
//************************************************************
void  OpenLCD() {	
	
	LCD_RS = 0x00;
	LCD_E = 0x00;
	LCD_RW = 0x00;

	
	__delay_ms (100);	//Marcucci
	SendCommand (0,0,1,1);
	__delay_ms (5);		//Marcucci
	SendCommand (0,0,1,1);
	__delay_ms (5);		//Marcucci
	SendCommand (0,0,1,1);
	__delay_ms (5);		//Marcucci
	SendCommand (0,0,1,0);
	SendCommand (0,0,1,0);
	SendCommand (1,0,0,0);
	SendCommand (0,0,0,0);
	SendCommand (1,1,1,0);


	CursorLCD (0,0);
	ClearLCD ();	
}



/*****************************************************************************/
void formatNumber(WORD a_woValue, BYTE a_byNumDigit, BYTE a_byNumDecimal, BYTE * a_byString)
{
	BYTE byValue    		= 0x00;
	
	if (a_byNumDecimal == 0x00)
	{
		a_byNumDecimal = 0xFF;
	}
	
	if (a_woValue==0x0000)
	{
		a_byNumDigit--;
		a_byString[a_byNumDigit] = '0';
		while(a_byNumDigit--!=0)
		{
			a_byString[a_byNumDigit] = ' ';
		}
	}
	else
	{
		while(a_byNumDigit-->0)
		{
			if(a_byNumDecimal == 0x00)
			{
				a_byString[a_byNumDigit] = '.'; //0x2E; // .
			}
			else
			{
				if (a_woValue>0x00) 
				{
					byValue = a_woValue % 10;
					a_woValue = (a_woValue-(WORD)byValue)/(BYTE)10;
					a_byString[a_byNumDigit] = (byValue+'0');
				}
				else // (a_woValue==0x00) 
				{
					if(a_byNumDecimal<=a_byNumDigit)
					{
						a_byString[a_byNumDigit] = '0';
					}
					else
					{
						a_byString[a_byNumDigit] = ' ';
					}
				}
			}
			a_byNumDecimal--;	
		}
	}
}
