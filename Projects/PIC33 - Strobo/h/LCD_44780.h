#ifndef __LCD_H__
	#define	__LCD_H__
	
	#include "common.h"
	#include <ctype.h>
	
	
	#ifndef FLAG_LCD_44780
	#define FLAG_LCD_44780
	
	// Prototipe for itoa from ctype lib 
	char *itoa (int value, char *s);
	
	//**************************************************
	// LCD constants
	// All the following pin must be set as output
	//**************************************************


	#define LCD_D0 	PIN_DISP_D4
	#define LCD_D1 	PIN_DISP_D5
	#define LCD_D2 	PIN_DISP_D6	
	#define LCD_D3 	PIN_DISP_D7	
	#define LCD_RS 	PIN_DISP_RS
	#define LCD_E 	PIN_DISP_E	
	#define LCD_RW 	PIN_DISP_RW	
	#define LCD_LED PIN_DISP_BACK	
	
	
	//**************************************************
	//               Constant Definitions
	
	#define LEFT 0
	#define RIGHT 1
	
	#define TURN_ON 1
	#define TURN_OFF 0
	
	#define BLINK_ON 1
	#define BLINK_OFF 0
	
	//**************************************************
	
	
	
	/***************************************************
	*
	* Description: This function generated the Enable
	*              pulse  
	*
	* Parameters:
	*
	* void
	* 
	* Return: 
	*
	* void
	*
	***************************************************/
	void Epulse (void);
	
	
	/***************************************************
	*
	* Description: This function send a 4 bit command out 
	* 					 
	*
	* Parameters:
	*
	* bit_0: bit 0 of the data bus (4 bit modality)
	* bit_1: bit 1 of the data bus (4 bit modality)
	* bit_2: bit 2 of the data bus (4 bit modality)
	* bit_3: bit 3 of the data bus (4 bit modality)
	* 
	* Return:
	*
	* void
	*
	***************************************************/
	void SendCommand (unsigned char bit_3, unsigned char bit_2, unsigned char bit_1, unsigned char bit_0);
	
	
	/***************************************************
	*
	* Description: Locate the cursor to the beginning 
	*              of Line 2.
	*
	* Parameters:
	*
	* void
	* 
	* Return:
	*
	* void
	*
	***************************************************/
	void Line2LCD(void);
	
	
	
	/***************************************************
	*
	* Description: Locate the cursor at home location. 
	*              First line first character
	*
	* Parameters:
	*
	* void
	* 
	* Return:
	*
	* void
	*
	***************************************************/
	void HomeLCD(void);
	
	
	/***************************************************
	*
	* Description: This function shift the LCD screen on 
	*              the left or rigt.
	*
	* Parameters:
	*
	* shift: 0 shift on the left
	*        1 shift on the right
	*
	* number_of_shift: Specify the number of time the 
	*                  shift is executed
	* 
	* Return:
	*
	* void
	*
	* Note:
	* You can use the LEFT RIGHT constant
	*
	***************************************************/
	void ShiftLCD(char shift, char number_of_shift);
	
	
	/***************************************************
	*
	* Description: This function shift the LCD cursor on  
	*              the left or rigt.
	*
	* shift: 0 shift on the left
	*        1 shift on the right
	*
	* number_of_shift: Specify the number of time the 
	*                  shift is executed
	* Return:
	*
	* void
	*
	* Note:
	* You can use the LEFT RIGHT constant
	*
	***************************************************/
	void ShiftCursorLCD(char shift, char number_of_shift);
	
	
	/***************************************************
	*
	* Description: This function locate the LCD cursor on  
	*              the selected line. 
	*              Tested on 20x4 16x2 LCD displays.
	*
	* line: number of the line (1,2,3,4)
	*       
	*
	* Return:
	*
	* void
	*
	* Note:
	* It might not work with all the LCD Diplay
	*
	***************************************************/
	void GotoLineLCD (char line);
	
	/***************************************************
	*
	* Description: This function writes a char to the 
	*              LCD display.
	*
	*
	* Parameters:
	*
	* value: character to be sent
	* 
	* Return:
	*
	* void
	*
	***************************************************/
	void WriteCharLCD (unsigned char value);
	
	
	/***************************************************
	*
	* Description: This function write a const string  
	*              to the LCD display.
	*
	* Parameters:
	*
	* buffer : Is a const string like that "Hello" 
	* 
	* Return:
	*
	* void
	*
	***************************************************/
	void WriteStringLCD(const char *buffer);
	
	
	
	/***************************************************
	*
	* Description: This function write an array of char  
	*              to the LCD display.
	*
	* Parameters:
	*
	* buffer : It is an array of char 
	* 
	* Return:
	*
	* void
	*
	***************************************************/
	void WriteVarLCD(unsigned char *buffer);
	
	
	/***************************************************
	*
	* Description: This function write an array of char  
	*              to the LCD display.
	*
	* Parameters:
	*
	* value : It is integer that must be written to the 
	*         LCD diplay.
	*
	* numeber_of_digits: It specifies the number of shown 
	*                    digit [0-5].
	*                    0: Left Justified
	*                    1-5: Right Justified with n digit 
	* 
	* Return:
	*
	* void
	*
	* Note:
	* If you set a number of digit less than required
	* the digit will be lost starting from the less
	* significant digit. Minus is like a digit.
	*
	***************************************************/
	void WriteIntLCD(int value, char number_of_digits);
	
	
	/***************************************************
	*
	* Description: This Function clean the LCD display
	*             
	*
	* Parameters:
	*
	* void
	* 
	* Return:
	*
	* void
	*
	***************************************************/
	
	void ClearLCD (void);
	
	
	
	/***************************************************
	*
	* Description: This function controls the cursor
	*              option (blinking, active)
	*
	* Parameters:
	*
	* active: activate the cursor, showing it
	*         1 : cursor is ON
	*         0 : cursor is OFF
	*
	* blinking: let the cursor blink
	*           1 : Blinking is ON
	*           0 : Blinking is OFF   
	* 
	* Return:
	*
	* void
	*
	* Note:
	* You can use the constant TURN_ON, TURN_OFF
	* BLINK_ON, BLINK_OFF
	*
	***************************************************/
	void CursorLCD(char active,char blinking);
	
	
	/***************************************************
	*
	* Description: This function controls the back ligth
	*              LED 
	*
	* Parameters:
	*
	* active: activate the cursor, showing it
	*         1 : LED is ON
	*         0 : LED is OFF
	* 
	* Return:
	*
	* void
	*
	* Note:
	* You can use the constant TURN_ON, TURN_OFF
	*
	***************************************************/
	void BacklightLCD(char active);
	
	
	/***************************************************
	*
	* Description: This funnction initializes the LCD  
	*              to work in 4 bit modality.
	*
	* Parameters:
	*
	* quartz_frequency: Quartz freq. expressed in MHz
	*                   used to run the PIC.
	* 
	* Return:
	*
	* void
	*
	* Note:
	* You must properly set the microcontroller pins
	* using the TRISx registers
	*
	***************************************************/
	void  OpenLCD();
	
	

	void formatNumber(WORD a_woValue, BYTE a_byNumDigit, BYTE a_byNumDecimal, BYTE * a_byString);


	#endif
#endif
