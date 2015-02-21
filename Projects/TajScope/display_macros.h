#ifndef DISPLAY_MACROS_H
	#define DISPLAY_MACROS_H
	
	#define    DISPLAY_MACRO_01				0x01					/* Start user defined macro 1. */
	#define    DISPLAY_MACRO_02				0x02					/* Start user defined macro 2. */
	#define    DISPLAY_MACRO_03				0x03					/* Start user defined macro 3. */
	#define    DISPLAY_MACRO_04				0x04					/* Start user defined macro 4. */
	#define    DISPLAY_MACRO_05				0x05					/* Start user defined macro 5. */
	#define    DISPLAY_MACRO_06				0x06					/* Start user defined macro 6. */
	#define    DISPLAY_MACRO_07				0x07					/* Start user defined macro 7. */
	
	#define    DISPLAY_BACKSPACE			0x08					/* Non destructive backspace. */ 
																	/* Cursor is moved left by the width of the currently select font. */
																	/* If the cursor is at the left end of the display, */ 
																	/* no cursor movement is made. */
	#define    DISPLAY_HORIZONTAL_TAB		0x09					/* Cursor is moved right by the width of the currently select font. */
																	/* If the cursor is at the end of the display, */  
																	/* no cursor movement is made. */
	#define    DISPLAY_LINE_FEED			0x0A					/* Moves the cursor down by the height of the currently selected font. */
																	/* If the cursor is at the bottom of the display, */
																	/* no cursor movement is made. */
	#define    DISPLAY_HOME					0x0B					/* Moves the cursor horizontal position to 00H, */
																	/* the vertical positioning is dependent on the currently selected */
																	/* font, allowing for immediate character writing in the */ 
																	/* top-left corner of the display. */
	#define    DISPLAY_VERTICAL_TAB			0x0C					/* Moves the cursor up one character row. */
																	/* If the cursor is at the top of the top end of the display, */ 
																	/* no cursor movement is made. */
	#define    DISPLAY_CARRIAGE_RETURN		0x0D					/* Moves the cursor horizontal position to 00H. */ 
																	/* The vertical position is unchanged. */
	#define    DISPLAY_CLEAR_EOL			0x0E					/* Clear all characters from the current cursor position to */ 
																	/* the end of the display. */
	#define    DISPLAY_TEST					0x0F					/* Place module into self-test mode. */
																	/* The module will repetitively show a few test screens. */
																	/* The test mode will exist on the next received byte. */
	#define    DISPLAY_CURSOR_POSITION		0x10 /*+ xpos + ypos*/	/* Set the cursor position. */
	#define    DISPLAY_SET_AREA				0x11 /*+ xleft + ytop + xright + ybot*/	/* Fill specified area. */
																	/* All dots within the specified area are illuminated. */
																	/* Please note that the cursor position is */
																	/* affected with this command. */
	#define    DISPLAY_CLEAR_AREA			0x12 /*+ xleft + ytop + xright + ybot*/	/* Clear specified area. */ 
																	/* All dots within the specified area are cleared. */ 
																	/* Please note that the cursor position is */
																	/* affected with this command. */
	#define    DISPLAY_INVERT_AREA			0x13 /*+ xleft + ytop + xright + ybot*/	/* Invert specified area. */ 
																	/* All dots within the specified area are inverted. */
																	/* Please note that the cursor position is */
																	/* affected with this command. */
	#define    DISPLAY_SET_OUTLINE			0x14 /*+ xleft + ytop + xright + ybot*/	/* Draw box outline. */
																	/* All dots within the specified outline are unchanged. */ 
																	/* Please note that the cursor position is */
																	/* affected with this command. */
	#define    DISPLAY_CLEAR_OUTLINE		0x15 + xleft + ytop + xright + ybot	/* Clear box outline. */ 
																	/* All dots within the specified outline are unchanged. */
																	/* Please note that the cursor position is */
																	/* affected with this command. */
	#define    DISPLAY_SET_PIXEL			0x16					/* Illuminate a single pixel at the current cursor position. */
	#define    DISPLAY_CLEAR_PIXEL			0x17					/* Clear a single pixel at the current cursor position. */
	#define    DISPLAY_GRAPHIC_WRITE		0x18 					/* 0x18 + len + data Write graphical data, length len, direct to display. */
																	/* See write mode command (1AH) for graphic orientation */
																	/* and cursor movements. */
	#define    DISPLAY_RESET				0x19					/* Resets display to power-on defaults: */
																	/*   Display is cleared.  */
																	/*   5x7 font selected. */
																	/*   Write Mode = 00H */
																	/*   Brightness Level = 7.  */
																	/*   VFD Power = On. */
	#define    DISPLAY_WRITE_MODE			0x1A /*+ data*/				/* Bit 7 = graphic data orientation */
																	/*     0 = horizontal  */
																	/*     1 = vertical (default = horizontal) */
																	/* Bit 6 = cursor movement  */
																	/*     0 = horizontal */
																	/*     1 = vertical (default = horizontal) */
																	/* Bit 5 = cursor direction */
																	/*     0 = forward */
																	/*     1 = backwards (default = forwards) */
																	/* Bit 4 = underscore cursor */
																	/*     0 = off */
																	/*     1 = on (default = off) */
																	/* Bit 3 = underscore cursor */
																	/*     0 = static */
																	/*     1 = flash (default = static) */
																	/* Bit 1/0 = pen type */
																	/*     00 = overwrite */
																	/*     01 = AND */
																	/*     02 = OR */
																	/*     03 = XOR (default = overwrite) */
	#define    DISPLAY_FUNCTION_SET_2		0x1B					/* Starting Message for Function Set 2 */
	#define    DISPLAY_SET_MACRO			0x1B + macro + len + data	/* Send macro data to EEPROM. macro = 00H - 07H.  */
																	/* Macro0 is executed at power-up only. A maximum of 480 */
																	/* bytes is allowed for macro data.  */
																	/* The display may flicker whilst writing macro data. */
	#define    DISPLAY_BRIGHTNESS			0x1B + level			/* Set the display brightness. level = F8H - FFH.  */
																	/*     F8H = display off  */
																	/*     F9H = minimum  */
																	/*     FFH = maximum (default). */
	#define    DISPLAY_ERASE_MACROS			0x1B + 0x4D				/* Clear all downloaded macros in EEPROM.  */
																	/* Screen may blank momentarily while macro data is being erased. */
	#define    DISPLAY_LOCK/UNLOCK_EEPROM	0x1B + 0x4C / 0x55		/* All data contained within the non-volatile EEPROM is locked (4CH),  */
																	/* and no changes are possible until the */
																	/* unlock command (55H) is executed. */
	#define    DISPLAY_CHECKSUM				0x1B + 0x43				/* All data received is added to the checksum. This command will read the lower 8-bits of that checksum, */
																	/* before being cleared. Please note that the checksum is cleared when executing the test mode. */
	#define    DISPLAY_POWER_ON				0x50					/* 0x1B + 0x50 Turn on VFD power supply (default). */
	#define    DISPLAY_POWER_OFF			0x46					/* 0x1B + 0x46 Turn off VFD power supply, display’s contents will be preserved. */
	#define    DISPLAY_HEX_MODE_ON			0x48					/* 0x1B + 0x48 Enable hex receive mode, character 60H is interpreted as a hexadecimal prefix. */
	#define    DISPLAY_HEX_MODE_OFF			0x42					/* 0x1B + 0x42 42H = Disable hex receive mode. Hex mode is enabled at power up. */
	#define    DISPLAY_SET_COMMS			0x1B + 0x49 + data		/* Set asynchronous communication baud rate and parity.  */
																	/* Takes effect at power-up or hardware reset. */
																	/*     Bit 7 = Automatic I/O send (0=off, 1=on).  */
																	/*     Bits 1&0 = baud rate (00=4800, 01=9600, 02=19200, 03=38400). */
																	/*     Bit 2 = Parity (1=even, 0=none) (factory default = 19200 with no parity, automatic I/O send is off) */
	#define    DISPLAY_ENABLE_IO_PORT		0x44					/* 0x1B + 0x44 + data*/
																	/* Set I/O port direction. A ‘1’ indicates an input, a ‘0’ an output. All output lines are immediately set low. All */
																	/* input lines have their pull-ups enabled. */ 
																	/* This value is store in EEPROM and will automatically be set at power up.*/
	#define    DISPLAY_SET_PORT_LINES		0x4F 					/* Set Output lines on I/O port, a ‘1’ will set 5V on the output ports, */ 
																	/* or enable the pull-ups on the inputs. */
	#define    DISPLAY_READ_PORT			0x52					/* 0x1B + 0x52 Read current I/O port status. */ 
																	/* A single byte is transmitted showing the current state of the I/O lines. */
	#define    DISPLAY_ENABLE_KEY_SCANNING	0x4B					/* 0x1B + 0x4B Set I/O port to key scanning. */ 
																	/* The I/O ports are continuously scanned for any key press. */
																	/* This mode is stored */
																	/* in EEPROM and will automatically be selected at power up. */
	#define    DISPLAY_SELECT_FONT_MINI		0x1C					/* Select font. proportional mini font.  */
	#define    DISPLAY_SELECT_FONT_5x7		0x1D					/* Select font. fixed spaced 5x7 font.   */
	#define    DISPLAY_SELECT_FONT_10x14	0x1E					/* Select font. fixed spaced 10x14 font. */
	#define    DISPLAY_GRAPHIC_AREA_WRITE	0x1F /*+ xl + yt + xr + yb + data*/	/* Write graphic data within defined area. */
																	/* See write mode command (1AH) for graphic orientation and cursor movements.*/
																	/* NOTE: This command is available on software version 3 only. */
	#define    DISPLAY_HEX_PREFIX			0x60 /*+ dhH + dlH*/		/* Write to the display module using a 2-byte hexadecimal number. */
																	/* dhH = high nibble, dlH = low nibble. */
																	/* E.g. Sending `19 will reset the display. */
	#define    DISPLAY_CHARACTER_WRITE		0x20 - 0x7F				/* Display character from selected font. */

	#define    DISPLAY_WAIT					0xFE
	#define    DISPLAY_EOF					0xFF
	#define	   DISPLAY_NULL					0xFF
	

#endif